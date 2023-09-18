#!/bin/bash
sudo pacman -S npm lightdm-webkit2-greeter -v --noconfirm
sudo pacman -S feh p7zip curl  nano git lsd firefox  wpa_supplicant thunar -v --noconfirm 
sudo pacman -S qtile kitty rofi picom wget neofetch -v --noconfirm
sudo pacman -S make cmake code  -v --noconfirm
sudo pacman -S xorg xorg-server xorg-xinit -v --noconfirm
mkdir Desktop
cd Desktop
mkdir repos
cd repos
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
cd  ..
mkdir blackarch
cd blackarch
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh 
sudo ./strap.sh
sudo pacman -Syu -v
paru -S todo-bin acpi acpid wireless_tools jq inotify-tools polkit-gnome xdotool xclip maim alsa-utils alsa-tools --noconfirm 
paru -S pulseaudio lm_sensors mpd mpc mpdris2 ncmpcpp playerctl --needed
#fuentes
paru -S web-greeter ttf-iosevka ttf-icomoon-feather ttf-font-awesome ttf-font-awesome-4 ttf-material-design-icons-desktop-git scrub --noconfirm
sudo pacman -S ttf-jetbrains-mono ttf-jetbrains-mono-nerd -v --noconfirm
cd
mkdir rep
cd rep
git clone https://github.com/vnmsnake-dev/config-files
cd config-files
sudo rm -rf /etc/lightdm/web-greeter.yml
sudo rm -rf /etc/lightdm/lightdm.conf
sudo cp -rf lightdm-config/lightdm.conf /etc/lightdm/
sudo cp -rf lightdm-config/web-greeter.yml /etc/lightdm/
sudo cp -rf lightdm-conf/backgrounds/* /usr/share/backgrounds/ 
cd
rm -rf .config
mkdir .config
cd .config 
cp -rf /home/vnmsnake/rep/config-files/* .
rm -rf /home/vnmsnake/rep
mkdir /home/vnmsnake/repos/
cd /home/vnmsnake/repos/
git clone https://github.com/hertg/lightdm-neon.git
cd lightdm-neon
make build
sudo make install 
wget https://raw.githubusercontent.com/vnmsnake-dev/config-files/main/wall.jpg
sudo systemctl enable gdm.service
sudo reboot

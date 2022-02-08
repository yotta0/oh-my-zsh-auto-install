#!/bin/bash
# Script to install zsh and oh-my-zsh

echo '----> Installing ZSH and Dependecies'
sudo apt install zsh curl git -y && chsh -s $(which zsh) 
echo '----> Finished ZSH Install'

echo '----> Installing Oh my zsh framework'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo '----> Installing extensions'
if [[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]
then
  echo syntax highlighting folder already exists
else 
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [[ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]
then
	echo extensions folder already exists
else
	git clone https://github.com/zsh-users/zsh-autosuggestions \
	${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  sed -i -e '73d' ~/.zshrc ;
  sed -i '73i\plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' ~/.zshrc
fi

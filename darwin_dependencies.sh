#!/usr/bin/env bash

echo "Checking Homebrew"
if ! command -v brew >/dev/null 2>&1; then
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing rmtree..."
brew tap beeftornado/rmtree

echo "Installing zsh tool..."
brew install \
    zsh-completions \
    zsh-autosuggestions \
    zsh-syntax-highlighting \

echo "Installing openjdk11..."
brew tap AdoptOpenJDK/openjdk
brew install --cask adoptopenjdk11

echo "Installing Android SDK..."
curl https://dl.google.com/android/repository/commandlinetools-mac-8512546_latest.zip -o ${HOME}/cmdlinetools.zip --progress
unzip ${HOME}/cmdlinetools.zip
${HOME}/cmdline-tools/bin/sdkmanager --sdk_root=${HOME}/sdk --install "cmdline-tools;latest"
${HOME}/cmdline-tools/bin/sdkmanager --sdk_root=${HOME}/sdk --install "platform-tools"
${HOME}/cmdline-tools/bin/sdkmanager --sdk_root=${HOME}/sdk --install "emulator"
rm -rf ${HOME}/cmdlinetools.zip ${HOME}/cmdline-tools

echo "Installing fvm tool..."
brew tap leoafarias/fvm
brew install fvm

echo "Installing nvm tool..."

echo "Installing other tools..."
brew install \
    gnu-sed \
    findutils \
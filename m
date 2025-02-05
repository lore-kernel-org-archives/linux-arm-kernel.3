Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AC8C0219A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 17:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uJP08c1syErdLpLuzNMXT58izEIVTQHRy0abr6LqiVk=; b=4ktlgGG+2JCvs2
	UqqCDOyT4vlE2L7M6X+BjH1KxWp2jous+MW7LoO3v4L5B9PQh/KW9d1AxwTYEvSJzdDiwNF411G+C
	7n4Ekekyjz1VJQ+H5JlF4kvuHG1BNTL0aXyjCAUa4rgP6C9VwyP4wbvzwbBsT4rtpvLDsyjG3BvWG
	xQzcg/r26mDLIxKzzQ2ILiOhI7LwjB7G6V1NK3Y5+3oRsm8jUD1jwt1UFjgy18leHB2L/9vgrsLvt
	ERpWc9igXfaz5V1OIdsoLW15fj3hARAnnw6/PqoKN11xx7S6q6gsdyoMAeu5R9QyrfrcbExYkl61e
	GFDtUgrAu2CToJ9R/bgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjVB-0000000491t-057y;
	Wed, 05 Feb 2025 17:47:53 +0000
Received: from mail-lf1-f43.google.com ([209.85.167.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfiHo-00000003z7e-2o2j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 16:30:02 +0000
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53f22fd6832so7632855e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 08:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738772998; x=1739377798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJP08c1syErdLpLuzNMXT58izEIVTQHRy0abr6LqiVk=;
        b=AHmykuf9wHftflD/94ixkOnDWF5fukNIQJ8TJL5L5MXhjpcWhfdfCXh/+6cl9I8t4x
         aghzfV2lNtO0wWjvxXGwRi4/QECs3mpcVaLod0yFryg2dQsvMxT5TwkgJeb3LTxYocRw
         7KCwbWrLv5ur/BQzodSW+KB8qsVORgm2QepRsOUhIrHOEASwLjNv0EERsYNCNvEcITs0
         1mfbjZgYFlJjQKMBrL0JZqSx5S/nznBq5q1qq0PRoEJk/ZhvebgUSosn9+fi1c5jWK3f
         ClxRauP0hnC33+CZC3Rn266phcJey7j+A3XAfHypHJTRPOpYJPp9eHMXYboLMQzn+rW8
         rBdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUrYkctKF4FQpDqV9DrzJKLCuoAUJ6PwIR/UCJTfmaK6YZ4fy2GNlqSBQNhSyso1I2CJNL3gBWVLa4i0d3i1Fk@lists.infradead.org
X-Gm-Message-State: AOJu0YyWGKRFg1lhsmkx4InCaj7Aiq1U0Jo1uKQ9Q7gvMLR0Dk2Jct37
	oh6DLdagCtg4NRvFZO+fOPKHpZIxfsy1YFw7TD62pT3YELmuFjvjUY1rkk8f
X-Gm-Gg: ASbGncum26+uUbpqrzj/4cBq8IZbpB24+zsiAP35FJqKkV912QPPPtzwK2OiIC9kjsB
	3oaS7hcZCRiGt2A5706YYyJm6K3RLaaqBbnHQhnDg2LTqi8LZ2VMlEOfGgcomCqIbNua90w5a8a
	75pyJpBVuGx3ULR52zKKOVTTRbxX2jJmliWHn54X6x9dbcS2C+6xgAVd1lXWOdqb0hOeJIk830S
	XquEaAGRT0P5Df6Q4ml+egXhpxA1Yq9tdOMcZ8cPpVauDJRmeKdrDfYdV2VhkKQ9rTeSVMlFrUE
	pfGvW6/yjwWcqgGtx+EPW6vvGioI7Gsu2RJUxh7boGXjpPan
X-Google-Smtp-Source: AGHT+IFDIGShkFo3ydACw5nKNbfKL257b5MNjC5ITqgBaeNBBn0v587Mtof4lhlHKoCyhTMi8aKCKA==
X-Received: by 2002:a05:6512:3f1f:b0:542:672f:a3c6 with SMTP id 2adb3069b0e04-54405a42452mr1017530e87.36.1738772997521;
        Wed, 05 Feb 2025 08:29:57 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb7bf2sm1895827e87.174.2025.02.05.08.29.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 08:29:57 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3061f1e534bso70349331fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 08:29:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkR7Po93JdW5Qf5jB8rDqtMTqqSbkO9wIWdwTT+Kn1ph8fLsPndJKaJhbHhAhFD/kO/tm3yzlGW3GOtOqmF7FK@lists.infradead.org
X-Received: by 2002:a2e:bea6:0:b0:302:25ef:813e with SMTP id
 38308e7fff4ca-307cf38ebf7mr12010981fa.32.1738772997061; Wed, 05 Feb 2025
 08:29:57 -0800 (PST)
MIME-Version: 1.0
References: <20250128200355.1948997-1-lukas.schmid@netcube.li> <20250128200355.1948997-5-lukas.schmid@netcube.li>
In-Reply-To: <20250128200355.1948997-5-lukas.schmid@netcube.li>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 6 Feb 2025 00:29:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v6559Bw7ZMWoNfhTHFUYQHPjgmrTMFsF_+vi0BE617pGHw@mail.gmail.com>
X-Gm-Features: AWEUYZk6f9wurvaVXnEbxyhBjVM_hcqXeYFv8MCBUGs98p48pzlnXVUfKxLlxEY
Message-ID: <CAGb2v6559Bw7ZMWoNfhTHFUYQHPjgmrTMFsF_+vi0BE617pGHw@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] ARM: dts: sunxi: add support for NetCube Systems Kumquat
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_083000_713291_49340A46 
X-CRM114-Status: GOOD (  23.78  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, Jan 29, 2025 at 4:05=E2=80=AFAM Lukas Schmid <lukas.schmid@netcube.=
li> wrote:
>
> NetCube Systems Kumquat is a board based on the Allwinner V3s SoC,
> including:
>
> - 64MB DDR2 included in SoC
> - 10/100 Mbps Ethernet
> - USB-C DRD
> - Audio Codec
> - Isolated CAN-FD
> - ESP32 over SDIO
> - 8MB SPI-NOR Flash for bootloader
> - I2C EEPROM for MAC addresses
> - SDIO Connector for eMMC or SD-Card
> - 8x 12/24V IOs, 4x normally open relays
> - DS3232 RTC with Battery Backup
> - QWIIC connectors for external I2C devices
>
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  arch/arm/boot/dts/allwinner/Makefile          |   2 +
>  .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 278 ++++++++++++++++++
>  2 files changed, 280 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat=
.dts
>
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/all=
winner/Makefile
> index 48666f73e638..d799ad153b37 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -199,6 +199,7 @@ DTC_FLAGS_sun8i-h3-nanopi-r1 :=3D -@
>  DTC_FLAGS_sun8i-h3-orangepi-pc :=3D -@
>  DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 :=3D -@
>  DTC_FLAGS_sun8i-h3-orangepi-pc-plus :=3D -@
> +DTC_FLAGS_sun8i-v3s-netcube-kumquat :=3D -@
>  dtb-$(CONFIG_MACH_SUN8I) +=3D \
>         sun8i-a23-evb.dtb \
>         sun8i-a23-gt90h-v4.dtb \
> @@ -261,6 +262,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>         sun8i-v3s-anbernic-rg-nano.dtb \
>         sun8i-v3s-licheepi-zero.dtb \
>         sun8i-v3s-licheepi-zero-dock.dtb \
> +       sun8i-v3s-netcube-kumquat.dtb \
>         sun8i-v40-bananapi-m2-berry.dtb
>  dtb-$(CONFIG_MACH_SUN9I) +=3D \
>         sun9i-a80-optimus.dtb \
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts b/=
arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> new file mode 100644
> index 000000000000..e4e98ddfbd96
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> @@ -0,0 +1,278 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2025 Lukas Schmid <lukas.schmid@netcube.li>
> + */
> +
> +/dts-v1/;
> +#include "sun8i-v3s.dtsi"
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/{
> +       model =3D "NetCube Systems Kumquat";
> +       compatible =3D "netcube,kumquat", "allwinner,sun8i-v3s";
> +
> +       aliases {
> +               serial0 =3D &uart0;
> +               ethernet0 =3D &emac;
> +               rtc0 =3D &ds3232;
> +               rtc1 =3D &rtc; /* not battery backed */
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial0:115200n8";
> +       };
> +
> +       /* 40 MHz Crystal Oscillator on PCB */
> +       clk_can0: clock-can0 {
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               clock-frequency  =3D <40000000>;
> +       };
> +
> +       gpio-keys {
> +               compatible =3D "gpio-keys";
> +               autorepeat;
> +
> +               key-user {
> +                       label =3D "GPIO Key User";
> +                       linux,code =3D <KEY_PROG1>;
> +                       gpios =3D <&pio 1 2 (GPIO_ACTIVE_LOW | GPIO_PULL_=
UP)>; /* PB2 */
> +               };
> +       };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               led-heartbeat {
> +                       gpios =3D <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
> +                       linux,default-trigger =3D "heartbeat";
> +                       color =3D <LED_COLOR_ID_GREEN>;
> +                       function =3D LED_FUNCTION_HEARTBEAT;
> +               };
> +
> +               led-mmc0-act {
> +                       gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
> +                       linux,default-trigger =3D "mmc0";
> +                       color =3D <LED_COLOR_ID_GREEN>;
> +                       function =3D LED_FUNCTION_DISK;
> +               };
> +       };
> +
> +       /* EA3036C Switching 3 Channel Regulator - Channel 2 */
> +       reg_vcc3v3: regulator-3v3 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc3v3";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               vin-supply =3D <&reg_vcc5v0>;
> +       };
> +
> +       /* K7805-1000R3 Switching Regulator supplied from main 12/24V ter=
minal block */
> +       reg_vcc5v0: regulator-5v0 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0";
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +       };
> +};
> +
> +&codec {
> +       allwinner,audio-routing =3D
> +               "Headphone", "HP",
> +               "Headphone", "HPCOM",
> +               "MIC1", "Mic",
> +               "Mic", "HBIAS";
> +       status =3D "okay";
> +};
> +
> +&ehci {
> +       status =3D "okay";
> +};
> +
> +&emac {
> +       allwinner,leds-active-low;
> +       nvmem-cells =3D <&eth0_macaddress>;
> +       nvmem-cell-names =3D "mac-address";
> +       status =3D "okay";
> +};
> +
> +&i2c0 {
> +       status =3D "okay";
> +
> +       ds3232: rtc@68 {

Nodes on an addressed bus should be ordered by their address, not
the name of the label.

> +               compatible =3D "dallas,ds3232";
> +               reg =3D <0x68>;
> +       };
> +
> +       eeprom0: eeprom@50 {
> +               compatible =3D "atmel,24c02";             /* actually it'=
s a 24AA02E48 */
> +               reg =3D <0x50>;
> +               pagesize =3D <16>;
> +               read-only;
> +               vcc-supply =3D <&reg_vcc3v3>;
> +
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +
> +               eth0_macaddress: macaddress@fa {
> +                       reg =3D <0xfa 0x06>;
> +               };
> +       };
> +
> +       tusb320: typec@60 {
> +               compatible =3D "ti,tusb320";
> +               reg =3D <0x60>;
> +               interrupt-parent =3D <&pio>;
> +               interrupts =3D <1 5 IRQ_TYPE_EDGE_FALLING>;
> +       };
> +};
> +
> +/* Exposed as the Flash/SD Header on the board */
> +&mmc0 {
> +       vmmc-supply =3D <&reg_vcc3v3>;
> +       bus-width =3D <4>;
> +       broken-cd;
> +       status =3D "okay";
> +};
> +
> +/* Connected to the on-board ESP32 */
> +&mmc1 {
> +       vmmc-supply =3D <&reg_vcc3v3>;
> +       bus-width =3D <4>;
> +       broken-cd;
> +       status =3D "okay";
> +};
> +
> +&ohci {
> +       status =3D "okay";
> +};
> +
> +/* Disable external 32k osc as it is broken on current revision */
> +&osc32k {
> +       status =3D "disabled";
> +};
> +
> +&pio {
> +       vcc-pb-supply =3D <&reg_vcc3v3>;
> +       vcc-pc-supply =3D <&reg_vcc3v3>;
> +       vcc-pe-supply =3D <&reg_vcc3v3>;
> +       vcc-pf-supply =3D <&reg_vcc3v3>;
> +       vcc-pg-supply =3D <&reg_vcc3v3>;
> +
> +       gpio-line-names =3D "", "", "", "", // PA
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "CAN_nCS", "CAN_nINT", "USER_SW", "PB3", // PB
> +                         "USB_ID", "USBC_nINT", "I2C0_SCL", "I2C0_SDA",
> +                         "UART0_TX", "UART0_RX", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "SPI_MISO", "SPI_SCK", "FLASH_nCS", "SPI_MOSI",=
 // PC
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "", // PD
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "Q12", "Q11", "Q10", "Q9", // PE
> +                         "LED_SYS0", "I1", "Q1", "Q2",
> +                         "I2", "I3", "Q3", "Q4",
> +                         "I4", "I5", "Q5", "Q6",
> +                         "I6", "I7", "Q7", "Q8",
> +                         "I8", "UART1_TXD", "UART1_RXD", "ESP_nRST",
> +                         "ESP_nBOOT", "", "", "",
> +                         "", "", "", "",
> +                         "SD_D1", "SD_D0", "SD_CLK", "SD_CMD", // PF
> +                         "SD_D3", "SD_D2", "LED_SYS1", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "ESP_CLK", "ESP_CMD", "ESP_D0", "ESP_D1", // PG
> +                         "ESP_D2", "ESP_D3", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "";
> +};
> +
> +/* Disable external 32k osc as it is broken on current revision */
> +&rtc {
> +       /delete-property/ clocks;
> +};
> +
> +/* Exposed as a USB-C connector with USB-Serial converter */
> +&uart0 {
> +       pinctrl-0 =3D <&uart0_pb_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +};
> +
> +/* Connected to the Bootloader/Console of the ESP32 */
> +&uart1 {
> +       pinctrl-0 =3D <&uart1_pe_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +};
> +
> +&usb_otg {
> +       extcon =3D <&tusb320 0>;
> +       dr_mode =3D "otg";
> +       status =3D "okay";
> +};
> +
> +&usbphy {
> +       usb0_id_det-gpios =3D <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
> +       status =3D "okay";
> +};
> +
> +&spi0 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       cs-gpios =3D <0>, <&pio 1 0 GPIO_ACTIVE_LOW>; /* PB0 */
> +       status =3D "okay";
> +
> +       flash@0 {
> +               compatible =3D "jedec,spi-nor";
> +               reg =3D <0>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               label =3D "firmware";
> +               spi-max-frequency =3D <40000000>;
> +       };
> +
> +       can@1 {
> +               compatible =3D "microchip,mcp2518fd";
> +               reg =3D <1>;
> +               clocks =3D <&clk_can0>;
> +               interrupt-parent =3D <&pio>;
> +               interrupts =3D <1 1 IRQ_TYPE_LEVEL_LOW>;  /* PB1 */

Please use interrupts-extended instead.

ChenYu

> +               spi-max-frequency =3D <20000000>;
> +               vdd-supply =3D <&reg_vcc3v3>;
> +               xceiver-supply =3D <&reg_vcc3v3>;
> +       };
> +};
> --
> 2.39.5
>
>


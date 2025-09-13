Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82287CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 09:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9yf8Ktp4HQCNlkhLraLZ3muqM4SOy6F+jw9y0V/VXs=; b=e5tDe7dKax4+7L
	cx8IUm/T/+I/oN0CSBoBOh55cA7kqzMltCqjo8REy5ZFQwGsjkZd8W2UG/FoGD/vqAtlBKJ2mvH+5
	+TCX8EMSho4dk6zMtIWmG14ShITpSv8DYrdVZdCbtwNP7YJYeMhENeVAafOcJWpvwgxJ3EmyZXODL
	eVuqkGetGGaLYUpYlKg2JVkSdLFhSL+d2XNGUfQ25WXyPXZ6Y5y9PSnfgVc7ej6HEf2XyQz+nGa/6
	CpyQ/6jIjx6VZ0wpYqVgzU8v40otYM/bA32qDFHlasqDd4d73WN15Vd1q+TjfsI0EmxkfgdWfyWbK
	eNMheetXgnwbTUwvpxEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMFp-0000000E26E-1J6k;
	Sat, 13 Sep 2025 09:09:09 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMFm-0000000E24t-3cZ0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 09:09:08 +0000
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-571a58b385aso1232743e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 02:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757754544; x=1758359344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+9yf8Ktp4HQCNlkhLraLZ3muqM4SOy6F+jw9y0V/VXs=;
        b=mLj267K59yeM96w5hJvuxFApOS2YvKKovlxIixzN6m6boXBY0pGOik0MCMQm3dVW9G
         fq1RSDrQ9l928ZWCJ64jiwIhUHt2CvKMJiSFtOOSg2SHzgecEoUyokCrb9/GmG4ss2cx
         poP95+YbQ9N67Um837zy3vpSEXPfAegqZcqvtqHHXevruIq3bKMJNCU4FPvWPY2EVbdO
         yAQMIPILg2awgCg5cTKv5yy4xB7MgQwjQclQydo98PlisS/uVzTgl5RMcG0z5kHqxhMo
         XVhKvEH+w1WRfj1ql9BX1mOuLNQE0X+EC0rnwDUz22LGoUiRdduBAos4p38nwCOlzIBC
         QEXw==
X-Forwarded-Encrypted: i=1; AJvYcCUaGj4PQ7XiJ9RpfWA3W2lGI5QngAd7JLhM6GtEMpG/peiszKBpafqijThVfWqh/zZv7NOOdPomW/2vj8SJUrL+@lists.infradead.org
X-Gm-Message-State: AOJu0YxdM4k/fbOHDdQqiN9U4pL8yyzLCPGskxH9SyhBPZh5dfgFMaK1
	4jPpZo9NFHShzhhGxGkXF+/MzZwZ/Wq3PHmPbL+gaab7CG4fTcEBDf+ZwgJ6N0C0
X-Gm-Gg: ASbGncvkub66PonnMd0iI1cOhT45q0TrhN/LfX3ZPGM1Yq1W3QqsGg2KVPYm7jot7us
	ax0KR06rqzRNOtVrcK8z+VrSizTErCgVl3Nn9I9b9xgN6aHymmf24N3K/yIQYiTaMDY3hpB/4UP
	JCSLnwS4IpG56jg1TtDIUF01WyELyWykDAgSHMce1yPfvT3EPyhjUvq2akcYWc7SVwn4ishyPtL
	qh8o2bVmYMq0ncy1qITbbhZZZYEmXMDT/3i/ZMzbLsqwFV6qRqoT0H7upHrpOdwkb45+Nfhkwhz
	IfmQ7dRaAlU1LpqGUuuIYtoBUd/rARdkbOC2lO76kOIiuLn03H0kdRY1I9+bNGPQjT6xgSV5Lwr
	nt2MKfpwub/Ho91aol0OARuFxeqqULp0OFZLWlr3t/bzqlK1BYw69myZo9XTcZEb+wA==
X-Google-Smtp-Source: AGHT+IGg4l4ZvMJNOQUd3dPqHtZgdl012rx1Lolx2EJNis+OJFvYi3BEKLCAJ6brKu5ANSYhbnYY+A==
X-Received: by 2002:a05:6512:4058:20b0:560:8c58:6cd7 with SMTP id 2adb3069b0e04-57048beb50dmr1513802e87.5.1757754544008;
        Sat, 13 Sep 2025 02:09:04 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e661dc132sm1847991e87.148.2025.09.13.02.09.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 02:09:03 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-336ce4a8bfcso20764531fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 02:09:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMIAZcBdipYig/QFhzULI+vWCNSaiZGbsUWYNN/pqul2LqUDRsgS9ATp4njyGU8RsWCOdohBSQpKGNKXl1CeVT@lists.infradead.org
X-Received: by 2002:a05:651c:31da:b0:338:11e1:c7d9 with SMTP id
 38308e7fff4ca-351415650afmr16006951fa.43.1757754176539; Sat, 13 Sep 2025
 02:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250831162536.2380589-1-lukas.schmid@netcube.li> <20250831162536.2380589-4-lukas.schmid@netcube.li>
In-Reply-To: <20250831162536.2380589-4-lukas.schmid@netcube.li>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 13 Sep 2025 17:02:44 +0800
X-Gmail-Original-Message-ID: <CAGb2v66iD1BBwOeECrckmf_d-xQmmMzFhkj-SjO5ja7i1f0YDw@mail.gmail.com>
X-Gm-Features: Ac12FXxX2oqvFnH_76fKkzLJQXu3WsG74ENxnFjJOqn4Ha6355qDBEr_yZ7zdgg
Message-ID: <CAGb2v66iD1BBwOeECrckmf_d-xQmmMzFhkj-SjO5ja7i1f0YDw@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] ARM: dts: sunxi: add support for NetCube Systems
 Nagami SoM
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_020906_953308_75FEF4AF 
X-CRM114-Status: GOOD (  23.70  )
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

On Mon, Sep 1, 2025 at 12:26=E2=80=AFAM Lukas Schmid <lukas.schmid@netcube.=
li> wrote:
>
> NetCube Systems Nagami SoM is a module based around the Allwinner T113s
> SoC. It includes the following features and interfaces:
>
> - 128MB DDR3 included in SoC
> - 10/100 Mbps Ethernet using LAN8720A phy
> - One USB-OTG interface
> - One USB-Host interface
> - One I2S interface with in and output support
> - Two CAN interfaces
> - ESP32 over SDIO
> - One SPI interface
> - I2C EEPROM for MAC address
> - One QWIIC I2C Interface with dedicated interrupt pin shared with EEPROM
> - One external I2C interface
> - SD interface for external SD-Card
>
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  .../allwinner/sun8i-t113s-netcube-nagami.dtsi | 250 ++++++++++++++++++
>  1 file changed, 250 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagam=
i.dtsi
>
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi =
b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi
> new file mode 100644
> index 0000000000000..4d3627f6d58d2
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi
> @@ -0,0 +1,250 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2025 Lukas Schmid <lukas.schmid@netcube.li>
> + */
> +
> +/dts-v1/;
> +#include "sun8i-t113s.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +       model =3D "NetCube Systems Nagami SoM";
> +       compatible =3D "netcube,nagami", "allwinner,sun8i-t113s";
> +
> +       aliases {
> +               serial1 =3D &uart1; // ESP32 Bootloader UART
> +               serial3 =3D &uart3; // Console UART on Card Edge
> +               ethernet0 =3D &emac;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial3:115200n8";
> +       };
> +
> +       /* module wide 3.3V supply directly from the card edge */
> +       reg_vcc3v3: regulator-3v3 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc-3v3";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-always-on;
> +       };
> +
> +       /* SY8008 DC/DC regulator on the board, also supplying VDD-SYS */
> +       reg_vcc_core: regulator-core {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc-core";
> +               regulator-min-microvolt =3D <880000>;
> +               regulator-max-microvolt =3D <880000>;
> +               vin-supply =3D <&reg_vcc3v3>;
> +       };
> +
> +       /* USB0 MUX to switch connect to Card-Edge only after BootROM */
> +       usb0_sec_mux: mux-controller{
> +               compatible =3D "gpio-mux";
> +               #mux-control-cells =3D <0>;
> +               mux-gpios =3D <&pio 3 9 GPIO_ACTIVE_HIGH>; /* PD9 */
> +               idle-state =3D <1>; /* USB connected to Card-Edge by defa=
ult */
> +       };
> +
> +       /* Reset of ESP32 */
> +       wifi_pwrseq: wifi-pwrseq {
> +               compatible =3D "mmc-pwrseq-simple";
> +               reset-gpios =3D <&pio 6 9 GPIO_ACTIVE_LOW>; /* PG9 */
> +               post-power-on-delay-ms =3D <1500>;
> +               power-off-delay-us =3D <200>;
> +       };
> +};
> +
> +&cpu0 {
> +       cpu-supply =3D <&reg_vcc_core>;
> +};
> +
> +&cpu1 {
> +       cpu-supply =3D <&reg_vcc_core>;
> +};
> +
> +&dcxo {
> +       clock-frequency =3D <24000000>;
> +};
> +
> +&emac {
> +       nvmem-cells =3D <&eth0_macaddress>;
> +       nvmem-cell-names =3D "mac-address";
> +       phy-handle =3D <&lan8720a>;
> +       phy-mode =3D "rmii";
> +       pinctrl-0 =3D <&rmii_pe_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +};
> +
> +/* Default I2C Interface on Card-Edge */
> +&i2c2 {
> +       pinctrl-0 =3D <&i2c2_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "disabled";
> +};
> +
> +/* Exposed as the QWIIC connector and used by the internal EEPROM */
> +&i2c3 {
> +       pinctrl-0 =3D <&i2c3_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
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
> +};
> +
> +/* Default I2S Interface on Card-Edge */
> +&i2s1 {
> +       pinctrl-0 =3D <&i2s1_pins>, <&i2s1_din_pins>, <&i2s1_dout_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "disabled";
> +};
> +
> +/* Phy is on SoM. MDI signals pre-magentics are on the card edge */

                                 ^ pre-magnetics?

Will fix up when applying if nothing else in the series is wrong.

ChenYu

> +&mdio {
> +       lan8720a: ethernet-phy@0 {
> +               compatible =3D "ethernet-phy-ieee802.3-c22";
> +               reg =3D <0>;
> +       };
> +};
> +
> +/* Default SD Interface on Card-Edge */
> +&mmc0 {
> +       pinctrl-0 =3D <&mmc0_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "disabled";
> +};
> +
> +/* Connected to the on-board ESP32 */
> +&mmc1 {
> +       pinctrl-0 =3D <&mmc1_pins>;
> +       pinctrl-names =3D "default";
> +       vmmc-supply =3D <&reg_vcc3v3>;
> +       bus-width =3D <4>;
> +       non-removable;
> +       mmc-pwrseq =3D <&wifi_pwrseq>;
> +       status =3D "okay";
> +};
> +
> +/* Connected to the on-board eMMC */
> +&mmc2 {
> +       pinctrl-0 =3D <&mmc2_pins>;
> +       pinctrl-names =3D "default";
> +       vmmc-supply =3D <&reg_vcc3v3>;
> +       vqmmc-supply =3D <&reg_vcc3v3>;
> +       bus-width =3D <4>;
> +       non-removable;
> +       status =3D "okay";
> +};
> +
> +&pio {
> +       vcc-pb-supply =3D <&reg_vcc3v3>;
> +       vcc-pc-supply =3D <&reg_vcc3v3>;
> +       vcc-pd-supply =3D <&reg_vcc3v3>;
> +       vcc-pe-supply =3D <&reg_vcc3v3>;
> +       vcc-pf-supply =3D <&reg_vcc3v3>;
> +       vcc-pg-supply =3D <&reg_vcc3v3>;
> +
> +       gpio-line-names =3D "", "", "", "", // PA
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "CAN0_TX", "CAN0_RX", /=
/ PB
> +                                         "CAN1_TX", "CAN1_RX", "UART3_TX=
", "UART3_RX",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "eMMC_CLK", "eMMC_CMD",=
 // PC
> +                                         "eMMC_D2", "eMMC_D1", "eMMC_D0"=
, "eMMC_D3",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "", // PD
> +                                         "", "", "", "",
> +                                         "", "USB_SEC_EN", "SPI1_CS", "S=
PI1_CLK",
> +                                         "SPI1_MOSI", "SPI1_MISO", "SPI1=
_HOLD", "SPI1_WP",
> +                                         "PD16", "", "", "",
> +                                         "I2C2_SCL", "I2C2_SDA", "PD22",=
 "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "ETH_CRSDV", "ETH_RXD0", "ETH_R=
XD1", "ETH_TXCK", // PE
> +                                         "ETH_TXD0", "ETH_TXD1", "ETH_TX=
EN", "",
> +                                         "ETH_MDC", "ETH_MDIO", "QWIIC_n=
INT", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "SD_D1", "SD_D0", "SD_CLK", "SD=
_CLK", // PF
> +                                         "SD_D3", "SD_D2", "PF6", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "ESP_CLK", "ESP_CMD", "ESP_D0",=
 "ESP_D1", // PG
> +                                         "ESP_D2", "ESP_D3", "UART1_TXD"=
, "UART1_RXD",
> +                                         "ESP_nBOOT", "ESP_nRST", "I2C3_=
SCL", "I2C3_SDA",
> +                                         "I2S1_WS", "I2S1_CLK", "I2S1_DI=
N0", "I2S1_DOUT0",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "",
> +                                         "", "", "", "";
> +};
> +
> +/* Remove the unused CK pin from the pinctl as it is unconnected */
> +&rmii_pe_pins {
> +       pins =3D "PE0", "PE1", "PE2", "PE3", "PE4",
> +                  "PE5", "PE6", "PE8", "PE9";
> +};
> +
> +/* Default SPI Interface on Card-Edge */
> +&spi1 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       pinctrl-0 =3D <&spi1_pins>, <&spi1_hold_pin>, <&spi1_wp_pin>;
> +       pinctrl-names =3D "default";
> +       cs-gpios =3D <0>;
> +       status =3D "disabled";
> +};
> +
> +/* Connected to the Bootloader/Console of the ESP32 */
> +&uart1 {
> +       pinctrl-0 =3D <&uart1_pg6_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +};
> +
> +/* Console/Debug UART on Card-Edge */
> +&uart3 {
> +       pinctrl-0 =3D <&uart3_pb_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +};
> --
> 2.39.5
>
>


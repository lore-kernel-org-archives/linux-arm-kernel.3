Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE5BC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 14:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MHI9+PzW39sul+i6E/EGeNmor59j/M/+OWEp6c+V/+U=; b=aIX5GTQbK0gXYe
	8LNQcQuYUNaX2G1DZ0K+cFQ3b1UT7Ds0IALEe30QJxiRk5t/Gt4sonvuVWvrSu5XkqhZFDC1sCcic
	3uR78NpO0vPmRzFS33KHJnE1kMo9YuTauBxqW/S1eFqDOxbJq9nk5agcjlMZQ/1X9G/rxzehLi8kW
	UscnPHGRKQTxO6UvzBBqF0m3TOGoKMMNouOdEDoJIoUAUEkZ4ki0fZmmAAb70TtcEvBdRsfsDFfU6
	LkJlZmpSUJ6GCBBFxVi9p7aDEO6GYRzNUlOH49PfoIM7FO24Kk02XGsszHVgCrpVk55hNOkVEI/5K
	1ND0o/rmGw8enkrIE1+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDMI-0000000FSR3-46EI;
	Wed, 14 May 2025 14:45:22 +0000
Received: from mail-lj1-f181.google.com ([209.85.208.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCsx-0000000FNkL-23TB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 14:15:04 +0000
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-326ca53a7f1so53573311fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 07:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747232099; x=1747836899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MHI9+PzW39sul+i6E/EGeNmor59j/M/+OWEp6c+V/+U=;
        b=DtXf2KfsLIDkcp3yIPL0Z84wlyCOTVOxmzziD6gMCYKU9kXd657zaNZ5rqxGbj+6Kb
         NIGNCUtWOkn86Z3AAuLfb99KJ9IAfJ900L6yieNkTG22OhASri+lj74QwBv86xPvy5np
         PmxCfjy7u920ecM9BYOQvARvppIhtUxhwUbYJMlqpbwXpEw+bCQP/EpYFp4VslxBuJ3n
         BTol5iior1F/9VyWF6cZ+Uy2uoN5FdUPLV+sOijr8wzo7AuAcPSIS6rWyZ3vFVtBwtJE
         GPFhcY23R2CLdFbPQ+ZUl0kFLl9zzVpBnDdYFhVj4Zc4Z9/mXC8JmEP20QRqAPg09Dby
         1lNg==
X-Forwarded-Encrypted: i=1; AJvYcCX7CtEt7wiK1kNlyC0XwuqDrWHMTbWp+sclupCrxksVYmfYAJgr87024XpoKlPjwwRspmufuu4pVow3ti3Cianv@lists.infradead.org
X-Gm-Message-State: AOJu0YwblVaTP0zHlZWhSvsbLhy1+EisZyk4mCXfomG80PNnqXX5pJkp
	H9Th/OJEANheBihyoN+08tvf9ZODq8Skr82+ekXaGu9zOhHrZ7aRR6O1FuzM
X-Gm-Gg: ASbGnctjus5ZFeVBtnNmfiGWAbVCVVs0A0O2i74mArWVxua+CJXp4QIjxWZgkDqNa2L
	JMt2tIBbTlgF2TZxYyuGKXDyXcXZnwIlgm8T1gc5iglhKAqqzXsLBppqV0RyXt5lAdGLo17USw+
	/EgIwAjNoEnoVYLBJleifpY0nE8TBBoINX6/lFeVGUXQQMwZB2/+9si5JJEJbDeKy89hIVE37Xh
	UvaGz6At4+IYXfx/uC0f/Jibr1UrJNzH5B3tjFX8lfWmfLObSj7zLcneA3CN2mZjyvGls4Wixi8
	zOhPXEnD3PuxGphvZbbkPGEQJBGSpjiRyEokINh8g22phPdI6cE2hmsk/dYux2XgL1/jtkmaDb8
	F58RC/x8J
X-Google-Smtp-Source: AGHT+IFzW1am6eaBCHPRm/CnfmAbVWsufvv/VhAdbGUoSqPT4SJTek/Z+EkncoZnOU6iwUDGzoSiuw==
X-Received: by 2002:a05:651c:312b:b0:31a:3744:6ecd with SMTP id 38308e7fff4ca-327ed09f9f1mr14789561fa.6.1747232099125;
        Wed, 14 May 2025 07:14:59 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c358acf7sm19820101fa.99.2025.05.14.07.14.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 07:14:58 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-326c77c40b7so53217831fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 07:14:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVlyC7Xly7idRqvUFjIBUwR8j1HwUImuKKrzidQSrQlUWkRDA0lLjPTM1F1j5h+6SG4sZZr7MnFcnixsvHwvFbP@lists.infradead.org
X-Received: by 2002:a05:651c:144b:b0:326:db50:fa71 with SMTP id
 38308e7fff4ca-327ed11ecccmr16248041fa.23.1747232097790; Wed, 14 May 2025
 07:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250505164729.18175-1-andre.przywara@arm.com> <20250505164729.18175-4-andre.przywara@arm.com>
In-Reply-To: <20250505164729.18175-4-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 14 May 2025 22:14:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v67JGbTgsNcqn4TZ74s_U1+9xGj_a7kYkmfGVxeygQ_Ydw@mail.gmail.com>
X-Gm-Features: AX0GCFuDYucYLLpLUlhwE2czLbkwqRJZoUBu4cwQtabqLqc0JUaJT_1nWb9P4eE
Message-ID: <CAGb2v67JGbTgsNcqn4TZ74s_U1+9xGj_a7kYkmfGVxeygQ_Ydw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: a100: add Liontron H-A133L
 board support
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Cody Eksal <masterr3c0rd@epochal.quest>, 
	Philippe Simons <simons.philippe@gmail.com>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_071503_535252_7AA8634B 
X-CRM114-Status: GOOD (  25.92  )
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

On Tue, May 6, 2025 at 12:48=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The H-A133L board is an industrial development board made by Liontron.
> It contains a number of dedicated JST connectors, to connect external
> peripherals. It features:
>
> - Allwinner A133 SoC (4 * Arm Cortex-A53 cores at up to 1.6 GHz)
> - 1 GiB, 2 GiB or 4 GiB of LPDDR4 DRAM
> - between 16 and 128 GiB eMMC flash
> - AXP707 PMIC (compatible to AXP803)
> - 100 Mbit/s RJ45 Ethernet socket, using an JLSemi JL1101 PHY
> - XR829 WIFI+Bluetooth chip
> - 2 * USB 2.0 USB-A ports, plus three sets of USB pins on connectors
>   (connected via a USB hub connected to USB1 on the SoC)
> - microSD card slot
> - 3.5mm A/V port
> - 12V power supply
> - connectors for an LVDS or MIPI-DSI panel
>
> Add the devicetree describing the board's peripherals and their
> connections.
>
> Despite being a devboard, the manufacturer does not publish a schematic
> (I asked), so the PMIC rail assignments were bases on BSP dumps,
> educated guesses and some experimentation. Dropping the always-on
> property from any of the rails carrying it will make the board hang as
> soon as the kernel turns off unused regulators.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../sun50i-a133-liontron-h-a133l.dts          | 214 ++++++++++++++++++
>  2 files changed, 215 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-=
a133l.dts
>
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index 790aad3a91e86..773cc02a13d04 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-sopine-baseboa=
rd.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-teres-i.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h64-remix-mini-pc.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a100-allwinner-perf1.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a133-liontron-h-a133l.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-bananapi-m2-plus.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-bananapi-m2-plus-v1.2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-emlid-neutis-n5-devboard.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.d=
ts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> new file mode 100644
> index 0000000000000..682ed15d84854
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> @@ -0,0 +1,211 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Arm Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-a100.dtsi"
> +#include "sun50i-a100-cpu-opp.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/{
> +       model =3D "Liontron H-A133L";
> +       compatible =3D "liontron,h-a133l", "allwinner,sun50i-a100";
> +
> +       aliases {
> +               serial0 =3D &uart0;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial0:115200n8";
> +       };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               led {
> +                       function =3D LED_FUNCTION_POWER;
> +                       color =3D <LED_COLOR_ID_BLUE>;
> +                       gpios =3D <&pio 7 16 GPIO_ACTIVE_LOW>; /* PH16 */
> +               };
> +       };
> +
> +       reg_vcc5v: vcc5v {
> +               /* board wide 5V supply from a 12V->5V regulator */
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc-5v";
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               regulator-always-on;
> +       };
> +
> +       reg_usb1_vbus: regulator-usb1-vbus {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "usb1-vbus";
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               vin-supply =3D <&reg_vcc5v>;
> +               enable-active-high;
> +               gpio =3D <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
> +       };
> +};
> +
> +&cpu0 {
> +       cpu-supply =3D <&reg_dcdc2>;
> +};
> +
> +&ehci0 {
> +       status =3D "okay";
> +};
> +
> +&ehci1 {
> +       status =3D "okay";
> +};
> +
> +&mmc0 {
> +       vmmc-supply =3D <&reg_dcdc1>;
> +       cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> +       bus-width =3D <4>;
> +       status =3D "okay";
> +};
> +
> +&mmc2 {
> +       vmmc-supply =3D <&reg_dcdc1>;
> +       vqmmc-supply =3D <&reg_eldo1>;
> +       cap-mmc-hw-reset;
> +       non-removable;
> +       bus-width =3D <8>;
> +       mmc-ddr-1_8v;
> +       mmc-hs200-1_8v;
> +       status =3D "okay";
> +};
> +
> +&ohci0 {
> +       status =3D "okay";
> +};
> +
> +&ohci1 {
> +       status =3D "okay";
> +};
> +
> +&pio {
> +       vcc-pb-supply =3D <&reg_dcdc1>;
> +       vcc-pc-supply =3D <&reg_eldo1>;
> +       vcc-pf-supply =3D <&reg_dcdc1>;
> +       vcc-ph-supply =3D <&reg_dcdc1>;
> +};
> +
> +&r_i2c0 {
> +       status =3D "okay";
> +
> +       axp803: pmic@34 {
> +               compatible =3D "x-powers,axp803";
> +               reg =3D <0x34>;
> +               interrupt-parent =3D <&r_intc>;
> +               interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +       };
> +};
> +
> +#include "axp803.dtsi"
> +
> +&ac_power_supply {
> +       status =3D "okay";
> +};
> +
> +&reg_aldo1 {
> +       regulator-always-on;
> +       regulator-min-microvolt =3D <1800000>;
> +       regulator-max-microvolt =3D <1800000>;
> +       regulator-name =3D "vcc-codec-avcc";
> +};
> +
> +&reg_aldo2 {
> +       regulator-always-on;
> +       regulator-min-microvolt =3D <1800000>;
> +       regulator-max-microvolt =3D <1800000>;
> +       regulator-name =3D "vcc-dram-1";
> +};
> +
> +&reg_aldo3 {
> +       regulator-always-on;
> +       regulator-min-microvolt =3D <3300000>;
> +       regulator-max-microvolt =3D <3300000>;
> +       regulator-name =3D "vcc-usb-pl";
> +};
> +
> +&reg_dcdc1 {
> +       regulator-always-on;
> +       regulator-min-microvolt =3D <3300000>;
> +       regulator-max-microvolt =3D <3300000>;
> +       regulator-name =3D "vcc-io-usb-pd-emmc";
> +};
> +
> +&reg_dcdc2 {
> +       regulator-always-on;
> +       regulator-min-microvolt =3D <810000>;
> +       regulator-max-microvolt =3D <1200000>;
> +       regulator-name =3D "vdd-cpux";
> +};
> +
> +&reg_dcdc3 {
> +       regulator-always-on;
> +       regulator-min-microvolt =3D <900000>;
> +       regulator-max-microvolt =3D <900000>;
> +       regulator-name =3D "vdd-usb-cpus";
> +};
> +
> +&reg_dcdc4 {
> +       regulator-always-on;
> +       regulator-min-microvolt =3D <950000>;
> +       regulator-max-microvolt =3D <950000>;
> +       regulator-name =3D "vdd-sys";
> +};
> +
> +&reg_dcdc5 {
> +       regulator-always-on;
> +       regulator-min-microvolt =3D <1100000>;
> +       regulator-max-microvolt =3D <1100000>;
> +       regulator-name =3D "vcc-dram";
> +};
> +
> +/* DCDC6 unused */
> +/* DLDO3 unused */
> +/* DLDO4 unused */
> +
> +&reg_eldo1 {
> +       regulator-min-microvolt =3D <1800000>;
> +       regulator-max-microvolt =3D <1800000>;
> +       regulator-name =3D "vcc-pc-emmc";
> +};
> +
> +/* ELDO2 unused */
> +/* ELDO3 unused */
> +
> +&reg_fldo1 {
> +       regulator-always-on;
> +       regulator-min-microvolt =3D <900000>;
> +       regulator-max-microvolt =3D <900000>;
> +       regulator-name =3D "vdd-cpus-usb";
> +};
> +
> +/* reg_drivevbus unused */
> +/* dc1sw unused */
> +
> +&uart0 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&uart0_pb_pins>;
> +       status =3D "okay";
> +};
> +
> +&usb_otg {
> +       dr_mode =3D "host";       /* USB A type receptacle, always powere=
d */

                                                noticed a typo here.

> +       status =3D "okay";
> +};
> +
> +&usbphy {
> +       status =3D "okay";
> +       usb1_vbus-supply =3D <&reg_usb1_vbus>;

Just noticed that these two were out of order, so I fixed both of
them and re-pushed.

ChenYu

> +};
> --
> 2.46.3
>


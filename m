Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CB5C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 18:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ky5RBBDFo7pwY6fTEoCqumUB417wE2fgV3OwJcGSh9w=; b=kyRyQN6hdYTCyM+6E/MStQO44r
	Al1FmfKF0pDIs8GAHF0Nuupnexa67i+/5Y7+BqpDtTxCCZWD9J+8Th+Q4v7iOnqHu+H/bgOGQe1wI
	LGnTVFTokyMaGD7k6XCokGbEIn3QEn2eUWTkOjvE5Qslrvl+7Tv8O3NqAyP+A3fi3WeJ/cG8vG10O
	j0SBP8Vn/f51d/DdL43qjQRDg9NEsS0w0CwVvIG9vWEEJ2txjOAMsf0vcg3GvHlvPI0r5zcasxDLj
	nLhO/pzly4TDSvlCUpF3U8d0KRADfHuOyaUUDwFHlEAYerg7WwKiWd0AqedbfEdvx68/Wp9IgigA+
	k34XZxcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXNp-00000006SGy-1Xf1;
	Fri, 21 Feb 2025 18:04:17 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXML-00000006S6l-0IYO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 18:02:46 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38f378498c9so2193567f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 10:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740160963; x=1740765763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ky5RBBDFo7pwY6fTEoCqumUB417wE2fgV3OwJcGSh9w=;
        b=Wntsrh9scGPEcKxT+jwmruEZAg5CQjAI3z7ArkxPljDnEVYf8eqXJf6M5u45LBVMoD
         IFYFXwI/Cdxxl+8R/Egp2+obtwAeJOztdXi4tIsaPPMckUXwElmw0vsT43FHamBk8Sh4
         wkE4k0ZHXCcQNcJlkHFWYisLqzrNztY64ufoeggklbbPuE1E36sKP/SqDggRZdAcJL9G
         Dxgqoojd5bkyM9h0lfMFIS2a9ZXerl8J4h7/ma9gLOHE79cMPsZ+0RNdIuF+ftlWznW2
         VYcN84z1cts72KmHxEGEv/98mPyo9sa+qP4m4oltKA/lvVqhL3QhjsCGBOE/SXdrA/SV
         bpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740160963; x=1740765763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ky5RBBDFo7pwY6fTEoCqumUB417wE2fgV3OwJcGSh9w=;
        b=FJLbnrLhJJUAOdEBmY5Qj+LRtarkFHeIzFpa2oZap9cCac7g82kK1fTgO2ft5B6RV2
         tbo4UBAcHVVcZqfNS1QEnGr9vWNrZUOierZ8w5PDXlzd6JwueaseZ8O9wbBCYZLy8OBg
         vcgMxNADPjXxmJxGSqe9GTpGiDqUNCiB6NbpnWzYAycAv+IWtWaOwYnAYrTts3EB5ndy
         mijiOzuRtlcAOw0Z5i5zjmYreqMqIA5YP/d7dhfz3wq1lbGH5A69ae4/j27JFokohRsv
         f+KHtXRH+RQC08f/fdiSLPQrZequKmKb+K2XVk/eekrZENENc2VRJoF9A4+y7t1MeiP5
         s+DQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7RZ6EIBIhkzMtugITzwnR2IImQ9U2561yLwauLwbjhi/qInM8n+u50Fv0BUmm5YGKfMSeqCa5IHp3EDYyJfaq@lists.infradead.org
X-Gm-Message-State: AOJu0YzQQL2aym7dkXbVy/9gPCYExNh04wH+oEV8Zagrt+msL4LHZG8h
	foI21DB34Kont03PyJyxA05KrRh+inz5d5g0xI98bxQWSK5lXAu7
X-Gm-Gg: ASbGnctGifVpNJLqY1lZvZfwUtP3hCpzw8UZJ/2Xv548sQhnJvJwpEuxQ1RnXf8MymG
	uHOLggbcI2JT3NMSj2EozdCUzqmsywf96Z0s4HXJnph3i4HqaishhAbOEAWpfPsdc4VSbDx8wU9
	CA28BVUxP2UTCe6PhiouJsN6BHoU48J4wsCfS5YONG4PbBJJP/bRhhvLnf2jjhI+CWw1HRyC2B6
	7bVY8slmTWpy8xL6kDiLE5ml7DhBhFAyNpTJ3FOIwvvSk/fGmPli5lVX72xMFpskzZV1k/1et8O
	SMx59NmHc2+k6C6L7wtuV8Qx6v1SVPd1p7nJN0ZbgKpKU7AHrUycqRczOvhJpmZtkLZwQBKWYt7
	haw==
X-Google-Smtp-Source: AGHT+IFgNKVxtAYFJ3mL0/vT0PfLzi2dGHGPi8cw65BEVBNksyDVfkcvC+CXso0kdLCw7Bwnk4rR4w==
X-Received: by 2002:a5d:648b:0:b0:38f:3e1c:211d with SMTP id ffacd0b85a97d-38f6e95bb57mr5545939f8f.14.1740160963035;
        Fri, 21 Feb 2025 10:02:43 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259fdb19sm24586850f8f.95.2025.02.21.10.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 10:02:42 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: h616: add YuzukiHD Chameleon support
Date: Fri, 21 Feb 2025 19:02:41 +0100
Message-ID: <2768158.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250221012038.13706-4-andre.przywara@arm.com>
References: <20250221012038.13706-1-andre.przywara@arm.com>
 <20250221012038.13706-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_100245_112405_3C22003D 
X-CRM114-Status: GOOD (  24.42  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Dne petek, 21. februar 2025 ob 02:20:38 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> The Chameleon board is an OpenHardware devboard made by YuzukiTsuru.
> The form factor resembles the Raspberry Pi Model A boards, though it
> differs significantly in its features:
>=20
>   - Allwinner H618 SoC (4 * Arm Cortex-A53 cores, 1MB L2 cache, 1.4 GHz)
>   - between 512MiB and 2GiB DDR3 DRAM
>   - up to 128 GiB eMMC flash
>   - AXP313a PMIC
>   - 100 Mbit/s Ethernet pins on a header
>   - XR829 WIFI+Bluetooth chip
>   - 4 * USB 2.0 USB-C ports
>   - microSD card slot
>   - 3.5mm A/V port
>=20
> Add the devicetree describing the board's peripherals and their
> connections.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../sun50i-h618-yuzukihd-chameleon.dts        | 222 ++++++++++++++++++
>  2 files changed, 223 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-ch=
ameleon.dts
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index 00bed412ee31c..448698fed5f79 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -48,6 +48,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-longanpi-3h.d=
tb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-orangepi-zero2w.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-orangepi-zero3.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-transpeed-8k618-t.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-yuzukihd-chameleon.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-2024.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-h.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-plus.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon=
=2Edts b/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
> new file mode 100644
> index 0000000000000..c60d42130cf79
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
> @@ -0,0 +1,222 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2024 Arm Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-h616.dtsi"
> +#include "sun50i-h616-cpu-opp.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	model =3D "Yuzuki Chameleon";
> +	compatible =3D "yuzukihd,chameleon", "allwinner,sun50i-h618";
> +
> +	aliases {
> +		ethernet1 =3D &sdio_wifi;
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	reg_vcc5v: vcc5v {
> +		/* board wide 5V supply directly from the USB-C socket */
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc-5v";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	wifi_pwrseq: pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		clocks =3D <&rtc CLK_OSC32K_FANOUT>;
> +		clock-names =3D "ext_clock";
> +		pinctrl-0 =3D <&x32clk_fanout_pin>;
> +		pinctrl-names =3D "default";
> +		reset-gpios =3D <&pio 6 11 GPIO_ACTIVE_LOW>; /* PG11 */
> +	};
> +};
> +
> +&codec {
> +	allwinner,audio-routing =3D "Line Out", "LINEOUT";
> +	status =3D "okay";
> +};
> +
> +&cpu0 {
> +	cpu-supply =3D <&reg_dcdc2>;
> +};
> +
> +&ehci0 {
> +	status =3D "okay";
> +};
> +
> +&ehci1 {
> +	status =3D "okay";
> +};
> +
> +&ehci2 {
> +	status =3D "okay";
> +};
> +
> +&ehci3 {
> +	status =3D "okay";
> +};
> +
> +&mmc0 {
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
> +	disable-wp;
> +	vmmc-supply =3D <&reg_dldo1>;
> +	status =3D "okay";
> +};
> +
> +&mmc1 {
> +	bus-width =3D <4>;
> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> +	non-removable;
> +	vmmc-supply =3D <&reg_dldo1>;
> +	vqmmc-supply =3D <&reg_dldo1>;
> +	status =3D "okay";
> +
> +	sdio_wifi: wifi@1 {
> +		reg =3D <1>;
> +		interrupt-parent =3D <&pio>;
> +		interrupts =3D <6 12 IRQ_TYPE_LEVEL_LOW>;  /* PG12 */
> +		interrupt-names =3D "host-wake";
> +	};
> +};
> +
> +&mmc2 {
> +	bus-width =3D <8>;
> +	cap-mmc-hw-reset;
> +	mmc-ddr-3_3v;
> +	non-removable;
> +	vmmc-supply =3D <&reg_dldo1>;
> +	vqmmc-supply =3D <&reg_dldo1>;
> +	status =3D "okay";
> +};
> +
> +&ohci0 {
> +	status =3D "okay";
> +};
> +
> +&ohci1 {
> +	status =3D "okay";
> +};
> +
> +&ohci2 {
> +	status =3D "okay";
> +};
> +
> +&ohci3 {
> +	status =3D "okay";
> +};
> +
> +&pio {
> +	vcc-pc-supply =3D <&reg_dldo1>;
> +	vcc-pf-supply =3D <&reg_dldo1>;	/* via VCC_IO */
> +	vcc-pg-supply =3D <&reg_dldo1>;
> +	vcc-ph-supply =3D <&reg_dldo1>;	/* via VCC_IO */
> +	vcc-pi-supply =3D <&reg_dldo1>;
> +};
> +
> +&r_i2c {
> +	status =3D "okay";
> +
> +	axp313: pmic@36 {
> +		compatible =3D "x-powers,axp313a";
> +		reg =3D <0x36>;
> +		#interrupt-cells =3D <1>;
> +		interrupt-controller;
> +		interrupt-parent =3D <&pio>;
> +		interrupts =3D <2 2 IRQ_TYPE_LEVEL_LOW>;	/* PC2 */
> +
> +		vin1-supply =3D <&reg_vcc5v>;
> +		vin2-supply =3D <&reg_vcc5v>;
> +		vin3-supply =3D <&reg_vcc5v>;
> +
> +		regulators {
> +			/* Supplies VCC-PLL, so needs to be always on. */
> +			reg_aldo1: aldo1 {
> +				regulator-always-on;
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-name =3D "vcc1v8";
> +			};
> +
> +			/* Supplies VCC-IO, so needs to be always on. */
> +			reg_dldo1: dldo1 {
> +				regulator-always-on;
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-name =3D "vcc3v3";
> +			};
> +
> +			reg_dcdc1: dcdc1 {
> +				regulator-always-on;
> +				regulator-min-microvolt =3D <810000>;
> +				regulator-max-microvolt =3D <990000>;
> +				regulator-name =3D "vdd-gpu-sys";
> +			};
> +
> +			reg_dcdc2: dcdc2 {
> +				regulator-always-on;
> +				regulator-min-microvolt =3D <810000>;
> +				regulator-max-microvolt =3D <1100000>;
> +				regulator-name =3D "vdd-cpu";
> +			};
> +
> +			reg_dcdc3: dcdc3 {
> +				regulator-always-on;
> +				regulator-min-microvolt =3D <1500000>;
> +				regulator-max-microvolt =3D <1500000>;
> +				regulator-name =3D "vdd-dram";
> +			};
> +		};
> +	};
> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_ph_pins>;
> +	status =3D "okay";
> +};
> +
> +/* Connected to the Bluetooth UART pins of the XR829 Wifi/BT chip. */
> +&uart1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> +	uart-has-rtscts;
> +	status =3D "okay";
> +};
> +
> +&usbotg {
> +	/*
> +	 * PHY0 pins are connected to a USB-C socket, but a role switch
> +	 * is not implemented: both CC pins are pulled to GND.
> +	 * The VBUS pins power the device, so a fixed peripheral mode
> +	 * is the best choice.
> +	 * The board can be powered via GPIOs, in this case port0 *can*
> +	 * act as a host (with a cable/adapter ignoring CC), as VBUS is
> +	 * then provided by the GPIOs. Any user of this setup would
> +	 * need to adjust the DT accordingly: dr_mode set to "host",
> +	 * enabling OHCI0 and EHCI0.
> +	 */
> +	dr_mode =3D "otg";

OTG role contradicts text above.

The rest looks good.

Best regards,
Jernej

> +	status =3D "okay";
> +};
> +
> +&usbphy {
> +	usb0_id_det-gpios =3D <&pio 6 18 GPIO_ACTIVE_HIGH>; /* PG18 */
> +	usb0_vbus-supply =3D <&reg_vcc5v>;
> +	usb1_vbus-supply =3D <&reg_vcc5v>;
> +	usb2_vbus-supply =3D <&reg_vcc5v>;
> +	usb3_vbus-supply =3D <&reg_vcc5v>;
> +	status =3D "okay";
> +};
>=20






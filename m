Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793DAF94CBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 11:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9drZOG344fqQoYzPEpzOY3EXzMEq9Xd5LoQQRRgJm0=; b=yf5NYddlJCDlf2q1aPdIrf9x/O
	CRWGW/AQMWWoCj5MoA9TM/EoQO0+MuqAaRESWmGon9KMba8KDkwbJQo183bVLJa0stqq1bqJhmkFM
	KrZL8s9Q7iaYiRl1UwKAhPLwSpXMrM3LBl+pABITrnamA9nKVskyXzs1BseebQ+qyreye7iOU8YMk
	i0nYPOZ0wR9lxCeLs9b6Y8OEDMjXoUJZ+S0RAOTAJmdGup6SiBAr120r/5YXRzYz5LXO72jslDkWB
	S1R2BwXUgL6M0kFWEC++RnKuBWmTF4NIqvSVRgBDzbyFOTZW8N7j27kr/mFWZnGBr68BxhDZmjUJL
	6SlmB0Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFW07-0000000A0fI-0O40;
	Wed, 22 Apr 2026 11:44:15 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFW04-0000000A0eM-31ld
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 11:44:14 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5a10d130b37so5296233e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 04:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776858250; x=1777463050; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9drZOG344fqQoYzPEpzOY3EXzMEq9Xd5LoQQRRgJm0=;
        b=W/vpVOQXRs7WIFxPNw5PY//gBL6eBRaYQd0uLjc/6TCKJk4xsLzFcClivh1QAluWjW
         10GINL1ZQ6p368wCmFCPmBWNQucQr7p6FFhCDIkgEVcMvG9exBJvNAjkbt9f/o2DrKJK
         iNepaGKkNqlxLQDbbGHBWUO+GveVZwYGIKHDKVb7AsO5ODV/UTKyaU+HHASYSu2BiXJG
         Eg5GIloldTZ7NrjIvv3MFYTEvsOn+oxjg16isxLldhvf2QEKa/M7Pb+TEbbbwGUxDdUA
         0gwZM50fUOg/iBoOckNjtdOLhb+Z6TNWV3pso6371DLeZ2mqWoVOOE9ZOlwLcr3CD+4E
         zbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776858250; x=1777463050;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9drZOG344fqQoYzPEpzOY3EXzMEq9Xd5LoQQRRgJm0=;
        b=lHAvahnKmNf4p1/jdy7NUc9s8l/fWTK/+WnBWi4PXs/58rZCfVypSDTkCUIWDB6aE4
         3gLoPvk9f+wwHEuXtcP+UcSwG6gcZkYir30EaEhgT+roS4ndpy/Cvohj2zdprtUzmnIx
         /A3Lqaq6dpk42KREeijIohEDcAbMxhU4Ftm+Uqv0qwkr4F+suRXX+oItdiKgxp6qlSUz
         3yY7bTV+rJN9ZmR5ES5LBmm0kfH19JzTaTK8NLkW1Z0E9AG1xq+V0knxN/G2xVPs1vH9
         ktdOlmZMx+uLNRs9V4MR4ae6kAldjfhXiJ3BBD9b7Z1HXiC22u3dwYyPygkpZ9/aH8Mm
         2u0w==
X-Forwarded-Encrypted: i=1; AFNElJ+8yCc27wfrRaTIhcjudzg0JcWtpml3Nybntjn3cCCT80zzPNaNVfs0ijVtAbdc2xH/kEaKUmj4oLQ+pXtzjpWv@lists.infradead.org
X-Gm-Message-State: AOJu0YzcvM27CMCdFAG0DYJN3oFn1DtN+rwHEmfNrwKAPknX0tpkCw3+
	B7gJD3xbitIhSHrcF7SwPVkOVsvKKLajpHI+2++HqBT51TzAsg1vr5c4
X-Gm-Gg: AeBDiesEb6NkgHjE9QhpVbEmTXWGxNu5j9/kj0FqB0ElwygdSn4Cj1esooZVrdBnbRp
	CK28khiYgpWfhN++XHl9Ijk/p0zVyA9vBAUXJ8AvB3Fp8pyv7diqvCLNQYZc5WRx0Be6h2SEj/v
	0DQQ8PfTwyfsbAcCphwxPKZ4riO0O2wAZgmOYcqACT6PHEoeFBy4XAyKdRbZk7sJ9uVpwWFzR7R
	JBiOR9TKI4Bj3LTjNxbxvnpGngA6eetBmYEHcETU4sCW0BYGLWOVFq09fBdG3CsGTJ3O37/ICpY
	e8lFuE+i8mJx8BzjwoxopDre1bNPcqKSyNPI9SsA7fNrHzphzHZSr/UJM8R1fRTLH5Cxci4Yh02
	HGs8gWuTY9PW251PZWSUTSw9ZLmVxo1nnjUo3VFaJAQJQnsr0mTUt9YYOjJVLZHvTX7F6JBw7xa
	jfZgjrpK8HtLUsxbmS/GuymYhjFCmG7S6/NdAoN1LYqd6DpbRhdfFfOOEXH4AO4nA=
X-Received: by 2002:a05:6512:3c99:b0:5a4:1b6:dd31 with SMTP id 2adb3069b0e04-5a417299948mr6173524e87.13.1776858249676;
        Wed, 22 Apr 2026 04:44:09 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec0c2sm4355743e87.82.2026.04.22.04.44.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:44:08 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH v4 2/2] arm64: dts: amlogic: add support for Amediatech
 X98Q
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20260422095840.26139-3-christian.koever-draxl@student.uibk.ac.at>
Date: Wed, 22 Apr 2026 15:43:54 +0400
Cc: robh@kernel.org,
 krzk+dt@kernel.org,
 conor+dt@kernel.org,
 neil.armstrong@linaro.org,
 khilman@baylibre.com,
 jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <08C1AD64-2AA9-48B5-B33E-16844C0111DE@gmail.com>
References: <20260422095840.26139-1-christian.koever-draxl@student.uibk.ac.at>
 <20260422095840.26139-3-christian.koever-draxl@student.uibk.ac.at>
To: christian.koever-draxl@student.uibk.ac.at
X-Mailer: Apple Mail (2.3864.500.181)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_044412_806609_6FA4027D 
X-CRM114-Status: GOOD (  27.52  )
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

> On 22 Apr 2026, at 1:58=E2=80=AFpm, =
christian.koever-draxl@student.uibk.ac.at wrote:
>=20
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl =
<christian.koever-draxl@student.uibk.ac.at>
>=20
> Add dts enabling core hardware for the Amediatech X98Q TV box.
>=20
> The board features:
> - Amlogic S905W2 (Meson S4) SoC
> - 1 GiB RAM (2 GiB variants exist)
> - eMMC and microSD card slot
> - SDIO-based WiFi module (unsupported)
> - RMII Ethernet with internal PHY
> - IR receiver and UART console
> - Status LED
>=20
> Enabled peripherals:
> - eMMC (HS200)
> - SD card interface
> - SDIO bus (WiFi, no driver yet)
> - Ethernet (RMII)
> - UART_B
> - IR receiver
> - PWM-controlled CPU regulator
> - PWM and Fixed regulators for core and IO rails
>=20
> Known limitations:
> - No support for the onboard WiFi module
> - Missing multimedia (HDMI/audio)
>=20
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl =
<christian.koever-draxl@student.uibk.ac.at>
> ---
> arch/arm64/boot/dts/amlogic/Makefile          |   1 +
> .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 249 ++++++++++++++++++
> 2 files changed, 250 insertions(+)
> create mode 100644 =
arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
>=20
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile =
b/arch/arm64/boot/dts/amlogic/Makefile
> index 15f9c817e502..c7752684dea6 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -85,6 +85,7 @@ dtb-$(CONFIG_ARCH_MESON) +=3D =
meson-gxm-ugoos-am3.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxm-vega-s96.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxm-wetek-core2.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-s4-s805x2-aq222.dtb
> +dtb-$(CONFIG_ARCH_MESON) +=3D meson-s4-s905w2-x98q.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-s4-s905y4-khadas-vim1s.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-sm1-a95xf3-air-gbit.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-sm1-a95xf3-air.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts =
b/arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
> index 000000000000..3eecbc858522
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
> @@ -0,0 +1,249 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2026 Christian Stefan K=C3=B6ver-Draxl
> + * Based on meson-s4-s905y4-khadas-vim1s.dts:
> + *  - Copyright (c) 2026 Khadas Technology Co., Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-s4.dtsi"
> +
> +/ {
> + model =3D "Shenzhen Amediatech Technology Co., Ltd X98Q";
> + compatible =3D "amediatech,x98q", "amlogic,s905w2", "amlogic,s4";
> + interrupt-parent =3D <&gic>;
> + #address-cells =3D <2>;
> + #size-cells =3D <2>;
> +
> + aliases {
> + mmc0 =3D &emmc; /* eMMC */
> + mmc1 =3D &sd; /* SD card */
> + mmc2 =3D &sdio; /* SDIO */
> + serial0 =3D &uart_b;
> + };
> +
> + memory@0 {
> + device_type =3D "memory";
> + reg =3D <0x0 0x0 0x0 0x40000000>;
> + };
> +
> + reserved-memory {
> + #address-cells =3D <2>;
> + #size-cells =3D <2>;
> + ranges;
> +
> + /* 52 MiB reserved for ARM Trusted Firmware */
> + secmon_reserved: secmon@5000000 {
> + reg =3D <0x0 0x05000000 0x0 0x3400000>;
> + no-map;
> + };
> + };
> +
> + emmc_pwrseq: emmc-pwrseq {
> + compatible =3D "mmc-pwrseq-emmc";
> + reset-gpios =3D <&gpio GPIOB_9 GPIO_ACTIVE_LOW>;
> + };
> +
> + sdio_32k: sdio-32k {
> + compatible =3D "pwm-clock";
> + #clock-cells =3D <0>;
> + clock-frequency =3D <32768>;
> + pwms =3D <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
> + };
> +
> + sdio_pwrseq: sdio-pwrseq {
> + compatible =3D "mmc-pwrseq-simple";
> + reset-gpios =3D <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> + clocks =3D <&sdio_32k>;
> + clock-names =3D "ext_clock";
> + };
> +
> + main_5v: regulator-main-5v {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "5V";
> + regulator-min-microvolt =3D <5000000>;
> + regulator-max-microvolt =3D <5000000>;
> + regulator-always-on;
> + };
> +
> + sd_3v3: regulator-sd-3v3 {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "SD_3V3";
> + regulator-min-microvolt =3D <3300000>;
> + regulator-max-microvolt =3D <3300000>;
> + gpio =3D <&gpio GPIOD_4 GPIO_ACTIVE_LOW>;
> + regulator-always-on;
> + };
> +
> + vddio_sd: regulator-vddio-sd {
> + compatible =3D "regulator-gpio";
> + regulator-name =3D "VDDIO_SD";
> + regulator-min-microvolt =3D <1800000>;
> + regulator-max-microvolt =3D <3300000>;
> + gpios =3D <&gpio GPIOD_9 GPIO_ACTIVE_HIGH>;
> + gpios-states =3D <1>;
> + states =3D <1800000 1 3300000 0>;
> + };
> +
> + vddao_3v3: regulator-vddao-3v3 {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "VDDAO_3V3";
> + regulator-min-microvolt =3D <3300000>;
> + regulator-max-microvolt =3D <3300000>;
> + vin-supply =3D <&main_5v>;
> + regulator-always-on;
> + };
> +
> + vddio_ao1v8: regulator-vddio-ao1v8 {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "VDDIO_AO1V8";
> + regulator-min-microvolt =3D <1800000>;
> + regulator-max-microvolt =3D <1800000>;
> + vin-supply =3D <&vddao_3v3>;
> + regulator-always-on;
> + };
> +
> + /* SY8120B1ABC DC/DC Regulator. */
> + vddcpu: regulator-vddcpu {
> + compatible =3D "pwm-regulator";
> +
> + regulator-name =3D "VDDCPU";
> + regulator-min-microvolt =3D <689000>;
> + regulator-max-microvolt =3D <1049000>;
> +
> + vin-supply =3D <&main_5v>;
> +
> + pwms =3D <&pwm_ij 1 1500 0>;
> + pwm-dutycycle-range =3D <100 0>;
> +
> + regulator-boot-on;
> + regulator-always-on;
> + /* Voltage Duty-Cycle */
> + voltage-table =3D <1049000 0>,
> + <1039000 3>,
> + <1029000 6>,
> + <1019000 9>,
> + <1009000 12>,
> + <999000 14>,
> + <989000 17>,
> + <979000 20>,
> + <969000 23>,
> + <959000 26>,
> + <949000 29>,
> + <939000 31>,
> + <929000 34>,
> + <919000 37>,
> + <909000 40>,
> + <899000 43>,
> + <889000 45>,
> + <879000 48>,
> + <869000 51>,
> + <859000 54>,
> + <849000 56>,
> + <839000 59>,
> + <829000 62>,
> + <819000 65>,
> + <809000 68>,
> + <799000 70>,
> + <789000 73>,
> + <779000 76>,
> + <769000 79>,
> + <759000 81>,
> + <749000 84>,
> + <739000 87>,
> + <729000 89>,
> + <719000 92>,
> + <709000 95>,
> + <699000 98>,
> + <689000 100>;
> + };
> +};
> +
> +&emmc {
> + status =3D "okay";
> + pinctrl-0 =3D <&emmc_pins>, <&emmc_ds_pins>;
> + pinctrl-1 =3D <&emmc_clk_gate_pins>;
> + pinctrl-names =3D "default", "clk-gate";
> +
> + bus-width =3D <8>;
> + cap-mmc-highspeed;
> + mmc-ddr-1_8v;
> + mmc-hs200-1_8v;
> + max-frequency =3D <200000000>;
> + non-removable;
> + disable-wp;
> +
> + mmc-pwrseq =3D <&emmc_pwrseq>;
> + vmmc-supply =3D <&vddao_3v3>;
> + vqmmc-supply =3D <&vddio_ao1v8>;
> +};
> +
> +&ethmac {
> + status =3D "okay";
> + phy-handle =3D <&internal_ephy>;
> + phy-mode =3D "rmii";
> +};
> +
> +&ir {
> + status =3D "okay";
> + pinctrl-0 =3D <&remote_pins>;
> + pinctrl-names =3D "default";
> +};
> +
> +&pwm_ef {
> + status =3D "okay";
> + pinctrl-0 =3D <&pwm_e_pins1>;
> + pinctrl-names =3D "default";
> +};
> +
> +&pwm_ij {
> + status =3D "okay";
> +};
> +
> +&sd {
> + status =3D "okay";
> + pinctrl-0 =3D <&sdcard_pins>;
> + pinctrl-1 =3D <&sdcard_clk_gate_pins>;
> + pinctrl-names =3D "default", "clk-gate";
> + bus-width =3D <4>;
> + cap-sd-highspeed;
> + max-frequency =3D <50000000>;
> + disable-wp;
> +
> + cd-gpios =3D <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
> +
> + vmmc-supply =3D <&vddao_3v3>;
> + vqmmc-supply =3D <&vddao_3v3>;
> +};
> +
> +     /*
> +      * Wireless SDIO Module (Amlogic W150S1)
> +      * Note: There is no driver for this at the moment.
> +      */

^ drop this comment

> +
> +&sdio {
> + status =3D "okay";
> + pinctrl-0 =3D <&sdio_pins>;
> + pinctrl-1 =3D <&sdio_clk_gate_pins>;
> + pinctrl-names =3D "default", "clk-gate";
> + #address-cells =3D <1>;
> + #size-cells =3D <0>;
> + bus-width =3D <4>;
> + cap-sd-highspeed;
> + sd-uhs-sdr50;
> + sd-uhs-sdr104;
> + max-frequency =3D <200000000>;
> + non-removable;
> + disable-wp;
> +
> + no-sd;
> + no-mmc;
> + mmc-pwrseq =3D <&sdio_pwrseq>;
> + vmmc-supply =3D <&vddao_3v3>;
> + vqmmc-supply =3D <&vddio_ao1v8>;

	sdio: wifi@1 {
		/* Amlogic W150S1 */
		reg =3D <1>;
  	};

^ add this to generically describe the hardware without
the need for a specific compatible (as done in several of
the Amlogic reference designs where we cannot guarantee
which chipset is used). The reg value should be enough to
result in the downstream driver probing should a distro
choose to package it; thus avoiding the need for distros
to forever carry a device-tree patch to add support (as
Amlogic have no plans to upstream the driver). Should that
ever change the comment can be replaced with a compatible.

Christian

> +};
> +
> +&uart_b {
> + status =3D "okay";
> +};
> --=20
> 2.53.0
>=20
>=20
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic



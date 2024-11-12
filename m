Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF248D32D96
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ohv0uCye1Wp5cMU+c36gYvUhO+ctt1oOs2cNDUinPY=; b=GuSnn5LK5dn+bej9sRtsXfW7sO
	MWNvgcgPoutpykg5xnT9UnMXsSIH20N8eOhF8Lja53G89eMD8daulM8m+it+eeOV22q3BNRr+lZhn
	Csz1lxWoe2hnITf7r8gCb/RNS+NlrMbCQZPnBNdGePwjAxNIGmXsFqy+q5zRhss2dOJvBusCNmq5l
	QJvlFOpJEjyf/kDNVVWr2gE8J8rEVFEexfoHRq4rb4UT50Ou20o3VBBzeSurepJmngCEIG3IahdsP
	YO0EuqFKr3LYcsvsDVZAaUfw3+SyutH5kCg5WT1lnFlqQXbd3rRAp5jTVkyxeFx7PMqzdsliEmAY5
	m33QvIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApKD-00000003GnU-00F7;
	Tue, 12 Nov 2024 11:44:50 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoLv-000000035cb-2gUi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:42:33 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5c9388a00cfso6993089a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 02:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731408149; x=1732012949; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4ohv0uCye1Wp5cMU+c36gYvUhO+ctt1oOs2cNDUinPY=;
        b=S6q65WV355jBxtjmZPgYTKLOYYa0rEjv4sEPZOsM1wtu+JRbieoZ7dzzMEwqrXEobc
         0Oxa0iojAN47UlfGZxXatHNR2adc99zkTqjmRYc9ZKXpQfQ/rmiNc2cW6pK3TinHUS9D
         Y/QsCk4ULnQ/gRBZ8PkcIfoQT91aU9pQqnFePEHvzlOSnyNNCzh0Hf95a0KyHVXBof2O
         pHapnU+5W5wqJs+iNyTRXa5x+l0maAp9C4CShySVxiMztefICYl/c/W6b/ttxGaeEDgH
         ZCjqD0Y3iv8/LR9m/hi70iNzhZh9Y9lJmugFoZY21NtFzM2pnZl86yhzfnV46aznV62y
         Usyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731408149; x=1732012949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ohv0uCye1Wp5cMU+c36gYvUhO+ctt1oOs2cNDUinPY=;
        b=MwinC6vyQ77oyL4ac+k2+wuEMTzawmeN0YxIRvHTvV2O9X2Dlc8Xu6tU+oPQtT1+ZY
         NVqq4fo5ESqj3KCocv4hQdaHFrlpyE7BvUVTywWS8D/l+EK8i/zg8f6AIX4reoJJ4BHU
         nTAhgEerUjK6sOrwYrFd545A+8xXnqWx5edx5JfOLKyzJoOBEt/Xt/hYlDEQ1FsYnNmG
         jcMq5/ZF5flv7YMuMN8gtPZXFZD0wV5c1Lh1rn3KzLjFB8D2iW8ZcvQfYPyJjgB4DkEx
         70nluZhf9Vn4Qvj/QmCA4qAx/bg7tP8DckI4DEw/GzdHU6zhu0VLr4TFFDELKPE368gf
         MPJA==
X-Forwarded-Encrypted: i=1; AJvYcCUEssgAE9wR4Q9FL3EM+wdb6rZHJzbiUA+sOJFfpTx1IgX3nAUyA+HgNvChN2Ve0gVePuKAn15s3/2e+VxLd4yJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxrNVQnA6Opg9+5GOdM0OXzRExFz1W2YGrRj7BPdi2Gyemt2hbS
	QoDZipLW36YytYCGEmMvTu6qKIIh98499Mj4BcaXJaX09xsp+aoF9oC40MDsjO07YsdVxjclzJS
	RFkAElzER/s8EvMYPn5IrU4nnacU=
X-Google-Smtp-Source: AGHT+IGK3hIEdIpZExqiPXO4zhHYYYogyfmxjo8O+3yM7bb5tHwjtMCyTQJxUWf+z/3vjfc4xETKmZOeg+W+zGoLFPA=
X-Received: by 2002:a05:6402:210f:b0:5cf:40fd:a445 with SMTP id
 4fb4d7f45d1cf-5cf40fda638mr5501970a12.6.1731408148977; Tue, 12 Nov 2024
 02:42:28 -0800 (PST)
MIME-Version: 1.0
References: <20241111162524.46812-1-codekipper@gmail.com> <20241111162524.46812-3-codekipper@gmail.com>
 <20241111172731.54154a3e@donnerap.manchester.arm.com>
In-Reply-To: <20241111172731.54154a3e@donnerap.manchester.arm.com>
From: Code Kipper <codekipper@gmail.com>
Date: Tue, 12 Nov 2024 11:42:17 +0100
Message-ID: <CAEKpxB=EE8WC6EETxJz-Qp42TchDSRTp1T+KiGMfQ4Kv9dvG1g@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: Add initial support for the
 X96Q-Pro STB
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, 
	krzk+dt@kernel.org, robh@kernel.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, wens@csie.org, macromorgan@hotmail.com, 
	jszhang@kernel.org, uwu@icenowy.me, ryan@testtoast.com, dsimic@manjaro.org, 
	mripard@kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_024231_725743_5B91E494 
X-CRM114-Status: GOOD (  33.79  )
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

On Mon, 11 Nov 2024 at 18:27, Andre Przywara <andre.przywara@arm.com> wrote:
>
> On Mon, 11 Nov 2024 17:25:06 +0100
> codekipper@gmail.com wrote:
>
> Hi Marcus,
>
> many thanks for sending this!
>
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > The X96Q-Pro is an STB based on the Allwinner H313 SoC with a SD
> > slot, 2 USB-2 ports, a 10/100M ethernet port using the SoC's
> > integrated PHY, Wifi via an sdio wifi chip, HDMI, an IR receiver,
> > a blue LED display, an audio video connector and an digital S/PDIF
> > connector.
> >
> > Add the devicetree file describing the currently supported features,
> > namely IR, LEDs, SD card, PMIC, audio codec, SPDIF and USB.
>
> This looks good on a first glance, but seems to miss the DVFS bits? So you
> would need to #include "sun50i-h616-cpu-opp.dtsi" and specify the cpu0
> power supply rail, otherwise you will be stuck at 1GHz.
Hi Andre,
thanks for the speedy review. I'll add the cpu0 rail but I can't get
the device to clock more than 1GHz. Isn't that the case with the H313
chipset?, your Tanix TX1 device doesn't reference the opp.dtsi,
although I do see from the wiki that it's clocked at 1.3GHz
>
> Or is there any issue preventing you doing this?
>
> Two more things below:
>
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >  .../dts/allwinner/sun50i-h313-x96q-pro.dts    | 176 ++++++++++++++++++
> >  2 files changed, 177 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h313-x96q-pro.dts
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> > index 00bed412ee31c..e0bcea1840c1f 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h313-x96q-pro.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus-v1.2.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-emlid-neutis-n5-devboard.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q-pro.dts b/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q-pro.dts
> > new file mode 100644
> > index 0000000000000..4427545ea143c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q-pro.dts
> > @@ -0,0 +1,176 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> > +/*
> > + */
>
> Is this missing some copyright notice here?
Ack
>
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-h616.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> > +     model = "X96Q Pro";
> > +     compatible = "amediatech,x96q-pro", "allwinner,sun50i-h616";
> > +
> > +     aliases {
> > +             serial0 = &uart0;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path = "serial0:115200n8";
> > +     };
> > +
> > +     reg_vcc5v: vcc5v {
> > +             /* board wide 5V supply directly from the DC input */
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vcc-5v";
> > +             regulator-min-microvolt = <5000000>;
> > +             regulator-max-microvolt = <5000000>;
> > +             regulator-always-on;
> > +     };
> > +
> > +     sound-spdif {
> > +             compatible = "simple-audio-card";
> > +             simple-audio-card,name = "sun50i-h616-spdif";
> > +
> > +             simple-audio-card,cpu {
> > +                     sound-dai = <&spdif>;
> > +             };
> > +
> > +             simple-audio-card,codec {
> > +                     sound-dai = <&spdif_out>;
> > +             };
> > +     };
> > +
> > +     spdif_out: spdif-out {
> > +             #sound-dai-cells = <0>;
> > +             compatible = "linux,spdif-dit";
> > +     };
> > +};
> > +
> > +&codec {
> > +     allwinner,audio-routing = "Line Out", "LINEOUT";
> > +     status = "okay";
> > +};
> > +
> > +&ehci0 {
> > +     status = "okay";
> > +};
> > +
> > +&ehci3 {
> > +     status = "okay";
> > +};
> > +
> > +&ir {
> > +     status = "okay";
> > +};
> > +
> > +&mmc0 {
> > +     vmmc-supply = <&reg_dldo1>;
> > +     cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
> > +     bus-width = <4>;
> > +     status = "okay";
> > +};
>
> Would it make sense to add the mmc1 node here, even if there is no driver
> in Linux atm for the WiFi chip? Thanks to SDIO we wouldn't need a
> compatible string, I think. This would also then allow us to describe the
> connected GPIOs.
Ack
>
> And does the box have Bluetooth?
No it doesn't just the XR819 for wifi.
I'll spin a V2 after a few days,
BR,
CK
>
> Cheers,
> Andre
>
> > +
> > +&mmc2 {
> > +     vmmc-supply = <&reg_dldo1>;
> > +     vqmmc-supply = <&reg_aldo1>;
> > +     bus-width = <8>;
> > +     non-removable;
> > +     cap-mmc-hw-reset;
> > +     mmc-ddr-1_8v;
> > +     mmc-hs200-1_8v;
> > +     status = "okay";
> > +};
> > +
> > +&ohci0 {
> > +     status = "okay";
> > +};
> > +
> > +&ohci3 {
> > +     status = "okay";
> > +};
> > +
> > +&pio {
> > +     vcc-pc-supply = <&reg_dldo1>;
> > +     vcc-pf-supply = <&reg_dldo1>;
> > +     vcc-pg-supply = <&reg_aldo1>;
> > +     vcc-ph-supply = <&reg_dldo1>;
> > +     vcc-pi-supply = <&reg_dldo1>;
> > +};
> > +
> > +&r_i2c {
> > +     status = "okay";
> > +
> > +     axp313: pmic@36 {
> > +             compatible = "x-powers,axp313a";
> > +             reg = <0x36>;
> > +             #interrupt-cells = <1>;
> > +             interrupt-controller;
> > +             interrupt-parent = <&pio>;
> > +             interrupts = <2 9 IRQ_TYPE_LEVEL_LOW>;  /* PC9 */
> > +
> > +             vin1-supply = <&reg_vcc5v>;
> > +             vin2-supply = <&reg_vcc5v>;
> > +             vin3-supply = <&reg_vcc5v>;
> > +
> > +             regulators {
> > +                     /* Supplies VCC-PLL, so needs to be always on. */
> > +                     reg_aldo1: aldo1 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt = <1800000>;
> > +                             regulator-max-microvolt = <1800000>;
> > +                             regulator-name = "vcc1v8";
> > +                     };
> > +
> > +                     /* Supplies VCC-IO, so needs to be always on. */
> > +                     reg_dldo1: dldo1 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt = <3300000>;
> > +                             regulator-max-microvolt = <3300000>;
> > +                             regulator-name = "vcc3v3";
> > +                     };
> > +
> > +                     reg_dcdc1: dcdc1 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt = <810000>;
> > +                             regulator-max-microvolt = <990000>;
> > +                             regulator-name = "vdd-gpu-sys";
> > +                     };
> > +
> > +                     reg_dcdc2: dcdc2 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt = <810000>;
> > +                             regulator-max-microvolt = <1100000>;
> > +                             regulator-name = "vdd-cpu";
> > +                     };
> > +
> > +                     reg_dcdc3: dcdc3 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt = <1100000>;
> > +                             regulator-max-microvolt = <1100000>;
> > +                             regulator-name = "vdd-dram";
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&spdif {
> > +     status = "okay";
> > +};
> > +
> > +&uart0 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&uart0_ph_pins>;
> > +     status = "okay";
> > +};
> > +
> > +&usbotg {
> > +     dr_mode = "host";       /* USB A type receptable */
> > +     status = "okay";
> > +};
> > +
> > +&usbphy {
> > +     status = "okay";
> > +};
>
> d


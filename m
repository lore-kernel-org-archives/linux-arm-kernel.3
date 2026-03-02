Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5CCD58E47
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 01:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csqWNZc7MOWU3Q/vKP3aP8YbOwKwOKh/dbey5zxtLKs=; b=J0t6fhS2wdr9NZ735wOij/VVHX
	yKFRbsSkoPozKi4/bgqu29sX31reOOdyXaZeH8L/B40ERYNo/G3bgZzlm1lwJGZJoDIK66qRzNWIg
	nBz8dnAbcWZk3mczaspu2UtmoPiMRlku6FRMGiOCRI9CzLdHWZyL/EKyvYhptQXROGQEK7+VcPKcK
	tf6Ko2DQ7m7gGO2IHnwlfM6SZTd/QptXVBKebeP7QlKEbBQ7uqHLW0lG9XN0jsbmycflHxTRhAcDO
	UeTA26EU/6pgU+muugVoO36nTiSOMC2dGQfmJlYR9Xqv18pjXDj4n7dJMyLnxAXupkgqNXPghK7yR
	JoVu9PZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsP6-0000000C51j-2BlF;
	Mon, 02 Mar 2026 01:49:00 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsP3-0000000C51K-2xRz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 01:48:59 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso33403265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 17:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772416136; x=1773020936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csqWNZc7MOWU3Q/vKP3aP8YbOwKwOKh/dbey5zxtLKs=;
        b=mN0KriME7jAf6U+RZaxyywm7WtjXcm/0QrQx89eO+WiForvyKyXptN+r6l67de/uT9
         gp79RMKPwbvdlcBL4oQrTbmuEJUKkWnDA2V8scRRhzaaWtDp1WsoT4nhhi/WD5MoizJ4
         p/yUvH2SLJHtfDyfgqsVxLe4+SvyCgSZDIkRE0EawdZygkeUR6ZMz1HV4e/HuL5yFY9b
         chZWFDxWWBtL9hWLgD++TC8GhQIXh8HBqfvpusA0eXiX6F7ju71YPdrL8ZKeKvL2ZTWb
         +4/TCewW41GVVyK4HmmymIXZiCzItes3pPcpxqB6DS4PtrPaymeBUT+Jdj+lqzaYN9tB
         VEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772416136; x=1773020936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=csqWNZc7MOWU3Q/vKP3aP8YbOwKwOKh/dbey5zxtLKs=;
        b=MOmPZH5SX1VU1Ls5MFpqy4Iw1lEDjyHVwsFoUmeFU+tQtoEucSFh8GpgxlqbDacCHh
         X3YF4jtOH06ws0XhEms1lZ0QyoKV29t9rI4ktZti1WPR8j59zSi+VtTwCMDPyBW8mAQO
         ZZSYUWU7GoErvhitiWwMO2SXl7fS77YWqSKVAl2DhdnNVI+NW9IwQidiVwfpx+ygh9tO
         ao5QzXDn3NVSdeZ3dSyVF1NbvdssqEY54jgGb5a9Z/Z5krck8O4wBpJbUIGRWbWAUH9T
         ZfCOZD8iqR/aK8nHfQLEuYIAq9ZbUpgMYEzLaKVDSjMYZjiEC0m5qW9UDQDJWleTwZYP
         xcgA==
X-Forwarded-Encrypted: i=1; AJvYcCXYnQsg5T2mMSVe5y3qp+KnLdUlDKV/Tfjj6PpTUERTPaleyUBdssSFIM27uEYh8BNg60B/9tYQwBMmgBOTQ3nF@lists.infradead.org
X-Gm-Message-State: AOJu0YxO5sXKmtDbGKysOzS9pSY6EGdebRcGEE9RlsAVRHqpfmqcneg5
	3POu+jx0vUTK9cO0z5O3dsBJDtoeFNi+h86LUk8wtjTUQ9TzHFTu/Xkb
X-Gm-Gg: ATEYQzx1L3gD2fCsgDwkOuqYZtRPam2hP5qZQwl28i8tHf7x+PxmRVyk+4uqF08X/b/
	NKCuTFb8f8nwULvR43t27iiGjmtIK3YdTLc6akKFb4IbZSvdNKx1GURH1vEb2zIO7oprNWpyLw/
	gFXnf9Zkx1DaJfOx2/+IRFzsHCfNRrJZZw65qL9aakT0NVcRIKNW5pixlNRLDcE6x3YvJLLWxlR
	nYqO1+b+ydPLLPPvYPK7GJakvEQo7lvOgqkHXYQuXSMpUGZvws0jZrHKYRZEgJmkSK+2FgOZeIY
	WiCPnPDKh8XsoCzZqXebvxa95gLQLL//ONFzBVR7TuTO22S/QChEuzfL6joFH9jwdRKUIZ/6qdl
	EfDkGJPkV3HSqysol+VtmEpB9iaxvA08bNZjzDUQNgOMou/G2c6VVAKQ6qGSVXoYdh1PYA6dd/Q
	gisyyFgO9lZlSTChgYuf6d
X-Received: by 2002:a05:600c:828c:b0:483:8f0f:36fe with SMTP id 5b1f17b1804b1-483c9bb0c9fmr180731015e9.1.1772416135296;
        Sun, 01 Mar 2026 17:48:55 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a55:9af1::1002])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd765604sm324969305e9.15.2026.03.01.17.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 17:48:54 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: andre.przywara@arm.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	mripard@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support
Date: Mon,  2 Mar 2026 09:48:46 +0800
Message-ID: <20260302014846.79096-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260301225413.76b0508e@ryzen.lan>
References: <20260301225413.76b0508e@ryzen.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_174857_827223_FA75741F 
X-CRM114-Status: GOOD (  36.14  )
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

Hi,
> On Fri, 27 Feb 2026 23:58:00 +0800
> Jun Yan <jerrysteve1101@gmail.com> wrote:
> 
> Hi,
> 
> > TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
> > equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
> > WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
> > one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
> > infrared input.
> 
> Many thanks for sending this upstream, this looks very good overall,
> only some small things below...
>  
> > It was released by Ultrapower(UQSoft) as a blockchain-based terminal and is
> > now discontinued and no longer supported.
> > 
> >   https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
> > 
> > Hardware schematics are not available at this time; however, the
> > dts from the vendor firmware is provided for reference [1].
> > 
> > Based on the PCB silkscreen marking "AZW-KT02 2.0", the ODM/OEM
> > can be confirmed as AZW, and the overall hardware circuit design
> > is highly similar to the Beelink GS1.
> > 
> > Tested, works:
> > - debug UART
> > - status LED
> > - USB 3.0 Type-A port
> > - USB 2.0 Type-A port
> > - Micro USB port (Host)
> > - MicroSD
> > - eMMC
> > - WiFi/Bluetooth
> > - HDMI video output
> > 
> > Does not work:
> > - Ethernet (requires AC200 MFD/EPHY driver)
> > - HDMI audio
> > 
> > Untested:
> > - SPDIF
> > - IR receiver
> > 
> > [1] https://archive.org/download/tqc-a01-stock-fw/tqc-a01-stock-fw.dts
> > 
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >  .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 361 ++++++++++++++++++
> >  2 files changed, 362 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> > index 2edfa7bf4ab3..d116864b6c2b 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -38,6 +38,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-lite2.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-one-plus.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64-model-b.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-taiqicat-a01.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6-mini.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h313-tanix-tx1.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> > new file mode 100644
> > index 000000000000..381479553f5f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> > @@ -0,0 +1,361 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +// Copyright (C) 2026 Jun Yan <jerrysteve1101@gmail.com>
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-h6.dtsi"
> > +#include "sun50i-h6-cpu-opp.dtsi"
> > +#include "sun50i-h6-gpu-opp.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +	model = "TaiqiCat (TQC) A01";
> > +	compatible = "ultrapower,taiqicat-a01", "allwinner,sun50i-h6";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +		serial1 = &uart1;
> 
> I don't think we need the serial1 alias? Bluetooth should work even
> without knowing the ttyS<x> device name, shouldn't it?
> 
> But you should add an alias for the WiFi (ethernet0 = &brcm;), so that
> U-Boot assigns an ideally unique MAC address.
> 
> The rest looks correct, from a pure upstream DT perspective, and by
> comparing it to other H6 .dts files, even though I cannot test it, of
> course. But I trust you that those things you mentioned work.

Thank you for the review. 

I will implement the changes you suggested in PATCH v3:
1. drop the serial1 alias
2. add an ethernet0 alias for WiFi.

Best regards,
Jun Yan
> 
> So with the aliases changed:
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> 
> Cheers,
> Andre
> 
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +
> > +	connector {
> > +		compatible = "hdmi-connector";
> > +		ddc-en-gpios = <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
> > +		type = "a";
> > +
> > +		port {
> > +			hdmi_con_in: endpoint {
> > +				remote-endpoint = <&hdmi_out_con>;
> > +			};
> > +		};
> > +	};
> > +
> > +	ext_osc32k: ext-osc32k-clk {
> > +		#clock-cells = <0>;
> > +		compatible = "fixed-clock";
> > +		clock-frequency = <32768>;
> > +		clock-output-names = "ext_osc32k";
> > +	};
> > +
> > +	leds {
> > +		compatible = "gpio-leds";
> > +
> > +		led-0 {
> > +			label = "taiqicat:blue:power";
> > +			gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
> > +			default-state = "on";
> > +		};
> > +	};
> > +
> > +	reg_vcc5v: vcc5v {
> > +		/* board wide 5V supply directly from the DC jack */
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vcc-5v";
> > +		regulator-min-microvolt = <5000000>;
> > +		regulator-max-microvolt = <5000000>;
> > +		regulator-always-on;
> > +	};
> > +
> > +	sound-spdif {
> > +		compatible = "simple-audio-card";
> > +		simple-audio-card,name = "sun50i-h6-spdif";
> > +
> > +		simple-audio-card,cpu {
> > +			sound-dai = <&spdif>;
> > +		};
> > +
> > +		simple-audio-card,codec {
> > +			sound-dai = <&spdif_out>;
> > +		};
> > +	};
> > +
> > +	spdif_out: spdif-out {
> > +		#sound-dai-cells = <0>;
> > +		compatible = "linux,spdif-dit";
> > +	};
> > +
> > +	wifi_pwrseq: wifi-pwrseq {
> > +		compatible = "mmc-pwrseq-simple";
> > +		clocks = <&rtc CLK_OSC32K_FANOUT>;
> > +		clock-names = "ext_clock";
> > +		reset-gpios = <&r_pio 0 8 GPIO_ACTIVE_LOW>; /* PL8 */
> > +		post-power-on-delay-ms = <200>;
> > +	};
> > +};
> > +
> > +&cpu0 {
> > +	cpu-supply = <&reg_dcdca>;
> > +};
> > +
> > +&de {
> > +	status = "okay";
> > +};
> > +
> > +&dwc3 {
> > +	status = "okay";
> > +};
> > +
> > +&ehci0 {
> > +	status = "okay";
> > +};
> > +
> > +&ehci3 {
> > +	status = "okay";
> > +};
> > +
> > +&gpu {
> > +	mali-supply = <&reg_dcdcc>;
> > +	status = "okay";
> > +};
> > +
> > +&hdmi {
> > +	hvcc-supply = <&reg_bldo2>;
> > +	status = "okay";
> > +};
> > +
> > +&hdmi_out {
> > +	hdmi_out_con: endpoint {
> > +		remote-endpoint = <&hdmi_con_in>;
> > +	};
> > +};
> > +
> > +&mmc0 {
> > +	vmmc-supply = <&reg_cldo1>;
> > +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> > +	bus-width = <4>;
> > +	disable-wp;
> > +	status = "okay";
> > +};
> > +
> > +&mmc1 {
> > +	vmmc-supply = <&reg_cldo3>;
> > +	vqmmc-supply = <&reg_bldo3>;
> > +	mmc-pwrseq = <&wifi_pwrseq>;
> > +	bus-width = <4>;
> > +	non-removable;
> > +	keep-power-in-suspend;
> > +	status = "okay";
> > +
> > +	brcm: sdio-wifi@1 {
> > +		reg = <1>;
> > +		compatible = "brcm,bcm43430a1-fmac", "brcm,bcm4329-fmac";
> > +		interrupt-parent = <&r_pio>;
> > +		interrupts = <1 0 IRQ_TYPE_LEVEL_LOW>; /* PM0 */
> > +		interrupt-names = "host-wake";
> > +	};
> > +};
> > +
> > +&mmc2 {
> > +	vmmc-supply = <&reg_cldo1>;
> > +	vqmmc-supply = <&reg_bldo2>;
> > +	cap-mmc-hw-reset;
> > +	non-removable;
> > +	mmc-hs200-1_8v;
> > +	bus-width = <8>;
> > +	status = "okay";
> > +};
> > +
> > +&ohci0 {
> > +	status = "okay";
> > +};
> > +
> > +&ohci3 {
> > +	status = "okay";
> > +};
> > +
> > +&pio {
> > +	vcc-pc-supply = <&reg_bldo2>;
> > +	vcc-pd-supply = <&reg_cldo1>;
> > +	vcc-pg-supply = <&reg_bldo3>;
> > +};
> > +
> > +&r_i2c {
> > +	status = "okay";
> > +
> > +	axp805: pmic@36 {
> > +		compatible = "x-powers,axp805", "x-powers,axp806";
> > +		reg = <0x36>;
> > +		interrupt-parent = <&r_intc>;
> > +		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
> > +		interrupt-controller;
> > +		#interrupt-cells = <1>;
> > +		x-powers,self-working-mode;
> > +		vina-supply = <&reg_vcc5v>;
> > +		vinb-supply = <&reg_vcc5v>;
> > +		vinc-supply = <&reg_vcc5v>;
> > +		vind-supply = <&reg_vcc5v>;
> > +		vine-supply = <&reg_vcc5v>;
> > +		aldoin-supply = <&reg_vcc5v>;
> > +		bldoin-supply = <&reg_vcc5v>;
> > +		cldoin-supply = <&reg_vcc5v>;
> > +
> > +		regulators {
> > +			reg_aldo1: aldo1 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt = <3300000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-name = "vcc-pl-led-ir-pg-pm-ts";
> > +			};
> > +
> > +			reg_aldo2: aldo2 {
> > +				regulator-min-microvolt = <3300000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-name = "vcc-ac200";
> > +				regulator-enable-ramp-delay = <100000>;
> > +			};
> > +
> > +			aldo3 {
> > +				/* unused */
> > +			};
> > +
> > +			reg_bldo1: bldo1 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <1800000>;
> > +				regulator-name = "vcc18-dram-bias-pll";
> > +			};
> > +
> > +			reg_bldo2: bldo2 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <1800000>;
> > +				regulator-name = "vcc-pc-emmc-efuse-hdmi";
> > +			};
> > +
> > +			reg_bldo3: bldo3 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <1800000>;
> > +				regulator-name = "vcc-pg-wifiio";
> > +			};
> > +
> > +			bldo4 {
> > +				/* unused */
> > +			};
> > +
> > +			reg_cldo1: cldo1 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt = <3300000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-name = "vcc33-io-pd-emmc-sd-usb-uart";
> > +			};
> > +
> > +			/* This regulator is connected with CLDO3 */
> > +			reg_cldo2: cldo2 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt = <3300000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-name = "vcc-wifi-1";
> > +			};
> > +
> > +			reg_cldo3: cldo3 {
> > +				regulator-min-microvolt = <3300000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-name = "vcc-wifi-2";
> > +			};
> > +
> > +			reg_dcdca: dcdca {
> > +				regulator-always-on;
> > +				regulator-min-microvolt = <810000>;
> > +				regulator-max-microvolt = <1160000>;
> > +				regulator-ramp-delay = <2500>;
> > +				regulator-name = "vdd-cpu";
> > +			};
> > +
> > +			reg_dcdcc: dcdcc {
> > +				regulator-enable-ramp-delay = <32000>;
> > +				regulator-min-microvolt = <810000>;
> > +				regulator-max-microvolt = <1080000>;
> > +				regulator-ramp-delay = <2500>;
> > +				regulator-name = "vdd-gpu";
> > +			};
> > +
> > +			reg_dcdcd: dcdcd {
> > +				regulator-always-on;
> > +				regulator-min-microvolt = <960000>;
> > +				regulator-max-microvolt = <960000>;
> > +				regulator-name = "vdd-sys-hdmi-usb";
> > +			};
> > +
> > +			reg_dcdce: dcdce {
> > +				regulator-always-on;
> > +				regulator-min-microvolt = <1200000>;
> > +				regulator-max-microvolt = <1200000>;
> > +				regulator-name = "vcc-dram";
> > +			};
> > +
> > +			sw {
> > +				/* unused */
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&r_ir {
> > +	status = "okay";
> > +};
> > +
> > +&r_pio {
> > +	/*
> > +	 * PL0 and PL1 are used for PMIC I2C
> > +	 * don't enable the pl-supply else
> > +	 * it will fail at boot
> > +	 *
> > +	 * vcc-pl-supply = <&reg_aldo1>;
> > +	 */
> > +	vcc-pm-supply = <&reg_aldo1>;
> > +};
> > +
> > +&rtc {
> > +	clocks = <&ext_osc32k>;
> > +};
> > +
> > +&spdif {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&spdif_tx_pin>;
> > +	status = "okay";
> > +};
> > +
> > +&uart0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&uart0_ph_pins>;
> > +	status = "okay";
> > +};
> > +
> > +&uart1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
> > +	uart-has-rtscts;
> > +	status = "okay";
> > +
> > +	bluetooth {
> > +		compatible = "brcm,bcm43430a1-bt";
> > +		clocks = <&rtc CLK_OSC32K_FANOUT>;
> > +		clock-names = "lpo";
> > +		vbat-supply = <&reg_cldo3>;
> > +		vddio-supply = <&reg_bldo3>;
> > +		device-wakeup-gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
> > +		host-wakeup-gpios = <&r_pio 1 1 GPIO_ACTIVE_HIGH>; /* PM1 */
> > +		shutdown-gpios = <&r_pio 1 4 GPIO_ACTIVE_HIGH>; /* PM4 */
> > +		max-speed = <1500000>;
> > +	};
> > +};
> > +
> > +&usb2otg {
> > +	dr_mode = "host";
> > +	status = "okay";
> > +};
> > +
> > +&usb2phy {
> > +	usb0_vbus-supply = <&reg_vcc5v>;
> > +	usb3_vbus-supply = <&reg_vcc5v>;
> > +	status = "okay";
> > +};
> > +
> > +&usb3phy {
> > +	status = "okay";
> > +};




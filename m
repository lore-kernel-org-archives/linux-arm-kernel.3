Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A83C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ro54w7H8jC6p+K00CHwfdPRGov797nGcof5Jb8mK1zs=; b=zr/hKjO1XZnepYPQ6ymqcEN2Lo
	+amiqxvyHNstHCdHoLjkmtoKiaf+J4NKo0OZ6G1UcS2EtpW+rz+xokaIuc3W1CSvv4J3/RMcWszmL
	zWT3WdebFzI3soY9pMIA8tVmqOFR6fs5qYskSHUlN/0lw4mypiE3OCBdNha09qtqt5AJxYBsbYKwx
	/4Ey7ztBzzVo0bhQd41HCyroP5jKIDiapWujB1+Wp3wJEneIYWOX0U5nVaa1hpXMxK8cRrny2Ra8V
	WWm81pwMqpM7YrjE36ugCEIyxUx0QAmf1T2Hf0ZzM3PxG3W/OWQjh8RBJ8MPN9DSl8pTaaVo4Fmcz
	0Ty82x4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bre-0000000F6RN-16jE;
	Fri, 18 Sep 2026 16:55:06 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7brb-0000000F6PO-1Gcv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:55:04 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso927353a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750502; x=1790355302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ro54w7H8jC6p+K00CHwfdPRGov797nGcof5Jb8mK1zs=;
        b=a+ziwyqQ1a61txxUFrZxaNY9RD5eZptEk1uK5N3qsPoHt7GKWiXpmeO26GOjKEmFgp
         09+d2y/W+4vlLz5Tx165kyvzlcmrBCTRzqVEoPVUbJJcmhJ6EG1Tr5mYp8R9zXkyGej2
         LKXAfrcnbKUXY1YP1K8NnFAXqlyCc+K/diHBMgNlFQRv0Lv53YrbSMc6VxJG3Ky9Jipr
         /sycEIlBiQgNGe9pJbh4emTBo97ypeXSWZWhye7EqZyr1KEE9pvuBo3ontCyUqL0j/so
         wigqKH8uNKjon4xRWKFSXJeJXCUj9ovvhh71peAl4EUDPjCYiY4c3a+v9V7cPbKjh/cf
         ZvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750502; x=1790355302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ro54w7H8jC6p+K00CHwfdPRGov797nGcof5Jb8mK1zs=;
        b=b2VW4hzigTazzhNmkGpWEloh4R9OenZkGr7OlWzu+6rq/Lmu0J46XFaD82ByhFE5z2
         b6vKswJNXJiSUF2RjDnKrfyYEy6iexrUcTehjEv0EiCGLNMIqh2FDFA6f5JhD5GHEael
         ztxYUOqpwL9UZTliXH4jof0yojYG6yobN13CKB2XpioMzHWPfFP1j1SajHDn+3ZY5v8N
         p25qHyESzTTsBD95jlRuiFt33hFSqtTsZdurnUrNji751Z7eBrNEbZIXVBt3pevUXpWC
         Nis3ghpsG8D+u5omwr8zi6pycbU3KBWSQZFKuWWDgAnV4K5zvw5KpP32efr/kJcv/5iS
         LyCQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9dj8zC3mHUAIeY/tRTyzsQP8kHBsqeAh4powAb9Xrw/Ry1Kt1G+bNiC8DjXrMeVISjHv7/FMSSXC8kHJZIqbE@lists.infradead.org
X-Gm-Message-State: AFuF++mV1QDti4h71/BZw1dVY+4uVuP9zBGS4nXCoXxDtuj+p2yLtu90
	g6QhMywAiyDaq1jqI1A0UqavhPimIzmnBfJabfddcFSmBJzGjnLlSZkIsu3Dj6hf
X-Gm-Gg: AYBFou15VtFu4pstGoBIr8XzaOJLhXZ1Up7CsVL/tpsv5RfrCvVs8VJ3YGgBQjfFZCB
	hpk1+OITnT4reDrBKOucRuJAiX31rwtqC5rSYBegUV98bR45oiVyZd3YMP182ASG8pb+81MCajD
	d/QcDJ9afo2YesKncADkuMcTz9o8wtfd6VF9BH3dLN/8r8/d7aWnAuW30dyGM/I8tgQFa7zmMbz
	XlKBjg8RC9Xcdg8IkD5089rhmVfZxEK2kYmw3qsb7EvEmu7XyvTFwey7d0E532Y1vej9CcMKUZ1
	r1JUNjyVvJPbSik1wKYyo4NOFmZ6+I8zwcOVTb+IDV01rzOAMjDUfH7JO8x4fOuxRlGaINsUICJ
	LMDhwWOsBCwenBjjnZTessn/b2ZwUmstsew5bqv5+Zm8BfqGPasgvzXOZri4mTNaQ3St/lPXc3c
	SNUCCiS/dlwxxNXH+ThCYu0DC5giGSOMDPYzGTns9DEqfe2MdHLquy9ZD6+OANJto=
X-Received: by 2002:a17:90b:398c:b0:39e:1c2c:1d4b with SMTP id 98e67ed59e1d1-39e54bcd0a9mr6865180a91.11.1789750502131;
        Fri, 18 Sep 2026 09:55:02 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm240270a91.13.2026.09.18.09.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:55:01 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 4/4] arm64: dts: allwinner: add Teclast P85T tablet
Date: Sat, 19 Sep 2026 00:54:14 +0800
Message-ID: <20260918165414.1129076-5-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918165414.1129076-1-iuncuim@gmail.com>
References: <20260918165414.1129076-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_095503_442388_498F6D39 
X-CRM114-Status: GOOD (  20.17  )
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

The Teclast P85T is an 8-inch tablet that was announced in 2023
based on the Allwinner A523 (sun55i) SoC.

Hardware summary:
  - Allwinner A523, 8x Cortex-A55 (2 clusters)
  - 4 GiB LPDDR3 DRAM
  - 64 GiB eMMC
  - microSD card slot
  - AXP717 and AXP323 PMICs
  - USB-C port wired to the USB2 OTG controller
  - combined WiFi and Bluetooth module based on AIC8800 (SDIO+UART)
  - 800x1280 MIPI-DSI panel (not supported in mainline yet)
  - Silead GSL1680 touchscreen
  - MiraMEMS DA280 accelerometer
  - AXP717 battery/charger
  - USB-C OTG port (also for charging)
  - secure boot, but takes any key

This initial submission enables only what mainline supports today:
both PMICs, battery/charger, GPU (Panfrost), eMMC, SD card,
SDIO WiFi (can be used with out of tree driver), USB device (without
otg function), UART0 console, UART1 Bluetooth, I2C0 touchscreen, I2C1
accelerometer and the RTC with the external 32 kHz oscillator.

Display (DE/TCON/DSI), PWM backlight, audio codec, camera (CSI/VIN)
and LRADC keys are deliberately left out, as those blocks are
not supported in mainline yet.

The tablet uses secure boot, so it needs a signed TOC0 wrapped image to
boot, but it has no key hash burnt into the efuses, so it accepts an
image signed with any key. U-Boot support in progress.

Later, a tablet with an Allwinner A537 processor and 3 GB of DRAM was
released under the same name. This version is not supported by mainline.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun55i-a523-teclast-p85t.dts    | 420 ++++++++++++++++++
 2 files changed, 421 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index aa21f58a4..7025ba959 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -63,6 +63,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-2024.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-h.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-sp.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a523-teclast-p85t.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts b/arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts
new file mode 100644
index 000000000..38a9c98ec
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts
@@ -0,0 +1,420 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (C) 2026 Mikhail Kalashnikov <iuncuim@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "sun55i-a523.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Teclast P85T";
+	compatible = "teclast,p85t", "allwinner,sun55i-a523";
+	chassis-type = "tablet";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	battery: battery {
+		compatible = "simple-battery";
+		constant-charge-current-max-microamp = <800000>;
+		voltage-max-design-microvolt = <4400000>;
+		charge-full-design-microamp-hours = <5000000>;
+		energy-full-design-microwatt-hours = <19250000>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	ext_osc32k: ext-osc32k-clk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "ext_osc32k";
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&axp717_adc 3>, /* vsys_v */
+			      <&axp717_adc 4>; /* pmic_temp */
+	};
+
+	reg_vcc5v: vcc5v {
+		/* board wide 5V supply from the USB-C connector */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	reg_pio18: pio-18 {
+		compatible = "regulator-fixed";
+		regulator-name = "pio-18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_vmmc1: vmmc1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-wifi";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_aldo3>;
+		gpio = <&r_pio 0 7 GPIO_ACTIVE_HIGH>;	/* PL7 */
+		enable-active-high;
+	};
+
+	wifi_pwrseq: pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&r_pio 1 1 GPIO_ACTIVE_LOW>; /* PM1 */
+		post-power-on-delay-ms = <200>;
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@40 {
+		compatible = "silead,gsl1680";
+		reg = <0x40>;
+		interrupt-parent = <&pio>;
+		interrupts = <7 9 IRQ_TYPE_EDGE_FALLING>; /* PH9 */
+		power-gpios = <&pio 7 10 GPIO_ACTIVE_HIGH>; /* PH10 */
+		touchscreen-size-x = <1786>;
+		touchscreen-size-y = <1128>;
+		touchscreen-inverted-y;
+		touchscreen-swapped-x-y;
+		silead,max-fingers = <5>;
+		avdd-supply = <&reg_cldo2>;
+	};
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+
+	accelerometer@26 {
+		compatible = "miramems,da280";
+		reg = <0x26>;
+		interrupt-parent = <&pio>;
+		interrupts = <7 11 IRQ_TYPE_LEVEL_LOW>; /* PH11 */
+	};
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_cldo3>;
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
+	bus-width = <4>;
+	status = "okay";
+};
+
+&mmc1 {
+	vmmc-supply = <&reg_vmmc1>;
+	vqmmc-supply = <&reg_bldo1>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	wifi@1 {
+		reg = <1>;
+		interrupt-parent = <&r_pio>;
+		interrupts = <1 0 IRQ_TYPE_LEVEL_LOW>; /* PM0 */
+		interrupt-names = "host-wake";
+	};
+};
+
+&mmc2 {
+	vmmc-supply = <&reg_cldo3>;
+	vqmmc-supply = <&reg_cldo1>;
+	bus-width = <8>;
+	non-removable;
+	cap-mmc-hw-reset;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&pio {
+	vcc-pc-supply = <&reg_pio18>;
+	vcc-pe-supply = <&reg_pio18>;
+	vcc-pf-supply = <&reg_pio18>;
+	vcc-pg-supply = <&reg_pio18>;
+};
+
+&r_i2c0 {
+	status = "okay";
+
+	axp717: pmic@34 {
+		compatible = "x-powers,axp717";
+		reg = <0x34>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+
+		vin1-supply = <&reg_vcc5v>;
+		vin2-supply = <&reg_vcc5v>;
+		vin3-supply = <&reg_vcc5v>;
+		vin4-supply = <&reg_vcc5v>;
+		aldoin-supply = <&reg_vcc5v>;
+		bldoin-supply = <&reg_vcc5v>;
+		cldoin-supply = <&reg_vcc5v>;
+
+		axp717_adc: adc {
+			compatible = "x-powers,axp717-adc";
+			#io-channel-cells = <1>;
+		};
+
+		battery-power {
+			compatible = "x-powers,axp717-battery-power-supply";
+			monitored-battery = <&battery>;
+		};
+
+		regulators {
+			/* Supplies the "little" cluster (1.0(?) GHz cores) */
+			reg_dcdc1: dcdc1 {
+				regulator-always-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1160000>;
+				regulator-name = "vdd-cpul";
+			};
+
+			reg_dcdc2: dcdc2 {
+				regulator-always-on;
+				regulator-min-microvolt = <920000>;
+				regulator-max-microvolt = <920000>;
+				regulator-name = "vdd-gpu-sys";
+			};
+
+			reg_dcdc3: dcdc3 {
+				regulator-always-on;
+				regulator-min-microvolt = <1260000>;
+				regulator-max-microvolt = <1260000>;
+				regulator-name = "vdd-dram";
+			};
+
+			reg_dcdc4: dcdc4 {
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-name = "vdd-dcdc4";
+			};
+
+			reg_aldo1: aldo1 {
+				/* camera sensor AVDD */
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-name = "avdd-csi";
+			};
+
+			reg_aldo2: aldo2 {
+				/* camera sensor IOVDD */
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "iovdd-csi";
+			};
+
+			reg_aldo3: aldo3 {
+				/* supplies the I2C pins for this PMIC and the WiFi module */
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-pl-pm";
+			};
+
+			reg_aldo4: aldo4 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-pll-dxco-avcc";
+			};
+
+			reg_bldo1: bldo1 {
+				/* WiFi module 1.8V */
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-wifi-1v8";
+			};
+
+			reg_bldo2: bldo2 {
+				/* WiFi module 1.8V */
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-wifi-1v8-b";
+			};
+
+			reg_bldo3: bldo3 {
+				/* camera sensor DVDD/cameravdd */
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-name = "vcc-csi";
+			};
+
+			reg_bldo4: bldo4 {
+				/* camera sensor DVDD */
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-name = "dvdd-csi";
+			};
+
+			reg_cldo1: cldo1 {
+				/* codec CPVIN, SD/eMMC 1.8V IO */
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-codec-sd";
+			};
+
+			reg_cldo2: cldo2 {
+				/* touch panel supply */
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-ctp";
+			};
+
+			reg_cldo3: cldo3 {
+				/* SD/eMMC VMMC, codec VDD, UART0, g-sensor */
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-io-mmc";
+			};
+
+			reg_cldo4: cldo4 {
+				/* LCD panel supply */
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-lcd";
+			};
+
+			reg_cpusldo: cpusldo {
+				/* supplies the management core */
+				regulator-always-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-name = "vdd-cpus";
+			};
+		};
+
+		usb-power {
+			compatible = "x-powers,axp717-usb-power-supply";
+			input-current-limit-microamp = <1750000>;
+		};
+	};
+
+	axp323: pmic@36 {
+		compatible = "x-powers,axp323";
+		reg = <0x36>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+
+		vin1-supply = <&reg_vcc5v>;
+		vin2-supply = <&reg_vcc5v>;
+		vin3-supply = <&reg_vcc5v>;
+
+		regulators {
+			reg_aldo1_323: aldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-aldo1-323";
+			};
+
+			reg_dldo1_323: dldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-dldo1-323";
+			};
+
+			/* Supplies the "big" cluster (1.8 GHz cores) */
+			reg_dcdc1_323: dcdc1 {
+				regulator-always-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1160000>;
+				regulator-name = "vdd-cpub";
+			};
+
+			/* DCDC2 is polyphased with DCDC1 */
+
+			reg_dcdc3_323: dcdc3 {
+				regulator-always-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-name = "vdd-dcdc3";
+			};
+		};
+	};
+};
+
+&r_pio {
+/*
+ * Specifying the supply would create a circular dependency.
+ *
+ *	vcc-pl-supply = <&reg_aldo3>;
+ */
+	vcc-pm-supply = <&reg_aldo3>;
+};
+
+&rtc {
+	clocks = <&r_ccu CLK_BUS_R_RTC>, <&osc24M>,
+		 <&r_ccu CLK_R_AHB>, <&ext_osc32k>;
+	clock-names = "bus", "hosc", "ahb", "ext-osc32k";
+	assigned-clocks = <&rtc CLK_OSC32K>;
+	assigned-clock-rates = <32768>;
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&uart1 {
+	/* Bluetooth HCI, 4-wire with RTS/CTS */
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&usb_otg {
+	/*
+	 * The USB-C port is the primary power supply; VBUS control is not
+	 * wired in mainline (AXP717 has no drivevbus), so the port can only
+	 * act as a USB device powered from the host side.
+	 */
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbphy {
+	usb0_vbus-supply = <&reg_vcc5v>;
+	status = "okay";
+};
-- 
2.55.0



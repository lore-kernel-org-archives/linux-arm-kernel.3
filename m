Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE78BCA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 02:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxg0mQeibUEA7aHAxfrcW/DbAaTwXdm7MXT8cX4qy1Y=; b=CUVSPBvo4QQLKtk9vsmTVZiIxF
	Z4dFe2iOu56ra7fZLdmYhZ6OtraVnpRt6blR1HBbQhXNPk8DKUA7gIILBrCA5gVJmmUUse3j7qTpk
	mAmoS5LxUSW70uUI6rzrvT4HGrHq0U/4k65DnQbxlKrZnwXa0hCTrWDPZ0CQ4GyAsB3Hbe3gAYRox
	mThSWS9HSp8/Uvxi3hb91411dOrtndJs+3QtXhmHSiks+FpmB1EWkbPtiqz6NVsBcMPxk7yaxKhiy
	REC7kgm+kKgAlXTe8ZZxZ4s0JUV4hWa6gP9b6mStriE6CNHLwgNCyP4f7K4ugQYuYZp2pY6qRoh10
	lY5lhFmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC6Tx-00000007bfY-2TD2;
	Thu, 01 Oct 2026 02:25:13 +0000
Received: from mail-pj2-x29.google.com ([2607:f8b0:4864:39::29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC6Tf-00000007bZE-3QyF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 02:24:57 +0000
Received: by mail-pj2-x29.google.com with SMTP id 98e67ed59e1d1-3a4eda6744bso603087a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 19:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821495; x=1791426295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zxg0mQeibUEA7aHAxfrcW/DbAaTwXdm7MXT8cX4qy1Y=;
        b=Rf9ndUR1XUjP2pFldj2K2K16nXKyhYU7nIYLwr+TPF8lISJtNFU4w2hmp+2ncK6JXU
         RbeRG1T524phAq8hhjihZERiTTtvOq9bz91+eSmn66g8uwtsKDCs1ZTNeMsax2oI+g9w
         wYxJ/+OXj+W5v7GQCwXwfVwEewx7zTE/00txpLvHkCElfXdB44NJQJIUgU6B+AtM2TIv
         AqD3vYe+VCHbh5vhM+4iv9giI5H4zzW0u03JfyTGu9XJnItinAJn2avACA3ap6kMuZvh
         2E3MgNZFCoJtmzzQcUPnm899VQIZyNY7N6AchNS+CG568M0UPSx/rVLs32KWz2oKMxqs
         T4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821495; x=1791426295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zxg0mQeibUEA7aHAxfrcW/DbAaTwXdm7MXT8cX4qy1Y=;
        b=nvIoLfvWUbjbBM1qremHYHs9k1jrIiYjkYBUCqgq5gXeqrhqrCcJxbSfG+fx8XACaM
         LLtw0QbYjPOqg2ru+cPOjRKBWSdMeL30bqrDXJC25YKDUA48Y28hHeUp/1ThzpwGAHnN
         QEND4+ttr/0TFu88YurDCH3EX834aZxKznHZWY9EIdYh0A/xCOaz+ofR6O8yX+sdbWZi
         lm34a2FW8gsShFVUMDaW8HFJHMEV/8Ui2V88NG56YbRngNbE/ahpKKxOTq7pbcNzamN7
         yMIe26WIYo2lVO7Rgc4rQeuD7S+pUmGboIjAZAmjaxVHt2f0ZWji3t2uQHQ/fJc5tifa
         6iEA==
X-Forwarded-Encrypted: i=1; AKwUvBw3x6mYM8eSr6FBo7HCGdT5JRZ482a9lQ8PHa9XLZ4pSbLwJMun4uXgxzEcD3TNKg0rfPRkzdD7F8e6YKWqBfJH@lists.infradead.org
X-Gm-Message-State: AFq9FYKcuF0boZYFHbFJHpMEiObkNlM3//tMaiOr7Rxeuu+l6XqMC6k9
	c8egtOMh/AYbZrvzG9gPCan0fHZTXsM4A4cS2wQDSxUBLiSMmKQor5nB
X-Gm-Gg: AYBFou12zSuLKNqSAogvRCsnZHsMh/K6po7F/Ut2dn27hzVPq/yMP0xwmyXTNU40hSp
	r5PpmGRb8Uzq9aIjLwo+rXOgNOfHMIxThHymxbYRHF2y6aLrjJpAe7+5QWxI028bN+Z9cgM/0dW
	tNVVt/Tb7sUWvxrIxMVKOcLTGctUGv8AJGKizc3VOncWUhLdH2x39BUXF4GdLno3dplGC2V9GIN
	iOo0EO9t302o0SbhvXSksYwzsCWZjW+t2h/iqVBRmgLQDwJH0aMVWLMvCOgYf8dIJk7hxwlxi9b
	jjpRDRS6ebwVWJ5fXkJ02KCBjIKPrOFCubWdHI4CvXxZNIN3/iuZ83qIfuySWMynKkYqOOt1xMF
	nzWkaStWMgMzj+xCrbbnmvoJFqlm/x+jgcgfBVwEKDgz70bMYw5D2HDqsiPbnL7F4X5n9kfwyAa
	6LY3R0QDuDQXGOVCYI8/rMvV34SSQlgdUilpPfUmOQ3rWNjOtAJfxmn18a2ZrgRw==
X-Received: by 2002:a17:90b:5808:b0:39e:6c69:f470 with SMTP id 98e67ed59e1d1-3a4d18abe8bmr2771770a91.47.1790821494738;
        Wed, 30 Sep 2026 19:24:54 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm2153230a91.2.2026.09.30.19.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:24:54 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 4/4] arm64: dts: allwinner: add Teclast P85T tablet
Date: Thu,  1 Oct 2026 10:24:15 +0800
Message-ID: <20261001022415.913959-5-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001022415.913959-1-iuncuim@gmail.com>
References: <20261001022415.913959-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_192455_887054_EEAEE841 
X-CRM114-Status: GOOD (  21.63  )
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
  - 800x1280 MIPI-DSI panel (no mainline binding yet)
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
and LRADC keys are deliberately left out, as those blocks don't have a
binding yet.

The tablet uses secure boot, so it needs a signed TOC0 wrapped image to
boot, but it has no key hash burnt into the efuses, so it accepts an
image signed with any key. U-Boot support in progress.

Later, a tablet with an Allwinner A537 processor and 3 GB of DRAM was
released under the same name. This version is not supported by mainline.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun55i-a523-teclast-p85t.dts    | 386 ++++++++++++++++++
 2 files changed, 387 insertions(+)
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
index 000000000..d144f81d8
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts
@@ -0,0 +1,386 @@
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
+	reg_vcc5v: vcc5v {
+		/* board wide 5V supply from the USB-C connector */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
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
+&pio {
+	vcc-pc-supply = <&reg_cldo1>;
+	vcc-pf-supply = <&reg_cldo3>;
+	vcc-pg-supply = <&reg_bldo1>;
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
+				/*
+				 * supplies the I2C pins for this PMIC
+				 * and the WiFi module
+				 */
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
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-dram-1v8";
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
+				regulator-name = "vcc-codec-mmc";
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
+			/*
+			 * ALDO1 (1.8V) and DLDO1 (3.3V) have no consumers,
+			 * although BSP enables them; the board works fine
+			 * with both rails disabled.
+			 */
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
+			/* Some RISC-V management core related voltage */
+			reg_dcdc3_323: dcdc3 {
+				regulator-always-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-name = "vdd-dnr";
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
+	usb0_vbus_det-gpios = <&pio 7 13 GPIO_ACTIVE_HIGH>;	/* PH13 */
+	status = "okay";
+};
-- 
2.55.0



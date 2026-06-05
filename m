Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CE0CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 07:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqzhMeEc+Wgxf+HH46mg5KPvRwxrTlYFNd0Qvb6R2sA=; b=coQIKan7Pc6RjuBEps21fJ/iqp
	osqeO3R1fTS+AuzdrYZIF/z/B/DMLTqY8WMmyP9qNqQxj9BqhFt30Fu1tLOPDWpVz8Jx03clAeuzD
	ypB6POjyBdSjXxYj9B4L5YLDNw/GIraaPAwyKpd1JacnK81M8UxqHxL1/Ny4SgsqpYhTNo+LF2bd/
	LrBZ/8XMp4Bb6acLbdIEoFB5jdLylgPXE9drmN/cR2NSqTMQ71ZdR/oN4kKv5iC3k+mUx5zyLOET8
	jAw6pceysKypg7xXJ3mTbspfFKbKOH9Jod8SRsah9oQv/ORH9osINMb1Twnb7H8kh0HG52QODH5KA
	33z+xoAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOh3-00000000D0X-2AUA;
	Fri, 05 Jun 2026 07:10:13 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOgy-00000000CvN-0CwJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 07:10:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45ef616daf6so1385101f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 00:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643406; x=1781248206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqzhMeEc+Wgxf+HH46mg5KPvRwxrTlYFNd0Qvb6R2sA=;
        b=gvFEkBENglvT5XOcromwDt5kKHZ01wuDP49j2lbdlJ4zKDWrPF/li9L60NGLHwZEO0
         UOJPVvzN8iIIAzOhQp9erMoOM0r19qKIN2BrfL/HO51HzMG1Dv62kDlixAma27U45uid
         rT9JoltC5sXJmCG4GkPfTSgFxcOngOTrwbPCQD6JXxNbCzesnrrSozMrzV1VeDAVX8eE
         0enXr0L0dVoTLm0NI915KCllvWPg4LVc1kkbqoAIZym4kDoht+2Z7z//WOqaW7CK4CIf
         tTlg+6Yx7TRtD45OJnddIi0mZUgPJTdau8DEiXwX74Ku3xwlKcWyLy24xKKdXcDGgjWw
         EUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643406; x=1781248206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uqzhMeEc+Wgxf+HH46mg5KPvRwxrTlYFNd0Qvb6R2sA=;
        b=OGl2XGbRhc+8MeBAgxaid9jceSWM1xJy+E4FQBcch09+A6b66kuzVZ/Fc72xUwJ/bY
         2xVpJjA9CCyg7StEIATdA2THz0mUaGeNmoWoZBKsI3iA8ZBcBtLM9kVYsAkCRrkRG4D+
         Ixu+ywX8IRt7/3/mPcl7CDMvTKyFhKRTZBBDvqCmh/d9cwLqCyEbMmPh599UqxWlEKrF
         mAnc9+8jMPZZyoDz0DWocVXy2aUgeA3dx9+vYEk4ZuFdZLG0+hPLiIm4galIEPII7ZZQ
         KlwsCYchqAfKAG/veimfe7pX3/74b/tq2ZXMrHxyNN2wkw5bs4R56cor2mP/vyL1bBQ5
         wV/g==
X-Gm-Message-State: AOJu0YyqWIiJXYOXShB2jmjb4cQUnrkAZukfWN4koWRFx7qGN+uPJpGf
	EFAymlR8xvR+xBLt5UxBffClR76kMbUZgjzzyjn/Ba2pR4cPu0hY4q69aAEJFhsia+I=
X-Gm-Gg: Acq92OFJpbTmEyJqJAGiRAFHoVNVaSKSljcq+y2nEtuRPF5pKiSUW7xtDC4Kxv2HjDf
	2PSqHhM3ayONvtq1jP/tEomJ8JOfTzp2AWfTMKY7niUfgLmgfrsGanaz9UJeatv7nr+kJdqUeCb
	6AQVQheDCK2UjcCsmL1gsYl7epgRF6n9Nuq+4+BJ2roxBkUF+VKqT/+WrQwwheXcu6+VSCBbKxi
	2hDQUki6jNW0s/RXNBT2RP8OPPu3Ifu5hlRTOpmFhRXrr8z1dMGKUVxVXbQQ3crPfuRVDI3vKcO
	Wk0nu21tYKzLJGzQia+UGa1Jaice9+EXegVL7tQoRppEVOXygk5RmFM3r1uExtqHPjdaX/IMbwn
	ehEQRnlS6YH5Ls5wdKSI64grl7XRtswISNgjDUfIKdp+kCfMH4V+/p0JWTfSHS2Ijr2nDLmh+L6
	m4sfwuVnPgzIZNMnEoG5VsrFqoUdPSc9Ex1MTtkIMH4X0OmmEE/N+WUl0XB1EWKEbgbwmqDMAVG
	higzcudY9G16KBUf+MXiA==
X-Received: by 2002:a05:6000:e52:b0:45e:a0ab:8bcb with SMTP id ffacd0b85a97d-460302e45f7mr2476891f8f.15.1780643405978;
        Fri, 05 Jun 2026 00:10:05 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:10:05 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 7/7] arm64: dts: allwinner: A133: add support for Baijie Helper A133 board
Date: Fri,  5 Jun 2026 09:09:21 +0200
Message-ID: <20260605070923.3045073-8-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_001008_154512_DA67CBBA 
X-CRM114-Status: GOOD (  22.58  )
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

Baijie Helper A133 board is a development board around Baijie A133 Core
SBC. Features:

- 1/2/4GiB LPDDR4 DRAM
- 8/16/32GiB eMMC
- AXP707 PMIC
- USB-C OTG port in peripheral mode (via onboard hub)
- 2 USB 2.0 ports
- MicroSD slot and on-board eMMC module
- Gigabit Ethernet
- Bluetooth
- WiFi

Add initial support for both the Helper and Core boards, including UART,
PMU, eMMC, USB, Ethernet, LRADC-connected buttons.

UART1 can only be used for Bluetooth module, but BT-WiFi combo Allwinner
AW869A chip has no mainline driver currently.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
- renamed "sun50i-a133-baijie-helper.dtb" -> "sun50i-a133-helperboard.dtb"
- added "model" property into root of sun50i-a133-helperboard-core.dtsi
- added "cap-mmc-highspeed" and "max-frequency" into &mmc2
- added "x-powers,drive-vbus-en" and "*-supply" into &axp803
- dropped all "regulator-enable-ramp-delay" properties
- replaced &reg_dcdc3 with a "polyphased" comment
- exact DRAM voltage in &reg_dcdc5
- disabled &reg_dcdc6 to avoid "[   31.710641] dcdc6: disabling"
- added &reg_vdd5v "root" regulator
- added "disable-wp" into &mmc0
- commented &usb_otg
- assigned usb1_vbus-supply in &usbphy
v3:
- added my copyrights into the newly introduced DTs
- all DT nodes sorted alphabetically
- all always-on regulators commented/propetly named
- all regulators got proper voltages (not default ranges)
- ADC-sensed buttons K1..K5 added
- re-labelled "eth_phy" -> "rgmii_phy"
- usbphy 0 switched from host into peripheral mode (downstream from an
  onboard hub)
- typo sun50i-a133-baije-core.dtsi -> sun50i-a133-baijie-core.dtsi
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board

 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../sun50i-a133-helperboard-core.dtsi         | 197 ++++++++++++++++++
 .../dts/allwinner/sun50i-a133-helperboard.dts | 148 +++++++++++++
 3 files changed, 346 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d116864b6c2b..cf8434064b0d 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-helperboard.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-liontron-h-a133l.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus-v1.2.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard-core.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard-core.dtsi
new file mode 100644
index 000000000000..545972d2324a
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard-core.dtsi
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Arm Ltd.
+ * Copyright (c) 2026 Alexander Sverdlin <alexander.sverdlin@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "sun50i-a100.dtsi"
+#include "sun50i-a100-cpu-opp.dtsi"
+
+/{
+	model = "Baijie A133 HelperBoard Core";
+	compatible = "baijie,helperboard-a133-core",
+		     "allwinner,sun50i-a100";
+
+	aliases {
+		serial1 = &uart1;	/* BT module */
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&lradc {
+	vref-supply = <&reg_aldo1>;
+};
+
+&mmc2 {
+	vmmc-supply = <&reg_dcdc1>;
+	vqmmc-supply = <&reg_eldo1>;
+	cap-mmc-highspeed;
+	cap-mmc-hw-reset;
+	max-frequency = <100000000>;
+	non-removable;
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	status = "okay";
+};
+
+&pio {
+	vcc-pb-supply = <&reg_dcdc1>;
+	vcc-pc-supply = <&reg_eldo1>;
+	vcc-pd-supply = <&reg_dcdc1>;
+	vcc-pe-supply = <&reg_dldo2>;
+	vcc-pf-supply = <&reg_dcdc1>;
+	vcc-pg-supply = <&reg_dldo1>;
+	vcc-ph-supply = <&reg_dcdc1>;
+	/*
+	 * PL0/PL1 are the I2C connection to PMIC, but it would create a
+	 * circular dependency:
+	 * vcc-pl-supply = <&reg_aldo3>;
+	 */
+};
+
+&r_i2c0 {
+	status = "okay";
+
+	axp803: pmic@34 {
+		compatible = "x-powers,axp803";
+		reg = <0x34>;
+		interrupt-parent = <&r_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		x-powers,drive-vbus-en;		/* set N_VBUSEN as output pin */
+		aldoin-supply = <&reg_vdd5v>;
+		dldoin-supply = <&reg_vdd5v>;
+		eldoin-supply = <&reg_vdd5v>;
+		fldoin-supply = <&reg_dcdc5>;
+		vin1-supply = <&reg_vdd5v>;
+		vin2-supply = <&reg_vdd5v>;
+		vin3-supply = <&reg_vdd5v>;
+		vin4-supply = <&reg_vdd5v>;
+		vin5-supply = <&reg_vdd5v>;
+		vin6-supply = <&reg_vdd5v>;
+		drivevbus-supply = <&reg_vdd5v>;
+	};
+};
+
+#include "axp803.dtsi"
+
+&ac_power_supply {
+	status = "okay";
+};
+
+&reg_aldo1 {
+	/* PLL + LRADC analog reference */
+	regulator-always-on;
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-pll";
+};
+
+&reg_aldo2 {
+	/* LPDDR */
+	regulator-always-on;
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vdd18-lpddr";
+};
+
+&reg_aldo3 {
+	/*
+	 * Port L, but linking it to &pio node would create a circular
+	 * dependency because of PL0/PL1 I2C connection to PMIC
+	 */
+	regulator-always-on;
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-pl";
+};
+
+&reg_dcdc1 {
+	/* Besides Port D it also powers analog part of USB IP and SoC I/O */
+	regulator-always-on;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-3v3";
+};
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt = <810000>;
+	regulator-max-microvolt = <1200000>;
+	regulator-name = "vdd-cpu";
+};
+
+/* DCDC3 is polyphased with DCDC2 */
+
+&reg_dcdc4 {
+	/* Digital part of USB IP, "System" SoC power rail */
+	regulator-always-on;
+	regulator-min-microvolt = <950000>;
+	regulator-max-microvolt = <950000>;
+	regulator-name = "vdd-sys";
+};
+
+&reg_dcdc5 {
+	regulator-always-on;
+	regulator-min-microvolt = <1100000>;
+	regulator-max-microvolt = <1100000>;
+	regulator-name = "vcc-dram";
+};
+
+/* DCDC6 unused */
+&reg_dcdc6 {
+	status = "disabled";
+};
+
+&reg_dldo1 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-pg";
+};
+
+&reg_dldo2 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-pe";
+};
+
+&reg_dldo3 {
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+	regulator-name = "avdd-csi";
+};
+
+&reg_dldo4 {
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+	regulator-name = "afvcc-csi";
+};
+
+&reg_eldo1 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-pc";
+};
+
+&reg_eldo2 {
+	regulator-min-microvolt = <1200000>;
+	regulator-max-microvolt = <1200000>;
+	regulator-name = "dvdd-csi";
+};
+
+/* ELDO3 unused */
+
+&reg_fldo1 {
+	/* CPUS power rail */
+	regulator-always-on;
+	regulator-min-microvolt = <900000>;
+	regulator-max-microvolt = <900000>;
+	regulator-name = "vdd-cpus";
+};
+
+/* reg_drivevbus unused */
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts
new file mode 100644
index 000000000000..694c0cacf906
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Arm Ltd.
+ * Copyright (c) 2026 Alexander Sverdlin <alexander.sverdlin@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "sun50i-a133-helperboard-core.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
+
+/{
+	model = "Baijie HelperBoard A133";
+	compatible = "baijie,helperboard-a133",
+		     "baijie,helperboard-a133-core",
+		     "allwinner,sun50i-a100";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&pio 7 13 GPIO_ACTIVE_LOW>;	/* PH13 */
+		};
+	};
+
+	reg_vdd5v: vdd5v {
+		/* board wide 5V supply from a 12V->5V regulator */
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&emac0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii0_pins>;
+	phy-handle = <&rgmii_phy>;
+	phy-mode = "rgmii-id";
+	allwinner,rx-delay-ps = <200>;
+	allwinner,tx-delay-ps = <200>;
+	status = "okay";
+};
+
+&lradc {
+	wakeup-source;
+	status = "okay";
+
+	button-115 {
+		label = "K1";
+		linux,code = <KEY_1>;
+		channel = <0>;
+		voltage = <114607>;
+	};
+
+	button-235 {
+		label = "K2";
+		linux,code = <KEY_2>;
+		channel = <0>;
+		voltage = <234783>;
+	};
+
+	button-360 {
+		label = "K3";
+		linux,code = <KEY_3>;
+		channel = <0>;
+		voltage = <360000>;
+	};
+
+	button-476 {
+		label = "K4";
+		linux,code = <KEY_4>;
+		channel = <0>;
+		voltage = <476471>;
+	};
+
+	button-592 {
+		label = "K5";
+		linux,code = <KEY_5>;
+		channel = <0>;
+		voltage = <591946>;
+	};
+};
+
+&mdio0 {
+	reset-gpios = <&pio 7 11 GPIO_ACTIVE_LOW>;	/* PH11 */
+	reset-delay-us = <10000>;
+	reset-post-delay-us = <150000>;
+
+	rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_dcdc1>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
+	bus-width = <4>;
+	disable-wp;
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&rgmii0_pins {
+	drive-strength = <30>;
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&usb_otg {
+	/*
+	 * Connected to a downstream port of an onboard hub, therefore only
+	 * "peripheral" mode will work here.
+	 */
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbphy {
+	usb1_vbus-supply = <&reg_vdd5v>;
+	status = "okay";
+};
-- 
2.54.0



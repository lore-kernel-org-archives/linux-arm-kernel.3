Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE1FCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 23:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFyTUV5qSwhcP4cHRwWHRhxUEjwBT6HTiMD3Yo05mu4=; b=ro/cSok1TvZMPGzoUNnQHfmGPK
	WyrFd8L8UwAzGkpwF5LBmEVvzlK0l/WDOtWEBu5O5k18oQC1Hzf+fcHNbAhZROOQvyofSh+EQXCX9
	ejFC4XAgrgxJ0xz2Cd0cmicUTi8cwAaVm1Ws+bXU4PNkNsb4DQZylFFmvopi7jU0bMe8susVn0wFu
	C096qU3+sdAv3xlEUNzHMOYcYv0kBP4gHCMTD6H9a7529VjOh88NaTbonYP3Q322tEfjagrL3/rY7
	mHhgylCBkPaQ7hKzwMAvJuqUAY6cTifyKInqQ0AfzUsXpdVTpP/j/gTQaht5Zik5pebW19A5P7dUB
	6QtxnUGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOl72-0000000DgOx-2Slc;
	Sun, 17 May 2026 23:41:36 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOl6w-0000000DgKt-390H
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 23:41:31 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45d96d21e82so822980f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 16:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779061289; x=1779666089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFyTUV5qSwhcP4cHRwWHRhxUEjwBT6HTiMD3Yo05mu4=;
        b=SvKbafsBuO7R0XbIaPv+UgSynRW7Rr8qCS8UbnKLIDRoXynj92ipmk/VbTg/EJZT1a
         euzDOMaqRiI07Y7XZl0xIunGVdbgVaSI9OQjPtXcDUExt3dtw1OmZhd+y17BFu759ke7
         B+EpoAmsPnLfECpotpjg9Vx9trmuRCzrCjBaJ+YYMn27MvfRRUdFPj2n7GGMG/B0CQSS
         /LrCbVJLa49Cuec8yXvYXdHvp+GhjHGDsUCWOYJ/usMdem9+DwM6TmK/FcCiVyIcd91U
         xqLUrOyvRqEsIk1cUh9srSlVEu/F9ObQqquDPnINAdUTLlG5SUDN+da+bkp831No8nkd
         Nu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779061289; x=1779666089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fFyTUV5qSwhcP4cHRwWHRhxUEjwBT6HTiMD3Yo05mu4=;
        b=am7yr958jdt8zG3Ygf65eHMCKyAGicT90XLE27HerazrCp7s2OXjN8us4nNllt28DA
         QHwnykuft1L+nPBsYo+oWG8h6Sdnb66EMTi5Wjp4atP7C+IH727jdjKrq/FP01p4nisN
         J5Elc3WPOwQCrPMScVk/k5BVh7FKiPOXpg5ySn/qsQ7xo2lLuL3bcU51trfc0fjpH3Ne
         RHOYDV38h1BrkDto/wSixwHCH2gpkx2IYB11hCzZUOYNLVsfrqERpqF2fjVIqxd3R7ZB
         mwrdUZjWPysThetXEpiioUOL+IB43w9YIgha+JPONVm2G5NQMnUE9BO0ibEWHIB2HQXX
         Pcrg==
X-Forwarded-Encrypted: i=1; AFNElJ8klm2gMXSwePRtUbX300e7GvPjqhyrIk4i0oBiyBDa4qXZWOF1SCZvSnEgx+suDvkkQLDSO3Gfmw9yOyjmZL7T@lists.infradead.org
X-Gm-Message-State: AOJu0YwWw0gvDeOFbDrqIEeaVzwNcddmpKVk3+XhQq6J57F2+kvKTcV3
	zKBT/nLn6Mi8mfBoB6Auv1KvVtuldHvKFsS9seIdfbJ9F93A7fsFHA2m
X-Gm-Gg: Acq92OGFw0qLKfgIsMYxnxvIPhtmyKyrH5hhBN+dOzoCj/DN6B58OJNmxpMaPrbCyjz
	jyEnGaUBUDCJQrsz+44BboNy7PFxOYpQZ4Hm7XoMJh5we7LIzxO4BgggFkk5FzJuq+G9vvBq3hP
	MSbgtItI8V5VXK9Mwv3cw7LqukR1LJK7vk8v5GlSQrzhRaePEa323rBD84M6yTMW8SJiM3B598e
	Iff9yaeqDU+svA+ZVwp7gLIIgF8ng2t4pbKderlSXOC5eT93/TjY/X0IjKi/nWzyMCW0amK8v06
	lHWxk2/1tDFixXc3BRVSCZu9XyT8B6l70W4jtYNVoFu479j+WbjqxINeWkh7/vtAJGjI8aFjV/X
	ftUCPx6HdD8DRoLkcUm0xWazjAPIFdwkIlx/G7jDAwVE4eNmDhW/zmUBNkaoprcV1IK/DoYKz7h
	kX4Id67bHy127GcCwhdMjnuURt1KY+LTyWpG2+Sq7Msgnzz1Px0ylm6g4Oe6fSfGbmOo1Lmguey
	y0ks54rHRyx2iuFpsOlZA==
X-Received: by 2002:a05:6000:24c9:b0:43c:ffee:ee94 with SMTP id ffacd0b85a97d-45e5c5a0198mr20713409f8f.11.1779061288817;
        Sun, 17 May 2026 16:41:28 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm32845129f8f.33.2026.05.17.16.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:41:27 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] arm64: dts: allwinner: A133: add support for Baijie Helper A133 board
Date: Mon, 18 May 2026 01:41:30 +0200
Message-ID: <20260517234134.2737320-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
References: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_164130_864818_3A6ADAE2 
X-CRM114-Status: GOOD (  20.28  )
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
AW869A chip has not mainline driver currently.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
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
 .../allwinner/sun50i-a133-baijie-core.dtsi    | 190 ++++++++++++++++++
 .../allwinner/sun50i-a133-baijie-helper.dts   | 133 ++++++++++++
 3 files changed, 324 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d116864b6c2b..926dfa851100 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-baijie-helper.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-liontron-h-a133l.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus-v1.2.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-core.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-core.dtsi
new file mode 100644
index 000000000000..7a09a5181c03
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-core.dtsi
@@ -0,0 +1,190 @@
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
+	compatible = "baijie,helper-a133-core",
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
+	cap-mmc-hw-reset;
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
+	regulator-enable-ramp-delay = <1000>;
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
+&reg_dcdc3 {
+	/* CPU core voltage feedback rail */
+	regulator-always-on;
+	regulator-min-microvolt = <810000>;
+	regulator-max-microvolt = <1200000>;
+	regulator-name = "vdd-cpufb";
+};
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
+	regulator-max-microvolt = <1500000>;
+	regulator-name = "vcc-dram";
+};
+
+/* DCDC6 unused */
+
+&reg_dldo1 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-enable-ramp-delay = <1000>;
+	regulator-name = "vcc-pg";
+};
+
+&reg_dldo2 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-enable-ramp-delay = <1000>;
+	regulator-name = "vcc-pe";
+};
+
+&reg_dldo3 {
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+	regulator-enable-ramp-delay = <1000>;
+	regulator-name = "avdd-csi";
+};
+
+&reg_dldo4 {
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+	regulator-enable-ramp-delay = <1000>;
+	regulator-name = "afvcc-csi";
+};
+
+&reg_eldo1 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-enable-ramp-delay = <1000>;
+	regulator-name = "vcc-pc";
+};
+
+&reg_eldo2 {
+	regulator-min-microvolt = <1200000>;
+	regulator-max-microvolt = <1200000>;
+	regulator-enable-ramp-delay = <1000>;
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
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
new file mode 100644
index 000000000000..0d192c08a6fe
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Arm Ltd.
+ * Copyright (c) 2026 Alexander Sverdlin <alexander.sverdlin@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "sun50i-a133-baijie-core.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
+
+/{
+	model = "HelperBoard A133";
+	compatible = "baijie,helper-a133",
+		     "baijie,helper-a133-core",
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
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+};
-- 
2.54.0



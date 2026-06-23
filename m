Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A37ECDE001
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 20:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpwmh+JDDGegnFSzMspybYCunWyCARRw7ITPQqgM/JQ=; b=21ZwtXLKtzMeM4dgBfrVX7528R
	VYOdVrzSdGlaGYQdNFba4X8DgABDLGQIC4LqRx8pOSQGXLSQ39L1mUzdTmoi6IKRK93cFF4sLPFgZ
	JZo0oXDqVT4VyEf0w/+LAdhpuYUHdsj1QiQLHfn+fGAEmtu+P0Km9EKjZeHtR/QDhpmJqf1xtWVI6
	jjoPUAkYGUn6JuR/8R78f08vtbfCqylRRSD/hNLi+5I2ngo43vTCo7M+falAAxFJVNQx0wJ2ESXZZ
	FXzG4Wta0sNSh+778cthi+Nm5o/DcvELxTwopPQwx7yuZS4B5aLPm9d9pfKItUB6iyQyiUGXZYboX
	GbJ1UxoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc839-00000006sLT-2A4u;
	Tue, 23 Jun 2026 20:48:51 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc833-00000006sHx-3N7d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 20:48:47 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-464192ab2e1so244428f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 13:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782247724; x=1782852524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpwmh+JDDGegnFSzMspybYCunWyCARRw7ITPQqgM/JQ=;
        b=CigG+1Wa8FXsdV+KVoqVhati8ju/0qkwyzvwWzxZGrVz/gTuwNr+8dGSJ5xgOKotR+
         TW9Kof69kEHgxvUus+Zmj1MsBsi+dI7i8Ns/yI4Cjd7Jn/KZMmMIPMlPvQW326ydpOq3
         aIRQ8/+6gPzptbv3oBxzj1FPz74IWItB9emD7uyHq1p4erHiUfQ/dCCqI0pOx9EOe2vV
         jZ3mTnOzg4OQ5cCjw/aZUIDYtuzuvElWlnMm6sSEzxtW6vUdBMeMF8VtKpViYZw2wG8R
         N0tGLE+/CyXKJSj0/XD1fIB3jtDlB9rSB3M7KlBJre/5g4Xt4ZY7ZTmgLkf2jQlmnz6p
         IV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782247724; x=1782852524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gpwmh+JDDGegnFSzMspybYCunWyCARRw7ITPQqgM/JQ=;
        b=bMbRzmmC7KcLUnBycXg5VkzZ8bg9rqDfMFxryJgViYL1cHH3p4QF/MlkGZJ35fpv3b
         QH1i/G6QOsAPT3+WJLGN4k3PB8K/uS2DR+AEpuog4twxFOW1uA6LE4M7WJJK+3+m3kWl
         3vn6puXcsZ1vci9ChmBi2aLoGDgIbMf4acrvHXvlT4d5ZjnhIXD5EsJYLkEUnV0w6vIi
         Ni8kL2DVQ0h79cdzRx0QYRF6oGXW1ZLN6vMUMcYV4Idtr2xLAY7P1yjubzfHiAA+tFuU
         +N8Dvq92ns0ukPRG3gU5naz5Nf9TrDgYq2Fh0wZAbnqXu2qVQqPLMySjZWztCSDBoxS6
         zd0Q==
X-Gm-Message-State: AOJu0Yzks17VDdDi4B1qlTyAJdmqw0yeKz417o+X/KulY0UIAv2cGIgk
	ESbGdsHTL2AkIbXEcQWErgEgPlvoib/92RolOkYVK+5YLAd4ZvWlJPbGXNQ7OpARZjA=
X-Gm-Gg: AfdE7clGkPqVNVGPCgrTH+gTqjsSXjKgYs8Vf5aV/izaX9q/vWmcpDaXDCDpLgCAgFM
	KB+3FhucguXZtN7FRcT101Q6+z4WVWST/PWnWS6ljSHnfT6l1l9jAs7e0lwSJtzY0YY0Zd+MI9Z
	uoyh8ssWgndUuZc9a/1m5mBp5N2CLVwG0y/J5i1Ua/Hefos6t2/JfSJmXzFaE3xJovPC2cVeUeZ
	LCuTq1LWO0U1qAt+YnqzDpk2QS0w0D7yBE2UGqsE6nS/mqUw8xrmzcqy2OdCkoNtTArmcdHG/Xg
	Fz1pkjaeXAMnqRcY93Ib4UhpjldqBLnPtWXPDJbymVLKb+MJwo0CBR5eN1Jz03n2IVdvn9PHGNF
	W6g2Z+5VeGRoJBJjNZkaedRK01zfeNKuvw4szBp4SuFdJlOPLMnmzuueScobGCA/Tf4zO8KNUcu
	nyDo/xDYu10m1e2/o0vhJ8JcdaO95UKXDYIoztY80OhA==
X-Received: by 2002:a05:6000:2203:b0:452:273:5cd6 with SMTP id ffacd0b85a97d-46c04a33d97mr899375f8f.1.1782247724061;
        Tue, 23 Jun 2026 13:48:44 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm351996f8f.6.2026.06.23.13.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:48:43 -0700 (PDT)
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
Subject: [PATCH v5 6/6] arm64: dts: allwinner: A133: add support for Baijie Helper A133 board
Date: Tue, 23 Jun 2026 22:48:18 +0200
Message-ID: <20260623204824.691832-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
References: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_134846_338647_4AC8F294 
X-CRM114-Status: GOOD (  23.17  )
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

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v5:
- no changes
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
index 53e6b701e7d3..aa21f58a4be1 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -24,6 +24,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
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



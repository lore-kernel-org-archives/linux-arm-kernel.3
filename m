Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FD3CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 12:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K67aSMdZxcM3oK3NMOeHN0YPY+i1nG2+CE3+Mxl/Mf8=; b=CH4E95BgFdW7cEHOSVU48so1JE
	IA9ckoAbJilFK1Hftyxw2FuwQxtlwJti21deTnA+yjCGbRVqH/ukRfI5vuGli7KwE0yCWiFaJq7Gl
	HGQecTAsKbDl/rWg+ffk9lJn4HORB1oWHM0kHm+hZnDJyMUqzQ0MLhCgkr/dzLyi2s7L3PIJKnaqD
	SH6pdvkIdag0zVLMSvgUfqijoc6H4MnWk/rCnojB1cTh1jKFeAkiOyYpUxBsfA6/v/jTAydnrf5hu
	MmQ8LGZSTC2oSNK0O7vwdnM9roEsDaPEFBNgGJRmbbxZsQ09WTWVIjEsEBSghKZHpXElcO58z/WKK
	np1NxggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQGJ-00000005ruU-2L9s;
	Sun, 18 Oct 2026 12:45:15 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQG8-00000005rqR-3QsH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 12:45:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1d293b293so6920095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 05:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792327503; x=1792932303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K67aSMdZxcM3oK3NMOeHN0YPY+i1nG2+CE3+Mxl/Mf8=;
        b=NqO2iau4KKc12lEnFweRPTgsdUqSj3PhUu3tqWBg6Ha9cv5dZEKPOnZq1zizDu+zFq
         tI9AZQBcSquPdxMUIr0PoAMiavCiEftZQMC58UOvrNZ/SJxsrleaSQHaOSEGOv4+q6iK
         Mbv7pM+OGhj5oufb9RM7FbM8UkA9I4Wes264VGTQhjhUqf3K+cF5mH6BjdsJQ3H8ODMF
         In7b96ug1olLv9iOvXNyTOhOsQjPSWdfYbGa80ASTLVmSH4eAGF5QjH9QLQ+FBhM/M8o
         /UNH87hKuyxVAKfRVzXqpWwf6JYXNhIq8/UhTp+5nva1pA/zXyy5+cMdqcCIrBVWr9pj
         1ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327503; x=1792932303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K67aSMdZxcM3oK3NMOeHN0YPY+i1nG2+CE3+Mxl/Mf8=;
        b=C5/dBc2Pok94lbe1pcwz9VV3CqJwFVJLSCWqHFjGXSa3W1bkY8X8fgXU1FUy79CUue
         ui3E4l3v0rTyMzuxRYvV+yfM41L03p6ZL9pHwwz3ODQH0xU398oNqymucpKx5IUXPHDq
         hrX4kO4tU03tI5TGyN50zW/DNiWErKkTyJG+6+02p7cGaGYwCBpc2EBazCx+f33l7ddP
         ekyGE7S9z4KhLXNYa/sDISjCxvo/BZeznoJzEaeaLYJYIlZRtYrHEnCI5hD1JrnUfCZk
         7Qv/l4EZqC95Z85YhlO85CvAEr4QY/y67VcbkQBx28jS1BNRy+r0fU1qdZi0NnL1w5uR
         JdqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRofx9JmnPWJWsu1NBXpNqmLlEVRwNUsNSXF96cbhayxMsmkyshGGH9OCvf1aapUJmDB5YIjF75DZA6dUF7QX6@lists.infradead.org
X-Gm-Message-State: AFq9FYIkwN4E7Xjgk6qDXM3G9YtWtWLDLUUD4dSUqkS2ko/HXhYQJzwj
	kNU2cB3lDtZykVQMBK8V6AtkB6P46/4ik3zF7ZbEpY64JqsQzEd1YncD
X-Gm-Gg: AYBFou1nif3AIyOtAnA/WwtDA8HFLt92CSMMSJCSiT8Y6ml3GTMYIoF4qN9VVkvixSr
	M6gHiaGriHNLl8dh3zulz4+j2A1nmlkBdQJGtSHCsNL01hOZ/v5YyYCbKnfeUjhIh44VKXSXc/O
	exmq+MINORmnHlXTw0tgMdqKlY3VrqVfJjcVXY6FNo++Nt7HmWKGnUhpbQvdbeB5pqvigUWXjYb
	Vs0pkS5KCvfXZqJfk9rwQstK1aQmBmrDfsQOWXiCbNwBLmpFAE8RYLEegJIj/eJ/bi/v//NmqAL
	WoOR6dfpNlrT1B3N0XsRPRjoZaIkvHVNfE9q4kOcnCu1s76ye26jyuelbjBT4qNCM8DYHPysc9K
	1x6taMR0B2R6osDbGTWt+Y2QbUIXNNSpkh1M0LrFN4M9x0iGTc7h2CStm4Jf2LDBy3DaPprjdu4
	82dD2sgyqxmm/ZJXmdwDep2fSEEUVuOcK80TTaQJng3uY9N7wPaumpJaFFHvzZ/OdT//skqrfSi
	dhvWyecPDP3Z+6GSVqtHD7IoSes4AQ3oEYYGUFiVNAJ6nVgDebakuqychxpU+gyj7nYlx3/RYjU
	KH3QHIM9Oj5AhwV6674gHuhVGg+4OGTt206FsaMHVw4wXTnSZSLlr6OWwzY5KXb0aWoElVDK+Ql
	4sv9tKMKUQjrqwvyegBFoW8Y=
X-Received: by 2002:a05:6000:4a12:b0:48d:ef75:8b37 with SMTP id ffacd0b85a97d-48e07fa8816mr9257345f8f.36.1792327502920;
        Sun, 18 Oct 2026 05:45:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-318a-f58b-5e43-a2b9.ipv6.o2.cz. [2a00:1028:8388:a84e:318a:f58b:5e43:a2b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm16386408f8f.42.2026.10.18.05.45.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 05:45:02 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: samsung: Add Hardkernel ODROID-U2
Date: Sun, 18 Oct 2026 14:44:59 +0200
Message-ID: <20261018124459.3026-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261018124459.3026-1-pepe.schlehofer@gmail.com>
References: <20261018124459.3026-1-pepe.schlehofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_054504_915292_C7F14715 
X-CRM114-Status: GOOD (  25.41  )
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

ODROID-U2 is a single board computer from Hardkernel based on the
Samsung Exynos4412 Prime SoC with 2 GB of LPDDR2 RAM. It is the
predecessor of the ODROID-U3 and shares most of its design:
- microSD card slot and eMMC module socket
- SMSC LAN9730 10/100 Ethernet on HSIC0
- SMSC USB3503A hub on HSIC1 with two USB 2.0 host ports
- micro-HDMI port with CEC
- MAX98090 audio codec with a 3.5 mm headphone jack and an on-board
  digital microphone
- MAX77686 PMIC
- 2-pin header for an optional PWM controlled cooling fan
- blue heartbeat LED

Unlike the ODROID-U3, the micro-USB port has no VBUS supply switch, so
it can only work in peripheral mode, and there is no expansion header
with SPI. The 3.5 mm jack is headphone only and the speaker outputs of
the codec are not connected.

Add an initial device tree for the board, based on the ODROID-U3 one,
and update the comments in the common dtsi, as the LDO22 and BUCK8
constraints are now also set by the ODROID-U2.

Also route "HiFi Capture" to "Mixer DAI RX", as on the ODROID-XU3. The
odroid sound card driver adds only the playback routes for boards with
a single CPU DAI, so without it the DPCM capture path to the I2S
back-end is incomplete and recording from the digital microphone fails
with "no backend DAIs enabled for Primary".

Link: https://www.hardkernel.com/shop/odroid-u2/
Link: https://www.hardkernel.com/blog-2/odroid-u2-u-schematics/
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 arch/arm/boot/dts/samsung/Makefile            |   1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |   6 +-
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 139 ++++++++++++++++++
 3 files changed, 143 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts

diff --git a/arch/arm/boot/dts/samsung/Makefile b/arch/arm/boot/dts/samsung/Makefile
index e0143ee8c82d..2a173e4b3e1a 100644
--- a/arch/arm/boot/dts/samsung/Makefile
+++ b/arch/arm/boot/dts/samsung/Makefile
@@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
 	exynos4412-i9305.dtb \
 	exynos4412-itop-elite.dtb \
 	exynos4412-n710x.dtb \
+	exynos4412-odroidu2.dtb \
 	exynos4412-odroidu3.dtb \
 	exynos4412-odroidx.dtb \
 	exynos4412-odroidx2.dtb \
diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
index 93ddbd4b0a18..b56b92c78c1d 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
@@ -414,8 +414,8 @@ ldo21_reg: LDO21 {
 
 			ldo22_reg: LDO22 {
 				/*
-				 * Only U3 uses it, so let it define the
-				 * constraints
+				 * Only U2 and U3 use it, so let them define
+				 * the constraints
 				 */
 				regulator-name = "LDO22";
 				regulator-boot-on;
@@ -486,7 +486,7 @@ buck7_reg: BUCK7 {
 			buck8_reg: BUCK8 {
 				/*
 				 * Constraints set by specific board: X,
-				 * X2 and U3.
+				 * X2, U2 and U3.
 				 */
 				regulator-name = "BUCK8_2.8V";
 			};
diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
new file mode 100644
index 000000000000..5cb5f874b562
--- /dev/null
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardkernel's Exynos4412 based ODROID-U2 board device tree source
+ *
+ * Copyright (c) 2014 Marek Szyprowski <m.szyprowski@samsung.com>
+ * Copyright (c) 2026 Josef Schlehofer <pepe.schlehofer@gmail.com>
+ *
+ * Device tree source file for Hardkernel's ODROID-U2 board which is based
+ * on Samsung's Exynos4412 SoC.
+ */
+
+/dts-v1/;
+#include <dt-bindings/leds/common.h>
+#include "exynos4412-odroid-common.dtsi"
+#include "exynos4412-prime.dtsi"
+
+/ {
+	model = "Hardkernel ODROID-U2 board based on Exynos4412";
+	compatible = "hardkernel,odroid-u2", "samsung,exynos4412", "samsung,exynos4";
+
+	aliases {
+		ethernet = &ethernet;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x7ff00000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led1 {
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&gpc1 0 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	fan0: pwm-fan {
+		compatible = "pwm-fan";
+		pwms = <&pwm 0 10000 0>;
+		#cooling-cells = <2>;
+		cooling-levels = <0 102 170 230>;
+	};
+};
+
+&adc {
+	vdd-supply = <&ldo10_reg>;
+	/* Nothing connected to ADC inputs, keep it disabled */
+};
+
+/* Supply for LAN9730/SMSC95xx */
+&buck8_reg {
+	regulator-name = "BUCK8_P3V3";
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&cpu_thermal {
+	cooling-maps {
+		map0 {
+			trip = <&cpu_alert1>;
+			cooling-device = <&cpu0 9 9>, <&cpu1 9 9>,
+					 <&cpu2 9 9>, <&cpu3 9 9>,
+					 <&fan0 1 2>;
+		};
+		map1 {
+			trip = <&cpu_alert2>;
+			cooling-device = <&cpu0 15 15>, <&cpu1 15 15>,
+					 <&cpu2 15 15>, <&cpu3 15 15>,
+					 <&fan0 2 3>;
+		};
+		map2 {
+			trip = <&cpu_alert0>;
+			cooling-device = <&fan0 0 1>;
+		};
+	};
+};
+
+&ehci {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	phys = <&exynos_usbphy 2>, <&exynos_usbphy 3>;
+	phy-names = "hsic0", "hsic1";
+
+	ethernet: ethernet@2 {
+		compatible = "usb424,9730";
+		reg = <2>;
+		local-mac-address = [00 00 00 00 00 00]; /* Filled in by a bootloader */
+	};
+};
+
+&hdmicec {
+	needs-hpd;
+};
+
+/* No VBUS supply switch on the micro-USB port */
+&hsotg {
+	dr_mode = "peripheral";
+};
+
+/* VDDQ for MSHC (eMMC card) */
+&ldo22_reg {
+	regulator-name = "LDO22_VDDQ_MMC4_2.8V";
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+};
+
+&mshc_0 {
+	vqmmc-supply = <&ldo22_reg>;
+};
+
+&pwm {
+	pinctrl-0 = <&pwm0_out>;
+	pinctrl-names = "default";
+	samsung,pwm-outputs = <0>;
+	status = "okay";
+};
+
+&sound {
+	model = "Odroid-U2";
+	samsung,audio-widgets =
+		"Headphone", "Headphone Jack",
+		"Microphone", "DMIC";
+	audio-routing = "Headphone Jack", "HPL",
+			"Headphone Jack", "HPR",
+			"DMICL", "DMIC",
+			"DMICR", "DMIC",
+			"Mixer DAI RX", "HiFi Capture";
+};
+
+&usb3503 {
+	clock-names = "refclk";
+	clocks = <&pmu_system_controller 0>;
+	refclk-frequency = <24000000>;
+};
-- 
2.54.0 (Apple Git-157)



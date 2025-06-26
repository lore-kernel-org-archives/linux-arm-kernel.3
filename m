Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91498C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 10:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvUriNfYq4CJEv3wfNyKbjZ+G4rVd3Sn1sbgiL7Q6RU=; b=T3IzyJc+Wr9mnsjr4ow5GTKGZ8
	8x0/H2Amg4KpVmPZQMpZDPLYvupu7740vQmYDYkjJrqnhGsOpHG0J9WfrpIMD6bPcjV1QqQs07oM5
	EEW0skY+4zmvYYxAd2PKL5tGedlsZBk0QTsC0sL/AJ6b625c64vX8rDZnyebeO7KZZ0K8dvVncsX8
	03fSouJ46Zv5iePU0NK0Q5XkWiqfpvvhOo9i434itm3gnqlkWD9IrcUSFJ1GQ1ZDUHeUOSyvEF3is
	NwPVmgxzPKiPpAShbKeNoMYXi7Y2HvQ+Ad981NH5ql7UBAXF4eUbMOdc4cbq7ba64yfxFOze4qrJB
	zQfBWkQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjdP-0000000BG0W-3Eqr;
	Thu, 26 Jun 2025 10:15:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjGl-0000000BCov-1n9C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 09:51:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A25BD434C3;
	Thu, 26 Jun 2025 09:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0E1C4CEEE;
	Thu, 26 Jun 2025 09:51:44 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] arm64: dts: renesas: Factor out Gray Hawk Single board support
Date: Thu, 26 Jun 2025 11:51:33 +0200
Message-ID: <a3e89836fde8073ac320734cec67f89ddfa8879a.1750931027.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750931027.git.geert+renesas@glider.be>
References: <cover.1750931027.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_025147_515356_23664499 
X-CRM114-Status: GOOD (  13.87  )
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

Move the common parts for the Renesas Gray Hawk Single board to
gray-hawk-single.dtsi, to enable future reuse.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 ...-hawk-single.dts => gray-hawk-single.dtsi} |  12 +-
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 855 +-----------------
 2 files changed, 5 insertions(+), 862 deletions(-)
 copy arch/arm64/boot/dts/renesas/{r8a779h0-gray-hawk-single.dts => gray-hawk-single.dtsi} (98%)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
similarity index 98%
copy from arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
copy to arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
index 4d890e0617aff947..2edb5cb3407b4590 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 /*
- * Device Tree Source for the R-Car V4M Gray Hawk Single board
+ * Device Tree Source for the Gray Hawk Single board
  *
  * Copyright (C) 2023 Renesas Electronics Corp.
- * Copyright (C) 2024 Glider bv
+ * Copyright (C) 2024-2025 Glider bv
  */
 /*
  * [How to use Sound]
@@ -25,18 +25,14 @@
  *	> arecord xxx hoge.wav
  */
 
-/dts-v1/;
-
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/media/video-interfaces.h>
 
-#include "r8a779h0.dtsi"
-
 / {
-	model = "Renesas Gray Hawk Single board based on r8a779h0";
-	compatible = "renesas,gray-hawk-single", "renesas,r8a779h0";
+	model = "Renesas Gray Hawk Single board";
+	compatible = "renesas,gray-hawk-single";
 
 	aliases {
 		i2c0 = &i2c0;
diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 4d890e0617aff947..1be7836c41f47b0d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -5,866 +5,13 @@
  * Copyright (C) 2023 Renesas Electronics Corp.
  * Copyright (C) 2024 Glider bv
  */
-/*
- * [How to use Sound]
- *
- * Because R-Car V4M has only 1 SSI, it cannot handle both Playback/Capture
- * at the same time. You need to switch the direction which is controlled
- * by the GP0_01 pin via amixer.
- *
- * Playback (CN9500)
- *	> amixer set "MUX" "Playback"	// for GP0_01
- *	> amixer set "DAC 1" 85%
- *	> aplay xxx.wav
- *
- * Capture (CN9501)
- *	> amixer set "MUX" "Capture"	// for GP0_01
- *	> amixer set "Mic 1" 80%
- *	> amixer set "ADC 1" on
- *	> amixer set 'ADC 1' 80%
- *	> arecord xxx hoge.wav
- */
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/leds/common.h>
-#include <dt-bindings/media/video-interfaces.h>
-
 #include "r8a779h0.dtsi"
+#include "gray-hawk-single.dtsi"
 
 / {
 	model = "Renesas Gray Hawk Single board based on r8a779h0";
 	compatible = "renesas,gray-hawk-single", "renesas,r8a779h0";
-
-	aliases {
-		i2c0 = &i2c0;
-		i2c1 = &i2c1;
-		i2c2 = &i2c2;
-		i2c3 = &i2c3;
-		serial0 = &hscif0;
-		serial1 = &hscif2;
-		ethernet0 = &avb0;
-		ethernet1 = &avb1;
-		ethernet2 = &avb2;
-	};
-
-	can_transceiver0: can-phy0 {
-		compatible = "nxp,tjr1443";
-		#phy-cells = <0>;
-		enable-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
-		max-bitrate = <5000000>;
-	};
-
-	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
-		stdout-path = "serial0:921600n8";
-	};
-
-	sn65dsi86_refclk: clk-x6 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <38400000>;
-	};
-
-	keys {
-		compatible = "gpio-keys";
-
-		pinctrl-0 = <&keys_pins>;
-		pinctrl-names = "default";
-
-		key-1 {
-			gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_1>;
-			label = "SW47";
-			wakeup-source;
-			debounce-interval = <20>;
-		};
-
-		key-2 {
-			gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_2>;
-			label = "SW48";
-			wakeup-source;
-			debounce-interval = <20>;
-		};
-
-		key-3 {
-			gpios = <&gpio5 2 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_3>;
-			label = "SW49";
-			wakeup-source;
-			debounce-interval = <20>;
-		};
-	};
-
-	leds {
-		compatible = "gpio-leds";
-
-		led-1 {
-			gpios = <&gpio7 0 GPIO_ACTIVE_HIGH>;
-			color = <LED_COLOR_ID_GREEN>;
-			function = LED_FUNCTION_INDICATOR;
-			function-enumerator = <1>;
-		};
-
-		led-2 {
-			gpios = <&gpio7 1 GPIO_ACTIVE_HIGH>;
-			color = <LED_COLOR_ID_GREEN>;
-			function = LED_FUNCTION_INDICATOR;
-			function-enumerator = <2>;
-		};
-
-		led-3 {
-			gpios = <&gpio7 2 GPIO_ACTIVE_HIGH>;
-			color = <LED_COLOR_ID_GREEN>;
-			function = LED_FUNCTION_INDICATOR;
-			function-enumerator = <3>;
-		};
-	};
-
-	memory@48000000 {
-		device_type = "memory";
-		/* first 128MB is reserved for secure area. */
-		reg = <0x0 0x48000000 0x0 0x78000000>;
-	};
-
-	memory@480000000 {
-		device_type = "memory";
-		reg = <0x4 0x80000000 0x1 0x80000000>;
-	};
-
-	pcie_clk: clk-9fgv0841-pci {
-		compatible = "fixed-clock";
-		clock-frequency = <100000000>;
-		#clock-cells = <0>;
-	};
-
-	mini-dp-con {
-		compatible = "dp-connector";
-		label = "CN5";
-		type = "mini";
-
-		port {
-			mini_dp_con_in: endpoint {
-				remote-endpoint = <&sn65dsi86_out0>;
-			};
-		};
-	};
-
-	reg_1p2v: regulator-1p2v {
-		compatible = "regulator-fixed";
-		regulator-name = "fixed-1.2V";
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <1200000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	reg_1p8v: regulator-1p8v {
-		compatible = "regulator-fixed";
-		regulator-name = "fixed-1.8V";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	reg_3p3v: regulator-3p3v {
-		compatible = "regulator-fixed";
-		regulator-name = "fixed-3.3V";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	sound_mux: sound-mux {
-		compatible = "simple-audio-mux";
-		mux-gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
-		state-labels = "Playback", "Capture";
-	};
-
-	sound_card: sound {
-		compatible = "audio-graph-card2";
-		label = "rcar-sound";
-		aux-devs = <&sound_mux>; // for GP0_01
-
-		links = <&rsnd_port>; // AK4619 Audio Codec
-	};
-};
-
-&audio_clkin {
-	clock-frequency = <24576000>;
-};
-
-&avb0 {
-	pinctrl-0 = <&avb0_pins>;
-	pinctrl-names = "default";
-	phy-handle = <&avb0_phy>;
-	tx-internal-delay-ps = <2000>;
-	status = "okay";
-
-	mdio {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		avb0_phy: ethernet-phy@0 {
-			compatible = "ethernet-phy-id0022.1622",
-				"ethernet-phy-ieee802.3-c22";
-				rxc-skew-ps = <1500>;
-				reg = <0>;
-				interrupts-extended = <&gpio7 5 IRQ_TYPE_LEVEL_LOW>;
-				reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
-		};
-	};
-};
-
-&avb1 {
-	pinctrl-0 = <&avb1_pins>;
-	pinctrl-names = "default";
-	phy-handle = <&avb1_phy>;
-	status = "okay";
-
-	mdio {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reset-gpios = <&gpio6 1 GPIO_ACTIVE_LOW>;
-		reset-post-delay-us = <4000>;
-
-		avb1_phy: ethernet-phy@0 {
-			compatible = "ethernet-phy-ieee802.3-c45";
-			reg = <0>;
-			interrupts-extended = <&gpio6 3 IRQ_TYPE_LEVEL_LOW>;
-		};
-	};
-};
-
-&avb2 {
-	pinctrl-0 = <&avb2_pins>;
-	pinctrl-names = "default";
-	phy-handle = <&avb2_phy>;
-	status = "okay";
-
-	mdio {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reset-gpios = <&gpio5 5 GPIO_ACTIVE_LOW>;
-		reset-post-delay-us = <4000>;
-
-		avb2_phy: ethernet-phy@0 {
-			compatible = "ethernet-phy-ieee802.3-c45";
-			reg = <0>;
-			interrupts-extended = <&gpio5 4 IRQ_TYPE_LEVEL_LOW>;
-		};
-	};
-};
-
-&can_clk {
-	clock-frequency = <40000000>;
-};
-
-&canfd {
-	pinctrl-0 = <&canfd0_pins>, <&canfd1_pins>, <&can_clk_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	channel0 {
-		status = "okay";
-		phys = <&can_transceiver0>;
-	};
-
-	channel1 {
-		status = "okay";
-	};
-};
-
-&csi40 {
-	status = "okay";
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			csi40_in: endpoint {
-				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
-				clock-lanes = <0>;
-				data-lanes = <1 2 3 4>;
-				remote-endpoint = <&max96724_out0>;
-			};
-		};
-	};
-};
-
-&csi41 {
-	status = "okay";
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			csi41_in: endpoint {
-				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
-				clock-lanes = <0>;
-				data-lanes = <1 2 3 4>;
-				remote-endpoint = <&max96724_out1>;
-			};
-		};
-	};
-};
-
-&dsi0 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			reg = <1>;
-
-			dsi0_out: endpoint {
-				remote-endpoint = <&sn65dsi86_in0>;
-				data-lanes = <1 2 3 4>;
-			};
-		};
-	};
-};
-
-&du {
-	status = "okay";
-};
-
-&extal_clk {
-	clock-frequency = <16666666>;
-};
-
-&extalr_clk {
-	clock-frequency = <32768>;
-};
-
-&gpio1 {
-	audio-power-hog {
-		gpio-hog;
-		gpios = <8 GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "Audio-Power";
-	};
-};
-
-&hscif0 {
-	pinctrl-0 = <&hscif0_pins>;
-	pinctrl-names = "default";
-	bootph-all;
-
-	uart-has-rtscts;
-	status = "okay";
-};
-
-&hscif2 {
-	pinctrl-0 = <&hscif2_pins>;
-	pinctrl-names = "default";
-
-	uart-has-rtscts;
-	status = "okay";
-};
-
-&i2c0 {
-	pinctrl-0 = <&i2c0_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-	clock-frequency = <400000>;
-
-	io_expander_a: gpio@20 {
-		compatible = "onnn,pca9654";
-		reg = <0x20>;
-		interrupts-extended = <&gpio0 0 IRQ_TYPE_LEVEL_LOW>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
-
-	io_expander_b: gpio@21 {
-		compatible = "onnn,pca9654";
-		reg = <0x21>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
-	io_expander_c: gpio@22 {
-		compatible = "onnn,pca9654";
-		reg = <0x22>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
-	eeprom@50 {
-		compatible = "rohm,br24g01", "atmel,24c01";
-		label = "cpu-board";
-		reg = <0x50>;
-		pagesize = <8>;
-	};
-
-	eeprom@51 {
-		compatible = "rohm,br24g01", "atmel,24c01";
-		label = "breakout-board";
-		reg = <0x51>;
-		pagesize = <8>;
-	};
-
-	eeprom@52 {
-		compatible = "rohm,br24g01", "atmel,24c01";
-		label = "csi-dsi-sub-board-id";
-		reg = <0x52>;
-		pagesize = <8>;
-	};
-
-	eeprom@53 {
-		compatible = "rohm,br24g01", "atmel,24c01";
-		label = "ethernet-sub-board-id";
-		reg = <0x53>;
-		pagesize = <8>;
-	};
-};
-
-&i2c1 {
-	pinctrl-0 = <&i2c1_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-	clock-frequency = <400000>;
-
-	bridge@2c {
-		pinctrl-0 = <&irq0_pins>;
-		pinctrl-names = "default";
-
-		compatible = "ti,sn65dsi86";
-		reg = <0x2c>;
-
-		clocks = <&sn65dsi86_refclk>;
-		clock-names = "refclk";
-
-		interrupts-extended = <&intc_ex 0 IRQ_TYPE_LEVEL_HIGH>;
-
-		enable-gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
-
-		vccio-supply = <&reg_1p8v>;
-		vpll-supply = <&reg_1p8v>;
-		vcca-supply = <&reg_1p2v>;
-		vcc-supply = <&reg_1p2v>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				sn65dsi86_in0: endpoint {
-					remote-endpoint = <&dsi0_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				sn65dsi86_out0: endpoint {
-					remote-endpoint = <&mini_dp_con_in>;
-				};
-			};
-		};
-	};
-
-	gmsl0: gmsl-deserializer@4e {
-		compatible = "maxim,max96724";
-		reg = <0x4e>;
-		enable-gpios = <&io_expander_b 0 GPIO_ACTIVE_HIGH>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@4 {
-				reg = <4>;
-				max96724_out0: endpoint {
-					bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
-					clock-lanes = <0>;
-					data-lanes = <1 2 3 4>;
-					remote-endpoint = <&csi40_in>;
-				};
-			};
-		};
-	};
-
-	gmsl1: gmsl-deserializer@4f {
-		compatible = "maxim,max96724";
-		reg = <0x4f>;
-		enable-gpios = <&io_expander_c 0 GPIO_ACTIVE_HIGH>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@4 {
-				reg = <4>;
-				max96724_out1: endpoint {
-					bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
-					clock-lanes = <0>;
-					data-lanes = <1 2 3 4>;
-					remote-endpoint = <&csi41_in>;
-				};
-			};
-		};
-	};
-};
-
-&i2c3 {
-	pinctrl-0 = <&i2c3_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-	clock-frequency = <400000>;
-
-	codec@10 {
-		compatible = "asahi-kasei,ak4619";
-		reg = <0x10>;
-
-		clocks = <&rcar_sound>;
-		clock-names = "mclk";
-
-		#sound-dai-cells = <0>;
-		port {
-			ak4619_endpoint: endpoint {
-				remote-endpoint = <&rsnd_endpoint>;
-			};
-		};
-	};
-};
-
-&isp0 {
-	status = "okay";
-};
-
-&isp1 {
-	status = "okay";
-};
-
-&mmc0 {
-	pinctrl-0 = <&mmc_pins>;
-	pinctrl-1 = <&mmc_pins>;
-	pinctrl-names = "default", "state_uhs";
-
-	vmmc-supply = <&reg_3p3v>;
-	vqmmc-supply = <&reg_1p8v>;
-	mmc-hs200-1_8v;
-	mmc-hs400-1_8v;
-	bus-width = <8>;
-	no-sd;
-	no-sdio;
-	non-removable;
-	full-pwr-cycle-in-suspend;
-	status = "okay";
-};
-
-&pcie0_clkref {
-	compatible = "gpio-gate-clock";
-	clocks = <&pcie_clk>;
-	enable-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
-	/delete-property/ clock-frequency;
-};
-
-&pciec0 {
-	reset-gpios = <&io_expander_a 0 GPIO_ACTIVE_LOW>;
-	status = "okay";
-};
-
-&pfc {
-	pinctrl-0 = <&scif_clk_pins>, <&scif_clk2_pins>;
-	pinctrl-names = "default";
-
-	avb0_pins: avb0 {
-		mux {
-			groups = "avb0_link", "avb0_mdio", "avb0_rgmii",
-				 "avb0_txcrefclk";
-			function = "avb0";
-		};
-
-		pins_mdio {
-			groups = "avb0_mdio";
-			drive-strength = <21>;
-		};
-
-		pins_mii {
-			groups = "avb0_rgmii";
-			drive-strength = <21>;
-		};
-	};
-
-	avb1_pins: avb1 {
-		mux {
-			groups = "avb1_link", "avb1_mdio", "avb1_rgmii",
-				 "avb1_txcrefclk";
-			function = "avb1";
-		};
-
-		link {
-			groups = "avb1_link";
-			bias-disable;
-		};
-
-		mdio {
-			groups = "avb1_mdio";
-			drive-strength = <24>;
-			bias-disable;
-		};
-
-		rgmii {
-			groups = "avb1_rgmii";
-			drive-strength = <24>;
-			bias-disable;
-		};
-	};
-
-	avb2_pins: avb2 {
-		mux {
-			groups = "avb2_link", "avb2_mdio", "avb2_rgmii",
-				 "avb2_txcrefclk";
-			function = "avb2";
-		};
-
-		link {
-			groups = "avb2_link";
-			bias-disable;
-		};
-
-		mdio {
-			groups = "avb2_mdio";
-			drive-strength = <24>;
-			bias-disable;
-		};
-
-		rgmii {
-			groups = "avb2_rgmii";
-			drive-strength = <24>;
-			bias-disable;
-		};
-	};
-
-	can_clk_pins: can-clk {
-		groups = "can_clk";
-		function = "can_clk";
-	};
-
-	canfd0_pins: canfd0 {
-		groups = "canfd0_data";
-		function = "canfd0";
-	};
-
-	canfd1_pins: canfd1 {
-		groups = "canfd1_data";
-		function = "canfd1";
-	};
-
-	hscif0_pins: hscif0 {
-		groups = "hscif0_data", "hscif0_ctrl";
-		function = "hscif0";
-	};
-
-	hscif2_pins: hscif2 {
-		groups = "hscif2_data", "hscif2_ctrl";
-		function = "hscif2";
-	};
-
-	i2c0_pins: i2c0 {
-		groups = "i2c0";
-		function = "i2c0";
-	};
-
-	i2c1_pins: i2c1 {
-		groups = "i2c1";
-		function = "i2c1";
-	};
-
-	i2c3_pins: i2c3 {
-		groups = "i2c3";
-		function = "i2c3";
-	};
-
-	irq0_pins: irq0_pins {
-		groups = "intc_ex_irq0_a";
-		function = "intc_ex";
-	};
-
-	keys_pins: keys {
-		pins = "GP_5_0", "GP_5_1", "GP_5_2";
-		bias-pull-up;
-	};
-
-	mmc_pins: mmc {
-		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
-		function = "mmc";
-		power-source = <1800>;
-	};
-
-	qspi0_pins: qspi0 {
-		groups = "qspi0_ctrl", "qspi0_data4";
-		function = "qspi0";
-	};
-
-	scif_clk_pins: scif-clk {
-		groups = "scif_clk";
-		function = "scif_clk";
-	};
-
-	scif_clk2_pins: scif-clk2 {
-		groups = "scif_clk2";
-		function = "scif_clk2";
-	};
-
-	sound_clk_pins: sound_clk {
-		groups = "audio_clkin", "audio_clkout";
-		function = "audio_clk";
-	};
-
-	sound_pins: sound {
-		groups = "ssi_ctrl", "ssi_data";
-		function = "ssi";
-	};
-};
-
-&rcar_sound {
-	pinctrl-0 = <&sound_clk_pins>, <&sound_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	/* audio_clkout */
-	clock-frequency = <12288000>;
-
-	ports {
-		rsnd_port: port {
-			rsnd_endpoint: endpoint {
-				remote-endpoint = <&ak4619_endpoint>;
-				bitclock-master;
-				frame-master;
-
-				/* see above [How to use Sound] */
-				playback = <&ssi0>;
-				capture  = <&ssi0>;
-			};
-		};
-	};
-};
-
-&rpc {
-	pinctrl-0 = <&qspi0_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	flash@0 {
-		compatible = "spansion,s25fs512s", "jedec,spi-nor";
-		reg = <0>;
-		spi-max-frequency = <40000000>;
-		spi-rx-bus-width = <4>;
-
-		partitions {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			boot@0 {
-				reg = <0x0 0x1200000>;
-				read-only;
-			};
-			user@1200000 {
-				reg = <0x1200000 0x2e00000>;
-			};
-		};
-	};
-};
-
-&rwdt {
-	timeout-sec = <60>;
-	status = "okay";
-};
-
-&scif_clk {
-	clock-frequency = <24000000>;
-};
-
-&scif_clk2 {
-	clock-frequency = <24000000>;
-};
-
-&vin00 {
-	status = "okay";
-};
-
-&vin01 {
-	status = "okay";
-};
-
-&vin02 {
-	status = "okay";
-};
-
-&vin03 {
-	status = "okay";
-};
-
-&vin04 {
-	status = "okay";
-};
-
-&vin05 {
-	status = "okay";
-};
-
-&vin06 {
-	status = "okay";
-};
-
-&vin07 {
-	status = "okay";
-};
-
-&vin08 {
-	status = "okay";
-};
-
-&vin09 {
-	status = "okay";
-};
-
-&vin10 {
-	status = "okay";
-};
-
-&vin11 {
-	status = "okay";
-};
-
-&vin12 {
-	status = "okay";
-};
-
-&vin13 {
-	status = "okay";
-};
-
-&vin14 {
-	status = "okay";
-};
-
-&vin15 {
-	status = "okay";
 };
-- 
2.43.0



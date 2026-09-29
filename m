Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCDBCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gVAOg+CglAERDf9i0EXOJpOFx945HqHkWgt7VdcrB4=; b=nY37Gjs77Ljk18okhIA4SN69Qg
	DwIbJfAcd9pOisAQ1NhEm8aOb3BW+mdIQo0+ykGeMRDs7giKgQvXrO9HbdISxfmt0W5HMxVM2f20W
	s7J24ViohCFXigc2htggRRNEx5MH+KnQi/Uuu+c3GdpWBlwPvnysry/RajXOoUwiG0AQPdlrFnQ66
	iOFEweWb3EW+Wg7jCCbsqnjzVZxgfrtUek1+YKSOcRp+kAPsHHwgcRzeOjgon0re1TeASTUBF3eQQ
	oTrCGgTw/h4FoFygqRvGHEWUyFBIcOP21KlXPtdny9kJBorUp3NBYiOqckRJKUG2aEnyMHWvosrds
	qFbYO8Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRSG-00000002U1k-28yr;
	Tue, 29 Sep 2026 06:36:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRSA-00000002TxS-0Pg7;
	Tue, 29 Sep 2026 06:36:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D3AC144840;
	Tue, 29 Sep 2026 06:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F095D1F00898;
	Tue, 29 Sep 2026 06:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663797;
	bh=0gVAOg+CglAERDf9i0EXOJpOFx945HqHkWgt7VdcrB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cv32ElAB7YAMjedTyPXYtXZBnZix9pGN02NBvTf48VAJ94pOFrB/w4AbRlcl9pAT9
	 d3LFaWd8uFCdjlqhhaAI/lgtzuL9hmmRfejtylyfdHzxkU3DyLS75wFh6NpWFzHRjW
	 QCuyYl+YgN3oNQ0b6ByzpteV8p1iJfKY6cQ1cVS3MbjeTC1RJAU/I35AP4ok6VQ1BM
	 L4vWxRWiYMeg1wIXW2Qa3tidIO4HxY8juqLyPju9yVQKRRxDDk/sbrB8ncY+HVN63m
	 tWyvA93SExEln1VazZZZh2zLPb4AqAZJ/4kcIV82TMpM4W8csTSRPFgpJK/Poh7Og3
	 yyB6kz/mxD9kA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 20/20] arm64: dts: synaptics: Add Synaptics SL261X SoC and RDK board
Date: Tue, 29 Sep 2026 14:14:17 +0800
Message-ID: <20260929061417.20733-21-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260929061417.20733-1-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add dts(i) files for the Synaptics SL261X SoCs and corresponding
RDK boards.

The SL261X include five pin-to-pin compatible SoCs: SL2611, SL2613,
SL2615, SL2617, and SL2619.

The corresponding RDK boards are based on the these SoCs.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm64/boot/dts/synaptics/Makefile        |   5 +
 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2611.dtsi     | 490 ++++++++++++++++++
 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2613.dtsi     |  12 +
 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2615.dtsi     |  46 ++
 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2617.dtsi     |  46 ++
 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2619.dtsi     |  44 ++
 .../boot/dts/synaptics/sl261x-rdk-common.dtsi | 135 +++++
 12 files changed, 858 insertions(+)
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2611.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2613.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2615.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2617.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2619.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi

diff --git a/arch/arm64/boot/dts/synaptics/Makefile b/arch/arm64/boot/dts/synaptics/Makefile
index de71ddda6835..810d0d08c2de 100644
--- a/arch/arm64/boot/dts/synaptics/Makefile
+++ b/arch/arm64/boot/dts/synaptics/Makefile
@@ -2,3 +2,8 @@
 # Berlin SoC Family
 dtb-$(CONFIG_ARCH_BERLIN) += berlin4ct-dmp.dtb
 dtb-$(CONFIG_ARCH_BERLIN) += berlin4ct-stb.dtb
+dtb-$(CONFIG_ARCH_BERLIN) += sl2611-rdk.dtb
+dtb-$(CONFIG_ARCH_BERLIN) += sl2613-rdk.dtb
+dtb-$(CONFIG_ARCH_BERLIN) += sl2615-rdk.dtb
+dtb-$(CONFIG_ARCH_BERLIN) += sl2617-rdk.dtb
+dtb-$(CONFIG_ARCH_BERLIN) += sl2619-rdk.dtb
diff --git a/arch/arm64/boot/dts/synaptics/sl2611-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
new file mode 100644
index 000000000000..585872307834
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "sl2611.dtsi"
+#include "sl261x-rdk-common.dtsi"
+
+/ {
+	model = "Synaptics SL2611 RDK";
+	compatible = "syna,sl2611-rdk", "syna,sl2611";
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2611.dtsi b/arch/arm64/boot/dts/synaptics/sl2611.dtsi
new file mode 100644
index 000000000000..1d640ffe4c4b
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2611.dtsi
@@ -0,0 +1,490 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2024 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include <dt-bindings/clock/syna,sl261x.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/syna,sl261x-reset.h>
+
+/ {
+	compatible = "syna,sl2611";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	optee {
+		compatible = "linaro,optee-tz";
+		method = "smc";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x0>;
+			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&L2_0>;
+
+			L2_0: l2-cache {
+				compatible = "cache";
+				cache-size = <65536>;
+				cache-line-size = <64>;
+				cache-sets = <256>;
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3>;
+			};
+		};
+
+		L3: l3-cache0 {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-unified;
+			cache-size = <262144>;
+			cache-line-size = <64>;
+			cache-sets = <256>;
+		};
+
+		idle-states {
+			entry-method = "psci";
+			CPU_SLEEP_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x0010000>;
+				entry-latency-us = <75>;
+				exit-latency-us = <155>;
+				min-residency-us = <50000>;
+			};
+		};
+	};
+
+	osc: osc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	pmu {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0 0xffffffff>;
+
+		sm-bus {
+			compatible = "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			dma-ranges = <0xa0000000 0x00000000 0x10000000>;
+
+			sm_chip: chip-control@e5025000 {
+				compatible = "syna,sl261x-mcu-gbl", "syscon", "simple-mfd";
+				reg = <0xe5025000 0x1000>;
+
+				sm_clk: clock {
+					compatible = "syna,sl261x-system-clk";
+					#clock-cells = <1>;
+					clocks = <&osc>;
+				};
+
+				sm_pinctrl: pin-controller {
+					compatible = "syna,sl261x-system-pinctrl";
+				};
+
+				sm_rst: reset {
+					compatible = "syna,sl261x-system-reset";
+					#reset-cells = <1>;
+				};
+			};
+
+			sm_uart0: serial@e5030000 {
+				compatible = "syna,sl261x-uart", "snps,dw-apb-uart";
+				reg = <0xe5030000 0x100>;
+				interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&sm_clk CLK_SER_UART0>, <&sm_clk CLK_CFG_UART0>;
+				clock-names = "baudclk", "apb_pclk";
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			sm_uart1: serial@e5031000 {
+				compatible = "syna,sl261x-uart", "snps,dw-apb-uart";
+				reg = <0xe5031000 0x100>;
+				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&sm_clk CLK_SER_UART1>, <&sm_clk CLK_CFG_UART1>;
+				clock-names = "baudclk", "apb_pclk";
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			sm_uart2: serial@e5032000 {
+				compatible = "syna,sl261x-uart", "snps,dw-apb-uart";
+				reg = <0xe5032000 0x100>;
+				interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&sm_clk CLK_SER_UART2>, <&sm_clk CLK_CFG_UART2>;
+				clock-names = "baudclk", "apb_pclk";
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			sm_uart3: serial@e5033000 {
+				compatible = "syna,sl261x-uart", "snps,dw-apb-uart";
+				reg = <0xe5033000 0x100>;
+				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&sm_clk CLK_SER_UART3>, <&sm_clk CLK_CFG_UART3>;
+				clock-names = "baudclk", "apb_pclk";
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			sm_spi1: spi@e5034000 {
+				compatible = "syna,sl261x-spi", "snps,dw-apb-ssi";
+				reg = <0xe5034000 0x100>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				num-cs = <4>;
+				clocks = <&sm_clk CLK_SER_SPIM>, <&sm_clk CLK_CFG_SPIM>;
+				clock-names = "ssi_clk", "pclk";
+				interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			sm_i2c0: i2c@e5035000 {
+				compatible = "syna,sl261x-i2c", "snps,designware-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0xe5035000 0x100>;
+				clocks = <&sm_clk CLK_SER_I2CM0>, <&sm_clk CLK_CFG_I2CM0>;
+				clock-names = "ref", "pclk";
+				i2c-sda-falling-time-ns = <510>;
+				i2c-scl-falling-time-ns = <510>;
+				interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			sm_i2c1: i2c@e5036000 {
+				compatible = "syna,sl261x-i2c", "snps,designware-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0xe5036000 0x100>;
+				clocks = <&sm_clk CLK_SER_I2CM1>, <&sm_clk CLK_CFG_I2CM1>;
+				clock-names = "ref", "pclk";
+				i2c-sda-falling-time-ns = <510>;
+				i2c-scl-falling-time-ns = <510>;
+				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			sm_i3c0: i3c@e5037000 {
+				compatible = "syna,sl261x-i3c", "snps,dw-i3c-master-1.00a";
+				#address-cells = <3>;
+				#size-cells = <0>;
+				reg = <0xe5037000 0x1000>;
+				interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&sm_rst RST_SM_I3CSRST>, <&sm_rst RST_SM_I3CPRST>;
+				clocks = <&sm_clk CLK_SER_I3C>, <&sm_clk CLK_CFG_I3C>;
+				clock-names = "core", "apb";
+				status = "disabled";
+			};
+
+			sm_gpio0: gpio@e5038000 {
+				compatible = "snps,dw-apb-gpio";
+				reg = <0xe5038000 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&sm_clk CLK_CFG_GPIO>, <&sm_clk CLK_DEB_GPIO>;
+				clock-names = "bus", "db";
+
+				portc: gpio-port@0 {
+					compatible = "snps,dw-apb-gpio-port";
+					gpio-controller;
+					#gpio-cells = <2>;
+					ngpios = <16>;
+					reg = <0>;
+				};
+			};
+
+			sm_gpio1: gpio@e5039000 {
+				compatible = "snps,dw-apb-gpio";
+				reg = <0xe5039000 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&sm_clk CLK_CFG_GPIO>, <&sm_clk CLK_DEB_GPIO>;
+				clock-names = "bus", "db";
+
+				portd: gpio-port@0 {
+					compatible = "snps,dw-apb-gpio-port";
+					gpio-controller;
+					#gpio-cells = <2>;
+					ngpios = <8>;
+					reg = <0>;
+				};
+			};
+
+			sm_gpio2: gpio@e503a000 {
+				compatible = "snps,dw-apb-gpio";
+				reg = <0xe503a000 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&sm_clk CLK_CFG_GPIO>, <&sm_clk CLK_DEB_GPIO>;
+				clock-names = "bus", "db";
+
+				porte: gpio-port@0 {
+					compatible = "snps,dw-apb-gpio-port";
+					gpio-controller;
+					#gpio-cells = <2>;
+					ngpios = <8>;
+					reg = <0>;
+				};
+			};
+
+			sm_gpio3: gpio@e503b000 {
+				compatible = "snps,dw-apb-gpio";
+				reg = <0xe503b000 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&sm_clk CLK_CFG_GPIO>, <&sm_clk CLK_DEB_GPIO>;
+				clock-names = "bus", "db";
+
+				portf: gpio-port@0 {
+					compatible = "snps,dw-apb-gpio-port";
+					gpio-controller;
+					#gpio-cells = <2>;
+					ngpios = <8>;
+					reg = <0>;
+				};
+			};
+		};
+
+		aviogbl: chip-control@f7490000 {
+			compatible = "syna,sl261x-avio-gbl", "syscon", "simple-mfd";
+			reg = <0xf7490000 0x4000>;
+
+			aioclk: clock {
+				compatible = "syna,sl261x-aio-clk";
+				#clock-cells = <1>;
+				clocks = <&osc>;
+			};
+		};
+
+		chip: chip-control@f7e10000 {
+			compatible = "syna,sl261x-chip-control", "syscon", "simple-mfd";
+			reg = <0xf7e10000 0x10000>;
+
+			clk: clock {
+				compatible = "syna,sl261x-soc-clk";
+				#clock-cells = <1>;
+				clocks = <&osc>;
+			};
+
+			pinctrl: pin-controller {
+				compatible = "syna,sl261x-soc-pinctrl";
+			};
+
+			rst: reset {
+				compatible = "syna,sl261x-soc-reset";
+				#reset-cells = <1>;
+			};
+		};
+
+		cpu_wrap: cpu-wrap@f7e30000{
+			compatible = "syna,sl261x-cpu-wrp", "syscon", "simple-mfd";
+			reg = <0xf7e30000 0x4000>;
+
+			cpuclk: clock {
+				compatible = "syna,sl261x-cpu-clk";
+				#clock-cells = <1>;
+				clocks = <&osc>;
+				syna,gbl-syscon = <&chip>;
+			};
+		};
+
+		gic: interrupt-controller@f7e59000 {
+			compatible = "arm,gic-400";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg = <0xf7e59000 0x1000>,
+			      <0xf7e5a000 0x2000>,
+			      <0xf7e5c000 0x2000>,
+			      <0xf7e5e000 0x2000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+		};
+
+		soc_uart0: serial@f7f00000 {
+			compatible = "syna,sl261x-uart", "snps,dw-apb-uart";
+			reg = <0xf7f00000 0x100>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_APBUART0>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		soc_uart1: serial@f7f01000 {
+			compatible = "syna,sl261x-uart", "snps,dw-apb-uart";
+			reg = <0xf7f01000 0x100>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_APBUART1>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		soc_uart2: serial@f7f02000 {
+			compatible = "syna,sl261x-uart", "snps,dw-apb-uart";
+			reg = <0xf7f02000 0x100>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_APBUART2>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		soc_uart3: serial@f7f03000 {
+			compatible = "syna,sl261x-uart", "snps,dw-apb-uart";
+			reg = <0xf7f03000 0x100>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_APBUART3>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		soc_spi0: spi@f7f04000 {
+			compatible = "syna,sl261x-spi", "snps,dw-apb-ssi";
+			reg = <0xf7f04000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <4>;
+			clocks = <&clk CLK_APBSPI0>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		soc_i2c0: i2c@f7f05000 {
+			compatible = "syna,sl261x-i2c", "snps,designware-i2c";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0xf7f05000 0x100>;
+			clocks = <&clk CLK_APBI2C0>;
+			i2c-sda-hold-time-ns = <449>;
+			i2c-sda-falling-time-ns = <425>;
+			i2c-scl-falling-time-ns = <205>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		soc_i2c1: i2c@f7f06000 {
+			compatible = "syna,sl261x-i2c", "snps,designware-i2c";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0xf7f06000 0x100>;
+			clocks = <&clk CLK_APBI2C1>;
+			i2c-sda-hold-time-ns = <449>;
+			i2c-sda-falling-time-ns = <425>;
+			i2c-scl-falling-time-ns = <205>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		soc_gpio0: gpio@f7f07000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xf7f07000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_APBGPIO>;
+			clock-names = "bus";
+
+			porta: gpio-port@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		soc_spi1: spi@f7f0b000 {
+			compatible = "syna,sl261x-spi", "snps,dw-apb-ssi";
+			reg = <0xf7f0b000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <4>;
+			clocks = <&clk CLK_APBSPI1>;
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		soc_spi2: spi@f7f0c000 {
+			compatible = "syna,sl261x-spi", "snps,dw-apb-ssi";
+			reg = <0xf7f0c000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <4>;
+			clocks = <&clk CLK_APBSPI2>;
+			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		soc_spi3: spi@f7f0d000 {
+			compatible = "syna,sl261x-spi", "snps,dw-apb-ssi";
+			reg = <0xf7f0d000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <4>;
+			clocks = <&clk CLK_APBSPI3>;
+			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		soc_gpio1: gpio@f7f0e000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xf7f0e000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_APBGPIO>;
+			clock-names = "bus";
+
+			portb: gpio-port@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2613-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
new file mode 100644
index 000000000000..de75c9fab6a2
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "sl2613.dtsi"
+#include "sl261x-rdk-common.dtsi"
+
+/ {
+	model = "Synaptics SL2613 RDK";
+	compatible = "syna,sl2613-rdk", "syna,sl2613";
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2613.dtsi b/arch/arm64/boot/dts/synaptics/sl2613.dtsi
new file mode 100644
index 000000000000..379809901677
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2613.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include "sl2611.dtsi"
+
+/ {
+	compatible = "syna,sl2613";
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2615-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
new file mode 100644
index 000000000000..ae03638a3a53
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "sl2615.dtsi"
+#include "sl261x-rdk-common.dtsi"
+
+/ {
+	model = "Synaptics SL2615 RDK";
+	compatible = "syna,sl2615-rdk", "syna,sl2615";
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2615.dtsi b/arch/arm64/boot/dts/synaptics/sl2615.dtsi
new file mode 100644
index 000000000000..11b1fe316aa6
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2615.dtsi
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include "sl2613.dtsi"
+
+/ {
+	compatible = "syna,sl2615";
+
+	cpus {
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x100>;
+			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&L2_1>;
+
+			L2_1: l2-cache {
+				compatible = "cache";
+				cache-size = <65536>;
+				cache-line-size = <64>;
+				cache-sets = <256>;
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3>;
+			};
+		};
+	};
+
+	pmu {
+		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2617-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
new file mode 100644
index 000000000000..ba4ea21ac505
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "sl2617.dtsi"
+#include "sl261x-rdk-common.dtsi"
+
+/ {
+	model = "Synaptics SL2617 RDK";
+	compatible = "syna,sl2617-rdk", "syna,sl2617";
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2617.dtsi b/arch/arm64/boot/dts/synaptics/sl2617.dtsi
new file mode 100644
index 000000000000..a0de686d1fae
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2617.dtsi
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include "sl2613.dtsi"
+
+/ {
+	compatible = "syna,sl2617";
+
+	cpus {
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x100>;
+			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&L2_1>;
+
+			L2_1: l2-cache {
+				compatible = "cache";
+				cache-size = <65536>;
+				cache-line-size = <64>;
+				cache-sets = <256>;
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3>;
+			};
+		};
+	};
+
+	pmu {
+		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
new file mode 100644
index 000000000000..58901ac2a050
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "sl2619.dtsi"
+#include "sl261x-rdk-common.dtsi"
+
+/ {
+	model = "Synaptics SL2619 RDK";
+	compatible = "syna,sl2619-rdk", "syna,sl2619";
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2619.dtsi b/arch/arm64/boot/dts/synaptics/sl2619.dtsi
new file mode 100644
index 000000000000..96bd58bbed3e
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2619.dtsi
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include "sl2613.dtsi"
+
+/ {
+	cpus {
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x100>;
+			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&L2_1>;
+
+			L2_1: l2-cache {
+				compatible = "cache";
+				cache-size = <65536>;
+				cache-line-size = <64>;
+				cache-sets = <256>;
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3>;
+			};
+		};
+	};
+
+	pmu {
+		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi b/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
new file mode 100644
index 000000000000..78a9b28fdf99
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+
+/ {
+	aliases {
+		serial0 = &sm_uart0;
+		serial1 = &sm_uart1;
+		serial2 = &sm_uart2;
+		serial3 = &sm_uart3;
+		serial4 = &soc_uart0;
+		serial5 = &soc_uart1;
+		serial6 = &soc_uart2;
+		serial7 = &soc_uart3;
+		i2c0 = &sm_i2c0;
+		i2c1 = &sm_i2c1;
+		i2c2 = &soc_i2c0;
+		i2c3 = &soc_i2c1;
+		spi1 = &sm_spi1;
+		spi2 = &soc_spi0;
+		spi3 = &soc_spi1;
+		spi4 = &soc_spi2;
+		spi5 = &soc_spi3;
+	};
+
+	cpus {
+		cpu@0 {
+			cpu0-supply = <&vcore>;
+		};
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+		bootargs = "earlycon";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x00000000 0x0 0x80000000>;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&pinctrl {
+	soc_i2c0_pmux: soc_i2c0-pmux {
+		groups = "GPIO23", "GPIO24";
+		function = "tw2";
+		drive-strength = <7>;
+	};
+};
+
+&sm_pinctrl {
+	sm_i2c0_pmux: i2c0-pmux {
+		groups = "SM_GPIO12", "SM_GPIO13";
+		function = "tw0";
+		drive-strength = <7>;
+	};
+
+	sm_i2c1_pmux: i2c1-pmux {
+		groups = "SM_GPIO3", "SM_GPIO4";
+		function = "tw1";
+		drive-strength = <7>;
+	};
+
+	vcore_gpio_pmux: vcore-gpio-pmux {
+		groups = "SM_GPIO5";
+		function = "gpio";
+	};
+};
+
+&sm_uart0 {
+	status = "okay";
+};
+
+&sm_i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&sm_i2c0_pmux>;
+	clock-frequency = <100000>;
+
+	expander0: gpio@43 {
+		compatible = "fcs,fxl6408";
+		reg = <0x43>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	expander1: gpio@44 {
+		compatible = "fcs,fxl6408";
+		reg = <0x44>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&sm_i2c1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&sm_i2c1_pmux>;
+	clock-frequency = <100000>;
+
+	vcore: regulator@60 {
+		compatible = "silergy,sy8827n";
+		reg = <0x60>;
+		regulator-name = "vcore";
+		regulator-min-microvolt = <700000>;
+		regulator-max-microvolt = <987500>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-active-discharge = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcore_gpio_pmux>;
+		enable-gpios = <&portc 5 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&soc_i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&soc_i2c0_pmux>;
+	clock-frequency = <100000>;
+};
+
+&sm_uart1 {
+	status = "okay";
+};
-- 
2.53.0



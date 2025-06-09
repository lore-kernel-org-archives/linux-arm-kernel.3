Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF10C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 21:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yG0oj2VNmk7YPDop1AgxVGyBjWfCMmS3XchrQBvM2kk=; b=MOOybA1KQqBVsGsS5B1DsXVlx0
	3qAeQvbGqS+WleI6DOjSdja7Ao3UI17kyOHa22WyNxWCDuPgr1FPee1jOPOytaODGqtA8rTIDYxVE
	PH+ZfQWl/fN00MPogd6LnBlQX8B10Vx65kslwoaWmABkkf6gO7T++wkzgFpbghLVTGluN/95wFH9B
	4d0xenxHIo7wORN5NFdgQgUx4ZUZeE4eEC9o/QrQTftZQx4HMgH8lQRzhXpTc6va2XdKv7AreC7oi
	Wrd+rSvuI29XPb2EubpxLavoobTRQCvbsHCnS3bNubno/3d0OivZQuin2MaV9Ql2Gwj9WrcV2W3zO
	Ug6OyuFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOkWi-00000005J49-23HO;
	Mon, 09 Jun 2025 21:59:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOkST-00000005IjY-2Qmw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 21:55:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72582629E5;
	Mon,  9 Jun 2025 21:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC08EC4CEF3;
	Mon,  9 Jun 2025 21:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749506108;
	bh=ttAImCmMUiZa42qLOdbBpMNlTYXYgg2QF6vqlW3LybQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HqUaVlSLGqox2BCS7PcJFaI0NkOu9scsN9bc2w3cHU2Cc1wDoPbAOsftEVticUhef
	 PHLgu8FkDXyfSYJ1qgiC4jk43RnAIGm/ANwYAswUrHfa0je+0qmbGM90sw02ColpUy
	 2G/R86fCPuk3kYRBzHA1sV9Fblkm1BQu9VcvqdWvHo6HxLgkw2YTtUoJ6qXvxrPLzh
	 TZbWosMnrEmzmYpXwKt1v0tcevkQpGiP8Fw8S/O9C9E4+/kRpYYdgWlHKUOtgaVNMq
	 Lw61cIczqH3wHl7R4GgntLgX7fku/esLaquvhMLyj56PiDhcQiaLVXpUq/sm1gNZZb
	 qYnR8eSxjbHhg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 09 Jun 2025 16:54:56 -0500
Subject: [PATCH 1/2] arm64: dts: lg: Refactor common LG1312 and LG1313
 parts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-dt-lg-fixes-v1-1-e210e797c2d7@kernel.org>
References: <20250609-dt-lg-fixes-v1-0-e210e797c2d7@kernel.org>
In-Reply-To: <20250609-dt-lg-fixes-v1-0-e210e797c2d7@kernel.org>
To: soc@kernel.org, Chanho Min <chanho.min@lge.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
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

The LG1312 and LG1313 DT are almost identical with the exception of the
ethernet node. Refactor the common parts into a separate .dtsi file and
include it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/lg/lg1312.dtsi | 324 +-----------------------------------
 arch/arm64/boot/dts/lg/lg1313.dtsi | 324 +-----------------------------------
 arch/arm64/boot/dts/lg/lg131x.dtsi | 333 +++++++++++++++++++++++++++++++++++++
 3 files changed, 337 insertions(+), 644 deletions(-)

diff --git a/arch/arm64/boot/dts/lg/lg1312.dtsi b/arch/arm64/boot/dts/lg/lg1312.dtsi
index bb0bcc6875dc..e83fdc92621e 100644
--- a/arch/arm64/boot/dts/lg/lg1312.dtsi
+++ b/arch/arm64/boot/dts/lg/lg1312.dtsi
@@ -5,103 +5,12 @@
  * Copyright (C) 2016, LG Electronics
  */
 
-#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-/ {
-	#address-cells = <2>;
-	#size-cells = <2>;
+#include "lg131x.dtsi"
 
+/ {
 	compatible = "lge,lg1312";
-	interrupt-parent = <&gic>;
-
-	cpus {
-		#address-cells = <2>;
-		#size-cells = <0>;
-
-		cpu0: cpu@0 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x0>;
-			next-level-cache = <&L2_0>;
-		};
-		cpu1: cpu@1 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x1>;
-			enable-method = "psci";
-			next-level-cache = <&L2_0>;
-		};
-		cpu2: cpu@2 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x2>;
-			enable-method = "psci";
-			next-level-cache = <&L2_0>;
-		};
-		cpu3: cpu@3 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x3>;
-			enable-method = "psci";
-			next-level-cache = <&L2_0>;
-		};
-		L2_0: l2-cache0 {
-			compatible = "cache";
-			cache-level = <2>;
-			cache-unified;
-		};
-	};
-
-	psci {
-		compatible = "arm,psci-0.2", "arm,psci";
-		method = "smc";
-		cpu_suspend = <0x84000001>;
-		cpu_off = <0x84000002>;
-		cpu_on = <0x84000003>;
-	};
-
-	gic: interrupt-controller@c0001000 {
-		#interrupt-cells = <3>;
-		compatible = "arm,gic-400";
-		interrupt-controller;
-		reg = <0x0 0xc0001000 0x1000>,
-		      <0x0 0xc0002000 0x2000>,
-		      <0x0 0xc0004000 0x2000>,
-		      <0x0 0xc0006000 0x2000>;
-	};
-
-	pmu {
-		compatible = "arm,cortex-a53-pmu";
-		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-affinity = <&cpu0>,
-				     <&cpu1>,
-				     <&cpu2>,
-				     <&cpu3>;
-	};
-
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_RAW(0x0f) |
-			      IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 14 (GIC_CPU_MASK_RAW(0x0f) |
-			      IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_RAW(0x0f) |
-			      IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 10 (GIC_CPU_MASK_RAW(0x0f) |
-			      IRQ_TYPE_LEVEL_LOW)>;
-	};
-
-	clk_bus: clk_bus {
-		#clock-cells = <0>;
-
-		compatible = "fixed-clock";
-		clock-frequency = <198000000>;
-		clock-output-names = "BUSCLK";
-	};
 
 	soc {
 		#address-cells = <2>;
@@ -122,233 +31,4 @@ eth0: ethernet@c1b00000 {
 			mac-address = [ 00 00 00 00 00 00 ];
 		};
 	};
-
-	amba {
-		#address-cells = <2>;
-		#size-cells = <1>;
-
-		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
-		ranges;
-
-		timers: timer@fd100000 {
-			compatible = "arm,sp804", "arm,primecell";
-			reg = <0x0 0xfd100000 0x1000>;
-			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>, <&clk_bus>, <&clk_bus>;
-			clock-names = "timer0clk", "timer1clk", "apb_pclk";
-		};
-		wdog: watchdog@fd200000 {
-			compatible = "arm,sp805", "arm,primecell";
-			reg = <0x0 0xfd200000 0x1000>;
-			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>, <&clk_bus>;
-			clock-names = "wdog_clk", "apb_pclk";
-		};
-		uart0: serial@fe000000 {
-			compatible = "arm,pl011", "arm,primecell";
-			reg = <0x0 0xfe000000 0x1000>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		uart1: serial@fe100000 {
-			compatible = "arm,pl011", "arm,primecell";
-			reg = <0x0 0xfe100000 0x1000>;
-			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		uart2: serial@fe200000 {
-			compatible = "arm,pl011", "arm,primecell";
-			reg = <0x0 0xfe200000 0x1000>;
-			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		spi0: spi@fe800000 {
-			compatible = "arm,pl022", "arm,primecell";
-			reg = <0x0 0xfe800000 0x1000>;
-			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>, <&clk_bus>;
-			clock-names = "sspclk", "apb_pclk";
-		};
-		spi1: spi@fe900000 {
-			compatible = "arm,pl022", "arm,primecell";
-			reg = <0x0 0xfe900000 0x1000>;
-			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>, <&clk_bus>;
-			clock-names = "sspclk", "apb_pclk";
-		};
-		dmac0: dma-controller@c1128000 {
-			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x0 0xc1128000 0x1000>;
-			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			#dma-cells = <1>;
-		};
-		gpio0: gpio@fd400000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd400000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio1: gpio@fd410000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd410000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio2: gpio@fd420000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd420000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio3: gpio@fd430000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd430000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-		};
-		gpio4: gpio@fd440000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd440000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio5: gpio@fd450000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd450000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio6: gpio@fd460000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd460000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio7: gpio@fd470000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd470000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio8: gpio@fd480000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd480000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio9: gpio@fd490000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd490000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio10: gpio@fd4a0000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd4a0000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio11: gpio@fd4b0000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd4b0000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-		};
-		gpio12: gpio@fd4c0000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd4c0000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio13: gpio@fd4d0000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd4d0000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio14: gpio@fd4e0000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd4e0000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio15: gpio@fd4f0000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd4f0000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio16: gpio@fd500000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd500000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio17: gpio@fd510000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd510000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-		};
-	};
 };
diff --git a/arch/arm64/boot/dts/lg/lg1313.dtsi b/arch/arm64/boot/dts/lg/lg1313.dtsi
index c07d670bc465..92fa5694cad1 100644
--- a/arch/arm64/boot/dts/lg/lg1313.dtsi
+++ b/arch/arm64/boot/dts/lg/lg1313.dtsi
@@ -5,103 +5,12 @@
  * Copyright (C) 2016, LG Electronics
  */
 
-#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-/ {
-	#address-cells = <2>;
-	#size-cells = <2>;
+#include "lg131x.dtsi"
 
+/ {
 	compatible = "lge,lg1313";
-	interrupt-parent = <&gic>;
-
-	cpus {
-		#address-cells = <2>;
-		#size-cells = <0>;
-
-		cpu0: cpu@0 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x0>;
-			next-level-cache = <&L2_0>;
-		};
-		cpu1: cpu@1 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x1>;
-			enable-method = "psci";
-			next-level-cache = <&L2_0>;
-		};
-		cpu2: cpu@2 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x2>;
-			enable-method = "psci";
-			next-level-cache = <&L2_0>;
-		};
-		cpu3: cpu@3 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x3>;
-			enable-method = "psci";
-			next-level-cache = <&L2_0>;
-		};
-		L2_0: l2-cache0 {
-			compatible = "cache";
-			cache-level = <2>;
-			cache-unified;
-		};
-	};
-
-	psci {
-		compatible = "arm,psci-0.2", "arm,psci";
-		method = "smc";
-		cpu_suspend = <0x84000001>;
-		cpu_off = <0x84000002>;
-		cpu_on = <0x84000003>;
-	};
-
-	gic: interrupt-controller@c0001000 {
-		#interrupt-cells = <3>;
-		compatible = "arm,gic-400";
-		interrupt-controller;
-		reg = <0x0 0xc0001000 0x1000>,
-		      <0x0 0xc0002000 0x2000>,
-		      <0x0 0xc0004000 0x2000>,
-		      <0x0 0xc0006000 0x2000>;
-	};
-
-	pmu {
-		compatible = "arm,cortex-a53-pmu";
-		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-affinity = <&cpu0>,
-				     <&cpu1>,
-				     <&cpu2>,
-				     <&cpu3>;
-	};
-
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_RAW(0x0f) |
-			      IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 14 (GIC_CPU_MASK_RAW(0x0f) |
-			      IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_RAW(0x0f) |
-			      IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 10 (GIC_CPU_MASK_RAW(0x0f) |
-			      IRQ_TYPE_LEVEL_LOW)>;
-	};
-
-	clk_bus: clk_bus {
-		#clock-cells = <0>;
-
-		compatible = "fixed-clock";
-		clock-frequency = <198000000>;
-		clock-output-names = "BUSCLK";
-	};
 
 	soc {
 		#address-cells = <2>;
@@ -122,233 +31,4 @@ eth0: ethernet@c3700000 {
 			mac-address = [ 00 00 00 00 00 00 ];
 		};
 	};
-
-	amba {
-		#address-cells = <2>;
-		#size-cells = <1>;
-
-		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
-		ranges;
-
-		timers: timer@fd100000 {
-			compatible = "arm,sp804", "arm,primecell";
-			reg = <0x0 0xfd100000 0x1000>;
-			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>, <&clk_bus>, <&clk_bus>;
-			clock-names = "timer0clk", "timer1clk", "apb_pclk";
-		};
-		wdog: watchdog@fd200000 {
-			compatible = "arm,sp805", "arm,primecell";
-			reg = <0x0 0xfd200000 0x1000>;
-			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>, <&clk_bus>;
-			clock-names = "wdog_clk", "apb_pclk";
-		};
-		uart0: serial@fe000000 {
-			compatible = "arm,pl011", "arm,primecell";
-			reg = <0x0 0xfe000000 0x1000>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		uart1: serial@fe100000 {
-			compatible = "arm,pl011", "arm,primecell";
-			reg = <0x0 0xfe100000 0x1000>;
-			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		uart2: serial@fe200000 {
-			compatible = "arm,pl011", "arm,primecell";
-			reg = <0x0 0xfe200000 0x1000>;
-			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		spi0: spi@fe800000 {
-			compatible = "arm,pl022", "arm,primecell";
-			reg = <0x0 0xfe800000 0x1000>;
-			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>, <&clk_bus>;
-			clock-names = "sspclk", "apb_pclk";
-		};
-		spi1: spi@fe900000 {
-			compatible = "arm,pl022", "arm,primecell";
-			reg = <0x0 0xfe900000 0x1000>;
-			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>, <&clk_bus>;
-			clock-names = "sspclk", "apb_pclk";
-		};
-		dmac0: dma-controller@c1128000 {
-			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x0 0xc1128000 0x1000>;
-			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			#dma-cells = <1>;
-		};
-		gpio0: gpio@fd400000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd400000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio1: gpio@fd410000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd410000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio2: gpio@fd420000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd420000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio3: gpio@fd430000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd430000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-		};
-		gpio4: gpio@fd440000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd440000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio5: gpio@fd450000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd450000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio6: gpio@fd460000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd460000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio7: gpio@fd470000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd470000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio8: gpio@fd480000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd480000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio9: gpio@fd490000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd490000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio10: gpio@fd4a0000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd4a0000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio11: gpio@fd4b0000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd4b0000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-		};
-		gpio12: gpio@fd4c0000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd4c0000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio13: gpio@fd4d0000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd4d0000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio14: gpio@fd4e0000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd4e0000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio15: gpio@fd4f0000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd4f0000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio16: gpio@fd500000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd500000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-			status = "disabled";
-		};
-		gpio17: gpio@fd510000 {
-			#gpio-cells = <2>;
-			compatible = "arm,pl061", "arm,primecell";
-			gpio-controller;
-			reg = <0x0 0xfd510000 0x1000>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
-		};
-	};
 };
diff --git a/arch/arm64/boot/dts/lg/lg131x.dtsi b/arch/arm64/boot/dts/lg/lg131x.dtsi
new file mode 100644
index 000000000000..dc4229bd9ebb
--- /dev/null
+++ b/arch/arm64/boot/dts/lg/lg131x.dtsi
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dts file for lg131x SoCs
+ *
+ * Copyright (C) 2016, LG Electronics
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x0>;
+			next-level-cache = <&L2_0>;
+		};
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x1>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x2>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x3>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+		L2_0: l2-cache0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2", "arm,psci";
+		method = "smc";
+		cpu_suspend = <0x84000001>;
+		cpu_off = <0x84000002>;
+		cpu_on = <0x84000003>;
+	};
+
+	gic: interrupt-controller@c0001000 {
+		#interrupt-cells = <3>;
+		compatible = "arm,gic-400";
+		interrupt-controller;
+		reg = <0x0 0xc0001000 0x1000>,
+		      <0x0 0xc0002000 0x2000>,
+		      <0x0 0xc0004000 0x2000>,
+		      <0x0 0xc0006000 0x2000>;
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>,
+				     <&cpu2>,
+				     <&cpu3>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_RAW(0x0f) |
+			      IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_RAW(0x0f) |
+			      IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_RAW(0x0f) |
+			      IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_RAW(0x0f) |
+			      IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	clk_bus: clk_bus {
+		#clock-cells = <0>;
+
+		compatible = "fixed-clock";
+		clock-frequency = <198000000>;
+		clock-output-names = "BUSCLK";
+	};
+
+	amba {
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		timers: timer@fd100000 {
+			compatible = "arm,sp804", "arm,primecell";
+			reg = <0x0 0xfd100000 0x1000>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_bus>, <&clk_bus>, <&clk_bus>;
+			clock-names = "timer0clk", "timer1clk", "apb_pclk";
+		};
+		wdog: watchdog@fd200000 {
+			compatible = "arm,sp805", "arm,primecell";
+			reg = <0x0 0xfd200000 0x1000>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_bus>, <&clk_bus>;
+			clock-names = "wdog_clk", "apb_pclk";
+		};
+		uart0: serial@fe000000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x0 0xfe000000 0x1000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+		uart1: serial@fe100000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x0 0xfe100000 0x1000>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+		uart2: serial@fe200000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x0 0xfe200000 0x1000>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+		spi0: spi@fe800000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x0 0xfe800000 0x1000>;
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_bus>, <&clk_bus>;
+			clock-names = "sspclk", "apb_pclk";
+		};
+		spi1: spi@fe900000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x0 0xfe900000 0x1000>;
+			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_bus>, <&clk_bus>;
+			clock-names = "sspclk", "apb_pclk";
+		};
+		dmac0: dma-controller@c1128000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x0 0xc1128000 0x1000>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+		};
+		gpio0: gpio@fd400000 {
+			#gpio-cells = <2>;
+			compatible = "arm,pl061", "arm,primecell";
+			gpio-controller;
+			reg = <0x0 0xfd400000 0x1000>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+		gpio1: gpio@fd410000 {
+			#gpio-cells = <2>;
+			compatible = "arm,pl061", "arm,primecell";
+			gpio-controller;
+			reg = <0x0 0xfd410000 0x1000>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+		gpio2: gpio@fd420000 {
+			#gpio-cells = <2>;
+			compatible = "arm,pl061", "arm,primecell";
+			gpio-controller;
+			reg = <0x0 0xfd420000 0x1000>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+		gpio3: gpio@fd430000 {
+			#gpio-cells = <2>;
+			compatible = "arm,pl061", "arm,primecell";
+			gpio-controller;
+			reg = <0x0 0xfd430000 0x1000>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+		};
+		gpio4: gpio@fd440000 {
+			#gpio-cells = <2>;
+			compatible = "arm,pl061", "arm,primecell";
+			gpio-controller;
+			reg = <0x0 0xfd440000 0x1000>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+		gpio5: gpio@fd450000 {
+			#gpio-cells = <2>;
+			compatible = "arm,pl061", "arm,primecell";
+			gpio-controller;
+			reg = <0x0 0xfd450000 0x1000>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+		gpio6: gpio@fd460000 {
+			#gpio-cells = <2>;
+			compatible = "arm,pl061", "arm,primecell";
+			gpio-controller;
+			reg = <0x0 0xfd460000 0x1000>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+		gpio7: gpio@fd470000 {
+			#gpio-cells = <2>;
+			compatible = "arm,pl061", "arm,primecell";
+			gpio-controller;
+			reg = <0x0 0xfd470000 0x1000>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+		gpio8: gpio@fd480000 {
+			#gpio-cells = <2>;
+			compatible = "arm,pl061", "arm,primecell";
+			gpio-controller;
+			reg = <0x0 0xfd480000 0x1000>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+		gpio9: gpio@fd490000 {
+			#gpio-cells = <2>;
+			compatible = "arm,pl061", "arm,primecell";
+			gpio-controller;
+			reg = <0x0 0xfd490000 0x1000>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+		gpio10: gpio@fd4a0000 {
+			#gpio-cells = <2>;
+			compatible = "arm,pl061", "arm,primecell";
+			gpio-controller;
+			reg = <0x0 0xfd4a0000 0x1000>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+		gpio11: gpio@fd4b0000 {
+			#gpio-cells = <2>;
+			compatible = "arm,pl061", "arm,primecell";
+			gpio-controller;
+			reg = <0x0 0xfd4b0000 0x1000>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+		};
+		gpio12: gpio@fd4c0000 {
+			#gpio-cells = <2>;
+			compatible = "arm,pl061", "arm,primecell";
+			gpio-controller;
+			reg = <0x0 0xfd4c0000 0x1000>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+		gpio13: gpio@fd4d0000 {
+			#gpio-cells = <2>;
+			compatible = "arm,pl061", "arm,primecell";
+			gpio-controller;
+			reg = <0x0 0xfd4d0000 0x1000>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+		gpio14: gpio@fd4e0000 {
+			#gpio-cells = <2>;
+			compatible = "arm,pl061", "arm,primecell";
+			gpio-controller;
+			reg = <0x0 0xfd4e0000 0x1000>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+		gpio15: gpio@fd4f0000 {
+			#gpio-cells = <2>;
+			compatible = "arm,pl061", "arm,primecell";
+			gpio-controller;
+			reg = <0x0 0xfd4f0000 0x1000>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+		gpio16: gpio@fd500000 {
+			#gpio-cells = <2>;
+			compatible = "arm,pl061", "arm,primecell";
+			gpio-controller;
+			reg = <0x0 0xfd500000 0x1000>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+		gpio17: gpio@fd510000 {
+			#gpio-cells = <2>;
+			compatible = "arm,pl061", "arm,primecell";
+			gpio-controller;
+			reg = <0x0 0xfd510000 0x1000>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+		};
+	};
+};

-- 
2.47.2



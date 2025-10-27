Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D04CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foyH+aoRLo6GC5TKTNlul3Fh01wAPhJNJtTNNNmY5UU=; b=xoAwQa/r1DshiT/D89mItXoXYW
	Pu15A3ZMP5mMwoCzqa/+7k4FniN58p/de69JXA63dT36fN2HG0ubfx5U76C+gdm/2sWvyU1/6KOSC
	Tw89VHhlTsdj4rnf9aqlf9Bdp1sFZozFE/f/c10YgU2T22gHiS6Pc3TOHI2rKiGTCWjVXAjYBNL8A
	YPBpI9vcx728hSabD68Cy9D9X6lymEAHzDYdWzc7sFcb0INQ16C2GJzeElfWKnPYRqAyljXR/wNWB
	OQY/fNIdDMZ7xlI8hZLogmqEcHGSV9T8+/yfECfb37KES+Nw6XvhlTb4/7FvQEouXtMuqjtwjRSb5
	CSzzF74g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmX-0000000DwxY-17dD;
	Mon, 27 Oct 2025 12:57:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmV-0000000Dwws-0ohm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:57:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C6F3601D4;
	Mon, 27 Oct 2025 12:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C0CBC4CEFF;
	Mon, 27 Oct 2025 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761569821;
	bh=6zf3HJ4SFn/da8903S5Ji6WZxaAKcw0a+EFVvyPIafQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d8WqVO9ewM2f4dpadJXwH1G+wsCxcKw+wOJe7fbd8xZMraDijIwwWQJwC0V9Go5Lh
	 4vK02KElzkfrDwK1vZhMHZ5llNawWQZumn5YFXJ4quAz4mBIgNF5zG4aTM/TQz4cXs
	 GUXF84eXaQVjeoWxqOW509eQtGbWJAhI3t1ow1bkZvCduTMC/wZRyo6Vc3bcDa7qPC
	 YJzJOQW280WqEtSGg5mYR8Yb7+1TRtAmOqZKZHXKU2TQyck8DwKpZz3RtITkg+ZY5C
	 ACYpBno32losPmltjPYDo+5no/FlkpPBRAvi5BVTXg4O8XfISPeOABN9teHdWiZ04Q
	 XCJEEeDHWJL6g==
Received: by wens.tw (Postfix, from userid 1000)
	id 933FB5FF71; Mon, 27 Oct 2025 20:56:57 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 05/10] arm64: dts: allwinner: a523: Add DMA controller device nodes
Date: Mon, 27 Oct 2025 20:56:46 +0800
Message-ID: <20251027125655.793277-6-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027125655.793277-1-wens@kernel.org>
References: <20251027125655.793277-1-wens@kernel.org>
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

The A523 has two DMA controllers. Add device nodes for both. Also hook
up DMA for existing devices.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index a9e051a8bea3..8edbd3873199 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -241,6 +241,8 @@ uart0: serial@2500000 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART0>;
 			resets = <&ccu RST_BUS_UART0>;
+			dmas = <&dma 14>, <&dma 14>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -252,6 +254,8 @@ uart1: serial@2500400 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART1>;
 			resets = <&ccu RST_BUS_UART1>;
+			dmas = <&dma 15>, <&dma 15>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -263,6 +267,8 @@ uart2: serial@2500800 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART2>;
 			resets = <&ccu RST_BUS_UART2>;
+			dmas = <&dma 16>, <&dma 16>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -274,6 +280,8 @@ uart3: serial@2500c00 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART3>;
 			resets = <&ccu RST_BUS_UART3>;
+			dmas = <&dma 17>, <&dma 17>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -285,6 +293,8 @@ uart4: serial@2501000 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART4>;
 			resets = <&ccu RST_BUS_UART4>;
+			dmas = <&dma 18>, <&dma 18>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -296,6 +306,8 @@ uart5: serial@2501400 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART5>;
 			resets = <&ccu RST_BUS_UART5>;
+			dmas = <&dma 19>, <&dma 19>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -307,6 +319,8 @@ uart6: serial@2501800 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART6>;
 			resets = <&ccu RST_BUS_UART6>;
+			dmas = <&dma 20>, <&dma 20>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -318,6 +332,8 @@ uart7: serial@2501c00 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART7>;
 			resets = <&ccu RST_BUS_UART7>;
+			dmas = <&dma 21>, <&dma 21>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -329,6 +345,8 @@ i2c0: i2c@2502000 {
 			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_I2C0>;
 			resets = <&ccu RST_BUS_I2C0>;
+			dmas = <&dma 43>, <&dma 43>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -342,6 +360,8 @@ i2c1: i2c@2502400 {
 			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_I2C1>;
 			resets = <&ccu RST_BUS_I2C1>;
+			dmas = <&dma 44>, <&dma 44>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -355,6 +375,8 @@ i2c2: i2c@2502800 {
 			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_I2C2>;
 			resets = <&ccu RST_BUS_I2C2>;
+			dmas = <&dma 45>, <&dma 45>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -368,6 +390,8 @@ i2c3: i2c@2502c00 {
 			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_I2C3>;
 			resets = <&ccu RST_BUS_I2C3>;
+			dmas = <&dma 46>, <&dma 46>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -381,6 +405,8 @@ i2c4: i2c@2503000 {
 			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_I2C4>;
 			resets = <&ccu RST_BUS_I2C4>;
+			dmas = <&dma 47>, <&dma 47>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -394,6 +420,8 @@ i2c5: i2c@2503400 {
 			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_I2C5>;
 			resets = <&ccu RST_BUS_I2C5>;
+			dmas = <&dma 48>, <&dma 48>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -408,6 +436,19 @@ syscon: syscon@3000000 {
 			ranges;
 		};
 
+		dma: dma-controller@3002000 {
+			compatible = "allwinner,sun55i-a523-dma",
+				     "allwinner,sun50i-a100-dma";
+			reg = <0x03002000 0x1000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_DMA>, <&ccu CLK_MBUS_DMA>;
+			clock-names = "bus", "mbus";
+			dma-channels = <16>;
+			dma-requests = <54>;
+			resets = <&ccu RST_BUS_DMA>;
+			#dma-cells = <1>;
+		};
+
 		sid: efuse@3006000 {
 			compatible = "allwinner,sun55i-a523-sid",
 				     "allwinner,sun50i-a64-sid";
@@ -729,6 +770,8 @@ r_i2c0: i2c@7081400 {
 			reg = <0x07081400 0x400>;
 			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&r_ccu CLK_BUS_R_I2C0>;
+			dmas = <&dma 49>, <&dma 49>;
+			dma-names = "rx", "tx";
 			resets = <&r_ccu RST_BUS_R_I2C0>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&r_i2c_pins>;
@@ -775,6 +818,19 @@ mcu_ccu: clock-controller@7102000 {
 			#reset-cells = <1>;
 		};
 
+		mcu_dma: dma-controller@7121000 {
+			compatible = "allwinner,sun55i-a523-mcu-dma",
+				     "allwinner,sun50i-a100-dma";
+			reg = <0x07121000 0x1000>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mcu_ccu CLK_BUS_MCU_DMA>, <&mcu_ccu CLK_MCU_MBUS_DMA>;
+			clock-names = "bus", "mbus";
+			dma-channels = <16>;
+			dma-requests = <15>;
+			resets = <&mcu_ccu RST_BUS_MCU_DMA>;
+			#dma-cells = <1>;
+		};
+
 		npu: npu@7122000 {
 			compatible = "vivante,gc";
 			reg = <0x07122000 0x1000>;
-- 
2.47.3



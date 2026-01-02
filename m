Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89402FA3728
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 17:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRRzdzFRHhsXT6Yo6El5CbEcWCjuHTiGu4A8YJyZsrE=; b=FLfMvChHmhUG26fS30Bx7+XuxD
	0TR5YDDqei5ghylVIFKfVWcNBTYedLz9l5yD9JLmzUg2rI2NG0nGzYgrS3TpVGLDxQBK1qaYzIkPI
	c0lNbjEFm8geJ4/LFycIl7wzB2VJTf8cP8WdfeZlKyNjv4GJQLgpt2ZDonA78c1A/AQv0sMij1Ds5
	xYBM+5KftSw7Lvz5jOFd5RfDRQ5MviETKLmz1dGBM0Tb+fA+SJM1fJuT6qc1olDBz0Sgsai8H4QMJ
	iXECpS38SnRWVuFzloELIw4vdZbO6YlTU0ZBHtF2kKPdD9k4OERrG5BQySy6RPp+SSQAHjfhO9VrB
	J7/V3DEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbiXE-00000008Wff-2R4X;
	Fri, 02 Jan 2026 17:01:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbiXA-00000008We7-07ty
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 17:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1767373311; x=1798909311;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m2csuiSvqhqW6MbfpzWu0Dpjoi7rMVe0Q1kp+hepEd8=;
  b=ho3rrg40R/HF6sD4gIn837bO566vO4E6M6SBT+r4qVKADPDn6VtbgS9f
   o6QuZh3q9DyLzCzzYTh/QPEjTry6RH2uGVWPmRvg5Cgqb5Ihu0Xp5Lv5u
   JkeWBpoSHioYHKTVB81mEjniEi8Hb7ypPw1hB2kcT2seeYXaCHKyAuxgM
   lOQwxXskf03GhW6qwfuDpvKKsTFZwmqfcDmV/pcW1vJreRE3Jp6t0qIiO
   QkpmuvJVKuxK3ROkXus0IBcDFQCLkOEVR3B6sy5MdZCn9CIbtVtVoRpof
   mdgqxf7kTrCAB/2W5zA686hlSevg6O90vdUG8UIYLVZHImtg0nBRLwmn2
   w==;
X-CSE-ConnectionGUID: dCrVUlstT/WCgDlJ76zoeQ==
X-CSE-MsgGUID: TW1raM+mT9+5b5vAwHyAaQ==
X-IronPort-AV: E=Sophos;i="6.21,197,1763449200"; 
   d="scan'208";a="58167748"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 10:01:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 2 Jan 2026 10:01:47 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 2 Jan 2026 10:01:45 -0700
From: <nicolas.ferre@microchip.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Balamanikandan Gunasundar
	<balamanikandan.gunasundar@microchip.com>, Ryan Wanner
	<ryan.wanner@microchip.com>, Conor Dooley <conor.dooley@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH 5/5] ARM: dts: microchip: sama7d65: add missing flexcom nodes
Date: Fri, 2 Jan 2026 18:01:34 +0100
Message-ID: <20260102170135.70717-6-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102170135.70717-1-nicolas.ferre@microchip.com>
References: <20260102170135.70717-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_090152_083024_66969C9D 
X-CRM114-Status: GOOD (  11.11  )
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

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Add nodes for usart, spi and i2c when missing to the
flexcom nodes.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 271 ++++++++++++++++++++++
 1 file changed, 271 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 82781a1dbd6d..e21556f46384 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -419,6 +419,21 @@ uart0: serial@200 {
 				status = "disabled";
 			};
 
+			spi0: spi@400 {
+				compatible = "microchip,sama7d65-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 34>;
+				clock-names = "spi_clk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dma1 AT91_XDMAC_DT_PERID(6)>,
+				       <&dma1 AT91_XDMAC_DT_PERID(5)>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
+
 			i2c0: i2c@600 {
 				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
@@ -443,6 +458,22 @@ flx1: flexcom@e1824000 {
 			#size-cells = <1>;
 			status = "disabled";
 
+			uart1: serial@200 {
+				compatible = "microchip,sama7d65-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 35>;
+				clock-names = "usart";
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(8)>,
+				       <&dma0 AT91_XDMAC_DT_PERID(7)>;
+				dma-names = "tx", "rx";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				atmel,fifo-size = <32>;
+				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
+				status = "disabled";
+			};
+
 			spi1: spi@400 {
 				compatible = "microchip,sama7d65-spi", "atmel,at91rm9200-spi";
 				reg = <0x400 0x200>;
@@ -497,6 +528,35 @@ uart2: serial@200 {
 				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
 				status = "disabled";
 			};
+
+			spi2: spi@400 {
+				compatible = "microchip,sama7d65-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
+				clock-names = "spi_clk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dma1 AT91_XDMAC_DT_PERID(10)>,
+				       <&dma1 AT91_XDMAC_DT_PERID(9)>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@600 {
+				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dma1 AT91_XDMAC_DT_PERID(10)>,
+				       <&dma1 AT91_XDMAC_DT_PERID(9)>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
 		};
 
 		flx3: flexcom@e182c000 {
@@ -524,6 +584,21 @@ uart3: serial@200 {
 				status = "disabled";
 			};
 
+			spi3: spi@400 {
+				compatible = "microchip,sama7d65-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 37>;
+				clock-names = "spi_clk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(12)>,
+				       <&dma0 AT91_XDMAC_DT_PERID(11)>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
+
 			i2c3: i2c@600 {
 				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
@@ -579,6 +654,20 @@ spi4: spi@400 {
 				atmel,fifo-size = <32>;
 				status = "disabled";
 			};
+
+			i2c4: i2c@600 {
+				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 38>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dma1 AT91_XDMAC_DT_PERID(14)>,
+				       <&dma1 AT91_XDMAC_DT_PERID(13)>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
 		};
 
 		flx5: flexcom@e201c000 {
@@ -590,6 +679,37 @@ flx5: flexcom@e201c000 {
 			#size-cells = <1>;
 			status = "disabled";
 
+			uart5: serial@200 {
+				compatible = "microchip,sama7d65-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 39>;
+				clock-names = "usart";
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(16)>,
+				       <&dma0 AT91_XDMAC_DT_PERID(15)>;
+				dma-names = "tx", "rx";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				atmel,fifo-size = <32>;
+				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
+				status = "disabled";
+			};
+
+			spi5: spi@400 {
+				compatible = "microchip,sama7d65-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 39>;
+				clock-names = "spi_clk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(16)>,
+				       <&dma0 AT91_XDMAC_DT_PERID(15)>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
+
 			i2c5: i2c@600 {
 				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
@@ -629,6 +749,35 @@ uart6: serial@200 {
 				atmel,fifo-size = <32>;
 				status = "disabled";
 			};
+
+			spi6: spi@400 {
+				compatible = "microchip,sama7d65-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 40>;
+				clock-names = "spi_clk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dma1 AT91_XDMAC_DT_PERID(18)>,
+				       <&dma1 AT91_XDMAC_DT_PERID(17)>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
+
+			i2c6: i2c@600 {
+				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 40>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dma1 AT91_XDMAC_DT_PERID(18)>,
+				       <&dma1 AT91_XDMAC_DT_PERID(17)>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
 		};
 
 		flx7: flexcom@e2024000 {
@@ -655,6 +804,35 @@ uart7: serial@200 {
 				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
 				status = "disabled";
 			};
+
+			spi7: spi@400 {
+				compatible = "microchip,sama7d65-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 41>;
+				clock-names = "spi_clk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dma1 AT91_XDMAC_DT_PERID(20)>,
+				       <&dma1 AT91_XDMAC_DT_PERID(19)>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
+
+			i2c7: i2c@600 {
+				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 41>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dma1 AT91_XDMAC_DT_PERID(20)>,
+				       <&dma1 AT91_XDMAC_DT_PERID(19)>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
 		};
 
 		flx8: flexcom@e281c000 {
@@ -666,6 +844,37 @@ flx8: flexcom@e281c000 {
 			#size-cells = <1>;
 			status = "disabled";
 
+			uart8: serial@200 {
+				compatible = "microchip,sama7d65-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 42>;
+				clock-names = "usart";
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(22)>,
+				       <&dma0 AT91_XDMAC_DT_PERID(21)>;
+				dma-names = "tx", "rx";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				atmel,fifo-size = <32>;
+				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
+				status = "disabled";
+			};
+
+			spi8: spi@400 {
+				compatible = "microchip,sama7d65-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 42>;
+				clock-names = "spi_clk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(22)>,
+				       <&dma0 AT91_XDMAC_DT_PERID(21)>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
+
 			i2c8: i2c@600 {
 				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
@@ -690,6 +899,37 @@ flx9: flexcom@e2820000 {
 			#size-cells = <1>;
 			status = "disabled";
 
+			uart9: serial@200 {
+				compatible = "microchip,sama7d65-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 43>;
+				clock-names = "usart";
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(24)>,
+				       <&dma0 AT91_XDMAC_DT_PERID(23)>;
+				dma-names = "tx", "rx";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				atmel,fifo-size = <32>;
+				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
+				status = "disabled";
+			};
+
+			spi9: spi@400 {
+				compatible = "microchip,sama7d65-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 43>;
+				clock-names = "spi_clk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(24)>,
+				       <&dma0 AT91_XDMAC_DT_PERID(23)>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
+
 			i2c9: i2c@600 {
 				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
@@ -714,6 +954,37 @@ flx10: flexcom@e2824000 {
 			#size-cells = <1>;
 			status = "disabled";
 
+			uart10: serial@200 {
+				compatible = "microchip,sama7d65-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 44>;
+				clock-names = "usart";
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(26)>,
+				       <&dma0 AT91_XDMAC_DT_PERID(25)>;
+				dma-names = "tx", "rx";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				atmel,fifo-size = <32>;
+				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
+				status = "disabled";
+			};
+
+			spi10: spi@400 {
+				compatible = "microchip,sama7d65-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 44>;
+				clock-names = "spi_clk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(26)>,
+				       <&dma0 AT91_XDMAC_DT_PERID(25)>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
+
 			i2c10: i2c@600 {
 				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
-- 
2.43.0



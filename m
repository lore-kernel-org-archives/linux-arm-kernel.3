Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6548BC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 11:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=XFjtB0pW6tGVJfA0KceLKHbGvXE3/ySSaiXjJcdn7X0=; b=ZCtLWamfcvtn4RY9PB2nb0i94C
	0XefXQTanz10XfuVACYs8RSav2j19GzAabP+Q9uHSA2rMwyTrzBbbGXTuycUM3L1LLPlpXXinRkvE
	BaofeKmwv5nmURhcJgIt0yZCbFNTKcJvtKmG+4GXmZ9y7p2uMFSEqyR4hEj5rvgRo++z1KsQg8TOf
	xrQIUpRCN1dThWu6D8JcQM+FY+hI4jI4PGURhYz1pIY0vUSO60Skgtjzov7eO6tRkECzr2c9kTRSt
	s8czwwSknJ2vHFjR+8EkaVtyObpXWGkNan8p8SLxFymWJB5Jj7GnYku6HUxeGH+XsMbE9GSi7w+MI
	ARefIuVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2cr-0000000GBVS-2jgo;
	Fri, 13 Jun 2025 11:31:16 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ1dy-0000000G4my-3pwU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 10:28:21 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250613102812epoutp019580736decaa97df0d93e0df13e36c39~Ik18mmp1q2948929489epoutp01D
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 10:28:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250613102812epoutp019580736decaa97df0d93e0df13e36c39~Ik18mmp1q2948929489epoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749810492;
	bh=XFjtB0pW6tGVJfA0KceLKHbGvXE3/ySSaiXjJcdn7X0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=GKhlpo3JF/Gfze8g4zn4XDeLlB6++UT0qrnmQdFQ8B6pve00GPesxDmOKQVxpo0p9
	 wPTY5Kgast5k0rpB8gEeUubIb7D3vEiHJyi5HlEJZsxS3vDSb8V4YOHfwIyaUxsZFl
	 97zIWQvvWn/xQzXFZmm7hwNvl0+FWfmXScmqlI9s=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250613102811epcas5p496f8f78e5d2fca45eebaea6ee8d5b006~Ik18AeflD1496114961epcas5p40;
	Fri, 13 Jun 2025 10:28:11 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.182]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bJbFj4xkxz6B9mK; Fri, 13 Jun
	2025 10:28:09 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250613061230epcas5p12c0a029edba39133fc0be22cb0aa1e09~IhWsp7ag10704107041epcas5p1B;
	Fri, 13 Jun 2025 06:12:30 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250613061229epsmtip195b14527b12542d3a7f95eb5ed59db5f~IhWrYd2qn1749817498epsmtip1i;
	Fri, 13 Jun 2025 06:12:29 +0000 (GMT)
From: Faraz Ata <faraz.ata@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, Faraz Ata <faraz.ata@samsung.com>
Subject: [PATCH v1] arm64: dts: exynos: Add DT node for all SPI ports
Date: Fri, 13 Jun 2025 11:52:08 +0530
Message-Id: <20250613062208.978641-1-faraz.ata@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250613061230epcas5p12c0a029edba39133fc0be22cb0aa1e09
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613061230epcas5p12c0a029edba39133fc0be22cb0aa1e09
References: <CGME20250613061230epcas5p12c0a029edba39133fc0be22cb0aa1e09@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_032819_612416_A0373835 
X-CRM114-Status: GOOD (  14.25  )
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

Universal Serial Interface (USI) supports three serial protocol
like uart, i2c and spi. ExynosAutov920 has 18 instances of USI.
Add spi nodes for all the instances.

Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 361 ++++++++++++++++++
 1 file changed, 361 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 2cb8041c8a9f..aa4798b1363c 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -455,6 +455,26 @@ serial_0: serial@10880000 {
 				samsung,uart-fifosize = <256>;
 				status = "disabled";
 			};
+
+			spi_0: spi@10880000 {
+				compatible = "samsung,exynosautov920-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x10880000 0x30>;
+				interrupts = <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi0_bus &spi0_cs_func>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
+				clock-names = "spi", "spi_busclk0";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 1>, <&pdma0 0>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <256>;
+				status = "disabled";
+			};
 		};
 
 		usi_1: usi@108a00c0 {
@@ -484,6 +504,26 @@ serial_1: serial@108a0000 {
 				samsung,uart-fifosize = <256>;
 				status = "disabled";
 			};
+
+			spi_1: spi@108a0000 {
+				compatible = "samsung,exynosautov920-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x108a0000 0x30>;
+				interrupts = <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi1_bus &spi1_cs_func>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI01_USI>;
+				clock-names = "spi", "spi_busclk0";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 3>, <&pdma0 2>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <256>;
+				status = "disabled";
+			};
 		};
 
 		usi_2: usi@108c00c0 {
@@ -513,6 +553,26 @@ serial_2: serial@108c0000 {
 				samsung,uart-fifosize = <64>;
 				status = "disabled";
 			};
+
+			spi_2: spi@108c0000 {
+				compatible = "samsung,exynosautov920-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x108c0000 0x30>;
+				interrupts = <GIC_SPI 768 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi2_bus &spi2_cs_func>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI02_USI>;
+				clock-names = "spi", "spi_busclk0";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 5>, <&pdma0 4>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi_3: usi@108e00c0 {
@@ -542,6 +602,26 @@ serial_3: serial@108e0000 {
 				samsung,uart-fifosize = <64>;
 				status = "disabled";
 			};
+
+			spi_3: spi@108e0000 {
+				compatible = "samsung,exynosautov920-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x108e0000 0x30>;
+				interrupts = <GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi3_bus &spi3_cs_func>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI03_USI>;
+				clock-names = "spi", "spi_busclk0";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 7>, <&pdma0 6>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi_4: usi@109000c0 {
@@ -571,6 +651,26 @@ serial_4: serial@10900000 {
 				samsung,uart-fifosize = <64>;
 				status = "disabled";
 			};
+
+			spi_4: spi@10900000 {
+				compatible = "samsung,exynosautov920-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x10900000 0x30>;
+				interrupts = <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi4_bus &spi4_cs_func>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI04_USI>;
+				clock-names = "spi", "spi_busclk0";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 9>, <&pdma0 8>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi_5: usi@109200c0 {
@@ -600,6 +700,26 @@ serial_5: serial@10920000 {
 				samsung,uart-fifosize = <64>;
 				status = "disabled";
 			};
+
+			spi_5: spi@10920000 {
+				compatible = "samsung,exynosautov920-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x10920000 0x30>;
+				interrupts = <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi5_bus &spi5_cs_func>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI05_USI>;
+				clock-names = "spi", "spi_busclk0";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 11>, <&pdma0 10>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi_6: usi@109400c0 {
@@ -629,6 +749,26 @@ serial_6: serial@10940000 {
 				samsung,uart-fifosize = <64>;
 				status = "disabled";
 			};
+
+			spi_6: spi@10940000 {
+				compatible = "samsung,exynosautov920-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x10940000 0x30>;
+				interrupts = <GIC_SPI 776 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi6_bus &spi6_cs_func>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI06_USI>;
+				clock-names = "spi", "spi_busclk0";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 13>, <&pdma0 12>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi_7: usi@109600c0 {
@@ -658,6 +798,26 @@ serial_7: serial@10960000 {
 				samsung,uart-fifosize = <64>;
 				status = "disabled";
 			};
+
+			spi_7: spi@10960000 {
+				compatible = "samsung,exynosautov920-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x10960000 0x30>;
+				interrupts = <GIC_SPI 778 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi7_bus &spi7_cs_func>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI07_USI>;
+				clock-names = "spi", "spi_busclk0";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 15>, <&pdma0 14>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi_8: usi@109800c0 {
@@ -687,6 +847,27 @@ serial_8: serial@10980000 {
 				samsung,uart-fifosize = <64>;
 				status = "disabled";
 			};
+
+			spi_8: spi@10980000 {
+				compatible = "samsung,exynosautov920-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x10980000 0x30>;
+				interrupts = <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi8_bus &spi8_cs_func>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI08_USI>;
+				clock-names = "spi", "spi_busclk0";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 17>, <&pdma0 16>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <64>;
+				status = "disabled";
+			};
+
 		};
 
 		pwm: pwm@109b0000 {
@@ -752,6 +933,26 @@ serial_9: serial@10c8000 {
 				samsung,uart-fifosize = <256>;
 				status = "disabled";
 			};
+
+			spi_9: spi@10c80000 {
+				compatible = "samsung,exynosautov920-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x10c80000 0x30>;
+				interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi9_bus &spi9_cs_func>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI09_USI>;
+				clock-names = "spi", "spi_busclk0";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma1 1>, <&pdma1 0>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <256>;
+				status = "disabled";
+			};
 		};
 
 		usi_10: usi@10ca00c0 {
@@ -781,6 +982,26 @@ serial_10: serial@10ca0000 {
 				samsung,uart-fifosize = <64>;
 				status = "disabled";
 			};
+
+			spi_10: spi@10ca0000 {
+				compatible = "samsung,exynosautov920-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x10ca0000 0x30>;
+				interrupts = <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi10_bus &spi10_cs_func>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI10_USI>;
+				clock-names = "spi", "spi_busclk0";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma1 3>, <&pdma1 2>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi_11: usi@10cc00c0 {
@@ -810,6 +1031,26 @@ serial_11: serial@10cc0000 {
 				samsung,uart-fifosize = <64>;
 				status = "disabled";
 			};
+
+			spi_11: spi@10cc0000 {
+				compatible = "samsung,exynosautov920-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x10cc0000 0x30>;
+				interrupts = <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi11_bus &spi11_cs_func>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI11_USI>;
+				clock-names = "spi", "spi_busclk0";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma1 5>, <&pdma1 4>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi_12: usi@10ce00c0 {
@@ -839,6 +1080,26 @@ serial_12: serial@10ce0000 {
 				samsung,uart-fifosize = <64>;
 				status = "disabled";
 			};
+
+			spi_12: spi@10ce0000 {
+				compatible = "samsung,exynosautov920-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x10ce0000 0x30>;
+				interrupts = <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi12_bus &spi12_cs_func>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI12_USI>;
+				clock-names = "spi", "spi_busclk0";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma1 7>, <&pdma1 6>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi_13: usi@10d000c0 {
@@ -868,6 +1129,26 @@ serial_13: serial@10d00000 {
 				samsung,uart-fifosize = <64>;
 				status = "disabled";
 			};
+
+			spi_13: spi@10d00000 {
+				compatible = "samsung,exynosautov920-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x10d00000 0x30>;
+				interrupts = <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi13_bus &spi13_cs_func>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI13_USI>;
+				clock-names = "spi", "spi_busclk0";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma1 9>, <&pdma1 8>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi_14: usi@10d200c0 {
@@ -897,6 +1178,26 @@ serial_14: serial@10d20000 {
 				samsung,uart-fifosize = <64>;
 				status = "disabled";
 			};
+
+			spi_14: spi@10d20000 {
+				compatible = "samsung,exynosautov920-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x10d20000 0x30>;
+				interrupts = <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi14_bus &spi14_cs_func>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI14_USI>;
+				clock-names = "spi", "spi_busclk0";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma1 11>, <&pdma1 10>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi_15: usi@10d400c0 {
@@ -926,6 +1227,26 @@ serial_15: serial@10d40000 {
 				samsung,uart-fifosize = <64>;
 				status = "disabled";
 			};
+
+			spi_15: spi@10d40000 {
+				compatible = "samsung,exynosautov920-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x10d40000 0x30>;
+				interrupts = <GIC_SPI 799 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi15_bus &spi15_cs_func>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI15_USI>;
+				clock-names = "spi", "spi_busclk0";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma1 13>, <&pdma1 12>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi_16: usi@10d600c0 {
@@ -955,6 +1276,26 @@ serial_16: serial@10d60000 {
 				samsung,uart-fifosize = <64>;
 				status = "disabled";
 			};
+
+			spi_16: spi@10d60000 {
+				compatible = "samsung,exynosautov920-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x10d60000 0x30>;
+				interrupts = <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi16_bus &spi16_cs_func>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI16_USI>;
+				clock-names = "spi", "spi_busclk0";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma1 15>, <&pdma1 14>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi_17: usi@10d800c0 {
@@ -984,6 +1325,26 @@ serial_17: serial@10d80000 {
 				samsung,uart-fifosize = <64>;
 				status = "disabled";
 			};
+
+			spi_17: spi@10d80000 {
+				compatible = "samsung,exynosautov920-spi",
+					     "samsung,exynos850-spi";
+				reg = <0x10d80000 0x30>;
+				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi17_bus &spi17_cs_func>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI17_USI>;
+				clock-names = "spi", "spi_busclk0";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma1 17>, <&pdma1 16>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				fifo-depth = <64>;
+				status = "disabled";
+			};
 		};
 
 		cmu_top: clock-controller@11000000 {
-- 
2.34.1



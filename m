Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98366CCD188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 10:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFhZfewjZvS+DM54AZzO9vDzCwDLq24WPxuHHTclaVU=; b=S4Dk+//ZW4EVDok/teeJ14b6ps
	a1MFDClAoGJHYm9A10MHbtjCelYy1bzXt0BibpcFSZ8BLbDupYyI0IxIJjg+LkmhnY6WRz8FIVqI9
	az9r3HZgS4z04g6q/t0b+sZwuksfCm3u5iDPpp580mk0/eXR++x5kmTausLO0iqIhuI3LU66CxXLi
	kcBJO656TGccWe8sOj0J/ydsbey2EXzFriV5gBlQq1v1Kc49De/f38r7u0cUUw3lUZRxKdoxFmh69
	wcoYwRMKAWCy4vWmID3UGdxE7PLckwbqq42lLGBpTIi8CVnR02Q1fyVPP6bRkF8+vXRXbaqQRvFEv
	EXUPc/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nba-00000005kXl-3GdY;
	Thu, 09 Oct 2025 10:10:38 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nbW-00000005kWA-0PaP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 10:10:35 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251009101030epoutp040db45a10a61e65286eac9dfb33cc51ff~syuLzcc9s1643916439epoutp04A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Oct 2025 10:10:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251009101030epoutp040db45a10a61e65286eac9dfb33cc51ff~syuLzcc9s1643916439epoutp04A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760004630;
	bh=kFhZfewjZvS+DM54AZzO9vDzCwDLq24WPxuHHTclaVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gBXcfS9L4u1WhEx41OpnfeQ9b6b9nWfR2ho/hc+ok2cUTtoKSU8bUc4wZB6YJUGaG
	 1fwtcdBIY7deBd/Zs451pJeAmzJJwwYbBTHvH8C7x8rNduocsUdRD9qxoTMXR+mpj5
	 uSkbHDL2yJNh6K3EqqPZfTUUJ18LN0sv0PQupIrE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251009101029epcas5p47310451ab8227e4ca3cdbd0cd893b423~syuLC-UNw0751707517epcas5p4l;
	Thu,  9 Oct 2025 10:10:29 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.89]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cj5Gr4lyVz6B9m5; Thu,  9 Oct
	2025 10:10:28 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251009101027epcas5p249214ced403b82c4fb7085006901504b~syuJKZ3Iu3029330293epcas5p2H;
	Thu,  9 Oct 2025 10:10:27 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251009101025epsmtip26a475b09c691b3b59d1aa5f33c797937~syuHWLJEi0437904379epsmtip2U;
	Thu,  9 Oct 2025 10:10:25 +0000 (GMT)
From: Faraz Ata <faraz.ata@samsung.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com,
	Faraz Ata <faraz.ata@samsung.com>
Subject: [RESEND PATCH 2/2] arm64: dts: exynosautov920: Add DT node for all
 I2C ports
Date: Thu,  9 Oct 2025 15:49:11 +0530
Message-Id: <20251009101911.2802433-2-faraz.ata@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009101911.2802433-1-faraz.ata@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251009101027epcas5p249214ced403b82c4fb7085006901504b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251009101027epcas5p249214ced403b82c4fb7085006901504b
References: <20251009101911.2802433-1-faraz.ata@samsung.com>
	<CGME20251009101027epcas5p249214ced403b82c4fb7085006901504b@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_031034_462160_63E835AD 
X-CRM114-Status: GOOD (  12.74  )
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
Add i2c nodes for all the instances.

Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
---
Note: This patch was previously sent separately. Resending now as part of a
two-patch series, as it depends on the preceding patch for base functionality[2]

- Reference: [2] https://lore.kernel.org/all/202509070957.JQ0aDCvj-lkp@intel.com/

 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 845 ++++++++++++++++++
 1 file changed, 845 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 0fdf2062930a..53cf3f04cee0 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -26,6 +26,42 @@ aliases {
 		pinctrl5 = &pinctrl_hsi2ufs;
 		pinctrl6 = &pinctrl_peric0;
 		pinctrl7 = &pinctrl_peric1;
+		i2c0 = &hsi2c_0;
+		i2c1 = &hsi2c_1;
+		i2c2 = &hsi2c_2;
+		i2c3 = &hsi2c_3;
+		i2c4 = &hsi2c_4;
+		i2c5 = &hsi2c_5;
+		i2c6 = &hsi2c_6;
+		i2c7 = &hsi2c_7;
+		i2c8 = &hsi2c_8;
+		i2c9 = &hsi2c_9;
+		i2c10 = &hsi2c_10;
+		i2c11 = &hsi2c_11;
+		i2c12 = &hsi2c_12;
+		i2c13 = &hsi2c_13;
+		i2c14 = &hsi2c_14;
+		i2c15 = &hsi2c_15;
+		i2c16 = &hsi2c_16;
+		i2c17 = &hsi2c_17;
+		i2c18 = &hsi2c_18;
+		i2c19 = &hsi2c_19;
+		i2c20 = &hsi2c_20;
+		i2c21 = &hsi2c_21;
+		i2c22 = &hsi2c_22;
+		i2c23 = &hsi2c_23;
+		i2c24 = &hsi2c_24;
+		i2c25 = &hsi2c_25;
+		i2c26 = &hsi2c_26;
+		i2c27 = &hsi2c_27;
+		i2c28 = &hsi2c_28;
+		i2c29 = &hsi2c_29;
+		i2c30 = &hsi2c_30;
+		i2c31 = &hsi2c_31;
+		i2c32 = &hsi2c_32;
+		i2c33 = &hsi2c_33;
+		i2c34 = &hsi2c_34;
+		i2c35 = &hsi2c_35;
 	};
 
 	arm-pmu {
@@ -475,6 +511,51 @@ spi_0: spi@10880000 {
 				fifo-depth = <256>;
 				status = "disabled";
 			};
+
+			hsi2c_0: i2c@10880000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10880000 0xc0>;
+				interrupts = <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c0_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_0: usi@108900c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x108900c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1004>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_1: i2c@10890000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10890000 0xc0>;
+				interrupts = <GIC_SPI 763 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c1_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_1: usi@108a00c0 {
@@ -524,6 +605,51 @@ spi_1: spi@108a0000 {
 				fifo-depth = <256>;
 				status = "disabled";
 			};
+
+			hsi2c_2: i2c@108a0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108a0000 0xc0>;
+				interrupts = <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c2_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI01_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_1: usi@108b00c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x108b00c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x100c>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_3: i2c@108b0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108b0000 0xc0>;
+				interrupts = <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c3_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_2: usi@108c00c0 {
@@ -573,6 +699,51 @@ spi_2: spi@108c0000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_4: i2c@108c0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108c0000 0xc0>;
+				interrupts = <GIC_SPI 768 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c4_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI02_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_2: usi@108d00c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x108d00c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1004>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_5: i2c@108d0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108d0000 0xc0>;
+				interrupts = <GIC_SPI 767 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c5_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_3: usi@108e00c0 {
@@ -622,6 +793,51 @@ spi_3: spi@108e0000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_6: i2c@108e0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108e0000 0xc0>;
+				interrupts = <GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c6_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI03_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_3: usi@108f00c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x108f00c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x101c>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_7: i2c@108f0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108f0000 0xc0>;
+				interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c7_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_4: usi@109000c0 {
@@ -671,6 +887,51 @@ spi_4: spi@10900000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_8: i2c@10900000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10900000 0xc0>;
+				interrupts = <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c8_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI04_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_4: usi@109100c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109100c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1024>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_9: i2c@10910000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10910000 0xc0>;
+				interrupts = <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c9_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_5: usi@109200c0 {
@@ -720,6 +981,51 @@ spi_5: spi@10920000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_10: i2c@10920000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10920000 0xc0>;
+				interrupts = <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c10_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI05_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_5: usi@109300c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109300c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x102c>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_11: i2c@10930000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10930000 0xc0>;
+				interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c11_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_6: usi@109400c0 {
@@ -769,6 +1075,51 @@ spi_6: spi@10940000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_12: i2c@10940000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10940000 0xc0>;
+				interrupts = <GIC_SPI 776 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c12_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI06_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_6: usi@109500c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109500c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1034>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_13: i2c@10950000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10950000 0xc0>;
+				interrupts = <GIC_SPI 775 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c13_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_7: usi@109600c0 {
@@ -818,6 +1169,51 @@ spi_7: spi@10960000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_14: i2c@10960000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10960000 0xc0>;
+				interrupts = <GIC_SPI 778 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c14_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI07_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_7: usi@109700c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109700c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x103c>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_15: i2c@10970000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10970000 0xc0>;
+				interrupts = <GIC_SPI 777 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c15_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_8: usi@109800c0 {
@@ -868,6 +1264,50 @@ spi_8: spi@10980000 {
 				status = "disabled";
 			};
 
+			hsi2c_16: i2c@10980000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10980000 0xc0>;
+				interrupts = <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c16_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI08_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_8: usi@109900c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109900c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1044>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC0_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_17: i2c@10990000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10990000 0xc0>;
+				interrupts = <GIC_SPI 779 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c17_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		pwm: pwm@109b0000 {
@@ -953,6 +1393,51 @@ spi_9: spi@10c80000 {
 				fifo-depth = <256>;
 				status = "disabled";
 			};
+
+			hsi2c_18: i2c@10c80000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10c80000 0xc0>;
+				interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c18_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_9: usi@10c900c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10c900c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1004>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI09_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_19: i2c@10c90000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10c90000 0xc0>;
+				interrupts = <GIC_SPI 786 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c19_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_10: usi@10ca00c0 {
@@ -1002,6 +1487,51 @@ spi_10: spi@10ca0000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_20: i2c@10ca0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10ca0000 0xc0>;
+				interrupts = <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c20_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI10_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_10: usi@10cb00c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10cb00c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x100c>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_21: i2c@10cb0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10cb0000 0xc0>;
+				interrupts = <GIC_SPI 788 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c21_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_11: usi@10cc00c0 {
@@ -1051,6 +1581,51 @@ spi_11: spi@10cc0000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_22: i2c@10cc0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10cc0000 0xc0>;
+				interrupts = <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c22_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_11: usi@10cd00c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10cd00c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1014>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_23: i2c@10cd0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10cd0000 0xc0>;
+				interrupts = <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c23_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_12: usi@10ce00c0 {
@@ -1100,6 +1675,51 @@ spi_12: spi@10ce0000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_24: i2c@10ce0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10ce0000 0xc0>;
+				interrupts = <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c24_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_12: usi@10cf00c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10cf00c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x101c>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_25: i2c@10cf0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10cf0000 0xc0>;
+				interrupts = <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c25_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_13: usi@10d000c0 {
@@ -1149,6 +1769,51 @@ spi_13: spi@10d00000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_26: i2c@10d00000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d00000 0xc0>;
+				interrupts = <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c26_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI13_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_13: usi@10d100c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10d100c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1024>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_27: i2c@10d10000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d10000 0xc0>;
+				interrupts = <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c27_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_14: usi@10d200c0 {
@@ -1198,6 +1863,51 @@ spi_14: spi@10d20000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_28: i2c@10d20000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d20000 0xc0>;
+				interrupts = <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c28_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI14_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_14: usi@10d300c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10d300c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x102c>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_29: i2c@10d30000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d30000 0xc0>;
+				interrupts = <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c29_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_15: usi@10d400c0 {
@@ -1247,6 +1957,51 @@ spi_15: spi@10d40000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_30: i2c@10d40000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d40000 0xc0>;
+				interrupts = <GIC_SPI 799 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c30_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI15_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_15: usi@10d500c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10d500c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1034>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_31: i2c@10d50000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d50000 0xc0>;
+				interrupts = <GIC_SPI 798 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c31_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_16: usi@10d600c0 {
@@ -1296,6 +2051,51 @@ spi_16: spi@10d60000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_32: i2c@10d60000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d60000 0xc0>;
+				interrupts = <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c32_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_16: usi@10d700c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10d700c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x103c>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC1_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_33: i2c@10d70000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d70000 0xc0>;
+				interrupts = <GIC_SPI 800 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c33_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_17: usi@10d800c0 {
@@ -1345,6 +2145,51 @@ spi_17: spi@10d80000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_34: i2c@10d80000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d80000 0xc0>;
+				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c34_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC1_USI17_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_17: usi@10d900c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10d900c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1044>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI17_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_35: i2c@10d90000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d90000 0xc0>;
+				interrupts = <GIC_SPI 802 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c35_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		cmu_top: clock-controller@11000000 {
-- 
2.34.1



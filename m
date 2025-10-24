Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070F0CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 11:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WA0BCBPk7HH5HqiR1AivgHwvu/Th3voX8A6OI9+0rQk=; b=e683dfRDrePH8YpoUbzzql9zx5
	x1LjyD0dPSvy+/pNb9pJV+IPQcLcC2LVygY15aW9p7fAPw1m7EES9+AjnrCU0G5PrIPVdeZ2AKy/g
	XHCmpILt0elxb6nNUycNUlZ177vVSL0xfVOkQI/Lrxb8pT2Ko8O5syb3urlnY8HvnYUM1vSbxDbI8
	mf2xHTFc9z6BWIMRfkNfKAc9v5I4gwk3foOZKj5u/dgEiquaEJzfPZLVAopcDF+WamEdFLnkdUnu5
	DN0/LOJy7hUDS/BZOIlpZIMn1FLh4Jsi7EKGmdpK1glZ/kCepPzYUm+bG9fYSI3Qq00J3a+8Faazd
	zk46CbDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCG9s-00000009EoU-1GJX;
	Fri, 24 Oct 2025 11:40:36 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCG9p-00000009Em3-2Gp1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 11:40:35 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251024114027epoutp028738453337bc8afa9a020c0bc711940a~xaoAltrxk1505715057epoutp02p
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 11:40:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251024114027epoutp028738453337bc8afa9a020c0bc711940a~xaoAltrxk1505715057epoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761306027;
	bh=WA0BCBPk7HH5HqiR1AivgHwvu/Th3voX8A6OI9+0rQk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ow5IwV0dHG8ZGKV/QnEoOJlKJQ9BLEoe88kk1xuQc6f6Az9fZGGJEpgGK8fVe6Dgs
	 SY1phKvRG6Kf4IOafvgGuSEcSxfzOAGAFDILM13uK8zBohDEcJQfdmI9XR3ANmcpQM
	 U+7FwHxkJ1sTxX3xR1tDFfipMNCL7vN+75jFlvqA=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251024114027epcas5p38c424d3678d235b10373744c6f675797~xaoADQiVz0754707547epcas5p34;
	Fri, 24 Oct 2025 11:40:27 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ctLYk4Wscz6B9m5; Fri, 24 Oct
	2025 11:40:26 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20251024114026epcas5p33c612c143853daccf21dd9515418df58~xan_6pS9J1719017190epcas5p3B;
	Fri, 24 Oct 2025 11:40:26 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251024114018epsmtip132fe219c1549bcc3f30c15d830f6e0b8~xan4Hm06j0284302843epsmtip1W;
	Fri, 24 Oct 2025 11:40:18 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH 1/3] arm64: dts: exynos: ExynosAutov920: Add USB and USB-phy
 nodes
Date: Fri, 24 Oct 2025 17:18:43 +0530
Message-Id: <20251024114845.2395166-2-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024114845.2395166-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251024114026epcas5p33c612c143853daccf21dd9515418df58
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251024114026epcas5p33c612c143853daccf21dd9515418df58
References: <20251024114845.2395166-1-pritam.sutar@samsung.com>
	<CGME20251024114026epcas5p33c612c143853daccf21dd9515418df58@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_044033_894208_9046BEA2 
X-CRM114-Status: GOOD (  10.76  )
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

Add USB and USB PHY controller nodes.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 162 ++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 6ee74d260776..6ff0e00fd901 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1409,6 +1409,168 @@ pinctrl_hsi1: pinctrl@16450000 {
 			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		usbdrd31_ssphy: phy@16480000 {
+			compatible = "samsung,exynosautov920-usb31drd-combo-ssphy";
+			reg = <0x16480000 0x0200>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_NOC_USER>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			status = "disabled";
+		};
+
+		usbdrd31_hsphy: phy@16490000 {
+			compatible = "samsung,exynosautov920-usbdrd-combo-hsphy";
+			reg = <0x16490000 0x0200>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_NOC_USER>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			status = "disabled";
+		};
+
+		usbdrd20_phy0: phy@16500000 {
+			compatible = "samsung,exynosautov920-usbdrd-phy";
+			reg = <0x16500000 0x0200>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_NOC_USER>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			status = "disabled";
+		};
+
+		usbdrd20_phy1: phy@16510000 {
+			compatible = "samsung,exynosautov920-usbdrd-phy";
+			reg = <0x16510000 0x0200>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_NOC_USER>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			status = "disabled";
+		};
+
+		usbdrd20_phy2: phy@16520000 {
+			compatible = "samsung,exynosautov920-usbdrd-phy";
+			reg = <0x16520000 0x0200>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_NOC_USER>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			status = "disabled";
+		};
+
+		/* This usb port supports usb31 and usb20 speeds */
+		usbdrd31: usb@16600000 {
+			compatible = "samsung,exynosautov920-dwusb3";
+			ranges = <0x0 0x16600000 0x10000>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "ref", "susp_clk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usbdrd31_dwc3: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				clocks = <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>,
+					 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+				clock-names = "ref", "susp_clk";
+				interrupts = <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd31_hsphy 0>, <&usbdrd31_ssphy 0>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,has-lpm-erratum;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+			};
+		};
+
+		/* This usb port supports only usb20 speeds */
+		usbdrd20_0: usb@16700000 {
+			compatible = "samsung,exynosautov920-dwusb3";
+			ranges = <0x0 0x16700000 0x10000>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "ref", "susp_clk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usbdrd20_dwc3_0: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				clocks = <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>,
+					 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+				clock-names = "ref", "susp_clk";
+				interrupts = <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd20_phy0 0>;
+				phy-names = "usb2-phy";
+				snps,has-lpm-erratum;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+				snps,quirk-frame-length-adjustment = <0x20>;
+			};
+		};
+
+		/* This usb port supports only usb20 speeds */
+		usbdrd20_1: usb@16800000 {
+			compatible = "samsung,exynosautov920-dwusb3";
+			ranges = <0x0 0x16800000 0x10000>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "ref", "susp_clk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usbdrd20_dwc3_1: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				clocks = <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>,
+					 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+				clock-names = "ref", "susp_clk";
+				interrupts = <GIC_SPI 481 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd20_phy1 0>;
+				phy-names = "usb2-phy";
+				snps,has-lpm-erratum;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+				snps,quirk-frame-length-adjustment = <0x20>;
+			};
+		};
+
+		/* This usb port supports only usb20 speeds */
+		usbdrd20_2: usb@16900000 {
+			compatible = "samsung,exynosautov920-dwusb3";
+			ranges = <0x0 0x16900000 0x10000>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "ref", "susp_clk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usbdrd20_dwc3_2: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				clocks = <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>,
+					 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+				clock-names = "ref", "susp_clk";
+				interrupts = <GIC_SPI 483 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd20_phy2 0>;
+				phy-names = "usb2-phy";
+				snps,has-lpm-erratum;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+				snps,quirk-frame-length-adjustment = <0x20>;
+			};
+		};
+
 		cmu_hsi2: clock-controller@16b00000 {
 			compatible = "samsung,exynosautov920-cmu-hsi2";
 			reg = <0x16b00000 0x8000>;
-- 
2.34.1



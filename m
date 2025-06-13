Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E491FC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 07:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXrKoxN5FTLMOBvaJthOPs+x7BGc8lVrjBvn7GCOWhc=; b=iUeXdfSZsDkYWPGheG50wqat6T
	Po6elG4p82FRwXzWkan4UPLgO+Nl9/9fLSkF7lmx+BTj41emY8ld/UL9SnNG/TLK01f1KWQdns0lD
	GqocmKNF9GWyNXtR2N8Ul6svXwCeIpgZ4zwfcfDvRi2MXa7nU0dL2RP1TL0LAM82ydS6X+JI8Xssi
	DlQ0e/HP5YJWR4srhG50GBcYsUOQ50EwSWCXGBV/k9LrLSm7TYNz+srHn2YVQIUyGv/mjPZmTtacF
	zTvqQZqOGmx8L1U4OMcbcIWRy6fBh8yf81a5BKAO7PW7wMMi8WOzDIuJuY17xMlN5hscjL+c5wl0A
	1PsjrY6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyni-0000000FajQ-1aNg;
	Fri, 13 Jun 2025 07:26:10 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyYR-0000000FZJp-3OAy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 07:10:25 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250613071022epoutp026654d7f53230364a1494ade72042982d~IiJN3-OIb0780807808epoutp02F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 07:10:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250613071022epoutp026654d7f53230364a1494ade72042982d~IiJN3-OIb0780807808epoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749798622;
	bh=wXrKoxN5FTLMOBvaJthOPs+x7BGc8lVrjBvn7GCOWhc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lJRH1SkAlTd9TvAnt+hksvwEtccrC9zQ1TNLMbnYbLLG1c14bAP5AXJxudj4JDnsD
	 4nB9Xd3C+/yMi3BxEP1LaRY2qsBdusOjS00es0xC5HMWzOpjK1c+fgMyEsQRebA9r6
	 NXPI7/8iOpJEBWeWtf4vb+ypUSzVNc0dh7llpAvA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250613071021epcas5p1892a5bf37a069767a3743eb23b5da978~IiJNQ3YuV1532515325epcas5p1s;
	Fri, 13 Jun 2025 07:10:21 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.180]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bJVsR5hHWz3hhTD; Fri, 13 Jun
	2025 07:10:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250613055056epcas5p29790d8086c89b16441f4b0a9c2a4db33~IhD3jMu_31695316953epcas5p2C;
	Fri, 13 Jun 2025 05:50:56 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250613055053epsmtip1470e899e4987d1436f6f028fcb03a9cc~IhD0zla9h0400204002epsmtip1S;
	Fri, 13 Jun 2025 05:50:53 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v3 6/9] arm64: dts: exynos: ExynosAutov920: add USB and USB
 HS combo phy nodes
Date: Fri, 13 Jun 2025 11:26:10 +0530
Message-Id: <20250613055613.866909-7-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613055613.866909-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250613055056epcas5p29790d8086c89b16441f4b0a9c2a4db33
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055056epcas5p29790d8086c89b16441f4b0a9c2a4db33
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055056epcas5p29790d8086c89b16441f4b0a9c2a4db33@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_001024_156265_1722C9B9 
X-CRM114-Status: GOOD (  13.00  )
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

Add the USB 3.1 DRD controller and USB31DRD HS combo phy nodes for
ExynosAutov920 soc.

The USB 3.1 DRD controller has the following features:
* DWC3 compatible
* compliant with both USB device 3.1 and USB device 2.0 standards
* compliant with USB host 3.1 and USB host 2.0 standards
* supports USB device 3.1 and USB device 2.0 interfaces
* supports USB host 3.1 and USB host 2.0 interfaces
* full-speed (12 Mbps) and high-speed (480 Mbps) modes with USB device
  2.0 interface
* super-speed (5 Gbps) mode with USB device 3.1 Gen1 interface
* super-speed plus (10 Gbps) mode with USB device 3.1 Gen2 interface
* single USB port which can be used for USB 3.1 or USB 2.0
* on-chip USB PHY transceiver
* supports up to 16 bi-directional endpoints
* compliant with xHCI 1.1 specification

Only UTMI+ is supported in this commit, so only UTMI+ PHY interface is
specified in "phys" property (index 0) and PIPE3 is omitted (index 1).

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../boot/dts/exynos/exynosautov920-sadk.dts   | 12 +++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 36 +++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
index 984e899a2ebf..a21386bd9af3 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
@@ -88,6 +88,18 @@ &xtcxo {
 };
 
 /* usb */
+&usbdrd31_hsphy {
+	status = "okay";
+};
+
+&usbdrd31_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usbdrd31 {
+	status = "okay";
+};
+
 &usbdrd20_phy0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index b1a9d1da47f6..4efc005cae80 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1048,6 +1048,17 @@ pinctrl_hsi1: pinctrl@16450000 {
 			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		usbdrd31_hsphy: phy@16490000 {
+			compatible = "samsung,exynosautov920-usbdrd-hsphy";
+			reg = <0x16490000 0x0200>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_NOC_USER>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			status = "disabled";
+		};
+
 		usbdrd20_phy0: phy@16500000 {
 			compatible = "samsung,exynosautov920-usbdrd-phy";
 			reg = <0x16500000 0x0200>;
@@ -1081,6 +1092,31 @@ usbdrd20_phy2: phy@16520000 {
 			status = "disabled";
 		};
 
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
+				phys = <&usbdrd31_hsphy 0>;
+				phy-names = "usb2-phy";
+				snps,has-lpm-erratum;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+			};
+		};
+
 		usbdrd20_0: usb@16700000 {
 			compatible = "samsung,exynosautov920-dwusb3";
 			ranges = <0x0 0x16700000 0x10000>;
-- 
2.34.1



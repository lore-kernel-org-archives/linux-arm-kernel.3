Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E38C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 07:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56CmjDTZOy7fMDoysfMwIbGOoI0GR5WIPAdKVtxGwgs=; b=jsLzFZt0duCseSijt9yoOjOmmo
	el7dpcfwd47y1RR47RZVv4i0UaDltmChRwROtzF/XHhvqrI+YTlvVw5Yz4Zlvc5oxKuYFDdUv09a+
	QTOxxXUYMOG721nW6aXkoEs20urqiZBgpROHnkpeI8be4iRoXyNCue3BDMRQoANcXsDdI6WWJB3IR
	cVOOTsrJ4kPVH314RcOBeOdsay0XXRoRcdBVNzp+5BJDUecDldlee++fkZvbq1Kh0PzRhGlZdaQkY
	cxQYyxwQBh1kuDHgGCOsZ/hjmnMvicTZuKC7VxJ2OnC6EIFAggChg4/VsPpQtgaTRz2XAWvVKKx3E
	zXWxyaEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPysD-0000000Fb2F-0R5T;
	Fri, 13 Jun 2025 07:30:49 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyYd-0000000FZMt-0GNg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 07:10:36 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250613071033epoutp03bd38d1b55e2e134fe9ec38e3fcc5d2e9~IiJYYmxE22232922329epoutp03O
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 07:10:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250613071033epoutp03bd38d1b55e2e134fe9ec38e3fcc5d2e9~IiJYYmxE22232922329epoutp03O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749798633;
	bh=56CmjDTZOy7fMDoysfMwIbGOoI0GR5WIPAdKVtxGwgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rhBMUS7Tk7AFV1hwhSJhpaIIqwcMmxX1sx7dOUS2YM03d1JL7zkS0byUj90b+jFJg
	 r4Z2TxjZFIo4mwWaLto4PEtsPTS7hce4a7K1ciKwa3PM5QJ/6anhyxCahxF/Wyyydr
	 tjU+NfJtVgF3YONTjms899rLcrS6/jH4/6tADqww=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250613071032epcas5p30844d0ba455b69abf17e9f8c4d1f9e5a~IiJX2QbuO0170401704epcas5p3k;
	Fri, 13 Jun 2025 07:10:32 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.182]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bJVsf62PLz6B9mP; Fri, 13 Jun
	2025 07:10:30 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250613055106epcas5p46a2e5e2d6f0e8811644643f6282fd9ca~IhEAfFzbP2347523475epcas5p4Z;
	Fri, 13 Jun 2025 05:51:06 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250613055103epsmtip1a1807f547f3c97abd09c8aaa059502d5~IhD9wSso20439404394epsmtip12;
	Fri, 13 Jun 2025 05:51:03 +0000 (GMT)
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
Subject: [PATCH v3 9/9] arm64: dts: exynos: ExynosAutov920: add USB and USB
 SS combo phy nodes
Date: Fri, 13 Jun 2025 11:26:13 +0530
Message-Id: <20250613055613.866909-10-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613055613.866909-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250613055106epcas5p46a2e5e2d6f0e8811644643f6282fd9ca
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055106epcas5p46a2e5e2d6f0e8811644643f6282fd9ca
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055106epcas5p46a2e5e2d6f0e8811644643f6282fd9ca@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_001035_417725_9D1284F7 
X-CRM114-Status: GOOD (  14.86  )
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

Update the USB 3.1 DRD controller and USB31DRD phy nodes to support
SS combo phy for this soc.

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

USB3.1 SSP+(10Gbps) is supported in this commit and SS phy in combo
phy only supports PIPE3 interface and it is added in index 0 of SS phy.
UTMI+ and PIPE3 PHY interfaces are specified in "phys" property,
UTMI+ (index 0 HS phy) and PIPE3 (index 0 SS phy).

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920-sadk.dts |  4 ++++
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi    | 15 +++++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
index a21386bd9af3..40588f7c9998 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
@@ -88,6 +88,10 @@ &xtcxo {
 };
 
 /* usb */
+&usbdrd31_ssphy {
+	status = "okay";
+};
+
 &usbdrd31_hsphy {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 4efc005cae80..5ee7fad346b9 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1048,6 +1048,17 @@ pinctrl_hsi1: pinctrl@16450000 {
 			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		usbdrd31_ssphy: phy@16480000 {
+			compatible = "samsung,exynosautov920-usb31drd-ssphy";
+			reg = <0x16480000 0x0200>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_NOC_USER>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			status = "disabled";
+		};
+
 		usbdrd31_hsphy: phy@16490000 {
 			compatible = "samsung,exynosautov920-usbdrd-hsphy";
 			reg = <0x16490000 0x0200>;
@@ -1109,8 +1120,8 @@ usbdrd31_dwc3: usb@0 {
 					 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
 				clock-names = "ref", "susp_clk";
 				interrupts = <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&usbdrd31_hsphy 0>;
-				phy-names = "usb2-phy";
+				phys = <&usbdrd31_hsphy 0>, <&usbdrd31_ssphy 0>;
+				phy-names = "usb2-phy", "usb3-phy";
 				snps,has-lpm-erratum;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_u3_susphy_quirk;
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9CDD262BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 12:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqqqBR9sIrPPiLooRmVHGEoq/jEmm2fgDXa+UvCsZgg=; b=0L+FtANdcr9MnhsGRVRN17K69/
	FokAilRFUqVXBWU0tQmTE7h9Jvnis7xlcmQCEF2nHGPFNwli8XbTR87gyBe53v/t/qK0cvrGsUQa8
	jF5BkCIwhzrYvtlvlGB0Sc8iEm15GvqKzX6NcvRXFTWSc/hxfhDi99CmOvBWb+33SzFlAgNoevJEf
	NXnukeyQGAivlFrc4MNU1QHTtO0pcxpiTpN1VnYcsRPWvPRuAq05VCb5jGEl5THLXrMRD1lyJNXfx
	7Cp0JsBSHVqzQp7LLvTUs5ydRZOqUrrQXR43ff0ExarcFJEnSPbu69fObGh7BdZ0xDypIRJ55+A2h
	2hlFA9EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuAO-000000075N9-31kP;
	Thu, 22 Jan 2026 12:52:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuAN-000000075MR-0j8b
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 12:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=eqqqBR9sIrPPiLooRmVHGEoq/jEmm2fgDXa+UvCsZgg=; b=a8CI+GPwPgvaxbbR6VXuiLQFJE
	T7lH90LAm3/wMqojy1e+irPVzA8S2HGmI1+now6+iFvYDfHu9qbxB+hyxOaiDJKb/MaxyTLNFqvA4
	yeKJ/WIPB7m/95dGhQlbk3pJBdUV07mHnq6ru/VaJcXYI/bFlAPsp4CI+B62zguo81dLOJj1C/J3y
	vbi6Da3gFkHsuvIoNkG+0KlsyWesbGcv6GH8SApuTWdIJIyTejFXYahqkqeVbl3DxnSMsICNkCtQL
	hFM27MSzKvi/Z+6WQUeoh8KxIwrgjh01n8YDpuO76hX3hDz9uqiAzsqtIGRT3DLeSex2i78x/M9E1
	2Ob20LDg==;
Received: from mailout2.samsung.com ([203.254.224.25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuA8-00000000N8p-2wrM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 12:51:52 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260122125136epoutp02476969333b9c98b580a2ee5d551bb32d~NDp0ZQXvO2051020510epoutp02v
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 12:51:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260122125136epoutp02476969333b9c98b580a2ee5d551bb32d~NDp0ZQXvO2051020510epoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769086296;
	bh=eqqqBR9sIrPPiLooRmVHGEoq/jEmm2fgDXa+UvCsZgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IEfhFXMQEG+/e7hWwPytiLk1wfLM52tVgZVeOa4Pla+Vqp2N7P7hBO6U4hOO/rUsg
	 pHUTQL30OJrcqbHHs3dYaseFTwrKKJ4QCFD9t3vJC9UCA0BbW2d9Lx9DgmOiG9FlNR
	 jEa+EjlODHCA1Vqq1KYPN3AoWlmTDBZAYyIKMb58=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260122125136epcas5p445cb6799dca47e130e8e4763f7671a18~NDpz9MGGu1352113521epcas5p4m;
	Thu, 22 Jan 2026 12:51:36 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dxgtH0gd8z6B9m9; Thu, 22 Jan
	2026 12:51:35 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260122125134epcas5p36625b7ac70b8dfba9430831a11955682~NDpynkwiU1556515565epcas5p3K;
	Thu, 22 Jan 2026 12:51:34 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260122125132epsmtip1e50006feabe8a79c690c5e08e5b397b4~NDpwzYlNb0713007130epsmtip1T;
	Thu, 22 Jan 2026 12:51:32 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH v2 2/3] arm64: dts: exynos: ExynosAutov920: Add regulators
 for the USB
Date: Thu, 22 Jan 2026 18:37:20 +0530
Message-Id: <20260122130721.205664-3-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122130721.205664-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260122125134epcas5p36625b7ac70b8dfba9430831a11955682
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260122125134epcas5p36625b7ac70b8dfba9430831a11955682
References: <20260122130721.205664-1-pritam.sutar@samsung.com>
	<CGME20260122125134epcas5p36625b7ac70b8dfba9430831a11955682@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_125150_077897_05B7DF02 
X-CRM114-Status: GOOD (  12.55  )
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

Add dummy regulator for USB and PHY supplies.

Add vbus regulator that is enabled by GPIO pin.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../boot/dts/exynos/exynosautov920-sadk.dts   | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
index a397f068ed53..f90f7704597c 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
@@ -52,6 +52,76 @@ memory@80000000 {
 		      <0x8 0x80000000 0x1 0xfba00000>,
 		      <0xa 0x00000000 0x2 0x00000000>;
 	};
+
+	/* TODO: Remove this once PMIC is implemented  */
+	dummy_regulator: regulator-0 {
+		 compatible = "regulator-fixed";
+		 regulator-name = "dummy_regulator";
+	};
+
+	usbdrd31_dwc3_vbus: usbdrd31_dwc3-vbus {
+	       compatible = "regulator-fixed";
+	       regulator-name = "usbdrd31_dwc3-vbus";
+	       regulator-min-microvolt = <5000000>;
+	       regulator-max-microvolt = <5000000>;
+	       enable-active-high;
+	       regulator-always-on;
+	       gpio = <&gpp2 0 GPIO_ACTIVE_HIGH>;
+	};
+
+	/* Use gpio for enabling vbus regulator */
+	usb_phy0: usb-phy0 {
+		compatible = "usb-nop-xceiv";
+		vbus-supply = <&usbdrd31_dwc3_vbus>;
+	};
+
+	usbdrd20_dwc3_0_vbus: usbdrd20_dwc3_0-vbus {
+	       compatible = "regulator-fixed";
+	       regulator-name = "usbdrd20_dwc3_0-vbus";
+	       regulator-min-microvolt = <5000000>;
+	       regulator-max-microvolt = <5000000>;
+	       enable-active-high;
+	       regulator-always-on;
+	       gpio = <&gpp2 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	/* Use gpio for enabling vbus regulator */
+	usb_phy1: usb-phy1 {
+		compatible = "usb-nop-xceiv";
+		vbus-supply = <&usbdrd20_dwc3_0_vbus>;
+	};
+
+	usbdrd20_dwc3_1_vbus: usbdrd20_dwc3_1-vbus {
+	       compatible = "regulator-fixed";
+	       regulator-name = "usbdrd20_dwc3_1-vbus";
+	       regulator-min-microvolt = <5000000>;
+	       regulator-max-microvolt = <5000000>;
+	       enable-active-high;
+	       regulator-always-on;
+	       gpio = <&gpp2 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	/* Use gpio for enabling vbus regulator */
+	usb_phy2: usb-phy2 {
+		compatible = "usb-nop-xceiv";
+		vbus-supply = <&usbdrd20_dwc3_1_vbus>;
+	};
+
+	usbdrd20_dwc3_2_vbus: usbdrd20_dwc3_2-vbus {
+	       compatible = "regulator-fixed";
+	       regulator-name = "usbdrd20_dwc3_2-vbus";
+	       regulator-min-microvolt = <5000000>;
+	       regulator-max-microvolt = <5000000>;
+	       enable-active-high;
+	       regulator-always-on;
+	       gpio = <&gpp2 3 GPIO_ACTIVE_HIGH>;
+	};
+
+	/* Use gpio for enabling vbus regulator */
+	usb_phy3: usb-phy3 {
+		compatible = "usb-nop-xceiv";
+		vbus-supply = <&usbdrd20_dwc3_2_vbus>;
+	};
 };
 
 &pinctrl_alive {
@@ -86,3 +156,72 @@ &usi_0 {
 &xtcxo {
 	clock-frequency = <38400000>;
 };
+
+&usbdrd31_ssphy {
+	dvdd-supply = <&dummy_regulator>;
+	vdd18-supply = <&dummy_regulator>;
+};
+
+&usbdrd31_hsphy {
+	dvdd-supply = <&dummy_regulator>;
+	vdd18-supply = <&dummy_regulator>;
+	vdd33-supply = <&dummy_regulator>;
+};
+
+&usbdrd31_dwc3 {
+	maximum-speed = "super-speed-plus";
+	usb-phy = <&usb_phy0>;
+};
+
+&usbdrd31 {
+	vdd10-supply = <&dummy_regulator>;
+	vdd33-supply = <&dummy_regulator>;
+};
+
+&usbdrd20_phy0 {
+	dvdd-supply = <&dummy_regulator>;
+	vdd18-supply = <&dummy_regulator>;
+	vdd33-supply = <&dummy_regulator>;
+};
+
+&usbdrd20_dwc3_0 {
+	maximum-speed = "high-speed";
+	usb-phy = <&usb_phy1>;
+};
+
+&usbdrd20_0 {
+	vdd10-supply = <&dummy_regulator>;
+	vdd33-supply = <&dummy_regulator>;
+};
+
+&usbdrd20_phy1 {
+	dvdd-supply = <&dummy_regulator>;
+	vdd18-supply = <&dummy_regulator>;
+	vdd33-supply = <&dummy_regulator>;
+};
+
+&usbdrd20_dwc3_1 {
+	maximum-speed = "high-speed";
+	usb-phy = <&usb_phy2>;
+};
+
+&usbdrd20_1 {
+	vdd10-supply = <&dummy_regulator>;
+	vdd33-supply = <&dummy_regulator>;
+};
+
+&usbdrd20_phy2 {
+	dvdd-supply = <&dummy_regulator>;
+	vdd18-supply = <&dummy_regulator>;
+	vdd33-supply = <&dummy_regulator>;
+};
+
+&usbdrd20_dwc3_2 {
+	maximum-speed = "high-speed";
+	usb-phy = <&usb_phy3>;
+};
+
+&usbdrd20_2 {
+	vdd10-supply = <&dummy_regulator>;
+	vdd33-supply = <&dummy_regulator>;
+};
-- 
2.34.1



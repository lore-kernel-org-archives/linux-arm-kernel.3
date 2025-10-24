Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51245CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 11:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqqqBR9sIrPPiLooRmVHGEoq/jEmm2fgDXa+UvCsZgg=; b=m5vudkm9qhf6hPUyaHT4kk4GGJ
	GOg6Tva3RsvIh/fHXHkPjyrzyKls3d3hF5eouEN0oNOlMSoWqvnvn/8CHrN39ZOSCFUH5ZkaASMbC
	sI4yUzkR14LQDzACTntvjVU2xEC0zuADc0hQB77Lfcqe/HMoXHwf4NDcq4peOQCL4dnfOZWbVdmAd
	2NXhIg9xY7+oH4BuXbazzkkgZ8ftjmfcYTeUcj+k6UPKiPXw6hjrhrRdkCMOL4H9FO9+QDkNV2ctd
	sX6RMJEfIgTXpp2VH+x7X+EK2Ylu4tJsYmd1d9nMmx+rHk+tg1Yyh30qU+JM7YJ4bsGJhoMAkNQp+
	Zrj3sgwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCG9x-00000009Epz-2UNQ;
	Fri, 24 Oct 2025 11:40:41 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCG9u-00000009Eo5-01zg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 11:40:40 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251024114032epoutp0473dd657506a7aa83db3bd60e9bc163f0~xaoEu5v711180811808epoutp04h
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 11:40:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251024114032epoutp0473dd657506a7aa83db3bd60e9bc163f0~xaoEu5v711180811808epoutp04h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761306032;
	bh=eqqqBR9sIrPPiLooRmVHGEoq/jEmm2fgDXa+UvCsZgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cb91Zw9G0Y/Sxl3R6OKtPaCU1w/zCF+cyJB+jmRaYV/hwh1v3frjzkOuv3zRNmc1N
	 djXCb0V6Q6exCloX7esl5j+iDtd16aaO7ME3McL2v4WQHpIAxgvZOwkUfDHAKzW6Q+
	 tDQjUphouTUBjCXWHusoawpGNBme4MBmdmAXlMsU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251024114031epcas5p3c8d3994671155ab96f87b85a6d0e04c9~xaoEHRrAV0754707547epcas5p3C;
	Fri, 24 Oct 2025 11:40:31 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.86]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ctLYq02NZz6B9m8; Fri, 24 Oct
	2025 11:40:31 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251024114030epcas5p2c9ba90eaa354440873b73263746fa148~xaoCqAUjO2192421924epcas5p2A;
	Fri, 24 Oct 2025 11:40:30 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251024114027epsmtip1731237c9e8e3cf096f552d07c9ad3608~xaoACMBML0283702837epsmtip1J;
	Fri, 24 Oct 2025 11:40:26 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH 2/3] arm64: dts: exynos: ExynosAutov920: Add regulators for
 the USB
Date: Fri, 24 Oct 2025 17:18:44 +0530
Message-Id: <20251024114845.2395166-3-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024114845.2395166-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251024114030epcas5p2c9ba90eaa354440873b73263746fa148
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251024114030epcas5p2c9ba90eaa354440873b73263746fa148
References: <20251024114845.2395166-1-pritam.sutar@samsung.com>
	<CGME20251024114030epcas5p2c9ba90eaa354440873b73263746fa148@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_044038_360357_170F93C2 
X-CRM114-Status: GOOD (  11.95  )
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14141D5E15A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/NNmCOZpOKOo1L5GaD1X3K8BzLVRcnpiik60MQSZsk=; b=u03RaQcPOPE1H2QRmH5Ctf9roI
	9YQxjtNLlOlzd/rKxsrwJrxrCjr9Ekj+NNGwLi3ZIkYStYxe70/tRg7cU+VbmIkIIvKl8nmQtK1F5
	fP2RBr16mRLs7vECjbR6AyQxLutj019pnZmjCUshD5IttlrasGQiV7OmnYYwCrvelH/OqKqN8d0tn
	1kxOilgtcjYAf3pcJuObSSisf5eRiOGTr4TsjIdTeOHF9r21jcihg8mJfvbfIEU/BJMmvcsMPAJUE
	LMzZ2r4dPua/FRERBc6B1NxwkNs4KlvxCgSD2n/Cg88zAKs6AhhxZt20HvPhKMY4q3NVm/tJ8Y6sJ
	MvE9921Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVIb-00000005HmC-0zKa;
	Tue, 16 Dec 2025 13:41:09 +0000
Received: from mx-relay186-hz1.antispameurope.com ([94.100.133.75])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVIV-00000005HkW-289l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 13:41:08 +0000
ARC-Authentication-Results: i=1; mx-gate186-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=y/NNmCOZpOKOo1L5GaD1X3K8BzLVRcnpiik60MQSZsk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765892401;
 b=JhAc1eMsT87jZxOL5E07kIa2gjHfNTVRQ5gm58OM6G78a12QHwTuK20mM+jswgHMjTSdQ2JX
 dMtDClGhPNb4fD8FrNkDAP8MS7Q99apktmm2Asmx1sbiW6IRUHD6zqZuh+ZIorvTLJCmeFcJtp6
 z5v6ecUe8vP81Tccr7XxTm38jqGPQT45r9T3OKyunZunUw6mv+AU30mgby9tskj8x703f1MxmMr
 B3RSvApcZrA6IcQprAnPZme8F9jKaxHTsPn8yetnB3gcGD07QUefFYa9J0smeX2INOCM0VmHXoo
 bAjse+AGFhibevgq/nCf5+zXNr7JdYUye+4581YfdnoaA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765892401;
 b=VzNQvH7suT804Xj6zO197onjuFL20EbQbiGrFiDNQfGalGoAcG4vJMvHdwhHrFLQvQedy+VJ
 FaEVPv8Kkq+/vbEWCg0HpwgDWt8hRPcVV4sEUdxbd3ATRJsSC3zfayXXwXIpGJvJ38RNfnYB58P
 4fD4btE2a7a6ZinGmbuo9t4oqD+mteKoTtgbfUpaKAoAVSD8MzHnjQlx4Uw+UDblw3BPrpaO5Mp
 ZuBLb26dxpJhCC3u5QyJbrmdDQmfszPcwH/JRD4cAdM+XQyssozIboxAwDV+us8u/Da97/NF6kP
 KQLE0PYsrNo6VkiiWg0G94fyNGpSbDxJ5/1F1fnssl4Nw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay186-hz1.antispameurope.com;
 Tue, 16 Dec 2025 14:40:01 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id A7BE65A167D;
	Tue, 16 Dec 2025 14:39:46 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 3/3] arm64: dts: imx8mn-tqma8mqnl: fix LDO5 power off
Date: Tue, 16 Dec 2025 14:39:25 +0100
Message-ID: <20251216133927.913039-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216133927.913039-1-alexander.stein@ew.tq-group.com>
References: <20251216133927.913039-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay186-hz1.antispameurope.com with 4dVyhz3009z3f2J0
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 368384c713b76e7f27c528b6b2e25988
X-cloud-security: scantime:1.996
DKIM-Signature: a=rsa-sha256;
 bh=y/NNmCOZpOKOo1L5GaD1X3K8BzLVRcnpiik60MQSZsk=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765892401; v=1;
 b=WXlYO8KdnLa1E5oqnSVqjMVsUJGsIlRiAuQX5ds+ueLAQtEiKiqRC/Ma99K+RjeDmpGpAU9u
 GixLDgwBQupSGdjSEpskb6rhM8uxfNyc0FQMwi2+1UlR/D+hi0LQrHe3A6pFT1vw7k4Wt6v4q8P
 ZOAXxYVGYjeEPJIURM/iMnoao2UmfQ/bu4kf/tiNzk7uir78PwcEkG4exNMWE32GaqtNbmJklJk
 RUBvpcx0cXbIW38CscezDVHcdZTDWW8eFP2CsOR+HhfHnK7Ph5DB14YciEm89pub4kWwT4ufiDG
 k/cZorA0lqv38S8SLd+3JABtUHV6iKfFv4xp9QrlZSIEw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_054105_878448_E6D7B144 
X-CRM114-Status: GOOD (  13.14  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Fix SD card removal caused by automatic LDO5 power off after boot

To prevent this, add vqmmc regulator for USDHC, using a GPIO-controlled
regulator that is supplied by LDO5. Since this is implemented on SoM but
used on baseboards with SD-card interface, implement the functionality
on SoM part and optionally enable it on baseboards if needed.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts | 13 ++++++-----
 .../boot/dts/freescale/imx8mn-tqma8mqnl.dtsi  | 22 +++++++++++++++++++
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
index d7f7f9aafb7d1..0d009f4be804e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
@@ -69,6 +69,10 @@ &mipi_dsi {
 	samsung,esc-clock-frequency = <20000000>;
 };
 
+&reg_usdhc2_vqmmc {
+	status = "okay";
+};
+
 &sai3 {
 	assigned-clocks = <&clk IMX8MN_CLK_SAI3>;
 	assigned-clock-parents = <&clk IMX8MN_AUDIO_PLL1_OUT>;
@@ -216,8 +220,7 @@ pinctrl_usdhc2: usdhc2grp {
 			   <MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4>,
 			   <MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4>,
 			   <MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4>,
-			   <MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>,
-			   <MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x84>;
+			   <MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
@@ -226,8 +229,7 @@ pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 			   <MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4>,
 			   <MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4>,
 			   <MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4>,
-			   <MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>,
-			   <MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x84>;
+			   <MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>;
 	};
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
@@ -236,8 +238,7 @@ pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 			   <MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4>,
 			   <MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4>,
 			   <MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4>,
-			   <MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>,
-			   <MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x84>;
+			   <MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>;
 	};
 
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
index ac6ce5d814c50..31a3ca137e636 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
@@ -15,6 +15,20 @@ memory@40000000 {
 		reg = <0x00000000 0x40000000 0 0x40000000>;
 	};
 
+	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
+		compatible = "regulator-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vqmmc>;
+		regulator-name = "V_SD2";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		states = <1800000 0x1>,
+			 <3300000 0x0>;
+		vin-supply = <&ldo5_reg>;
+		status = "disabled";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -218,6 +232,10 @@ &mipi_dsi {
 	vddio-supply = <&ldo3_reg>;
 };
 
+&usdhc2 {
+	vqmmc-supply = <&reg_usdhc2_vqmmc>;
+};
+
 &usdhc3 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc3>;
@@ -272,6 +290,10 @@ pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <MX8MN_IOMUXC_SD2_RESET_B_GPIO2_IO19		0x84>;
 	};
 
+	pinctrl_reg_usdhc2_vqmmc: regusdhc2vqmmcgrp {
+		fsl,pins = <MX8MN_IOMUXC_GPIO1_IO04_GPIO1_IO4		0xc0>;
+	};
+
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x1d4>,
 			   <MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d2>,
-- 
2.43.0



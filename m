Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE3BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 09:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kLKtT8JZ6dODcbUKgfZeCB5jr/fQZczVXqQkqrWvrQk=; b=FEI8buEP00rSzB2NZaEh5UyqoG
	ZY1yVgvVmYuP9SU/68G301IeU+ji3SRtZvpb8Nc0eewCrK+TggAtihdSY/zc+WCxseUSL0oZXAKkm
	gUlfFxG9YxpXsv35bJHVnIWwTnMmkqN3brjYt0Mkt4NuEzrZaWpVgGLVRdlcqnxPnb6BJGjMaRXk+
	tHpyiz1wSQFbEWNho7F9DQmZf/3kaHCgde/y3eKn9L0CmdNCWr3pjUtw2RqpLnD1XG1JzkoUPqwDd
	GcYrfC48pFzDNej1Fz+wDTTfZgp9/YSX/4QZT/B0zfM9GiU6/oAcYt4zokpr89HzUWWNpY6QkaoRd
	IYlUuYRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPdE-00000003HMP-26ZA;
	Thu, 31 Jul 2025 09:31:24 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPPS-00000003Ftc-1atQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 09:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753953430; x=1785489430;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kLKtT8JZ6dODcbUKgfZeCB5jr/fQZczVXqQkqrWvrQk=;
  b=KhJvC8V3qh5z20AA4ejwqVtNF5RqqEBbkAwo8jsrUgcW9Jbe4x9Z9DIW
   eOL8fYYGzeglsx5ILjleZmLOLb8uqEpYTa775dR9D4srmw/9NjlAZs2fQ
   emIrfM1AQs2N/asw9gRpUNtSAUxqPb9Dm+qe0kal77f+5pDjhXtlBX24+
   bpui7aYKhsGwrtoox5FYJfie3Bk21L6uwtvJKRi4qN4umygWdFkn7Znw6
   pHIvQYdzr33IOKSd7nFUlUn1+l61av1Acq2LkHIHeyN7nlSKohLOrdcg3
   xUIE8/Af4hxOuSptUxob3CRz/xeCAjL3zjGv0KioOCucj4MeH9nYQ3Yxn
   w==;
X-CSE-ConnectionGUID: ij/sogzaRoir3oVu13BriA==
X-CSE-MsgGUID: CGxTcfeDRdyKGUD0CdhahA==
X-IronPort-AV: E=Sophos;i="6.16,353,1744063200"; 
   d="scan'208";a="45516517"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 31 Jul 2025 11:17:07 +0200
X-CheckPoint: {688B3493-1E-943DFC15-D71A48EE}
X-MAIL-CPID: 5A07E1B3BC8A0778C3A5FDBFD2D5B31C_5
X-Control-Analysis: str=0001.0A002121.688B3439.0079,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 204D516B722;
	Thu, 31 Jul 2025 11:17:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753953423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kLKtT8JZ6dODcbUKgfZeCB5jr/fQZczVXqQkqrWvrQk=;
	b=gyfGocUebJ0GY86x8QMGn0scMnn3B87qZHtHT5A2901xiNDkgOlpUrFg6eob75W0YRrec5
	h60M/4bjHMQVNdP0h4W0A2VbObgUwK0fuyfxskTqn5qSC+EhhB5aSOsN2vT931n623uJ6X
	2r1xfV8WUpBCkDisYCpIdntPwpb9tI3ZTsd+t6NG5toR0N/RyleTf9aO3jhGGFTunKOA4G
	aRMW6vd4BYf1fHNWbVZiNm+fNuw9UMVEzuij1o3Y75cZWhDq6ld48YxfcYgVZK1tPZloZD
	FrPxEFa83jdrFvMuxDHCKW/q7ow7NgKq7lb4RHO+HX9RQ0gz8Bgls7lkC8FyWQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: imx8mp-tqma8mpql: fix LDO5 power off
Date: Thu, 31 Jul 2025 11:16:52 +0200
Message-ID: <20250731091655.2453107-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_021710_914064_1F1D0C45 
X-CRM114-Status: GOOD (  11.51  )
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

Fix SD card removal caused by automatic LDO5 power off after boot:

LDO5: disabling
mmc1: card 59b4 removed
EXT4-fs (mmcblk1p2): shut down requested (2)
Aborting journal on device mmcblk1p2-8.
JBD2: I/O error when updating journal superblock for mmcblk1p2-8.

To prevent this, add vqmmc regulator for USDHC, using a GPIO-controlled
regulator that is supplied by LDO5. Since this is implemented on SoM but
used on baseboards with SD-card interface, implement the functionality
on SoM part and optionally enable it on baseboards if needed.

Fixes: 418d1d840e42 ("arm64: dts: freescale: add initial device tree for TQMa8MPQL with i.MX8MP")
Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../imx8mp-tqma8mpql-mba8mp-ras314.dts        | 13 ++++++-----
 .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 13 ++++++-----
 .../boot/dts/freescale/imx8mp-tqma8mpql.dtsi  | 22 +++++++++++++++++++
 3 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index d7fd9d36f8240..f7346b3d35fe5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -467,6 +467,10 @@ &pwm4 {
 	status = "okay";
 };
 
+&reg_usdhc2_vqmmc {
+	status = "okay";
+};
+
 &sai5 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai5>;
@@ -876,8 +880,7 @@ pinctrl_usdhc2: usdhc2grp {
 			   <MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d2>,
 			   <MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d2>,
 			   <MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d2>,
-			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d2>,
-			   <MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0>;
+			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d2>;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
@@ -886,8 +889,7 @@ pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 			   <MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4>,
 			   <MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4>,
 			   <MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4>,
-			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4>,
-			   <MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0>;
+			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4>;
 	};
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
@@ -896,8 +898,7 @@ pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 			   <MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4>,
 			   <MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4>,
 			   <MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4>,
-			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4>,
-			   <MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0>;
+			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4>;
 	};
 
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 33cd92e63c5d5..4eedd00d83b9f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -604,6 +604,10 @@ &pwm3 {
 	status = "okay";
 };
 
+&reg_usdhc2_vqmmc {
+	status = "okay";
+};
+
 &sai3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai3>;
@@ -983,8 +987,7 @@ pinctrl_usdhc2: usdhc2grp {
 			   <MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d2>,
 			   <MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d2>,
 			   <MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d2>,
-			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d2>,
-			   <MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0>;
+			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d2>;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
@@ -993,8 +996,7 @@ pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 			   <MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4>,
 			   <MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4>,
 			   <MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4>,
-			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4>,
-			   <MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0>;
+			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4>;
 	};
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
@@ -1003,8 +1005,7 @@ pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 			   <MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4>,
 			   <MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4>,
 			   <MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4>,
-			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4>,
-			   <MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0>;
+			   <MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4>;
 	};
 
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
index fd70b686e7efc..b48d5da147273 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
@@ -24,6 +24,20 @@ reg_vcc3v3: regulator-vcc3v3 {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
+
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
 };
 
 &A53_0 {
@@ -184,6 +198,10 @@ m24c64: eeprom@57 {
 	};
 };
 
+&usdhc2 {
+	vqmmc-supply = <&reg_usdhc2_vqmmc>;
+};
+
 &usdhc3 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc3>;
@@ -233,6 +251,10 @@ pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x10>;
 	};
 
+	pinctrl_reg_usdhc2_vqmmc: regusdhc2vqmmcgrp {
+		fsl,pins = <MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04		0xc0>;
+	};
+
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK		0x194>,
 			   <MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD		0x1d4>,
-- 
2.43.0



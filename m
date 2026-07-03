Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B724C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 08:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaMysW8ENvaf3rrvLxL52kqIKJ0nwCCn6rGzVpw7LPE=; b=mfS/tkRlv082GojFDq/dsg/1qc
	0yFd9zDxvUD1Lfd5BwHZiVdrZV1t1k0hoCUfQRePxmGdI/Z9cwiQRGpLbC/xqp8yypVrK3cY6GUen
	tWijKTwbUXstpn1ENM+VMPaRa0wYPB0lwBua2vqE7QhlQE8EKD0S2x/Q1w+lp5Xm733s4KCXl3aS9
	cyY8s9uqZwhI0lpt1tCnm0hljvzFFXpREtvZh9uUqU7cs64abJ3I4eSiju3A6QQTTY0zTVpib2uIY
	o+HNeMKdfahR6+7h9LCC/9DKzIUH+gTwF7KRH4DmL68WEYda2ugT87GeFXjTcFLvZLZKoMWxHbi/j
	njrZ2HrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXM-00000006O8a-0sJZ;
	Fri, 03 Jul 2026 08:46:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXH-00000006O4e-1FF4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:46:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493b27c7451so13756125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 01:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068369; x=1783673169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaMysW8ENvaf3rrvLxL52kqIKJ0nwCCn6rGzVpw7LPE=;
        b=EY9RwCLqu+e4hj9xU2xzr4Gc54z5a3Wt5fTiYD0fiHjLTdkFZTXnvNqSOSRgWZpsJl
         2ziD1fYDW8StiAmR5Gndq7dJpXn+PT2fajvPZtuiGbNzXr6aKClr7Ud8jl75B0gZjTbi
         BBZ5BNedRJ6yKbQsK4JRoR86R2C9ZBQRVXLF/681CEf+sBKC2DyKCwN9ZTfSvKo+XV2w
         HeeutmYWpWAG2qh6Fop5RM3vxLULNAXQVxwvvTyceviq8FoKYTwEskzty6Y/gJRlf5aC
         y23S4esLt/YcSFIwMdwXO76BO/dyxPPDzSqncLVwOP/SEBpyVeS1rbQzITVkNgsOTb8t
         GZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068369; x=1783673169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EaMysW8ENvaf3rrvLxL52kqIKJ0nwCCn6rGzVpw7LPE=;
        b=CGYOZM7+3ANkGrSBfbew4MV5DEGzQbFBJ19hngq2h865haJSJX5aUFtRM+oCJVJkpY
         g7LEAcjuiKkHVDGESgz65K6YdcDJgIpu0rbhVMkQTHTB/VgSqrRhMUE+S2k/01tiziUv
         nFAGmFqdw+S1ankfG6hzTpaeGfvXai2p+Es4yVVgkV875Nihs/ANsNADfW/ZDoyuRfLF
         nPh1i+TsyKdn/QNnwz/N5RpRCDpYc7KuFOPALaeZ8vFUwwQ0+3Y6pheM5G1021yu4aqo
         jPvjZ8WX3Zdrkow/virUyc9mfNoTIXhCtqwn5xTMjWicJ6rJCnMnYiq725vVvB0/Wbn/
         y2xg==
X-Forwarded-Encrypted: i=1; AFNElJ/zc2j55Gk8/4tbv/orSf0hCRTpZVZndCRs3UyhFjyOGEakZV3ENc8C8N2FqE1E6JwE3MzpGsgKnXOpun8ebQma@lists.infradead.org
X-Gm-Message-State: AOJu0YwpJUesVCIsAuOy/Q7/DOr2QFnOFZaGcVgdSlQEOnkOit7UH5do
	uM7bQSCL5HeAWxTury5CqfHUpfO1oqpDLzh5tkMSUiXcabW51iEeatWI
X-Gm-Gg: AfdE7ckdYi/AY89nGaBeS/CqY9KuTndvTgCLClSk4eGkOjjHJhllarYH855aq8PdpBn
	P922Zsp/zHKm9hsRwg+Aekh8NseQsPmU/Qyhtoozq2wmbN71DJnBdlOp2CpjwD0SEqcmuzGXJgt
	2/NTFhxG5aaSqol5MYAedc6DOMnYBYTVRiMNS3A+MJs1s27cqdkTHqCaRErkSHQX+Fvv3a9FJf+
	fE2LD7r83fhTdBdQqso232jSX93PkXTvui5ga96TmPYzuwxrUFf2VHvxQl9FctcdQtXioaL0VeN
	FmVRDtfNm8EmejJwlp4FdvJ+smLQoFToDmDz5qDfBNvdICLC8XfHBhpXql0dhnFv+SZ589K9w0L
	GPgNSa+l6p2ubNPfA2KtttlQWt/0NC+O+cYZ3ruGXkvUG56O4fEuJkvGPjgj9xm0mHI1CrJeaVV
	TcyyHW67yqB4LR93YJN2GP8dF16fBLirlQyur0WGX+FxCuaqlx84O3UOh/x5T24GcpxBXJ9d0dG
	3CbGe4iM+M5mQ3yF8UKJfvNIJhfCaTa74bS
X-Received: by 2002:a05:600c:a011:b0:492:7025:13fd with SMTP id 5b1f17b1804b1-493c9b0d55dmr39419845e9.0.1783068369380;
        Fri, 03 Jul 2026 01:46:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:08 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 02/15] arm64: dts: freescale: imx8mn-var-som: move SD card support to Symphony
Date: Fri,  3 Jul 2026 10:45:49 +0200
Message-ID: <87e54dbf65c27944b015335ac699fce7f45369f4.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_014611_361628_B6FECED2 
X-CRM114-Status: GOOD (  13.18  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MN module does not provide an onboard SD card slot.
USDHC2 is routed to the SD card slot on the Symphony carrier board.

Move the USDHC2 node and pinctrl configuration from the SOM device tree
to imx8mn-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
present on the module itself.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mn-var-som-symphony.dts | 57 +++++++++++++++++++
 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 56 ------------------
 2 files changed, 57 insertions(+), 56 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index b07e71d3adee..7308613a48b2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -28,6 +28,7 @@ reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		regulator-max-microvolt = <3300000>;
 		gpio = <&gpio4 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		off-on-delay-us = <20000>;
 	};
 
 	gpio-keys {
@@ -200,6 +201,20 @@ usb1_drd_sw: endpoint {
 	};
 };
 
+/* SD */
+&usdhc2 {
+	assigned-clocks = <&clk IMX8MN_CLK_USDHC2>;
+	assigned-clock-rates = <200000000>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_captouch: captouchgrp {
 		fsl,pins = <
@@ -252,4 +267,46 @@ MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
 			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
 		>;
 	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO10_GPIO1_IO10	0x41
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 32f101ef2850..e1d2e2a72e1f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -295,20 +295,6 @@ brcmf: wifi@1 {
 	};
 };
 
-/* SD */
-&usdhc2 {
-	assigned-clocks = <&clk IMX8MN_CLK_USDHC2>;
-	assigned-clock-rates = <200000000>;
-	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
-	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
-	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
-	cd-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
-	bus-width = <4>;
-	vmmc-supply = <&reg_usdhc2_vmmc>;
-	status = "okay";
-};
-
 /* eMMC */
 &usdhc3 {
 	assigned-clocks = <&clk IMX8MN_CLK_USDHC3_ROOT>;
@@ -454,48 +440,6 @@ MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d6
 		>;
 	};
 
-	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
-		fsl,pins = <
-			MX8MN_IOMUXC_GPIO1_IO10_GPIO1_IO10	0x41
-		>;
-	};
-
-	pinctrl_usdhc2: usdhc2grp {
-		fsl,pins = <
-			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
-			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
-			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
-			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
-			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
-			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
-			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
-		>;
-	};
-
-	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
-		fsl,pins = <
-			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
-			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
-			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
-			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
-			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
-			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
-			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
-		>;
-	};
-
-	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
-		fsl,pins = <
-			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
-			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
-			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
-			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
-			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
-			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
-			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
-		>;
-	};
-
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x190
-- 
2.47.3



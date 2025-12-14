Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915DED59D99
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 21:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPsW6S2pqCNYFNBAk1ab6y0h0xeg8Q/fREDfEnNJpHk=; b=5BDdSPwMFypl0CRWuHbCH85e+j
	JMcXVEcmz+cPCJyXJjBHkFQSvN/xk39ymWZ8SI5tyBbZFoY5YfHLdBmobAokY+xrxpX/eUpcvFAhs
	V2MHLszV07UNBOd4xY/n9oX4PxuBq51g2degDIjuCjgJiPI7I5Tfnyde3FRxf5LfAsSD4k6Sxinu0
	+VkEaBiYwp0elTFNBcwwXhzU5WHa2bmtJ6sOaQ2R/lzB4YaPPRagGNedSrazw/PZx4qarZaez53FU
	ef1zSx+CJbu2qajCs9oYvYuysfsa71vVMdIeJdEA0hTmAiXYWetL/NRp4vBSZ5Ph8ppvu5rHoN9Zw
	ZAYs67zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUu1e-00000002l3Y-1uAQ;
	Sun, 14 Dec 2025 21:53:10 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUu1a-00000002l0Z-33oS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 21:53:07 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-430f57cd471so417366f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 13:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765749185; x=1766353985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPsW6S2pqCNYFNBAk1ab6y0h0xeg8Q/fREDfEnNJpHk=;
        b=P5w+CG4yo1ftrA6h+2xwWcbV/lHkeU/515B13JZM9AxGxq5MmGIIWZL1vZCtnODT0w
         1QJZf10IMdfAk6Xdu3G4iLvqbFFcI1zOAjytNEymzQly/Ck9U9AFmxETGQgrLSf48LQa
         XNIZayfHkmanX+q7px9jdWhVO6SFyEnyCWfplA0g/EQI36oaCkCEk1NbtUza3OWrQExf
         Y3aNyTzx0YEhscELLhgaGr9KkYU5100FkMwCBtBXs/xrpLQG6widgSYJvP7eVp0VeHIE
         dy6grL+t6oeIVj6q8S1i8GVKjMmwtW7Jbd/UVX4ItpocjHlrMX+qGBASmKkL3LLST7cu
         iUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765749185; x=1766353985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPsW6S2pqCNYFNBAk1ab6y0h0xeg8Q/fREDfEnNJpHk=;
        b=mQDBRa2ywICg4CzjD7LsbWye4sgW2SynuxlvvMh8c07KX9QukDd8U3grP+83bIoOYN
         SQgA8RC6d39iXMyaIK6TySbQMBFOZ0qhyWDvlzRGCwyGDLtxzIn8mHQNjGnrW4PTY6sI
         2R4qtvgqvLU6rV5JMgS8YRcd+t8P5GKHFbiTX6nxitVok4tbVt6Fo1veRp5r9bnyx/AB
         2qRmfZc02oCEDBC8a/pviJFX8Sdz2kBsue2ad9JIqi7nQMMAyd/GQvkxV/DY2FrCbSM3
         3pUXW9coJ3KKPE0bdwk8jbXHMI7AFN3B73E9HApTuogEE6rlv0Y0mQZPxut+kBXd8Gte
         PrmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwOxIXtrQFSHNyNUlF7zvccrEAnI1uqqfBy/TuVL+J2vYZLH994FfU0rTPXpEzrs2esCFXQQpSYHwsLmKqGTwK@lists.infradead.org
X-Gm-Message-State: AOJu0YzoSQHFXV3ZHcWcoU252MXBrocM2TA9qm+yQ8iHkz74OgBeoq5x
	8bPSp6h8gSd2LzQr/viLMaDhztD03p75anpIxBuHoQjfIcSJ4IDuY4zs
X-Gm-Gg: AY/fxX5ykinWxbVDhFf84N+s6z/m+g/v4bpXpEpJFQduAUwjXpY1cGh3c6ymM3QWp9z
	2Y4+MwdH9lnoiI1SbrzYixhoDtoQidrBJelaIDJs3ogYdgF9HhsMJFuQxakuiT1xYksjgQ4//qb
	vYnA+nftbSGgYoL7cz8elJRMXIvr5PweeQlU/bfC1ThjTCnx0eWSFuxfCx+9Vn5k93rMtRSbP6r
	sy9IDxlvgxk6nQQquMGzSc/Ey1ub0Hicupb4SldL1qaBa/g2g0NPG+lQQdthqMlSbck9GAHYRsP
	Bzu9N/l5ma+nAJhpuk0NAU5EJ5+dAE0kF2N7nv2y+NEZTnFJczNlm1HpckaM/G3o9Ubstk8A1R5
	XNgFJd6NHkAI6+v5d8KIyTLD1qztHEZsExE6H4h3oCbsAW16mGfreC4RyxziLtolL3iY2OgMFYQ
	u30n+zgefF2LEkV8sK3lVQpQr19LSTMyuDeRgyV+36Umv1JLvDznLeMzhtqVpkeRnsTtJjgwDwX
	eTDbYcVNI4ee+8=
X-Google-Smtp-Source: AGHT+IFUiPfYqnPKnFAbb7dTQ9/Zlq66KzQosb/pDW7TXkp0BLQndAEW5/VGYv+cRcJO8L2g0Ou2XA==
X-Received: by 2002:a05:6000:2411:b0:42b:2fb5:73c9 with SMTP id ffacd0b85a97d-42fb48e870emr9116098f8f.58.1765749184691;
        Sun, 14 Dec 2025 13:53:04 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f6a42c8csm7625568f8f.16.2025.12.14.13.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 13:53:03 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/6] arm64: dts: imx8mp-var-som: Move UART2 description to Symphony carrier
Date: Sun, 14 Dec 2025 22:52:50 +0100
Message-ID: <20251214215256.5812-4-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214215256.5812-1-stefano.r@variscite.com>
References: <20251214215256.5812-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_135306_776546_F25F2C25 
X-CRM114-Status: GOOD (  12.86  )
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

The VAR-SOM-MX8MP module does not provide an onboard debug console.
UART2 is routed and exposed only on the Symphony carrier board, while
custom carrier designs may choose to expose a different UART.

Move the UART2 node from the SOM device tree to the
imx8mp-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
present on the module itself.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts  | 18 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-som.dtsi     | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 361e6122bdc3..291f65e36865 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -9,6 +9,10 @@ / {
 	model = "Variscite VAR-SOM-MX8M-PLUS on Symphony-Board";
 	compatible = "variscite,var-som-mx8mp-symphony", "variscite,var-som-mx8mp", "fsl,imx8mp";
 
+	chosen {
+		stdout-path = &uart2;
+	};
+
 	gpio-leds {
 		compatible = "gpio-leds";
 
@@ -68,6 +72,13 @@ usb3-sata-sel-hog {
 	};
 };
 
+/* Console */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
 /* SD-card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -95,6 +106,13 @@ MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
 		>;
 	};
 
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 158a78ec9656..5bba91dcef17 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -15,10 +15,6 @@
 / {
 	model = "Variscite VAR-SOM-MX8M Plus module";
 
-	chosen {
-		stdout-path = &uart2;
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0xc0000000>,
@@ -206,13 +202,6 @@ ldo5: LDO5 {
 	};
 };
 
-/* Console */
-&uart2 {
-        pinctrl-names = "default";
-        pinctrl-0 = <&pinctrl_uart2>;
-        status = "okay";
-};
-
 /* eMMC */
 &usdhc3 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -267,13 +256,6 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
 		>;
 	};
 
-	pinctrl_uart2: uart2grp {
-	        fsl,pins = <
-		        MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
-			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
-		>;
-	};
-
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x190
-- 
2.47.3



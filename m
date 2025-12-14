Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EB1D5B16D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 11:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPsW6S2pqCNYFNBAk1ab6y0h0xeg8Q/fREDfEnNJpHk=; b=K3SE/H/Kw26ohJiCLQcdslw7L8
	80VPpGkAxloPDMKT52D5nkybzv+ax0dlk55rV7ccX8fHYwZfMxmLIyF6jSLSmheZQVgKoAmT7R7ac
	lnUdheWypEDqpGGzL5HpQsnwUjrcjkyAucKvT2REuVtzkCV/+M8D7MpWUpye3YI0qewet6DN1B0EV
	qb5C6MU1q4FnJ3+7h/ZFOVwr4AkQcfo1F5D3981i0Q1oUIz+f2Uu2HN5khkIieLjMDWP40KiDLfVZ
	V8PY/roDEcd24xbXW+zML5BQAM6IJHzxqd2nA9uNs5RqKrTXvt7x0pm3AooebcEqDETtZ+RUkrHl5
	1m2RKWNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUjvI-00000002NZK-035b;
	Sun, 14 Dec 2025 11:05:56 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUjvF-00000002NWV-1W2I
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 11:05:54 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so269813f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 03:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765710352; x=1766315152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPsW6S2pqCNYFNBAk1ab6y0h0xeg8Q/fREDfEnNJpHk=;
        b=C3xK+KX6XJgrUT753odOsVAFnn7f/yDSiCpXJcBvtg8sIu7iQ6UvcimyOr2AlEDaLs
         eDzLgaYNeU7VrqY1XCU++aD5qgdFynLORfZykahoE2xNyuQN/0V4Pn38X1VO7ZzrzLTs
         T4FMnv8rmgKfPUvDz/+5pViAxJLoMxzL6FynOV3UsmH/Iapdqh4Yesh7vMczboWHxF71
         6EKNfE7rP+JAfNfc8ax1FqLp9Y1DJdOHPyG5p963ay74xNwJv/esREQYD9x6CIt3BCNk
         Bz119WicvyD29MaLp/iQUsLC8B0eg9WTiF+pxOXHSn0Y8r15/HUn1b2BHkgKGU/K6eNk
         0CHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765710352; x=1766315152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPsW6S2pqCNYFNBAk1ab6y0h0xeg8Q/fREDfEnNJpHk=;
        b=ttEvfcKpXF/ZolXhCK5eDAKTDHZbQLr86NYrk0tbScIoY6rc/HmOcPlXP+6ZC07oPG
         fiM09/LaamtsxnIoNRlO1qetYqcem2FIUrDuLF0zqC5hK0S05Dlwx6of2/RD9GgX0gyI
         Q/odgUB5MoBku93bJf+PYO0DFsHtV4Q9Xfpm1V+2aCRW63DmYz1IQtB43JDgp7ippKPj
         uuHj14eKHwuSRLgQv+4c8MmDIKaLa0f5wmaenn+9YFNJaithVJkXbsXXFigRjfxwywsR
         LsViq68wOYZEwFD0eBNmQ5MLK5z6Ag1m+0HlklfAJWdW2OO8tbX4QDZoQ0pXp9mK5pa0
         lLSg==
X-Forwarded-Encrypted: i=1; AJvYcCVelpC7T5ASMxM6825doLBjOvYLm/vgvrqxYrviQ6chlwD7VA+1c32kyJflqzulin1qdHgnRA7aLo2IKj3ekYfg@lists.infradead.org
X-Gm-Message-State: AOJu0YyWTXfHsxByhoBBalAqlmi4u+rCrS5H+3qvTdEGXdA5oWKvmdFw
	QrTzjs5nlhuQMEE9ToxHdwgEYpYcQXWdsue4OY4WsRbJz+aAQemN52wv
X-Gm-Gg: AY/fxX7I+u6xKWgGh0S9nqELV96saVCLVTFZK2M4WRlVRkhG6Z4dJ/CQZrSnHsvkPdW
	5YVKmXyB96Gc1Fsv/DYUlmpHUHo1mW+jizX+LuHxkN5/pUXv8avAgbAcFCJ1GSyzf7fl8SWJ3dV
	PVPunVMfN0od7YGKoeaaHP9HsTXgDZYxRhvAZbDJm21tPIoLcDnaqaiZrd9AwOJMBN6C+DiPUbD
	TQ6rz/WI/gTobuD8jX/QbosO19Gc6mFVqsKFXI/L7qPFMQ6+FxOTAMuqLUgnoi8lB4+sJ2WNHhv
	pleiasQCQPQhCpeVTYOmhQFJvMbpYC/dDTDG5HzhIzIm48Wf7kN+U+ZglKafwoGK7GDXcbUerel
	GFV101iJwQMxiODjtTKP1y7RopLz40LmAJMWnSBC/WApU/xG7uTZLVZ3+HbjAq+nNmaPVzZv5v2
	yejuF8uvBa4HE7LJ7LqkgInFhy0f2mAvq8AVOjpHFQUpYPErMe9XOzzsweDzpvq2e+KBSdMSE7j
	E5mEYsHvfBCcmHPWIaNJI0eGw==
X-Google-Smtp-Source: AGHT+IHRRCprU7FqKVXYLAB/iaW5bMB8tmN1SK0UGxnB0PPzYkob5dN5fLhAuRr/gkHK27KMmlRlQw==
X-Received: by 2002:a05:6000:26cf:b0:42b:3dfb:645c with SMTP id ffacd0b85a97d-42fb44a0fdamr8844593f8f.12.1765710351632;
        Sun, 14 Dec 2025 03:05:51 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm7823660f8f.38.2025.12.14.03.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 03:05:51 -0800 (PST)
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
Subject: [PATCH v3 3/6] arm64: dts: imx8mp-var-som: Move UART2 description to Symphony carrier
Date: Sun, 14 Dec 2025 12:05:26 +0100
Message-ID: <20251214110531.9475-4-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214110531.9475-1-stefano.r@variscite.com>
References: <20251214110531.9475-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_030553_421919_ECF1CCB6 
X-CRM114-Status: GOOD (  12.96  )
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



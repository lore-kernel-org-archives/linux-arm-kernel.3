Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E017CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XS8EXfD0I7q+hrNj9u5k8EGUHhOwOotqLP8CFPXgTJk=; b=uD2MneeWm9F3fXRHfXy509qQPO
	Ayoicv6Q31sEPQC+XyE2VDtk/AU7J/xPSryxWGAd41ikT4V97CgUjZpnHz0HNEymfyEP+l6ZFgeZB
	/BdJs3a31WRtx9ZjZ6Er+u3mYABmiQhxL0qL6/bbSGrfaWS8rbfP42u1HYTuaMxzHxstOpC7S6bb5
	QQy3XY5iDI7/sz8TAehQYVCEqEkWny6hntFa2KtJJO/pxnVwOCZRfMtEbeEkjggTmgx/ssFCH79Qm
	yMDU8+0VQKlEhf9heJsCMyabPSZv4nmklbIJntzoNFSww850ExA4zFrbiTaRnfklxOY0las/WoL0X
	753+JDCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlP7-0000000F8iu-2S7G;
	Wed, 03 Jun 2026 13:13:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlP2-0000000F8an-3PAe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:13:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso3918785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492379; x=1781097179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XS8EXfD0I7q+hrNj9u5k8EGUHhOwOotqLP8CFPXgTJk=;
        b=YdokVcUXIIBjvs9/Q9AJuum3VLwpDasck9LcSq2EV3/RJ2AyovyK9c9rGjxGCP9gVf
         8I3MjrEBSL48OzeCy4OzaModzmc7e8NY4JEOknv5otaxOKAmqUAi9BBokrDo3/5eQgeB
         k2feUdL2NOzOKRSQJmtnhfHq5SM26BgMoshGe2PMrRhvY2im5P75O128INKoBeySFS+6
         Q8OUtQj4GKq3+COYDt/FzhHF069/7j2zuCTiopMmwSLR4k36KySvobHoOlblfsj/vR8k
         A/43Apkl7qjEjpnOgfmX1mX0EPq71xG41UDiUnYSCvAwj43hHDitiXb2jSX8JLDJuj+5
         IK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492379; x=1781097179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XS8EXfD0I7q+hrNj9u5k8EGUHhOwOotqLP8CFPXgTJk=;
        b=pp7yRnotPfZqYPPzLP4TlkHGVlK7X0/NGnzCcItXUqlgHFRDXHuj2Iq9RUe6EZRn7A
         c+kET5nzEKUnXpL6dUeIYA0CTErbQZ7+wEmea0BvVdjVgMWlQQUy1bu0/sd7bOWYPsiy
         eN2sDJscePTnTHGLo+M+EdwrT175ggx8HyR0YFqCqYJQ8OZTVMW42br7x40t2cwUNWaW
         CaYBz3qfw0Bubsn0IqQ1unJUiOL6+8wmthG3IcLxTyrArgxi4GvPWBZj2Fps7IYJWCKl
         SI5bV+cc/bO+Hmk4s3bTznN701lqPP52qkdueFZV02GI5aJTv9VdXOaXVhdObBBc1AEo
         nE6g==
X-Forwarded-Encrypted: i=1; AFNElJ8Bb6NBI3QWdgs2pkm9RX//p6nnGwgE9ARSstcNBz1x/AxRGLZXvUyGBmS4/QSG/s00lL5lq5pKkFAlMRMmsvbr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7ma/CYOzx6e/319z6qgEnyisgyo20+B3rbr/65IEORhHHCGzX
	NiV8IYlknEm8dLT8ZGG7uZ8e1WlL0Kq+p9g5vHGZEsAHhtvlTg/4HTlX
X-Gm-Gg: Acq92OHqPSHS493HuuRBwg0ODvJsyZfmXL6vBsucLOhBF1gQvoqcmCt48JKpoHNyS/n
	0H+m6ISXjAxln/yLZdt5Yg4eE7U5IRaboPSnDj+0UcbCOyLBhLYFhCAO/UmlwsV8PMRriC6dFxg
	77byIGsixKp6wUup04ztAh7FJ6f1QrflXqwSaL6RMLDCYAsN19icthP1J4xXo1VHzSpkzN4MA6m
	ViEYfSfHZDVAN87mYZFjvYDAmuj+9bMAwppLWvNcj5Uk8pcDJfh2KS9Us6Y4ZG2+qRCTss/bvWd
	q+VwgwE8D43HP8BNcjBVwQ4pmk6PRZOBARRwjl5OXN4fD+mze6qwJfXGizCM2hPlYYgZC4ObjoT
	kiShao+U9/6drLsLz1YxX3aija91PfrYHWE6stOCONLuXvXYzYHdfchmbcGFCWC5ad1GNsfgCAD
	e0ccF9vdJ56lb7X6bcJ4P2EW64kpCOH0jBJCq4Rpj9un3TiKj8zGOg24HvUKt2TMS0GKtpenCJh
	fR7wJemqfqBP01Sf5jO4OZ5+lL6ffXyxGp6nb3OSX6Iri7m
X-Received: by 2002:a05:600c:468d:b0:488:7d01:f67b with SMTP id 5b1f17b1804b1-490b611af3bmr56074385e9.6.1780492378779;
        Wed, 03 Jun 2026 06:12:58 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:58 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 05/12] arm64: dts: imx8mp-var-som-symphony: enable header UARTs
Date: Wed,  3 Jun 2026 15:12:43 +0200
Message-ID: <52dc9b387d337c646718378306e76a1bb70616e2.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_061300_861579_0054A5E1 
X-CRM114-Status: GOOD (  11.59  )
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

Enable UART1 and UART4 on the Symphony carrier board and add the
corresponding pinctrl configurations.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index b15ca44b9a92..9500c9bf0f42 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -154,6 +154,13 @@ &snvs_rtc {
 	status = "disabled";
 };
 
+/* Header UART */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
@@ -161,6 +168,13 @@ &uart2 {
 	status = "okay";
 };
 
+/* Header UART */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usb3_0 {
 	status = "okay";
 };
@@ -261,6 +275,13 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
@@ -268,6 +289,13 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
 		>;
 	};
 
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX				0x40
+			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
-- 
2.47.3



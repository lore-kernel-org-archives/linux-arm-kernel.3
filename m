Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75333E9A037
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfWFh33aOMYuO7yfeXL/PtQsXgAkQdOamwxvw84QZ9g=; b=c1nz4G0RKSV5W+5RmNq77ttvsO
	QXm83yLVPw6tVHiMg+wrUAppnQC3Smk87Prz/UoPGgrblJ7QigixswWYqzaQQaEzSeC2Xz8be43I5
	punE8fg3SUvI+jjmrmsugIvKxaCF2TWrCRkU/9sxIizUSth9Yf9+JVUZrQWGc5H/cip2u4jx7+koR
	dZIz+IUDf4Hwfw4u4KMcS52v0IHxjhYGVQ7d2snduTWK2Wrn71Wfn5y9jFlvKh14x5LvfEz03Gzlr
	lBcEpap9uHXLujNIfZJ7L20ZZTDfFAzr0Qm82LFT0RssD7FS8xYoXcuhPc1EC7vZld+ayLj27YsEW
	cczqg/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ32-00000008kSX-0UQP;
	Tue, 17 Feb 2026 18:43:48 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ2o-00000008kHB-2euQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:43:35 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43767807da6so3276237f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353813; x=1771958613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfWFh33aOMYuO7yfeXL/PtQsXgAkQdOamwxvw84QZ9g=;
        b=TBNQdnrmrhkvhjv17qMWTwyxamSOKL8CxymvWWknBzjm3cFIGRk6hKzKII+l701Bbf
         qJY5t0Y79CcbjZW7yeY+rk5Jwvmm0OY6fXrI0ecqDn8BqkQq+KTTEbS7NqnLSwcvnqMT
         +ZGp6HaBsGNV6yBKg1lhQFR+mtg72A9KurL+LD+f/MaMWeYKbvS3lRHGNrTMMNZHU+c+
         Z8oP9I+nHYae9Hcl1WI5/Q4Xgpw1m5AHUqi5DOY4J44hgAPjk0WJsGLEcc3dI48ApywV
         BqU6T9JimdhVImg9AsPATm/TUo7a4tXalEDPf+u1rrQtIES5RhMv8YhXbQhCwAmm66//
         EV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353813; x=1771958613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zfWFh33aOMYuO7yfeXL/PtQsXgAkQdOamwxvw84QZ9g=;
        b=M74Cd4ObWhP/hITnAaOWFLAAu0PurmQ3CEoYkR0bM/pR+ytbqaZ8PdPiEDo/sSk7UT
         FE11WVq7rvOihvhx0DDUgjcQ9rp2/KmdENuqDD8KPYb2S3eyEydKkq5XavJsNrdOgycl
         YI04JCQa4fF5BxR4Zge7QohMwkVXa0pF7KUatrPRFF19/Hvz0L0XrB71rDpAkqZCdwzj
         IepqldoRfrRnDIe/yjyBpdSBBTd7eiHx5hM080+0VldY/P6AbO1sQnMvcr1ofMz5+j/S
         bIFIp/cOP8mz2HOpIDU3qxGXW+WGoRPABTS+XMI4IGjIc5kPaNZ0fIFOJQ3VZJxsHHxP
         RSgA==
X-Forwarded-Encrypted: i=1; AJvYcCVcFGeNyERt3ZCLrGnkXfuv45x6Ce5uHFpSKMzXigCwdqBr8nH3PoTpEMiJOdBd98ODzObELjXD3OG4ihHCqnsp@lists.infradead.org
X-Gm-Message-State: AOJu0YzLFbL2HLRaE4rXQYxh0fZZb34Bw23QyReU4YcF5pUtDx6muH6s
	ZTMydcXJpcFVklYBBOo6yoaXB2Hp/K0suDZbbIm9dsYKVcQNpmY1018y
X-Gm-Gg: AZuq6aJfzjvMWny90jmXh3G8D7gQc+z7bvS2XhVVr/fhhn5wfi2JeGHFct0zgkmd7b+
	MHr3RCfSym2Dzj+5xGQfWGUUT/GPAuCQ7BeSD8tAWCLxue9sZabcXErm+gwvtRC6588s/EtHur6
	N4ZgCQ9olT/wVRKMCJjH5k+U4KrlmoKy3H2uFSmPL33M8VTLqjwozDdQBZ7IffMuopK4rW6lIxG
	XdnJ58CN378YBHYdy2khQGU/rFwZg4fWfwzVKInPj2zJuCgigjetfwW4ZUMmUbDK5wP1b5yKh3H
	9rML/PiPIvDNWy4wR4cAfcoupmmw6pF3+DknW3/seChA0hPCo0yfkU8rnydoK7DwBGfG8HSwnsg
	05p5ouK3LgvK/Kj9T+aTyjryjfrhJqSahJCyofbL/+lftbUdI7VyPw4DqEI/AqF74ieS1+zUxR1
	nsoQGN37p/iIhnftUs6OELnrVIE4eBj3Hwyow9VjpleoJTed67waVvOEso5MwvUSfDwyq1oF508
	mzQv+8s21618CmZGmXZ+F8EdvRhYSRKR2bI2iW1
X-Received: by 2002:a05:600c:34c3:b0:483:3d42:d04f with SMTP id 5b1f17b1804b1-48373a7b7bcmr244811265e9.37.1771353812423;
        Tue, 17 Feb 2026 10:43:32 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:32 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 06/11] arm64: dts: freescale: imx8mm-var-som: Update WiFi/BT configuration
Date: Tue, 17 Feb 2026 19:42:40 +0100
Message-ID: <3e79c4d806b8b8024b71bc99c36b09a2fbb90a65.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_104334_700742_7968DD2E 
X-CRM114-Status: GOOD (  14.72  )
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

Update the WiFi and Bluetooth configuration on the i.MX8MM VAR-SOM
to match the latest SOM hardware revision.

The SOM now integrates an NXP IW61x wireless module. WiFi is connected
via SDIO and Bluetooth via UART.

This patch:
- Adds an mmc-pwrseq node to handle module reset and power sequencing.
- Updates the USDHC1 node to use the new power sequence and required
  pinctrl configuration.
- Adds the Bluetooth child node under UART2.
- Removes the legacy Broadcom WiFi device node.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 41 ++++++++++++++-----
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index cdcd8faad65e..e2b1919d7188 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -22,6 +22,14 @@ clk40m: oscillator {
 		clock-output-names = "can_osc";
 	};
 
+	iw61x_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio2 20 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+	};
+
 	reg_audio_supply: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "wm8904-supply";
@@ -392,11 +400,15 @@ &snvs_pwrkey {
 /* Bluetooth */
 &uart2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart2>;
+	pinctrl-0 = <&pinctrl_uart2>, <&pinctrl_bt>;
 	assigned-clocks = <&clk IMX8MM_CLK_UART2>;
 	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_80M>;
 	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth_iw61x: bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
 };
 
 &usbotg1 {
@@ -413,21 +425,15 @@ &usbotg2 {
 
 /* WIFI */
 &usdhc1 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-	pinctrl-0 = <&pinctrl_usdhc1>;
-	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
-	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_wifi>;
 	bus-width = <4>;
 	non-removable;
 	keep-power-in-suspend;
+	mmc-pwrseq = <&iw61x_pwrseq>;
 	status = "okay";
-
-	brcmf: wifi@1 {
-		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
-	};
 };
 
 /* SD */
@@ -465,6 +471,12 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl_bt: bluetoothgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6		0xc1
+		>;
+	};
+
 	pinctrl_can: cangrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_GPIO1_IO05_GPIO1_IO5		0x16
@@ -710,4 +722,11 @@ pinctrl_wdog: wdoggrp {
 			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B		0x166
 		>;
 	};
+
+	pinctrl_wifi: wifigrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_WP_GPIO2_IO20			0x140
+			MX8MM_IOMUXC_SD1_RESET_B_GPIO2_IO10		0xc1
+		>;
+	};
 };
-- 
2.47.3



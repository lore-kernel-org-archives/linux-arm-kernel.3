Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA54C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 15:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f54xB8jAzZGxPN+eurWEBlbBBztYq662AJjtmWBvOs8=; b=wq3qCEk3xgZYVrYp237GgLHIFE
	tVdGJNXEt9h2isJJhzAkCHnRABBcdL/8mxDGloXtqumjRMtecIhRfbP6AiPiHJqqrVpTGBYG0caAC
	KICxE1+SeJEfSnPLObMLFaloUCoEZx696w5qAhbbgMmlkJxnIE9H5+tl1CLNoMyYlugZLG2tZfe2T
	uMe92zpi0iOmlW//qKZBVqLy7wJ/IdiQMvMUGrwooFs2tVnR7yMLwQcL7OqW5vxAgO5fqmgB1dDT8
	/i6wK03gZqz/Adp5+B87d45PqeR8aTQAUDlkUs0ORUqszNTe36M081kmzSTU5AQ0egwBouYSqnWPg
	XVN5+KaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54sJ-0000000A6xc-2ZzB;
	Wed, 16 Apr 2025 15:40:31 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54Tz-0000000A2Xp-0K8z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 15:15:24 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso1279054466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 08:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744816521; x=1745421321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f54xB8jAzZGxPN+eurWEBlbBBztYq662AJjtmWBvOs8=;
        b=C4mC5rCWSl6ZBfXXYcOhMvzTbewGyoIydZrT1m/wrWuzf5O3IaJC1Alj2wbSeFyqYy
         3hlPVI568wVU2JQQs1CGefFNzUXL1gf+s/5+Grmui0GghNVoGGOp7DW5MOssXg8p1izg
         m2DU9p43wPgRx2dvfSd+eqD0Zjsyt3U+UXv6h/a0W2bDPye67+fp1ScttxTMv+lKCvp0
         KsR7DMfKfcwCa2OAJhVKtHs3YFPAtGuWvZ2+ZlUE2CEwmLxGetbSz0vLbP1h5cahSxrF
         yljb4P+AsW4NOeQo+Nq4Hq8o4QIaukRGfZV1wOHL8xZC93K34riDcesH3WeasvfyUfxf
         hYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744816521; x=1745421321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f54xB8jAzZGxPN+eurWEBlbBBztYq662AJjtmWBvOs8=;
        b=JY41NmEvFh4eOeUC9WZQmPQy3qKjXI5u8RQfAlHBGXvOcT33afQy/6QFzEVb/nQilW
         +Uy5G70rZBilmfYNil5XpZw3MxjavnNNlfQgZ278mWmbgtQx+gVPLX+fbdZ2ruO93EU+
         DYzFUKOs0+5zd3P/e08wsLT9LYZt2nP8wkMbl40E46qwkppI2aLFGyA9hMmZ5uuBLzcZ
         3xrQXk4T0kAIVmzgumvStqERmo9L1SpwJM1OUKnBhqz5707iNVNDqNXYIcsp2UGYMR9q
         sEAVWxejpK4kBjd/seZNcPcGgK2DnvCY0fJX4RUkGfWykEd6uMtoEeOOjsIj53fnpA1g
         QRZw==
X-Forwarded-Encrypted: i=1; AJvYcCVlGKy7KjQyvkH/8jpf5/DvucIRxzvv90tehnqIATV/sGxaDG8S/YmIrykuxtaHCOLjQGrohEB7kd+h9urHn0BI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5RjHLcRx+uEfCNd7Z4kEHcdo2ER18UDZg25CKGs7e10kzdaJs
	76EaLyZJrwiCQvFYxrfneGBgJZ739b0REUg4aHW4TUESSln+3oSK
X-Gm-Gg: ASbGncsp9QZnz51a6g1mFjLtBgVyyWu5h9JvGW1wyVguYSTG7K8WZWdc3FbNNcEGGo6
	VXG+BKy7Tav+BZm+faDwdolq/ovEH5Y55bg4irROoHIQCqwFOHSK4lTA4tsm848niQ2f1tPRDk1
	gxdN6M6XjjyLydfHI+dHYVlRZc846jG9WTjNlog60a9bbl926BSvQfm/n8YZGaOK3AZHqYSjHpK
	sZDYxpjy7C5grUX6DArcvSmeP9ZC9b3+xz+JEU8hWx13Lmml2Ag5n8x4dJeogeSsq9OSpHNCRoe
	rVDRXsRqwXWRB1uV6YPLjMDS7pMJHn6J45xUFjQfou6X2PdGrAKOLkgZkXEo2GxQWLTvB7kEVwK
	P1AMgQFxSyS86KAFel6k=
X-Google-Smtp-Source: AGHT+IEYDMPTAVgdmlNNu9P4Oui1LjNbVBOfvMZvnfG/4JzHe+Ej8lmr2fDQnm8jtO40TBJR4xN3QQ==
X-Received: by 2002:a17:907:3e03:b0:ac8:16fb:7c85 with SMTP id a640c23a62f3a-acb42bffb7fmr219117566b.41.1744816520410;
        Wed, 16 Apr 2025 08:15:20 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3ce5dbaesm143286166b.85.2025.04.16.08.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:15:20 -0700 (PDT)
From: max.oss.09@gmail.com
To: max.krummenacher@toradex.com
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: imx8-apalis: Add PCIe and SATA support
Date: Wed, 16 Apr 2025 17:13:41 +0200
Message-ID: <20250416151353.1692373-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_081523_120932_F5ECE274 
X-CRM114-Status: GOOD (  14.08  )
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

From: Max Krummenacher <max.krummenacher@toradex.com>

The needed drivers to support PCIe and SATA for i.MX 8QM have been
added.
Configure them for the Apalis iMX8 SoM.

The pciea and pcieb blocks each get a single PCIe lane, pciea is
available on the carrier boards while pcieb is connected to the
on module Wi-Fi/BT module.
The SATA lane is available on the carrier boards.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 .../boot/dts/freescale/imx8-apalis-eval.dtsi  | 10 ++-
 .../dts/freescale/imx8-apalis-ixora-v1.1.dtsi | 10 ++-
 .../dts/freescale/imx8-apalis-ixora-v1.2.dtsi | 10 ++-
 .../boot/dts/freescale/imx8-apalis-v1.1.dtsi  | 70 ++++++++++++-------
 .../boot/dts/freescale/imx8qm-apalis.dtsi     | 10 ++-
 5 files changed, 74 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
index dc127298715b..311d4950793c 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
@@ -104,7 +104,10 @@ &lsio_pwm3 {
 	status = "okay";
 };
 
-/* TODO: Apalis PCIE1 */
+/* Apalis PCIE1 */
+&pciea {
+	status = "okay";
+};
 
 /* TODO: Apalis BKL1_PWM */
 
@@ -121,7 +124,10 @@ &sai5_lpcg {
 	status = "okay";
 };
 
-/* TODO: Apalis SATA1 */
+/* Apalis SATA1 */
+&sata {
+	status = "okay";
+};
 
 /* Apalis SPDIF1 */
 &spdif0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
index d4a1ad528f65..3d8731504ce1 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
@@ -191,7 +191,10 @@ &lsio_pwm3 {
 	status = "okay";
 };
 
-/* TODO: Apalis PCIE1 */
+/* Apalis PCIE1 */
+&pciea {
+	status = "okay";
+};
 
 /* TODO: Apalis BKL1_PWM */
 
@@ -208,7 +211,10 @@ &sai5_lpcg {
 	status = "okay";
 };
 
-/* TODO: Apalis SATA1 */
+/* Apalis SATA1 */
+&sata {
+	status = "okay";
+};
 
 /* Apalis SPDIF1 */
 &spdif0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
index 5e132c83e1b2..106e802a68ba 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
@@ -240,7 +240,10 @@ &lsio_pwm3 {
 	status = "okay";
 };
 
-/* TODO: Apalis PCIE1 */
+/* Apalis PCIE1 */
+&pciea {
+	status = "okay";
+};
 
 /* TODO: Apalis BKL1_PWM */
 
@@ -257,7 +260,10 @@ &sai5_lpcg {
 	status = "okay";
 };
 
-/* TODO: Apalis SATA1 */
+/* Apalis SATA1 */
+&sata {
+	status = "okay";
+};
 
 /* Apalis SPDIF1 */
 &spdif0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index dbea1eefdeec..6f27a9cc2494 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -339,6 +339,25 @@ &flexcan3 {
 	pinctrl-0 = <&pinctrl_flexcan3>;
 };
 
+&hsio_phy {
+	fsl,hsio-cfg = "pciea-pcieb-sata";
+	fsl,refclk-pad-mode = "input";
+	status = "okay";
+};
+
+&hsio_refa_clk {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie_sata_refclk>;
+	enable-gpios = <&lsio_gpio4 11 GPIO_ACTIVE_HIGH>;
+};
+
+&hsio_refb_clk {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie_wifi_refclk>;
+	clocks = <&hsio_refa_clk>;
+	enable-gpios = <&lsio_gpio2 11 GPIO_ACTIVE_HIGH>;
+};
+
 /* TODO: Apalis HDMI1 */
 
 &gpu_alert0 {
@@ -514,7 +533,10 @@ &lsio_gpio0 {
 			  "MXM3_112",
 			  "MXM3_118",
 			  "MXM3_114",
-			  "MXM3_116";
+			  "MXM3_116",
+			  "",
+			  "",
+			  "MXM3_26";
 };
 
 &lsio_gpio1 {
@@ -586,15 +608,6 @@ &lsio_gpio2 {
 			  "MXM3_183",
 			  "MXM3_185",
 			  "MXM3_187";
-
-	pcie-wifi-hog {
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_pcie_wifi_refclk>;
-		gpio-hog;
-		gpios = <11 GPIO_ACTIVE_HIGH>;
-		line-name = "PCIE_WIFI_CLK";
-		output-high;
-	};
 };
 
 &lsio_gpio3 {
@@ -660,16 +673,6 @@ &lsio_gpio4 {
 			  "MXM3_291",
 			  "MXM3_289",
 			  "MXM3_287";
-
-	/* Enable pcie root / sata ref clock unconditionally */
-	pcie-sata-hog {
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_pcie_sata_refclk>;
-		gpio-hog;
-		gpios = <11 GPIO_ACTIVE_HIGH>;
-		line-name = "PCIE_SATA_CLK";
-		output-high;
-	};
 };
 
 &lsio_gpio5 {
@@ -771,9 +774,30 @@ &mu2_m0 {
 	status = "okay";
 };
 
-/* TODO: Apalis PCIE1 */
+/* Apalis PCIE1 */
+&pciea {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_reset_moci>;
+	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
+	phy-names = "pcie-phy";
+	reset-gpio = <&lsio_gpio0 30 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_pcie_switch>;
+};
+
+/* On-module Wi-Fi */
+&pcieb {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcieb>, <&pinctrl_wifi>;
+	phys = <&hsio_phy 1 PHY_TYPE_PCIE 1>;
+	phy-names = "pcie-phy";
+	reset-gpio = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
 
-/* TODO: On-module Wi-Fi */
+&phyx2_lpcg {
+	clocks = <&hsio_refa_clk>, <&hsio_refb_clk>,
+		 <&hsio_refa_clk>, <&hsio_per_clk>;
+};
 
 /* TODO: Apalis BKL1_PWM */
 
@@ -806,8 +830,6 @@ &sai5 {
 			       <722534400>, <45158400>, <11289600>, <49152000>;
 };
 
-/* TODO: Apalis SATA1 */
-
 /* Apalis SPDIF1 */
 &spdif0 {
 	assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi
index c18f57039f6e..f97feee52c81 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi
@@ -22,6 +22,10 @@ &fec1 {
 	phy-mode = "rgmii-rxid";
 };
 
+&hsio_refa_clk {
+	enable-gpios = <&lsio_gpio4 27 GPIO_ACTIVE_HIGH>;
+};
+
 /* TODO: Apalis HDMI1 */
 
 /* Apalis I2C2 (DDC) */
@@ -188,12 +192,6 @@ &lsio_gpio4 {
 			  "MXM3_291",
 			  "MXM3_289",
 			  "MXM3_287";
-
-	/* Enable pcie root / sata ref clock unconditionally */
-	pcie-sata-hog {
-		gpios = <27 GPIO_ACTIVE_HIGH>;
-	};
-
 };
 
 &lsio_gpio5 {
-- 
2.42.0



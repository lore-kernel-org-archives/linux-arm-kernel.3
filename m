Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC290FCC06B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q40sieppdqWC0Pb0LgkBOiCq1+WdogMkkdM87+FLk/0=; b=OCJ/ni0upQZsGYx9bgqS6A7Pat
	WIL+cDlSccavONUkII4roaA6OlGr2UQhc8LwDLseg5/NMchIYQNECM36uMDe1FwMesRpCgMpeJFeK
	vYVQDsSlNJI74zXNftyk9I0dKr+PpB3d4whFaRWG7K83Zlua7YUtSPLiMju6z5HBoOgdogHFX345P
	3/mjkZZ7kHJ/xBbXMtdvLs1c7Zz3r4NEady1Bhpo7MU8aAZAOzk/UDILNBDZLz/YudsHa+OVYxgVb
	e3B7iFOfPXo2djVIDEgzfcXTZnfVcxjHN0oYMtutLUqsqE/Pulgs/0U+bVTThugnd1oEcDmvwWAoQ
	E3I/iQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybK0-00000004QhR-0s8j;
	Fri, 06 Mar 2026 19:58:52 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybJv-00000004QcQ-3uKD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:58:50 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-439c4bde55cso2642433f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 11:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827126; x=1773431926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q40sieppdqWC0Pb0LgkBOiCq1+WdogMkkdM87+FLk/0=;
        b=YMTNzNn7Ck41tpqS0BXMhNAh7KPR5yLBh3y7wAVwcau8q5tqhaq4tC/dXcBS6wjsp9
         9M1Pahmx9WX7VVWPFa/p+ZM3FlTC+MuRnNy8l1jjU7gtDV8ArxnAzG8smFvPqZ/vTFaq
         YY6iORCoxJJqcJzqvHeqFBy56w09QTSOIrya/wbgpJjOYjLJv53YvIFhPTk3AM11iwbY
         YeNPqWH38yQcCHylT3Xo0056JjfLBa9h3NbG/z0UjrZrYQnrNCQZtSwOBdWpNJdz5onf
         UNHGcvYXv3+5BNqaDFMOU5P2xWEwWcJpJnqLpc7h11yHj59qMO67RBBgGZkWMWBw5mol
         Ppog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827126; x=1773431926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q40sieppdqWC0Pb0LgkBOiCq1+WdogMkkdM87+FLk/0=;
        b=djuHvwHXPdhTOP0QwsR1DFKXabs5y/UVscvEg/XVTiKRA9Evmkh//VWFIE86FmGKxD
         Lfj4uGYX0bKU8acjVtQul+1yyaWueF4qHPRGWPFjFNt5c1sbL/urrPOcNNHT+cvqJJQT
         GNp1zYtP0kA0hM1IkjmIVviKTgu9Q0WQb5jzBF4JYO3LcB1cut4qW9m6fpIbTxA+cmAC
         cYwioWXtRsJofGJSHpuikCTmWAZ5SMgjR8IswLh0oO2yXW1pbMbWiakJJ1qIfw+O068J
         MBUNR4AhsGhyJbC4/dFc7MfAm5KD8v6Lro5v4IyPepbfD2uRJZrMrGt2xMRBY2BLmG2J
         d2Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVYkyNS4w0vSkMA/HrwJ4Cwi8yS/EEmH2Gga8XguTR+YHNW25/BnBSppertwenNVLVMJHh6hk94C+cUCliWWr7h@lists.infradead.org
X-Gm-Message-State: AOJu0Yz++TqNu4NxRYaROTO1iCjMDXMC4cVdswdfYOU8EBqxrADDX7Ji
	LQ1E+w/FV1px9l3glmDoBUcG625pCWs/ULc0ryhcwzofavu1ieoDLcfw
X-Gm-Gg: ATEYQzwm7CzTxKF3NR1oEHl+S+jHvT/IMSJjZjLAVj3Ffdt3yBnjRsiGY1pEIuGHlxk
	Ez1Se4mu5YGMR/86skTHQ+ZDkUhOskDThv3d43qRpB3I0aZw5SgqntUl39q6IP1Iehlv9cpy0c8
	4W1AYOLgaLiZYmG4ddFejc//FqmZ2hrQ1ezai906pfPqxM1rbBtDvnUohwgyu8sJ9rp7qQdQEs8
	1FBYVZriygt6UTJqC9srNsknEI0MchkwODsCluec47XYKmNlPoNwWzF5mtUA8ouN8PotLbvPQAH
	2yE5k4Bw6sB0iu1ckag5MezuE3rqzErpkU0rSCqSHYyvqzzCMaBiPCZKSi0Nz0Iu79gMm64swwR
	eJ49aUsPJiBjFsCTIL2NLdQya1e0fqjFdCY8arAgSMXe/6h7NPT+jD6No8AJXV4gPJZFgqoooSj
	z5mqFIgMgVEjQoR7J0mLY7z68BRLVdj3nTaN3ySPxgnNcSdTukPr4pXd1Fg9ij2Nnf9Wrig5fcK
	vf6RP4AkWFTgzMWbjJ4H3SI61U0TYrutdwtw28=
X-Received: by 2002:a05:600c:8b0d:b0:483:c490:8ed with SMTP id 5b1f17b1804b1-48526982c54mr51288945e9.32.1772827126037;
        Fri, 06 Mar 2026 11:58:46 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:45 -0800 (PST)
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
Subject: [PATCH v2 06/11] arm64: dts: freescale: imx8mm-var-som: Update WiFi/BT with variants
Date: Fri,  6 Mar 2026 20:58:25 +0100
Message-ID: <7c84625f82c562bb9cd2b455465d63a1a25bf19e.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772826534.git.stefano.r@variscite.com>
References: <cover.1772826534.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_115847_998449_CCD77E41 
X-CRM114-Status: GOOD (  18.85  )
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

The VAR-SOM-MX8MM currently integrates the NXP IW61x wireless module,
providing WiFi over SDIO and Bluetooth over UART.

Move the wireless module configuration out of the base
imx8mm-var-som.dtsi and provide dedicated variant includes.
The IW61x configuration is moved to imx8mm-var-som-wifi-bt-iw61x.dtsi
and used by the Symphony evaluation board device tree.

A separate imx8mm-var-som-wifi-brcm-legacy.dtsi include is added to keep
the configuration for the legacy Broadcom SDIO WiFi module used on
earlier SOM revisions.
The Broadcom-based SOM revision is no longer in production, but the
configuration is kept separately to preserve compatibility with existing
boards.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Added Wifi/BT dtsi variants for both iw61x and brcm legacy modules

 .../dts/freescale/imx8mm-var-som-symphony.dts |  1 +
 .../imx8mm-var-som-wifi-brcm-legacy.dtsi      | 12 +++++
 .../imx8mm-var-som-wifi-bt-iw61x.dtsi         | 45 +++++++++++++++++++
 .../boot/dts/freescale/imx8mm-var-som.dtsi    |  6 ---
 4 files changed, 58 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 712892edba8f..51ac8ee34c3b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/leds/common.h>
 #include "imx8mm-var-som.dtsi"
+#include "imx8mm-var-som-wifi-bt-iw61x.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-MX8MM Symphony evaluation board";
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi
new file mode 100644
index 000000000000..f44a846ea6f9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Variscite Ltd.
+ */
+
+/* WIFI */
+&usdhc1 {
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi
new file mode 100644
index 000000000000..15990d141d2a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Variscite Ltd.
+ */
+
+/ {
+	iw61x_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio2 20 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+	};
+};
+
+&uart2 {
+	pinctrl-0 = <&pinctrl_uart2>, <&pinctrl_bt>;
+
+	bluetooth_iw61x: bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+/* WIFI */
+&usdhc1 {
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_wifi>;
+	mmc-pwrseq = <&iw61x_pwrseq>;
+};
+
+&iomuxc {
+	pinctrl_bt: bluetoothgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6	0xc1
+		>;
+	};
+
+	pinctrl_wifi: wifigrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_WP_GPIO2_IO20		0x140
+			MX8MM_IOMUXC_SD1_RESET_B_GPIO2_IO10	0xc1
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 21a4d87c0e26..c37badc4cf27 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -390,7 +390,6 @@ &usbotg2 {
 	status = "okay";
 };
 
-/* WIFI */
 &usdhc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -402,11 +401,6 @@ &usdhc1 {
 	non-removable;
 	keep-power-in-suspend;
 	status = "okay";
-
-	brcmf: wifi@1 {
-		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
-	};
 };
 
 /* SD */
-- 
2.47.3



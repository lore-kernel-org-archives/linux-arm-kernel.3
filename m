Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164CFC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxIkFKzQqrcKn3oguOv50rHYhjrSArtOObsXYJxnkfw=; b=ynjEFDMLHagBrloLDOkVioJp4r
	OBzonKevzGJWjItwXqJZgox8UwwY7Wb53K+riaEFjbIxGBxy+FhiOtbwF0U223UfZY3MXVC3QtyQq
	LMA2Aw/+gudfxxlUQlKN9hU3DtHH/Mg0G8L/sim64afmTY0rI8zzCSGYaIvIWQdAFtFFIsB+Mu+26
	pPnT4n79OBkvXbjAVRsyQmROuqo/g9qUbCK7BdyyNO7snadu/QA4iCeLGnm4WsazSj2iPieI6XEtn
	+QrJ7vC3NgAntj3+RwELTCxPnntIEgRo4hciER3KPutoGfyH2tph9+j5wuDznESivmvAme2N/59pc
	57VWg8ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjS-0000000C3XL-1bdP;
	Mon, 06 Jul 2026 09:35:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjA-0000000C3AC-3IeK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:35:03 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso28972415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330499; x=1783935299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxIkFKzQqrcKn3oguOv50rHYhjrSArtOObsXYJxnkfw=;
        b=YtWzjMZ59CIFSJwkPyWnpWr/o/jCcQPyX/4nrE7XacKMnPuKuagYbohH/uKDAmJCl6
         JivmS0wAJFsKX/Aipqnd2Wbt1EkzoMFN+gAHV3xBqs8mXOC5GozEddRhOzbhVHHEmtEB
         p8ENffKE0SwQNZ9DGGukyQcJmK3D9+GBq4hQRY0/Mxhc75cZ3Ogh46Ys4Q6Xe0BsPHAK
         JeDUpj1ibq1DLx7fbfNMDJNuNfr9GmM8mk9f02DaZcWhTCvZheOq6q5Qi/Cfe5spDBn1
         swdU7d3eUNRZMyvAMne+KmZZNSDbKnvlc8bkt4mwUQUsAI3aGsRCXJqJAIdfF8Ms/+Os
         JYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330499; x=1783935299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kxIkFKzQqrcKn3oguOv50rHYhjrSArtOObsXYJxnkfw=;
        b=o5o5b9WjYbGOppyZgqC4KYd8LMQFFA8zD/hTKUxk9A0E5bhdB3Jr1JKQRcmEdVHXW2
         Xx/Y4RsfpvI0cnZyiLcd6R6QHUhByvxCL4iSiyO9A37h4vTlXjJQvKN2C5oWYeEHm2YY
         fa3KjUMnfGAZ3r6OXJ7apu1DdF2rePBCvSKXI9Nj9hcMjbO3H2vRGugrjqGPByMYj/kM
         cr53LVbY21NgzqpawPUHyYw4gfmjySaIzFWJ+ABM6+LbzYK9IXSN/tNWaMQ+AQpVXCrz
         mHbvGIDQNSKWtTjsIV88xMT/j2RxbkNwlGkHxcyg6hJpG/Dwm4MLnMNRaO63blfRuEQB
         65vQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSp7XMxho/sCo7Gg/JUS4Y0L0vM2JK9s8CSr6tDC12joKLWn79WGzCwcl0DJ+9pSB+uGrtehAzGKcG/9tNC14W@lists.infradead.org
X-Gm-Message-State: AOJu0YwHxdObgIfGlcEqgnpCmeAEKepJEnbwX73N7ZLiPN0Rd5JgJyOr
	eGVs03G8cTGXw9KnEUS/RJN7+tk27E2dUVvfI4tx+SY3qEvb0020zWbCHs72vw==
X-Gm-Gg: AfdE7ckMlUlk9nBchY9sHpTvBhrJ7roG9RzB/ce3DAmDWVEM1Jra7mZdidNnyQG1/bS
	P0aHtN+9onH/nfnn+TS8LpeC6Akms3pzd9uXw1ugPa7O+lf6RuTuiMmQpXmC9wLP2Aj7COYVpFS
	upK6Y7L4X00AiJ9wqTrolEiQzqy0Q6e8iDl51KI+4IFAI6fF2FRz8HHnTlXRj30dGFDxhNgnxqa
	iWo0oG5O/KwKVLZMLJBfiMjDUYWEfcPPUaqU7wUMsHlPKgDB1/Ep2KeBwaO+QN80SIjCVKnpIaw
	G+fhknRFWCBxtKTSfme4q3knULi5bqrRzg/vsJ7k9xUF2NXzmRy3+QFGH42qFD7j/wyoXP8Wx74
	lfwLE2AVodU3+xdbIaFDyZxRPeK7N1ZrL3DahrSE3cAVg8Af4vedi29KnGvMWnR6Bq70+nSluda
	+/7JFkzBgDMXI8dE6dOlol4hUxsN4ZqLmDupWpTmC/vy4aYhR+HBFkveXx90v53iACYXeStViPw
	adifCMw7WRNJHRS4ssO0eQg6w==
X-Received: by 2002:a05:600c:3f0a:b0:492:4a50:41fe with SMTP id 5b1f17b1804b1-493d11f05a3mr108614835e9.22.1783330498855;
        Mon, 06 Jul 2026 02:34:58 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:58 -0700 (PDT)
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
Subject: [PATCH v2 07/15] arm64: dts: freescale: imx8mn-var-som: Rework WiFi/BT and add legacy dts
Date: Mon,  6 Jul 2026 11:34:37 +0200
Message-ID: <ecf72149729d31be30e6f5bcc1cc53a5321a124d.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023502_212511_EA864642 
X-CRM114-Status: GOOD (  20.53  )
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

The VAR-SOM-MX8MN currently integrates the NXP IW61x wireless module,
providing WiFi over SDIO and Bluetooth over UART.

Move the wireless module configuration out of the base
imx8mn-var-som.dtsi and provide dedicated variant includes.
The IW61x configuration is moved to imx8mn-var-som-wifi-bt-iw61x.dtsi
and used by the Symphony evaluation board device tree.

A separate imx8mn-var-som-wifi-brcm-legacy.dtsi include is added to keep
the configuration for the legacy Broadcom SDIO WiFi module used on
earlier SOM revisions.

To preserve compatibility with older SOM revisions, add a separate
imx8mn-var-som-symphony-legacy.dtb, which disables the IW61x setup and
applies the Broadcom-specific configuration.

The Broadcom-based SOM revision is no longer in production, but support
is kept for existing users.

This keeps the VAR-SOM-MX8MN support aligned with the existing
VAR-SOM-MX8MM implementation.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8mn-rve-gateway.dts |  1 +
 .../imx8mn-var-som-symphony-legacy.dts        | 19 ++++++++
 .../dts/freescale/imx8mn-var-som-symphony.dts |  1 +
 .../imx8mn-var-som-wifi-brcm-legacy.dtsi      | 19 ++++++++
 .../imx8mn-var-som-wifi-bt-iw61x.dtsi         | 46 +++++++++++++++++++
 .../boot/dts/freescale/imx8mn-var-som.dtsi    |  8 ----
 7 files changed, 87 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony-legacy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 430085123b4e..bdd3818d6e79 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -206,6 +206,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-solidsense-n8-compact.dtb
 DTC_FLAGS_imx8mn-solidsense-n8-compact += -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mn-var-som-symphony-legacy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-venice-gw7902.dtb
 
 imx8mn-vhip4-evalboard-v1-overlay-ksz8794-dtbs := imx8mn-vhip4-evalboard-v1.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dts b/arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dts
index 056ea2f9e963..d9981d9a7362 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx8mn-var-som.dtsi"
+#include "imx8mn-var-som-wifi-brcm-legacy.dtsi"
 
 / {
 	model = "RVE gateway";
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony-legacy.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony-legacy.dts
new file mode 100644
index 000000000000..5998ebcef474
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony-legacy.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Variscite Ltd.
+ */
+
+#include "imx8mn-var-som-symphony.dts"
+#include "imx8mn-var-som-wifi-brcm-legacy.dtsi"
+
+&bluetooth_iw61x {
+	status = "disabled";
+};
+
+&iw61x_pwrseq {
+	status = "disabled";
+};
+
+&usdhc1 {
+	/delete-property/ mmc-pwrseq;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 520aff23e587..53130b521b5b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx8mn-var-som.dtsi"
+#include "imx8mn-var-som-wifi-bt-iw61x.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-MX8MN Symphony evaluation board";
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi
new file mode 100644
index 000000000000..9ca2038943d4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Variscite Ltd.
+ */
+
+/* WIFI */
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi
new file mode 100644
index 000000000000..9ec341ed57d3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi
@@ -0,0 +1,46 @@
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
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_wifi>;
+	mmc-pwrseq = <&iw61x_pwrseq>;
+};
+
+&iomuxc {
+	pinctrl_bt: bluetoothgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD1_DATA4_GPIO2_IO6	0xc1
+		>;
+	};
+
+	pinctrl_wifi: wifigrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_WP_GPIO2_IO20		0x140
+			MX8MN_IOMUXC_SD1_RESET_B_GPIO2_IO10	0xc1
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index ac22dd3e6542..5d8cd8c13633 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -371,10 +371,7 @@ &usbotg1 {
 	status = "okay";
 };
 
-/* WIFI */
 &usdhc1 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc1>;
 	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
@@ -383,11 +380,6 @@ &usdhc1 {
 	non-removable;
 	keep-power-in-suspend;
 	status = "okay";
-
-	brcmf: wifi@1 {
-		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
-	};
 };
 
 /* eMMC */
-- 
2.47.3



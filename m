Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74A6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 08:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmmAHjNMs7Om6TixgyBkqUS0t0rXWGeYaaijHGTlz0E=; b=e7hfBTnx+3awZvvfiVHFcQYPh8
	1dcLyOBRzbFgcu1vtkULBemkmfyyoCAr4iJEOjm9iFg2rCEoe9AhHPYrBoZdLbQ5AbFf2O1eLfF81
	JLK/C2BjorgMOYQm/DPuqRvdiolcHGX0sJqjIDZggCIawPcaIS5Z/lF/5m6aBSGwTA69QN7Y4t93/
	8YdH/+9o3YR1xEu5EfzZWsRocuz44N9ArWuG9M3nDjpeSqVs4zeheMgtTTYgRK5yR4gOUPS5RwNz4
	Y6sT4k+UugM6xMNBfi51SeeUFs6hNlFFXYDAfJDU8segN+JQd+SM5BTyZ4+Z4LwN4KSfyOSDxEPwY
	Ex1bXhsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXQ-00000006OEs-3FIO;
	Fri, 03 Jul 2026 08:46:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXN-00000006O8W-0L9T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:46:18 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso3144935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 01:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068375; x=1783673175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmmAHjNMs7Om6TixgyBkqUS0t0rXWGeYaaijHGTlz0E=;
        b=UMAQ2is//sOrj+KE/9uBWhpodGXHx24IhGWDXgUsZ9BVTMnhfdQj/1rhQ2uCAl9nVi
         eDMraP3hijxv1YrOIsd6pOIuRDlScAdWrpTV7CGIcaP1x+zX4UHmgCZDhD+E15Anb0ie
         pwPGUmyVApLywUtpiJGhAXVddEksnoLfVC/K4RgkEGnydFOqIZVBe1SM8S2bl+JC1X9J
         TbIz7r0ZAhdemRVTWP0BC8Ji1Kt164xyK013FMzz00K1TLtmZ++QsYUXIPtlF7GbSFdd
         +BFXueCRc3WiPvuymLqnyC8BswUj21Q9M7QDCHQbggIWiRBnGOmcjje/3eA9Qgja5Ix/
         S0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068375; x=1783673175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FmmAHjNMs7Om6TixgyBkqUS0t0rXWGeYaaijHGTlz0E=;
        b=pqz0pihKlUuOgYGFJRi/8K7MVKPMnNeF4Js2TC51zhS9CeficvdjOsXSS6zFD4cxPe
         VNGd26lPSfDReEs1Kkq5UBhAbu7UndApqB2hMmhf6WkRWBWqCsIKqXwjnIRmjy5BvM9Y
         Ic5O2xU9r5tOZxZwn7fnBJ4fUrv7PApa32v0/ErSZA5hxBSDWNjMPSlUrxDaU5lGigDd
         DtK+wlyELRNaaCd06IWSFt7DgjrVCdMXy7CGnpAcwwD1xdOmKPHZaoUBrO+y8HwWcYaD
         SaENbVp+xAETgx67MpjETp5/VkIdp0N4m2WapumF/aLM9e3lOz17C2+tU3tGLBa1aprP
         dYbw==
X-Forwarded-Encrypted: i=1; AFNElJ+p2+HQIcNH/llijAtQnA8nBRoDWyjSJ0Fa5hoyrV71IMra+hVY2kboN0m7tMOcac52EIB3KLeAlyLpO37ryLdg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw92YQLMORRQqebyrFdOQTJ64gOrRRR0msREqeDp1JNlFbKnn9d
	IBBrVdwlVYXHQFJeTGjlyfnqKJC+A85YSk4fgTh+fex3yK2sv18KAIBl
X-Gm-Gg: AfdE7cnSGthuBUKf9kgF3D5SJqZlRlhyU57MuxfGag+G7E/8rwwbzK9EDdutCjQueaX
	xR3h6SvgdpPBVwUyF6rr5kQX3gvIu6LzzUSHU/UworL/LBnnR5ytvkiI8KFkXpOVlyLfW6kkW8F
	dnvuhOKP3U9sXA8ZRi7Az1dRCHZcOgQdLMtpodsCztarOOVPSUoPeIgeN8T9bsSU6SzL7VmV5qs
	lQw+XOSKcxaFSbJ8OhpI70vu7qX3v79XHF2BFRKKKGMerZewfeJR//U5GOGih/vKSsTl9m28tj6
	NC+ua54+GciTFQ2+/rnHu5jw3gKGSwyX9BFcvQIN+Ra+ODiE6NBO9XTRtu6CdaGPqD1HBjlKste
	bIw3BPW/RE9icwun2XuM+zRVYuKUsUQisaix+B54tdnNnIqO1Ae+NRHSUJ/2YgFphaFnBgySgI8
	PO3sgwFq96n78Fhe7sx46HOZF0ThamZXtUffp5PXS1yPy0prUZMUJ1gbQ3NdQKNoB6mt6kYgpg/
	pT1OVCs68LjL7STso3wRmmDdQ==
X-Received: by 2002:a7b:cb55:0:b0:493:aaa2:f034 with SMTP id 5b1f17b1804b1-493c2b7a70bmr103534135e9.26.1783068375278;
        Fri, 03 Jul 2026 01:46:15 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:14 -0700 (PDT)
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
Subject: [PATCH v1 07/15] arm64: dts: freescale: imx8mn-var-som: Rework WiFi/BT and add legacy dts
Date: Fri,  3 Jul 2026 10:45:54 +0200
Message-ID: <541308c48bdc3b6860ce25027ed1a01e38aa2971.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_014617_216082_CAA9C2D0 
X-CRM114-Status: GOOD (  19.96  )
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
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../imx8mn-var-som-symphony-legacy.dts        | 19 ++++++++
 .../dts/freescale/imx8mn-var-som-symphony.dts |  1 +
 .../imx8mn-var-som-wifi-brcm-legacy.dtsi      | 12 +++++
 .../imx8mn-var-som-wifi-bt-iw61x.dtsi         | 45 +++++++++++++++++++
 .../boot/dts/freescale/imx8mn-var-som.dtsi    |  6 ---
 6 files changed, 78 insertions(+), 6 deletions(-)
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
index 000000000000..f44a846ea6f9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi
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
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi
new file mode 100644
index 000000000000..cb4b282a25b0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi
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
index ac22dd3e6542..ff5f658b33de 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -371,7 +371,6 @@ &usbotg1 {
 	status = "okay";
 };
 
-/* WIFI */
 &usdhc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -383,11 +382,6 @@ &usdhc1 {
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



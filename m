Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9821091904
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUP3CmmT0cKyjmjrALm9nCkOSIQbk/SYoJc7MZ/IyOw=; b=PdKKnjt6Akc1B1nQS2EZAASmqj
	MF2Oy/kxS2E7qCgbHEz+UbDjC3kO7qTdlKH8hfOG9b+j8Qkvp1C7/AbIXVxv40fLgFtT27nM5jdDT
	lkFtS4PNiOMVJgHruKEDBE2JcOeIkPNTU764Fg45zJLNVW1ZipvCVNEopQLe/NTdPB5g5TcSuWuKY
	6Mv6A6a2NplGVQK279NFLWB1EjdOV2HD2BkGGQYRuxIW0KY3AQR5gyRTaaU94cCp8xHaElXKd4Kzj
	JoPXSgkcIIlZg5BvRqi/j/VoNyyDNfTl4p9X8CxDGuoCjyiKxKljaeTrVMw+Z6Pt+7j2Gzaa9hqQ/
	Y/NEvJSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJw-0000000BNWy-01gF;
	Thu, 19 Mar 2026 18:42:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJk-0000000BNN8-3jOp
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 18:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OUP3CmmT0cKyjmjrALm9nCkOSIQbk/SYoJc7MZ/IyOw=; b=UZCNQG/eppvzENyL0RGnoi403K
	JHuFEt/oViyRO2w3eSV//zfliZ46Mwkauljh0O55oOh3aov/2kfHXlgYPmnY9fRZ57RSVcvlpWe3z
	+WXyj05XaPmJC6QxzGylnW22ffryMN5cuO0k4S6OMSrjNi5yeN1bONgs0xOTidohyjRORXFJZU9pf
	5fjnq3+b386JnASr+pz+cEP9dYdp77Thp5vy5jh1AmyTtN7vXJcdA5YlSAgoAjxjftJ088SncT5Se
	LnpPO3VANpQf92A8GhPITbLr/upQwZgZGOSjNwQ+qSLjwtwEEYkUoQC0EVy56rbvxPt6hCulbM8Eb
	7lgc3yqA==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJh-0000000EH6W-420i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:41:59 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-486fb112c09so8316645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945716; x=1774550516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUP3CmmT0cKyjmjrALm9nCkOSIQbk/SYoJc7MZ/IyOw=;
        b=f8fCl9FBVuAfQcn+C/ZpzSlLwiM1d2J8YPS0SRwx4I9P/xF/7AZ+CsYi/n/xZn+dty
         EtGVzksQuv5Z8YrxxgitVLtA6G+qcZs8fqh15mV/yAZBVsIdmUD31/rvMjQcXKpnjyXT
         CyN8g9sRUOENQXio1j1GXJ/AaZYFo2Jsubf3xI9CtfU9OIpqLIVrlKc2lM+tk+xD8ToV
         nfGRbxbxnToFTMAUbKNZnRhfapHAtpUwf4rJ0r9eth+BRPNd7AT81lczRGfhNoMcy/CA
         uC5NUe3STDUdNhIdNyM/8vbQ7Tr6Wxw9yfwDrMyrOdDKHHSlQd377bQ1UodRjDusQKZ4
         3yTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945716; x=1774550516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OUP3CmmT0cKyjmjrALm9nCkOSIQbk/SYoJc7MZ/IyOw=;
        b=KRR0LEBSm14KUpPfC7Mu1DadpkZg2ylZdK9gO33FjnHjMdFEveLPqz8Zrhji/3+CAn
         oeXwtdTTkoPERdnhshh1nin+M2TWOYtc9LZVha3uKbJi1bpnVXuIsl9/VdXa7oXK+EAr
         Er7gn6hJvoagcGMDfqFZBZUu1KEzJof9kaEfKOGQ42KvJ+O+8BRLlbc+jhzBMjCRbKUW
         7+qFErRqGtN1sstnplGCvAH0J6Xog2Y741aYcruAcTyHEmhhTpRPqlWzVYcrmVxTwasY
         V5teULJWVcFqF4jejZ4lK9hAPDAiV39rkDPLu73ZTuDwNqG8LGX9StzwTUWYFEjVW3mM
         i5OQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+p3wfXgrkCH/z0nZ83uvEXTdYbaOKOUkZaq43qIFaVq+fnAiYFWkyIEroRETAZv+7NBVdbYsmRT03ue3qa6zm@lists.infradead.org
X-Gm-Message-State: AOJu0YyatGSFCgBKF1mIIp5jxPZjVtj9RR4Msdjmqjy7j3iPh4zfJGQr
	HDL4W5iqDNOCZrv6Pm74tTMeU4p8PE+aDvOx2GxzGac8Sk3ONF+WgMAX
X-Gm-Gg: ATEYQzyr8dEmtHia4x0Mj13j/TLbApHq3JiMhiFUO14wFQfAAEb6O/vieyyd/3o/jBF
	n2xG4yTSSR1N7ZMZJPVK9Ib6clae0XL9j6dV0gxDiFvgBBC0BH2DcAGrtpnGBW/z/YZDUDYSsYy
	mp2AqcrZnM0MwugHoTVi8Rb/fvKnFWgyex5DecvoCafxuZLO9QgTSzGhftHXPko+Y0pLUY2F4Pf
	EBORQ3taR4IBdELIW2izxEDW3jTmCAoec2NMU3xApxN29SF+T+lMSRP8bPkS6nzaAI5wGPveO3e
	uXJVIv0GlGyCMGOhwkGArQAh4+oba6BTX0W8+1HS2jnFgIO8pOfJI/WgEtzgphrpHNkj6uDcugd
	aVlwlmlDDmojL/I92XbFsuFFlWAGr2xvhNKEhRtImzLQ3p2r0pmTbSEg8jz50A8ybcCHzsHl83q
	HSvmPjC7cxt7M2GB+gWmRwCVb2zevz6IaJVYW5MeJd+P0IpKGavuohqu+mTcocaEA8tx6LymzYv
	jZxFC+Lq6s9X5uGPSvCDWbhsoOqe1r86CUgXgI=
X-Received: by 2002:a05:600c:8b0a:b0:485:4136:99a8 with SMTP id 5b1f17b1804b1-486fee0fb9emr2226175e9.22.1773945716215;
        Thu, 19 Mar 2026 11:41:56 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:55 -0700 (PDT)
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
Subject: [PATCH v4 06/11] arm64: dts: freescale: imx8mm-var-som: Rework WiFi/BT and add legacy dts
Date: Thu, 19 Mar 2026 19:40:26 +0100
Message-ID: <9dfc7925f0acf5a655793eada5b1302b99d1407b.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_184158_078943_AB42FAA8 
X-CRM114-Status: GOOD (  19.87  )
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

To preserve compatibility with older SOM revisions, add a separate
imx8mm-var-som-symphony-legacy.dtb, which disables the IW61x setup and
applies the Broadcom-specific configuration.

The Broadcom-based SOM revision is no longer in production, but support
is kept for existing users.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Add symphony legacy dtb to use old brcm wifi module

v2->v3:
 - 

v1->v2:
 - Added Wifi/BT dtsi variants for both iw61x and brcm legacy modules

 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../imx8mm-var-som-symphony-legacy.dts        | 19 ++++++++
 .../dts/freescale/imx8mm-var-som-symphony.dts |  1 +
 .../imx8mm-var-som-wifi-brcm-legacy.dtsi      | 12 +++++
 .../imx8mm-var-som-wifi-bt-iw61x.dtsi         | 45 +++++++++++++++++++
 .../boot/dts/freescale/imx8mm-var-som.dtsi    |  6 ---
 6 files changed, 78 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-legacy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index bae24b53bce6..420b434bcd3a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -161,6 +161,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-iv-306-d.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-mini-111.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-legacy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw71xx-0x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw72xx-0x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw73xx-0x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-legacy.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-legacy.dts
new file mode 100644
index 000000000000..faa707402de9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-legacy.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Variscite Ltd.
+ */
+
+#include "imx8mm-var-som-symphony.dts"
+#include "imx8mm-var-som-wifi-brcm-legacy.dtsi"
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
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 9f4e004f0a37..2b608470da8e 100644
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



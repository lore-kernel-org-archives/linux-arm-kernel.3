Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD79EF5141C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqERNMY4MAVo+Bai5DjLuN+rk8zi9rJwE/isIysK0Iw=; b=RvDtBNnpQdOBOrcGmz4+g4HPHI
	ApQJRB8wnDfR/krntWZfhPtJjgzBy4bTveuPcRtc4fwN3D7YplW7oKsskfJ0VlYVZcDp0xi3hWOVS
	SwEtjn3tIxxJr/jtGDxbHZ6bhausVlb7vdG3r94ymxC44em5bsirlhiwUvdgI9iDf7qLu7v4nV5XX
	8WmSNrc8bo4fz2/g8s0tNCrzL3yvczUWrluOhHCoAaYByuNgF7WT1/PUMDz2TMlumskAYsN89JSW+
	x8D0K3eccUG+bfTmLrkMHi7Io+JKHuhrLpISNJ+t8zF2Sk6Hkw1v/5Bye2VJ29oej+m3IWjsUVEOJ
	GiaVceBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytzz-00000005K6M-2rwT;
	Sat, 07 Mar 2026 15:55:27 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytzr-00000005JzZ-3rRv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 15:55:21 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48374014a77so122881085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 07:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898918; x=1773503718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqERNMY4MAVo+Bai5DjLuN+rk8zi9rJwE/isIysK0Iw=;
        b=Pxv1FqFyDidr0mFkWzjm0L8ZCwF5OMYjTodieMVKCF5/fxuGR3q89JBz20W3KfOApu
         pLVsjUs3VZOOwvPuyCYeIeAU9zJK9aVJQMHRzMLSwc/P3NzBMjxnXOdguItfs7ubjDDi
         k9NL/BTr7lXmPJVrBHLDi7yYjjqvz4eoG5tYg/qXIRXm5ZSLvMx165W1DPwStL+rUfP8
         nJ7wxCtTHXdh3XOdCKA7LlwiEdjclXm0X62xutgstcgZxnIRcDq99GSHGC9Go2ApZQ0Q
         EZ/qiiTLEangI8LwMhGzQWZxK5WPOcv3mjEIEdGObnK03P3QmBug7dtUQiSq6iHdJ3DE
         34tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898918; x=1773503718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kqERNMY4MAVo+Bai5DjLuN+rk8zi9rJwE/isIysK0Iw=;
        b=oaj2E07bnDxuMiyTxO2adlw0n5bBXqivUqhnBFlNw18hg0VZ0rI3wswWKX5Ka7UNrM
         q+k7Njj1aMdjTG59PiB6lItctZjqSVxBh7GvvHcdQD1zYRoDWBrE6Y4qlnRaZ7mlst9m
         1RF3xjatUvfSJrEVpSmZ828VgXJbzVErYmnQ1RmgVXYEZkqTz4eoBzLgkvhDjpgVDZhL
         CqoKjH6pmDusgDIFXsUKDjDmV4q7hulsNZSu+6fVn3xY2jgDFSAcmxpm69Iyh7LKPpeP
         yzz2cEdzhrs0pNxpkEU+xTBnvDzP+cm90+4UBymw1yXoGWono/rDOc5CY/J5jWevQDy/
         vUYA==
X-Forwarded-Encrypted: i=1; AJvYcCVPsebgSd/tXS+0cR+NRsm53CAu04Fm9i3733Dtm66KSb+1RO9clc3+WO6C0eBPBnIALfmS+DgC6ekKCtIQ7nxf@lists.infradead.org
X-Gm-Message-State: AOJu0YxgCraqDyD5zw57II2tjLQfETBHwWERgIBTBRJ3iMdchFQ1z3Iy
	2HTmN5x6lIVC2KXOj2GKoWm5RTtG25AneL4Ci8JO80UV8DrHiMd0Z98X
X-Gm-Gg: ATEYQzwWuGfHCtWB9eewc3YonawlONvF+UsKZScR/PfQgWsxM3mqYM/olLY5wzrRCy+
	F5E8dXFWTf911XP0qH6ssqkMpb6Ap0PHN8Vr++wECcFA0TCCUx4CqsECX40pgBxcmNOqHT1E1Kc
	bkwNuirj/jV6Inh6vFh7F6pYIKejxiFoFpnTqiOuZXhFPQ/M3dGX8Bf4Gr8L0Hwu0v6EMr2+u5Z
	hucrKv/48VjjzF7+3K3VDWOyJHfwEQJdzqB22kt1YTrwbGW+YCICIWQEwkVBXifKcSvfKWz6+XP
	giZEJ1ANC2CXIVW7Bl0j/Qfl4yjJgWwus9fpwgXA61BTFT6GcELlzkau+t8FcIuem7nj0Tker82
	X7vgNsflW0rYUX8Dqjou6JM4Ao1N2hKzlhXJlMSBw+MeLzIzralr7nLfqbG0wSiyhXLabUx2HqU
	T8BKausudAFQqN3wF5xZfJpFtbfbkK3I5ZLIoNp3tiWPVgMKqGerf2IUbu7gj1Vd/cOdyywh1/2
	i5ueR1IVDpy5LRpYIZWu2zsZA==
X-Received: by 2002:a05:600c:5303:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-4852695aa55mr100781825e9.22.1772898917935;
        Sat, 07 Mar 2026 07:55:17 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:17 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
Subject: [PATCH v3 06/11] arm64: dts: freescale: imx8mm-var-som: Update WiFi/BT with variants
Date: Sat,  7 Mar 2026 16:54:42 +0100
Message-ID: <7c84625f82c562bb9cd2b455465d63a1a25bf19e.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772898346.git.stefano.radaelli21@gmail.com>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_075520_003016_68CD4054 
X-CRM114-Status: GOOD (  18.86  )
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
v2->v3:
 - 

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



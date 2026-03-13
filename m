Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CA4105F783
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 08:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSAf/a2Rb2/FOYvdPVGSqhiOt13IM1Gi9djyH0j/h5E=; b=KDixsXkCNhoBmx66/1wiMGgWpR
	EbH91Bku2Zwfot10uM3xoF2RNvZ11lI+nWr8xXcV0/Va458NCLtNpRzHsYFg7p4Omi97M/I3IaAz6
	n7m07o6SxbuBDt2i2uUfZLNFuXwD4kH6OkR+LixWauNEiom0wzTTavzYytKFcLYqiFxpnsw9II1UI
	f4vuzSHR7civzeCQILq+6Zkme/1G9q9J4ozU/MDn4CUAxfwYsN/FoVLuCi9rbQwoSztlWeQa7GxOI
	f5Ig7mKi4tC4LoE1Rto1kDvyBZhwv9NICwOr8ClcTud9NFA48ql1RDdHGOdd1KbAGaxaU83Q5bKS5
	yFFF7rYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yLX-0000000HKIh-3ReH;
	Fri, 13 Mar 2026 08:58:15 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yLS-0000000HKEb-3ODz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 08:58:12 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso1489664f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773392289; x=1773997089; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSAf/a2Rb2/FOYvdPVGSqhiOt13IM1Gi9djyH0j/h5E=;
        b=XlpDNapq4o1pD/nvUgTJ8kHWuBXKOqx+SPTZZQrheOFtGvpwI9ukqe4qt2FxbuoT2e
         MnUkfS5m6pF50UWMGB7jdok+Q6uPrfOly5Ecm5iDHWNG5vAp9XOptc0EB5+qghy8Tl9b
         BebvRvypcM9Y4WE3FftReR9t3lb3/3F+dJFdgXRka1ZQadl9jalr0k8ZGbZYytST1y06
         kJJfGpKxK5Vw5S40xIzdqV5gRliqaOZnmrf48SyuzQfLcogzFpWz6GIdDrRrpdaUwH/3
         RON4xRV/628SYAPSMqxSGABV44k9H6W2RKm8y+odevn0e6AAIE4e0ASN2FvJbXQwc9Nv
         MYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392289; x=1773997089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sSAf/a2Rb2/FOYvdPVGSqhiOt13IM1Gi9djyH0j/h5E=;
        b=ZLopSxWeXijZr3bGQhfSdOV6LffY6ieTRz0/QuRDyLZuTb+IpAY1NdWCNd8yMcEvdQ
         a9VaHFiq5eT41OtQJh0kt6LcV6z0EUE++/UE0gdkKlgtKE+hWQPuGgxgGZ1vlgM1wq4Z
         80VJRV7SYSLmdahzc0RBAAzJ9eNH4qjjzZt98WrPNd2ssAVsJFXCgGgx6pKgjkoP0kYW
         E+PtTwv8C8hxxtODbqvUPXtPcLQtmx7SBu2oGbJ8e7807iGT6HttBU7ckxnw7Ih9w8/c
         m6zjlky9TwrSCqFcb4r/0fIIKqdemwerhIjqLI31H5H63a13OoCd1qfHm/coMZt6lz0c
         OsqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkdMzgAs20SdZs0HBS2s4KkiL9EcW2nP375Tuamg4O38W55mGdEQ6VLmBdHamGRrCkIqQsAYaDtMbx/D4GBdyK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8g6ml7T/a10+0KQkOX0V4VALiI8EzpdNz7puGBcadIG/hHwFq
	BHcyhsXoDZUTKRxH+2pdw1WoO4GYJVX8MnW1VrLOd/xWdjXSn6uGB4Ll
X-Gm-Gg: ATEYQzzrxzAJeVZwpm15Bey7idxPcoxNiEc1MpElavuOOF3yD8q9ZnJq9UsBmfwk+6U
	AHsAcLtDEIfPYHeLLdJw47tKDcrGO4NWcakgqR1T5XOYgrQdH3RiqYxormp5tfc1vHsBLyJVp8a
	LnvA2/2116c6HHv1RNXIeiQ1LvQt12Med7T4leGl9R0KgsM4F0aneJdsPwCHs9tDQ6PLnXjlhKk
	x660e2y90QUyvUPI1ugcgag8tDjCUxOSUEcZRbnGmRpYmiIaEbrutMWWPTOrjAbsacWsF81kzrl
	7Tmer/nYfi2LJzmOAduSi62U3G+3Ie4m2l9j4ss5oZPQwG62ohxyYUQn7sXmhGdeobOaTY2hfpN
	JPGP1yNU68JgypJvjXh2klNl+49RibVuUhixCQkgkK4mTkt4bGJ7XaXX/6f5RvGLPgCzmYmUpfl
	p/LHymcHcAmg2O1wIUR13c0OsxZhP9NJuaEEIUE4/drzxa0J6KpMx9RpgD/b0Tr2tSKxyM2sJ7U
	v28O6az2pUlZpDwj2dY2tT+l2g=
X-Received: by 2002:a05:6000:248a:b0:439:ae3f:9405 with SMTP id ffacd0b85a97d-43a04dda734mr4789391f8f.59.1773392288730;
        Fri, 13 Mar 2026 01:58:08 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a03cfd18fsm7663718f8f.36.2026.03.13.01.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 01:58:08 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 13 Mar 2026 09:57:47 +0100
Subject: [PATCH v2 6/6] arm64: dts: freescale: imx95-verdin: Add Yavia
 carrier board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-verdin-imx95-upstream-frank-li-base-v2-6-bd488be7c699@toradex.com>
References: <20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com>
In-Reply-To: <20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_015810_907395_A6DE90A7 
X-CRM114-Status: GOOD (  13.57  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add support for the Verdin i.MX95 SoM mated with the Yavia carrier
board.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/yavia
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v2: no changes
v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-6-823fad02def9@toradex.com/
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx95-verdin-nonwifi-yavia.dts   |  21 ++
 .../boot/dts/freescale/imx95-verdin-wifi-yavia.dts |  21 ++
 .../boot/dts/freescale/imx95-verdin-yavia.dtsi     | 217 +++++++++++++++++++++
 4 files changed, 261 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index e3c34f8f40cd..48e5711526d6 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -456,10 +456,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 
 imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dts
new file mode 100644
index 000000000000..4f7b4e3a518b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/yavia
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-nonwifi.dtsi"
+#include "imx95-verdin-yavia.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 on Yavia Board";
+	compatible = "toradex,verdin-imx95-nonwifi-yavia",
+		     "toradex,verdin-imx95-nonwifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dts
new file mode 100644
index 000000000000..43d35b770db2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/yavia
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-wifi.dtsi"
+#include "imx95-verdin-yavia.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 WB on Yavia Board";
+	compatible = "toradex,verdin-imx95-wifi-yavia",
+		     "toradex,verdin-imx95-wifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-yavia.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin-yavia.dtsi
new file mode 100644
index 000000000000..6403ae584e70
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-yavia.dtsi
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common dtsi for Verdin iMX95 SoM on Yavia carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/yavia
+ */
+
+#include <dt-bindings/leds/common.h>
+
+/ {
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_qspi1_clk_gpio>,
+			    <&pinctrl_qspi1_cs_gpio>,
+			    <&pinctrl_qspi1_io0_gpio>,
+			    <&pinctrl_qspi1_io1_gpio>,
+			    <&pinctrl_qspi1_io2_gpio>,
+			    <&pinctrl_qspi1_io3_gpio>;
+
+		/* SODIMM 52 - LD1_RED */
+		led-0 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+			gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
+		};
+		/* SODIMM 54 - LD1_GREEN */
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+			gpios = <&gpio5 10 GPIO_ACTIVE_HIGH>;
+		};
+		/* SODIMM 56 - LD1_BLUE */
+		led-2 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+			gpios = <&gpio5 0 GPIO_ACTIVE_HIGH>;
+		};
+		/* SODIMM 58 - LD2_RED */
+		led-3 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+			gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		};
+		/* SODIMM 60 - LD2_GREEN */
+		led-4 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+			gpios = <&gpio5 2 GPIO_ACTIVE_HIGH>;
+		};
+		/* SODIMM 62 - LD2_BLUE */
+		led-5 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+			gpios = <&gpio5 3 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+/* Verdin ADC_1, ADC_2, ADC_3 and ADC_4 */
+&adc1 {
+	status = "okay";
+};
+
+/* Verdin ETH_1 (On-module PHY) */
+&enetc_port0 {
+	status = "okay";
+};
+
+/* Verdin CAN_1 */
+&flexcan1 {
+	status = "okay";
+};
+
+/* Verdin CAN_2 */
+&flexcan2 {
+	status = "okay";
+};
+
+&gpio1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ctrl_sleep_moci>;
+};
+
+&gpio2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio1>,
+		    <&pinctrl_gpio2>,
+		    <&pinctrl_gpio3>;
+};
+
+&gpio3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio6>;
+};
+
+&gpio4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio5>;
+};
+
+&gpio5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio4>,
+		    <&pinctrl_qspi1_cs2_gpio>,
+		    <&pinctrl_qspi1_dqs_gpio>;
+};
+
+/* Verdin I2C_3_HDMI */
+&i3c2 {
+	status = "okay";
+};
+
+/* Verdin I2C_2_DSI */
+&lpi2c3 {
+	status = "okay";
+};
+
+/* Verdin I2C_1 */
+&lpi2c4 {
+	status = "okay";
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp75c";
+		reg = <0x4f>;
+	};
+
+	carrier_eeprom: eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* Verdin I2C_4_CSI */
+&lpi2c5 {
+	status = "okay";
+};
+
+/* Verdin UART_3, used as the Linux console */
+&lpuart1 {
+	status = "okay";
+};
+
+/* Verdin UART_4 */
+&lpuart2 {
+	status = "okay";
+};
+
+/* Verdin UART_1 */
+&lpuart7 {
+	status = "okay";
+};
+
+/* Verdin UART_2 */
+&lpuart8 {
+	status = "okay";
+};
+
+/* Verdin PCIE_1 */
+&pcie0 {
+	status = "okay";
+};
+
+/* Verdin PWM_1 */
+&tpm4 {
+	status = "okay";
+};
+
+/* Verdin PWM_2 */
+&tpm5 {
+	status = "okay";
+};
+
+/* Verdin PWM_3_DSI */
+&tpm6 {
+	status = "okay";
+};
+
+/* Verdin USB_1 */
+&usb2 {
+	status = "okay";
+};
+
+/* Verdin USB_2 */
+&usb3 {
+	fsl,permanently-attached;
+
+	status = "okay";
+};
+
+&usb3_phy {
+	status = "okay";
+};
+
+/* Verdin SD_1 */
+&usdhc2 {
+	status = "okay";
+};
+
+/* Verdin CTRL_WAKE1_MICO# */
+&verdin_gpio_keys {
+	status = "okay";
+};

-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D30109C02B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrlBOke3UCcCRXGtCiCjDm/vPc8qLCfIRNlITCApmXs=; b=rr2gveCtltwOh2n/B9WCxjRTCa
	N6YTUPq9JyRT1i9I5yYEgNovPW5YcsMYxYSIyzMqkWMjKEzg4DcmlQElZqwClECNomAZnvJDAvbN6
	wZoSSw86+4wqKsEDB7QSxSG2x+QvS38IFbe7z2FAfSmnjEcWXZwuk19nI2HKwOW0BejTEJouMTc61
	4OF04x3SDQQhu2AwN92FZt33s9ryzJHJIa8sm0I8Cn129mAuwjb8eVBMLl0WqatcOkxJSLADEz7+Y
	eYw2z1I+qUYksA7Gc6Me+dcWxeIoL3udnyvhWq4faI6HHb1ksyCYxzQvpBwxDoMQxKZzoWqOzt8p6
	r9obrpTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PVS-00000003eWq-0LCA;
	Wed, 25 Mar 2026 14:46:50 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PVH-00000003ePH-1Xn5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:46:41 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-439c6fc2910so1863461f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 07:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774449997; x=1775054797; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IrlBOke3UCcCRXGtCiCjDm/vPc8qLCfIRNlITCApmXs=;
        b=MVrXQRVhn4MMkkW8+kabc7ybPM3aE3r9HJTuKfQsuOKZDixeMKXe0AFRZ1pKPbvud4
         Js5vf9hBMwXr+mBZHg3FbBDt2FGQuJ8oUjDkZX8X6bDEntI++JH5lT5JNgLCti+fmsc5
         ldXfeKDBpykqbDtIdVDYH4o53wH3GBYH3tdmkD4KavIixVr/L8U+foshXADjPYL4g3SO
         N0KnjxncTRTXzRvF1iCnpK1qvCDU2BVGdWJGgZZpVtGsSTQ9WUEUXoa7+SkL7A1jGL76
         aCUIlqqwYIVoh2Vc/iRmr+u5LVfGfAC8u9RSe5kBgMeugzD2VMtLXWk1YJPjWpour4D5
         77gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449997; x=1775054797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IrlBOke3UCcCRXGtCiCjDm/vPc8qLCfIRNlITCApmXs=;
        b=tS7IOLxo/A1WSuRjYNvpIaTwuF3bjWq2jwXl9/Zhl0tfNFbKyUSpkizJHTdetJqrEB
         4nUwXncnzFl6vUswnHo0x5q0jbSbXut7mBl/LIIrx+M6hn38M7vnvjBuST9AHdRIjjGh
         flbhRqVuTV/Yt5TF7yHdN4pMg9cLTzZbSgAF0JVsEPphJ5YytlK13dmBy/9xT7u1/lUb
         RxjSfHhwrl3avaL/n2MlJgJceMTXgKdlQ0gwY716C+EJo4mrQZQx6bZdZYrtdylppotH
         FVyqE4Lx8PcFOYoggXipOF6gXcr9ko0+TDTrlAczsAHuYDWmzWzVC9qeZTsyENDal88M
         IDHA==
X-Forwarded-Encrypted: i=1; AJvYcCUqYRE2nlILbXktjTwchFD6JX8NyCdcSIkSuQSzQhZiZxNPKNZPOsYPlCdaPY5jOJuI063WpMvqvHMTsqI7398P@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu68qmPKjdyERdE8aPUImI76ui2cAJ8F3i8kNPw6FxRMv6ts1Q
	LxDExntSLec0Fjeg8IIOd4Ik3dZO+8WlqqhBYytIfeF8bOKYi9Nxfc75
X-Gm-Gg: ATEYQzxYoN3KPbTNFO7CdZs4MSjrJqHxIifvOfz0Wi1VCK3vphzucfMU54N/YSX0LDX
	yz1F8cemjIaoIWOUHSx9t76JuvLJArkdH1Br7KrrwzI0WT6guqW6JcN8/+v2KHqauhSWEIeYu73
	jbLQzuRaW+SwSS34VFB7FWKsjEz2BXamDqAC7jfe+aak4fPVTtE+uXRGgfUaBVAtl34cwD1pORe
	ik9SvFiHBxenXWj6DrezUG5hN+Q1Qpjgn1tEycDLI3Edqsg4Zx7d2DWUhlBAhwHngwQZ/PVy9xQ
	HY6w2JBJnq+qpJ9JWoPSntjgokfetGfGf6cGv4Yb0jUz0RPi82Gxby45jpKssezx9hhQWW9+J/S
	GVzYXV3TNv0JG9ZF40UBumAk+arwW8mElTdgB2br+GNCHWP1TPVrSG6sGpLsPhEv49wWCCVPhUo
	PbtDxT9sx1D9+zmyE9JUCc+ny8W+9Duu219kGUL5wK80xiE7xrIIrF8QGEFrqnbWcZFyY/Cb9y3
	uLrhQTzSmTMIeUNYIUb7o7ifzw=
X-Received: by 2002:a05:6000:288c:b0:43b:3be3:9a16 with SMTP id ffacd0b85a97d-43b88a29212mr6080023f8f.38.1774449997217;
        Wed, 25 Mar 2026 07:46:37 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e305sm304592f8f.8.2026.03.25.07.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:46:36 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Wed, 25 Mar 2026 15:46:07 +0100
Subject: [PATCH v3 6/6] arm64: dts: freescale: imx95-verdin: Add Yavia
 carrier board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-verdin-imx95-upstream-frank-li-base-v3-6-b2b5221a8077@toradex.com>
References: <20260325-verdin-imx95-upstream-frank-li-base-v3-0-b2b5221a8077@toradex.com>
In-Reply-To: <20260325-verdin-imx95-upstream-frank-li-base-v3-0-b2b5221a8077@toradex.com>
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
X-CRM114-CacheID: sfid-20260325_074639_537370_4C43834D 
X-CRM114-Status: GOOD (  14.02  )
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
v3: no changes
v2: no changes
v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-6-823fad02def9@toradex.com/
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx95-verdin-nonwifi-yavia.dts   |  21 ++
 .../boot/dts/freescale/imx95-verdin-wifi-yavia.dts |  21 ++
 .../boot/dts/freescale/imx95-verdin-yavia.dtsi     | 217 +++++++++++++++++++++
 4 files changed, 261 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 10417fc895de..5bee7c83a724 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -501,10 +501,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
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



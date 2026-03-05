Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F727F3D33E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 17:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+gIWIMeZ1+FqNtpP8c8MmWwIEyqkbZzeQ4vhQsXykc=; b=HDLU+Rc7ATY6rAHNY5OTNUzZ2u
	9UKOFq1tANtARijgMkuce9Y5NVU36jVY+V5qvr0AaPaL5fVhIiHFtZpLCzSEHD400DqgBMUFiDTrk
	YgReGqxYNqwTtiNYhcu2ZT8HU8fiagpnJSJCKOlZvCgZuZX171dx4qHDV3M9rh9PrY1SpVV6G+O75
	Ea1rZyDpn3u5tJlzw5ojKnWxrvj9bjvHoVoTjir7rPvnP8DxyHyIeuih3v4VCIjgAbYwKdqJESdvx
	zDKtAKy8+RmaZoH7euLnzry54hxO5L42e/MuQzAy91CEeBL0k+ZCKiUtqPJa3sd0v94L5jUHxcNK1
	MNW8UogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCRf-00000002I9e-1NTg;
	Thu, 05 Mar 2026 17:25:07 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCRb-00000002I50-1Vy8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 17:25:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48379a42f76so71477555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772731501; x=1773336301; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+gIWIMeZ1+FqNtpP8c8MmWwIEyqkbZzeQ4vhQsXykc=;
        b=deiQQoWoNd8sgrjLL/n+CUpYW266zUp1AeIl0kfGvSocpQG92DAf0iXmyqXI0dgNOJ
         3JJ5eUq4m8ITeWebdwP2WLx9WS74JfQWM33VG7g5a/lVMAPn+5NpHt9oB27J5BxTQwS+
         rRluNKMIDH22qM4JBME0LcTcq0saGulXBecYI18SpuYGZp+RWJdrfUq0rbyN7+A+X/Dc
         LUPQat1Qg+s5L0TOdymx+AvkU1UMRm3HmrNHk4dPBN6P+rJ/SKDRqC/KSOKYJ+DdpkJa
         KZ9Mwe3kOpVZGLnBOzhcEhEufrixSooLXqT9JkgIUceWuCFMHBFLf3iOBWWkYL2FGjGE
         9+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731501; x=1773336301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M+gIWIMeZ1+FqNtpP8c8MmWwIEyqkbZzeQ4vhQsXykc=;
        b=Lbop7fGjS+ovyTRqrNUX7bKKK/2u3Z+WaO9yqkXcll0FsvzyqZDiWOH33ZTChMrzRS
         GEy87PEp+0VRQtUgVFVIcwILKysonLBrnhk7IDvtpqf/Ume1aj1Wk+6r+McQlywXCGr/
         ufIPFXomcb4mLy8GFmDlBEqjqTjPlliTPhE4WSK5b/tUHj4Wtbg6GMDxlIirsJd+qtWd
         MzsD+azLvHx/XevSlMFcDtkZpR1twCKXfEl5aelUED1wvkbIzK6zgEo8nUsSerxyC9SU
         UB+60oLqWIbErzsEjkGRSqfcEMoW3scqF22PRdOl57RHiOMFvTCAy+v+qklNUvmYQyQO
         2oZA==
X-Forwarded-Encrypted: i=1; AJvYcCUdyQAbd7buUWBkjQOhgrf6CxobB3npBtU/rPBYJLIGkSCmp2cxUHsaGXKLVp7H6RYYyc4hN8+E5zzBagvxtYtL@lists.infradead.org
X-Gm-Message-State: AOJu0YzQdrbbKIfZnO0dkb6ikozsNXK5pe9xSl83O9lllQcgj/xsSGDp
	8q12fubXDdRVsr/5kdt6GSBfrBH5YCSf2XwPaYdEhwym1n/NSd4c9Ez3
X-Gm-Gg: ATEYQzyRJTwTOjimw2Aws+VjMALsCM8MQqQHpQnymTxJGvSOGQKCiZhv1S30MZk+nF6
	JCPFzWvcNcZYeEfBgDOF2PZnQvEFRkeCBPGDkaejX2G5yCQ/8Jj/vyMTrYSVhQlzhg6W6mQu9Te
	knp/psehg4yvWRnq7Xkz+NAZx21ycM5FkpzmaXtPql3lj1bqVX4tu0Fq4mZI+ZXvevlJsnSFzrF
	ZEtLKaZnmhoxhsXPlR5+4MjU7I7FvvJNy5FT1W1Bk6cbqKyQzOkEeL41ZIohQK20EV/z4a8F7hS
	J6gDeHkYq37k0f9mU8DUI0O4LipdfoBMEk/OrPLrFEN928xdPIbvvNwYftaj36o4rHOHVf1NBH4
	zIWz0fAep+fp9qBukjxP+tw+JvIchYA63b0EGBf0SJc01Kt4dywvoRVHjm4hoMoNkpkTBxNnf6O
	3R9Iv51XCJ7cJsPS3o3knzYBHP9IgV7gG7p1wMVUPY3Xmuzofk30kUXlrJ+mWCEJQlHUciYjh3C
	aTz5NTRpC0ZOnksiSv1/EC+yKY=
X-Received: by 2002:a05:600c:3ba2:b0:47a:814c:ee95 with SMTP id 5b1f17b1804b1-4851984bc7dmr116197755e9.12.1772731501153;
        Thu, 05 Mar 2026 09:25:01 -0800 (PST)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fafe4c9sm67153495e9.15.2026.03.05.09.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 09:25:00 -0800 (PST)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 05 Mar 2026 18:24:33 +0100
Subject: [PATCH 5/6] arm64: dts: freescale: imx95-verdin: Add Mallow
 carrier board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-verdin-imx95-upstream-frank-li-base-v1-5-823fad02def9@toradex.com>
References: <20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com>
In-Reply-To: <20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com>
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
X-CRM114-CacheID: sfid-20260305_092503_450179_CF4CDB1B 
X-CRM114-Status: GOOD (  13.46  )
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

Add support for the Verdin i.MX95 SoM mated with the Mallow carrier
board.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../boot/dts/freescale/imx95-verdin-mallow.dtsi    | 223 +++++++++++++++++++++
 .../dts/freescale/imx95-verdin-nonwifi-mallow.dts  |  21 ++
 .../dts/freescale/imx95-verdin-wifi-mallow.dts     |  21 ++
 4 files changed, 267 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 34af11b1ef6b..e3c34f8f40cd 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -455,9 +455,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-ivy.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 
 imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin-mallow.dtsi
new file mode 100644
index 000000000000..53506b7550f5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-mallow.dtsi
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common dtsi for Verdin iMX95 SoM on Mallow carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/mallow-carrier-board
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
+			    <&pinctrl_qspi1_io1_gpio>;
+
+		/* SODIMM 52 - USER_LED_1_RED */
+		led-0 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+			gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* SODIMM 54 - USER_LED_1_GREEN */
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+			gpios = <&gpio5 10 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* SODIMM 56 - USER_LED_2_RED */
+		led-2 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+			gpios = <&gpio5 0 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* SODIMM 58 - USER_LED_2_GREEN */
+		led-3 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+			gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
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
+	pinctrl-0 = <&pinctrl_gpio4>;
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
+		compatible = "ti,tmp1075";
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
+/* Verdin SPI_1 */
+&lpspi6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi6>,
+		    <&pinctrl_spi1_cs>,
+		    <&pinctrl_qspi1_cs2_gpio>;
+	cs-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>,
+		   <&som_gpio_expander 13 GPIO_ACTIVE_LOW>,
+		   <&gpio5 11 GPIO_ACTIVE_LOW>;
+
+	tpm@2 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_qspi1_dqs_gpio>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+		spi-max-frequency = <18500000>;
+	};
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
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dts
new file mode 100644
index 000000000000..5a9c0e4a79c9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/mallow-carrier-board
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-nonwifi.dtsi"
+#include "imx95-verdin-mallow.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 on Mallow Board";
+	compatible = "toradex,verdin-imx95-nonwifi-mallow",
+		     "toradex,verdin-imx95-nonwifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dts
new file mode 100644
index 000000000000..eaa67a39be1c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/mallow-carrier-board
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-wifi.dtsi"
+#include "imx95-verdin-mallow.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 WB on Mallow Board";
+	compatible = "toradex,verdin-imx95-wifi-mallow",
+		     "toradex,verdin-imx95-wifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};

-- 
2.43.0



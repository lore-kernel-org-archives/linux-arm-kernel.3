Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940A6F3D33E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 17:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmMrfremCneDw6tfYwX6DSZjUbNIQEkYQLqM5+X9+98=; b=y1X7azrrpS/9iNDua+F2vZl8Ak
	1ff7wdEhumcgiayTZ+fuFXfGCyzTxTLnHgrF4WHuUYo41g2Kl9jSLqqfXQej52DAq1ZXF5KqhnELB
	hj+3l7vftJzAhl3F7FZfcpegtmxGuoKHbeX/rzrVQEiitCoTgfm62j6XlfQXA3XaIq6lL2azQpjeS
	M+ZA58uNIw4to7GwmsYmHw+nij052sNU+CSkH5Ujhr+ug4mhNA9pGkSqFB0pobSLfspdtRfvCt3Jv
	0sfplwBk5XgYYv/q3d4HEudCuN3WUjmUy6TvJ/LQ2c9baWDkJGlVidhI/bz3G9tjmgm76PFCZi2Sk
	tmhArS/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCRc-00000002I6r-0SIE;
	Thu, 05 Mar 2026 17:25:04 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCRY-00000002I3N-3Fek
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 17:25:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso90344285e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772731499; x=1773336299; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DmMrfremCneDw6tfYwX6DSZjUbNIQEkYQLqM5+X9+98=;
        b=Qh7SkKthZlxrThz858tmR3UKYm1hGwHmGZbXHsyS/+K6xQz76j0gOkT4q0ifDuK6/b
         sdhewJ69FS0FnZiVuXdEsPBWkWEK7q2sj6PdOJolS420BnR+h9eS/mJP6hCWz3kLLibQ
         O0N03l61SCSh6vpTDZhnrBB9qTajSWMrVhuzSVhHGPnx32xPMJ2sTzNtq9JhYqSEXMqW
         mYDjeTyQ3AM/VIDm9yT2HK37Ix7yMGkjxrhRFpoKyXfyya/2/wx+pZWQwMAbc/Ic/JqI
         HAQpUaHIHeTf8ZyhdNMw3r9e/ftO5ciC8ETqipLwcvZp690/yIMpk4R1NNUO6lD6f+Xb
         qT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731499; x=1773336299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DmMrfremCneDw6tfYwX6DSZjUbNIQEkYQLqM5+X9+98=;
        b=sGVE08Ng+F0++qkAf4yQoXiWv83S0/b49HyPgzycifUuigaK9EARnpNc1yKcxcvW+6
         zsvogj9PtDZJhqRt3aQrmMl8f8OKp23oWEDZOhf3As6DELyMOY3KcFJOm9xZXC/kSzb+
         usW3qowK66dlPeZZNk/+VHwz7GX07rqCjGi9Yo5bRh5YoI3J5d5CKZvg6RTd4Mrio9nb
         MQrNKQ9LdqMEBUEJEkjVZdm5sKF6gzAr5mcVMazlSpt+FuLVZy3STfx4PinhFlAvFYAq
         uECdqS2v/DKFE5TcpxPMKMaOccxDf7RQc8HdsBaekZV3HI+FE+wiyKI9eRFfhSSzw5wm
         qVsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt0UJq2rdU/TpYUdRdPHc6EZjEC6X28LncTg+3DRBpiCztp4gzHgJ1f97dIdrJSG/m3ShSFe78gCdu2gXl7sz3@lists.infradead.org
X-Gm-Message-State: AOJu0YxTKXc46omhhgJy4ToNHgBordOJ6w5K1ql3KvHzXcqhvoS1Q6N/
	wzh6/l2wzZTLFa4KHw/K2clLs6D5yHgSS85WqqAE2+8tiTo1MeEJsAgZ
X-Gm-Gg: ATEYQzxg1pMhQ/FpT6gkdJT6JQHMksQxNIKufMS5LYBZ2Iu/AXdKv8BSLaJZieO+qgG
	oqmM/lTXNp6mBhQZsXRf1MhK87BlW4LW2a4j9/lkxFqeZNDKtvjli8pSNdVxGc1s7xOmfyuah6a
	BKBTCgdCQj/jDr+jFRvSEZ8kC5hdsFMsUIRMxojz2Hc7nRp5hhvOahA7THUtqSi7IQUJk02cXRs
	/rWwKT8Dk9ZNUZrM4025Gb37D4fJ8TlpFTnEOEb4i76R4j/IPpbOLuCIH1SUjgWL9g95bgUgIrw
	o3C4AXSG8KXgjyNH0M3y5s4z51gYlaFEsFK3XIXV1Lj9z8ysSpqFFtR6TZ71vz4lrGao2CeR6KK
	BPVE55CHeSLor3AhA5fxtHJI+CAnFM3aA+vetcXTmviMD/rZqsJDImIzokv1z3cANy2DPQdKGNw
	lKu9QUyh+ZYWNo38qyYW+74pPpsvRQ5XHGPEBi1zXeqKCgq2Iq9jTYlmkpiU3zexDaXrgZT8I8Q
	24QFWsuMPA3E+cUdqeIs0JRk2M=
X-Received: by 2002:a05:600c:3b29:b0:483:afbb:a077 with SMTP id 5b1f17b1804b1-4851983a5c5mr113990515e9.1.1772731498597;
        Thu, 05 Mar 2026 09:24:58 -0800 (PST)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fafe4c9sm67153495e9.15.2026.03.05.09.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 09:24:58 -0800 (PST)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 05 Mar 2026 18:24:31 +0100
Subject: [PATCH 3/6] arm64: dts: freescale: imx95-verdin: Add Dahlia
 carrier board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-verdin-imx95-upstream-frank-li-base-v1-3-823fad02def9@toradex.com>
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
X-CRM114-CacheID: sfid-20260305_092500_880572_A6F552FE 
X-CRM114-Status: GOOD (  13.42  )
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

Add support for the Verdin i.MX95 mated with the Verdin Dahlia carrier
board.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/de/products/carrier-board/dahlia-carrier-board-kit
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../boot/dts/freescale/imx95-verdin-dahlia.dtsi    | 270 +++++++++++++++++++++
 .../dts/freescale/imx95-verdin-nonwifi-dahlia.dts  |  21 ++
 .../dts/freescale/imx95-verdin-wifi-dahlia.dts     |  21 ++
 4 files changed, 314 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 12cbb60cb0cd..952268856cac 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -452,7 +452,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 
 imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin-dahlia.dtsi
new file mode 100644
index 000000000000..fa77f6af5c58
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-dahlia.dtsi
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common dtsi for Verdin iMX95 SoM on Dahlia carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
+ */
+
+/ {
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	reg_1v8_sw: regulator-1v8-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "On-carrier +V1.8_SW";
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "verdin-wm8904";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"Microphone Jack", "MICBIAS",
+			"IN1L", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904_1a>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai3>;
+		};
+	};
+
+	reg_usb_hub: regulator-usb-hub {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "HUB_PWR_EN";
+	};
+
+	reg_pcie: regulator-pcie {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "PCIE_1_PWR_EN";
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
+/* Verdin QSPI_1 */
+&flexspi1 {
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
+	wm8904_1a: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sai3_mclk>;
+		clocks = <&scmi_clk IMX95_CLK_SAI3>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_1v8_sw>;
+		CPVDD-supply = <&reg_1v8_sw>;
+		DBVDD-supply = <&reg_1v8_sw>;
+		DCVDD-supply = <&reg_1v8_sw>;
+		MICVDD-supply = <&reg_1v8_sw>;
+	};
+
+	/* Current measurement into module VCC */
+	hwmon@40 {
+		compatible = "ti,ina219";
+		reg = <0x40>;
+		shunt-resistor = <10000>;
+	};
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
+	vpcie-supply = <&reg_pcie>;
+
+	status = "okay";
+};
+
+/* We support turning off sleep moci on Dahlia */
+&reg_force_sleep_moci {
+	status = "disabled";
+};
+
+/* Verdin I2S_1 */
+&sai3 {
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
+&usb3_dwc3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	usb_hub_3_0: usb-hub@1 {
+		compatible = "usb424,5744";
+		reg = <1>;
+		peer-hub = <&usb_hub_2_0>;
+		vdd-supply = <&reg_usb_hub>;
+	};
+
+	usb_hub_2_0: usb-hub@2 {
+		compatible = "usb424,2744";
+		reg = <2>;
+		peer-hub = <&usb_hub_3_0>;
+		vdd-supply = <&reg_usb_hub>;
+	};
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
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dts
new file mode 100644
index 000000000000..16975ae12fcb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-nonwifi.dtsi"
+#include "imx95-verdin-dahlia.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 on Dahlia Board";
+	compatible = "toradex,verdin-imx95-nonwifi-dahlia",
+		     "toradex,verdin-imx95-nonwifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dts
new file mode 100644
index 000000000000..bafbe1179ec8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-wifi.dtsi"
+#include "imx95-verdin-dahlia.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 WB on Dahlia Board";
+	compatible = "toradex,verdin-imx95-wifi-dahlia",
+		     "toradex,verdin-imx95-wifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};

-- 
2.43.0



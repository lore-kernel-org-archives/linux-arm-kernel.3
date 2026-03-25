Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB45109C029
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K56QdSgJZYNMBcYP6tlC/3xyKloobCMQ/93giVqKRL4=; b=IztalSO0HaxqJ4Wa6BfZDhhjLZ
	kdSxLpIDMw3wvrib3GY/20NqCZgKR+eNjWpOYGs4jlq+Zlpetgovjr8czbtmTuoDdTifY/UudLRpg
	rPTk6CV2bReTfP56Wf5NDWoqywNlzT82SWTLvMLHHv3L407n40FC6OT90A/EF9k6gLlRFH23MjQMT
	oShJ5M2MGdwXVaKpQwGg0cxE4LGqZrqVBscZSOw/pXZSlQAwCqLQy8/8N1sYOr0/6445lrPepxGQc
	RzWKgeEBb4/Ze1yVyy/pJScg9SJMvbgQYHhLaBwLEer9OmVzo6KjGmtxTlcM3wXU9KqDYsBrfh+HF
	ShU5bpIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PVQ-00000003eUx-3HRl;
	Wed, 25 Mar 2026 14:46:48 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PVE-00000003eOD-1C2f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:46:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-439c6fc2910so1863417f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 07:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774449994; x=1775054794; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K56QdSgJZYNMBcYP6tlC/3xyKloobCMQ/93giVqKRL4=;
        b=eylMN+6gjNoVBVGzhe0wjYQ1E6Ai6FFZWfJLw2QZ7b+sctDp+bO44K+2GBd+ZbzbE+
         Hq6SFddJ3MINizPZpl4lqCWWDIRKquvgZ2Nu9zyox9e8h4k1a0ucYZ4DP5eD9VnoRt7i
         qhnEUb/X5uZr0kfobIjTD1yPuiGW7IykRWTgrV+yshvR9jDROFtWTULgUAhg7juSPaDW
         8q2LzNZV8VMALNA/L8XeTkrsFVPj/kz5uGWpYLjmSYbIcgz9vh918re3m+oTvOKH1eAz
         RkfNU3ZclG094cxCgklTMGxnsJlTXuvoIX3+V+VYk5cjxxIoZqzlVjJ+B72BJbjbQKkF
         pnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449994; x=1775054794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K56QdSgJZYNMBcYP6tlC/3xyKloobCMQ/93giVqKRL4=;
        b=etQ45KUVx/Fn/wK1N6SACA4WIUS7Z4j2tItoTo1BONiMDr4Z9Q9iD+vZq9lobGIYTx
         EhEmVC3k6zCkDo59aItlckRIiw8f2fRvKMfCzaGvh8MDxr/FS1+mrwl5OcK9+i+GTmPA
         gk4ZmGcoTSXVsneK+PhLqUWuQj1SelSfgoURGGbvHMPJO/JA4/tcwz1kuYgCE11H4eJ/
         d3V61h+ty+ZefCAmY6kzNWbOrPV6h3uEGjNrDA9oGxkQC9nIXDoE44q3y7EpeyjQO95D
         AkFhdVSI0hl7qhOE+hklFNsP2+FlO3xs21z2itCDpCdE4bgK6DSlhkgEoQGIjl2e96SZ
         uSNA==
X-Forwarded-Encrypted: i=1; AJvYcCXdbXB/UFYzXPWj1n5dXYfgv+GVi+QbLOuU0krWONxmuFTpvFtHA0IWSFmBliT0k29tt7E2hSxlOt/m2doPqyDL@lists.infradead.org
X-Gm-Message-State: AOJu0YymTKK2SXIHRmjZv0/x5aVvf6BzbIGlGMQcQthV3obOksaUTC43
	rqRRQGPbSKj8Pl+2+jk996IiBNdzEBn9oeGRgoRFT0hxHrRKhtpPM07x
X-Gm-Gg: ATEYQzzNAX2sdGnTZGRrX2eM9ttHZ7HS1/xMxWMcZaLpv+1K/35b9SjifGHIsECAvjI
	fxGDi7kRzjfT8V8TfUzBMdtLYRg/CLTLHtK9Hz3lMqAc5gLQTCqHig0wBEl+1K018RzMY6ZUwUX
	CHmCygx93EtReScQIbXuHtBGlgA3tFx+R+Rs+Qvqdhn+AQ4YxoWOS0rqp8La7ovpE6xNAjcTctW
	EvlMYhSIkcc1VQYnN3eGaP6MSJSOAUPqBuCL92V8NCIvZxVe3cui6NeKR9SZnars4Pqr59eocwL
	DvMms97yDWv9Ein9LIFL8lCM8ml2c1nCowMTfGLqTMqQzdp7qaHMceEh7B71qmPyqwTiOFeNOC+
	YGOxn+vnVzvGCz8AmIXiH2b+MCmZPdZHuLWSMQnpqoERDzuMvW/g/dx29NADCodmWGQp6xGxSCJ
	R2TR++1yoHvtTQ1gdFFQ7IiBUQBSau0jb91yOkEQSEwXQW4bmvpzRj6z6R4N5c+Wp9c1QqBXNH7
	cMXEQtcCZLXk3GssFNqCJd44SFUHrySqJyBPA==
X-Received: by 2002:a5d:5270:0:b0:43b:88e9:588 with SMTP id ffacd0b85a97d-43b88e9083amr4001503f8f.37.1774449994187;
        Wed, 25 Mar 2026 07:46:34 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e305sm304592f8f.8.2026.03.25.07.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:46:33 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Wed, 25 Mar 2026 15:46:04 +0100
Subject: [PATCH v3 3/6] arm64: dts: freescale: imx95-verdin: Add Dahlia
 carrier board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-verdin-imx95-upstream-frank-li-base-v3-3-b2b5221a8077@toradex.com>
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
X-CRM114-CacheID: sfid-20260325_074636_381919_7F0665D9 
X-CRM114-Status: GOOD (  13.59  )
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
Link: https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v3: Rebased
v2: Reordered nodes alphanumerically by node name
v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-3-823fad02def9@toradex.com/
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../boot/dts/freescale/imx95-verdin-dahlia.dtsi    | 270 +++++++++++++++++++++
 .../dts/freescale/imx95-verdin-nonwifi-dahlia.dts  |  21 ++
 .../dts/freescale/imx95-verdin-wifi-dahlia.dts     |  21 ++
 4 files changed, 314 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c46059cd2331..bcf54b4ed66c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -497,7 +497,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 
 imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin-dahlia.dtsi
new file mode 100644
index 000000000000..889b71aa3de0
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
+	reg_pcie: regulator-pcie {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "PCIE_1_PWR_EN";
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



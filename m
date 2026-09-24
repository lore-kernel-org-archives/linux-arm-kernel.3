Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA38C98316
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGvAh5haqou+rzon7GQ4Mwf4/kcx5u76WBVG/aWMlJA=; b=NRdLvZXWgkbpnhkhSy9KnvH2ae
	wRy649dSwS9jcVQ0I0ZmE1Njtbhkik3ZyUPVCEagqC+6qWdP0tVjGLxDXLvbNH2ixozraNKc0ACBb
	EbkzcFkJAnvTLnrXi9tqM+7w2SstmWLv9RqFnpGY6UsgnXPELCt02GjhIPpUwTh8L8goQUEoHq8PT
	7mq873moHaXoEYh9E9OxVy7PYjicjimZa/G5AxCetc1BW5LdN5mC2uq2ryIs8ixT8Ffrbfl7Rzkzn
	W2q5w6LaM6cEuGD/mdvqSFkaci3T1gWGQmLxT1ggj0/SyhzybMmk7TDCLL4SEGxN/wFQ3LmkUYg64
	Js5nYL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dPK-0000000ADEh-24vx;
	Thu, 24 Sep 2026 06:58:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dPD-0000000ADA2-2AAl
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 06:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yGvAh5haqou+rzon7GQ4Mwf4/kcx5u76WBVG/aWMlJA=; b=cNHIy7+pGwlC5yYXfH5YAivscK
	FOAjKX4q+lbfqZ7uOluwkDCDbEqfdT9qF55e0ERaEq3grs1Zwfo9qpSED563Toh51qcz1L/9VZQGR
	AfdKz1XpN+UhekrrDbRWnOep6GS+psY0LJESUmiaj1ybqQ6cjjEYpI9i5jxa2dm+P0VT34bK6VKWA
	RKfrWiAkhJy9JumWR+zW+HXkOr/Mxs/VJpl55apF64aoEykHx8stOmC1OJtWRsubwacuLY9Bf0EuR
	TlEG8idj0360jiiakBIY2Ctl7IoaiMqxf0PBEVwQbJ+Pwu4HHUKQW5tpnb0YSY7A12xk6fKq8Xldo
	32NKuOog==;
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9dOy-0000000FckV-1bxq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:57:56 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id EA99720223;
	Thu, 24 Sep 2026 08:57:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790233069;
	bh=yGvAh5haqou+rzon7GQ4Mwf4/kcx5u76WBVG/aWMlJA=; h=From:To:Subject;
	b=UheAD/UlThLIALv6VeEneBPTjFztc5swkZs9s0Qi3tamM6lIBlVEDVT08GPMaiWHx
	 NME3p2bx0GTHRgbuEvq/WUWkUkEnSDBD9a08sgYryScF84SsJMDRHqf6Pi7bMo/qkN
	 QVof5tyAifMbuZEuNpbgxkxvvk4ckWgwM7OFRJoF+lUE8rm0RAN7MiInXYUhvExdBU
	 pei+b9O8jAmMjAVgzrwOVruXb/Juiu2d5pusME4S36H1WdQkGsiy0HzDka0fMB3COi
	 kwjt7resFeIITQhViURTgRaAKcLW1Ay+tBEYfPvxi/75fKqtva3niLyV5iESc9FCsB
	 dmr8Mj2zBDQ0g==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/7] arm64: dts: freescale: imx93-lino: Add dahlia
Date: Thu, 24 Sep 2026 08:57:30 +0200
Message-ID: <20260924065735.17678-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924065735.17678-1-francesco@dolcini.it>
References: <20260924065735.17678-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_075753_155243_42273497 
X-CRM114-Status: GOOD (  13.22  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add support for Lino iMX93 mated with the Verdin adapter and Dahlia
carrier board.

Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
Link: https://www.toradex.com/accessories/lino-verdin-adapter
Link: https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v3: rebased
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 ...imx93-imx91-lino-verdin-dahlia-common.dtsi | 198 ++++++++++++++++++
 .../freescale/imx93-lino-verdin-dahlia.dts    |  24 +++
 3 files changed, 223 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dahlia-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 221c56d7845a..83688ee447e4 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -895,6 +895,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
 imx93-14x14-evk-mqs-dtbs += imx93-14x14-evk.dtb imx9-mqs.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk-mqs.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dahlia-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dahlia-common.dtsi
new file mode 100644
index 000000000000..5f6136204e30
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dahlia-common.dtsi
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Lino iMX93/iMX91 SoM on Lino-Verdin Adapter / Dahlia carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx91
+ * https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
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
+};
+
+/* Lino ADC_1, ADC_2, ADC_3 and ADC_4 */
+&adc1 {
+	status = "okay";
+};
+
+&gpio2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio1>, <&pinctrl_gpio2>, <&pinctrl_gpio3>,
+		    <&pinctrl_gpio4>, <&pinctrl_gpio5>;
+};
+
+&gpio3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio6>, <&pinctrl_gpio7>;
+};
+
+&gpio4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio8>, <&pinctrl_gpio9>, <&pinctrl_gpio10>;
+};
+
+/* Lino ETH_1 */
+&eqos {
+	status = "okay";
+};
+
+/* Lino CAN_1 */
+&flexcan1 {
+	status = "okay";
+};
+
+/* Lino CAN_2 */
+&flexcan2 {
+	status = "okay";
+};
+
+/* Lino I2C_2 */
+&lpi2c3 {
+	status = "okay";
+};
+
+/* Lino I2C_3 */
+&lpi2c4 {
+	status = "okay";
+};
+
+/* Lino SPI_1 */
+&lpspi8 {
+	status = "okay";
+};
+
+/* Lino UART_3, used as the Linux Console */
+&lpuart1 {
+	status = "okay";
+};
+
+/* Lino UART_4 */
+&lpuart2 {
+	status = "okay";
+};
+
+/* Lino UART_2 */
+&lpuart7 {
+	status = "okay";
+};
+
+/* Lino I2S_1 */
+&sai3 {
+	status = "okay";
+};
+
+/* Lino PWM_1 */
+&tpm4 {
+	status = "okay";
+};
+
+/* Lino PWM_2 */
+&tpm5 {
+	status = "okay";
+};
+
+/* Lino PWM_3 */
+&tpm6 {
+	status = "okay";
+};
+
+/* Lino USB_1 */
+&usbotg1 {
+	status = "okay";
+};
+
+/* Lino USB_2 */
+&usbotg2 {
+	status = "okay";
+};
+
+/* Lino SD_1 */
+&usdhc2 {
+	status = "okay";
+};
+
+/* Verdin CTRL_WAKE1_MICO# */
+&verdin_gpio_keys {
+	status = "okay";
+};
+
+/* Verdin I2C_1 */
+&verdin_i2c_1 {
+	status = "okay";
+
+	wm8904_1a: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		clock-names = "mclk";
+		clocks = <&verdin_i2s1_mclk>;
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
+/* Verdin PCIE_1_RESET# */
+&verdin_pcie_1_reset_hog {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dts b/arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dts
new file mode 100644
index 000000000000..c708a2e18c90
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Lino iMX93 SoM on Lino-Verdin Adapter / Dahlia carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
+ * https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
+ */
+
+/dts-v1/;
+
+#include "imx93.dtsi"
+#include "imx93-lino.dtsi"
+#include "imx93-imx91-lino-verdin-common.dtsi"
+#include "imx93-imx91-lino-verdin-dahlia-common.dtsi"
+
+/ {
+	model = "Toradex Lino iMX93 on Verdin Adapter plus Dahlia Board";
+	compatible = "toradex,lino-imx93-verdin-dahlia",
+		     "toradex,lino-imx93-verdin",
+		     "toradex,lino-imx93",
+		     "fsl,imx93";
+};
-- 
2.47.3



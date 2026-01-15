Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2B1D46603
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 17:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UbXNxa+iA/ps3lkeOKk9nvJHBlfYpEGoGtY/DDNTVqI=; b=QOYIhTy+1MOTg3Q+eUx25612g2
	rhqMM5fVtn3I62o52cfbxuACArXVoa8/Gmak3EH3mE05vGIDWPxMkJ5Pua4+215blRbOKXkEdnOH5
	4IB/4EMNO0gIdYlikFc3FGA7hP7Q0nuzAhE+GOVp4hoGTVSCGborL608W9Okt4mjwfq8gP/FXyD51
	CcD2VShxCa0pDbA2QXVvuyFRIDoVYnpJhbRzmDFaGEOsSTfsEpqk3myCutIC8sLRgzlV0gLWg5uWC
	Q1Y8p5ElkckI8D4lyEAnOyIa94n9mmt182t83GEoeTb2vOuOKCvmdiric0hijDNCmu1rAJ/XGL1Fg
	5wzF3GpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQt5-0000000CpRy-1shI;
	Thu, 15 Jan 2026 17:11:59 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQt2-0000000CpRd-36jR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 17:11:58 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-hpq3.prod.antispam.mailspamprotection.com; s=arckey; t=1768497116;
	 b=yR1xKP1uKJw7abZGCHDOOQXgwZ8XX4ViVG18uXTGRnv2ynE2l0oF1NhiujxMn7L5HqZNPKMG/x
	  hxcdw+4jP0VWp7Gmnfb7cTurWNNyMrocS5dqeZFk66oM2eavek6617l9hSgcevh9Lr9sJhHogA
	  04uikiNHGUaybP2fM18SgZZpCvnbwVRfv5OGO7AkKHv2Bjt8wYV1QHYdFItUp87okLJx0s8Od2
	  TnDKvTeCj2jt8z8IHOi/Vad3I3m3CZHzsDAwE0VeTe9r83b0Y6IDVupFk9gUvTSfE2yDk6g593
	  kM+GxnDxf5DoN5aX9Y3zMhFYSE6lSsfemQBAyQfeJAhslg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-hpq3.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-hpq3.prod.antispam.mailspamprotection.com; s=arckey; t=1768497116;
	bh=UDNJN6h9z20eAdQX41sTSOjvbFWI2ZO13KG6s3qqNlY=;
	h=Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
	  Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=M2acjpo1/7W9BTt5S5PnbpfVUuzx4t0GGXmoxzdchnN1yN2vDhGvUeWX9s63Ie9XJC27UyW2Xp
	  AkUh0vJzS0pv4APF1KusPhKsRmt3MNxTu8dUBIrkkmRPFaVyBa3aQX3efmNZR0tvHfnHpuERpE
	  I5Xn+mPKIUsaMsdHPrfN8RrAZxJVlghi+yQRXa6j+MlRGttB0msGPyIn90BzbSBnCE7mJTi3ug
	  8vTYFwFv2yGl2f4cxYR0iKBQSzzPN25XHr9H5i/L7MxDPRowoMBHpXDmVK7mXSYESMYX30QkLN
	  bPks1CdM2JCDWji9SATm6DchLzArA5pN32EueKg3GW+Eyw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=UbXNxa+iA/ps3lkeOKk9nvJHBlfYpEGoGtY/DDNTVqI=; b=B0dTfd47jjmfnoHWN8In78V09H
	oue5Mj6eklFg978qLFpmhMTDRxKr6URo+k+QWEmvrRHmorDbMLtwwDXHrFDpv5+1ukCcJfd6T7xOg
	zDIPk8tC0esd2f+zg0U5emfW7Fj+N52YGRRVONCzpK4xg+nT1wzLJdOUxFMckYrxlTXU=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-hpq3.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vgQsx-00000001egp-0xCf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 17:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=UbXNxa+iA/ps3lkeOKk9nvJHBlfYpEGoGtY/DDNTVqI=; b=b1iS/RdZ4Id4/cGi/TGuWgR2X+
	97h8limaBqXWT/Yn+7W7KxiHUi+5iGe6acwH7ZP3ipqvkrYuR/Jn/zkPtEhLbu7J2wK/XgOLZCl6Z
	51gx3tb/JNot7u88E0JVrJEiTzBPsSbps07rPofIwC32avnFupWhh+UeMD2mGAZFphEs=;
Received: from [95.248.141.113] (port=64273 helo=[192.168.178.65])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1vgQsq-00000000Ee3-1WSg;
	Thu, 15 Jan 2026 17:11:44 +0000
From: Francesco Valla <francesco@valla.it>
Date: Thu, 15 Jan 2026 18:11:34 +0100
Subject: [PATCH] arm64: dts: imx93-11x11-frdm: enable additional devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-imx93_devices-v1-1-b2c840cafa2e@valla.it>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7TnA1JPtKRFRutYcsFEIQ/550H
 JiZDJECU4ShyRDo5ci3r4BtA9u5+IMEu8qgpDISsRN8JatnV9WNolhsT4imM3rVUJsn0M7p/41
 TKR9vEzEUXwAAAA==
X-Change-ID: 20260114-imx93_devices-a98e116463b3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7269; i=francesco@valla.it;
 h=from:subject:message-id; bh=UDNJN6h9z20eAdQX41sTSOjvbFWI2ZO13KG6s3qqNlY=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJmZ8ucD/y+NXH3wWu6HaqPQea/v/QjJeJeh9Yhfdmllp
 Vgiy/KzHaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBEDL0Z/nAdKtjk4b6AZbLU
 jNOxRRHT8/qnHpSs9Te4n716grXgNimGv6IdbaXt1z2//1p5VzVrxy3R1x6Ne05fkQkXi238mPV
 OkB8A
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: d8e839fc64ce3c078e9c14cd7fb32fd4
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vgQsx-00000001egp-0xCf-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-hpq3.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_091157_094231_D98F55AB 
X-CRM114-Status: GOOD (  10.04  )
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

Enable additional devices on the i.MX93 FRDM board:

  - CAN port and associated transceiver
  - Bluetooth portion of the IW612 chipset
  - WiFi SDIO port
  - user buttons

The WiFi portion of the on-board IW612 chipset is still not supported
upstream, but since SDIO is a discoverable bus it will be probed once it
is.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
Applies on top of [0].

WiFi was tested using the nxpwifi driver proposed in [1].

[0] https://lore.kernel.org/all/20260113075002.561453-1-daniel.baluta@nxp.com/
[1] https://lore.kernel.org/all/20251205065545.3325032-1-jeff.chen_1@nxp.com/

Reagrds,
Francesco
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 152 +++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index 5bb6ae0d154a655283295b6902fc29bf6f744d5c..bd14ba28690c081817111aaabef12fb56a7c56a4 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -9,6 +9,7 @@ / {
 	model = "NXP i.MX93 11X11 FRDM board";
 
 	aliases {
+		can0 = &flexcan2;
 		ethernet0 = &fec;
 		ethernet1 = &eqos;
 		i2c0 = &lpi2c1;
@@ -18,12 +19,40 @@ aliases {
 		mmc1 = &usdhc2; /* uSD */
 		rtc0 = &pcf2131;
 		serial0 = &lpuart1;
+		serial4 = &lpuart5;
 	};
 
 	chosen {
 		stdout-path = &lpuart1;
 	};
 
+	flexcan2_phy: can-phy {
+		compatible = "nxp,tja1051";
+		#phy-cells = <0>;
+		max-bitrate = <5000000>;
+		silent-gpios = <&pcal6524 23 GPIO_ACTIVE_HIGH>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-k2 {
+			label = "Button K2";
+			linux,code = <BTN_1>;
+			gpios = <&pcal6524 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+			interrupt-parent = <&pcal6524>;
+			interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+		};
+
+		button-k3 {
+			label = "Button K3";
+			linux,code = <BTN_2>;
+			gpios = <&pcal6524 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+			interrupt-parent = <&pcal6524>;
+			interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+		};
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -37,6 +66,16 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		enable-active-high;
 	};
 
+	reg_usdhc3_vmmc: regulator-usdhc3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VPCIe_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <20000>;
+		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reserved-memory {
 		ranges;
 		#address-cells = <2>;
@@ -88,6 +127,11 @@ sound-mqs {
 		audio-cpu = <&sai1>;
 		audio-codec = <&mqs1>;
 	};
+
+	usdhc3_pwrseq: mmc-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &adc1 {
@@ -157,11 +201,27 @@ ethphy2: ethernet-phy@2 {
 	};
 };
 
+&flexcan2 {
+	phys = <&flexcan2_phy>;
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	pinctrl-1 = <&pinctrl_flexcan2_sleep>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+};
+
 &lpi2c1 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&pinctrl_lpi2c1>;
 	pinctrl-names = "default";
 	status = "okay";
+
+	pcal6408: gpio@20 {
+		compatible = "nxp,pcal6408";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		reset-gpios = <&pcal6524 20 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &lpi2c2 {
@@ -322,6 +382,21 @@ &lpuart1 { /* console */
 	status = "okay";
 };
 
+&lpuart5 {
+	pinctrl-0 = <&pinctrl_uart5>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+		device-wakeup-gpios = <&pcal6408 3 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pcal6524 19 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&reg_usdhc3_vmmc>;
+	};
+};
+
 &mqs1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_mqs1>;
@@ -394,6 +469,20 @@ &usdhc2 {
 	status = "okay";
 };
 
+&usdhc3 {
+	bus-width = <4>;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	vmmc-supply = <&reg_usdhc3_vmmc>;
+	status = "okay";
+};
+
 &wdog3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog>;
@@ -486,6 +575,13 @@ MX93_PAD_GPIO_IO27__CAN2_RX			0x139e
 		>;
 	};
 
+	pinctrl_flexcan2_sleep: flexcan2sleepgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO25__GPIO2_IO25			0x31e
+			MX93_PAD_GPIO_IO27__GPIO2_IO27			0x31e
+		>;
+	};
+
 	pinctrl_lpi2c1: lpi2c1grp {
 		fsl,pins = <
 			MX93_PAD_I2C1_SCL__LPI2C1_SCL			0x40000b9e
@@ -533,6 +629,15 @@ MX93_PAD_UART1_TXD__LPUART1_TX			0x31e
 		>;
 	};
 
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX		0x31e
+			MX93_PAD_DAP_TDI__LPUART5_RX			0x31e
+			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B		0x31e
+			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B		0x31e
+		>;
+	};
+
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
@@ -647,6 +752,53 @@ MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
 		>;
 	};
 
+		/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
+			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
+			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
+			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
+			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
+			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
+		>;
+	};
+
 	pinctrl_wdog: wdoggrp {
 		fsl,pins = <
 			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e

---
base-commit: 8ce368ca61310f425012fea4549d2b6ad0c5c54c
change-id: 20260114-imx93_devices-a98e116463b3

Best regards,
-- 
Francesco Valla <francesco@valla.it>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4DAC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 11:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndA5tE1Ke7DiZcyoW8ITRVTl+fv8+uLlzHEH+GwX2XE=; b=huKBabXbNsdVKIRXKlYQP/ck3d
	Sz9BZtWvjv0DkhBmh6DiDXh/u2h5aCAcAPSXMPUrK46/zGcyBoT1XzKrKz8KfeCpGk+djGW5I0usz
	OTOb/tzA96f8kEI7PlZfaNtitNSfYLEGF16itEREb6yVvQ5YIDtzSZfiusFww65FaXrF+tBM3JdB1
	wZcCja00G1aCL7KATmGQGx+o0NldwGWoQapxT/vyY5AAggsRfoO27Yvnm4ls6hKeg2JOxnRHSN8K2
	MIAXXWNi8UyXEWft8WWtVebLjog6vP/PnRVyg7SbMXC2WhrQJ9CFYY8lgKJz+hUyESWOsJzg7COWu
	zxwiCZRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CBg-000000071Ms-3IoQ;
	Tue, 22 Apr 2025 11:53:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BJN-00000006qmc-07mH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 10:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ndA5tE1Ke7DiZcyoW8ITRVTl+fv8+uLlzHEH+GwX2XE=; b=QrgeFEj2nFi5MnMWwHOGupFbSC
	4awvu3UHgRW3drDVT2FY4t+SUkLZ+ldMMBB9eqBqSx/Gp//izarfxVzw8PHJ2r2BEBpOlVJngmbrn
	8W1OBjzlH+fcwKsBRPxnS8xmSIi+nyN3k/qxpTj7flb5Cy1eyuJZz3cfTHh6LNn079t0F9x8xdxM3
	B3f3084R1JFgRpa1eCUOjNylCAuLjDcXRcPI/CQ8SDRkGTV63SwTRPjYFVpg3R+e7IaD1/X6c9pJg
	Byyt9ZyP6hcpicHji/dtqWU9JKebX4ld/VQglww+uNomDYZyNFaaqFgLzvHXhFMwAKl22yN1oni9P
	Lx8O9JCQ==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7BJI-0000000BBNs-3uv9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 10:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ndA5tE1Ke7DiZcyoW8ITRVTl+fv8+uLlzHEH+GwX2XE=; b=i4PGnYv3FAB29va/76rrrxOHWn
	u2lBw1u6rvoRu7bfM/AcdDEA7ZhzFudswKVpz7kCf9X+UpxrMjbSLXPl8Nqhgw23OD6xzYw08+M4Y
	BCF0OXMSxsikGQVUXwnkzakYfzx2sNJpNbp/F6X4RUky96h37sT2TCXwCd4EKP6aurcjPOSbrSbEe
	Pvw65NcyiK+KhyLt15JmyxToP7mIczBL5oE5IBijLTt/R0ruyiVSN0UmUAYK4+evQw+c9WruujF+f
	P9fk3CfecxfNtLHYcC79hn+pwtF9p2HJcmtuYUp9XY1ll9tC6VTkalFMBDcHntF6pFjA6ybcsQSR5
	UomfiuqA==;
Received: from [89.212.21.243] (port=36562 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u7BJI-008kyr-0i;
	Tue, 22 Apr 2025 12:57:04 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v4 13/15] arm64: dts: freescale: imx93-phyboard-segin: Add I2S audio
Date: Tue, 22 Apr 2025 12:56:42 +0200
Message-Id: <20250422105644.2725168-14-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422105644.2725168-1-primoz.fiser@norik.com>
References: <20250422105644.2725168-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_115705_261430_BF9985EE 
X-CRM114-Status: UNSURE (   7.60  )
X-CRM114-Notice: Please train this message.
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

Add support for I2S audio found on phyBOARD-Segin-i.MX93. Audio codec
TLV320AIC3007 is connected to SAI1 interface as a DAI master. MCLK is
provided from the SAI's internal audio PLL (19.2 MHz).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes in v4:
- no changes

 .../dts/freescale/imx93-phyboard-segin.dts    | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index e4f959f665b2..54e084e69706 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -35,6 +35,20 @@ flexcan1_tc: can-phy0 {
 		enable-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
 	};
 
+	reg_sound_1v8: regulator-sound-1v8 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "VCC1V8_AUDIO";
+	};
+
+	reg_sound_3v3: regulator-sound-3v3 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VCC3V3_ANALOG";
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -45,6 +59,34 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "VCC_SD";
 	};
+
+	sound: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "phyBOARD-Segin-TLV320AIC3007";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&dailink_master>;
+		simple-audio-card,frame-master = <&dailink_master>;
+		simple-audio-card,widgets =
+			"Line", "Line In",
+			"Line", "Line Out",
+			"Speaker", "Speaker";
+		simple-audio-card,routing =
+			"Line Out", "LLOUT",
+			"Line Out", "RLOUT",
+			"Speaker", "SPOP",
+			"Speaker", "SPOM",
+			"LINE1L", "Line In",
+			"LINE1R", "Line In";
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+		};
+
+		dailink_master: simple-audio-card,codec {
+			sound-dai = <&audio_codec>;
+			clocks = <&clk IMX93_CLK_SAI1>;
+		};
+	};
 };
 
 /* CAN */
@@ -62,6 +104,17 @@ &lpi2c2 {
 	pinctrl-0 = <&pinctrl_lpi2c2>;
 	status = "okay";
 
+	/* Codec */
+	audio_codec: audio-codec@18 {
+		compatible = "ti,tlv320aic3007";
+		reg = <0x18>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_sound_3v3>;
+		IOVDD-supply = <&reg_sound_3v3>;
+		DRVDD-supply = <&reg_sound_3v3>;
+		DVDD-supply = <&reg_sound_1v8>;
+	};
+
 	/* RTC */
 	i2c_rtc: rtc@68 {
 		compatible = "microcrystal,rv4162";
@@ -80,6 +133,17 @@ &lpuart1 {
 	status = "okay";
 };
 
+/* Audio */
+&sai1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai1>;
+	assigned-clocks = <&clk IMX93_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <19200000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 /* USB  */
 &usbotg1 {
 	disable-over-current;
@@ -148,6 +212,16 @@ MX93_PAD_ENET2_RD2__GPIO4_IO26		0x31e
 		>;
 	};
 
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX93_PAD_UART2_RXD__SAI1_MCLK		0x1202
+			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC	0x1202
+			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK		0x1202
+			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00	0x1402
+			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00	0x1402
+		>;
+	};
+
 	pinctrl_usdhc2_cd: usdhc2cdgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA713C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 22:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8NYcl7F/GSow2VjOSizbaa+ew1YaU+CHmXQ9vQseJI=; b=ZogU3IuSamSAtHxjE64TELBbuR
	KIU9X01ulEFzle+PN40XwKG002PbYM1yvTH2ovKkDZzlGTb75h97uoyk30sLNMNParYhfGXzXXl/3
	YkVaOOggQhVFBxZLADWjg/OPTw9fxTeEHTsl28NBevj9Gwt9eJWNzwCr2Q0+uOxmnKB2kpCwO9RK0
	KpUDMsazrdtbnJBuwrt7JlGRKVkpny1eBsv/JIFxqBP+d/tngYDWePQUE2ArnPhydZylaTge1TYAP
	Q4N1VKcfmHVk8gmOi0NiRlqItrpDr2w8IfhPvNNiv/hrYUPmmgVKmsPgWxYm8VLLcVCwnjhCicY+O
	BgyGGAtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSze-00000006qNn-03SA;
	Mon, 13 Jan 2025 22:33:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSw0-00000006pMR-3V3u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 22:29:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSvv-0006tt-5d; Mon, 13 Jan 2025 23:29:19 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSvu-000KaH-0o;
	Mon, 13 Jan 2025 23:29:18 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSvv-008syM-1J;
	Mon, 13 Jan 2025 23:29:18 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 13 Jan 2025 23:29:07 +0100
Subject: [PATCH 3/6] arm64: dts: imx8mp-skov: move I2C2 pin control group
 into DTSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-skov-imx8mp-new-boards-v1-3-75288def1271@pengutronix.de>
References: <20250113-skov-imx8mp-new-boards-v1-0-75288def1271@pengutronix.de>
In-Reply-To: <20250113-skov-imx8mp-new-boards-v1-0-75288def1271@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_142924_874089_2B8EBB94 
X-CRM114-Status: GOOD (  13.91  )
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

I2C2 is exposed on a pin header on the base board, so its pinmux is
always the same if it's enabled.

Therefore, move the definition to the common DTSI, so board DTs only
need to override the status to enable it.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi          | 12 ++++++++++++
 .../boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts   | 11 -----------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
index 59813ef8e2bb3a3d5672ba1c5776cf0e45fb6862..9dca829581137bc0c3026caf7cda112b859ec092 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
@@ -314,6 +314,11 @@ reg_nvcc_sd2: LDO5 {
 	};
 };
 
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+};
+
 &i2c3 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";
@@ -538,6 +543,13 @@ MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA				0x400001c2
 		>;
 	};
 
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL				0x400001c2
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA				0x400001c2
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL				0x400001c2
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
index 2c75da5f064f2b0cd97f5040febac13c4adc020b..ba581765b52298ea26a5a63079c08f39f10e4e3b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
@@ -27,8 +27,6 @@ &backlight {
 
 &i2c2 {
 	clock-frequency = <100000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
 	touchscreen@38 {
@@ -90,12 +88,3 @@ &reg_tft_vcom {
 	voltage-table = <3160000 73>;
 	status = "okay";
 };
-
-&iomuxc {
-	pinctrl_i2c2: i2c2grp {
-		fsl,pins = <
-			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL				0x400001c2
-			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA				0x400001c2
-		>;
-	};
-};

-- 
2.39.5



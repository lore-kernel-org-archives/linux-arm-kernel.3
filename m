Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3654BC55190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 10:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nxwdodsmrJqTCjHXzmc8/KE3pVW+pHuR2vrlazu10o=; b=Bs5N6CV5eEvUVd1ufe5Zlbvslg
	mROu30BydQpzpgSdvXfBCIDrj4NjSXZiyF8Jd+vplXxy7baGLeIRilnC6rdwDHvGaxgeD3veOS4lM
	afxh4Axi7Pc1+aSE0gQjcyv4rqigsn7/uy05rHSI9qaNzxNTohG4E4Xtf0kIeXLFQAfP5XjQZQcTy
	DI2UViEAjQGATagFHvTgryt1o56OOzaVM0oME/1dqPaTCxfQYVpoNNsmBqqlkooz/s9plt1ONONA1
	qI8E3D56mTb1snM6vYHOmXOQo7QRpaMfbOr89fuFQrIQBAykqwso9tNzlKiKDsgWQ8G1HFCI7xDVK
	TLfrrcng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNsR-0000000E5hx-0HM1;
	Fri, 20 Feb 2026 10:36:51 +0000
Received: from mail.fris.de ([116.203.77.234] helo=mail2.fris.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNsN-0000000E5cl-0KIO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 10:36:49 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1771583803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9nxwdodsmrJqTCjHXzmc8/KE3pVW+pHuR2vrlazu10o=;
	b=rv53oPStcRBBnD19zX4ntmMyBkvFbDD/j16JjHt09rFTQ2GoDktQAhkTYC6HsDFNiirVyj
	2TRkJ42Ohs4UG82UwaZokthgNDpqJdDBmvkx5xLDTPT6JxQn0Bgu3AfanvyW/EtnPwOqM+
	/ify3VhcGxkyUbKUA8vDLKPa0RDiLxEgu666h2XNSA0NWwSc+AZZ7M+Vi7DGXAM7QVoujL
	NE/kt9o/gtA0a+lQchbwfsaO32AdXMjlzTMc5mTmAV8lXGOS6weAwr2QRH+pn4HnmQU5G6
	DkEtnQKGEKUM8wj5pIrrH45l1Jt79KI7jDpSa/dBicRETMzAYJ2Mx7cwERfh5A==
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 1/4] arm64: dts: imx8mp-kontron: Fix touch reset configuration on DL devices
Date: Fri, 20 Feb 2026 11:36:16 +0100
Message-ID: <20260220103636.9697-2-frieder@fris.de>
In-Reply-To: <20260220103636.9697-1-frieder@fris.de>
References: <20260220103636.9697-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_023647_474117_A9685942 
X-CRM114-Status: UNSURE (   9.56  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The reset signal needs a pullup, but there is no hardware pullup.
As a workaround, enable the internal pullup to fix the touchscreen.

As this deviates from the default generic GPIO settings in the OSM
devicetree, add a new node for the touch pinctrl and redefine the
generic gpio1 pinctrl.

Fixes: 946ab10e3f40f ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 .../boot/dts/freescale/imx8mp-kontron-dl.dtso | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
index a3cba41d2b531..7131e9a499ae1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
@@ -77,6 +77,8 @@ &i2c1 {
 	touchscreen@5d {
 		compatible = "goodix,gt928";
 		reg = <0x5d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touch>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <6 8>;
 		irq-gpios = <&gpio1 6 0>;
@@ -98,6 +100,16 @@ &lvds_bridge {
 	status = "okay";
 };
 
+/* redefine to remove touch controller GPIOs */
+&pinctrl_gpio1 {
+	fsl,pins = <
+		MX8MP_IOMUXC_GPIO1_IO00__GPIO1_IO00		0x19 /* GPIO_A_0 */
+		MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01		0x19 /* GPIO_A_1 */
+		MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05		0x19 /* GPIO_A_2 */
+		MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08		0x19 /* GPIO_A_5 */
+	>;
+};
+
 &pwm1 {
 	status = "okay";
 };
@@ -108,4 +120,11 @@ pinctrl_panel_stby: panelstbygrp {
 			MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28		0x19
 		>;
 	};
+
+	pinctrl_touch: touchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x19
+			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07		0x150
+		>;
+	};
 };
-- 
2.52.0



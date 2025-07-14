Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C59C83F2C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipyKtg5UVZklGe5U9QDzBiMrFjh0uc+HFQy8UQbyy0w=; b=Z/LFOjUo/bS4NGOQdR1cIcHYyt
	2E7cGPSUd9FDiPq15uDenp3L5Gn//O4qh6NsnVnScVlUR3v1B27R1WhPTOYa1HJFypvo2wkGS5yyf
	6Sj5S7JeChfWH4SRkt5cAURZQJ6LKNoXKuFhArdKlJU49yHGpwbfF1MASlCfexcnX5W/3/NP5weUP
	OsrtuLwEGsKcGPcbUotXWFQZDItkirH1Ji9DImzzSJNuDMyamqVtwje9gzHpF7wjRgrPmZ32Nk515
	6Ojps+j4+xYV47AEDhhWvpUtsB8zWAHbrNIVCR6uSriQVfwHq2vZexuMBB+0SubRVEB2v+SMm8S+/
	9HJp8aqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKnJ-00000002Zdl-2tTM;
	Mon, 14 Jul 2025 15:08:41 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubK2r-00000002SOd-3fBm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 14:20:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20F49C753D;
	Mon, 14 Jul 2025 16:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1752502840; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ipyKtg5UVZklGe5U9QDzBiMrFjh0uc+HFQy8UQbyy0w=;
	b=Gp4xLa48zlFgKHS4Dl5YrX2vX3WjMc/3rP9Tn9JXotjRSJnW3ssyYRFe2TYiODkzQ1O1iV
	hRQ6Jr5rbfp75qYcrO4x5pStcMIFkDr12JDXgx5t1nTTqsRSLoImp0yBqMOvahohTtqImp
	sLkLK4X+DkbDg8QHBUKfbB4lKXJKP1fH2WF2lE/8HLKH4oFzw9faPm5ZNNTpXntYFVCz5G
	Ob8z+3Irjl5NZVJ3IciR5ITBnA/Y3G8AP7G3Nm/l+3PjC4NbgmofeW/Hkd0mzlAw/Xo8jw
	dOl5bWdpKxUftWMNt7XFP+1iN/a13TLpjCExgiJFNijpWzSmzAsK7ZzkGPkibw==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 11/12] arm64: dts: imx93-kontron: Fix GPIO for panel regulator
Date: Mon, 14 Jul 2025 16:17:37 +0200
Message-ID: <20250714141852.116455-12-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714141852.116455-1-frieder@fris.de>
References: <20250714141852.116455-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_072042_052610_67B69A3C 
X-CRM114-Status: UNSURE (   9.66  )
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

From: Annette Kobou <annette.kobou@kontron.de>

The regulator uses the wrong GPIO. Fix this.

Signed-off-by: Annette Kobou <annette.kobou@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Fixes: 2b52fd6035b7 ("arm64: dts: Add support for Kontron i.MX93 OSM-S SoM and BL carrier board")
---
 .../boot/dts/freescale/imx93-kontron-bl-osm-s.dts    | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
index 89e97c604bd3e..9a9e5d0daf3ba 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
@@ -33,7 +33,9 @@ pwm-beeper {
 
 	reg_vcc_panel: regulator-vcc-panel {
 		compatible = "regulator-fixed";
-		gpio = <&gpio4 3 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_vcc_panel>;
+		gpio = <&gpio2 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
@@ -161,3 +163,11 @@ &usdhc2 {
 	vmmc-supply = <&reg_vdd_3v3>;
 	status = "okay";
 };
+
+&iomuxc {
+	pinctrl_reg_vcc_panel: regvccpanelgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO21__GPIO2_IO21		0x31e /* PWM_2 */
+		>;
+	};
+};
-- 
2.50.1



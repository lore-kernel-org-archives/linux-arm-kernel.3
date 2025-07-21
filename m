Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4243C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=if3G31kDyONKU4cYh6cAYYRUvhtz4mtYtm+FhFilxts=; b=uP+lnUmipvyEhP5zFsY1xF5los
	G5MCeLm9RDujZNpjNTC6JCgdssNScrfrop6Ry9J5qp7nYBROUL7PxoJ7bbPfKzanpcM+T4TVsKoDX
	CYRDMyHOCAD45lJAnb5k5OLDbrwoUoBmqMr+o12s/LgMy5Flo57aYIH2wvIy3Y/L8e88FXTFqtx7U
	26c9b1i+EDV6MnEUC9BuK4S6zWWCcFY0/CmA6V48M7ullyC3pnqGoNDYUdSXAtbu3cK0dBzDrxjb1
	0D8AeJSmNP8Y5m9JtmBOxx8beMsGfgxDCFeVK/w0RfZqm/XmYKuU59V0aR5dWTDuJkyv70N8ISETB
	rO/XnONQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udorQ-0000000H7Fz-07JQ;
	Mon, 21 Jul 2025 11:39:12 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnRm-0000000GurM-3GQG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 10:08:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9E84C75FF;
	Mon, 21 Jul 2025 12:08:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1753092517; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=if3G31kDyONKU4cYh6cAYYRUvhtz4mtYtm+FhFilxts=;
	b=KbUJsVCi58oBt+Pft9XY38ImHzMB6aisEcggDcryygYT07VffSxu0lnLGxKldGzeiuYAdh
	vzaue5hIKJgTUA7ST+ac2Ya+jLfBwcKl/xrgEXvfifh69HT0wiDn7Ui29ZA3xwhi+uC1xA
	c31rEyaFD5yTttEVJufCT2fdWRNuYxxDlsx8rd0dT3Z2Agt0isIsUDQZiD3WsbbXNbUiqG
	F9+ujUhJqrEPDTzYnNdGZ7lYyKskyzyFgkmlW/xzUfeEGZqOD31qs7FihzKQeuAbP4eQpv
	pZ51K1/Yczz+vczEfqRKSapJ/XK91W32DUG8ef2xMYHlLAzVKDrgaN+xXTUUiQ==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Oualid Derouiche <oualid.derouiche@kontron.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 04/12] arm64: dts: imx8mm-kontron: Add Sitronix touch controller in DL devicetree
Date: Mon, 21 Jul 2025 12:05:38 +0200
Message-ID: <20250721100701.115548-5-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721100701.115548-1-frieder@fris.de>
References: <20250721100701.115548-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_030838_967490_DFD0E080 
X-CRM114-Status: GOOD (  11.36  )
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

From: Oualid Derouiche <oualid.derouiche@kontron.de>

Some new panels have the Sitronix touch instead of Goodix. Support them
by adding a node for the new controller. The bootloader needs to detect
the correct controller and enable/disable the nodes accordingly. To make
this easier add labels for both nodes.

Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v2:
* fix node name (thanks Fabio!)
* add labels
---
 .../arm64/boot/dts/freescale/imx8mm-kontron-dl.dtso | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtso b/arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtso
index 1db27731b581c..57d0739fcce32 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtso
@@ -107,7 +107,7 @@ &i2c2 {
 	#size-cells = <0>;
 	status = "okay";
 
-	touchscreen@5d {
+	gt911: touchscreen@5d {
 		compatible = "goodix,gt928";
 		reg = <0x5d>;
 		pinctrl-names = "default";
@@ -117,6 +117,17 @@ touchscreen@5d {
 		reset-gpios = <&gpio3 23 0>;
 		irq-gpios = <&gpio3 22 0>;
 	};
+
+	st1633: touchscreen@55 {
+		compatible = "sitronix,st1633";
+		reg = <0x55>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touch>;
+		interrupts = <22 8>;
+		interrupt-parent = <&gpio3>;
+		gpios = <&gpio3 22 0>;
+		status = "disabled";
+	};
 };
 
 &lvds {
-- 
2.50.1



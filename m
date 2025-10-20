Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54184CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 13:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D3pswD8T4kvpqjL6vVmhm5ybo8RFGGQLzpUDtqC/p3o=; b=Ssh8Rs/dNkgTdkbvFSu2ZfTR58
	WhY6fvtkkYpTEABD5b8tY8XBpYtwfAlGrwtntdn70EplKkit77tzLFWmEO6bz8Rg+UmFycoYw5MJz
	eiM9v5TJ2rLUdSUN3maaZFzANE/N1zBpkELVVNDT7dyfOF790SGUyDMf7HbihMZSE2UUl/aWHN5ea
	gv8j0in+arFuWkthP+170nQ9Ud8R9oIIcGbBZ3NuIUU5aK82acNBt84iBlhT4nmOcalO9znqlZA4K
	qnhxfPg4zjQ1XIciwHy7eaGUv2lbcX5y7C9VuejxAQ1q75ftm0KPg17XFjHP0Oz1T8L24UCmNJJ2t
	ap5TjO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApsj-0000000DmSO-0t62;
	Mon, 20 Oct 2025 13:25:01 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApsg-0000000DmNz-2SQO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 13:25:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0144EC9D0E;
	Mon, 20 Oct 2025 15:24:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1760966687; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=D3pswD8T4kvpqjL6vVmhm5ybo8RFGGQLzpUDtqC/p3o=;
	b=jVJWf94qYI4F1rELanQ5NM3tzzzpdF7zRZZjiveQGmr4zOYsBHWg7x+zlITcnA94JIbywp
	dg/Bthe1Rbr4+909npqjaOceIsyHGrOZmD98o2yxB0wtxPhjSjScXm2xbZ3WpP0GsB3Tpy
	et6TXlRh9PWJM6sFh5w9cSBKHnNA6RYZwOS8e1gWOVwkJv7inPEKsTXKnXMmyXqXOmailZ
	2KvOxvagl80X3+rBeoA0FyBhoz4ckoGzNEQ28q8V71y2wl7qEvd/GrpUU+IJbPCLNlU3EG
	w2VsgzLF11nWX+qL2+Vg/DBVPovNdz49Sn3jCg6hGOi1AB1h74xRPfTyPoJvCw==
From: Frieder Schrempf <frieder@fris.de>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH] arm64: dts: imx8mp-kontron: Fix USB OTG role switching
Date: Mon, 20 Oct 2025 15:21:51 +0200
Message-ID: <20251020132155.630512-1-frieder@fris.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_062459_083153_2E3FA971 
X-CRM114-Status: GOOD (  10.72  )
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

The VBUS supply regulator is currently assigned to the PHY node.
This causes the VBUS to be always on, even when the controller
needs to be switched to peripheral mode.

Fix the OTG role switching by adding a connector node and moving
the VBUS supply regulator to that node. This way the VBUS gets
correctly switched according to the current role.

Fixes: 827c007db5f2 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../dts/freescale/imx8mp-kontron-bl-osm-s.dts | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
index 614b4ce330b1c..0924ac50fd2db 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
@@ -16,11 +16,20 @@ aliases {
 		ethernet1 = &eqos;
 	};
 
-	extcon_usbc: usbc {
-		compatible = "linux,extcon-usb-gpio";
+	connector {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		id-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+		label = "Type-C";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usb1_id>;
-		id-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+		type = "micro";
+		vbus-supply = <&reg_usb1_vbus>;
+
+		port {
+			usb_dr_connector: endpoint {
+				remote-endpoint = <&usb3_dwc>;
+			};
+		};
 	};
 
 	leds {
@@ -244,9 +253,15 @@ &usb_dwc3_0 {
 	hnp-disable;
 	srp-disable;
 	dr_mode = "otg";
-	extcon = <&extcon_usbc>;
 	usb-role-switch;
+	role-switch-default-mode = "peripheral";
 	status = "okay";
+
+	port {
+		usb3_dwc: endpoint {
+			remote-endpoint = <&usb_dr_connector>;
+		};
+	};
 };
 
 &usb_dwc3_1 {
@@ -273,7 +288,6 @@ &usb3_1 {
 };
 
 &usb3_phy0 {
-	vbus-supply = <&reg_usb1_vbus>;
 	status = "okay";
 };
 
-- 
2.51.0



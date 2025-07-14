Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D22C83F2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fi0fGJ9AJQqZATBmEm6EZuwX+ZDWl2PPzFs07T+Av88=; b=KZq0f+/i8MdoirR/zcwaBYBZQx
	3JEPpC6lRkbK2KV2EKjOMOG6gRlRzb52/BKYGV7j1OjW5sOaPl6NuM1ZV/MjVCtlnXov0RcjkLYb/
	mWzF1u8XkxvM8HWpi2dmROaZq2Cgk+kW8exhjPzQ88dLP915P+60xizF05MNXKAgdGvkaLpPMMCLb
	zOuY+M4STlMtMehSsto4aAQkjloWm309jlwcvTrHn7mnzAhg1VZcebdaWTKJCPbv3/4eKqTGT0NiI
	sO3Ld80hzX/eu7C2bbV6vuRkOhiYWsB3eDVb2c8cCBtO95uJxU4zCp64lf3omCfCRzS0XrqlVRrxr
	307GPAcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKnK-00000002Zf4-2QMM;
	Mon, 14 Jul 2025 15:08:42 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubK2u-00000002SPM-3TTd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 14:20:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1715C753B;
	Mon, 14 Jul 2025 16:20:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1752502843; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Fi0fGJ9AJQqZATBmEm6EZuwX+ZDWl2PPzFs07T+Av88=;
	b=AsfsmvpIIOqgImVGjgJI0NgNvlL/oa7g76yvKKQdGtCE/L2OVcrH2goiBeBxJjjLUe3tQb
	/OrJsnAZY9EEXxJfXBXvsc4P7M5hxIh0SkiWDL/pUv2faZzeKMfhbHufXUVK8CSlLnQGgs
	cDFxDEYDcenqYK5fud2eU0tgAyFs2zzzbaoTTEvhVGsk/NzEounwCB59TVoUassvMGIsNE
	fp41RAEjOWie2qus3O/8QUlkTBbisBcSKmhei/pOYhpy4uam3gNsTbcR9FigPRY6aeBWAT
	WQlarfL6oFobReaXmfzWTCi+9xhL3KLLK9Jzt1vnXFJox7BEJLE/v7TAky1w8w==
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
Subject: [PATCH 12/12] arm64: dts: imx93-kontron: Fix USB port assignment
Date: Mon, 14 Jul 2025 16:17:38 +0200
Message-ID: <20250714141852.116455-13-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714141852.116455-1-frieder@fris.de>
References: <20250714141852.116455-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_072045_006356_2613E1FD 
X-CRM114-Status: UNSURE (   9.48  )
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

The assignment of the USB ports is wrong and needs to be swapped.
The OTG (USB-C) port is on the first port and the host port with
the onboard hub is on the second port.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Fixes: 2b52fd6035b7 ("arm64: dts: Add support for Kontron i.MX93 OSM-S SoM and BL carrier board")
---
 .../dts/freescale/imx93-kontron-bl-osm-s.dts  | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
index 9a9e5d0daf3ba..c3d2ddd887fdf 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
@@ -137,6 +137,16 @@ &tpm6 {
 };
 
 &usbotg1 {
+	adp-disable;
+	hnp-disable;
+	srp-disable;
+	disable-over-current;
+	dr_mode = "otg";
+	usb-role-switch;
+	status = "okay";
+};
+
+&usbotg2 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	disable-over-current;
@@ -149,16 +159,6 @@ usb1@1 {
 	};
 };
 
-&usbotg2 {
-	adp-disable;
-	hnp-disable;
-	srp-disable;
-	disable-over-current;
-	dr_mode = "otg";
-	usb-role-switch;
-	status = "okay";
-};
-
 &usdhc2 {
 	vmmc-supply = <&reg_vdd_3v3>;
 	status = "okay";
-- 
2.50.1



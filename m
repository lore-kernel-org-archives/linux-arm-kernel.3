Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13D5C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fi0fGJ9AJQqZATBmEm6EZuwX+ZDWl2PPzFs07T+Av88=; b=m5C3RA4wMUlmqRMvo1WpDAMzXz
	pdtPmu2LXK8RUgZd4tYVVc5dJoGHNdf6THT1BzICM2jwydbBrQ2TmKqOsQRggITGtirOIalChefJ8
	qYLE5XmpsOT39NZZqSyb00We3+4inUBX2861splc7KD0CZWAXVoEMmJ2iLAQxm8OiN6d2E/vDE8nN
	uFW3c/rnDR+09TCYvgycS9tvW2g+OnQWoWVT2z+BNQzmVVUm3n3VPgQ+ArnExLmxY+R1MHHgeA9sK
	igzBj6wRUhoe9Ae9kN3veHghl8o0k9TaWIe7UNITI8LLbEar3q0hHF/B+5pRqKfAS5aFA3SapyLYX
	cPT+TPMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udorX-0000000H7MY-09YK;
	Mon, 21 Jul 2025 11:39:19 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnSA-0000000GuzB-21MK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 10:09:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D421C75F6;
	Mon, 21 Jul 2025 12:09:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1753092540; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Fi0fGJ9AJQqZATBmEm6EZuwX+ZDWl2PPzFs07T+Av88=;
	b=BbXKXmjWwD7TB2flQXuc32pjwrX0tyzpybW8EiUto+FvMGUad1rlb7Q68hRwlrTjEwrnsl
	Y7S6w237oZ9ytjRe49tmcQikhonH2XoB/rnm8uHKJ/Cz0xb12nqrsH4yStpvQFURjOZUwt
	FhlCgYxpnC+hhem6ATxvw93G73r6T4wZBXY7CjuIFJ+nSslqDY9xWtF95mKm8+8YoZQteM
	G6K+l+Gtmk06BWiccCf3ELKct3w55/rLiJAEM3WgJAixSKEGF3Mr2zKOOJvQDSxykOk+IW
	UakIcCoNjv9BKvOaCdKvndzToTXS9YPnoNnyH6Tg0kHcCYfAp9bPWhoVuaGL3A==
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
Subject: [PATCH v2 12/12] arm64: dts: imx93-kontron: Fix USB port assignment
Date: Mon, 21 Jul 2025 12:05:46 +0200
Message-ID: <20250721100701.115548-13-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721100701.115548-1-frieder@fris.de>
References: <20250721100701.115548-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_030902_663580_50D616A1 
X-CRM114-Status: UNSURE (   9.81  )
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



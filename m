Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2496FCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 08:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BkwsvX2mih3Bl3T0kiwBdBTpuq596F+gY6R6yhLMVYk=; b=js3kaC+koMQuQhL6VS5/HQtSYN
	M9XnwmQfvt20z9aiCIaRmc2awrgxUhow+bcCU2IPjDqSwMjSQmM6Xcr7t9EuRCVACl84hlgjE7FHj
	IOKG3oc3fVLxDvyF5wEw28TFcnH+1a0ESdbVytquAVTEuRxxnMRW2i2YKxp2rzR6gz/0wZj0op1Nf
	YcWi3HDj4FAN1I2VsnZ8rplFl1s6+BZQphoNQGVIk5L0W1X9Wb+AKw4UY0S/nYUDYPJbVwoReYzNH
	EnNsdGgbHX3xulZEnQSewex+omDY8tWA8Xs/qSUBg0em1KY44vUDr6VJszIANO8R69RHiUUpPXEua
	Qlom+blQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyR5S-00000007Cgs-0eaO;
	Tue, 16 Sep 2025 08:30:54 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyR5N-00000007CeL-3ZYs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 08:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BkwsvX2mih3Bl3T0kiwBdBTpuq596F+gY6R6yhLMVYk=; b=I4ErOmQaWuUZh+AkBJsyJYNadh
	B5QYfcEuJxOA45LgcJHiCWhNG9zqoTLDhAP77ZkmC1PdW5pU5zn/tnbapJzULiytenVz9MHEPe5Ug
	QCnX3uUjfWmCqJoXT0Ahfd5/rkpm4en1NrUNWGOc37jB4Nw/VXRHYNSiHdwifigrRh4TmKQOhfriI
	3IxGXhaAXXQ/610duragA0eE+Ncl9MxkcngikuD/z1oicxzmHSskEpoc14lcashqlKQvzAov4ePCO
	2I8rJ2nirS+/Zc5433KfUSzNxrb2/S54QZ8+zyrRLDWuzKwCnHTBQeOuLimGknPnyfOZQL2yyThch
	KdMpFIYg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:37984 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uyQhx-0000000DK9c-3JVv;
	Tue, 16 Sep 2025 10:06:36 +0200
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
Subject: [PATCH 1/2] arm64: dts: freescale: imx93-phyboard-nash: Add USB vbus regulators
Date: Tue, 16 Sep 2025 10:06:34 +0200
Message-Id: <20250916080635.1520551-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_013050_070258_192F75A9 
X-CRM114-Status: UNSURE (   5.86  )
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

Add USB vbus regulators to silence the following kernel warnings:

  usb_phy_generic usbphynop1: dummy supplies not allowed for exclusive requests (id=vbus)
  usb_phy_generic usbphynop2: dummy supplies not allowed for exclusive requests (id=vbus)

Because generic USB PHY driver requires exclusive vbus regulators since
commit 75fd6485ccce ("usb: phy: generic: Get the vbus supply").

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../dts/freescale/imx93-phyboard-nash.dts     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
index 5599e296919f..9e875e082ee8 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
@@ -71,6 +71,22 @@ iio-hwmon {
 		io-channels = <&curr_sens 0>;
 	};
 
+	reg_usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB1_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	reg_usb2_vbus: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB2_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
@@ -187,6 +203,14 @@ &lpuart7 {
 };
 
 /* USB */
+&usbphynop1 {
+	vbus-supply = <&reg_usb1_vbus>;
+};
+
+&usbphynop2 {
+	vbus-supply = <&reg_usb2_vbus>;
+};
+
 &usbotg1 {
 	disable-over-current;
 	dr_mode = "otg";
-- 
2.34.1



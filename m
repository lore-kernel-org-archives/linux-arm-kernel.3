Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3BEC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XkS+3pXWi5JEgwodRJRkpVVc76nXLyYSns3gjwx9z0E=; b=awgQyLmwSZ1BrbmyAwvnzgHytj
	D9X0vESf8HV3ku0DU/oFm586QGFqMcfEeXkCMu7GnVYuhNYcNY+0lguVequCBkzsBZrBUCXbu/pwa
	qgt2KEQbr+/AgGxyefq/dqECVQg841rPGAbhuKcJgWQOLZmTMeWWTCxmtUue6fPNuzFCe25vNaf8X
	xo049EYMyehroWWiSiX3sDDH8eJizckJivEQhN3lhMzpvi5NCPGW0QIxaAPbuxhavAiq09B6CaGQp
	3FCN1gbe24rBxgBab4sBfbK1gSDJ4Rk2na39d3b1GoOHEvWf+RTxrXkbqIC8GrnRsLyCcee6ae6W/
	ItFEO0WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfD8-0000000Fdx8-0DUh;
	Wed, 07 May 2025 13:53:22 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCesW-0000000FaAp-42rc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:32:07 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:41d7:97f1:5857:a075])
	by baptiste.telenet-ops.be with cmsmtp
	id mDXw2E00L4ooFen01DXwUq; Wed, 07 May 2025 15:31:57 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uCesI-00000000uvc-2sbn;
	Wed, 07 May 2025 15:31:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uCesO-00000001vi3-2sm3;
	Wed, 07 May 2025 15:31:56 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: white-hawk-single: Improve Ethernet TSN description
Date: Wed,  7 May 2025 15:31:55 +0200
Message-ID: <367f10a18aa196ff1c96734dd9bd5634b312c421.1746624368.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_063205_138882_7A41C37F 
X-CRM114-Status: GOOD (  10.21  )
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

  - Add the missing "ethernet3" alias for the Ethernet TSN port, so
    U-Boot will fill its local-mac-address property based on the
    "eth3addr" environment variable (if set), avoiding a random MAC
    address being assigned by the OS,
  - Rename the numerical Ethernet PHY label to "tsn0_phy", to avoid
    future conflicts, and for consistency with the "avbN_phy" labels.

Fixes: 3d8e475bd7a724a9 ("arm64: dts: renesas: white-hawk-single: Wire-up Ethernet TSN")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v-6.16.

 arch/arm64/boot/dts/renesas/white-hawk-single.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
index 8b4d313ad173cd3b..4ddb70e525c0532e 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
@@ -11,6 +11,10 @@
 / {
 	model = "Renesas White Hawk Single board";
 	compatible = "renesas,white-hawk-single";
+
+	aliases {
+		ethernet3 = &tsn0;
+	};
 };
 
 &hscif0 {
@@ -53,7 +57,7 @@ &tsn0 {
 	pinctrl-0 = <&tsn0_pins>;
 	pinctrl-names = "default";
 	phy-mode = "rgmii";
-	phy-handle = <&phy3>;
+	phy-handle = <&tsn0_phy>;
 	status = "okay";
 
 	mdio {
@@ -63,7 +67,7 @@ mdio {
 		reset-gpios = <&gpio1 23 GPIO_ACTIVE_LOW>;
 		reset-post-delay-us = <4000>;
 
-		phy3: ethernet-phy@0 {
+		tsn0_phy: ethernet-phy@0 {
 			compatible = "ethernet-phy-id002b.0980",
 				     "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
-- 
2.43.0



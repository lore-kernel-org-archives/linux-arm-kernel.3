Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357ADD3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzNYooxEH+SbwVbXNQKm879Cde8BezevC9ulnl0zP60=; b=Spk9pYlkkMlDlq1v8kH5gUJvA2
	6kttkJZzN31b+8yaC46rEM0kCmCLGhDMwpFGcx8FgJrKoUOxWGKLDTEsuLe0jlRP73zI0KUiB/oYn
	0346iGEN4Q7Nnu/xxiSL5KALAPRDu5v1zxVT4cKlYwvYH4gVlwBNH93ZJF/SHIOSUuraWYzlCBMr3
	1fIXuxuvyohVWdNdim/rXsIZxMxv5jtGrhRb0Um/WPasBe5eNjHX2rgK6WyWq5Q94yxU2MmOwR5Mg
	PinrBrZ4qUqL0loXFTcRV2qwX8cepooHTGDiBs/zRv7BjmLJ2eiZu13UNPx5YwE6+iyiT5V3PVGbU
	4pY2e4gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFs60-0000000ACDn-1i2b;
	Tue, 26 Nov 2024 09:43:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrpO-0000000A8k4-16w7;
	Tue, 26 Nov 2024 09:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TzNYooxEH+SbwVbXNQKm879Cde8BezevC9ulnl0zP60=; b=gy5uCAYXp1PkvtBzZ/9KoojWnf
	18TM0iASJcB6kGzCjXK11a3QzpLnkLSMjGFE9q8tGD4eMefmvFOi0C5+rJl5dzHAzT5+FGxEnlY2C
	U1HNoeM4LO7BV89TZj+G8PAPEgcFov2J2faSepsiDL/U+Fjclxazg3zWqqYr1vnXCFTgOA4YHflox
	nwSQO43pTr+e2vg959A4Yefk0daTGPfwJtKL0ez6u2G5n6RKqFIWutzHXmioKdm3JpbCOls7mZBqb
	7QmM3ttbYiUosMbOmJ3BC84nLmLx0j8s7zbQdHnEnR2Iz3Rh+CsGOO50ya/oUhhs47NI5TuGlXMC/
	PUQkllwg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42244 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFrpD-0006Wk-06;
	Tue, 26 Nov 2024 09:25:39 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFrpB-005xR8-A6; Tue, 26 Nov 2024 09:25:37 +0000
In-Reply-To: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexander Couzens <lynxis@fe80.eu>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next 16/16] net: phylink: remove
 phylink_phy_no_inband()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFrpB-005xR8-A6@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 09:25:37 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_012550_300475_3A8AE24F 
X-CRM114-Status: GOOD (  12.22  )
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

Remove phylink_phy_no_inband() now that we are handling the lack of
inband negotiation by querying the capabilities of the PHY and PCS,
and the BCM84881 PHY driver provides us the information necessary to
make the decision.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index fd2855fc0fc8..7d5ebab0afb1 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -3400,10 +3400,11 @@ static phy_interface_t phylink_choose_sfp_interface(struct phylink *pl,
 	return interface;
 }
 
-static void phylink_sfp_set_config(struct phylink *pl, u8 mode,
+static void phylink_sfp_set_config(struct phylink *pl,
 				   unsigned long *supported,
 				   struct phylink_link_state *state)
 {
+	u8 mode = MLO_AN_INBAND;
 	bool changed = false;
 
 	phylink_dbg(pl, "requesting link mode %s/%s with support %*pb\n",
@@ -3437,8 +3438,7 @@ static void phylink_sfp_set_config(struct phylink *pl, u8 mode,
 		phylink_mac_initial_config(pl, false);
 }
 
-static int phylink_sfp_config_phy(struct phylink *pl, u8 mode,
-				  struct phy_device *phy)
+static int phylink_sfp_config_phy(struct phylink *pl, struct phy_device *phy)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(support);
 	struct phylink_link_state config;
@@ -3482,7 +3482,7 @@ static int phylink_sfp_config_phy(struct phylink *pl, u8 mode,
 
 	pl->link_port = pl->sfp_port;
 
-	phylink_sfp_set_config(pl, mode, support, &config);
+	phylink_sfp_set_config(pl, support, &config);
 
 	return 0;
 }
@@ -3557,7 +3557,7 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
 	pl->link_port = pl->sfp_port;
 
-	phylink_sfp_set_config(pl, MLO_AN_INBAND, pl->sfp_support, &config);
+	phylink_sfp_set_config(pl, pl->sfp_support, &config);
 
 	return 0;
 }
@@ -3628,19 +3628,9 @@ static void phylink_sfp_link_up(void *upstream)
 	phylink_enable_and_run_resolve(pl, PHYLINK_DISABLE_LINK);
 }
 
-/* The Broadcom BCM84881 in the Methode DM7052 is unable to provide a SGMII
- * or 802.3z control word, so inband will not work.
- */
-static bool phylink_phy_no_inband(struct phy_device *phy)
-{
-	return phy->is_c45 && phy_id_compare(phy->c45_ids.device_ids[1],
-					     0xae025150, 0xfffffff0);
-}
-
 static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 {
 	struct phylink *pl = upstream;
-	u8 mode;
 
 	/*
 	 * This is the new way of dealing with flow control for PHYs,
@@ -3651,17 +3641,12 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 	 */
 	phy_support_asym_pause(phy);
 
-	if (phylink_phy_no_inband(phy))
-		mode = MLO_AN_PHY;
-	else
-		mode = MLO_AN_INBAND;
-
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
 			  pl->config->supported_interfaces);
 
 	/* Do the initial configuration */
-	return phylink_sfp_config_phy(pl, mode, phy);
+	return phylink_sfp_config_phy(pl, phy);
 }
 
 static void phylink_sfp_disconnect_phy(void *upstream,
-- 
2.30.2



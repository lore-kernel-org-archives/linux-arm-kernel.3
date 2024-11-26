Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2AFD3B7C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEFP7moTXhDwLu8mliziU9KVQdVyXflN9X2ifDX1sAk=; b=GGaybwZ0Krh7ZmZk+E87DatNo4
	1Vt8XhBGS3rKd4HvGO1nVFLOZZdTcUNv8bbuuiIknAa5K1LjJubAK+soAuP8PXeBwOYXxUp2ibIcc
	HaM/qNV7urXJakQ9Vg+faCnq7O/43uXFDkvRLrnsyegdunL4A1Ynz5gEk/Wqcu2l1Ln53As2ZAUXm
	0gu3L0oUoLlPN4KO9DXjHDw+iiEwLndToY455HLJ5qDylCBQTQzc1lSQQ1PH6l9PY3/BJJ4dtRQnc
	1NMmHAMeSBrYC3eM/OqRTWMVYCmaJnOEKSr4VfjR5YWpEEYbK+F7URTi6yimKIaWHbRmVx4NSuGQ2
	oY0oO37A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrrc-0000000A9FN-219f;
	Tue, 26 Nov 2024 09:28:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFroA-0000000A8Mz-48dv;
	Tue, 26 Nov 2024 09:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PEFP7moTXhDwLu8mliziU9KVQdVyXflN9X2ifDX1sAk=; b=vw5DRYJ9kwjc12cJzmTAXwTz4E
	2QY87lZlQovEZnnVjNEvQ/bxy45yBs3keUZMGvPTuIJlaTe68IzhfLQB3onNojqmNBp1VfK3H171y
	lzfKpZZ6ls4AAjAg44nQ3RI6ZHicU7bUImdWhyRHGE5LjIFR/qANhb0+5UmnJT+RxIQXG9pJbvK8W
	2sXesbbwx9Rbd+xa5c0NLviFjvLi/bde5i3ULA3DCICH/0g5y+0MMof9NdBVaTF0B6btRnwbt3Q08
	S3Q5F3D4iO7QN4FJjU2ubtPtBUhr7ytRfer78F5e3A26cd3cKWhq5CXyRIqP/bfGA3EmFfMzXJIIo
	mQKtWdAA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35820 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFrnx-0006Rq-1v;
	Tue, 26 Nov 2024 09:24:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFrnw-005xPe-KN; Tue, 26 Nov 2024 09:24:20 +0000
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
Subject: [PATCH RFC net-next 01/16] net: phylink: pass phylink and pcs into
 phylink_pcs_neg_mode()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFrnw-005xPe-KN@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 09:24:20 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_012435_030070_1604F722 
X-CRM114-Status: GOOD (  14.86  )
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

Move the call to phylink_pcs_neg_mode() in phylink_major_config() after
we have selected the appropriate PCS to allow the PCS to be passed in.

Add struct phylink and struct phylink_pcs pointers to
phylink_pcs_neg_mode() and pass in the appropriate structures. Set
pl->pcs_neg_mode before returning, and remove the return value.

This will allow the capabilities of the PCS and any PHY to be used when
deciding which pcs_neg_mode should be used.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 3b5ceca2637c..8a43b81d5846 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1085,7 +1085,8 @@ static void phylink_pcs_an_restart(struct phylink *pl)
 
 /**
  * phylink_pcs_neg_mode() - helper to determine PCS inband mode
- * @mode: one of %MLO_AN_FIXED, %MLO_AN_PHY, %MLO_AN_INBAND.
+ * @pl: a pointer to a &struct phylink returned from phylink_create()
+ * @pcs: a pointer to &struct phylink_pcs
  * @interface: interface mode to be used
  * @advertising: adertisement ethtool link mode mask
  *
@@ -1102,11 +1103,13 @@ static void phylink_pcs_an_restart(struct phylink *pl)
  * Note: this is for cases where the PCS itself is involved in negotiation
  * (e.g. Clause 37, SGMII and similar) not Clause 73.
  */
-static unsigned int phylink_pcs_neg_mode(unsigned int mode,
-					 phy_interface_t interface,
-					 const unsigned long *advertising)
+static void phylink_pcs_neg_mode(struct phylink *pl, struct phylink_pcs *pcs,
+				 phy_interface_t interface,
+				 const unsigned long *advertising)
 {
-	unsigned int neg_mode;
+	unsigned int neg_mode, mode;
+
+	mode = pl->cur_link_an_mode;
 
 	switch (interface) {
 	case PHY_INTERFACE_MODE_SGMII:
@@ -1147,7 +1150,7 @@ static unsigned int phylink_pcs_neg_mode(unsigned int mode,
 		break;
 	}
 
-	return neg_mode;
+	pl->pcs_neg_mode = neg_mode;
 }
 
 static void phylink_major_config(struct phylink *pl, bool restart,
@@ -1161,10 +1164,6 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 
 	phylink_dbg(pl, "major config %s\n", phy_modes(state->interface));
 
-	pl->pcs_neg_mode = phylink_pcs_neg_mode(pl->cur_link_an_mode,
-						state->interface,
-						state->advertising);
-
 	if (pl->mac_ops->mac_select_pcs) {
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
 		if (IS_ERR(pcs)) {
@@ -1177,6 +1176,8 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		pcs_changed = pl->pcs != pcs;
 	}
 
+	phylink_pcs_neg_mode(pl, pcs, state->interface, state->advertising);
+
 	phylink_pcs_poll_stop(pl);
 
 	if (pl->mac_ops->mac_prepare) {
@@ -1267,9 +1268,8 @@ static int phylink_change_inband_advert(struct phylink *pl)
 		    pl->link_config.pause);
 
 	/* Recompute the PCS neg mode */
-	pl->pcs_neg_mode = phylink_pcs_neg_mode(pl->cur_link_an_mode,
-					pl->link_config.interface,
-					pl->link_config.advertising);
+	phylink_pcs_neg_mode(pl, pl->pcs, pl->link_config.interface,
+			     pl->link_config.advertising);
 
 	neg_mode = pl->cur_link_an_mode;
 	if (pl->pcs->neg_mode)
-- 
2.30.2



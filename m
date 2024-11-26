Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132DAD3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeaqbGUeLrO00XRYFK41yVErjn3IS1lWD/9jkvohkow=; b=TdGVzoe9/Hs4pM6VWHfU+HCGsc
	c1MS5okfRosraY/W6JA7oFACP2RKqViSEWUqyfl6U8wluwY1Ukt3fJS1yOr5uWfY9HjjoXljnPXB2
	nkoQanDgReNCNmlokcKo/nVE392wsN2oGWC/eA3gZNs9stfixcCYagza56R78pkotRnT1FQg8zHn5
	Daen13Dp4IeyrE8bpUStPnKSouUwOeZhDg5nozGPAA0Fd3A5mPUjVR/b+HIas8YifXoAdk3MUO06S
	x4x2jLqKtiHDz41iJYmV7n4260C3Jk2vQfOI3+yfXlq2BnQl1dktFwQOOWz2ovcaXv3i86v361YO2
	Vu4M3ZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFs54-0000000AC2z-27Ua;
	Tue, 26 Nov 2024 09:42:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrpJ-0000000A8im-2tNs;
	Tue, 26 Nov 2024 09:25:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MeaqbGUeLrO00XRYFK41yVErjn3IS1lWD/9jkvohkow=; b=z+E/SzVOrT8hh5BF6qyu//kEz/
	SpQNadJB0UMflRWcMGDwgZvB7+sPz2IGz/pRX4++4taZ8VoUlPd79630iuC4U3g8ot48ImLODduMB
	0OBqS0tQ8hNzyT431BUDi+gY+GwvviFoITy3gRew84X4dtraBYD/UYkiQM2j+nBnjcTMtSGbIQPMy
	4Be0MXlyAT3bC/ICjZydq6EzfT9qnuvFC8RFiMBzdW94U0lQgS5jhqNvU+hzElv4kYj5Jm5Gq0H3A
	DdvztqqzzZ1KYo1btngAwkBNwXC12dFhyOtCB+cbOqIIwJoP+FGBFKHOdMyKJa735VXUIQM5N9iE7
	NYbEHaAA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59994 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFrp8-0006WQ-0D;
	Tue, 26 Nov 2024 09:25:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFrp6-005xR2-6W; Tue, 26 Nov 2024 09:25:32 +0000
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
Subject: [PATCH RFC net-next 15/16] net: phylink: add negotiation of in-band
 capabilities
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFrp6-005xR2-6W@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 09:25:32 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_012545_872599_C6C4E363 
X-CRM114-Status: GOOD (  26.31  )
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

Support for in-band signalling with Serdes links is uncertain. Some
PHYs do not support in-band for e.g. SGMII. Some PCS do not support
in-band for 2500Base-X. Some PCS require in-band for Base-X protocols.

Simply using what is in DT is insufficient when we have hot-pluggable
PHYs e.g. in the form of SFP modules, which may not provide the
in-band signalling.

In order to address this, we have introduced phy_inband_caps() and
pcs_inband_caps() functions to allow phylink to retrieve the
capabilities from each end of the PCS/PHY link. This commit adds code
to resolve whether in-band will be used in the various scenarios that
we have: In-band not being used, PHY present using SGMII or Base-X,
PHY not present. We also deal with no capabilties provided.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 154 +++++++++++++++++++++++++++++++++++---
 1 file changed, 144 insertions(+), 10 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index ca52cb23187d..fd2855fc0fc8 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -75,6 +75,7 @@ struct phylink {
 
 	struct mutex state_mutex;
 	struct phylink_link_state phy_state;
+	unsigned int phy_ib_mode;
 	struct work_struct resolve;
 	unsigned int pcs_neg_mode;
 	unsigned int pcs_state;
@@ -1153,10 +1154,18 @@ static void phylink_pcs_neg_mode(struct phylink *pl, struct phylink_pcs *pcs,
 				 phy_interface_t interface,
 				 const unsigned long *advertising)
 {
+	unsigned int pcs_ib_caps = 0;
+	unsigned int phy_ib_caps = 0;
 	unsigned int neg_mode, mode;
+	enum {
+		INBAND_CISCO_SGMII,
+		INBAND_BASEX,
+	} type;
 
 	mode = pl->req_link_an_mode;
 
+	pl->phy_ib_mode = 0;
+
 	switch (interface) {
 	case PHY_INTERFACE_MODE_SGMII:
 	case PHY_INTERFACE_MODE_QSGMII:
@@ -1168,10 +1177,7 @@ static void phylink_pcs_neg_mode(struct phylink *pl, struct phylink_pcs *pcs,
 		 * inband communication. Note: there exist PHYs that run
 		 * with SGMII but do not send the inband data.
 		 */
-		if (!phylink_autoneg_inband(mode))
-			neg_mode = PHYLINK_PCS_NEG_OUTBAND;
-		else
-			neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
+		type = INBAND_CISCO_SGMII;
 		break;
 
 	case PHY_INTERFACE_MODE_1000BASEX:
@@ -1182,18 +1188,139 @@ static void phylink_pcs_neg_mode(struct phylink *pl, struct phylink_pcs *pcs,
 		 * as well, but drivers may not support this, so may
 		 * need to override this.
 		 */
-		if (!phylink_autoneg_inband(mode))
+		type = INBAND_BASEX;
+		break;
+
+	default:
+		pl->pcs_neg_mode = PHYLINK_PCS_NEG_NONE;
+		pl->act_link_an_mode = mode;
+		return;
+	}
+
+	if (pcs)
+		pcs_ib_caps = phylink_pcs_inband_caps(pcs, interface);
+
+	if (pl->phydev)
+		phy_ib_caps = phy_inband_caps(pl->phydev, interface);
+
+	phylink_dbg(pl, "interface %s inband modes: pcs=%02x phy=%02x\n",
+		    phy_modes(interface), pcs_ib_caps, phy_ib_caps);
+
+	if (!phylink_autoneg_inband(mode)) {
+		bool pcs_ib_only = false;
+		bool phy_ib_only = false;
+
+		if (pcs_ib_caps && pcs_ib_caps != LINK_INBAND_DISABLE) {
+			/* PCS supports reporting in-band capabilities, and
+			 * supports more than disable mode.
+			 */
+			if (pcs_ib_caps & LINK_INBAND_DISABLE)
+				neg_mode = PHYLINK_PCS_NEG_OUTBAND;
+			else if (pcs_ib_caps & LINK_INBAND_ENABLE)
+				pcs_ib_only = true;
+		}
+
+		if (phy_ib_caps && phy_ib_caps != LINK_INBAND_DISABLE) {
+			/* PHY supports in-band capabilities, and supports
+			 * more than disable mode.
+			 */
+			if (phy_ib_caps & LINK_INBAND_DISABLE)
+				pl->phy_ib_mode = LINK_INBAND_DISABLE;
+			else if (phy_ib_caps & LINK_INBAND_BYPASS)
+				pl->phy_ib_mode = LINK_INBAND_BYPASS;
+			else if (phy_ib_caps & LINK_INBAND_ENABLE)
+				phy_ib_only = true;
+		}
+
+		/* If either the PCS or PHY requires inband to be enabled,
+		 * this is an invalid configuration. Provide a diagnostic
+		 * message for this case, but don't try to force the issue.
+		 */
+		if (pcs_ib_only || phy_ib_only)
+			phylink_warn(pl,
+				     "firmware wants %s mode, but %s%s%s requires inband\n",
+				     phylink_an_mode_str(mode),
+				     pcs_ib_only ? "PCS" : "",
+				     pcs_ib_only && phy_ib_only ? " and " : "",
+				     phy_ib_only ? "PHY" : "");
+
+		neg_mode = PHYLINK_PCS_NEG_OUTBAND;
+	} else if (type == INBAND_CISCO_SGMII || pl->phydev) {
+		/* For SGMII modes which are designed to be used with PHYs, or
+		 * Base-X with a PHY, we try to use in-band mode where-ever
+		 * possible. However, there are some PHYs e.g. BCM84881 which
+		 * do not support in-band.
+		 */
+		const unsigned int inband_ok = LINK_INBAND_ENABLE |
+					       LINK_INBAND_BYPASS;
+		const unsigned int outband_ok = LINK_INBAND_DISABLE |
+						LINK_INBAND_BYPASS;
+		/* PCS	PHY
+		 * D E	D E
+		 * 0 0  0 0	no information			inband enabled
+		 * 1 0  0 0	pcs doesn't support		outband
+		 * 0 1  0 0	pcs required			inband enabled
+		 * 1 1  0 0	pcs optional			inband enabled
+		 * 0 0  1 0	phy doesn't support		outband
+		 * 1 0  1 0	pcs+phy doesn't support		outband
+		 * 0 1  1 0	pcs required, phy doesn't support, invalid
+		 * 1 1  1 0	pcs optional, phy doesn't support, outband
+		 * 0 0  0 1	phy required			inband enabled
+		 * 1 0  0 1	pcs doesn't support, phy required, invalid
+		 * 0 1  0 1	pcs+phy required		inband enabled
+		 * 1 1  0 1	pcs optional, phy required	inband enabled
+		 * 0 0  1 1	phy optional			inband enabled
+		 * 1 0  1 1	pcs doesn't support, phy optional, outband
+		 * 0 1  1 1	pcs required, phy optional	inband enabled
+		 * 1 1  1 1	pcs+phy optional		inband enabled
+		 */
+		if ((!pcs_ib_caps || pcs_ib_caps & inband_ok) &&
+		    (!phy_ib_caps || phy_ib_caps & inband_ok)) {
+			/* In-band supported or unknown at both ends. Enable
+			 * in-band mode with or without bypass at the PHY.
+			 */
+			if (phy_ib_caps & LINK_INBAND_ENABLE)
+				pl->phy_ib_mode = LINK_INBAND_ENABLE;
+			else if (phy_ib_caps & LINK_INBAND_BYPASS)
+				pl->phy_ib_mode = LINK_INBAND_BYPASS;
+
+			neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
+		} else if ((!pcs_ib_caps || pcs_ib_caps & outband_ok) &&
+			   (!phy_ib_caps || phy_ib_caps & outband_ok)) {
+			/* Either in-band not supported at at least one end.
+			 * In-band bypass at the other end is possible.
+			 */
+			if (phy_ib_caps & LINK_INBAND_DISABLE)
+				pl->phy_ib_mode = LINK_INBAND_DISABLE;
+			else if (phy_ib_caps & LINK_INBAND_BYPASS)
+				pl->phy_ib_mode = LINK_INBAND_BYPASS;
+
 			neg_mode = PHYLINK_PCS_NEG_OUTBAND;
+			if (pl->phydev)
+				mode = MLO_AN_PHY;
+		} else {
+			/* invalid */
+			phylink_warn(pl, "%s: incompatible in-band capabilities, trying in-band",
+				     phy_modes(interface));
+			neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
+		}
+	} else {
+		/* For Base-X without a PHY */
+		if (pcs_ib_caps == LINK_INBAND_DISABLE)
+			/* If the PCS doesn't support inband, then inband must
+			 * be disabled.
+			 */
+			neg_mode = PHYLINK_PCS_NEG_INBAND_DISABLED;
+		else if (pcs_ib_caps == LINK_INBAND_ENABLE)
+			/* If the PCS requires inband, then inband must always
+			 * be enabled.
+			 */
+			neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
 		else if (linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
 					   advertising))
 			neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
 		else
 			neg_mode = PHYLINK_PCS_NEG_INBAND_DISABLED;
-		break;
-
-	default:
-		neg_mode = PHYLINK_PCS_NEG_NONE;
-		break;
 	}
 
 	pl->pcs_neg_mode = neg_mode;
@@ -1292,6 +1419,13 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 				    ERR_PTR(err));
 	}
 
+	if (pl->phydev && pl->phy_ib_mode) {
+		err = phy_config_inband(pl->phydev, pl->phy_ib_mode);
+		if (err < 0)
+			phylink_err(pl, "phy_config_inband: %pe\n",
+				    ERR_PTR(err));
+	}
+
 	if (pl->sfp_bus) {
 		rate_kbd = phylink_interface_signal_rate(state->interface);
 		if (rate_kbd)
-- 
2.30.2



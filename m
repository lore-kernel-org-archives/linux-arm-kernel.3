Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD49E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 15:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	Content-Type:Content-Transfer-Encoding:MIME-Version:Subject:To:From:
	References:In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpGGZSUI+WeruL3LFk7HIJG+rWlujUTuGWD8czotisw=; b=KKbDKHEKHIeIAfPmFc72CQyn+U
	3vRifJg3/+aveHaTHFWtWt0xoYBppelnK4KkTq+0aGIiMIfchYJ0KMdLS1JHm35mr3+jFyNh0x4Vr
	wXn/lnOXXPMuaiwovlGExK7Cl/N0TtK6u2hq45NDh80exb7JyYjBWta4ReR9cNzeHCEvxIHy39MSa
	Fl/isTVBhmYksKv/9Qw91aMnIiID4h/5uKQhHeCItHpqy1vUEoj6OhPJnIBtGq1JHFOQYs1u14wiU
	GSBjiKTKYyBA6gNigL8If54LP5NUiJxmf8m0VJ5cENJS4xXL3COYHfeDKEDhPPnNfPyoDDCttIp39
	n4gIu4Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuLA-0000000CRni-1ufx;
	Thu, 09 Jan 2025 15:20:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuGe-0000000CQcN-1Bdl;
	Thu, 09 Jan 2025 15:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MpGGZSUI+WeruL3LFk7HIJG+rWlujUTuGWD8czotisw=; b=ummhw3n0l/qAEztCt+kMX0X8Nr
	mU2+7NQHasLGa0OVqTQTA49NLbBqdoFZ6z1LGroU+3jrH+rBTOc0hWqfSchzPxh2iEF07OipZDV6v
	EDDC/+LJsUGIgSWAafjl9CkbUkuATYq47MftoxWD+ygWWjLCtE4/tQSmS2kxXHU8jvpvExnpaONr4
	/Gm3JtiF51MRbM+/EtLT75iq05zXzwkwXeL7OIjBzbO9qrEwgCtBJk1RWI3J6hKasUtYeu/ErmywC
	B1DaJCAAZ4LNW5O1mK/HdnEIyFBNzpayFRRntM7iL/A1bf/hN2qKOgf5F8T6FxB3NoWyt/9mzNrAl
	5Bx/hLUQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37406 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVuGB-0002DT-0k;
	Thu, 09 Jan 2025 15:15:47 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVuFr-000BXc-Kk; Thu, 09 Jan 2025 15:15:27 +0000
In-Reply-To: <Z3_n_5BXkxQR4zEG@shell.armlinux.org.uk>
References: <Z3_n_5BXkxQR4zEG@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 3/5] net: phylink: pass neg_mode into c22 state
 decoder
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVuFr-000BXc-Kk@rmk-PC.armlinux.org.uk>
Date: Thu, 09 Jan 2025 15:15:27 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_071616_475173_F9E17091 
X-CRM114-Status: GOOD (  13.82  )
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
Cc: Taras Chornyi <taras.chornyi@plvision.eu>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Alexander Duyck <alexanderduyck@fb.com>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Sean Anderson <sean.anderson@seco.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Machon <daniel.machon@microchip.com>, kernel-team@meta.com, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ar__n__ __NAL <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Woudstra <ericwouds@gmail.com>, Alexander Couzens <lynxis@fe80.eu>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Pass the current neg_mode into phylink_mii_c22_pcs_get_state() and
phylink_mii_c22_pcs_decode_state(). Update all users of phylink PCS
that use these functions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/freescale/fman/fman_dtsec.c         | 2 +-
 drivers/net/ethernet/microchip/lan966x/lan966x_main.h    | 2 +-
 drivers/net/ethernet/microchip/lan966x/lan966x_phylink.c | 2 +-
 drivers/net/ethernet/microchip/lan966x/lan966x_port.c    | 4 ++--
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c        | 2 +-
 drivers/net/pcs/pcs-lynx.c                               | 2 +-
 drivers/net/pcs/pcs-mtk-lynxi.c                          | 3 ++-
 drivers/net/pcs/pcs-xpcs.c                               | 5 +++--
 drivers/net/phy/phylink.c                                | 7 +++++--
 include/linux/phylink.h                                  | 3 ++-
 10 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fman/fman_dtsec.c b/drivers/net/ethernet/freescale/fman/fman_dtsec.c
index c47108c820ea..b3e2a596ad2c 100644
--- a/drivers/net/ethernet/freescale/fman/fman_dtsec.c
+++ b/drivers/net/ethernet/freescale/fman/fman_dtsec.c
@@ -760,7 +760,7 @@ static void dtsec_pcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 {
 	struct fman_mac *dtsec = pcs_to_dtsec(pcs);
 
-	phylink_mii_c22_pcs_get_state(dtsec->tbidev, state);
+	phylink_mii_c22_pcs_get_state(dtsec->tbidev, neg_mode, state);
 }
 
 static int dtsec_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.h b/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
index 25cb2f61986f..1efa584e7107 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
@@ -443,7 +443,7 @@ int lan966x_stats_init(struct lan966x *lan966x);
 
 void lan966x_port_config_down(struct lan966x_port *port);
 void lan966x_port_config_up(struct lan966x_port *port);
-void lan966x_port_status_get(struct lan966x_port *port,
+void lan966x_port_status_get(struct lan966x_port *port, unsigned int neg_mode,
 			     struct phylink_link_state *state);
 int lan966x_port_pcs_set(struct lan966x_port *port,
 			 struct lan966x_port_config *config);
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_phylink.c b/drivers/net/ethernet/microchip/lan966x/lan966x_phylink.c
index a761777259bf..75188b99e4e7 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_phylink.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_phylink.c
@@ -93,7 +93,7 @@ static void lan966x_pcs_get_state(struct phylink_pcs *pcs,
 {
 	struct lan966x_port *port = lan966x_pcs_to_port(pcs);
 
-	lan966x_port_status_get(port, state);
+	lan966x_port_status_get(port, neg_mode, state);
 }
 
 static int lan966x_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_port.c b/drivers/net/ethernet/microchip/lan966x/lan966x_port.c
index fdfa4040d9ee..cf7de0267c32 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_port.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_port.c
@@ -284,7 +284,7 @@ void lan966x_port_config_up(struct lan966x_port *port)
 	lan966x_port_link_up(port);
 }
 
-void lan966x_port_status_get(struct lan966x_port *port,
+void lan966x_port_status_get(struct lan966x_port *port, unsigned int neg_mode,
 			     struct phylink_link_state *state)
 {
 	struct lan966x *lan966x = port->lan966x;
@@ -314,7 +314,7 @@ void lan966x_port_status_get(struct lan966x_port *port,
 		bmsr |= BMSR_ANEGCOMPLETE;
 
 		lp_adv = DEV_PCS1G_ANEG_STATUS_LP_ADV_GET(val);
-		phylink_mii_c22_pcs_decode_state(state, bmsr, lp_adv);
+		phylink_mii_c22_pcs_decode_state(state, neg_mode, bmsr, lp_adv);
 	} else {
 		if (!state->link)
 			return;
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index f9e695d7cc4a..3531646ef6ab 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2336,7 +2336,7 @@ static void axienet_pcs_get_state(struct phylink_pcs *pcs,
 {
 	struct mdio_device *pcs_phy = pcs_to_axienet_local(pcs)->pcs_phy;
 
-	phylink_mii_c22_pcs_get_state(pcs_phy, state);
+	phylink_mii_c22_pcs_get_state(pcs_phy, neg_mode, state);
 }
 
 static void axienet_pcs_an_restart(struct phylink_pcs *pcs)
diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
index f359f62f69ad..e46f588cae7d 100644
--- a/drivers/net/pcs/pcs-lynx.c
+++ b/drivers/net/pcs/pcs-lynx.c
@@ -109,7 +109,7 @@ static void lynx_pcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 	case PHY_INTERFACE_MODE_1000BASEX:
 	case PHY_INTERFACE_MODE_SGMII:
 	case PHY_INTERFACE_MODE_QSGMII:
-		phylink_mii_c22_pcs_get_state(lynx->mdio, state);
+		phylink_mii_c22_pcs_get_state(lynx->mdio, neg_mode, state);
 		break;
 	case PHY_INTERFACE_MODE_2500BASEX:
 		lynx_pcs_get_state_2500basex(lynx->mdio, state);
diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
index e1b6f332c3c2..7d6261dee534 100644
--- a/drivers/net/pcs/pcs-mtk-lynxi.c
+++ b/drivers/net/pcs/pcs-mtk-lynxi.c
@@ -115,7 +115,8 @@ static void mtk_pcs_lynxi_get_state(struct phylink_pcs *pcs,
 	regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1, &bm);
 	regmap_read(mpcs->regmap, SGMSYS_PCS_ADVERTISE, &adv);
 
-	phylink_mii_c22_pcs_decode_state(state, FIELD_GET(SGMII_BMSR, bm),
+	phylink_mii_c22_pcs_decode_state(state, neg_mode,
+					 FIELD_GET(SGMII_BMSR, bm),
 					 FIELD_GET(SGMII_LPA, adv));
 }
 
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 4cd0c4fe6496..1aef2afd3c73 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1030,6 +1030,7 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs *xpcs,
 }
 
 static int xpcs_get_state_c37_1000basex(struct dw_xpcs *xpcs,
+					unsigned int neg_mode,
 					struct phylink_link_state *state)
 {
 	int lpa, bmsr;
@@ -1058,7 +1059,7 @@ static int xpcs_get_state_c37_1000basex(struct dw_xpcs *xpcs,
 			}
 		}
 
-		phylink_mii_c22_pcs_decode_state(state, bmsr, lpa);
+		phylink_mii_c22_pcs_decode_state(state, neg_mode, bmsr, lpa);
 	}
 
 	return 0;
@@ -1114,7 +1115,7 @@ static void xpcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 				"xpcs_get_state_c37_sgmii", ERR_PTR(ret));
 		break;
 	case DW_AN_C37_1000BASEX:
-		ret = xpcs_get_state_c37_1000basex(xpcs, state);
+		ret = xpcs_get_state_c37_1000basex(xpcs, neg_mode, state);
 		if (ret)
 			dev_err(&xpcs->mdiodev->dev, "%s returned %pe\n",
 				"xpcs_get_state_c37_1000basex", ERR_PTR(ret));
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 6443cf39593c..99737bb6d1c7 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -3860,6 +3860,7 @@ static void phylink_decode_usgmii_word(struct phylink_link_state *state,
 /**
  * phylink_mii_c22_pcs_decode_state() - Decode MAC PCS state from MII registers
  * @state: a pointer to a &struct phylink_link_state.
+ * @neg_mode: link negotiation mode (PHYLINK_PCS_NEG_xxx)
  * @bmsr: The value of the %MII_BMSR register
  * @lpa: The value of the %MII_LPA register
  *
@@ -3872,7 +3873,7 @@ static void phylink_decode_usgmii_word(struct phylink_link_state *state,
  * accessing @bmsr and @lpa cannot be done with MDIO directly.
  */
 void phylink_mii_c22_pcs_decode_state(struct phylink_link_state *state,
-				      u16 bmsr, u16 lpa)
+				      unsigned int neg_mode, u16 bmsr, u16 lpa)
 {
 	state->link = !!(bmsr & BMSR_LSTATUS);
 	state->an_complete = !!(bmsr & BMSR_ANEGCOMPLETE);
@@ -3910,6 +3911,7 @@ EXPORT_SYMBOL_GPL(phylink_mii_c22_pcs_decode_state);
 /**
  * phylink_mii_c22_pcs_get_state() - read the MAC PCS state
  * @pcs: a pointer to a &struct mdio_device.
+ * @neg_mode: link negotiation mode (PHYLINK_PCS_NEG_xxx)
  * @state: a pointer to a &struct phylink_link_state.
  *
  * Helper for MAC PCS supporting the 802.3 clause 22 register set for
@@ -3922,6 +3924,7 @@ EXPORT_SYMBOL_GPL(phylink_mii_c22_pcs_decode_state);
  * structure.
  */
 void phylink_mii_c22_pcs_get_state(struct mdio_device *pcs,
+				   unsigned int neg_mode,
 				   struct phylink_link_state *state)
 {
 	int bmsr, lpa;
@@ -3933,7 +3936,7 @@ void phylink_mii_c22_pcs_get_state(struct mdio_device *pcs,
 		return;
 	}
 
-	phylink_mii_c22_pcs_decode_state(state, bmsr, lpa);
+	phylink_mii_c22_pcs_decode_state(state, neg_mode, bmsr, lpa);
 }
 EXPORT_SYMBOL_GPL(phylink_mii_c22_pcs_get_state);
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 0bbcb4898e93..f19b7108c840 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -693,8 +693,9 @@ static inline int phylink_get_link_timer_ns(phy_interface_t interface)
 }
 
 void phylink_mii_c22_pcs_decode_state(struct phylink_link_state *state,
-				      u16 bmsr, u16 lpa);
+				      unsigned int neg_mode, u16 bmsr, u16 lpa);
 void phylink_mii_c22_pcs_get_state(struct mdio_device *pcs,
+				   unsigned int neg_mode,
 				   struct phylink_link_state *state);
 int phylink_mii_c22_pcs_encode_advertisement(phy_interface_t interface,
 					     const unsigned long *advertising);
-- 
2.30.2



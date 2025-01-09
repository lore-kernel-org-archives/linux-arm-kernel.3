Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5995AE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 15:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	Content-Type:Content-Transfer-Encoding:MIME-Version:Subject:To:From:
	References:In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GCy3jlWvpGrgseejQGj5nJ77+jAJq7Shg7BjgEB+XA=; b=iob4N3fOJMR7f1pFn3TBBu9sn0
	//TE22toBdGSxUZvr+/Myx0hoHgUhaz09+my7s7I/4o9g6rI/8seQ2s/Hr7QvrT3qO9HetL0yc/3d
	AMIsWE8bJDS5fvx2cgC1iw+F2NBeg3vIV5aXOGK5UVUjpyaI3ljS99U6uQiEvRBmyuaavFzsMgfoB
	+ioFygN/2zpCsjCfRVdx23Iu+MQwU2QdJf1lNdX/bdJY/scMYOJC/gfo4vWB6I5jpL5KOGuzVqKrl
	Ol64DU3RHHjFWGor39EhHwMIJ4l4QGZJpmXPynUbv2r6Wa4nrRCki9QSlUzQEqu8lRCOTvNUNfKA9
	Wu4KdZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuJy-0000000CRQh-0iOF;
	Thu, 09 Jan 2025 15:19:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuGY-0000000CQaz-2lI0;
	Thu, 09 Jan 2025 15:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7GCy3jlWvpGrgseejQGj5nJ77+jAJq7Shg7BjgEB+XA=; b=QYS9SWNC7494nuF5xCV6KkPLqh
	QATw1/oqeIzSJ6Xx0SkesQTcikydZuzs3V7fGTTCXnrqF/5cCJ8OvL8SWwKSK4Nf1cXyZP3U6hnJd
	QxGuCAgey7v126zvDL/GvnId8DsemKahsPS02gtHCC37MB4p7qdLO+TSc5UDxnKeQ0IF3HGkKwQup
	cJk5XDi0P0JQ/MuKXxWKYQzUxeYdtWGXQxVK3e4VTpskl6pa40wdcCZY0mAwr+8wlEW4Os3/NmCso
	fPJ5qK6D/tKmUU9l+PxozszVn+v5K9fj+ZwLkvJk/k9RkS0P0tjO+OgBH3/3tBVz4mfvbRCM7xzAF
	RB4AFKcg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37394 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVuG5-0002DF-1r;
	Thu, 09 Jan 2025 15:15:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVuFm-000BXW-Gq; Thu, 09 Jan 2025 15:15:22 +0000
In-Reply-To: <Z3_n_5BXkxQR4zEG@shell.armlinux.org.uk>
References: <Z3_n_5BXkxQR4zEG@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 2/5] net: phylink: pass neg_mode into
 .pcs_get_state() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVuFm-000BXW-Gq@rmk-PC.armlinux.org.uk>
Date: Thu, 09 Jan 2025 15:15:22 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_071611_576912_A45CAB66 
X-CRM114-Status: GOOD (  14.21  )
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

Pass the current neg_mode into the .pcs_get_state() method. Update all
users of phylink PCS.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/b53/b53_serdes.c                         | 4 ++--
 drivers/net/dsa/mt7530.c                                 | 2 +-
 drivers/net/dsa/mv88e6xxx/pcs-6185.c                     | 1 +
 drivers/net/dsa/mv88e6xxx/pcs-6352.c                     | 1 +
 drivers/net/dsa/mv88e6xxx/pcs-639x.c                     | 5 ++++-
 drivers/net/dsa/qca/qca8k-8xxx.c                         | 2 +-
 drivers/net/ethernet/cadence/macb_main.c                 | 3 ++-
 drivers/net/ethernet/freescale/fman/fman_dtsec.c         | 2 +-
 drivers/net/ethernet/marvell/mvneta.c                    | 2 +-
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c          | 2 ++
 drivers/net/ethernet/marvell/prestera/prestera_main.c    | 1 +
 drivers/net/ethernet/meta/fbnic/fbnic_phylink.c          | 2 +-
 drivers/net/ethernet/microchip/lan966x/lan966x_phylink.c | 1 +
 drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c   | 2 +-
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c        | 1 +
 drivers/net/pcs/pcs-lynx.c                               | 2 +-
 drivers/net/pcs/pcs-mtk-lynxi.c                          | 1 +
 drivers/net/pcs/pcs-xpcs.c                               | 2 +-
 drivers/net/phy/phylink.c                                | 2 +-
 include/linux/phylink.h                                  | 8 ++++++--
 20 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_serdes.c b/drivers/net/dsa/b53/b53_serdes.c
index 3f8a491ce885..4730982b6840 100644
--- a/drivers/net/dsa/b53/b53_serdes.c
+++ b/drivers/net/dsa/b53/b53_serdes.c
@@ -99,8 +99,8 @@ static void b53_serdes_an_restart(struct phylink_pcs *pcs)
 			 SERDES_MII_BLK, reg);
 }
 
-static void b53_serdes_get_state(struct phylink_pcs *pcs,
-				  struct phylink_link_state *state)
+static void b53_serdes_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
+				 struct phylink_link_state *state)
 {
 	struct b53_device *dev = pcs_to_b53_pcs(pcs)->dev;
 	u8 lane = pcs_to_b53_pcs(pcs)->lane;
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index d2d0f091e49e..1c83af805209 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2994,7 +2994,7 @@ static int mt753x_pcs_validate(struct phylink_pcs *pcs,
 	return 0;
 }
 
-static void mt7530_pcs_get_state(struct phylink_pcs *pcs,
+static void mt7530_pcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 				 struct phylink_link_state *state)
 {
 	struct mt7530_priv *priv = pcs_to_mt753x_pcs(pcs)->priv;
diff --git a/drivers/net/dsa/mv88e6xxx/pcs-6185.c b/drivers/net/dsa/mv88e6xxx/pcs-6185.c
index 5a27d047a38e..75ed1fa500a5 100644
--- a/drivers/net/dsa/mv88e6xxx/pcs-6185.c
+++ b/drivers/net/dsa/mv88e6xxx/pcs-6185.c
@@ -55,6 +55,7 @@ static irqreturn_t mv88e6185_pcs_handle_irq(int irq, void *dev_id)
 }
 
 static void mv88e6185_pcs_get_state(struct phylink_pcs *pcs,
+				    unsigned int neg_mode,
 				    struct phylink_link_state *state)
 {
 	struct mv88e6185_pcs *mpcs = pcs_to_mv88e6185_pcs(pcs);
diff --git a/drivers/net/dsa/mv88e6xxx/pcs-6352.c b/drivers/net/dsa/mv88e6xxx/pcs-6352.c
index 88f624b65470..143fe21d1834 100644
--- a/drivers/net/dsa/mv88e6xxx/pcs-6352.c
+++ b/drivers/net/dsa/mv88e6xxx/pcs-6352.c
@@ -158,6 +158,7 @@ static void marvell_c22_pcs_disable(struct phylink_pcs *pcs)
 }
 
 static void marvell_c22_pcs_get_state(struct phylink_pcs *pcs,
+				      unsigned int neg_mode,
 				      struct phylink_link_state *state)
 {
 	struct marvell_c22_pcs *mpcs = pcs_to_marvell_c22_pcs(pcs);
diff --git a/drivers/net/dsa/mv88e6xxx/pcs-639x.c b/drivers/net/dsa/mv88e6xxx/pcs-639x.c
index d758a6c1b226..026b7bfb7ee5 100644
--- a/drivers/net/dsa/mv88e6xxx/pcs-639x.c
+++ b/drivers/net/dsa/mv88e6xxx/pcs-639x.c
@@ -257,6 +257,7 @@ static int mv88e639x_sgmii_pcs_post_config(struct phylink_pcs *pcs,
 }
 
 static void mv88e639x_sgmii_pcs_get_state(struct phylink_pcs *pcs,
+					  unsigned int neg_mode,
 					  struct phylink_link_state *state)
 {
 	struct mv88e639x_pcs *mpcs = sgmii_pcs_to_mv88e639x_pcs(pcs);
@@ -395,6 +396,7 @@ static void mv88e639x_xg_pcs_disable(struct mv88e639x_pcs *mpcs)
 }
 
 static void mv88e639x_xg_pcs_get_state(struct phylink_pcs *pcs,
+				       unsigned int neg_mode,
 				       struct phylink_link_state *state)
 {
 	struct mv88e639x_pcs *mpcs = xg_pcs_to_mv88e639x_pcs(pcs);
@@ -889,6 +891,7 @@ static int mv88e6393x_xg_pcs_post_config(struct phylink_pcs *pcs,
 }
 
 static void mv88e6393x_xg_pcs_get_state(struct phylink_pcs *pcs,
+					unsigned int neg_mode,
 					struct phylink_link_state *state)
 {
 	struct mv88e639x_pcs *mpcs = xg_pcs_to_mv88e639x_pcs(pcs);
@@ -896,7 +899,7 @@ static void mv88e6393x_xg_pcs_get_state(struct phylink_pcs *pcs,
 	int err;
 
 	if (state->interface != PHY_INTERFACE_MODE_USXGMII)
-		return mv88e639x_xg_pcs_get_state(pcs, state);
+		return mv88e639x_xg_pcs_get_state(pcs, neg_mode, state);
 
 	state->link = false;
 
diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 2d56a8152420..76b0b86666f1 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -1491,7 +1491,7 @@ static struct qca8k_pcs *pcs_to_qca8k_pcs(struct phylink_pcs *pcs)
 	return container_of(pcs, struct qca8k_pcs, pcs);
 }
 
-static void qca8k_pcs_get_state(struct phylink_pcs *pcs,
+static void qca8k_pcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 				struct phylink_link_state *state)
 {
 	struct qca8k_priv *priv = pcs_to_qca8k_pcs(pcs)->priv;
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 640f500f989d..48496209fb16 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -568,6 +568,7 @@ static void macb_usx_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 }
 
 static void macb_usx_pcs_get_state(struct phylink_pcs *pcs,
+				   unsigned int neg_mode,
 				   struct phylink_link_state *state)
 {
 	struct macb *bp = container_of(pcs, struct macb, phylink_usx_pcs);
@@ -598,7 +599,7 @@ static int macb_usx_pcs_config(struct phylink_pcs *pcs,
 	return 0;
 }
 
-static void macb_pcs_get_state(struct phylink_pcs *pcs,
+static void macb_pcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 			       struct phylink_link_state *state)
 {
 	state->link = 0;
diff --git a/drivers/net/ethernet/freescale/fman/fman_dtsec.c b/drivers/net/ethernet/freescale/fman/fman_dtsec.c
index 85617bb94959..c47108c820ea 100644
--- a/drivers/net/ethernet/freescale/fman/fman_dtsec.c
+++ b/drivers/net/ethernet/freescale/fman/fman_dtsec.c
@@ -755,7 +755,7 @@ static struct fman_mac *pcs_to_dtsec(struct phylink_pcs *pcs)
 	return container_of(pcs, struct fman_mac, pcs);
 }
 
-static void dtsec_pcs_get_state(struct phylink_pcs *pcs,
+static void dtsec_pcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 				struct phylink_link_state *state)
 {
 	struct fman_mac *dtsec = pcs_to_dtsec(pcs);
diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index fe6261b81540..9e79a60baebc 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -3983,7 +3983,7 @@ static unsigned int mvneta_pcs_inband_caps(struct phylink_pcs *pcs,
 	return LINK_INBAND_DISABLE;
 }
 
-static void mvneta_pcs_get_state(struct phylink_pcs *pcs,
+static void mvneta_pcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 				 struct phylink_link_state *state)
 {
 	struct mvneta_port *pp = mvneta_pcs_to_port(pcs);
diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index f85229a30844..d294580f4832 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -6188,6 +6188,7 @@ static struct mvpp2_port *mvpp2_pcs_gmac_to_port(struct phylink_pcs *pcs)
 }
 
 static void mvpp2_xlg_pcs_get_state(struct phylink_pcs *pcs,
+				    unsigned int neg_mode,
 				    struct phylink_link_state *state)
 {
 	struct mvpp2_port *port = mvpp2_pcs_xlg_to_port(pcs);
@@ -6247,6 +6248,7 @@ static unsigned int mvpp2_gmac_pcs_inband_caps(struct phylink_pcs *pcs,
 }
 
 static void mvpp2_gmac_pcs_get_state(struct phylink_pcs *pcs,
+				     unsigned int neg_mode,
 				     struct phylink_link_state *state)
 {
 	struct mvpp2_port *port = mvpp2_pcs_gmac_to_port(pcs);
diff --git a/drivers/net/ethernet/marvell/prestera/prestera_main.c b/drivers/net/ethernet/marvell/prestera/prestera_main.c
index 22ca6ee9665e..440a4c42b405 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_main.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_main.c
@@ -280,6 +280,7 @@ prestera_mac_select_pcs(struct phylink_config *config,
 }
 
 static void prestera_pcs_get_state(struct phylink_pcs *pcs,
+				   unsigned int neg_mode,
 				   struct phylink_link_state *state)
 {
 	struct prestera_port *port = container_of(pcs, struct prestera_port,
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_phylink.c b/drivers/net/ethernet/meta/fbnic/fbnic_phylink.c
index 1a5e1e719b30..bb11fc83367d 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_phylink.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_phylink.c
@@ -15,7 +15,7 @@ fbnic_pcs_to_net(struct phylink_pcs *pcs)
 }
 
 static void
-fbnic_phylink_pcs_get_state(struct phylink_pcs *pcs,
+fbnic_phylink_pcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    struct phylink_link_state *state)
 {
 	struct fbnic_net *fbn = fbnic_pcs_to_net(pcs);
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_phylink.c b/drivers/net/ethernet/microchip/lan966x/lan966x_phylink.c
index 1d63903f9006..a761777259bf 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_phylink.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_phylink.c
@@ -88,6 +88,7 @@ static struct lan966x_port *lan966x_pcs_to_port(struct phylink_pcs *pcs)
 }
 
 static void lan966x_pcs_get_state(struct phylink_pcs *pcs,
+				  unsigned int neg_mode,
 				  struct phylink_link_state *state)
 {
 	struct lan966x_port *port = lan966x_pcs_to_port(pcs);
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c b/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c
index 035d2f1bea0d..cfb4b2e17ace 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c
@@ -89,7 +89,7 @@ static struct sparx5_port *sparx5_pcs_to_port(struct phylink_pcs *pcs)
 	return container_of(pcs, struct sparx5_port, phylink_pcs);
 }
 
-static void sparx5_pcs_get_state(struct phylink_pcs *pcs,
+static void sparx5_pcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 				 struct phylink_link_state *state)
 {
 	struct sparx5_port *port = sparx5_pcs_to_port(pcs);
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 0f4b02fe6f85..f9e695d7cc4a 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2331,6 +2331,7 @@ static struct axienet_local *pcs_to_axienet_local(struct phylink_pcs *pcs)
 }
 
 static void axienet_pcs_get_state(struct phylink_pcs *pcs,
+				  unsigned int neg_mode,
 				  struct phylink_link_state *state)
 {
 	struct mdio_device *pcs_phy = pcs_to_axienet_local(pcs)->pcs_phy;
diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
index 6457190ec6e7..f359f62f69ad 100644
--- a/drivers/net/pcs/pcs-lynx.c
+++ b/drivers/net/pcs/pcs-lynx.c
@@ -100,7 +100,7 @@ static void lynx_pcs_get_state_2500basex(struct mdio_device *pcs,
 	state->duplex = DUPLEX_FULL;
 }
 
-static void lynx_pcs_get_state(struct phylink_pcs *pcs,
+static void lynx_pcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 			       struct phylink_link_state *state)
 {
 	struct lynx_pcs *lynx = phylink_pcs_to_lynx(pcs);
diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
index 4fe0fb6d12a4..e1b6f332c3c2 100644
--- a/drivers/net/pcs/pcs-mtk-lynxi.c
+++ b/drivers/net/pcs/pcs-mtk-lynxi.c
@@ -105,6 +105,7 @@ static unsigned int mtk_pcs_lynxi_inband_caps(struct phylink_pcs *pcs,
 }
 
 static void mtk_pcs_lynxi_get_state(struct phylink_pcs *pcs,
+				    unsigned int neg_mode,
 				    struct phylink_link_state *state)
 {
 	struct mtk_pcs_lynxi *mpcs = pcs_to_mtk_pcs_lynxi(pcs);
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index c06b66f40022..4cd0c4fe6496 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1086,7 +1086,7 @@ static int xpcs_get_state_2500basex(struct dw_xpcs *xpcs,
 	return 0;
 }
 
-static void xpcs_get_state(struct phylink_pcs *pcs,
+static void xpcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 			   struct phylink_link_state *state)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index d08cdbbbbc1e..6443cf39593c 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1520,7 +1520,7 @@ static void phylink_mac_pcs_get_state(struct phylink *pl,
 	}
 
 	if (pcs)
-		pcs->ops->pcs_get_state(pcs, state);
+		pcs->ops->pcs_get_state(pcs, pl->pcs_neg_mode, state);
 	else
 		state->link = 0;
 }
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 4b7a20620b49..0bbcb4898e93 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -446,7 +446,7 @@ struct phylink_pcs_ops {
 			       phy_interface_t interface);
 	int (*pcs_post_config)(struct phylink_pcs *pcs,
 			       phy_interface_t interface);
-	void (*pcs_get_state)(struct phylink_pcs *pcs,
+	void (*pcs_get_state)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			      struct phylink_link_state *state);
 	int (*pcs_config)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			  phy_interface_t interface,
@@ -505,6 +505,7 @@ void pcs_disable(struct phylink_pcs *pcs);
 /**
  * pcs_get_state() - Read the current inband link state from the hardware
  * @pcs: a pointer to a &struct phylink_pcs.
+ * @neg_mode: link negotiation mode (PHYLINK_PCS_NEG_xxx)
  * @state: a pointer to a &struct phylink_link_state.
  *
  * Read the current inband link state from the MAC PCS, reporting the
@@ -513,8 +514,11 @@ void pcs_disable(struct phylink_pcs *pcs);
  * negotiation completion state in @state->an_complete, and link up state
  * in @state->link. If possible, @state->lp_advertising should also be
  * populated.
+ *
+ * Note that the @neg_mode parameter is always the PHYLINK_PCS_NEG_xxx
+ * state, not MLO_AN_xxx.
  */
-void pcs_get_state(struct phylink_pcs *pcs,
+void pcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 		   struct phylink_link_state *state);
 
 /**
-- 
2.30.2



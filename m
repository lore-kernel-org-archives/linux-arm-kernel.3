Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E08C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 09:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBV6VXM5ubv0LgzVn3ZOknaqGHsOlBunna9rTOrLohY=; b=2JQ6xOk7nbYc5Uc1uMLWNqmNBS
	N2VIxE624qj3FcZEK9+4WBGCo5N/Wxawm6ioD1XZ0J9sivEX/Gw+9CPcyBJ6SoA/cUQ4Df+X/3+ZR
	rkJSZOpc+4o4YfGOGqviK59VV5AlXD75IUdPXt1LrzgW5NhypCXC2EpqVPSqh/+cjqOfq6gfYjYxm
	VWZ+DNNIIBS6qzkFhA1sLEwP79g9XlgsimrtpiQPdQeJYb2tM6ajs2i5Bg5UzKcGP+esPoD5PCWck
	yTWOZNeilshUi+NhKT5TNlbD6GydHUoScpijCC78/gtpudhnUXZiJL+9+OyhYUr1wwzankvJ1YcWQ
	5F9tCmRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trClx-00000000Fxh-2Hci;
	Sun, 09 Mar 2025 09:16:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCQU-00000000Dcd-3edU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 08:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DBV6VXM5ubv0LgzVn3ZOknaqGHsOlBunna9rTOrLohY=; b=VPzLERVoA1MYZtkaPmerv2TuJM
	GjBRGElMyi0r0pt8V7ZXuFDzk4hEcWgMg5Zz0k4UNngOXowKoNFdUipwdVl+QHCNXtj7oqpp4QTmo
	BAh2Cfu37xVNjEqdvOJR3ylHu/zAII3dOx8NjJS2VrREJ6KVjhtL21+lLNEeJ8RkklkgF6NQ8aKFP
	lQefn9+bzz/NGQpEIOcZRqawNll2wi/iiDPnQSWcRPh8R0OfaoU2KbbG1Zyw5WiLe6t9lsAvtlghv
	WeOHEoGguuT/SFCVzId/XZ/DdKNxInLSB6GbaAG84Xxj3KPi+f4iuzJoSDFU+SN7Kjmx2AgbpjdYG
	QJy015mg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44512 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1trCQJ-00015Z-1F;
	Sun, 09 Mar 2025 08:54:15 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1trCPy-005jZf-Ou; Sun, 09 Mar 2025 08:53:54 +0000
In-Reply-To: <20250308200921.1089980-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250308200921.1089980-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	 "David S. Miller" <davem@davemloft.net>,
	 Eric Dumazet <edumazet@google.com>,
	 Jakub Kicinski <kuba@kernel.org>,
	 Paolo Abeni <pabeni@redhat.com>,
	 Rob Herring <robh@kernel.org>,
	 Krzysztof Kozlowski <krzk+dt@kernel.org>,
	 Conor Dooley <conor+dt@kernel.org>,
	 Philipp Zabel <p.zabel@pengutronix.de>,
	 Geert Uytterhoeven <geert+renesas@glider.be>,
	 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	 Jose Abreu <joabreu@synopsys.com>,
	 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH net-next] net: stmmac: allow platforms to use PHY tx clock
 stop capability
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1trCPy-005jZf-Ou@rmk-PC.armlinux.org.uk>
Date: Sun, 09 Mar 2025 08:53:54 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_005426_908173_9ED9B4BD 
X-CRM114-Status: GOOD (  14.41  )
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

Allow platform glue to instruct stmmac to make use of the PHY transmit
clock stop capability when deciding whether to allow the transmit clock
from the DWMAC core to be stopped.

Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h     |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 ++++++++++++----
 include/linux/stmmac.h                           |  3 ++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index d87275c1cf23..bddfa0f4aa21 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -306,6 +306,7 @@ struct stmmac_priv {
 	struct timer_list eee_ctrl_timer;
 	int lpi_irq;
 	u32 tx_lpi_timer;
+	bool tx_lpi_clk_stop;
 	bool eee_enabled;
 	bool eee_active;
 	bool eee_sw_timer_en;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4e0e72428e29..982b7d82fd53 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -460,8 +460,7 @@ static void stmmac_try_to_start_sw_lpi(struct stmmac_priv *priv)
 	/* Check and enter in LPI mode */
 	if (!priv->tx_path_in_lpi_mode)
 		stmmac_set_lpi_mode(priv, priv->hw, STMMAC_LPI_FORCED,
-			priv->plat->flags & STMMAC_FLAG_EN_TX_LPI_CLOCKGATING,
-			0);
+				    priv->tx_lpi_clk_stop, 0);
 }
 
 /**
@@ -1107,13 +1106,18 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 
 	priv->eee_enabled = true;
 
+	/* Update the transmit clock stop according to PHY capability if
+	 * the platform allows
+	 */
+	if (priv->plat->flags & STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP)
+		priv->tx_lpi_clk_stop = tx_clk_stop;
+
 	stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
 			     STMMAC_DEFAULT_TWT_LS);
 
 	/* Try to cnfigure the hardware timer. */
 	ret = stmmac_set_lpi_mode(priv, priv->hw, STMMAC_LPI_TIMER,
-				  priv->plat->flags & STMMAC_FLAG_EN_TX_LPI_CLOCKGATING,
-				  priv->tx_lpi_timer);
+				  priv->tx_lpi_clk_stop, priv->tx_lpi_timer);
 
 	if (ret) {
 		/* Hardware timer mode not supported, or value out of range.
@@ -1272,6 +1276,10 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	if (!(priv->plat->flags & STMMAC_FLAG_RX_CLK_RUNS_IN_LPI))
 		priv->phylink_config.eee_rx_clk_stop_enable = true;
 
+	/* Set the default transmit clock stop bit based on the platform glue */
+	priv->tx_lpi_clk_stop = priv->plat->flags &
+				STMMAC_FLAG_EN_TX_LPI_CLOCKGATING;
+
 	mdio_bus_data = priv->plat->mdio_bus_data;
 	if (mdio_bus_data)
 		priv->phylink_config.default_an_inband =
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index b6f03ab12595..c4ec8bb8144e 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -183,7 +183,8 @@ struct dwmac4_addrs {
 #define STMMAC_FLAG_INT_SNAPSHOT_EN		BIT(9)
 #define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(10)
 #define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(11)
-#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(12)
+#define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(12)
+#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
 
 struct plat_stmmacenet_data {
 	int bus_id;
-- 
2.30.2



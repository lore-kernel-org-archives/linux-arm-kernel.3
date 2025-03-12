Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49087C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 09:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpS7p8o3mdBBFheqnhpM/ihzX7xt9vdxYe4n3JsWYLE=; b=eFbMR7rqQkk2AZRxxumsH5NV/M
	PJwhYhdQ+/QkhC7/cmNLpbklbi0lE7Of5y50ltwWh57bIpvIrA/DtkfwBBXQb/rWj/HRBon3LMQTm
	ON7KFnnPtz5H8yuk7QnareDRu80hok6Y/TnhDpQfcpvcNuFDdjGIbwb1q3hqHAi9jx/ShL0/wrGE1
	ifQJGq2PY1EFjH80SvLJPo2bU5eque41J7r+i45cVaOtBjZ38WCRsQws2kGqWUTezcQCY29ZebkKe
	OxWYwebDEcZEhnjIa6jCXrOZwVsooCH3Yl1tQcgjGH3UuNpILGnJklKjas42+/nDXY1Seq4DPjHpD
	V8R311FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIg8-000000081Ut-3fVE;
	Wed, 12 Mar 2025 09:47:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIUO-00000007zNq-3rZK;
	Wed, 12 Mar 2025 09:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zpS7p8o3mdBBFheqnhpM/ihzX7xt9vdxYe4n3JsWYLE=; b=HVldZJ2mfLEGg3pc11KXC3Gvfk
	1ljvusFokICK3Pqkt0j9HQxxTWotDTGbLfhl1dW1sBCgOKfoo0VxO1esC5LIFdEBgZhCsl0j8lsQ9
	ZO8t1aE8HFFXKwnrQo6C9rY23qJfaFlnJ+RwdP2En7ywr5htxUO60FE9/RXTnT8r/quvKvKblxCLp
	SqXebs3BcOJRwOXIrKmjoZDLnx1wOnNeT1MPcP3cCXBzuKjzNsdNbCDlKe7F4hI5kHKNriIi41NTP
	lhGn5A0+0+AADafBAoBqnBTmMtpcZjcs/kcWGDJf3A5gCnn40HdpYGeBrVwfabjifI1+9T6icid/O
	3AK6RYTA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51958 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tsIUA-0005Gh-0O;
	Wed, 12 Mar 2025 09:34:46 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tsITp-005vG9-Px; Wed, 12 Mar 2025 09:34:25 +0000
In-Reply-To: <Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk>
References: <Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	devicetree@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	netdev@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH net-next v2 1/7] net: stmmac: allow platforms to use PHY tx
 clock stop capability
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tsITp-005vG9-Px@rmk-PC.armlinux.org.uk>
Date: Wed, 12 Mar 2025 09:34:25 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_023500_962310_8402F47E 
X-CRM114-Status: GOOD (  13.56  )
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

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index fa1d7d3a2f43..6f29804148b6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -457,8 +457,7 @@ static void stmmac_try_to_start_sw_lpi(struct stmmac_priv *priv)
 	/* Check and enter in LPI mode */
 	if (!priv->tx_path_in_lpi_mode)
 		stmmac_set_lpi_mode(priv, priv->hw, STMMAC_LPI_FORCED,
-			priv->plat->flags & STMMAC_FLAG_EN_TX_LPI_CLOCKGATING,
-			0);
+				    priv->tx_lpi_clk_stop, 0);
 }
 
 /**
@@ -1104,13 +1103,18 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 
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
@@ -1269,6 +1273,10 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
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



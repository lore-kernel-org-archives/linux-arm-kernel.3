Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0B2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 14:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssNzb2u3GPXbQJZWRfFDxOWTpdQHcWu0aOSDWhVQ6xc=; b=dwaf/oD30JtpVvpMzWKkPEnuhN
	MDHLyuM4gsDwB5xGi7z6BtS4AB8lPgd/zO9YGAHs5AZnaX8nFGFpKNqaS2hvKnntElHOLJbYe9WrG
	uPHo2S/gTTodFVK9wHFD5EBWOkK+jzRicTPbrUntG2EQFcvmxMcf8/QQjN5dkURSbYxtaTwfkj76T
	1zfCXFjE/FQ3Wg0XNxaHUxxYnw60ZJrHriS5UFV7Ledd7nqyP6uRHRUx00dXtW/TqeWepQP+8EgiI
	1a/B0BEfSLrrhXToDogJswCF+nS0JzlPlKxwBV67eiGWTT5ZwwOyL9KMV1SafxE5LWo7XOsxPljsc
	JYeVw9ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkUT-00000000fGq-0r72;
	Thu, 12 Dec 2024 14:48:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkSi-00000000esb-2VYU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 14:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ssNzb2u3GPXbQJZWRfFDxOWTpdQHcWu0aOSDWhVQ6xc=; b=biseaWAuu+w2185feWuGc5kTwt
	pZfhVzIqwpiByKfS4tghUfFOR/GaQ1VQ8eE85UqVFD3F9BTAzjsvnb2DPQuGi7EJd1btLWtR4TW2d
	t93f2og1c5IUVZVDs3iW0YCMZg7HaXHopzs0gl4nccVa6nZuALczpeEynhiV2AX3Eikw2PBR5BXwr
	2CwhLic34/SW5QvA7gnhe7ni0GUKmf/+0G4+B4debjTrZqVx5YmmLKke0BoZvEtNpHrE/LolzuFTO
	BhMN5940tPGwBpIFPVHMDP1cJuZYa2Lo86qR5njaR5h3SyP0nvMPQL6SIpI2tgJGlm54Pwerxvwg2
	PyEXKD7w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35782 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tLkSZ-0005Kc-2y;
	Thu, 12 Dec 2024 14:46:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tLkSX-006qfS-Rx; Thu, 12 Dec 2024 14:46:33 +0000
In-Reply-To: <Z1r3MWZOt36SgGxf@shell.armlinux.org.uk>
References: <Z1r3MWZOt36SgGxf@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 2/7] net: stmmac: move tx_lpi_timer tracking to
 phylib
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tLkSX-006qfS-Rx@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Dec 2024 14:46:33 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_064644_638367_6BB05D69 
X-CRM114-Status: GOOD (  15.45  )
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

When stmmac_ethtool_op_get_eee() is called, stmmac sets the tx_lpi_timer
and tx_lpi_enabled members, and then calls into phylink and thus phylib.
phylib overwrites these members.

phylib will also cause a link down/link up transition when settings
that impact the MAC have been changed.

Convert stmmac to use the tx_lpi_timer setting in struct phy_device,
updating priv->tx_lpi_timer each time when the link comes up, rather
than trying to maintain this user setting itself. We initialise the
phylib tx_lpi_timer setting by doing a get_ee-modify-set_eee sequence
with the last known priv->tx_lpi_timer value. In order for this to work
correctly, we also need this member to be initialised earlier.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c   | 14 +-------------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++++++----
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 1d77389ce953..5ce095a62feb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -898,7 +898,6 @@ static int stmmac_ethtool_op_get_eee(struct net_device *dev,
 	if (!priv->dma_cap.eee)
 		return -EOPNOTSUPP;
 
-	edata->tx_lpi_timer = priv->tx_lpi_timer;
 	edata->tx_lpi_enabled = priv->tx_lpi_enabled;
 
 	return phylink_ethtool_get_eee(priv->phylink, edata);
@@ -908,7 +907,6 @@ static int stmmac_ethtool_op_set_eee(struct net_device *dev,
 				     struct ethtool_keee *edata)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	int ret;
 
 	if (!priv->dma_cap.eee)
 		return -EOPNOTSUPP;
@@ -920,17 +918,7 @@ static int stmmac_ethtool_op_set_eee(struct net_device *dev,
 	if (!edata->eee_enabled)
 		stmmac_disable_eee_mode(priv);
 
-	ret = phylink_ethtool_set_eee(priv->phylink, edata);
-	if (ret)
-		return ret;
-
-	if (edata->eee_enabled &&
-	    priv->tx_lpi_timer != edata->tx_lpi_timer) {
-		priv->tx_lpi_timer = edata->tx_lpi_timer;
-		stmmac_eee_init(priv);
-	}
-
-	return 0;
+	return phylink_ethtool_set_eee(priv->phylink, edata);
 }
 
 static u32 stmmac_usec2riwt(u32 usec, struct stmmac_priv *priv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d45fd7a3acd5..d202bee73b8f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1092,6 +1092,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 			phy_init_eee(phy, !(priv->plat->flags &
 				STMMAC_FLAG_RX_CLK_RUNS_IN_LPI)) >= 0;
 		priv->eee_enabled = stmmac_eee_init(priv);
+		priv->tx_lpi_timer = phy->eee_cfg.tx_lpi_timer;
 		priv->tx_lpi_enabled = priv->eee_enabled;
 		stmmac_set_eee_pls(priv, priv->hw, true);
 	}
@@ -1190,6 +1191,15 @@ static int stmmac_init_phy(struct net_device *dev)
 		ret = phylink_fwnode_phy_connect(priv->phylink, fwnode, 0);
 	}
 
+	if (ret == 0) {
+		struct ethtool_keee eee;
+
+		if (phylink_ethtool_get_eee(priv->phylink, &eee)) {
+			eee.tx_lpi_timer = priv->tx_lpi_timer;
+			phylink_ethtool_set_eee(priv->phylink, &eee);
+		}
+	}
+
 	if (!priv->plat->pmt) {
 		struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };
 
@@ -3442,10 +3452,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 
 	priv->eee_tw_timer = STMMAC_DEFAULT_TWT_LS;
 
-	/* Convert the timer from msec to usec */
-	if (!priv->tx_lpi_timer)
-		priv->tx_lpi_timer = eee_timer * 1000;
-
 	if (priv->use_riwt) {
 		u32 queue;
 
@@ -3912,6 +3918,10 @@ static int __stmmac_open(struct net_device *dev,
 	u32 chan;
 	int ret;
 
+	/* Initialise the tx lpi timer, converting from msec to usec */
+	if (!priv->tx_lpi_timer)
+		priv->tx_lpi_timer = eee_timer * 1000;
+
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
-- 
2.30.2



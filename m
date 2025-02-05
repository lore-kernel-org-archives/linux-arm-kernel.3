Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1219C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 15:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qzc18F39yPzvat+K0alllCe+hx6K8Z4IAOid0E8Q0yc=; b=cSRVNc5NPCKheTaCasxXdQT9Ur
	BmZ++LBvtfAZzyF9U+N/amVy/5T1V/XRO2v23NmHiw4YVUmr7BeCMUd1swpGiyYNmTpZ+4bJC9mip
	o/X2z4J7RoPSObob/visCMKbH27MZo17TlvVhwmi1Uh7N7Ij+w+ztmSWtzrXkz4rf2lC7BDWPlFGb
	AEpllhF0POBINN36ALkpIn8ijoTauevBbJxrMoOjy26IzUNsrjI2zhRWZK3iUPel77tOFM3nk6523
	IB+p/2x2C4sRZiK02sAHOU6ZZ8R/P80a9MyYVI2lXDHu/Q58yzqglBu2ET/HLrHx/kRd13jSGhSwr
	nVlbSZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhV5-00000003o0R-1eKf;
	Wed, 05 Feb 2025 15:39:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfh3r-00000003iVH-1H2Y;
	Wed, 05 Feb 2025 15:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Qzc18F39yPzvat+K0alllCe+hx6K8Z4IAOid0E8Q0yc=; b=M4G54XpJan6QaSWOMBWzZuEgK6
	gwcy7aov4kKXVzj+vaY9GdS9w1NfdHCM7AdsW5XeffBPgSsJDgfdhpM17xVCh2+J3pjX389fZwrgg
	hZTqNUKZi1BZ2GCahh6zPlSLirdrfJKJlfZjlkqpkapNe7xblFrCO/fSM/g/2wAzNsy3kGqiUhjzI
	3iVJsShYxhOAfGnWzTvlioQntJBFgJn/FWzfffe7tNZYxmT20/UXvmY9rhYCcXZxQAlMioVDm86nI
	onKzrofsd7afL56UeB/VPhkaJbrVrYFQcZcCHUevIWQUI1hW8GdkCO+IeUJZgs3lbahLht+EnnLlF
	vjjwuaMg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33054 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tfh3k-0007TD-2H;
	Wed, 05 Feb 2025 15:11:24 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tfh3R-003aRS-3M; Wed, 05 Feb 2025 15:11:05 +0000
In-Reply-To: <Z6N_ge7H5oTYt6n8@shell.armlinux.org.uk>
References: <Z6N_ge7H5oTYt6n8@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>
Subject: [PATCH net-next 3/3] net: dsa: mt7530: convert to phylink managed EEE
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tfh3R-003aRS-3M@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Feb 2025 15:11:05 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_071131_344405_D3E6CB7D 
X-CRM114-Status: GOOD (  16.34  )
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

Fixme: doesn't bit 25 and 26 also need to be set in the PMCR for
PMCR_FORCE_EEE100 and PMCR_FORCE_EEE1G to take effect?

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/mt7530.c | 69 ++++++++++++++++++++++++++++------------
 1 file changed, 48 insertions(+), 21 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 1c83af805209..24191c4d5221 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2957,28 +2957,62 @@ static void mt753x_phylink_mac_link_up(struct phylink_config *config,
 			mcr |= PMCR_FORCE_RX_FC_EN;
 	}
 
-	if (mode == MLO_AN_PHY && phydev && phy_init_eee(phydev, false) >= 0) {
-		switch (speed) {
-		case SPEED_1000:
-		case SPEED_2500:
-			mcr |= PMCR_FORCE_EEE1G;
-			break;
-		case SPEED_100:
-			mcr |= PMCR_FORCE_EEE100;
-			break;
-		}
-	}
-
 	mt7530_set(priv, MT753X_PMCR_P(dp->index), mcr);
 }
 
+static void mt753x_phylink_mac_disable_tx_lpi(struct phylink_config *config)
+{
+	struct dsa_port *dp = dsa_phylink_to_port(config);
+	struct mt7530_priv *priv = dp->ds->priv;
+
+	mt7530_clear(priv, MT753X_PMCR_P(dp->index),
+		     PMCR_FORCE_EEE1G | PMCR_FORCE_EEE100);
+}
+
+static int mt753x_phylink_mac_enable_tx_lpi(struct phylink_config *config,
+					    u32 timer, bool tx_clock_stop)
+{
+	struct dsa_port *dp = dsa_phylink_to_port(config);
+	struct mt7530_priv *priv = dp->ds->priv;
+	u32 val;
+
+	/* If the timer is zero, then set LPI_MODE_EN, which allows the
+	 * system to enter LPI mode immediately rather than waiting for
+	 * the LPI threshold.
+	 */
+	if (!timer)
+		val = LPI_MODE_EN;
+	else if (FIELD_FIT(LPI_THRESH_MASK, timer))
+		val = FIELD_PREP(LPI_THRESH_MASK, timer);
+	else
+		val = LPI_THRESH_MASK;
+
+	mt7530_rmw(priv, MT753X_PMEEECR_P(dp->index),
+		   LPI_THRESH_MASK | LPI_MODE_EN, val);
+
+	mt7530_set(priv, MT753X_PMCR_P(dp->index),
+		   PMCR_FORCE_EEE1G | PMCR_FORCE_EEE100);
+
+	return 0;
+}
+
 static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
 				    struct phylink_config *config)
 {
 	struct mt7530_priv *priv = ds->priv;
+	u32 eeecr;
 
 	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE;
 
+	config->lpi_capabilities = MAC_100FD | MAC_1000FD | MAC_2500FD;
+	config->lpi_timer_limit_us = FIELD_MAX(LPI_THRESH_MASK);
+
+	eeecr = mt7530_read(priv, MT753X_PMEEECR_P(port));
+	/* tx_lpi_timer should be in microseconds. The time units for
+	 * LPI threshold are unspecified.
+	 */
+	config->lpi_timer_default = FIELD_GET(LPI_THRESH_MASK, eeecr);
+
 	priv->info->mac_port_get_caps(ds, port, config);
 }
 
@@ -3088,18 +3122,9 @@ mt753x_setup(struct dsa_switch *ds)
 static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,
 			      struct ethtool_keee *e)
 {
-	struct mt7530_priv *priv = ds->priv;
-	u32 set, mask = LPI_THRESH_MASK | LPI_MODE_EN;
-
 	if (e->tx_lpi_timer > 0xFFF)
 		return -EINVAL;
 
-	set = LPI_THRESH_SET(e->tx_lpi_timer);
-	if (!e->tx_lpi_enabled)
-		/* Force LPI Mode without a delay */
-		set |= LPI_MODE_EN;
-	mt7530_rmw(priv, MT753X_PMEEECR_P(port), mask, set);
-
 	return 0;
 }
 
@@ -3238,6 +3263,8 @@ static const struct phylink_mac_ops mt753x_phylink_mac_ops = {
 	.mac_config	= mt753x_phylink_mac_config,
 	.mac_link_down	= mt753x_phylink_mac_link_down,
 	.mac_link_up	= mt753x_phylink_mac_link_up,
+	.mac_disable_tx_lpi = mt753x_phylink_mac_disable_tx_lpi,
+	.mac_enable_tx_lpi = mt753x_phylink_mac_enable_tx_lpi,
 };
 
 const struct mt753x_info mt753x_table[] = {
-- 
2.30.2



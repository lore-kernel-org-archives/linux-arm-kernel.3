Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1640E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tH1Du5lBcy6uX8uHJ7Q3PvQHP4R+mjatSNiKbMVdnuE=; b=WCzWKpr9BqhScM6gEHPP7RxKiU
	E9VlY9Nppa+ZnASJL2qKHpd8MILmew/Lb0BYQWzND0SysNrP8zf1DgcoRDMk1x8ehrjUk48aJdsRU
	uJxDCg2wsGA8BnwCCb9nhzQh6ukJneuAXOMbkfBui9Wo4zP775uHit0abVLbjXUmLF8kXTpTqnOyH
	GNMtrZilLviA8SUnJWrPCWNteWcynnLeLPlOKk4j9YkfK7P1zjCpI3So/T/hhZyf0VroydBjBDWUD
	dbWJE57cry/R1nJNa+ixRGuoMBB/ANUGRFfvZ3ka0143XDQ5gyTOw/4Jyqo23PQlUDEUZWOtfvobH
	fZS/qZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmKH-00000001FCN-2uTS;
	Mon, 06 Jan 2025 12:35:21 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmAX-00000001D4p-03IL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 12:25:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tH1Du5lBcy6uX8uHJ7Q3PvQHP4R+mjatSNiKbMVdnuE=; b=Kfu98VwpJzV+QVjV93z/2G0qk2
	BgSHqYG39zQGv0FxXJnGRUhPY3WDn7HHna0P//ngegEDqDNfmiGWi7z0FAh9J+KwUSx22Qh8vdxfK
	kEF4yMvKtXZZQraU4sogxtx+ThgsrSOHEKAQQC2HK58paujkDbRadKFLLqMqJIE+TYih2l0WN/lc/
	wNpMyxwgIXjAxeY7mDn5dJS85i8d8Org+L5T7KIAsGhQFgD5DI7+BjOs4JEiBE0wHi2bjlzf1wVQ5
	GtgIPlhMTo3nX+oMsyDLnfQocsVBS8DSXf4cP0YUNzIBgu3dTyiVAkqhoXOUzJ7Hd3aih4h0bsnHa
	vhk71jWg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55606 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tUmAS-0005rN-0k;
	Mon, 06 Jan 2025 12:25:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tUmAP-007VX7-5s; Mon, 06 Jan 2025 12:25:09 +0000
In-Reply-To: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 05/17] net: stmmac: remove redundant code from
 ethtool EEE ops
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tUmAP-007VX7-5s@rmk-PC.armlinux.org.uk>
Date: Mon, 06 Jan 2025 12:25:09 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_042517_048953_22DCDBB6 
X-CRM114-Status: GOOD (  13.97  )
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

Setting edata->tx_lpi_enabled in stmmac_ethtool_op_get_eee() gets
overwritten by phylib, so there's no point setting this.

In stmmac_ethtool_op_set_eee(), now that stmmac is using the result of
phylib's evaluation of EEE, there is no need to handle anything in the
ethtool EEE ops other than calling through to the appropriate phylink
function, which will pass on to phylib the users request.

As stmmac_disable_eee_mode() is now no longer called from outside
stmmac_main.c, make it static.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h         | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 9 ---------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    | 2 +-
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 984e708d019f..2eee3c5c4d1e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -405,7 +405,6 @@ void stmmac_dvr_remove(struct device *dev);
 int stmmac_dvr_probe(struct device *device,
 		     struct plat_stmmacenet_data *plat_dat,
 		     struct stmmac_resources *res);
-void stmmac_disable_eee_mode(struct stmmac_priv *priv);
 int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt);
 int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size);
 int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 0429a99a8114..693f59c3c47a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -898,8 +898,6 @@ static int stmmac_ethtool_op_get_eee(struct net_device *dev,
 	if (!priv->dma_cap.eee)
 		return -EOPNOTSUPP;
 
-	edata->tx_lpi_enabled = priv->tx_lpi_enabled;
-
 	return phylink_ethtool_get_eee(priv->phylink, edata);
 }
 
@@ -911,13 +909,6 @@ static int stmmac_ethtool_op_set_eee(struct net_device *dev,
 	if (!priv->dma_cap.eee)
 		return -EOPNOTSUPP;
 
-	if (priv->tx_lpi_enabled != edata->tx_lpi_enabled)
-		netdev_warn(priv->dev,
-			    "Setting EEE tx-lpi is not supported\n");
-
-	if (!edata->eee_enabled)
-		stmmac_disable_eee_mode(priv);
-
 	return phylink_ethtool_set_eee(priv->phylink, edata);
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index dbee2de08583..f895bdd75678 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -434,7 +434,7 @@ static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
  * Description: this function is to exit and disable EEE in case of
  * LPI state is true. This is called by the xmit.
  */
-void stmmac_disable_eee_mode(struct stmmac_priv *priv)
+static void stmmac_disable_eee_mode(struct stmmac_priv *priv)
 {
 	if (!priv->eee_sw_timer_en) {
 		stmmac_lpi_entry_timer_config(priv, 0);
-- 
2.30.2



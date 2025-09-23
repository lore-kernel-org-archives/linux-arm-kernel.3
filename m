Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD2ACAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 11:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q24K7de5jaqh0rHllgz2My1TxD+1mvaZiPDKkSvAA3Q=; b=aMAIDk4yHTelfIK/1IBIQoTKdP
	s+W9aXCqcFpec+NQQGx9ZYyT/wA9dzvaguFKqy86IhjCUuoXj3eFdCER6NjZp0wfzfIEgpXeXyfrf
	20WZFQVMKZdWL1jXrHMioEpO6nHUOrt+DHYNp8cmL5f37syQDTPy5m5ylvTvKIfYEwC2Wn6WI3hwx
	lGX5HgYksW94VyiVxEDx9wJEKfdMz+HLp7YfXJr2pDkzmxSkbWNKiyU3PvuzOZmux5HJC7ewcsevT
	/jkfUrQu1bvRSmIUjn5PcEpx7fqs+BWKMkJM+UOtuswAeiWXFoNDFpqBSPF+VMKxQa6dv+VvZI3sA
	FhdqfQhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11AN-0000000DASS-12dU;
	Tue, 23 Sep 2025 11:26:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11AK-0000000DAOM-2lOv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 11:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q24K7de5jaqh0rHllgz2My1TxD+1mvaZiPDKkSvAA3Q=; b=wvvoM4eue0TfQLiDWTqBwk1u4u
	AsxrfAUxyL7D6hjK6sPr6Geqd2HnXq+KNGvlv1HLDZxk3OgvpFN7fZ/LWRINV+3T4+xru0eBdC2lT
	ugsvxuDIsfBYn+hLyY1Lpi31onpgDakqrHKKZsRUv4TOz+thtDHi5psMT1uFTew16u1XdXQHzV8TB
	qOtKTopPDI39RhjAk8o7NwFpjWdnQCkcF8/8trnhh/looSHN5cyhm+zQsl8Wyqh1lTPovM1v+Rayi
	sRLv+EL9+lW1UVqIlZIbX5QjeaAQRyKKsZ6LCgSu/Jgov2mt/Ugaqx28qDO8VLjRwL6p0AykjbtBP
	plq2/Oig==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39568 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v11AB-0000000079Z-0c1x;
	Tue, 23 Sep 2025 12:26:27 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v11A8-0000000774M-3pmH;
	Tue, 23 Sep 2025 12:26:24 +0100
In-Reply-To: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 6/6] net: stmmac: simplify stmmac_init_phy()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v11A8-0000000774M-3pmH@rmk-PC.armlinux.org.uk>
Date: Tue, 23 Sep 2025 12:26:24 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_042636_696394_ABDD870B 
X-CRM114-Status: GOOD (  15.26  )
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

If we fail to attach a PHY, there is no point trying to configure WoL
settings. Exit the function after printing the "cannot attach to PHY"
error, and remove the now unnecessary code indentation for configuring
the LPI timer in phylink. Since we know that "ret" must be zero at this
point, change the final return to use a constant rather than "ret".

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4844d563e291..be064f240895 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1115,6 +1115,7 @@ static int stmmac_init_phy(struct net_device *dev)
 	int mode = priv->plat->phy_interface;
 	struct fwnode_handle *phy_fwnode;
 	struct fwnode_handle *fwnode;
+	struct ethtool_keee eee;
 	int ret;
 
 	if (!phylink_expects_phy(priv->phylink))
@@ -1160,19 +1161,17 @@ static int stmmac_init_phy(struct net_device *dev)
 	if (ret) {
 		netdev_err(priv->dev, "cannot attach to PHY (error: %pe)\n",
 			   ERR_PTR(ret));
-	} else {
-		struct ethtool_keee eee;
+		return ret;
+	}
 
-		/* Configure phylib's copy of the LPI timer. Normally,
-		 * phylink_config.lpi_timer_default would do this, but there is
-		 * a chance that userspace could change the eee_timer setting
-		 * via sysfs before the first open. Thus, preserve existing
-		 * behaviour.
-		 */
-		if (!phylink_ethtool_get_eee(priv->phylink, &eee)) {
-			eee.tx_lpi_timer = priv->tx_lpi_timer;
-			phylink_ethtool_set_eee(priv->phylink, &eee);
-		}
+	/* Configure phylib's copy of the LPI timer. Normally,
+	 * phylink_config.lpi_timer_default would do this, but there is a
+	 * chance that userspace could change the eee_timer setting via sysfs
+	 * before the first open. Thus, preserve existing behaviour.
+	 */
+	if (!phylink_ethtool_get_eee(priv->phylink, &eee)) {
+		eee.tx_lpi_timer = priv->tx_lpi_timer;
+		phylink_ethtool_set_eee(priv->phylink, &eee);
 	}
 
 	if (!priv->plat->pmt) {
@@ -1183,7 +1182,7 @@ static int stmmac_init_phy(struct net_device *dev)
 		device_set_wakeup_enable(priv->device, !!wol.wolopts);
 	}
 
-	return ret;
+	return 0;
 }
 
 static int stmmac_phy_setup(struct stmmac_priv *priv)
-- 
2.47.3



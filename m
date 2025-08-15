Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6141FCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 14:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QN1lkRj9Z/Xeof2lKh1zXqe0BYL9plrkCkxT01SueLQ=; b=tHXtjpf2KFUuIey46ds5LJWNib
	zafDRtIcobJYLJ+LBHwrddtcZ2MfmgqM5nTd2bOfre9xh71Ahw2iHuvyRGo4Ve0EBM3izFeWet27U
	72vcwWos6mwUejZN/OA54s4cG1D05Gg5m/jJwGIBruMl8icYHMq9uNKdYJ/I5zEpS7ibnCXOUl+Ec
	KrZGnazIV3ZZ7jcQKSSaD1ktvUkyf52ssmquxHtSNjzjLX5qA84wn5KFAJT7UfEf8ASOC9TjUJSFG
	ncJHnuCPig6LNub6xwFe2aGf0ZVRsESLIhYIimZkEGMcJCV2NAisJ+hlMFhz9abIIyeI49i2AhH1g
	zHCU7WzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvTz-00000002j5b-2Lp7;
	Fri, 15 Aug 2025 14:32:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsgD-00000002LHP-3hZ1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QN1lkRj9Z/Xeof2lKh1zXqe0BYL9plrkCkxT01SueLQ=; b=j5wcYz699WblcRDzmmeF/CVJyq
	rwsJ+cYfmesalx22/SjEUC71zNvDVIYP+hs80HbLkzJkZaxSKCKMM9N9zrtogW1ZQoCCp/jzks3/e
	t631LrlkZXHzMfSsH4+nT8l8guvUrS5pLRsivlXqdeMkhwAD8iPaX5r+a5Yeqgq0BHIAw81hpfTEz
	Gu5+mZEwN76jhornRIbzhnRpt1/AyjMrAX1fIKE87Pw3VCLoHsk666FFpsOLdJp7xSh3YVfTj0W3B
	NVIvic083MCRsGYpVXaLjhnhjTDmpCwJJ/j2US9KJkjjU/vjIdgZpZd63rI+e3zn6oqaoGSrWmnHW
	U8iMU+Lw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45718 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1umsg8-00012Y-20;
	Fri, 15 Aug 2025 12:33:00 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1umsfP-008vKp-U1; Fri, 15 Aug 2025 12:32:15 +0100
In-Reply-To: <aJ8avIp8DBAckgMc@shell.armlinux.org.uk>
References: <aJ8avIp8DBAckgMc@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 6/7] net: stmmac: add helpers to indicate WoL enable
 status
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1umsfP-008vKp-U1@rmk-PC.armlinux.org.uk>
Date: Fri, 15 Aug 2025 12:32:15 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_043305_921837_4E775C4D 
X-CRM114-Status: GOOD (  14.16  )
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

Add two helpers to abstract the WoL enable status at the PHY and MAC to
make the code easier to read.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h          | 10 ++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 11 +++++------
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c |  4 ++--
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b16b8aeeb583..78d6b3737a26 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -375,6 +375,16 @@ enum stmmac_state {
 
 extern const struct dev_pm_ops stmmac_simple_pm_ops;
 
+static inline bool stmmac_wol_enabled_mac(struct stmmac_priv *priv)
+{
+	return priv->plat->pmt && device_may_wakeup(priv->device);
+}
+
+static inline bool stmmac_wol_enabled_phy(struct stmmac_priv *priv)
+{
+	return !priv->plat->pmt && device_may_wakeup(priv->device);
+}
+
 int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e715e9f2fe22..78113e2602ee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7857,7 +7857,7 @@ int stmmac_suspend(struct device *dev)
 		priv->plat->serdes_powerdown(ndev, priv->plat->bsp_priv);
 
 	/* Enable Power down mode by programming the PMT regs */
-	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
+	if (stmmac_wol_enabled_mac(priv)) {
 		stmmac_pmt(priv, priv->hw, priv->wolopts);
 		priv->irq_wake = 1;
 	} else {
@@ -7868,11 +7868,10 @@ int stmmac_suspend(struct device *dev)
 	mutex_unlock(&priv->lock);
 
 	rtnl_lock();
-	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
+	if (stmmac_wol_enabled_phy(priv))
 		phylink_speed_down(priv->phylink, false);
 
-	phylink_suspend(priv->phylink,
-			device_may_wakeup(priv->device) && priv->plat->pmt);
+	phylink_suspend(priv->phylink, stmmac_wol_enabled_mac(priv));
 	rtnl_unlock();
 
 	if (stmmac_fpe_supported(priv))
@@ -7948,7 +7947,7 @@ int stmmac_resume(struct device *dev)
 	 * this bit because it can generate problems while resuming
 	 * from another devices (e.g. serial console).
 	 */
-	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
+	if (stmmac_wol_enabled_mac(priv)) {
 		mutex_lock(&priv->lock);
 		stmmac_pmt(priv, priv->hw, 0);
 		mutex_unlock(&priv->lock);
@@ -8001,7 +8000,7 @@ int stmmac_resume(struct device *dev)
 	 * workqueue thread, which will race with initialisation.
 	 */
 	phylink_resume(priv->phylink);
-	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
+	if (stmmac_wol_enabled_phy(priv))
 		phylink_speed_up(priv->phylink);
 
 	rtnl_unlock();
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index c849676d98e8..a3e077f225d1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -934,7 +934,7 @@ static int __maybe_unused stmmac_pltfr_noirq_suspend(struct device *dev)
 	if (!netif_running(ndev))
 		return 0;
 
-	if (!device_may_wakeup(priv->device) || !priv->plat->pmt) {
+	if (!stmmac_wol_enabled_mac(priv)) {
 		/* Disable clock in case of PWM is off */
 		clk_disable_unprepare(priv->plat->clk_ptp_ref);
 
@@ -955,7 +955,7 @@ static int __maybe_unused stmmac_pltfr_noirq_resume(struct device *dev)
 	if (!netif_running(ndev))
 		return 0;
 
-	if (!device_may_wakeup(priv->device) || !priv->plat->pmt) {
+	if (!stmmac_wol_enabled_mac(priv)) {
 		/* enable the clk previously disabled */
 		ret = pm_runtime_force_resume(dev);
 		if (ret)
-- 
2.30.2



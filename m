Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1E9105A593
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 12:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SYWWUk4BBvBY6VQqVJkj/PHm6JhaxEdPVfMW+oe4q9s=; b=aDZzMGaRcs0hT39gpWDWuCFMuu
	svqKqnlprJxY8Hxwpl5+a3PUE8+ke9japTAIXkdKBrwbMVjzn1DwuaYtD9zXMyDdE5B38F7W3Tugj
	+N8znUxJZI7gqJwYw/I7v4JNPnJyR/j7pIVY40KnLYBrw+/DO/hWj/HKihpZVvlbsjBG+tf3m84fC
	5L0qlOG79mSr0Ux5TZryRLWg0xpI1uTAkFDVvpnJ2QnrXe8Y/T3O/6F9yI44YCdFtilMmN/CaRbcX
	Yx5pUlNK+U40QfqLcqx9TA7/sGBrtqMqWVpoRJ7EkUnLDbRQdEN/0MrVMw5HfiucdSKkZpdLf6hRP
	6qpLFeGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0evN-0000000E0lC-0beC;
	Thu, 12 Mar 2026 12:13:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0evK-0000000E0k1-0y3C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 12:13:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SYWWUk4BBvBY6VQqVJkj/PHm6JhaxEdPVfMW+oe4q9s=; b=V/JCFYaAW0U4P25UP56+tfkptv
	yFEqa91T4fMh7Ff/s4OeTmiH2mNoejFjGpPWmSJSX9b42YI84PDYtjU1kTPWFW0NLAsrHG4QgROFI
	EkdOd45/fcj7OjJvrtGkE8JATwhOOSvoCMOiY+fAjZ+viMkJpOYArbCS4JQmg8tsUmzX9mi6sURPU
	IBsR4EE5+g1vCnh9sMNgJPqSk4jLkuaeEmeG6YngHfRsKy6IOaFceEagrFWmVi0PDz2Eijc507DEq
	HyDKz9oGNFG1l4cAFZ89g1dAll0PGEATyirf8gJWNAGYSWcR4NSBBtUG25BbtyKDUZ0xnTCYZ4gnz
	LSgcDwhA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51232 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0evD-000000007ka-469T;
	Thu, 12 Mar 2026 12:13:48 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0evD-0000000CzY1-19rN;
	Thu, 12 Mar 2026 12:13:47 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: stmmac: move MSI data out of struct stmmac_priv
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0evD-0000000CzY1-19rN@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Mar 2026 12:13:47 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_051354_433688_024299F6 
X-CRM114-Status: GOOD (  20.19  )
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

Only three platforms supprt MSIs, which means having all the strings
and interrupt arrays always allocated wastes space. None of this data
is performance critical - this data is only used when requesting and
releasing the MSI interrupts.

Move the MSI data out of struct stmmac_priv into its own separately
allocated structure, and move its initialisation to a separate
function.

This removes 768 bytes from struct stmmac_priv.

Link: https://lore.kernel.org/r/aYtq4ypxXTvn_Is6@shell.armlinux.org.uk
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  | 31 +++---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 96 ++++++++++++-------
 2 files changed, 77 insertions(+), 50 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index bba9bb9c95bf..7a66edba8f66 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -243,6 +243,23 @@ struct stmmac_est {
 	u32 max_sdu[MTL_MAX_TX_QUEUES];
 };
 
+struct stmmac_msi {
+	int sfty_ce_irq;
+	int sfty_ue_irq;
+	int rx_irq[MTL_MAX_RX_QUEUES];
+	int tx_irq[MTL_MAX_TX_QUEUES];
+
+	/*irq name */
+	char int_name_mac[IFNAMSIZ + 9];
+	char int_name_wol[IFNAMSIZ + 9];
+	char int_name_lpi[IFNAMSIZ + 9];
+	char int_name_sfty[IFNAMSIZ + 10];
+	char int_name_sfty_ce[IFNAMSIZ + 10];
+	char int_name_sfty_ue[IFNAMSIZ + 10];
+	char int_name_rx_irq[MTL_MAX_RX_QUEUES][IFNAMSIZ + 14];
+	char int_name_tx_irq[MTL_MAX_TX_QUEUES][IFNAMSIZ + 18];
+};
+
 struct stmmac_priv {
 	/* Frequently used values are kept adjacent for cache effect */
 	u32 tx_coal_frames[MTL_MAX_TX_QUEUES];
@@ -329,19 +346,7 @@ struct stmmac_priv {
 	unsigned long active_vlans[BITS_TO_LONGS(VLAN_N_VID)];
 	unsigned int num_double_vlans;
 	int sfty_irq;
-	int sfty_ce_irq;
-	int sfty_ue_irq;
-	int rx_irq[MTL_MAX_RX_QUEUES];
-	int tx_irq[MTL_MAX_TX_QUEUES];
-	/*irq name */
-	char int_name_mac[IFNAMSIZ + 9];
-	char int_name_wol[IFNAMSIZ + 9];
-	char int_name_lpi[IFNAMSIZ + 9];
-	char int_name_sfty[IFNAMSIZ + 10];
-	char int_name_sfty_ce[IFNAMSIZ + 10];
-	char int_name_sfty_ue[IFNAMSIZ + 10];
-	char int_name_rx_irq[MTL_MAX_RX_QUEUES][IFNAMSIZ + 14];
-	char int_name_tx_irq[MTL_MAX_TX_QUEUES][IFNAMSIZ + 18];
+	struct stmmac_msi *msi;
 
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *dbgfs_dir;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 11150bddd872..24de4033c886 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3725,6 +3725,7 @@ static void stmmac_free_irq(struct net_device *dev,
 			    enum request_irq_err irq_err, int irq_idx)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
+	struct stmmac_msi *msi = priv->msi;
 	int j;
 
 	switch (irq_err) {
@@ -3733,27 +3734,27 @@ static void stmmac_free_irq(struct net_device *dev,
 		fallthrough;
 	case REQ_IRQ_ERR_TX:
 		for (j = irq_idx - 1; j >= 0; j--) {
-			if (priv->tx_irq[j] > 0) {
-				irq_set_affinity_hint(priv->tx_irq[j], NULL);
-				free_irq(priv->tx_irq[j], &priv->dma_conf.tx_queue[j]);
+			if (msi->tx_irq[j] > 0) {
+				irq_set_affinity_hint(msi->tx_irq[j], NULL);
+				free_irq(msi->tx_irq[j], &priv->dma_conf.tx_queue[j]);
 			}
 		}
 		irq_idx = priv->plat->rx_queues_to_use;
 		fallthrough;
 	case REQ_IRQ_ERR_RX:
 		for (j = irq_idx - 1; j >= 0; j--) {
-			if (priv->rx_irq[j] > 0) {
-				irq_set_affinity_hint(priv->rx_irq[j], NULL);
-				free_irq(priv->rx_irq[j], &priv->dma_conf.rx_queue[j]);
+			if (msi->rx_irq[j] > 0) {
+				irq_set_affinity_hint(msi->rx_irq[j], NULL);
+				free_irq(msi->rx_irq[j], &priv->dma_conf.rx_queue[j]);
 			}
 		}
 
-		if (priv->sfty_ue_irq > 0 && priv->sfty_ue_irq != dev->irq)
-			free_irq(priv->sfty_ue_irq, dev);
+		if (msi->sfty_ue_irq > 0 && msi->sfty_ue_irq != dev->irq)
+			free_irq(msi->sfty_ue_irq, dev);
 		fallthrough;
 	case REQ_IRQ_ERR_SFTY_UE:
-		if (priv->sfty_ce_irq > 0 && priv->sfty_ce_irq != dev->irq)
-			free_irq(priv->sfty_ce_irq, dev);
+		if (msi->sfty_ce_irq > 0 && msi->sfty_ce_irq != dev->irq)
+			free_irq(msi->sfty_ce_irq, dev);
 		fallthrough;
 	case REQ_IRQ_ERR_SFTY_CE:
 		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
@@ -3773,9 +3774,30 @@ static void stmmac_free_irq(struct net_device *dev,
 	}
 }
 
+static int stmmac_msi_init(struct stmmac_priv *priv,
+			   struct stmmac_resources *res)
+{
+	int i;
+
+	priv->msi = devm_kmalloc(priv->device, sizeof(*priv->msi), GFP_KERNEL);
+	if (!priv->msi)
+		return -ENOMEM;
+
+	priv->msi->sfty_ce_irq = res->sfty_ce_irq;
+	priv->msi->sfty_ue_irq = res->sfty_ue_irq;
+
+	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
+		priv->msi->rx_irq[i] = res->rx_irq[i];
+	for (i = 0; i < MTL_MAX_TX_QUEUES; i++)
+		priv->msi->tx_irq[i] = res->tx_irq[i];
+
+	return 0;
+}
+
 static int stmmac_request_irq_multi_msi(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
+	struct stmmac_msi *msi = priv->msi;
 	enum request_irq_err irq_err;
 	int irq_idx = 0;
 	char *int_name;
@@ -3783,7 +3805,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	int i;
 
 	/* For common interrupt */
-	int_name = priv->int_name_mac;
+	int_name = msi->int_name_mac;
 	sprintf(int_name, "%s:%s", dev->name, "mac");
 	ret = request_irq(dev->irq, stmmac_mac_interrupt,
 			  0, int_name, dev);
@@ -3799,7 +3821,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	 * is used for WoL
 	 */
 	if (priv->wol_irq > 0 && priv->wol_irq != dev->irq) {
-		int_name = priv->int_name_wol;
+		int_name = msi->int_name_wol;
 		sprintf(int_name, "%s:%s", dev->name, "wol");
 		ret = request_irq(priv->wol_irq,
 				  stmmac_mac_interrupt,
@@ -3817,7 +3839,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	 * Error line in case of another line is used
 	 */
 	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq) {
-		int_name = priv->int_name_sfty;
+		int_name = msi->int_name_sfty;
 		sprintf(int_name, "%s:%s", dev->name, "safety");
 		ret = request_irq(priv->sfty_irq, stmmac_safety_interrupt,
 				  0, int_name, dev);
@@ -3833,16 +3855,16 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	/* Request the Safety Feature Correctible Error line in
 	 * case of another line is used
 	 */
-	if (priv->sfty_ce_irq > 0 && priv->sfty_ce_irq != dev->irq) {
-		int_name = priv->int_name_sfty_ce;
+	if (msi->sfty_ce_irq > 0 && msi->sfty_ce_irq != dev->irq) {
+		int_name = msi->int_name_sfty_ce;
 		sprintf(int_name, "%s:%s", dev->name, "safety-ce");
-		ret = request_irq(priv->sfty_ce_irq,
+		ret = request_irq(msi->sfty_ce_irq,
 				  stmmac_safety_interrupt,
 				  0, int_name, dev);
 		if (unlikely(ret < 0)) {
 			netdev_err(priv->dev,
 				   "%s: alloc sfty ce MSI %d (error: %d)\n",
-				   __func__, priv->sfty_ce_irq, ret);
+				   __func__, msi->sfty_ce_irq, ret);
 			irq_err = REQ_IRQ_ERR_SFTY_CE;
 			goto irq_error;
 		}
@@ -3851,16 +3873,16 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	/* Request the Safety Feature Uncorrectible Error line in
 	 * case of another line is used
 	 */
-	if (priv->sfty_ue_irq > 0 && priv->sfty_ue_irq != dev->irq) {
-		int_name = priv->int_name_sfty_ue;
+	if (msi->sfty_ue_irq > 0 && msi->sfty_ue_irq != dev->irq) {
+		int_name = msi->int_name_sfty_ue;
 		sprintf(int_name, "%s:%s", dev->name, "safety-ue");
-		ret = request_irq(priv->sfty_ue_irq,
+		ret = request_irq(msi->sfty_ue_irq,
 				  stmmac_safety_interrupt,
 				  0, int_name, dev);
 		if (unlikely(ret < 0)) {
 			netdev_err(priv->dev,
 				   "%s: alloc sfty ue MSI %d (error: %d)\n",
-				   __func__, priv->sfty_ue_irq, ret);
+				   __func__, msi->sfty_ue_irq, ret);
 			irq_err = REQ_IRQ_ERR_SFTY_UE;
 			goto irq_error;
 		}
@@ -3870,23 +3892,23 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	for (i = 0; i < priv->plat->rx_queues_to_use; i++) {
 		if (i >= MTL_MAX_RX_QUEUES)
 			break;
-		if (priv->rx_irq[i] == 0)
+		if (msi->rx_irq[i] == 0)
 			continue;
 
-		int_name = priv->int_name_rx_irq[i];
+		int_name = msi->int_name_rx_irq[i];
 		sprintf(int_name, "%s:%s-%d", dev->name, "rx", i);
-		ret = request_irq(priv->rx_irq[i],
+		ret = request_irq(msi->rx_irq[i],
 				  stmmac_msi_intr_rx,
 				  0, int_name, &priv->dma_conf.rx_queue[i]);
 		if (unlikely(ret < 0)) {
 			netdev_err(priv->dev,
 				   "%s: alloc rx-%d  MSI %d (error: %d)\n",
-				   __func__, i, priv->rx_irq[i], ret);
+				   __func__, i, msi->rx_irq[i], ret);
 			irq_err = REQ_IRQ_ERR_RX;
 			irq_idx = i;
 			goto irq_error;
 		}
-		irq_set_affinity_hint(priv->rx_irq[i],
+		irq_set_affinity_hint(msi->rx_irq[i],
 				      cpumask_of(i % num_online_cpus()));
 	}
 
@@ -3894,23 +3916,23 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
 		if (i >= MTL_MAX_TX_QUEUES)
 			break;
-		if (priv->tx_irq[i] == 0)
+		if (msi->tx_irq[i] == 0)
 			continue;
 
-		int_name = priv->int_name_tx_irq[i];
+		int_name = msi->int_name_tx_irq[i];
 		sprintf(int_name, "%s:%s-%d", dev->name, "tx", i);
-		ret = request_irq(priv->tx_irq[i],
+		ret = request_irq(msi->tx_irq[i],
 				  stmmac_msi_intr_tx,
 				  0, int_name, &priv->dma_conf.tx_queue[i]);
 		if (unlikely(ret < 0)) {
 			netdev_err(priv->dev,
 				   "%s: alloc tx-%d  MSI %d (error: %d)\n",
-				   __func__, i, priv->tx_irq[i], ret);
+				   __func__, i, msi->tx_irq[i], ret);
 			irq_err = REQ_IRQ_ERR_TX;
 			irq_idx = i;
 			goto irq_error;
 		}
-		irq_set_affinity_hint(priv->tx_irq[i],
+		irq_set_affinity_hint(msi->tx_irq[i],
 				      cpumask_of(i % num_online_cpus()));
 	}
 
@@ -7806,12 +7828,12 @@ static int __stmmac_dvr_probe(struct device *device,
 	priv->dev->irq = res->irq;
 	priv->wol_irq = res->wol_irq;
 	priv->sfty_irq = res->sfty_irq;
-	priv->sfty_ce_irq = res->sfty_ce_irq;
-	priv->sfty_ue_irq = res->sfty_ue_irq;
-	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
-		priv->rx_irq[i] = res->rx_irq[i];
-	for (i = 0; i < MTL_MAX_TX_QUEUES; i++)
-		priv->tx_irq[i] = res->tx_irq[i];
+
+	if (priv->plat->flags & STMMAC_FLAG_MULTI_MSI_EN) {
+		ret = stmmac_msi_init(priv, res);
+		if (ret)
+			return ret;
+	}
 
 	if (!is_zero_ether_addr(res->mac))
 		eth_hw_addr_set(priv->dev, res->mac);
-- 
2.47.3



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500BBEF4EC2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 10:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVpIe8G1IB1lj9gtKD4aNjpy+uUDyJ46jE+2dOksmJM=; b=G19LAbAPfxVsYqTq+pBjthsIj/
	ypPHr1XH5PTiAcqQVHwPqKjNA9aR+eoLkKAiHNVlz39foUvghAiqOeiTvU2JcNa3Rliz2+NIaQXAs
	RfKVQNfrCt+Skl9w34R/g8tVdPLo6KPUK2Vw4AAX7Pwm2YE2dSmFTQlflppjLJ7g1AEVEEqg6L6YI
	lMCA3RUNfTzM1MTpM4yEKThA8DawE2SA2Mm4rXBtVG/cDEfI3AqCrdK7aZpYpnkK2sT40xcDLITNG
	YMboX6aDmp+Y2FvFiaPFBjUviCpcC4bZDh9t8sH68bMMrwIPpRZqpQqlmet5pIz61G9JGHehzNCCf
	lzegqH7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9hJB-000000051iX-0mR0;
	Mon, 06 Apr 2026 10:35:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9hIc-000000051Nk-0W9M;
	Mon, 06 Apr 2026 10:35:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8682660103;
	Mon,  6 Apr 2026 10:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1CAC19425;
	Mon,  6 Apr 2026 10:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775471717;
	bh=e2xtWaYtDRf+AJ5CGEQVIPbqYXhzw2AaQaTxGK6qCqs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UIXpX5FkM1lSgUz9MtBQPS7gDL86DLhBzlmRTJ2Lm+WHXHN9CK+ZaL+V23jHms4IY
	 Mwy/+11O/5jz2E8m5omRHW80yPcw5QXm3PglkNP2s7pX11j/4Embv3zeGYQutq0ESv
	 qgZMApIjUbcPrbbbeRrpheNv6pbxfZlXkdA8CWJy+CNJJ9tZ/E2nPMybF+Meaub5km
	 ZuuMNPR6p3D922pg2esfyzCrgA39BKewV9/RtFPOOpYYoEoxclxdti3TuHOFnj+PM3
	 QEq3Nq1uYLO7WkKD8Z6otu8zfAEmzjCKPmfcTJw9vEVCx8kXgChrGo7/gM1/j4Rl0x
	 J4LySovqG8Ysw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 06 Apr 2026 12:34:15 +0200
Subject: [PATCH net-next v3 10/12] net: airoha: Do not stop GDM port if it
 is shared
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-airoha-eth-multi-serdes-v3-10-ab6ea49d59ff@kernel.org>
References: <20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org>
In-Reply-To: <20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>
X-Mailer: b4 0.14.3
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

Theoretically, in the current codebase, two independent net_devices can
be connected to the same GDM port so we need to check the GDM port is not
used by any other running net_device before setting the forward
configuration to FE_PSE_PORT_DROP.

Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 43 ++++++++++++++++++++++----------
 drivers/net/ethernet/airoha/airoha_eth.h |  2 ++
 2 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index fd27ba13029b..5b0cd37b155e 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1647,8 +1647,8 @@ static int airoha_dev_open(struct net_device *netdev)
 	int err, len = ETH_HLEN + netdev->mtu + ETH_FCS_LEN;
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_gdm_port *port = dev->port;
+	u32 cur_len, pse_port = FE_PSE_PORT_PPE1;
 	struct airoha_qdma *qdma = dev->qdma;
-	u32 pse_port = FE_PSE_PORT_PPE1;
 
 	netif_tx_start_all_queues(netdev);
 	err = airoha_set_vip_for_gdm_port(dev, true);
@@ -1662,10 +1662,15 @@ static int airoha_dev_open(struct net_device *netdev)
 		airoha_fe_clear(qdma->eth, REG_GDM_INGRESS_CFG(port->id),
 				GDM_STAG_EN_MASK);
 
-	airoha_fe_rmw(qdma->eth, REG_GDM_LEN_CFG(port->id),
-		      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
-		      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
-		      FIELD_PREP(GDM_LONG_LEN_MASK, len));
+	cur_len = FIELD_GET(GDM_LONG_LEN_MASK,
+			    airoha_fe_rr(qdma->eth,
+					 REG_GDM_LEN_CFG(port->id)));
+	if (!atomic_read(&port->users) || len > cur_len)
+		airoha_fe_rmw(qdma->eth, REG_GDM_LEN_CFG(port->id),
+			      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
+			      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
+			      FIELD_PREP(GDM_LONG_LEN_MASK, len));
+	atomic_inc(&port->users);
 
 	airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
 			GLOBAL_CFG_TX_DMA_EN_MASK |
@@ -1688,18 +1693,18 @@ static int airoha_dev_stop(struct net_device *netdev)
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_gdm_port *port = dev->port;
 	struct airoha_qdma *qdma = dev->qdma;
-	int i, err;
+	int i;
 
 	netif_tx_disable(netdev);
-	err = airoha_set_vip_for_gdm_port(dev, false);
-	if (err)
-		return err;
-
 	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++)
 		netdev_tx_reset_subqueue(netdev, i);
 
-	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
-				    FE_PSE_PORT_DROP);
+	if (atomic_dec_and_test(&port->users)) {
+		airoha_set_vip_for_gdm_port(dev, false);
+		airoha_set_gdm_port_fwd_cfg(qdma->eth,
+					    REG_GDM_FWD_CFG(port->id),
+					    FE_PSE_PORT_DROP);
+	}
 
 	if (atomic_dec_and_test(&qdma->users)) {
 		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
@@ -1851,10 +1856,22 @@ static void airoha_dev_get_stats64(struct net_device *netdev,
 static int airoha_dev_change_mtu(struct net_device *netdev, int mtu)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+	u32 cur_len, len = ETH_HLEN + mtu + ETH_FCS_LEN;
 	struct airoha_gdm_port *port = dev->port;
-	u32 len = ETH_HLEN + mtu + ETH_FCS_LEN;
 	struct airoha_eth *eth = dev->eth;
 
+	cur_len = FIELD_GET(GDM_LONG_LEN_MASK,
+			    airoha_fe_rr(eth, REG_GDM_LEN_CFG(port->id)));
+	if (len < cur_len) {
+		u8 port_refcnt = atomic_read(&port->users);
+
+		/* We can decrease the device MTU just if the GDM port is
+		 * not shared or if the other device is not running.
+		 */
+		if (port_refcnt > 1 || (port_refcnt && !netif_running(netdev)))
+			return -EBUSY;
+	}
+
 	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(port->id),
 		      GDM_LONG_LEN_MASK,
 		      FIELD_PREP(GDM_LONG_LEN_MASK, len));
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 5ce71aff6c39..3e77bbae630a 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -546,6 +546,8 @@ struct airoha_gdm_port {
 	struct airoha_gdm_dev *devs[AIROHA_MAX_NUM_GDM_DEVS];
 	int id;
 
+	atomic_t users;
+
 	struct airoha_hw_stats stats;
 
 	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);

-- 
2.53.0



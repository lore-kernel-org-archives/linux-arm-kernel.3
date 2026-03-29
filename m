Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A080F3D606
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 13:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRETDmM3m9pagQ2pSvdyU3Gg7ipb7jKyK6QSJNKKqQE=; b=Osdvwej0pKgwzetpGL9J3JTWbF
	gZuT68lyPp7jrhdBd4hv1zcMCzWKVWlULmFt/yKY7AwGxe4ggJtF5ylU7VSvNtsBOQCIsvl6sNwAA
	zb0rMwTbqcMmXVvHgt412g3upupDmVkEjpcAUcfkBuHhw7i52zXQfJkOvpHZ7/t+if+TGkGNRGCdu
	YLXd4ZqxujzCCLawf1nQ6N9VnSrv0xlUXA+oN6o/Dl6m5/sUUmRincDcTBK2v2fQZSUspkuqKMdR/
	CtU1hY1sW/yN0OBmzGF3Np+eD0lfjgnKBRsdt6BzQTdiPTujQq2t9rPYiV0LKp9QOO5IOA/wh29pA
	ADqJgrWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6pso-00000009x45-2ZRx;
	Sun, 29 Mar 2026 13:08:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6psV-00000009wpJ-2zJj;
	Sun, 29 Mar 2026 13:08:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 186E560121;
	Sun, 29 Mar 2026 13:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6E4C2BC9E;
	Sun, 29 Mar 2026 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774789710;
	bh=3/eiCf6s7hG55KqKjDthk+1/+XnzTOVR0dFPZI8ns4w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TixviWJLWx5qe3F9HCNN7NXHbLOEazU+PiZmYGGxbajQ2CfQ8L0UcJIDiZPzYKN7D
	 AAaB8G3aJBa2h5M7jZqT4PDfoStaGJ79eeVMXJPitX254xoVfiqiWppEz2HEwSEo37
	 2RHaCiZY1ic0BLPnqXFJD7KSuRCs2xxom9vjehCYAtvZaYDGhFuHjuB80vBSEde28T
	 kAvoE5Pngsf1d5C6cUFHw05wmysPhc66S6bPokKJHLolpOJSSSklKzZcvP0+CBtya3
	 BTKq+GkRgtJwkRM11wywUlFSLMLVRPR5Mg6HJ6o3FSW0X7+eCZhjZERglRHqqjRWCn
	 pHCtPsV92yytQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 29 Mar 2026 15:07:56 +0200
Subject: [PATCH net-next 06/10] net: airoha: Move airoha_qdma pointer in
 airoha_gdm_dev struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-airoha-eth-multi-serdes-v1-6-00f52dc360ca@kernel.org>
References: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
In-Reply-To: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>
X-Mailer: b4 0.14.2
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

Move airoha_qdma pointer from airoha_gdm_port struct to airoha_gdm_dev
one since the QDMA block used depends on the particular net_device
WAN/LAN configuration and in the current codebase net_device pointer is
associated to airoha_gdm_dev struct.
This is a preliminary patch to support multiple net_devices connected
to the same GDM{3,4} port via an external hw multiplexer.

Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 95 +++++++++++++++-----------------
 drivers/net/ethernet/airoha/airoha_eth.h |  8 +--
 drivers/net/ethernet/airoha/airoha_ppe.c | 17 +++---
 3 files changed, 58 insertions(+), 62 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 2ad86cad89ce3cbdf2a1f881dad124af8a96961a..b56a3a1668cd36deb808e53a5e90204b1e9c1d98 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -71,9 +71,10 @@ static void airoha_qdma_irq_disable(struct airoha_irq_bank *irq_bank,
 	airoha_qdma_set_irqmask(irq_bank, index, mask, 0);
 }
 
-static void airoha_set_macaddr(struct airoha_gdm_port *port, const u8 *addr)
+static void airoha_set_macaddr(struct airoha_gdm_dev *dev, const u8 *addr)
 {
-	struct airoha_eth *eth = port->qdma->eth;
+	struct airoha_gdm_port *port = dev->port;
+	struct airoha_eth *eth = dev->eth;
 	u32 val, reg;
 
 	reg = airoha_is_lan_gdm_port(port) ? REG_FE_LAN_MAC_H
@@ -85,7 +86,7 @@ static void airoha_set_macaddr(struct airoha_gdm_port *port, const u8 *addr)
 	airoha_fe_wr(eth, REG_FE_MAC_LMIN(reg), val);
 	airoha_fe_wr(eth, REG_FE_MAC_LMAX(reg), val);
 
-	airoha_ppe_init_upd_mem(port);
+	airoha_ppe_init_upd_mem(dev);
 }
 
 static void airoha_set_gdm_port_fwd_cfg(struct airoha_eth *eth, u32 addr,
@@ -101,10 +102,10 @@ static void airoha_set_gdm_port_fwd_cfg(struct airoha_eth *eth, u32 addr,
 		      FIELD_PREP(GDM_UCFQ_MASK, val));
 }
 
-static int airoha_set_vip_for_gdm_port(struct airoha_gdm_port *port,
-				       bool enable)
+static int airoha_set_vip_for_gdm_port(struct airoha_gdm_dev *dev, bool enable)
 {
-	struct airoha_eth *eth = port->qdma->eth;
+	struct airoha_gdm_port *port = dev->port;
+	struct airoha_eth *eth = dev->eth;
 	u32 vip_port;
 
 	switch (port->id) {
@@ -1480,9 +1481,10 @@ static void airoha_qdma_stop_napi(struct airoha_qdma *qdma)
 	}
 }
 
-static void airoha_update_hw_stats(struct airoha_gdm_port *port)
+static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
 {
-	struct airoha_eth *eth = port->qdma->eth;
+	struct airoha_gdm_port *port = dev->port;
+	struct airoha_eth *eth = dev->eth;
 	u32 val, i = 0;
 
 	spin_lock(&port->stats.lock);
@@ -1629,11 +1631,11 @@ static int airoha_dev_open(struct net_device *netdev)
 	int err, len = ETH_HLEN + netdev->mtu + ETH_FCS_LEN;
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_gdm_port *port = dev->port;
-	struct airoha_qdma *qdma = port->qdma;
+	struct airoha_qdma *qdma = dev->qdma;
 	u32 pse_port = FE_PSE_PORT_PPE1;
 
 	netif_tx_start_all_queues(netdev);
-	err = airoha_set_vip_for_gdm_port(port, true);
+	err = airoha_set_vip_for_gdm_port(dev, true);
 	if (err)
 		return err;
 
@@ -1669,11 +1671,11 @@ static int airoha_dev_stop(struct net_device *netdev)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_gdm_port *port = dev->port;
-	struct airoha_qdma *qdma = port->qdma;
+	struct airoha_qdma *qdma = dev->qdma;
 	int i, err;
 
 	netif_tx_disable(netdev);
-	err = airoha_set_vip_for_gdm_port(port, false);
+	err = airoha_set_vip_for_gdm_port(dev, false);
 	if (err)
 		return err;
 
@@ -1702,21 +1704,21 @@ static int airoha_dev_stop(struct net_device *netdev)
 static int airoha_dev_set_macaddr(struct net_device *netdev, void *p)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
-	struct airoha_gdm_port *port = dev->port;
 	int err;
 
 	err = eth_mac_addr(netdev, p);
 	if (err)
 		return err;
 
-	airoha_set_macaddr(port, netdev->dev_addr);
+	airoha_set_macaddr(dev, netdev->dev_addr);
 
 	return 0;
 }
 
-static int airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
+static int airhoha_set_gdm2_loopback(struct airoha_gdm_dev *dev)
 {
-	struct airoha_eth *eth = port->qdma->eth;
+	struct airoha_gdm_port *port = dev->port;
+	struct airoha_eth *eth = dev->eth;
 	u32 val, pse_port, chan, nbq;
 	int src_port;
 
@@ -1780,9 +1782,9 @@ static int airoha_dev_init(struct net_device *netdev)
 	int i;
 
 	/* QDMA0 is used for lan ports while QDMA1 is used for WAN ports */
-	port->qdma = &eth->qdma[!airoha_is_lan_gdm_port(port)];
-	dev->dev->irq = port->qdma->irq_banks[0].irq;
-	airoha_set_macaddr(port, netdev->dev_addr);
+	dev->qdma = &eth->qdma[!airoha_is_lan_gdm_port(port)];
+	dev->dev->irq = dev->qdma->irq_banks[0].irq;
+	airoha_set_macaddr(dev, netdev->dev_addr);
 
 	switch (port->id) {
 	case AIROHA_GDM3_IDX:
@@ -1791,7 +1793,7 @@ static int airoha_dev_init(struct net_device *netdev)
 		if (!eth->ports[1]) {
 			int err;
 
-			err = airhoha_set_gdm2_loopback(port);
+			err = airhoha_set_gdm2_loopback(dev);
 			if (err)
 				return err;
 		}
@@ -1801,7 +1803,7 @@ static int airoha_dev_init(struct net_device *netdev)
 	}
 
 	for (i = 0; i < eth->soc->num_ppe; i++)
-		airoha_ppe_set_cpu_port(port, i);
+		airoha_ppe_set_cpu_port(dev, i);
 
 	return 0;
 }
@@ -1813,7 +1815,7 @@ static void airoha_dev_get_stats64(struct net_device *netdev,
 	struct airoha_gdm_port *port = dev->port;
 	unsigned int start;
 
-	airoha_update_hw_stats(port);
+	airoha_update_hw_stats(dev);
 	do {
 		start = u64_stats_fetch_begin(&port->stats.syncp);
 		storage->rx_packets = port->stats.rx_ok_pkts;
@@ -1833,8 +1835,8 @@ static int airoha_dev_change_mtu(struct net_device *netdev, int mtu)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_gdm_port *port = dev->port;
-	struct airoha_eth *eth = port->qdma->eth;
 	u32 len = ETH_HLEN + mtu + ETH_FCS_LEN;
+	struct airoha_eth *eth = dev->eth;
 
 	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(port->id),
 		      GDM_LONG_LEN_MASK,
@@ -1908,10 +1910,10 @@ static u32 airoha_get_dsa_tag(struct sk_buff *skb, struct net_device *dev)
 #endif
 }
 
-int airoha_get_fe_port(struct airoha_gdm_port *port)
+int airoha_get_fe_port(struct airoha_gdm_dev *dev)
 {
-	struct airoha_qdma *qdma = port->qdma;
-	struct airoha_eth *eth = qdma->eth;
+	struct airoha_gdm_port *port = dev->port;
+	struct airoha_eth *eth = dev->eth;
 
 	switch (eth->soc->version) {
 	case 0x7583:
@@ -1928,8 +1930,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 				   struct net_device *netdev)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
-	struct airoha_gdm_port *port = dev->port;
-	struct airoha_qdma *qdma = port->qdma;
+	struct airoha_qdma *qdma = dev->qdma;
 	u32 nr_frags, tag, msg0, msg1, len;
 	struct airoha_queue_entry *e;
 	struct netdev_queue *txq;
@@ -1967,7 +1968,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 		}
 	}
 
-	fport = airoha_get_fe_port(port);
+	fport = airoha_get_fe_port(dev);
 	msg1 = FIELD_PREP(QDMA_ETH_TXMSG_FPORT_MASK, fport) |
 	       FIELD_PREP(QDMA_ETH_TXMSG_METER_MASK, 0x7f);
 
@@ -2067,8 +2068,7 @@ static void airoha_ethtool_get_drvinfo(struct net_device *netdev,
 				       struct ethtool_drvinfo *info)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
-	struct airoha_gdm_port *port = dev->port;
-	struct airoha_eth *eth = port->qdma->eth;
+	struct airoha_eth *eth = dev->eth;
 
 	strscpy(info->driver, eth->dev->driver->name, sizeof(info->driver));
 	strscpy(info->bus_info, dev_name(eth->dev), sizeof(info->bus_info));
@@ -2081,7 +2081,7 @@ static void airoha_ethtool_get_mac_stats(struct net_device *netdev,
 	struct airoha_gdm_port *port = dev->port;
 	unsigned int start;
 
-	airoha_update_hw_stats(port);
+	airoha_update_hw_stats(dev);
 	do {
 		start = u64_stats_fetch_begin(&port->stats.syncp);
 		stats->FramesTransmittedOK = port->stats.tx_ok_pkts;
@@ -2121,7 +2121,7 @@ airoha_ethtool_get_rmon_stats(struct net_device *netdev,
 		     ARRAY_SIZE(hw_stats->rx_len) + 1);
 
 	*ranges = airoha_ethtool_rmon_ranges;
-	airoha_update_hw_stats(port);
+	airoha_update_hw_stats(dev);
 	do {
 		int i;
 
@@ -2141,18 +2141,17 @@ static int airoha_qdma_set_chan_tx_sched(struct net_device *netdev,
 					 const u16 *weights, u8 n_weights)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
-	struct airoha_gdm_port *port = dev->port;
 	int i;
 
 	for (i = 0; i < AIROHA_NUM_TX_RING; i++)
-		airoha_qdma_clear(port->qdma, REG_QUEUE_CLOSE_CFG(channel),
+		airoha_qdma_clear(dev->qdma, REG_QUEUE_CLOSE_CFG(channel),
 				  TXQ_DISABLE_CHAN_QUEUE_MASK(channel, i));
 
 	for (i = 0; i < n_weights; i++) {
 		u32 status;
 		int err;
 
-		airoha_qdma_wr(port->qdma, REG_TXWRR_WEIGHT_CFG,
+		airoha_qdma_wr(dev->qdma, REG_TXWRR_WEIGHT_CFG,
 			       TWRR_RW_CMD_MASK |
 			       FIELD_PREP(TWRR_CHAN_IDX_MASK, channel) |
 			       FIELD_PREP(TWRR_QUEUE_IDX_MASK, i) |
@@ -2160,13 +2159,12 @@ static int airoha_qdma_set_chan_tx_sched(struct net_device *netdev,
 		err = read_poll_timeout(airoha_qdma_rr, status,
 					status & TWRR_RW_CMD_DONE,
 					USEC_PER_MSEC, 10 * USEC_PER_MSEC,
-					true, port->qdma,
-					REG_TXWRR_WEIGHT_CFG);
+					true, dev->qdma, REG_TXWRR_WEIGHT_CFG);
 		if (err)
 			return err;
 	}
 
-	airoha_qdma_rmw(port->qdma, REG_CHAN_QOS_MODE(channel >> 3),
+	airoha_qdma_rmw(dev->qdma, REG_CHAN_QOS_MODE(channel >> 3),
 			CHAN_QOS_MODE_MASK(channel),
 			__field_prep(CHAN_QOS_MODE_MASK(channel), mode));
 
@@ -2232,9 +2230,9 @@ static int airoha_qdma_get_tx_ets_stats(struct net_device *netdev, int channel,
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_gdm_port *port = dev->port;
 
-	u64 cpu_tx_packets = airoha_qdma_rr(port->qdma,
+	u64 cpu_tx_packets = airoha_qdma_rr(dev->qdma,
 					    REG_CNTR_VAL(channel << 1));
-	u64 fwd_tx_packets = airoha_qdma_rr(port->qdma,
+	u64 fwd_tx_packets = airoha_qdma_rr(dev->qdma,
 					    REG_CNTR_VAL((channel << 1) + 1));
 	u64 tx_packets = (cpu_tx_packets - port->cpu_tx_packets) +
 			 (fwd_tx_packets - port->fwd_tx_packets);
@@ -2497,17 +2495,16 @@ static int airoha_qdma_set_tx_rate_limit(struct net_device *netdev,
 					 u32 bucket_size)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
-	struct airoha_gdm_port *port = dev->port;
 	int i, err;
 
 	for (i = 0; i <= TRTCM_PEAK_MODE; i++) {
-		err = airoha_qdma_set_trtcm_config(port->qdma, channel,
+		err = airoha_qdma_set_trtcm_config(dev->qdma, channel,
 						   REG_EGRESS_TRTCM_CFG, i,
 						   !!rate, TRTCM_METER_MODE);
 		if (err)
 			return err;
 
-		err = airoha_qdma_set_trtcm_token_bucket(port->qdma, channel,
+		err = airoha_qdma_set_trtcm_token_bucket(dev->qdma, channel,
 							 REG_EGRESS_TRTCM_CFG,
 							 i, rate, bucket_size);
 		if (err)
@@ -2557,11 +2554,11 @@ static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
 	return 0;
 }
 
-static int airoha_qdma_set_rx_meter(struct airoha_gdm_port *port,
+static int airoha_qdma_set_rx_meter(struct airoha_gdm_dev *dev,
 				    u32 rate, u32 bucket_size,
 				    enum trtcm_unit_type unit_type)
 {
-	struct airoha_qdma *qdma = port->qdma;
+	struct airoha_qdma *qdma = dev->qdma;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(qdma->q_rx); i++) {
@@ -2640,7 +2637,6 @@ static int airoha_dev_tc_matchall(struct net_device *netdev,
 {
 	enum trtcm_unit_type unit_type = TRTCM_BYTE_UNIT;
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
-	struct airoha_gdm_port *port = dev->port;
 	u32 rate = 0, bucket_size = 0;
 
 	switch (f->command) {
@@ -2665,7 +2661,7 @@ static int airoha_dev_tc_matchall(struct net_device *netdev,
 		fallthrough;
 	}
 	case TC_CLSMATCHALL_DESTROY:
-		return airoha_qdma_set_rx_meter(port, rate, bucket_size,
+		return airoha_qdma_set_rx_meter(dev, rate, bucket_size,
 						unit_type);
 	default:
 		return -EOPNOTSUPP;
@@ -2677,8 +2673,7 @@ static int airoha_dev_setup_tc_block_cb(enum tc_setup_type type,
 {
 	struct net_device *netdev = cb_priv;
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
-	struct airoha_gdm_port *port = dev->port;
-	struct airoha_eth *eth = port->qdma->eth;
+	struct airoha_eth *eth = dev->eth;
 
 	if (!tc_can_offload(netdev))
 		return -EOPNOTSUPP;
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index b2598b4ee53e1f5c7a3274f0b9ac2d5bf12318fc..222ae993435e8cf080278958e92d98c58d5f5f92 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -534,12 +534,12 @@ struct airoha_qdma {
 
 struct airoha_gdm_dev {
 	struct airoha_gdm_port *port;
+	struct airoha_qdma *qdma;
 	struct net_device *dev;
 	struct airoha_eth *eth;
 };
 
 struct airoha_gdm_port {
-	struct airoha_qdma *qdma;
 	struct airoha_gdm_dev *dev;
 	int id;
 
@@ -652,18 +652,18 @@ static inline bool airoha_is_7583(struct airoha_eth *eth)
 	return eth->soc->version == 0x7583;
 }
 
-int airoha_get_fe_port(struct airoha_gdm_port *port);
+int airoha_get_fe_port(struct airoha_gdm_dev *dev);
 bool airoha_is_valid_gdm_dev(struct airoha_eth *eth,
 			     struct airoha_gdm_dev *dev);
 
-void airoha_ppe_set_cpu_port(struct airoha_gdm_port *port, u8 ppe_id);
+void airoha_ppe_set_cpu_port(struct airoha_gdm_dev *dev, u8 ppe_id);
 bool airoha_ppe_is_enabled(struct airoha_eth *eth, int index);
 void airoha_ppe_check_skb(struct airoha_ppe_dev *dev, struct sk_buff *skb,
 			  u16 hash, bool rx_wlan);
 int airoha_ppe_setup_tc_block_cb(struct airoha_ppe_dev *dev, void *type_data);
 int airoha_ppe_init(struct airoha_eth *eth);
 void airoha_ppe_deinit(struct airoha_eth *eth);
-void airoha_ppe_init_upd_mem(struct airoha_gdm_port *port);
+void airoha_ppe_init_upd_mem(struct airoha_gdm_dev *dev);
 u32 airoha_ppe_get_total_num_entries(struct airoha_ppe *ppe);
 struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
 						  u32 hash);
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 69b449837d201bfd8f182ae18d788ca69c5daf47..eb8b7ed76fed5f36ad77886f5537a73eba0f0624 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -85,10 +85,10 @@ static u32 airoha_ppe_get_timestamp(struct airoha_ppe *ppe)
 	return FIELD_GET(AIROHA_FOE_IB1_BIND_TIMESTAMP, timestamp);
 }
 
-void airoha_ppe_set_cpu_port(struct airoha_gdm_port *port, u8 ppe_id)
+void airoha_ppe_set_cpu_port(struct airoha_gdm_dev *dev, u8 ppe_id)
 {
-	struct airoha_qdma *qdma = port->qdma;
-	u8 fport = airoha_get_fe_port(port);
+	struct airoha_qdma *qdma = dev->qdma;
+	u8 fport = airoha_get_fe_port(dev);
 	struct airoha_eth *eth = qdma->eth;
 	u8 qdma_id = qdma - &eth->qdma[0];
 	u32 fe_cpu_port;
@@ -174,7 +174,7 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 			if (!port)
 				continue;
 
-			airoha_ppe_set_cpu_port(port, i);
+			airoha_ppe_set_cpu_port(port->dev, i);
 		}
 	}
 }
@@ -1430,11 +1430,12 @@ void airoha_ppe_check_skb(struct airoha_ppe_dev *dev, struct sk_buff *skb,
 	airoha_ppe_foe_insert_entry(ppe, skb, hash, rx_wlan);
 }
 
-void airoha_ppe_init_upd_mem(struct airoha_gdm_port *port)
+void airoha_ppe_init_upd_mem(struct airoha_gdm_dev *dev)
 {
-	struct airoha_eth *eth = port->qdma->eth;
-	struct net_device *dev = port->dev->dev;
-	const u8 *addr = dev->dev_addr;
+	struct airoha_gdm_port *port = dev->port;
+	struct net_device *netdev = dev->dev;
+	struct airoha_eth *eth = dev->eth;
+	const u8 *addr = netdev->dev_addr;
 	u32 val;
 
 	val = (addr[2] << 24) | (addr[3] << 16) | (addr[4] << 8) | addr[5];

-- 
2.53.0



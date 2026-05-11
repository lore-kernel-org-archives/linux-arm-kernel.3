Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F34ACD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 10:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45B19tzlcb1eQxq5RCHV443ZWMwDzZJUp0XGjAZ3iYQ=; b=UKZAye+M+//B9r2S5lUroDteon
	f+05hMOsrASlrVdP4iH4xw66IiuSZnG5uiJysPg8WywonQ52ckXQPDHhwknUVe8rD9xd1ijQdfmbf
	NzJi2g7h99KR1NODXTapstsGIqSYa4hkdGelu/7P5I7fLrtyGBupltQkEUsgDFo1+zDhQFNHt1PoV
	Qq++7RrP15xIBz+lDakP0kJvMzpJaAChbWoWBTYCGLViH/Wgorqfe1srGY8D6Eao3aQUYjicPMKe0
	yn2FntX+ebzujd/zTzTWK+4V0wbT2j52dYXj9nIGNPKlVRGOblUs3DGaS/jiqT4zKCjjlsYmf8way
	/cf/8ezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMODi-0000000DAwY-2Nql;
	Mon, 11 May 2026 10:50:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMODP-0000000DAXj-34Cv;
	Mon, 11 May 2026 10:50:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 24F78600CB;
	Mon, 11 May 2026 10:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5077AC2BCFA;
	Mon, 11 May 2026 10:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778496622;
	bh=LHuLiEolYKUzxJUo+YmvV8UYqrSTqc7J321GJlxqssU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YtcaN6MRexdPS5DOMZXFrIcMP5oTYKkVuigSIe5ECDg/ANoCqXsgULSvQCuwqGaCt
	 lTCdzDyHy0FcYVENCzNIkVd9U9fA8DR4qPQ/YJXFJTEmLR/GTnHp6rxxmFWn/8Bn6D
	 QOlyJzWGGywl6WYo3iPaArg+jx3hmcmdmEkCcAkcm+/4rIgWGmsxVGXqjDgT4cN61R
	 EKEemRH/ZmWaZxBSza2hXTvQfKM58ipgFnzhP0hiA4ys5++GBtCI6cGmB/Lrg2LANW
	 jo675R6DvKuVkp6ITfNx6Tde4eXiUEDjJHZJQW1SAO6LnugujKuFRypMDmrS0uf6RS
	 bEF+cXFZ9ftyw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 11 May 2026 12:49:38 +0200
Subject: [PATCH net-next v6 12/12] net: airoha: Better handle MIB for GDM
 with multiple port attached
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-airoha-eth-multi-serdes-v6-12-c899462c4f75@kernel.org>
References: <20260511-airoha-eth-multi-serdes-v6-0-c899462c4f75@kernel.org>
In-Reply-To: <20260511-airoha-eth-multi-serdes-v6-0-c899462c4f75@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Brown Huang <Brown.huang@airoha.com>
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

From: Christian Marangi <ansuelsmth@gmail.com>

In the context of a GDM that can have multiple port attached (GDM3/4)
the HW counter (MIB) are global for the GDM port. This cause duplicated
stats reported to the kernel for the related interface.

The SoC supports a split MIB feature where each counter is tracked based
on the relevant HW channel (NBQ) to account for this scenario and
provide a way to select the related counter on accessing the MIB
registers.

Enable this feature for GDM3 and GDM4 and configure the relevant HW
channel before updating the HW stats to report correct HW counter to the
kernel for the related interface.

Also move the stats struct from port to dev since HW counter are
now specific to the network interface instead of the GDM port.

Co-developed-by: Brown Huang <Brown.huang@airoha.com>
Signed-off-by: Brown Huang <Brown.huang@airoha.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 173 ++++++++++++++++---------------
 drivers/net/ethernet/airoha/airoha_eth.h |   7 +-
 2 files changed, 93 insertions(+), 87 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 533ffe20f833..27ccc636d800 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1621,143 +1621,146 @@ static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
 	struct airoha_eth *eth = dev->eth;
 	u32 val, i = 0;
 
-	spin_lock(&port->stats.lock);
-	u64_stats_update_begin(&port->stats.syncp);
+	spin_lock(&port->stats_lock);
+	u64_stats_update_begin(&dev->stats.syncp);
+
+	/* Read relevant MIB for GDM with multiple port attached */
+	if (port->id == AIROHA_GDM3_IDX || port->id == AIROHA_GDM4_IDX)
+		airoha_fe_rmw(eth, REG_FE_GDM_MIB_CFG(port->id),
+			      FE_TX_MIB_ID_MASK | FE_RX_MIB_ID_MASK,
+			      FIELD_PREP(FE_TX_MIB_ID_MASK, dev->nbq) |
+			      FIELD_PREP(FE_RX_MIB_ID_MASK, dev->nbq));
 
 	/* TX */
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
-	port->stats.tx_ok_pkts += ((u64)val << 32);
+	dev->stats.tx_ok_pkts = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
-	port->stats.tx_ok_pkts += val;
+	dev->stats.tx_ok_pkts += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_H(port->id));
-	port->stats.tx_ok_bytes += ((u64)val << 32);
+	dev->stats.tx_ok_bytes = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_L(port->id));
-	port->stats.tx_ok_bytes += val;
+	dev->stats.tx_ok_bytes += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_DROP_CNT(port->id));
-	port->stats.tx_drops += val;
+	dev->stats.tx_drops = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_BC_CNT(port->id));
-	port->stats.tx_broadcast += val;
+	dev->stats.tx_broadcast = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_MC_CNT(port->id));
-	port->stats.tx_multicast += val;
+	dev->stats.tx_multicast = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_RUNT_CNT(port->id));
-	port->stats.tx_len[i] += val;
+	dev->stats.tx_len[i] = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_H(port->id));
-	port->stats.tx_len[i] += ((u64)val << 32);
+	dev->stats.tx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_L(port->id));
-	port->stats.tx_len[i++] += val;
+	dev->stats.tx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_H(port->id));
-	port->stats.tx_len[i] += ((u64)val << 32);
+	dev->stats.tx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_L(port->id));
-	port->stats.tx_len[i++] += val;
+	dev->stats.tx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_H(port->id));
-	port->stats.tx_len[i] += ((u64)val << 32);
+	dev->stats.tx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_L(port->id));
-	port->stats.tx_len[i++] += val;
+	dev->stats.tx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_H(port->id));
-	port->stats.tx_len[i] += ((u64)val << 32);
+	dev->stats.tx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_L(port->id));
-	port->stats.tx_len[i++] += val;
+	dev->stats.tx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_H(port->id));
-	port->stats.tx_len[i] += ((u64)val << 32);
+	dev->stats.tx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_L(port->id));
-	port->stats.tx_len[i++] += val;
+	dev->stats.tx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_H(port->id));
-	port->stats.tx_len[i] += ((u64)val << 32);
+	dev->stats.tx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_L(port->id));
-	port->stats.tx_len[i++] += val;
+	dev->stats.tx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_LONG_CNT(port->id));
-	port->stats.tx_len[i++] += val;
+	dev->stats.tx_len[i++] = val;
 
 	/* RX */
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_H(port->id));
-	port->stats.rx_ok_pkts += ((u64)val << 32);
+	dev->stats.rx_ok_pkts = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_L(port->id));
-	port->stats.rx_ok_pkts += val;
+	dev->stats.rx_ok_pkts += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_H(port->id));
-	port->stats.rx_ok_bytes += ((u64)val << 32);
+	dev->stats.rx_ok_bytes = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_L(port->id));
-	port->stats.rx_ok_bytes += val;
+	dev->stats.rx_ok_bytes += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_DROP_CNT(port->id));
-	port->stats.rx_drops += val;
+	dev->stats.rx_drops = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_BC_CNT(port->id));
-	port->stats.rx_broadcast += val;
+	dev->stats.rx_broadcast = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_MC_CNT(port->id));
-	port->stats.rx_multicast += val;
+	dev->stats.rx_multicast = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ERROR_DROP_CNT(port->id));
-	port->stats.rx_errors += val;
+	dev->stats.rx_errors = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_CRC_ERR_CNT(port->id));
-	port->stats.rx_crc_error += val;
+	dev->stats.rx_crc_error = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OVERFLOW_DROP_CNT(port->id));
-	port->stats.rx_over_errors += val;
+	dev->stats.rx_over_errors = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_FRAG_CNT(port->id));
-	port->stats.rx_fragment += val;
+	dev->stats.rx_fragment = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_JABBER_CNT(port->id));
-	port->stats.rx_jabber += val;
+	dev->stats.rx_jabber = val;
 
 	i = 0;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_RUNT_CNT(port->id));
-	port->stats.rx_len[i] += val;
+	dev->stats.rx_len[i] = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_H(port->id));
-	port->stats.rx_len[i] += ((u64)val << 32);
+	dev->stats.rx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_L(port->id));
-	port->stats.rx_len[i++] += val;
+	dev->stats.rx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_H(port->id));
-	port->stats.rx_len[i] += ((u64)val << 32);
+	dev->stats.rx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_L(port->id));
-	port->stats.rx_len[i++] += val;
+	dev->stats.rx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_H(port->id));
-	port->stats.rx_len[i] += ((u64)val << 32);
+	dev->stats.rx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_L(port->id));
-	port->stats.rx_len[i++] += val;
+	dev->stats.rx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_H(port->id));
-	port->stats.rx_len[i] += ((u64)val << 32);
+	dev->stats.rx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_L(port->id));
-	port->stats.rx_len[i++] += val;
+	dev->stats.rx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_H(port->id));
-	port->stats.rx_len[i] += ((u64)val << 32);
+	dev->stats.rx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_L(port->id));
-	port->stats.rx_len[i++] += val;
+	dev->stats.rx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_H(port->id));
-	port->stats.rx_len[i] += ((u64)val << 32);
+	dev->stats.rx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_L(port->id));
-	port->stats.rx_len[i++] += val;
+	dev->stats.rx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_LONG_CNT(port->id));
-	port->stats.rx_len[i++] += val;
-
-	/* reset mib counters */
-	airoha_fe_set(eth, REG_FE_GDM_MIB_CLEAR(port->id),
-		      FE_GDM_MIB_RX_CLEAR_MASK | FE_GDM_MIB_TX_CLEAR_MASK);
+	dev->stats.rx_len[i++] = val;
 
-	u64_stats_update_end(&port->stats.syncp);
-	spin_unlock(&port->stats.lock);
+	u64_stats_update_end(&dev->stats.syncp);
+	spin_unlock(&port->stats_lock);
 }
 
 static int airoha_dev_open(struct net_device *netdev)
@@ -1984,6 +1987,11 @@ static int airoha_dev_init(struct net_device *netdev)
 	case AIROHA_GDM4_IDX: {
 		struct airoha_eth *eth = dev->eth;
 
+		/* Enable split MIB for GDM with multiple port attached */
+		airoha_fe_set(eth, REG_FE_GDM_MIB_CFG(port->id),
+			      FE_GDM_TX_MIB_SPLIT_EN_MASK |
+			      FE_GDM_RX_MIB_SPLIT_EN_MASK);
+
 		/* GDM2 supports a single net_device */
 		if (eth->ports[1] && eth->ports[1]->devs[0])
 			break;
@@ -2022,23 +2030,22 @@ static void airoha_dev_get_stats64(struct net_device *netdev,
 				   struct rtnl_link_stats64 *storage)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
-	struct airoha_gdm_port *port = dev->port;
 	unsigned int start;
 
 	airoha_update_hw_stats(dev);
 	do {
-		start = u64_stats_fetch_begin(&port->stats.syncp);
-		storage->rx_packets = port->stats.rx_ok_pkts;
-		storage->tx_packets = port->stats.tx_ok_pkts;
-		storage->rx_bytes = port->stats.rx_ok_bytes;
-		storage->tx_bytes = port->stats.tx_ok_bytes;
-		storage->multicast = port->stats.rx_multicast;
-		storage->rx_errors = port->stats.rx_errors;
-		storage->rx_dropped = port->stats.rx_drops;
-		storage->tx_dropped = port->stats.tx_drops;
-		storage->rx_crc_errors = port->stats.rx_crc_error;
-		storage->rx_over_errors = port->stats.rx_over_errors;
-	} while (u64_stats_fetch_retry(&port->stats.syncp, start));
+		start = u64_stats_fetch_begin(&dev->stats.syncp);
+		storage->rx_packets = dev->stats.rx_ok_pkts;
+		storage->tx_packets = dev->stats.tx_ok_pkts;
+		storage->rx_bytes = dev->stats.rx_ok_bytes;
+		storage->tx_bytes = dev->stats.tx_ok_bytes;
+		storage->multicast = dev->stats.rx_multicast;
+		storage->rx_errors = dev->stats.rx_errors;
+		storage->rx_dropped = dev->stats.rx_drops;
+		storage->tx_dropped = dev->stats.tx_drops;
+		storage->rx_crc_errors = dev->stats.rx_crc_error;
+		storage->rx_over_errors = dev->stats.rx_over_errors;
+	} while (u64_stats_fetch_retry(&dev->stats.syncp, start));
 }
 
 static int airoha_dev_change_mtu(struct net_device *netdev, int mtu)
@@ -2297,20 +2304,19 @@ static void airoha_ethtool_get_mac_stats(struct net_device *netdev,
 					 struct ethtool_eth_mac_stats *stats)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
-	struct airoha_gdm_port *port = dev->port;
 	unsigned int start;
 
 	airoha_update_hw_stats(dev);
 	do {
-		start = u64_stats_fetch_begin(&port->stats.syncp);
-		stats->FramesTransmittedOK = port->stats.tx_ok_pkts;
-		stats->OctetsTransmittedOK = port->stats.tx_ok_bytes;
-		stats->MulticastFramesXmittedOK = port->stats.tx_multicast;
-		stats->BroadcastFramesXmittedOK = port->stats.tx_broadcast;
-		stats->FramesReceivedOK = port->stats.rx_ok_pkts;
-		stats->OctetsReceivedOK = port->stats.rx_ok_bytes;
-		stats->BroadcastFramesReceivedOK = port->stats.rx_broadcast;
-	} while (u64_stats_fetch_retry(&port->stats.syncp, start));
+		start = u64_stats_fetch_begin(&dev->stats.syncp);
+		stats->FramesTransmittedOK = dev->stats.tx_ok_pkts;
+		stats->OctetsTransmittedOK = dev->stats.tx_ok_bytes;
+		stats->MulticastFramesXmittedOK = dev->stats.tx_multicast;
+		stats->BroadcastFramesXmittedOK = dev->stats.tx_broadcast;
+		stats->FramesReceivedOK = dev->stats.rx_ok_pkts;
+		stats->OctetsReceivedOK = dev->stats.rx_ok_bytes;
+		stats->BroadcastFramesReceivedOK = dev->stats.rx_broadcast;
+	} while (u64_stats_fetch_retry(&dev->stats.syncp, start));
 }
 
 static const struct ethtool_rmon_hist_range airoha_ethtool_rmon_ranges[] = {
@@ -2330,8 +2336,7 @@ airoha_ethtool_get_rmon_stats(struct net_device *netdev,
 			      const struct ethtool_rmon_hist_range **ranges)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
-	struct airoha_gdm_port *port = dev->port;
-	struct airoha_hw_stats *hw_stats = &port->stats;
+	struct airoha_hw_stats *hw_stats = &dev->stats;
 	unsigned int start;
 
 	BUILD_BUG_ON(ARRAY_SIZE(airoha_ethtool_rmon_ranges) !=
@@ -2344,7 +2349,7 @@ airoha_ethtool_get_rmon_stats(struct net_device *netdev,
 	do {
 		int i;
 
-		start = u64_stats_fetch_begin(&port->stats.syncp);
+		start = u64_stats_fetch_begin(&dev->stats.syncp);
 		stats->fragments = hw_stats->rx_fragment;
 		stats->jabbers = hw_stats->rx_jabber;
 		for (i = 0; i < ARRAY_SIZE(airoha_ethtool_rmon_ranges) - 1;
@@ -2352,7 +2357,7 @@ airoha_ethtool_get_rmon_stats(struct net_device *netdev,
 			stats->hist[i] = hw_stats->rx_len[i];
 			stats->hist_tx[i] = hw_stats->tx_len[i];
 		}
-	} while (u64_stats_fetch_retry(&port->stats.syncp, start));
+	} while (u64_stats_fetch_retry(&dev->stats.syncp, start));
 }
 
 static int airoha_qdma_set_chan_tx_sched(struct net_device *netdev,
@@ -3189,6 +3194,7 @@ static int airoha_alloc_gdm_device(struct airoha_eth *eth,
 
 	netdev->dev.of_node = of_node_get(np);
 	dev = netdev_priv(netdev);
+	u64_stats_init(&dev->stats.syncp);
 	dev->dev = netdev;
 	dev->port = port;
 	dev->eth = eth;
@@ -3229,9 +3235,8 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 	if (!port)
 		return -ENOMEM;
 
-	u64_stats_init(&port->stats.syncp);
-	spin_lock_init(&port->stats.lock);
 	port->id = id;
+	spin_lock_init(&port->stats_lock);
 	eth->ports[p] = port;
 
 	err = airoha_metadata_dst_alloc(port);
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 364ca76eb3a6..1e9cd899b7cb 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -215,8 +215,6 @@ struct airoha_tx_irq_queue {
 };
 
 struct airoha_hw_stats {
-	/* protect concurrent hw_stats accesses */
-	spinlock_t lock;
 	struct u64_stats_sync syncp;
 
 	/* get_stats64 */
@@ -555,6 +553,8 @@ struct airoha_gdm_dev {
 
 	u32 flags;
 	int nbq;
+
+	struct airoha_hw_stats stats;
 };
 
 struct airoha_gdm_port {
@@ -562,7 +562,8 @@ struct airoha_gdm_port {
 	int id;
 	int users;
 
-	struct airoha_hw_stats stats;
+	/* protect concurrent hw_stats accesses */
+	spinlock_t stats_lock;
 
 	struct metadata_dst *dsa_meta[AIROHA_MAX_DSA_PORTS];
 };

-- 
2.54.0



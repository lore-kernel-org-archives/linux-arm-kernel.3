Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA34C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 11:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XIpWfDzbn8yZ4eRHvUyYWXNxfKhVPNleXCTKivS1iw=; b=qRPPtV49wwaV+p7S22OLI/LfYE
	jxFi+9aZ/6+mOqeEECjkrg/5tqRlctjheOQ14+X2PY3eVFeHnXAIiXykDm5AXnNIb0DV9/ssXnS3s
	VtYbwGHy3LG5oo2wUU9ZF9r4xcE37d7eRI8bWX6heA9D/zdU/xPnigmWzOYdiZOKrdh98zt/Uvw1x
	Tko3eHuQ2neCZ7TvYBNnuW5LxvJ0nlhW1FFOy9bYiFhhe5rKTXC+E28q9cs1NrP1KbQb5/KfF1MPv
	D2Sl2imQqF2HD09cxDAhIA3ElEaSlFDoyVEJ1mt/JfndH2AZr6qjB8mLWqL9Y5Ag23LqhaDmp01Z2
	VoVrecpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyYq-0000000AkuH-367f;
	Fri, 28 Feb 2025 11:29:44 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tny0x-0000000Af8N-3vW1;
	Fri, 28 Feb 2025 10:54:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AAEB661F60;
	Fri, 28 Feb 2025 10:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DB4C4CED6;
	Fri, 28 Feb 2025 10:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740740082;
	bh=zS4bOZ+gyG3ZRTUGL2dDyxk4AIVG5TMD0n0vNOQU3aU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eAGrs4OHn5z5XZQjc170EipCbm8/ZrgsC21dB3kZxETtYjgqQKx9ta81xMwso6pF8
	 l7npvmYINONDBl9U45o0k6184AleuqaJbXzbVVbe5LPvjhIS1tqMVrePKiojnt7gE7
	 DlBphqEDp9TC6X8vlURVUDMu2qa9/SjJoltuaKBxVSN81h0r0JQSuccqvhKXPlxBZM
	 x8Cx9CdL13G/HwLUYwvyZ7F/z7D6XNoZtFikw4PhZcfOtAgEUzzIzHGg4+FfOQzBj7
	 U2TfxZC85dEcLnEjfDDUcb7NigdbQ+Lbg4IMj5lgJYNV4WqsNlOQfSFE9zn4nSu5ov
	 aPB04uW+1qtbA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 28 Feb 2025 11:54:13 +0100
Subject: [PATCH net-next v8 05/15] net: airoha: Move DSA tag in DMA
 descriptor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-airoha-en7581-flowtable-offload-v8-5-01dc1653f46e@kernel.org>
References: <20250228-airoha-en7581-flowtable-offload-v8-0-01dc1653f46e@kernel.org>
In-Reply-To: <20250228-airoha-en7581-flowtable-offload-v8-0-01dc1653f46e@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 upstream@airoha.com, Sayantan Nandy <sayantan.nandy@airoha.com>
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

Packet Processor Engine (PPE) module reads DSA tags from the DMA descriptor
and requires untagged DSA packets to properly parse them. Move DSA tag
in the DMA descriptor on TX side and read DSA tag from DMA descriptor
on RX side. In order to avoid skb reallocation, store tag in skb_dst on
RX side.
This is a preliminary patch to enable netfilter flowtable hw offloading
on EN7581 SoC.

Tested-by: Sayantan Nandy <sayantan.nandy@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c  | 125 ++++++++++++++++++++++++++++--
 drivers/net/ethernet/airoha/airoha_eth.h  |   7 ++
 drivers/net/ethernet/airoha/airoha_regs.h |   2 +
 3 files changed, 128 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index b79556f1b4951c687aa89bc5839fc9405581a6c3..347fc403f2998b6303d05dbf9afc60cd02e9d1de 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -9,6 +9,7 @@
 #include <linux/tcp.h>
 #include <linux/u64_stats_sync.h>
 #include <net/dsa.h>
+#include <net/dst_metadata.h>
 #include <net/page_pool/helpers.h>
 #include <net/pkt_cls.h>
 #include <uapi/linux/ppp_defs.h>
@@ -656,6 +657,7 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 		struct airoha_qdma_desc *desc = &q->desc[q->tail];
 		dma_addr_t dma_addr = le32_to_cpu(desc->addr);
 		u32 desc_ctrl = le32_to_cpu(desc->ctrl);
+		struct airoha_gdm_port *port;
 		struct sk_buff *skb;
 		int len, p;
 
@@ -683,6 +685,7 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 			continue;
 		}
 
+		port = eth->ports[p];
 		skb = napi_build_skb(e->buf, q->buf_size);
 		if (!skb) {
 			page_pool_put_full_page(q->page_pool,
@@ -694,10 +697,26 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 		skb_reserve(skb, 2);
 		__skb_put(skb, len);
 		skb_mark_for_recycle(skb);
-		skb->dev = eth->ports[p]->dev;
+		skb->dev = port->dev;
 		skb->protocol = eth_type_trans(skb, skb->dev);
 		skb->ip_summed = CHECKSUM_UNNECESSARY;
 		skb_record_rx_queue(skb, qid);
+
+		if (netdev_uses_dsa(port->dev)) {
+			/* PPE module requires untagged packets to work
+			 * properly and it provides DSA port index via the
+			 * DMA descriptor. Report DSA tag to the DSA stack
+			 * via skb dst info.
+			 */
+			u32 sptag = FIELD_GET(QDMA_ETH_RXMSG_SPTAG,
+					      le32_to_cpu(desc->msg0));
+
+			if (sptag < ARRAY_SIZE(port->dsa_meta) &&
+			    port->dsa_meta[sptag])
+				skb_dst_set_noref(skb,
+						  &port->dsa_meta[sptag]->dst);
+		}
+
 		napi_gro_receive(&q->napi, skb);
 
 		done++;
@@ -1636,25 +1655,76 @@ static u16 airoha_dev_select_queue(struct net_device *dev, struct sk_buff *skb,
 	return queue < dev->num_tx_queues ? queue : 0;
 }
 
+static u32 airoha_get_dsa_tag(struct sk_buff *skb, struct net_device *dev)
+{
+#if IS_ENABLED(CONFIG_NET_DSA)
+	struct ethhdr *ehdr;
+	struct dsa_port *dp;
+	u8 xmit_tpid;
+	u16 tag;
+
+	if (!netdev_uses_dsa(dev))
+		return 0;
+
+	dp = dev->dsa_ptr;
+	if (IS_ERR(dp))
+		return 0;
+
+	if (dp->tag_ops->proto != DSA_TAG_PROTO_MTK)
+		return 0;
+
+	if (skb_cow_head(skb, 0))
+		return 0;
+
+	ehdr = (struct ethhdr *)skb->data;
+	tag = be16_to_cpu(ehdr->h_proto);
+	xmit_tpid = tag >> 8;
+
+	switch (xmit_tpid) {
+	case MTK_HDR_XMIT_TAGGED_TPID_8100:
+		ehdr->h_proto = cpu_to_be16(ETH_P_8021Q);
+		tag &= ~(MTK_HDR_XMIT_TAGGED_TPID_8100 << 8);
+		break;
+	case MTK_HDR_XMIT_TAGGED_TPID_88A8:
+		ehdr->h_proto = cpu_to_be16(ETH_P_8021AD);
+		tag &= ~(MTK_HDR_XMIT_TAGGED_TPID_88A8 << 8);
+		break;
+	default:
+		/* PPE module requires untagged DSA packets to work properly,
+		 * so move DSA tag to DMA descriptor.
+		 */
+		memmove(skb->data + MTK_HDR_LEN, skb->data, 2 * ETH_ALEN);
+		__skb_pull(skb, MTK_HDR_LEN);
+		break;
+	}
+
+	return tag;
+#else
+	return 0;
+#endif
+}
+
 static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 				   struct net_device *dev)
 {
 	struct airoha_gdm_port *port = netdev_priv(dev);
-	u32 nr_frags = 1 + skb_shinfo(skb)->nr_frags;
-	u32 msg0, msg1, len = skb_headlen(skb);
 	struct airoha_qdma *qdma = port->qdma;
+	u32 nr_frags, tag, msg0, msg1, len;
 	struct netdev_queue *txq;
 	struct airoha_queue *q;
-	void *data = skb->data;
+	void *data;
 	int i, qid;
 	u16 index;
 	u8 fport;
 
 	qid = skb_get_queue_mapping(skb) % ARRAY_SIZE(qdma->q_tx);
+	tag = airoha_get_dsa_tag(skb, dev);
+
 	msg0 = FIELD_PREP(QDMA_ETH_TXMSG_CHAN_MASK,
 			  qid / AIROHA_NUM_QOS_QUEUES) |
 	       FIELD_PREP(QDMA_ETH_TXMSG_QUEUE_MASK,
-			  qid % AIROHA_NUM_QOS_QUEUES);
+			  qid % AIROHA_NUM_QOS_QUEUES) |
+	       FIELD_PREP(QDMA_ETH_TXMSG_SP_TAG_MASK, tag);
 	if (skb->ip_summed == CHECKSUM_PARTIAL)
 		msg0 |= FIELD_PREP(QDMA_ETH_TXMSG_TCO_MASK, 1) |
 			FIELD_PREP(QDMA_ETH_TXMSG_UCO_MASK, 1) |
@@ -1685,6 +1755,8 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	spin_lock_bh(&q->lock);
 
 	txq = netdev_get_tx_queue(dev, qid);
+	nr_frags = 1 + skb_shinfo(skb)->nr_frags;
+
 	if (q->queued + nr_frags > q->ndesc) {
 		/* not enough space in the queue */
 		netif_tx_stop_queue(txq);
@@ -1692,7 +1764,10 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 		return NETDEV_TX_BUSY;
 	}
 
+	len = skb_headlen(skb);
+	data = skb->data;
 	index = q->head;
+
 	for (i = 0; i < nr_frags; i++) {
 		struct airoha_qdma_desc *desc = &q->desc[index];
 		struct airoha_queue_entry *e = &q->entry[index];
@@ -2226,6 +2301,37 @@ static const struct ethtool_ops airoha_ethtool_ops = {
 	.get_rmon_stats		= airoha_ethtool_get_rmon_stats,
 };
 
+static int airoha_metadata_dst_alloc(struct airoha_gdm_port *port)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(port->dsa_meta); i++) {
+		struct metadata_dst *md_dst;
+
+		md_dst = metadata_dst_alloc(0, METADATA_HW_PORT_MUX,
+					    GFP_KERNEL);
+		if (!md_dst)
+			return -ENOMEM;
+
+		md_dst->u.port_info.port_id = i;
+		port->dsa_meta[i] = md_dst;
+	}
+
+	return 0;
+}
+
+static void airoha_metadata_dst_free(struct airoha_gdm_port *port)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(port->dsa_meta); i++) {
+		if (!port->dsa_meta[i])
+			continue;
+
+		metadata_dst_free(port->dsa_meta[i]);
+	}
+}
+
 static int airoha_alloc_gdm_port(struct airoha_eth *eth, struct device_node *np)
 {
 	const __be32 *id_ptr = of_get_property(np, "reg", NULL);
@@ -2298,6 +2404,10 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth, struct device_node *np)
 	port->id = id;
 	eth->ports[index] = port;
 
+	err = airoha_metadata_dst_alloc(port);
+	if (err)
+		return err;
+
 	return register_netdev(dev);
 }
 
@@ -2390,8 +2500,10 @@ static int airoha_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
 		struct airoha_gdm_port *port = eth->ports[i];
 
-		if (port && port->dev->reg_state == NETREG_REGISTERED)
+		if (port && port->dev->reg_state == NETREG_REGISTERED) {
 			unregister_netdev(port->dev);
+			airoha_metadata_dst_free(port);
+		}
 	}
 	free_netdev(eth->napi_dev);
 	platform_set_drvdata(pdev, NULL);
@@ -2417,6 +2529,7 @@ static void airoha_remove(struct platform_device *pdev)
 
 		airoha_dev_stop(port->dev);
 		unregister_netdev(port->dev);
+		airoha_metadata_dst_free(port);
 	}
 	free_netdev(eth->napi_dev);
 
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 743aaf10235fe09fb2a91b491f4b25064ed8319b..fee6c10eaedfd30207205b6557e856091fd45d7e 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -15,6 +15,7 @@
 
 #define AIROHA_MAX_NUM_GDM_PORTS	1
 #define AIROHA_MAX_NUM_QDMA		2
+#define AIROHA_MAX_DSA_PORTS		7
 #define AIROHA_MAX_NUM_RSTS		3
 #define AIROHA_MAX_NUM_XSI_RSTS		5
 #define AIROHA_MAX_MTU			2000
@@ -43,6 +44,10 @@
 #define QDMA_METER_IDX(_n)		((_n) & 0xff)
 #define QDMA_METER_GROUP(_n)		(((_n) >> 8) & 0x3)
 
+#define MTK_HDR_LEN			4
+#define MTK_HDR_XMIT_TAGGED_TPID_8100	1
+#define MTK_HDR_XMIT_TAGGED_TPID_88A8	2
+
 enum {
 	QDMA_INT_REG_IDX0,
 	QDMA_INT_REG_IDX1,
@@ -231,6 +236,8 @@ struct airoha_gdm_port {
 	/* qos stats counters */
 	u64 cpu_tx_packets;
 	u64 fwd_tx_packets;
+
+	struct metadata_dst *dsa_meta[AIROHA_MAX_DSA_PORTS];
 };
 
 struct airoha_eth {
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 7c9dadb348834cb5a856760abe45e8221d6fd700..e467dd81ff44a9ad560226cab42b7431812f5fb9 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -624,6 +624,8 @@
 #define QDMA_ETH_TXMSG_ACNT_G1_MASK	GENMASK(10, 6)	/* 0x1f do not count */
 #define QDMA_ETH_TXMSG_ACNT_G0_MASK	GENMASK(5, 0)	/* 0x3f do not count */
 
+/* RX MSG0 */
+#define QDMA_ETH_RXMSG_SPTAG		GENMASK(21, 14)
 /* RX MSG1 */
 #define QDMA_ETH_RXMSG_DEI_MASK		BIT(31)
 #define QDMA_ETH_RXMSG_IP6_MASK		BIT(30)

-- 
2.48.1



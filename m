Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07BCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 12:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYpEyCycqhukAZ/ckkwa7tUGSQYKEQ63zGT/bbsxAEU=; b=Om+Wabe7xpOi01G5nLkVwUPfYx
	ZYk454MvxKOHJwi9RDDhKgy/Qmk52DEpC3H5M/KptEZGUeVDH/t8ptaKB7ruY0semdmL4Uzzu9E+4
	YWjKAonDWhu1k0FJ2norO7geBB3uO3h0Hksn7ylhujZH7g0lAdy/dx/KrQc8hmcJGdHVNvtPrxNmZ
	yWnCeK4lkunZErwU2J6vVE73ZrYs6IiHMUuwwgYljgfxij88qfxvKQhFNpdtFHjhcCsQcBXzF2wXg
	kce0C37VUEQXbmfAfPZV6Yy43IjWKs/Jp4bB5781i7P5MSDqzXgv1/cDtYg/rBKNZA/saJ6pz9IrF
	KfV3yOLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTgfw-0000000CtzZ-3VDm;
	Fri, 03 Jan 2025 12:21:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTgcS-0000000Ctap-3HGb;
	Fri, 03 Jan 2025 12:17:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C87D7A40AD1;
	Fri,  3 Jan 2025 12:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7CBC4CECE;
	Fri,  3 Jan 2025 12:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735906655;
	bh=JRnHLtZnJoQ0iDU2DZQstsrXqzWvKNfZv0Jn51+HVcA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RrAsgU/Cbr1PYYswprRAJXe929GnT8ZI5m+ZuUksLJNv4EfVchoSxd0hgLU8mK3Gl
	 a9QNgEYlVUAYM3JHZSvbDy00Iyz7OLTkua5zgjcl7/ZgzEczHCQqMKDrNRbxk8HDJr
	 M4lnXrvQRuyFo5JJKc1iGpSz/Tox5qR5x5oyjOMcATJa9D0s+B6/LmO9U0E+HGUgNv
	 1f1xoicVcu9ZIv07StEmcghe9GAxH9Q124V08JROj1aEqSCs6TduNN9aSKCwGVJrih
	 4cD4JUWVSd4aM1lxCNLm6N7i6cwOoZhWjfCaVvj59mNmotTVIuOUg4ffPxTmu46amL
	 yfSbyGEt1pyGw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 03 Jan 2025 13:17:03 +0100
Subject: [PATCH net-next 2/4] net: airoha: Introduce ndo_select_queue
 callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-airoha-en7581-qdisc-offload-v1-2-608a23fa65d5@kernel.org>
References: <20250103-airoha-en7581-qdisc-offload-v1-0-608a23fa65d5@kernel.org>
In-Reply-To: <20250103-airoha-en7581-qdisc-offload-v1-0-608a23fa65d5@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 upstream@airoha.com, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_041736_966422_208527B6 
X-CRM114-Status: GOOD (  12.95  )
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

Airoha EN7581 SoC supports 32 Tx DMA rings used to feed packets to QoS
channels. Each channels supports 8 QoS queues where the user can apply
QoS scheduling policies. In a similar way, the user can configure hw
rate shaping for each QoS channel.
Introduce ndo_select_queue callback in order to select the tx queue
based on QoS channel and QoS queue. In particular, for dsa device select
QoS channel according to the dsa user port index, rely on port id
otherwise. Select QoS queue based on the skb priority.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 59e889cf08e49b89d20fa630f83a1c1322bae6b4..4b361f30829f4f5c40b1d8a97d43fd3a206e4206 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -23,6 +23,8 @@
 #define AIROHA_MAX_NUM_XSI_RSTS		5
 #define AIROHA_MAX_MTU			2000
 #define AIROHA_MAX_PACKET_SIZE		2048
+#define AIROHA_NUM_QOS_CHANNELS		4
+#define AIROHA_NUM_QOS_QUEUES		8
 #define AIROHA_NUM_TX_RING		32
 #define AIROHA_NUM_RX_RING		32
 #define AIROHA_FE_MC_MAX_VLAN_TABLE	64
@@ -2429,21 +2431,44 @@ static void airoha_dev_get_stats64(struct net_device *dev,
 	} while (u64_stats_fetch_retry(&port->stats.syncp, start));
 }
 
+static u16 airoha_dev_select_queue(struct net_device *dev, struct sk_buff *skb,
+				   struct net_device *sb_dev)
+{
+	struct airoha_gdm_port *port = netdev_priv(dev);
+	int queue, channel;
+
+	/* For dsa device select QoS channel according to the dsa user port
+	 * index, rely on port id otherwise. Select QoS queue based on the
+	 * skb priority.
+	 */
+	channel = netdev_uses_dsa(dev) ? skb_get_queue_mapping(skb) : port->id;
+	channel = channel % AIROHA_NUM_QOS_CHANNELS;
+	queue = (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES; /* QoS queue */
+	queue = channel * AIROHA_NUM_QOS_QUEUES + queue;
+
+	return queue < dev->num_tx_queues ? queue : 0;
+}
+
 static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 				   struct net_device *dev)
 {
 	struct skb_shared_info *sinfo = skb_shinfo(skb);
 	struct airoha_gdm_port *port = netdev_priv(dev);
-	u32 msg0 = 0, msg1, len = skb_headlen(skb);
-	int i, qid = skb_get_queue_mapping(skb);
+	u32 msg0, msg1, len = skb_headlen(skb);
 	struct airoha_qdma *qdma = port->qdma;
 	u32 nr_frags = 1 + sinfo->nr_frags;
 	struct netdev_queue *txq;
 	struct airoha_queue *q;
 	void *data = skb->data;
+	int i, qid;
 	u16 index;
 	u8 fport;
 
+	qid = skb_get_queue_mapping(skb) % ARRAY_SIZE(qdma->q_tx);
+	msg0 = FIELD_PREP(QDMA_ETH_TXMSG_CHAN_MASK,
+			  qid / AIROHA_NUM_QOS_QUEUES) |
+	       FIELD_PREP(QDMA_ETH_TXMSG_QUEUE_MASK,
+			  qid % AIROHA_NUM_QOS_QUEUES);
 	if (skb->ip_summed == CHECKSUM_PARTIAL)
 		msg0 |= FIELD_PREP(QDMA_ETH_TXMSG_TCO_MASK, 1) |
 			FIELD_PREP(QDMA_ETH_TXMSG_UCO_MASK, 1) |
@@ -2617,6 +2642,7 @@ static const struct net_device_ops airoha_netdev_ops = {
 	.ndo_init		= airoha_dev_init,
 	.ndo_open		= airoha_dev_open,
 	.ndo_stop		= airoha_dev_stop,
+	.ndo_select_queue	= airoha_dev_select_queue,
 	.ndo_start_xmit		= airoha_dev_xmit,
 	.ndo_get_stats64        = airoha_dev_get_stats64,
 	.ndo_set_mac_address	= airoha_dev_set_macaddr,

-- 
2.47.1



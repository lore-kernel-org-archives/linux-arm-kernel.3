Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC230C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 06:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZMCvDd/Ezj4aFDcX2uSgRxKCo45Kz+LLQsJyZlloOE=; b=bk5XaMGH73AZl7Jc2LUW4lS62g
	HlOuC21Rdvmzp8A0dbQZ1n05ip+YIOWSkavhah9lXMXDZR0pI5gekZqBcjrhOIca011xLRX90uCbc
	02WV1kp9LuHv2ABtzJUFdz+GuJr/fNQDfoFbDCdBt1xz42Q5/OCdoYeI9i+ECWKuKCAZkOtyI2Vr2
	G2YZEgWukNM2QnEQahAkdxR+RrQNzSSavSG0lN0kqpcrtkcTiyT3xe/O4zmcPP9dpY4jalntbeE6Y
	+IMrAqae5wCxjSkY4IpAKuB50IkVTEi4tcmrFUew+EbDxlFyk0ti+cvIyDrT9iLOJhf/vNLc353Bd
	zBGSODFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti6eH-00000006QKc-09wC;
	Wed, 12 Feb 2025 06:55:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti6bX-00000006Puz-0D18;
	Wed, 12 Feb 2025 06:52:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D08CEA41156;
	Wed, 12 Feb 2025 06:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D355C4CEDF;
	Wed, 12 Feb 2025 06:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739343133;
	bh=ZR5/2ulMQlwhUwl/HtlTLXlzn5sAotIiGMhXEhkdb3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rB88eptIRhWJaqF3WPpr08Ft5KB7I/GhHDFkfLzvTd+lGjkFJJBEfn3C9/jWKDybf
	 3X+Pc3kyzxQSONHBSye6YqFG5jzExQe9QzaSkaZKt13+GhcUNhLwjclwjg2KXDpRGe
	 LsY5GceWC4otQA7u8/GlFtVucBQyUSTwUqq0C+UdMLbdKk1R3f/zMaslE9CDBwE/TB
	 mxy0QqhTWr0xMKr+NshuwevoVXlBBxOz9J9dvAiTdXgS8Y2wJtCBJQmgUPnhnUhFMB
	 UEiVSTtpQAsNVX3e3iNeN6/LRQhZjZprRFFWko7dNsy4bnTm8s65Y3Pwc8ZDqcfMES
	 mZspdKOl19NTg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Feb 2025 07:51:47 +0100
Subject: [PATCH net-next 1/2] net: airoha: Fix TSO support for header
 cloned skbs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-airoha-fix-tso-v1-1-1652558a79b4@kernel.org>
References: <20250212-airoha-fix-tso-v1-0-1652558a79b4@kernel.org>
In-Reply-To: <20250212-airoha-fix-tso-v1-0-1652558a79b4@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_225215_227389_7F2DAD7A 
X-CRM114-Status: GOOD (  13.44  )
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

For GSO packets, skb_cow_head() will reallocate the skb for TSO header
cloned skbs in airoha_dev_xmit(). For this reason, sinfo pointer can be
no more valid. Fix the issue relying on skb_shinfo() macro directly in
airoha_dev_xmit().
This is not a user visible issue since we can't currently enable TSO for
DSA user ports since we are missing to initialize net_device
vlan_features field.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 09f448f291240257c5748725848ede231c502fbd..aa5f220ddbcf9ca5bee1173114294cb3aec701c9 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -2556,11 +2556,10 @@ static u16 airoha_dev_select_queue(struct net_device *dev, struct sk_buff *skb,
 static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 				   struct net_device *dev)
 {
-	struct skb_shared_info *sinfo = skb_shinfo(skb);
 	struct airoha_gdm_port *port = netdev_priv(dev);
+	u32 nr_frags = 1 + skb_shinfo(skb)->nr_frags;
 	u32 msg0, msg1, len = skb_headlen(skb);
 	struct airoha_qdma *qdma = port->qdma;
-	u32 nr_frags = 1 + sinfo->nr_frags;
 	struct netdev_queue *txq;
 	struct airoha_queue *q;
 	void *data = skb->data;
@@ -2583,8 +2582,9 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 		if (skb_cow_head(skb, 0))
 			goto error;
 
-		if (sinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6)) {
-			__be16 csum = cpu_to_be16(sinfo->gso_size);
+		if (skb_shinfo(skb)->gso_type & (SKB_GSO_TCPV4 |
+						 SKB_GSO_TCPV6)) {
+			__be16 csum = cpu_to_be16(skb_shinfo(skb)->gso_size);
 
 			tcp_hdr(skb)->check = (__force __sum16)csum;
 			msg0 |= FIELD_PREP(QDMA_ETH_TXMSG_TSO_MASK, 1);
@@ -2613,7 +2613,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	for (i = 0; i < nr_frags; i++) {
 		struct airoha_qdma_desc *desc = &q->desc[index];
 		struct airoha_queue_entry *e = &q->entry[index];
-		skb_frag_t *frag = &sinfo->frags[i];
+		skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
 		dma_addr_t addr;
 		u32 val;
 

-- 
2.48.1



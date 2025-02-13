Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2978C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MheUbBAVa9zRYV/qc//494W7jC1UkL0T5kBqgYrS/vk=; b=Dfk26anqGsvkTKqsKOg3vB48Zd
	XgmVn/4S9eSdlbhKt0yF2uGn2M3jywt2oEvxgQ21C9pY9nj/elQAKrw9NyTHF8Zw8y2QY7ZdjlAcm
	RQPclIU12etpaH1NzN67onzTnRu/0U5H0P2B0xQDwmYu/4DU8afAmvJWUFhKMQ8bqUynOZ154IiA3
	Cvu0W3/DrJ0AThPmC7km8l0QxtkO2NN5I9eQ71sSfoRFc6WR1t5YTm/Zu4XfiTY8kaELd2ARzgM3F
	2T/kYbByp8u8H+d9jbecU9rhl3vVxEcuaxYYHrod5cyaqGSMbQNLw5OAB9Rb6JNG/iNfyuM/AsSzi
	Ql1xrDvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibHd-0000000BZHx-0YF1;
	Thu, 13 Feb 2025 15:37:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tibEo-0000000BYc8-2IAi;
	Thu, 13 Feb 2025 15:34:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6D5AEA426E2;
	Thu, 13 Feb 2025 15:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D27C4CED1;
	Thu, 13 Feb 2025 15:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739460889;
	bh=L5nffdWdH0LR7Q80jRhjrqzq1DZVr+htRNvDd6KyaNk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ksTt28lfjlRlE/DPAyXk9PTXaabBhNNayZ1h9pQTYfclDNfSzzA4yAjI55wk5rdx1
	 tOQkGijBR8gZUR941+qh9jlYLPNCMNfBwQWaXYjSnXbOZGjw+XMgVy5fbRveeb6/EP
	 SVk0Y1QE1x4I1cpMwdhgS+HjY1KvTJTj63p3uB+/bNEv4oDZEYoqmS4UBmdwF9USrm
	 SxKL8fvj1qzE2WMyidWGZJxhabWjm4OKE6nZoPe54ULXr7Epfh7dfe+tQQXa+lX/iV
	 W+mNqOkeKWgKr/76LZ49XW8ki7muq2tF8TsqvejVqsIXjDgqNvwyoApxiJSr04b9v/
	 naji+f5haUutw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 13 Feb 2025 16:34:20 +0100
Subject: [PATCH net-next v4 01/16] net: airoha: Fix TSO support for header
 cloned skbs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-airoha-en7581-flowtable-offload-v4-1-b69ca16d74db@kernel.org>
References: <20250213-airoha-en7581-flowtable-offload-v4-0-b69ca16d74db@kernel.org>
In-Reply-To: <20250213-airoha-en7581-flowtable-offload-v4-0-b69ca16d74db@kernel.org>
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
 upstream@airoha.com, Mateusz Polchlopek <mateusz.polchlopek@intel.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_073450_720787_87DFC10D 
X-CRM114-Status: GOOD (  13.25  )
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
Reviewed-by: Mateusz Polchlopek <mateusz.polchlopek@intel.com>
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEAACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 15:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nObldBkoFz93TvD+rJyqHcpBLDBEZ04xwgIHNgsnAO8=; b=2PTrGdJ9dGQ92or0cmwB+BrqQb
	CWzr7oQLrZE6DlMK4lU/l41S6GdDsZ3JYhcwl63syjmR/6Oe6qYpJh1hl7kA4eMKeettJa3jDNqsb
	cL7QMBvKi7yowbJum5vuxWZPTQArH6kiG0ghFjd6dhZu6w3DZpyjorWp9l+TItzImBbHm8NSSM3QL
	xaEIJXhucrK6A0vli8Hp10JC+m99tzJsGD45nHw+43FjtEUVDF/JKzkiY963HSHeIjr8hP8XL0suQ
	QHrNWC1vdOtHQ2jOxWGXTfd7X+ghz1wnH3DgXTL8+jGM7d6Rdk8U8fv6aLbDYVyj6btKjFmmA8/4m
	uXxKKwpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNB8B-0000000316S-0GdS;
	Wed, 13 May 2026 15:04:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNB87-0000000315o-3h5O;
	Wed, 13 May 2026 15:04:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2854543DB5;
	Wed, 13 May 2026 15:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDDBC19425;
	Wed, 13 May 2026 15:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778684651;
	bh=iliNH01E0zCiR4ewRpQV15XeBpC7YO/HdMRcKK4W6Pc=;
	h=From:Date:Subject:To:Cc:From;
	b=bjBDGjnbHvLYaOEiG9nuqJk7YEMQb2VQpKoPHXjdQXblqZcdm561Qe/3MuOtCDaZd
	 FKzh1KCl0FBkts3VT4Ks6sJnnoKYOe3ByrO5mKx83nfoN9tTZOgSqXS9CE9B/n3luX
	 Qb4lv/pVLkbf8crrPPNsUQnFnvwJlhUodzxSqAj7l6L+VM+s0O2wjqn2E2Bx7XtZut
	 uikhh8u5QNKm9F00CxrprCmzOSoon4Wu8vkvafONK2ukxs3StgVssSdLXYasSisvpl
	 K9Fj1rBSe2VxTBm36tKU+Dqei+6/lRU5bEbPFlQNPZOqyrFPSKKQYCY+RtTd70IbM7
	 70tS4jddPVnLQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 13 May 2026 17:03:59 +0200
Subject: [PATCH net-next] net: airoha: Reserve RX headroom to avoid skb
 reallocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-airoha-rx-headroom-v1-1-bd87798e422d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAxA0atI1hNonSp1rjLMIthos7AdUpGCe
 HeLy7f4/4TCKlzg052gfEiRnBrsq4M5UloZJTRDb/rRDPaNJJojoVaMTEFz3tAFO83knSfroIV
 /5UXqM/1C4h0T1x1+13UDkkWbjm4AAAA=
X-Change-ID: 20260513-airoha-rx-headroom-4d19ca848a14
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_080411_965678_20AE910F 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

Reserve NET_SKB_PAD + NET_IP_ALIGN bytes of headroom for received packets
to avoid skb head reallocation when pushing protocol headers into the skb.

Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 14 ++++++++------
 drivers/net/ethernet/airoha/airoha_eth.h |  2 ++
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index f71fb18197ec..5a027cc7ffcb 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -543,9 +543,10 @@ static int airoha_qdma_fill_rx_queue(struct airoha_queue *q)
 		q->queued++;
 		nframes++;
 
+		offset += AIROHA_RX_HEADROOM;
 		e->buf = page_address(page) + offset;
 		e->dma_addr = page_pool_get_dma_addr(page) + offset;
-		e->dma_len = SKB_WITH_OVERHEAD(q->buf_size);
+		e->dma_len = SKB_WITH_OVERHEAD(AIROHA_RX_LEN(q->buf_size));
 
 		val = FIELD_PREP(QDMA_DESC_LEN_MASK, e->dma_len);
 		WRITE_ONCE(desc->ctrl, cpu_to_le32(val));
@@ -611,13 +612,12 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 		q->tail = (q->tail + 1) % q->ndesc;
 		q->queued--;
 
-		dma_sync_single_for_cpu(eth->dev, e->dma_addr,
-					SKB_WITH_OVERHEAD(q->buf_size), dir);
+		dma_sync_single_for_cpu(eth->dev, e->dma_addr, e->dma_len,
+					dir);
 
 		page = virt_to_head_page(e->buf);
 		len = FIELD_GET(QDMA_DESC_LEN_MASK, desc_ctrl);
-		data_len = q->skb ? q->buf_size
-				  : SKB_WITH_OVERHEAD(q->buf_size);
+		data_len = q->skb ? AIROHA_RX_LEN(q->buf_size) : e->dma_len;
 		if (!len || data_len < len)
 			goto free_frag;
 
@@ -627,10 +627,12 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 
 		port = eth->ports[p];
 		if (!q->skb) { /* first buffer */
-			q->skb = napi_build_skb(e->buf, q->buf_size);
+			q->skb = napi_build_skb(e->buf - AIROHA_RX_HEADROOM,
+						q->buf_size);
 			if (!q->skb)
 				goto free_frag;
 
+			skb_reserve(q->skb, AIROHA_RX_HEADROOM);
 			__skb_put(q->skb, len);
 			skb_mark_for_recycle(q->skb);
 			q->skb->dev = port->dev;
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 58530d096de7..d3781103abb5 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -32,6 +32,8 @@
 #define AIROHA_FE_MC_MAX_VLAN_TABLE	64
 #define AIROHA_FE_MC_MAX_VLAN_PORT	16
 #define AIROHA_NUM_TX_IRQ		2
+#define AIROHA_RX_HEADROOM		(NET_SKB_PAD + NET_IP_ALIGN)
+#define AIROHA_RX_LEN(_n)		((_n) - AIROHA_RX_HEADROOM)
 #define HW_DSCP_NUM			2048
 #define IRQ_QUEUE_LEN(_n)		((_n) ? 1024 : 2048)
 #define TX_DSCP_NUM			1024

---
base-commit: 8ebd24a7822cbae25beeafba49b2159d6a68a5f2
change-id: 20260513-airoha-rx-headroom-4d19ca848a14

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>



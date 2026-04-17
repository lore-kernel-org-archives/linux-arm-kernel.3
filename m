Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DA8F8E4AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 06:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jycj6Hi7Qn9dBfyHjXzaWFzw2EJbYRCbIJTiZrxWcEM=; b=NSZqsiu2+98voxjH4BvkkDlP8e
	+w9TDVY4mZjCVluWNy0wqpgsFjwGTb9/TrH1vJRYj31D0r/nNroV3Vf+3kINvH/cP7cPr/Ez2YiJ2
	viFuRghVdTEIwidGgARB6rcQursgUoq2a4Q9HFeqex3nOlvxvrbB1K28OSwVdIQI5kXxn/y8zMlZ2
	jZGSNkqsrCPiYn+FGL1+5XlLf41C48TM5e28w1vuAr8g8qtzFwFH6DU76/2jbbL4U8nCNGaykdkbK
	z/wySKqyrvzMzt5hCjYTW8a8xKyIRc/aBVVjFwdcJi0ek16f++eDxZqp5m7dfJh7e22zvh2uD6z1e
	GsUgUaFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcqC-00000003XwL-2N9U;
	Fri, 17 Apr 2026 06:38:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcqA-00000003Xui-0OiE;
	Fri, 17 Apr 2026 06:38:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94BBF4434F;
	Fri, 17 Apr 2026 06:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E9DC19425;
	Fri, 17 Apr 2026 06:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776407889;
	bh=xnA99lEk24eFu5lu4XONa125B5SYET6G9LGPg2c6iYM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TxoQeiDEVjSHullntG9HbL2NRx5KNzWI0IwXvkJUBzsETe9Si4n2Ub5eZMYYtXn+A
	 7tQzwgUdkD/RDQe4Pw3RK959VpGqo42/eNJSEuMmG5aMD3ipGPteiehEKhSmCLSaFp
	 ltT2LMMD71DByOfBxhMf64mvVBNvEe0e3Co4viTJEIMX81jaM+XkTERFMz5tlqBJGL
	 dcQnbyfHp1RfGcJFWRv470Ld7A1wc29il1Obl+wnKoa3MN093aFGHTyntkvfSKsxbu
	 m7h9ysIzBsyy6PWhjeeoRerPbv6GTcf2GE8GtcqSXtJBDvvAPVNq2bs3CPMeUJ5sLp
	 aYY30XN/+LzOw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 17 Apr 2026 08:36:31 +0200
Subject: [PATCH net v4 1/2] net: airoha: Move ndesc initialization at end
 of airoha_qdma_init_tx()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-1-e04bcc2c9642@kernel.org>
References: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-0-e04bcc2c9642@kernel.org>
In-Reply-To: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-0-e04bcc2c9642@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_233810_157908_E8976649 
X-CRM114-Status: GOOD (  11.81  )
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

If queue entry list allocation fails in airoha_qdma_init_tx_queue routine,
airoha_qdma_cleanup_tx_queue() will trigger a NULL pointer dereference
accessing the queue entry array. The issue is due to the early ndesc
initialization in airoha_qdma_init_tx_queue(). Fix the issue moving ndesc
initialization at end of airoha_qdma_init_tx routine.

Fixes: 3f47e67dff1f7 ("net: airoha: Add the capability to consume out-of-order DMA tx descriptors")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index e1ab15f1ee7d..690bfaf8d7d9 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -954,27 +954,27 @@ static int airoha_qdma_init_tx_queue(struct airoha_queue *q,
 	dma_addr_t dma_addr;
 
 	spin_lock_init(&q->lock);
-	q->ndesc = size;
 	q->qdma = qdma;
 	q->free_thr = 1 + MAX_SKB_FRAGS;
 	INIT_LIST_HEAD(&q->tx_list);
 
-	q->entry = devm_kzalloc(eth->dev, q->ndesc * sizeof(*q->entry),
+	q->entry = devm_kzalloc(eth->dev, size * sizeof(*q->entry),
 				GFP_KERNEL);
 	if (!q->entry)
 		return -ENOMEM;
 
-	q->desc = dmam_alloc_coherent(eth->dev, q->ndesc * sizeof(*q->desc),
+	q->desc = dmam_alloc_coherent(eth->dev, size * sizeof(*q->desc),
 				      &dma_addr, GFP_KERNEL);
 	if (!q->desc)
 		return -ENOMEM;
 
-	for (i = 0; i < q->ndesc; i++) {
+	for (i = 0; i < size; i++) {
 		u32 val = FIELD_PREP(QDMA_DESC_DONE_MASK, 1);
 
 		list_add_tail(&q->entry[i].list, &q->tx_list);
 		WRITE_ONCE(q->desc[i].ctrl, cpu_to_le32(val));
 	}
+	q->ndesc = size;
 
 	/* xmit ring drop default setting */
 	airoha_qdma_set(qdma, REG_TX_RING_BLOCKING(qid),

-- 
2.53.0



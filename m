Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC44F36C54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 08:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbeDGJfbuvHJaJysemq1yCV8QyeKLOMPiVz3t8bW8s4=; b=x4MMlxIjCkBBGVFhNyqIASgBxE
	8WoNvX7LWQDKGOSfCh2pRccEs0+AtKYDEefNmpWi6PNVr2vdHI+5/dzyYrv5KykPJlC2GYOTH942G
	WUIBNXTzTRFdfr2Pv9zYvTi3kf9eapCz4BOkmf/aezvG5UXSm01YzstVGwg4daRfv6tYlGNy+tNuX
	Yw4GsM4BwPiVu4jf7zRmlgUEE0rM2oWTt8Sbx/s5Zr2qpEQA0w9B7RlwKry3Ufs6NHACgU2sw2etF
	j/ORp2juWxcfGgQj3nTQ78wAeKM+Z/6TTxooU/d5/PCeFhVzw6NihFxJCTc20lssHk7hsrcUL4F9i
	hj0BczNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEjfx-00000006Zz0-42qW;
	Mon, 20 Apr 2026 08:08:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEjft-00000006ZxD-24Ru;
	Mon, 20 Apr 2026 08:08:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9274143CE7;
	Mon, 20 Apr 2026 08:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20CADC2BCB3;
	Mon, 20 Apr 2026 08:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776672488;
	bh=iJfYHjbtQcWXulEhPUnNrNVT7wdpLyZo8wc0yxlsesk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e+9urV6K58ahpj9nD4gByGJBfQ2yw6edYmFol3cpas1UUf/+DDiIyXWyXqxNpydt1
	 yuJz8wOQZfrtejlLFgX2wClYdI9997yMSMZRu7QaAEhH7ZHub6Tim87qKTnOX5CD1o
	 S6iQNIcGHpyH0eK30Dqjw+jUJMjobksb8pbGOpf0hup8Li35T0OMG9nlZlmR5x4OXL
	 HkgfKNQC2nfAWuNVL45bmC3hZwJ7AAqw5pPyxDG/cEFZH11ZI+gXRJHFforF92dKOw
	 9STnhtATXXqRFVg9xJmS11ExPXqKHvWazwF5qIuizQP9ITG++4zLaw4HRxDd6MfsGF
	 Tsl8BjwBwkUTQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 20 Apr 2026 10:07:47 +0200
Subject: [PATCH net v2 1/2] net: airoha: Move ndesc initialization at end
 of airoha_qdma_init_rx_queue()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-airoha_qdma_init_rx_queue-fix-v2-1-d99347e5c18d@kernel.org>
References: <20260420-airoha_qdma_init_rx_queue-fix-v2-0-d99347e5c18d@kernel.org>
In-Reply-To: <20260420-airoha_qdma_init_rx_queue-fix-v2-0-d99347e5c18d@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_010809_611391_0964BA92 
X-CRM114-Status: GOOD (  11.90  )
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

If queue entry or DMA descriptor list allocation fails in
airoha_qdma_init_rx_queue routine, airoha_qdma_cleanup() will trigger a
NULL pointer dereference running netif_napi_del() for RX queue NAPIs
since netif_napi_add() has never been executed to this particular RX NAPI.
The issue is due to the early ndesc initialization in
airoha_qdma_init_rx_queue() since airoha_qdma_cleanup() relies on ndesc
value to check if the queue is properly initialized. Fix the issue moving
ndesc initialization at end of airoha_qdma_init_tx routine.
Move page_pool allocation after descriptor list allocation in order to
avoid memory leaks if desc allocation fails.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index e1ab15f1ee7d..fc79c456743c 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -745,14 +745,18 @@ static int airoha_qdma_init_rx_queue(struct airoha_queue *q,
 	dma_addr_t dma_addr;
 
 	q->buf_size = PAGE_SIZE / 2;
-	q->ndesc = ndesc;
 	q->qdma = qdma;
 
-	q->entry = devm_kzalloc(eth->dev, q->ndesc * sizeof(*q->entry),
+	q->entry = devm_kzalloc(eth->dev, ndesc * sizeof(*q->entry),
 				GFP_KERNEL);
 	if (!q->entry)
 		return -ENOMEM;
 
+	q->desc = dmam_alloc_coherent(eth->dev, ndesc * sizeof(*q->desc),
+				      &dma_addr, GFP_KERNEL);
+	if (!q->desc)
+		return -ENOMEM;
+
 	q->page_pool = page_pool_create(&pp_params);
 	if (IS_ERR(q->page_pool)) {
 		int err = PTR_ERR(q->page_pool);
@@ -761,11 +765,7 @@ static int airoha_qdma_init_rx_queue(struct airoha_queue *q,
 		return err;
 	}
 
-	q->desc = dmam_alloc_coherent(eth->dev, q->ndesc * sizeof(*q->desc),
-				      &dma_addr, GFP_KERNEL);
-	if (!q->desc)
-		return -ENOMEM;
-
+	q->ndesc = ndesc;
 	netif_napi_add(eth->napi_dev, &q->napi, airoha_qdma_rx_napi_poll);
 
 	airoha_qdma_wr(qdma, REG_RX_RING_BASE(qid), dma_addr);

-- 
2.53.0



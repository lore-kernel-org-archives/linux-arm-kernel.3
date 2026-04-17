Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF55F8DFE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 08:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IuJgV5tAauU2knSOmDoxbXpNCdRPKfx2ot+g7dNyVKc=; b=GUeaT1LsF8wVymmGG/2U5iLnBw
	OqWB2uNGYxh9bPmXqaxFDvdDNL3zHn2R8A9G2DlWsKhxXqAVS4TaT/XZBf8F6UCy1L8SbquHNzIIv
	aSNEguQ3SmbUYFSjf7uIFBdZJxw/MVxbxjXokKuGByrGHt/BdLxt0uFEtgon3K0xrbqTbPkDI954m
	KVIAyrSmK5UF+bVMry5pGwvWBb/07mLciBwixj8ptEYHuKNAeyL0iOIg0MQlRK4XjSWTgaaBAxasD
	+H6oT/MpforCmuvocBv8avlonk8QsX8D6ce5hvqK7LjylS8tMqkZDY5qt1qHvsELlY1lqH5DQVYwB
	Vj7lTagw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDeky-00000003gjH-14hY;
	Fri, 17 Apr 2026 08:40:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDekv-00000003ghc-1gGL;
	Fri, 17 Apr 2026 08:40:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB577441B1;
	Fri, 17 Apr 2026 08:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB00C2BCB5;
	Fri, 17 Apr 2026 08:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776415252;
	bh=/WPWpdEWGVeVIKzCLSytQNHRi9qSOAcxdyy0+jcS/uU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q4a/K1jXnS2YC4tXyvarjsTNi5v5b6Cq+w6HgC/bxzpUEUCnxinmwLDtyAht/Ioqq
	 TzU0vAr3+mJu9tvaXmM+yEGyhisDJqTNWUs4RwAp5W2hKZXYwxc+Z2C7y/EfRBpEzp
	 DyP9LlC5+eiP0QiTKFVSl45Dy/esZez8V+5wGW5TMR+oIexoKDbFmOINzZgfExnQ+J
	 Z095kD2q9WlOKIRMpl7mbbc2cW+si8aTzcImPpxIeXAw3h9qVgfrjjD9m/rKBiKB5Q
	 JAXjRzgJOZTDxQPT1e9zjJWHMhTSf5DKAL91+gqmnPR4tpDYxIT6Mx45YfXeqXZKRQ
	 wyGRR+42GqOhw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 17 Apr 2026 10:40:36 +0200
Subject: [PATCH net 1/2] net: airoha: Move ndesc initialization at end of
 airoha_qdma_init_rx_queue()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-airoha_qdma_init_rx_queue-fix-v1-1-db9fa5e468e5@kernel.org>
References: <20260417-airoha_qdma_init_rx_queue-fix-v1-0-db9fa5e468e5@kernel.org>
In-Reply-To: <20260417-airoha_qdma_init_rx_queue-fix-v1-0-db9fa5e468e5@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_014053_493777_B49C4C28 
X-CRM114-Status: GOOD (  10.74  )
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

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index e1ab15f1ee7d..a6f8b231583d 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -745,10 +745,9 @@ static int airoha_qdma_init_rx_queue(struct airoha_queue *q,
 	dma_addr_t dma_addr;
 
 	q->buf_size = PAGE_SIZE / 2;
-	q->ndesc = ndesc;
 	q->qdma = qdma;
 
-	q->entry = devm_kzalloc(eth->dev, q->ndesc * sizeof(*q->entry),
+	q->entry = devm_kzalloc(eth->dev, ndesc * sizeof(*q->entry),
 				GFP_KERNEL);
 	if (!q->entry)
 		return -ENOMEM;
@@ -761,11 +760,12 @@ static int airoha_qdma_init_rx_queue(struct airoha_queue *q,
 		return err;
 	}
 
-	q->desc = dmam_alloc_coherent(eth->dev, q->ndesc * sizeof(*q->desc),
+	q->desc = dmam_alloc_coherent(eth->dev, ndesc * sizeof(*q->desc),
 				      &dma_addr, GFP_KERNEL);
 	if (!q->desc)
 		return -ENOMEM;
 
+	q->ndesc = ndesc;
 	netif_napi_add(eth->napi_dev, &q->napi, airoha_qdma_rx_napi_poll);
 
 	airoha_qdma_wr(qdma, REG_RX_RING_BASE(qid), dma_addr);

-- 
2.53.0



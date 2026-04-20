Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD64F36C41
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 08:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VGzgjm+hM1YIn+ENKjkUn5WIxQsCS+iMEX1/9+/Wco=; b=Mz5Xw7hiasQfL6djlnfq6hdgz9
	xWsjN5be9zsbHhBzro44MG2siIMu7WurVMIY86B1KCMjej1jYpxTD8DdpA7Tmuh9dQOKMU83o8rAO
	CzcEXDlTckP2eomdpye2rZfh5VUyQUqinAZeh8BSEaBIOfXra1Wb+ja2fN4Vse+ethwmSbG4vp3BD
	bsz7wvI6GObGzDRn6xqiuDskzflOZS+3G0oorc+rvAXd5RcbpN3/Y9DTtz7A4fq7NsZTVCHOW64tH
	xROyv+PA4D1EW0Sc2y5TXuzbivIC7FsFLN8YgfhTdYnNRYDS92NmjwkLzXXl+XHNVkR+Xm9y0kJC4
	fXvAd4sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEjg0-00000006a0L-2XO5;
	Mon, 20 Apr 2026 08:08:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEjfw-00000006Zy3-04ef;
	Mon, 20 Apr 2026 08:08:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 696176012B;
	Mon, 20 Apr 2026 08:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2935C19425;
	Mon, 20 Apr 2026 08:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776672491;
	bh=topljgtv1QUKQr9gAQktFewd+50qP9U7HbRk/au7sXo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u5cAo5JVB95nnlODY/NPvD2OYvMLUFT7sL5+TooWNY+BZsw0wTX96X7xBqPBLSA90
	 zWFUxnh23MeUU0IpAnede5IgnX4g4EXgbL3/hDB1TF8Rd0GIwgq/6MPgrCWl00fyR0
	 5kOIcWerO7WtvCR23zKw3GrTsJ++ZkZP3flm0vT5iKNzUy+7xK6T0JP/OuQRkxVycJ
	 wVOcffyYoW4/38LYWCWzsw5Mfuqf25oPy8Fh51+rIaOslIA+XmmCBpme2O2C/seZ7h
	 4wWmdU5wwebXnLaX13TJNJb52H1/wteBGSEqBKlqmipLqEpyOOSg9WN3yd3LvQ2bwC
	 qLONGq4BOnMWw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 20 Apr 2026 10:07:48 +0200
Subject: [PATCH net v2 2/2] net: airoha: Add size check for TX NAPIs in
 airoha_qdma_cleanup()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-airoha_qdma_init_rx_queue-fix-v2-2-d99347e5c18d@kernel.org>
References: <20260420-airoha_qdma_init_rx_queue-fix-v2-0-d99347e5c18d@kernel.org>
In-Reply-To: <20260420-airoha_qdma_init_rx_queue-fix-v2-0-d99347e5c18d@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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

If airoha_qdma_init routine fails before airoha_qdma_tx_irq_init() runs
successfully for all TX NAPIs, airoha_qdma_cleanup() will
unconditionally runs netif_napi_del() on TX NAPIs, triggering a NULL
pointer dereference. Fix the issue relying on q_tx_irq size value to
check if the TX NAPIs is properly initialized in airoha_qdma_cleanup().
Moreover, run netif_napi_add_tx() just if irq_q queue is properly
allocated.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index fc79c456743c..fd8c4f817d85 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -996,8 +996,6 @@ static int airoha_qdma_tx_irq_init(struct airoha_tx_irq_queue *irq_q,
 	struct airoha_eth *eth = qdma->eth;
 	dma_addr_t dma_addr;
 
-	netif_napi_add_tx(eth->napi_dev, &irq_q->napi,
-			  airoha_qdma_tx_napi_poll);
 	irq_q->q = dmam_alloc_coherent(eth->dev, size * sizeof(u32),
 				       &dma_addr, GFP_KERNEL);
 	if (!irq_q->q)
@@ -1007,6 +1005,9 @@ static int airoha_qdma_tx_irq_init(struct airoha_tx_irq_queue *irq_q,
 	irq_q->size = size;
 	irq_q->qdma = qdma;
 
+	netif_napi_add_tx(eth->napi_dev, &irq_q->napi,
+			  airoha_qdma_tx_napi_poll);
+
 	airoha_qdma_wr(qdma, REG_TX_IRQ_BASE(id), dma_addr);
 	airoha_qdma_rmw(qdma, REG_TX_IRQ_CFG(id), TX_IRQ_DEPTH_MASK,
 			FIELD_PREP(TX_IRQ_DEPTH_MASK, size));
@@ -1398,8 +1399,12 @@ static void airoha_qdma_cleanup(struct airoha_qdma *qdma)
 		}
 	}
 
-	for (i = 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++)
+	for (i = 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++) {
+		if (!qdma->q_tx_irq[i].size)
+			continue;
+
 		netif_napi_del(&qdma->q_tx_irq[i].napi);
+	}
 
 	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
 		if (!qdma->q_tx[i].ndesc)

-- 
2.53.0



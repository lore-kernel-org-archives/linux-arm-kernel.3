Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7229BF8A154
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 10:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1iXIMsdfyTbopCbtjg+sQNMkzBRT1ysNowZ3jnRrMDo=; b=zp1fUbv1LA7rqffI5qhVbYSHrh
	zmhpWjS+bcQEjWEy52DsohREP5+9dG5zKmtQFXOCPLSE9jk1vEDQjWk12eg6SUYlXVsevbygNuldL
	nR4BGoNu1R69hjCI4hstgCmYgi5CQVGSLcEQYtWBw85AeReEwVjvGXlgEtqlW5uC0DbMH1cGuDORK
	JGZTEjSaZeyEUJLSlqEarGFasbYm3the0pocIRj79YA+2keIYakR5qUDMtXWZdqlOqU934VfkF7Ci
	w75GREfHWW2wp+Mn48hElawuA3SZsVL/VNGlSKkaoYoElSWLv3pqLmcZp5i2qByHdpALvyk/PFkyb
	XNVXxWcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJzh-00000002JOZ-1sHa;
	Thu, 16 Apr 2026 10:30:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJzf-00000002JO3-0cgj;
	Thu, 16 Apr 2026 10:30:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 841A64416A;
	Thu, 16 Apr 2026 10:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14229C2BCAF;
	Thu, 16 Apr 2026 10:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776335442;
	bh=NPcDG1Ottrtk5BiLjOdCbSSnt84O39ClqPxApC6Xue0=;
	h=From:Date:Subject:To:Cc:From;
	b=axKAaQ/cj+oRnXUPg2U9dgZZO6H568/ZDENKG0RSgGEwGz+otgjG8DEeyc37bD370
	 YHZGJ+ZsLvNeAilM/hP+EDvmDR1H9Lzfpfm7BMNqlmf56GCJAOLEHj3lMPI+DDBv7/
	 0uQqU1AQIOzYgzOv7lTR5SI0DbJru4RTODwrOMDaYHelOY2sImomAzsVBnSOPmUkWr
	 yyy47t/pSfJ8ihdKOrABSvRHIuhfKG7JH0nVtgdhUd7FdJEsb44A75EwUzQpeZXCXv
	 y3xR95gB5AHBtU0sDq9tI5Xp9iw0Jnga77xVWoamJUgkRy3RyFZ9hUfPQ/HuaKQ0un
	 3qHUANfOHEesA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 16 Apr 2026 12:30:12 +0200
Subject: [PATCH net v2] net: airoha: Fix possible TX queue stall in
 airoha_qdma_tx_napi_poll()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-airoha-txq-potential-stall-v2-1-42c732074540@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NzQ6CMBAE4Fche3ZNf/jTk+9hOFRYYWPTYtsQD
 OHdbfDucWaSbzaIFJgiXIsNAi0c2bsc1KmAfjJuJOQhZ1BC1aIUDRoOfjKY1jfOPpFLbCzGZKx
 FM1Sqr7S4lNRCBuZAT14P/A6OEnS5nDgmHz7H4SKP6WdL/c9eJEpsWi10rR+yKvXtRcGRPfswQ
 rfv+xeYqI5cygAAAA==
X-Change-ID: 20260407-airoha-txq-potential-stall-ad52c53094e8
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_033043_227304_63934FBD 
X-CRM114-Status: GOOD (  15.79  )
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

Since multiple net_device TX queues can share the same hw QDMA TX queue,
there is no guarantee we have inflight packets queued in hw belonging to a
net_device TX queue stopped in the xmit path because hw QDMA TX queue
can be full. In this corner case the net_device TX queue will never be
re-activated. In order to avoid any potential net_device TX queue stall,
we need to wake all the net_device TX queues feeding the same hw QDMA TX
queue in airoha_qdma_tx_napi_poll routine.

Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Add txq_stopped parameter to avoid any possible corner cases where the
  netdev queue stalls.
- Link to v1: https://lore.kernel.org/r/20260413-airoha-txq-potential-stall-v1-1-7830363b1543@kernel.org
---
 drivers/net/ethernet/airoha/airoha_eth.c | 37 +++++++++++++++++++++++++++-----
 drivers/net/ethernet/airoha/airoha_eth.h |  1 +
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index e1ab15f1ee7d..19f67c7dd8e1 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -843,6 +843,21 @@ static int airoha_qdma_init_rx(struct airoha_qdma *qdma)
 	return 0;
 }
 
+static void airoha_qdma_wake_netdev_txqs(struct airoha_queue *q)
+{
+	struct airoha_qdma *qdma = q->qdma;
+	struct airoha_eth *eth = qdma->eth;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
+		struct airoha_gdm_port *port = eth->ports[i];
+
+		if (port && port->qdma == qdma)
+			netif_tx_wake_all_queues(port->dev);
+	}
+	q->txq_stopped = false;
+}
+
 static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
 {
 	struct airoha_tx_irq_queue *irq_q;
@@ -919,12 +934,21 @@ static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
 
 			txq = netdev_get_tx_queue(skb->dev, queue);
 			netdev_tx_completed_queue(txq, 1, skb->len);
-			if (netif_tx_queue_stopped(txq) &&
-			    q->ndesc - q->queued >= q->free_thr)
-				netif_tx_wake_queue(txq);
-
 			dev_kfree_skb_any(skb);
 		}
+
+		if (q->txq_stopped && q->ndesc - q->queued >= q->free_thr) {
+			/* Since multiple net_device TX queues can share the
+			 * same hw QDMA TX queue, there is no guarantee we have
+			 * inflight packets queued in hw belonging to a
+			 * net_device TX queue stopped in the xmit path.
+			 * In order to avoid any potential net_device TX queue
+			 * stall, we need to wake all the net_device TX queues
+			 * feeding the same hw QDMA TX queue.
+			 */
+			airoha_qdma_wake_netdev_txqs(q);
+		}
+
 unlock:
 		spin_unlock_bh(&q->lock);
 	}
@@ -1984,6 +2008,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	if (q->queued + nr_frags >= q->ndesc) {
 		/* not enough space in the queue */
 		netif_tx_stop_queue(txq);
+		q->txq_stopped = true;
 		spin_unlock_bh(&q->lock);
 		return NETDEV_TX_BUSY;
 	}
@@ -2039,8 +2064,10 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 				TX_RING_CPU_IDX_MASK,
 				FIELD_PREP(TX_RING_CPU_IDX_MASK, index));
 
-	if (q->ndesc - q->queued < q->free_thr)
+	if (q->ndesc - q->queued < q->free_thr) {
 		netif_tx_stop_queue(txq);
+		q->txq_stopped = true;
+	}
 
 	spin_unlock_bh(&q->lock);
 
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 95e557638617..87b328cfefb0 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -193,6 +193,7 @@ struct airoha_queue {
 	int ndesc;
 	int free_thr;
 	int buf_size;
+	bool txq_stopped;
 
 	struct napi_struct napi;
 	struct page_pool *page_pool;

---
base-commit: 1f5ffc672165ff851063a5fd044b727ab2517ae3
change-id: 20260407-airoha-txq-potential-stall-ad52c53094e8

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>



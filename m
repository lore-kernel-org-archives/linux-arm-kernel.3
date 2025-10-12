Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9728CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 09:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kN5/ilIo+JZwjBvr6gw3dBoY4gM4GAFP0osH7FpQv5Y=; b=SXfyCR58mE4dTHMuw9jX2P/wuz
	e514RwGv6mc/xQ/F177cZmh5/7DhlDH13JpOIU1ZwRR+nVzlUnth6/8aKK1LsMK2pmcEGrvV3umxO
	x//J4yPS44hi1vElz1or9flj9SmSFzqzh/8tMf06aXp37bS+kTWZ9iSIqYri2Ami7AxjV6GI2aWka
	rBrmH7hAY4GXopX4b62HVh1XrJyflUcW0AZV0AGE6pHsIu2sYmbefozCiHjktHAqUBXc7AoyGrVPT
	GLlcMho6DGa9rPyA7pEDaSYEXQ+jPMMpQEhg4YoJLm1KWH55+LP1T3Wx9gJ12BwywRk3NwveQNRaE
	gazJPRFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7sFj-0000000BD9O-2Ee9;
	Sun, 12 Oct 2025 09:20:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7sFg-0000000BD8y-3rbo;
	Sun, 12 Oct 2025 09:20:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF78642D6B;
	Sun, 12 Oct 2025 09:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1370EC4CEE7;
	Sun, 12 Oct 2025 09:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760260826;
	bh=3DV/u5wjSCtg1WSPlQteng/aS2VViRpDHJXCVKKehVo=;
	h=From:Date:Subject:To:Cc:From;
	b=lIoQ0XBnPfDb39ejCm9t7Ft7oUm2id6K2uOyaSxfR0R/YIHmbv+gz/S4E+TNeiCZC
	 nmVo7/0XGlSQKliLIyrkKNh1byogSLS2jIZKFPdnnJynMHTDChYCFQpscK2HvfHI6Y
	 5YSSM4geEyhrwZQbOEAvvSSTIEyfqP6yHGVRX4PgXF6qMVAAXcFgyW4Upwy3YnGcI4
	 6xHImMKb9V2ERh0lqnaH3EvUfNok9CFF5jZCSL7/KgC3Vvl6xdadEvIYva9VoQ2I4z
	 d7ufZ7hVAK8O6z7VUvzqnWzMfWs3wDRlzb3RVLzUP9ppQIGszhLi3eV0q1xRhXHytg
	 uQN/AGn+koO6Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 12 Oct 2025 11:19:44 +0200
Subject: [PATCH net v2] net: airoha: Take into account out-of-order tx
 completions in airoha_dev_xmit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251012-airoha-tx-busy-queue-v2-1-a600b08bab2d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAK9y62gC/32NQQ6CMBBFr0Jm7ZhOFaOuvIdhUegAE02rUyAQw
 t1tOIDL93/++yskVuEE92IF5UmSxJDBHgpoehc6RvGZwRpbkiGDTjT2DocZ6zEt+B15ZKx9S9R
 wcz2xhzz9KLcy79onBB6gymEvaYi67FcT7dV/60RIeGNybenNhcz58WIN/D5G7aDatu0HAPDQD
 b4AAAA=
X-Change-ID: 20251010-airoha-tx-busy-queue-bdf11cec83ed
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Simon Horman <horms@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_022029_032765_273AEA5F 
X-CRM114-Status: GOOD (  12.69  )
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

Completion napi can free out-of-order tx descriptors if hw QoS is
enabled and packets with different priority are queued to same DMA ring.
Take into account possible out-of-order reports checking if the tx queue
is full using circular buffer head/tail pointer instead of the number of
queued packets.

Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Suggested-by: Simon Horman <horms@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Fix corner case when the queue is full
- Link to v1: https://lore.kernel.org/r/20251010-airoha-tx-busy-queue-v1-1-9e1af5d06104@kernel.org
---
 drivers/net/ethernet/airoha/airoha_eth.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 833dd911980b3f698bd7e5f9fd9e2ce131dd5222..433a646e9831773bf63600e7c3d3b2176c4d133e 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1873,6 +1873,20 @@ static u32 airoha_get_dsa_tag(struct sk_buff *skb, struct net_device *dev)
 #endif
 }
 
+static bool airoha_dev_tx_queue_busy(struct airoha_queue *q, u32 nr_frags)
+{
+	u32 tail = q->tail <= q->head ? q->tail + q->ndesc : q->tail;
+	u32 index = q->head + nr_frags;
+
+	/* completion napi can free out-of-order tx descriptors if hw QoS is
+	 * enabled and packets with different priorities are queued to the same
+	 * DMA ring. Take into account possible out-of-order reports checking
+	 * if the tx queue is full using circular buffer head/tail pointers
+	 * instead of the number of queued packets.
+	 */
+	return index >= tail;
+}
+
 static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 				   struct net_device *dev)
 {
@@ -1926,7 +1940,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	txq = netdev_get_tx_queue(dev, qid);
 	nr_frags = 1 + skb_shinfo(skb)->nr_frags;
 
-	if (q->queued + nr_frags > q->ndesc) {
+	if (airoha_dev_tx_queue_busy(q, nr_frags)) {
 		/* not enough space in the queue */
 		netif_tx_stop_queue(txq);
 		spin_unlock_bh(&q->lock);

---
base-commit: 18a7e218cfcdca6666e1f7356533e4c988780b57
change-id: 20251010-airoha-tx-busy-queue-bdf11cec83ed

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>



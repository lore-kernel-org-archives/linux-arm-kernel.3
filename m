Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7C4CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=axhmsIVyXAx+zeh0tLgf+IueV3XZEbuWwxiEovhFxwY=; b=IJf5zT6gwf8+4mJBsWESHYaZD8
	U+IW2g1ywyLqYR9F3Z+EUC539iTWwteBRJvT09dU1sjYw6d9JiKXsxrH4Gv7iJErYO/VKQbDQiHwa
	ms2kXQ2LaUAU4pMEbcvwLlw3vfc7rVHoU7OfcHPUIwcK5Tf5gKaUjsq30Y+1p39MPLg+1LwCUzrye
	r/hCblXa4CNotjtzztkIjOEbfVopPcaFrhJHHIdDGy7EZZ4Cd0f0Co9WtKQELRCZ3y7AlHSwRrTv3
	A1aBrq4gN59FN04Uinf4LMmG2n8ZVYNqVx5xWTZTVMfkhH1DbUEJQsdsaj1kmthTKaOxqi2+WFm0+
	tmbFHfUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWUr-00000002HjL-1Kt3;
	Fri, 19 Jun 2026 10:30:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWUp-00000002Hj4-1tw8;
	Fri, 19 Jun 2026 10:30:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C252E44229;
	Fri, 19 Jun 2026 10:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 280201F000E9;
	Fri, 19 Jun 2026 10:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781865046;
	bh=axhmsIVyXAx+zeh0tLgf+IueV3XZEbuWwxiEovhFxwY=;
	h=From:Date:Subject:To:Cc;
	b=XtoHjbLM8nlm4XVWJekkRKxmgvyiNXeyen0PHsoLIoRPBX9lYJ21ZlT2oWM8QDp5n
	 mbshunc/Siir8Dh4KzKhnzF/Q8HQIiFC+SW0KrBSKXCDEOL/o03i53+bQw7hESayyZ
	 ahF5t8tzCIThCbQAj0RjzwvmXPJFfgouNJkjE34Nb5i6lMmzxTweEXGRTKHHG9kgHD
	 HuC2OiOFZ9MB2S7CbFU/HxrQ+VdYUlSgKk5OSgG1bAUMMlN7l4HAeLkBHE8be+PJNC
	 TawDd8SZGTlIk8rTqdsMOeq/N6DsAk51tsW9ZyXpB37bUX2H18zLx+26a/MRYNPLNU
	 8wsPjoCCkKUWQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 19 Jun 2026 12:30:28 +0200
Subject: [PATCH net v2] net: airoha: fix BQL underflow and UAF in shared
 QDMA TX ring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-airoha-bql-fixes-v2-1-4351d6a24484@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNzQrCMBCEX6Xs2ZUk0jZ68j2kh/5smsWS6KYUp
 fTdDbl7nPn4ZnZIJEwJbtUOQhsnjiEHc6pg9H2YCXnKGYwyjWq0xZ4l+h6H94KOP5TQ1e1gJq1
 s3V4gay+hArL1gEArdLn0nNYo33Kz6YL+L24aNTo3mdEoe621vT9JAi3nKDN0x3H8ABbFUnG2A
 AAA
X-Change-ID: 20260618-airoha-bql-fixes-f57b2d108573
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Wayen Yan <win847@gmail.com>, linux-arm-kernel@lists.infradead.org, 
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

When multiple netdevs share a QDMA TX ring and one device is stopped,
netdev_tx_reset_subqueue() zeroes that device's BQL counters while its
pending skbs remain in the shared HW TX ring. When NAPI later completes
those skbs via netdev_tx_completed_queue(), the already-zeroed
dql->num_queued counter underflows.
Moreover, in the airoha_remove() path, netdevs are unregistered
sequentially while skbs from previously unregistered netdevs may still
reference freed net_device memory via skb->dev, causing a use-after-free
during BQL accounting.
Fix both issues:
- Remove netdev_tx_reset_subqueue() from airoha_dev_stop() so pending
  skbs are completed naturally by NAPI with proper BQL accounting.
- Introduce airoha_qdma_tx_flush() to stop NAPI and flush BQL counters
  for all pending skbs while skb->dev references are still valid.
- Guard airoha_dev_xmit() with DEV_STATE_FLUSH to drop packets during
  teardown.
- Move DMA engine start into probe and stop into airoha_qdma_cleanup().

Fixes: a9c2ca61fec7 ("net: airoha: Support multiple net_devices for a single FE GDM port")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Introduce airoha_qdma_tx_flush() to account BQL in airoha_remove() or
  airoha_probe() error path.
- Fix possible NULL pointer dereference in airoha_qdma_cleanup().
- Introduce DEV_STATE_FLUSH().
- Move back airoha_hw_cleanup().
- Set proper Fixes tag.
- Link to v1: https://lore.kernel.org/r/20260618-airoha-bql-fixes-v1-1-ffd2c2089518@kernel.org
---
 drivers/net/ethernet/airoha/airoha_eth.c | 87 +++++++++++++++++++++++---------
 drivers/net/ethernet/airoha/airoha_eth.h |  1 +
 2 files changed, 63 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 64dde6464f3f..e81cd806b57b 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1004,6 +1004,7 @@ static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
 
 		e = &q->entry[index];
 		skb = e->skb;
+		e->skb = NULL;
 
 		dma_unmap_single(eth->dev, e->dma_addr, e->dma_len,
 				 DMA_TO_DEVICE);
@@ -1523,10 +1524,26 @@ static int airoha_qdma_init(struct platform_device *pdev,
 	return airoha_qdma_hw_init(qdma);
 }
 
-static void airoha_qdma_cleanup(struct airoha_qdma *qdma)
+static void airoha_qdma_cleanup(struct airoha_eth *eth,
+				struct airoha_qdma *qdma)
 {
 	int i;
 
+	if (test_bit(DEV_STATE_INITIALIZED, &eth->state)) {
+		u32 status;
+
+		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
+				  GLOBAL_CFG_TX_DMA_EN_MASK |
+				  GLOBAL_CFG_RX_DMA_EN_MASK);
+		if (read_poll_timeout(airoha_qdma_rr, status,
+				      !(status & (GLOBAL_CFG_TX_DMA_BUSY_MASK |
+						  GLOBAL_CFG_RX_DMA_BUSY_MASK)),
+				      USEC_PER_MSEC, 50 * USEC_PER_MSEC, true,
+				      qdma, REG_QDMA_GLOBAL_CFG))
+			dev_warn(eth->dev,
+				 "QDMA DMA engine busy timeout\n");
+	}
+
 	for (i = 0; i < ARRAY_SIZE(qdma->q_rx); i++) {
 		if (!qdma->q_rx[i].ndesc)
 			continue;
@@ -1593,7 +1610,7 @@ static int airoha_hw_init(struct platform_device *pdev,
 	return 0;
 error:
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
-		airoha_qdma_cleanup(&eth->qdma[i]);
+		airoha_qdma_cleanup(eth, &eth->qdma[i]);
 
 	return err;
 }
@@ -1603,7 +1620,7 @@ static void airoha_hw_cleanup(struct airoha_eth *eth)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
-		airoha_qdma_cleanup(&eth->qdma[i]);
+		airoha_qdma_cleanup(eth, &eth->qdma[i]);
 	airoha_ppe_deinit(eth);
 }
 
@@ -1637,6 +1654,35 @@ static void airoha_qdma_stop_napi(struct airoha_qdma *qdma)
 	}
 }
 
+static void airoha_qdma_tx_flush(struct airoha_qdma *qdma)
+{
+	int i;
+
+	airoha_qdma_stop_napi(qdma);
+
+	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
+		struct airoha_queue *q = &qdma->q_tx[i];
+		int j;
+
+		if (!q->ndesc)
+			continue;
+
+		spin_lock_bh(&q->lock);
+		for (j = 0; j < q->ndesc; j++) {
+			struct airoha_queue_entry *e = &q->entry[j];
+			struct sk_buff *skb = e->skb;
+			struct netdev_queue *txq;
+
+			if (!skb)
+				continue;
+
+			txq = skb_get_tx_queue(skb->dev, skb);
+			netdev_tx_completed_queue(txq, 1, skb->len);
+		}
+		spin_unlock_bh(&q->lock);
+	}
+}
+
 static void airoha_dev_get_hw_stats(struct airoha_gdm_dev *dev)
 {
 	struct airoha_gdm_port *port = dev->port;
@@ -1837,9 +1883,6 @@ static int airoha_dev_open(struct net_device *netdev)
 	}
 	port->users++;
 
-	airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
-			GLOBAL_CFG_TX_DMA_EN_MASK |
-			GLOBAL_CFG_RX_DMA_EN_MASK);
 	qdma->users++;
 
 	if (!airoha_is_lan_gdm_dev(dev) &&
@@ -1880,12 +1923,9 @@ static int airoha_dev_stop(struct net_device *netdev)
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_gdm_port *port = dev->port;
 	struct airoha_qdma *qdma = dev->qdma;
-	int i;
 
 	netif_tx_disable(netdev);
 	airoha_set_vip_for_gdm_port(dev, false);
-	for (i = 0; i < netdev->num_tx_queues; i++)
-		netdev_tx_reset_subqueue(netdev, i);
 
 	if (--port->users)
 		airoha_set_port_mtu(dev->eth, port);
@@ -1893,19 +1933,7 @@ static int airoha_dev_stop(struct net_device *netdev)
 		airoha_set_gdm_port_fwd_cfg(qdma->eth,
 					    REG_GDM_FWD_CFG(port->id),
 					    FE_PSE_PORT_DROP);
-
-	if (!--qdma->users) {
-		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
-				  GLOBAL_CFG_TX_DMA_EN_MASK |
-				  GLOBAL_CFG_RX_DMA_EN_MASK);
-
-		for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
-			if (!qdma->q_tx[i].ndesc)
-				continue;
-
-			airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
-		}
-	}
+	qdma->users--;
 
 	return 0;
 }
@@ -2191,6 +2219,9 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	u16 index;
 	u8 fport;
 
+	if (test_bit(DEV_STATE_FLUSH, &dev->eth->state))
+		goto error;
+
 	qid = airoha_qdma_get_txq(qdma, skb_get_queue_mapping(skb));
 	tag = airoha_get_dsa_tag(skb, netdev);
 
@@ -3413,8 +3444,12 @@ static int airoha_probe(struct platform_device *pdev)
 	if (err)
 		goto error_netdev_free;
 
-	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
+	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++) {
 		airoha_qdma_start_napi(&eth->qdma[i]);
+		airoha_qdma_set(&eth->qdma[i], REG_QDMA_GLOBAL_CFG,
+				GLOBAL_CFG_TX_DMA_EN_MASK |
+				GLOBAL_CFG_RX_DMA_EN_MASK);
+	}
 
 	for_each_child_of_node(pdev->dev.of_node, np) {
 		if (!of_device_is_compatible(np, "airoha,eth-mac"))
@@ -3437,8 +3472,9 @@ static int airoha_probe(struct platform_device *pdev)
 	return 0;
 
 error_napi_stop:
+	set_bit(DEV_STATE_FLUSH, &eth->state);
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
-		airoha_qdma_stop_napi(&eth->qdma[i]);
+		airoha_qdma_tx_flush(&eth->qdma[i]);
 
 	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
 		struct airoha_gdm_port *port = eth->ports[i];
@@ -3474,8 +3510,9 @@ static void airoha_remove(struct platform_device *pdev)
 	struct airoha_eth *eth = platform_get_drvdata(pdev);
 	int i;
 
+	set_bit(DEV_STATE_FLUSH, &eth->state);
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
-		airoha_qdma_stop_napi(&eth->qdma[i]);
+		airoha_qdma_tx_flush(&eth->qdma[i]);
 
 	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
 		struct airoha_gdm_port *port = eth->ports[i];
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 41d2e7a1f9fb..f6dce5e74e02 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -92,6 +92,7 @@ enum {
 enum {
 	DEV_STATE_INITIALIZED,
 	DEV_STATE_REGISTERED,
+	DEV_STATE_FLUSH,
 };
 
 enum {

---
base-commit: a887f2c7da66a805a55fd8706d45faec85f646db
change-id: 20260618-airoha-bql-fixes-f57b2d108573

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>



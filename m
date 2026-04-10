Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431E9F45A0D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 22:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kF298yk2g0/UD+gtMZJHmW/YcErJt71/iKzd5VLh5As=; b=KBn9Wisz/Nr4D/lC0kGtmYkiQ8
	Jk44HNMRJIFsH1Pz4qwYdibA2rHo6kTj6sx3no+KYQv5m9x5FxRbThfoYAwzw6EZAzZRXRhMDhqpE
	YLfqAjHkrNWuHvYr5YPh7PtkxSLpAJvdO0gTFbxt0E8zhUxAqRBB3f6mC667ttFikUViuRomWNRPV
	ksoTpVtsvSQrN98JikMVJYmgY7Qrx9U+zPf0Bnj2cPTnZqzpA4zrUUEtO5zvulBhEKvd9hErwSDI/
	FAIk8Ad9UOqwLAD2/49zp+6dmwOQY7y5JZCxtFH8NB91h9c+gUCDBOxpMVS3lMkgBp8CuNQ1ndKwe
	PZBiegXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBJzM-0000000Cqzu-44i4;
	Fri, 10 Apr 2026 22:06:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBJzM-0000000CqzH-15LJ;
	Fri, 10 Apr 2026 22:06:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AA5360141;
	Fri, 10 Apr 2026 22:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C74C19421;
	Fri, 10 Apr 2026 22:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775858767;
	bh=bCcl5UOrdtPlsdetM6cs63vgz5dFlpaseW2DXO7P3bw=;
	h=From:Date:Subject:To:Cc:From;
	b=BrEojve5DwwLPSNPgbpJ6eOfMhJOj3xeERNBKWpfNc8iYz97Gd9UyoCGwhCD9vkuV
	 pFzKbPGBpa3at66hqPPxUnagpX1L9FO4MCude7IX6v/OnQPX+lqkNyh5CJQeIM5jgV
	 upQTKCmdjkCA5RHltjmjeRfHNALwolUmPyyq1+r2AIVfvRnatns5xFsi5+b8JSsVRs
	 fupAw5s6btSa5BGCkRT3mtB+eFNM7QDe3iZ+Ou+hNNPdIc3ytuFOY5YLlhLaP7FeZw
	 P47FOmc9fwGERpxmiMP7IfX8ZOjg0WDwyPD16+Hah9XGfeP6WymGJgASkYE5HXjuOJ
	 S+ejHGwmqHdhw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 11 Apr 2026 00:05:29 +0200
Subject: [PATCH net-next] net: airoha: Wait for TX to complete in
 airoha_dev_stop()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-airoha-fix-ndo_stop-v1-1-caddaa181739@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2M0QpAQBQFf0X32a21RPkVSYuD+3JXu5uU/LvN4
 zTNPBQRBJH64qGAS6J4zVCVBS2H0x0sa2ayxramqQw7Cf5wvMnNuvopJn8y5nmrl842DoZyeQZ
 k/18HUiRW3InG9/0A47rS0W8AAAA=
X-Change-ID: 20260410-airoha-fix-ndo_stop-ebbf3c724ae0
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

Wait for TX to complete in airoha_dev_stop routine before stopping the
TX DMA and run airoha_qdma_cleanup_tx_queue routine. Moreover,
start/stop TX/RX NAPIs in ndo_open()/ndo_stop() callbacks in order to be
sure the TX NAPIs have completed before stopping the TX DMA engine in
airoha_dev_stop routine.
Please note this patch on the commit 'b1c803d5c816 ("net: airoha: Rework
the code flow in airoha_remove() and in airoha_probe() error path")'
that is available only in net-next tree at the moment.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 44 +++++++++++++++++---------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 8e4b043af4bc..9e40c8f375c1 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1662,10 +1662,12 @@ static int airoha_dev_open(struct net_device *dev)
 		      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
 		      FIELD_PREP(GDM_LONG_LEN_MASK, len));
 
-	airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
-			GLOBAL_CFG_TX_DMA_EN_MASK |
-			GLOBAL_CFG_RX_DMA_EN_MASK);
-	atomic_inc(&qdma->users);
+	if (!atomic_fetch_inc(&qdma->users)) {
+		airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
+				GLOBAL_CFG_TX_DMA_EN_MASK |
+				GLOBAL_CFG_RX_DMA_EN_MASK);
+		airoha_qdma_start_napi(qdma);
+	}
 
 	if (port->id == AIROHA_GDM2_IDX &&
 	    airoha_ppe_is_enabled(qdma->eth, 1)) {
@@ -1684,18 +1686,26 @@ static int airoha_dev_stop(struct net_device *dev)
 	struct airoha_qdma *qdma = port->qdma;
 	int i, err;
 
-	netif_tx_disable(dev);
 	err = airoha_set_vip_for_gdm_port(port, false);
 	if (err)
 		return err;
 
-	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++)
-		netdev_tx_reset_subqueue(dev, i);
-
 	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
 				    FE_PSE_PORT_DROP);
 
+	netif_tx_disable(dev);
 	if (atomic_dec_and_test(&qdma->users)) {
+		u32 val;
+
+		/* Wait for TX to complete */
+		err = read_poll_timeout(airoha_qdma_rr, val,
+					!(val & GLOBAL_CFG_TX_DMA_BUSY_MASK),
+					USEC_PER_MSEC, 100 * USEC_PER_MSEC,
+					false, qdma, REG_QDMA_GLOBAL_CFG);
+		if (err)
+			return err;
+
+		airoha_qdma_stop_napi(qdma);
 		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
 				  GLOBAL_CFG_TX_DMA_EN_MASK |
 				  GLOBAL_CFG_RX_DMA_EN_MASK);
@@ -1708,6 +1718,9 @@ static int airoha_dev_stop(struct net_device *dev)
 		}
 	}
 
+	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++)
+		netdev_tx_reset_subqueue(dev, i);
+
 	return 0;
 }
 
@@ -3048,9 +3061,6 @@ static int airoha_probe(struct platform_device *pdev)
 	if (err)
 		goto error_netdev_free;
 
-	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
-		airoha_qdma_start_napi(&eth->qdma[i]);
-
 	for_each_child_of_node(pdev->dev.of_node, np) {
 		if (!of_device_is_compatible(np, "airoha,eth-mac"))
 			continue;
@@ -3061,20 +3071,17 @@ static int airoha_probe(struct platform_device *pdev)
 		err = airoha_alloc_gdm_port(eth, np);
 		if (err) {
 			of_node_put(np);
-			goto error_napi_stop;
+			goto error_netdev_unregister;
 		}
 	}
 
 	err = airoha_register_gdm_devices(eth);
 	if (err)
-		goto error_napi_stop;
+		goto error_netdev_unregister;
 
 	return 0;
 
-error_napi_stop:
-	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
-		airoha_qdma_stop_napi(&eth->qdma[i]);
-
+error_netdev_unregister:
 	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
 		struct airoha_gdm_port *port = eth->ports[i];
 
@@ -3098,9 +3105,6 @@ static void airoha_remove(struct platform_device *pdev)
 	struct airoha_eth *eth = platform_get_drvdata(pdev);
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
-		airoha_qdma_stop_napi(&eth->qdma[i]);
-
 	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
 		struct airoha_gdm_port *port = eth->ports[i];
 

---
base-commit: 42f9b4c6ef19e71d2c7d9bfd3c5037d4fe434ad7
change-id: 20260410-airoha-fix-ndo_stop-ebbf3c724ae0

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>



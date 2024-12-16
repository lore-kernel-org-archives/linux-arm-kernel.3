Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F90E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 17:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8iFsHZsvtPocVOs7tM+JW4SZTGG9RLuFNJIb6l3Vkn0=; b=3jD04ezfzSy5EBXJobIPTJr93d
	wgfUJtH0wEWrX9xTLWWO6zAk8mStTOkzrrlsXtwebCKTuauzB1JwwmsTngkmZ1kRx7c/YaY07T0bP
	4U9G496RzpIE7wb7qormNgDA6kYovLXdOzf+a9UGWSJgZLYAdDeAs8gy7PBx4WDgp7C6LHGdk+5I2
	2johqgaD+LOTYOIgC8S0VHCZMR1v45XUQ7P6iVnfonNQvXhejIUBBfW6o6mARAqaXvXFA+Y8Ygusv
	7QjEHiPFoUBP0lbsnUj+G/wKvZCcipiHPzreyysx3iF5Pedecn0irMJ0tAyvcixrs4j4Fi7AlImVC
	D2OlSqpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFFG-0000000ApAg-34m7;
	Mon, 16 Dec 2024 17:51:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFCR-0000000Aocb-2YCL;
	Mon, 16 Dec 2024 17:48:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2FAFA4197B;
	Mon, 16 Dec 2024 17:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD1DC4CED0;
	Mon, 16 Dec 2024 17:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734371286;
	bh=YY6i8qBttwJwMGYHa0FJ7uNKRckcwymjOs5Mh2rzAaI=;
	h=From:Date:Subject:To:Cc:From;
	b=psRGZzTQFpUcDy5NQLC/ikAzjhe3peCZPny1d/+r6ut0Dvkr7Bshm/n4nGTk3/yIK
	 fBQu2KIXXmvpQbHvisNK9VMFMqgtWyrOOhkOUxu3cxUS6/areYexT0DCwt1k+rXZce
	 wsumdQafCFe0A0hIjqOqULnJL0ovbjebpKkglciOyQa7raZXG8GCDn94zUJFsoNOJv
	 bpEt4qX622ulz4X0DOBIQ5HndttcXwg0hfwsRyTTrZArPXmsTReJIHSjCdOmxNm/Nv
	 pEoCkB8Nv+Mkirqk3KMQrUgZLdfD72LztmsY5QHGRCFZIoCQ+zr65x9OoC+0YFpu6p
	 Q2KUurSu4FKhw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 16 Dec 2024 18:47:33 +0100
Subject: [PATCH net-next v2] net: airoha: Fix error path in airoha_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-airoha_probe-error-path-fix-v2-1-6b10e04e9a5c@kernel.org>
X-B4-Tracking: v=1; b=H4sIALRnYGcC/42NQQ6CMBAAv0L27Bq6gAme/AchptCVbjS02RKiI
 fzdygs8zhxmNkiswgmuxQbKqyQJcwY6FTB6O0+M4jIDlVQbMg1a0eDtPWoYGFk1KEa7eHzIG5t
 hvAzsSqaSIReictZHvesze0lL0M8xW83P/tddDRp0jtrWELmqrm5P1plf56AT9Pu+fwEMwNMbx
 wAAAA==
X-Change-ID: 20241215-airoha_probe-error-path-fix-5bc6bed0e20e
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_094807_794896_DBEA0395 
X-CRM114-Status: GOOD (  13.89  )
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

Do not run napi_disable() if airoha_hw_init() fails since Tx/Rx napi
has not been started yet. In order to fix the issue, introduce
airoha_qdma_stop_napi routine and remove napi_disable in
airoha_hw_cleanup().

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- rename airoha_qdma_disable_napi() in airoha_qdma_stop_napi()
- Link to v1: https://lore.kernel.org/r/20241215-airoha_probe-error-path-fix-v1-1-dd299122d343@kernel.org
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 33 ++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 6c683a12d5aa52dd9d966df123509075a989c0b3..d8bfc21a5b194478e18201ee3beca7494c223e24 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -2138,17 +2138,14 @@ static void airoha_hw_cleanup(struct airoha_qdma *qdma)
 		if (!qdma->q_rx[i].ndesc)
 			continue;
 
-		napi_disable(&qdma->q_rx[i].napi);
 		netif_napi_del(&qdma->q_rx[i].napi);
 		airoha_qdma_cleanup_rx_queue(&qdma->q_rx[i]);
 		if (qdma->q_rx[i].page_pool)
 			page_pool_destroy(qdma->q_rx[i].page_pool);
 	}
 
-	for (i = 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++) {
-		napi_disable(&qdma->q_tx_irq[i].napi);
+	for (i = 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++)
 		netif_napi_del(&qdma->q_tx_irq[i].napi);
-	}
 
 	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
 		if (!qdma->q_tx[i].ndesc)
@@ -2173,6 +2170,21 @@ static void airoha_qdma_start_napi(struct airoha_qdma *qdma)
 	}
 }
 
+static void airoha_qdma_stop_napi(struct airoha_qdma *qdma)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++)
+		napi_disable(&qdma->q_tx_irq[i].napi);
+
+	for (i = 0; i < ARRAY_SIZE(qdma->q_rx); i++) {
+		if (!qdma->q_rx[i].ndesc)
+			continue;
+
+		napi_disable(&qdma->q_rx[i].napi);
+	}
+}
+
 static void airoha_update_hw_stats(struct airoha_gdm_port *port)
 {
 	struct airoha_eth *eth = port->qdma->eth;
@@ -2738,7 +2750,7 @@ static int airoha_probe(struct platform_device *pdev)
 
 	err = airoha_hw_init(pdev, eth);
 	if (err)
-		goto error;
+		goto error_hw_cleanup;
 
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
 		airoha_qdma_start_napi(&eth->qdma[i]);
@@ -2753,13 +2765,16 @@ static int airoha_probe(struct platform_device *pdev)
 		err = airoha_alloc_gdm_port(eth, np);
 		if (err) {
 			of_node_put(np);
-			goto error;
+			goto error_napi_stop;
 		}
 	}
 
 	return 0;
 
-error:
+error_napi_stop:
+	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
+		airoha_qdma_stop_napi(&eth->qdma[i]);
+error_hw_cleanup:
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
 		airoha_hw_cleanup(&eth->qdma[i]);
 
@@ -2780,8 +2795,10 @@ static void airoha_remove(struct platform_device *pdev)
 	struct airoha_eth *eth = platform_get_drvdata(pdev);
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
+	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++) {
+		airoha_qdma_stop_napi(&eth->qdma[i]);
 		airoha_hw_cleanup(&eth->qdma[i]);
+	}
 
 	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
 		struct airoha_gdm_port *port = eth->ports[i];

---
base-commit: bc6a5efe3dcd9ada8d76eeb69039a11a86add39b
change-id: 20241215-airoha_probe-error-path-fix-5bc6bed0e20e

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>



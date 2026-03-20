Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3427C109318F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+rj/cbUyvlyk+T5nRH8sV7NIh/OQxGqHsc2ssBdDOxE=; b=ukUPdaCFE6/Grm+UNxMnJxUevc
	JPE7fg1ACphVwbHBp2D7DHWrlpkaVW4r3qGlTQ4lDS9hCCWYVtOZLg/5egOVAQj6Sa1068FJGsCcH
	dNJPR6ZGd5is/xsDavrNAlROJUzfBzT92cUycpsY2CAENYu9/zd+NVh12Ga636QEczmFYJhddzs9O
	+9yscj8WVYQ74t+WJLkAJtcr+BKbzrSPWOsAjzEe5KuWnonrlsXgKGC5so7AIcYBrHipCBBOB3Nu/
	FMk20LjERBT1Q4z1zrgRUsFqUn3bufL0zowiYvYt5YDJbdyTxNvlfl1MQJ0gXvaMusRjPNBC9sEt+
	tcsDCFFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VRY-0000000CNPX-3098;
	Fri, 20 Mar 2026 08:42:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VRW-0000000CNOL-1NsQ;
	Fri, 20 Mar 2026 08:42:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E99FE41A0F;
	Fri, 20 Mar 2026 08:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B84BC4CEF7;
	Fri, 20 Mar 2026 08:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773996172;
	bh=IftfdfYj6xOLoTQ320B8JN0lhYVBzgNKhPmRTvF/cps=;
	h=From:Date:Subject:To:Cc:From;
	b=VmYBuxEVM321VPfsqQgzg+EuF/RDtIogR8Wq0NpFLv830DJfohD+hZsPmuad3k5Zn
	 0ooCUo9KgCtYx7XkhxqqRCO93Z4h1MJgKEtun4rZyucYuaHSz6ZQ0k7fzhLdyUYHlZ
	 0xnApmSWGawPyxuOotC/u9aU032yoS9zPHPdaSc0ZYzltEUxymHDZ6CpTZrBE7Embe
	 MCtZp8bt2qHTVULBwTIShUyx4WuHBsjLaXSutR5WcwwfezJxRcGvI2E0Zw+qLQ/193
	 4NRgRGVijIVFKepBMslRPirZr/aZkwmVU5nS9BKoxatffk972UJCJa/Ri8bmahsfR4
	 pYWqmAmE2AhIw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 20 Mar 2026 09:42:28 +0100
Subject: [PATCH net-next] net: airoha: Rework the code flow in
 airoha_remove() and in airoha_probe() error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-airoha-remove-rework-v1-1-adeef7e3c01f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MwQqDMBAFf0X23IU0URv8ldJDMK+6lCayESuI/
 27oaZjDzEEFKig0NAcpNimSU5X7raFxDmkCS6xO1tjeOGs4iOY5sOKbN1T8sn7YO++6to2Pzke
 q6aJ4y/7fPilh5YR9pdd5Xn86C/hwAAAA
X-Change-ID: 20260320-airoha-remove-rework-8383544d758d
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014254_417572_D98D6966 
X-CRM114-Status: GOOD (  15.29  )
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

As suggested by Simon in [0], rework the code flow in airoha_remove()
and in the airoha_probe() error path in order to rely on a more common
approach un-registering configured net-devices first and destroying the
hw resources at the end of the code.
Introduce airoha_qdma_cleanup routine to release QDMA resources.

[0] https://lore.kernel.org/netdev/20251214-airoha-fix-dev-registration-v1-1-860e027ad4c6@kernel.org/

Suggested-by: Simon Horman <horms@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 82 ++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index db9d9531711e3afc02095bb5fba983880c63ebf4..2caef0f74a3ee6c907ec000357d96422cbfee28b 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1368,6 +1368,33 @@ static int airoha_qdma_init(struct platform_device *pdev,
 	return airoha_qdma_hw_init(qdma);
 }
 
+static void airoha_qdma_cleanup(struct airoha_qdma *qdma)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(qdma->q_rx); i++) {
+		if (!qdma->q_rx[i].ndesc)
+			continue;
+
+		netif_napi_del(&qdma->q_rx[i].napi);
+		airoha_qdma_cleanup_rx_queue(&qdma->q_rx[i]);
+		if (qdma->q_rx[i].page_pool) {
+			page_pool_destroy(qdma->q_rx[i].page_pool);
+			qdma->q_rx[i].page_pool = NULL;
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++)
+		netif_napi_del(&qdma->q_tx_irq[i].napi);
+
+	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
+		if (!qdma->q_tx[i].ndesc)
+			continue;
+
+		airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
+	}
+}
+
 static int airoha_hw_init(struct platform_device *pdev,
 			  struct airoha_eth *eth)
 {
@@ -1395,41 +1422,30 @@ static int airoha_hw_init(struct platform_device *pdev,
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++) {
 		err = airoha_qdma_init(pdev, eth, &eth->qdma[i]);
 		if (err)
-			return err;
+			goto error;
 	}
 
 	err = airoha_ppe_init(eth);
 	if (err)
-		return err;
+		goto error;
 
 	set_bit(DEV_STATE_INITIALIZED, &eth->state);
 
 	return 0;
+error:
+	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
+		airoha_qdma_cleanup(&eth->qdma[i]);
+
+	return err;
 }
 
-static void airoha_hw_cleanup(struct airoha_qdma *qdma)
+static void airoha_hw_cleanup(struct airoha_eth *eth)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(qdma->q_rx); i++) {
-		if (!qdma->q_rx[i].ndesc)
-			continue;
-
-		netif_napi_del(&qdma->q_rx[i].napi);
-		airoha_qdma_cleanup_rx_queue(&qdma->q_rx[i]);
-		if (qdma->q_rx[i].page_pool)
-			page_pool_destroy(qdma->q_rx[i].page_pool);
-	}
-
-	for (i = 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++)
-		netif_napi_del(&qdma->q_tx_irq[i].napi);
-
-	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
-		if (!qdma->q_tx[i].ndesc)
-			continue;
-
-		airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
-	}
+	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
+		airoha_qdma_cleanup(&eth->qdma[i]);
+	airoha_ppe_deinit(eth);
 }
 
 static void airoha_qdma_start_napi(struct airoha_qdma *qdma)
@@ -3028,7 +3044,7 @@ static int airoha_probe(struct platform_device *pdev)
 
 	err = airoha_hw_init(pdev, eth);
 	if (err)
-		goto error_hw_cleanup;
+		return err;
 
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
 		airoha_qdma_start_napi(&eth->qdma[i]);
@@ -3043,23 +3059,19 @@ static int airoha_probe(struct platform_device *pdev)
 		err = airoha_alloc_gdm_port(eth, np);
 		if (err) {
 			of_node_put(np);
-			goto error_napi_stop;
+			goto error;
 		}
 	}
 
 	err = airoha_register_gdm_devices(eth);
 	if (err)
-		goto error_napi_stop;
+		goto error;
 
 	return 0;
 
-error_napi_stop:
+error:
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
 		airoha_qdma_stop_napi(&eth->qdma[i]);
-	airoha_ppe_deinit(eth);
-error_hw_cleanup:
-	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
-		airoha_hw_cleanup(&eth->qdma[i]);
 
 	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
 		struct airoha_gdm_port *port = eth->ports[i];
@@ -3071,6 +3083,8 @@ static int airoha_probe(struct platform_device *pdev)
 			unregister_netdev(port->dev);
 		airoha_metadata_dst_free(port);
 	}
+	airoha_hw_cleanup(eth);
+
 	free_netdev(eth->napi_dev);
 	platform_set_drvdata(pdev, NULL);
 
@@ -3082,10 +3096,8 @@ static void airoha_remove(struct platform_device *pdev)
 	struct airoha_eth *eth = platform_get_drvdata(pdev);
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++) {
+	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
 		airoha_qdma_stop_napi(&eth->qdma[i]);
-		airoha_hw_cleanup(&eth->qdma[i]);
-	}
 
 	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
 		struct airoha_gdm_port *port = eth->ports[i];
@@ -3096,9 +3108,9 @@ static void airoha_remove(struct platform_device *pdev)
 		unregister_netdev(port->dev);
 		airoha_metadata_dst_free(port);
 	}
-	free_netdev(eth->napi_dev);
+	airoha_hw_cleanup(eth);
 
-	airoha_ppe_deinit(eth);
+	free_netdev(eth->napi_dev);
 	platform_set_drvdata(pdev, NULL);
 }
 

---
base-commit: ca7e99335aea7c5977683624ba319157a4603f96
change-id: 20260320-airoha-remove-rework-8383544d758d

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>



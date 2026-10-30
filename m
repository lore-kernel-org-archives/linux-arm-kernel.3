Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB17606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bW5md6FA;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U1bvSaVR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e4HnHpVnYB1WGb4ZDGkaUo9loDMHiMw/RxGXhrKxTd8=; b=bW5md6FAYPkG8O
	1/tnkOPVN7maFajAS8e83qOjS1E1g0ojXOJzg3TXGL5j2WjYVqwncN6JwpscH3HXP/TwyPl4F/e9g
	N7uQ9cRBFF/Nh0gIw2pRwkNkmMK3mMkqyETswYdUJHQnJ1GMrskrFdEaHWx5uQJ1THBvhHNK4PW92
	/hcf/55wT820fHL0yLrKtTTh/EMBUJ9RQctgWTZShmcutxFV6WCLLJW1HCwwgf1qCym3EGN/ALO1A
	lMo6WstkZycVr3fL0d0c09qrsQQsFcr7EKXtmL1cSgOgduz3DB6bvX7TgzC/CcivEHtWnMx4oAmV8
	vYWJG9WPlNJdT6IphqOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMo50-0000000Bux9-1EAo;
	Fri, 30 Oct 2026 14:59:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMo4t-0000000ButY-1YBb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 14:59:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CB1D760619;
	Fri, 30 Oct 2026 14:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466021F00A16;
	Fri, 30 Oct 2026 14:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793372374;
	bh=e4HnHpVnYB1WGb4ZDGkaUo9loDMHiMw/RxGXhrKxTd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U1bvSaVR9FQzuTJzGirkRuF+7UkThFwFOJeerdBNiQBB3Psne2dsjP5ueaynKDS/l
	 AWjHulgf2/iOL8giLKoSoRhqPGxRb+/J9u+R/391Sz8zu1akwhBhoyb7UER38MoQz1
	 cY0mlmtPRN3Frzy5uv0EZDpscGHzp+a7hQdIxfGuNINfpTO+9ofpAIC5HnP3M8157m
	 S1H11Tmo6RrDjkHt9Dbbk1liID+DmpFt3Q9lWbNcWlX7QWV/wmURjIOZb3aIEmsiNa
	 f8nSMLQI0KHm0+kjkxV1tdwg6g+ZOLzhFETNGwXTgVAsnPM0czbZoVWl+1D2L+KlPy
	 wz3+iOA607bqg==
From: Joshua Crofts <crofts@kernel.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/3] dmaengine: ti: remove redundant pm_runtime_dont_use_autosuspend() calls
Date: Fri, 30 Oct 2026 14:59:01 +0000
Message-ID: <20261030145901.1393-4-crofts@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030145901.1393-1-crofts@kernel.org>
References: <20261030145901.1393-1-crofts@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls. Additionally, remove an unneeded
label as a consequence.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/dma/ti/cppi41.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
index 88756dccd62c..e1132e330fad 100644
--- a/drivers/dma/ti/cppi41.c
+++ b/drivers/dma/ti/cppi41.c
@@ -1108,7 +1108,7 @@ static int cppi41_dma_probe(struct platform_device *pdev)
 
 	ret = init_cppi41(dev, cdd);
 	if (ret)
-		goto err_init_cppi;
+		goto err_get_n_chans;
 
 	ret = cppi41_add_chans(dev, cdd);
 	if (ret)
@@ -1142,8 +1142,6 @@ static int cppi41_dma_probe(struct platform_device *pdev)
 	dma_async_device_unregister(&cdd->ddev);
 err_chans:
 	deinit_cppi41(dev, cdd);
-err_init_cppi:
-	pm_runtime_dont_use_autosuspend(dev);
 err_get_n_chans:
 err_get_sync:
 	pm_runtime_put_sync(dev);
@@ -1165,7 +1163,6 @@ static void cppi41_dma_remove(struct platform_device *pdev)
 
 	devm_free_irq(&pdev->dev, cdd->irq, cdd);
 	deinit_cppi41(&pdev->dev, cdd);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.47.3



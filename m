Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013A1606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pw+YV40P;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jX4Mooqp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z0QOAQM4fSBIhv7Msh1ZYgn8c+kjmPiD8GbY1XzGggQ=; b=Pw+YV40P+3Ps3x
	APkl3HT2+m08qvOxyBdODtWmDNGtFyl+FdVQzezYL3h/Gt+i0Ia2ai7IpwtuyKw9TvezMjIvqz6Ks
	6keBrzGgEQzhnJpKUV1Wgo2HMavgBtUCtkrkHv6fxMpLO0OZf6c13EGm0gKmmwWpvX4m9NR+VIm5k
	RHF3TgbaVHpSImBp3fQ4wM0J32vKzeOdtn2xjdCrAl2QYdwH3v4ttc6bL5LFL7Rt9RtQJ3NRU1+w0
	sPF2h8RESX9zqrnYwVbBeHdGixRzSM3XStP9bJIqhVbA9cOZk89g0EkLHXSBGdzg98fucXRiiN1lt
	PqmMEOKLrEb69EUv+2Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMo50-0000000BuwO-0ALs;
	Fri, 30 Oct 2026 14:59:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMo4q-0000000BusI-1Y4r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 14:59:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 751BA60627;
	Fri, 30 Oct 2026 14:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB1A1F000C1;
	Fri, 30 Oct 2026 14:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793372371;
	bh=Z0QOAQM4fSBIhv7Msh1ZYgn8c+kjmPiD8GbY1XzGggQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jX4Mooqp4xrMb0+1+GC6lE8bgKtlGDh7WWSPENB/JTilTqo2NwrO9MM6aLSOo+y/k
	 zNtEcgN/4VrjbqEWM7nCZIGlwZCBOzBT2JJRcHzs89wNRCp3g6kEWtSKe3uuCqWGXN
	 X0LxkGOhIOc1Swwr2EsMLVErQaydMMWZrDhMGCUwfdTK5UIgh+nBXJs2TLSSW+vQuU
	 S9h4jKsZm6ilDbumKoEz7pSQyclu9YOpd6J2DpTL22vvdVq/0mE09kNqChZXSOFxjs
	 C1eX8MCSxjkYBzaQrNkrrfVDHoVUHiJHEUQ6A0LHL6wS3zPywpRvQoaDxbZZ9aRPbc
	 SxT3rh7RV0+xw==
From: Joshua Crofts <crofts@kernel.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/3] dmaengine: at_xdmac: remove redundant pm_runtime_dont_use_autosuspend() calls
Date: Fri, 30 Oct 2026 14:58:59 +0000
Message-ID: <20261030145901.1393-2-crofts@kernel.org>
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

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/dma/at_xdmac.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index d40a8b40dddc..00a8261248f8 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -2427,7 +2427,6 @@ static int at_xdmac_probe(struct platform_device *pdev)
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 err_clk_disable:
 	clk_disable_unprepare(atxdmac->clk);
 err_free_irq:
@@ -2445,7 +2444,6 @@ static void at_xdmac_remove(struct platform_device *pdev)
 	dma_async_device_unregister(&atxdmac->dma);
 	pm_runtime_disable(atxdmac->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	clk_disable_unprepare(atxdmac->clk);
 
 	free_irq(atxdmac->irq, atxdmac);
-- 
2.47.3



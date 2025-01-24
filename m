Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70643C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 11:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bgxcuYDowjlsEYydE8TlEeb5J1SSF1ngDNpFyOAjl9s=; b=eTKGE4EVDZO08osX2mMtHaUtqa
	qE+JrOBRCCcUj+c+bbjWC1eDyBWZq3Zh0uSXWnf+igsu7mbEYXMWunxUnd3Phh7I5F3Uq/a0mvmcI
	C3+jr3WmzZF2bxrAWWCX5w3CqO7pmEIWqS4n+NT5eStxacmdNZSeYusvbk0L+Ed4iKVNSbPFv54tI
	EaOhBAzf6DeTtkBZGdRF4iufm79PkIs8A0rOXKO97tIup5tuO/o/aY+YpJncUT0Vmvb+QXKGIkyGU
	dlqfl42HhENVNGtwxifKlapAt8PYJProJErhuXyI3c+JrdnBhEFD732o8XeTKV8fz8o2idCLTl2T2
	1PQ09EWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHTd-0000000EWx9-1gzn;
	Fri, 24 Jan 2025 11:03:53 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHSI-0000000EWhl-3YVx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 11:02:32 +0000
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
	by mail.ispras.ru (Postfix) with ESMTPSA id 50C3F40755EB;
	Fri, 24 Jan 2025 11:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 50C3F40755EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1737716543;
	bh=bgxcuYDowjlsEYydE8TlEeb5J1SSF1ngDNpFyOAjl9s=;
	h=From:To:Cc:Subject:Date:From;
	b=eCx0mhch/orcrt7weuS0cgz9iHIwTd+wFjNvaR1IaFWds1WlockM+x01+zOrMBO9z
	 ECaOfUnSQ+V842mOsd/rjfmAbNC3ltgAeobWzHOMNvBYki89rwSoR4rHLsFnOfIROT
	 XbWJeFn2n/yMLTvx6URoRUmRT1PM3HDqCi7dwtF4=
From: Vitalii Mordan <mordan@ispras.ru>
To: Vinod Koul <vkoul@kernel.org>
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>
Subject: [PATCH] dma: uniphier-mdmac: fix call balance of mdev->clk handling routines
Date: Fri, 24 Jan 2025 14:02:13 +0300
Message-Id: <20250124110213.1285417-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_030231_444917_735B5C84 
X-CRM114-Status: GOOD (  14.73  )
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

If the clock mdev->clk was enabled in uniphier_mdmac_probe(), it should be
disabled in any path. If dmaengine_terminate_sync() returns an error in
uniphier_mdmac_remove(), the clock mdev->clk will not be disabled.

Use the devm_clk_get_enabled() helper function to ensure proper call
balance for mdev->clk.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Fixes: 32e74aabebc8 ("dmaengine: uniphier-mdmac: add UniPhier MIO DMAC driver")
Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
---
 drivers/dma/uniphier-mdmac.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/uniphier-mdmac.c b/drivers/dma/uniphier-mdmac.c
index 7a99f86ecb5a..471dc2ef4781 100644
--- a/drivers/dma/uniphier-mdmac.c
+++ b/drivers/dma/uniphier-mdmac.c
@@ -401,16 +401,12 @@ static int uniphier_mdmac_probe(struct platform_device *pdev)
 	if (IS_ERR(mdev->reg_base))
 		return PTR_ERR(mdev->reg_base);
 
-	mdev->clk = devm_clk_get(dev, NULL);
+	mdev->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(mdev->clk)) {
-		dev_err(dev, "failed to get clock\n");
+		dev_err(dev, "failed to get and enable clock\n");
 		return PTR_ERR(mdev->clk);
 	}
 
-	ret = clk_prepare_enable(mdev->clk);
-	if (ret)
-		return ret;
-
 	ddev = &mdev->ddev;
 	ddev->dev = dev;
 	dma_cap_set(DMA_PRIVATE, ddev->cap_mask);
@@ -429,12 +425,12 @@ static int uniphier_mdmac_probe(struct platform_device *pdev)
 	for (i = 0; i < nr_chans; i++) {
 		ret = uniphier_mdmac_chan_init(pdev, mdev, i);
 		if (ret)
-			goto disable_clk;
+			return ret;
 	}
 
 	ret = dma_async_device_register(ddev);
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = of_dma_controller_register(dev->of_node, of_dma_xlate_by_chan_id,
 					 ddev);
@@ -447,8 +443,6 @@ static int uniphier_mdmac_probe(struct platform_device *pdev)
 
 unregister_dmac:
 	dma_async_device_unregister(ddev);
-disable_clk:
-	clk_disable_unprepare(mdev->clk);
 
 	return ret;
 }
@@ -482,7 +476,6 @@ static void uniphier_mdmac_remove(struct platform_device *pdev)
 
 	of_dma_controller_free(pdev->dev.of_node);
 	dma_async_device_unregister(&mdev->ddev);
-	clk_disable_unprepare(mdev->clk);
 }
 
 static const struct of_device_id uniphier_mdmac_match[] = {
-- 
2.25.1



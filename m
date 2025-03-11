Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E68C2BA1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TsRvBIxlcl5Qad54ud98hdRrluFIPgrqpgvv7s3c5UM=; b=ZW9RSsbXi3KwbZWpZzx/CdbTxS
	YwY80jHF+2brPofkNyv3oZ8FCvfkJGjaTysoCLbCBOPPfHPQN74Y477PP9cg5woTbaAeoiK70A4rt
	ntit2zmMZp5v/ZWxKC6Z8hWjOVi9HTmx6zcSzO9ylLH0Pd/orOcGRhzVchce6NSPeEylpCt8ocCpm
	so4m+HZWISl2i3PPJOLPlsFl4qCirds2olsRquCGso0NrtW1i8CQbgfrqg7NrDYcYDAj+7cFebTiU
	/JiiH7DShVtmXc/gtKwW7948RoAWP3Nz/HYPT0PUstt6/HNGPwO6rr9x9SkaH7XRBHr9ZLREnY1Xh
	bQMmMaXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4DI-00000006bgW-0HaP;
	Tue, 11 Mar 2025 18:20:24 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3we-00000006YFt-3D0N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:03:15 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 47B52A00F5;
	Tue, 11 Mar 2025 19:03:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=TsRvBIxlcl5Qad54ud98hdRrluFIPgrqpgvv7s3c5UM=; b=
	EMF4JM/i0QYoLPNY/wWPaSYJzhNCWCYDCE1tzq8d9ZU7ip4kvs/yjOxTwSj5RfzS
	viyB2ipwm0cB/PB9O6dGDOj283+xKT0CTJ986cPwoZiLOpmL70kNho/89hjaDJOd
	KcSf44scLawxu2n9iiFJywa+pQ+vOjdLBFf2r7wyYERz7x4Zgw/9lpnOKqXsrPYJ
	Z7UfZysilc0qIj8D5speea2hNQw5TPUEAouf6YUwPpPsdZiQHWxWZQdoKUO8R8Ln
	awxGW53/p938iDMmNv8n4erS3nqa7WNCE92OnsNTkPXtGiELs1lwrWxOpG9UhKO2
	QSEkLm5bQSAolIMoLcfnBn9hvDAHvDhvRjDANhY0Bb5nFy0IT2RQwiLE5T61jFrk
	zV3kmPmHorKdIEYhqYVFgnHaCOJ4TlEw8ye2LzXTihdRQgaSIaM1NTXfKFqIxVaO
	9kqSDSPQwgGEfBfiJVXt6aUYP30lFGYohEluJkHANVnQBChhlcZiKgSfR1MtNL3V
	2lPZAGfc9Nc8I18ZtytPkGMYuJAxjbpXVfrueKuPDOY6fhlaSu2P0ZnN+Bl+iS/9
	rA3bchqkzLezR9MlQNZgiSp+kER56r+8jqzF+qyf9gzBf6mFOeLjYYfmGMUKOuPO
	HtEfd0koaaY7sn2b1+unGGbVl9GfiCK+A2y+jlPc1UY=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Chen-Yu
 Tsai" <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Chen-Yu
 Tsai" <wens@csie.org>, Vinod Koul <vkoul@kernel.org>, Samuel Holland
	<samuel@sholland.org>
Subject: [PATCH v4] dma-engine: sun4i: Use devm functions in probe()
Date: Tue, 11 Mar 2025 19:02:53 +0100
Message-ID: <20250311180254.149484-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1741716179;VERSION=7985;MC=3687417233;ID=1831017;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94852627066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_110313_264905_FFAA2FAA 
X-CRM114-Status: GOOD (  13.35  )
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

Clean up error handling by using devm functions
and dev_err_probe(). This should make it easier
to add new code, as we can eliminate the "goto
ladder" in probe().

Suggested-by: Chen-Yu Tsai <wens@kernel.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---

Notes:
    Changes in v2:
    * rebase on current next
    Changes in v3:
    * rebase on current next
    * collect Jernej's tag
    Changes in v4:
    * rebase on current next
    * collect Chen-Yu's tag

 drivers/dma/sun4i-dma.c | 31 ++++++-------------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index 24796aaaddfa..b10639720efd 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -1249,10 +1249,9 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 	if (priv->irq < 0)
 		return priv->irq;
 
-	priv->clk = devm_clk_get(&pdev->dev, NULL);
+	priv->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(priv->clk)) {
-		dev_err(&pdev->dev, "No clock specified\n");
-		return PTR_ERR(priv->clk);
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk), "Couldn't start the clock");
 	}
 
 	if (priv->cfg->has_reset) {
@@ -1328,12 +1327,6 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 		vchan_init(&vchan->vc, &priv->slave);
 	}
 
-	ret = clk_prepare_enable(priv->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Couldn't enable the clock\n");
-		return ret;
-	}
-
 	/*
 	 * Make sure the IRQs are all disabled and accounted for. The bootloader
 	 * likes to leave these dirty
@@ -1344,32 +1337,23 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 	ret = devm_request_irq(&pdev->dev, priv->irq, sun4i_dma_interrupt,
 			       0, dev_name(&pdev->dev), priv);
 	if (ret) {
-		dev_err(&pdev->dev, "Cannot request IRQ\n");
-		goto err_clk_disable;
+		return dev_err_probe(&pdev->dev, ret, "Cannot request IRQ");
 	}
 
-	ret = dma_async_device_register(&priv->slave);
+	ret = dmaenginem_async_device_register(&priv->slave);
 	if (ret) {
-		dev_warn(&pdev->dev, "Failed to register DMA engine device\n");
-		goto err_clk_disable;
+		return dev_err_probe(&pdev->dev, ret, "Failed to register DMA engine device");
 	}
 
 	ret = of_dma_controller_register(pdev->dev.of_node, sun4i_dma_of_xlate,
 					 priv);
 	if (ret) {
-		dev_err(&pdev->dev, "of_dma_controller_register failed\n");
-		goto err_dma_unregister;
+		return dev_err_probe(&pdev->dev, ret, "Failed to register translation function");
 	}
 
 	dev_dbg(&pdev->dev, "Successfully probed SUN4I_DMA\n");
 
 	return 0;
-
-err_dma_unregister:
-	dma_async_device_unregister(&priv->slave);
-err_clk_disable:
-	clk_disable_unprepare(priv->clk);
-	return ret;
 }
 
 static void sun4i_dma_remove(struct platform_device *pdev)
@@ -1380,9 +1364,6 @@ static void sun4i_dma_remove(struct platform_device *pdev)
 	disable_irq(priv->irq);
 
 	of_dma_controller_free(pdev->dev.of_node);
-	dma_async_device_unregister(&priv->slave);
-
-	clk_disable_unprepare(priv->clk);
 }
 
 static struct sun4i_dma_config sun4i_a10_dma_cfg = {
-- 
2.48.1




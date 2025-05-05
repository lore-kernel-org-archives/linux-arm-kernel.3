Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C283C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 09:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Y3FLaQzRJru0yhpXTvpGlFFbXSo7NYug0Nf8Nv/OcI=; b=G9Fbm4npMpVWKcb/8udqLKvT2v
	4W6wnYahTnRpG9kRas8JSDuRz5KCC8VolFBlBnzh0PEPguCFbYluy8qpIEYkiSmNpynsupBRJu7Oi
	QTUzrZxVDLm4SNCVa6LMDhvG/taer5Jrnj6WrjbyerwKMesp4++E/DVY4AtgyttdACh/JU3JfHXHE
	F+TIK9EceADWCE0mFRj2gCHWdwsGnAw9OJ+TehcTb20Y8aDL3sG+q4OaO4sayPVU8x9vzHwyOla9p
	9gnBh9c4Y/Derr6dIMybmdYOtJi9br+nPHFu34cpy75UJOhauPgB+92IgwzFhAQiI51uIXJgqD7EY
	WLsjwniw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBrpn-00000006sBl-1JA4;
	Mon, 05 May 2025 09:09:59 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBrm7-00000006rZ7-21qu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 09:06:13 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 33B88A075A;
	Mon,  5 May 2025 11:06:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=0Y3FLaQzRJru0yhpXTvpGlFFbXSo7NYug0Nf8Nv/OcI=; b=
	L8vdQ/aJPZa06PN6k3w8NoYum0G2rtEn6rs6FUEyeY0SimG3oP2axfw50p45mhKM
	GS/U6kDzMsoqs6ev4KrqA91NorvsumvyyiyuSXHacvwW6iJ/ankMFpJ5BwwjWE5t
	2ooUBTv+bqmNN1doYABPFnxb/CMJYhF46uQlBng8wfY1HRDzpYjdSqupSG7Sl+5v
	Hlmsk4dWAAzAoniV65mH9pcHs+sIsMYKbV4h1OWJngaRsKGTH1GBIDyv/15WCTGf
	XMVaViCCXy+B1/1/S5UhTe8pzWGYDET+0nelYU9MJscFXsMusD/3ZrhR54u1O0Ow
	Ewq9CjBLoVHEgUMIljsV5yvl3SCHFq8L8skg/oVcWcUUvlaIZhk8ReW4t1zASE/6
	d2WnihQlAxLH5cYoFDw+OBQpqgfasckgiDqfquYX4pxSDRlDZZ9kbMMteh3+utH7
	eQJhBPEWlFVMRIPl9b/KbXgY7eF9bH4Ra4/ovdpr6jxigRM4aREzIH2OCse3WKey
	PdS/kFKp3NArXaelRht25NHapljcowXrbQPzdF81HObNVM84i1RrvDy2IVMjYlX2
	nvTt6RNO6oUSN3UFIQDY62hNTtOlGyrGuNr+ZHku+TE7w07RC4mC2OwQx+C4TNdK
	QGL2E7EbXZdqljMFYaAFJupOXopb+3DkccD0BaSYEyU=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Chen-Yu
 Tsai" <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Chen-Yu
 Tsai" <wens@csie.org>, Julian Calaby <julian.calaby@gmail.com>, Vinod Koul
	<vkoul@kernel.org>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH] dma-engine: sun4i: Simplify error handling in probe()
Date: Mon, 5 May 2025 11:05:24 +0200
Message-ID: <20250505090525.274344-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1746435959;VERSION=7990;MC=342574361;ID=205683;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94853667664
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_020611_988474_D3B2B32B 
X-CRM114-Status: GOOD (  13.40  )
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

Clean up error handling by using devm functions and dev_err_probe(). This
should make it easier to add new code, as we can eliminate the "goto
ladder" in sun4i_dma_probe().

Suggested-by: Chen-Yu Tsai <wens@kernel.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Julian Calaby <julian.calaby@gmail.com>
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
    Changes in v5:
    * reformat msg to 75 cols
    * keep `\n`s in error messages
    Changes in v6:
    * remove redundant braces
    * break lines to stay under 85 cols
    * reword subject and message
    Changes in v7:
    * rebase onto current next
    * collect Julian's tag
    Changes in v8:
    * rebase onto current next

 drivers/dma/sun4i-dma.c | 46 ++++++++++++-----------------------------
 1 file changed, 13 insertions(+), 33 deletions(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index 24796aaaddfa..00d2fd38d17f 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -1249,11 +1249,10 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 	if (priv->irq < 0)
 		return priv->irq;
 
-	priv->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(&pdev->dev, "No clock specified\n");
-		return PTR_ERR(priv->clk);
-	}
+	priv->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk),
+				     "Couldn't start the clock\n");
 
 	if (priv->cfg->has_reset) {
 		priv->rst = devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL);
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
@@ -1343,33 +1336,23 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, priv->irq, sun4i_dma_interrupt,
 			       0, dev_name(&pdev->dev), priv);
-	if (ret) {
-		dev_err(&pdev->dev, "Cannot request IRQ\n");
-		goto err_clk_disable;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Cannot request IRQ\n");
 
-	ret = dma_async_device_register(&priv->slave);
-	if (ret) {
-		dev_warn(&pdev->dev, "Failed to register DMA engine device\n");
-		goto err_clk_disable;
-	}
+	ret = dmaenginem_async_device_register(&priv->slave);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to register DMA engine device\n");
 
 	ret = of_dma_controller_register(pdev->dev.of_node, sun4i_dma_of_xlate,
 					 priv);
-	if (ret) {
-		dev_err(&pdev->dev, "of_dma_controller_register failed\n");
-		goto err_dma_unregister;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to register translation function\n");
 
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
@@ -1380,9 +1363,6 @@ static void sun4i_dma_remove(struct platform_device *pdev)
 	disable_irq(priv->irq);
 
 	of_dma_controller_free(pdev->dev.of_node);
-	dma_async_device_unregister(&priv->slave);
-
-	clk_disable_unprepare(priv->clk);
 }
 
 static struct sun4i_dma_config sun4i_a10_dma_cfg = {

base-commit: d175222f5e90b7e1f23713378823c338fabb3258
-- 
2.49.0




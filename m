Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E725C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 17:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rn6yddGTL+4r9BPnRCa7YNZbMZP/n2LoEprLl201Fhg=; b=wRomuVYNRFPQzBIp1VJ4KhP7C3
	/LKr7wJB6x3wqbXR9ofJWnK+nh3gvSoKVatikV/GFxu5x8SAGGdz5jacYuqxJCL5PlpYd1ViaU319
	AnQkZPMZ6k8PWH/5EklfxBLPz8xI1PeYuU2YyKhtUJ68SSDOpQg5jmRsdTKSb9XAd+0BuStKI39za
	kslfP6QNMyij6lPcw/l5u4FAo71Q4H4w5AWiLvzzWh8YYIUTL27rVTp7Mc6BJU28OuR+9CFmRKJmz
	Oj6q4NaWaJhQjnThzlqJOc4fPzOqJg5kXEhvzhySAE/tmh07ooefgPi2YjYqroxvTMWT956kzRvIs
	yi8lw6Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjVD-0000000493s-1yhF;
	Wed, 05 Feb 2025 17:47:55 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjKe-000000047QZ-0Kh4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 17:37:01 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 2CBB9A0748;
	Wed,  5 Feb 2025 18:36:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=Rn6yddGTL+4r9BPnRCa7YNZbMZP/n2LoEprLl201Fhg=; b=
	kIEwVyTn98fyHeB3ZPrtD11ZqobExsQeb9IkBVpo6AJPfeKxBLtFl5YPqyKDk196
	K1ZRHGJtpBMIoJr2r3l4eRHbfVCjWkdMexBglv4viBCke4Xf7t/I47oYW8p7yo2p
	/S4GOZvNuQWjp+KZAL9BPXrw6WiXlfaFbiT1yN+oDAtbUnHe3uSJFafrfVuDIfl3
	F/8iHKneQUtkaWbIqN1zF9viyteAJAIuBHH1QuMcn8KF9bSvKDC2E4YVTU+6h/AB
	K0Vwkwqk5JIa6xblQJ0eI1oreStRhF8+Mczx2qbjm3HTNl8a8g71dzSY6sZZh6zU
	ibodccHUCc82AtIn60S2Zj/sHcMfCC76+O9ZStQmqiKzuYDSw6yGUZisJTXYow1l
	oXvbGA5e8E7UsBD2Pt7AL3t9hnhKUO7JTeI8YFnP3UVF4l9vH+txvGLiBVwvHA5W
	n949X020wpvNpjPuIseVRHy2hiBgsKeH7/QQIJV4NR1/9Doep76tkAxlb8kGxJB5
	Wcepx7y4q9ATiL6ddDTFm8wUr9GdoLD+v8hI2rdRH20flJbLt5nwYGUVMVeR4qTZ
	EwkcEV8S44DPThV0Drmr8tqP3JT4ez6CbT6kTY996uwQMPVILLDcA00vLwO2k/lL
	ph6yWXu1yGfb4NhFRM33RzN/bATuqt2bFZ2fvWjnURc=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Chen-Yu
 Tsai" <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Vinod
 Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
	<samuel@sholland.org>
Subject: [PATCH v3] dma-engine: sun4i: Use devm functions in probe()
Date: Wed, 5 Feb 2025 18:36:30 +0100
Message-ID: <20250205173630.112020-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1738777013;VERSION=7984;MC=1924755684;ID=266573;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852667D60
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_093700_582918_A690C524 
X-CRM114-Status: GOOD (  13.45  )
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
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---

Notes:
    Changes in v2:
    * rebase on current next
    Changes in v3:
    * rebase on current next
    * collect Jernej's tag

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

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1




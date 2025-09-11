Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD74DCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 21:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMl0dpM769EDRU9ZvdNPZxbmv4cmFlATz8VY+MYC7NE=; b=cv9dAi7svlbFcDpH4ugpbB/3/H
	DA0xadhXKJN8PPVnHFYKYgVZjMAyXOMTn/on7j9jZnY4m+DN77tEIRiszvjImDBpwlTjEEa2z46bk
	Izj3Xp4l5VVypuMta8i+YI8g+XuefNvgpFEjeBsy7zR267K+kqxWv7UpEFvMFGYg5wAu2XXnClNKW
	ua+LLxsRu7DoySNXu+Z5NzTYyUaMPxdJSfkGEVGXbX/CEv+tHLbnoioY1zTwQBOXPGiHNxKXXoVy6
	pau5uUG4gpCcHbQq70sWoQiLLo+ePce6ZAylWgdzshDSjqWk5GRjikXHs67GXJAa1IHIdA6Zq1Kyp
	NXeVVgng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpKT-00000005amG-00X3;
	Thu, 11 Sep 2025 21:59:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpKQ-00000005ak6-3dLU
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 11 Sep 2025 21:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=BMl0dpM769EDRU9ZvdNPZxbmv4cmFlATz8VY+MYC7NE=; b=gdrzDJRrLuQpjJIisIpdjn6ulK
	3mfVVhWJdjbUhwwdvGgaDSpayPEPBD0AbbQGeyxWzIJc8U6OJN+sUvAD8iGgAk+YrWGtyuo6VBcER
	lYXRwdApQIQKkW5mhNd1CMa/3Uj9U5BAAEkNxVq6c8467pmWZ1Y4od4E0+JyBFDYO95MgurY7BnUv
	geNaUJghMSWnJoPsWnGGfcfiZ1VfIwtKcDtV6gh5Yi3rssrs2acSWfqGzMmAfmk1ji6xfLUTTNaMv
	90C2WYSjqgPons7lRxeBhhMYgVo6Vgkm87RiAtTppAiK/3t9+kFzQW4lFlBmecREMV23dNjGE8jQw
	XAdTojZA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpHr-00000006BDE-4B8i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 21:59:41 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uwpHe-0004g5-9F; Thu, 11 Sep 2025 23:56:50 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Thu, 11 Sep 2025 23:56:47 +0200
Subject: [PATCH v2 06/10] dmaengine: imx-sdma: make use of devm_kzalloc for
 script_addrs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-v6-16-topic-sdma-v2-6-d315f56343b5@pengutronix.de>
References: <20250911-v6-16-topic-sdma-v2-0-d315f56343b5@pengutronix.de>
In-Reply-To: <20250911-v6-16-topic-sdma-v2-0-d315f56343b5@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jiada Wang <jiada_wang@mentor.com>
Cc: dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_225740_340097_588E9150 
X-CRM114-Status: GOOD (  12.90  )
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

Shuffle the allocation of script_addrs and make use of devm_kzalloc() to
drop the local error handling as well as the kfree() during the remove.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index b0def2bde77fe53b0805bddc0c5d6116c9cefcbe..d6239900ba12063bdb7d807db1bdbdc2b446a94c 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2283,6 +2283,10 @@ static int sdma_probe(struct platform_device *pdev)
 	if (!sdma)
 		return -ENOMEM;
 
+	sdma->script_addrs = devm_kzalloc(dev, sizeof(*sdma->script_addrs), GFP_KERNEL);
+	if (!sdma->script_addrs)
+		return -ENOMEM;
+
 	spin_lock_init(&sdma->channel_0_lock);
 
 	sdma->dev = dev;
@@ -2319,12 +2323,6 @@ static int sdma_probe(struct platform_device *pdev)
 
 	sdma->irq = irq;
 
-	sdma->script_addrs = kzalloc(sizeof(*sdma->script_addrs), GFP_KERNEL);
-	if (!sdma->script_addrs) {
-		ret = -ENOMEM;
-		goto err_irq;
-	}
-
 	/* initially no scripts available */
 	saddr_arr = (s32 *)sdma->script_addrs;
 	for (i = 0; i < sizeof(*sdma->script_addrs) / sizeof(s32); i++)
@@ -2362,11 +2360,11 @@ static int sdma_probe(struct platform_device *pdev)
 
 	ret = sdma_init(sdma);
 	if (ret)
-		goto err_init;
+		goto err_irq;
 
 	ret = sdma_event_remap(sdma);
 	if (ret)
-		goto err_init;
+		goto err_irq;
 
 	if (sdma->drvdata->script_addrs)
 		sdma_add_scripts(sdma, sdma->drvdata->script_addrs);
@@ -2395,7 +2393,7 @@ static int sdma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&sdma->dma_device);
 	if (ret) {
 		dev_err(dev, "unable to register\n");
-		goto err_init;
+		goto err_irq;
 	}
 
 	ret = of_dma_controller_register(np, sdma_xlate, sdma);
@@ -2423,8 +2421,6 @@ static int sdma_probe(struct platform_device *pdev)
 
 err_register:
 	dma_async_device_unregister(&sdma->dma_device);
-err_init:
-	kfree(sdma->script_addrs);
 err_irq:
 	clk_unprepare(sdma->clk_ahb);
 err_clk:
@@ -2440,7 +2436,6 @@ static void sdma_remove(struct platform_device *pdev)
 	of_dma_controller_free(sdma->dev->of_node);
 	devm_free_irq(&pdev->dev, sdma->irq, sdma);
 	dma_async_device_unregister(&sdma->dma_device);
-	kfree(sdma->script_addrs);
 	clk_unprepare(sdma->clk_ahb);
 	clk_unprepare(sdma->clk_ipg);
 	/* Kill the tasklet */

-- 
2.47.3



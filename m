Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B35CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 21:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYXx+9tDo8auogyNxpaC0av5BqlXhDvC4gevRsqUnXs=; b=Eknim+bcrLg15ijyhWoADcTlnJ
	YUeu3kwfUzFDOfSESq2aEUTdyBFyTXpNYSS3IWuhOn3FGKIS/G4dYQFTnMCKrKKK8v8s4YJOtLT0a
	49IE3q3AsqIcX7lw4nwP28WnsDVmJvM1Eff5T0Us2nyZKPJEbVxP07fBvh2rBNs2X+Fh42NZ6DXm5
	WF4GaFtSPSeDzBIPC42d9Cia53N3oXML4RYf5ccHKNN9rDqKWWAJtX4e3n77manp1qBX7qKY981B7
	mWb13Drl4EP6F7Lgyrf46QLqWfcuNhGEibqISoOutYORFqA5jJy4GsOGA4P1ZFg8kYirfMt9NqkBJ
	gktryrig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpKS-00000005alG-1XVp;
	Thu, 11 Sep 2025 21:59:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpKQ-00000005ak1-3dZJ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 11 Sep 2025 21:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nYXx+9tDo8auogyNxpaC0av5BqlXhDvC4gevRsqUnXs=; b=YqWk8zliBKj4BSOa2pRb0Ot6gQ
	kkE4lOPch0pzaIwtKjZzSzV78aC3WdKqNK1aO4JKLbQTfdhul3h/ip+Q/IK/omsc7GhkMunS0Adg3
	WXWqPUrlVl+3pxADTV1n/V6uZr3JpDnKXg/ouj4jIsAUMh/5EpxzaKU8kFoOxEqvblP9e3Bbohy/w
	jY3eZI3p2WHhMRwHOea+61V6xjozl4TOlMBIokSaN3MK6Sf1spNLd8wXy7VQKGsCXe47RQVpXRLK3
	OA9FUHaxv8x1Vsk+fWSEnSvxox4VcerpA04arT9V8vXsExNEw4wKpAOURQ/301y81FRJ1MY+FuuMK
	UEvX9bPg==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpHo-00000006BDG-3rvf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 21:59:41 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uwpHe-0004g5-G9; Thu, 11 Sep 2025 23:56:50 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Thu, 11 Sep 2025 23:56:51 +0200
Subject: [PATCH v2 10/10] dmaengine: imx-sdma: make use of dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-v6-16-topic-sdma-v2-10-d315f56343b5@pengutronix.de>
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
X-CRM114-CacheID: sfid-20250911_225740_339624_2B57AD70 
X-CRM114-Status: GOOD (  11.56  )
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

Add dev_err_probe() at return path of probe() to support users to
identify issues easier.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 41 +++++++++++++++++------------------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index a7e6554ca223e2e980caf2e2dea832db9ad60ed6..d4430e6e56deda7de3538e42af7987a456957b43 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2292,7 +2292,7 @@ static int sdma_probe(struct platform_device *pdev)
 
 	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "Failed to set DMA mask\n");
 
 	sdma = devm_kzalloc(dev, sizeof(*sdma), GFP_KERNEL);
 	if (!sdma)
@@ -2309,24 +2309,24 @@ static int sdma_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return irq;
+		return dev_err_probe(dev, irq, "Failed to get IRQ\n");
 
 	sdma->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sdma->regs))
-		return PTR_ERR(sdma->regs);
+		return dev_err_probe(dev, PTR_ERR(sdma->regs), "ioremap failed\n");
 
 	sdma->clk_ipg = devm_clk_get_prepared(dev, "ipg");
 	if (IS_ERR(sdma->clk_ipg))
-		return PTR_ERR(sdma->clk_ipg);
+		return dev_err_probe(dev, PTR_ERR(sdma->clk_ipg), "IPG clk_get_prepared failed\n");
 
 	sdma->clk_ahb = devm_clk_get_prepared(dev, "ahb");
 	if (IS_ERR(sdma->clk_ahb))
-		return PTR_ERR(sdma->clk_ahb);
+		return dev_err_probe(dev, PTR_ERR(sdma->clk_ahb), "AHB clk_get_prepared failed\n");
 
 	ret = devm_request_irq(dev, irq, sdma_int_handler, 0,
 			       dev_name(dev), sdma);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
 
 	sdma->irq = irq;
 
@@ -2367,11 +2367,11 @@ static int sdma_probe(struct platform_device *pdev)
 
 	ret = sdma_init(sdma);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "sdma_init failed\n");
 
 	ret = sdma_event_remap(sdma);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "sdma_event_remap failed\n");
 
 	if (sdma->drvdata->script_addrs)
 		sdma_add_scripts(sdma, sdma->drvdata->script_addrs);
@@ -2398,28 +2398,21 @@ static int sdma_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, sdma);
 
 	ret = dma_async_device_register(&sdma->dma_device);
-	if (ret) {
-		dev_err(dev, "unable to register\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to register\n");
 
 	ret = devm_add_action_or_reset(dev, sdma_dma_device_unregister_action, sdma);
-	if (ret) {
-		dev_err(dev, "Unable to register release hook\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Unable to register release hook\n");
 
 	ret = of_dma_controller_register(np, sdma_xlate, sdma);
-	if (ret) {
-		dev_err(dev, "failed to register controller\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register controller\n");
 
 	ret = devm_add_action_or_reset(dev, sdma_dma_of_dma_controller_unregister_action, sdma);
-	if (ret) {
-		dev_err(dev, "failed to register of-dma-controller unregister hook\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register of-dma-controller unregister hook\n");
 
 	/*
 	 * Because that device tree does not encode ROM script address,

-- 
2.47.3



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0591BCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNe6PSvPp5Wrt3yRwpxdAKpo7mVr6q9kl/7VBuSOoWY=; b=2Ib5L1FRWSQeaYfuJAMPPBxYay
	W9fjD5TjpSXttJ7gqHAwosVDplvn35ZwKlWqpwaUlfz//gGkNh+tutIn39wWmd2q8Jg2GYIt6NSyz
	Xwc+jctKF/zPLUfKhY9LMhJGPXNFja3VaCYcorcxh1FDEr2mDDZN6C8U7TcbamnMKDYvnvXHH+cpT
	R+9CTxcq0rUGlgWeTTwvW6drmt4EN3kMgPyArt7o63BApDtCGV+X0KGhMc9WeseUe3ozFeNVK36fm
	mAZ6HbdVSUaWo389TNNfxUXMtaumKwGHryTQc/bBTtbFUM/5qn08dpunjrfW0H2BK+PDMC3rq18yy
	jH/wvkwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utpuZ-00000006zp2-4BvQ;
	Wed, 03 Sep 2025 16:00:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnBp-00000006W57-24Um
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:06:19 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1utnBl-00006Z-Ns; Wed, 03 Sep 2025 15:06:13 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Wed, 03 Sep 2025 15:06:12 +0200
Subject: [PATCH 04/11] dmaengine: imx-sdma: make use of devm_kzalloc for
 script_addrs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-v6-16-topic-sdma-v1-4-ac7bab629e8b@pengutronix.de>
References: <20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de>
In-Reply-To: <20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jiada Wang <jiada_wang@mentor.com>
Cc: dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_060617_554973_6049EA7A 
X-CRM114-Status: GOOD (  13.21  )
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

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index a85739d279f51fdb517fce90b3dc67673cf2b56c..b6e649fda71dbce12a2106c94887f90d0aaaf600 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2253,6 +2253,10 @@ static int sdma_probe(struct platform_device *pdev)
 	if (!sdma)
 		return -ENOMEM;
 
+	sdma->script_addrs = devm_kzalloc(dev, sizeof(*sdma->script_addrs), GFP_KERNEL);
+	if (!sdma->script_addrs)
+		return -ENOMEM;
+
 	spin_lock_init(&sdma->channel_0_lock);
 
 	sdma->dev = dev;
@@ -2289,12 +2293,6 @@ static int sdma_probe(struct platform_device *pdev)
 
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
@@ -2332,11 +2330,11 @@ static int sdma_probe(struct platform_device *pdev)
 
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
@@ -2365,7 +2363,7 @@ static int sdma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&sdma->dma_device);
 	if (ret) {
 		dev_err(dev, "unable to register\n");
-		goto err_init;
+		goto err_irq;
 	}
 
 	ret = of_dma_controller_register(np, sdma_xlate, sdma);
@@ -2401,8 +2399,6 @@ static int sdma_probe(struct platform_device *pdev)
 
 err_register:
 	dma_async_device_unregister(&sdma->dma_device);
-err_init:
-	kfree(sdma->script_addrs);
 err_irq:
 	clk_unprepare(sdma->clk_ahb);
 err_clk:
@@ -2417,7 +2413,6 @@ static void sdma_remove(struct platform_device *pdev)
 
 	devm_free_irq(&pdev->dev, sdma->irq, sdma);
 	dma_async_device_unregister(&sdma->dma_device);
-	kfree(sdma->script_addrs);
 	clk_unprepare(sdma->clk_ahb);
 	clk_unprepare(sdma->clk_ipg);
 	/* Kill the tasklet */

-- 
2.47.2



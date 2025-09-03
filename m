Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D2ACA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 16:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XO7OvuuDwzedFmmbZpAnjiYwUQ2XwlHO7N6l+2PQVA=; b=MeWuonO2UHxUV16QnzsrvHyP7U
	djoAJEfQYNIjrlNVJxC+Z1YTWwjPf1CQ6/b+szSaiBRcyvWDp9HI+jQNpa+YHRnyLZCgwqCallFax
	C7DmHfEx3krjjor7Q4F2Cxd4T37k6xlNkq9Z78AGbhwRvsgTnk8Y5TYaq2qu2iBmebi8LXGPsryu/
	8YF81Lzu0AzzOsWdYoOO0c9sVTKMx102As0ds3u6zye9cAbq0BpcJ0Wsda8eNntqcEDWkTfMecy5Q
	cqalFYA16hSoHQ/999jP7LrH8ry81pCq0tXp/o9beVDtqNflsvuPetWzp7HuR6lQniA9wZNfKrBQm
	eK0pX2AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utpzx-000000070Q8-2ZcI;
	Wed, 03 Sep 2025 16:06:13 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnBp-00000006W5A-2QVp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:06:20 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1utnBl-00006Z-R7; Wed, 03 Sep 2025 15:06:13 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Wed, 03 Sep 2025 15:06:14 +0200
Subject: [PATCH 06/11] dmaengine: imx-sdma: make use of
 devm_add_action_or_reset to unregiser the dma_device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-v6-16-topic-sdma-v1-6-ac7bab629e8b@pengutronix.de>
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
X-CRM114-CacheID: sfid-20250903_060617_677909_73E8A4DF 
X-CRM114-Status: GOOD (  15.97  )
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

Make use of the devm_add_action_or_reset() to register a custom devm_
release hook. This is required since we want to turn of the IRQs before
doing the dma_async_device_unregister().

This removes the last goto error handling within the probe function and
further trims the remove() function. Instead of freeing the irq, we can
disable it and let the devm-irq do the job to free the irq, since the
only purpose was to have the irqs disabled before calling
dma_async_device_unregister().

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 5a571d3f33158813e0c56484600a49b19a6a72e2..f6bb2f88a62781c0431336c365fa30c46f1401ad 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2232,6 +2232,14 @@ static struct dma_chan *sdma_xlate(struct of_phandle_args *dma_spec,
 				     ofdma->of_node);
 }
 
+static void sdma_dma_device_unregister_action(void *data)
+{
+	struct sdma_engine *sdma = data;
+
+	disable_irq(sdma->irq);
+	dma_async_device_unregister(&sdma->dma_device);
+}
+
 static int sdma_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -2358,10 +2366,12 @@ static int sdma_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	devm_add_action_or_reset(dev, sdma_dma_device_unregister_action, sdma);
+
 	ret = of_dma_controller_register(np, sdma_xlate, sdma);
 	if (ret) {
 		dev_err(dev, "failed to register controller\n");
-		goto err_register;
+		return ret;
 	}
 
 	spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
@@ -2388,11 +2398,6 @@ static int sdma_probe(struct platform_device *pdev)
 	}
 
 	return 0;
-
-err_register:
-	dma_async_device_unregister(&sdma->dma_device);
-
-	return ret;
 }
 
 static void sdma_remove(struct platform_device *pdev)
@@ -2400,8 +2405,6 @@ static void sdma_remove(struct platform_device *pdev)
 	struct sdma_engine *sdma = platform_get_drvdata(pdev);
 	int i;
 
-	devm_free_irq(&pdev->dev, sdma->irq, sdma);
-	dma_async_device_unregister(&sdma->dma_device);
 	/* Kill the tasklet */
 	for (i = 0; i < MAX_DMA_CHANNELS; i++) {
 		struct sdma_channel *sdmac = &sdma->channel[i];

-- 
2.47.2



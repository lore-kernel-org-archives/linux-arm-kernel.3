Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AFFCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 16:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teWNLXz7hBAxQVD2jEtaLOKTSWwyoF+Dtw8TfVJed7I=; b=Hgv45gKP11Z8OWjQOoEKH5WXdf
	P5KfGaE9fNN/dIuUsG+FtSh+irla7onaSRnfAkeL9KYsfonewkuiQAQKsCK4T6VJLW5gg0w2wHEpf
	3fnHuHZ5oQfLuS1dzLkN/TeUt6SVjmdoUBjSnCCmFmVaka3NL76W9i35+uvj5GRvxP8c3jCI1WtNX
	D0kV6olZg/SS7tVFg1ovE6npHSOdHKChNkHChtv+DHxozG4ERiKyV4ZAofKZtw8i3CSLNjW+gFGJm
	lLAOYwSSkpV4wSW/DfFv6AIuXxRpVTf1338KxDQMiPj8OBZ6dvioXJ4iWVny4XUrXz1Emd4DbGn3g
	vaAkbPqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utqAh-000000071t3-3Sl9;
	Wed, 03 Sep 2025 16:17:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnBp-00000006W5H-2lMX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:06:21 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1utnBm-00006Z-1K; Wed, 03 Sep 2025 15:06:14 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Wed, 03 Sep 2025 15:06:18 +0200
Subject: [PATCH 10/11] dmaengine: imx-sdma: drop remove callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-v6-16-topic-sdma-v1-10-ac7bab629e8b@pengutronix.de>
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
X-CRM114-CacheID: sfid-20250903_060617_809569_7B063EEA 
X-CRM114-Status: GOOD (  19.86  )
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

The whole driver was converted to the devm APIs except for this last
for-loop. This loop is buggy due to three reasons:
 1) It removes the channels without removing the users first. This can
    lead to very bad situations.
 2) The loop starts at 0 and which is channel0 which is a special
    control channel not registered via vchan_init(). Therefore the
    remove() always Oops because of NULL pointer exception.
 3) sdma_free_chan_resources() disable the clks unconditional without
    checking if the clks are enabled. This is done for all
    MAX_DMA_CHANNELS which hang the system if there is at least one unused
    channel.

Since the dmaengine core supports devlinks we already addressed the
first issue.

The devlink support also addresses the third issue because during the
consumer teardown phase each requested channel is dropped accordingly so
the dmaengine driver doesn't need to this.

The second issue is fixed by not doing anything on channel0.

To sum-up, all issues are fixed by dropping the .remove() callback and
let the frameworks do their job.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 6c6d38b202dd2deffc36b1bd27bc7c60de3d7403..c31785977351163d6fddf4d8b2f90dfebb508400 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2405,25 +2405,11 @@ static int sdma_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void sdma_remove(struct platform_device *pdev)
-{
-	struct sdma_engine *sdma = platform_get_drvdata(pdev);
-	int i;
-
-	/* Kill the tasklet */
-	for (i = 0; i < MAX_DMA_CHANNELS; i++) {
-		struct sdma_channel *sdmac = &sdma->channel[i];
-
-		sdma_free_chan_resources(&sdmac->vc.chan);
-	}
-}
-
 static struct platform_driver sdma_driver = {
 	.driver		= {
 		.name	= "imx-sdma",
 		.of_match_table = sdma_dt_ids,
 	},
-	.remove		= sdma_remove,
 	.probe		= sdma_probe,
 };
 

-- 
2.47.2



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64D8CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 22:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvnALqP10M4rKQ7KygT+Ty3ys9MJ7qN5lAv7pYVl7MY=; b=wv0yWcbwXRf+7Lpbm+8RNS0kib
	G+Sk85Nz9wxf+OguL/eIU9Ggjv+LfMnsfQqCPA9unm4KzLnl8rbHCvuxRo1CtRrmmiqrzceqrpABd
	y6FLJXJeURIbykZmT1irQRjJbRwWF/xSA/HHKvyHr3UP4ATfvnOFzOnWeBkfQXmhb2EqhBEI1fhJQ
	vuJLIsCtjsN3tDndjVvO2NGeZ+vxaGL051L4C8zIdeRqGJG6OauJ2fm0/AyCY0OCejbIg/ZviIF6/
	nq8MJDEUbLSLFWn4ESZT3t6biI5Zg+iBBumO+TrcgSAcgc5wRY/g10hlaGvTL9ch5p/BPpHQmmDQs
	wZ79jH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpMw-00000005byU-0YWr;
	Thu, 11 Sep 2025 22:02:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpMu-00000005bxY-3lDt
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 11 Sep 2025 22:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KvnALqP10M4rKQ7KygT+Ty3ys9MJ7qN5lAv7pYVl7MY=; b=PGbVF6jU1641/D5TqFmJTvH879
	IKmsuSs2mIPHS0aTem16fTTSMLOsn1UPfOVOUoHRxOBOc8NfKqTgLSIDnbLAJfV8uLINW70plBY16
	PWlAMTGELcirLEVF4a9Asdz+C1xd+M8T8pbVTnvo6BQ6EWdETdDQf/SdOMl33W9yZ8ZCxqLT23UFF
	DwVRYaWeaHt6SAREzX8uOt1/Z6LLeNp9P+XOKx3onCuUZaQRaMXNbpv39U/dJsQM2IpUqfGRubc5h
	I5LefySNLYTWgQ01G9VfmoGGFeP9oxV7rjrfNDCgu5cJHjJzxKb2bm/LvTG1gabzZbxWqYbKwZEx4
	nPR0wDEA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpLa-00000006BJh-1YsR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 22:02:08 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uwpLU-0005sG-Me; Fri, 12 Sep 2025 00:00:48 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Fri, 12 Sep 2025 00:00:42 +0200
Subject: [PATCH 2/2] dmaengine: imx-sdma: fix supplier/consumer dependency
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-v6-16-topic-dma-devlink-v1-2-4debc2fbf901@pengutronix.de>
References: <20250912-v6-16-topic-dma-devlink-v1-0-4debc2fbf901@pengutronix.de>
In-Reply-To: <20250912-v6-16-topic-dma-devlink-v1-0-4debc2fbf901@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jiada Wang <jiada_wang@mentor.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_230104_472749_D3242CCE 
X-CRM114-Status: GOOD (  20.01  )
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

The first issue is fixed by making use of the dmaengine devlink support.

The second issue is fixed by not doing anything on channel0.

The last issue is also fixed by the devlink support because during the
consumer teardown phase each requested channel is dropped accordingly so
the dmaengine driver doesn't need to this.

To sum-up, all issues are fixed by dropping the .remove() callback and
let the frameworks do their job.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index d4430e6e56deda7de3538e42af7987a456957b43..a11317c8827297d1d6b8ddc0254ecf549e486001 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2393,6 +2393,7 @@ static int sdma_probe(struct platform_device *pdev)
 	sdma->dma_device.device_prep_dma_memcpy = sdma_prep_memcpy;
 	sdma->dma_device.device_issue_pending = sdma_issue_pending;
 	sdma->dma_device.copy_align = 2;
+	sdma->dma_device.create_devlink = true;
 	dma_set_max_seg_size(sdma->dma_device.dev, SDMA_BD_MAX_CNT);
 
 	platform_set_drvdata(pdev, sdma);
@@ -2432,25 +2433,11 @@ static int sdma_probe(struct platform_device *pdev)
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
2.47.3



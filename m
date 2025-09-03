Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB270CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 16:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7W8bUsdcL203FampmUpHNs/AhYlkCPcs6pL1FwOEpwQ=; b=r2JFi/Pk44OGFt9qdsku1RFM4J
	nfksmIImrlYmS8NzSFM14ECcDsRthjhi8JGKgmis/9ixVSyHCSgf7mxeXCPwP19r60eptqD845RBc
	4+8UOaSW2XvwZ9MjGnWBb5K1KAL47BKZCZdKdm6UhJJDmWCIq6rb1iw5htLY5heToFq0j67U/fgzR
	8ozv6G4BXTgCEHvkI04jc+0KRmFyrnNHMyczHlC8Keo82Z593wAzo15e5eb2hbeZ6FEQDDlvVd4b8
	ckohW3cl+R3zQbQKk1G4NkfnLICKgPExqVVSBARAKioGIohl/LOwaiss1nxduIztDA+k2CXbVrTHs
	ILxhmgMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utq2d-000000070fu-1TIq;
	Wed, 03 Sep 2025 16:08:59 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnBp-00000006W58-2FBc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:06:20 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1utnBl-00006Z-J9; Wed, 03 Sep 2025 15:06:13 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Wed, 03 Sep 2025 15:06:09 +0200
Subject: [PATCH 01/11] dmaengine: imx-sdma: drop legacy device_node np
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-v6-16-topic-sdma-v1-1-ac7bab629e8b@pengutronix.de>
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
X-CRM114-CacheID: sfid-20250903_060617_679132_CE4320E1 
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

The legacy 'if (np)' was required in past where we had pdata and dt.
Nowadays the driver binds only to dt platforms. So using a new kernel
but still use pdata is not possible, therefore we can drop the legacy
'if' code path.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 02a85d6f1bea2df7d355858094c0c0b0bd07148e..89b4b1266726a9c8a552dc48670825ae00717e1c 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2325,11 +2325,9 @@ static int sdma_probe(struct platform_device *pdev)
 			vchan_init(&sdmac->vc, &sdma->dma_device);
 	}
 
-	if (np) {
-		sdma->iram_pool = of_gen_pool_get(np, "iram", 0);
-		if (sdma->iram_pool)
-			dev_info(&pdev->dev, "alloc bd from iram.\n");
-	}
+	sdma->iram_pool = of_gen_pool_get(np, "iram", 0);
+	if (sdma->iram_pool)
+		dev_info(&pdev->dev, "alloc bd from iram.\n");
 
 	ret = sdma_init(sdma);
 	if (ret)
@@ -2369,21 +2367,19 @@ static int sdma_probe(struct platform_device *pdev)
 		goto err_init;
 	}
 
-	if (np) {
-		ret = of_dma_controller_register(np, sdma_xlate, sdma);
-		if (ret) {
-			dev_err(&pdev->dev, "failed to register controller\n");
-			goto err_register;
-		}
+	ret = of_dma_controller_register(np, sdma_xlate, sdma);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register controller\n");
+		goto err_register;
+	}
 
-		spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
-		ret = of_address_to_resource(spba_bus, 0, &spba_res);
-		if (!ret) {
-			sdma->spba_start_addr = spba_res.start;
-			sdma->spba_end_addr = spba_res.end;
-		}
-		of_node_put(spba_bus);
+	spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
+	ret = of_address_to_resource(spba_bus, 0, &spba_res);
+	if (!ret) {
+		sdma->spba_start_addr = spba_res.start;
+		sdma->spba_end_addr = spba_res.end;
 	}
+	of_node_put(spba_bus);
 
 	/*
 	 * Because that device tree does not encode ROM script address,

-- 
2.47.2



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C82ACAC595
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 21:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7qcpDzKPKwbV4Re1KD7XtoY2D9WEBR2vpsX5rcYsQY=; b=ePypx2O5xTkHLfT6A2b7TCmT1D
	y19qv65z+tCPC7+WoNJgOpf9gUUemjeifeTnpRhMtHghKeUO8jAUB8X2WF7BXMIZpdhHdPHckDcL/
	wQqiWIQlBAHI6czrxsPfR9bjgISliMtfo30pTG+TyrpT7h/QSmR4xJxGD5s9PNYtJV5W1s6DS3sjc
	lIFQKErHik18aSEjlMyHv41SQ6IF7TE5W3ZM+4fre5+pOeZLYTsFOo4rcz/VihJUaVe9ys7lNXUde
	TYVir0TQe7EslcvzysUaC11Vit60LaMgCZW2LPIRnGt61OesOou7bPQdIENlA+PcZF46xzPL4JsXv
	jRnh+ExA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpKT-00000005anO-2Zw3;
	Thu, 11 Sep 2025 21:59:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpKQ-00000005ak2-3dLz
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 11 Sep 2025 21:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=n7qcpDzKPKwbV4Re1KD7XtoY2D9WEBR2vpsX5rcYsQY=; b=jBY3cvfOLh0H2K7bu4d9Khc9mJ
	WYXjLXLfkXR6BUvZPERQF+dEs6dydpDZsSw5P/idrgVRbmiG+4gZq5vMfs3iZ20hGnSEN9NW1h4ju
	kPD/1H2Ch/vIcrdROiTeV2dvEBCr/Eqmc5RCqfrIo0pXeC2xVhAmuc6ZAaIzA1KddkSJtc0WKGlV5
	xam+qLDH/wNt/oz2nnkFeuFMlCX9YUjVRTHOyCIL5LGa8j3vxVaJ6Nr1k8M2/L/5k2kWx7lyaA3r4
	cDOeQqbu5Vay+PdG2ysA7z/MWBdNBKXFVDza+K1K9MyutKiAqrPdxUukASnlnrwXdFXveAGZDbdXG
	4nS4SurA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpHp-00000006BDF-1lGT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 21:59:41 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uwpHe-0004g5-3h; Thu, 11 Sep 2025 23:56:50 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Thu, 11 Sep 2025 23:56:44 +0200
Subject: [PATCH v2 03/10] dmaengine: imx-sdma: drop legacy device_node np
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-v6-16-topic-sdma-v2-3-d315f56343b5@pengutronix.de>
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
X-CRM114-CacheID: sfid-20250911_225740_340529_559B258E 
X-CRM114-Status: GOOD (  12.87  )
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 56daaeb7df03986850c9c74273d0816700581dc0..dab3589e1c8d9efe06e16925c53554f8e22ce679 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2355,11 +2355,9 @@ static int sdma_probe(struct platform_device *pdev)
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
@@ -2399,12 +2397,10 @@ static int sdma_probe(struct platform_device *pdev)
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
 	}
 
 	/*

-- 
2.47.3



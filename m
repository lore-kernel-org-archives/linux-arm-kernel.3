Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FDFE77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 12:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i05HWD7K+WuvMLkFj25EzNitUBPDdxgibXgH/rNxbxU=; b=D7OHhiO6PTr1Dlat1yXPFEfy1X
	dcSHDXPHVwrTrCdAE/ol+p97JPlbJvhI+pDczOpJj5/xpk1i3hPWf9IWlE7VwpkZujCouBafzjj9z
	0mbUjOBiG4WBnA5jpiBL/e8HWBA5A51jBRDC76SkBPIMUlMhEbN+1wAZnwSR2dkXs8m2koayGB1Rr
	cMX5AqJz1vJJbr1iKQsFQKeT0n6AqXASC1dh7UJTt81fUL7vSGhe5xzVnfJsJOEvFBiWZLh98krU8
	iYluJCrcDipZEhWF+M5o6BuGjSsK5D4/WWsqYhh7EpMPt9yNndlSweHQuvNd0KsTsyWU6v8uSTfFX
	fuNhGp8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKGeM-00000005GTV-2Y7m;
	Sun, 08 Dec 2024 12:44:38 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKGdJ-00000005GLj-1NaU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 12:43:35 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 5AD85A00A5;
	Sun,  8 Dec 2024 13:43:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=i05HWD7K+WuvMLkFj25EzNitUBPDdxgibXgH/rNxbxU=; b=
	XmV1O4SfUox3W6oPoc03JCuTPlBy0yzLF23OUJdXuPH9o3z/QNBGqtjmI36AC0kY
	xTCLxa8WfR7D05I9/EJ1m+6Ai68po3vVgEGYANgP8qy9cIzbOqdTydgppaV8k18v
	bXx5BX3bFv3t2l/hmU0YSqQR8DpiQPdxDJlyej6OSkclJbA18/Rt5UOO3zydl6+J
	vKAfQ/rSs0i/o+SdwjJIOqvXZL/wI8M+X2H5Ii2RQktXv4Ou7cgPF2EKrj0ZnXgT
	bcOGh4+KdsFCGflUFLvY/gjePNqJ5z2oe7X1FDydhHRMh1RaAqaCwgbh2jG535V1
	JRKFZtp7r//iHDHEMHyfVG1n2TMBV1D6mNBPSRS179abhP+wLh3YgSXxAMbdz6bQ
	zcVsVT9Iba7/4i6LxMoQ9Q5COi1nC6Qe+a0apx4qDDCnc9Mb3G6aVMFHg4okkGq/
	8iY7vLsific30uT3ne3OHz2t9jjeNmN+j2rMo079gNQPIOJU4Zn3RKQWilQqQlff
	ztjIMWoRPDLUMBo9PX3cLfxxCKLhS27VdOL0fNizsbjUIO1MqLke4hLhF5DOGQFc
	KHDY9F0hADNFUrINLuUPCPYkJI4brW6+vOFaWiUfNQfBoCu9kbWxTiDm4JyLVXUf
	V29+PaA8o8SpsdbF/eCKtJloy1FPGit2ODts7PuLk30=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Chen-Yu
 Tsai" <wens@kernel.org>, Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai
	<wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>
Subject: [PATCH] dma-engine: sun4i: Use devm functions in probe()
Date: Sun, 8 Dec 2024 13:36:19 +0100
Message-ID: <20241208123619.1007413-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1733661800;VERSION=7982;MC=3252012965;ID=300616;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D9485562766B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_044333_826700_042E9395 
X-CRM114-Status: GOOD (  12.57  )
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
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
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
-- 
2.34.1




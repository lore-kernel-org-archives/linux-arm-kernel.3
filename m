Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3528710854CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 02:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48VNZyPRffCBIqaMJ3LYfN9EMTtMIS8ElqhOprai9TM=; b=R+Ip7jsNpiSzex3PK771geqmiW
	8mbDKjgFJ2JSRyeH/ydFR8zVf+nM0eQWvRoYgk37oXSnmY/p8rEC797miVCwYJzyUgEka9k6WSl/q
	+0INhvess3om5FlZQDNrRgxiK1f4njTVvub+2twOvY4oTOAP5eizzrHDALQzIWO7T8oWPpQjpb4tB
	P2cCnglZ+0ChicaEYAxlTgcmlrDYPHQfcckTUOSMw01yfXl9hyEN6k4ntskLdlMdnS2HspQwMQcBP
	AvmbBLSEUK0hYb59gnSrUPR3rUzJdSGMsejZtd4+5ZV5Sp0uvnPsA6fK1GMItHJIN+WTf1nEBgcMb
	jsJGk1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2grJ-00000007ein-2MP3;
	Wed, 18 Mar 2026 02:42:09 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2gpg-00000007cVG-0UDy;
	Wed, 18 Mar 2026 02:40:30 +0000
X-UUID: cbf09958227311f1a21c59e7364eecb8-20260318
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:8a30965e-9f1a-4620-8640-3b754d2d0986,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:b0aa196b703edc31140b64ea06567652,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cbf09958227311f1a21c59e7364eecb8-20260318
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1231776879; Wed, 18 Mar 2026 10:40:16 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v4 13/17] spi: stm32: Simplify clock handling with devm_clk_get_enabled()
Date: Wed, 18 Mar 2026 10:40:03 +0800
Message-Id: <cb88610059a9b20a9f2ffcd03cd77fecbecf7eaf.1773801401.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773801401.git.xiaopei01@kylinos.cn>
References: <cover.1773801401.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_194028_547014_CC8BA1B5 
X-CRM114-Status: GOOD (  11.87  )
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

Replace devm_clk_get() followed by clk_prepare_enable() with
devm_clk_get_enabled() for the clock. This removes the need for
explicit clock enable and disable calls, as the managed API automatically
handles clock disabling on device removal or probe failure.

Remove the now-unnecessary clk_disable_unprepare() calls from the probe
error paths and the remove callback. Also simplify error handling by
using dev_err_probe().

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-stm32.c | 61 ++++++++++++-----------------------------
 1 file changed, 18 insertions(+), 43 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 8a7f5a10d4af..ee5092bc5956 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -2360,25 +2360,21 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	int ret;
 
 	cfg = of_device_get_match_data(&pdev->dev);
-	if (!cfg) {
-		dev_err(&pdev->dev, "Failed to get match data for platform\n");
-		return -ENODEV;
-	}
+	if (!cfg)
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "Failed to get match data for platform\n");
 
 	device_mode = of_property_read_bool(np, "spi-slave");
-	if (!cfg->has_device_mode && device_mode) {
-		dev_err(&pdev->dev, "spi-slave not supported\n");
-		return -EPERM;
-	}
+	if (!cfg->has_device_mode && device_mode)
+		return dev_err_probe(&pdev->dev, -EPERM, "spi-slave not supported\n");
 
 	if (device_mode)
 		ctrl = devm_spi_alloc_target(&pdev->dev, sizeof(struct stm32_spi));
 	else
 		ctrl = devm_spi_alloc_host(&pdev->dev, sizeof(struct stm32_spi));
-	if (!ctrl) {
-		dev_err(&pdev->dev, "spi controller allocation failed\n");
-		return -ENOMEM;
-	}
+	if (!ctrl)
+		return dev_err_probe(&pdev->dev, -ENOMEM,
+				     "spi controller allocation failed\n");
 	platform_set_drvdata(pdev, ctrl);
 
 	spi = spi_controller_get_devdata(ctrl);
@@ -2409,32 +2405,19 @@ static int stm32_spi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	spi->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(spi->clk)) {
-		ret = PTR_ERR(spi->clk);
-		dev_err(&pdev->dev, "clk get failed: %d\n", ret);
-		return ret;
-	}
+	spi->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(spi->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(spi->clk), "clk enabled failed\n");
 
-	ret = clk_prepare_enable(spi->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "clk enable failed: %d\n", ret);
-		return ret;
-	}
 	spi->clk_rate = clk_get_rate(spi->clk);
-	if (!spi->clk_rate) {
-		dev_err(&pdev->dev, "clk rate = 0\n");
-		ret = -EINVAL;
-		goto err_clk_disable;
-	}
+	if (!spi->clk_rate)
+		return dev_err_probe(&pdev->dev, -EINVAL, "clk rate = 0\n");
 
 	rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
 	if (rst) {
-		if (IS_ERR(rst)) {
+		if (IS_ERR(rst))
 			ret = dev_err_probe(&pdev->dev, PTR_ERR(rst),
 					    "failed to get reset\n");
-			goto err_clk_disable;
-		}
 
 		reset_control_assert(rst);
 		udelay(2);
@@ -2461,11 +2444,9 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	dev_dbg(spi->dev, "one message max size %d\n", spi->t_size_max);
 
 	ret = spi->cfg->config(spi);
-	if (ret) {
-		dev_err(&pdev->dev, "controller configuration failed: %d\n",
-			ret);
-		goto err_clk_disable;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "controller configuration failed: %d\n", ret);
 
 	ctrl->auto_runtime_pm = true;
 	ctrl->bus_num = pdev->id;
@@ -2490,8 +2471,7 @@ static int stm32_spi_probe(struct platform_device *pdev)
 			dev_info(&pdev->dev, "tx dma disabled\n");
 			spi->dma_tx = NULL;
 		} else {
-			dev_err_probe(&pdev->dev, ret, "failed to request tx dma channel\n");
-			goto err_clk_disable;
+			return dev_err_probe(&pdev->dev, ret, "failed to request tx dma channel\n");
 		}
 	} else {
 		ctrl->dma_tx = spi->dma_tx;
@@ -2579,8 +2559,6 @@ static int stm32_spi_probe(struct platform_device *pdev)
 err_dma_tx_release:
 	if (spi->dma_tx)
 		dma_release_channel(spi->dma_tx);
-err_clk_disable:
-	clk_disable_unprepare(spi->clk);
 
 	return ret;
 }
@@ -2610,9 +2588,6 @@ static void stm32_spi_remove(struct platform_device *pdev)
 		gen_pool_free(spi->sram_pool, (unsigned long)spi->sram_rx_buf,
 			      spi->sram_rx_buf_size);
 
-	clk_disable_unprepare(spi->clk);
-
-
 	pinctrl_pm_select_sleep_state(&pdev->dev);
 }
 
-- 
2.25.1



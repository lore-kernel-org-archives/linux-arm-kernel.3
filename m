Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D06106FD84
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 06:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8MzcfxTJC86qQUAjblAYRFVkYJTk33D0VKKABh3ods=; b=DzFbA1b/P+igXGssQtxCHdCrGk
	usgySe1hWsA9x7pKp4rwKVcVFe2zMbfbL3UaM1uPdkAnd22FkXEMxNeEZpUfgyh6mw96Vze3p8B/o
	wdQxdpNFcDsux5hMrjTsMbSjzVwmTBGm0RaAit2hVzmIPhEShD7RyRHKWnKQ4JuinJKD5j0dubbE3
	Qvri65+CZGm+WFdIgSsozvOQYXgf/6PB48OHJ2ONE9KgIhGRswE8Pg01ITUSN4XCi9Q3ODgDYALXn
	AHD3aLM627NOV6JfvBxd5fiSYxSKYCDXPSfSLocOpJsvUTu/0GcKHoZuJyvB8MDzQuHA9u0syZj2I
	zjqLc5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vjf-0000000GmTF-2MN8;
	Fri, 13 Mar 2026 06:10:59 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vhy-0000000Gk0Q-3ZPb;
	Fri, 13 Mar 2026 06:09:16 +0000
X-UUID: 236816c21ea311f1a21c59e7364eecb8-20260313
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:774ba76c-ff1f-4aa0-9545-ff8c73c52fd4,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:a252da3c25ab9bafebde4d8575e874d7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 236816c21ea311f1a21c59e7364eecb8-20260313
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 68105137; Fri, 13 Mar 2026 14:09:04 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: broonie@kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v2 16/17] spi: zynq-qspi: Use helper function devm_clk_get_enabled()
Date: Fri, 13 Mar 2026 14:08:32 +0800
Message-Id: <69a54f7c4d839c9033b1bd088eecf505ef810493.1773381582.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773381582.git.xiaopei01@kylinos.cn>
References: <cover.1773381582.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_230915_225796_492C737D 
X-CRM114-Status: GOOD (  11.00  )
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

devm_clk_get() and clk_prepare_enable() can now be replaced by
devm_clk_get_enabled() when driver enables the clocks. Moreover, it is no
longer necessary to unprepare and disable the clocks explicitly.
Simplify code.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-zynq-qspi.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
index 5232483c4a3a..f887c55337ae 100644
--- a/drivers/spi/spi-zynq-qspi.c
+++ b/drivers/spi/spi-zynq-qspi.c
@@ -661,7 +661,7 @@ static int zynq_qspi_probe(struct platform_device *pdev)
 		goto remove_ctlr;
 	}
 
-	xqspi->pclk = devm_clk_get(&pdev->dev, "pclk");
+	xqspi->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(xqspi->pclk)) {
 		dev_err(&pdev->dev, "pclk clock not found.\n");
 		ret = PTR_ERR(xqspi->pclk);
@@ -670,36 +670,24 @@ static int zynq_qspi_probe(struct platform_device *pdev)
 
 	init_completion(&xqspi->data_completion);
 
-	xqspi->refclk = devm_clk_get(&pdev->dev, "ref_clk");
+	xqspi->refclk = devm_clk_get_enabled(&pdev->dev, "ref_clk");
 	if (IS_ERR(xqspi->refclk)) {
 		dev_err(&pdev->dev, "ref_clk clock not found.\n");
 		ret = PTR_ERR(xqspi->refclk);
 		goto remove_ctlr;
 	}
 
-	ret = clk_prepare_enable(xqspi->pclk);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to enable APB clock.\n");
-		goto remove_ctlr;
-	}
-
-	ret = clk_prepare_enable(xqspi->refclk);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to enable device clock.\n");
-		goto clk_dis_pclk;
-	}
-
 	xqspi->irq = platform_get_irq(pdev, 0);
 	if (xqspi->irq < 0) {
 		ret = xqspi->irq;
-		goto clk_dis_all;
+		goto remove_ctlr;
 	}
 	ret = devm_request_irq(&pdev->dev, xqspi->irq, zynq_qspi_irq,
 			       0, pdev->name, xqspi);
 	if (ret != 0) {
 		ret = -ENXIO;
 		dev_err(&pdev->dev, "request_irq failed\n");
-		goto clk_dis_all;
+		goto remove_ctlr;
 	}
 
 	ret = of_property_read_u32(np, "num-cs",
@@ -709,7 +697,7 @@ static int zynq_qspi_probe(struct platform_device *pdev)
 	} else if (num_cs > ZYNQ_QSPI_MAX_NUM_CS) {
 		ret = -EINVAL;
 		dev_err(&pdev->dev, "only 2 chip selects are available\n");
-		goto clk_dis_all;
+		goto remove_ctlr;
 	} else {
 		ctlr->num_chipselect = num_cs;
 	}
@@ -728,15 +716,11 @@ static int zynq_qspi_probe(struct platform_device *pdev)
 	ret = devm_spi_register_controller(&pdev->dev, ctlr);
 	if (ret) {
 		dev_err(&pdev->dev, "devm_spi_register_controller failed\n");
-		goto clk_dis_all;
+		goto remove_ctlr;
 	}
 
 	return ret;
 
-clk_dis_all:
-	clk_disable_unprepare(xqspi->refclk);
-clk_dis_pclk:
-	clk_disable_unprepare(xqspi->pclk);
 remove_ctlr:
 	spi_controller_put(ctlr);
 
-- 
2.25.1



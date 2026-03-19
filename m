Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9EA1088E62
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 02:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z29iUG89Pw0KmMuy2q75B7AZnnsRbUWEpj1V8gHIDr0=; b=43xelTS0qj136M3VhLN7AygUND
	2D7L0eZt+CO4lqDn/R48kF9yYt0rHDho0tyKThqBy31qQvhQ1gdcvlQsqZ2CuxFNsosWLEB3Fib7v
	cXTDB/NXC3mf5jze94bCl6B0K7t2R2VQs5Snz3w6x+ifKb+cCyMgK9ngj1nhI9Dd5ar8Vu+DKXfok
	lj1vecDreIh2g7xe4BZq3HWOw1izoyhc4BcK8vrDZ8Rg5dbxGEOlDu6pW0FEdAc0OIjfLAVzlmKdK
	Pd7AUJdpzu62bqASIlk/nANi/HPuoVs64/fV0uy3jx+pTVtbVdC5SoADMo6m+ksXxpngTsJOXc/2H
	U6ElQL1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w32ka-00000009eFv-1l10;
	Thu, 19 Mar 2026 02:04:40 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w32kS-00000009e59-2nao;
	Thu, 19 Mar 2026 02:04:34 +0000
X-UUID: f099bdba233711f1a21c59e7364eecb8-20260319
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:4fff16d3-b475-434c-9921-59ad19d480ae,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:9603014fec71fbf5de70695698f811d6,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f099bdba233711f1a21c59e7364eecb8-20260319
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1832127847; Thu, 19 Mar 2026 10:04:19 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	broonie@kernel.org,
	Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v5 01/17] spi: axiado: Simplify clock management with devm_clk_get_enabled()
Date: Thu, 19 Mar 2026 10:03:57 +0800
Message-Id: <52f7e0ebd2f0ece71929384444e1ae87506e5e2d.1773885292.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773885292.git.xiaopei01@kylinos.cn>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_190433_015169_AE3C7740 
X-CRM114-Status: GOOD (  12.50  )
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
devm_clk_get_enabled() for both the "pclk" and "ref" clocks. This
reduces boilerplate code and error handling, as the managed API
automatically disables the clocks when the device is removed or if
probe fails.

Remove the now-unnecessary clk_disable_unprepare() calls from the
probe error paths and the remove callback. Rename the error label
from 'clk_dis_all' to 'err_disable_pm_runtime' to reflect that only
PM runtime cleanup remains.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-axiado.c | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/spi/spi-axiado.c b/drivers/spi/spi-axiado.c
index dc55c55ae63c..d7918ea7c586 100644
--- a/drivers/spi/spi-axiado.c
+++ b/drivers/spi/spi-axiado.c
@@ -768,25 +768,15 @@ static int ax_spi_probe(struct platform_device *pdev)
 	if (IS_ERR(xspi->regs))
 		return PTR_ERR(xspi->regs);
 
-	xspi->pclk = devm_clk_get(&pdev->dev, "pclk");
+	xspi->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(xspi->pclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(xspi->pclk),
-				     "pclk clock not found.\n");
+				     "Unable to enable APB clock.\n");
 
-	xspi->ref_clk = devm_clk_get(&pdev->dev, "ref");
+	xspi->ref_clk = devm_clk_get_enabled(&pdev->dev, "ref");
 	if (IS_ERR(xspi->ref_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(xspi->ref_clk),
-				     "ref clock not found.\n");
-
-	ret = clk_prepare_enable(xspi->pclk);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Unable to enable APB clock.\n");
-
-	ret = clk_prepare_enable(xspi->ref_clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to enable device clock.\n");
-		goto clk_dis_apb;
-	}
+				     "Unable to enable device clock.\n");
 
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, SPI_AUTOSUSPEND_TIMEOUT);
@@ -815,7 +805,7 @@ static int ax_spi_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq <= 0) {
 		ret = -ENXIO;
-		goto clk_dis_all;
+		goto err_disable_pm_runtime;
 	}
 
 	ret = devm_request_irq(&pdev->dev, irq, ax_spi_irq,
@@ -823,7 +813,7 @@ static int ax_spi_probe(struct platform_device *pdev)
 	if (ret != 0) {
 		ret = -ENXIO;
 		dev_err(&pdev->dev, "request_irq failed\n");
-		goto clk_dis_all;
+		goto err_disable_pm_runtime;
 	}
 
 	ctlr->use_gpio_descriptors = true;
@@ -849,17 +839,14 @@ static int ax_spi_probe(struct platform_device *pdev)
 	ret = spi_register_controller(ctlr);
 	if (ret) {
 		dev_err(&pdev->dev, "spi_register_controller failed\n");
-		goto clk_dis_all;
+		goto err_disable_pm_runtime;
 	}
 
 	return ret;
 
-clk_dis_all:
+err_disable_pm_runtime:
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(xspi->ref_clk);
-clk_dis_apb:
-	clk_disable_unprepare(xspi->pclk);
 
 	return ret;
 }
@@ -875,15 +862,12 @@ static int ax_spi_probe(struct platform_device *pdev)
 static void ax_spi_remove(struct platform_device *pdev)
 {
 	struct spi_controller *ctlr = platform_get_drvdata(pdev);
-	struct ax_spi *xspi = spi_controller_get_devdata(ctlr);
 
 	spi_unregister_controller(ctlr);
 
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
-	clk_disable_unprepare(xspi->ref_clk);
-	clk_disable_unprepare(xspi->pclk);
 }
 
 /**
-- 
2.25.1



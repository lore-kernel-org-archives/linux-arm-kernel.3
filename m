Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8990CF3380B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 07:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhRuJrxFlUx2IZNL/q6R+eVYlcPmJwhacTJAdR66t30=; b=35j9WxGq6yA8c5jtZdAnwsiaq1
	wtvv9y1AmHrKYfI0jY5m2Rs19DFZjr8yx45trHVtQ9pdB6E/bHdjQzJC21mbPCs5lH5rFIyE1XcMT
	cHTiVyzFmGdBpQJIW6CXvp0ZTCAMwGiHJQ7Hk6hwn3AO2YhjXFUEN0RuMD5UIhHRx5b4vZhAA027V
	KUG+1IrkHMtHmjS3SM9lreup+7IJrqr+VbrObovrNNCptvBBeB1cWDBUe4O6Lufe5eqSlBBiLve5A
	syfcgaRWohs9PtX9FmZBa/bXwq9OAoP6ItClNyZu1GLut58DhXECeszwomHjYLLIZvqCHfM3PcpTV
	h/sxqfQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2P6C-00000005ddv-3k3x;
	Tue, 17 Mar 2026 07:44:20 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2P4M-00000005axX-1Imr;
	Tue, 17 Mar 2026 07:42:43 +0000
X-UUID: cd8ae63c21d411f1a21c59e7364eecb8-20260317
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:ba1c14cf-3890-41f9-9129-f2279b57a204,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:d042d1f9984bf1d3851bdf0c97f5e639,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cd8ae63c21d411f1a21c59e7364eecb8-20260317
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 868909025; Tue, 17 Mar 2026 15:42:09 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	broonie@kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v3 12/17] spi: stm32-qspi: Use helper function devm_clk_get_enabled()
Date: Tue, 17 Mar 2026 15:41:54 +0800
Message-Id: <b887a25df30f38e1339f94ae464929e4e9f75f03.1773733017.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773733017.git.xiaopei01@kylinos.cn>
References: <cover.1773733017.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_004241_946490_D2052109 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
 drivers/spi/spi-stm32-qspi.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index df1bbacec90a..a8436f70fdfd 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -819,25 +819,19 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 
 	init_completion(&qspi->match_completion);
 
-	qspi->clk = devm_clk_get(dev, NULL);
+	qspi->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(qspi->clk))
-		return PTR_ERR(qspi->clk);
-
+		return dev_err_probe(dev, PTR_ERR(qspi->clk),
+				     "can not enable the clock\n");
 	qspi->clk_rate = clk_get_rate(qspi->clk);
 	if (!qspi->clk_rate)
 		return -EINVAL;
 
-	ret = clk_prepare_enable(qspi->clk);
-	if (ret) {
-		dev_err(dev, "can not enable the clock\n");
-		return ret;
-	}
-
 	rstc = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(rstc)) {
 		ret = PTR_ERR(rstc);
 		if (ret == -EPROBE_DEFER)
-			goto err_clk_disable;
+			goto err_defer;
 	} else {
 		reset_control_assert(rstc);
 		udelay(2);
@@ -886,8 +880,7 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(qspi->dev);
 err_dma_free:
 	stm32_qspi_dma_free(qspi);
-err_clk_disable:
-	clk_disable_unprepare(qspi->clk);
+err_defer:
 
 	return ret;
 }
@@ -906,7 +899,6 @@ static void stm32_qspi_remove(struct platform_device *pdev)
 	pm_runtime_disable(qspi->dev);
 	pm_runtime_set_suspended(qspi->dev);
 	pm_runtime_dont_use_autosuspend(qspi->dev);
-	clk_disable_unprepare(qspi->clk);
 }
 
 static int stm32_qspi_runtime_suspend(struct device *dev)
-- 
2.25.1



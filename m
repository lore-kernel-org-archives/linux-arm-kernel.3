Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14438E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IDylzkpcXQemmYGkj+LuUTlUnvPEmFKvHAQHgm5c9sY=; b=3KdXRZw89wDLm8
	ZMRsr2g4XTj3HFPqMurWs+eof0bxCz1BnWp01HH9zrXAYqBWicjvhYWkNIQj8dmL9eWiYUoX4sTWr
	ynvMDYbHTR73IaF/upzOmi5DuWDm4JT0kmmvH70wD00AbbtxHTpyIvIxA2wy9hp3JDiYhIXRTbhO1
	RlGuxhVCm7hsDjB3K9eGE8ygE1IVVA0YW9UHNmOnUJ4ypdmiWlbBzEr1+murgiUVori+TdL9cw6A3
	kuDctp4V2LvQ4h95MsQUijWiRoux/2v5H1VtrBK4D2ezZJGUwxywHs9QqSYldTGwzB68EBv1yZf6+
	5mAKB/4Eb8HRtw3uRTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpa4-00000001soH-0VIP;
	Mon, 06 Jan 2025 16:03:52 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpYq-00000001sdN-1cTf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:02:37 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id CF80EA0F58;
	Mon,  6 Jan 2025 17:02:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=IDylzkpcXQemmYGkj+LuUTlUnvPEmFKvHAQHgm5c9sY=; b=
	YJKu8mY5cLcSJq3YHF+Rg4ipJnoTAly9lz/2r1VphjU/aHrUFJVddan7I5exO20p
	v9rGbp7V5p/AodOutV5mPyk3Ae/Emd/Av9el7QvthC99LKdJpzR0GcVe/i4cDdsY
	Juh8kYdvYrcxPsUSa4QUHVTcZJFOsF+anqFqwK3+hzzkUCpm6JpqyMZKB5MFG4C0
	7b7L+J9fd3odSlFutu3nxGeMJE0GKquzegekp4nYULkWXo0lJLqA2X5st+oB6wev
	bUEM2t8hG7ircIJi7ZbD+lJYIhkc21LgGLcTSq5hOjuIwbyVgp3M3sHkGZ2c+1pW
	g/eAQCKs0XS1HEUoxpkh9FTV4UqiDdoh+BVBvT8Y+H35jXOCfmWyn1mwEpMOn3jy
	fLmBWMLXQCOl+cLqGXx6jrHKUA7wjrUbm5WDraRmIg3SiKroufE852nOuz4xAg5l
	eU0bJjZkZPtOv3ymYm0EsbENFsCGSjQeVq+VXx3vHuXelSvDw4YNs+l5sjv52c4J
	N3xuMynWPhWslXyV/O9/4GsJDBPt9OXD2W+bMG+LzCQvlxWMcz0l2RiU2R3Wn5f6
	Gj/svlsH1nu8S79clDr7anh72uTV659kNgxc2k+iKUhVxPN2asR/VnNGUxQXJzzz
	thD7tHz475e2Kl1grfsqQmuFDTb+ConiNE7cl8qlwJM=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH resubmit] spi: atmel-quadspi: Use devm_ clock management
Date: Mon, 6 Jan 2025 16:54:16 +0100
Message-ID: <20250106155416.1959803-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1736179354;VERSION=7982;MC=3965097876;ID=214303;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94852657067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_080236_578898_7105F5EF 
X-CRM114-Status: GOOD (  15.38  )
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
Cc: Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Mark Brown <broonie@kernel.org>, =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Clean up error handling by using the new devm_
clock handling functions. This should make it
easier to add new code, as we can eliminate the
"goto ladder" in probe().

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---

Notes:
    Resubmit: rebased to current spi-next

 drivers/spi/atmel-quadspi.c | 42 ++++++++++---------------------------
 1 file changed, 11 insertions(+), 31 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index f46da363574f..93604ffb7106 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1386,50 +1386,37 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 	aq->mmap_phys_base = (dma_addr_t)res->start;
 
 	/* Get the peripheral clock */
-	aq->pclk = devm_clk_get(&pdev->dev, "pclk");
+	aq->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(aq->pclk))
-		aq->pclk = devm_clk_get(&pdev->dev, NULL);
+		aq->pclk = devm_clk_get_enabled(&pdev->dev, NULL);
 
 	if (IS_ERR(aq->pclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(aq->pclk),
 				     "missing peripheral clock\n");
 
-	/* Enable the peripheral clock */
-	err = clk_prepare_enable(aq->pclk);
-	if (err)
-		return dev_err_probe(&pdev->dev, err,
-				     "failed to enable the peripheral clock\n");
-
 	if (aq->caps->has_qspick) {
 		/* Get the QSPI system clock */
-		aq->qspick = devm_clk_get(&pdev->dev, "qspick");
+		aq->qspick = devm_clk_get_enabled(&pdev->dev, "qspick");
 		if (IS_ERR(aq->qspick)) {
 			dev_err(&pdev->dev, "missing system clock\n");
 			err = PTR_ERR(aq->qspick);
-			goto disable_pclk;
+			return err;
 		}
 
-		/* Enable the QSPI system clock */
-		err = clk_prepare_enable(aq->qspick);
-		if (err) {
-			dev_err(&pdev->dev,
-				"failed to enable the QSPI system clock\n");
-			goto disable_pclk;
-		}
 	} else if (aq->caps->has_gclk) {
 		/* Get the QSPI generic clock */
 		aq->gclk = devm_clk_get(&pdev->dev, "gclk");
 		if (IS_ERR(aq->gclk)) {
 			dev_err(&pdev->dev, "missing Generic clock\n");
 			err = PTR_ERR(aq->gclk);
-			goto disable_pclk;
+			return err;
 		}
 	}
 
 	if (aq->caps->has_dma) {
 		err = atmel_qspi_dma_init(ctrl);
 		if (err == -EPROBE_DEFER)
-			goto disable_qspick;
+			return err;
 	}
 
 	/* Request the IRQ */
@@ -1469,10 +1456,6 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 dma_release:
 	if (aq->caps->has_dma)
 		atmel_qspi_dma_release(aq);
-disable_qspick:
-	clk_disable_unprepare(aq->qspick);
-disable_pclk:
-	clk_disable_unprepare(aq->pclk);
 
 	return err;
 }
@@ -1511,7 +1494,6 @@ static int atmel_qspi_sama7g5_suspend(struct atmel_qspi *aq)
 	if (ret)
 		return ret;
 
-	clk_disable_unprepare(aq->pclk);
 	return 0;
 }
 
@@ -1536,8 +1518,6 @@ static void atmel_qspi_remove(struct platform_device *pdev)
 		}
 
 		atmel_qspi_write(QSPI_CR_QSPIDIS, aq, QSPI_CR);
-		clk_disable(aq->qspick);
-		clk_disable(aq->pclk);
 	} else {
 		/*
 		 * atmel_qspi_runtime_{suspend,resume} just disable and enable
@@ -1547,9 +1527,6 @@ static void atmel_qspi_remove(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "Failed to resume device on remove\n");
 	}
 
-	clk_unprepare(aq->qspick);
-	clk_unprepare(aq->pclk);
-
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
@@ -1565,8 +1542,11 @@ static int __maybe_unused atmel_qspi_suspend(struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	if (aq->caps->has_gclk)
-		return atmel_qspi_sama7g5_suspend(aq);
+	if (aq->caps->has_gclk) {
+		ret = atmel_qspi_sama7g5_suspend(aq);
+		clk_disable_unprepare(aq->pclk);
+		return ret;
+	}
 
 	atmel_qspi_write(QSPI_CR_QSPIDIS, aq, QSPI_CR);
 
-- 
2.34.1




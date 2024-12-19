Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF3CE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 14:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q9p5YdpLAC9lMQUDXh/sWTJskhLlLdzk78ldCkop8bo=; b=mn0IZ3AJ/G6RKL
	zU9kE1ehJ6Gmi6iebllrhWB12I2yWIU8pfuczbRjPV65B25Weaani3eF5TEikI7B2pyTg7+V5J8bu
	4NfIdRlvrBeNc0WEMWQPXbpjBKPVGCN1cIxrl7aBTeuY2IEgvBdMCeat2gNd6mrPopG42dkQS9apm
	ogn/O5rejZPeERA/RzIgP7fkjbv7ZOGlgBg35v9m+U9V1ZbCJ5xF+5qNmtwB7/Mt+mTMhz4ZN94od
	M24uAQuLDFHIANT/t5rQQVUS5QX4yVtm8ULAJ7ezyd5vORAS/BQ6aq79+JI2bvGeqelumZfwpNorh
	bf1ehETGi6uFmgmrnlGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOHYR-000000024N7-3ZV2;
	Thu, 19 Dec 2024 14:31:07 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOHWX-0000000240X-2YSa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 14:29:11 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 0D818A0B52;
	Thu, 19 Dec 2024 15:29:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=q9p5YdpLAC9lMQUDXh/sWTJskhLlLdzk78ldCkop8bo=; b=
	blEovQ/RKCiuzsjrEjdoPNH3dWFhQW/jYvPbBTCAZ07Mi1rHNMTICB2TuY+b/X13
	97cafat1dlz9gJjWZjf4NDBd/VGCxydltuCYYUtcAPUudL2dK2kttkc/iUGg5WCk
	qsapgjez0Jx8JaUjlbKZPn3TIw2xDws5w/q3r0GkQlmuv+RlQtRu5Ri8RsSkBTcP
	gKgwi+7UlpXgH2PuqZneVt7AWkNAwc6PKqR2P+C7XWw7J3neE0QWBXG/80hoJieh
	93skyYwPx/kOQFcQtCIQeFc9gK/1VoSzpvTBLIKYWCkSYxzgzD+FNLRP+CCI7Cmf
	tIvxXevFq6iS4M9H1lvIS1htUzFD2XEuoCu7db2t+snZuXWyErx3vdYloaaAxp77
	CR1fu8DmYKQ4O/yvqyfhKdvjXI1Jc7YX3T2O4Llt0X+3cquxd1saf7gh8UVWrCAV
	canmA9OOTxD0Jl07TeIcebW5CXY4jFmmlGvispb0tHU+HsrpcXjhUChZ8+DvNXN5
	grGOc+zWT9uZMSOqN99nMPdI6hUoEH7nBfqxrQ7+JOL/iWtbThapDen0MhIViM5F
	2tb94pyF0krWOwvgKlk5fM79D8XYc4+Y8m4TtAGN/3WAaLE6pgZHxR4iNptNk5Mr
	wGJmqQ5ahjG0I8TQwQy4ZDpy7VJ4N2z79YbylEBm47g=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] spi: atmel-quadspi: Use devm_ clock management
Date: Thu, 19 Dec 2024 15:28:51 +0100
Message-ID: <20241219142851.430959-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1734618544;VERSION=7982;MC=3504418844;ID=84880;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD948556D7361
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_062910_104054_DC0148B3 
X-CRM114-Status: GOOD (  14.92  )
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
 drivers/spi/atmel-quadspi.c | 42 ++++++++++---------------------------
 1 file changed, 11 insertions(+), 31 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 73cf0c3f1477..0353f8e1384d 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1381,50 +1381,37 @@ static int atmel_qspi_probe(struct platform_device *pdev)
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
@@ -1464,10 +1451,6 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 dma_release:
 	if (aq->caps->has_dma)
 		atmel_qspi_dma_release(aq);
-disable_qspick:
-	clk_disable_unprepare(aq->qspick);
-disable_pclk:
-	clk_disable_unprepare(aq->pclk);
 
 	return err;
 }
@@ -1506,7 +1489,6 @@ static int atmel_qspi_sama7g5_suspend(struct atmel_qspi *aq)
 	if (ret)
 		return ret;
 
-	clk_disable_unprepare(aq->pclk);
 	return 0;
 }
 
@@ -1531,8 +1513,6 @@ static void atmel_qspi_remove(struct platform_device *pdev)
 		}
 
 		atmel_qspi_write(QSPI_CR_QSPIDIS, aq, QSPI_CR);
-		clk_disable(aq->qspick);
-		clk_disable(aq->pclk);
 	} else {
 		/*
 		 * atmel_qspi_runtime_{suspend,resume} just disable and enable
@@ -1542,9 +1522,6 @@ static void atmel_qspi_remove(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "Failed to resume device on remove\n");
 	}
 
-	clk_unprepare(aq->qspick);
-	clk_unprepare(aq->pclk);
-
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
@@ -1560,8 +1537,11 @@ static int __maybe_unused atmel_qspi_suspend(struct device *dev)
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




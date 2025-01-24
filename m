Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54B5C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 09:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EN5uKDKBs2TFBzx+EqNYKD0FORICT1RtSymVEFjrtcw=; b=0HKhOwmkGSbN4V
	VaR2QtePZLEy28940Y379GDqRTqvfGz902tm+47pUDBG1SUFyyKFUhfFT8h4SI4XX57fPxeRjRHCo
	Vb5ey0Vgewz2U6ND6sd+RLXh41hC9yM3JRPAN/Wq9W1nQLVy5ZmGeV0MAxMpG+BnS7CpCZWCwsjI6
	DLTWfNFH53c3PyXpJ+SlNrmw44OE/9BOShrQo+a2YcRuBbNsyPMFh4+LI3lZC+HPjVEebYH2RjDH6
	ISdA/ojtc0wMqGEHNkgYG/fqssA3MchWVL9hpmh2scp+NIt7oQua3GudzOzc57mOAxQCaEWuDJ7wx
	4qF2d+klV0zWB4lg9Iww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFZO-0000000EJPy-2W9l;
	Fri, 24 Jan 2025 09:01:42 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFUz-0000000EIWG-1afy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 08:57:10 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 1757FA09FF;
	Fri, 24 Jan 2025 09:57:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=EN5uKDKBs2TFBzx+EqNY
	KD0FORICT1RtSymVEFjrtcw=; b=NOnkj78nMFZDSybAQ1VSb7yo6OtwjQaC1SzN
	M2cr03zkRx1yMFn/jpNlCNPT50hn78pYdDGLtxvIcJ/0SZ+6GyJAM5NuppP1myL/
	Sp6Gp0tSXEj7hym6uVNBh+SW4ZfIhhA5QvjEwV9TlMTVmaWQXDOod56UagV82n9N
	3CLf5TelIVcjZKLPtuYEpGG1urEtohkLnnHn6A0sD2IgGHLVGJmBqiPYY/ELunUQ
	VqaagED+gwbJppHqOLrcgqq6OPT8v5rNDXi51tFumxNsgQFMANgJdJzsPA36Q18n
	ptjomAFd1/iVhvT6185pojO9N6Gr4LFLms4kXANQAb8BaznQd+GPdxy0RUwF5h8L
	cunaSwhKFLu3SDDnjFVwhPRqOQGgFdRZ8DBUkl4E1IagDOaKc80EAMky44G78WQU
	en2o461VXVRVEW3DoG6GGf1gRvtlPU9Z8QeNsazaOMiwdDApnpeFzUZOeVKzr7/b
	XP9RneJ48xBtQbMCyvKcxZU5m1qUaFZT21PuoBI8ioUslmguw7dWGqQu+xHVnjPd
	mELz6xZJpctnxoETHphizukDIOr115QLTQvpefUGnbYD2PTnHMICx4D2fEzlBk8o
	fLxKqNWjX9g09SsQ1jw/+uCoCUtV0/UZZBbzqv+IyBY5TZcLL7hYxOUQtpB5L5WZ
	mc2seKA=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/4] spi: atmel-quadspi: Use `devm_dma_request_chan()`
Date: Fri, 24 Jan 2025 09:52:24 +0100
Message-ID: <20250124085221.766303-12-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250124085221.766303-4-csokas.bence@prolan.hu>
References: <20250124085221.766303-4-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1737709027;VERSION=7984;MC=3511041741;ID=70502;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94852677063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_005709_589282_D9B0B313 
X-CRM114-Status: GOOD (  14.84  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, dmaengine@vger.kernel.org, =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Leave releasing of DMA channels up to the devm
facilities. This way we can eliminate the rest
of the "goto ladder".

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 drivers/spi/atmel-quadspi.c | 44 ++++++++++---------------------------
 1 file changed, 11 insertions(+), 33 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index abdc49d9d940..b1fb4426c78d 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1288,18 +1288,20 @@ static int atmel_qspi_dma_init(struct spi_controller *ctrl)
 	struct atmel_qspi *aq = spi_controller_get_devdata(ctrl);
 	int ret;
 
-	aq->rx_chan = dma_request_chan(&aq->pdev->dev, "rx");
+	aq->rx_chan = devm_dma_request_chan(&aq->pdev->dev, "rx");
 	if (IS_ERR(aq->rx_chan)) {
 		aq->rx_chan = NULL;
 		return dev_err_probe(&aq->pdev->dev, PTR_ERR(aq->rx_chan),
 				     "RX DMA channel is not available\n");
 	}
 
-	aq->tx_chan = dma_request_chan(&aq->pdev->dev, "tx");
+	aq->tx_chan = devm_dma_request_chan(&aq->pdev->dev, "tx");
 	if (IS_ERR(aq->tx_chan)) {
 		ret = dev_err_probe(&aq->pdev->dev, PTR_ERR(aq->tx_chan),
 				    "TX DMA channel is not available\n");
-		goto release_rx_chan;
+		aq->rx_chan = NULL;
+		aq->tx_chan = NULL;
+		return ret;
 	}
 
 	ctrl->dma_rx = aq->rx_chan;
@@ -1310,20 +1312,6 @@ static int atmel_qspi_dma_init(struct spi_controller *ctrl)
 		 dma_chan_name(aq->tx_chan), dma_chan_name(aq->rx_chan));
 
 	return 0;
-
-release_rx_chan:
-	dma_release_channel(aq->rx_chan);
-	aq->rx_chan = NULL;
-	aq->tx_chan = NULL;
-	return ret;
-}
-
-static void atmel_qspi_dma_release(struct atmel_qspi *aq)
-{
-	if (aq->rx_chan)
-		dma_release_channel(aq->rx_chan);
-	if (aq->tx_chan)
-		dma_release_channel(aq->tx_chan);
 }
 
 static const struct atmel_qspi_ops atmel_qspi_ops = {
@@ -1428,14 +1416,13 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 
 	/* Request the IRQ */
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		err = irq;
-		goto dma_release;
-	}
+	if (irq < 0)
+		return irq;
+
 	err = devm_request_irq(&pdev->dev, irq, atmel_qspi_interrupt,
 			       0, dev_name(&pdev->dev), aq);
 	if (err)
-		goto dma_release;
+		return err;
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -1445,7 +1432,7 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 
 	err = atmel_qspi_init(aq);
 	if (err)
-		goto dma_release;
+		return err;
 
 	err = spi_register_controller(ctrl);
 	if (err) {
@@ -1453,18 +1440,12 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 		pm_runtime_disable(&pdev->dev);
 		pm_runtime_set_suspended(&pdev->dev);
 		pm_runtime_dont_use_autosuspend(&pdev->dev);
-		goto dma_release;
+		return err;
 	}
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
-
-dma_release:
-	if (aq->caps->has_dma)
-		atmel_qspi_dma_release(aq);
-
-	return err;
 }
 
 static int atmel_qspi_sama7g5_suspend(struct atmel_qspi *aq)
@@ -1514,9 +1495,6 @@ static void atmel_qspi_remove(struct platform_device *pdev)
 
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret >= 0) {
-		if (aq->caps->has_dma)
-			atmel_qspi_dma_release(aq);
-
 		if (aq->caps->has_gclk) {
 			ret = atmel_qspi_sama7g5_suspend(aq);
 			if (ret)
-- 
2.48.1




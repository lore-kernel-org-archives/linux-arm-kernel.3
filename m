Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50503C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cpdHJxpiKdoCJBJhkUL0M4SqzQhG4ymd2U7r+mGgSU=; b=OyDQqYx2BAeHwD
	/P0QAfypIm/p0dAaxEKHBNrJcJ8BC3WZkDMkWiUjeqpFUQx8kmYgoi/P0K99dUkv2Q9Gylsrwxky4
	Sn/hhOMSAhJT7rEdW0MloY0Zqlg17ExeEZ5NNZ8qlkYawo7C/ieHkL1KWrkVaQbzXRfVgUQ2agy7O
	bDHfWhcQ5s2VT4X8QwFk+nUqpWdYdOGGa+7cjCpnjdErXTIVoNFDhfZu/D6DSLKGI1OLeQ1Utkia3
	sTa/4T6tIF2zX+N6R6/cle4bcGCiqd2Rb2+b07cpMNaLadPdYnYxHsEBMnos2H/ekaR5EDS3PGVss
	F9EZ3GH86f0G0hfKQmvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5sU-0000000CMdy-3KGE;
	Wed, 15 Jan 2025 16:04:22 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5rB-0000000CMQH-32Jl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:03:03 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 26D09A0955;
	Wed, 15 Jan 2025 17:02:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=1cpdHJxpiKdoCJBJhkUL
	0M4SqzQhG4ymd2U7r+mGgSU=; b=edZQ9IAhPDOS3UkLhGpv/S4GZ65IsKanX2Fh
	U/l+weMXuV4dRCoiyL5GaM9y/a7ZZl8/DOEkVT/sld+4O13tVzLqppepWx+MiDDV
	5dJV+JPRDDEL9BKCRSLYVtl7c2+kVzw49ti2c3k7kUN3cG57XcduKclUFeJ7SJi3
	KabjLMQ8xDgaGP/9tj9x5SY8dRUrhZltrrIGpBGtrOVmq+32N4MqxXoMZei8AIn6
	DjDse6qGvGTKirMQVnpPGklZ9ESUj7jk1u3iKETVb8KJu+95IhheDG4XBX2zn2Nj
	EbgNBUU7doWlPMD9x85S2BfQCPnY/uf9ZefYMkKbZNDm3Y1lc84ugR29/b0pw/B4
	pJZiGMtz6YIgHjtWLa8wawkEQNxvxhiv2j/9c2IFqVEicbdnzysv0TG/WAQwUK2y
	H3Mo16uIFjo8yZ1dCYowfG4Ff1B+WnoNsARLWIqWHVtK3dPQ4zF6uY09hYfZRI7+
	OeJM2rA/nNqM4VhQ3c2r4CBzWWbeLFzz6lejrra1wOEWeAb71lO7SbV8WQ2ZDBm3
	xc3SVaEXf7vKMwwfIt3uu7sp/6lI83zqwZaNKtNwh3D6M8w2ore3V7Eea14U2au+
	FYAX33X+wLVQw0BHrE6wdZxarCgzseWl/8y8n8uTQOSDZgU/8jQw3A85djffh3Gx
	P7JXb5Y=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 3/4] spi: atmel-quadspi: Use `devm_dma_request_chan()`
Date: Wed, 15 Jan 2025 17:02:40 +0100
Message-ID: <20250115160244.1102881-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250115160244.1102881-1-csokas.bence@prolan.hu>
References: <20250115160244.1102881-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1736956968;VERSION=7983;MC=1121942183;ID=287149;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94852647067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_080302_205442_6A6FD844 
X-CRM114-Status: GOOD (  14.79  )
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
2.48.0




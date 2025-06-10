Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D83BC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 08:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4hvPkDpasDOqzvoPlQR6fqCNAD2mH8pnt4CYS2HbjE=; b=aMjQREfQghrePFIz+WRHDf29UQ
	y+dy2kodn2R0I0F6rj4tWfcXaaYmO+nqCLyapov6rHt8L8OCHkzpF91M/1UGHwTdnz/aGSLEWuw9W
	7xfrN6RaLd+0xBZr+Wh+Fa3wlg2YLcd1SmrWWMer6k6nnKPY1yKxaiAgBKOHFl861SrkX6fEAiWDS
	AAP0pPZ7sFQIZpPJWVTffIEZENEfpwMDEW3RgeS+djy4sZ8yp6WeuUKRHs0AkjUo2QzYYsUZFdJ/J
	sUoz69UANSblcWXuBboiIEQ+WVsVhRMgUJ306Ig3rzeDZMgfYl/ray1NBTM+jrrkfy1zaB0xVUT1T
	MB/olgEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOubK-00000006DIp-0wnJ;
	Tue, 10 Jun 2025 08:44:58 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuG6-000000069r3-23Wc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 08:23:03 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 19A53A06EF;
	Tue, 10 Jun 2025 10:23:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=h4hvPkDpasDOqzvoPlQR
	6fqCNAD2mH8pnt4CYS2HbjE=; b=aeGxAGuSxVT46TiaInzLbpyuWugAaXShxQHd
	7JYhH280LZezFPdLjyOAJ+78ycxQzs6b6SJhd3l7TE5uAv0LYbcATx4wHzBRL6Fa
	S9Qxpm7+0M1rLMRyyeh9VBeq573O+6U4wbfXlnSLuRhucQtcYraMdMMqyErsp7W7
	bFFL0XKAOs50acQv12bB9xG7KK5HetpLCEu+oAw5+mOoai1dlZoJP14nGFLriXiy
	AKPMFq1jZyRvphMuy4lB2/ci5NxQXLioiH5ej8RdyQI1CbqWbbM5sDDTyyyiVIUj
	jNgeLPCniB2W2LM3+2asubSdk+DUTxMBBP1PP+05sb9tV+zuEfaW6x3D7l1G0p8E
	eUIzDxJsyprW/0oGnEk5rTvnaoxNU9Sx4VIm6DSELemOc6/Ig8GTnP7FAOSqDgwF
	XRmg2BMbapGxDQnlhsKzPtLfk5QZINWj6HcoQhuKaW+qKtlPHWwde9MaWtEHYgIj
	lOGawqkL1VvJbLm1KwKrkVpHTtbIcJ9FVDJzykpfvJCyk+BxDYYVs20vAb3r2kHr
	ckRF0IlYTv/XIIIdCh1Qnr3HeYc4z0nL4EiMa8cooicukKe5BqYwDeER1+qScb5a
	nWfNXHOBMKeohoAI+amCFXuBDvdMyvq2BgNWJ3dh6GBlNqOJRRn+Ls7IwJpLETkq
	vEbjeYc=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, Mark Brown
	<broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
Subject: [PATCH v7 2/2] spi: atmel-quadspi: Use `devm_dma_request_chan()`
Date: Tue, 10 Jun 2025 10:22:54 +0200
Message-ID: <20250610082256.400492-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610082256.400492-1-csokas.bence@prolan.hu>
References: <20250610082256.400492-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1749543780;VERSION=7993;MC=3965923373;ID=452480;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155D62776A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_012302_685753_551A0FC8 
X-CRM114-Status: GOOD (  13.28  )
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

Leave releasing of DMA channels up to the devm facilities. This way we can
eliminate the rest of the "goto ladder".

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 drivers/spi/atmel-quadspi.c | 48 ++++++++++---------------------------
 1 file changed, 13 insertions(+), 35 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 2f6797324227..fc555c0ce52e 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1285,18 +1285,21 @@ static int atmel_qspi_dma_init(struct spi_controller *ctrl)
 	struct atmel_qspi *aq = spi_controller_get_devdata(ctrl);
 	int ret;
 
-	aq->rx_chan = dma_request_chan(&aq->pdev->dev, "rx");
+	aq->rx_chan = devm_dma_request_chan(&aq->pdev->dev, "rx");
 	if (IS_ERR(aq->rx_chan)) {
 		ret = dev_err_probe(&aq->pdev->dev, PTR_ERR(aq->rx_chan),
 				    "RX DMA channel is not available\n");
-		goto null_rx_chan;
+		aq->rx_chan = NULL;
+		return ret;
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
@@ -1307,21 +1310,6 @@ static int atmel_qspi_dma_init(struct spi_controller *ctrl)
 		 dma_chan_name(aq->tx_chan), dma_chan_name(aq->rx_chan));
 
 	return 0;
-
-release_rx_chan:
-	dma_release_channel(aq->rx_chan);
-	aq->tx_chan = NULL;
-null_rx_chan:
-	aq->rx_chan = NULL;
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
@@ -1426,14 +1414,13 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 
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
@@ -1442,22 +1429,16 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 
 	err = atmel_qspi_init(aq);
 	if (err)
-		goto dma_release;
+		return err;
 
 	err = spi_register_controller(ctrl);
 	if (err)
-		goto dma_release;
+		return err;
 
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
@@ -1507,9 +1488,6 @@ static void atmel_qspi_remove(struct platform_device *pdev)
 
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret >= 0) {
-		if (aq->caps->has_dma)
-			atmel_qspi_dma_release(aq);
-
 		if (aq->caps->has_gclk) {
 			ret = atmel_qspi_sama7g5_suspend(aq);
 			if (ret)
-- 
2.43.0




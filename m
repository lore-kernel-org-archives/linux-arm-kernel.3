Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEFFC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 14:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IN/XIQOFZsaQsG3NlzPEec8MNAZUwyS8e5k9emm1aR4=; b=WvqoyCxY62i1ZoSRVsZpbdzXkY
	2bELSH13xbxgFVZBni9Z5pR7A7wVYy7tYbm9nlaiRiuE9hecEiSsBZ1eCz49nJWGo71YyoWQrTt+A
	pgGoj6pYezNUGsf5ewYgfdxX0edh2b76BU+Cik8L43dQ55BR6BPQ6UF1WAxq2DJA/blVraRK1UKG/
	EopOJPY9kwzRYiR/3AQt5Yxvm+QLLfy7YZn2NyY6HhFmFsSAN1158ZMLmSZSrbVuBym9liZzjM8y/
	SAvYNvniQuVuvnFTwLCd/D4MWuem2zaTHi8dWyFr+QZRrrh0bPSZrVCiz7Ajgc+gKoX7u9Cgi/p7w
	ntTraDWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuB8s-00000002rI9-31j6;
	Mon, 17 Mar 2025 14:08:34 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuAug-00000002oea-1Yt6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 13:53:56 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id D3721A048F;
	Mon, 17 Mar 2025 14:53:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=IN/XIQOFZsaQsG3NlzPE
	ec8MNAZUwyS8e5k9emm1aR4=; b=r17N6AqkH2nrl776BcAgkfoOBfNYNWpMJyRT
	tfm0nmskGT4MHAC6D7MpzCAQ6X1CEwHSOB25ZdyUs7XbHep22QON+HNzM+o7FRrD
	f612rrVAcssZOrRHN7RTdLUna/Y/5zmGBZTs+EVgeuQD/knXpcerKcCWTWil9iiv
	5qE7Hv8Q5R5tC+5d+scWEhRybWzLJogERi9OYZUqUv43rzcsadbpR3yytY0Rvehe
	pTLsLS7dG7dUO/hhstcpq2VUffEvGikT7NG4QCL2ipWrfJUXK2A+HtL8/t7C/2BX
	P8C5kNL0TCnIiL5xC79goz5unnYwctZmwwBiJwwOoDdu0s5QZh89CRzG7pdMSZGi
	CcHSWgfSRwKIjxJtkSZeo9isIGhWnZqlN+pJ8a4o91tZLBGgJpyLe6QU4hu5mfep
	W0WOn+U1g53KRHONKJQWJkotHbWWevRfxjvXMF8rm5pIubj2qCyHuRGYbnOUJa60
	jUYkImHbHLZqR13zxshALb7gkOolehqbijBmFWurMNiX9NyBWn9s5qP5iivDVH9n
	kEAGv74OOEOfZOqQ7BixsUDO06n6kqXhD5Yo33gfnj+x2/Wio56zjnBYhtTgg0yf
	AaJXhhUfZCDp0+UzVeL7IxLj7R4EbW2AClT/Y0BVddMr567WVcNxsArdJ6Yp9ybt
	4/RMeM4=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, Mark Brown
	<broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
Subject: [PATCH v4 2/2] spi: atmel-quadspi: Use `devm_dma_request_chan()`
Date: Mon, 17 Mar 2025 14:53:38 +0100
Message-ID: <20250317135340.382532-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317135340.382532-1-csokas.bence@prolan.hu>
References: <20250317135340.382532-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1742219632;VERSION=7985;MC=3462887496;ID=155900;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD948526D7460
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_065354_873273_54DA87CF 
X-CRM114-Status: GOOD (  14.23  )
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
 drivers/spi/atmel-quadspi.c | 44 ++++++++++---------------------------
 1 file changed, 11 insertions(+), 33 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index ddd12600a6f1..8a950a20b58a 100644
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
@@ -1445,22 +1432,16 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 
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
@@ -1510,9 +1491,6 @@ static void atmel_qspi_remove(struct platform_device *pdev)
 
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




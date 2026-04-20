Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F32F588CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 14:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PtA7XaAsBped8tzDKGVHSMvp1WbWNwbAvXQ8vkybz/I=; b=lvDPYCcHZq0iEI2Pi1MmPOt4ZN
	+AZYOMynr2pHCumjTMORNL0wXHEf1iKWRPKMzCgXGhtsUW+7Ur0FEwTdDZbVpXyDQvTj3Q7iR+awz
	Y0+14w9XklPMqCpj7tnxl0OzIaxCebTbXEPpdBjCntQQJS/tyaLWLOI9igXMDBaByIJuWASDHFxpm
	YQ8hWVkhYJ6cXHyONXEl0K64UmGekitqP1mW+kpxLwEtro8UgCZrgNcN+yzZoBAUQJ/nd80PZPrW8
	QKXI55TJ7WPVN1ia/hZs2JARD3l78+QiEMr+eSBpfLT/9mgeux+HemNsIl3vq5DD2ypDVKoHzpXyu
	modeD/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpAQ-000000077t2-2JuG;
	Mon, 20 Apr 2026 14:00:02 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpAO-000000077rV-0PTn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 14:00:01 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2b2ea1b3962so18729625ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 06:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776693599; x=1777298399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PtA7XaAsBped8tzDKGVHSMvp1WbWNwbAvXQ8vkybz/I=;
        b=ayxTYsUZ1mFT2oCX3/BhRPHvxgbCO+Syt5r5iS3Sb7Q9cIwG4PWCNKHKkpKgmYWSzw
         5mCTt7UiLDGgkPMVZ4hXCt/z1bHslIB4LFPX2lRtBZMAnxPt1gnUahnuj0L9yu0DTPHK
         bmZke1VXRp5H6uwABrUNSK28axxr5b1plDH8WxC9Ineg6oqomA+WgnBpz8gJGAnV87RP
         idlGsDvk+FFopyY6KyKfPT4jQ6NWZY2pXjxUTSz+/o5mohSYBQHc/J1Xra/m8bR2mboo
         vm6Ktp3LS0x3uHwg3PXYSrCoSTMhVagoiuY6+W3nPlDIjEx6NFPELOxdBDysiiaT1DA4
         mDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776693599; x=1777298399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtA7XaAsBped8tzDKGVHSMvp1WbWNwbAvXQ8vkybz/I=;
        b=FmrdukEyy+lOLn858eF5OJutGyKQ+pIs3OESZgdak/ahE+45ewSTHyMKHNYKYyhRkb
         n2yeJkiPc0VelqqHwcaGj4xnpzChmPQ2SZdCwUFCCUdXB1kfOygtoh0oQ3PY7MqPY19g
         ty0QJbgHvbZmk63jhDUoptr+yWNHH2iWyKZ6R+vmN2em/Hu+dvwHdRYFXLyixp9S30aL
         oLEJWIrxMhz6UzVRlYmPlGxv/rNgnXNob7Qn257ssrBdhFSv/zmtBmGdAP6AUhEvuXEg
         O95V24sq4ZG62ot/CTDUfszFlGuGF92Oq6wJi/Y4ojM9IonHnkBZg2d+eCELkdsSr7aX
         pDDw==
X-Forwarded-Encrypted: i=1; AFNElJ+Ewk2FfUjg83RmLUwZWeE2bRId8Y+QyOtWLKt6j9yXYrytW62+Uh9OHDzUV6vn2rExmGFB0SSHRbGyRY8R7bzx@lists.infradead.org
X-Gm-Message-State: AOJu0YxDwVnEevosrHWkx7GzxmdccZ/5iMFpH/LfRBv4H0ihvxbSr6uD
	zjMtTWyDD4tAFqC3xw8au0yH+TaCwQgQxN6w69HQCAKVIyrBc+LSlqin
X-Gm-Gg: AeBDiesImMXOkfN1lIQrjfKbGP/c72pSw0qprz+lZhsJaZgQN1gbUEUeTKM5PrXxACP
	uQPL/0IYLkL83WcCuI5HdRozqr7NWsv9lSujXGUuqsnqn8B6tZjIgmd4L0TudRbY0CloH8AyDuA
	eM2ZA97eySNPf5jA5e4yJySgLGoZU3eU6DWuYoH6Aw4/5DlplYBPxIz22K++pC2X3cx1upPcJ5b
	GZzABNL1pKMuuvf+fHw4jynriSshvnHjgxl+wy1o7cAhuFhbct3NHiQQQEbJbKRWikvjLWwUpEz
	CZ9T9zdx1ZXZXjoEhDqdOV/rPcHco5uOn9yWFolVNRDb9QN/uJcUUNSg8Fdsb50UnZvPrLsv+Lx
	Wvue3RsxPQD4DqBVWfZsAzUXom3PPExcFNQo/T4hdrA4faYXGyP2DMhwvyr+wxqyD1femHzP4Fg
	hrwCM39HtulWqahew22BErlBkdvQ1d88rcsblodoVXtlfA3MBDRq1NzNUA/QCqMwNjXU7LGl9U
X-Received: by 2002:a17:902:ee84:b0:2b2:4697:78f4 with SMTP id d9443c01a7336-2b5f9fe094fmr113361365ad.31.1776693598648;
        Mon, 20 Apr 2026 06:59:58 -0700 (PDT)
Received: from localhost.localdomain ([115.110.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cd18sm112575965ad.45.2026.04.20.06.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 06:59:58 -0700 (PDT)
From: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
X-Google-Original-From: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: bhuvanchandra.dv@toradex.com,
	Frank.Li@nxp.com,
	peng.fan@nxp.com,
	sherry.sun@nxp.com,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
Subject: [PATCH] serial: fsl_lpuart: fix rx buffer and DMA map leaks in start_rx_dma
Date: Mon, 20 Apr 2026 19:29:03 +0530
Message-Id: <20260420135903.2062024-1-shitalkumar.gandhi@cambiumnetworks.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_070000_140322_C7E86E5F 
X-CRM114-Status: GOOD (  14.62  )
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

lpuart_start_rx_dma() allocates sport->rx_ring.buf with kzalloc() and
then maps a scatterlist via dma_map_sg().  On three subsequent error
paths the function returns directly without releasing those resources:

  - when dma_map_sg() returns 0 (-EINVAL):
      ring->buf is leaked.
  - when dmaengine_slave_config() fails:
      ring->buf and the DMA mapping are leaked.
  - when dmaengine_prep_dma_cyclic() returns NULL:
      ring->buf and the DMA mapping are leaked.

The sole cleanup path, lpuart_dma_rx_free(), is only reached when
lpuart_dma_rx_use is set, and the caller lpuart_rx_dma_startup() clears
that flag on failure of lpuart_start_rx_dma().  So these resources are
permanently leaked on every failure in this function.  Repeated port
open/close or termios changes under error conditions will slowly consume
memory and leave stale streaming DMA mappings behind.

Fix it by introducing two error labels that unmap the scatterlist and
free the ring buffer as appropriate.  While here, replace the misleading
-EFAULT (bad userspace pointer) returned when dmaengine_prep_dma_cyclic()
fails with the more accurate -ENOMEM, matching how other dmaengine users
in the tree treat this failure.

No functional change on the success path.

Fixes: 5887ad43ee02 ("tty: serial: fsl_lpuart: Use cyclic DMA for Rx")
Cc: stable@vger.kernel.org

Signed-off-by: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
---
 drivers/tty/serial/fsl_lpuart.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index f36d50fe056f..296a096be351 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -1376,7 +1376,8 @@ static inline int lpuart_start_rx_dma(struct lpuart_port *sport)
 
 	if (!nent) {
 		dev_err(sport->port.dev, "DMA Rx mapping error\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_free_buf;
 	}
 
 	dma_rx_sconfig.src_addr = lpuart_dma_datareg_addr(sport);
@@ -1388,7 +1389,7 @@ static inline int lpuart_start_rx_dma(struct lpuart_port *sport)
 	if (ret < 0) {
 		dev_err(sport->port.dev,
 				"DMA Rx slave config failed, err = %d\n", ret);
-		return ret;
+		goto err_unmap_sg;
 	}
 
 	sport->dma_rx_desc = dmaengine_prep_dma_cyclic(chan,
@@ -1399,7 +1400,8 @@ static inline int lpuart_start_rx_dma(struct lpuart_port *sport)
 				 DMA_PREP_INTERRUPT);
 	if (!sport->dma_rx_desc) {
 		dev_err(sport->port.dev, "Cannot prepare cyclic DMA\n");
-		return -EFAULT;
+		ret = -ENOMEM;
+		goto err_unmap_sg;
 	}
 
 	sport->dma_rx_desc->callback = lpuart_dma_rx_complete;
@@ -1423,6 +1425,13 @@ static inline int lpuart_start_rx_dma(struct lpuart_port *sport)
 	}
 
 	return 0;
+
+err_unmap_sg:
+	dma_unmap_sg(chan->device->dev, &sport->rx_sgl, 1, DMA_FROM_DEVICE);
+err_free_buf:
+	kfree(ring->buf);
+	ring->buf = NULL;
+	return ret;
 }
 
 static void lpuart_dma_rx_free(struct uart_port *port)
-- 
2.25.1



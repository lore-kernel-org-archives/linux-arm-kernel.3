Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D35C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8aPrpA9qH3mYBu4qEShT9xwHObH4PLttv2y/ISyUVc=; b=qTQ2asniSnJWrHzmaIfw7UQR7q
	d/SUaw5s5v0TRl4Pjhkpz2sB3SerIZkW3wHANYI95t5wNiIKBs8XbL/6aIXr4YNecVBJF2vg48uGF
	i/1U+LVvfM7XaK9j1KFlLCrkdWsBplI1t3otVn9ULaFmskaqUi2+fYMneZqP4qpgaAp36OZ0+gJYH
	lCHF57TqZAb1Fdz7W9LhUroZHRz7uB/iyk9K9bhe126Z5V6YbFl/CmJamKwYg7z3jxabiw6OrXOWU
	/9o7xaiy2aQDgvve9Fk7DvUuscRyRuZgraDI0dSMZVN4U4PYkJt5bnG+d5aBkKn/qjlq4gYW63rnh
	/5weFKUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgks8-0000000CpgW-1Iz2;
	Mon, 06 Jul 2026 15:04:36 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgks2-0000000Cpdx-3EXP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:04:32 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783350268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k8aPrpA9qH3mYBu4qEShT9xwHObH4PLttv2y/ISyUVc=;
	b=dJ60a06SWG3sF6UKFPGkozhxbifOBNCec5lE7M2Y7jxpDCmAINFagn/n7Ssa+wVSSWdvmU
	qenL0ElrwKw8qrgNe92RazVp9Pe2rSfTC2LHq7GchBHZtkbUnVAXobtZKS/MIEedgqKtjY
	YjVw5KmfR/wUHpgl3v0qr9+AD+l7/Pk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] crypto: atmel-tdes - drop redundant return variable in crypt_pdc_stop
Date: Mon,  6 Jul 2026 17:04:07 +0200
Message-ID: <20260706150404.382209-7-thorsten.blum@linux.dev>
In-Reply-To: <20260706150404.382209-5-thorsten.blum@linux.dev>
References: <20260706150404.382209-5-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=thorsten.blum@linux.dev; h=from:subject; bh=aRTU0Pz0l2SI7rKA3ZcbUXQZTrEpcGwDLfpgewgeVik=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFneh58+rNiwc2+v44v7++8lTD5qJfv9n58C8w67NWd+x Ks8u5ac2FHKwiDGxSArpsjyYNaPGb6lNZWbTCJ2wsxhZQIZwsDFKQATqZ7HyPBq0omGQsupYlsk lFi/VpyfWWGsGdN2bm3hiX+vzxZ7n5Bh+Kd/88ee0zHpf2ba3Jq52fawvMul2gDnBcfWuF49yjQ j7TIvAA==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_080430_948960_9D0FA421 
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

In atmel_tdes_crypt_pdc_stop(), remove the redundant return variable and
return the error directly.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-tdes.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index 32f0acae46e3..00a0b9694a26 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -285,7 +285,6 @@ static int atmel_tdes_write_ctrl(struct atmel_tdes_dev *dd)
 
 static int atmel_tdes_crypt_pdc_stop(struct atmel_tdes_dev *dd)
 {
-	int err = 0;
 	size_t count;
 
 	atmel_tdes_write(dd, TDES_PTCR, TDES_PTCR_TXTDIS|TDES_PTCR_RXTDIS);
@@ -297,16 +296,15 @@ static int atmel_tdes_crypt_pdc_stop(struct atmel_tdes_dev *dd)
 		dma_sync_single_for_cpu(dd->dev, dd->dma_addr_out,
 					dd->dma_size, DMA_FROM_DEVICE);
 
-		/* copy data */
 		count = atmel_tdes_sg_copy(&dd->out_sg, &dd->out_offset,
 				dd->buf_out, dd->buflen, dd->dma_size, 1);
 		if (count != dd->dma_size) {
-			err = -EINVAL;
 			dev_dbg(dd->dev, "not all data converted: %zu\n", count);
+			return -EINVAL;
 		}
 	}
 
-	return err;
+	return 0;
 }
 
 static int atmel_tdes_buff_init(struct atmel_tdes_dev *dd)


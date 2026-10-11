Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA26CA9ECC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 13:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41iFOT4c+Si/tmuMIJ//dDysW1MpGxzWZ9qlBe4vW7s=; b=Osswvt/7hns4pE5yPaxU6ar9Hd
	NThUf4Bj96vnfMzdy0nzV+f1EkF2ZVo4dXhfYcJKaYWdIc0nF6iINWiDscyS5dGdOJhwFzrAd/N2e
	MySLLk33MST2p9BCafzIgvy0EQt/jyMbDau2NwBXTxcy5hFSAj2g3N0ziDhL3IbplKtn50AQBJKHN
	oAKdcjkR1U8T7OcRIf2ug73GC3SaXvmGa93MxXigUjavh3aTybBXHU0aDbdCr3nrbVShVbc5VYa3a
	Cak5Tg9zvk/kdC9V7A2R1RUqnXljUS29enrTxG0k924uTAShLHwXLI1945cGsKPm80see7nWVEHm9
	a+LVDzIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtPQ-000000092tw-2PIp;
	Sun, 11 Oct 2026 13:16:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtPN-000000092t9-0OtD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 13:16:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D5D7B43D40;
	Sun, 11 Oct 2026 13:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C19C1F0089B;
	Sun, 11 Oct 2026 13:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791724568;
	bh=41iFOT4c+Si/tmuMIJ//dDysW1MpGxzWZ9qlBe4vW7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iUStyhhoyvjQKu1xPpKjXN65RTARXvQK4Xl96Y/fNaspzRkRJ4T0I1VklLZHwazvJ
	 qxgxwIgUXfPgSkGmXEccoGFQOcYb/lBLnWM+eCqwzu2euTJgvcg9fusMXuF/VrkutY
	 32CGCm2xmJII0LXsgJOEsmxBti5DCnaFy+Fk3sT/TY21bOHcRN04KiMSB55JysUBpM
	 he9fLrOWg+AhyNqROY0glyb5ZJCpIQGfTom//w+qYApLLczgmS3Nh465PCErJlLlLK
	 pRe8LsszvtgZ715dmgva0A7C/OPzc9qiHlmtJx8yRP+g1p5cjBCQCWzKHAOrJK6hiL
	 0Mp1XEziKmEaw==
From: Thorsten Blum <blum@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] crypto: atmel-tdes - consolidate error paths in atmel_tdes_dma_init()
Date: Sun, 11 Oct 2026 15:15:58 +0200
Message-ID: <20261011131556.272382-6-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261011131556.272382-4-blum@kernel.org>
References: <20261011131556.272382-4-blum@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337; i=blum@kernel.org; h=from:subject; bh=LYA+J9EZ6m00iu05nhNXfVsJujNa0NBCAOl4b0E9LRI=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmne3jV98lV3dqdGXW3fn9zgPUmITXZyDm/S3bGxj32v puxcO7JjlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAbiICsN/R01mVeHMtOlZU/ln FV9YtOvaK/X+vOL3hwuOM/iLWFu/ZfjvIFPPKrWH03Da5twY4cLtUvumPpl8xL7/xiHBKNO+mUV MAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
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

Release the DMA channel directly and consolidate the error paths.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/crypto/atmel-tdes.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index f92dc2fff50c..6b561b333ac6 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -633,7 +633,7 @@ static int atmel_tdes_dma_init(struct atmel_tdes_dev *dd)
 	dd->dma_lch_in.chan = dma_request_chan(dd->dev, "tx");
 	if (IS_ERR(dd->dma_lch_in.chan)) {
 		ret = PTR_ERR(dd->dma_lch_in.chan);
-		goto err_dma_in;
+		goto err_dma;
 	}
 
 	dd->dma_lch_in.dma_conf.dst_addr = dd->phys_base +
@@ -649,7 +649,8 @@ static int atmel_tdes_dma_init(struct atmel_tdes_dev *dd)
 	dd->dma_lch_out.chan = dma_request_chan(dd->dev, "rx");
 	if (IS_ERR(dd->dma_lch_out.chan)) {
 		ret = PTR_ERR(dd->dma_lch_out.chan);
-		goto err_dma_out;
+		dma_release_channel(dd->dma_lch_in.chan);
+		goto err_dma;
 	}
 
 	dd->dma_lch_out.dma_conf.src_addr = dd->phys_base +
@@ -664,9 +665,7 @@ static int atmel_tdes_dma_init(struct atmel_tdes_dev *dd)
 
 	return 0;
 
-err_dma_out:
-	dma_release_channel(dd->dma_lch_in.chan);
-err_dma_in:
+err_dma:
 	dev_err(dd->dev, "no DMA channel available\n");
 	return ret;
 }


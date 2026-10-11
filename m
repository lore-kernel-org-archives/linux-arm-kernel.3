Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EABCA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 13:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXlzmbaJxn4CnVjR3PmJa42S9oeGWwiIQUYVGfBTiNI=; b=lB/QdnGMCG5coaOS0J5rCD2XdS
	nfvH5YW0ZizRSR54guTl7o8xBQ0APDYPdpslxRSY9/oYLwV8MqlGFAE7R1aSeRaOc/uoFVr0IDnUr
	bvqO+dXHRqLUZPASxfCibkmsfsSqCoBnnz2ZBBc2ubt1ZWmNx6UL+GY3mXP5bHu2luoRHzzIdAFeh
	C3Po5tvn9J01WKpDXLXPpAhEa8/S/T7T7fAyXMVYg2BtcrydpKC/Tsn7n88Kds7YclbqPyjnLCopz
	bQuamP3nj8NTLsRMuqHk41uEbZvOTbimld5lKMZQTqr48TQLc823uXvDVzVUUrMFESRGmaPXJVdAc
	U9bEB5yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtPN-000000092tI-21pd;
	Sun, 11 Oct 2026 13:16:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtPK-000000092sW-20OP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 13:16:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E672B43CBF;
	Sun, 11 Oct 2026 13:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16B21F0089C;
	Sun, 11 Oct 2026 13:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791724565;
	bh=cXlzmbaJxn4CnVjR3PmJa42S9oeGWwiIQUYVGfBTiNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nz+4JZpgR7Rxw3diD26ozBvvIAX8rNv2SZ9fNaYvEcJwmd3grNrk4yzs/FVCPptJN
	 gU0hli8SxSwxUMt3nL+66Voapi5ZN/IpN4aLbe8AM9SSSKstQzmQWTL18PFwm0YZ33
	 h/nVctRh1TZw5CryPmuwmibjrPgvpx4hksHji9C5y88c+3yD3eJpONKWU8g0iBQwht
	 mREZnOIZuhLKvxJLk3GfpVzsyNvrBzfIW0SQQqnPHXvFjTemfzxxRg9g5Wuu//JQ3E
	 DfV9Mcme7OmvHsGVDCOXhWXN/sxtTpt1qI2xIwj6q3W8DV2MrZWL2nZKnfF26fRnKs
	 TfrIUtJBrpmGA==
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
Subject: [PATCH 2/3] crypto: atmel-tdes - reuse fast in atmel_tdes_crypt_start()
Date: Sun, 11 Oct 2026 15:15:57 +0200
Message-ID: <20261011131556.272382-5-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261011131556.272382-4-blum@kernel.org>
References: <20261011131556.272382-4-blum@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=754; i=blum@kernel.org; h=from:subject; bh=i2IEMteghzbOZjEP3K+DE9tgH6sC3YNRIyeoSHGFpFw=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmne3jMMiZc5y06s/9nKdfvH68axF5tMv7DY7l1U0Rdl lbWtZ2SHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRCBFGhj1WTlYHuOuPMm2/ YH3cam22dN/zxpRVV667eTeEeKn8q2RkuLVI563Z/TX5m9nrzh041PonKOhB/K+ei70TCi7waXu lMQMA
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

Use the existing fast variable instead of testing for TDES_FLAGS_FAST in
dd->flags again.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/crypto/atmel-tdes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index b2fca4baee2f..f92dc2fff50c 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -473,7 +473,7 @@ static int atmel_tdes_crypt_start(struct atmel_tdes_dev *dd)
 	else
 		err = atmel_tdes_crypt_pdc(dd, addr_in, addr_out);
 
-	if (err && (dd->flags & TDES_FLAGS_FAST)) {
+	if (err && fast) {
 		dma_unmap_sg(dd->dev, dd->in_sg, 1, DMA_TO_DEVICE);
 		dma_unmap_sg(dd->dev, dd->out_sg, 1, DMA_FROM_DEVICE);
 	}


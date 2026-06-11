Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFD7CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 10:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RmZrjg0Q3ZVv2NrQ57o9v2/owjwm0nO+Z9ZCILQ1szE=; b=Cw+muDqJaBoUtR1m3B75JXJ0P0
	HlM7zdD60gP+4sInHflEu20fAT04S3P9lKTEZPO6754xIoPyJthlbVEWUwXez7aRpjx2FjuOfP3V9
	iObEcJ+YhBBdD0JJQIK7/kMdoPNoDYu5BCsexi5pkSuRRVykhjiUFg0kpZ2vnpPwX6Wb7XiqRxDAX
	eekbKQhvrDn4GmKRxK1BbOmlgbXJIRbtUV+Nvw6PFo6ozBugwuzB/aeWfn8jyYS/JmYkCUQP2Gyur
	xbQm2Ch3ENdJFFP9URoNcft+HdxyD+i2uC4EVhd0HnVNLLb9QV5g2DAP2n8zD+pW3mPKtqezloFRk
	R0UT81iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXd1g-00000009FpV-11Ir;
	Thu, 11 Jun 2026 10:52:44 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXd1d-00000009FoW-3SYy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 10:52:43 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781175157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RmZrjg0Q3ZVv2NrQ57o9v2/owjwm0nO+Z9ZCILQ1szE=;
	b=a4fhU6URE5X9iJd0IpRNzX4jDyp2hwMqr/P4H5KJz1gYz9UxnwiAMr1T0LOT7WHIb2h29o
	ZcuZmudL+2qQVjP/2aL9umjpF5rdHnyig8KFTp21KwzAe703q2JNKKx1hNpOnpaYjK8nda
	xI4/6UGH6L1wSAfpDqCpgr9JVEgUJJo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thorsten Blum <thorsten.blum@linux.dev>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel-ecc - drop unused curve id from atmel_ecdh_ctx
Date: Thu, 11 Jun 2026 12:52:01 +0200
Message-ID: <20260611105159.460794-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; i=thorsten.blum@linux.dev; h=from:subject; bh=Qu6LcM2KvLfw0lQYIuHm/kgXovCbBsOqYibtk8bQ6UA=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlak/0vVYav2rf+/sz3bSv0dRK94oLytI+KX/ad+zdMf HJYUFlYRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAExkyyFGhkWd050XLVnS0PPq yP6T0/58kVkjcE9T+9elM6f+L5jEqKTJyLBnUz4/m47Fi6rb/j/ll62Z4xOUf9qqs/hI7sa79ar Rk7kB
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_035242_069555_1583D358 
X-CRM114-Status: GOOD (  10.13  )
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

->curve_id is only set once, but never used - remove it.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-ecc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 9da9dd6585df..93f219558c2f 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -33,7 +33,6 @@ static struct atmel_ecc_driver_data driver_data;
  * @public_key : generated when calling set_secret(). It's the responsibility
  *               of the user to not call set_secret() while
  *               generate_public_key() or compute_shared_secret() are in flight.
- * @curve_id   : elliptic curve id
  * @do_fallback: true when the device doesn't support the curve or when the user
  *               wants to use its own private key.
  */
@@ -41,7 +40,6 @@ struct atmel_ecdh_ctx {
 	struct i2c_client *client;
 	struct crypto_kpp *fallback;
 	const u8 *public_key;
-	unsigned int curve_id;
 	bool do_fallback;
 };
 
@@ -250,7 +248,6 @@ static int atmel_ecdh_init_tfm(struct crypto_kpp *tfm)
 	struct crypto_kpp *fallback;
 	struct atmel_ecdh_ctx *ctx = kpp_tfm_ctx(tfm);
 
-	ctx->curve_id = ECC_CURVE_NIST_P256;
 	ctx->client = atmel_ecc_i2c_client_alloc();
 	if (IS_ERR(ctx->client)) {
 		pr_err("tfm - i2c_client binding failed\n");


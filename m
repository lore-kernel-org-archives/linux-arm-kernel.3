Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817B6C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 20:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqcl2A1/Y/Zoai1qlUZXrlRzPqCbNIULxhuRqzApzxE=; b=hOPhr06yS2NM2cRI+y3MgIG/2e
	p3vLwXb3XDArhZiegDqO0JmFcK+gfWDnQwB9AVZV//r2iRdROeTHLYsLrJe/yTRGrl60eMpFF9q4S
	VW+MGF6c7roO3+l5ei3g5ncal+mFb/7kqzvt+OHg62Bo9TvmdIHvKmQXWJJEA1Ul93NYSU+MZZGUL
	LXlj0fdJDFjm0FeyluYutOKfMx1hLBTyRuLdvtq5N4jmTRKorgt2EyhY2TTiCCfnb+h0/dQPibevx
	D9dIhBiZQ9XxYbi7b5w/ufGLxQX430CIUhCQrvlfVtA666w0sb50g7XmnabDVDlwAtmF1Qp5A478M
	D0vuAo1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woot1-00000006FBS-15Ik;
	Tue, 28 Jul 2026 20:58:51 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woosy-00000006FAo-1qtE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 20:58:49 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785272326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jqcl2A1/Y/Zoai1qlUZXrlRzPqCbNIULxhuRqzApzxE=;
	b=KIZnDZYloKH0jnQ37cT+8sAqt0k7tIJ9I5+SdYZbg6ogLPIE/6xZe95NEfKzUf3jfTyn/Y
	/80EhR8eGku8lJgd0SmLyFVwuoxiuMiYwv6ZmGhoa7mGS12nhXqhGdKCffNR2zt5R7ta3y
	lJ+l2fU/4JlzqmzpXEAQlgqpQqM6L6w=
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
Subject: [PATCH 2/2] crypto: atmel-ecc - drop redundant return variable
Date: Tue, 28 Jul 2026 22:58:27 +0200
Message-ID: <20260728205825.471233-4-thorsten.blum@linux.dev>
In-Reply-To: <20260728205825.471233-3-thorsten.blum@linux.dev>
References: <20260728205825.471233-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=thorsten.blum@linux.dev; h=from:subject; bh=WzP/RvGoPS91Jf8i1xsA0+TMgFvLbMx4vB/VMlUlAfg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmZ4p/a9VSipk4t4LI5uOpqg94Gz8SOHXv0K7nEPVWFr mgZrzvZUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABMxP8bwv2ie2s/rNVbnU1dJ LnwTb/bl94tm4Z9hTGm3+AyUP8ifkGb4n1jOwOz9LVmRdebO7o7A2Unxd58oLOvTdjhouazjqv1 fRgA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_135848_726504_A8ACC7F7 
X-CRM114-Status: GOOD (  10.92  )
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

In atmel_ecdh_generate_public_key(), drop the redundant return variable
and return -EINVAL and 0 directly.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-ecc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index f98782f0a2c6..0c6ab5da9299 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -125,7 +125,6 @@ static int atmel_ecdh_generate_public_key(struct kpp_request *req)
 	struct crypto_kpp *tfm = crypto_kpp_reqtfm(req);
 	struct atmel_ecdh_ctx *ctx = kpp_tfm_ctx(tfm);
 	size_t copied, nbytes;
-	int ret = 0;
 
 	if (ctx->do_fallback) {
 		kpp_request_set_tfm(req, ctx->fallback);
@@ -143,9 +142,9 @@ static int atmel_ecdh_generate_public_key(struct kpp_request *req)
 				     sg_nents_for_len(req->dst, nbytes),
 				     ctx->public_key, nbytes);
 	if (copied != nbytes)
-		ret = -EINVAL;
+		return -EINVAL;
 
-	return ret;
+	return 0;
 }
 
 static int atmel_ecdh_compute_shared_secret(struct kpp_request *req)


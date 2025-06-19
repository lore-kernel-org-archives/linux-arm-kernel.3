Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC833C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOCWgCxa5TuHqEzs7P/Xd0Uu+UeKSk+lfEEEEay9BLo=; b=X7FD4+kcHbrJe+Ln2MZrk3iVyG
	LPI3C7gpAV66BD73EnXwHtzflcfaL/FoofSUJl5BotlZmg43K3xT2Hv5J9ea3M0aXXxsIZnMI/nQd
	xbdx9lRQxlbik7BcSlsvtFn/Ho8uBtvOqis8Ef0b8atC7NZx04QFhTFYeJiFWPubhJaqDJzYKwstL
	XAyTnAJ4tNvAIo8NB8re2sBL9XUd87PKltgRrCoxo3Sp94qtHopPC+0ZnBfEXyzQVgtCDD1LxOvhq
	Tgx6DbHvCswPxM4EjD4m8xZcd93hOLa80pjI9WRz8cVuc59QeL9jqTaLnaqe0CHnSi3YCuCJrzG36
	D8Em2RFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIeb-0000000DekF-20xU;
	Thu, 19 Jun 2025 17:02:21 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEJX-0000000D2ZJ-04wo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:24:20 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ade76b8356cso123091766b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335858; x=1750940658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOCWgCxa5TuHqEzs7P/Xd0Uu+UeKSk+lfEEEEay9BLo=;
        b=T00ACUGuvKVjD/Vhx98sYcu6Ag8IXFaG04KjTbxbNl+pCyuTSpWIajRLgVp7W8dSQj
         v7EZ4vp7SIL14300wtmcbF1W758Ls91TvaAg8t7nIUzvP6RuPvFMh2H2jNpqnLvJh13H
         wd0h1itV035vZf9126/hM0grRyU+m6o0FTnfvkFxYgZQUiU9teypBky6+A9SrIgDoRIY
         gMyOoPDlN089cwSigQPUuVnRS+5wMM3MblLSZGKG+mWELnfAHQTFPVLPmK5kVejdL9DF
         NVbhbfmAtBzwLsr2BIjC7HaMvJf+uQctc1JB83rzCLYAb2Od/2ixI8VKYrNR5moRYbYU
         RCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335858; x=1750940658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOCWgCxa5TuHqEzs7P/Xd0Uu+UeKSk+lfEEEEay9BLo=;
        b=unwdz/oxW/jVbL8ybddTZQrsapc3dEKFI8nvQ5CGdtOQ/+2XBl/MWT+v6dUXDrTSln
         5SkUgAFTKq28ow4vS5ZPtXU0lo+r9fQLMDJzjs2cKkz7bggD6CN7cAYH8guF+a8butNs
         JrJ40hkxkEK1YTjAQ80vJSj7oN5+OORlz50BikiZ4NfG/TXE9pGD9Ka5MPuotMlTDizK
         8OK/++WfCY0/aYdsTvwbxfTlmpgSBBlgIWjj2UWVBXL634FHQYNLSdvRY7bKUhoCX31P
         xnYCGa9lsv3Yu4JHgnTfGWQ98oDRMrd9XhOYkMN2/BPk9i97pbgwB3kS/RsAVZHgbd2l
         /kgA==
X-Forwarded-Encrypted: i=1; AJvYcCUKUN14rL3DdJV5JXwuySPEMU9iB/qkK1mFlQR5y5iIn2+gqaSTGALjk95DSyVJuRjiuS0Hex4qgLYRQZzIkuzS@lists.infradead.org
X-Gm-Message-State: AOJu0YyZPo5zttfyzyOLQWKS02u3j/onUg8azH8wGgvJ++WbeADx32LY
	ruSyZnCUhhwqvkRzSfb7TPSEZwoZgfaBZUqKPHThFPSjRJWmlSCVfezR
X-Gm-Gg: ASbGncspmmAM2CvhYr10a5GINxejRGg6pugNIwZj1TUcQVJhHdbf8zTvbn0z6I2RRoh
	GAIzBDGKms2fsDQgEUT9bbymF/OvWt0WL0PHWRKH1s44tmdsHW24XFWRVk9ZqBbwBAWa4+V07Km
	tCx1bmAC31lyUknkPe3XWykXkjr4YdGBOaVDEf212ohrA/7nJrGS8Htylbb04a1VIMxKujf2GJb
	ctdiQuaKW2GDf+4Xb1a+Cdq856Sfi9Cj1D7J+ajTzpeV7u2/Mz39BFZKCbvo8eCF216iVT0gub2
	2mv9djgAjJd8+8KLxYCKkmAprnb3+Eg2c88mNbvbdq4KCM2vbvBCEAnoPtcMHwtf4jD1sAU6HQw
	TZRtPcB8ZwNZ81w==
X-Google-Smtp-Source: AGHT+IE+a44JiT4pmaQaCPgiF4SiL6W/ZMs6YLvucyMriX+08QeWg5qDOEHlRbDj5alSx6vbOGHqPA==
X-Received: by 2002:a17:906:9fcb:b0:ad8:9e5b:9217 with SMTP id a640c23a62f3a-adfad60cb3bmr2167795566b.45.1750335857453;
        Thu, 19 Jun 2025 05:24:17 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae000b02bd3sm504688066b.3.2025.06.19.05.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:24:17 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 06/10] crypto: sun8i-ce - fold sun8i_ce_cipher_run() into sun8i_ce_cipher_do_one()
Date: Thu, 19 Jun 2025 15:23:12 +0300
Message-ID: <20250619122316.2587236-7-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
References: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_052419_063536_F223F084 
X-CRM114-Status: GOOD (  13.15  )
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

Fold sun8i_ce_cipher_run() into it's only caller, sun8i_ce_cipher_do_one(),
to eliminate a bit of boilerplate.

This will also make it a bit more clear that the skcipher do_one_request()
callback follows the usual prepare -> run -> unprepare pattern.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 34 ++++++++-----------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 9963e5962551..5fdb6a986b1f 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -360,31 +360,27 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
 	dma_unmap_single(ce->dev, rctx->addr_key, op->keylen, DMA_TO_DEVICE);
 }
 
-static void sun8i_ce_cipher_run(struct crypto_engine *engine, void *areq)
-{
-	struct skcipher_request *breq = container_of(areq, struct skcipher_request, base);
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(breq);
-	struct sun8i_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
-	struct sun8i_ce_dev *ce = op->ce;
-	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(breq);
-	int flow, err;
-
-	flow = rctx->flow;
-	err = sun8i_ce_run_task(ce, flow, crypto_tfm_alg_name(breq->base.tfm));
-	sun8i_ce_cipher_unprepare(engine, areq);
-	local_bh_disable();
-	crypto_finalize_skcipher_request(engine, breq, err);
-	local_bh_enable();
-}
-
 int sun8i_ce_cipher_do_one(struct crypto_engine *engine, void *areq)
 {
-	int err = sun8i_ce_cipher_prepare(engine, areq);
+	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
+	struct skcipher_request *req = skcipher_request_cast(areq);
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	struct sun8i_cipher_tfm_ctx *ctx = crypto_skcipher_ctx(tfm);
+	struct sun8i_ce_dev *ce = ctx->ce;
+	int err;
 
+	err = sun8i_ce_cipher_prepare(engine, areq);
 	if (err)
 		return err;
 
-	sun8i_ce_cipher_run(engine, areq);
+	err = sun8i_ce_run_task(ce, rctx->flow,
+				crypto_tfm_alg_name(req->base.tfm));
+	sun8i_ce_cipher_unprepare(engine, areq);
+
+	local_bh_disable();
+	crypto_finalize_skcipher_request(engine, req, err);
+	local_bh_enable();
+
 	return 0;
 }
 
-- 
2.49.0



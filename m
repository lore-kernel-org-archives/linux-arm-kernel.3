Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F078CC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlcibDkuEhs59MfzxPNpL2Xe4LDD/D/d8iw52Y6RVVM=; b=qwg12BlvyzsF2QcdiTSFUCOJUL
	yRlTvgNgpzxkK+u+oiG3aN+uXgRjuHGR53UEE+bZmx0eE0q/7bUQO22VzgIqmXwIC7p5gHIWXdfmc
	gK1AS4pA0QsHLEjJN8QKPniIu1Gx/D4p0rkVQSp3Um8sH2st9HNVDyPaXxeBwzRJjCOIx9CdBRDgp
	R0BQu5MuEQpZkXA9ECwWdJRaF5aittSVbw0t3UTlRDhsJKyna4ICF/VwN9wVWazLaY+wTP3ia6R7w
	h7tGm5diN23Wz2dEjKf2uxBB27RZYW5q5urwe/hsvq9sUHL8Z9LiYdBSsOAqhYsq+3iQHDB0aYE0A
	Ra1DQMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHks-0000000Dnec-3a4b;
	Mon, 28 Jul 2025 06:54:38 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugH1n-0000000DjIj-2Oat
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 06:08:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4563bc166a5so23281415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 23:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682882; x=1754287682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlcibDkuEhs59MfzxPNpL2Xe4LDD/D/d8iw52Y6RVVM=;
        b=bTTmBvWGD/xR7rmIgs62lEiQ+6WR0EHYP2AYTbVgSTvRbgB7xl4s3ifsZrsk+DiYm0
         fBqppQgqVjU+EpsrqErfBVe63vOyDYJVGAw308tf68ogRxjOT6tRMQyP5/zbgBwBd5kd
         Dd/7y9Jt2oB77hzdQNr9l0xbDnjfBBtgLZYvTimPaCaw+g5uXcERhrfGh+XbxwrWnfZU
         uuhQl5syrE/cZnp5LOVyCZQLhyAm9XlMFEOdvhmreobP8vP+WZiAVJ8vA/DjEYwG9wy4
         jXJqTbL2MmgLWA7hGklW5eP/NRC6oIiYmyz8F9dMfIAchwH7wTD1Gbram1L+t7YmH1pt
         vQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682882; x=1754287682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlcibDkuEhs59MfzxPNpL2Xe4LDD/D/d8iw52Y6RVVM=;
        b=G/S3TUi8rygHBIXB7ownVNt7jaxjO/iY8liS4UPncFvDhTBBJhJLOoOVMdZWjM8QWZ
         fpe0Co3Aq+52qUlfuofQcr+9yFyQP/g9XR+0I6EkuDgWL5YEBNFs0Xcs1PAAPlbQQDCm
         cK8DjZv1a9wXhZ+exAQwQ9uB+atSeOEpzHPnxvrByTVuqX2FtJ+/WUvLBI0I7CyTM8zv
         4ao2UP4680HCwdiyrqMld4t8XTbjJDUqmTLoIaIAM3BDk2sVGsC9LG0/0wi8+i2vOwLn
         ciW8ewPUHXkoc2LbPotImBVQAU0O5WjiPgL+qNEDkFs1yqg6zQ+NBhXMX1AZivy98Tow
         I3cA==
X-Forwarded-Encrypted: i=1; AJvYcCX7yT0p63hfHmHQcDX89ghj9E4wFsyAKs9e2Oq32FylbLzrg/i6OoquA9yfrEYX8MnsxyeOS0Sls3Qt2d5w8GWd@lists.infradead.org
X-Gm-Message-State: AOJu0YxW4a3RZQ4lznagfNIIDfSqjpvjPgeaiwBSLpkSNrDyrEGzh6Qf
	qYZd2fVmtkieJpltgpE3hWiJHimYiavCOI7qRIcmUv8j81DO/DXe57M3
X-Gm-Gg: ASbGncsn2ZbXSKNYL3P3mOJLtjtmUFFuqI/VhxNLHpEe7up4Q9rb4NePmMuLt33kJJj
	Uii0xMT5gnMDtqxjrSOQDrUzPpmyy1dWXyVQMCQ1kuP40GWo+wKwM/t3x+nbvvqdnBBzz4LoUkH
	JzCuzs4a6EPHt5uWqHGDleDAenEB2WM5D8LSaKHLNvSkMVdkruDz/qqXLjXYkW4PYFK1fo2i10r
	sdMrXbAzUY6nWJ4U26+9sZKOb+VmZWqaYzkVGt7hKkczkhpOEFi3eq+i7MavnGQzblHKM/HONPK
	NOTEWVih0pTBYKx07Nkh9TfBGvxVeZRn6vVm93Lp/6SMKPvpef96B11Ees9PnrkzSt8+Q/BV5g8
	aktsayBXD6SQJPBSqlwkxn9er+nzq6WwAag==
X-Google-Smtp-Source: AGHT+IGpFevRNhf2Vrq4L9a0rQ+pWGEn25CUoR7Gcz+cBTBQUtLy+n5N/VX74UxKawJZYUhaHpYi5w==
X-Received: by 2002:a05:600c:1ca9:b0:450:c9e3:91fe with SMTP id 5b1f17b1804b1-458754bbe03mr80560255e9.0.1753682881878;
        Sun, 27 Jul 2025 23:08:01 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:08:01 -0700 (PDT)
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
Subject: [PATCH 6/9] crypto: sun8i-ce - fold sun8i_ce_cipher_run() into sun8i_ce_cipher_do_one()
Date: Mon, 28 Jul 2025 09:06:58 +0300
Message-ID: <20250728060701.1787607-7-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
References: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_230803_610507_43EFD982 
X-CRM114-Status: GOOD (  11.87  )
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

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 35 +++++++++----------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 69ba8236cf2d..f63d21cd1e52 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -360,31 +360,28 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
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
+	struct skcipher_request *req = skcipher_request_cast(areq);
+	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(req);
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
+
+	sun8i_ce_cipher_unprepare(engine, areq);
+
+	local_bh_disable();
+	crypto_finalize_skcipher_request(engine, req, err);
+	local_bh_enable();
+
 	return 0;
 }
 
-- 
2.50.0



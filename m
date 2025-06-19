Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D8AC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HrsFLSEEMdhGLUzZIYXTdJy0VycwWTY4NZmzeB9UZg=; b=WKuLekOADqQq1dPi4mcGj7zFof
	l8pxieJZehkHBg8sgXaL5m0GYE7raWWDKpVcrI4/pwGzsfOWR+WsZn90dsDHAL6ootyX2x6KLfljb
	U0glNqI2C7MvVilmN5DUcLkb5+nPCexey+G0qjqOtYeagWDTPdRNHVTqsjIzBmKnje6HvP5+GrCYM
	N7q9WsOSTV4MP1uhiTBT6yYLrQB2WVl0nfXvYDjN/393gmuKH5a/Gme2Xvrj0T7yBT5b3TQC5D09k
	Z6ZDbBO82fWAsTLDAWDaRgUIjT9OMckuP3Q6nQ9asPPWF7MFA69lw5uEOk5VzuV7v1KeXzWE33Dlf
	tXUhex9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHU5-0000000DVaG-2W6o;
	Thu, 19 Jun 2025 15:47:25 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEJS-0000000D2X1-2oh1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:24:15 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ade5ca8bc69so122728366b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 05:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335853; x=1750940653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HrsFLSEEMdhGLUzZIYXTdJy0VycwWTY4NZmzeB9UZg=;
        b=DjNiJuCCVyhYau7epR/ZV2UKYwra6WzdsJOCPHwRyrRPh29IS3SV9jNVKJbp4z+8Zd
         dY4YBoonAG5nw0ZZf58/uAhc2RlsrbHxKKH2aLlca9ducdmzgxLFD+6j3eO+sRI973++
         4yMbbCe1CiY1QU/Y1jpdZsTB+nhrDPSQeUEygvgXo+1/3vZO8I7PVVKQIJb5MMtjvly8
         uIp6T2AsAElrEkhM9ItGnJ4EiD4n0V/7iOwCyX3+ebuCiR4bk2CujKDYIZsMGOc9r9RS
         q5/gevUSZEMH+vCY5v/oOrbdj7k+Km1XtHjKO1jnJT5ba4EWoivOE/0HwjjBYNn6qSL6
         YgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335853; x=1750940653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HrsFLSEEMdhGLUzZIYXTdJy0VycwWTY4NZmzeB9UZg=;
        b=xTvXk2hBU8SH58637AQE6Wdko8lWjZnxPj8/R5aveXbVcRdXQ7tU6UzUcSa+xMqyoS
         uOQr4jFHNhQ6l5wM4jNUzYstKo3ESBvyEPG0dhk3dvjzdZ4kPN/qf0x2UgYH20tJ2cFB
         Gi48KIJWEGN5Fnm63sqPL4xeMRm3k31e1qlUxvvScFbkL1WeL9Om9qVVx62PlyUJE///
         XdoOJGO79I1T/E2XSlVXygHKiSRl3nPy5TIyHrTEXA9c01ET8Na3OSZ6hg/IPc6/YDr5
         HJRGxzwW354xoCUk0aSKqAeMHoSRPytVGhMaJK2V2VAdt3k3hyjFqrA9Tw+ea0QgIEyF
         AGUA==
X-Forwarded-Encrypted: i=1; AJvYcCVDoziD8+VaKiWZk0KWdaeiccCt/WFqxx7uvPhXDQZWaLUdY6NG6xbZ3ODoOm52IWkaq4Tm3/scr+OGSqkXvf41@lists.infradead.org
X-Gm-Message-State: AOJu0YzpM2EQWTWN5448G/YtkTP9L7o3NRnlwhBtzpVg8671tIYu71AN
	iAFUzmTDzZ/OVlHxgq50REfL+Ai5YHmphwV9JpeYKo0uIR71otwJsoA4
X-Gm-Gg: ASbGncvwEckolzJleX8X0AS1gnN0exNhJ2AXgHxrVAba5xZlhLo7Z0WW+TYrabC7BeG
	oge17sZh5J6TBFYOyYzB6AWFueztu0qdku4N0AeTqClOmnSfWTIOQ7xcTRsUOjzg+Tm/mIzI9Cu
	DutnkisiE2iv4uKhIaoME9th+a4V/KU+j/RzDCKlB+04zIO3S3JvLBcRPxFECiIkvwJBscTceFS
	4NJp9OtHZ8VZVtT4947vzMUdamv0/SD9UY6+FqPKc3xdtZZpdzdUHxFXBd8g0LduwC/kUuiepiI
	N0l9dGp8yiWKrEU6nkZ7xkd7saQrAQOUS3WhceCDrU1Zs74jKtMIUhDxFt7BWtdok63hOPJiA0N
	0AVJMf/ZVk7w4gw==
X-Google-Smtp-Source: AGHT+IFHuWqBozXH71wulrFP//Y6OM4S5v5aSjrSOQKgs/LL1p2at57xIwfuaUeDkpt3vFS1Udqh+Q==
X-Received: by 2002:a17:907:3f1a:b0:ad8:8e56:3c5c with SMTP id a640c23a62f3a-adfad363d82mr1948037266b.11.1750335852861;
        Thu, 19 Jun 2025 05:24:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae000b02bd3sm504688066b.3.2025.06.19.05.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:24:12 -0700 (PDT)
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
Subject: [PATCH 02/10] crypto: sun8i-ce - remove boilerplate in sun8i_ce_hash_digest()
Date: Thu, 19 Jun 2025 15:23:08 +0300
Message-ID: <20250619122316.2587236-3-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
References: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_052414_710226_81C3A473 
X-CRM114-Status: GOOD (  11.61  )
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

Retrieve the dev pointer from tfm context to eliminate some boilerplate
code in sun8i_ce_hash_digest().

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index b26f5427c1e0..61e8d968fdcc 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -238,19 +238,15 @@ static bool sun8i_ce_hash_need_fallback(struct ahash_request *areq)
 int sun8i_ce_hash_digest(struct ahash_request *areq)
 {
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
-	struct ahash_alg *alg = __crypto_ahash_alg(tfm->base.__crt_alg);
+	struct sun8i_ce_hash_tfm_ctx *ctx = crypto_ahash_ctx(tfm);
 	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
-	struct sun8i_ce_alg_template *algt;
-	struct sun8i_ce_dev *ce;
+	struct sun8i_ce_dev *ce = ctx->ce;
 	struct crypto_engine *engine;
 	int e;
 
 	if (sun8i_ce_hash_need_fallback(areq))
 		return sun8i_ce_hash_digest_fb(areq);
 
-	algt = container_of(alg, struct sun8i_ce_alg_template, alg.hash.base);
-	ce = algt->ce;
-
 	e = sun8i_ce_get_engine_number(ce);
 	rctx->flow = e;
 	engine = ce->chanlist[e].engine;
-- 
2.49.0



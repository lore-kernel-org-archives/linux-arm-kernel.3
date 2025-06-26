Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010A8C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HrsFLSEEMdhGLUzZIYXTdJy0VycwWTY4NZmzeB9UZg=; b=q9zR8XmswOlF6hRegGQV1OoWZT
	4gS+Gy3Ct+ddmZSJFmuXnQgP5me+VjVlUC87K+Nc3gK9YSySu2OXm5QOep7v+25zwXFbLfkuovV4R
	mLF3DbY0V3rU7BdlzaJY5zNqexx1kjv3xPWNvOV8hZhCSkiDbdm1mXUWlgrmz8gmK+QVnSxAdGgul
	xNW2mRigVeN6UgbO5MxQDGcm6e5M506DlHpCxn/a7V7dpqDYtTr2NS53Ew7MKwNwoAlx0A9vNLcRK
	FghbjUG0hXzSZV5WuNO39bu22nf4DbDWW598NTG/whNWYcFvzlBe2ykxjV9EAP8+LmGY/f861JUQC
	aUvYe3vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkgy-0000000BNwk-1FVO;
	Thu, 26 Jun 2025 11:22:56 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjO5-0000000BDsL-2lqp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 09:59:22 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso1496359a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 02:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750931960; x=1751536760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HrsFLSEEMdhGLUzZIYXTdJy0VycwWTY4NZmzeB9UZg=;
        b=fHomsbn06V64X71+YnSpqZuRgZ9N2YglfocoJ1EXggoCW/dgUQWLo39cf6uF5L4JGm
         Hs2Utdq567Ns8VdwiLWpcOloq6WqtQp0Jtl0ZYlrMf5gP2CYcDwpPJNfc/M5mc2z5K5g
         0Ytj28+7ebYKOGKP7NLL1QIWOa5jhIilkSL4mFs91jvEl9s8dGZI2S8xb0Z/+M64EOut
         rdMsS4ibfApQig9Tt/xG08g8a+qe+xR5eQ/3cshxtQbwF+yOdFkqq40sPdE6lIyx9MdA
         wYueXX2XdlPWKmcBvRCQg05xiyfCCeQmfhk7sgscGN5aODOpeWw7XLIsW1y1Jtx1ery8
         fJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931960; x=1751536760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HrsFLSEEMdhGLUzZIYXTdJy0VycwWTY4NZmzeB9UZg=;
        b=du8JTN3PwV7G4L6ym+Xe/anY9fc6foU5BD5dVh7CexJBdOQ3RSaEcIXRXNQlKGBZmz
         uFr79jVAG2m1zXx8+EM7AJR6d0m2DlX/TUNJq4Op6N6DfWGqufN9rD0TRNZ/V4fySggV
         UTjYEu7tpt3RBRbLBIXR3gunFseo+ZX34xdhXqqE40VzdN2Bpdz3E66vpsueUGVYCguX
         m9LECbImahW6d5HpI5rFBTelERtLG8NEfclMPvL0Tje5nVY2phO4JBrH+zyFYaAy6nhm
         jPJSxkZi9V6EgkFFBiFk7IrWPGR1PnaAoi9D4xTlm9sDpNfL6TWXjUeK1WfoM94RGj1f
         edvA==
X-Forwarded-Encrypted: i=1; AJvYcCXCeCOI3TGVo56bkinVGitBY896RRquU9slKagPYTfRHABEYmG7jcDaoXOer1nTaEaBYXHnlQTaw2X2hYQrujYy@lists.infradead.org
X-Gm-Message-State: AOJu0YytiQXKLAQsnT/sXajDjYqFRDoJd3TYgUR4vMhIAAK0puqr0KFC
	0Gbm25PaS4RxbcWAZe2cYrV8E+x3SkfqSUDHC2hDSaKcqf3HbxBibgb9
X-Gm-Gg: ASbGnctCdOhNV9DPmsYRkHh4DfoA6odndzr8cZPqpPu6ocojbThWkOpNH5oLi3wBJpA
	+a5Iiz63cgJqs6MbTmfR6lm59nDa3Ev/DapmlVURH/FsmY63SY5qusF3mjPnpo6Df3F/ohth0hT
	GoNO3xnJxYbn2JzXPMLkAfKwaBQbSvKAx6Mo0Raqwh+sSYRI/qusCiQXvUIrU+tHHflHN6VFvDa
	EGhqRjIKRAdFB6ZTEjh2MbTEBWaoPkIyubCFjyFxUgYMUsn1pBVKvd0AXcGTxw17zA4VkTt70oI
	uFiaLH/Q4h/9S+UVuLV+ZHu8xsc6Qj1B4J21S/pOVU7AzC9QGxh8oj3Zuoz2SO2Y4BZkLKfyH+F
	SUUfuHvd/xGrvuVdF7nr+5lH4
X-Google-Smtp-Source: AGHT+IGcHkgMnqpZF93lLxs84Oee/gXcIKO2zDueULt6PM5LIPG4njAWAD+IiAyNDCajyksrQT6oWA==
X-Received: by 2002:a17:906:6ac1:b0:ae0:9fdf:25e8 with SMTP id a640c23a62f3a-ae0bee52de0mr552743566b.47.1750931959733;
        Thu, 26 Jun 2025 02:59:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae06aa5ff34sm1014106166b.40.2025.06.26.02.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:59:19 -0700 (PDT)
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
Subject: [PATCH v2 02/10] crypto: sun8i-ce - remove boilerplate in sun8i_ce_hash_digest()
Date: Thu, 26 Jun 2025 12:58:05 +0300
Message-ID: <20250626095813.83963-3-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_025921_698937_68CF4A92 
X-CRM114-Status: GOOD (  11.33  )
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



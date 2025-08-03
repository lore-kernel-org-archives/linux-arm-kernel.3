Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA4BC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 19:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ElWdGUyg9Q9uvasE/0knQrvGqeT+AHFO5zlC/AHADc=; b=V9oY844qNYbfvMAL9fqX5u+Xrb
	FjJUvUWebZcmZpbXDICEgf+4OkyQ54KywlaTcmJjMV+NGy4P2Uw0Ruzj3VkcLdon94/HcgMc/mp+R
	Pu3ULDktYQKFg3q6Khu0KHzcLiMrPW3YFHDHUIPtabkSaygRb9LJeXr1E9TUcIz2Ak/6dGJX+IeGN
	5Ol7vw860zu/Mn3S37pE1eKtzlpDWBVlDt4ejLRIq8zS54NT6QEwLQqOzAyYD/mvY0YYYTygnooy3
	kWeV9KPNuSBIj8b4c9vbV79eD2lXPKQuhEQHHN1R1U6wtZfYnAnjuYPMvnvJ/SLKA6OTRggXp6+qY
	3GOmLm4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uieEU-000000090YB-0K0P;
	Sun, 03 Aug 2025 19:18:58 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uie6r-00000008zWN-32bh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 19:11:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-458a84e2917so30096025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Aug 2025 12:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248264; x=1754853064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ElWdGUyg9Q9uvasE/0knQrvGqeT+AHFO5zlC/AHADc=;
        b=WOC5lH4hFAiUJkxBkEveSIX0ZrEMg/+2v+mIGhEBokvbM06Hx8ldM5xzYFGTHy0zF2
         omU2rBbFK2fBVGCmRDr+HL1aEdjh4EIMYYivq5FbW9zRzem6MSRQX9DESwqOjFCUk8xO
         vqLBLA51+54BNiUECn9Fgx9VsjD27JxhVK5dcCmGDEfWFyMpNvb+lFlud8qwDCOGPTHr
         9r0G9WiLEr5AG429ErnZ7RqogNSyUSGvz+BQVDMKiQUBzNvbMGHazXB4/KzXN0jrRgpu
         5QYgGWOtuK4SKsu0ke2B8T9ajZ6u0Y1T3KuQVvXLGM0x6mUPSScUSf11/88448E0/sWj
         UyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248264; x=1754853064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ElWdGUyg9Q9uvasE/0knQrvGqeT+AHFO5zlC/AHADc=;
        b=H3l8ryuSJmSyUFQt5QD9wzxYuBcgcWfPNFoAOW8ZN1A/FD88AWeltAYB+lu0JsZgW0
         xtLzswH3L+tQU+OBOTt7oCZpWoqRHvx9wfcZ60MlJM0xAKAFJCx2Y3nAHRyKxJTAgDi7
         2gR+0jjqWbvQhTODnE8kwO6H9vXGY000kYO6I1wD5SvOwzI5IldO211NaorS7Upu0NhP
         2J+yvINWOr+6JO7aIeoKiM3womfj3hOaOxIv9sMJahLRbXOArf593AlTEc7Tb6IXy2iH
         QzgHEW38c/ud9jERrk89wTylXfdUK/6DagdbwLGE+Jr8/l6kqmM+1eJ6/BXnI/4TiLmW
         tRVA==
X-Forwarded-Encrypted: i=1; AJvYcCWQRGEhTqgEW0/+dPDNjAdKwUtrWOdPMaqGX2ukDOm3OLRuz2WaYm7CVTnV8hJCLrnfpX3yah+lxE93DROW4cHh@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvy2JxOjnarfUn5pQ7SmHIldg+7FKtqhpyv6qhaNQlHt5Mjua3
	XFGCsmgvp6NVYhhLAOXF/Q0cIekVB3+R5lpd6TWpreTUa9bPfL5BIXLY
X-Gm-Gg: ASbGncv3HPrdfGKrPbYULDwJHzmQWOIRdZkTHcbWcvVyy2mL6q+O19mXrWKj4HYHyIg
	MvUi6F0GUqMvGvRaCLIdzynD6EZ8jtNhhuQVz9CjrfdS10cjfQcT4Gua/hJ9aqx66YbTJXhbVIY
	Is383hZ/MBXs4uC4Hjny/nrVO04MDfx2n/nZM4qH/47e4cXrJqO21P67Wvz4eX3Ad86zd7jF/0E
	jZs7a4xJnJjGb11eTLrCBTYERN0yeQd/XjXJMadhwi/8UHQ2L7U6lzj9FF7vgNQfYPMVx0BFC9o
	T416jvHJv8ETGMPtESN04MC/hKOCKmvy9kgzCBSUAqn8ugcVol5vHF3yV2D/tCMSfeMni+AEcAV
	MaDroI8GzYM6pd+i/NGevpp0+F2HHr8UFVg==
X-Google-Smtp-Source: AGHT+IEuwtHoQB0DUIyO/0Z1tXMmBf/alEdLn9qmJWqD0USge+nGe1p/Rv0Bwaf6WNGkHFKl9ruVMA==
X-Received: by 2002:a05:6000:310c:b0:3b7:93d3:f478 with SMTP id ffacd0b85a97d-3b8d94ce4a7mr4645712f8f.51.1754248264043;
        Sun, 03 Aug 2025 12:11:04 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:03 -0700 (PDT)
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
Subject: [PATCH v2 2/9] crypto: sun8i-ce - remove boilerplate in sun8i_ce_hash_digest()
Date: Sun,  3 Aug 2025 22:10:22 +0300
Message-ID: <20250803191029.3592987-3-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
References: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_121105_761041_CEDCEACE 
X-CRM114-Status: GOOD (  11.84  )
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
Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Reviewed-by: Corentin LABBE <clabbe.montjoie@gmail.com>
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
2.50.0



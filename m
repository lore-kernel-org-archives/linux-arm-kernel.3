Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75257CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzXOYoDcw0s4gQ4w74V4qvU2nwkX5U7En2+CKV1FmvU=; b=DgWmW+x1dKNfY8mWvr2dIcQyI8
	2G9fq4Q7ZjGG1tZBq6lvfWYXSmLpbZ0XchEZpK55eCvzGlTzF9HbHtvqyJJ3Br9TbdqswDcsTK/fS
	Y4tl8h1jxdt/thIcIqhXXltu0aYF92hUxomVUXkV6GlSudENwoVU55hOQs+nsAG2HwpvOWTxKj9+J
	Uga1GdtjQVtcwGWjgdSxeTLTE77gEPeTsx5k4d5aAa4le3Mh9lk/AVl2SWaK7h3q3qBiqephze0os
	PLMG6mGfIEhbbRuyv040SolVt1mir+xR9WMDvKVGjYrt92XfrVYDj8hfTbDTTOYIEzFZUcU3wzDZz
	uEVV4YTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYlx-00000002ALW-0CDZ;
	Tue, 02 Sep 2025 21:42:37 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQyQ-000000000wW-1NCm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:22:59 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45b84367affso28831665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 06:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819377; x=1757424177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzXOYoDcw0s4gQ4w74V4qvU2nwkX5U7En2+CKV1FmvU=;
        b=Ku8ahdqew9jxB0HT2ncXmiWxrJ0W75+phCUoDIyjunrmfs/n2uFIUsi37tdSKgV9cT
         uUfBiFlQE0Vt31AsJqjricUjKtqpePOMWWLeBi1wGoOdkL7t43a84b/Il1h8LvK/NlMr
         IwSnjRuykCYquPKLVM+jQQ0JFPQYpkS2/ymCWIxIECWBoYJxEgcg3QhbMWK8hemORqjh
         uiNSTe8K0C1ryU1yVwDfuIqUsgWOT54qGZvYjwmBREbqQZpSHsmBJ1WwwklQGNQ52jPo
         s3FQK56AnkIFMF8gS2QdN2tOL+RnyHWPd4Kq8+Ul5VuNUyVKnf1qJvxJiMVTq5+qIIaX
         /L7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819377; x=1757424177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzXOYoDcw0s4gQ4w74V4qvU2nwkX5U7En2+CKV1FmvU=;
        b=sJbeeU3g/vIjki9l+Zbt5GWsYfVskaHd675/n+qM2KN45CaafTSxl2a9RLf/29gsGf
         NqY5+2Rico217c6rl2Rb5XTcWtabyBOGYOIeTEuGajRTBz6HI/We4/PRlE0CIiKLuF07
         dry0xU+p9dekOYADL3hZIeJcv1xL8eOLKdJUoodp/zPBsPj0AqAhaa4QpBYds5XV3QT/
         pWs8AjqaE0rwDtKrj7OmPGYMoK161V60A1tXO7khrkXmg0rgWDzYXxeDq2AtE2mNByvn
         WksSGf0X/IayrtD0xU5mxX9WDKk8LmZDzHaxes2UOtCrmJXAgXucVpy3oulkVYcaVdeN
         Co6A==
X-Forwarded-Encrypted: i=1; AJvYcCX1xSIes6dxU4RvCVyVKhJbeweAgx/XV2szKL8AFPuozOWCohRd+59km77ImB1oero/7+WmB1cm5fvkmpRgEMk2@lists.infradead.org
X-Gm-Message-State: AOJu0YwpjgxRJ7+9Wl9bwWNuTOYIy44f2Kj7o7VLq2OeCRKUK6B5+edl
	7yTIKnFYjtcA13HBxs2Pqfb0U4WI0ugJTznysGlDfbGn4bR8iDbVSqAxBM9A+w==
X-Gm-Gg: ASbGncuk6xgo8B91QwywWNhDNdXILIxms0KqK8dS7QMZ9OTFUDhJWDqpm7xFrjuanN0
	sAawnO4ZVcGxCSM6TGHIR6MzoCGNCZZVG+oE62OkgrZqTF2uBZWfW4LRQDHqT2kosQ9+bnUNDtV
	juD6WQLevYhnt2kbYTFeN3IQ5+QzbSLO4sGcQmjpKn8FpWtnn0bIRw50Nsi8Qft+3ZF5lXUYtb6
	FURepebjjZzd5ICEYfeGxB6UE8FQa2EG7p1mripSKZnkJDQ4xaWCwFaS73Jy8tcTXNKUzfcgI3P
	U4zcKORXIsCuElHs3nzW0vZ8CeUdeOLIaSV2e8ATqUGoU+1tgX6PF0qZzOnxhYl6stfzRS2dUGT
	h8eA8+9G8vbFgV3tjacRa0WcQq46iCf7lRQ==
X-Google-Smtp-Source: AGHT+IFt+jAuwZmgoKT1RiQF+kj0FR8UU7YL3V14hPMpMmBPvbwYtZIzf4vHPonAarMjK9TcaNg3/A==
X-Received: by 2002:a05:600c:3b28:b0:459:d46a:ee3d with SMTP id 5b1f17b1804b1-45b872e711emr80758545e9.2.1756819376326;
        Tue, 02 Sep 2025 06:22:56 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:22:55 -0700 (PDT)
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
Subject: [PATCH v3 1/9] crypto: sun8i-ce - remove channel timeout field
Date: Tue,  2 Sep 2025 16:21:26 +0300
Message-ID: <20250902132134.3287515-2-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
References: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_062258_364649_63D29935 
X-CRM114-Status: GOOD (  15.98  )
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

Using the number of bytes in the request as DMA timeout is really
inconsistent, as large requests could possibly set a timeout of
hundreds of seconds.

Remove the per-channel timeout field and use a single, static DMA
timeout of 3 seconds for all requests.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Reviewed-by: Corentin LABBE <clabbe.montjoie@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 1 -
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c   | 5 ++---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c   | 2 --
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c   | 1 -
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c   | 1 -
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h        | 2 +-
 6 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 5663df49dd81..113a1100f2ae 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -276,7 +276,6 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 		goto theend_sgs;
 	}
 
-	chan->timeout = areq->cryptlen;
 	rctx->nr_sgs = ns;
 	rctx->nr_sgd = nd;
 	return 0;
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index 658f520cee0c..79ec172e5c99 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -210,11 +210,10 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 	mutex_unlock(&ce->mlock);
 
 	wait_for_completion_interruptible_timeout(&ce->chanlist[flow].complete,
-			msecs_to_jiffies(ce->chanlist[flow].timeout));
+			msecs_to_jiffies(CE_DMA_TIMEOUT_MS));
 
 	if (ce->chanlist[flow].status == 0) {
-		dev_err(ce->dev, "DMA timeout for %s (tm=%d) on flow %d\n", name,
-			ce->chanlist[flow].timeout, flow);
+		dev_err(ce->dev, "DMA timeout for %s on flow %d\n", name, flow);
 		err = -EFAULT;
 	}
 	/* No need to lock for this read, the channel is locked so
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 13bdfb8a2c62..b26f5427c1e0 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -446,8 +446,6 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	else
 		cet->t_dlen = cpu_to_le32(areq->nbytes / 4 + j);
 
-	chan->timeout = areq->nbytes;
-
 	err = sun8i_ce_run_task(ce, flow, crypto_ahash_alg_name(tfm));
 
 	dma_unmap_single(ce->dev, addr_pad, j * 4, DMA_TO_DEVICE);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c
index 762459867b6c..d0a1ac66738b 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c
@@ -137,7 +137,6 @@ int sun8i_ce_prng_generate(struct crypto_rng *tfm, const u8 *src,
 
 	cet->t_dst[0].addr = desc_addr_val_le32(ce, dma_dst);
 	cet->t_dst[0].len = cpu_to_le32(todo / 4);
-	ce->chanlist[flow].timeout = 2000;
 
 	err = sun8i_ce_run_task(ce, 3, "PRNG");
 	mutex_unlock(&ce->rnglock);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c
index e1e8bc15202e..244529bf0616 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c
@@ -79,7 +79,6 @@ static int sun8i_ce_trng_read(struct hwrng *rng, void *data, size_t max, bool wa
 
 	cet->t_dst[0].addr = desc_addr_val_le32(ce, dma_dst);
 	cet->t_dst[0].len = cpu_to_le32(todo / 4);
-	ce->chanlist[flow].timeout = todo;
 
 	err = sun8i_ce_run_task(ce, 3, "TRNG");
 	mutex_unlock(&ce->rnglock);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index 0f9a89067016..f12c32d1843f 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -106,6 +106,7 @@
 #define MAX_SG 8
 
 #define CE_MAX_CLOCKS 4
+#define CE_DMA_TIMEOUT_MS	3000
 
 #define MAXFLOW 4
 
@@ -196,7 +197,6 @@ struct sun8i_ce_flow {
 	struct completion complete;
 	int status;
 	dma_addr_t t_phy;
-	int timeout;
 	struct ce_task *tl;
 	void *backup_iv;
 	void *bounce_iv;
-- 
2.50.0



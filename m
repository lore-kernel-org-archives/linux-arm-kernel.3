Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637ADC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 19:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzXOYoDcw0s4gQ4w74V4qvU2nwkX5U7En2+CKV1FmvU=; b=r3Zh2+pYv8oRHYINqe4ze0L4Zx
	o09bbVs6X5DYkMlG9W+psja/RZNNXFXEP5B+nfQJIKyNNWqHgI33Sci9Zfu6JrI+94VrggxiD+fkG
	2U9z1oIYXG5P8cGbFoxBEYGYSJtvXL8W/tAuGV0kfP+cNS2yUyf/r6y1YbumbQMYVPKZYS61puuTa
	HILznaKBhxUzNguKsNbFk9irLT4oe0pHnvzAybf2v//lfZZwsSNyBVt4TMGXZ7bWRKFo8fRQ3gcny
	dwayGk+06ssRdt9B9l6S9XMeHbjVIsewIFwfJ335UoTGl7puKwfcZLHvANX3zi3kd5ApytJ4XfIaq
	39jWWJIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uieBx-000000090M7-0MzQ;
	Sun, 03 Aug 2025 19:16:21 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uie6q-00000008zVq-2FOs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 19:11:06 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3b783ea502eso2822782f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Aug 2025 12:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248263; x=1754853063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzXOYoDcw0s4gQ4w74V4qvU2nwkX5U7En2+CKV1FmvU=;
        b=fHZxyELwDENtgKPMsowcHooekJYjklCkWL2RZhVxXc2Hujeji279EhFt9XboXkQnvO
         oHFwdjZKUOFnJ/jVzy/DeGp3EHJLd+3w+qCEy4VFCTUh9HuWxRbP/IH1Y9o5j4CD+Qgf
         rsu1y6DjQpuPfVk3lz+6gzIZp97yfh6+a5/pOo8tKai9eMMN6rSlsMP+9L1iS8UMt0O/
         jwBqpZyS/KjIgwr0GWemwnM2B3Uh1KiJ5cOfTJ4Vov03gVdy57vHcdWcheqnwuCogmaZ
         8bxWZ+LwMDR2Mxl+wejHEiQqZEj+WYnBmJBWjP7yCSJBDNpe2laUOL61yO5Ow45MqzKz
         X1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248263; x=1754853063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzXOYoDcw0s4gQ4w74V4qvU2nwkX5U7En2+CKV1FmvU=;
        b=c6k1cS0k/tvgVworZ7igv1r5XWelH/SeTfg+vGlCbeFHxj0/rIGuAwJYwrqyz5KNP5
         sCBLFsVBp/2YXeJmvqXH2S93oy3fAIyV0Yk+nuB3K8L9VrbTYndtYiry84ZT685W9NPg
         5dMafJqfLxiRhRcNGXObPluBiUkQm1jnk6MpSK+0c63pngimeLfKq4YDl3w+QEmOU+pe
         8qhLcfoKkR5rwQZ/o3oz2LRX12i4a991IL+Wq8pfMRmg2MYUgtrb4MM4zRMAY/x0/fqq
         9Y5seiF89d13t35f/HkxUzVW7y2KAjk64yFyfnHwkQO4/M/qKQLeDW1umiANXEVladc7
         5edw==
X-Forwarded-Encrypted: i=1; AJvYcCUjqkVSo5hbI4rvkG1hlM/WZD90Oh4s0WKYI449LgVYgXMIE2eIlz40l/sSqKz93LekDoexU+L3RZ4s5U8W9ISR@lists.infradead.org
X-Gm-Message-State: AOJu0YyZn4x/ehNf2OH6ebnXog5ZRAKieEKIJyJZWKte609QZR5m2j6z
	NZiEIJBwQdeFCSYhfejb0g/Iqj2vtrFtveIXClpFv4CnXLawND6Whq4edltsEQ==
X-Gm-Gg: ASbGncusy1dIoJk1j+C2Ezv09+fME44yimlO4kBWYSkuK3mTdqXnA6r15RS4ygXVERR
	ouF10W/8XkUCgBignfI02pxChoa9XF86WRb8W+WmxNg4mrEVFogPU4VmKnavgWWKPO2Rkbed1e6
	e60NIssl3n+syJ85lfRovpAnA7i9jp30nHhxFbmFp9S/sdVNVOmMCRil862FcMX0jIY5le7Tytz
	7NfTCKmrWNaAarGjPWuqtzUWvq6AmPtNDceiOgKwg2USF0M9VLE+uqqcvJSajrNNaAGtq7p0Nzy
	xzgwOYTO0zsLjbEbhNrLWzFx4ic0YTGeasUttQeHstQSXtRomVG8ekR8PxaRRIEShGAVRvHLC8B
	2fxiwns+fR+LW9UdDNxIJRlxYaf8QocQayBmFqbLyw5Of
X-Google-Smtp-Source: AGHT+IG9wEYs4+lgjHCzhOPCxH3cmlxe163baafRUi6P07GZhQb6rgYttNhQt1qtCDkr7AuXCuEO3g==
X-Received: by 2002:a05:6000:420d:b0:3a4:f7dd:6fad with SMTP id ffacd0b85a97d-3b8d959d43cmr5579015f8f.14.1754248262831;
        Sun, 03 Aug 2025 12:11:02 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:02 -0700 (PDT)
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
Subject: [PATCH v2 1/9] crypto: sun8i-ce - remove channel timeout field
Date: Sun,  3 Aug 2025 22:10:21 +0300
Message-ID: <20250803191029.3592987-2-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
References: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_121104_567754_BA52CF68 
X-CRM114-Status: GOOD (  15.77  )
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



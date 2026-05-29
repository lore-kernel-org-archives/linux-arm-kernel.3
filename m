Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F48CCD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 09:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y8R0NpUKrRUzKTBjBaspaFed3TgMMb8WXLvF6QWVgQA=; b=qW8cxpVmuPag0kLN2PvCrZPyNb
	N6yZL5D1iGMSR6MUHpldU92Ftql0h0KiLlDDFUJYeot8JJTJpF27yfr9uzX3PT8LaSM/oxW0LACwy
	jCfNQ48iitck7r3GIKdR1XJ2NOtyKNVOQAfLTGwAXKSiMSyyqE897X6bM3nQZXhhZzLDr1UQQW2bk
	bA7f9TJH0sxRBVamFzvncOLCRVGbQDl5lvmv/mkfkTcNQ1cpC4kiLFbHvCWA2dismwnNDSvdWwuHA
	jqY5xrVc5obYiHHGVsx6nif7/X1GNzD7yFmbPEk9MSSUU3VBjf6ICfjY8XTOmdreR5qSbyyrX8s9o
	gT7v40Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStko-000000075Nv-0cAt;
	Fri, 29 May 2026 09:43:46 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStkl-000000075N5-1x43
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 09:43:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49083c865f7so1885345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 02:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780047821; x=1780652621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8R0NpUKrRUzKTBjBaspaFed3TgMMb8WXLvF6QWVgQA=;
        b=If9SpaBMnUtM0QyYzIWzOoTtfENpA+lLAjT+BoTNMCkkTu73PcibstmCh5jMTf0EP9
         +TbrqvcWWTyb9gK4bt4b+JrrCr7KYqnCb0nIXFX2bRjT0VZWnvMZGd7NCK0qUxzoQUD4
         vffFCnRcoujFbww1G9FU6L/qqEwkVTBAUnqn1iHAqEv7MCx+nW337zGZCcMGgExMdRMm
         EX3oOKlxrm+QWbd1MUSi0lELhiXgvGBNLopimAscplDKhA4VrQUCt463cmiEouQvt5Kz
         RHnjFDmypyYJEs1l3GbfRqfl3ml4HqfZo6hFJCnMNLMXyXq60D1z9ZOtAzPg17riE7Ki
         CuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780047821; x=1780652621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8R0NpUKrRUzKTBjBaspaFed3TgMMb8WXLvF6QWVgQA=;
        b=UHBb7H29m4tCqyF+Msz/BLt2dGgUvnKueqY15BOr3KKHRm5aAJlt6G9Olvbre9XNJr
         KFT4mW+NGkYWfOt70OzFG643hm8yCPCN7HeaSm3IqbMOhrYx763M+5X/fP1gUygTaLF/
         m6FBwf5/zR8oHSUde7rHh1xkrj8s3kd+rqAboupm9PNazlUrjcAxWKHORQswJC64y25n
         rlimClxXS4PXDxJp3Zv4iO84UMYMxlpa5THkHsZui04T01+RWY4pTDj2YFPK3U8SDGQ1
         VyM0tF3+ud+/ByFCmZkPgwqpxpPZFUREgX4ZUQQDuYDnwyzQsDk/01Zax2/lv0Q3USz/
         +deQ==
X-Forwarded-Encrypted: i=1; AFNElJ+FFaiemxkQL1n/0zX4j/W9/A2HvPeLZ5NAW7KhM8sb/ohfADHb8ZqAMByaNmTJvMmGAHR7u7QU8RHF59CwsnK5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7uvh+drr8QP32sNogCxCbTwZk85oiPEzCOgUnFWlD1J/2TyoH
	PTFP1Du17PjksOppkKsWCQK7uM3Ac2iUMe8iLYkw3wd1tGGL5gcox9Sv
X-Gm-Gg: Acq92OHhujPEaKmcChFK7ig/3vhxHFhql5k9zWAxejQsff07JOk0d8r3bqKRbC4IifZ
	9+qGaZroGnXDi8K5VuFHfuvQq3fNuYCVwi0HjkkCyNgvFMXefHGarKJTykRBG2VnQqkAm8xMYMH
	VelbOi6nAcRC3FWEDC5IdEJQhpx0+9HjJCzHI2QWNnkn9jf074KFgCht2ylp5p8UbQWPJa7S6XY
	RwQw6nrkw1qIub3tmejoJNu+yj71XZrGPXYX028xhQ7Jz5EwlFoi/o1KbvyMZRm4SbZEiFcVuKz
	BC5Gfi1XFXBhPiZmXFZwDaWzlHHpbLWXu1YrZIm0+qxoEgLBdvmQeOGTccxnxWqsWYdTBCxJISx
	2LMlQNMVlVp1BEHzc9fgVLvdNEaeQFGdppMgqjOMvEZYsHyF0i608fPDI8raERTWRukN54fKyXi
	JAX3PzmqSFiOpVUZ3BCVQHcirXjPm0K8OOUMJoHgZiFqE92e99v6WHGddmy6cAPOk29J/R/e5dT
	A==
X-Received: by 2002:a05:600c:4686:b0:485:f1d6:2b1d with SMTP id 5b1f17b1804b1-4909c03bd6fmr17670255e9.0.1780047821322;
        Fri, 29 May 2026 02:43:41 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c07ee36sm14116865e9.0.2026.05.29.02.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 02:43:40 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	ardb@kernel.org,
	krzk+dt@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH 1/1] crypto: atmel-sha204a - fix heap info leak on I2C transfer failure
Date: Fri, 29 May 2026 09:43:36 +0000
Message-Id: <20260529094336.33809-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_024343_520286_86F73A1C 
X-CRM114-Status: GOOD (  14.80  )
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

When a non-blocking read operation is requested, the driver dynamically
allocates memory to track asynchronous transfer status. If the underlying
I2C transmission fails, atmel_sha204a_rng_done() logs a rate-limited
warning but incorrectly proceeds to cache the pointer to this uninitialized
buffer inside the rng->priv data field anyway.

On subsequent execution passes, atmel_sha204a_rng_read_nonblocking()
detects the stale rng->priv value, skips executing a hardware data read,
and copies up to 32 bytes of uninitialized kernel heap data from this
garbage memory pool straight back into the system's hwrng data stream.

Fix this information disclosure vector by immediately releasing the
allocated asynchronous work data buffer and explicitly clearing the
tracking pointer context whenever an I2C transaction returns a non-zero
error status.

Additionally, duplicate the tfm counter decrement within the new error
path to ensure the reference counter is properly released before executing
the early return, maintaining the driver's availability for subsequent
requests.

Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-sha204a.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 4c9af737b33a..20cd915ea8a3 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -31,10 +31,15 @@ static void atmel_sha204a_rng_done(struct atmel_i2c_work_data *work_data,
 	struct atmel_i2c_client_priv *i2c_priv = work_data->ctx;
 	struct hwrng *rng = areq;
 
-	if (status)
+	if (status) {
 		dev_warn_ratelimited(&i2c_priv->client->dev,
 				     "i2c transaction failed (%d)\n",
 				     status);
+		kfree(work_data);
+		rng->priv = 0;
+		atomic_dec(&i2c_priv->tfm_count);
+		return;
+	}
 
 	rng->priv = (unsigned long)work_data;
 	atomic_dec(&i2c_priv->tfm_count);

base-commit: 5624ea54f3ba5c83d2e5503411a31a8be0278c1e
-- 
2.53.0



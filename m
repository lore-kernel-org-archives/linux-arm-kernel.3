Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA48FA1FFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 21:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHDnqtZPzLje7acSFaV39CbG4kFW6b0D4B/rafiqA78=; b=jwGn9ssWCvsOhkKDaBlrjzfOHC
	BVaVtdTH5Evszw03lPmXc4z6C/rDiumYX/LUBQPD1WNPgy0Ema5dT4xVnTON5VogT7IIihp//h3ub
	Ug8N3yLWYnT9vjEiHz93dOx2YKdjceyCK17vwpi5BM2V/w3LKj9b+numQG0Ac/JWSH1PFbcjZYFM+
	rLipGOZULWfgbXK0ILMsZxk/pRUVGK8s2ALVSRrXrdVx30sOe3tsj0Dt22rCXv7hyZO3O8XHdZVqZ
	8J0Qsb0Y8rn4qfNjRPLxLXp88m2UQ8S6y8uBXivYD6FPvkf3Pwh7gK8VQ2xwSXBvpDOzU/pBJaA8h
	Dd03aemw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFepb-0000000AkKp-1a6h;
	Wed, 22 Apr 2026 21:09:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFepV-0000000AkIE-12mq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 21:09:54 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488a8f97f6bso10996725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 14:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776892192; x=1777496992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHDnqtZPzLje7acSFaV39CbG4kFW6b0D4B/rafiqA78=;
        b=OrTHMXsuoLlme26axAp6tvSt32FntdGet6RzFaYJoLsMEUWgoAJqECjI5NwMT6YPNd
         SJQ3jtalR9/PkKheOOfKuDMEiGBKnCuu862tT+G/qmNrZFrhr46X4H3HK4KsEfTDwNhl
         g2vt54asXvToWZ8ESDUQtnB+XupHpNFe8bKxAQ5SVxxAX2WTyuT2WjBcDvkbHW9eEAUA
         Q/kJCIC3ARc0x+qN3pEJtbK+IB6iUepPgIXQx7efLZ93x38ZILtdPU5YPpGaRYYCBfqA
         KkKJvnfPaPkNGNmRentpkjNan1TBpUPwe+z+SnV3tTE/IfRZQzAGmjyrSLtAFFVWgX+s
         tVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776892192; x=1777496992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qHDnqtZPzLje7acSFaV39CbG4kFW6b0D4B/rafiqA78=;
        b=HHrEYmefGNiD03NCyKbS0tgeNNATikxPXl66IrTVTErswNyj7u1u9oJTypUod0YIi5
         UZvGTiiKj0iHRqFxqBFeHQtqQ6u/hUm4WxA9iVT9IGMYnALC0IEZqPhSIqjhpFxKw5io
         nGa6AbYNy7iS15VXG3fgLu9zOBxBYKjFfh5gUFRLXd1/nRZabuSHG7Y3pFGcgwcBYMws
         YY1voR4U3/eWZ8PHKZGq12HzptvrNHBxSF2O/uXzaq79l8mcHiHQpckwYUOFnqkwts/T
         49zL1K9QYMoksNi0I7S4Qbtloi9VmlkPiHO99YLlq9n5/KJrGfMyMF7r75IvLtCcmW6V
         qcRg==
X-Forwarded-Encrypted: i=1; AFNElJ+l/vxE+M+RQ+KcFInBNRGb2nF7Pu11Zj6Ku/Z8NsOU252G9ftMMZwafa1pCLQC7eiYoM4OGKBdtX/pS84dAjUi@lists.infradead.org
X-Gm-Message-State: AOJu0YwDj2GZ7+jGY1YnnotznV0LSLjvOWpUWnbd2YslDNxC1wIeQPLu
	ajM8k3GCeVrIZDYdXJxe6I+ebrAHjsi3yuqVuv5Proqu//hxVnW5pTA2
X-Gm-Gg: AeBDiesW+knYxFoXuS7yW2sZG99kjyrtfs4aQFis/ltc4C7BtOVupHspjQMDhBlV09Y
	Zkuye4P4d0Dd/W8NwHHGCRxenyUnUAN0sMIxZ+J+Xn2rssfZkjoG0EBScHqtbM2JYi0gRcAKEcl
	+CQlIwcYsS+0HzeW3W8yqOjjmf1H2cgP0W8e7wJomQVSJ9lKcySM+0wm8XKFwBwbT8GEeVXsc6I
	WhgYBO38LmZRBO3HnGN8roiigWlGGVVGwHyzf04KLwOitXHCUGb+JjK2eNGGSVQbVVERb2RDm+t
	oy9Tr3Qw0UVkMmttKbL0Iojz0j55pZeCIxp43etXpRhuWWpxytjQcniNNif+uIriuLQHLiVcAuy
	kjGf4bzjYSrVHqc2OkjNK9LcMEBuNZvgCEkwEmJ4gAB0nS8Aq1VIscalb4r87Z7crxq9Abg2HSF
	pElYK4an+dCVmxYRCi2df4trujrhQ27bgSPckMYNL/m1izCRKL3U2TRNFxIRHD5VY3xf2C9zpah
	Wv1rDMZgSoA
X-Received: by 2002:a05:600c:4ecb:b0:485:358b:e7ee with SMTP id 5b1f17b1804b1-488fb6e1addmr189465975e9.0.1776892191490;
        Wed, 22 Apr 2026 14:09:51 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a4b329542sm352469085e9.3.2026.04.22.14.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 14:09:51 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: herbert@gondor.apana.org.au,
	thorsten.blum@linux.dev,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	ardb@kernel.org,
	linusw@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v3 3/3] crypto: atmel-sha204a - fix non-blocking read logic
Date: Wed, 22 Apr 2026 21:09:36 +0000
Message-Id: <20260422210936.20095-4-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260422210936.20095-1-l.rubusch@gmail.com>
References: <20260422210936.20095-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_140953_304640_C1BBDE7F 
X-CRM114-Status: GOOD (  16.87  )
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

The non-blocking path was (also) failing to provide valid entropy
due to improper buffer management and a lack of hardware execution
time.

Ensure cmd.msecs (30ms) and cmd.rxsize (35ms) are initialized before
enqueuing the background work. Fix the data offset to skip the
1-byte hardware count header when copying bits to the caller. Correctly
return 0 (busy) to the hwrng core while hardware execution is in
progress, preventing zero-filled buffers, which was the situation
before.

With this fix applied, tests will look similar to this:
$ socat -u OPEN:/dev/hwrng,nonblock - | head -c 32 | hexdump -C
00000000  23 cc 42 3c 90 b1 38 fc  54 37 35 4b 09 c5 e1 0d  |#.B<..8.T75K....|
2026/03/23 14:30:18 socat[858] E read(5, 0x55be363000, 8192): Resource temporarily unavailable
00000010  73 3b af d9 02 70 76 bd  2d 59 4b 12 01 ac ae 2b  |s;...pv.-YK....+|
00000020

Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-sha204a.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index f7dc00d0f4cd..04cbf80c1411 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -33,7 +33,6 @@ static void atmel_sha204a_rng_done(struct atmel_i2c_work_data *work_data,
 				     "i2c transaction failed (%d)\n",
 				     status);
 		kfree(work_data);
-		rng->priv = 0;
 		atomic_dec(&i2c_priv->tfm_count);
 		return;
 	}
@@ -49,20 +48,19 @@ static int atmel_sha204a_rng_read_nonblocking(struct hwrng *rng, void *data,
 
 	i2c_priv = container_of(rng, struct atmel_i2c_client_priv, hwrng);
 
-	/* Verify if data available from last run */
 	if (rng->priv) {
 		work_data = (struct atmel_i2c_work_data *)rng->priv;
-		max = min(sizeof(work_data->cmd.data), max);
-		memcpy(data, &work_data->cmd.data, max);
+		max = min_t(size_t, ATMEL_RNG_BLOCK_SIZE, max);
+		memcpy(data, &work_data->cmd.data[1], max);
 
-		/* Now, free memory */
+		/* Free memory and clear the in-flight flag */
 		kfree(work_data);
 		rng->priv = 0;
 		atomic_dec(&i2c_priv->tfm_count);
 		return max;
 	}
 
-	/* When a request is still in-flight but not processed */
+	/* If a request is still in-flight, return 0 (busy) */
 	if (atomic_read(&i2c_priv->tfm_count) > 0)
 		return 0;
 
@@ -76,8 +74,14 @@ static int atmel_sha204a_rng_read_nonblocking(struct hwrng *rng, void *data,
 	work_data->client = i2c_priv->client;
 
 	atmel_i2c_init_random_cmd(&work_data->cmd);
+
+	/* Set the execution time for the RNG command (from datasheet) */
+	work_data->cmd.msecs = ATMEL_RNG_EXEC_TIME;
+	work_data->cmd.rxsize = RANDOM_RSP_SIZE;
+
 	atmel_i2c_enqueue(work_data, atmel_sha204a_rng_done, rng);
 
+	/* Return 0 to indicate 'busy', data will be ready on next call */
 	return 0;
 }
 
-- 
2.53.0



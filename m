Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5875FFF60E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlXweF85hjs0Cz7hgZ4Sc8jEj+2x0ePWSuvmjZUgVoc=; b=a93jyRtOHKZQwLCcy7lRzvFIAg
	tuLprTJDCx0PIDobNDbjv8s7vVAZ3jB+kaky3fYrYRa3adIP/N4fzJfAZdRPeNSiMFSPA5uxkycAL
	R4PpkotTGy8b67LbBeB6TqzP/r2+c0v0kbClWBJ80x4t1jqHzki1CoZP5bWrjgJsluyOIYSecFL4h
	D5pPftYkZvvxMbyEolk3FgDRIcJ7ZOfX7b0tpeDPWFaxMJSkdoWibuEpKGvJMuz3i3+kti89Zues6
	Om2GusHLTfWZuuosF2KkWfiUpMhMv2zai0255JEm/iRsJtzzNmLcFC/EJkRWvHS+0hksIBijM6ZO2
	KrAslUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ULh-0000000CZhd-0zdQ;
	Tue, 31 Mar 2026 08:21:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ULf-0000000CZgL-2Fdp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 08:21:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4853a5ffc05so11516655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 01:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774945278; x=1775550078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlXweF85hjs0Cz7hgZ4Sc8jEj+2x0ePWSuvmjZUgVoc=;
        b=qtejychRTDf+jAiE+ncCpu9Ufyg1W/pRVurG8IPHHZfTOYtxdepvDU49pkSRkIsSRA
         vMjm0fPJIKdlhrHWDuO3T+1fvtTo23dfRM9gPwYQZ6PMcHOGzxr+xSgcoBjKHtNNz82C
         Zqz9vtBWkR1Vk6ARJkMvOrGLAzawxl/DcxHtUIesUysW3vAJsEbK2auvq9hLxRAflGva
         7s3ya4Whj/zBXcRJEEqdgt4fOK/82WPtoEpn3MUhdQHYDI6ywBCRY3AQGIyF8LGQnLOI
         tq7ynoBlRM7mqco3P4pgxWcH6xCpI0yTRqE3KdgMWYR9XEuk6mEeyrol1u9cqdhuAtJG
         8pYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945278; x=1775550078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZlXweF85hjs0Cz7hgZ4Sc8jEj+2x0ePWSuvmjZUgVoc=;
        b=PfCdgTMcNe49+tcOaTJFKFEorVGkr2FIOz+hhUKmJvlJoL5MBKcPdeRx9wcngQF6dJ
         sh1qu36H17IkEXv3TKsmI8DcwwjTDhLrngJfuBBO7BdaGnkAVf4O2vOTBsbVX0IEeo97
         B5cqUluc512NvEGit73pZOR6W/h2e9+boWtcXXh/iYTCpeEkaq9/7+C0Pf50mbJZoTYZ
         eIjzt8AiqTCjuynhLtTlCOB3/GzA3Q8w1Sk4ER3NM8t/fcsr+DnVQCROo+YWdk7IlHUe
         dhtsQrugxfEGvqh/g1C+F1ieNHwS9ZNxWXPfVESa7glkmN3Vc1xg3ECqGwL6anl4nosB
         pc1w==
X-Forwarded-Encrypted: i=1; AJvYcCVbQVnpMTkS1hAG7gLNYmnLYGqXy8c3eRZJZX5VcxGm4oBBUvhewhwlWL4gEvdpHlOj4TLrWkbvuvG4b5eMyPoe@lists.infradead.org
X-Gm-Message-State: AOJu0YzGKp3YfDQjgCgkpAGv9d9+uDpK1FEMMU2pmRVQr6l1L1PHt10Y
	W2cft8FhrrfrtuZ5pgKT9IA8ToeGjT67XsM3CXYQ255s6epjDkMiSjjL
X-Gm-Gg: ATEYQzxpKYfHtk+zLt2o6K2SOsdhOBwg71uffB01Wi3fUbMB1auFTh15/pqNdXKKQMq
	FP6H/uDauRN+HaARIyKqqwkyLv9HLwBPeCdrsirgIYdrObUa6aUB6COOiM9uuAXB+5qGW6BoZf1
	VyhlYKIAHBWJWGb+c16F2F7kE8HRJCBdLVv3+43lrmgmQnsuiV7CyL0feB3wSI5z8SuOI2eXlyk
	bo/GJn1giKD3CWTo3xuKIQ0dJE8TG4FDiTJHjoMBnrOE8eRikXYANrJN9YwNfflRTyB+b8xwwx+
	IJzsVvzeHo4IkQohQxRSGhDLk4rURPxTnisxaNuNjE7q1o/jCY7IK2LZx28YWii1GLL47RthiK/
	CgWicrsoYt0N0ag7tXYnYvQVqEoluOtILfBVfFsZ1umrrGRrCCuWXIK6N5kuUgj8QwgWZRG/vJ+
	n1az58bAZAHgx//xscWFdthR6S1esnIP9xIQH6ZwCSfMNSEYZLXx6Bfkt4BCplNcA=
X-Received: by 2002:a05:600c:1f8d:b0:47a:94fc:d063 with SMTP id 5b1f17b1804b1-48727d6fc1cmr150113965e9.1.1774945277374;
        Tue, 31 Mar 2026 01:21:17 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887ad8d28bsm14542485e9.10.2026.03.31.01.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 01:21:17 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: herbert@gondor.apana.org.au,
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
Subject: [PATCH v2 1/3] crypto: atmel-sha204a - fix memory leak at non-blocking RNG work_data
Date: Tue, 31 Mar 2026 08:21:03 +0000
Message-Id: <20260331082105.697468-2-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260331082105.697468-1-l.rubusch@gmail.com>
References: <20260331082105.697468-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_012119_611208_E02A1BE8 
X-CRM114-Status: GOOD (  17.58  )
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

The driver allocated memory for work_data in the non-blocking read
path but never free'd it again. After first read-out the memory pointer
seemed to be recycled and never was allocated again, due to some errors
in the logic, so that the leak was not growing.

Add kfree(work_data) in the completion callback on error. then add
kfree(work_data) after the data is consumed in the subsequent read
call. Finally ensure atomic_dec() is called only after the data has
been consumed or an error occurred to prevent race conditions.

Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-sha204a.c | 44 +++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 98d1023007e3..1baf4750d311 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -24,15 +24,20 @@ static void atmel_sha204a_rng_done(struct atmel_i2c_work_data *work_data,
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
-	atomic_dec(&i2c_priv->tfm_count);
 }
 
+
 static int atmel_sha204a_rng_read_nonblocking(struct hwrng *rng, void *data,
 					      size_t max)
 {
@@ -41,31 +46,36 @@ static int atmel_sha204a_rng_read_nonblocking(struct hwrng *rng, void *data,
 
 	i2c_priv = container_of(rng, struct atmel_i2c_client_priv, hwrng);
 
-	/* keep maximum 1 asynchronous read in flight at any time */
-	if (!atomic_add_unless(&i2c_priv->tfm_count, 1, 1))
-		return 0;
-
+	/* Verify if data available from last run */
 	if (rng->priv) {
 		work_data = (struct atmel_i2c_work_data *)rng->priv;
 		max = min(sizeof(work_data->cmd.data), max);
 		memcpy(data, &work_data->cmd.data, max);
-		rng->priv = 0;
-	} else {
-		work_data = kmalloc_obj(*work_data, GFP_ATOMIC);
-		if (!work_data) {
-			atomic_dec(&i2c_priv->tfm_count);
-			return -ENOMEM;
-		}
-		work_data->ctx = i2c_priv;
-		work_data->client = i2c_priv->client;
 
-		max = 0;
+		/* Now, free memory */
+		kfree(work_data);
+		rng->priv = 0;
+		atomic_dec(&i2c_priv->tfm_count);
+		return max;
 	}
 
+	/* When a request is still in-flight but not processed */
+	if (atomic_read(&i2c_priv->tfm_count) > 0)
+		return 0;
+
+	/* Start a new request */
+	work_data = kmalloc_obj(*work_data, GFP_ATOMIC);
+	if (!work_data)
+		return -ENOMEM;
+
+	atomic_inc(&i2c_priv->tfm_count);
+	work_data->ctx = i2c_priv;
+	work_data->client = i2c_priv->client;
+
 	atmel_i2c_init_random_cmd(&work_data->cmd);
 	atmel_i2c_enqueue(work_data, atmel_sha204a_rng_done, rng);
 
-	return max;
+	return 0;
 }
 
 static int atmel_sha204a_rng_read(struct hwrng *rng, void *data, size_t max,
-- 
2.39.5



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B517FF4613D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 21:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JYhEh1fUyIpN2Nz8LjN/J6gClgKVHGYq375zHFqaMk=; b=abznLqR475QzrtQ+Ur/5GR7Rg/
	4CaZXmcESNaanzmf4uGgPznkQcotReh0fljU7gJdYxXk65TjofbhoUhxWj1eXOcIW2JkEKphhrFzh
	6MTzE/5CCTytLD0dp4CmUBBN4V2IKvShCYlhrE1V8+RdcNJK2B+QtLwb2n3S6w7wRPJpD4abI9vUU
	uuP61MVk6w06N6iv4pp400C2rBw0/XtR4dvvSTizQS1zK90KNoCpCu2lOxVe1orrAjT1C3Q97+aTI
	4GkvaobxeL1w/cTQzY2KuVQgkICkPBBRV1tKzFTbpgqw6luFXDakHS8F48RPT/iFoZsGYKnCx8IEg
	MUJQngSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4mor-000000000sN-1wg6;
	Mon, 23 Mar 2026 21:28:17 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4moj-000000000qO-398K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 21:28:10 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-486fc49c5c0so5631705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 14:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774301288; x=1774906088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JYhEh1fUyIpN2Nz8LjN/J6gClgKVHGYq375zHFqaMk=;
        b=ctQL5ENF63n6G2iCJosJkdG/g4YSaOZpn3t2r8t1OYehT50RjRtxJs3R5zCFgbihvE
         bw92sBlHvPNbkjv3CcmQ8HJBsiXsA7YCFasSW0vBnrwA+RMOtpfPzyu5amGc2VBO9L8/
         bRPYBQxQYtvv7WzJyj3K5ofuRM7d9CSg26IVQqdomwQ4RpBRWB4k7nDSIVBnYohkTXIh
         mC7TbBjCc4n6y8XBEYR8DxUd4CHGU4aSwMf9IXSZQmBClW9krnK93/YyCyfmMQce8iLj
         M/WRFLV4KbLBZ/9SKeyQHHzOrpsOU3bUFMZjc46eRNw4qjQbe3jRnErN8ZriGwTT4spR
         1Fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774301288; x=1774906088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0JYhEh1fUyIpN2Nz8LjN/J6gClgKVHGYq375zHFqaMk=;
        b=KBEHj/ua1y6IInZonh7IjVD8UrDjGQYGN+nV+mCjPILwlgTTn6E/GXreSEJyLVsfQg
         sQnMR+L5VPXmxBl0Nds/kyJ0/HALR0TTYpq19OnCjCE5DdTwZGTwiIikif3hK6xeqYBg
         X1SSuUMJaeDogajtBvnmkdsoyqeyx765oZxhg9wHybagJcxTeBfFU1MGppWHPbRpUMCZ
         DuIgKf2E8kpH9YlRPOlwsF7H0z8uUEHv/FhqmCl6HhB8E0dcC+ESwI550PwPzk/mLSjD
         /MOwzEd7Fw/OJH8crFjH/R1ANLUcPh8gGhy0yHWu3wS/vxGdtXtLVeZU2W8Vp0ppi8eT
         ZCqA==
X-Forwarded-Encrypted: i=1; AJvYcCXrMF5dKOW4o+bTigu94gSULN2PRP2UhJIqwwflwI8+04MnSrYpjyBJ/ygzqA5Eh/PVYDU6CnjV/zKUZuoQn0Tw@lists.infradead.org
X-Gm-Message-State: AOJu0YwtKIRESgwGJxyVC6tUtKG4zVXpeTrYDsy2qZxb8BIStFh+5u95
	JmF4XNDOn0gPhqFMTU5NGdt1pA+8TDblvTKZ6CrClBRQQpR5P5zArq42
X-Gm-Gg: ATEYQzyU/2PJS5v32G7LiZ/aPdPAMRU/X3Rckztqnq1lRFdvemzRQ9Z02EujPI60lo3
	rVnAtrs99+LiXUKEnvsSz2yuGWB9EIW/nsP6FpUD5kPYo+vJkv6Yev8r4uaCF+/LANBxyYznlPv
	dG5OqjKjx3BfBQRLc/mqo9EjSD9ZrbT6TqMevZ99MO/L0j57HeqpxQP45ScngpOFAgqvSc035G5
	G5PTy+6wpDzu8PnFysmjfltkRoXyvCgJahY+YGqNhDd5yruIVcD9heAPFgQL1ypsGRlymu01UNN
	y1QqF5JKWfyBw5NqXwl+gwx2j7gAj8W+IBfcaQG+YVk05PDSfmx0f1J8JHrIOs0ADCPshW2I+nm
	uS1LJJgN9jW91rtgwn40k9GAhZ52WD7d+xBWNITuUAJ26OpE+ZcZCSvviXnpN3U3ZupHUbTjlqb
	WDG8OVy2Oc80QeSRj5Hl4FS15eMPigO15G+m4xrWj07QEoJUU09Osb8Hj/oQMp6p8=
X-Received: by 2002:a05:6000:4007:b0:43b:4e32:c2a6 with SMTP id ffacd0b85a97d-43b63fdcc61mr10787942f8f.0.1774301287519;
        Mon, 23 Mar 2026 14:28:07 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470393fsm33386975f8f.17.2026.03.23.14.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:28:07 -0700 (PDT)
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
Subject: [PATCH 1/3] crypto: atmel-sha204a - fix memory leak at non-blocking RNG work_data
Date: Mon, 23 Mar 2026 21:27:53 +0000
Message-Id: <20260323212755.687342-2-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260323212755.687342-1-l.rubusch@gmail.com>
References: <20260323212755.687342-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_142809_803272_BEAAB51B 
X-CRM114-Status: GOOD (  17.53  )
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
2.53.0



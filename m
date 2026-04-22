Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBD2FA1FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 21:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clwVc7+iR/ZLUiHHguQE2LgazwMIBXludQgv/pgrOYk=; b=Hc1pT+0bOLupSBu8rU85WeRck6
	RLv0qaaLUYscbcgSQXkWKqvDoOB+Ig72lvV1BAAluufb6WmytQAnpRA1+pjc64UvP1tL6ww0kNo9O
	tk/a7OosDiO+DmDFEKD9sw9XNRFFeex1iD8Dkf7fGGKWdqFaiMNhdWdif+SG4paUtj9OV4g8AvxlX
	/paf+AqIS3qpcEss7tAy2fue64hQS7B3LQ0CwO624eIiznOpHZyT1GxeQyPibECYGBaroCvY6pVBG
	AVHFw3gxNYP5ayP+vJj1SNGJeuHwtdYWSIfxZXS2EFyvYAWqx2l08cNPX6L4wT61YNqKStMb5/H+d
	iRFfG/hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFepW-0000000AkIz-05Ls;
	Wed, 22 Apr 2026 21:09:54 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFepT-0000000AkHf-0qur
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 21:09:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4836d9d54f6so8685855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 14:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776892189; x=1777496989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clwVc7+iR/ZLUiHHguQE2LgazwMIBXludQgv/pgrOYk=;
        b=kEeIwiwE7pvFDu8UTbW4DpZuqUXW1HjHdDz2EBKtTJzNmRbsFmppOdR0iCZdpLpzSx
         0dNP2wnX0H1Lqzz0X1hd4X+PZKuu7232pg2vw8D58SMDDymXzjkrjGBhzW/AxJ+PKGRc
         XQJEWS/fb8X6YQU/8PwgHt/CTMjGMgkih13ELr9BV5Lm/mAsAZXG7NfiVjZ1AzNVH5Lc
         rA53MMMRRkR7AGJzTfXqRJ3RsibPiLXGSQu1nEzjNiyB+LuPUPyn+qrI7BUIFAWz2aaO
         oqKPH7Zoyaa7l4Is+QVqF15we9OnpkO3OEMxJdaasmLOPJ13WO75nCGzY6nSW6yD527X
         UtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776892189; x=1777496989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=clwVc7+iR/ZLUiHHguQE2LgazwMIBXludQgv/pgrOYk=;
        b=ADl1YbDpvjBziswsyC2rJQ7lnolTH4+0KjCrCeyHWVB1LIBsslSkeWGj7ZDCmgkulN
         Nmln/5NyigInXMHmFALdIwGykcbitn6rf3m43v15sqDLzMhrkFHy2abeEVY8zf8B2DzL
         HV94lgFP6jN8TCBZes/4eTKGFPKB60NRQsqsum70VE0ZRsVuuNhjVV3VYVcPiVA/BJ4H
         xGjjkBCz1xkSPqM3tDoJ/sYZCMuPRG2Dp0Abcpui1vyzC8aUvV2y5rYDjtnqlUwyPSef
         pSBJXY7erIkT5V3jk5OqczUrwwHSi6Umr14BhF29LcATZUBQc6BNOP0Lj8k42cx4DNMp
         s4Qg==
X-Forwarded-Encrypted: i=1; AFNElJ9Jg7A4omqYdyLrtZrmZJnoOhPFy4aHMyVD406SYIjB+TXARsFgML0YFJNKz01IZzVYUQ7Bzmf1QaWvZnEy4U+0@lists.infradead.org
X-Gm-Message-State: AOJu0YxVgSHLlrQtiq5CHyufmqHhpjAM9echP8vT2tnX7aB217ZcuHs0
	48ke48+ioeGoIIUS2s/uOV1jd6hpSoPrJ4z64/CYq7XBmXnnd+zZlQ2F
X-Gm-Gg: AeBDieuEmvh4hi/4XBAy11e/vVxblwl41DojDu+mg2wXEJIkn/3gGAMtH2Tjtn4yp9A
	Gs+81MKRaNP1jOA7IQf2mBmGyE8AiUz9ppoLFMySJNvWugvJXMo4Bz579lAUFxTDDm7EHFx0DUG
	iykiDKlA9WdJPK7eJC6uthP19Hbrz+sjL+6ROUgDHVkhX//SNB2Ttgi44YuPgW8LrBPe3oHtj4S
	hGN+d5NpIj3w+Xj58Gg+H8nttCUzj0nxJB3gCXfLAmdR9kzdQQGsQtYYwG1cmkO5a0EvXCsDIn2
	OJiZ5qlMNhlHjDhIIpiRhMfu0BrPYqw9M5pISxOQ/ThGUARsTlaIu++xmNGQmGtcJbQR3h1yvQb
	noehqtF7TLjkVpVglpaSvfdZi55CKfHzeB7O2nizCXMokhSckceWbq2nmlrPXN2fu2zIf4GQEwX
	HOPq1qPu6mjcB+vcWhwwxdiowh3zLlNu9zXxOdUPFPU4aJe1hdDoFL0Bo/JaDusMesYcloDdGB1
	kPRxKDAaGFI
X-Received: by 2002:a05:600c:1389:b0:486:b967:5c9b with SMTP id 5b1f17b1804b1-488fb75b9f8mr178126435e9.3.1776892189199;
        Wed, 22 Apr 2026 14:09:49 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a4b329542sm352469085e9.3.2026.04.22.14.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 14:09:48 -0700 (PDT)
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
Subject: [PATCH v3 1/3] crypto: atmel-sha204a - fix memory leak at non-blocking RNG work_data
Date: Wed, 22 Apr 2026 21:09:34 +0000
Message-Id: <20260422210936.20095-2-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260422210936.20095-1-l.rubusch@gmail.com>
References: <20260422210936.20095-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_140951_594486_D36DE0EB 
X-CRM114-Status: GOOD (  17.84  )
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
 drivers/crypto/atmel-sha204a.c | 43 ++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index dbb39ed0cea1..19720bdd446d 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -25,13 +25,17 @@ static void atmel_sha204a_rng_done(struct atmel_i2c_work_data *work_data,
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
 
 static int atmel_sha204a_rng_read_nonblocking(struct hwrng *rng, void *data,
@@ -42,31 +46,36 @@ static int atmel_sha204a_rng_read_nonblocking(struct hwrng *rng, void *data,
 
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



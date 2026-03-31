Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7045CFF60E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 08:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzLIANwxZ+5V5JDtMYwIGXlBV/CrkOF0yZpzbS4Kpx4=; b=U1ghXCouo1YmfvVJzX2pMOgKrc
	hrYjAzPnb62ozVO3BNCx7Ng072vTBk44j0tk8+osmUjRDRImVd5RRZhrdG2w95N8tC7iQ08/w30E8
	vLaNr9/qRx4UkZMztbJSI6ZSvhn6YhPCBPwVXub0YavO7W2QhlnZZNloYofzDtiShkMcSHAl9dJXL
	/eO8tGZjAJ5lzCyAnLiXDLNdFl20w5UlF/mOT10M0FbsEk/A3KaLIhGb05i+YmLs7a0yHkq+d6cKp
	MSaN/Bzx/OtLJ43es0jo1tvUj4oBtPRCqGCIpkww4uGEgRiRQXf2XIV7PbRHefpsOxYrQa6ifHKYi
	oS1hiqfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ULs-0000000CZkj-3Sq4;
	Tue, 31 Mar 2026 08:21:32 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ULh-0000000CZh1-2apQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 08:21:22 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43b8cb81bc0so441240f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 01:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774945280; x=1775550080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzLIANwxZ+5V5JDtMYwIGXlBV/CrkOF0yZpzbS4Kpx4=;
        b=avVf3/yQmiRACEmrM9hTCAsLuqOHL+BTbpTf0vcWaH27ONEGrPkljWOCilEJIEFmIA
         yk2W9wSYbkcdLhgcyzg9rNCacHdRbgECDYdn3s/eE5J5ITjC+TETpKJUti248cBbtqcC
         Z5hgWYS7G6PYXog2t8qyLnxAYkDrLC+owK24u0rVwghTngIWo480q1cNpD9QqzmQKrgS
         9jdvZ6nwtifJtxKacVBf2TiBRwtxyEmVBVEKBMpxTj6G6T9Nt3iqwa/SSKitvIidzQqu
         WNVAY891hAGNI5hz5HTTL/LaiHHbBpDu+ReCXItzTjHi4x+Hle7xPOAp2Z71A+5FLLQV
         C2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945280; x=1775550080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pzLIANwxZ+5V5JDtMYwIGXlBV/CrkOF0yZpzbS4Kpx4=;
        b=dOSptu/VQt+DWEj/9W673oOvaNIM0TNPl/rGP26px7X9ABtd0lkWOW9GPYrH7fOKJ6
         kxG2K4XO08wSAP5oUNgj2kAtc4xdV34pG0nRM+8vS5DPWkPorGLwjrZMV4j/2GacXucz
         vZf3gVyK08ELCelwwD3ya5Hx5VounI1OwRjRQyjXnhrAzbkGMOAj+YDGBRYBHIGszVHP
         D2KXzdEtGT2XLxTh2g/JYfqpgtcXJcFk1AP+WJiKztKoGK7j3dKpxckiKq7rBY2r89vH
         Wrv6DSk+Mo2ypCgZLBxMhMgCKJoaeZZJjbJlti3mFdAHZX/8XI5VbsxzimMY7xlddOfC
         zjaA==
X-Forwarded-Encrypted: i=1; AJvYcCUjvGCs4zgPV4Y5ljeSjTSj8osO68ej7X5vEyiLeTJXrU12Ha89AQnz9kyJqdHm1mVS3qzI+HOOlPBcxTDpJC2q@lists.infradead.org
X-Gm-Message-State: AOJu0YzYbu7oeP4l2EjzROaiAfJOA2Q6SUPWgDpKDj+ct9KXXNm96790
	SVySeZwA8ohRQ6OaHyz2JrdgGj9aRDey1AwVD3AXQZnVJe9nDZHmwl8P
X-Gm-Gg: ATEYQzyvIrdHv6HvDxIpE+sxMvAK2l62Xo5ixF8n3CqxsvoiK8xsSpeGv4TlloSusqA
	Gvfzrf13fDVXplOwwqKkCNvrC5oG7iK3Iik9abrPpolJvJgZKcHj54mIk8qUJCkyCbOd79382KN
	7U4OdtRbI/i74WGoNoNjYOit26WlhyAg13XukvW4fOksQxENP6rshVKAV5lYX15gcGSi3BPEY2o
	buAH7rwyW/McME1u6Ud4rxtaMNJBCN1RtSgRhrU1aYJeEcYRsZvYijettTNShWID9NUUPIe6Iy8
	Bhk4Y60pNVU2Z4+1wKZtO6a0sAX/1eXassGp/6M7WRgTbQBF1oAVm3KjyUcwd5czEW334GTt69H
	hPNpi+XKbpgIutd9bQ522ZhAIr9Ue6OHwDsLS//Yy2jTNnpfYSC9ZcMOPz6gm4nnZZ5feRsmaP4
	p/FZjRzxFLmr8QTigG8daA/UWSTRInPi3yCVkazev23qrz/LuhAJsi9YIPkq9sU3k=
X-Received: by 2002:a05:600c:1d1c:b0:487:1fbb:5a28 with SMTP id 5b1f17b1804b1-48727f2d043mr122939545e9.1.1774945279542;
        Tue, 31 Mar 2026 01:21:19 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887ad8d28bsm14542485e9.10.2026.03.31.01.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 01:21:19 -0700 (PDT)
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
Subject: [PATCH v2 3/3] crypto: atmel-sha204a - fix non-blocking read logic
Date: Tue, 31 Mar 2026 08:21:05 +0000
Message-Id: <20260331082105.697468-4-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260331082105.697468-1-l.rubusch@gmail.com>
References: <20260331082105.697468-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_012121_671317_5144D4EE 
X-CRM114-Status: GOOD (  16.73  )
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
index 350ba8618c69..c0a1d34bbd9e 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -32,7 +32,6 @@ static void atmel_sha204a_rng_done(struct atmel_i2c_work_data *work_data,
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
2.39.5



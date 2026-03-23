Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A873F483F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 21:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kj7GWfvFlt9NmwOl42exx2Iv0v0a3deVWNgthIQl6k=; b=q39NIpwTEj0Gr+rE0b4+u+jfZ3
	WBcIV6kfg5u3SgyGL8Q3FCj01DShmgnPkXw7UgSasBUJL44fQFA55hmiSPbAhDHKsQayW6u9/n4eE
	ZvPNYKrXiwBvuYiJ9Ta6QV0Empqt9N1DRnQR3WTZ03tyY/Q0tmDizLwsijGvKjnj0ARGb3yKAIgIJ
	G9Wkut0BGZ8ev7ahV77O58Fi/b7AicORJf2MbggqBmm/2zkgT31BDD3LQCjNMJTlEEC28VEE8besY
	S/jpL4/Htjp96KVP9i+q9mLJlK4tYnP9edI8VBwsvtqC3dmNhQIhugfVCI+9cgBoIGPHoj4huG0Vi
	Wqy4/DsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4mos-000000000st-04OB;
	Mon, 23 Mar 2026 21:28:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4mom-000000000r8-2ade
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 21:28:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4836cd6e0d4so6043295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 14:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774301291; x=1774906091; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kj7GWfvFlt9NmwOl42exx2Iv0v0a3deVWNgthIQl6k=;
        b=IEVQcwIP9xooS/IMo2OPDD4hI6gqTlUR3b9yeoPzqjYY30uD1W2rbUVi5tW1RJxhuI
         fBpfN62pe4qZN3S48F/wL8WC/MFbHUlLUrHwvvU7xmg7/Tn0exXJAzib6GgKl3gDhsqx
         GHRJOfqqM4SEKGyV/Xj0QdGOpmDwriKcPNtHGLgH8IYGO+LlIIyd/Yv7zMItBig1zA/5
         vNobl0UWynCXj/3py358yNwoY+UWSf9URsmrzKNPtOrAO+bnG55lgZPxuefslsNabvm6
         8PhiVfMbFcIOujrbrPe/OQ7xLOJrD4wbDDnAnFFr1ABvXTwjYZ/mgDAb/tE+E3wf+ddz
         9dNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774301291; x=1774906091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0kj7GWfvFlt9NmwOl42exx2Iv0v0a3deVWNgthIQl6k=;
        b=NoboIP8gXW+bFg1uiMAIVebse0a5os4SRrpzsq2Xl4p+QyV3Me1VIe+9TlqVWoRWkV
         RE+NxzTd2Y0AlZ1KD4LKRi7Luow/TXrqx7BQLV3yGzgD3wbzDRERgEPm69jFqoqkU0/Y
         eaKWTl8pt8kmkaGA3DlfmXiHyLSSCWutfV1UuTeokBs80Jrv7o8xe709B1QYzHv3Eq4d
         q0eagK6DBH/2998HcliGyY8Oeg1CcY5ETJg1UrvSjoDh17kPr08NbETX2n5usHz84xHO
         j3g867RIh1tRiNzXIqXRtnjY5fDphUkU8l6XcCa17TTYPG2QH0mGttSuzYK2JbNqO1N3
         u+vw==
X-Forwarded-Encrypted: i=1; AJvYcCWJLxttKXbgkOUP8VTwi33YHF+aYoQlXHOu4Lvol9HXg0Uf1yD7BqpCymdFgl6vOJz/FhYEs+GG8/TvGNpX5vaX@lists.infradead.org
X-Gm-Message-State: AOJu0YwrbFFcim2tEl8717vMnHS/LY9Mi8t/y3Nyt1HqII0rNMF5tHO4
	BlouOOEhvR7NCv3y+vSX7KB+sfQi8aB36GFG1dWcprTMHXpdJDExgOHT
X-Gm-Gg: ATEYQzyDhkVub8rmThyQ0ql24fiwXCVogzuBS+U+nLTGk4uUCx3JZHz1++JR8rMjDh/
	5vuuhR5qP+1mtc7BQYIYp3GHlIwN+yX2yvccXaAK5EY3G/EL/+GkA8SQfQPARil1JNEWRZxxYzT
	6+BIV1mOffNQP+w/tZ+5HCyXiqVZQrxGfPpmnYFdhI52KHClNh7m8CINRaC59TBESyUCF5osxjt
	0AOkLsVK0GIE9kAPpUSFhAf+mg+YBHeitHkSjVcBkeCSoEntHRG/ymqf+qeg65POzXqTkBBSSwy
	Afr/aww3S0oL5/hLVvNlxSLNVe1uV1uriT0yhTnPEgsX7El0OkUeSZ9yEikObAKZPxC8Knup3OW
	b3FlJnkDOvpD1twGsydg6bMQ0Xl/hVWIYSwlYniITtL0HCUayLIe2zwsc7QugWOH3u4bgl3zLoR
	lYmQQBol3FOg3wlO0PDMAZGk7hLepzdii9EcgSWINrZwzzsyPnVsgs9ugwOCeGFYE=
X-Received: by 2002:a05:6000:3103:b0:43b:6172:91d2 with SMTP id ffacd0b85a97d-43b6427f665mr12174742f8f.4.1774301290400;
        Mon, 23 Mar 2026 14:28:10 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470393fsm33386975f8f.17.2026.03.23.14.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:28:10 -0700 (PDT)
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
Subject: [PATCH 3/3] crypto: atmel-sha204a - fix non-blocking read logic
Date: Mon, 23 Mar 2026 21:27:55 +0000
Message-Id: <20260323212755.687342-4-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260323212755.687342-1-l.rubusch@gmail.com>
References: <20260323212755.687342-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_142812_669486_743F3B2E 
X-CRM114-Status: GOOD (  16.63  )
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
index 350ba8618c69..6700847c56a3 100644
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
+		memcpy(data, &work_data->cmd.data[1], max); // Note the [1] index
 
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



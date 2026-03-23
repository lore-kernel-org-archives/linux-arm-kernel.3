Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7425F4613F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 21:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csOGr/K8Tf7uItgGXZwcjonMRapeP/TA0fdd2GZkXSo=; b=oXW02MAIRYtkM7MCB5lb/2Ff6A
	cf4lfLBQ1tP6t+1rA/T0ZC9AvaOgUuSIGOXzBAF9HIJJESqVDi/5PSoeVLp9mWOJZy/UoUPuawOs+
	QI9TAf7z89bBGZaokq0MZbCAYuYDnnykEX9I2Sc15EKivdrWNh0+N6/IrpwfcCKEu+VCg3ig0uE+8
	QMsmKjdUTKUmh7r1dsbWp8GI3B6FrKcTb1I1mj8tMiVE/owA8vZGZP+KMgf8ZF5lltoURnj4XjpGO
	JIhZ2Z4G7pNS7cRQi5SBdzd/7i9pzGGWZ+K/Gp4pax3d6P4gUasrP0+xVomIedWrGoj3hMMyzqQa+
	D8Q2lJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4mor-000000000sd-36XN;
	Mon, 23 Mar 2026 21:28:17 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4mol-000000000qx-1jSz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 21:28:12 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4853a485721so5560745e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 14:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774301289; x=1774906089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csOGr/K8Tf7uItgGXZwcjonMRapeP/TA0fdd2GZkXSo=;
        b=HR/HzhHpQlXKbOrABZL+KidAsnnZegp7f/6ZOexTYpk/vd5nvCK5CzlpDarjid2l+s
         ys7NetQWpIvK8ldr/wX0JEWRzW1cD7+kbMXWJpbqZP2wRYzFhWevIj5y3FgZG5HY6dSq
         2R32aR+c0U6MN98jrn4BTmKi+3uozTLkWM5cz5n6gzYCFS/E7EmIoViPo6Tms+OxDHe/
         ZYIhH2yqWyzOu8LteljUEX2VhWAgdLKfirRDXluoj/1qzxT35R8OmU29+B1g96/eJlgU
         evu32dkg/KhyRTIvbl1GhbzijXALDCj0ajtW6Xs3iQvAjSzombciSKRaGjBI/7BKVJfc
         gFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774301289; x=1774906089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=csOGr/K8Tf7uItgGXZwcjonMRapeP/TA0fdd2GZkXSo=;
        b=Syi4Iz1c+kUGB2x8j8tN8O1/hr/idtgdax2DyVYJW3tPU6nZ9qPY1X4+iz6R3qtEkc
         sGL0fNy/dtYfMAI99lJTQZPG/tfi38/xwXalFxhg75Edxn6vTlSlOTmiQjtTlBiyhVgD
         8m6JsATcGI1uh8XNmclSFloQ3TXyUimJ6OqCYg3fxENOSoyVPeEfhQPssolnmjMhwY6k
         BlMTbBzQnsf7u96LOXfttooCcw1WB30a9/STcM7lQBr//IOPU6nX8lV6NS7Jag36Ho0N
         hMd1Ej+8Q926lsPeULaRIVNBQBpUNFollP4d42bKe4WoEVk266xMKjoJoIcteTnXZU17
         +Ypw==
X-Forwarded-Encrypted: i=1; AJvYcCWTdAqMosEuF6OZ0xopGdb5vYPjiaUDyxcfL/CeKkA1S87WoU3Z6iIqIEd7gqin3pnHNhFkpOLDoz/46hGZzcj7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2fssEN+sza4wGHEA7uD/6ozKwAwi2DA3HyzGWqrB/x6NjV0FZ
	pcc75/j2u2EF7GhFdtN8Z8f/Wt77my12DKnsxYF+DAZcBOlM+W1bn2k4
X-Gm-Gg: ATEYQzxMtvlhjMxh2HxDSu2w8/fT1aJV8MxMLxZcmZPvz8cUZZu9w/SOBPJuoBpfHPy
	YIy/NfmHrM85MtsUe2yTjvS96+iPWq9NNgoRap2HTvJWdW8t2NxRS1Dhp62hnFl1YKC3b5xHdes
	kWoGAScr1ekZUg6IWHBBpoqjtQKkFs3PYp5z+vA9HHPUae2CkU1Y+f7nd1edjmvkzWz1fmgiNQ3
	pajOqbW4PLNQtLAhXv2W+ua+0kBKUN1PZQeKSkAcP0M1eb7/8GG7bk6MRnQNsJD8ZipeMBYI74F
	fSB16LyCQY+QsWjTgMqV2pFFOA1SuFX8/cmTyo3B1uJoGAc9iQsmUrRTEdXRvk8GOG88C+SRVEn
	wseUcjN4NvROceBx1yyxDwkjIR3rIS84zFdgpeQ6gEzqQp59ok3hAxp8yaN/7k+lYsYR8jX1AKx
	lyjErOMWvMR5pp2vtASuFmjdzGpddWode10iYyk7xinOutCfGs9g2OdMmeH80ZgMQ=
X-Received: by 2002:a05:600c:3b07:b0:485:9a50:338b with SMTP id 5b1f17b1804b1-486febb8560mr105205725e9.2.1774301289309;
        Mon, 23 Mar 2026 14:28:09 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470393fsm33386975f8f.17.2026.03.23.14.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:28:08 -0700 (PDT)
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
Subject: [PATCH 2/3] crypto: atmel-sha204a - fix truncated 32-byte blocking read
Date: Mon, 23 Mar 2026 21:27:54 +0000
Message-Id: <20260323212755.687342-3-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260323212755.687342-1-l.rubusch@gmail.com>
References: <20260323212755.687342-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_142811_466020_E5992FCC 
X-CRM114-Status: GOOD (  14.83  )
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

The ATSHA204A returns a 35-byte packet consisting of a 1-byte count,
32 bytes of entropy, and a 2-byte CRC. The current blocking read
implementation was incorrectly copying data starting from the
count byte, leading to offset data and truncated entropy.

Additionally, the chip requires significant execution time to
generate random numbers, going by the datasheet. Reading the I2C bus
too early results in the chip NACK-ing or returning a partial buffer
followed by zeros.

Verification:
Tests before showed repeadetly reading only 8 bytes of entropy:
$ head -c 32 /dev/hwrng | hexdump -C
00000000  02 28 85 b3 47 40 f2 ee  00 00 00 00 00 00 00 00  |.(..G@..........|
00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000020

After this patch applied, the result will be as follows:
$ head -c 32 /dev/hwrng | hexdump -C
00000000  5a fc 3f 13 14 68 fe 06  68 0a bd 04 83 6e 09 69  |Z.?..h..h....n.i|
00000010  75 ff cf 87 10 84 3b c9  c1 df ae eb 45 53 4c c3  |u.....;.....ESL.|
00000020

Fix these issues by:
Increase cmd.msecs to 30ms to provide sufficient execution time. Then
set cmd.rxsize to RANDOM_RSP_SIZE (35 bytes) to capture the entire
hardware response. Eventually, correct the memcpy() offset to index 1 of
the data buffer to skip the count byte and retrieve exactly 32 bytes of
entropy.

Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-sha204a.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 1baf4750d311..350ba8618c69 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -18,6 +18,9 @@
 #include <linux/workqueue.h>
 #include "atmel-i2c.h"
 
+#define ATMEL_RNG_BLOCK_SIZE 32
+#define ATMEL_RNG_EXEC_TIME 30
+
 static void atmel_sha204a_rng_done(struct atmel_i2c_work_data *work_data,
 				   void *areq, int status)
 {
@@ -91,13 +94,15 @@ static int atmel_sha204a_rng_read(struct hwrng *rng, void *data, size_t max,
 	i2c_priv = container_of(rng, struct atmel_i2c_client_priv, hwrng);
 
 	atmel_i2c_init_random_cmd(&cmd);
+	cmd.msecs = ATMEL_RNG_EXEC_TIME;
+	cmd.rxsize = RANDOM_RSP_SIZE;
 
 	ret = atmel_i2c_send_receive(i2c_priv->client, &cmd);
 	if (ret)
 		return ret;
 
-	max = min(sizeof(cmd.data), max);
-	memcpy(data, cmd.data, max);
+	max = min_t(size_t, ATMEL_RNG_BLOCK_SIZE, max);
+	memcpy(data, &cmd.data[1], max);
 
 	return max;
 }
-- 
2.53.0



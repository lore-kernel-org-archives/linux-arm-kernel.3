Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DE5FF60E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 08:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GwQ4+C9ATAPLFcmqTbKzY7v6j7eVjPD9TBcAmNWpQc=; b=35uEw77XYEqLTHGMi1fZb4wZo0
	jpas4nD1ql+Ah/cvqatCuyRQnkrxfzXmCvd5Hj5aJB59J4DDgYIv/YEuSqIRjQoFFN3flZjXYWi9h
	i4F7y07t5/pDPX6R0+ay+69EgE2/89X5OOFzbJiVQZ5SXGcJb+Kc4JdJDiBpGzb8llyM/E5fIR4Az
	rDfuzaLg9ksSr6J4MdBoRHWDzNvfSA9n2L9Eu4nUsLeiqH26n6GryxuDW7uZKrKMxVOtu5seDv1mS
	B8OIatFfXXXCCnpdjalkg7TK5W/n2EgGy7XfgsWm55Bx448qNjaVakyIZo1tZExEcLyCIQP1Lm1mZ
	pAQOfZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ULs-0000000CZkM-2Hs8;
	Tue, 31 Mar 2026 08:21:32 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ULg-0000000CZgf-1oAH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 08:21:21 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4836cd6e0d4so7264705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 01:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774945279; x=1775550079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GwQ4+C9ATAPLFcmqTbKzY7v6j7eVjPD9TBcAmNWpQc=;
        b=g8Ogu07gXz1C29xzdVOzPAInJxmk1t2qUYybgE/0h5X/GzWhFvfDnxby7Rfro070FB
         vVmrTNYyg8FdvInsgiaRG1gghKpj3ICnnA3LA3Dyh2o1VMO4oSVTnzIWFrMgkWbLQSTf
         EDmrjr8ip3PGJjRdt71eLN0LrT0rVovajvYwMTat5wNbNAVXQmMoHM5ZAI1QtIf5hwea
         RkJvKaI1Oh4xjcr6n+6rE3ubdy6HGlX0CMgp0on5pSosrAl3XdpDIRJSUO04G2ZkDYfh
         i6rPNJurwROY/Ld8/5r+jkBTpYSnCibH3TehaIbEcn7lSBQCGPUNxN64w4NKXk+c0rhZ
         JUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945279; x=1775550079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2GwQ4+C9ATAPLFcmqTbKzY7v6j7eVjPD9TBcAmNWpQc=;
        b=jShq9PWdmWpRjM5sbXIYuBobSrZIV6NBpLDaZBQ0VPDO+MAm5+xFaSBzCBH8sw0p6u
         qwdrQtwnmDgA/nNnmGGXwF4NAAZIFdpPUwg+db1H2+5rxF0EYEzYU/8w7PqocXyyeMfV
         cFM2chZ9mOj7tkt08hM0rXrZd5DyZn/FqTcrew/9TrUVO9bsqh5dEHBFdwl5V6Qmj604
         IMU/XyWRLZaC1Q2yPnVBSOedqzG6dWQWPkUCQBVXsF80AZZZJaX5eiQhbmcJJfRJsheC
         BlKBdFO2tZ5V2duvbvgtOoHNplyzrKbuvkZ2iOrJLUn0SVAKbERFDT8J/HhYkMPEjuCP
         +0GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw9QqECR9BLCfrTAYEmfpsCrL+O8aes79pWYcnCsPepRKAiG8FXHAwtSJxLTh+JANhtqOvnP/DWBujzlXiFtKQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxBNeZN9AkyCkl1NW1l3a47iphN1jidYkvC7z9jFVOgn3suvBL2
	Uhu3sQyWiwQSjWAliWqsst6iOehXs9SqWrhiIVrhXZIOM1OrLZ7qE8oN
X-Gm-Gg: ATEYQzyQdZJNI3aCUCGmzeP80d++foqrt6lG9dNsA5JNGssnjlxoiEpKXOC45LU4jEg
	xzyzaBW5oY7uZiGDABHZ776BjMtZKqTRkg3A6+ep1xvuQPGdNt+4RgyPN0xSL5TaqxoarO72qsg
	yDLX5WdAKIRsxuMEzwSDje2AxZcwYhHxbbY9wCyyaMxgzlDTNyx+xYTGVwVlkeRezmQqHbZuD2w
	JjfQmcEyxceRy82XE5XRwXfGtLF3kj9Wd3JF8JN/ckM7z9ZxQR+XQK3njTY8jal78WwKhuXQcuL
	pwHCSIXBRvG5BxG8hDs3lUzJqo/QfQQ+BOv65wX2IYqfQoDjGXEz/8IRNy0tqXN2ZZ/e5mtScmk
	BF2qGlZ+uPSsr8c4BuLwRHDXeJa9jexrEVEyIMotg2g4ufMmohxyb0Nv9r+3vKwRscFcKExLDyQ
	buqDTjiPfTD8XnWqsM7wFbGZejUGHPpALIjx9PPLBs0JxIyTJacryE+MtHdfUkpks=
X-Received: by 2002:a05:600c:4f09:b0:477:9c9e:ec7e with SMTP id 5b1f17b1804b1-48727ef6489mr109750975e9.6.1774945278456;
        Tue, 31 Mar 2026 01:21:18 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887ad8d28bsm14542485e9.10.2026.03.31.01.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 01:21:18 -0700 (PDT)
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
Subject: [PATCH v2 2/3] crypto: atmel-sha204a - fix truncated 32-byte blocking read
Date: Tue, 31 Mar 2026 08:21:04 +0000
Message-Id: <20260331082105.697468-3-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260331082105.697468-1-l.rubusch@gmail.com>
References: <20260331082105.697468-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_012120_482718_B72ED6C0 
X-CRM114-Status: GOOD (  14.78  )
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
2.39.5



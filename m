Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F352AFF8850
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 21:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqonbb4yOoprB7ZvKc0Cn/U848NJVsSj7hGA97TbfZ0=; b=SYtwEfhWUbzpown7gY5dnIoGF4
	8FgM6PiC2WW6zkfU0vKWlwf8ViSsLVnC64h3HLGGe4CEvvha2jSuEpSdJam/9RTXtGbVlO5kbT7oQ
	Y8pzRha5tuaM7b8MWvNAjwSCTffhluyJULdr2yily5A70mKnTGST9NY7HDYn8FpHnw2EJHFyD+Kgn
	i3NLMduWGNPZSS23lhhGMY1A+MusGmOB6U6tX0Ww1+TY20jGd8q6eO3wqdZ+ICgClUsUgq+tTFWmt
	7zRpjK5N5zlkobj57SqBNxUASbh8l+0kp0yD7qGmLXhGLSjhpwtODDc2ZRrzbQ3tiuQkS/fhaGVYT
	a5ZLkkfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH73B-0000000FrYS-1XgD;
	Sun, 26 Apr 2026 21:30:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH737-0000000FrX6-0tx3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 21:29:58 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48962cd0864so10820745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 14:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777238995; x=1777843795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqonbb4yOoprB7ZvKc0Cn/U848NJVsSj7hGA97TbfZ0=;
        b=MD4643dCeTTBbsN+7g9fd2yfIXEFRVXRcxuAo/ZPCgmexwHtv7/xrK7mZBsATeOUKm
         NfXdUt9DzPGQj/WMfh8xpZtxcBQIfWuoFYOQwcit+qOeaE8Eb844ZaFNtmxdHQArjPnh
         Dnzxj4YRUCt+7+hXKPgA/fe6OREv3rAb0xHEntcuTurNdzNlJLyYaUtD7Tats08qz2BN
         SxLOuP1ofRYhcL8+MXFnZJyRXoRr5T2F+mwKtBnUK8bZE1uGQVpjz+QlBK82xiRc1tOS
         RhMizN3/ixXULDrEdCcwB6ob5arMOU5dElgQ5EvU7sMUxuNI5u8HmYE9SGbLYe1SHV0r
         fQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777238995; x=1777843795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sqonbb4yOoprB7ZvKc0Cn/U848NJVsSj7hGA97TbfZ0=;
        b=PgxEnoQTGs3DOXlngVqezuB8dm1MO/jVIo77I5zZw1aa9EWAdB3TsBdScZhDDbHEw0
         ch/ngNpxCCKqECQwvM8b2UkamP1McnL0qUd7D6p6ejVs6BPhIMGhjIkQEvLrPH50EUHe
         zIapEq8a5r/GSiGH2RlC81GEBJHbkUG+JwbcyA90H4lJnPClI6uoUIo8YXb4JxEx0Yy+
         4XVAOLlwqUams3rXtelNbIrD+EQiDgMXmBnkdl4wK2tQj3Ic/s84L3txu8F4V/t/M7hE
         b/c4qwIaJd0LF5AC0iXnQ78RMDEb04Btn+xY5P6/+DrdsnTjcwtRQ5/I8Up/unqu0N8t
         Kp7w==
X-Forwarded-Encrypted: i=1; AFNElJ93/LG+4+LLNgFFLQsy0UcxILJgeHha0tbLouI839QZwq0lzN2woBrNlVDkwTgN8IwJqdas2czezHd8NGMtaFPs@lists.infradead.org
X-Gm-Message-State: AOJu0YzxjWxXaBm5U6GBF8xt/xzUx/KxGbYJrUUjoEp0jIicD+BjCX5C
	N23UqoQT7kaIxxlpBEPu+LWrqbHa3SAODHVNBjN/VpuL20OF2sW/H7ZA
X-Gm-Gg: AeBDietdCTZqgI4RUrk5Ow0MzuVy/S3ZuXt0M4AH2iKBS3bXVZhqeldNKoesXRK13Ji
	qqH3i7bFi7ifzV/Ojtz3jnmt70izmm2kLxE6+Bnm6d21HNVUd+5EnJirdHQVEVhuXiedrha0fpF
	iLZduqy3R/4mXc9HefZxpyD8LdsrBpZWANJHHNNViflbIZm9p+iooopf7M9UMee8LNasK0+zIYP
	vgdiQAnn5PEpPraSnZ6PM0Lq9IBCnwfmB/AsTGdPGho1NGSTVT4dzVavt3328bi1L9I4iPnDatT
	qebGfW+Jd50cvJc6ZuwKRAkzbuaeL+5huAV4RkkNoymnk/ncOgu6F9iVw3rTvqbFl4FIVt9vYxW
	LFiqruLrCzqmZWH01UzWS1+qshzV9ltVBUb33/m4YumlXy3lGMqFJj6NFlo8ej7IXTejjir1vXs
	ph9Ccl2bwja/pdl22TE2VWyXOl3TjrC/+TPfeybkkzH4MtTrMY97WPmlQQm9ox7A9924yiFnM8+
	A==
X-Received: by 2002:a05:600c:154e:b0:487:17d:d0bf with SMTP id 5b1f17b1804b1-488fb769fb4mr257421595e9.6.1777238995346;
        Sun, 26 Apr 2026 14:29:55 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a79esm79047320f8f.17.2026.04.26.14.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 14:29:55 -0700 (PDT)
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
Subject: [PATCH v5 1/1] crypto: atmel-sha204a - fix blocking and non-blocking rng logic
Date: Sun, 26 Apr 2026 21:29:47 +0000
Message-Id: <20260426212947.24757-2-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260426212947.24757-1-l.rubusch@gmail.com>
References: <20260426212947.24757-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_142957_267976_625EFFF3 
X-CRM114-Status: GOOD (  13.15  )
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

The blocking and non-blocking paths were failing to provide valid entropy
due to improper buffer management. Reading the buffer starting from byte 1,
only fetch the 32 bytes of random data from the return message.

Tested on an Atmel SHA204A device.

Before (here for blocking), tests showed repeatedly reading reduced bytes.
$ head -c 32 /dev/hwrng | hexdump -C
00000000  02 28 85 b3 47 40 f2 ee  00 00 00 00 00 00 00 00  |.(..G@..........|
00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000020

After, the result will be similar to the following:
$ head -c 32 /dev/hwrng | hexdump -C
00000000  5a fc 3f 13 14 68 fe 06  68 0a bd 04 83 6e 09 69  |Z.?..h..h....n.i|
00000010  75 ff cf 87 10 84 3b c9  c1 df ae eb 45 53 4c c3  |u.....;.....ESL.|
00000020

Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-sha204a.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index dbb39ed0cea1..5699bb532325 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -48,8 +48,8 @@ static int atmel_sha204a_rng_read_nonblocking(struct hwrng *rng, void *data,
 
 	if (rng->priv) {
 		work_data = (struct atmel_i2c_work_data *)rng->priv;
-		max = min(sizeof(work_data->cmd.data), max);
-		memcpy(data, &work_data->cmd.data, max);
+		max = min(RANDOM_RSP_SIZE - CMD_OVERHEAD_SIZE, max);
+		memcpy(data, &work_data->cmd.data[RSP_DATA_IDX], max);
 		rng->priv = 0;
 	} else {
 		work_data = kmalloc_obj(*work_data, GFP_ATOMIC);
@@ -87,8 +87,8 @@ static int atmel_sha204a_rng_read(struct hwrng *rng, void *data, size_t max,
 	if (ret)
 		return ret;
 
-	max = min(sizeof(cmd.data), max);
-	memcpy(data, cmd.data, max);
+	max = min(RANDOM_RSP_SIZE - CMD_OVERHEAD_SIZE, max);
+	memcpy(data, &cmd.data[RSP_DATA_IDX], max);
 
 	return max;
 }
-- 
2.53.0



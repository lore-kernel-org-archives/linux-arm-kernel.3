Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5464C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 04:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=208RQngiBHE21PmHkOlyRcvNYTZaRPWqpBwhjg/rUVM=; b=S+7DXeda/DHGnpqOu00xaEOxmB
	ycDv2ZARkJxYO4C252f5q3K+uRBqFp5CBbXeItYMjVatpGgZl9MNIWC8rBMy9khVl7T5PMKVGDqNO
	A2ze/5yP05m1+DjvPIeIiqZpNL1n+XrZSMMJ4WvKB9+vfOR+GkAb9W3OJQwfT2VM4zft2zT3lLVBb
	VeThK6q181vNgvddFQgvalELHFwnjDOGF6Z5rLl/G+ydq7FBMqCnvUUJdxUFZHErDjzK0gpogXF/r
	AFORh1TLzxTl7cpjNXHUeZNKi5T9EuoihTYlxzWN3PPbloeA+Qxgvli12P9Ijko3V4X5XUUfRjfpX
	TFKyg6zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0AfE-00000006iYm-0jPV;
	Sat, 29 Aug 2026 04:27:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0AfB-00000006iYO-3cbl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 04:27:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49800c6a846so16348785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 21:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787977648; x=1788582448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=208RQngiBHE21PmHkOlyRcvNYTZaRPWqpBwhjg/rUVM=;
        b=n/8aH9Ozg6CTLgDgntohUiydOLDCNjE5pRBhb7F01i0D1oy6ffd5nT4r4YVSnuWx+9
         SwwHpe2LCOS1ns9eF2ycrpoQVN8BAar57WkXqVo8kAcDwZF/ihnr1b1JtaMP/18XwaRs
         /6OjYu4QaulLG//wLxK02AinJ6WmAQ9rW5uHZ4kjdQ9eJFCzdP6HwfQ/ARXIcrFnw2eb
         eDD40edr4S/lEx13CP8yg9kaZOQ13nxhjtBQrPWoOlCEasY9BP8fXUYcSKAzFpZvJfpR
         eqB4MJKokaTHG0V5D3bVmos3DGfH6nYBnzrGwn9DzhpVb97P3TGgZO53CjKC3W8bo4h5
         xsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787977648; x=1788582448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=208RQngiBHE21PmHkOlyRcvNYTZaRPWqpBwhjg/rUVM=;
        b=a4ssedhShl6BwM6VIJ3ZCju9IiaMZn4AeisRp09ysuA9S4I7DXCdaPctl6aewpiXzA
         5I4Ry/lgBaBm8TGpf61PLZtZNBfNy4Bo3ChFRjABd+OolxjVB9TTxsa9pJ7OFdgEoK+U
         JIMz1SmQ0sTQYwRtZibqkIPNeYZfVM8FwU3/rhRdnf3XaIrnqpUOvL+mAnVPnX1Lt8yW
         /d5qjm152sMbu7r9hhgI49QBss5ydyKu+nzzN1ASbmQPM3bO3MWzj3pxbfv+m7hxPWUW
         /YHo18hiwOTPPx6UtXcpYjcIwGQCZWrgZZhXaOhStgejHdU+BYc9XpHo4km2k2IeSyt6
         POaA==
X-Forwarded-Encrypted: i=1; AHgh+RqlqAYKWRgDh+pJ3CL6HnT/DiiD8iRHbzeBsGANLa4nREzwYKkSHhyjJcOkUBP56B7SE/FQzPXbYFCydQSMLx7w@lists.infradead.org
X-Gm-Message-State: AFuF++lXti78xNItJEU3c7XhnqP528feY6o/exGj6UTTYby5vpg5NbTl
	+lEmhnRkb4gtU+VxHqRzqjlSZ4dMxmRasjz3xdhh9nRkOdXZbpzoD8wm
X-Gm-Gg: AR+sD132b1cSSIS++9vvtBeDxPLFz3LsFxvc+T1y2My3tPZESaJXPUrDPn9AtV6ie4/
	B6Gac6vYRqUfcEjhwT+bUAejqk2D2KG1+0Do4ZhIYaWLvVGANJCOsUToXesB1hgW9nK27iAUvhY
	Da0AM43XlAfKrQxQv9VNdXvB2dE28kcerWVF/54Hok/pH+jO7B9vTCLn31ObOO4JFUEfIOEzVC0
	5VuKiaUoqKdTqn4zmXLD/S8gi719WXrOKKnH6Rl7lhRho7/WiHUsiwbz3o8/0WvAClL3Lx+thFp
	EEwe/lWc78ABIB++VBDV9JKqOXOjrURCSD3ec4fMSfJ0UIdhPX9EXcFvB6oqrY9opeKcHn5MOqW
	jp05DAzkPwRrWqfOaCj7d3U/RnSOkprbFpAHaA4Zo+0F7lqPuVr5jq1igGI7mVbfKvOA95sUj9m
	rlryCUgvf0bQaq/s5be10Z/wRMr+2quPVpy+HJnNrQaqI0cQC50OBjWvGzpVgNfogWUlCHPfESR
	JsZrP0ae+18n3m5cImQ6pCj8u08Tgn+hwfqWuCzOXR1dLmHFg9HiArPsgQ0phhnVjUzLJ3rPB0X
	XYLj4Tq01ESgy1DqY0vw
X-Received: by 2002:a05:600c:3145:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49b91c44f6cmr167217795e9.10.1787977647580;
        Fri, 28 Aug 2026 21:27:27 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-015-136.77.7.pool.telefonica.de. [77.7.15.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm116792405e9.2.2026.08.28.21.27.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Aug 2026 21:27:26 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel-aes - fix AADLENR for standalone GHASH
Date: Sat, 29 Aug 2026 06:26:04 +0200
Message-Id: <20260829042604.82719-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_212729_924144_5948520A 
X-CRM114-Status: GOOD (  14.81  )
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

atmel_aes_gcm_ghash_init() writes dd->total, the request's text length,
to AES_AADLENR.  But the GHASH it runs hashes the dd->datalen bytes passed
in: the 16-byte length block, or the padded IV when the IV is not 96 bits.
The data sheet requires AES_AADLENR to hold the length of that input.

With empty plaintext and empty AAD, dd->total is 0 and the tag comes out
wrong.  Later requests only pass because dd->total still holds the
previous request's length.

This is testmgr's first gcm(aes) vector, so CONFIG_CRYPTO_SELFTESTS=y
fails at boot:

  alg: aead: atmel-gcm-aes encryption test failed (wrong result) on test
  vector 0, cfg="in-place (one sglist)"

Without selftests the broken atmel-gcm-aes is preferred at priority 300.
Seen on a SAM9X75 Curiosity with 6.18 and current mainline.

Write dd->datalen instead.

Fixes: d4419548dba9 ("crypto: atmel-aes - add support to GCM mode")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/crypto/atmel-aes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/atmel-aes.c b/drivers/crypto/atmel-aes.c
index 50d97cef75b8..8e4de859cadc 100644
--- a/drivers/crypto/atmel-aes.c
+++ b/drivers/crypto/atmel-aes.c
@@ -1267,7 +1267,7 @@ static int atmel_aes_gcm_ghash_init(struct atmel_aes_dev *dd)
 	struct atmel_aes_gcm_ctx *ctx = atmel_aes_gcm_ctx_cast(dd->ctx);
 
 	/* Set the data length. */
-	atmel_aes_write(dd, AES_AADLENR, dd->total);
+	atmel_aes_write(dd, AES_AADLENR, dd->datalen);
 	atmel_aes_write(dd, AES_CLENR, 0);
 
 	/* If needed, overwrite the GCM Intermediate Hash Word Registers */
-- 
2.39.5 (Apple Git-154)



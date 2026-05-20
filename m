Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9223ACD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10VZpdTCBx/M0y2pbEw8ZF+QedK7xIucV3ceY52PauQ=; b=wgl7RYjsnHnT93Cu6uDWmLdR+o
	yKoNFVOniJIEBxPQovzNiMY+T1/BU8ZX2ysoilqzMx7Sqcevg/8qeFDdsMmIhsXWthTwtoK5dAXqV
	ZQu7To6k9H4KbC7HH1nTtrPKffeN8LmdeQ7QtDl66OtsUPTb8J9J1EKTYeRXqt08WnvK9FnUdyIhd
	H5FlV0koOIIYLokdSzveyBSyKmsIJdXgHHq6yVT/j+swxZhAYYdqJi/Supz+jn2t3he6AL9KLNMPA
	w+5iqGe57Ytbf4GzISZbPjW8vy9YF2AZT4i2a+0s/XLsiRO5fSyEsU2W3k8QfUWpN3ZO6S19lHkzp
	QKhuqpmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPaxH-00000003jpB-3IHq;
	Wed, 20 May 2026 07:02:59 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPaxE-00000003jnV-3fDQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 07:02:58 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-bd0209f25c1so792661366b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 00:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779260575; x=1779865375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10VZpdTCBx/M0y2pbEw8ZF+QedK7xIucV3ceY52PauQ=;
        b=jlUkZREHH8N33ByTUHxB1djcjXFB1PLUz10ro2yib6TfS0Eaqrc4SVvCKd1nPr2DKv
         dCAoarApSnpRTkTaUGsEhNjErheuJivEHT7bfAeVJBLqunMCWnRuuORam4lggG/GtcmM
         gcHh0vguAfEgvkxLx9QvVh/AzkHakYjdWo4v/VvveA37mCfyhrSDvPqAa+qiPkSmFzQq
         DoLE2waoWNuxBdwd3OIwo68n7eydPjPG+xgtE1x0caOjeIAMsTccLGCR09/Ifiuzb/9v
         /IwfBGg64mYzKbxFEAnXD2MIUz/S5tIgNzjIP4o4qHO7gM45IsXgPdjqeh7eJnQBGPqF
         bZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779260575; x=1779865375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=10VZpdTCBx/M0y2pbEw8ZF+QedK7xIucV3ceY52PauQ=;
        b=ETCXcg2lMMEKtAkKNfSOKrlLKjFfqsAIf1AYraparQj0YtnBWfq7cCjkkJ6q0QnP12
         FjWiEpvTlkz33tU04k0cKfRjxnv9pburwfIfcP5aWHlsnNJqnEycN7c0WWNXwFTe+7Iq
         JyhtdaibOJ6CBoQnz1+7a6cEqX4qKWva5NC3yUVlKqRtKJNieLRKD2NoE/EbS3xgnPws
         m1ag2OZpBP1BRbbTpIy2jVob47wHmjWnbt+fnv4/poF3bit0nLFMw8jHX/l9v2KA3/cM
         C6sFYUvbdm7L5GM6tLoy+I2RtrEyJmWWqI+ElOeeRCbc3lCrrKrG6Hnl7Bs52MAVoB/z
         QM+w==
X-Forwarded-Encrypted: i=1; AFNElJ8SsfPZeFynsX52FpXWH693q9FqM9TdZRRQuSSQhY0PvjHl8RqLztk3uh0kHFi5IJQKmGuV1k4BUhhCrctQuD3B@lists.infradead.org
X-Gm-Message-State: AOJu0YxrHYnLD1pw1GsFXBeSNumASQ/z+kK9wv0fLwD6bZNcH/Ob0uCb
	6mO/PbsIS2e0Ylv3WdrG7CHQcc11iG0uoezflkq7g3ZGUOzGt71NNlHpupdBw7/06Ic=
X-Gm-Gg: Acq92OGdxV7m8KmplWpdAgiVe1ONT8zC4ImX3SaQTahMKYCH5smXH/tc1dP5a2zUzDx
	r+jCM1ZNJUunHOQ+Xm6LEMd8P3Dr8FMa4qDc7nZZcqu3I/fEjhCRzR/2D6UlYSQQdMtYl+NyRqh
	gl8D3jI1JIHi518WruhBI7zMb8V1sRxxu5fSzZNxZrEMWsoc8nPWwBHwNOkhLQq7VRLX9DoevGz
	a1epaPDdKZ4O1jRMlQDuWOnrPgVby8ckD1rLdZ/Qb3vyERJiBUNR7SSah8CYysdg89lt0GmIj+c
	ecQbo/7uoy/TvN5JPOXVkBYBX+Ywjpfva0w2deO+D6Gf9FlkZXTmuvxcg6oxjzCFAtOjusExhOp
	T3poR652mCRKg/wSZRsVPUATERS7Ri3HzLOZW/hfVfPVpoxNYqJk+5ZzCigj7of90dPfRW3T86M
	r5/rSmj2peEqegmUkzWSzLP69OSrpmWRCL1HHrEaNjDiug9jtrjfKclEKDYE2tNwOUWtYKsrXNK
	e08gUUdX3rN00I=
X-Received: by 2002:a17:907:c291:b0:bd5:ca8:768c with SMTP id a640c23a62f3a-bd517964d14mr1300026266b.31.1779260575045;
        Wed, 20 May 2026 00:02:55 -0700 (PDT)
Received: from localhost (p200300f65f47db04a02ef40d8e5825ac.dip0.t-ipconnect.de. [2003:f6:5f47:db04:a02e:f40d:8e58:25ac])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45d9ec3ac86sm51087688f8f.14.2026.05.20.00.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:02:54 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Thorsten Blum <thorsten.blum@linux.dev>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] crypto: atmel-sha204a - Drop of_device_id data
Date: Wed, 20 May 2026 09:01:28 +0200
Message-ID: <d0fc3069860f9e31122c1af635a1114dd2c443cf.1779260113.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779260113.git.u.kleine-koenig@baylibre.com>
References: <cover.1779260113.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=jB7E5nfjNPtmgBpSkbD9Y+IVyJMEV8LErgJMc6V5lTA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqDVxKJT3P658b+AS5o357PwTRM/ZiEOXWRVVRa gzrJzVSyLSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCag1cSgAKCRCPgPtYfRL+ TiZNB/9Q31kJQFrjfCwVGdjfkoNE/8MqM5OOgAbGQhEDrYEKSvCs/sTRxvNP+7wqgFQ3e6E7Nj2 05VgDTkBMiCExqVsmiflBdvnQZa5ws4iJl1dcTr3aVNyqY1n0HnFH7ixShNLLZD56ydC80dgucR KTEAz0SyNF7PCOdTZFgBUrRLkXDpxlfsIgaDvOA38URNj5xaPMcCb2tPIE07XYeuNRGBPgbAHDi SaoJgvuTK5D1HeUCYbELQz7FqzS9TOWIzFz9ERc08QsdStx3sQCvMs8l5/4rEy2L4GuaIPMbQLi CWwXraR/VDj7lLl+9bJt2R0kp2/n2yry90HqezorqIaD/O1C
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_000256_923392_A156F921 
X-CRM114-Status: GOOD (  14.04  )
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

The driver binds to i2c devices only and thus in the absence of an
assignment for .data in the of_device_id array i2c_get_match_data()
falls back to .driver_data from the i2c_device_id array. So only provide
&atsha204_quality once to reduce duplication.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/crypto/atmel-sha204a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 6e6ac4770416..f17e1f6af1a3 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -208,8 +208,8 @@ static void atmel_sha204a_remove(struct i2c_client *client)
 }
 
 static const struct of_device_id atmel_sha204a_dt_ids[] = {
-	{ .compatible = "atmel,atsha204", .data = &atsha204_quality },
-	{ .compatible = "atmel,atsha204a", },
+	{ .compatible = "atmel,atsha204" },
+	{ .compatible = "atmel,atsha204a" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, atmel_sha204a_dt_ids);
-- 
2.47.3



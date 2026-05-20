Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD036CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBwDHSWyPjF9labkr88yZlgFOaG+Rkrr8b9gOHE4eqM=; b=Dj4ZC6wJj10dToGEUOeX0fiXxQ
	xc5pA2e1nyQpFn8jydEhkTOLq0G020F7neXtESVG1Jh4mllgzFfcIfuTTzt0e3uwlI5GTZUUTOhQP
	FeGtsYHcm8S5Q6c7sQQBMZLJPOw4ott6DFJnFnh8zaAzDjJv2G/vPreNcIDl0qsvZN2+rqg8E/Uc+
	egj++JRshcvAKpBUPV0OiQOMRaclVcO+1BKqJbcDYvlPBl+IkHZLRDZj6x78X2Lp82ceDe0mJSTfb
	SGMhtSo63/9WZYql4LODy3FCmTq8AVimYYz5Ktv2FGo3CYII/L3kfiHe9ow8OsusmJrJUQdc+HUUM
	vzMk/kww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPaxS-00000003jt1-0KxY;
	Wed, 20 May 2026 07:03:10 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPaxG-00000003jo4-1Y0Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 07:02:59 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso59231945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 00:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779260576; x=1779865376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBwDHSWyPjF9labkr88yZlgFOaG+Rkrr8b9gOHE4eqM=;
        b=ge9LAd7lelqsz/uW0vLhi/Qmdmnw+iKloSqck1KXx6oJoCVkqDW1MXOpQORndLr/i2
         HLN6+Es5WnGfyicSHRunhtlm/bev/pJbylXOQG3zX3b4/lfHitAVqAAqw6QnEvtRrPHG
         hyWLtssXB/RwcKRvmkAKL/QEnQRbrnumGCKHr6NmXLehUZmqG+/BPM3adNEGFCZfAbe8
         12Ae2pqsEkTNPco6WN1m5Dyj9QpYmOS73OaNvyjFkOkS828WvJh9odQy+dbDSl8RL7F7
         2s5rOV6nIycnaZ9vxC3aKo0ZuvlHsDhLXnN+QOJueKWjcy0g8MbGQbxYoDbomvFKh5TB
         6dIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779260576; x=1779865376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nBwDHSWyPjF9labkr88yZlgFOaG+Rkrr8b9gOHE4eqM=;
        b=DVTl6B8E8/0Hrig1VrHTBs292fJZcNo1klvml4BIW+h1mKhzFfWeByIbSVIQNW1cjm
         /pTtNQRGqHqWfZGnF2x47ai27Ha5ad8caryuwxARG1yXaql6AJJlzKF2rI01DVJX5lWV
         u47XYQoTzvIT5QcAhEuaHGxjC0R66X3y8GjzZgxCYjXBvyM4PfV+r5ZLDExe/IEHZnR8
         O7uADuzgxZ+TiBbiC0/M3RlHg5KTtW9wMS9g8IB5EAsJCqQ6O98XD1seriLVCVWjy9FI
         Y35uJ9LjqcMa+ZBitV3lcGHgOjOjh7QPwlj3E+JWcZ7fD/YE3fmcigyLk7xtzqZrgj6P
         N9gQ==
X-Forwarded-Encrypted: i=1; AFNElJ//XtWcm27KIiqEF0yufpZG9q6NB27CTkks64JxjVfeMXLu4Z+YygNeyPujp/u1Docd7GfUT1z9bn84mxJy2b7J@lists.infradead.org
X-Gm-Message-State: AOJu0YwFJMyVLWx+UomSDe//MLmWiAxcvD3GkmelkjPJKd2JZwcte5FL
	JQvmcEG4CtSJyxKLZG1QurbGVEABBWrDQo5ESy6iBAcVwnb4OzicHnUmETWp5IiGZsQ=
X-Gm-Gg: Acq92OEdwrEwFi7sXWUtRbyerT/x+RtZJEZCnm0e3DTYwntLVtaUAoMzLQElFx17Rye
	my78jofAR3s7oSuCGCkDDnOaS5dqUZm1M4Pzn/eHZLEia30zpZiGv4RWcLQPa+hLfX5Lzmyq8cw
	80iC3XlY0InLImy1Vtu/VHJbzTx7dTxOczAIWHQQ7yzxY4s0H6M1O7G55WPQFckQ+iieQAPCrsQ
	JGeVuEDR9i4zvmzy3v7FDpdG0ukxhwefM6Ngb9QQAKIdFy+ASOf1uqikgATZjp1cscxq3w2I99n
	rTypzs95F2XHdZ3yRYTplJu7nr0uLh9i9ZMrAwclA+wKNMKFabuHMWisiruXju3xzB55A1gctCQ
	lZDVL2TbZr0+AesuSRDyC5EHdNmnE9CD2oDDW/D3YNl8zCAicfa+RZ0eqABUfYIGO2J+7Sp0UW5
	cxyk07ZlygtfaOMO3JeOw8xj0pAvKGUa5lsEQ6Ib+qjCq3XPl92semsuFGIcLxDa9mvlORk4rLq
	5bmX93hRujYHVs=
X-Received: by 2002:a05:600c:821b:b0:488:b811:51c4 with SMTP id 5b1f17b1804b1-48fe6515831mr334398165e9.25.1779260576342;
        Wed, 20 May 2026 00:02:56 -0700 (PDT)
Received: from localhost (p200300f65f47db04a02ef40d8e5825ac.dip0.t-ipconnect.de. [2003:f6:5f47:db04:a02e:f40d:8e58:25ac])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fe537c788sm357422625e9.12.2026.05.20.00.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:02:55 -0700 (PDT)
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
Subject: [PATCH v2 2/3] crypto: atmel-sha204a - Use named initializers for struct i2c_device_id
Date: Wed, 20 May 2026 09:01:29 +0200
Message-ID: <d97be8401911ad6de62170b8e9c98364ac65f0f7.1779260113.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779260113.git.u.kleine-koenig@baylibre.com>
References: <cover.1779260113.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=vsTr2WXJVlF73qf4sZw8bIYO7/nU9FyhgZ3DQYFToF4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqDVxNCjnxtb1/VxjbdwdnMLQ5HrtoX6QFPNJK3 XQNulk3uOyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCag1cTQAKCRCPgPtYfRL+ TiN1B/4zsqo/nDBD9Lh5++k0ejsMpNKssANOQ0g9bQiA7dVE1kFbKttj/Fl2jD9o2vtXGhbls1y IAsMc2+PJcKgfzvWhNxsgha5XHIMy8G7Gfd94Gkv6p2ajzYkEh2/VHEd/h9ATkTHGl6N9v1hfqi cIbWe1f9R7d5pk0slrlt/BrQ+h1fqz+F1RLznP5LZu+HUMOkINcB0w+T5CBQMjq19dYcLDZHPP8 UP853poez/ELoMzR2Veoc5XEnW6abWzr1STuvUWsvdL8qd9TyHQY3dqoVfLs1GMzaKtZwQQbW6F 46BQjcbwIzN0UTMx/cpAqYMBd/fpAO4oiHb92pcX5F1Xdnrl
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_000258_423330_D0FC8EE7 
X-CRM114-Status: GOOD (  16.19  )
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

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

This patch doesn't modify the compiled array, only its representation in
source form benefits. The former was confirmed with x86 and arm64
builds.

For consistency also assign .driver_data for the array item that the
driver relies on i2c_get_match_data() returning NULL for.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/crypto/atmel-sha204a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index f17e1f6af1a3..f3bbe836778d 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -215,8 +215,8 @@ static const struct of_device_id atmel_sha204a_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, atmel_sha204a_dt_ids);
 
 static const struct i2c_device_id atmel_sha204a_id[] = {
-	{ "atsha204", (kernel_ulong_t)&atsha204_quality },
-	{ "atsha204a" },
+	{ .name = "atsha204", .driver_data = (kernel_ulong_t)&atsha204_quality },
+	{ .name = "atsha204a", .driver_data = (kernel_ulong_t)NULL },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, atmel_sha204a_id);
-- 
2.47.3



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A827CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2K/bAbM7b4hD+UZ1sY7e2X2nlDeVKcJvl2Epy7suEc=; b=uG/PbJljkrLlAchpGvTfzYeXRM
	0QJ0kK9HZ2Va34m5/gqXzXmfXGioXPzYGeAyxbojb5kjLDuO7GZGLJ9tYO7JzxHHBc/WW9knlaYvH
	lsN0J+qxJVEzkLicqXMOupqhEzesK3Jg/qEpfXg1ZWpqoGdekoR6L32lxu1Lf23loofMrE2ELGecF
	fQ6yd2ChfQW2YATAMkOPsz2sY8h+i78UoUQf4GqZAu4XUootdZi5O3FP3yQSpUHB6kBdVa7lgVHGE
	tFQBTXve1vnOSWFrv45KUN1dabf7NZMBTbc3JFz/AjttjWlFR9CScQzVSl7Q3StPORlM+l8rqzijP
	SxYggphA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHdP-0000000Dmv4-1hst;
	Mon, 28 Jul 2025 06:46:55 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugH1j-0000000DjHf-2BX7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 06:08:00 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3b783ea5014so566963f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 23:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682878; x=1754287678; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2K/bAbM7b4hD+UZ1sY7e2X2nlDeVKcJvl2Epy7suEc=;
        b=VqDpU+q9MfRxhCWuZK2dg3LU8FX5J1dI8nIIvg3F5QFO89npuR6EBqP2BVu062lqAV
         Y40SUIqAw+hTbq5e65TaejLJ2WO3PQNQphubafGs6erOFv7eNzLCFACnOoqBLocGn3PZ
         V9cTEI/7aJn3uxbXjUoQ4EoyypFXUxD+K5s2sMaRiOEBYF02zg7BYtvoBKwZ01TO9CWC
         8j8EikHxQ9rjZUf47PXqx89AEUsbxZucwaAiKpRUfg+J4g6BLHFsEIhQvZaCissQvBqH
         zbQhDZ4kWuEywDY34A95L/32sP61gJoOXZuDj+kzGPgcEBe/vfKoZsCDDyoqMj8FZCEv
         2d+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682878; x=1754287678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2K/bAbM7b4hD+UZ1sY7e2X2nlDeVKcJvl2Epy7suEc=;
        b=PIiRLKaVyDS/mZXalwNqA9aJ6cpya9+OTe06PYX8TGCrRXGkjsyLhqpiv22KmLJGEh
         p+k/yp2j6xQe9SEMVFCJsO6L6Ld6qJSUvJY12p0chaAIeOUu8gX/n6dW1DKGLAO6bIYd
         enTfVck9E06Ir7gUr8zj2rlvrh9O9dyRCojnOaONxGyIDh8WA0YUBR6qw9qWEmb8fbgT
         VLI94GS1SFAt0qItiVjqWHX787aQNfdPcWAPY+po/D0B1htR46XxZ65EKJoEipKyEsct
         0W5VnRQIbqH3cw8ZWiaR6QdfoMfTEjPzH33PbyuTCoZ7x16+Eym/eNWQRHednBiuGyA6
         osiA==
X-Forwarded-Encrypted: i=1; AJvYcCWWbGwvp9OkVV+srErSYDxiaJ1f9T/cR0HqLBD1LoWXP+HzNr2jKsuo2UkDz1USDN6j1ZFM3/uVgk8Su6sjfLOz@lists.infradead.org
X-Gm-Message-State: AOJu0YyEvjJO4QeaKT2d3d1EZ7KcIUVfwL5IYuzcRlEabYbVwh4MkwE7
	sNKcyYytE9Z8ocredb0fYpc/OsoX+r2E5KbSSNnDwLet0SbA1/K2iSr1EQjmvg==
X-Gm-Gg: ASbGnctvvJYitXgK4kdGTaR0Wq0dR3hEzx3G1wGO2QdX8WBjwUgYYTSRpk7cyQYtqFr
	4HFdcuMLzVaDO2WU+2DWI4mqhSyJjaUWw2rTVSCUtQ22CVW4NKcHCMht8sk1WSD4TtcKEe9TlMt
	qTx4y8/cK2EF81I5+oWcKBp6Vct24sFq/BwMa531c1ka+Ij0hw7pfOSqIhld4CB6ANwumIhRxG0
	73ciLuX6vUIvwwjxzaszcbK8Dpav1fSYhLURrBeMMT5oyxThIsCm7EjaXp99ZZVkCdRm2/ocDSi
	bmlyzryQOhPibIdaU2S3ja1fM8v3iq9I6S1uR2n2j3RtnXWa3jJ0JAPo9bIQAaPdI/IJdfmsQIh
	8Lh4RwFzc6XuA4DzG7V7jhzSectLkMq2D4A==
X-Google-Smtp-Source: AGHT+IES0WVeYiOQzgvF9uZ/F/ZuRvB9DCBVa5KoIGMgW6lVQFOUgMPsAT/Es0z6LGY/i4jb9SI8lQ==
X-Received: by 2002:a05:600c:1d1e:b0:456:3b21:ad1e with SMTP id 5b1f17b1804b1-45876442799mr90886165e9.17.1753682877810;
        Sun, 27 Jul 2025 23:07:57 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:07:57 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 3/9] crypto: sun8i-ce - remove unnecessary __maybe_unused annotations
Date: Mon, 28 Jul 2025 09:06:55 +0300
Message-ID: <20250728060701.1787607-4-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
References: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_230759_558611_43226B0D 
X-CRM114-Status: GOOD (  13.13  )
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

There are 4 instances of '__maybe_unused' annotations that are not needed,
as the variables are always used, so remove them.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c   | 4 ++--
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 113a1100f2ae..c57c64a1a388 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -111,7 +111,7 @@ static int sun8i_ce_cipher_fallback(struct skcipher_request *areq)
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
 		struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
-		struct sun8i_ce_alg_template *algt __maybe_unused;
+		struct sun8i_ce_alg_template *algt;
 
 		algt = container_of(alg, struct sun8i_ce_alg_template,
 				    alg.skcipher.base);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index 79ec172e5c99..326d9c988bb1 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -1062,8 +1062,8 @@ static int sun8i_ce_probe(struct platform_device *pdev)
 	pm_runtime_put_sync(ce->dev);
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
-		struct dentry *dbgfs_dir __maybe_unused;
-		struct dentry *dbgfs_stats __maybe_unused;
+		struct dentry *dbgfs_dir;
+		struct dentry *dbgfs_stats;
 
 		/* Ignore error of debugfs */
 		dbgfs_dir = debugfs_create_dir("sun8i-ce", NULL);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 61e8d968fdcc..df2acef9c679 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -26,7 +26,7 @@
 static void sun8i_ce_hash_stat_fb_inc(struct crypto_ahash *tfm)
 {
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
-		struct sun8i_ce_alg_template *algt __maybe_unused;
+		struct sun8i_ce_alg_template *algt;
 		struct ahash_alg *alg = crypto_ahash_alg(tfm);
 
 		algt = container_of(alg, struct sun8i_ce_alg_template,
-- 
2.50.0



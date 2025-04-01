Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FDFC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 19:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8z+fSx5TSn2FrXLNFfU/1u/JP6JDm+uKA06s523rtI=; b=ytqQwDL81Izn8DZiBAXQzxoNF8
	7dbL8vSZAWnGZhgg03Sy5j2wI+WuxAr1G6GKBKVYQeMvwrXnrhqbTwSAIVZhEIbr1LI1CBP0Cwpfz
	47VqIaba6PAuVnlR5VWlo5sLuCkrr2yK7S45ZI/fu/cxI1QJBBOzsJnLsY4i47EiCQ04l7DoGkc1R
	MYkvJHCxu9L6Eg8o2kdpkOXGj5oAwpL3Lk1uNaib0EYo0etVqM31L8ePS8hsOCT6f96G7AB5rKHC6
	Jhd03IF23PSHM1omZ2S61A32Zy+r+bO8jX9llXpiC5d9+I46Ty1UJuPGOCjjj5dbx/oeLmcXqAhyr
	u8KzBVLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzhMD-00000004EK7-3ZOs;
	Tue, 01 Apr 2025 19:33:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzhDP-00000004D66-0tlZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 19:24:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so41716835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 12:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743535441; x=1744140241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8z+fSx5TSn2FrXLNFfU/1u/JP6JDm+uKA06s523rtI=;
        b=F+AzR05c5Juy87wbUFLdR1CgK95GgTUuUhc0Iu+usTaQLZsIqsHFBvW6GbhgBttxOL
         elK4Q8JM+LWPnz/y2Is2Rb4QgFhKyRCEi4E4s6DKh6p/RF0sNYcE2vIsXWw6+YHJ32d1
         /I7yi45/Qq6X4R8AHMC4hNXG7U9ffb/YnjZLPG6YmG+Nudq8LAN8FVf94euuMJQoQm7O
         wDTbot18Uuo98hKgP2cX2199G3n8ybSfO/8S+VZapWs46J6WmYbdq96pFKq1Qs7pfsEV
         KUGAIG9ku6RX4g2+GFn38HAZzk9eIpuElYOIp0ztn0sY9CqTMf5ha50NDxFsvKZTWOie
         v7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743535441; x=1744140241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8z+fSx5TSn2FrXLNFfU/1u/JP6JDm+uKA06s523rtI=;
        b=rIDIJRMN6R0weim2lxgkqb4y5VYKKogrbTkFgnN6V1A+fHK3C2gQw7lpUOUk/KHst3
         qigyaAUunGu13JNFfXA3ic7EMrJeKeP2K5DrBstFXsD6jqYIzuvME8nrAACtlFTG0l8j
         huIiM7ATpI8EtSRvnLZzDSTd4NNRmKei6/6+mvXbV+hNYjoKh99ytIK/OhVUf0Dt8jAK
         jivzdbwmpibTMJkOyEF0euWdP1hOImIesKOE8wplHwEa4EM+JkLQSd6nfKFxG1Dm6lPh
         2OrJkY0UymiYvzs1ghX6AvO5pAuO5E++GI6YxBlqatxVXwJ90sSSob+XxX33QuBD1Meh
         2BAg==
X-Forwarded-Encrypted: i=1; AJvYcCVARtNa6RQ9JxaEBCwpSYSmEG7SK1e0jMoe0zf4PTsfxBqIuadDCHon2bOM/3QWpgo83R8cCUCZzqhzYN9T8eBe@lists.infradead.org
X-Gm-Message-State: AOJu0YwhTYg+UJd+3Tu77c96QEFXy9mVQSsNy5XpSoUTNOrpf1PYmG1W
	594QqqfEv7wANQGLf7j5Zb7AbX4dql0yv9J85yJw3HhJLzCiRpvw
X-Gm-Gg: ASbGncucJQQ4EKIZZZfTkhU4ZATbZRK2jITNonbetpJfqJN3eP8Ba0j/znMTB0mhqYM
	VUNdrBt+rey00IZTJ+UzY13G1W7b/F9ZgXd8gtMX/u3Ii+1PJVoaAQXgQBOgpxRGjfw4ypAYBjI
	vmuXoQk8jolKovcf0zeBPi8FBOO+71dyf1e/dwyryUfiscC5n8JVkN/wnu2huVz+7F+95DP0w5d
	BfYjDc+8g8J/8YEl2341HnGTYaM/8gSiRXPgBfjuLrCtrmI1BS1Ck86c5yuYJLH2rPLo9N8b2BW
	Y+3a4AWPLr+h1B4gYSJiNXHdq6Mc2d4lydFRb7BKjipZZce4pGkHBpU1SfKcJVYU++rnAiGK
X-Google-Smtp-Source: AGHT+IHEh+OGGdBfpbw9Ezhf9HsQaZImvcYBc/BECi3M6V/8EKmHii6CQkGoC7DxQblK6JTqZon8Ig==
X-Received: by 2002:a05:6000:418a:b0:391:22e2:cd21 with SMTP id ffacd0b85a97d-39c12117df4mr9452334f8f.36.1743535441394;
        Tue, 01 Apr 2025 12:24:01 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66aa32sm15353438f8f.50.2025.04.01.12.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:24:00 -0700 (PDT)
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
Subject: [PATCH 5/6] crypto: sun8i-ce-hash - add IS_ENABLED() checks to debugfs stats
Date: Tue,  1 Apr 2025 22:23:20 +0300
Message-ID: <20250401192321.3370188-5-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
References: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_122403_250964_211C7A35 
X-CRM114-Status: GOOD (  14.59  )
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

Add IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG) checks before the
fallback counter updates to make sure the code is not included when
debugfs statistics support is not enabled.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 22 ++++++++++++++-----
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 530c5181d73c..f2481e1585ba 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -60,8 +60,10 @@ int sun8i_ce_hash_init_tfm(struct crypto_ahash *tfm)
 				 sizeof(struct sun8i_ce_hash_reqctx) +
 				 crypto_ahash_reqsize(op->fallback_tfm));
 
-	memcpy(algt->fbname, crypto_ahash_driver_name(op->fallback_tfm),
-	       CRYPTO_MAX_ALG_NAME);
+	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+		memcpy(algt->fbname,
+		       crypto_ahash_driver_name(op->fallback_tfm),
+		       CRYPTO_MAX_ALG_NAME);
 
 	err = pm_runtime_get_sync(op->ce->dev);
 	if (err < 0)
@@ -198,22 +200,30 @@ static bool sun8i_ce_hash_need_fallback(struct ahash_request *areq)
 	algt = container_of(alg, struct sun8i_ce_alg_template, alg.hash.base);
 
 	if (areq->nbytes == 0) {
-		algt->stat_fb_len0++;
+		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+			algt->stat_fb_len0++;
+
 		return true;
 	}
 	/* we need to reserve one SG for padding one */
 	if (sg_nents_for_len(areq->src, areq->nbytes) > MAX_SG - 1) {
-		algt->stat_fb_maxsg++;
+		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+			algt->stat_fb_maxsg++;
+
 		return true;
 	}
 	sg = areq->src;
 	while (sg) {
 		if (sg->length % 4) {
-			algt->stat_fb_srclen++;
+			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+				algt->stat_fb_srclen++;
+
 			return true;
 		}
 		if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
-			algt->stat_fb_srcali++;
+			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+				algt->stat_fb_srcali++;
+
 			return true;
 		}
 		sg = sg_next(sg);
-- 
2.48.1



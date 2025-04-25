Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7426C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 15:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlIhz0JB5sRSfAD0HIOOevrgWFZ2yotgxE/TDOX4uAU=; b=Kxp9vPUcSMfktIXI//JQ8tbwEn
	/3BIuyLikgR90Sf/fpzxNFpJRe1SOk1D7hwEnJUqk52ra3noo6Fta0BB+R9eemCwWsCw0Uu3M9KCS
	AW+SXrg3MlbA+Lxs6lCdRceHfeo/drssNdIwNzU75HSZ0DUP9YX+11AhfmeuDNQd/W7P9T1OSZwFa
	H/woTHRXs9eoCIsZjt6cZdmEcJB1wbpbEgcycQqcorwoQanCZVmxgTPi7CfTZEoTWgB+rZleWted+
	20xsktdJrcnNKrir3pe/hhks1Kcy0yJYV3PwMGNmRdpXSACX0yqjObuZaOgBjPCLDWG1IWOGVLOXy
	gKR8qYPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KXx-0000000HX9C-3FJ8;
	Fri, 25 Apr 2025 15:00:57 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IRC-0000000H9zz-1VB6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:45:51 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ac7bd86f637so646486366b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 05:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745585148; x=1746189948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlIhz0JB5sRSfAD0HIOOevrgWFZ2yotgxE/TDOX4uAU=;
        b=gb6PQ5eJnyMXlDQph7QHVRWOgAJG2p+k6b2/0kKFs4ATo5yG+YpgjGYKOowHPg2xUN
         sqZ7g9MNH6MgSa52JMvTibLHc9hd0coPEZteJj9FCZHuoUVqszW/NBFAN++bNPCDXE1W
         uuT8vR4BG4VpV14AyQ5Je/SsztX9TVY+Gy9GOjSoIBYyHOU+4pPWXT7Mg957qWcbQh6d
         LZMzRT1eNEoQIN27HiU628Y2dByahrFtWSmaW7Xbgzv9eD2UH6Y7vR/UKjIe8B437X3o
         dygJ3yv+gUjAqfLeWY2LE3+SeTKmYbeb48dm0S5H+eytm1eTvWWgAf7ZN0yM58rsDqKn
         u8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585148; x=1746189948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlIhz0JB5sRSfAD0HIOOevrgWFZ2yotgxE/TDOX4uAU=;
        b=Q0PdQ+PSt6hLcMlzIS+ovfoM/JVh4fqfO7Xg5SKm43xhUB0YZz+FiPeWN4CB+25bJv
         80CXMqlN6n7QoQnUu1wc5L0m5i6aWxAGyIGt36K1CwZIXf64a917JoBma364Dlk+zds4
         JhP2RdiAJfczqt9iwoNSXrbKIMPuwjGO1E0g9ITEXzoHrzV7jvrHT9tGGXe0BSKSpiXZ
         Qlqu9p4ElIE0mrih0Zqfi/KwGDsWCixPDlRkR9U8XjcSJdlQnTH5YwQK5V1letdqmox3
         Fnbybis6JZZahFTAGI6QuFznVchstQ8GYyNjKIx9vRJxBJnCzcO3NS3aqHqXJBiKc2OV
         o+Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWka6w5FTqh3VNQHw05+MYwgPLNROoXiXr9G57KKCeP+T0lE4rbyAaNHFY3r3ZXyjCjFs9/tILhMKrsgArMbAjv@lists.infradead.org
X-Gm-Message-State: AOJu0YwzdPDkG9ykJJ+rJU+1BpC2zdIMySU4OtPJAk7sjy/WY1UG3mqX
	D0rql1qTOvjBJUek2PdIkB6iVPn65GQMKgaM/FjgMs9yrdyaN/Lb
X-Gm-Gg: ASbGncvzmYMUik6URJMC63zbm8461Dgp9Zh4iWSsxhHKNgJhsS0Votkq8EgkD/SjMsA
	Il2/vM50mGLc2ZQ5Qz7dzrYpbhw06vpgw77Z594ywG4QyMrCS7gA6jtkhWEeJraf+h7Saizm0g6
	ZYwtVf0jvzPknwhlv6hBp7JabIoUWyA5OPeBTMT5gFfej3Avd4Xt6SGLDET1qWJHORQyUhJ3W8g
	SmIBkhvfkc8fxJgPG9hmb5o0zTPDskOMKaiOyN9BXDvOSviesmIOcFYB6v3m7kRM7ReiTp2BsQd
	ZdgFM4nCKKE7p6qyjaS4LJdAwphFDbuytvja+azoEpJxd+qETn52L22TJ5i/mN66KqYk
X-Google-Smtp-Source: AGHT+IHsRkfW4z8AS9Sjh3HauYzSDV+j3U5Ovg8Y3HzMxW6/Vp1c2OsJ8tuja5lsWTGyHhQu5GJEEA==
X-Received: by 2002:a17:907:cd0d:b0:ace:3291:751 with SMTP id a640c23a62f3a-ace5a2a87c2mr526981066b.14.1745585148502;
        Fri, 25 Apr 2025 05:45:48 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7094sm134641766b.56.2025.04.25.05.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:45:48 -0700 (PDT)
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
Subject: [PATCH 3/4] crypto: sun8i-ce-cipher - use IS_ENABLED() checks for debugfs stats
Date: Fri, 25 Apr 2025 15:45:16 +0300
Message-ID: <20250425124517.2225963-3-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
References: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_054550_394425_C7AA24B9 
X-CRM114-Status: GOOD (  13.19  )
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

Also, drop the existing ifdef guards, since 'struct sun8i_ce_alg_template'
is always defined, even with CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG disabled.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 46 ++++++++++++-------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index f03a8fa7bfa2..433cd18f0b5b 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -34,22 +34,30 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
 
 	if (sg_nents_for_len(areq->src, areq->cryptlen) > MAX_SG ||
 	    sg_nents_for_len(areq->dst, areq->cryptlen) > MAX_SG) {
-		algt->stat_fb_maxsg++;
+		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+			algt->stat_fb_maxsg++;
+
 		return true;
 	}
 
 	if (areq->cryptlen < crypto_skcipher_ivsize(tfm)) {
-		algt->stat_fb_leniv++;
+		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+			algt->stat_fb_leniv++;
+
 		return true;
 	}
 
 	if (areq->cryptlen == 0) {
-		algt->stat_fb_len0++;
+		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+			algt->stat_fb_len0++;
+
 		return true;
 	}
 
 	if (areq->cryptlen % 16) {
-		algt->stat_fb_mod16++;
+		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+			algt->stat_fb_mod16++;
+
 		return true;
 	}
 
@@ -57,12 +65,16 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
 	sg = areq->src;
 	while (sg) {
 		if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
-			algt->stat_fb_srcali++;
+			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+				algt->stat_fb_srcali++;
+
 			return true;
 		}
 		todo = min(len, sg->length);
 		if (todo % 4) {
-			algt->stat_fb_srclen++;
+			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+				algt->stat_fb_srclen++;
+
 			return true;
 		}
 		len -= todo;
@@ -73,12 +85,16 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
 	sg = areq->dst;
 	while (sg) {
 		if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
-			algt->stat_fb_dstali++;
+			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+				algt->stat_fb_dstali++;
+
 			return true;
 		}
 		todo = min(len, sg->length);
 		if (todo % 4) {
-			algt->stat_fb_dstlen++;
+			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+				algt->stat_fb_dstlen++;
+
 			return true;
 		}
 		len -= todo;
@@ -101,9 +117,7 @@ static int sun8i_ce_cipher_fallback(struct skcipher_request *areq)
 		algt = container_of(alg, struct sun8i_ce_alg_template,
 				    alg.skcipher.base);
 
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
 		algt->stat_fb++;
-#endif
 	}
 
 	skcipher_request_set_tfm(&rctx->fallback_req, op->fallback_tfm);
@@ -147,9 +161,8 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 		rctx->op_dir, areq->iv, crypto_skcipher_ivsize(tfm),
 		op->keylen);
 
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
-	algt->stat_req++;
-#endif
+	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+		algt->stat_req++;
 
 	flow = rctx->flow;
 
@@ -438,9 +451,10 @@ int sun8i_ce_cipher_init(struct crypto_tfm *tfm)
 	crypto_skcipher_set_reqsize(sktfm, sizeof(struct sun8i_cipher_req_ctx) +
 				    crypto_skcipher_reqsize(op->fallback_tfm));
 
-	memcpy(algt->fbname,
-	       crypto_skcipher_driver_name(op->fallback_tfm),
-	       CRYPTO_MAX_ALG_NAME);
+	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+		memcpy(algt->fbname,
+		       crypto_skcipher_driver_name(op->fallback_tfm),
+		       CRYPTO_MAX_ALG_NAME);
 
 	err = pm_runtime_get_sync(op->ce->dev);
 	if (err < 0)
-- 
2.48.1



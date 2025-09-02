Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03084CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SQo1VWDa8L0gOXuwTFV8cUa7G4/T2C+1QUOVeEgYOo=; b=gl/7avWvkVU6VNmbtmvTzn6dUU
	K997fw4VcVtj1KKk0y5Un7wjwR+1oIsie6slV83mVchN7LppmyVQqc0sUbieu15GN0107uvNFODMZ
	c2mct6TmVIhAkH+mnL8lRNi1mGbt/ibKDi6Kc7sB0SDTIXip1VjP7dUIfijiHPEkG0yXZ21S/ofwZ
	rVqXGI4lVs3qOoQLrUo/FwoHKcmmUmncu0Z9bhR9C4hh4TOOj/rCUpM/9J2OM6BGCifAZnxdCdARo
	ljh+iZy3QXTC6cT2m1dhtb7UZVwpTLNbYzTF1Sg9yuGaT/mqIFSC1hzzNjcAPutrcBBbtzWJhe6G+
	2Xyoa5ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWOR-00000001ahx-0y9h;
	Tue, 02 Sep 2025 19:10:11 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQyS-000000000xn-1Dsq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:23:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45b627ea685so45732215e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 06:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819379; x=1757424179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SQo1VWDa8L0gOXuwTFV8cUa7G4/T2C+1QUOVeEgYOo=;
        b=mfh2lkAOl3WsM0xOsjnTSyfN14LpXRaz7Z/AHNtGuSDWZIYfACUrOgCgS+eP7FoEIh
         nqsnmDY33+Dii/GbDkbPIV30bEIFOwpMxdAYXsfHaiub1rE5HVwtF1d7OxmZqVEv7vKL
         DIiGGndOY6J+xeDxu0o3Kq8D+PMKz9MbLgdkgjDoe9f62PFgTqrSn1PuegEneTMG9veC
         R2LvDfesY3neTlrPgZAs/Hslj3KOJq+27fnTHOon6jO0eAQSkRmtZkr82trjC22ii3Ir
         hth2NMYUw3C2ZTKDYj47la6Nv53jr4RRMwrDArcUx3o7pwRIq3uUpW/Z8ZSBDEeWKghT
         u25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819379; x=1757424179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SQo1VWDa8L0gOXuwTFV8cUa7G4/T2C+1QUOVeEgYOo=;
        b=EiQM5vZBlhbXTaXQsiJZgl2iLeWlOvMouWJwrTKZTcipbi3xzM5k6n8chC8C9PUZ/k
         KYFDg4QH7FwFYkmGyniOT0MvgRCzUh6ph19kNmYXufPFobBpuSBytrKBGIcmwUf4ZaUd
         cYxVhrtfCptTtmnd+AbQJoG0eOE9rH7tXqDFJw401CYOsjHYyile7H/3kOTp8bRlGoVr
         pTjDF0rq7z7CJwWTnkLTDKOYvn3dKqZxgajdb35A/+KkbCkzKOHOcHMWTZBB1aOvAhvJ
         Ia2kreRbyRmZvBXtIKrCpMHXS30IAAA/CalUjSIuRarysQZfp2Lv4eKNDACYZ+z4EPBA
         nWxg==
X-Forwarded-Encrypted: i=1; AJvYcCXFwTRQ9/NCyVVL8EeIGS7m4YFmunqQJcLzQZWROsKXqmNvUrT1PSsgRRHeDgBOke5b6ZV+nBhuPfmIJJlxdPO+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0gurxlY94DsAyyp1OoFwB+Vy1YkbvIgxIp/GkEJeb3SIyBFDe
	NwwrEzR+XxusSJsSuccSE81AzhntWGUIqUitzw3iHido6Vpe06Sqf3l+
X-Gm-Gg: ASbGncvhQmw+IdKWNSySpCF9Es/c7Gz/L46V07L56826GWn/Q2Tx/WQglQ8xq4rNJch
	INvgCScWpq0UmSY6z37X8mAheW7lr77FeaVoOwK3b5GcSSOhWKgofB9Frcscpcw+PpL4HGDvlTN
	aSfSykTtboA2qs+BWIZ0SKQg5bA8+nC5h/L95S7fLLEk0qjsAUokZhUGxSTRpkcvR8ZiWGeohDR
	HnWpVQSXmZR1zBDi2hdhXkk46waYUAQ91S1YjSHvkKVd1xdrwEOMLdRDv14P8tUKNm08LXL7Czq
	8Mb3Oj9yiOuZKcp1H8AXnIsSDeviE4CEk4vmw7JYGmx6LtogKhRKkk4bqRvxD4dFckMbgCd7xwo
	s2mXa75yLCtt5P4sd20fMj2mGzIjcvoO5tw==
X-Google-Smtp-Source: AGHT+IFCIE32gRqXCK2cxP5jJ0umVullIbqtBAeMOiAN/1dBA/vOuBTNpHuGFamrKvDjEfmo1r30gg==
X-Received: by 2002:a05:600c:1e87:b0:45b:47e1:f5fe with SMTP id 5b1f17b1804b1-45b855c0d3dmr80790615e9.34.1756819378791;
        Tue, 02 Sep 2025 06:22:58 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:22:58 -0700 (PDT)
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
Subject: [PATCH v3 3/9] crypto: sun8i-ce - remove unnecessary __maybe_unused annotations
Date: Tue,  2 Sep 2025 16:21:28 +0300
Message-ID: <20250902132134.3287515-4-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
References: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_062300_327376_5DF43F02 
X-CRM114-Status: GOOD (  13.68  )
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

There are 3 instances of '__maybe_unused' annotations that are not needed,
as the variables are always used, so remove them.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c   | 2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

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
index 79ec172e5c99..ba30859e749c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -1062,7 +1062,7 @@ static int sun8i_ce_probe(struct platform_device *pdev)
 	pm_runtime_put_sync(ce->dev);
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
-		struct dentry *dbgfs_dir __maybe_unused;
+		struct dentry *dbgfs_dir;
 		struct dentry *dbgfs_stats __maybe_unused;
 
 		/* Ignore error of debugfs */
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



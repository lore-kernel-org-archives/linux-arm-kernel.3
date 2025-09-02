Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF156CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ElWdGUyg9Q9uvasE/0knQrvGqeT+AHFO5zlC/AHADc=; b=l30qLKr5bV+tzX5OmvYvTJ4DZh
	yPZ340EDhTx6+1H9LtBtV/f/SxCINekibMbQYDTz/2R9FTZyPLUlxcQejHL6HXW/j1pJetDnXEqAd
	1GfrqoOB80W3ec2ma2NIvDrVviJH9iXcOS9543ESejaQsg29DQpKEq1i47X9KN92F9NioEnw3ZQrC
	BqdTBNybOJYdxuNuhpVkLnosSKq1hX+mFLxq4UCLXOBqMmqr2OLvEs5DJcc5E0nInOY1W/dRM6PS6
	MLkl1Ap4MuWdv2g8EtDu6PJ1j5YVFUOEas6EoSV0t53wfc9EX5nKRiDZOPS7u3D8eGiNdkhwBnm3H
	K0ydfayA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYlx-00000002AN1-3LzH;
	Tue, 02 Sep 2025 21:42:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQyR-000000000xQ-2QG2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:23:00 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45b7c56a987so17106815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 06:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819378; x=1757424178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ElWdGUyg9Q9uvasE/0knQrvGqeT+AHFO5zlC/AHADc=;
        b=N43dDjq5DgX7Ux89Rr7sNdSZlqTCoA1NdCC0vd63lemysua/WhHrMa6MIYdF3A1DDp
         J/OirKUlMx0f+zxHeG7UKvU3J2o3diQTOf9csTiwGPzZSnCvC+aojeTWlxgcM8JVzKIi
         rVNqnz9qAaGeO50RSlQTorpjxjLMrGngNW1H57xaLRh+se5yZmdnt3RrerKHP9ZgrJbV
         /68UTMrQF0H4u64BwCWBkYvyNd1+xHdlOa4XJSctneL/t5M/wqr5cJG/vfulusnW82z7
         VUDiM8NaKZArDRINbIOfqandOnk/tZCN3k1v/f8em28OyDlHUePR5PnVs82bLvpyIHxN
         X/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819378; x=1757424178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ElWdGUyg9Q9uvasE/0knQrvGqeT+AHFO5zlC/AHADc=;
        b=Mq9aLUk0dpPr/Q65UJ03BliS3JbIjkBAVK0xa+scZ0/WHQunkgwHfbSKuXxC/ZpldL
         rfkbYaOnxDjfrH+khaxBpa9rMMu7LI5hE7I1CB1NysYx2VEwcm/a2qf9FC5gP0f/deoC
         dknxtCtXbndJnoxWiUVy94+y9nb7FRo3pYAFG0kkY9zCzmsVjnPr05NqnkQTSbMuAUEy
         4kwp6GouBxMpcF6uw03ecGazFAxHrNkQ3iBFUhX759CxErP9qf3hPECaojOzMHodVEOv
         ca+kz7Q6i3GP6eL2p/M1y3OjEeyYRaP4G/3FGLfB8hKkRH5lKBwBiMjEtmfBmgi6QmLu
         qiSw==
X-Forwarded-Encrypted: i=1; AJvYcCXTNO8jzdxAogvRnsr6wmRVQKi/yP4mZ+6kIJn5zahj9CYy3nKSyLkO+dAVbXFpyROy+dOMBhVnVBlcOMMpZm+6@lists.infradead.org
X-Gm-Message-State: AOJu0YyP8ybQdEIa6rQ4eC4+p7Ow6s3MQFfYXSWg4LRX/L4DDkx17FQY
	zRErQMZjT+JvrbyCLjmkcSsjfuk6HW6X1wKJ7ljR9YvpRXTnyGD0+RKn
X-Gm-Gg: ASbGncusV1+yDEfABMASP3wAAgCJ8L5+MRmDzYa349fPvCxg5WXMf6vlp1YF/1NkyNZ
	ZQgsCjJ2S8BKnB10/J1W0VLRiW/TkgfdcVLDqb26Mr5EpoZTWobWc8bHltYPHJDl99omgY5mACY
	B+fbIh4U/XMCcqvuNkZBuiqtCLSifh+wXo6+RIclUYYOin2mNQ3VC9jVM3z6OtGROJzEObSFWcO
	cCOEh9rtiEea351dNzyTReisFf4pAWbkPYXxLBmC8qPL+YhmtYLXXizzovSIkWpm9Uc5A6epKel
	jpr0zl/72JSD8bdV2daALHgUssBZmWaG6hkQWm5CZR5VCaIHRy/3pfHyEDoG3EiScheX4gjZ4nj
	YIF+w4Av9SKzqW39hRVvTHNUiEu4fcRG2eQ==
X-Google-Smtp-Source: AGHT+IHcyDVYiBnpcbLNKDERC0dfFteGZiJ+qGt3KiUljAkJChMcYHaPXwrQyaik6ZY9zKUEaa9wZw==
X-Received: by 2002:a05:600c:4c06:b0:45c:4470:270a with SMTP id 5b1f17b1804b1-45c447028b8mr66195e9.9.1756819377579;
        Tue, 02 Sep 2025 06:22:57 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:22:57 -0700 (PDT)
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
Subject: [PATCH v3 2/9] crypto: sun8i-ce - remove boilerplate in sun8i_ce_hash_digest()
Date: Tue,  2 Sep 2025 16:21:27 +0300
Message-ID: <20250902132134.3287515-3-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
References: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_062259_616628_A5D901D9 
X-CRM114-Status: GOOD (  12.08  )
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

Retrieve the dev pointer from tfm context to eliminate some boilerplate
code in sun8i_ce_hash_digest().

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Reviewed-by: Corentin LABBE <clabbe.montjoie@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index b26f5427c1e0..61e8d968fdcc 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -238,19 +238,15 @@ static bool sun8i_ce_hash_need_fallback(struct ahash_request *areq)
 int sun8i_ce_hash_digest(struct ahash_request *areq)
 {
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
-	struct ahash_alg *alg = __crypto_ahash_alg(tfm->base.__crt_alg);
+	struct sun8i_ce_hash_tfm_ctx *ctx = crypto_ahash_ctx(tfm);
 	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
-	struct sun8i_ce_alg_template *algt;
-	struct sun8i_ce_dev *ce;
+	struct sun8i_ce_dev *ce = ctx->ce;
 	struct crypto_engine *engine;
 	int e;
 
 	if (sun8i_ce_hash_need_fallback(areq))
 		return sun8i_ce_hash_digest_fb(areq);
 
-	algt = container_of(alg, struct sun8i_ce_alg_template, alg.hash.base);
-	ce = algt->ce;
-
 	e = sun8i_ce_get_engine_number(ce);
 	rctx->flow = e;
 	engine = ce->chanlist[e].engine;
-- 
2.50.0



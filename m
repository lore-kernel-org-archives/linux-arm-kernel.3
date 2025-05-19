Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BEFC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzPLTyR8BLY/EVNJO6GgeWhpConHv27PYp6Y5vYD5J0=; b=Yyo6PAmdjeHYn4aII8o0+TE55k
	4GwUcEnwZTtjNHDmPUgisVUKoEFLv4drz0hqV535JzyplExsBgQiVa9PslwPpgxKpcZu0iSEhxgAR
	fEKIWRQ8yZGqEWigUc0ba0TjinEOaBFl5G/JzbLB9d8uV8whJTmEAImF6BDLrblvmHmj6tRfWrZ34
	8nQTI2ztJAZB4r6V5fVkoOAeDz2Fb37mWuLKY33whORdLrmSMtRyb+vARjiXrViSi8wlkvlyFyxbz
	mLAZPOZIdVc/QtRXd3MTM+/x0m+VpqMrv/3y0sOUiQAclPetx01OTSY56QwqjUVumRPgSmtpknGcY
	fEFedCiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH38I-00000009lIQ-09ln;
	Mon, 19 May 2025 16:14:30 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2CH-00000009Zgu-16qw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 15:14:34 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ad5740dd20eso183345066b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 08:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747667671; x=1748272471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzPLTyR8BLY/EVNJO6GgeWhpConHv27PYp6Y5vYD5J0=;
        b=iug+5Dc4ds+1+lE4pJCXGf/n/EZUgGxGAkzhuLwxt+bmvFgUdfPcYIbfa7a6mvwafW
         lWCpOjv2WJDm8IUfUSRzR5rs5/uL0V2hhpwQXMIK9U3t3NhGi657Ztu4ckbeoXubPnWF
         fg05LIVpvcjVEcvXzATxVaF3UPYR3bA7bvmM5HvQwIgORF/Y046MnWtTMUw8SoJqCSu4
         zDN/Wql2mX+ND9ef6qm9ZPMTdoL6nUpSUDw3iSmk/uHeMvFX1BrjD/jEh/Q++6HT7TTf
         Aa9Ge8bXsn0S2OSjXkuFl+aE4BbSQTmunCIIdmKVwqx5FGopMC6H+BiV+72NIirfMqhT
         l9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747667671; x=1748272471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzPLTyR8BLY/EVNJO6GgeWhpConHv27PYp6Y5vYD5J0=;
        b=IHDKW4jHaMk8qlfXpMd2B7hpMM5Z7fh2wZKB+4gA45Gzgx8QRRof4TG7kFpKC9VxOH
         ACEGF5LjQcbyY78jc8tWD9D+3ha9geqmBY+EBwCQ8H9GyNIo1X1DKP3XeIspCXehluok
         P4yI/OUmz+lgNfD4uwGw69mMH9OoFR5/nPICaVAoYKjefRia0o7wQuciy5aJ9XzaWvQD
         ZDDu5zglw7JYB7At7nA18g5Tzqn0IxpZI67C7AB5T0mRmsyNupu6D9eqq5YHEqzndf1/
         fxeXd7ztlbeUpaSbc74oIDKQpKBNS4eN0lx7cy5bCw2Lkcv0xo7/rt1pHQ0IQZ9EmCfR
         JlsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl6vx8Wgk+edGCA8rRNEApc+LSNwRw8Kyq1G4pfnvvJLK0zVTmBJCUgxDfT1BJPjF0C6V/soEx9FyjddLXgMnT@lists.infradead.org
X-Gm-Message-State: AOJu0YyXTLP/vbqCwLuFx+U6hS/bNdOac1MgRM8vJM6xSTHsPdP/gFaO
	4FuUEgiSPo8KF7DbKDJ8F3syC6eviC+jMYVc3sVkmm23mrAxmlNv4r0M
X-Gm-Gg: ASbGncvu23FNqb2k8CUazCyqekyC+dwKLBk2aP8QzXn7AzLCt2Q76Mfy0r4H9UddAkW
	u/6ojMJHaMkOcryJYlMEJECuV1zqWbx3q3lTgczjL6Lq0d5HwsnzxRg5AmbDgP8Hdb/qvc0Cvbj
	b/XcGVVGybKBGj/MErrH5MuZl8/SYFVJCeGs72RmmAsoau/egWjrTNHbbQcF9a37ngbIImRtU9A
	2700mOK4E6Dh+ythJ3RfqSU5iLWlU+eJOcsk3H0C53QN2gef81dWKyV7wRpKcy65RTtzH2rfA0Q
	6t/JdaupgCJsH2udGCLI42T1eAKLT9oLP2baLK05TyUo8VDwRcX1aDA0GJAveBVauBm7KOUNIZR
	hw5U=
X-Google-Smtp-Source: AGHT+IHgJ+seY57z+XoTNGawx66JWeSgri2TnpAdEN3iSpX2I08ljlzJynMEjU7v1ngmRpqeLCLRKA==
X-Received: by 2002:a17:906:dc93:b0:ad5:6ca3:c795 with SMTP id a640c23a62f3a-ad56ca3cb15mr472987066b.33.1747667671489;
        Mon, 19 May 2025 08:14:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f07:610b:a400:6472:d2f9:d536:4c30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b08bsm608522566b.13.2025.05.19.08.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 08:14:31 -0700 (PDT)
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
Subject: [PATCH 3/3] crypto: sun8i-ce - use helpers to get hash block and digest sizes
Date: Mon, 19 May 2025 18:13:50 +0300
Message-ID: <20250519151350.3442981-3-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250519151350.3442981-1-ovidiu.panait.oss@gmail.com>
References: <20250519151350.3442981-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_081433_301240_380E7127 
X-CRM114-Status: GOOD (  11.87  )
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

Use crypto_ahash_blocksize() and crypto_ahash_digestsize() helpers instead
of directly accessing 'struct ahash_alg' members.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index bef44f350167..13bdfb8a2c62 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -342,8 +342,8 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	algt = container_of(alg, struct sun8i_ce_alg_template, alg.hash.base);
 	ce = algt->ce;
 
-	bs = algt->alg.hash.base.halg.base.cra_blocksize;
-	digestsize = algt->alg.hash.base.halg.digestsize;
+	bs = crypto_ahash_blocksize(tfm);
+	digestsize = crypto_ahash_digestsize(tfm);
 	if (digestsize == SHA224_DIGEST_SIZE)
 		digestsize = SHA256_DIGEST_SIZE;
 	if (digestsize == SHA384_DIGEST_SIZE)
@@ -455,7 +455,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 err_unmap_result:
 	dma_unmap_single(ce->dev, addr_res, digestsize, DMA_FROM_DEVICE);
 	if (!err)
-		memcpy(areq->result, result, algt->alg.hash.base.halg.digestsize);
+		memcpy(areq->result, result, crypto_ahash_digestsize(tfm));
 
 err_unmap_src:
 	dma_unmap_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
-- 
2.48.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93C3C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ElWdGUyg9Q9uvasE/0knQrvGqeT+AHFO5zlC/AHADc=; b=iUfX3iphURuYbD4CkXVTYB5S5p
	MCtCqOhg5kfBGcFdniYn0gjU9pVIpOW7ObN5apGWW/gjp7dMeaZ8F1uAcwmCPLzGa0n1q70Jq+onR
	nV1Rdv3Ey66JJjJ2djwK2DnOBNeaJT5cQn2V7UNb4sL8n9y0ow6is8K+IJ9gu1s76mWCiNl+nnNsa
	ugMtWD9RC9Bl77U8+/FUm0YCfHslm3E3iCw27A8J/8wSFH23aq6P49fbXWfUtuJYCgXa10DRBAe6f
	OmFIy03cNwuffjdDEDJ6HaTTgoq2tlrTHCN2PNGTPhH5c9fTYI40tAQ7b8Z0rumWbfoe1+hbMPy6R
	OHWnUbPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHau-0000000DmmQ-2o7U;
	Mon, 28 Jul 2025 06:44:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugH1i-0000000DjHE-0jAC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 06:07:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-454f428038eso35349615e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 23:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682877; x=1754287677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ElWdGUyg9Q9uvasE/0knQrvGqeT+AHFO5zlC/AHADc=;
        b=mJxRHdzfktuLyVk/rLcu8sciyr5VL/q51aowPdlplMNYk2XQCO78/vemIh+8iNcyVH
         +uMU/B4LufsCMh6wBx9V8/bTSEEFBvI1U7B1jaPGjw6b2XncZSA5MoxKb9zNeqVNfgT4
         CJLgG08pGv78IlmApXDp02Fj6dka+//o5nsqs42yl3uhbqrQowFHyJ20YfJFV/Dtiv4+
         0kiDqxrQzyGAaXGBG2HN345YL9Zj3VZ8OEjsStB//Pma30gPrCo+DLnjG0Bpwyr06V5f
         /9xCUJy5J5a3204iAYMtpn4uP1GqMN0SwoMF3Pk1aKstJASeHcFhSuXGOJIeuDVEtFa1
         odFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682877; x=1754287677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ElWdGUyg9Q9uvasE/0knQrvGqeT+AHFO5zlC/AHADc=;
        b=DsbiOniGd3bAp0dSlONdHv1l6U2gDejRveIaNpLXai9WG9cw0tzOskFTfjni8WyPNF
         ayEfyY70VawI/DMcS24RU9Z+23E0epYAAa1iHtH1ZdVkj31FA7fGAwjFp5ekf1LuJBT9
         5ZkMEtAefylxo+BVQWvdnp25GvAqfi7d7j2bUpcl6LwOFxWyNy4KF0d8umdZIC72YURc
         KPxjbdnqTbAkUxLCHbMKMudbqZDKy8cF3FnKr0Te7cPyiGEI+rZVSgqv3Q1VmZzblT8k
         /Kwbg+4z//kwPygbzNksjv1NB6G2V8uGVRVudBmfjqGoxKSlBHrXvwlvTLm1lZM77w+6
         70bw==
X-Forwarded-Encrypted: i=1; AJvYcCWgFjtHrAIT0yEcfVaHMnYCxl4AdgdDKmS4Rxb4+Mk5j3E2zrxLZ0QeAYVkdVkecUrEXcpIiq4BVprD9d+zfbE+@lists.infradead.org
X-Gm-Message-State: AOJu0YwD+ph4vOApgXR4zsSVr4AWWlEhU46+0BKp+Ezy2TqWrMlj7hB+
	Ojy7G4HcEMmOgxs5ps7rsN2wsX1Jl2XcUk6rOAqIhbBkVLq11sWqmLY/
X-Gm-Gg: ASbGncuN7xvo/IBxOadV1rYgLoS1DMGax9MPtafeqzNgncOuMmYyS0zMnFPPbkIatrn
	+VWnlDetBHCqPytyXQdks3xcajaiEUlS2gy2viHFbLeYw+B2YVMzgIJn2QzY7J7GYBJgOrCVITD
	caEPSiYYz2GSTzEBe1/TBCYS7mcdgWjvoS+h65NrgaCDYsQ/3ezbQbY2/Z2NcKSIJohQae6RxqX
	25B6+962MTqougTRlH3AS7t+3NGQNG5gLyfTIiVXHKSp/QlBNPoGh+pf/LWuiXHiXzGICls9JCP
	b/t/+oW1dI4ZrWCwL9u+gOQojZJeMOyM3u2/MjoiVy0dL0+oA1P2u2WOhugk2Bc+EaS4kmon5SI
	ZC8y81l3TBDYYkXhgpcgvOKoU3WsKTS2myg==
X-Google-Smtp-Source: AGHT+IFJw3EbsUDLtQA1ecwg56WxcbMEO+eyP+FEUWh83ffWtoZBkFf3rr8tJhzBHJdAJ6osjr0sWQ==
X-Received: by 2002:a05:600c:1e1d:b0:450:d4a6:799d with SMTP id 5b1f17b1804b1-45877445e1bmr70270965e9.7.1753682876514;
        Sun, 27 Jul 2025 23:07:56 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:07:56 -0700 (PDT)
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
Subject: [PATCH 2/9] crypto: sun8i-ce - remove boilerplate in sun8i_ce_hash_digest()
Date: Mon, 28 Jul 2025 09:06:54 +0300
Message-ID: <20250728060701.1787607-3-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
References: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_230758_215641_B34C5BFA 
X-CRM114-Status: GOOD (  11.27  )
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



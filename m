Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC26CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XM9OSoT7EEhuPBZA6neX1BQbhTIUd6+o400NZdJKrYY=; b=l24VsRO+U8cqPzyDqr0BwpJ5IN
	4iWsa80q3WVHb+ak+Y4QE24HyZwgDlGx3zGDtnD1ghnCpX9xdwOUUowWP8UaC2zZjtXZ+4ucYZjLW
	gkn/G+qU60wBcaNlRtvCZEAmQvWqJzdCXwBg0mF/sm4j3/DIwlV4F3iXhOqY/t17TwqRnuPuUDkAa
	eR1+1SbxFJWFMEb/JEU+6XjSLJMTG8Z+/xK1dpc9SDToZJBTZlT/ADuWVfPzXLNtu86YHS5y6FRKr
	eZN4jYdvZFYQI2lpQTPMV7T2xBwjvVpSCCrH+6Re0scGFJ9vXnRBY6D1eOUmG1szr5uI/8M5BzEOy
	6eJzrjWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWOw-00000001bLQ-3dAB;
	Tue, 02 Sep 2025 19:10:42 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQyX-0000000011p-1lJz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:23:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45b8b25296fso16218585e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 06:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819384; x=1757424184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XM9OSoT7EEhuPBZA6neX1BQbhTIUd6+o400NZdJKrYY=;
        b=Ezy5suVjmaNVDtuDoH2v/zJP2PJCA9KyVML0Hjp45kezkfZUiMYb6Kk//Y1VCK+bAK
         p7G31xDIwnCEmds5MtG12i/Dqv9xyTB17BosuFFkYC9anZXj2C9y7F24JH2n1w4Fw2FS
         PqnIQWbc/ZSZcawhwCFYoQ6Qz79BBDLjf0w2ZhazHSMn8v+1LNu97nbUW7pnFj65cmHJ
         p+ZCDbGTXsHtqqAuRkcYxBQCJB1GIloRDDJ+iu/7s11RaSW2ryK9pxxydVy068SbLAXZ
         F0D6kWnOiX1Yf9cZO8v9egU3qRiO3p9dWM5MTCEPJpucMow3spb1E/SrOodO48fr56Gf
         JtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819384; x=1757424184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XM9OSoT7EEhuPBZA6neX1BQbhTIUd6+o400NZdJKrYY=;
        b=O0fbFMkOSwKDeempL9FIbhWcP15xK/bPicEI3keyUcAsFH+qCqh8XK5QaQDL6CCKfQ
         lPZej9T4oc63t8qtn5VnA0xgLw0e2HoH+RYVrCFr1peo0kK/AQQd9IFvRxw4sbkFgLWs
         HN5s7Kr81adq2cdkQVmff3rT8uS9PuwtYUnpDGeWQN0Sv/Fj+YqOGy1FBXHRdwQv0Squ
         dkGPbsnfO73bU+nEUq7CSAhe+EN7FgPkINtnED6MdNq3YPykCWn0xm+EJCqAfAAbtI0b
         GzVU+bngjJAsqF5rzVntJU+gfc4iMLlk1m5uV4kGsT+wB5divhTHrtlAVeuwjwJA0one
         Nuug==
X-Forwarded-Encrypted: i=1; AJvYcCVvwyIlzImidJhgVvdQs+Hrf5qXh/JyLakbrlKu0aDD2rl/WR+DfF32ftAdkU2Z36IfM4GtKKcIwMkhM1Sw90t5@lists.infradead.org
X-Gm-Message-State: AOJu0YzzzlWACnUAxF6th4nJjFvYNwE7CxoJJKl3rpXuoveO/6UhNkiG
	ChSLqPfp7CauTInsibH4JD78ChsFqEYbhC9QNp+QinrjqXBvx10xSQmj
X-Gm-Gg: ASbGncuJyDh3ZPBrKv/f4PbCxHWrLQmUoKN+pRWRxACtFg+KpqrUyeH/JYrHD1frpoY
	MIbXJbDVKl1m09R7S3PmBAp99ztmInmGLyaxvTRcJKNPUZEjzqf62XCOYyNORaCsGnjI6GglsTM
	13nrbaHodZ/Sf7n1ym5JyDdisuS57oHHQe86DZ7+bmg8KcW3ChgQwKZHAU3ahjljEXr2Wl+DBGn
	+kWxlOSkoGEe7LF3WrK88sVR8T3dHni+R5pZXMT3/IaAxtTxySqoQr32tz4NnR2xsKvbpDva+4T
	wVo8fVP/lL9Znb0PXyfJoTPj4e+RnkjAIEq4gZArf00MwQi9qMa5+9JTWNj7kRs/sM6A8hwDJI5
	d13J+a0jf8OsCVVaWjFxrvDDkuIo3uD4ZdA==
X-Google-Smtp-Source: AGHT+IHcOusuOZbxetLEUJAQpcS9Gkujl1YTX1DeE+tYFW/iEjj3AZ0hRgYLZeeDGlNURGNUHbKE/g==
X-Received: by 2002:a05:600c:1f1a:b0:456:1560:7c5f with SMTP id 5b1f17b1804b1-45b8554f88fmr83630355e9.14.1756819383829;
        Tue, 02 Sep 2025 06:23:03 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:23:03 -0700 (PDT)
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
Subject: [PATCH v3 7/9] crypto: sun8i-ce - pass task descriptor to cipher prepare/unprepare
Date: Tue,  2 Sep 2025 16:21:32 +0300
Message-ID: <20250902132134.3287515-8-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
References: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_062305_471381_414375C6 
X-CRM114-Status: GOOD (  13.80  )
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

To remove some duplicated code, directly pass 'struct skcipher_request' and
'struct ce_task' pointers to sun8i_ce_cipher_{prepare,unprepare}.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 33 +++++++------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index f63d21cd1e52..021614b65e39 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -131,21 +131,19 @@ static int sun8i_ce_cipher_fallback(struct skcipher_request *areq)
 	return err;
 }
 
-static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req)
+static int sun8i_ce_cipher_prepare(struct skcipher_request *areq,
+				   struct ce_task *cet)
 {
-	struct skcipher_request *areq = container_of(async_req, struct skcipher_request, base);
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
 	struct sun8i_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
 	struct sun8i_ce_dev *ce = op->ce;
 	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
 	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
 	struct sun8i_ce_alg_template *algt;
-	struct sun8i_ce_flow *chan;
-	struct ce_task *cet;
 	struct scatterlist *sg;
 	unsigned int todo, len, offset, ivsize;
 	u32 common, sym;
-	int flow, i;
+	int i;
 	int nr_sgs = 0;
 	int nr_sgd = 0;
 	int err = 0;
@@ -163,14 +161,9 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
 		algt->stat_req++;
 
-	flow = rctx->flow;
-
-	chan = &ce->chanlist[flow];
-
-	cet = chan->tl;
 	memset(cet, 0, sizeof(struct ce_task));
 
-	cet->t_id = cpu_to_le32(flow);
+	cet->t_id = cpu_to_le32(rctx->flow);
 	common = ce->variant->alg_cipher[algt->ce_algo_id];
 	common |= rctx->op_dir | CE_COMM_INT;
 	cet->t_common_ctl = cpu_to_le32(common);
@@ -314,24 +307,17 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 	return err;
 }
 
-static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
-				      void *async_req)
+static void sun8i_ce_cipher_unprepare(struct skcipher_request *areq,
+				      struct ce_task *cet)
 {
-	struct skcipher_request *areq = container_of(async_req, struct skcipher_request, base);
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
 	struct sun8i_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
 	struct sun8i_ce_dev *ce = op->ce;
 	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
-	struct sun8i_ce_flow *chan;
-	struct ce_task *cet;
 	unsigned int ivsize, offset;
 	int nr_sgs = rctx->nr_sgs;
 	int nr_sgd = rctx->nr_sgd;
-	int flow;
 
-	flow = rctx->flow;
-	chan = &ce->chanlist[flow];
-	cet = chan->tl;
 	ivsize = crypto_skcipher_ivsize(tfm);
 
 	if (areq->src == areq->dst) {
@@ -367,16 +353,19 @@ int sun8i_ce_cipher_do_one(struct crypto_engine *engine, void *areq)
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
 	struct sun8i_cipher_tfm_ctx *ctx = crypto_skcipher_ctx(tfm);
 	struct sun8i_ce_dev *ce = ctx->ce;
+	struct sun8i_ce_flow *chan;
 	int err;
 
-	err = sun8i_ce_cipher_prepare(engine, areq);
+	chan = &ce->chanlist[rctx->flow];
+
+	err = sun8i_ce_cipher_prepare(req, chan->tl);
 	if (err)
 		return err;
 
 	err = sun8i_ce_run_task(ce, rctx->flow,
 				crypto_tfm_alg_name(req->base.tfm));
 
-	sun8i_ce_cipher_unprepare(engine, areq);
+	sun8i_ce_cipher_unprepare(req, chan->tl);
 
 	local_bh_disable();
 	crypto_finalize_skcipher_request(engine, req, err);
-- 
2.50.0



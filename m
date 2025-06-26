Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C63C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfOFmSReN1wX8YEf6gXPwdHyf/C+wiQacKthqWE/o4Y=; b=ew61/2hFMrL8v4j9zI1bL+gldb
	67iqmuSuB56mfJQX5WFqoOCrNIEMWPGsBXPw2QGIeUVW1jVWdTQEKpd+Q66zr+AbsPevd30i6AwCB
	i775bskSd36Kqd5ov6h0h718+pnR3u2U+b0QRn+OcQ176I02XtAtU3eAZjk3z1/+VQLdN1cpTSSIp
	+G9jyuLB8CPnmHy1f6SITyMgjgnsMGA7wE/CEh6wzISfeL4a5SJFnCsncLvyT08FROGx6TFcn/BAG
	rm9iM/LsQtZdcBN5jci8S83SpAI+xnizaEqPvf4Vd4qDFQdKeUhZZsk4cts7pfG8ajfYJ+fq8fgFs
	dMsXrVxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkh1-0000000BNzs-2T7o;
	Thu, 26 Jun 2025 11:22:59 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjOB-0000000BDuC-3E2c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 09:59:29 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so153986966b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 02:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750931966; x=1751536766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfOFmSReN1wX8YEf6gXPwdHyf/C+wiQacKthqWE/o4Y=;
        b=d6BLO1S+VaD+WGr3uU+WTmHwZ02ApAfsxWNIMYQuq0kj6HnwtGB4fhrA/7cDPPtYQz
         rLAuEXM1u1SXuD/YI0H4xclWAHQcd1txMPmEMoB3eGkIM4miyHo/iU3a6XIsdqMNrNgO
         WmQMxBztpNoE5IS49jdMke6YKY3Kr8lQJkLh/CWg7HH/U1WjX/JNNEbr2zqBxx112IdB
         iqgzOCDiwqTwjRC7OcukKoLvvYp9+4c9GGhgaQ/18kbzDy/sGIXdQ/WsniI8t8UWgSMo
         68ouend4nWRraRk+Bj0Nce/eEi6BuUc5jD4V5RspJluynvSxFoSEAnJ7iX5CXSWqie7e
         Q8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931966; x=1751536766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfOFmSReN1wX8YEf6gXPwdHyf/C+wiQacKthqWE/o4Y=;
        b=YB3raD8SUqak+lvosk4qbBXSXt84BQK9zEgvOX7dSPRaGh+0JFiNWtvXxP8sEY4mJU
         qtgvKMMNJBAgDvBAXNujRHCyf/dqybkxOsIvOHPbVPlqHbq+vPOWLklRKcaGR0nH7+sj
         gj/vPGDVlknCSXYEzvXzf4Lf066UD3ElT6Tf9vS0/S0B/KaMWea9dJfZuBj/b8AuOrsq
         AK6VVUoE4BjOqHBjBRhjnguk/rrIKe0jrzJbXr9BoDtcjOgg28h1AtrA/O0jIzMl9IFX
         wP0ciPKf35Id9lpeGPXd10mr0+VgT63LZ5s5O0BrmcTz2mARg4jlaQJ3YtevMXd824ac
         j7Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVt5ViYHfi4mI9sPK0YJs1ImxOVgD2ZHg2K6h8wVa0TWaC+p/Y44jxaosEk5S0lwy6jMJ3BoZDzNwVbhrIQbISO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5A9OWIN+AMne8CHyRKs26sDGwUNiDykQmTV6N20Hf9e5VIyrv
	xosz23eImAvFZX2/oUPrJTRXM9xBzfP2TCQZCE7bPOIrZ+2WcrejJm+C
X-Gm-Gg: ASbGnctYxmatPIyyyAFE/M3HtaSSBILWgSPRn/RPy4NylC6vyqCGF/eTnJPuB1LrbBK
	qi2FNojW7TcFm3GaX+R9lYtGY64Fi0Fr26d6HcNGEHwmXVWrbYT1IwMxuPRaiIMyf1zA+qwB5S4
	2vwCWmbaLm0e069eZ7lYdBaR7r7+jOk8S1Y2aOu4+AD3emQBeRFIMv7U+/QdVEQYfavD7cxUl2a
	JnI/lomh2wx9IPEEuVT9qHp8S5LM3lmudTeq/eYQukpoU6dWB01pd2vOBlfQhDjNynFkUqV7Sef
	vpkHfJclWe3YxTXX1yArYHxmGagZaTSNve+DYR1yOkrFvtjJW18Oxw2oh7P7wJO1RFQBRb0vylT
	pVL3CsYOWeVtAgtTQQR3zo7z+
X-Google-Smtp-Source: AGHT+IHpLn6aCPnOPWyRWC4lX3V76l2fWHzGHcZP/K3tw1wy0XjyFByxeww30mlPPfNzoaWZ+4XQ7Q==
X-Received: by 2002:a17:906:390e:b0:acf:15d:2385 with SMTP id a640c23a62f3a-ae0be84ee1amr611692566b.16.1750931966229;
        Thu, 26 Jun 2025 02:59:26 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae06aa5ff34sm1014106166b.40.2025.06.26.02.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:59:25 -0700 (PDT)
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
Subject: [PATCH v2 07/10] crypto: sun8i-ce - pass task descriptor to cipher prepare/unprepare
Date: Thu, 26 Jun 2025 12:58:10 +0300
Message-ID: <20250626095813.83963-8-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_025927_824702_07C6A635 
X-CRM114-Status: GOOD (  13.91  )
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

Rework sun8i_ce_cipher_prepare() and sun8i_ce_cipher_unprepare() to take a
task descriptor pointer as a parameter. Move common flow setup code to
sun8i_ce_cipher_do_one() and also remove the crypto_engine parameter, as it
was not used anyway.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 37 +++++++------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 5fdb6a986b1f..d206b4fb5084 100644
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
@@ -362,20 +348,25 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
 
 int sun8i_ce_cipher_do_one(struct crypto_engine *engine, void *areq)
 {
-	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
 	struct skcipher_request *req = skcipher_request_cast(areq);
+	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(req);
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
 	struct sun8i_cipher_tfm_ctx *ctx = crypto_skcipher_ctx(tfm);
 	struct sun8i_ce_dev *ce = ctx->ce;
+	struct sun8i_ce_flow *chan;
+	struct ce_task *cet;
 	int err;
 
-	err = sun8i_ce_cipher_prepare(engine, areq);
+	chan = &ce->chanlist[rctx->flow];
+	cet = chan->tl;
+
+	err = sun8i_ce_cipher_prepare(req, cet);
 	if (err)
 		return err;
 
 	err = sun8i_ce_run_task(ce, rctx->flow,
 				crypto_tfm_alg_name(req->base.tfm));
-	sun8i_ce_cipher_unprepare(engine, areq);
+	sun8i_ce_cipher_unprepare(req, cet);
 
 	local_bh_disable();
 	crypto_finalize_skcipher_request(engine, req, err);
-- 
2.49.0



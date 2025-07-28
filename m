Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E421BC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XM9OSoT7EEhuPBZA6neX1BQbhTIUd6+o400NZdJKrYY=; b=o5yNZ4bTQtNuRihgocZRLhc0nX
	4AfSJ0W6SdJiA19dECPXegWQmT7La89yjBEOo8Jo0GrthEzkIdzQMJr0ikGmv3MZzDnQpp+BShPHI
	RQ8P5j8/LpnbJ+YRfdFvXjz454TlxXki2AcqTlG1Gj0eOlsXfZuyCDCO6ZraDwIhQ8tKlbM5d+bRd
	vxo7YUG0N8i4S0XOSPuxSXhX46E+/QyiCAuT36sktu1Jjdbsb9B2e503nusSG+m2zfypIMUqG8DwF
	SMA4KVNlXWGQgUw2NDoNvKGNzATwqt2r/7xpjKhcNi8ciyFampGSX0A7YtfC+mrYDYFH+9itmcGYY
	D9dB63tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHnN-0000000DnsW-2ctZ;
	Mon, 28 Jul 2025 06:57:13 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugH1o-0000000DjJS-3izF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 06:08:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso28957765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 23:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682883; x=1754287683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XM9OSoT7EEhuPBZA6neX1BQbhTIUd6+o400NZdJKrYY=;
        b=KJgJV+02wydbEGRQ6r6kyQDqaytKAlu4Xewt/2gDNnzUq1Mgzy/LBoA0rU1M1kDgJ4
         2QtMR1HD79fmKOM9d2otScuwHGUOVHwgzwSpBljBSckE0vLaLBEk18imW2C7fGZtkjA0
         yFNCQwf5vej6oC9HTclKZ6Z7XDG6wN3DxON+96jRNmwmFAmpOq7NJ5fwMnAWerhjjrxJ
         9VFgssEQgaDBUnXId1ANWhhcwrETf+0nLSoazJL64hg2/mG+xdwRxxU9c09qyxFtO/nr
         cHSw4t2xwSCWQa9nRrIKgTltgCAxQgoI6BeIs4SdcFVqFqOXErgZptV5mEc+II/T/6e1
         gomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682883; x=1754287683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XM9OSoT7EEhuPBZA6neX1BQbhTIUd6+o400NZdJKrYY=;
        b=qRTiL95FUuS8mL93OjWmXlJ5KEC0RNokEEy41GSq9zogAUq+uCNMWOZ1U0WtK1g0Bu
         hiewN3hKoYIJ47QBnp7D1XePpCQNDAR5H7bvqwETZUcu7hRjgfQmUGeQ/49MjZEJCupW
         AE/lgkOtUSGZUxHICiHVqt0BHctzs6JavWyQfO26/v/NAM+XvNXUkg4l3tCuS+xVmZA7
         3nIJwEs3f8J46/kiHsixIpo/K2tly77EkWRz+Wb3my+tPzATHiOoPVZBDzvz6VwyzO8e
         6kCqL8d3nVMhJEzmxU9/0+Hvcnm9vVJVk4l1mc8n2u4Nn9RG9qAi1F5AzYtuVX1x48U0
         jynA==
X-Forwarded-Encrypted: i=1; AJvYcCXj44yZmEaeATL3EywFRWkPb4QHcFaoX5bNSwqoYd/Mnox9fY5bxykQI0GhGqua7NdUWkolrPJ38zNnp0Dag05+@lists.infradead.org
X-Gm-Message-State: AOJu0YxTxtNPI9wKamrZDieRuTJGwrJbzrLysVSMbT0/Ncu9eqSyU+Dy
	lXGTOzUsO+TePeXLx3hYmLzITPTzq1JAVHYjcv3rJ3ApXUut/zEtuoLG
X-Gm-Gg: ASbGncsXNuoS5Nw9vmHEvkHDa4tr0y5iEWQjnJzqFSKKRMTB98uADmrvUZU+EwjfrjC
	VsumbeXQkptUxT/hWEMvxr2DQO4l6dg3/KOWn2ZDPXfLF4jIjBsbmeEmHrgEhm02ez6XESwTRXE
	4gMlr+QZExBV8PN5orlCv9HkQSxCdiQtbgD/usj9JNec4/SaPvAyRz1oN4gOYYNvtDFGPKrhC54
	ozluYXgP/uqCWwE4GV/oowRAyiN1jziiJim5o5WIXxq3K6LRTZdSRPeXJkVLkjyFfzbCneVBgNf
	cDVm2A9yQih7BDNZ7IKoX0MEQJTRApLHLw5Hy4oiMbcXTsLTBmK7KHFd5yyVUdxnyDFINWENgyK
	QZZTptFJvRzb2Ya4dz2Vmg/+3xRsD1XRTGg==
X-Google-Smtp-Source: AGHT+IF4uUDpr1nH7CAsFxI85U0J21VbGx+Pa4bqECbTdmTZSrvcjVZKnUakIVKf5iSA2kR6TptSZw==
X-Received: by 2002:a05:600c:6309:b0:456:207e:fd86 with SMTP id 5b1f17b1804b1-4588459921cmr31627685e9.2.1753682883194;
        Sun, 27 Jul 2025 23:08:03 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:08:02 -0700 (PDT)
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
Subject: [PATCH 7/9] crypto: sun8i-ce - pass task descriptor to cipher prepare/unprepare
Date: Mon, 28 Jul 2025 09:06:59 +0300
Message-ID: <20250728060701.1787607-8-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
References: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_230804_927048_8B32F16E 
X-CRM114-Status: GOOD (  12.92  )
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



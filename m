Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77790C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPkkvVwxFYU+2Mr615PFvFXGtNmnnnpM8am4NYDPd7Y=; b=odw9pHhQbaPO0T7dfb60L3Ci7k
	zooYmtJU+ZRtIBzqeHprputs938RC3vgUldo92oD37Jkfk5imuJmblro/51vd1zUcn1d2oM3YHlJz
	TXT/dz0chzbJTx0mOp4jbAMpchzYt6Fv2bYoTCueTrlHHcWLsshlzpt6Ilw/zsadesM0l1zZra7/p
	zjDxiPp2dNGEWC72l678/9QjvpYwR3mCSJ7WyVAQFew/p2MRStbGYBGpU/CjVMkQESipWoV2U/47w
	ia8JiuHTM/1TyF/nw0DmF5xWcr/ZgDwg7RljdFDUzzG1N6vsdMmHI6qUSbmReclpO0MYLpc2RNxFe
	/v207rGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHps-0000000DoOH-243R;
	Mon, 28 Jul 2025 06:59:48 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugH1q-0000000DjJo-0ahj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 06:08:07 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45610582d07so25393065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 23:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682885; x=1754287685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPkkvVwxFYU+2Mr615PFvFXGtNmnnnpM8am4NYDPd7Y=;
        b=TUm5NUDtw13nwVKnQTfiIUDjeDPbUC4vOxnFyuk/L2DjN5GgrTy0cB1w2h9AxfpUwc
         Mn2fJWCYaanIzsmy8s8GqeYer0FUQ0Px+lBjSakvIWGtF3dDEvUoT/8/zGANePgRFPEb
         NwIHxB9jURcXmkL4/kWmFbJoPOhcu/WkERnbodnSraMk+f2V0yVJgwP4WFcniP+X/syV
         Q20lpOykZoukOnADefn1B3ibMGOWxNQ7pknc+v3OzhZdc2aQGUqVPb5w23gc6euP+95p
         i0QtUnlNG9NGSSxeYXijwg5Y1N4YAic83Hmd4VCzm8hdweEtVRFh/jzlz2yZQ0eyASUs
         XtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682885; x=1754287685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPkkvVwxFYU+2Mr615PFvFXGtNmnnnpM8am4NYDPd7Y=;
        b=PrOQYjaWA/RJstKygbuhxZ0L9SRDjkh7fDizj70wHRJ4/WSR83gnkOVmXh603TOrx7
         NQ1UW0a9J3aJ4tJ1n9bhMnNxJhyoibOF9avosaGR0YNUmKt3JwIP7VGB0cfOpm60LPmY
         hmvpBd5It6Lv1Tp/dnOpFeBc5xsc92NBQfsdCy6b+x6GImFGVEdIccAYVuCd4sEooWkt
         GqCLBMUaZJyAwlmdCJ0Gq2uI1ilfrtshHqENHDnYC2XtY7TyCdWIZ6ESgLdb6IHfHDGV
         H0PLIVqx3fNCYlANUSAvgE3oOEiVfxTKxXNHnJGdF0yeALoh2ixLJLlZbm6mw13CwXeD
         U7pQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2n6JTy6JmJXiYHW3aTuBw1igBmXgSXJ+WciZOuRqLndkeKQbcZQK3jEo1CcC4iybgZQehjDFnCaE+rLhkXqUl@lists.infradead.org
X-Gm-Message-State: AOJu0YwnP8XiO3IANeAEq1u2oP39qayskpbI9sfdmAkcabLnF19tDGjq
	2HqmuOgOz0vdjv8ws6sIj8ETaFVI74R1uqZS/wWdM86w1zteeFJuUHDk
X-Gm-Gg: ASbGncuc1qR8PiSEwRFGy8jvRmStfaknHoz3z1UxRe0Qr1uWL/9H415ueroJDxi9B2u
	YD3OPF/KV+mtPajmYe2xC6a6QOmqhjcNGFVk/Ex5+H8XM58dOvBrditlN/+qx1zExtIqxxGnRQL
	de4gtQbdvQiQpSjpUSoLIdknI23QTpFhxtzfQc+8+KnLNmPc64PKxePhr6Ns15yNO4TwaHOrzY/
	jQmKCoTJnrLHmFAsl8c6uEjChuPA8NnXY2B1frt3GRCTj3yUkzwfEa6MMnSYx1x0dCCr62P0jaM
	ZimqCvKa7pCurM/YUmJDNyBOkAfmA+0c31B+Tc0uaq/RZ0vyC6bwqNgn4S4lkHzoaIiEy0a5eQ/
	Rf7OAK5M4hN2yspEfZQWe5KBDOV93WcFPBA==
X-Google-Smtp-Source: AGHT+IGNHmqJIpVWF51P/BJHTnOzhLLnt+a4s0Kx90Y6aX/0rcrlD4mW+DwtiXOJokQk4AhF1Jdd9Q==
X-Received: by 2002:a05:600c:674f:b0:455:ed48:144f with SMTP id 5b1f17b1804b1-4587630921cmr85129635e9.14.1753682884424;
        Sun, 27 Jul 2025 23:08:04 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:08:04 -0700 (PDT)
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
Subject: [PATCH 8/9] crypto: sun8i-ce - save hash buffers and dma info to request context
Date: Mon, 28 Jul 2025 09:07:00 +0300
Message-ID: <20250728060701.1787607-9-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
References: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_230806_182034_C43564F7 
X-CRM114-Status: GOOD (  18.97  )
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

Similar to sun8i-ce skcipher code, move all request-specific data to
request context.

This simplifies sun8i_ce_hash_run() and it eliminates the remaining
kmalloc() calls from the digest path. It also makes it easier to split
the monolithic sun8i_ce_hash_run() function in the next commit.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 56 +++++++------------
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  | 17 ++++++
 2 files changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index df2acef9c679..e28100c07b86 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -328,12 +328,9 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	u32 common;
 	u64 byte_count;
 	__le32 *bf;
-	void *buf, *result;
 	int j, i, todo;
 	u64 bs;
 	int digestsize;
-	dma_addr_t addr_res, addr_pad;
-	int ns = sg_nents_for_len(areq->src, areq->nbytes);
 
 	algt = container_of(alg, struct sun8i_ce_alg_template, alg.hash.base);
 	ce = algt->ce;
@@ -345,19 +342,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	if (digestsize == SHA384_DIGEST_SIZE)
 		digestsize = SHA512_DIGEST_SIZE;
 
-	/* the padding could be up to two block. */
-	buf = kcalloc(2, bs, GFP_KERNEL | GFP_DMA);
-	if (!buf) {
-		err = -ENOMEM;
-		goto err_out;
-	}
-	bf = (__le32 *)buf;
-
-	result = kzalloc(digestsize, GFP_KERNEL | GFP_DMA);
-	if (!result) {
-		err = -ENOMEM;
-		goto err_free_buf;
-	}
+	bf = (__le32 *)rctx->pad;
 
 	flow = rctx->flow;
 	chan = &ce->chanlist[flow];
@@ -378,11 +363,12 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	cet->t_sym_ctl = 0;
 	cet->t_asym_ctl = 0;
 
-	nr_sgs = dma_map_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
+	rctx->nr_sgs = sg_nents_for_len(areq->src, areq->nbytes);
+	nr_sgs = dma_map_sg(ce->dev, areq->src, rctx->nr_sgs, DMA_TO_DEVICE);
 	if (nr_sgs <= 0 || nr_sgs > MAX_SG) {
 		dev_err(ce->dev, "Invalid sg number %d\n", nr_sgs);
 		err = -EINVAL;
-		goto err_free_result;
+		goto err_out;
 	}
 
 	len = areq->nbytes;
@@ -397,10 +383,13 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 		err = -EINVAL;
 		goto err_unmap_src;
 	}
-	addr_res = dma_map_single(ce->dev, result, digestsize, DMA_FROM_DEVICE);
-	cet->t_dst[0].addr = desc_addr_val_le32(ce, addr_res);
-	cet->t_dst[0].len = cpu_to_le32(digestsize / 4);
-	if (dma_mapping_error(ce->dev, addr_res)) {
+
+	rctx->result_len = digestsize;
+	rctx->addr_res = dma_map_single(ce->dev, rctx->result, rctx->result_len,
+					DMA_FROM_DEVICE);
+	cet->t_dst[0].addr = desc_addr_val_le32(ce, rctx->addr_res);
+	cet->t_dst[0].len = cpu_to_le32(rctx->result_len / 4);
+	if (dma_mapping_error(ce->dev, rctx->addr_res)) {
 		dev_err(ce->dev, "DMA map dest\n");
 		err = -EINVAL;
 		goto err_unmap_src;
@@ -428,10 +417,12 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 		goto err_unmap_result;
 	}
 
-	addr_pad = dma_map_single(ce->dev, buf, j * 4, DMA_TO_DEVICE);
-	cet->t_src[i].addr = desc_addr_val_le32(ce, addr_pad);
+	rctx->pad_len = j * 4;
+	rctx->addr_pad = dma_map_single(ce->dev, rctx->pad, rctx->pad_len,
+					DMA_TO_DEVICE);
+	cet->t_src[i].addr = desc_addr_val_le32(ce, rctx->addr_pad);
 	cet->t_src[i].len = cpu_to_le32(j);
-	if (dma_mapping_error(ce->dev, addr_pad)) {
+	if (dma_mapping_error(ce->dev, rctx->addr_pad)) {
 		dev_err(ce->dev, "DMA error on padding SG\n");
 		err = -EINVAL;
 		goto err_unmap_result;
@@ -444,21 +435,16 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 
 	err = sun8i_ce_run_task(ce, flow, crypto_ahash_alg_name(tfm));
 
-	dma_unmap_single(ce->dev, addr_pad, j * 4, DMA_TO_DEVICE);
+	dma_unmap_single(ce->dev, rctx->addr_pad, rctx->pad_len, DMA_TO_DEVICE);
 
 err_unmap_result:
-	dma_unmap_single(ce->dev, addr_res, digestsize, DMA_FROM_DEVICE);
+	dma_unmap_single(ce->dev, rctx->addr_res, rctx->result_len,
+			 DMA_FROM_DEVICE);
 	if (!err)
-		memcpy(areq->result, result, crypto_ahash_digestsize(tfm));
+		memcpy(areq->result, rctx->result, crypto_ahash_digestsize(tfm));
 
 err_unmap_src:
-	dma_unmap_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
-
-err_free_result:
-	kfree(result);
-
-err_free_buf:
-	kfree(buf);
+	dma_unmap_sg(ce->dev, areq->src, rctx->nr_sgs, DMA_TO_DEVICE);
 
 err_out:
 	local_bh_disable();
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index 0d46531c475c..90b955787d37 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -110,6 +110,9 @@
 
 #define MAXFLOW 4
 
+#define CE_MAX_HASH_DIGEST_SIZE		SHA512_DIGEST_SIZE
+#define CE_MAX_HASH_BLOCK_SIZE		SHA512_BLOCK_SIZE
+
 /*
  * struct ce_clock - Describe clocks used by sun8i-ce
  * @name:	Name of clock needed by this variant
@@ -304,9 +307,23 @@ struct sun8i_ce_hash_tfm_ctx {
  * struct sun8i_ce_hash_reqctx - context for an ahash request
  * @fallback_req:	pre-allocated fallback request
  * @flow:	the flow to use for this request
+ * @nr_sgs: number of entries in the source scatterlist
+ * @result_len: result length in bytes
+ * @pad_len: padding length in bytes
+ * @addr_res: DMA address of the result buffer, returned by dma_map_single()
+ * @addr_pad: DMA address of the padding buffer, returned by dma_map_single()
+ * @result: per-request result buffer
+ * @pad: per-request padding buffer (up to 2 blocks)
  */
 struct sun8i_ce_hash_reqctx {
 	int flow;
+	int nr_sgs;
+	size_t result_len;
+	size_t pad_len;
+	dma_addr_t addr_res;
+	dma_addr_t addr_pad;
+	u8 result[CE_MAX_HASH_DIGEST_SIZE] ____cacheline_aligned;
+	u8 pad[2 * CE_MAX_HASH_BLOCK_SIZE] ____cacheline_aligned;
 	struct ahash_request fallback_req; // keep at the end
 };
 
-- 
2.50.0



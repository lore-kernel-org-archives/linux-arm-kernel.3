Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0961FC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t10wxuAUiB4KyOt9zeZgZ/9RxJrj16+YdQHln4bOH7s=; b=lsDwCGMJs8HelU+f6C6KiLZNdW
	mYigIjgfPwpRyP1Q70Molik5nILpgSDdT2KBddtBrQ/GtUgWUJXeMHFDv0rNrN1xdkl1gWtdrGrnJ
	XWlVIZ6rXGv5pJCQv67VuBMR2YBOmg/6KywTiOzPdHYpnx6Wu5r8AKhhJRx0OKUegbZPWdDwI77k4
	rxxf10rS9x0tK4MBkXj5iNytjJhfpDrC9vDBxlSuZIFFK64a7RlKjsJwSxciWnRXfDTJXeqKhe1pj
	t38ndFuafddxNrsh1FT8gSwmwqNcEVKqtnKsImsXXXgbnn4WtySMQZGv1lAHjpJYTETAWAAqhhNsz
	SbNISDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHU8-0000000DVew-3wb7;
	Thu, 19 Jun 2025 15:47:28 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEJT-0000000D2Xk-3bIf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:24:17 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ade5b8aab41so145621166b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 05:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335854; x=1750940654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t10wxuAUiB4KyOt9zeZgZ/9RxJrj16+YdQHln4bOH7s=;
        b=iF3CcXNh+vSua3+0beJnYrl946XMXTr6Wr9Rmia4fGq2uTlz6BvFHu1aFLYk9/17PL
         tvBmnyZ2OEgwd0wwhF+D43I0sj3EYphnVRxznnqJ0I4x1wh0U9TQc0MRJvAVTT/e2389
         WhJ1E7U/92+FY2KBIqWrJ5m/lTb97eU6SlERezrwAfuekpzPs/5r1iqKnWU5pfLvH1xh
         8P6JOyDxcJt9p9ENCw7ndMhl+G8LIE0T/x2ilmd0wYKFTLQXwMVpfwXqHW9kRuwK7yvg
         hiDL8k+8TGd2vr5y8gqv350LR695qf6O9LKQaULbN/qB5ODSnbAJXnVNZm2VXVprqKF5
         hLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335854; x=1750940654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t10wxuAUiB4KyOt9zeZgZ/9RxJrj16+YdQHln4bOH7s=;
        b=v1nMFOoxt/KG1v7l8PWiwUgmPv59HLMvV4Zbay8rqehSF7TE3YezxH6eotTI6/t1JE
         49ckNTgv7Cv3pYSo5wz+scilEayY98FfQlAjFkWGlv+WfqMfGe6XcL5tbfC9Hu084Fyy
         2YPCxCSM/UDfdxDWvjSc3TPEejQbgL1NWj+7t2i3VSB82Jd998Ja5u1DtdpB05iJz5gz
         GrhxkgtGbHiqmDvRar4QlOAwKp0mHOruVtGVq3IHxexTJxWZ2+jv6/sJlNyUiB6m8v1J
         ipoTh3vSAr7O1BEB1TxGvwrn0bXQSRB4AA/44HyjpY5lalliA4pu7ncwmoVa3ju/PuC9
         6HqA==
X-Forwarded-Encrypted: i=1; AJvYcCXzS+cmKwL5jDbac2+OmF9B5yH+qMuSoj+ebSAexiFM3/TRgaURIIlc4C9SHc9jHYprXEj5DDuHrqsBkt+GqOiK@lists.infradead.org
X-Gm-Message-State: AOJu0YxWCXhISO7Zr1y1LtnnlhzGrx2Kal/VlJSEIoiC/WOZvuwhtJwk
	2BYXMbvDW1TS5nFYZy29lK1ZVjA/GN1rViHqbAWoID1XCXxRglKPLrOd
X-Gm-Gg: ASbGncudcIqBNxuPxxIiyqgHw0ulaL8p5XR3KJhF7XY0vj3usq/lTWwPbLvBdADl3II
	4wynSzF5aeqW8cb/rAPxerRxr/6ass7YecgOAex9+BupIBT9GqDJL7+PE3jeIqLyu6OmV+Cjxw4
	d0vg+JdLsXR3ac1iCsRxFkq1xQaZXoQEOYItp/P4f6J7HxNtsF4OcyGHNfs360X/C0LuPJkdqPm
	ZYtvEh5SlKVOJ0C+TqjGa0423aLdIU0IJPfnJpE/YYa6elwA8854teoXcJA1Dt/ks04XzPNPxkj
	8uicmCWBI5ZW0vXAr9gEHsggCJgofUUMiWTWhFUefKi+/Q65vboTFIic7nIknrWFENo18yok68s
	dUaI+U8gx9Iv9Bg==
X-Google-Smtp-Source: AGHT+IHjXBuVHBHVzGX7KJawSoi/MaD0OIMw0TPwOstgtvFQbFHnqwQM6253a1WMLNA8WmktvzgJrw==
X-Received: by 2002:a17:907:7fa6:b0:ae0:3f20:68f8 with SMTP id a640c23a62f3a-ae03f207cdamr188465966b.39.1750335854011;
        Thu, 19 Jun 2025 05:24:14 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae000b02bd3sm504688066b.3.2025.06.19.05.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:24:13 -0700 (PDT)
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
Subject: [PATCH 03/10] crypto: sun8i-ce - move bounce_iv and backup_iv to request context
Date: Thu, 19 Jun 2025 15:23:09 +0300
Message-ID: <20250619122316.2587236-4-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
References: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_052415_900678_772B6F61 
X-CRM114-Status: GOOD (  17.97  )
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

Currently, the iv buffers are allocated once per flow during driver probe.
Having a single iv buffer for all requests works with the current setup
where requests are processed one by one, but it wouldn't work if multiple
requests are chained together and processed in one go.

In preparation for introducing request batching, allocate iv buffers per
request, rather than per flow.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c       | 18 +++++++++---------
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c  | 12 ------------
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h   |  8 ++++----
 3 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 113a1100f2ae..9963e5962551 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -209,11 +209,11 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 	if (areq->iv && ivsize > 0) {
 		if (rctx->op_dir & CE_DECRYPTION) {
 			offset = areq->cryptlen - ivsize;
-			scatterwalk_map_and_copy(chan->backup_iv, areq->src,
+			scatterwalk_map_and_copy(rctx->backup_iv, areq->src,
 						 offset, ivsize, 0);
 		}
-		memcpy(chan->bounce_iv, areq->iv, ivsize);
-		rctx->addr_iv = dma_map_single(ce->dev, chan->bounce_iv, ivsize,
+		memcpy(rctx->bounce_iv, areq->iv, ivsize);
+		rctx->addr_iv = dma_map_single(ce->dev, rctx->bounce_iv, ivsize,
 					       DMA_TO_DEVICE);
 		if (dma_mapping_error(ce->dev, rctx->addr_iv)) {
 			dev_err(ce->dev, "Cannot DMA MAP IV\n");
@@ -299,13 +299,13 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 
 		offset = areq->cryptlen - ivsize;
 		if (rctx->op_dir & CE_DECRYPTION) {
-			memcpy(areq->iv, chan->backup_iv, ivsize);
-			memzero_explicit(chan->backup_iv, ivsize);
+			memcpy(areq->iv, rctx->backup_iv, ivsize);
+			memzero_explicit(rctx->backup_iv, ivsize);
 		} else {
 			scatterwalk_map_and_copy(areq->iv, areq->dst, offset,
 						 ivsize, 0);
 		}
-		memzero_explicit(chan->bounce_iv, ivsize);
+		memzero_explicit(rctx->bounce_iv, ivsize);
 	}
 
 	dma_unmap_single(ce->dev, rctx->addr_key, op->keylen, DMA_TO_DEVICE);
@@ -348,13 +348,13 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
 					 DMA_TO_DEVICE);
 		offset = areq->cryptlen - ivsize;
 		if (rctx->op_dir & CE_DECRYPTION) {
-			memcpy(areq->iv, chan->backup_iv, ivsize);
-			memzero_explicit(chan->backup_iv, ivsize);
+			memcpy(areq->iv, rctx->backup_iv, ivsize);
+			memzero_explicit(rctx->backup_iv, ivsize);
 		} else {
 			scatterwalk_map_and_copy(areq->iv, areq->dst, offset,
 						 ivsize, 0);
 		}
-		memzero_explicit(chan->bounce_iv, ivsize);
+		memzero_explicit(rctx->bounce_iv, ivsize);
 	}
 
 	dma_unmap_single(ce->dev, rctx->addr_key, op->keylen, DMA_TO_DEVICE);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index 79ec172e5c99..930a6579d853 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -757,18 +757,6 @@ static int sun8i_ce_allocate_chanlist(struct sun8i_ce_dev *ce)
 			err = -ENOMEM;
 			goto error_engine;
 		}
-		ce->chanlist[i].bounce_iv = devm_kmalloc(ce->dev, AES_BLOCK_SIZE,
-							 GFP_KERNEL | GFP_DMA);
-		if (!ce->chanlist[i].bounce_iv) {
-			err = -ENOMEM;
-			goto error_engine;
-		}
-		ce->chanlist[i].backup_iv = devm_kmalloc(ce->dev, AES_BLOCK_SIZE,
-							 GFP_KERNEL);
-		if (!ce->chanlist[i].backup_iv) {
-			err = -ENOMEM;
-			goto error_engine;
-		}
 	}
 	return 0;
 error_engine:
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index f12c32d1843f..0d46531c475c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -188,8 +188,6 @@ struct ce_task {
  * @status:	set to 1 by interrupt if task is done
  * @t_phy:	Physical address of task
  * @tl:		pointer to the current ce_task for this flow
- * @backup_iv:		buffer which contain the next IV to store
- * @bounce_iv:		buffer which contain the IV
  * @stat_req:	number of request done by this flow
  */
 struct sun8i_ce_flow {
@@ -198,8 +196,6 @@ struct sun8i_ce_flow {
 	int status;
 	dma_addr_t t_phy;
 	struct ce_task *tl;
-	void *backup_iv;
-	void *bounce_iv;
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
 	unsigned long stat_req;
 #endif
@@ -264,6 +260,8 @@ static inline __le32 desc_addr_val_le32(struct sun8i_ce_dev *dev,
  * @nr_sgd:		The number of destination SG (as given by dma_map_sg())
  * @addr_iv:		The IV addr returned by dma_map_single, need to unmap later
  * @addr_key:		The key addr returned by dma_map_single, need to unmap later
+ * @bounce_iv:		Current IV buffer
+ * @backup_iv:		Next IV buffer
  * @fallback_req:	request struct for invoking the fallback skcipher TFM
  */
 struct sun8i_cipher_req_ctx {
@@ -273,6 +271,8 @@ struct sun8i_cipher_req_ctx {
 	int nr_sgd;
 	dma_addr_t addr_iv;
 	dma_addr_t addr_key;
+	u8 bounce_iv[AES_BLOCK_SIZE] ____cacheline_aligned;
+	u8 backup_iv[AES_BLOCK_SIZE] ____cacheline_aligned;
 	struct skcipher_request fallback_req;   // keep at the end
 };
 
-- 
2.49.0



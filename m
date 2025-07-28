Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B8DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdqdaaScOBYi48Kijra/+QGBgmA2GIY7lfOSgwcV1kY=; b=X0DXJ46iidGACAIWKXmOw+lmoA
	4StrHUmGkM45dF3muVuY/wYvOLXSd2DN+g94QZUgF7D2Y/JpoAo8+jlyUMcs3UBo05dGiuOWC1zeh
	3UGTKI4yuj2CNYrBf4gPfp2ch1dKCd3eKBY45z3i49w68s9vhPtlAzaJniDFdburnOD6mcUudGgFm
	9eg9HSUS9vQFBJ2QXamxdAs56q/jmr6COV0fKE+HHpE/jPnsvKsQzS+Xjjjgfr2BDVdXoHo119OSi
	7IT46Rig4u2pW62i+A1/60JqToHWve5JEivixm5eaACsQ6hlNkovlob1QQivtRT4tclR5L8b1gyQn
	DsOHYYiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHiP-0000000DnPO-00FS;
	Mon, 28 Jul 2025 06:52:05 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugH1m-0000000DjIN-1CYZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 06:08:03 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so42757585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 23:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682881; x=1754287681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdqdaaScOBYi48Kijra/+QGBgmA2GIY7lfOSgwcV1kY=;
        b=W2kvZq0CXggw6uDX6lYkIrfEKaSFUMSsU/BZuP5L8ygwJG5lG9X6xtJDI7Z6MRmeqv
         aKNabVPHj58Ajf02or20QUs0tuxVhiob7bAYw1LZEtIbetcB7uru7n8EfWMrvDu26kgO
         xuXQrfTXtp9HbCW57aJPvxQvszbV6VLPCeJdBA9/HG7fP+h41iYT6IL4eSrX7/FluMzh
         EcvMgMFXyAWvAtIt4rvc7iQ7PsXfsKDiIUsA3OUxNteATX+yHr8NTGBAUJyHPn4c1iFr
         AsesPq4NQ4duLiep9KftP3Cv9nCRNWN3aob5s+uf1JJX353stcsa+Qf0Ba3U3G28YXo1
         GloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682881; x=1754287681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdqdaaScOBYi48Kijra/+QGBgmA2GIY7lfOSgwcV1kY=;
        b=QEBNsEwRWfv+eutqaRbfUx9ub/8KaC48Eq1Ypd16frZn0B4kka3sOxNc/+s67Ol93j
         tx6Ak9fwJeqJB7a2NphJ1Pqemkqz4A+wKE5V8/FW6zb4tw2B4RoaYE/JWX0bD/YAEBRP
         SDBMkHSDgNhDdSuwdmCoRvNz2mJ1lhhqrd4xMcrRHZ0OkP6dNi9tY2FpjZuT0m/e5xTF
         J2usXNTziPo+ycp3xMnJ3AcCh36I8mZIo36TWDDayL0p1Js/BVLQyYKQ5XkVH+hEXJQ3
         +TZ5SpvfD5uZE8/hrRA2Y2h9uI18Pga0qwSDb+C3spHMvzVL6A8q7oA21II5xmf6s3HL
         7MBg==
X-Forwarded-Encrypted: i=1; AJvYcCUljz3W9Plp06UU/iVhpu4AbHESOMtqqiHR5GkfPXZxkhZ1c8LtuJODb4YQmR7PSMmDBqOIFseojm+lrRyICdpK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+jCGl/xVV3fQNvGJFnUumYT0NhXlpU4BKoIKhnjOdg1M55okV
	vf/M6Q2YPSKqk2SyXtUsb8830Px7h2yUFYivBQNnM3uybzG3j5S3QUWn
X-Gm-Gg: ASbGncv4hANLvLnKXn5ic4tzuhZ+NH2jKCY9K3+CIb+NXxBP6B6jqc5NU5aiY04T6Kq
	Ga+9mds/l+V7HQZ/8fwNsoL0EvKc77IlHnqeNLMX3aoQ5dTiEZwWJWH8uahC2//4yPQBKNlyNDS
	DOSxYBzNAzLthgr06fsQYXr8Ngks0qIzvXYLTr1bVnSsb/N7nYZgHqhFjF3fV2GFLwLkkhRel9w
	j52vxU9OWsZH+zLtGIN59qAb/VgvMr9gThVk3O68f93+7pPpuOWoWylm6DT8B/M2X1N1aufv3h5
	04KIh4cwXzE4Y8OvyUPysiXWArTpxJk//4sS/18PNHIsOFuXp7OzxCzKKBy0+e+z0YOaSG7XjbT
	cYlD5Fl9QUV1GrzkzDb6PnBWZA/cmNCHw2g==
X-Google-Smtp-Source: AGHT+IHZ+61CYtmRgVeRSYGGn06dcWJ7qkkpNHOxwMUzzATXNR8lg1Va00usgycivkfePU3GB9B7Ig==
X-Received: by 2002:a05:600c:5027:b0:456:1a87:a6ba with SMTP id 5b1f17b1804b1-4587666af1amr70261495e9.33.1753682880486;
        Sun, 27 Jul 2025 23:08:00 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:08:00 -0700 (PDT)
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
Subject: [PATCH 5/9] crypto: sun8i-ce - move bounce_iv and backup_iv to request context
Date: Mon, 28 Jul 2025 09:06:57 +0300
Message-ID: <20250728060701.1787607-6-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
References: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_230802_326341_3A59065C 
X-CRM114-Status: GOOD (  17.30  )
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
However, the iv buffers hold request-specific data, so they should be part
of the request context.

Therefore, allocate iv buffers per request, rather than per flow.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c       | 18 +++++++++---------
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c  | 12 ------------
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h   |  8 ++++----
 3 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index c57c64a1a388..69ba8236cf2d 100644
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
index d94304a439d3..ac29e3f4e099 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -759,18 +759,6 @@ static int sun8i_ce_allocate_chanlist(struct sun8i_ce_dev *ce)
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
2.50.0



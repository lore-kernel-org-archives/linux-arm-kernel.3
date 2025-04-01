Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DF0C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 19:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nierB4LEgce+4kZQOSa3FNbylwS0gDWPVPBM7TYut2U=; b=rZbPvkD8kVssCGR+B7wU2cmqHj
	7LqbfhBxbyjDg0I8rj1U7stNtyBgz7jqz+ngqHQ41ydGhxKfrZCgKaFrurRDN1xXVNllejA1AEitN
	qM9L/8/NX/jXhc2mAcuHGI/TSnNzNBqtQTFFqRmtiQQC46+Sw5kqJeuzARjyh9UX43iM5sQbtqoEf
	sYQ6CG1fBVwZyHrwwpdppcMfSXHUJfVtmGzKs9YhsDRgNQzccx94DDQb+Rgclbu8PsPunfFF6OTED
	kpqCx2xoNAkWArA/iW0J1Y86FDUkewimFt0JEJqd69LIwA0PY2xMBa+c7oBz+Ht9FcgvUn171PkGe
	oS6aNxlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzhF8-00000004DP6-3b8t;
	Tue, 01 Apr 2025 19:25:50 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzhDK-00000004D4R-3xR0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 19:24:00 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39c1efc457bso1193300f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 12:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743535437; x=1744140237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nierB4LEgce+4kZQOSa3FNbylwS0gDWPVPBM7TYut2U=;
        b=GjmwNXJMUSKOGEiyUv5zdwbD24jLuemEhBdglp3XfECwOiFVLiSr4Bvtd3pzVLSd2P
         5sxSgQ8L+NY7sY9+2qUlKJrKP55SDGwsuHLEGD+dxC7aJgnDnsJZRH34ouUU0Jj+0YPi
         QPGLyxkEYcxoDtVNzlm8PT/67a5AKj6RPG1ECoriF0MLMCQYwojKmyjf1lC/hpS1185Z
         zvJgimpdASBUhwdNecmshAsZsn601ANgKE/g8hF0duRjLgfPV2JIS8OyvO5K/I2z1VtP
         cYShe+2ckMaOs/2Ue83smrTWLJp5R4FO6tqfQK/3d6ARY/MfoTRad2neuomzV7ptpE+1
         u2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743535437; x=1744140237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nierB4LEgce+4kZQOSa3FNbylwS0gDWPVPBM7TYut2U=;
        b=a+M0JKLhDnhVVSXuL2PgThl0S1uDxIVO+DLj/Qaafjjir/I/GNq18S1wjTWABB+UZ8
         K8qAcmsWFYnSaDbw9xRjhf35RSwk1lpW2Wx5SzzONyvv3zBOTThOfOiAoGvjkbr9uny9
         xT/uw3wxsqRnIDRkgcc8A/5hDT1s3bINc5HDGuLEte1ImrfW+5LoRJ58XqOUf9F9O5Sq
         +8KDAqABkBbj3h/Sa94zn2Bo6EzmYCw5w5fYZ1oMRfe9hN+SIuY2nemY256FuFTxj+Ab
         1sK6IBubk0e6Ih6UJZZSgcXJEKB48fKsYv6xOsNteE9hGhCwW2h1k+k4TGXdbC3/GBN6
         ejSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp3nqa0qPuaYRxVjZcIsv0W67SohxNkSQffbsGgArG5JVrCNst40T4mLL2vXFtw2thPTGMcGZKiY6fuusERBk1@lists.infradead.org
X-Gm-Message-State: AOJu0YzMasxNrJwtNTIDqpWDMwxaVRm5P3Xm3mUxalRPFDbC0SRreEwZ
	5/7gmn+0OBM+JUutKusEgs2ZidELfPHqu+d6PVt01SYamuK/tL/G
X-Gm-Gg: ASbGnctkbIkojfanKUUG+G2wIdmaQyc6oEpWFH1r/RO02+nuslOT9QgZsrWBR5jAQHq
	fgdEPaoIjj77usSlM9DOVWGxHSRQocmrgKAvAE1v7b6WJtfoP5q2xxVY8RoC3OmGKDrUhOG/nji
	Ho9DisQXiOk2VM1EhRHyOpcHUPlwUFZTYbKeimrF6afaBR4gRjYg4M1l2bddyKQfktEmkqHDTN6
	6kPGszQ1LhVaISXtWvxiYu/A1I5zVjArnP0PhCB8ZVJKFU173aLZ5s5HTOMmJUJirZbLfYCnFth
	j5DYn8vd1WPNKCAsbL7/kpIA8zWS3ePIfOgbGEm2O6zFQJe2vKAr4HDjv8Z/MEA4BcBiPWdW
X-Google-Smtp-Source: AGHT+IGHyzi31e3692ONFiGCVRk0AOakCuPS3Q8lpPUYekXyBseRhASvcdujfWAcxWGfSdab5h7ydg==
X-Received: by 2002:a5d:64c7:0:b0:391:4bfd:6d5 with SMTP id ffacd0b85a97d-39c1211d5c8mr11428784f8f.52.1743535436607;
        Tue, 01 Apr 2025 12:23:56 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66aa32sm15353438f8f.50.2025.04.01.12.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:23:56 -0700 (PDT)
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
Subject: [PATCH 1/6] crypto: sun8i-ce-hash - fix error handling in sun8i_ce_hash_run()
Date: Tue,  1 Apr 2025 22:23:16 +0300
Message-ID: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_122358_982325_7ECF30F7 
X-CRM114-Status: GOOD (  13.26  )
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

Rework error handling in sun8i_ce_hash_run() to unmap the dma buffers in
case of failure. Currently, the dma unmap functions are not called if the
function errors out at various points.

Fixes: 56f6d5aee88d1 ("crypto: sun8i-ce - support hash algorithms")
Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 34 ++++++++++++-------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 6072dd9f390b..3f9d79ea01aa 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -343,9 +343,8 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	u32 common;
 	u64 byte_count;
 	__le32 *bf;
-	void *buf = NULL;
+	void *buf, *result;
 	int j, i, todo;
-	void *result = NULL;
 	u64 bs;
 	int digestsize;
 	dma_addr_t addr_res, addr_pad;
@@ -365,14 +364,14 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	buf = kcalloc(2, bs, GFP_KERNEL | GFP_DMA);
 	if (!buf) {
 		err = -ENOMEM;
-		goto theend;
+		goto err_out;
 	}
 	bf = (__le32 *)buf;
 
 	result = kzalloc(digestsize, GFP_KERNEL | GFP_DMA);
 	if (!result) {
 		err = -ENOMEM;
-		goto theend;
+		goto err_free_buf;
 	}
 
 	flow = rctx->flow;
@@ -398,7 +397,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	if (nr_sgs <= 0 || nr_sgs > MAX_SG) {
 		dev_err(ce->dev, "Invalid sg number %d\n", nr_sgs);
 		err = -EINVAL;
-		goto theend;
+		goto err_free_result;
 	}
 
 	len = areq->nbytes;
@@ -411,7 +410,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	if (len > 0) {
 		dev_err(ce->dev, "remaining len %d\n", len);
 		err = -EINVAL;
-		goto theend;
+		goto err_unmap_src;
 	}
 	addr_res = dma_map_single(ce->dev, result, digestsize, DMA_FROM_DEVICE);
 	cet->t_dst[0].addr = desc_addr_val_le32(ce, addr_res);
@@ -419,7 +418,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	if (dma_mapping_error(ce->dev, addr_res)) {
 		dev_err(ce->dev, "DMA map dest\n");
 		err = -EINVAL;
-		goto theend;
+		goto err_unmap_src;
 	}
 
 	byte_count = areq->nbytes;
@@ -441,7 +440,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	}
 	if (!j) {
 		err = -EINVAL;
-		goto theend;
+		goto err_unmap_result;
 	}
 
 	addr_pad = dma_map_single(ce->dev, buf, j * 4, DMA_TO_DEVICE);
@@ -450,7 +449,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	if (dma_mapping_error(ce->dev, addr_pad)) {
 		dev_err(ce->dev, "DMA error on padding SG\n");
 		err = -EINVAL;
-		goto theend;
+		goto err_unmap_result;
 	}
 
 	if (ce->variant->hash_t_dlen_in_bits)
@@ -463,16 +462,25 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	err = sun8i_ce_run_task(ce, flow, crypto_ahash_alg_name(tfm));
 
 	dma_unmap_single(ce->dev, addr_pad, j * 4, DMA_TO_DEVICE);
-	dma_unmap_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
+
+err_unmap_result:
 	dma_unmap_single(ce->dev, addr_res, digestsize, DMA_FROM_DEVICE);
+	if (!err)
+		memcpy(areq->result, result, algt->alg.hash.base.halg.digestsize);
 
+err_unmap_src:
+	dma_unmap_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
 
-	memcpy(areq->result, result, algt->alg.hash.base.halg.digestsize);
-theend:
-	kfree(buf);
+err_free_result:
 	kfree(result);
+
+err_free_buf:
+	kfree(buf);
+
+err_out:
 	local_bh_disable();
 	crypto_finalize_hash_request(engine, breq, err);
 	local_bh_enable();
+
 	return 0;
 }
-- 
2.48.1



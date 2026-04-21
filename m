Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F50F327BD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 09:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eVBypKJw+Ak0MJauOtJvmP4dIZgy02ZaGmQO+Q25Zt4=; b=Q1sT2Qo72LQwp8G9wTVOvakNq5
	GwLORYo0SPAEIvwRL2n5RmluL0En2ef7DpD1DMMKl4cRLgaef48q3MhpcsXzfWI0TSde7Cr1ou0SX
	ZR++Ii6kUe8QzjWb22Q3Qlv5yT1ycX6JtsTFbe1bRd3RloLHC1iZiCj6x8hxupi2YBIMZayYYJHlr
	4bTWdzDTLC+ymChJAJCP2lV1mkdxigz+C94eF1wsmsmWj+GJOT41maADV0tIbmB+WPf31osEYwtIz
	lAJ4Yo1ShuKbZQZKNeDjzwEeO3Vqoeoxaxd/GYZ7VdMjBSQ8RIqTx8axKuZkyFWRzgKXcHLPPe3sM
	BHO7JM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7fI-00000008LvW-1k9X;
	Tue, 21 Apr 2026 09:45:08 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7fG-00000008Luy-0p7c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 09:45:07 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-82f69adeecbso1774608b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 02:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776764705; x=1777369505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eVBypKJw+Ak0MJauOtJvmP4dIZgy02ZaGmQO+Q25Zt4=;
        b=A8NS/QFEoEQNFlRYoov9hnvzfJYGeHY1DPQrWgqCRd+ArkZLn2AE/ZQ4vjUfIE6YUd
         Vjqf20MSrWQOwSn1k0x59IOFYRaVy+7dDFEfBNn6bVIirF0+HjMd24jOS3zM3IVABjcb
         EfzXBEEjxPCWU8OpF20DRaEmrzvxhc7/aNPVb66RvGqnUZnFwBIlhhIdUmX3uDLact6e
         28SkbnHOXPASiLQbV77d+oDKZIif/N81o1P2VXrYlJPr/nQbKOzeiWaL2gj3DjzQyBPo
         6AoohT6rvHcHWVIi2OshKCavOUyXXhMG1Nh2qpjKrrCmCtFEVEMZclqhKEJmsC+utyWd
         jaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776764705; x=1777369505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVBypKJw+Ak0MJauOtJvmP4dIZgy02ZaGmQO+Q25Zt4=;
        b=V2bVxR2tl2mgZdB/TmWyyZFoAwq/tqDEzNnbrIJibgyUZZgWr9cDKE9zCD/CpjsQCt
         Bo6cV1JnRhWJ9qfW/uUkFzMiay6tYxQydoAp75PsBHDntvJgdQlj3YErh8mgZOVqr0y1
         TbL3TwifwDLvugJUt90ojv9tyZ/1WHiJFziXR3518xwAkAhYoHjbKbeYGgBJeUOhfAzn
         pUbiJ3IeZyYfW6ppU1N2qBRorz9AtcKeVMvWyfkfc7IvqrPcoYYGyQYWtgUuWijLwRYF
         MV96uKqUqQkV5tupblRBZbVnirRriRxJwZUWw+ujY2JWmMr6zOqU06+d+vF3MkRAWetg
         +sAg==
X-Forwarded-Encrypted: i=1; AFNElJ/oRjfjE0JcZ6UV8w3MKaI42lGoByQmvnDa2mokVrSp03MN4/2rpmKVNEb5szGDxtsbI7IYDzQLhvhITgglqF+N@lists.infradead.org
X-Gm-Message-State: AOJu0YxFBjRD2kUnDca38SovrzN+yhvjlKOUK6TI2J+nTrgeb0sH746+
	tkg0psvmyUPc939vpWK9kTFWzPQFWebcZOTBm04AWgUbmOga+7/kaHWz
X-Gm-Gg: AeBDieujxIgA9qZne/9a9Rj80pJ7YUDpbNhCXr0/PfJiJBdSQISyLrjLqf9rBu7r1Th
	u4jRjfwUfxqV2H+F8sgwGszoeoZf2ppJhgm/MPJgkcKnfrFBT2xW78G4BpBZ+JT7WS0SflmYdFM
	0/c80QVCiKnz5M7rii5J6QHuGRqFLqOKfdC3b1NX7FCKsiMIwmGfpBsA0qtP7vYO2fEz+NQqbI6
	Hm7BNiPuwn28JSicGxh6i1/vG7bT45VE2ZMqNXrzN2YHGLVMJl9Wlx35CalMYwOaFWAAQXbkcTC
	Z0BSNDgIMZ8H+GD6UYbEfmHhF287//8QIZxTykm4F1DOZWIDeber+ffJlodyy6eWjPom3+8W3fd
	LPmXWwdAYSEcxa+wMTrHOSG3vdqLgjiRJcFq1/CjFuVztO8TmwAGNd140UbPinPuZRkGUzHfm8S
	kuvJqhKSHpN+AUSaQTSnyeNcAkAs3f/AeAsVPvo/eLTQCL9xRqBXdKJajwcHGEQsY=
X-Received: by 2002:a05:6a00:2d03:b0:829:9f46:280d with SMTP id d2e1a72fcca58-82f8c87db23mr17788188b3a.1.1776764704749;
        Tue, 21 Apr 2026 02:45:04 -0700 (PDT)
Received: from LAPTOP-CUCB24GH.tail9a93e7.ts.net ([175.159.176.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3fa2sm13292215b3a.29.2026.04.21.02.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 02:45:04 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: clabbe@baylibre.com,
	linusw@kernel.org,
	kaloz@openwrt.org,
	herbert@gondor.apana.org.au,
	davem@davemloft.net
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] crypto: ixp4xx: Fix null-pointer dereference in chainup_buffers()
Date: Tue, 21 Apr 2026 17:39:17 +0800
Message-ID: <20260421093917.1001688-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_024506_239476_7E98F1EA 
X-CRM114-Status: GOOD (  16.29  )
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

chainup_buffers() builds a linked list of buffer descriptors for a
scatterlist. If dma_pool_alloc() fails while constructing the list, the
current code sets buf to NULL and later dereferences it unconditionally
at the end of the function:

  buf->next = NULL;
  buf->phys_next = 0;

This can lead to a null-pointer dereference on allocation failure.

If the failure happens after part of the descriptor chain has already
been allocated and DMA-mapped, the partially constructed chain also
needs to be released.

Fix this by unwinding the partially constructed chain, resetting the
caller-provided hook descriptor, and returning NULL on allocation
failure.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c | 24 +++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c b/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
index fcc0cf4df637..63ef28cd5766 100644
--- a/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
+++ b/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
@@ -874,6 +874,11 @@ static struct buffer_desc *chainup_buffers(struct device *dev,
 		struct buffer_desc *buf, gfp_t flags,
 		enum dma_data_direction dir)
 {
+	struct buffer_desc *first = buf;
+
+	first->next = NULL;
+	first->phys_next = 0;
+
 	for (; nbytes > 0; sg = sg_next(sg)) {
 		unsigned int len = min(nbytes, sg->length);
 		struct buffer_desc *next_buf;
@@ -883,10 +888,15 @@ static struct buffer_desc *chainup_buffers(struct device *dev,
 		nbytes -= len;
 		ptr = sg_virt(sg);
 		next_buf = dma_pool_alloc(buffer_pool, flags, &next_buf_phys);
-		if (!next_buf) {
-			buf = NULL;
-			break;
-		}
+		if (!next_buf)
+			goto err_unwind;
+
+		/*
+		 * Keep the chain well-formed even on partial construction,
+		 * so free_buf_chain() can safely unwind it on failure.
+		 */
+		next_buf->next = NULL;
+		next_buf->phys_next = 0;
 		sg_dma_address(sg) = dma_map_single(dev, ptr, len, dir);
 		buf->next = next_buf;
 		buf->phys_next = next_buf_phys;
@@ -899,6 +909,12 @@ static struct buffer_desc *chainup_buffers(struct device *dev,
 	buf->next = NULL;
 	buf->phys_next = 0;
 	return buf;
+
+err_unwind:
+	free_buf_chain(dev, first->next, first->phys_next);
+	first->next = NULL;
+	first->phys_next = 0;
+	return NULL;
 }
 
 static int ablk_setkey(struct crypto_skcipher *tfm, const u8 *key,
-- 
2.43.0


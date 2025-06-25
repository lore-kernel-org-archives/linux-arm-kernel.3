Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C650C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 07:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8jXU1q6B0KX6KZxSGCS7rIxrQ9U7LY3BptCiu+mNFE=; b=CPI8mroSAe0CFazQWgRzspOt62
	sJTtftlVOG+VmpW3eGzEhWEu5tutz1lBDlYY55Pz1XkUK+dYmVrxCIpgSxlI+IO1Iv6ob1WRnSdR/
	7tuFXXZ0Uejjepf5N+dHzgfj2qHQVvbtmZsyLbouGU7HPp0galu5kTQ0j2Pw72K/UHyxuD4qpaHUM
	eP7cBc9xxMNTAntcQfyRM2kmzWrgd2YAE2PIIm15YlMTMXz1Ol9bRWBK2VAPYZfy5InsXe9envx6M
	BN4YUvpcvtWIRq01VHeP0Zh2SDUorWhN7Lcj8bPsoxs5CyVBFrs7vVnMix7F/U4K3a5e/EuBH8Sdl
	lsCer5fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKw8-00000007sB1-3xwJ;
	Wed, 25 Jun 2025 07:52:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKHI-00000007lRa-29pX;
	Wed, 25 Jun 2025 07:10:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=n8jXU1q6B0KX6KZxSGCS7rIxrQ9U7LY3BptCiu+mNFE=; b=Iw12Wgp7V7DgSfDaBvVQxTVkXh
	OW0FHZ9+XYOAvR1DuTh4tlVFQFOHAWMjbcCeVj+mnW14YEqumSg/9UMk2X0OWaG5XyV4hCJdRnv/L
	jzfgRZwTe2IQRCiiNxP5H+QlhSmRzmL6Ih6sB34sPb2WGLd+D9M3MPUsGyaTOD1quG1tW8IB2TZKE
	Jk9W1S9LUPHOyx1ENoUoKDuJgPwSF5Ebkgg5mGDtwu5jVLzrZqgvpPU9oO6vZLLrvcK3ifZf1Fy4K
	KPvL5/MXXswKsG8FVICI6RztKrb/p2LBL41ZRX4b/sOhhOFQlOu0eVX8bsOwE7RFj0ysio7+r7JWz
	WJhrI6hQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKHF-00000005dfP-0uvM;
	Wed, 25 Jun 2025 07:10:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E6B85C61E3;
	Wed, 25 Jun 2025 07:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EFCAC4CEF2;
	Wed, 25 Jun 2025 07:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835435;
	bh=Y+OM4xhFGnbbVJB2/pk7w3PVA+sL8KWZ8Ahn07y2y1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bH9JuMjcvx3J7GtUczSjT11nGI4YWbo07MYlZLzC2HhSWEMCp2w/3F76EUQDdl9aH
	 x3U0E8JYWVjle7diqxhGtq75vEUoC36KAdmOt5ehtup8q9m0RB23nlpgatFdW+xPro
	 JnvpTRlkc04oJMwRgnosZlVo8rkhPtz1xEyaez2xP71hb1UjwpZwEHoEgz9hwvZZ8w
	 Xg73giZDP2UVojmC6ER8rObGC/udaKqdU8qwkmAQlqBDk2z567b670tXgzD5vy92Bv
	 LTPxk9gDYjyHb92F+u8ONsV4Eu9yHAg8GfgBAM3Y1PeC6Az6HX0fnNqfEvvqWnzfdm
	 PfOgccGBMYwtA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 17/18] lib/crypto: sha256: Sync sha256_update() with sha512_update()
Date: Wed, 25 Jun 2025 00:08:18 -0700
Message-ID: <20250625070819.1496119-18-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_081037_455608_ADBE4074 
X-CRM114-Status: GOOD (  11.06  )
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

The BLOCK_HASH_UPDATE_BLOCKS macro is difficult to read.  For now, let's
just write the update explicitly in the straightforward way, mirroring
sha512_update().  It's possible that we'll bring back a macro for this
later, but it needs to be properly justified and hopefully a bit more
readable.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/sha256.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 0de49bf8e8b8b..c93bf4699160c 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -8,11 +8,10 @@
  * Copyright (c) 2014 Red Hat Inc.
  * Copyright 2025 Google LLC
  */
 
 #include <crypto/hmac.h>
-#include <crypto/internal/blockhash.h>
 #include <crypto/sha2.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/unaligned.h>
@@ -177,12 +176,35 @@ EXPORT_SYMBOL_GPL(sha256_init);
 void __sha256_update(struct __sha256_ctx *ctx, const u8 *data, size_t len)
 {
 	size_t partial = ctx->bytecount % SHA256_BLOCK_SIZE;
 
 	ctx->bytecount += len;
-	BLOCK_HASH_UPDATE_BLOCKS(sha256_blocks, &ctx->state, data, len,
-				 SHA256_BLOCK_SIZE, ctx->buf, partial);
+
+	if (partial + len >= SHA256_BLOCK_SIZE) {
+		size_t nblocks;
+
+		if (partial) {
+			size_t l = SHA256_BLOCK_SIZE - partial;
+
+			memcpy(&ctx->buf[partial], data, l);
+			data += l;
+			len -= l;
+
+			sha256_blocks(&ctx->state, ctx->buf, 1);
+		}
+
+		nblocks = len / SHA256_BLOCK_SIZE;
+		len %= SHA256_BLOCK_SIZE;
+
+		if (nblocks) {
+			sha256_blocks(&ctx->state, data, nblocks);
+			data += nblocks * SHA256_BLOCK_SIZE;
+		}
+		partial = 0;
+	}
+	if (len)
+		memcpy(&ctx->buf[partial], data, len);
 }
 EXPORT_SYMBOL(__sha256_update);
 
 static void __sha256_final(struct __sha256_ctx *ctx,
 			   u8 *out, size_t digest_size)
-- 
2.50.0



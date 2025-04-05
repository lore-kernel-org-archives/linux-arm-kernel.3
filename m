Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277F4C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 19:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhCL9ALqrw3D/8w7HiPkEzxnjAyvDKamWX6KnYu6nwA=; b=LyB4WlTK6MTxSNy29/eLjzsuvS
	t0KEEemZqGP1nxOXKBnzR3OmC6qBnH3vLdcL0wx6IuS7dkHrvhfLAYScRTjjQ/VhvpOHWsiH8Suid
	cYMS3XkdWS0+mHdwqN7xFYONZWYmkF5xCUYjLd2afTYwRYZju//5imzj6/4xSOWmmJ+PK9ymVrhoO
	9Fv9FE4mnxbQ4eLKFianWXLZzXVtTFuOR0PXriEXb2+7lLZIUAke7/bzhQtDIsidYbSLE1xvrEZi/
	yQBGdVhlOn6KyJn1HS+TY3YfolPg8JGZYGlrHIvatbgPrkJEtfFtx5MkXSvQUOoYEmTldUR0X1+9d
	2mV91bLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u19Uv-0000000ERCt-2cty;
	Sat, 05 Apr 2025 19:48:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u18IE-0000000ELgh-08Mb;
	Sat, 05 Apr 2025 18:30:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 80AAD61139;
	Sat,  5 Apr 2025 18:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91BCC4CEEE;
	Sat,  5 Apr 2025 18:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743877857;
	bh=xm9pQBjynxcvCeIRTBV15aMlBzjyI8/pKv+7T2s3kQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ju1cg6yronHNVCwqCj3RXAUddHMdeVnV37A1BlKl8lKfGjcLZ1O5Jr47JPwtgEb8w
	 kBtjrQz3oQTK0rF2GIxt9Jca1cQ2ovIovsG6x4ozwgzI/GbWA8lRcEtmfqMDHrTqpT
	 GkdEJQJ46F2Rn2YbfgjD6ZNJWzdg9KZ4ECZmXWRKimG527EO6mCfbyhULimX30AAin
	 iZ+x9yi8figCx1FLSGpxDTsI1oClBdWm+rRR1K6l7HqAHfcbGiEQ2Yy0vRh9G1DEDV
	 Fz64+CRHAlOrMoZ3dqTecWbhgJP5bMpDNyYjfK3/ZQdfcw+7ZrPkaN6Q+fqq/Aktxg
	 VZhaClah8z4gQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 9/9] crypto: chacha - remove <crypto/internal/chacha.h>
Date: Sat,  5 Apr 2025 11:26:09 -0700
Message-ID: <20250405182609.404216-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405182609.404216-1-ebiggers@kernel.org>
References: <20250405182609.404216-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Eric Biggers <ebiggers@google.com>

<crypto/internal/chacha.h> is now included only by crypto/chacha.c, so
fold it into there.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/chacha.c                  | 35 +++++++++++++++++++++++++-
 include/crypto/internal/chacha.h | 43 --------------------------------
 2 files changed, 34 insertions(+), 44 deletions(-)
 delete mode 100644 include/crypto/internal/chacha.h

diff --git a/crypto/chacha.c b/crypto/chacha.c
index 2009038c5e56c..5103bc0b2881f 100644
--- a/crypto/chacha.c
+++ b/crypto/chacha.c
@@ -6,14 +6,47 @@
  * Copyright (C) 2018 Google LLC
  */
 
 #include <linux/unaligned.h>
 #include <crypto/algapi.h>
-#include <crypto/internal/chacha.h>
+#include <crypto/chacha.h>
 #include <crypto/internal/skcipher.h>
 #include <linux/module.h>
 
+struct chacha_ctx {
+	u32 key[8];
+	int nrounds;
+};
+
+static int chacha_setkey(struct crypto_skcipher *tfm,
+			 const u8 *key, unsigned int keysize, int nrounds)
+{
+	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
+	int i;
+
+	if (keysize != CHACHA_KEY_SIZE)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(ctx->key); i++)
+		ctx->key[i] = get_unaligned_le32(key + i * sizeof(u32));
+
+	ctx->nrounds = nrounds;
+	return 0;
+}
+
+static int chacha20_setkey(struct crypto_skcipher *tfm,
+			   const u8 *key, unsigned int keysize)
+{
+	return chacha_setkey(tfm, key, keysize, 20);
+}
+
+static int chacha12_setkey(struct crypto_skcipher *tfm,
+			   const u8 *key, unsigned int keysize)
+{
+	return chacha_setkey(tfm, key, keysize, 12);
+}
+
 static int chacha_stream_xor(struct skcipher_request *req,
 			     const struct chacha_ctx *ctx, const u8 *iv,
 			     bool arch)
 {
 	struct skcipher_walk walk;
diff --git a/include/crypto/internal/chacha.h b/include/crypto/internal/chacha.h
deleted file mode 100644
index b085dc1ac1516..0000000000000
--- a/include/crypto/internal/chacha.h
+++ /dev/null
@@ -1,43 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef _CRYPTO_INTERNAL_CHACHA_H
-#define _CRYPTO_INTERNAL_CHACHA_H
-
-#include <crypto/chacha.h>
-#include <crypto/internal/skcipher.h>
-#include <linux/crypto.h>
-
-struct chacha_ctx {
-	u32 key[8];
-	int nrounds;
-};
-
-static inline int chacha_setkey(struct crypto_skcipher *tfm, const u8 *key,
-				unsigned int keysize, int nrounds)
-{
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-	int i;
-
-	if (keysize != CHACHA_KEY_SIZE)
-		return -EINVAL;
-
-	for (i = 0; i < ARRAY_SIZE(ctx->key); i++)
-		ctx->key[i] = get_unaligned_le32(key + i * sizeof(u32));
-
-	ctx->nrounds = nrounds;
-	return 0;
-}
-
-static inline int chacha20_setkey(struct crypto_skcipher *tfm, const u8 *key,
-				  unsigned int keysize)
-{
-	return chacha_setkey(tfm, key, keysize, 20);
-}
-
-static inline int chacha12_setkey(struct crypto_skcipher *tfm, const u8 *key,
-				  unsigned int keysize)
-{
-	return chacha_setkey(tfm, key, keysize, 12);
-}
-
-#endif /* _CRYPTO_CHACHA_H */
-- 
2.49.0



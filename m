Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB03C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 20:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZp6NfcoO3Mma48KO7kExbEUQr7oAEa2sm8/7e6r6Pg=; b=U/HAjQ9g8HqW5TnmpKe9H8Bk3e
	37GsNQZG/7OXeIHIMGwjZExnG8Ouef4i+yXD+E3KbOff0oosrADkxYBbUaQFNzFS4q2tqbo2M+ziC
	fTjXkRoovz8L2xws60GiIA6RdDexwl+AYhDvYGGPTyb1zZ8l6K/YAcDNRUhiG1yV9etrgzbrt8PAF
	Ai93jI0I9BRxL2M9CaIogNv0MiB+tVlcQX6P0J7oUfwLWXaD70XPdJ2xkLZLDsuJnjiNohY/B6xbr
	p+k/zNTyVJLw0nPqVlTDAq4HnshG0PDGRn8JTGQMRYSwG5nVLR7hbeMn1i5Qy6EJnmC4uEaXGbfl4
	n0vDTSFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u19jR-0000000ES0C-1wQQ;
	Sat, 05 Apr 2025 20:03:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u18IC-0000000ELen-1xQi;
	Sat, 05 Apr 2025 18:30:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C32765C4D9E;
	Sat,  5 Apr 2025 18:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CEA9C4CEEE;
	Sat,  5 Apr 2025 18:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743877855;
	bh=sp+YKRB5qh5FHE2Tj1xgoFnzTPaRWdpcQVjEm9KF2PI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=scYmXbaipYKKc8QpG34jHUIr4k1VmpwvXHSu6rlkPNSfO8c8v5VgDQUYJB9j4cvY2
	 CpFZ4rahL/U1iZwjRVgCuq/5hAQeA4bDQerVFLRIC5CNFpjguxM5N82CpbA3AcHg/A
	 jZKjVD3cl8WcEbVjs0WIHdPd9B05ahYeKdu0aZKHN0xZyAGuOM0UbHK9wdFO2kLcsJ
	 Jb7btAhBUEogJ6n91F3qdy3dW+V2x8wrRnI1vdUWLlfUEIb1xRNdfw8IYYhfdtzOaO
	 GBJRlXRpaZj7UTR52bavnp4Pmp0MBHN/PCMGQBByWA0O64kb8R7s69sJwWhdTaaXXd
	 ANAb5E+su+P3w==
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
Subject: [PATCH 6/9] crypto: powerpc/chacha - remove the skcipher algorithms
Date: Sat,  5 Apr 2025 11:26:06 -0700
Message-ID: <20250405182609.404216-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405182609.404216-1-ebiggers@kernel.org>
References: <20250405182609.404216-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_113056_615998_3144F5E2 
X-CRM114-Status: GOOD (  13.85  )
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

Since crypto/chacha.c now registers chacha20-$(ARCH), xchacha20-$(ARCH),
and xchacha12-$(ARCH) skcipher algorithms that use the architecture's
ChaCha and HChaCha library functions, individual architectures no longer
need to do the same.  Therefore, remove the redundant skcipher
algorithms and leave just the library functions.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/crypto/Kconfig           |   8 --
 arch/powerpc/crypto/chacha-p10-glue.c | 145 ++------------------------
 2 files changed, 6 insertions(+), 147 deletions(-)

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 370db8192ce62..47dccdd496374 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -93,21 +93,13 @@ config CRYPTO_AES_GCM_P10
 	  later CPU. This module supports stitched acceleration for AES/GCM.
 
 config CRYPTO_CHACHA20_P10
 	tristate
 	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
-	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_CHACHA_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	default CRYPTO_LIB_CHACHA_INTERNAL
-	help
-	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
-	  stream cipher algorithms
-
-	  Architecture: PowerPC64
-	  - Power10 or later
-	  - Little-endian
 
 config CRYPTO_POLY1305_P10
 	tristate "Hash functions: Poly1305 (P10 or later)"
 	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
 	select CRYPTO_HASH
diff --git a/arch/powerpc/crypto/chacha-p10-glue.c b/arch/powerpc/crypto/chacha-p10-glue.c
index 3355305b6c7f8..9982929573add 100644
--- a/arch/powerpc/crypto/chacha-p10-glue.c
+++ b/arch/powerpc/crypto/chacha-p10-glue.c
@@ -1,17 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * PowerPC P10 (ppc64le) accelerated ChaCha and XChaCha stream ciphers,
- * including ChaCha20 (RFC7539)
+ * ChaCha stream cipher (P10 accelerated)
  *
  * Copyright 2023- IBM Corp. All rights reserved.
  */
 
-#include <crypto/algapi.h>
-#include <crypto/internal/chacha.h>
+#include <crypto/chacha.h>
 #include <crypto/internal/simd.h>
-#include <crypto/internal/skcipher.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/cpufeature.h>
 #include <linux/sizes.h>
 #include <asm/simd.h>
@@ -76,152 +73,22 @@ void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src, unsigned int bytes,
 		dst += todo;
 	} while (bytes);
 }
 EXPORT_SYMBOL(chacha_crypt_arch);
 
-static int chacha_p10_stream_xor(struct skcipher_request *req,
-				 const struct chacha_ctx *ctx, const u8 *iv)
-{
-	struct skcipher_walk walk;
-	u32 state[16];
-	int err;
-
-	err = skcipher_walk_virt(&walk, req, false);
-	if (err)
-		return err;
-
-	chacha_init(state, ctx->key, iv);
-
-	while (walk.nbytes > 0) {
-		unsigned int nbytes = walk.nbytes;
-
-		if (nbytes < walk.total)
-			nbytes = rounddown(nbytes, walk.stride);
-
-		if (!crypto_simd_usable()) {
-			chacha_crypt_generic(state, walk.dst.virt.addr,
-					     walk.src.virt.addr, nbytes,
-					     ctx->nrounds);
-		} else {
-			vsx_begin();
-			chacha_p10_do_8x(state, walk.dst.virt.addr,
-				      walk.src.virt.addr, nbytes, ctx->nrounds);
-			vsx_end();
-		}
-		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
-		if (err)
-			break;
-	}
-
-	return err;
-}
-
-static int chacha_p10(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-
-	return chacha_p10_stream_xor(req, ctx, req->iv);
-}
-
-static int xchacha_p10(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-	struct chacha_ctx subctx;
-	u32 state[16];
-	u8 real_iv[16];
-
-	chacha_init(state, ctx->key, req->iv);
-	hchacha_block_arch(state, subctx.key, ctx->nrounds);
-	subctx.nrounds = ctx->nrounds;
-
-	memcpy(&real_iv[0], req->iv + 24, 8);
-	memcpy(&real_iv[8], req->iv + 16, 8);
-	return chacha_p10_stream_xor(req, &subctx, real_iv);
-}
-
-static struct skcipher_alg algs[] = {
-	{
-		.base.cra_name		= "chacha20",
-		.base.cra_driver_name	= "chacha20-p10",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= CHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= chacha_p10,
-		.decrypt		= chacha_p10,
-	}, {
-		.base.cra_name		= "xchacha20",
-		.base.cra_driver_name	= "xchacha20-p10",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= XCHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= xchacha_p10,
-		.decrypt		= xchacha_p10,
-	}, {
-		.base.cra_name		= "xchacha12",
-		.base.cra_driver_name	= "xchacha12-p10",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= XCHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha12_setkey,
-		.encrypt		= xchacha_p10,
-		.decrypt		= xchacha_p10,
-	}
-};
-
 bool chacha_is_arch_optimized(void)
 {
 	return static_key_enabled(&have_p10);
 }
 EXPORT_SYMBOL(chacha_is_arch_optimized);
 
 static int __init chacha_p10_init(void)
 {
-	if (!cpu_has_feature(CPU_FTR_ARCH_31))
-		return 0;
-
-	static_branch_enable(&have_p10);
-
-	return crypto_register_skciphers(algs, ARRAY_SIZE(algs));
-}
-
-static void __exit chacha_p10_exit(void)
-{
-	if (!static_branch_likely(&have_p10))
-		return;
-
-	crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		static_branch_enable(&have_p10);
+	return 0;
 }
-
 arch_initcall(chacha_p10_init);
-module_exit(chacha_p10_exit);
 
-MODULE_DESCRIPTION("ChaCha and XChaCha stream ciphers (P10 accelerated)");
+MODULE_DESCRIPTION("ChaCha stream cipher (P10 accelerated)");
 MODULE_AUTHOR("Danny Tsen <dtsen@linux.ibm.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("chacha20");
-MODULE_ALIAS_CRYPTO("chacha20-p10");
-MODULE_ALIAS_CRYPTO("xchacha20");
-MODULE_ALIAS_CRYPTO("xchacha20-p10");
-MODULE_ALIAS_CRYPTO("xchacha12");
-MODULE_ALIAS_CRYPTO("xchacha12-p10");
-- 
2.49.0



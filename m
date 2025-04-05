Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80942C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 18:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3yMQgp8OMvDydSAfRE2fxabHtW1l0t3Mqtp244+I0ug=; b=AnNw3CreGOEGJYq9QmfTYZUFv8
	vrtmEEfbPPQSRLSlqzGKnytdDtHemLiynKJ5L5wNEhRDIrBl06Hz9BtgJYlkc4QBbQV3App47rMG6
	p0bVwfE/VfW98aKNeCQKXDOVd91EkM9bQ29I44w+1vXm0iD02MyzeRkmJ9s0fYziDVoUKfRjP1Xev
	NM133nEZfin1DuAcgQ157sbBWRdM5lLSFv//toXuRVYRADBRodrP9l83+hVbfmZ26vBl9OrpvW6WH
	pvod/u8+VUQ2EIRGtUXqTYx/iGjCmWxBRh+9CunIm1mDLIMlai/xtaictSmdfioT8g4Hamc9XvdFj
	ZXi7QwUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u18St-0000000ENTi-2Hhf;
	Sat, 05 Apr 2025 18:41:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u18IC-0000000ELfK-3idU;
	Sat, 05 Apr 2025 18:30:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 63D306115E;
	Sat,  5 Apr 2025 18:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2AF0C4CEE9;
	Sat,  5 Apr 2025 18:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743877856;
	bh=eW0xTEYWjFUyh4AXaM8KqKhQHIAg7OUKLr5XE1L/PVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CE/ooCdCQStDNLZa23kR/ZLdWXC5Cyy8blaw32N9VZ/HZByRudI24Av624U6J6GjI
	 vFHfKUJr5kXkrwEOfMxCzev4cmLQ0AxskdtKyhysD4HzgiRFfYhbCiyZiCraAivggH
	 cZL4pzullvEXBaDJryylkKqnIORc48+kUXizZjdOFAJrM4lGxS+NL6HCg/7JQVso1g
	 NxcrHPNy69kYkSJpwVov9VFJ9KzlJ+FkWUrAnbR7RmSmSy5Frr4XTV9WxxskziNvNK
	 nfAuxRJPNAipQqBcEr96SWMXEapihar2DCrrObyZ3tyQoRC0NtFv8ztDL5bCqP6DLl
	 s+6NA8DqN+72w==
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
Subject: [PATCH 7/9] crypto: s390/chacha - remove the skcipher algorithms
Date: Sat,  5 Apr 2025 11:26:07 -0700
Message-ID: <20250405182609.404216-8-ebiggers@kernel.org>
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

Since crypto/chacha.c now registers chacha20-$(ARCH), xchacha20-$(ARCH),
and xchacha12-$(ARCH) skcipher algorithms that use the architecture's
ChaCha and HChaCha library functions, individual architectures no longer
need to do the same.  Therefore, remove the redundant skcipher
algorithms and leave just the library functions.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/s390/crypto/Kconfig       |   7 ---
 arch/s390/crypto/chacha-glue.c | 101 +++++----------------------------
 2 files changed, 13 insertions(+), 95 deletions(-)

diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index 8c4db8b64fa21..055b08f259ab2 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -108,20 +108,13 @@ config CRYPTO_DES_S390
 	  As of z196 the CTR mode is hardware accelerated.
 
 config CRYPTO_CHACHA_S390
 	tristate
 	depends on S390
-	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_CHACHA_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	default CRYPTO_LIB_CHACHA_INTERNAL
-	help
-	  Length-preserving cipher: ChaCha20 stream cipher (RFC 7539)
-
-	  Architecture: s390
-
-	  It is available as of z13.
 
 config CRYPTO_HMAC_S390
 	tristate "Keyed-hash message authentication code: HMAC"
 	depends on S390
 	select CRYPTO_HASH
diff --git a/arch/s390/crypto/chacha-glue.c b/arch/s390/crypto/chacha-glue.c
index 0c68191f2aa4c..b3ffaa5553855 100644
--- a/arch/s390/crypto/chacha-glue.c
+++ b/arch/s390/crypto/chacha-glue.c
@@ -1,69 +1,23 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * s390 ChaCha stream cipher.
+ * ChaCha stream cipher (s390 optimized)
  *
  * Copyright IBM Corp. 2021
  */
 
 #define KMSG_COMPONENT "chacha_s390"
 #define pr_fmt(fmt) KMSG_COMPONENT ": " fmt
 
-#include <crypto/internal/chacha.h>
-#include <crypto/internal/skcipher.h>
-#include <crypto/algapi.h>
+#include <crypto/chacha.h>
 #include <linux/cpufeature.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/sizes.h>
 #include <asm/fpu.h>
 #include "chacha-s390.h"
 
-static void chacha20_crypt_s390(u32 *state, u8 *dst, const u8 *src,
-				unsigned int nbytes, const u32 *key,
-				u32 *counter)
-{
-	DECLARE_KERNEL_FPU_ONSTACK32(vxstate);
-
-	kernel_fpu_begin(&vxstate, KERNEL_VXR);
-	chacha20_vx(dst, src, nbytes, key, counter);
-	kernel_fpu_end(&vxstate, KERNEL_VXR);
-
-	*counter += round_up(nbytes, CHACHA_BLOCK_SIZE) / CHACHA_BLOCK_SIZE;
-}
-
-static int chacha20_s390(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-	u32 state[CHACHA_STATE_WORDS] __aligned(16);
-	struct skcipher_walk walk;
-	unsigned int nbytes;
-	int rc;
-
-	rc = skcipher_walk_virt(&walk, req, false);
-	chacha_init(state, ctx->key, req->iv);
-
-	while (walk.nbytes > 0) {
-		nbytes = walk.nbytes;
-		if (nbytes < walk.total)
-			nbytes = round_down(nbytes, walk.stride);
-
-		if (nbytes <= CHACHA_BLOCK_SIZE) {
-			chacha_crypt_generic(state, walk.dst.virt.addr,
-					     walk.src.virt.addr, nbytes,
-					     ctx->nrounds);
-		} else {
-			chacha20_crypt_s390(state, walk.dst.virt.addr,
-					    walk.src.virt.addr, nbytes,
-					    &state[4], &state[12]);
-		}
-		rc = skcipher_walk_done(&walk, walk.nbytes - nbytes);
-	}
-	return rc;
-}
-
 void hchacha_block_arch(const u32 *state, u32 *stream, int nrounds)
 {
 	/* TODO: implement hchacha_block_arch() in assembly */
 	hchacha_block_generic(state, stream, nrounds);
 }
@@ -74,57 +28,28 @@ void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src,
 {
 	/* s390 chacha20 implementation has 20 rounds hard-coded,
 	 * it cannot handle a block of data or less, but otherwise
 	 * it can handle data of arbitrary size
 	 */
-	if (bytes <= CHACHA_BLOCK_SIZE || nrounds != 20 || !cpu_has_vx())
+	if (bytes <= CHACHA_BLOCK_SIZE || nrounds != 20 || !cpu_has_vx()) {
 		chacha_crypt_generic(state, dst, src, bytes, nrounds);
-	else
-		chacha20_crypt_s390(state, dst, src, bytes,
-				    &state[4], &state[12]);
-}
-EXPORT_SYMBOL(chacha_crypt_arch);
+	} else {
+		DECLARE_KERNEL_FPU_ONSTACK32(vxstate);
 
-static struct skcipher_alg chacha_algs[] = {
-	{
-		.base.cra_name		= "chacha20",
-		.base.cra_driver_name	= "chacha20-s390",
-		.base.cra_priority	= 900,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
+		kernel_fpu_begin(&vxstate, KERNEL_VXR);
+		chacha20_vx(dst, src, bytes, &state[4], &state[12]);
+		kernel_fpu_end(&vxstate, KERNEL_VXR);
 
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= CHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= chacha20_s390,
-		.decrypt		= chacha20_s390,
+		state[12] += round_up(bytes, CHACHA_BLOCK_SIZE) /
+			     CHACHA_BLOCK_SIZE;
 	}
-};
+}
+EXPORT_SYMBOL(chacha_crypt_arch);
 
 bool chacha_is_arch_optimized(void)
 {
 	return cpu_has_vx();
 }
 EXPORT_SYMBOL(chacha_is_arch_optimized);
 
-static int __init chacha_mod_init(void)
-{
-	return IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) ?
-		crypto_register_skciphers(chacha_algs, ARRAY_SIZE(chacha_algs)) : 0;
-}
-
-static void __exit chacha_mod_fini(void)
-{
-	if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER))
-		crypto_unregister_skciphers(chacha_algs, ARRAY_SIZE(chacha_algs));
-}
-
-arch_initcall(chacha_mod_init);
-module_exit(chacha_mod_fini);
-
-MODULE_DESCRIPTION("ChaCha20 stream cipher");
+MODULE_DESCRIPTION("ChaCha stream cipher (s390 optimized)");
 MODULE_LICENSE("GPL v2");
-
-MODULE_ALIAS_CRYPTO("chacha20");
-- 
2.49.0



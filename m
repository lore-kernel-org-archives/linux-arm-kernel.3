Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE9DD149E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 19:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEpWY4sXA/S1bLoLnoNT9MT92zIxt9Oz+i41XLKt/cM=; b=lnLTOA4ctC/SE8mWOafVW4nrtk
	m4PRqPC6NzJ3xq3GxGem1tWgkuIWxsJvfZVd/uS316mL9Zdosh2rHkU/AmkR6AFtiEomR7D8eu0my
	ex6btKoQmBitZbSLZFqElgTVLBTNEfbXF5YBqJsqdxp1wZEnsg1sXDnOOL8B667suMarOLLF6ut39
	xCPhZAb9uF0IQ9JZbkGZMWnM8RQsPmkBFpqniXKuRNIG3H7GfUtlu2HIf1YTM/1Qb/j6GNxrNmDxP
	sQ4cPkXl+2rvkyMJ2rc4PICDgPKgpmlyknUurGNjNxMeSxU4cp2e4mTkemnI2c5ie7Fs2NdAf+r4O
	kWdQGDpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Prq-00000004xEk-3hqY;
	Fri, 25 Oct 2024 19:21:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Pmj-00000004vGS-23Qi;
	Fri, 25 Oct 2024 19:15:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 698025C061C;
	Fri, 25 Oct 2024 19:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4FEAC4CEE3;
	Fri, 25 Oct 2024 19:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729883744;
	bh=ABiaGm+ovhik7YFigewZFubogtN32tz5BD1p0OQq720=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vz1H2ANIZERjEpj+I85MKJfdlEpz1SofCIjzgMXNRgrjt8vSPi8NWgf8Q6R4pjn5r
	 X2cGZ6mXRM4KH4EJHSmPpw/sQpx1SXtGmPuNI0f4GTkha+23sVsdFNFd7oNgiKNIcK
	 Jeiz7i0/NpA9zcRhJUWRAgAppnb1vyaxtwlHI2wVbMQvS5SJL0WhiR5D+Epx1sd9PD
	 t6xEbw2ztBl7vtK2VjB5bf9Hc9lkERBR+cTObiA8hRyoMeNv+0AKkbhZIhy9ZUJYqD
	 nAQgRkoDXClPz1x5qFL7LMaY1913EqBa3xDEAbpa7lNBBD6ftJGS6Y6RMRGWhPAf/s
	 UKLLrPEYq5UmQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v2 01/18] lib/crc32: drop leading underscores from __crc32c_le_base
Date: Fri, 25 Oct 2024 12:14:37 -0700
Message-ID: <20241025191454.72616-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025191454.72616-1-ebiggers@kernel.org>
References: <20241025191454.72616-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_121545_650402_0B8FF5D7 
X-CRM114-Status: GOOD (  14.21  )
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

Remove the leading underscores from __crc32c_le_base().

This is in preparation for adding crc32c_le_arch() and eventually
renaming __crc32c_le() to crc32c_le().

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/lib/crc32-glue.c | 2 +-
 arch/riscv/lib/crc32.c      | 2 +-
 crypto/crc32c_generic.c     | 8 ++++----
 include/linux/crc32.h       | 2 +-
 lib/crc32.c                 | 4 ++--
 lib/crc32test.c             | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/lib/crc32-glue.c b/arch/arm64/lib/crc32-glue.c
index 295ae3e6b997..ad015223d15d 100644
--- a/arch/arm64/lib/crc32-glue.c
+++ b/arch/arm64/lib/crc32-glue.c
@@ -42,11 +42,11 @@ u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
 }
 
 u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len)
 {
 	if (!alternative_has_cap_likely(ARM64_HAS_CRC32))
-		return __crc32c_le_base(crc, p, len);
+		return crc32c_le_base(crc, p, len);
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) && crypto_simd_usable()) {
 		kernel_neon_begin();
 		crc = crc32c_le_arm64_4way(crc, p, len);
 		kernel_neon_end();
diff --git a/arch/riscv/lib/crc32.c b/arch/riscv/lib/crc32.c
index d7dc599af3ef..333fb7af1192 100644
--- a/arch/riscv/lib/crc32.c
+++ b/arch/riscv/lib/crc32.c
@@ -224,11 +224,11 @@ u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
 }
 
 u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len)
 {
 	return crc32_le_generic(crc, p, len, CRC32C_POLY_LE,
-				CRC32C_POLY_QT_LE, __crc32c_le_base);
+				CRC32C_POLY_QT_LE, crc32c_le_base);
 }
 
 static inline u32 crc32_be_unaligned(u32 crc, unsigned char const *p,
 				     size_t len)
 {
diff --git a/crypto/crc32c_generic.c b/crypto/crc32c_generic.c
index 7c2357c30fdf..635599b255ec 100644
--- a/crypto/crc32c_generic.c
+++ b/crypto/crc32c_generic.c
@@ -83,11 +83,11 @@ static int chksum_setkey(struct crypto_shash *tfm, const u8 *key,
 static int chksum_update(struct shash_desc *desc, const u8 *data,
 			 unsigned int length)
 {
 	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
 
-	ctx->crc = __crc32c_le_base(ctx->crc, data, length);
+	ctx->crc = crc32c_le_base(ctx->crc, data, length);
 	return 0;
 }
 
 static int chksum_update_arch(struct shash_desc *desc, const u8 *data,
 			      unsigned int length)
@@ -106,11 +106,11 @@ static int chksum_final(struct shash_desc *desc, u8 *out)
 	return 0;
 }
 
 static int __chksum_finup(u32 *crcp, const u8 *data, unsigned int len, u8 *out)
 {
-	put_unaligned_le32(~__crc32c_le_base(*crcp, data, len), out);
+	put_unaligned_le32(~crc32c_le_base(*crcp, data, len), out);
 	return 0;
 }
 
 static int __chksum_finup_arch(u32 *crcp, const u8 *data, unsigned int len,
 			       u8 *out)
@@ -198,16 +198,16 @@ static struct shash_alg algs[] = {{
 }};
 
 static int __init crc32c_mod_init(void)
 {
 	/* register the arch flavor only if it differs from the generic one */
-	return crypto_register_shashes(algs, 1 + (&__crc32c_le != &__crc32c_le_base));
+	return crypto_register_shashes(algs, 1 + (&__crc32c_le != &crc32c_le_base));
 }
 
 static void __exit crc32c_mod_fini(void)
 {
-	crypto_unregister_shashes(algs, 1 + (&__crc32c_le != &__crc32c_le_base));
+	crypto_unregister_shashes(algs, 1 + (&__crc32c_le != &crc32c_le_base));
 }
 
 subsys_initcall(crc32c_mod_init);
 module_exit(crc32c_mod_fini);
 
diff --git a/include/linux/crc32.h b/include/linux/crc32.h
index 87f788c0d607..5b07fc9081c4 100644
--- a/include/linux/crc32.h
+++ b/include/linux/crc32.h
@@ -37,11 +37,11 @@ static inline u32 crc32_le_combine(u32 crc1, u32 crc2, size_t len2)
 {
 	return crc32_le_shift(crc1, len2) ^ crc2;
 }
 
 u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len);
-u32 __pure __crc32c_le_base(u32 crc, unsigned char const *p, size_t len);
+u32 __pure crc32c_le_base(u32 crc, unsigned char const *p, size_t len);
 
 /**
  * __crc32c_le_combine - Combine two crc32c check values into one. For two
  * 			 sequences of bytes, seq1 and seq2 with lengths len1
  * 			 and len2, __crc32c_le() check values were calculated
diff --git a/lib/crc32.c b/lib/crc32.c
index ff587fee3893..c67059b0082b 100644
--- a/lib/crc32.c
+++ b/lib/crc32.c
@@ -205,12 +205,12 @@ EXPORT_SYMBOL(crc32_le);
 EXPORT_SYMBOL(__crc32c_le);
 
 u32 __pure crc32_le_base(u32, unsigned char const *, size_t) __alias(crc32_le);
 EXPORT_SYMBOL(crc32_le_base);
 
-u32 __pure __crc32c_le_base(u32, unsigned char const *, size_t) __alias(__crc32c_le);
-EXPORT_SYMBOL(__crc32c_le_base);
+u32 __pure crc32c_le_base(u32, unsigned char const *, size_t) __alias(__crc32c_le);
+EXPORT_SYMBOL(crc32c_le_base);
 
 u32 __pure crc32_be_base(u32, unsigned char const *, size_t) __alias(crc32_be);
 
 /*
  * This multiplies the polynomials x and y modulo the given modulus.
diff --git a/lib/crc32test.c b/lib/crc32test.c
index 03cf5c1f2f5d..30b8da4d8be4 100644
--- a/lib/crc32test.c
+++ b/lib/crc32test.c
@@ -824,11 +824,11 @@ static void crc32test_regenerate(void)
 	for (i = 0; i < ARRAY_SIZE(test); i++) {
 		pr_info("{0x%08x, 0x%08x, 0x%08x, 0x%08x, 0x%08x, 0x%08x},\n",
 			test[i].crc, test[i].start, test[i].length,
 			crc32_le_base(test[i].crc, test_buf + test[i].start, test[i].length),
 			crc32_be_base(test[i].crc, test_buf + test[i].start, test[i].length),
-			__crc32c_le_base(test[i].crc, test_buf + test[i].start, test[i].length));
+			crc32c_le_base(test[i].crc, test_buf + test[i].start, test[i].length));
 	}
 }
 
 static int __init crc32test_init(void)
 {
-- 
2.47.0



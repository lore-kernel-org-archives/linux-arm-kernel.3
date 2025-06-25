Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABCDC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 09:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmk1ZYv8Vqnkp3j2taSYxgOhWaWsh5xUu3yydRBxIZ8=; b=a+HB4sjZIsESKeXIa6fKeTKg+f
	7qQ8V5TdlThpQiBQGvIbESI6fsvZ+Bgk36tJtsLI3gxLkJJ6rhVAkh9Sug6HSDi1ZF3z0PCoas8ta
	1OeBAec6I0ZkoE7eZFSKPkGHvqvL9i7U0g05ojPZceiqqKUB+SpRW/WweiZX3YW9RRCzRZxz1qVkr
	VNWopoG6/skWesZEfK2KXkMp/idKIvZA4tIf22yM2mdnPYSt0zeHItl7OAM4lXWFKsDwrCpMVolcO
	W7a/PK/wpZ/pzPsSCvZO+uKQpuFjgd+N1QxD0U8LBRstyexw//FErkw7+sTHKRgyGDwViQZEENSy3
	MHxBA6Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMp5-00000008D4Z-01yR;
	Wed, 25 Jun 2025 09:53:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKHF-00000007lPp-11CW;
	Wed, 25 Jun 2025 07:10:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jmk1ZYv8Vqnkp3j2taSYxgOhWaWsh5xUu3yydRBxIZ8=; b=g0Y1OunpDTunZHd8OWZQ+qNerW
	swQJsFe6Fsn1u+0X2e+kE9dFTKH5Gv/QTdeCAHHw7KNzqjgwSTUJx0i2uQrD/K0yu/KBnM4O8NKbW
	V/wRjDmztSkXqepluktC79SDWcLvpI4/9feIz70Qnvfetty0O9x7ZFm5ctRjQqQ/Dg4ZWgMXQVB98
	EhofZXCfnQK+FBQd3IqokQwPJtJ0OV4Z6WNxhtyTHtBqJ3PrU5C+JrMuP32Np7H3O5UAH4caNxR7x
	tX9o4E4xvCq/jF9cyGjtZlDkP5wg3PMnJL8nsH//pnLHC4ZMCmBRm+AHWqVAzBIqc2GXI0S4mRlVU
	MnNBSwnA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKHB-00000005ddH-0SzM;
	Wed, 25 Jun 2025 07:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDE755C64E2;
	Wed, 25 Jun 2025 07:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB70C4CEF7;
	Wed, 25 Jun 2025 07:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835429;
	bh=wPEV3rkHpzYVStrK7S+qOEmN99dY6Jna9uLe/dZKuSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bHR0hOQpGCME4HCeGmCX904RXEPw/TVTjCShb++7vtpvuct9mHCrY3zmjEN3EOY1V
	 oc+LTrVLqyi0cKlotcCmSMOB8FKkw8Dd3Fy/b+uePu/qdN6BNQBAULp46mdxxZtTj3
	 mdwTUDBLqYDpifbNeaaeQ5Y0kDbuqjpG5o21k3CGocmTX9Rt78RohLYMG8qkf7vOYp
	 zusgIsPmXgmfMQwmrJPjaMjLTcMADjv8xcxlZYNroQzTFFD97pk5zBP3xV6LX1woWw
	 Qh1iNmOM11c5oKDqBHtp99vPiRBuJPm7QlmTpXX//ENMsdxfQKSS7wycNxJQTFVEuC
	 E+nYupYb1ivkQ==
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
Subject: [PATCH 04/18] lib/crypto: sha512: Reorder some code in sha512.c
Date: Wed, 25 Jun 2025 00:08:05 -0700
Message-ID: <20250625070819.1496119-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_081033_455410_FE459517 
X-CRM114-Status: GOOD (  12.20  )
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

Put the IVs before the round constants, since the IVs are used first.

Put __sha512_final() just above sha384_final() and sha512_final(), which
are the functions that call it.

No code changes other than reordering.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/sha512.c | 72 ++++++++++++++++++++++-----------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/lib/crypto/sha512.c b/lib/crypto/sha512.c
index e650e2c3317b1..fe9d98b9b7db9 100644
--- a/lib/crypto/sha512.c
+++ b/lib/crypto/sha512.c
@@ -14,10 +14,24 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/wordpart.h>
 
+static const struct sha512_block_state sha384_iv = {
+	.h = {
+		SHA384_H0, SHA384_H1, SHA384_H2, SHA384_H3,
+		SHA384_H4, SHA384_H5, SHA384_H6, SHA384_H7,
+	},
+};
+
+static const struct sha512_block_state sha512_iv = {
+	.h = {
+		SHA512_H0, SHA512_H1, SHA512_H2, SHA512_H3,
+		SHA512_H4, SHA512_H5, SHA512_H6, SHA512_H7,
+	},
+};
+
 static const u64 sha512_K[80] = {
 	0x428a2f98d728ae22ULL, 0x7137449123ef65cdULL, 0xb5c0fbcfec4d3b2fULL,
 	0xe9b5dba58189dbbcULL, 0x3956c25bf348b538ULL, 0x59f111f1b605d019ULL,
 	0x923f82a4af194f9bULL, 0xab1c5ed5da6d8118ULL, 0xd807aa98a3030242ULL,
 	0x12835b0145706fbeULL, 0x243185be4ee4b28cULL, 0x550c7dc3d5ffb4e2ULL,
@@ -44,24 +58,10 @@ static const u64 sha512_K[80] = {
 	0x28db77f523047d84ULL, 0x32caab7b40c72493ULL, 0x3c9ebe0a15c9bebcULL,
 	0x431d67c49c100d4cULL, 0x4cc5d4becb3e42b6ULL, 0x597f299cfc657e2aULL,
 	0x5fcb6fab3ad6faecULL, 0x6c44198c4a475817ULL,
 };
 
-static const struct sha512_block_state sha384_iv = {
-	.h = {
-		SHA384_H0, SHA384_H1, SHA384_H2, SHA384_H3,
-		SHA384_H4, SHA384_H5, SHA384_H6, SHA384_H7,
-	},
-};
-
-static const struct sha512_block_state sha512_iv = {
-	.h = {
-		SHA512_H0, SHA512_H1, SHA512_H2, SHA512_H3,
-		SHA512_H4, SHA512_H5, SHA512_H6, SHA512_H7,
-	},
-};
-
 #define Ch(x, y, z) ((z) ^ ((x) & ((y) ^ (z))))
 #define Maj(x, y, z) (((x) & (y)) | ((z) & ((x) | (y))))
 #define e0(x) (ror64((x), 28) ^ ror64((x), 34) ^ ror64((x), 39))
 #define e1(x) (ror64((x), 14) ^ ror64((x), 18) ^ ror64((x), 41))
 #define s0(x) (ror64((x), 1) ^ ror64((x), 8) ^ ((x) >> 7))
@@ -134,32 +134,10 @@ sha512_blocks_generic(struct sha512_block_state *state,
 #include "sha512.h" /* $(SRCARCH)/sha512.h */
 #else
 #define sha512_blocks sha512_blocks_generic
 #endif
 
-static void __sha512_final(struct __sha512_ctx *ctx,
-			   u8 *out, size_t digest_size)
-{
-	u64 bitcount_hi = (ctx->bytecount_hi << 3) | (ctx->bytecount_lo >> 61);
-	u64 bitcount_lo = ctx->bytecount_lo << 3;
-	size_t partial = ctx->bytecount_lo % SHA512_BLOCK_SIZE;
-
-	ctx->buf[partial++] = 0x80;
-	if (partial > SHA512_BLOCK_SIZE - 16) {
-		memset(&ctx->buf[partial], 0, SHA512_BLOCK_SIZE - partial);
-		sha512_blocks(&ctx->state, ctx->buf, 1);
-		partial = 0;
-	}
-	memset(&ctx->buf[partial], 0, SHA512_BLOCK_SIZE - 16 - partial);
-	*(__be64 *)&ctx->buf[SHA512_BLOCK_SIZE - 16] = cpu_to_be64(bitcount_hi);
-	*(__be64 *)&ctx->buf[SHA512_BLOCK_SIZE - 8] = cpu_to_be64(bitcount_lo);
-	sha512_blocks(&ctx->state, ctx->buf, 1);
-
-	for (size_t i = 0; i < digest_size; i += 8)
-		put_unaligned_be64(ctx->state.h[i / 8], out + i);
-}
-
 static void __sha512_init(struct __sha512_ctx *ctx,
 			  const struct sha512_block_state *iv,
 			  u64 initial_bytecount)
 {
 	ctx->state = *iv;
@@ -211,10 +189,32 @@ void __sha512_update(struct __sha512_ctx *ctx, const u8 *data, size_t len)
 	if (len)
 		memcpy(&ctx->buf[partial], data, len);
 }
 EXPORT_SYMBOL_GPL(__sha512_update);
 
+static void __sha512_final(struct __sha512_ctx *ctx,
+			   u8 *out, size_t digest_size)
+{
+	u64 bitcount_hi = (ctx->bytecount_hi << 3) | (ctx->bytecount_lo >> 61);
+	u64 bitcount_lo = ctx->bytecount_lo << 3;
+	size_t partial = ctx->bytecount_lo % SHA512_BLOCK_SIZE;
+
+	ctx->buf[partial++] = 0x80;
+	if (partial > SHA512_BLOCK_SIZE - 16) {
+		memset(&ctx->buf[partial], 0, SHA512_BLOCK_SIZE - partial);
+		sha512_blocks(&ctx->state, ctx->buf, 1);
+		partial = 0;
+	}
+	memset(&ctx->buf[partial], 0, SHA512_BLOCK_SIZE - 16 - partial);
+	*(__be64 *)&ctx->buf[SHA512_BLOCK_SIZE - 16] = cpu_to_be64(bitcount_hi);
+	*(__be64 *)&ctx->buf[SHA512_BLOCK_SIZE - 8] = cpu_to_be64(bitcount_lo);
+	sha512_blocks(&ctx->state, ctx->buf, 1);
+
+	for (size_t i = 0; i < digest_size; i += 8)
+		put_unaligned_be64(ctx->state.h[i / 8], out + i);
+}
+
 void sha384_final(struct sha384_ctx *ctx, u8 out[SHA384_DIGEST_SIZE])
 {
 	__sha512_final(&ctx->ctx, out, SHA384_DIGEST_SIZE);
 	memzero_explicit(ctx, sizeof(*ctx));
 }
-- 
2.50.0



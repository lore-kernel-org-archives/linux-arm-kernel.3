Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E0CC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 07:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHtYeLfcxPt6tkSx5THYp4Q4BiufLUsgip9qC/sOP2s=; b=hhF3q1SaTAamwRCvw+L2B6pJAq
	8PUV1kT0qcJkeZlXzhNrGBUJcrUETl20St0gpCZRxn8/TyOUu5mEA+wykZ498ZcRFKS3HiBmGv/lR
	dU1Xh0G7+TIO1NnM372G+QK9wSjSRb+DsDU+CDB32VAkmdzmVYVo6hJ88fNuJ2MF5zDX0TuFrGDAN
	udyKwfwjL6y/A29is6N+iVAlXQYjmmJVEKVeDKoU1ngl4E9Q7RyqZGKuzNSg93ydTtnNQYlWt8XpL
	jHNY3GJyycLCYn8+T/BJ/BEGxiPnYydyT8uV2H8EsbsNNfCnTWLjWuQ1PoC0T/Oo8dBXVkXm8Qz9c
	YEBHg/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKgE-00000007ptl-0G7s;
	Wed, 25 Jun 2025 07:36:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKHD-00000007lOa-2bvB;
	Wed, 25 Jun 2025 07:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RHtYeLfcxPt6tkSx5THYp4Q4BiufLUsgip9qC/sOP2s=; b=j1rM+5VsQ28CaGlzBJGokU3t2T
	XoU5tyadUB51gE4ogSzR3lx8oGXqqMsjqGTO7MsyZ+9t56DOY0DfF3w/qqrsrYcNRi+ZjGKLJ37uv
	tK4tC6b24zlH826KgT+/r1YJoD+1wl/Uz6YI5NkWGQ2ETcnYqFBDweCGd7AVkaN7WcaQaWTomvwPv
	UNcOxTI2ovrgxmO6QD+mAgDx7bfMQJexABFC9SfSXlZlVCe2r2iJBSgqsrTd7+Gc/alq6P3jqcXSu
	QoXpJ+zzPK977nNkIcoRauKxb55C1YU/Em5+qyb13u0Bj+Yi+5S3R7KaiiV6nXdOiS99EBkJIEy5N
	c1AqCdfw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKHB-00000005ddC-03nE;
	Wed, 25 Jun 2025 07:10:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AEEA34AFE0;
	Wed, 25 Jun 2025 07:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A21C4CEF8;
	Wed, 25 Jun 2025 07:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835428;
	bh=MVpW9jOYl5nfA5iSMc4oN4R/qeu/fhMbVZxtFi5zdFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eaWrFSUhcCI7riLUfFOXOKpU7RRqzyayHnNsr0WqvQSAzXanOJBDrb0E5xCtJtois
	 8LShoehuDb1UkTBdzvjnDGljGp3yrYnOf2GxQfhGzZJE6b/KqYJikZ8wgjHjdNfNPi
	 mSTR1FAb33fdLl/btE0meQ09o5r4K6cPrIg9STvdmgXdU1T4r2tm+MQ235u9xHlGPe
	 cdGa0cns8ZIr3XYa0cJBGr4rbTwGYLKfBa7QGwMZwnJsPNjVGxQI3of78cc5JJiyZm
	 wU21Gged0J0nqc1T/laJis8r+d0qh5/kKhXdRXWILByu9uENEwQX2fTTLyncyq9hrE
	 LX8wskdgDHsZg==
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
Subject: [PATCH 03/18] crypto: sha512 - Use the correct legacy export format
Date: Wed, 25 Jun 2025 00:08:04 -0700
Message-ID: <20250625070819.1496119-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_081033_271717_ED56299C 
X-CRM114-Status: GOOD (  12.37  )
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

It appears the legacy export format is intended to have the value of the
bytecount field be block-aligned, so update __crypto_sha512_export() and
__crypto_sha512_import() to match.

Fixes: e62c2fe56418 ("crypto: sha512 - Use same state format as legacy drivers")
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/sha512.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/crypto/sha512.c b/crypto/sha512.c
index 0eed801346018..5bda259dd22fe 100644
--- a/crypto/sha512.c
+++ b/crypto/sha512.c
@@ -13,30 +13,42 @@
 #include <linux/module.h>
 
 /*
  * Export and import functions.  crypto_shash wants a particular format that
  * matches that used by some legacy drivers.  It currently is the same as the
- * library SHA context but with the partial block length as a u8 appended to it.
+ * library SHA context, except the value in bytecount_lo must be block-aligned
+ * and the remainder must be stored in an extra u8 appended to the struct.
  */
 
 #define SHA512_SHASH_STATE_SIZE 209
 static_assert(offsetof(struct __sha512_ctx, state) == 0);
 static_assert(offsetof(struct __sha512_ctx, bytecount_lo) == 64);
 static_assert(offsetof(struct __sha512_ctx, bytecount_hi) == 72);
 static_assert(offsetof(struct __sha512_ctx, buf) == 80);
 static_assert(sizeof(struct __sha512_ctx) + 1 == SHA512_SHASH_STATE_SIZE);
 
-static int __crypto_sha512_export(const struct __sha512_ctx *ctx, void *out)
+static int __crypto_sha512_export(const struct __sha512_ctx *ctx0, void *out)
 {
-	memcpy(out, ctx, sizeof(*ctx));
-	*((u8 *)out + sizeof(*ctx)) = ctx->bytecount_lo % SHA512_BLOCK_SIZE;
+	struct __sha512_ctx ctx = *ctx0;
+	unsigned int partial;
+	u8 *p = out;
+
+	partial = ctx.bytecount_lo % SHA512_BLOCK_SIZE;
+	ctx.bytecount_lo -= partial;
+	memcpy(p, &ctx, sizeof(ctx));
+	p += sizeof(ctx);
+	*p = partial;
 	return 0;
 }
 
 static int __crypto_sha512_import(struct __sha512_ctx *ctx, const void *in)
 {
-	memcpy(ctx, in, sizeof(*ctx));
+	const u8 *p = in;
+
+	memcpy(ctx, p, sizeof(*ctx));
+	p += sizeof(*ctx);
+	ctx->bytecount_lo += *p;
 	return 0;
 }
 
 /* SHA-384 */
 
-- 
2.50.0



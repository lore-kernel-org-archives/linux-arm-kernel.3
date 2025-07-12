Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518F1C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 23:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBXmGPyzm39EayQQByHvaKGoY+wt76BzZ26phBx0Vfc=; b=edoeKyIVTDoCifwqm1ZF/c/O/T
	fzFShaF9sNVtuORLKXMjLZaL20Kzwsj0ZnOvvz/EAxWe8BdvvsR26cSCXtBoROZ+ceNe7oZkfgYFi
	fRCasq5bcP5YX8UqwojhqqiUNppe4WKm6EQbJIPboayB0v7ilfpjPExo9aUveMsdKpjIPswSU73U8
	ShbYyZzAANqKg2E+Jidyox2gUeVhuRAgWQxM5AVMxOyj4a8Fi/L08JXWwSGD6m57YjAo5lekYpV8O
	1I+/YPaOQ/FwMwl/29CXq8gj59lhOyAtr1PglPV/EDbLMgnUNlYUBKr/6P6t/lRqrk4kx28/IT5oH
	MVhYLpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajgg-0000000H97V-0UPl;
	Sat, 12 Jul 2025 23:31:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajbr-0000000H7VE-1QLg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 23:26:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BF9160007;
	Sat, 12 Jul 2025 23:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F89CC4CEF1;
	Sat, 12 Jul 2025 23:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362780;
	bh=8Vb27gWyZe63wNRoxap9QiheYDb0OlWgd9TqwRTjPok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FLdhoQ9O/rEdQQwDfB++qTeJwUvBRaf0giyFlD0IE9HPCHMIxwRbbPZX6O9u0CZjm
	 1S7td9m5IXWuVpnSg/lTQZoSA8mLrhcxCEDqQskG1J2oHW5dy7RINPivna14fk/R8B
	 gWAVbX+5VllXd3iKDgmQQHr9MQexHmWBc6Z7aOQc4C9Fwh4fK6K91WkCXRGU1rSLYk
	 6jWE5tjg5pnd6IcAkotb4VGlAL+H2SxWbnMZRfBajfIAsz67vR45SAVVWMThixpDBx
	 g4AqUUXLUdKDs0Wb0sr/Mv7RDTWACPNNTvEudIe/btKC3CDRVi5U5opkfD1yPWVEvt
	 DswyfbkvbZOAg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 01/26] crypto: x86/sha1 - Rename conflicting symbol
Date: Sat, 12 Jul 2025 16:22:52 -0700
Message-ID: <20250712232329.818226-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
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

Rename x86's sha1_update() to sha1_update_x86(), since it conflicts with
the upcoming sha1_update() library function.

Note: the affected code will be superseded by later commits that migrate
the arch-optimized SHA-1 code into the library.  This commit simply
keeps the kernel building for the initial introduction of the library.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/x86/crypto/sha1_ssse3_glue.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/crypto/sha1_ssse3_glue.c b/arch/x86/crypto/sha1_ssse3_glue.c
index 0a912bfc86c51..826579a7473c4 100644
--- a/arch/x86/crypto/sha1_ssse3_glue.c
+++ b/arch/x86/crypto/sha1_ssse3_glue.c
@@ -32,11 +32,11 @@ static const struct x86_cpu_id module_cpu_ids[] = {
 	X86_MATCH_FEATURE(X86_FEATURE_SSSE3, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, module_cpu_ids);
 
-static inline int sha1_update(struct shash_desc *desc, const u8 *data,
+static inline int sha1_update_x86(struct shash_desc *desc, const u8 *data,
 			      unsigned int len, sha1_block_fn *sha1_xform)
 {
 	int remain;
 
 	/*
@@ -67,11 +67,11 @@ asmlinkage void sha1_transform_ssse3(struct sha1_state *state,
 				     const u8 *data, int blocks);
 
 static int sha1_ssse3_update(struct shash_desc *desc, const u8 *data,
 			     unsigned int len)
 {
-	return sha1_update(desc, data, len, sha1_transform_ssse3);
+	return sha1_update_x86(desc, data, len, sha1_transform_ssse3);
 }
 
 static int sha1_ssse3_finup(struct shash_desc *desc, const u8 *data,
 			      unsigned int len, u8 *out)
 {
@@ -111,11 +111,11 @@ asmlinkage void sha1_transform_avx(struct sha1_state *state,
 				   const u8 *data, int blocks);
 
 static int sha1_avx_update(struct shash_desc *desc, const u8 *data,
 			     unsigned int len)
 {
-	return sha1_update(desc, data, len, sha1_transform_avx);
+	return sha1_update_x86(desc, data, len, sha1_transform_avx);
 }
 
 static int sha1_avx_finup(struct shash_desc *desc, const u8 *data,
 			      unsigned int len, u8 *out)
 {
@@ -188,11 +188,11 @@ static inline void sha1_apply_transform_avx2(struct sha1_state *state,
 }
 
 static int sha1_avx2_update(struct shash_desc *desc, const u8 *data,
 			     unsigned int len)
 {
-	return sha1_update(desc, data, len, sha1_apply_transform_avx2);
+	return sha1_update_x86(desc, data, len, sha1_apply_transform_avx2);
 }
 
 static int sha1_avx2_finup(struct shash_desc *desc, const u8 *data,
 			      unsigned int len, u8 *out)
 {
@@ -232,11 +232,11 @@ asmlinkage void sha1_ni_transform(struct sha1_state *digest, const u8 *data,
 				  int rounds);
 
 static int sha1_ni_update(struct shash_desc *desc, const u8 *data,
 			     unsigned int len)
 {
-	return sha1_update(desc, data, len, sha1_ni_transform);
+	return sha1_update_x86(desc, data, len, sha1_ni_transform);
 }
 
 static int sha1_ni_finup(struct shash_desc *desc, const u8 *data,
 			      unsigned int len, u8 *out)
 {
-- 
2.50.1



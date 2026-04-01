Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFB510F9316
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 00:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4yXrfGPm8zPPoTQNcjBrtov6wyDACyl7e9xrdBso4o=; b=sRgJXFEPhkW2PYpPHjZ+uBANGy
	dbugDnYCUGAP3315Nn6QzisiW3JMh0QzkpxfP4ioS1FwbgpLZywUWYeJupE5roRxJuRz7llwAgzWL
	tewyj21g3/nNMjaNaNiO9c7QFDVP4O7+667ZcfpytGSTZe7Ax0Q74hxigFAwq2teKBB3YkUtEGI1t
	5AuFxoVzqd5Br6CakLbPoVu0NeqM/ceeJBIswodQYx+24EPBtc/Zh0omJ2XV5xHbhPyr5fsEi5ywz
	QULrfdkjLhRR4whnK3jwEVVb8GNZQSGk4E4XduRZ2Qb3XkE2BPH+br+yqCZczpVKjOgCRXUHNaFB1
	MVkqk6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7m-0000000DiFv-3uJ7;
	Wed, 01 Apr 2026 00:07:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7f-0000000DiBd-0Db9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 00:07:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C037243E4B;
	Wed,  1 Apr 2026 00:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B457C2BCB3;
	Wed,  1 Apr 2026 00:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775002070;
	bh=lMl6Llb6SKdL6D1zgOk+w6G/KGWKdefJM1MFe8cedTY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d2PAyarZnxFpl6bvbCZYNUP1+rkfXxWgt+4MxWncO6fhwgsOwE0CXriXvLc61Szij
	 dJETPQA9L+XuNjEWDoShv+7YLByys1tmpYDprg9gI0AAIysOozOoItbBgdnwFO3+gf
	 v4cAKKnTtHLNmcNSTAEgXuaaXnKXsgPGvYcN6yGQxFj8mMxSuzOSMnwoonoyEytV8L
	 YmhkDE/F71A/Jon5LY7To5UGsD2tPacVEUrmIa27jDukiHbrisVrvlX+Ba+RtwvfpJ
	 EbAQ6FxbglMwrf+IdHlvOLgvUZ+otsqBgN/zcpKPPO8T+ihi1sHAaTePb29Pegbxet
	 LVnHbHCPmhAwA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 5/9] lib/crypto: arm64/sha1: Remove obsolete chunking logic
Date: Tue, 31 Mar 2026 17:05:44 -0700
Message-ID: <20260401000548.133151-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401000548.133151-1-ebiggers@kernel.org>
References: <20260401000548.133151-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_170751_175191_8EE40DC1 
X-CRM114-Status: GOOD (  11.35  )
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

Since commit aefbab8e77eb ("arm64: fpsimd: Preserve/restore kernel mode
NEON at context switch"), kernel-mode NEON sections have been
preemptible on arm64.  And since commit 7dadeaa6e851 ("sched: Further
restrict the preemption modes"), voluntary preemption is no longer
supported on arm64 either.  Therefore, there's no longer any need to
limit the length of kernel-mode NEON sections on arm64.

Simplify the SHA-1 code accordingly.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/arm64/sha1-ce-core.S | 14 +++++---------
 lib/crypto/arm64/sha1.h         | 15 ++++-----------
 2 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/lib/crypto/arm64/sha1-ce-core.S b/lib/crypto/arm64/sha1-ce-core.S
index 8fbd4767f0f0..59d27fda0714 100644
--- a/lib/crypto/arm64/sha1-ce-core.S
+++ b/lib/crypto/arm64/sha1-ce-core.S
@@ -60,14 +60,14 @@
 	movk		\tmp, :abs_g1:\val
 	dup		\k, \tmp
 	.endm
 
 	/*
-	 * size_t __sha1_ce_transform(struct sha1_block_state *state,
-	 *			      const u8 *data, size_t nblocks);
+	 * void sha1_ce_transform(struct sha1_block_state *state,
+	 *			  const u8 *data, size_t nblocks);
 	 */
-SYM_FUNC_START(__sha1_ce_transform)
+SYM_FUNC_START(sha1_ce_transform)
 	/* load round constants */
 	loadrc		k0.4s, 0x5a827999, w6
 	loadrc		k1.4s, 0x6ed9eba1, w6
 	loadrc		k2.4s, 0x8f1bbcdc, w6
 	loadrc		k3.4s, 0xca62c1d6, w6
@@ -114,17 +114,13 @@ CPU_LE(	rev32		v11.16b, v11.16b	)
 
 	/* update state */
 	add		dgbv.2s, dgbv.2s, dg1v.2s
 	add		dgav.4s, dgav.4s, dg0v.4s
 
-	/* return early if voluntary preemption is needed */
-	cond_yield	1f, x5, x6
-
 	/* handled all input blocks? */
 	cbnz		x2, 0b
 
 	/* store new state */
-1:	st1		{dgav.4s}, [x0]
+	st1		{dgav.4s}, [x0]
 	str		dgb, [x0, #16]
-	mov		x0, x2
 	ret
-SYM_FUNC_END(__sha1_ce_transform)
+SYM_FUNC_END(sha1_ce_transform)
diff --git a/lib/crypto/arm64/sha1.h b/lib/crypto/arm64/sha1.h
index bc7071f1be09..112c5d443c56 100644
--- a/lib/crypto/arm64/sha1.h
+++ b/lib/crypto/arm64/sha1.h
@@ -7,26 +7,19 @@
 #include <asm/simd.h>
 #include <linux/cpufeature.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_ce);
 
-asmlinkage size_t __sha1_ce_transform(struct sha1_block_state *state,
-				      const u8 *data, size_t nblocks);
+asmlinkage void sha1_ce_transform(struct sha1_block_state *state,
+				  const u8 *data, size_t nblocks);
 
 static void sha1_blocks(struct sha1_block_state *state,
 			const u8 *data, size_t nblocks)
 {
 	if (static_branch_likely(&have_ce) && likely(may_use_simd())) {
-		do {
-			size_t rem;
-
-			scoped_ksimd()
-				rem = __sha1_ce_transform(state, data, nblocks);
-
-			data += (nblocks - rem) * SHA1_BLOCK_SIZE;
-			nblocks = rem;
-		} while (nblocks);
+		scoped_ksimd()
+			sha1_ce_transform(state, data, nblocks);
 	} else {
 		sha1_blocks_generic(state, data, nblocks);
 	}
 }
 
-- 
2.53.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6141C10F9312
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 00:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFGZ1KSl8cyzlCha+VJ5ryRukBYh13GZXh92bRIoPxA=; b=xiLR2r1bhOj52AT3kAIX+nlL3M
	3kVT0tEdV2l4uOrIiAdW1CF7IZRDS4YeidCUlmu8SRzi9BgsNGdvZthgjdqNmKb9N8oimvlPYs6A+
	8inYvA5gMSa8XevSM/BtHy4+eKcr1jp2KPGLaAE/JGK1ZTkSsEkfaNTtvvMp9qsyLeoW69viVm2gq
	jOWvlffwGHjQ+714JhcokXK9i+8LHRyJdoGFBeFo51Axe72qeDilXcR/H6XrbvX8q1cuPfsvqYtje
	OCxAlj42j2D3oxIn1VdU8ttv+l37AUBbENgl1WgTZBlNlWwGjHPVBoPIi3bJYpjzd5vCu0qYG3CWY
	J50yWz1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7l-0000000DiEF-3CtG;
	Wed, 01 Apr 2026 00:07:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7e-0000000DiBO-3xE4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 00:07:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B1B560130;
	Wed,  1 Apr 2026 00:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D76C19423;
	Wed,  1 Apr 2026 00:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775002069;
	bh=Xl+MsNWe1/r1+hTDGoE1qKiqas9gp7xrKlVQjVUdCyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IHCmaKJnLmp8V/FAp6FPJYNBZjtGPcpCLhe/EPJAX/ErJ9mrsrR4bH+PtTECPSDQ7
	 VtVox40YNbtQ4mSLUgeDVtJzRU9/o5p/B2Ni9x0yb+l8aFFVJxKCV4OBF5FweuKeSU
	 A8JkWfVi+pFwRvLsBohwrVDy6MpSNBPL6kbmw5l/tZ+azQAGqCd+H2PYW1rG+hUEWY
	 VRWnz+dY56ME2qUUwYCFtOnsshwg86V5LCvEL+xQ5PeI5d6zVbbpEUZ4s3kWfhJnnU
	 k3Sh0vpSqpxN8F4rtoqlEUeBzbSnG72unkrZwYpF84hqfMMvnxfjbsmBhE/Xzjnw+8
	 UUHFjmaB5I3wQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 3/9] lib/crypto: arm64/gf128hash: Remove obsolete chunking logic
Date: Tue, 31 Mar 2026 17:05:42 -0700
Message-ID: <20260401000548.133151-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401000548.133151-1-ebiggers@kernel.org>
References: <20260401000548.133151-1-ebiggers@kernel.org>
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

Since commit aefbab8e77eb ("arm64: fpsimd: Preserve/restore kernel mode
NEON at context switch"), kernel-mode NEON sections have been
preemptible on arm64.  And since commit 7dadeaa6e851 ("sched: Further
restrict the preemption modes"), voluntary preemption is no longer
supported on arm64 either.  Therefore, there's no longer any need to
limit the length of kernel-mode NEON sections on arm64.

Simplify the GHASH and POLYVAL code accordingly.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/arm64/gf128hash.h | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/lib/crypto/arm64/gf128hash.h b/lib/crypto/arm64/gf128hash.h
index b2c85585b758..1d1179f87f8d 100644
--- a/lib/crypto/arm64/gf128hash.h
+++ b/lib/crypto/arm64/gf128hash.h
@@ -87,20 +87,12 @@ static void polyval_mul_arch(struct polyval_elem *acc,
 static void ghash_blocks_arch(struct polyval_elem *acc,
 			      const struct ghash_key *key,
 			      const u8 *data, size_t nblocks)
 {
 	if (static_branch_likely(&have_asimd) && may_use_simd()) {
-		do {
-			/* Allow rescheduling every 4 KiB. */
-			size_t n = min_t(size_t, nblocks,
-					 4096 / GHASH_BLOCK_SIZE);
-
-			scoped_ksimd()
-				pmull_ghash_update_p8(n, acc, data, &key->h);
-			data += n * GHASH_BLOCK_SIZE;
-			nblocks -= n;
-		} while (nblocks);
+		scoped_ksimd()
+			pmull_ghash_update_p8(nblocks, acc, data, &key->h);
 	} else {
 		ghash_blocks_generic(acc, &key->h, data, nblocks);
 	}
 }
 
@@ -108,20 +100,12 @@ static void ghash_blocks_arch(struct polyval_elem *acc,
 static void polyval_blocks_arch(struct polyval_elem *acc,
 				const struct polyval_key *key,
 				const u8 *data, size_t nblocks)
 {
 	if (static_branch_likely(&have_pmull) && may_use_simd()) {
-		do {
-			/* Allow rescheduling every 4 KiB. */
-			size_t n = min_t(size_t, nblocks,
-					 4096 / POLYVAL_BLOCK_SIZE);
-
-			scoped_ksimd()
-				polyval_blocks_pmull(acc, key, data, n);
-			data += n * POLYVAL_BLOCK_SIZE;
-			nblocks -= n;
-		} while (nblocks);
+		scoped_ksimd()
+			polyval_blocks_pmull(acc, key, data, nblocks);
 	} else {
 		polyval_blocks_generic(acc, &key->h_powers[NUM_H_POWERS - 1],
 				       data, nblocks);
 	}
 }
-- 
2.53.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D39210F930F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 00:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Hw6ErJ1zhKaN6bwYhIEreRkuH0CUdDMOYJ01shufrY=; b=MSfyL1jxsIfqIWWUk1eUAGB+Pl
	p9iS00OwFg8pwXfrbVVd2rhYGGcNxVCaeMVkFesa1JHIni4+DF78KoLW6obnq/I55BOliab7SyMA5
	JKqoLkE0ylipLIFGs6rP1Ly7WvPSqiKZG2AKYHgM6+vTT2IKhsUUJQRKlNh5DBfGdItU4FOV2NKmG
	c1OkY1WVROtJIrh7LdYyn/UI7NCrwbuIV2NxhBqoKSodB2k8s/JQ3PQYT7ifPshQmQYy90H/pyL1n
	J0VaciTNA2PMOyKQsbUz1nJMaewY40TVZOrv8kvu535XqClf6ldwz4y5y5BZ1MroMhnyV447bAq78
	kaP6ZdCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7l-0000000DiDz-20Bg;
	Wed, 01 Apr 2026 00:07:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7d-0000000DiAn-3mIP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 00:07:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 75AB1441FB;
	Wed,  1 Apr 2026 00:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1F0C2BCB1;
	Wed,  1 Apr 2026 00:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775002069;
	bh=j3vg8XQEajSovL+s9UwD7AoOOlA0CLrK0i32Wlp9kDk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IlL9LCLqxyWcvhbtkZ+pUsJlNFKEdgIXGBUuGkbM8x5PWdMr//mGBvVTrMU7+PWJU
	 TG0/NYWkDnFcBJ0gn3kXWVNPvL94J9VpzT1QxSD3/axKGDwL+BSSkwsplfQU5rPOv7
	 xK2F97nl7PBY3wT5A45aJl7PQNLsCxkWUoSC+wO8QrWFW6uILXrhKnRJ9Nn//9GE2G
	 5IAA3JxG2A1qhIKUyrczQIrIZSYSFfSWQn+Hwq+RmeMEBCK6M0pupF7zk33iQFLxjG
	 U9zTcQnZXBmD/cAGJrfoR1VVZrVMn9hNGwGQ1v7YlHuUkieKEauI41PsUQUlFrKaWR
	 0BuA/tIEDGIkg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 2/9] lib/crypto: arm64/chacha: Remove obsolete chunking logic
Date: Tue, 31 Mar 2026 17:05:41 -0700
Message-ID: <20260401000548.133151-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401000548.133151-1-ebiggers@kernel.org>
References: <20260401000548.133151-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_170749_979046_5E3DB88D 
X-CRM114-Status: GOOD (  11.97  )
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

Simplify the ChaCha code accordingly.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/arm64/chacha.h | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/lib/crypto/arm64/chacha.h b/lib/crypto/arm64/chacha.h
index ca8c6a8b0578..c6f8ddf98e2d 100644
--- a/lib/crypto/arm64/chacha.h
+++ b/lib/crypto/arm64/chacha.h
@@ -34,13 +34,13 @@ asmlinkage void hchacha_block_neon(const struct chacha_state *state,
 				   u32 out[HCHACHA_OUT_WORDS], int nrounds);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 
 static void chacha_doneon(struct chacha_state *state, u8 *dst, const u8 *src,
-			  int bytes, int nrounds)
+			  unsigned int bytes, int nrounds)
 {
-	while (bytes > 0) {
+	while (bytes) {
 		int l = min(bytes, CHACHA_BLOCK_SIZE * 5);
 
 		if (l <= CHACHA_BLOCK_SIZE) {
 			u8 buf[CHACHA_BLOCK_SIZE];
 
@@ -74,20 +74,12 @@ static void chacha_crypt_arch(struct chacha_state *state, u8 *dst,
 {
 	if (!static_branch_likely(&have_neon) || bytes <= CHACHA_BLOCK_SIZE ||
 	    !crypto_simd_usable())
 		return chacha_crypt_generic(state, dst, src, bytes, nrounds);
 
-	do {
-		unsigned int todo = min_t(unsigned int, bytes, SZ_4K);
-
-		scoped_ksimd()
-			chacha_doneon(state, dst, src, todo, nrounds);
-
-		bytes -= todo;
-		src += todo;
-		dst += todo;
-	} while (bytes);
+	scoped_ksimd()
+		chacha_doneon(state, dst, src, bytes, nrounds);
 }
 
 #define chacha_mod_init_arch chacha_mod_init_arch
 static void chacha_mod_init_arch(void)
 {
-- 
2.53.0



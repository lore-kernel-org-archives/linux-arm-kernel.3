Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1812710F9311
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 00:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Pz1ewBkKZ6SAKR0ZmeyKKnBifHoLSU+aVr8M6HCcao=; b=0bMKaXBWMoPipVPazf0SFagRxM
	SdAVjD5WkrBdauLY5nXD8XOX2E/jKF3Cwc3ukw7DDQhr9+SijlJkbTZAx2q6wayNZ8okz/1FxWZkD
	zdpYCjKgTdrWvTYy8fx1wfG3r9JYWWaAOrnZpFiBllelrjcDLWGbiHUaI+l1JdExRUkWqinObHIuS
	GJCe1xPySgXFxxSnWHlzIJ4zDAhJ0tN5mcr7M4mOZ4cLqLCa3tTc7gpjW5nd6UOx4RKwA9q0AF9kj
	rkeJlnFvWo/wZIJBLm9yJfD7mAE0oI5NmqPVSgpnqiXjeUnsmgtaYtcqoGZ4tZQGXr6epmUrGVzbN
	M/Iq8OpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7m-0000000DiEY-0Ebw;
	Wed, 01 Apr 2026 00:07:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7d-0000000DiAl-3mFV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 00:07:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1880740687;
	Wed,  1 Apr 2026 00:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A12C2BCB0;
	Wed,  1 Apr 2026 00:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775002069;
	bh=QQ5mFKI5+uBNS64ELsUrgq6oqh/+Q+BmfI0QIv2/GuM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aqjb0dqGJVSdbX84cN3kcRLDWKnpsqEutYUmzk2VWkQ1HxO+/cWz7jD0nZ8R20CQi
	 /ai8DJSkK9Q7jCRTan2YBsl6kRpeW7Efc2O26yT9l9Zl8qn8Hd99kUiYnCOeNd4O0M
	 rGwLz4WeTTT4/9kixddS/iB/pHnXZUtlyy/wq01qwZd0pvpFj0Rw9NLP8TCHUA5vWe
	 P3/RqWKkvs8pCUUaLCUwWDOlJUzDrLkjjOXnivDXGDWSY5kRWngnaef8lfexYA/2dr
	 EghDBbuGLMCmrGkfQTe1SvFs93Cmc6Vth6toFWDyVgUBs80BLlvqo5bTF7WKUzphPc
	 /6BWsJhgQjTwg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 1/9] lib/crypto: arm64/aes: Remove obsolete chunking logic
Date: Tue, 31 Mar 2026 17:05:40 -0700
Message-ID: <20260401000548.133151-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401000548.133151-1-ebiggers@kernel.org>
References: <20260401000548.133151-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_170749_979237_4CFDB370 
X-CRM114-Status: GOOD (  14.33  )
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

Simplify the AES-CBC-MAC code accordingly.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/crypto/aes-ce-ccm-glue.c | 13 ++++-------
 include/crypto/aes.h                |  6 ++---
 lib/crypto/arm64/aes-modes.S        |  8 +++----
 lib/crypto/arm64/aes.h              | 35 +++++++++++------------------
 4 files changed, 23 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/crypto/aes-ce-ccm-glue.c b/arch/arm64/crypto/aes-ce-ccm-glue.c
index 45aed0073283..a304375ce724 100644
--- a/arch/arm64/crypto/aes-ce-ccm-glue.c
+++ b/arch/arm64/crypto/aes-ce-ccm-glue.c
@@ -99,20 +99,15 @@ static u32 ce_aes_ccm_auth_data(u8 mac[], u8 const in[], u32 abytes,
 
 	do {
 		u32 blocks = abytes / AES_BLOCK_SIZE;
 
 		if (macp == AES_BLOCK_SIZE || (!macp && blocks > 0)) {
-			u32 rem = ce_aes_mac_update(in, rk, rounds, blocks, mac,
-						    macp, enc_after);
-			u32 adv = (blocks - rem) * AES_BLOCK_SIZE;
-
+			ce_aes_mac_update(in, rk, rounds, blocks, mac, macp,
+					  enc_after);
 			macp = enc_after ? 0 : AES_BLOCK_SIZE;
-			in += adv;
-			abytes -= adv;
-
-			if (unlikely(rem))
-				macp = 0;
+			in += blocks * AES_BLOCK_SIZE;
+			abytes -= blocks * AES_BLOCK_SIZE;
 		} else {
 			u32 l = min(AES_BLOCK_SIZE - macp, abytes);
 
 			crypto_xor(&mac[macp], in, l);
 			in += l;
diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index 3feb4105c2a2..16fbfd93e2bd 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -228,13 +228,13 @@ asmlinkage void ce_aes_essiv_cbc_encrypt(u8 out[], u8 const in[],
 					 u32 const rk1[], int rounds,
 					 int blocks, u8 iv[], u32 const rk2[]);
 asmlinkage void ce_aes_essiv_cbc_decrypt(u8 out[], u8 const in[],
 					 u32 const rk1[], int rounds,
 					 int blocks, u8 iv[], u32 const rk2[]);
-asmlinkage size_t ce_aes_mac_update(u8 const in[], u32 const rk[], int rounds,
-				    size_t blocks, u8 dg[], int enc_before,
-				    int enc_after);
+asmlinkage void ce_aes_mac_update(u8 const in[], u32 const rk[], int rounds,
+				  size_t blocks, u8 dg[], int enc_before,
+				  int enc_after);
 #elif defined(CONFIG_PPC)
 void ppc_expand_key_128(u32 *key_enc, const u8 *key);
 void ppc_expand_key_192(u32 *key_enc, const u8 *key);
 void ppc_expand_key_256(u32 *key_enc, const u8 *key);
 void ppc_generate_decrypt_key(u32 *key_dec, u32 *key_enc, unsigned int key_len);
diff --git a/lib/crypto/arm64/aes-modes.S b/lib/crypto/arm64/aes-modes.S
index fc89cd02b642..10e537317eaf 100644
--- a/lib/crypto/arm64/aes-modes.S
+++ b/lib/crypto/arm64/aes-modes.S
@@ -815,13 +815,13 @@ AES_FUNC_START(aes_xts_decrypt)
 	b		.Lxtsdecctsout
 AES_FUNC_END(aes_xts_decrypt)
 
 #if IS_ENABLED(CONFIG_CRYPTO_LIB_AES_CBC_MACS)
 	/*
-	 * size_t aes_mac_update(u8 const in[], u32 const rk[], int rounds,
-	 *			 size_t blocks, u8 dg[], int enc_before,
-	 *			 int enc_after);
+	 * void aes_mac_update(u8 const in[], u32 const rk[], int rounds,
+	 *		       size_t blocks, u8 dg[], int enc_before,
+	 *		       int enc_after);
 	 */
 AES_FUNC_START(aes_mac_update)
 	ld1		{v0.16b}, [x4]			/* get dg */
 	enc_prepare	w2, x1, x7
 	cbz		w5, .Lmacloop4x
@@ -842,11 +842,10 @@ AES_FUNC_START(aes_mac_update)
 	cmp		x3, xzr
 	csinv		w5, w6, wzr, eq
 	cbz		w5, .Lmacout
 	encrypt_block	v0, w2, x1, x7, w8
 	st1		{v0.16b}, [x4]			/* return dg */
-	cond_yield	.Lmacout, x7, x8
 	b		.Lmacloop4x
 .Lmac1x:
 	add		x3, x3, #4
 .Lmacloop:
 	cbz		x3, .Lmacout
@@ -861,9 +860,8 @@ AES_FUNC_START(aes_mac_update)
 	encrypt_block	v0, w2, x1, x7, w8
 	b		.Lmacloop
 
 .Lmacout:
 	st1		{v0.16b}, [x4]			/* return dg */
-	mov		x0, x3
 	ret
 AES_FUNC_END(aes_mac_update)
 #endif /* CONFIG_CRYPTO_LIB_AES_CBC_MACS */
diff --git a/lib/crypto/arm64/aes.h b/lib/crypto/arm64/aes.h
index 135d3324a30a..9e9e45a6f787 100644
--- a/lib/crypto/arm64/aes.h
+++ b/lib/crypto/arm64/aes.h
@@ -27,13 +27,13 @@ asmlinkage void __aes_ce_encrypt(const u32 rk[], u8 out[AES_BLOCK_SIZE],
 asmlinkage void __aes_ce_decrypt(const u32 inv_rk[], u8 out[AES_BLOCK_SIZE],
 				 const u8 in[AES_BLOCK_SIZE], int rounds);
 asmlinkage u32 __aes_ce_sub(u32 l);
 asmlinkage void __aes_ce_invert(struct aes_block *out,
 				const struct aes_block *in);
-asmlinkage size_t neon_aes_mac_update(u8 const in[], u32 const rk[], int rounds,
-				      size_t blocks, u8 dg[], int enc_before,
-				      int enc_after);
+asmlinkage void neon_aes_mac_update(u8 const in[], u32 const rk[], int rounds,
+				    size_t blocks, u8 dg[], int enc_before,
+				    int enc_after);
 
 /*
  * Expand an AES key using the crypto extensions if supported and usable or
  * generic code otherwise.  The expanded key format is compatible between the
  * two cases.  The outputs are @rndkeys (required) and @inv_rndkeys (optional).
@@ -190,29 +190,20 @@ static bool aes_cbcmac_blocks_arch(u8 h[AES_BLOCK_SIZE],
 				   const struct aes_enckey *key, const u8 *data,
 				   size_t nblocks, bool enc_before,
 				   bool enc_after)
 {
 	if (static_branch_likely(&have_neon) && likely(may_use_simd())) {
-		do {
-			size_t rem;
-
-			scoped_ksimd() {
-				if (static_branch_likely(&have_aes))
-					rem = ce_aes_mac_update(
-						data, key->k.rndkeys,
-						key->nrounds, nblocks, h,
-						enc_before, enc_after);
-				else
-					rem = neon_aes_mac_update(
-						data, key->k.rndkeys,
-						key->nrounds, nblocks, h,
-						enc_before, enc_after);
-			}
-			data += (nblocks - rem) * AES_BLOCK_SIZE;
-			nblocks = rem;
-			enc_before = false;
-		} while (nblocks);
+		scoped_ksimd() {
+			if (static_branch_likely(&have_aes))
+				ce_aes_mac_update(data, key->k.rndkeys,
+						  key->nrounds, nblocks, h,
+						  enc_before, enc_after);
+			else
+				neon_aes_mac_update(data, key->k.rndkeys,
+						    key->nrounds, nblocks, h,
+						    enc_before, enc_after);
+		}
 		return true;
 	}
 	return false;
 }
 #endif /* CONFIG_CRYPTO_LIB_AES_CBC_MACS */
-- 
2.53.0



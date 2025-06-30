Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45722C83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 18:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fT6KHl0DZjqWYj+x6FXMVRbAdr8dxizaH1pBTTHw1Xw=; b=h6ZEaQEpqt3fJIsjHR/D8MhsDA
	m+HGzmyfzDqEzK10VuyRyETlz/d1z71guM1CI0KK221THcg989WulFfjM5gxw3PnWWpbL4lgH0q+m
	kO5hf8JpjtgZcHCrktBGLI8Bojp3sxnSSis85/i1XzoETIvIuExL4HOhTN2KDi87BB7wmw0kfPIFt
	fnJFTwZXokGVcQKdIx6DnGmrpnF2KZf1ZbyFLTlkMakG2FMmt7fPSFWIy2L2GAhaR5AnRvVuN/yWW
	tjBYUdQGM0jhjs+xEjux/Egg5FBRPfsgIdkY5RC07eEq+6doYqMwIG6H7t9+f+dfrPxD52n5JpTKt
	jhj+LFRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ7W-00000003BTH-36kA;
	Mon, 30 Jun 2025 18:20:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWH0b-00000002opB-2wgM;
	Mon, 30 Jun 2025 16:05:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A5AA5C5B6B;
	Mon, 30 Jun 2025 16:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B986C4CEF3;
	Mon, 30 Jun 2025 16:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299528;
	bh=x0Z9wiotmf8jNMw5UZ8kqkasukLKKyE27l+fQpQiAtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t3JvUmlQQ4INyHMwXd8NDAuXQfblNIw7bb2A+AkbC1bEfjMvbGr9VVWYBufCEWja+
	 vRPcUj3Eh3HA5CCYjFNEPIvrkd5V+fCYMMRfLjgfRMBAOIDzx501JkRTOw24STASVN
	 GlXEfFZ4QhPwvdzhL7Brq7NcN40QmKVHP3lciFUL9Eh22O7hkrRSsErLEcExvfFcRk
	 RtTIKQjSwaglVhNVylmaJW3TUINxj06OACBE4anK4ueu1Kh2nnmHyNEfuaK4GIntCE
	 GlPmSy5LDlWkdSrGWFPNlZVad3KFf1R78b5H9wRTMsFkiIVpiIi4UYjq+LAS4uKKW9
	 oLn9LSYQOwH8Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v3 15/16] lib/crypto: x86/sha512: Remove unnecessary checks for nblocks==0
Date: Mon, 30 Jun 2025 09:03:19 -0700
Message-ID: <20250630160320.2888-16-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160320.2888-1-ebiggers@kernel.org>
References: <20250630160320.2888-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_090529_824096_8376F1C3 
X-CRM114-Status: GOOD (  10.37  )
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

Since sha512_blocks() is called only with nblocks >= 1, remove
unnecessary checks for nblocks == 0 from the x86 SHA-512 assembly code.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/x86/sha512-avx-asm.S   | 6 +-----
 lib/crypto/x86/sha512-avx2-asm.S  | 5 +----
 lib/crypto/x86/sha512-ssse3-asm.S | 6 +-----
 3 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/lib/crypto/x86/sha512-avx-asm.S b/lib/crypto/x86/sha512-avx-asm.S
index 0b5f69179d624..7732aa8fd8506 100644
--- a/lib/crypto/x86/sha512-avx-asm.S
+++ b/lib/crypto/x86/sha512-avx-asm.S
@@ -270,17 +270,14 @@ frame_size = frame_WK + WK_SIZE
 #			    const u8 *data, size_t nblocks);
 # Purpose: Updates the SHA512 digest stored at "state" with the message
 # stored in "data".
 # The size of the message pointed to by "data" must be an integer multiple
 # of SHA512 message blocks.
-# "nblocks" is the message length in SHA512 blocks
+# "nblocks" is the message length in SHA512 blocks.  Must be >= 1.
 ########################################################################
 SYM_FUNC_START(sha512_transform_avx)
 
-	test msglen, msglen
-	je .Lnowork
-
 	# Save GPRs
 	push	%rbx
 	push	%r12
 	push	%r13
 	push	%r14
@@ -360,11 +357,10 @@ SYM_FUNC_START(sha512_transform_avx)
 	pop	%r14
 	pop	%r13
 	pop	%r12
 	pop	%rbx
 
-.Lnowork:
 	RET
 SYM_FUNC_END(sha512_transform_avx)
 
 ########################################################################
 ### Binary Data
diff --git a/lib/crypto/x86/sha512-avx2-asm.S b/lib/crypto/x86/sha512-avx2-asm.S
index 2309c01e316b9..22bdbfd899d0f 100644
--- a/lib/crypto/x86/sha512-avx2-asm.S
+++ b/lib/crypto/x86/sha512-avx2-asm.S
@@ -562,11 +562,11 @@ frame_size = frame_CTX + CTX_SIZE
 #			     const u8 *data, size_t nblocks);
 # Purpose: Updates the SHA512 digest stored at "state" with the message
 # stored in "data".
 # The size of the message pointed to by "data" must be an integer multiple
 # of SHA512 message blocks.
-# "nblocks" is the message length in SHA512 blocks
+# "nblocks" is the message length in SHA512 blocks.  Must be >= 1.
 ########################################################################
 SYM_FUNC_START(sha512_transform_rorx)
 
 	# Save GPRs
 	push	%rbx
@@ -580,11 +580,10 @@ SYM_FUNC_START(sha512_transform_rorx)
 	mov	%rsp, %rbp
 	sub	$frame_size, %rsp
 	and	$~(0x20 - 1), %rsp
 
 	shl	$7, NUM_BLKS	# convert to bytes
-	jz	.Ldone_hash
 	add	INP, NUM_BLKS	# pointer to end of data
 	mov	NUM_BLKS, frame_INPEND(%rsp)
 
 	## load initial digest
 	mov	8*0(CTX1), a
@@ -666,12 +665,10 @@ SYM_FUNC_START(sha512_transform_rorx)
 	mov	frame_INP(%rsp), INP
 	add	$128, INP
 	cmp	frame_INPEND(%rsp), INP
 	jne	.Lloop0
 
-.Ldone_hash:
-
 	# Restore Stack Pointer
 	mov	%rbp, %rsp
 	pop	%rbp
 
 	# Restore GPRs
diff --git a/lib/crypto/x86/sha512-ssse3-asm.S b/lib/crypto/x86/sha512-ssse3-asm.S
index 12e78142f2e38..4cae7445b2a86 100644
--- a/lib/crypto/x86/sha512-ssse3-asm.S
+++ b/lib/crypto/x86/sha512-ssse3-asm.S
@@ -269,17 +269,14 @@ frame_size = frame_WK + WK_SIZE
 #			      const u8 *data, size_t nblocks);
 # Purpose: Updates the SHA512 digest stored at "state" with the message
 # stored in "data".
 # The size of the message pointed to by "data" must be an integer multiple
 # of SHA512 message blocks.
-# "nblocks" is the message length in SHA512 blocks
+# "nblocks" is the message length in SHA512 blocks.  Must be >= 1.
 ########################################################################
 SYM_FUNC_START(sha512_transform_ssse3)
 
-	test msglen, msglen
-	je .Lnowork
-
 	# Save GPRs
 	push	%rbx
 	push	%r12
 	push	%r13
 	push	%r14
@@ -359,11 +356,10 @@ SYM_FUNC_START(sha512_transform_ssse3)
 	pop	%r14
 	pop	%r13
 	pop	%r12
 	pop	%rbx
 
-.Lnowork:
 	RET
 SYM_FUNC_END(sha512_transform_ssse3)
 
 ########################################################################
 ### Binary Data
-- 
2.50.0



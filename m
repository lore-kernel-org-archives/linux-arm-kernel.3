Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685FACC6B2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 20:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnX3FpLMsuoMxajld/+7DawFDN5YuC5To+m3LaNG754=; b=IDAasBzx8y2sOvnmeesQpfzj1G
	Ygq+BwDbEeuh6E4HIvpPLEaEwY7e2kSm01K/39jRD6TG8Q8/6HCM4p6H6IeFEONCyc4pDDLp+AURr
	I+3svzVjfOY9SWdCcvKS3vS/Y7znXwqRpTDf2vzuAvOBKmCR1iG1DCwOosF9aApJRvWiA8vuJVf+G
	rH8FcZ1XEOnURUi73aOkY5YurnEAbrZJCQtc2H3UJLEP/2JhkHtY6hmSGSGbCmKbIsn3kj2RWYCK7
	758xkyp3b/kzzCxq0d/vQgAewu5z+a16oyRTb4X3s7sjrh16HXO2nZO5VQbr8Ou+eJv1q2XVrOtm0
	y8wLj8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5kq-0000000GHKf-3pLP;
	Wed, 14 Oct 2026 20:39:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5kq-0000000GHJl-0fTG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 20:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DC1443D5F;
	Wed, 14 Oct 2026 20:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 639A1C2BCC7;
	Wed, 14 Oct 2026 20:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792010355;
	bh=36c6FFlj5NX/m5agNn6+sDojBoBXBS6k1UiQEFjImdo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HMBBSpm6UIXmkJSwy3efhTybtkNhhvQZlNO8xSo9U+ySI8UOkRliVqbeweBlOGuI9
	 RF77lF1uA7j5j47aYV8zlNFZPvFjwu32xBnbD85TVdiWtWX6I0DL1q+fHxypWXpDvP
	 dkZL5NuUbHCOpS9GEklJAKJc+VFtHEg3xt+AL14tHJ7futVw1eumSTLzs6sT7N1Dg7
	 HL8Br0GLOoHJC5Wt63uJScq4ZT0XAI5r1Lm7y8M6Q7YJXyFHdBMNo4rQKaWia11NFC
	 zqkbxu0VWlIr4t3WF47SlrM8MZmrlaK8xN9unjIB9B3iyKy+peVXWA9Ka0LYxyCyFz
	 /dr1NLgWtqDmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45733CC6B2C;
	Wed, 14 Oct 2026 20:39:15 +0000 (UTC)
From: Vladimir Kukharenko via B4 Relay <devnull+vladimir.genproof.com@kernel.org>
Date: Wed, 14 Oct 2026 20:34:21 +0000
Subject: [PATCH 1/2] lib/crypto: arm/chacha: Handle lengths of 2 GiB or
 more in scalar code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-libcrypto-chacha-32bit-2gib-v1-1-e0719ca0be89@genproof.com>
References: <20261014-libcrypto-chacha-32bit-2gib-v1-0-e0719ca0be89@genproof.com>
In-Reply-To: <20261014-libcrypto-chacha-32bit-2gib-v1-0-e0719ca0be89@genproof.com>
To: Eric Biggers <ebiggers@kernel.org>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Vladimir Kukharenko <vladimir@genproof.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792010354; l=2466;
 i=vladimir@genproof.com; s=20261012; h=from:subject:message-id;
 bh=pzSd8TFs88R98kv6edfMDr8bkMgX1eosda2YXawMBn0=;
 b=6d7Nwwo7vU9yVqLrOVqivtH2LtgqZSgHFYRvB69uenNRwHXzVyioVyYsBtQ5vU/ktvxcQXpAA
 CNKagi23N0OD3QoMGsqpURHAtta46eZ1XqyZO8jUct9NIKN76SJKvrN
X-Developer-Key: i=vladimir@genproof.com; a=ed25519;
 pk=EqOzBSKBgFn7ExzKj5f9T8u+1yTrGVlLBwf3fj/sdHM=
X-Endpoint-Received: by B4 Relay for vladimir@genproof.com/20261012 with
 auth_id=1169
X-Original-From: Vladimir Kukharenko <vladimir@genproof.com>
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
Reply-To: vladimir@genproof.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vladimir Kukharenko <vladimir@genproof.com>

chacha_doarm() compares the remaining length with signed conditions
(blt, movle/movgt, bgt), and DIV_ROUND_UP(bytes, CHACHA_BLOCK_SIZE) in
chacha_crypt_arch() wraps above 0xffffffc0, so lengths of 2 GiB or
more are mishandled.  size_t is 32 bits on arm, so declaring the length
as size_t does not avoid this.  On a Cortex-A7, an in-place
chacha20_crypt() of 2 GiB + 4101 bytes changed only one byte.

Use unsigned conditions (blo, movls/movhi, bhi) and
DIV_ROUND_UP_POW2().

This affects the scalar code, which is used when NEON isn't usable and
always on Cortex-A5 and Cortex-A7.  No in-tree caller passes such
lengths.  Tested in QEMU on a Cortex-A7 with CONFIG_VMSPLIT_1G.  An LLM
review of this code found the bug.

Assisted-by: LLM
Signed-off-by: Vladimir Kukharenko <vladimir@genproof.com>
---
 lib/crypto/arm/chacha-scalar-core.S | 8 ++++----
 lib/crypto/arm/chacha.h             | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/crypto/arm/chacha-scalar-core.S b/lib/crypto/arm/chacha-scalar-core.S
index 509b2f277b57..d9d0a8cee941 100644
--- a/lib/crypto/arm/chacha-scalar-core.S
+++ b/lib/crypto/arm/chacha-scalar-core.S
@@ -163,7 +163,7 @@
 
 	// Use slow path if fewer than 64 bytes remain.
 	cmp		r11, #64
-	blt		.Lxor_slowpath\@
+	blo		.Lxor_slowpath\@
 
 	// Use slow path if IN and/or OUT isn't 4-byte aligned.  Needed even on
 	// ARMv6+, since ldmia and stmia (used below) still require alignment.
@@ -324,8 +324,8 @@
 	ldr		r14, [sp, #160]		// OUT
 	cmp		r9, #64
 	  mov		r0, sp
-	movle		r1, r9
-	movgt		r1, #64
+	movls		r1, r9
+	movhi		r1, #64
 	// r1 is number of bytes to XOR, in range [1, 64]
 
 .if __LINUX_ARM_ARCH__ < 6
@@ -360,7 +360,7 @@
 .Lxor_slowpath_done\@:
 	subs		r9, #64
 	add		sp, #96
-	bgt		.Lprepare_for_next_block\@
+	bhi		.Lprepare_for_next_block\@
 
 .Ldone\@:
 .endm	// _chacha
diff --git a/lib/crypto/arm/chacha.h b/lib/crypto/arm/chacha.h
index 8ce5375f58aa..5b366f4de78d 100644
--- a/lib/crypto/arm/chacha.h
+++ b/lib/crypto/arm/chacha.h
@@ -78,7 +78,7 @@ static void chacha_crypt_arch(struct chacha_state *state, u8 *dst,
 	if (!IS_ENABLED(CONFIG_KERNEL_MODE_NEON) || !neon_usable() ||
 	    bytes <= CHACHA_BLOCK_SIZE) {
 		chacha_doarm(dst, src, bytes, state, nrounds);
-		state->x[12] += DIV_ROUND_UP(bytes, CHACHA_BLOCK_SIZE);
+		state->x[12] += DIV_ROUND_UP_POW2(bytes, CHACHA_BLOCK_SIZE);
 		return;
 	}
 

-- 
2.43.0




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62710D3E2A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 19:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zpm0CqO0jkLCQ2hNqhD5Z+6vomBgNs7dr74ifVRZnt4=; b=0AsbvhBswjzjo6NDVMzNWbcI2k
	3ResEsVrI5va216CFAZw3RsnGWXNY2bnAFszhE2bbHfdgsks8vifJ44h8mvWYak+G3KGt92eLtup8
	Jyhp3MmyCLNZdFnsVQwAGHlIEOTjpuYUm69q5wABrg2ZLUaD+2GtC/YUcGOFRondAs6/j2OaJ4ndz
	VTc1xnIt8oPy44iIYStIIQd77j6T/onMdjfuFoxODrAZj4Q7GVbgt22RxBGdk+pjyaPT0IoovNEJb
	+OqPi/Ns+VuGmMiwkn2Km9uOsAwpWYSmtBo4tpKLU9Immo67vBZ0lBaw27kP8mtKK3ntDKFlreW+l
	e0sUFpAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5V9o-0000000By1C-3Kda;
	Mon, 28 Oct 2024 19:12:04 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5V0e-0000000Bvz7-3JVa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 19:02:38 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4315a0f25afso35589355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 12:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730142154; x=1730746954; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zpm0CqO0jkLCQ2hNqhD5Z+6vomBgNs7dr74ifVRZnt4=;
        b=z5t2G6U8GyACY61E59UPRnezWIpFejoGMdNcVXK8zXbilasdMLx1I7gV2nWA5f57aB
         uIR+uDLaqWCVl03fnrEdJdPYkythVS93Gevbawngme1tcL/7fQshwk9nEUjWJ1d1Hfqm
         s1JNttvOl5j8XOptjoASoBPkKZgOqcPz0+1R7zJcZlAg+odbYF5vx1GUzneSqLSgE8y6
         byjGrHfNt3GwIGpr6qzD+f7db9MovIzkYEM6zO6s+PQxKXhpNwxbDe0v27yV8tkoB6gv
         7v12li6GWhW+Aul8Qs8G/agvBb5s1eACjpw4h36bhlOhpHv1A+DKlW8OR+1RS5B7VA5A
         LZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142154; x=1730746954;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zpm0CqO0jkLCQ2hNqhD5Z+6vomBgNs7dr74ifVRZnt4=;
        b=u+6AD2KuNevzPZ1jFcwicLggWxH/Bp1q7Tx07Ax1GHG5xG5Fj71BehgQNUcf0sHxRi
         4LCV7gG+1M/IikJ5+60lxfebH79a35o1ROxXbq54Za3iA7Fjyoyb1F6yzCAc0ffg4qRI
         5DqkirPKJN+TZYIfPUzMFBW9I0U6OxwmpzsI2qYAonh5d0ojuu0ucx1Jj/QGchdbOApy
         iwh3OKGJtdsIp/AwiMr8OreG6FBexU4AJE/4HpZQpvE5uPGKGShzFxsXUDxdG479ZwFA
         P5Ex/4NrKXeH6nxhuLzioJpBD5ZAJdNbiB1HnLzFXk6a/p9bnm/f5uRmBv8z/BV4clST
         UFSg==
X-Gm-Message-State: AOJu0YwgOMxGTk9Yws/rg6nbV4LfPwGT8cPgNB1xzHyLa+xTky77HW4c
	NZHKSuSTceBJ479ztnhMb8CZ608NA8DSLiFuvEvu70NREY3LdVlPcl3BTXPhJkx5rrtoow==
X-Google-Smtp-Source: AGHT+IHGLMQXbNwdTcbne8ZPAgPqC6Qf7gZJjvWldbCy0+SyVOa2wRc/e+wvEEV0+cVX9xWO8q2z0UUr
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a5d:45c5:0:b0:37d:4f54:78b0 with SMTP id
 ffacd0b85a97d-38060ffebe5mr9194f8f.0.1730142154146; Mon, 28 Oct 2024 12:02:34
 -0700 (PDT)
Date: Mon, 28 Oct 2024 20:02:10 +0100
In-Reply-To: <20241028190207.1394367-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241028190207.1394367-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6680; i=ardb@kernel.org;
 h=from:subject; bh=QvAfJRoNWdwrMVr1L2fVoyNArQiBoPeeMAMmJjZbWLQ=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV3+/uY/HbF7q6KVWOVU1bu/fbKpKD62X/nPC91lWTYfl
 /v+/13fUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZyvYnhn3FY/teFh351Z11z
 z5Ire3IttYff/WT20RXHpq0tFt9VfZXhn9mU3cctGCtY76fV7q6fEph4TLvo3uVo5t7bc74uy/5 6ixMA
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241028190207.1394367-10-ardb+git@google.com>
Subject: [PATCH 2/6] crypto: arm64/crct10dif - Use faster 16x64 bit polynomial multiply
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, ebiggers@kernel.org, 
	herbert@gondor.apana.org.au, keescook@chromium.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_120236_873623_F2064D9C 
X-CRM114-Status: GOOD (  15.71  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The CRC-T10DIF implementation for arm64 has a version that uses 8x8
polynomial multiplication, for cores that lack the crypto extensions,
which cover the 64x64 polynomial multiplication instruction that the
algorithm was built around.

This fallback version rather naively adopted the 64x64 polynomial
multiplication algorithm that I ported from ARM for the GHASH driver,
which needs 8 PMULL8 instructions to implement one PMULL64. This is
reasonable, given that each 8-bit vector element needs to be multiplied
with each element in the other vector, producing 8 vectors with partial
results that need to be combined to yield the correct result.

However, most PMULL64 invocations in the CRC-T10DIF code involve
multiplication by a pair of 16-bit folding coefficients, and so all the
partial results from higher order bytes will be zero, and there is no
need to calculate them to begin with.

Then, the CRC-T10DIF algorithm always XORs the output values of the
PMULL64 instructions being issued in pairs, and so there is no need to
faithfully implement each individual PMULL64 instruction, as long as
XORing the results pairwise produces the expected result.

Implementing these improvements results in a speedup of 3.3x on low-end
platforms such as Raspberry Pi 4 (Cortex-A72)

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/crypto/crct10dif-ce-core.S | 71 +++++++++++++++-----
 1 file changed, 54 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/crypto/crct10dif-ce-core.S b/arch/arm64/crypto/crct10dif-ce-core.S
index 5604de61d06d..8d99ccf61f16 100644
--- a/arch/arm64/crypto/crct10dif-ce-core.S
+++ b/arch/arm64/crypto/crct10dif-ce-core.S
@@ -1,8 +1,11 @@
 //
 // Accelerated CRC-T10DIF using arm64 NEON and Crypto Extensions instructions
 //
-// Copyright (C) 2016 Linaro Ltd <ard.biesheuvel@linaro.org>
-// Copyright (C) 2019 Google LLC <ebiggers@google.com>
+// Copyright (C) 2016 Linaro Ltd
+// Copyright (C) 2019-2024 Google LLC
+//
+// Authors: Ard Biesheuvel <ardb@google.com>
+//          Eric Biggers <ebiggers@google.com>
 //
 // This program is free software; you can redistribute it and/or modify
 // it under the terms of the GNU General Public License version 2 as
@@ -122,6 +125,10 @@
 	sli		perm2.2d, perm1.2d, #56
 	sli		perm3.2d, perm1.2d, #48
 	sli		perm4.2d, perm1.2d, #40
+
+	mov_q		x5, 0x909010108080000
+	mov		bd1.d[0], x5
+	zip1		bd1.16b, bd1.16b, bd1.16b
 	.endm
 
 	.macro		__pmull_pre_p8, bd
@@ -196,6 +203,45 @@ SYM_FUNC_START_LOCAL(__pmull_p8_core)
 	ret
 SYM_FUNC_END(__pmull_p8_core)
 
+SYM_FUNC_START_LOCAL(__pmull_p8_16x64)
+	ext		t6.16b, t5.16b, t5.16b, #8
+
+	pmull		t3.8h, t7.8b, t5.8b
+	pmull		t4.8h, t7.8b, t6.8b
+	pmull2		t5.8h, t7.16b, t5.16b
+	pmull2		t6.8h, t7.16b, t6.16b
+
+	ext		t8.16b, t3.16b, t3.16b, #8
+	eor		t4.16b, t4.16b, t6.16b
+	ext		t7.16b, t5.16b, t5.16b, #8
+	ext		t6.16b, t4.16b, t4.16b, #8
+	eor		t8.8b, t8.8b, t3.8b
+	eor		t5.8b, t5.8b, t7.8b
+	eor		t4.8b, t4.8b, t6.8b
+	ext		t5.16b, t5.16b, t5.16b, #14
+	ret
+SYM_FUNC_END(__pmull_p8_16x64)
+
+	.macro		pmull16x64_p64, a16, b64, c64
+	pmull2		\c64\().1q, \a16\().2d, \b64\().2d
+	pmull		\b64\().1q, \a16\().1d, \b64\().1d
+	.endm
+
+	/*
+	 * NOTE: the 16x64 bit polynomial multiply below is not equivalent to
+	 * the one above, but XOR'ing the outputs together will produce the
+	 * expected result, and this is sufficient in the context of this
+	 * algorithm.
+	 */
+	.macro		pmull16x64_p8, a16, b64, c64
+	ext		t7.16b, \b64\().16b, \b64\().16b, #1
+	tbl		t5.16b, {\a16\().16b}, bd1.16b
+	uzp1		t7.16b, \b64\().16b, t7.16b
+	bl		__pmull_p8_16x64
+	ext		\b64\().16b, t4.16b, t4.16b, #15
+	eor		\c64\().16b, t8.16b, t5.16b
+	.endm
+
 	.macro		__pmull_p8, rq, ad, bd, i
 	.ifnc		\bd, fold_consts
 	.err
@@ -218,14 +264,12 @@ SYM_FUNC_END(__pmull_p8_core)
 	.macro		fold_32_bytes, p, reg1, reg2
 	ldp		q11, q12, [buf], #0x20
 
-	__pmull_\p	v8, \reg1, fold_consts, 2
-	__pmull_\p	\reg1, \reg1, fold_consts
+	pmull16x64_\p	fold_consts, \reg1, v8
 
 CPU_LE(	rev64		v11.16b, v11.16b		)
 CPU_LE(	rev64		v12.16b, v12.16b		)
 
-	__pmull_\p	v9, \reg2, fold_consts, 2
-	__pmull_\p	\reg2, \reg2, fold_consts
+	pmull16x64_\p	fold_consts, \reg2, v9
 
 CPU_LE(	ext		v11.16b, v11.16b, v11.16b, #8	)
 CPU_LE(	ext		v12.16b, v12.16b, v12.16b, #8	)
@@ -238,11 +282,9 @@ CPU_LE(	ext		v12.16b, v12.16b, v12.16b, #8	)
 
 	// Fold src_reg into dst_reg, optionally loading the next fold constants
 	.macro		fold_16_bytes, p, src_reg, dst_reg, load_next_consts
-	__pmull_\p	v8, \src_reg, fold_consts
-	__pmull_\p	\src_reg, \src_reg, fold_consts, 2
+	pmull16x64_\p	fold_consts, \src_reg, v8
 	.ifnb		\load_next_consts
 	ld1		{fold_consts.2d}, [fold_consts_ptr], #16
-	__pmull_pre_\p	fold_consts
 	.endif
 	eor		\dst_reg\().16b, \dst_reg\().16b, v8.16b
 	eor		\dst_reg\().16b, \dst_reg\().16b, \src_reg\().16b
@@ -296,7 +338,6 @@ CPU_LE(	ext		v7.16b, v7.16b, v7.16b, #8	)
 
 	// Load the constants for folding across 128 bytes.
 	ld1		{fold_consts.2d}, [fold_consts_ptr]
-	__pmull_pre_\p	fold_consts
 
 	// Subtract 128 for the 128 data bytes just consumed.  Subtract another
 	// 128 to simplify the termination condition of the following loop.
@@ -318,7 +359,6 @@ CPU_LE(	ext		v7.16b, v7.16b, v7.16b, #8	)
 	// Fold across 64 bytes.
 	add		fold_consts_ptr, fold_consts_ptr, #16
 	ld1		{fold_consts.2d}, [fold_consts_ptr], #16
-	__pmull_pre_\p	fold_consts
 	fold_16_bytes	\p, v0, v4
 	fold_16_bytes	\p, v1, v5
 	fold_16_bytes	\p, v2, v6
@@ -339,8 +379,7 @@ CPU_LE(	ext		v7.16b, v7.16b, v7.16b, #8	)
 	// into them, storing the result back into v7.
 	b.lt		.Lfold_16_bytes_loop_done_\@
 .Lfold_16_bytes_loop_\@:
-	__pmull_\p	v8, v7, fold_consts
-	__pmull_\p	v7, v7, fold_consts, 2
+	pmull16x64_\p	fold_consts, v7, v8
 	eor		v7.16b, v7.16b, v8.16b
 	ldr		q0, [buf], #16
 CPU_LE(	rev64		v0.16b, v0.16b			)
@@ -387,9 +426,8 @@ CPU_LE(	ext		v0.16b, v0.16b, v0.16b, #8	)
 	bsl		v2.16b, v1.16b, v0.16b
 
 	// Fold the first chunk into the second chunk, storing the result in v7.
-	__pmull_\p	v0, v3, fold_consts
-	__pmull_\p	v7, v3, fold_consts, 2
-	eor		v7.16b, v7.16b, v0.16b
+	pmull16x64_\p	fold_consts, v3, v0
+	eor		v7.16b, v3.16b, v0.16b
 	eor		v7.16b, v7.16b, v2.16b
 
 .Lreduce_final_16_bytes_\@:
@@ -450,7 +488,6 @@ CPU_LE(	ext		v7.16b, v7.16b, v7.16b, #8	)
 
 	// Load the fold-across-16-bytes constants.
 	ld1		{fold_consts.2d}, [fold_consts_ptr], #16
-	__pmull_pre_\p	fold_consts
 
 	cmp		len, #16
 	b.eq		.Lreduce_final_16_bytes_\@	// len == 16
-- 
2.47.0.163.g1226f6d8fa-goog



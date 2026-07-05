Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED39C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbSruFJvwcJrm9Np0k2TBS8pdvnZhYTtboREcCieCvM=; b=W9LhllOx+/lVvorKNfCGJT3JZh
	bzZExSZFTQfSEGljIndpqgUFKxjZBLjzK4yUkFNcuEr3RSnrP7u1EJFF3YOPcOk2YckWOWt7qwWUG
	Jy2NZo+yMAyr0pmo6UN2WncSzETKvQ6ijfXC9Ln++SfVkJ6x27f62XqJ9los/L9T4nJkNJRylIr2U
	dwWt7EBErAzZfJjpQ3tHeGpU9zlwmS3Lml0ZjpBdJCVbZIabyKbxo8ed3QAsvz1tRK3I9UiKXuT66
	2bgRmD8s6ZXNqMUDfWRz2cqQKvT1tFPUlNyw1wdPbwuuLrO5eGRboZovA4xXyndlF9xaxavgv+2ll
	7/4uJhtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSRR-00000009cfO-3ZSg;
	Sun, 05 Jul 2026 19:23:49 +0000
Received: from confino.investici.org ([93.190.126.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSRO-00000009cew-1B1M
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1783279419;
	bh=fbSruFJvwcJrm9Np0k2TBS8pdvnZhYTtboREcCieCvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o7YpzpWs4B2dC5RkIu5471ohJxZ/iDiv8mWlAD+iNAzGhhRb+Etmu+n9J8kQqRCw0
	 oEsHC4cp2teZBzlQ7/+3Ur8Sh3RtBnUgG3dvB8thg9Tli8wVPGWgw5vmilzE85qwGc
	 0OpUMGy3Q8/qP6hkSeQ6UxPhda4Pn2DNF47kGmxI=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4gtcpz0Qc4z10yF;
	Sun, 05 Jul 2026 19:23:39 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4gtcpy2vNbz10y4;
	Sun, 05 Jul 2026 19:23:38 +0000 (UTC)
From: Bradley Morgan <include@grrlz.net>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bradley Morgan <include@grrlz.net>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: sleep: dedup the sleep_save_stash slot lookup
Date: Sun,  5 Jul 2026 19:23:31 +0000
Message-ID: <20260705192331.23150-3-include@grrlz.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260705192331.23150-1-include@grrlz.net>
References: <20260705192331.23150-1-include@grrlz.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_122346_782240_3DEE7DEE 
X-CRM114-Status: GOOD (  12.55  )
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

Both __cpu_suspend_enter() and _cpu_resume() open code the same MPIDR
hash lookup. Factor it into a get_sleep_stash_slot macro.

Signed-off-by: Bradley Morgan <include@grrlz.net>
---
 arch/arm64/kernel/sleep.S | 55 +++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
index e112b8537f10..8820a131aef7 100644
--- a/arch/arm64/kernel/sleep.S
+++ b/arch/arm64/kernel/sleep.S
@@ -64,6 +64,31 @@
 	lsr	\mask ,\mask, \rs3
 	orr	\dst, \dst, \mask		// dst|=(aff3>>rs3)
 	.endm
+
+/*
+ * Compute the address of the current CPU's entry in sleep_save_stash,
+ * i.e. &sleep_save_stash[hash(MPIDR_EL1)].
+ *
+ * @slot: output register
+ *
+ * Clobbers: x2 - x8
+ */
+	.macro get_sleep_stash_slot slot
+	mpidr_hash_assert_distinct \slot, x2
+	mrs	x3, mpidr_el1
+	adr_l	x2, mpidr_hash
+	ldr	x8, [x2, #MPIDR_HASH_MASK]
+	/*
+	 * Following code relies on the struct mpidr_hash
+	 * members size.
+	 */
+	ldp	w4, w5, [x2, #MPIDR_HASH_SHIFTS]
+	ldp	w6, w7, [x2, #(MPIDR_HASH_SHIFTS + 8)]
+	compute_mpidr_hash x2, x4, x5, x6, x7, x3, x8
+	ldr_l	\slot, sleep_save_stash
+	add	\slot, \slot, x2, lsl #3
+	.endm
+
 /*
  * Save CPU state in the provided sleep_stack_data area, and publish its
  * location for cpu_resume()'s use in sleep_save_stash.
@@ -88,19 +113,8 @@ SYM_FUNC_START(__cpu_suspend_enter)
 	mov	x2, sp
 	str	x2, [x0, #SLEEP_STACK_DATA_SYSTEM_REGS + CPU_CTX_SP]
 
-	/* find the mpidr_hash */
-	ldr_l	x1, sleep_save_stash
-	mrs	x7, mpidr_el1
-	adr_l	x9, mpidr_hash
-	ldr	x10, [x9, #MPIDR_HASH_MASK]
-	/*
-	 * Following code relies on the struct mpidr_hash
-	 * members size.
-	 */
-	ldp	w3, w4, [x9, #MPIDR_HASH_SHIFTS]
-	ldp	w5, w6, [x9, #(MPIDR_HASH_SHIFTS + 8)]
-	compute_mpidr_hash x8, x3, x4, x5, x6, x7, x10
-	add	x1, x1, x8, lsl #3
+	/* find this CPU's slot in sleep_save_stash */
+	get_sleep_stash_slot x1
 
 	str	x0, [x1]
 	add	x0, x0, #SLEEP_STACK_DATA_SYSTEM_REGS
@@ -131,18 +145,9 @@ SYM_FUNC_START(_cpu_resume)
 	mov	x0, x19
 	bl	finalise_el2
 
-	mrs	x1, mpidr_el1
-	adr_l	x8, mpidr_hash		// x8 = struct mpidr_hash virt address
-
-	/* retrieve mpidr_hash members to compute the hash */
-	ldr	x2, [x8, #MPIDR_HASH_MASK]
-	ldp	w3, w4, [x8, #MPIDR_HASH_SHIFTS]
-	ldp	w5, w6, [x8, #(MPIDR_HASH_SHIFTS + 8)]
-	compute_mpidr_hash x7, x3, x4, x5, x6, x1, x2
-
-	/* x7 contains hash index, let's use it to grab context pointer */
-	ldr_l	x0, sleep_save_stash
-	ldr	x0, [x0, x7, lsl #3]
+	/* grab this CPU's context pointer from sleep_save_stash */
+	get_sleep_stash_slot x0
+	ldr	x0, [x0]
 	add	x29, x0, #SLEEP_STACK_DATA_CALLEE_REGS
 	add	x0, x0, #SLEEP_STACK_DATA_SYSTEM_REGS
 	/* load sp from context */
-- 
2.53.0



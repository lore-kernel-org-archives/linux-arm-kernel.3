Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445CBC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=78tVDEHMcN/wIq05dXhyUqSnoyCcXNYXjHWpnw6Enmk=; b=jRpRuvuYFOIVHD
	xy+tKu7zihkQE+8rmMJU6xVXgp04CLZFyAMTtr6rk00yOPfvO3OUUtJN0ENXgCBzFuuXFUx7uLeAc
	NTXWSJtgVscmewN1on9TxsuHf8q6jMVz6nXArIoC1VeC4To7nCU2mUbEMCYW3Bj7lIhEFob9glwEE
	iUSwvgUZSSJByOQGTXBtgVCHQs+Qwa9jfM94cpxVWYULVJILQPfLJCJubHZlZ20KahN7n/aQ5b12Y
	31k6z6M8OQ6xm7FxMzD/mu26MUR50xoXmoj7jk+QgyB7L+fYHYUPiIpRqyEBLTqaYvoJg5wOTmtqP
	I0nASfv7BB3g+PustDTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XGQ-00000002p1q-3kyW;
	Fri, 04 Sep 2026 16:59:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XGO-00000002p0y-2moM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:59:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 272F2153B;
	Fri,  4 Sep 2026 09:59:36 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 75EA53F673;
	Fri,  4 Sep 2026 09:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788541179; bh=pUGiK76B/cGSXLCAJDeQJWe6X+z6/ttgCiv66ralV/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WVzc1af6BsoBN+nSWzGu7WuzcrXUgXXhkngtMEHQvkQu14E0Ge9JYX/Qv5SHpWfXl
	 jfmqv9NQQatVww2rTjQ+T2HARXaDpUs50Spu3XanEmF/cpCN6Pe8iKGz8A0yxmmpiJ
	 Qf1PBDRJeqmXVQEZzyZQWk2Vxa5Ja4/Jla7oXmOo=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 13/21] arm64: entry: sdei: Make 'tsk' available
Date: Fri,  4 Sep 2026 17:59:26 +0100
Message-Id: <20260904165926.377036-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260904161758.376504-1-mark.rutland@arm.com>
References: <20260904161758.376504-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_095940_789203_EEA1C7E4 
X-CRM114-Status: GOOD (  12.16  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

For regular entry/exit sequences, we use 'tsk' (x28) to hold the current
task pointer, allowing this to be used by various assembly macros. The
SDEI entry/exit sequence uses x28 to hold the value of the interrupted
sp_el0, and doesn't retain the current task pointer in a register.

These differences makes it awkward to share assembly macros across
regular entry/exit and SDEI entry/exit, and risk surprises.

Align the SDEI entry/exit sequence with regular entry/exit, keeping the
current task pointer in 'tsk', and preserving the interrupted sp_el0 in
another (callee-saved) register. I've used x20 as x19 was already in
used for the relevant sdei_registered_event, and these are the
lowest-numbered registers above x18 (which we must preserve for shadow
call stack).

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/kernel/entry.S | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index a6ec5c5a2d29c..0902c1bd9dd3d 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -1023,11 +1023,12 @@ SYM_CODE_START(__sdei_asm_handler)
 
 	/*
 	 * We may have interrupted userspace, or a guest, or exit-from or
-	 * return-to either of these. We can't trust sp_el0, restore it.
+	 * return-to either of these. Preserve the interrupted sp_el0, and
+	 * initialize sp_el0 to the current task.
 	 */
-	mrs	x28, sp_el0
-	ldr_this_cpu	dst=x0, sym=__entry_task, tmp=x1
-	msr	sp_el0, x0
+	mrs	x20, sp_el0
+	ldr_this_cpu    dst=tsk, sym=__entry_task, tmp=x1
+	msr	sp_el0, tsk
 
 	/* If we interrupted the kernel point to the previous stack/frame. */
 	and     x0, x3, #0xc
@@ -1043,7 +1044,7 @@ SYM_CODE_START(__sdei_asm_handler)
 	mov	x1, x19
 	bl	__sdei_handler
 
-	msr	sp_el0, x28
+	msr	sp_el0, x20
 	/* restore regs >x17 that firmware won't restore */
 	mov	x4, x19         // keep x4 for __sdei_asm_exit_trampoline
 	ldp	x18, x19, [x4, #SDEI_EVENT_INTREGS + 16 * 9]
-- 
2.30.2



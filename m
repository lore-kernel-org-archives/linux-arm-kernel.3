Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FB1C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzm8T1cPpyoa5PBvA2KyaZEnJwolQ6yD9NEfEQ912cI=; b=gC8eSPTV2wola/
	LnwEUOmcGAmFFC+1GLIh7cXWpyxB6Yy2sUPkfNEJRO80zO9slid8gx4TAbHO6NS86d4LFGH5FlZ2f
	YpNtkb1aahXCZ7Y5vsvKJASfQam9WHvdex6SmsfGbspq7VBg4dY3VuxeK+s59eVQisCsq4T5Ab4F3
	r8ExGkU+QhxB3nWLErsq7VsBrS4Yp+4rpprdILI9I1Uk31DIj+Ass9sfWRXj8WBfkWN61MkSMSaAU
	O+1pC/y9i6VBCV07bIOlZdheHNDzb61Va+bMseJUIWTzaZFRXtwtgkL58w549naPwzIk4ksIzyBl6
	/VMQ96MCUfxqYQXFcsCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndo-00000002KSv-1a79;
	Thu, 09 Jul 2026 12:14:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndl-00000002KNM-17Bm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34D1E1476;
	Thu,  9 Jul 2026 05:14:00 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 658363F66F;
	Thu,  9 Jul 2026 05:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599244; bh=qv1vNumLgfM4wazwGIrh3JL7TeOUr8BPSVyovADjsVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mVPBUqGnT0P+A8XeMtqWlXb81hkZsgiFLgvmGimMj3mG+wSFwFhrQk74ZGEsTJbZb
	 Przc1ot6bCtqPm2YE4KqoGc7jDgN+UogtIsFZIBCyU+iHofNKJdCb29NsNqLVC6Zs1
	 JHM/XrnLj8MVVfO3XN6zy7OPmIsXI8UB6PyWfOLY=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 07/36] arm64: entry: mask DAIF before returning from C EL1 handlers
Date: Thu,  9 Jul 2026 13:13:04 +0100
Message-Id: <20260709121333.23507-8-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051405_352062_BC9F2F4B 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, maz@kernel.org, ruanjinjie@huawei.com, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ada Couprie Diaz <ada.coupriediaz@arm.com>

Most EL1 exceptions already call `local_daif_mask()` before returning,
with the exception of debug exception handlers which do not change
DAIF, and the IRQ/FIQ/Error handlers.

However, DAIF get masked in `kernel_exit()` in all cases when
returning from EL1 C handlers anyway.

Move this masking from assembly to C by adding `local_daif_mask()`
before `irqentry_nmi_exit()` when it is called by EL1 handlers.

Remove the `disable_daif` assembly macro, as this was its only use.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/assembler.h | 4 ----
 arch/arm64/kernel/entry-common.c   | 2 ++
 arch/arm64/kernel/entry.S          | 4 ----
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index effae53e9739..0b58b550e8dc 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -34,10 +34,6 @@
 	wx\n	.req	w\n
 	.endr
 
-	.macro disable_daif
-	msr	daifset, #0xf
-	.endm
-
 /*
  * Save/restore interrupts.
  */
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index ceb4eb11232a..2be42d7f4eaa 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -495,6 +495,7 @@ static __always_inline void __el1_pnmi(struct pt_regs *regs,
 
 	state = irqentry_nmi_enter(regs);
 	do_interrupt_handler(regs, handler);
+	local_daif_mask();
 	irqentry_nmi_exit(regs, state);
 }
 
@@ -540,6 +541,7 @@ asmlinkage void noinstr el1h_64_error_handler(struct pt_regs *regs)
 	local_daif_restore(DAIF_ERRCTX);
 	state = irqentry_nmi_enter(regs);
 	do_serror(regs, esr);
+	local_daif_mask();
 	irqentry_nmi_exit(regs, state);
 }
 
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index e0db14e9c843..f63049ac32dc 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -333,10 +333,6 @@ alternative_else_nop_endif
 	.endm
 
 	.macro	kernel_exit, el
-	.if	\el != 0
-	disable_daif
-	.endif
-
 #ifdef CONFIG_ARM64_PSEUDO_NMI
 alternative_if_not ARM64_HAS_GIC_PRIO_MASKING
 	b	.Lskip_pmr_restore\@
-- 
2.34.1



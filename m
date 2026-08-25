Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C44C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 20:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEGlkv18mRe1qNNtTlr2JCIqchOSWxy0YcEBCLLf6KE=; b=q1citrqskUF/ZEHrfCg2s6c+Jc
	lqVDc3EhpaWU6kV39GgDHLhWR07qqUEvrg19a2O3t/M/+Jh4Iv9bRiNoiswh0NS4pGqku/UX8v/8l
	vYGIQqN9q3Vg5hOKpNbzLMz+6X4YZnRfGHguuV5RMQuqg5LL8hSvgP8usdcokyH+644YdUohXcjcQ
	kc+IHxaNeWuQ5BdqSQp1O4fbmLLtgKGoz/rHD0GvBXkYlRlZCAYmiI5/cxmFKCgqoW4PfOg/Y+2aS
	7UI5mwr0iFHsrRtsN15TVd1/g0oHX7fQ6gX2nWFEL3kLhuenLJD/AQB0ODLkJTPl7ZJ/vL9Y0jCfB
	FpqE0wQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyET-00000001Suy-0s3R;
	Tue, 25 Aug 2026 20:58:57 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyEO-00000001Sqk-3yI0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 20:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787691522; bh=rEGlkv18mRe1qNNtTlr2JCI
	qchOSWxy0YcEBCLLf6KE=; b=AMjKzy0Jmvstw3XfAeDtfanNVzCtFyAdF/q2+ErvENgGyIgCcQ
	UWOvIWeYxGS6f5WiPi5UzLLGqWgN3M8UknaG/ZrXnAzluenI2OHsnV7YxLR+AIEFUHr87W7GlB5
	1xNb1mYLHum1JJhwPr/9jLkxdRzrxrhgBUzRe7nCT5SQfKZ7eOnXJDEZIcS4S1TUrPz9QHScKk5
	602zFGLprRUu3bGGr3Xh17JjgDqGJ/ymYp5qjY3X9agrlGBQf3pDxuwDf6CRMpn14unr9STWmzj
	3j9mLwo9QeApOCy28Fd/vpR7eo+IbTrofkUVUefQAoxdoZlanIBHrOwn9mVD3l4xqRA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787691522; bh=rEGlkv18mRe1qNNtTlr2JCI
	qchOSWxy0YcEBCLLf6KE=; b=UxxEbtktDwBAOHGUQbb+V1PU+FoeCibh+Zhog3Px+tdF30povN
	2iinhe50EZPD06cC01718+XDk14huWKkLbCw==;
From: Bradley Morgan <brads@mainlining.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH 4/7] arm64: hibernate: fix _cpu_resume() calling convention
Date: Tue, 25 Aug 2026 20:58:36 +0000
Message-ID: <20260825205839.14571-5-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825205839.14571-1-brads@mainlining.org>
References: <20260825205839.14571-1-brads@mainlining.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_135853_649928_BB65DDE3 
X-CRM114-Status: GOOD (  17.04  )
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

The hibernate path borrows bits of the normal idle suspend/resume code
and open codes the rest. It skips cpu_resume() and has
swsusp_arch_suspend_exit() branch straight into _cpu_resume() at the
kernel's native EL with the MMU on.

Commit 82e4958800c01daa ("arm64: head: Move all finalise_el2 calls to
after __enable_mmu") changed the calling convention for _cpu_resume()
to expect EL1 with the boot mode in x19, but we never updated
swsusp_arch_suspend_exit() to match.

So when swsusp_arch_suspend_exit() calls _cpu_resume(), x19 holds the
final struct pbe next pointer, which must be NULL since it marks the
end of the list. _cpu_resume() then passes that to finalise_el2() in
x0, and finalise_el2() only issues an HVC when the value is
BOOT_CPU_MODE_EL2 and we are at EL1, so it happens not to fire. That is
the right outcome, but it is pure luck rather than design.

Split _cpu_resume() so this is less fragile.

__cpu_resume_switched() is the shared part, used by both the idle and
hibernate code. It takes no arguments and issues no HVC. The name is
meant to match __primary_switched and __secondary_switched.

__cpu_resume_switched_finalise_el2() is for the idle path only. It
pulls the boot mode from x19 and calls finalise_el2() before
__cpu_resume_switched(). It is kept local to sleep.S so the odd calling
convention does not leak any further.

Fixes: 82e4958800c01daa ("arm64: head: Move all finalise_el2 calls to after __enable_mmu")
Signed-off-by: Bradley Morgan <brads@mainlining.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/suspend.h | 2 +-
 arch/arm64/kernel/hibernate.c    | 2 +-
 arch/arm64/kernel/sleep.S        | 9 ++++++---
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/suspend.h b/arch/arm64/include/asm/suspend.h
index e9ce68d50ba4..1b7570902264 100644
--- a/arch/arm64/include/asm/suspend.h
+++ b/arch/arm64/include/asm/suspend.h
@@ -41,7 +41,7 @@ extern int cpu_suspend(unsigned long arg, int (*fn)(unsigned long));
 extern void cpu_resume(void);
 int __cpu_suspend_enter(struct sleep_stack_data *state);
 void __cpu_suspend_exit(void);
-void _cpu_resume(void);
+void __cpu_resume_switched(void);
 
 int swsusp_arch_suspend(void);
 int swsusp_arch_resume(void);
diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 8ac29058a839..30b02e39a397 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -114,7 +114,7 @@ int arch_hibernation_header_save(void *addr, unsigned int max_size)
 
 	arch_hdr_invariants(&hdr->invariants);
 	hdr->ttbr1_el1		= __pa_symbol(swapper_pg_dir);
-	hdr->reenter_kernel	= _cpu_resume;
+	hdr->reenter_kernel	= __cpu_resume_switched;
 
 	/* We can't use __hyp_get_vectors() because kvm may still be loaded */
 	if (el2_reset_needed())
diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
index f093cdf71be1..da45ab63bd9c 100644
--- a/arch/arm64/kernel/sleep.S
+++ b/arch/arm64/kernel/sleep.S
@@ -107,16 +107,19 @@ SYM_CODE_START(cpu_resume)
 	adrp	x1, swapper_pg_dir
 	adrp	x2, idmap_pg_dir
 	bl	__enable_mmu
-	ldr	x8, =_cpu_resume
+	ldr	x8, =__cpu_resume_switched_finalise_el2
 	br	x8
 SYM_CODE_END(cpu_resume)
 	.ltorg
 	.popsection
 
-SYM_FUNC_START(_cpu_resume)
+SYM_FUNC_START_LOCAL(__cpu_resume_switched_finalise_el2)
 	mov	x0, x19
 	bl	finalise_el2
+	b	__cpu_resume_switched
+SYM_FUNC_END(__cpu_resume_switched_finalise_el2)
 
+SYM_FUNC_START(__cpu_resume_switched)
 	mrs	x1, mpidr_el1
 	adr_l	x8, mpidr_hash		// x8 = struct mpidr_hash virt address
 
@@ -152,4 +155,4 @@ SYM_FUNC_START(_cpu_resume)
 	ldp	x29, lr, [x29]
 	mov	x0, #0
 	ret
-SYM_FUNC_END(_cpu_resume)
+SYM_FUNC_END(__cpu_resume_switched)
-- 
2.47.3


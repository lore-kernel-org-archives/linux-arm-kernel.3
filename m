Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1365AC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 20:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opptRr7//UiGidu2H6UGZTcw8hOoBerPUAbRLY3tiJw=; b=QnGf89JqfQf3swM4dcmVL1yAHI
	T3a+MmN0UZSnfomUlJ2Ub0bytGT4nM6TJwm/LwcDOOnTnfuWQeRo2eSWlzGwTIsm5cQYmb/W5O/jZ
	N3R0rqSIjCXt6U/UTO3DLbRGpOLJ+7wpFNJahMVzfgYGHWIhrlHn6xPcebL+uyzBklpgi7ezTB5n/
	XZqKobEPZ3Z642JwwlfPhz/qtY5bTob/oIACG/O8RNh5KpeMoNTJe50G3ok7vif1YrsBG5FaSfYcu
	PXbqSEQskMBwq/7LoMjgdnmdy+dxVMn84UdwYE0FrJUUXfzCryZwxjbzR5xemqklGALx+eL1WEFoO
	6pTlLxqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyES-00000001Stp-3BaW;
	Tue, 25 Aug 2026 20:58:56 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyEL-00000001Sp4-1fwd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 20:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787691523; bh=opptRr7//UiGidu2H6UGZTc
	w8hOoBerPUAbRLY3tiJw=; b=ap/HP+BNW+k6wBdnH69ELYHtbEBEet2XonacLvJ7v6Gb1NGBJj
	ELSGd8uTau0+MnipQdPM9KjsYTT96uWbZXT8EmNVUiehOZANpMrerT/KoXABnSnWdX+l6wDNH7G
	StqUqKbIGF0ZGXipsXysOd1Pjlrqng9cWKiVxNPwnb2sAR1/aQwDuws3CmhbY7eGWMECde26gBt
	1qh1DPfyqH03J++erlPE+kJRfASaXH9z+DYmHI7jB942KnYwDKfr/eyif4MCh/ZDSHIO7x5BeHm
	EdzAI51613IYbGRzkyoRQv5bwSJ2VjexcAfXezdZbDhOU1NWuVIAJ0YNZcsA5BzRQkQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787691523; bh=opptRr7//UiGidu2H6UGZTc
	w8hOoBerPUAbRLY3tiJw=; b=usaB9Gi0np9VxnbVpERDgcXxU8TitGyJByIaL7vwXHTBzJhLUo
	r9QV0AUWppH1TtOjw/kGBiET2pDr4AZjOCAQ==;
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
Subject: [PATCH 7/7] arm64: hibernate: use regular cpu_resume() logic
Date: Tue, 25 Aug 2026 20:58:39 +0000
Message-ID: <20260825205839.14571-8-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825205839.14571-1-brads@mainlining.org>
References: <20260825205839.14571-1-brads@mainlining.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_135849_600628_6C0E9A86 
X-CRM114-Status: GOOD (  32.35  )
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

Right now the hibernate path borrows parts of the idle suspend/resume
code and writes the rest itself. It skips cpu_resume() and branches
straight into __cpu_resume_switched() at the kernel's native EL with
the MMU on. That split has been the source of a few subtle bugs, and it
makes the code a pain to maintain.

Rework it so a resume from hibernate looks like a resume from idle. We
enter cpu_resume() at the highest available EL with the MMU off, and
leave the resumed kernel responsible for restoring all its CPU state the
same way idle does. That makes the handoff cleaner and should be more
robust.

With this, swsusp_arch_suspend_exit() now cleans the whole kernel Image
to the PoC instead of leaving the resumed kernel to clean bits of
itself. That is nicer on its own, since we cannot forget to clean some
portion of the Image that gets added later, and the maintenance is
cheap next to the page copying that dominates resume time anyway.

It also means __cpu_resume_switched() no longer needs to be visible
outside sleep.S, so it can merge back with
__cpu_resume_switched_finalise_el2().

Since this was first written, two things landed upstream and are folded
in here. Commit 684bde100117931f ("arm64: hibernate: mask DAIF before
restoring hibernated kernel") made swsusp_arch_resume() mask all DAIF
exceptions before calling hibernate_exit() and mark it unreachable(),
and that masking is kept around the new hibernate_exit() call. Commit
2c92eff008a2 ("arm64: Provide dcache_by_myline_op_nosync helper") split
dcache_by_myline_op into a _nosync form, so use that and rely on the
existing DSB after the maintenance. swsusp_arch_resume() also keeps its
__nocfi annotation from commit e2f8216ca2d8 ("arm64: Set __nocfi on
swsusp_arch_resume()").

Signed-off-by: Bradley Morgan <brads@mainlining.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/suspend.h  |  1 -
 arch/arm64/kernel/hibernate-asm.S | 78 ++++++++++++++++++++-----------
 arch/arm64/kernel/hibernate.c     | 55 ++++++++--------------
 arch/arm64/kernel/sleep.S         |  7 +--
 4 files changed, 71 insertions(+), 70 deletions(-)

diff --git a/arch/arm64/include/asm/suspend.h b/arch/arm64/include/asm/suspend.h
index 1b7570902264..3aba69df06b9 100644
--- a/arch/arm64/include/asm/suspend.h
+++ b/arch/arm64/include/asm/suspend.h
@@ -41,7 +41,6 @@ extern int cpu_suspend(unsigned long arg, int (*fn)(unsigned long));
 extern void cpu_resume(void);
 int __cpu_suspend_enter(struct sleep_stack_data *state);
 void __cpu_suspend_exit(void);
-void __cpu_resume_switched(void);
 
 int swsusp_arch_suspend(void);
 int swsusp_arch_resume(void);
diff --git a/arch/arm64/kernel/hibernate-asm.S b/arch/arm64/kernel/hibernate-asm.S
index f7613404f99e..edfab9ce4ed1 100644
--- a/arch/arm64/kernel/hibernate-asm.S
+++ b/arch/arm64/kernel/hibernate-asm.S
@@ -29,40 +29,48 @@
  *
  * This 'safe' page is mapped via ttbr0, and executed from there. This function
  * switches to a copy of the linear map in ttbr1, performs the restore, then
- * switches ttbr1 to the original kernel's swapper_pg_dir.
+ * reenters the original kernel with the MMU off.
  *
  * All of memory gets written to, including code. We need to clean the kernel
- * text to the Point of Coherence (PoC) before secondary cores can be booted.
+ * text to the Point of Coherence (PoC) before reentering it.
  * Because the kernel modules and executable pages mapped to user space are
  * also written as data, we clean all pages we touch to the Point of
  * Unification (PoU).
  *
- * x0: physical address of temporary page tables
- * x1: physical address of swapper page tables
- * x2: address of cpu_resume
- * x3: linear map address of restore_pblist in the current kernel
- * x4: physical address of __hyp_stub_vectors, or 0
- * x5: physical address of a  zero page that remains zero after resume
+ * x0: physical address of temporary zero page
+ * x1: physical address of temporary page tables
+ * x2: linear map address of restore_pblist in the current kernel
+ * x3: linear map address of the start of the resumed kernel image
+ * x4: linear map address of the end of the resumed kernel image
+ * x5: physical address to reenter the resumed kernel
+ * x6: whether to return to el2
  */
 .pushsection    ".hibernate_exit.text", "ax"
 SYM_CODE_START(swsusp_arch_suspend_exit)
 	/*
-	 * We execute from ttbr0, change ttbr1 to our copied linear map tables
-	 * with a break-before-make via the zero page
+	 * Save the arguments, the low numbered registers get clobbered below.
 	 */
-	break_before_make_ttbr_switch	x5, x0, x6, x8
-
-	mov	x21, x1
-	mov	x30, x2
+	mov	x22, x2
+	mov	x23, x3
 	mov	x24, x4
 	mov	x25, x5
+	mov	x26, x6
 
-	/* walk the restore_pblist and use copy_page() to over-write memory */
-	mov	x19, x3
+	/*
+	 * We run from an idmap in TTBR0 here, install the temporary linear
+	 * map in TTBR1.
+	 */
+	break_before_make_ttbr_switch	x0, x1, x3, x4
 
-1:	ldr	x10, [x19, #HIBERN_PBE_ORIG]
-	mov	x0, x10
-	ldr	x1, [x19, #HIBERN_PBE_ADDR]
+	/*
+	 * Walk the restore_pblist and restore each page, cleaning to the PoU
+	 * in case it holds userspace or module code.
+	 */
+.L__next_pbe:
+	ldr	x0,  [x22, #HIBERN_PBE_ORIG]
+	ldr	x1,  [x22, #HIBERN_PBE_ADDR]
+
+	mov	x10, x0
 
 	copy_page	x0, x1, x2, x3, x4, x5, x6, x7, x8, x9
 
@@ -72,21 +80,35 @@ SYM_CODE_START(swsusp_arch_suspend_exit)
 	raw_dcache_line_size x2, x3
 	dcache_by_myline_op_nosync cvau, x0, x1, x2, x3
 
-	ldr	x19, [x19, #HIBERN_PBE_NEXT]
-	cbnz	x19, 1b
-	dsb	ish		/* wait for PoU cleaning to finish */
+	ldr	x22, [x22, #HIBERN_PBE_NEXT]
+	cbnz	x22, .L__next_pbe
 
-	/* switch to the restored kernels page tables */
-	break_before_make_ttbr_switch	x25, x21, x6, x8
+	/* Clean the kernel image to the PoC, it gets used with the MMU off */
+	dcache_by_myline_op_nosync cvac, x23, x24, x2, x3
+
+	/* Complete all D-cache maintenance above */
+	dsb	ish
 
 	ic	ialluis
 	dsb	ish
 	isb
 
-	cbz	x24, 3f		/* Do we need to re-initialise EL2? */
-	mov	x1, x24
-	mov	x0, #HVC_SET_VECTORS
+	cbz	x26, .L__no_el2
+
+	/* Enter the resumed kernel at EL2 with the MMU disabled. */
+	mov	x0, #HVC_SOFT_RESTART
+	mov	x1, x25
 	hvc	#0
-3:	ret
+
+	/* HVC_SOFT_RESTART should never return */
+	b	.
+
+.L__no_el2:
+	/* Enter the resumed kernel at EL1 with the MMU disabled. */
+	mov_q	x0, INIT_SCTLR_EL1_MMU_OFF
+	pre_disable_mmu_workaround
+	msr	sctlr_el1, x0
+	isb
+	br	x25
 SYM_CODE_END(swsusp_arch_suspend_exit)
 .popsection
diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 60e264299a4d..c3556d1c4cef 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -69,15 +69,9 @@ struct arch_hibernate_hdr_invariants {
 static struct arch_hibernate_hdr {
 	struct arch_hibernate_hdr_invariants invariants;
 
-	/* These are needed to find the relocated kernel if built with kaslr */
-	phys_addr_t	ttbr1_el1;
-	void		(*reenter_kernel)(void);
-
-	/*
-	 * We need to know where the __hyp_stub_vectors are after restore to
-	 * re-configure el2.
-	 */
-	phys_addr_t	__hyp_stub_vectors;
+	phys_addr_t	kernel_start;
+	phys_addr_t	kernel_end;
+	phys_addr_t	reenter_kernel;
 
 	u64		sleep_cpu_mpidr;
 } resume_hdr;
@@ -113,14 +107,10 @@ int arch_hibernation_header_save(void *addr, unsigned int max_size)
 		return -EOVERFLOW;
 
 	arch_hdr_invariants(&hdr->invariants);
-	hdr->ttbr1_el1		= __pa_symbol(swapper_pg_dir);
-	hdr->reenter_kernel	= __cpu_resume_switched;
 
-	/* We can't use __hyp_get_vectors() because kvm may still be loaded */
-	if (el2_reset_needed())
-		hdr->__hyp_stub_vectors = __pa_symbol(__hyp_stub_vectors);
-	else
-		hdr->__hyp_stub_vectors = 0;
+	hdr->kernel_start	= __pa_symbol(_text);
+	hdr->kernel_end		= __pa_symbol(_end);
+	hdr->reenter_kernel	= __pa_symbol(cpu_resume);
 
 	/* Save the mpidr of the cpu we called cpu_suspend() on... */
 	if (sleep_cpu < 0) {
@@ -366,20 +356,6 @@ int swsusp_arch_suspend(void)
 		 */
 		swsusp_mte_free_storage();
 	} else {
-		/* Clean kernel core startup/idle code to PoC*/
-		dcache_clean_poc((unsigned long)__mmuoff_data_start,
-				 (unsigned long)__mmuoff_data_end);
-		dcache_clean_poc((unsigned long)__idmap_text_start,
-				 (unsigned long)__idmap_text_end);
-
-		/* Clean kvm setup code to PoC? */
-		if (el2_reset_needed()) {
-			dcache_clean_poc((unsigned long)__hyp_idmap_text_start,
-					 (unsigned long)__hyp_idmap_text_end);
-			dcache_clean_poc((unsigned long)__hyp_text_start,
-					 (unsigned long)__hyp_text_end);
-		}
-
 		swsusp_mte_restore_tags();
 
 		/* make the crash dump kernel image protected again */
@@ -420,8 +396,12 @@ int __nocfi swsusp_arch_resume(void)
 	size_t exit_size;
 	pgd_t *tmp_pg_dir;
 	phys_addr_t el2_vectors;
-	void __noreturn (*hibernate_exit)(phys_addr_t, phys_addr_t, void *,
-					  void *, phys_addr_t, phys_addr_t);
+
+	void (*hibernate_exit)(phys_addr_t zero_page, phys_addr_t temp_pgd,
+			       void *pblist, void *kstart, void *kend,
+			       phys_addr_t cpu_resume,
+			       unsigned long el2) __noreturn;
+
 	struct trans_pgd_info trans_info = {
 		.trans_alloc_page	= hibernate_page_alloc,
 		.trans_alloc_arg	= (__force void *)GFP_ATOMIC,
@@ -487,11 +467,14 @@ int __nocfi swsusp_arch_resume(void)
 	 *   same state : with all DAIF exceptions masked.
 	 */
 	local_daif_save();
-	hibernate_exit(virt_to_phys(tmp_pg_dir), resume_hdr.ttbr1_el1,
-		       resume_hdr.reenter_kernel, restore_pblist,
-		       resume_hdr.__hyp_stub_vectors, virt_to_phys(zero_page));
+	hibernate_exit(virt_to_phys(zero_page),
+		       virt_to_phys(tmp_pg_dir),
+		       restore_pblist,
+		       phys_to_virt(resume_hdr.kernel_start),
+		       phys_to_virt(resume_hdr.kernel_end),
+		       resume_hdr.reenter_kernel,
+		       el2_reset_needed());
 	unreachable();
-
 	return 0;
 }
 
diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
index da45ab63bd9c..8c63ffdf6d75 100644
--- a/arch/arm64/kernel/sleep.S
+++ b/arch/arm64/kernel/sleep.S
@@ -107,19 +107,16 @@ SYM_CODE_START(cpu_resume)
 	adrp	x1, swapper_pg_dir
 	adrp	x2, idmap_pg_dir
 	bl	__enable_mmu
-	ldr	x8, =__cpu_resume_switched_finalise_el2
+	ldr	x8, =__cpu_resume_switched
 	br	x8
 SYM_CODE_END(cpu_resume)
 	.ltorg
 	.popsection
 
-SYM_FUNC_START_LOCAL(__cpu_resume_switched_finalise_el2)
+SYM_FUNC_START_LOCAL(__cpu_resume_switched)
 	mov	x0, x19
 	bl	finalise_el2
-	b	__cpu_resume_switched
-SYM_FUNC_END(__cpu_resume_switched_finalise_el2)
 
-SYM_FUNC_START(__cpu_resume_switched)
 	mrs	x1, mpidr_el1
 	adr_l	x8, mpidr_hash		// x8 = struct mpidr_hash virt address
 
-- 
2.47.3


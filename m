Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FC8CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 12:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoXSHzCj4YzllEn0ikbMVGveVmreJ/pgkk4Ih3+wHXg=; b=xfoPF2eO7g6EIU9jzE9fdiehr+
	S0bEWcUBphFT54Z4Cgv4WmDwohAW/iJGDGIoCWT64B/hlSxNhv45TitXxGYM7RYrrqJeJ9mUc8JfH
	BhYhoCtIhbkgIdPgRY6RyKlDHBXejwxg+lC6ylWEsIjKFeOlT2dudt/rHeVIDZTsPrljXRlPEinR9
	fVPWwxMG8mxNBpOVY8kh2zacyeLESXtKeC5NDw2jQup5MdOmnNrSea9g0unvKeMwrFMBJ8wtGAD0y
	IT/FgDNPlqeAro6IoMfi+a3mYkBneGRfdIcTm+QVimMqxd7i5Dpawyhf+De+xXrK6oPvD1WoTKFdl
	byB64IMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MuV-00000004itz-0FB3;
	Thu, 16 Oct 2025 12:16:47 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MuQ-00000004iqr-1a3G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 12:16:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RoXSHzCj4YzllEn0ikbMVGveVmreJ/pgkk4Ih3+wHXg=;
	b=12ilpBKex3IF2LR1HkKpcHAmpRngXHOQ0Jt15KWNFwmO5p7kJDjPuPy4wHUx+eXuQB0QjG3oW
	AmsZBdDdXTqSucaBcY+IEZVRoBCPRgE+pYZq3wehtU2UjkD/U2jvoceWRpKwGy1jzRxEwwBcmPc
	x6rD9JJSHxOgAQ+L0tZDe1M=
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4cnRjw0QT4zpSth;
	Thu, 16 Oct 2025 20:15:32 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 84D73140257;
	Thu, 16 Oct 2025 20:16:28 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Oct 2025 20:16:27 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <rmk+kernel@armlinux.org.uk>, <linux@armlinux.org.uk>, <rppt@kernel.org>,
	<vbabka@suse.cz>, <pfalcato@suse.de>, <brauner@kernel.org>,
	<lorenzo.stoakes@oracle.com>, <kuninori.morimoto.gx@renesas.com>,
	<tony@atomide.com>, <arnd@arndb.de>, <bigeasy@linutronix.de>,
	<akpm@linux-foundation.org>, <punitagrawal@gmail.com>, <rjw@rjwysocki.net>,
	<marc.zyngier@arm.com>
CC: <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <liaohua4@huawei.com>,
	<lilinjie8@huawei.com>, <xieyuanbin1@huawei.com>
Subject: [PATCH v2 RESEND 2/2] ARM: mm: Optimize page_fault to reduce the impact of spectre-v2 bugfix
Date: Thu, 16 Oct 2025 20:16:22 +0800
Message-ID: <20251016121622.8957-2-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251016121622.8957-1-xieyuanbin1@huawei.com>
References: <20251016121622.8957-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_051642_736272_134C715B 
X-CRM114-Status: GOOD (  27.53  )
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

Submitting this optimized performance commit is because of
last spectre-v2 bugfix, which adds a branch to the hot code path
and may cause performance degradation.

It mainly does the following things:
1. Extract the judgment of user_mode and reduce some redundant branch.
For example, for user mode, interrupts must be enabled, and
`(faulthandler_disabled() || !mm)` is impossible. I think some other
branches can also be optimized, such as `(fsr & FSR_LNX_PF)` and
`ttbr0_usermode_access_allowed()`, but I'm not sure. Among them,
`ttbr0_usermode_access_allowed()` is after `perf_sw_event()`, I think
these two are not dependent. If `ttbr0_usermode_access_allowed()` can be
placed front, it can also be optimized into the kernel mode branch.

2. Add some like/unlikely.

3. `__do_user_fault` is cold code path, inlining may lead to negative
optimization, so add noinline.
I also want to do this for `__do_kernel_fault`, but it seems that
`fixup_exception()` in `__do_kernel_fault` is not cold code, which may be
triggered by `copy_from_user_nofault`.

Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
---
 arch/arm/mm/fault.c | 54 +++++++++++++++++++++++----------------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index e4dc7c2cfe75..09dde89a88ed 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -147,21 +147,21 @@ static void die_kernel_fault(const char *msg, struct mm_struct *mm,
  * Oops.  The kernel tried to access some page that wasn't present.
  */
 static void
 __do_kernel_fault(struct mm_struct *mm, unsigned long addr, unsigned int fsr,
 		  struct pt_regs *regs)
 {
 	const char *msg;
 	/*
 	 * Are we prepared to handle this kernel fault?
 	 */
-	if (fixup_exception(regs))
+	if (likely(fixup_exception(regs)))
 		return;
 
 	/*
 	 * No handler, we'll have to terminate things with extreme prejudice.
 	 */
 	if (addr < PAGE_SIZE) {
 		msg = "NULL pointer dereference";
 	} else {
 		if (is_translation_fault(fsr) &&
 		    kfence_handle_page_fault(addr, is_write_fault(fsr), regs))
@@ -170,21 +170,21 @@ __do_kernel_fault(struct mm_struct *mm, unsigned long addr, unsigned int fsr,
 		msg = "paging request";
 	}
 
 	die_kernel_fault(msg, mm, addr, fsr, regs);
 }
 
 /*
  * Something tried to access memory that isn't in our memory map..
  * User mode accesses just cause a SIGSEGV
  */
-static void
+static noinline void
 __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
 		int code, struct pt_regs *regs)
 {
 	struct task_struct *tsk = current;
 
 	if (addr > TASK_SIZE)
 		harden_branch_predictor();
 
 #ifdef CONFIG_DEBUG_USER
 	if (((user_debug & UDBG_SEGV) && (sig == SIGSEGV)) ||
@@ -265,135 +265,137 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
 	int sig, code;
 	vm_fault_t fault;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
 	vm_flags_t vm_flags = VM_ACCESS_FLAGS;
 
 	if (kprobe_page_fault(regs, fsr))
 		return 0;
 
-#ifdef CONFIG_HARDEN_BRANCH_PREDICTOR
-	if (unlikely(addr > TASK_SIZE) && user_mode(regs)) {
-		fault = 0;
-		code = SEGV_MAPERR;
-		goto bad_area;
-	}
-#endif
+	if (user_mode(regs)) {
+		if (IS_ENABLED(CONFIG_HARDEN_BRANCH_PREDICTOR) && unlikely(addr > TASK_SIZE)) {
+			fault = 0;
+			code = SEGV_MAPERR;
+			goto bad_area;
+		}
 
-	/* Enable interrupts if they were enabled in the parent context. */
-	if (interrupts_enabled(regs))
+		/* Enable interrupts if they were enabled in the parent context. */
 		local_irq_enable();
 
-	/*
-	 * If we're in an interrupt or have no user
-	 * context, we must not take the fault..
-	 */
-	if (faulthandler_disabled() || !mm)
-		goto no_context;
-
-	if (user_mode(regs))
 		flags |= FAULT_FLAG_USER;
+	} else {
+		/* Enable interrupts if they were enabled in the parent context. */
+		if (interrupts_enabled(regs))
+			local_irq_enable();
+
+		/*
+		 * If we're in an interrupt or have no user
+		 * context, we must not take the fault..
+		 */
+		if (faulthandler_disabled() || unlikely(!mm))
+			goto no_context;
+	}
 
 	if (is_write_fault(fsr)) {
 		flags |= FAULT_FLAG_WRITE;
 		vm_flags = VM_WRITE;
 	}
 
 	if (fsr & FSR_LNX_PF) {
 		vm_flags = VM_EXEC;
 
-		if (is_permission_fault(fsr) && !user_mode(regs))
+		if (unlikely(is_permission_fault(fsr)) && !user_mode(regs))
 			die_kernel_fault("execution of memory",
 					 mm, addr, fsr, regs);
 	}
 
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
 
 	/*
 	 * Privileged access aborts with CONFIG_CPU_TTBR0_PAN enabled are
 	 * routed via the translation fault mechanism. Check whether uaccess
 	 * is disabled while in kernel mode.
 	 */
-	if (!ttbr0_usermode_access_allowed(regs))
+	if (unlikely(!ttbr0_usermode_access_allowed(regs)))
 		goto no_context;
 
 	if (!(flags & FAULT_FLAG_USER))
 		goto lock_mmap;
 
 	vma = lock_vma_under_rcu(mm, addr);
 	if (!vma)
 		goto lock_mmap;
 
-	if (!(vma->vm_flags & vm_flags)) {
+	if (unlikely(!(vma->vm_flags & vm_flags))) {
 		vma_end_read(vma);
 		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
 		fault = 0;
 		code = SEGV_ACCERR;
 		goto bad_area;
 	}
 	fault = handle_mm_fault(vma, addr, flags | FAULT_FLAG_VMA_LOCK, regs);
 	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
 		vma_end_read(vma);
 
 	if (!(fault & VM_FAULT_RETRY)) {
 		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
 		goto done;
 	}
 	count_vm_vma_lock_event(VMA_LOCK_RETRY);
 	if (fault & VM_FAULT_MAJOR)
 		flags |= FAULT_FLAG_TRIED;
 
 	/* Quick path to respond to signals */
-	if (fault_signal_pending(fault, regs)) {
+	if (unlikely(fault_signal_pending(fault, regs))) {
 		if (!user_mode(regs))
 			goto no_context;
 		return 0;
 	}
 lock_mmap:
 
 retry:
 	vma = lock_mm_and_find_vma(mm, addr, regs);
 	if (unlikely(!vma)) {
 		fault = 0;
 		code = SEGV_MAPERR;
 		goto bad_area;
 	}
 
 	/*
 	 * ok, we have a good vm_area for this memory access, check the
 	 * permissions on the VMA allow for the fault which occurred.
 	 */
-	if (!(vma->vm_flags & vm_flags)) {
+	if (unlikely(!(vma->vm_flags & vm_flags))) {
 		mmap_read_unlock(mm);
 		fault = 0;
 		code = SEGV_ACCERR;
 		goto bad_area;
 	}
 
 	fault = handle_mm_fault(vma, addr & PAGE_MASK, flags, regs);
 
 	/* If we need to retry but a fatal signal is pending, handle the
 	 * signal first. We do not need to release the mmap_lock because
 	 * it would already be released in __lock_page_or_retry in
 	 * mm/filemap.c. */
-	if (fault_signal_pending(fault, regs)) {
+	if (unlikely(fault_signal_pending(fault, regs))) {
 		if (!user_mode(regs))
 			goto no_context;
 		return 0;
 	}
 
 	/* The fault is fully completed (including releasing mmap lock) */
 	if (fault & VM_FAULT_COMPLETED)
 		return 0;
 
-	if (!(fault & VM_FAULT_ERROR)) {
+	if (likely(!(fault & VM_FAULT_ERROR))) {
 		if (fault & VM_FAULT_RETRY) {
 			flags |= FAULT_FLAG_TRIED;
 			goto retry;
 		}
 	}
 
 	mmap_read_unlock(mm);
 done:
 
 	/* Handle the "normal" case first */
-- 
2.48.1



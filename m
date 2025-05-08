Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418CAC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 13:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+nuMulgR9J/HDNcI/4JI+/gmB2+aIrRHV4t16Fj/dM=; b=qcUzCAYOWL7ZvcgVJtKfNHRe+D
	RbrJ4CSA84YEBcBZ0GDwzBLOXUzNIyabCGdgi1H1jRb+M+ZAO9Sz95PzKLmKG6HUl3ImQu0WhWl1L
	tkUAez/ak82qJ26wTn0RjsyATOdbB3pJBinmyBWj7yoYH1NnvDCeMTfaAV1ZK7EYm/GHB8ZC3pymy
	8mO8zQXdfAbIGgrHDVyrpqbZfs4simwgRCzL5phPpX1jH8jXEPxfGYjtSZZnrnt9mUZPpgtVw0Tok
	eAPcGwONvHBOA0CGa5pMhk1npbJJEBSMAlcgYJ4ngD59l90iN3I6m7mpbxTg1lu/rM2cXL2uXzPqt
	KhgdwTFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1kZ-00000000prf-0xb8;
	Thu, 08 May 2025 13:57:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1Hz-00000000kUq-183B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:27:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 839B4106F;
	Thu,  8 May 2025 06:27:40 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 82C0F3F58B;
	Thu,  8 May 2025 06:27:48 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	daniel.kiss@arm.com,
	david.spickett@arm.com,
	luis.machado@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	richard.sandiford@arm.com,
	sander.desmalen@arm.com,
	tabba@google.com,
	tamas.petz@arm.com,
	tkjos@google.com,
	will@kernel.org,
	yury.khrustalev@arm.com
Subject: [PATCH v2 13/24] arm64/fpsimd: Make clone() compatible with ZA lazy saving
Date: Thu,  8 May 2025 14:26:33 +0100
Message-Id: <20250508132644.1395904-14-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250508132644.1395904-1-mark.rutland@arm.com>
References: <20250508132644.1395904-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_062751_397258_025416E6 
X-CRM114-Status: GOOD (  33.40  )
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

Linux is intended to be compatible with userspace written to Arm's
AAPCS64 procedure call standard [1,2]. For the Scalable Matrix Extension
(SME), AAPCS64 was extended with a "ZA lazy saving scheme", where SME's
ZA tile is lazily callee-saved and caller-restored. In this scheme,
TPIDR2_EL0 indicates whether the ZA tile is live or has been saved by
pointing to a "TPIDR2 block" in memory, which has a "za_save_buffer"
pointer. This scheme has been implemented in GCC and LLVM, with
necessary runtime support implemented in glibc and bionic.

AAPCS64 does not specify how the ZA lazy saving scheme is expected to
interact with thread creation mechanisms such as fork() and
pthread_create(), which would be implemented in terms of the Linux clone
syscall. The behaviour implemented by Linux and glibc/bionic doesn't
always compose safely, as explained below.

Currently the clone syscall is implemented such that PSTATE.ZA and the
ZA tile are always inherited by the new task, and TPIDR2_EL0 is
inherited unless the 'flags' argument includes CLONE_SETTLS,
in which case TPIDR2_EL0 is set to 0/NULL. This doesn't make much sense:

(a) TPIDR2_EL0 is part of the calling convention, and changes as control
    is passed between functions. It is *NOT* used for thread local
    storage, despite superficial similarity to TPIDR_EL0, which is is
    used as the TLS register.

(b) TPIDR2_EL0 and PSTATE.ZA are tightly coupled in the procedure call
    standard, and some combinations of states are illegal. In general,
    manipulating the two independently is not guaranteed to be safe.

In practice, code which is compliant with the procedure call standard
may issue a clone syscall while in the "ZA dormant" state, where
PSTATE.ZA==1 and TPIDR2_EL0 is non-null and indicates that ZA needs to
be saved. This can cause a variety of problems, including:

* If the implementation of pthread_create() passes CLONE_SETTLS, the
  new thread will start with PSTATE.ZA==1 and TPIDR2==NULL. Per the
  procedure call standard this is not a legitimate state for most
  functions. This can cause data corruption (e.g. as code may rely on
  PSTATE.ZA being 0 to guarantee that an SMSTART ZA instruction will
  zero the ZA tile contents), and may result in other undefined
  behaviour.

* If the implementation of pthread_create() does not pass CLONE_SETTLS, the
  new thread will start with PSTATE.ZA==1 and TPIDR2 pointing to a
  TPIDR2 block on the parent thread's stack. This can result in a
  variety of problems, e.g.

  - The child may write back to the parent's za_save_buffer, corrupting
    its contents.

  - The child may read from the TPIDR2 block after the parent has reused
    this memory for something else, and consequently the child may abort
    or clobber arbitrary memory.

Ideally we'd require that userspace ensures that a task is in the "ZA
off" state (with PSTATE.ZA==0 and TPIDR2_EL0==NULL) prior to issuing a
clone syscall, and have the kernel force this state for new threads.
Unfortunately, contemporary C libraries do not do this, and simply
forcing this state within the implementation of clone would break
fork().

Instead, we can bodge around this by considering the CLONE_VM flag, and
manipulate PSTATE.ZA and TPIDR2_EL0 as a pair. CLONE_VM indicates that
the new task will run in the same address space as its parent, and in
that case it doesn't make sense to inherit a stale pointer to the
parent's TPIDR2 block:

* For fork(), CLONE_VM will not be set, and it is safe to inherit both
  PSTATE.ZA and TPIDR2_EL0 as the new task will have its own copy of the
  address space, and cannot clobber its parent's stack.

* For pthread_create() and vfork(), CLONE_VM will be set, and discarding
  PSTATE.ZA and TPIDR2_EL0 for the new task doesn't break any existing
  assumptions in userspace.

Implement this behaviour for clone(). We currently inherit PSTATE.ZA in
arch_dup_task_struct(), but this does not have access to the clone
flags, so move this logic under copy_thread(). Documentation is updated
to describe the new behaviour.

[1] https://github.com/ARM-software/abi-aa/releases/download/2025Q1/aapcs64.pdf
[2] https://github.com/ARM-software/abi-aa/blob/c51addc3dc03e73a016a1e4edf25440bcac76431/aapcs64/aapcs64.rst

Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Daniel Kiss <daniel.kiss@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Richard Sandiford <richard.sandiford@arm.com>
Cc: Sander De Smalen <sander.desmalen@arm.com>
Cc: Tamas Petz <tamas.petz@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yury Khrustalev <yury.khrustalev@arm.com>
Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>
---
 Documentation/arch/arm64/sme.rst |  4 +-
 arch/arm64/kernel/process.c      | 92 +++++++++++++++++++++-----------
 2 files changed, 64 insertions(+), 32 deletions(-)

diff --git a/Documentation/arch/arm64/sme.rst b/Documentation/arch/arm64/sme.rst
index 3a98aed92732e..1c1e48d8bd1a5 100644
--- a/Documentation/arch/arm64/sme.rst
+++ b/Documentation/arch/arm64/sme.rst
@@ -69,8 +69,8 @@ model features for SME is included in Appendix A.
   vectors from 0 to VL/8-1 stored in the same endianness invariant format as is
   used for SVE vectors.
 
-* On thread creation TPIDR2_EL0 is preserved unless CLONE_SETTLS is specified,
-  in which case it is set to 0.
+* On thread creation PSTATE.ZA and TPIDR2_EL0 are preserved unless CLONE_VM
+  is specified, in which case PSTATE.ZA is set to 0 and TPIDR2_EL0 is set to 0.
 
 2.  Vector lengths
 ------------------
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 27a5b0c7ec60b..74bee78cc3fac 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -364,31 +364,14 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	task_smstop_sm(dst);
 
 	/*
-	 * In the unlikely event that we create a new thread with ZA
-	 * enabled we should retain the ZA and ZT state so duplicate
-	 * it here.  This may be shortly freed if we exec() or if
-	 * CLONE_SETTLS but it's simpler to do it here. To avoid
-	 * confusing the rest of the code ensure that we have a
-	 * sve_state allocated whenever sme_state is allocated.
+	 * Drop stale reference to src's sme_state and ensure dst has ZA
+	 * disabled.
+	 *
+	 * When necessary, ZA will be inherited later in copy_thread_za().
 	 */
-	if (thread_za_enabled(&src->thread)) {
-		dst->thread.sve_state = kzalloc(sve_state_size(src),
-						GFP_KERNEL);
-		if (!dst->thread.sve_state)
-			return -ENOMEM;
-
-		dst->thread.sme_state = kmemdup(src->thread.sme_state,
-						sme_state_size(src),
-						GFP_KERNEL);
-		if (!dst->thread.sme_state) {
-			kfree(dst->thread.sve_state);
-			dst->thread.sve_state = NULL;
-			return -ENOMEM;
-		}
-	} else {
-		dst->thread.sme_state = NULL;
-		clear_tsk_thread_flag(dst, TIF_SME);
-	}
+	dst->thread.sme_state = NULL;
+	clear_tsk_thread_flag(dst, TIF_SME);
+	dst->thread.svcr &= ~SVCR_ZA_MASK;
 
 	/* clear any pending asynchronous tag fault raised by the parent */
 	clear_tsk_thread_flag(dst, TIF_MTE_ASYNC_FAULT);
@@ -396,6 +379,31 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
+static int copy_thread_za(struct task_struct *dst, struct task_struct *src)
+{
+	if (!thread_za_enabled(&src->thread))
+		return 0;
+
+	dst->thread.sve_state = kzalloc(sve_state_size(src),
+					GFP_KERNEL);
+	if (!dst->thread.sve_state)
+		return -ENOMEM;
+
+	dst->thread.sme_state = kmemdup(src->thread.sme_state,
+					sme_state_size(src),
+					GFP_KERNEL);
+	if (!dst->thread.sme_state) {
+		kfree(dst->thread.sve_state);
+		dst->thread.sve_state = NULL;
+		return -ENOMEM;
+	}
+
+	set_tsk_thread_flag(dst, TIF_SME);
+	dst->thread.svcr |= SVCR_ZA_MASK;
+
+	return 0;
+}
+
 asmlinkage void ret_from_fork(void) asm("ret_from_fork");
 
 int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
@@ -428,8 +436,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		 * out-of-sync with the saved value.
 		 */
 		*task_user_tls(p) = read_sysreg(tpidr_el0);
-		if (system_supports_tpidr2())
-			p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
 
 		if (system_supports_poe())
 			p->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
@@ -441,14 +447,40 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 				childregs->sp = stack_start;
 		}
 
+		/*
+		 * Due to the AAPCS64 "ZA lazy saving scheme", PSTATE.ZA and
+		 * TPIDR2 need to be manipulated as a pair, and either both
+		 * need to be inherited or both need to be reset.
+		 *
+		 * Within a process, child threads must not inherit their
+		 * parent's TPIDR2 value or they may clobber their parent's
+		 * stack at some later point.
+		 *
+		 * When a process is fork()'d, the child must inherit ZA and
+		 * TPIDR2 from its parent in case there was dormant ZA state.
+		 *
+		 * Use CLONE_VM to determine when the child will share the
+		 * address space with the parent, and cannot safely inherit the
+		 * state.
+		 */
+		if (system_supports_sme()) {
+			if (!(clone_flags & CLONE_VM)) {
+				p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
+				ret = copy_thread_za(p, current);
+				if (ret)
+					return ret;
+			} else {
+				p->thread.tpidr2_el0 = 0;
+				WARN_ON_ONCE(p->thread.svcr & SVCR_ZA_MASK);
+			}
+		}
+
 		/*
 		 * If a TLS pointer was passed to clone, use it for the new
-		 * thread.  We also reset TPIDR2 if it's in use.
+		 * thread.
 		 */
-		if (clone_flags & CLONE_SETTLS) {
+		if (clone_flags & CLONE_SETTLS)
 			p->thread.uw.tp_value = tls;
-			p->thread.tpidr2_el0 = 0;
-		}
 
 		ret = copy_thread_gcs(p, args);
 		if (ret != 0)
-- 
2.30.2



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11034606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 02:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IcT4sScC;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=QmpgnhfA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pfbkLA1oZODuoTPbiAm5neMQxGYu7Bp3PxPs9srY4Jo=; b=IcT4sScCcjNt+I
	hQgepVYJ44ngCvz1YzGg8tJon+sTnykUIPKTidzixdlEeBc/qX1V/ozEGTvSqBJ6FqEPDtNsu7B/y
	1GDISjT0TuRj7/109nXts5dhopOzyGNaeL4felHAutaXuoa/qA1vY157IepCimegS9u2DWoIJh0QN
	SpmCRDwZqSJ29As8qyjWavXQmF2q/qNrXlo3qL8Cw+qaaxrxLBWybRySUVfVOgqFxoOfn5Lo2qI7n
	JDP510yHRFJ7fX4FtoxZUlLMtMrOHjzMLspl89sIWSv9pO4vMaGSNoH7BbxjFSoTvPmkRjENxg/nj
	SCJ/ItqleLjxRhZMBZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9ci-0000000B3KW-3n12;
	Fri, 06 Nov 2026 02:24:12 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9cg-0000000B3IY-1zmj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 02:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=pfbkLA1oZODuoTPbiAm5neMQxGYu7Bp3PxPs9srY4Jo=; t=1793931850; x=2109291850; 
	b=QmpgnhfAdgPxpxRYc4a+zFzaKChkeX3fIdox+7/0W/4J86OZRpg/TMRVkXrcgUtewGwh+b3C33u
	FNFuVmnZMY2SwVCDVNX9/FeuTfUzf+xZtD8VTT4Dski28ckgXXLhJBcQ+VL5xh65eBFrHPX51KkUc
	Oj/B7AopwxM/yMijrSi73dls7L9JEEn1Dz5S1ujWfKW0sYg/yioMph/kw/M5DMOSEnLoDZFdjXW4E
	6XP6e91Itb2JXMpB4gviN8bXuGrc438Z9PmhFfcNyeHlXvdeaGkJEUKe7WSveipMeh/ncnCktnvEI
	f6SW9LYZqtwhVrSjZSwtnp63qZLoc5c8m5gw==;
Received: from [177.172.122.137] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xP9cO-003xm9-KB; Fri, 06 Nov 2026 03:23:52 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Thu, 05 Nov 2026 23:23:44 -0300
Subject: [PATCH v10 3/3] arm64: vdso: Implement
 __vdso_futex_robust_try_unlock()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261105-tonyk-robust_arm-v10-3-366ed4a3435b@igalia.com>
References: <20261105-tonyk-robust_arm-v10-0-366ed4a3435b@igalia.com>
In-Reply-To: <20261105-tonyk-robust_arm-v10-0-366ed4a3435b@igalia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Florian Weimer <fweimer@redhat.com>, 
 Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
 Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>, 
 Uros Bizjak <ubizjak@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, kernel-dev@igalia.com, 
 LKML <linux-kernel@vger.kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_182410_706474_980C4CDC 
X-CRM114-Status: GOOD (  28.11  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The futex's robust list uAPI has a struct robust_list_head::list_op_pending
pointer used by userspace as a temporary variable while the mutex unlock is
happening. User sets it to the futex address that's about to be released
and removed from the robust list, and list_op_pending is cleared after.
After a thread dies, the kernel checks it's list_op_pending and wakes the
mutex in that address, to prevent starvation, and flip a bit in the mutex
word (FUTEX_OWNER_DIED).

However, there's a critical section where the user thread dies after the
mutex is released but before list_op_pending is cleared. If that happens,
another thread can wake up, use the lock, release it, and free its
memory. Now, if the robust list cleanup happens after this, the
killed thread's list_op_pending becomes a dandling pointer. The
kernel wrongly treats this address as a mutex, calls a futex_wake()
on it and flips a bit, causing a memory corruption.

To avoid using the dangling pointer, implement
__vdso_futex_robust_try_unlock() for arm64. Make the VDSO release the mutex
and clear the list_op_pending fields, just as is done in userspace right
now. But having it in a VDSO means that, in the case of a killed user
thread, the kernel can know exactly in which part of the release process
the thread was interrupt, check the registers for the operation success and
clears the list_op_pending on behalf of the user thread to prevent the
use-after-free bug.

The need for checking the instructions addresses and the register makes
this mechanism arch-dependent. Implement it using LL/SC semantics. If the
user instruction pointer is between the labels
__futex_list64_try_unlock_cs_start and __futex_list64_try_unlock_cs_end,
the critical section was interrupted. The kernel checks for the result
register (always w3) of the stlxr instruction used for atomically releasing
the mutex. If it's 0, the release happened and the kernel should clear the
list_op_pending field (always stored at x2).

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v9:
 - Refactor assembly code style
 - Make sure [pop_reg] is allocated to a register, defining it as a "r"
 input
 - Make [lock] a read-write param using +Q

v7:
 - Typo in message: success result for stlex is 0, not 1
 - pop_reg is read afterwards so define it as an output parameter "+Q"

v6:
 - Complete reword of commit message to make it clear
 - Better commit split, only the specific aarch64 things here
 - Use explicity labels instead of macros

v4:
 - Guard makefile for vfutex.o with ifdef
 - Moved _start label one instruction above
 - Use results register (w3) to check for store success instead of using zero
   flag

v3:
 - Managed to get pop to always be stored at x2
---
 arch/arm64/Kconfig                |  1 +
 arch/arm64/kernel/vdso.c          | 17 ++++++++++++++--
 arch/arm64/kernel/vdso/Makefile   | 10 ++++++++++
 arch/arm64/kernel/vdso/vdso.lds.S |  9 +++++++++
 arch/arm64/kernel/vdso/vfutex.c   | 41 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1075bc661833..bc436c11b82a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -223,6 +223,7 @@ config ARM64
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select HAVE_FUNCTION_ARG_ACCESS_API
+	select HAVE_FUTEX_ROBUST_UNLOCK
 	select HAVE_RSEQ
 	select HAVE_RUST
 	select HAVE_STACKPROTECTOR
diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 644def28f280..b8280afd8b42 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -68,16 +68,27 @@ static inline void __vdso_futex_update_ips(struct mm_struct *mm, bool is_32bit,
 	futex_set_vdso_cs_range(fd, 0, start, end, is_32bit);
 }
 
+static inline void vdso_futex_update_ips(struct mm_struct *mm)
+{
+	unsigned long vdso = (unsigned long)mm->context.vdso;
+
+	__vdso_futex_update_ips(mm, false,
+				VDSO_SYMBOL(vdso, futex_list64_try_unlock_cs_start),
+				VDSO_SYMBOL(vdso, futex_list64_try_unlock_cs_end));
+}
+
 #else
-static inline void __vdso_futex_update_ips(struct mm_struct *mm, bool is_32bit, void *startp,
-					   void *endp)
+static inline void vdso_futex_update_ips(struct mm_struct *mm) {}
 #endif /* CONFIG_FUTEX_ROBUST_UNLOCK */
 
+
 static int vdso_mremap(const struct vm_special_mapping *sm,
 		       struct vm_area_struct *new_vma)
 {
 	current->mm->context.vdso = (void *)new_vma->vm_start;
 
+	vdso_futex_update_ips(current->mm);
+
 	return 0;
 }
 
@@ -365,5 +376,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	ret = __setup_additional_pages(VDSO_ABI_AA64, mm, bprm, uses_interp);
 	mmap_write_unlock(mm);
 
+	vdso_futex_update_ips(mm);
+
 	return ret;
 }
diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index f6619e1cb2ce..babeb1f33da3 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -11,6 +11,10 @@ include $(srctree)/lib/vdso/Makefile.include
 
 obj-vdso := vgettimeofday.o note.o sigreturn.o vgetrandom.o vgetrandom-chacha.o
 
+ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+  obj-vdso += vfutex.o
+endif
+
 # Build rules
 targets := $(obj-vdso) vdso.so vdso.so.dbg
 obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
@@ -45,9 +49,11 @@ CC_FLAGS_ADD_VDSO := -O2 -mcmodel=tiny -fasynchronous-unwind-tables $(CONFIG_CC_
 
 CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_REMOVE_VDSO)
 CFLAGS_REMOVE_vgetrandom.o = $(CC_FLAGS_REMOVE_VDSO)
+CFLAGS_REMOVE_vfutex.o = $(CC_FLAGS_REMOVE_VDSO)
 
 CFLAGS_vgettimeofday.o = $(CC_FLAGS_ADD_VDSO)
 CFLAGS_vgetrandom.o = $(CC_FLAGS_ADD_VDSO)
+CFLAGS_vfutex.o = $(CC_FLAGS_ADD_VDSO)
 
 ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
@@ -57,6 +63,10 @@ ifneq ($(c-getrandom-y),)
   CFLAGS_vgetrandom.o += -include $(c-getrandom-y)
 endif
 
+ifneq ($(c-futex-y),)
+  CFLAGS_vfutex.o += -include $(c-futex-y)
+endif
+
 targets += vdso.lds
 CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
 
diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
index 6334ca0a7673..26f08e30306f 100644
--- a/arch/arm64/kernel/vdso/vdso.lds.S
+++ b/arch/arm64/kernel/vdso/vdso.lds.S
@@ -103,6 +103,9 @@ VERSION
 		__kernel_clock_gettime;
 		__kernel_clock_getres;
 		__kernel_getrandom;
+#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+		__vdso_futex_robust_list64_try_unlock;
+#endif
 	local: *;
 	};
 }
@@ -111,3 +114,9 @@ VERSION
  * Make the sigreturn code visible to the kernel.
  */
 VDSO_sigtramp		= __kernel_rt_sigreturn;
+
+#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+VDSO_futex_list64_try_unlock_cs_start = __futex_list64_try_unlock_cs_start;
+VDSO_futex_list64_try_unlock_cs_success = __futex_list64_try_unlock_cs_success;
+VDSO_futex_list64_try_unlock_cs_end = __futex_list64_try_unlock_cs_end;
+#endif
diff --git a/arch/arm64/kernel/vdso/vfutex.c b/arch/arm64/kernel/vdso/vfutex.c
new file mode 100644
index 000000000000..7622aa34bfdb
--- /dev/null
+++ b/arch/arm64/kernel/vdso/vfutex.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <linux/stringify.h>
+#include <vdso/futex.h>
+
+#define LABEL(l)						\
+	"	.globl " #l "\n"				\
+	#l ":\n"
+
+__u32 __vdso_futex_robust_list64_try_unlock(__u32 *lock, __u32 tid, __u64 *pop)
+{
+	/*
+	 * arm64_futex_robust_unlock_get_pop() depends on this exact register
+	 * allocation to work correctly.
+	 */
+	register __u64 pop_reg asm("x2") = (__u64) pop;
+	register __u32 result_reg asm("w3") = 0;
+	__u32 val;
+
+	asm volatile (
+		"	prfm	pstl1strm, %[lock]		\n"
+		"retry:						\n"
+		"	ldxr	%w[val], %[lock]		\n"
+		"	cmp	%w[tid], %w[val]		\n"
+		"	b.ne	__futex_list64_try_unlock_cs_end\n"
+		"	stlxr	%w[result], wzr, %[lock]	\n"
+		LABEL(__futex_list64_try_unlock_cs_start)
+		"	cbnz	%w[result], retry		\n"
+		LABEL(__futex_list64_try_unlock_cs_success)
+		"	str	xzr, [%x[pop_reg]]		\n"
+		LABEL(__futex_list64_try_unlock_cs_end)
+
+		: [val] "=&r" (val),
+		  [result] "=&r" (result_reg),
+		  [lock] "+Q" (*lock)
+		: [tid] "r" (tid),
+		  [pop_reg] "r" (pop_reg)
+		: "cc", "memory"
+	);
+
+	return val;
+}

-- 
2.56.0



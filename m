Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A406FC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 20:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91ezvrV1vwNu9uImq03EwrZwIuPaPnijZDc+cVw5M84=; b=Wr8X7JayWZOVh8bpwoZXm96KBo
	QkmyOcJVC/swVGHqU8jmjDhYU2FlHv9IEpX8Ry/bOyBV/O/zWlqd1HrpDvRaOOv/J2Ie/WKC8g9bW
	7H/E2/s5RImt44ZfAq5Feem5Sh9BICa060RK74Q3ARKIV/IsHPDaj45z+uCXiXli5sbNCnvGA8k+W
	JlRWudJnBGMRh2QqmZKDpnHts54Gam6NxzsT4Oz/dXsOLL6fuBHeAYPWZT46yjeAPWAnUsUJCD4mh
	FW245rs/ts51l8lrwEiQmoW2dko3ZPCOxDYH9d+6I2FsTXAXN3GB0sYMmcIpNs6SnigIYf/U9Rste
	mBgOamSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wooM1-00000006DMe-2D64;
	Tue, 28 Jul 2026 20:24:45 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wooLr-00000006DJ1-2PFc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 20:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=91ezvrV1vwNu9uImq03EwrZwIuPaPnijZDc+cVw5M84=; b=Urv1hYewQBY9SygrJtTlXTDBR6
	I1Uy1uKGpDLfCIZ5lIv6nyNRwUqLgnL8Y6xdXkY2iLmDeh1succ2Lha9fgOekn/LSARuikKz1velW
	+dlEIFMlF5naw0XWPs36ZdlfZstUgnUQm4LvH15QSm29RLpJwqCigs/Tz9CcZW53BJ888qBBC4xcB
	ShvQVhSXdGREzo7JQwi5MEFf/N6FanTKKOjUyVv31LiiqUY9kTartKUnQj0xrtgbqzZTJmEOT49Br
	vPwZEwMvN6gdmpuV324o9dM4lyRNaUgNBey6b+U5zGPOhfVrue9+ZHC9eWUntrQXiFZptO/o8dumG
	yRxfhH/Q==;
Received: from [179.118.190.213] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wooLm-0079dZ-GZ; Tue, 28 Jul 2026 22:24:30 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Tue, 28 Jul 2026 17:24:04 -0300
Subject: [PATCH v7 4/4] arm64: vdso32: Implement
 __vdso_futex_robust_try_unlock()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-tonyk-robust_arm-v7-4-40873c377c63@igalia.com>
References: <20260728-tonyk-robust_arm-v7-0-40873c377c63@igalia.com>
In-Reply-To: <20260728-tonyk-robust_arm-v7-0-40873c377c63@igalia.com>
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
X-CRM114-CacheID: sfid-20260728_132435_622595_39C9BF1D 
X-CRM114-Status: GOOD (  16.30  )
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

Based on aarch64 implementation, provide a 32 bit entry point for
this vDSO.

In order to keep compatibility with arm64_futex_robust_unlock_get_pop(),
make sure to store the pop address at r2 and the compare result value
at r3.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v7:
 - The store needs to be a release store, so s/strex/stlex/
 - result reg clobber modified to "=&r" to make sure the compiler don't use
 the r3 reg for something else
 - pop_reg will be read after the execution so it should be an output
 parameter with "+Q"
---
 arch/arm64/kernel/vdso.c            | 14 ++++++++++++++
 arch/arm64/kernel/vdso32/Makefile   |  4 ++++
 arch/arm64/kernel/vdso32/vdso.lds.S |  9 +++++++++
 arch/arm64/kernel/vdso32/vfutex.c   | 34 ++++++++++++++++++++++++++++++++++
 4 files changed, 61 insertions(+)

diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 1d1633e8339b..d9b86f9a0db6 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -182,6 +182,15 @@ enum aarch32_map {
 static struct page *aarch32_vectors_page __ro_after_init;
 static struct page *aarch32_sig_page __ro_after_init;
 
+static inline void aarch32_vdso_futex_update_ips(struct mm_struct *mm)
+{
+	unsigned long vdso = (unsigned long) mm->context.vdso;
+
+	__vdso_futex_update_ips(mm, true,
+				VDSO_SYMBOL(vdso, futex_list32_try_unlock_cs_start),
+				VDSO_SYMBOL(vdso, futex_list32_try_unlock_cs_end));
+}
+
 static int aarch32_sigpage_mremap(const struct vm_special_mapping *sm,
 				  struct vm_area_struct *new_vma)
 {
@@ -195,6 +204,8 @@ static int aarch32_mremap(const struct vm_special_mapping *sm,
 {
 	current->mm->context.vdso = (void *)new_vma->vm_start;
 
+	aarch32_vdso_futex_update_ips(current->mm);
+
 	return 0;
 }
 
@@ -327,6 +338,7 @@ static int aarch32_sigreturn_setup(struct mm_struct *mm)
 	return PTR_ERR_OR_ZERO(ret);
 }
 
+
 int aarch32_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 {
 	struct mm_struct *mm = current->mm;
@@ -347,6 +359,8 @@ int aarch32_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	}
 
 	ret = aarch32_sigreturn_setup(mm);
+
+	aarch32_vdso_futex_update_ips(mm);
 out:
 	mmap_write_unlock(mm);
 	return ret;
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 4bd60f059f4a..f3190125c68b 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -97,6 +97,10 @@ munge := ../../../arm/vdso/vdsomunge
 hostprogs := $(munge)
 
 c-obj-vdso := note.o
+ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+  c-obj-vdso += vfutex.o
+endif
+
 c-obj-vdso-gettimeofday := vgettimeofday.o
 
 ifneq ($(c-gettimeofday-y),)
diff --git a/arch/arm64/kernel/vdso32/vdso.lds.S b/arch/arm64/kernel/vdso32/vdso.lds.S
index c374fb0146f3..46c0123b2684 100644
--- a/arch/arm64/kernel/vdso32/vdso.lds.S
+++ b/arch/arm64/kernel/vdso32/vdso.lds.S
@@ -87,6 +87,15 @@ VERSION
 		__vdso_clock_getres;
 		__vdso_clock_gettime64;
 		__vdso_clock_getres_time64;
+#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+		__vdso_futex_robust_list32_try_unlock;
+#endif
 	local: *;
 	};
 }
+
+#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+VDSO_futex_list32_try_unlock_cs_success = __futex_list32_try_unlock_cs_success;
+VDSO_futex_list32_try_unlock_cs_start = __futex_list32_try_unlock_cs_start;
+VDSO_futex_list32_try_unlock_cs_end = __futex_list32_try_unlock_cs_end;
+#endif
diff --git a/arch/arm64/kernel/vdso32/vfutex.c b/arch/arm64/kernel/vdso32/vfutex.c
new file mode 100644
index 000000000000..0d9080b17965
--- /dev/null
+++ b/arch/arm64/kernel/vdso32/vfutex.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <linux/stringify.h>
+#include <vdso/futex.h>
+
+__u32 __vdso_futex_robust_list32_try_unlock(__u32 *lock, __u32 tid, __u32 *pop)
+{
+	register __u32 *pop_reg asm("r2") = pop, result_reg asm("r3") = 0;
+	__u32 val, zero = 0;
+
+	asm volatile (
+		".globl						  "
+		"__futex_list32_try_unlock_cs_start,		  "
+		"__futex_list32_try_unlock_cs_success,		  "
+		"__futex_list32_try_unlock_cs_end		\n"
+
+		"retry:						\n"
+		"	ldrex %[val], %[lock]			\n"
+		"	cmp %[tid], %[val]			\n"
+		"	bne __futex_list32_try_unlock_cs_end	\n"
+		"	stlex %[result], %[zero], %[lock]	\n"
+		"__futex_list32_try_unlock_cs_start:		\n"
+		"	cmp %[result], #0			\n"
+		"	bne retry				\n"
+		"__futex_list32_try_unlock_cs_success:		\n"
+		"	str %[zero], %[pop_reg]			\n"
+		"__futex_list32_try_unlock_cs_end:		\n"
+
+		: [val] "=&r" (val), [result] "=&r" (result_reg), [pop_reg] "+Q" (*pop_reg)
+		: [tid] "r" (tid), [lock] "Q" (*lock), [zero] "r" (zero)
+		: "cc", "memory"
+	);
+
+	return val;
+}

-- 
2.55.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BBBC44502
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 17:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSIhiCvRo5P9jTHg6jbzEKDNhagZjmhPUVsXSsYFY54=; b=jKFqeYFrS7c9f3oPK9BvnQ23yq
	rkn+ul4fLIwEDOWwygXKrQCNX5PWHu37pxm6pB0wfyvqmol8b1YT7oQ+/RoVJt/cSv/uD7ARuI9Es
	N8Xk2qssy0t/yFQsAlZgRZEEjOIULhfyTRlRWIOaAPqgP7fu6W7oehW+P/4uOinKIAR2+nWtauHGw
	2tOcMO4YQJa6Z7BxgUoSNCsoJ9J8IiBhQoKgXY7DW/GYal0FV+uHg+oRLoxkD9f6IdoOasHCNBR1P
	5ukG5ubvzGIdeI4ngjTz6zXvoz6a2o+5V7qJNdTn0yBWEs3bIe8BfxLcgBIFpqOmUI9IcNx7IRCuE
	A6fT7leQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgR6Q-00000009XSV-16HJ;
	Sun, 05 Jul 2026 17:58:02 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgR6M-00000009XQQ-0nLC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 17:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZSIhiCvRo5P9jTHg6jbzEKDNhagZjmhPUVsXSsYFY54=; b=A+NHr6NbZDiiQf65Vk9do6Jb5H
	ew3f4xmpB5VxiiqpnYYhL35rfMDDPRYks4Dn/94dOX6hCro7qYGdZEJ6EP3q9j0pRoq6nRL3IyAtR
	FOqaaI/PuA01PJl6I8rGpS+tthpfl114ZtdEVAZtfs01nyQx9YHEQUO4KoRxFE/++wGfClfyw0TS2
	uUAHa2tCjleQwNxQtgPjnwODaeKSFrT7Q/AlYX4dVTEN+KcpslTUuuKoKAsRtm3EItPWmvihw2+g7
	cNnRtBdHTrQG6LOAQP8CU9MCXExxtZr7TMuc92HQVu8QiL59W/ZhOJwpkxt1AX7nZxDe/bsV6EKjE
	1stAuksg==;
Received: from 201-69-111-23.dial-up.telesp.net.br ([201.69.111.23] helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wgR5n-009PnY-JQ; Sun, 05 Jul 2026 19:57:23 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Sun, 05 Jul 2026 14:56:52 -0300
Subject: [PATCH v4 2/5] arm64: vdso: Prepare for robust futex unlock
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260705-tonyk-robust_arm-v4-2-e0fd0fa259d3@igalia.com>
References: <20260705-tonyk-robust_arm-v4-0-e0fd0fa259d3@igalia.com>
In-Reply-To: <20260705-tonyk-robust_arm-v4-0-e0fd0fa259d3@igalia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Carlos O'Donell <carlos@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@aerifal.cx>, 
 Torvald Riegel <triegel@redhat.com>, Darren Hart <dvhart@infradead.org>, 
 Ingo Molnar <mingo@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, 
 Arnd Bergmann <arnd@arndb.de>, Uros Bizjak <ubizjak@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 "Liam R. Howlett" <liam@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, kernel-dev@igalia.com, 
 LKML <linux-kernel@vger.kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_105758_227990_3E6EBD00 
X-CRM114-Status: GOOD (  15.78  )
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

There will be a VDSO function to unlock non-contended robust futexes in
user space. The unlock sequence is racy vs. clearing the list_pending_op
pointer in the task's robust list head. To plug this race the kernel needs
to know the critical section window so it can clear the pointer when the
task is interrupted within that race window. The window is determined by
labels in the inline assembly.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v4:
- Guard symbols from vdso.lds.S with ifdef
- drop update_ips() from sigpage remap function

v3:
 - Fix adding vdso base addr twice
 - Call vdso_futex_robust_unlock_update_ips() on remap as well
v2:
 - Fixed linker not finding VDSO symbols
---
 arch/arm64/kernel/vdso.c          | 23 +++++++++++++++++++++++
 arch/arm64/kernel/vdso/vdso.lds.S |  9 +++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 592dd8668de4..283b38684ef7 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -11,6 +11,7 @@
 #include <linux/clocksource.h>
 #include <linux/elf.h>
 #include <linux/err.h>
+#include <linux/futex.h>
 #include <linux/errno.h>
 #include <linux/gfp.h>
 #include <linux/kernel.h>
@@ -57,11 +58,31 @@ static struct vdso_abi_info vdso_info[] __ro_after_init = {
 #endif /* CONFIG_COMPAT_VDSO */
 };
 
+#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+static void vdso_futex_robust_unlock_update_ips(enum vdso_abi abi, struct mm_struct *mm)
+{
+	unsigned long vdso = (unsigned long) mm->context.vdso;
+	struct futex_mm_data *fd = &mm->futex;
+	uintptr_t success, end;
+
+	if (abi == VDSO_ABI_AA64) {
+		success = (uintptr_t) VDSO_SYMBOL(vdso, futex_list64_try_unlock_cs_success);
+		end = (uintptr_t) VDSO_SYMBOL(vdso, futex_list64_try_unlock_cs_end);
+
+		futex_set_vdso_cs_range(fd, 0, success, end, false);
+	}
+}
+#else
+static inline void vdso_futex_robust_unlock_update_ips(enum vdso_abi abi, struct mm_struct *mm) { }
+#endif /* CONFIG_FUTEX_ROBUST_UNLOCK */
+
 static int vdso_mremap(const struct vm_special_mapping *sm,
 		struct vm_area_struct *new_vma)
 {
 	current->mm->context.vdso = (void *)new_vma->vm_start;
 
+	vdso_futex_robust_unlock_update_ips(VDSO_ABI_AA64, current->mm);
+
 	return 0;
 }
 
@@ -134,6 +155,8 @@ static int __setup_additional_pages(enum vdso_abi abi,
 	if (IS_ERR(ret))
 		goto up_fail;
 
+	vdso_futex_robust_unlock_update_ips(abi, mm);
+
 	return 0;
 
 up_fail:
diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
index 52314be29191..225f59bb81d1 100644
--- a/arch/arm64/kernel/vdso/vdso.lds.S
+++ b/arch/arm64/kernel/vdso/vdso.lds.S
@@ -104,6 +104,9 @@ VERSION
 		__kernel_clock_gettime;
 		__kernel_clock_getres;
 		__kernel_getrandom;
+#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+		__vdso_futex_robust_list64_try_unlock;
+#endif
 	local: *;
 	};
 }
@@ -112,3 +115,9 @@ VERSION
  * Make the sigreturn code visible to the kernel.
  */
 VDSO_sigtramp		= __kernel_rt_sigreturn;
+
+#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+VDSO_futex_list64_try_unlock_cs_start = __futex_list64_try_unlock_cs_start;
+VDSO_futex_list64_try_unlock_cs_success = __futex_list64_try_unlock_cs_success;
+VDSO_futex_list64_try_unlock_cs_end = __futex_list64_try_unlock_cs_end;
+#endif

-- 
2.54.0



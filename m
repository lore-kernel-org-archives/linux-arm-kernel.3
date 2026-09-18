Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD701C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 01:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0EVnDrLrlZsk6u+X20+pzKDeqqgQ00+8S0/mdXWL1c=; b=3/3f+zLRkeNrxWWm2Xk/1BF8Ru
	1pBuKfZP25DGBHR9wv6NCms3qU1/JhDrfzBgHHcleMu25TTHUxYNZJ5GBCFCkMAo/2GI20ddgBHls
	bJegC5e9/eyuQ8s5TIEoMw8aFjkU9VmEFSkRTonhTmIjo20aWiqAW7P5PsyXF/dYja4eHPc87lCsC
	HeiF6gADOTQYcNPhlSv8B5J/NASW5iwMiYrC3zvV2tJJ7SeK1dwrsnxuYQsZuYFGWDNt6QDzIRG2T
	TVat2VkdZHuGe76FZawOTgqQfXLCSVdAp0mFyMAjje07TUwBFHrhI+Vheou/M1Xe10SsmB15VhkGb
	BeuaOtzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7MS9-0000000D1X4-2Z6N;
	Fri, 18 Sep 2026 00:27:45 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7MS6-0000000D1VQ-0k2M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 00:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=L0EVnDrLrlZsk6u+X20+pzKDeqqgQ00+8S0/mdXWL1c=; b=dX+xbrzHq4IOyXYKAgVtgh4Vef
	yD9lpi9TGtBhOP3mYXSJBL+W6zq8YFvkxfwCuJOT2dy5mYY2MffvF42LVamvquCobXvTxWgqiiYfG
	BjsjGam9lZFysp/blaw8BKB9Afy9ngQ9Tot/h5nqUfBQrs7sT4Bg4ltKaXg8ttXXvNUGERa8WiOVP
	wr/JwT6l5DL6hEtKJ8sfyFDN16dD8FNpoTI0CE8rxPMKgFtQGWjAFi9dtgGuMI9q9VK6WaFZYYNNv
	wlTxCESxHmu1FeqrC3kTXZBOx5g0lz84FuGar5iO9XiMlboegl/VXCDMIVsvEN8/iOQPO8z1etFOb
	c4QlA9XQ==;
Received: from [177.172.123.214] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x7MRp-003iDv-EY; Fri, 18 Sep 2026 02:27:25 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Thu, 17 Sep 2026 21:27:00 -0300
Subject: [PATCH v9 2/3] arm64: vdso: Prepare for robust futex unlock
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260917-tonyk-robust_arm-v9-2-ab082b1b4c4b@igalia.com>
References: <20260917-tonyk-robust_arm-v9-0-ab082b1b4c4b@igalia.com>
In-Reply-To: <20260917-tonyk-robust_arm-v9-0-ab082b1b4c4b@igalia.com>
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
X-CRM114-CacheID: sfid-20260917_172742_614616_E6B8E0B8 
X-CRM114-Status: GOOD (  19.73  )
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

To solve the robust futex's list_pending_op clearing race condition,
prepare for implement __vdso_futex_robust_try_unlock() for arm64 with the
following steps:

- Create a helper function that sets the struct futex_mm_data with the
VDSO's labels addresses. The robust futex fixup mechanism needs to
compare the current instruction pointer to the VDSO instructions range.

- Split vdso_mremap() in vdso_mremap() and aarch32_mremap(), this allows
the VDSO to be setup correctly regarding the instructions addresses for
both ABIs when a mremap happens.

- Implement arch_futex_robust_unlock_get_pop() for arm64, checking for r2
and r3 registers values for the fixup function. The role of this registers
is explained in the commit that implement the assembly portion of the VDSO.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v9:
 - Simplify arm64_futex_robust_unlock_get_pop by using regs->regs[] and if
 instead of ternary operation
 - Split mremap changes into other patch

v6:
 - Restructured this commit. Move the arch bits away, kept just the
 generic/helper functions.

v4:
- Guard symbols from vdso.lds.S with ifdef
- drop update_ips() from sigpage remap function

v3:
 - Fix adding vdso base addr twice
 - Call vdso_futex_robust_unlock_update_ips() on remap as well
v2:
 - Fixed linker not finding VDSO symbols
---
---
 arch/arm64/include/asm/futex_robust.h | 24 ++++++++++++++++++++++++
 arch/arm64/kernel/vdso.c              | 17 +++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/arm64/include/asm/futex_robust.h b/arch/arm64/include/asm/futex_robust.h
new file mode 100644
index 000000000000..389ce2a9484d
--- /dev/null
+++ b/arch/arm64/include/asm/futex_robust.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARM64_FUTEX_ROBUST_H
+#define _ASM_ARM64_FUTEX_ROBUST_H
+
+#include <asm/ptrace.h>
+
+static __always_inline void __user *arm64_futex_robust_unlock_get_pop(struct pt_regs *regs)
+{
+	/*
+	 * In the asm for __vdso_futex_robust_list{64,32}_try_unlock(), w3
+	 * stores the result of the stlxr instruction. If it's zero, the then
+	 * the ll/sc cmpxchg succeeded and the pending op pointer needs to be
+	 * cleared.
+	 */
+	if (regs->regs[3])
+		return NULL;
+
+	return (void __user *)regs->regs[2];
+}
+
+#define arch_futex_robust_unlock_get_pop(regs) \
+	arm64_futex_robust_unlock_get_pop(regs)
+
+#endif /* _ASM_ARM64_FUTEX_ROBUST_H */
diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 089a70d96220..95162061cd82 100644
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
@@ -57,6 +58,22 @@ static struct vdso_abi_info vdso_info[] __ro_after_init = {
 #endif /* CONFIG_COMPAT_VDSO */
 };
 
+#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+static inline void __vdso_futex_update_ips(struct mm_struct *mm, bool is_32bit, void *startp,
+					   void *endp)
+{
+	unsigned long start = (unsigned long)startp;
+	unsigned long end = (unsigned long)endp;
+	struct futex_mm_data *fd = &mm->futex;
+
+	futex_set_vdso_cs_range(fd, 0, start, end, is_32bit);
+}
+
+#else
+static inline void __vdso_futex_update_ips(struct mm_struct *mm, bool is_32bit, void *startp,
+					   void *endp)
+#endif /* CONFIG_FUTEX_ROBUST_UNLOCK */
+
 static int vdso_mremap(const struct vm_special_mapping *sm,
 		       struct vm_area_struct *new_vma)
 {

-- 
2.55.0



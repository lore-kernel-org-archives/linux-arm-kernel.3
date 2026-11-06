Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4133606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 02:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4+m0wxhM;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Hor95ZOE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NyTFiFpsDwOKjO2VPbpWmP0Im41/URytW32rn7Mp+g0=; b=4+m0wxhMbFOcEC
	+Tgr/2UiC14wlKHs0q3gT2dboLmCUN4EvTKmjTHdQiVT0y6EufvQK8no7kXsZsXs/ldCyjeGCsSAL
	Sg1ahRO4hve3c1Al3GQu5r6rO5Xb8TiliJhMHvhRsY/lF1tR4UPFKr4cpjHSZR6EcuzIEtnBIYTzZ
	v4kHsgrVYfJ51oTHAG4+i/xkv0jk/zVnolHCgJE7pOaX6G9zGYve+/MuFjkmiw2d4nsZzfb63pVEy
	7NrwHLYkKE1X4Dh5yezIXrNfjFmSaiseSNJcP/slQDAej2tXzxqIaDnbFlO6mmbz+gIWj/gFv47UN
	PZrGMu0SHUO6HulF2YMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9ce-0000000B3I7-3L24;
	Fri, 06 Nov 2026 02:24:08 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9ca-0000000B3F7-2S8e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 02:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=NyTFiFpsDwOKjO2VPbpWmP0Im41/URytW32rn7Mp+g0=; t=1793931844; x=2109291844; 
	b=Hor95ZOE8SuliKgiX8wSmu4anN/AgbIkUQblvuoMY/OFH9IPJ7fPLAdQcy1XW6UVbAK1Jx8aTjP
	m5EIk5+n8Eimv13btLl1KPm26kqT9Sr1LYeRF4iFsHAc/7+jbjdr3kP/BICslLPg2SfYpaZaSZZeR
	hVE5r/ftgCyiAK2PU//hVG5Mvh4kOVjYHHCaCGryf1h2Y7iVjDeR4g0uF/EERW+mBW4oC4VknNjkW
	AaTj7W3zbr8ftBhFivmLhWUiUWhSvoy9H7GCHt27c2x7uiB7ghf7iwv8DQyPoXa9W8H+AMlZNMZn4
	Nh7hXy3n3JnHsvVP1tCwxbMjKeOzoyrZCqVQ==;
Received: from [177.172.122.137] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xP9cJ-003xm9-SX; Fri, 06 Nov 2026 03:23:48 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Thu, 05 Nov 2026 23:23:43 -0300
Subject: [PATCH v10 2/3] arm64: vdso: Prepare for robust futex unlock
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261105-tonyk-robust_arm-v10-2-366ed4a3435b@igalia.com>
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
X-CRM114-CacheID: sfid-20261105_182404_655221_B350419A 
X-CRM114-Status: GOOD (  19.82  )
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
index 7cafa8208ef1..644def28f280 100644
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
@@ -56,6 +57,22 @@ static struct vdso_abi_info vdso_info[] __ro_after_init = {
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
2.56.0



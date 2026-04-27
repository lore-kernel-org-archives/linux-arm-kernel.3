Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00EBFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 14:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ak8ZeqMcf56QYnl1fRzitVZtscSNV5p4ckLSj3orzg=; b=4vw0FoqUO7oGGudkqHKtDOjEAR
	09WJvkkwNiSIhQEmuO88gj+7d11DJsjkC0sk0/2KAZdot2C9AE+Bg3+u8Ub2itM62HUsiOmhwh8Lo
	GWIuTFzHlLbSIVCjmeFWpjFeHLZscg4gKVUZyKZfD7XkQFdNRo+nRdTa+IqHJN9f0UNdb9Ux0aQOU
	qisIbrTxzYBYpYHM22yTDjn2KX0siPVVr6ZOD1f+uVv0tTyciswjGLv27GUPEKXXs2041e5nCtmzL
	14pnhnC2+J5zuUSLtf5hfnX6aJt+wUeeyLe5k3Kc1P3oVpyx5o6kgcoOuzwqjaB1Lsz8ow6rpfjr8
	6jt8z2OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMXU-0000000H2yq-1Uw3;
	Mon, 27 Apr 2026 14:02:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMXO-0000000H2un-1QW1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 14:02:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93C9C1684;
	Mon, 27 Apr 2026 07:02:03 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62DC43F763;
	Mon, 27 Apr 2026 07:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777298529; bh=dD4PWRYpo7EHK+a11lx5u+lWacH6ZMzCfigDfNpRHCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PQrIg21Ha1aurXj/LExfbLHCS3IMKDho+xnBA8PjVaaqDApBKl8Tc444WcIND0x6W
	 DbxWdi1ITnHpBNA92vXAv0vKiTv9fY8/B9/hHhYmYPtzU0kwb65dz3WBIgz9IfqSNo
	 KvaNPkF8QX79D3TrJ4u+W9073c0YUGLeXE0+RHi0=
From: Leonardo Bras <leo.bras@arm.com>
To: mark.rutland@arm.com
Cc: catalin.marinas@arm.com,
	kernel-team@meta.com,
	leitao@debian.org,
	leo.bras@arm.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	puranjay@kernel.org,
	rmikey@meta.com,
	usama.arif@linux.dev,
	will@kernel.org
Subject: [PATCH] arm64/daifflags: Make local_daif_*() helpers __always_inline
Date: Mon, 27 Apr 2026 15:01:26 +0100
Message-ID: <20260427140125.1773574-2-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ae9f6_MSCMfgG8VT@J2N7QTR9R3.cambridge.arm.com>
References: <ae9f6_MSCMfgG8VT@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_070214_544652_D4A33889 
X-CRM114-Status: GOOD (  12.12  )
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

Make sure those helpers are always inlined and instrumentation safe.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/include/asm/daifflags.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
index 5fca48009043..795b35128467 100644
--- a/arch/arm64/include/asm/daifflags.h
+++ b/arch/arm64/include/asm/daifflags.h
@@ -12,66 +12,66 @@
 #include <asm/cpufeature.h>
 #include <asm/ptrace.h>
 
 #define DAIF_PROCCTX		0
 #define DAIF_PROCCTX_NOIRQ	(PSR_I_BIT | PSR_F_BIT)
 #define DAIF_ERRCTX		(PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
 #define DAIF_MASK		(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
 
 
 /* mask/save/unmask/restore all exceptions, including interrupts. */
-static inline void local_daif_mask(void)
+static __always_inline void local_daif_mask(void)
 {
 	WARN_ON(system_has_prio_mask_debugging() &&
 		(read_sysreg_s(SYS_ICC_PMR_EL1) == (GIC_PRIO_IRQOFF |
 						    GIC_PRIO_PSR_I_SET)));
 
 	asm volatile(
 		"msr	daifset, #0xf		// local_daif_mask\n"
 		:
 		:
 		: "memory");
 
 	/* Don't really care for a dsb here, we don't intend to enable IRQs */
 	if (system_uses_irq_prio_masking())
 		gic_write_pmr(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET);
 
 	trace_hardirqs_off();
 }
 
-static inline unsigned long local_daif_save_flags(void)
+static __always_inline unsigned long local_daif_save_flags(void)
 {
 	unsigned long flags;
 
 	flags = read_sysreg(daif);
 
 	if (system_uses_irq_prio_masking()) {
 		/* If IRQs are masked with PMR, reflect it in the flags */
 		if (read_sysreg_s(SYS_ICC_PMR_EL1) != GIC_PRIO_IRQON)
 			flags |= PSR_I_BIT | PSR_F_BIT;
 	}
 
 	return flags;
 }
 
-static inline unsigned long local_daif_save(void)
+static __always_inline unsigned long local_daif_save(void)
 {
 	unsigned long flags;
 
 	flags = local_daif_save_flags();
 
 	local_daif_mask();
 
 	return flags;
 }
 
-static inline void local_daif_restore(unsigned long flags)
+static __always_inline void local_daif_restore(unsigned long flags)
 {
 	bool irq_disabled = flags & PSR_I_BIT;
 
 	WARN_ON(system_has_prio_mask_debugging() &&
 		(read_sysreg(daif) & (PSR_I_BIT | PSR_F_BIT)) != (PSR_I_BIT | PSR_F_BIT));
 
 	if (!irq_disabled) {
 		trace_hardirqs_on();
 
 		if (system_uses_irq_prio_masking()) {
@@ -117,21 +117,21 @@ static inline void local_daif_restore(unsigned long flags)
 	write_sysreg(flags, daif);
 
 	if (irq_disabled)
 		trace_hardirqs_off();
 }
 
 /*
  * Called by synchronous exception handlers to restore the DAIF bits that were
  * modified by taking an exception.
  */
-static inline void local_daif_inherit(struct pt_regs *regs)
+static __always_inline void local_daif_inherit(struct pt_regs *regs)
 {
 	unsigned long flags = regs->pstate & DAIF_MASK;
 
 	if (!regs_irqs_disabled(regs))
 		trace_hardirqs_on();
 
 	if (system_uses_irq_prio_masking())
 		gic_write_pmr(regs->pmr);
 
 	/*
-- 
2.54.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8514FEEF34
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9CtjHl5lZBPo9vxkKP9M6t4XBifhaKySVJ5Ojc04Yg=; b=VrKYG9QujKzlT2
	09Kv64eNvP5gpj0Zz6mjMxKql0DLnwAPMowxFvOsdjf/tnu9RQpeaR9WNgqg+Cb4NtyT7HFjFCdMx
	TdvS3j3VSGcq3znvZV7N+JPrLIFSmkMdlnyqzMayWegSmhSyTXnmKT+WDsYgTrR16aUfa6vQyvgSD
	u67PjX7ViEc4Zy1Ogwath25WvA87Ml12XytIGmnkeR60TkoQWJkzxXk6ycCkmAUT+VsevSIlLFQAs
	lGxxyTiiM4SbUNHoO1NUnAgguu/PIj94BTBH+P89N+er7EnzkANtVfCb7CSeLMnQ+Sb+WektOT7hk
	D2wQX2nZ9tdsuae93Zuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6Jx-00000006VKw-13QD;
	Tue, 07 Apr 2026 13:18:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6Ju-00000006VJJ-2P4Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:18:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 186411BB2;
	Tue,  7 Apr 2026 06:18:12 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E9B053F7D8;
	Tue,  7 Apr 2026 06:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775567897; bh=ZuXrXFNPUNGWF9OTidkPCfi5CGz2rFMvnd5pwEhF87U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H+dvome6yqpWMyHqY5q4pRDb/hQF+E9tkIEsDP0Sd8/vXrXubScsuI8sAQjwVmlVu
	 490VQjLTasSXJBfw5nba6wFFp5yafMYxCvnGcmTq8434hgnGytaYZ6TU/dvIucxvfH
	 +RbPscCRYsScpYATQ22jyqRox4UAuxXX6jKgdy6Y=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 06/10] arm64: entry: Don't preempt with SError or Debug masked
Date: Tue,  7 Apr 2026 14:16:46 +0100
Message-Id: <20260407131650.3813777-7-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260407131650.3813777-1-mark.rutland@arm.com>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_061818_745058_E2F72192 
X-CRM114-Status: GOOD (  16.56  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, peterz@infradead.org, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, tglx@kernel.org, luto@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On arm64, involuntary kernel preemption has been subtly broken since the
move to the generic irqentry code. When preemption occurs, the new task
may run with SError and Debug exceptions masked unexpectedly, leading to
a loss of RAS events, breakpoints, watchpoints, and single-step
exceptions.

Prior to moving to the generic irqentry code, involuntary preemption of
kernel mode would only occur when returning from regular interrupts, in
a state where interrupts were masked and all other arm64-specific
exceptions (SError, Debug, and pseudo-NMI) were unmasked. This is the
only state in which it is valid to switch tasks.

As part of moving to the generic irqentry code, the involuntary
preemption logic was moved such that involuntary preemption could occur
when returning from any (non-NMI) exception. As most exception handlers
mask all arm64-specific exceptions before this point, preemption could
occur in a state where arm64-specific exceptions were masked. This is
not a valid state to switch tasks, and resulted in the loss of
exceptions described above.

As a temporary bodge, avoid the loss of exceptions by avoiding
involuntary preemption when SError and/or Debug exceptions are masked.
Practically speaking this means that involuntary preemption will only
occur when returning from regular interrupts, as was the case before
moving to the generic irqentry code.

Fixes: 99eb057ccd67 ("arm64: entry: Move arm64_preempt_schedule_irq() into __exit_to_kernel_mode()")
Reported-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reported-by: Vladimir Murzin <vladimir.murzin@arm.com>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/entry-common.h | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
index cab8cd78f6938..20f0a7c7bde15 100644
--- a/arch/arm64/include/asm/entry-common.h
+++ b/arch/arm64/include/asm/entry-common.h
@@ -29,14 +29,19 @@ static __always_inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
 
 static inline bool arch_irqentry_exit_need_resched(void)
 {
-	/*
-	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
-	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
-	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
-	 * DAIF we must have handled an NMI, so skip preemption.
-	 */
-	if (system_uses_irq_prio_masking() && read_sysreg(daif))
-		return false;
+	if (system_uses_irq_prio_masking()) {
+		/*
+		 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
+		 * priority masking is used the GIC irqchip driver will clear DAIF.IF
+		 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
+		 * DAIF we must have handled an NMI, so skip preemption.
+		 */
+		if (read_sysreg(daif))
+			return false;
+	} else {
+		if (read_sysreg(daif) & (PSR_D_BIT | PSR_A_BIT))
+			return false;
+	}
 
 	/*
 	 * Preempting a task from an IRQ means we leave copies of PSTATE
-- 
2.30.2



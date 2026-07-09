Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E88C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f//VSa7iHdPIR0uZas8oSfWM0qC35fk9DSbq44Xjblw=; b=uvZ5CnJq2tBazJ
	YrL+KxW0Uyp78yiQf++BC28XFrIQ116CzxF3BgMcd/ZZhaPZTSJfLo5ivUi4kFhf5vxf9/KBFixF+
	sseG6uldovRs4dHbPBs2aNtKuBE9r2IhFcM4aQSFPG3BhLWFOodfvGct005RmkdkldDRLP48PT9o+
	nRZE87DfYx+AH0swE/ih6xFSARP4dmjollFKPNszbpq9tB0WPmrvLqxIPjpK0Q4gGab0/vx/BTo9F
	qCqotsxikiDcJcvzhvtmyb/Xa6J3NxwCeGv6ks6r6AX2rYcu8vx331w94yU8eAxomu3iwVoTsDn00
	FnGcBbYqVmRo2Ezo50Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndx-00000002KeV-0iq5;
	Thu, 09 Jul 2026 12:14:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndm-00000002KOh-1cak
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A611F3569;
	Thu,  9 Jul 2026 05:14:01 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D1B333F66F;
	Thu,  9 Jul 2026 05:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599246; bh=VuUElFkRCYkaSm591qZC+uxgK+NotRKl6UPv5bHjsS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nMhSseyZCMkxuUcspDH2IKNLBHUC2Gstc5kSKGrX5jydKWdD9YkcYUxrp8TimvpFX
	 Q5WQRHV+yW0JD/o2jTZXyuD1XAHdlXZPEmohE2BEJ/ce90a0pyl1DRG5846C/0NigT
	 De1USUd1AiEL5ZM+6wpu8rNa3XkFymUhUk7BDAMs=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 08/36] irqchip/gic-v3: make the unmasking of pseudo-NMIs explicit when handling IRQs
Date: Thu,  9 Jul 2026 13:13:05 +0100
Message-Id: <20260709121333.23507-9-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051406_506162_0EF11E63 
X-CRM114-Status: GOOD (  12.67  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, ruanjinjie@huawei.com, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ada Couprie Diaz <ada.coupriediaz@arm.com>

`gic_arch_enable_irqs()` is only used when handling IRQs (which could
be pseudo-NMIs) and unmasking pseudo-NMIs.

The chain of `gic_pmr_mask_irqs()` and `gic_arch_enable_irqs()` for it
is slightly confusing without further explanation.

Remove `gic_arch_enable_irqs()` and instead do the whole pseudo-NMI
umasking in `gic_unmask_pnmis()`, making the operation explicit.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm/include/asm/arch_gicv3.h     | 6 +-----
 arch/arm64/include/asm/arch_gicv3.h   | 7 +++++--
 arch/arm64/include/asm/entry-common.h | 2 +-
 drivers/irqchip/irq-gic-v3.c          | 5 +----
 4 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/arm/include/asm/arch_gicv3.h b/arch/arm/include/asm/arch_gicv3.h
index 847590df7551..d4ac8d3271b1 100644
--- a/arch/arm/include/asm/arch_gicv3.h
+++ b/arch/arm/include/asm/arch_gicv3.h
@@ -246,11 +246,7 @@ static inline void gic_pmr_mask_irqs(void)
 	WARN_ON_ONCE(true);
 }
 
-static inline void gic_arch_enable_irqs(void)
-{
-	/* Should not get called. */
-	WARN_ON_ONCE(true);
-}
+static inline void gic_unmask_pnmis(void) {}
 
 static inline bool gic_has_relaxed_pmr_sync(void)
 {
diff --git a/arch/arm64/include/asm/arch_gicv3.h b/arch/arm64/include/asm/arch_gicv3.h
index d20b03931a8d..3dcb7b8309d9 100644
--- a/arch/arm64/include/asm/arch_gicv3.h
+++ b/arch/arm64/include/asm/arch_gicv3.h
@@ -178,9 +178,12 @@ static inline void gic_pmr_mask_irqs(void)
 	gic_write_pmr(GIC_PRIO_IRQOFF);
 }
 
-static inline void gic_arch_enable_irqs(void)
+static inline void gic_unmask_pnmis(void)
 {
-	asm volatile ("msr daifclr, #3" : : : "memory");
+	if (gic_prio_masking_enabled()) {
+		gic_pmr_mask_irqs();
+		asm volatile ("msr daifclr, #3" : : : "memory");
+	}
 }
 
 static inline bool gic_has_relaxed_pmr_sync(void)
diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
index cab8cd78f693..1905765159aa 100644
--- a/arch/arm64/include/asm/entry-common.h
+++ b/arch/arm64/include/asm/entry-common.h
@@ -32,7 +32,7 @@ static inline bool arch_irqentry_exit_need_resched(void)
 	/*
 	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
 	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
-	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
+	 * in gic_unmask_pnmis() for normal IRQs. If anything is set in
 	 * DAIF we must have handled an NMI, so skip preemption.
 	 */
 	if (system_uses_irq_prio_masking() && read_sysreg(daif))
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 99444a1b2ffa..94c6a3f2b009 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -867,10 +867,7 @@ static void __gic_handle_irq_from_irqson(struct pt_regs *regs)
 		nmi_exit();
 	}
 
-	if (gic_prio_masking_enabled()) {
-		gic_pmr_mask_irqs();
-		gic_arch_enable_irqs();
-	}
+	gic_unmask_pnmis();
 
 	if (!is_nmi)
 		__gic_handle_irq(irqnr, regs);
-- 
2.34.1



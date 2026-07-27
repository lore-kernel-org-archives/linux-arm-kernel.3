Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED2BC54F50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qr374IRBT+y3Je5PYb7doqt7sMoJDQIj53otZ6co0Uk=; b=fvQwpezKJWRpnd79SyPN2iep7w
	DiGD+Vukm7OjogV3JhAfcJXWZZBe2SsvB34aG5nf1gq5miAeZEo1ovh1n28yC/KLcPSYf1puvrg20
	ACL5fdM6GwJ2i5hsVMc4btuDwtJTt57z5BrCG18Und1Uj3NzqV2EwB3sNFKEtLkxMPqlgMiDKFMeQ
	tiN+fJPIuZKNNj/HCICA+aUhaTNY3wVZ8BbPcqbKHIaWE3XOfCvKeYF5ut6aOgAaQhtWh9Yjixnbc
	qpCdFhIKnXL5J/pDrHujEsW0nYoChOFO8i/ZWQd3iPkUTC9HgaVV0J7bBpRort27VYSoTCVEHezYW
	858L23Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIw-00000003Mme-3lHq;
	Mon, 27 Jul 2026 16:35:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOId-00000003MSR-311d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 863D11756;
	Mon, 27 Jul 2026 09:35:26 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AEC533F86F;
	Mon, 27 Jul 2026 09:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170130; bh=AftYbt/4zynE9kNmW75SQHrdY42xwKB74UpeHzUcjH8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R3UKtrwTO4UBiZ5rxg7KhSbYDNpR10sbFa0fomyfp3Je3W18wL+EHyTawLTh1/K+J
	 6Gto0TajaeHqmcYGx4+b9oLC81CwnheQmHIT6Ne9173eEGigrxFlteGfTZP3NqnnRJ
	 Yt8UdjFeLG3VWPO+loZJaC/1HouSdveqlFsGikv0=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 08/45] irqchip/gic-v3: make the unmasking of pseudo-NMIs explicit when handling IRQs
Date: Mon, 27 Jul 2026 17:34:16 +0100
Message-Id: <20260727163453.7969-9-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093531_844706_E0099C66 
X-CRM114-Status: GOOD (  13.15  )
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

From: Ada Couprie Diaz <ada.coupriediaz@arm.com>

`gic_arch_enable_irqs()` is only used when handling IRQs (which could
be pseudo-NMIs) and unmasking pseudo-NMIs.

The chain of `gic_pmr_mask_irqs()` and `gic_arch_enable_irqs()` for it
is slightly confusing without further explanation.

Remove `gic_arch_enable_irqs()` and instead do the whole pseudo-NMI
umasking in `gic_unmask_pnmis()`, making the operation explicit.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECED9CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 05:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZR0xt1gSDMuqEAi0dnJKSPW9pNEjQshxvwfcFTEfHA=; b=DOqi40QEe5cVUTR6NlHQu6WCeS
	AmR7MaTBGoJmoZJ/KQIBEVa/LaPZrNIp6JnbUNIrGgAotk29MgnnfGLgXO+LvPOYj2HYVascqbxvd
	31VEUzt5qLFjRofpuhkxG+G3PqI2JttnKP3Fo208uu7W3Y1HqnV7U9V77xgoR32G2JNy7yGV3hcG3
	O8Px4L6XIE7FH3/1NLQVrfe3Oz0+gJlerZDw/kxudZh6YEnWsKrXRRvWOsv3isPFCIuCF2eF8wlY2
	NSCD5s4VLCj4j2p6948vh7PXsF/qnHKzdsAXp6s4gwfySHDevOSweDgdqz8y5aHPNWsm2vM/ixMSh
	FqA3vlmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFn5O-00000009Dux-1XYs;
	Mon, 03 Nov 2025 05:26:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFn5L-00000009DtH-0lsj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 05:26:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F02E7292B;
	Sun,  2 Nov 2025 21:26:19 -0800 (PST)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E7403F63F;
	Sun,  2 Nov 2025 21:26:26 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] arm64/mm: Directly use TTBRx_EL1_ASID_MASK
Date: Mon,  3 Nov 2025 05:26:13 +0000
Message-Id: <20251103052618.586763-2-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20251103052618.586763-1-anshuman.khandual@arm.com>
References: <20251103052618.586763-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_212631_336072_07B6E515 
X-CRM114-Status: GOOD (  11.04  )
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

Replace all TTBR_ASID_MASK macro instances with TTBRx_EL1_ASID_MASK which
is a standard field mask from tools sysreg format. No functional change.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/asm-uaccess.h | 2 +-
 arch/arm64/include/asm/mmu_context.h | 2 +-
 arch/arm64/include/asm/uaccess.h     | 6 +++---
 arch/arm64/kernel/entry.S            | 2 +-
 arch/arm64/mm/context.c              | 6 +++---
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/asm-uaccess.h b/arch/arm64/include/asm/asm-uaccess.h
index 9148f5a31968..12aa6a283249 100644
--- a/arch/arm64/include/asm/asm-uaccess.h
+++ b/arch/arm64/include/asm/asm-uaccess.h
@@ -15,7 +15,7 @@
 #ifdef CONFIG_ARM64_SW_TTBR0_PAN
 	.macro	__uaccess_ttbr0_disable, tmp1
 	mrs	\tmp1, ttbr1_el1			// swapper_pg_dir
-	bic	\tmp1, \tmp1, #TTBR_ASID_MASK
+	bic	\tmp1, \tmp1, #TTBRx_EL1_ASID_MASK
 	sub	\tmp1, \tmp1, #RESERVED_SWAPPER_OFFSET	// reserved_pg_dir
 	msr	ttbr0_el1, \tmp1			// set reserved TTBR0_EL1
 	add	\tmp1, \tmp1, #RESERVED_SWAPPER_OFFSET
diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 0dbe3b29049b..59f8b9b40184 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -218,7 +218,7 @@ static inline void update_saved_ttbr0(struct task_struct *tsk,
 	if (mm == &init_mm)
 		ttbr = phys_to_ttbr(__pa_symbol(reserved_pg_dir));
 	else
-		ttbr = phys_to_ttbr(virt_to_phys(mm->pgd)) | ASID(mm) << 48;
+		ttbr = phys_to_ttbr(virt_to_phys(mm->pgd)) | ASID(mm) << TTBRx_EL1_ASID_SHIFT;
 
 	WRITE_ONCE(task_thread_info(tsk)->ttbr0, ttbr);
 }
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 1aa4ecb73429..52daf9c2ba42 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -62,7 +62,7 @@ static inline void __uaccess_ttbr0_disable(void)
 
 	local_irq_save(flags);
 	ttbr = read_sysreg(ttbr1_el1);
-	ttbr &= ~TTBR_ASID_MASK;
+	ttbr &= ~TTBRx_EL1_ASID_MASK;
 	/* reserved_pg_dir placed before swapper_pg_dir */
 	write_sysreg(ttbr - RESERVED_SWAPPER_OFFSET, ttbr0_el1);
 	/* Set reserved ASID */
@@ -85,8 +85,8 @@ static inline void __uaccess_ttbr0_enable(void)
 
 	/* Restore active ASID */
 	ttbr1 = read_sysreg(ttbr1_el1);
-	ttbr1 &= ~TTBR_ASID_MASK;		/* safety measure */
-	ttbr1 |= ttbr0 & TTBR_ASID_MASK;
+	ttbr1 &= ~TTBRx_EL1_ASID_MASK;		/* safety measure */
+	ttbr1 |= ttbr0 & TTBRx_EL1_ASID_MASK;
 	write_sysreg(ttbr1, ttbr1_el1);
 
 	/* Restore user page table */
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index f8018b5c1f9a..9e1bcc821a16 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -473,7 +473,7 @@ alternative_else_nop_endif
 	 */
 SYM_CODE_START_LOCAL(__swpan_entry_el1)
 	mrs	x21, ttbr0_el1
-	tst	x21, #TTBR_ASID_MASK		// Check for the reserved ASID
+	tst	x21, #TTBRx_EL1_ASID_MASK	// Check for the reserved ASID
 	orr	x23, x23, #PSR_PAN_BIT		// Set the emulated PAN in the saved SPSR
 	b.eq	1f				// TTBR0 access already disabled
 	and	x23, x23, #~PSR_PAN_BIT		// Clear the emulated PAN in the saved SPSR
diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index b2ac06246327..718c495832d0 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -358,11 +358,11 @@ void cpu_do_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm)
 
 	/* SW PAN needs a copy of the ASID in TTBR0 for entry */
 	if (IS_ENABLED(CONFIG_ARM64_SW_TTBR0_PAN))
-		ttbr0 |= FIELD_PREP(TTBR_ASID_MASK, asid);
+		ttbr0 |= FIELD_PREP(TTBRx_EL1_ASID_MASK, asid);
 
 	/* Set ASID in TTBR1 since TCR.A1 is set */
-	ttbr1 &= ~TTBR_ASID_MASK;
-	ttbr1 |= FIELD_PREP(TTBR_ASID_MASK, asid);
+	ttbr1 &= ~TTBRx_EL1_ASID_MASK;
+	ttbr1 |= FIELD_PREP(TTBRx_EL1_ASID_MASK, asid);
 
 	cpu_set_reserved_ttbr0_nosync();
 	write_sysreg(ttbr1, ttbr1_el1);
-- 
2.30.2



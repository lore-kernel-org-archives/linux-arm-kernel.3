Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F47E677F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 10:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQ2QenxGpvul9cz+hvPrxP20Gf8F/3XAZOWsaEZgX8M=; b=XhE/YEEpq+fpD1atouRZvR1Mw5
	4Ife5LWdfqQu/AchDi2joIKIrlfg0fp5HogUDOEq0BIvah6REJdzrGhaBLp4oT3xevkYv5lo7qfTy
	HswOIAEQFs8NeHFeZc2f7NZeGY0K5qatGFtthUGUUaPf0yWNEMp0ZbMdwl0pSbztmXYLRJi+2bzIs
	vI4xXll0ACNyVeIwcPFKVwvqpEUHd0zgL9tAPYrRGqdRGQvFlDKH0+bXJkZuxQt7Uc/162i/B8HYg
	L/7J5q+T1nW57O3qFlxVj3HqVGQg0lkwZCdNCYEgFSyZqkRzcTC8GUmgfvyZmbIt2F+mUhbz2it9l
	rg1kqUWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Bkz-00000009XB9-3c3Q;
	Sat, 02 Nov 2024 10:53:25 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Bb8-00000009W2Y-3bYe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 10:43:18 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XgZ6j0Yctz20rJ1;
	Sat,  2 Nov 2024 18:42:05 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id A3F3B140257;
	Sat,  2 Nov 2024 18:43:07 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 2 Nov 2024 18:43:06 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<mark.rutland@arm.com>, <broonie@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <oliver.upton@linux.dev>, <ryan.roberts@arm.com>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>,
	<wangkefeng.wang@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH v4 3/5] arm64: Add support for FEAT_HAFT
Date: Sat, 2 Nov 2024 18:42:33 +0800
Message-ID: <20241102104235.62560-4-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241102104235.62560-1-yangyicong@huawei.com>
References: <20241102104235.62560-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_034315_299325_99192AB6 
X-CRM114-Status: GOOD (  23.98  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Armv8.9/v9.4 introduces the feature Hardware managed Access Flag
for Table descriptors (FEAT_HAFT). The feature is indicated by
ID_AA64MMFR1_EL1.HAFDBS == 0b0011 and can be enabled by
TCR2_EL1.HAFT so it has a dependency on FEAT_TCR2.

Adds the Kconfig for FEAT_HAFT and support detecting and enabling
the feature. The feature is enabled in __cpu_setup() before MMU on
just like HA. A CPU capability is added to notify the user of the
feature.

Add definition of P{G,4,U,M}D_TABLE_AF bit and set the AF bit
when creating the page table, which will save the hardware
from having to update them at runtime. This will be ignored if
FEAT_HAFT is not enabled.

The AF bit of table descriptors cannot be managed by the software
per spec, unlike the HA. So this should be used only if it's supported
system wide by system_supports_haft().

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/Kconfig                     | 15 +++++++++++++++
 arch/arm64/include/asm/cpufeature.h    |  6 ++++++
 arch/arm64/include/asm/pgalloc.h       | 12 +++++++-----
 arch/arm64/include/asm/pgtable-hwdef.h |  4 ++++
 arch/arm64/kernel/cpufeature.c         | 15 +++++++++++++++
 arch/arm64/mm/fixmap.c                 |  9 ++++++---
 arch/arm64/mm/mmu.c                    |  8 ++++----
 arch/arm64/mm/proc.S                   |  4 ++++
 arch/arm64/tools/cpucaps               |  1 +
 9 files changed, 62 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fd9df6dcc593..7c023f3f55d6 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2177,6 +2177,21 @@ config ARCH_PKEY_BITS
 	int
 	default 3
 
+config ARM64_HAFT
+	bool "Support for Hardware managed Access Flag for Table Descriptors"
+	depends on ARM64_HW_AFDBM
+	default y
+	help
+	  The ARMv8.9/ARMv9.5 introduces the feature Hardware managed Access
+	  Flag for Table descriptors. When enabled an architectural executed
+	  memory access will update the Access Flag in each Table descriptor
+	  which is accessed during the translation table walk and for which
+	  the Access Flag is 0. The Access Flag of the Table descriptor use
+	  the same bit of PTE_AF.
+
+	  The feature will only be enabled if all the CPUs in the system
+	  support this feature. If unsure, say Y.
+
 endmenu # "ARMv8.9 architectural features"
 
 config ARM64_SVE
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 3d261cc123c1..ed8c784ca082 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -838,6 +838,12 @@ static inline bool system_supports_poe(void)
 		alternative_has_cap_unlikely(ARM64_HAS_S1POE);
 }
 
+static inline bool system_supports_haft(void)
+{
+	return IS_ENABLED(CONFIG_ARM64_HAFT) &&
+		cpus_have_final_cap(ARM64_HAFT);
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
 
diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 8ff5f2a2579e..e75422864d1b 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -28,7 +28,7 @@ static inline void __pud_populate(pud_t *pudp, phys_addr_t pmdp, pudval_t prot)
 
 static inline void pud_populate(struct mm_struct *mm, pud_t *pudp, pmd_t *pmdp)
 {
-	pudval_t pudval = PUD_TYPE_TABLE;
+	pudval_t pudval = PUD_TYPE_TABLE | PUD_TABLE_AF;
 
 	pudval |= (mm == &init_mm) ? PUD_TABLE_UXN : PUD_TABLE_PXN;
 	__pud_populate(pudp, __pa(pmdp), pudval);
@@ -50,7 +50,7 @@ static inline void __p4d_populate(p4d_t *p4dp, phys_addr_t pudp, p4dval_t prot)
 
 static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4dp, pud_t *pudp)
 {
-	p4dval_t p4dval = P4D_TYPE_TABLE;
+	p4dval_t p4dval = P4D_TYPE_TABLE | P4D_TABLE_AF;
 
 	p4dval |= (mm == &init_mm) ? P4D_TABLE_UXN : P4D_TABLE_PXN;
 	__p4d_populate(p4dp, __pa(pudp), p4dval);
@@ -79,7 +79,7 @@ static inline void __pgd_populate(pgd_t *pgdp, phys_addr_t p4dp, pgdval_t prot)
 
 static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
 {
-	pgdval_t pgdval = PGD_TYPE_TABLE;
+	pgdval_t pgdval = PGD_TYPE_TABLE | PGD_TABLE_AF;
 
 	pgdval |= (mm == &init_mm) ? PGD_TABLE_UXN : PGD_TABLE_PXN;
 	__pgd_populate(pgdp, __pa(p4dp), pgdval);
@@ -127,14 +127,16 @@ static inline void
 pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmdp, pte_t *ptep)
 {
 	VM_BUG_ON(mm && mm != &init_mm);
-	__pmd_populate(pmdp, __pa(ptep), PMD_TYPE_TABLE | PMD_TABLE_UXN);
+	__pmd_populate(pmdp, __pa(ptep),
+		       PMD_TYPE_TABLE | PMD_TABLE_AF | PMD_TABLE_UXN);
 }
 
 static inline void
 pmd_populate(struct mm_struct *mm, pmd_t *pmdp, pgtable_t ptep)
 {
 	VM_BUG_ON(mm == &init_mm);
-	__pmd_populate(pmdp, page_to_phys(ptep), PMD_TYPE_TABLE | PMD_TABLE_PXN);
+	__pmd_populate(pmdp, page_to_phys(ptep),
+		       PMD_TYPE_TABLE | PMD_TABLE_AF | PMD_TABLE_PXN);
 }
 
 #endif
diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index fd330c1db289..c78a988cca93 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -99,6 +99,7 @@
 #define PGD_TYPE_TABLE		(_AT(pgdval_t, 3) << 0)
 #define PGD_TABLE_BIT		(_AT(pgdval_t, 1) << 1)
 #define PGD_TYPE_MASK		(_AT(pgdval_t, 3) << 0)
+#define PGD_TABLE_AF		(_AT(pgdval_t, 1) << 10)	/* Ignored if no FEAT_HAFT */
 #define PGD_TABLE_PXN		(_AT(pgdval_t, 1) << 59)
 #define PGD_TABLE_UXN		(_AT(pgdval_t, 1) << 60)
 
@@ -110,6 +111,7 @@
 #define P4D_TYPE_MASK		(_AT(p4dval_t, 3) << 0)
 #define P4D_TYPE_SECT		(_AT(p4dval_t, 1) << 0)
 #define P4D_SECT_RDONLY		(_AT(p4dval_t, 1) << 7)		/* AP[2] */
+#define P4D_TABLE_AF		(_AT(p4dval_t, 1) << 10)	/* Ignored if no FEAT_HAFT */
 #define P4D_TABLE_PXN		(_AT(p4dval_t, 1) << 59)
 #define P4D_TABLE_UXN		(_AT(p4dval_t, 1) << 60)
 
@@ -121,6 +123,7 @@
 #define PUD_TYPE_MASK		(_AT(pudval_t, 3) << 0)
 #define PUD_TYPE_SECT		(_AT(pudval_t, 1) << 0)
 #define PUD_SECT_RDONLY		(_AT(pudval_t, 1) << 7)		/* AP[2] */
+#define PUD_TABLE_AF		(_AT(pudval_t, 1) << 10)	/* Ignored if no FEAT_HAFT */
 #define PUD_TABLE_PXN		(_AT(pudval_t, 1) << 59)
 #define PUD_TABLE_UXN		(_AT(pudval_t, 1) << 60)
 
@@ -131,6 +134,7 @@
 #define PMD_TYPE_TABLE		(_AT(pmdval_t, 3) << 0)
 #define PMD_TYPE_SECT		(_AT(pmdval_t, 1) << 0)
 #define PMD_TABLE_BIT		(_AT(pmdval_t, 1) << 1)
+#define PMD_TABLE_AF		(_AT(pmdval_t, 1) << 10)	/* Ignored if no FEAT_HAFT */
 
 /*
  * Section
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 718728a85430..878712fa0d3b 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2590,6 +2590,21 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.cpus = &dbm_cpus,
 		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, DBM)
 	},
+#endif
+#ifdef CONFIG_ARM64_HAFT
+	{
+		.desc = "Hardware managed Access Flag for Table Descriptors",
+		/*
+		 * Contrary to the page/block access flag, the table access flag
+		 * cannot be emulated in software (no access fault will occur).
+		 * Therefore this should be used only if it's supported system
+		 * wide.
+		 */
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.capability = ARM64_HAFT,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, HAFT)
+	},
 #endif
 	{
 		.desc = "CRC32 instructions",
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index de1e09d986ad..c5c5425791da 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -47,7 +47,8 @@ static void __init early_fixmap_init_pte(pmd_t *pmdp, unsigned long addr)
 
 	if (pmd_none(pmd)) {
 		ptep = bm_pte[BM_PTE_TABLE_IDX(addr)];
-		__pmd_populate(pmdp, __pa_symbol(ptep), PMD_TYPE_TABLE);
+		__pmd_populate(pmdp, __pa_symbol(ptep),
+			       PMD_TYPE_TABLE | PMD_TABLE_AF);
 	}
 }
 
@@ -59,7 +60,8 @@ static void __init early_fixmap_init_pmd(pud_t *pudp, unsigned long addr,
 	pmd_t *pmdp;
 
 	if (pud_none(pud))
-		__pud_populate(pudp, __pa_symbol(bm_pmd), PUD_TYPE_TABLE);
+		__pud_populate(pudp, __pa_symbol(bm_pmd),
+			       PUD_TYPE_TABLE | PUD_TABLE_AF);
 
 	pmdp = pmd_offset_kimg(pudp, addr);
 	do {
@@ -86,7 +88,8 @@ static void __init early_fixmap_init_pud(p4d_t *p4dp, unsigned long addr,
 	}
 
 	if (p4d_none(p4d))
-		__p4d_populate(p4dp, __pa_symbol(bm_pud), P4D_TYPE_TABLE);
+		__p4d_populate(p4dp, __pa_symbol(bm_pud),
+			       P4D_TYPE_TABLE | P4D_TABLE_AF);
 
 	pudp = pud_offset_kimg(p4dp, addr);
 	early_fixmap_init_pmd(pudp, addr, end);
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index e55b02fbddc8..6441a45eaeda 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -201,7 +201,7 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 
 	BUG_ON(pmd_sect(pmd));
 	if (pmd_none(pmd)) {
-		pmdval_t pmdval = PMD_TYPE_TABLE | PMD_TABLE_UXN;
+		pmdval_t pmdval = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
 		phys_addr_t pte_phys;
 
 		if (flags & NO_EXEC_MAPPINGS)
@@ -288,7 +288,7 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 	 */
 	BUG_ON(pud_sect(pud));
 	if (pud_none(pud)) {
-		pudval_t pudval = PUD_TYPE_TABLE | PUD_TABLE_UXN;
+		pudval_t pudval = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
 		phys_addr_t pmd_phys;
 
 		if (flags & NO_EXEC_MAPPINGS)
@@ -333,7 +333,7 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 	pud_t *pudp;
 
 	if (p4d_none(p4d)) {
-		p4dval_t p4dval = P4D_TYPE_TABLE | P4D_TABLE_UXN;
+		p4dval_t p4dval = P4D_TYPE_TABLE | P4D_TABLE_UXN | P4D_TABLE_AF;
 		phys_addr_t pud_phys;
 
 		if (flags & NO_EXEC_MAPPINGS)
@@ -391,7 +391,7 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 	p4d_t *p4dp;
 
 	if (pgd_none(pgd)) {
-		pgdval_t pgdval = PGD_TYPE_TABLE | PGD_TABLE_UXN;
+		pgdval_t pgdval = PGD_TYPE_TABLE | PGD_TABLE_UXN | PGD_TABLE_AF;
 		phys_addr_t p4d_phys;
 
 		if (flags & NO_EXEC_MAPPINGS)
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index ccbae4525891..0bc88df7cb35 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -498,6 +498,10 @@ alternative_else_nop_endif
 	and	x9, x9, ID_AA64MMFR1_EL1_HAFDBS_MASK
 	cbz	x9, 1f
 	orr	tcr, tcr, #TCR_HA		// hardware Access flag update
+
+#ifdef CONFIG_ARM64_HAFT
+	orr	tcr2, tcr2, TCR2_EL1x_HAFT
+#endif /* CONFIG_ARM64_HAFT */
 1:
 #endif	/* CONFIG_ARM64_HW_AFDBM */
 	msr	mair_el1, mair
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index eedb5acc21ed..b35004fa8313 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -56,6 +56,7 @@ HAS_TLB_RANGE
 HAS_VA52
 HAS_VIRT_HOST_EXTN
 HAS_WFXT
+HAFT
 HW_DBM
 KVM_HVHE
 KVM_PROTECTED_MODE
-- 
2.24.0



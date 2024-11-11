Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0014BD2E9CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 08:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1xFEblsgxa4RclC164P/nqkAMzUCB5wc1os0ZZKcFg=; b=MIDluriHp9ezVSvUwDJhndWd54
	z6wcFh2gUfIr10LproD/yrNH3WQc7CCL9oie+ketcPZ4LwwBlG2ejSwNYZfCF+/f1eoiwltUXLpUw
	ngsKLG9qmWypHBoDdzqgV3dxy4chNql1zWVerMTBGy/vqckBnCrgZ27hH/ZeFtD38eTYpoZr7ndX5
	lxlOEtTugaSoCjueyLwqWyhCmlKd8o4ARTS+dVl+YKSvEiW+vSL4CpQ35LTht9Gqo5yd3NWMbjTix
	g5ISTiXK/NWFK5Eb6U2RFeMrUDCeS6u0cMmyvJvnvbMlyJmUHGt5dlIxkhtPAGBTT6jHQmTrS4K/E
	P7jp4XgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQ6T-0000000Grky-3yha;
	Mon, 11 Nov 2024 08:48:58 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPu5-0000000GpPL-28MZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 08:36:11 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e35199eb2bso78973947b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 00:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731314168; x=1731918968; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m1xFEblsgxa4RclC164P/nqkAMzUCB5wc1os0ZZKcFg=;
        b=I2EbzMxAUqGpu9ns3nSsOGQ7/0Dhh08o2rIGFixq+fazdw/F9TjLSJnO6/sOlS8Lmo
         vNkMO6el+PS67x3prN5pGuHgDQkE1DcnXO6HQLkZkG/NJ83OMFxEbphKY4Am3Y7aH4+V
         4+sYfxG27zW1VmgiUUBUAoQuM+gTz59Awlhq5mZ3Tch8lWu6te4bCLXVN0P26OlCERSP
         834kFwweCeP7cxzo0y5MtTAqYh9j6Uw0zf3oM/RvRXIrR/a5gOqO0I2Eo71rYWth44ff
         /euA5r0KykmbSld8c80MVWpy/OuMU8oHoSbS4hYMGmDHTtDcqVfOysi2l9hxO5CXUrJK
         WgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731314168; x=1731918968;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m1xFEblsgxa4RclC164P/nqkAMzUCB5wc1os0ZZKcFg=;
        b=TgPBSJououTN+sH/7pMQOW+o41f3QCvR9GPVBHj/TM0LX5/IjDXSwAVZLkow2XWMQZ
         pifLqwdx7YS6q5wEQx85uFbrPglUIbj8CqPRBn2vk+TIGOIVuhqv8S525nZbkVLHg5md
         kRBTr0hem8wfK4ieMZj4b9JN3yI09vXAta9b61h/z0aLGmD083R+2ot6L5WHJ0gcWbts
         iwSFrlaFAfMPnCmfOwb2AzojEupwWeM49lMXyXD2mG/bdzoFkLd6rOrKUtFKtrQUhajC
         BPLO/3NAdwM34wvK2l3iswp1pjj6t8Bi3T7fSHANDaVn4zgjci3xmo/ds8Iig0ev7sKq
         WeQw==
X-Gm-Message-State: AOJu0Yy3eMs4b/DomdhQH0sCeCGkQbjdBHk0x115EqmkCApb3Zt+5nbu
	wpLZ8k6yLmrItfeiz2E4JX8Agy8CM+84d0des+NHu45tk7PuR9K/CGgJNw3geQ7o5ZMZDBCj1WX
	fLHhYYVHPRhihyal4lbXWstZG7wdrNQuS7ih0cbZ+R7HVWqCSfOWnnbJ1o6E2yUdyglb5YAynyp
	A+4iEeDPKkDOab2/Z4EB/mKOnRYYoLf0BJZIR+D/SB
X-Google-Smtp-Source: AGHT+IF+g4PJjJqLTTfJPqlybNIeyhrNsYZlpNKrEQrIK0fyY8IdIspqleNLzuhsLMsDA7X4fE7bBtsQ
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:3501:b0:62c:f976:a763 with SMTP id
 00721157ae682-6eaddd8b094mr2527637b3.1.1731314168386; Mon, 11 Nov 2024
 00:36:08 -0800 (PST)
Date: Mon, 11 Nov 2024 09:35:50 +0100
In-Reply-To: <20241111083544.1845845-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241111083544.1845845-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=11772; i=ardb@kernel.org;
 h=from:subject; bh=slWQNmnUuKGuETXL+/E2wzb/ApCZRk8VG4TRdX1m+qI=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JId3w4PNjh1cwuM765bVp7d/0XQz7k/lOMrSsZvQ6NnXiQ
 fuvF7fs6ShlYRDjYJAVU2QRmP333c7TE6VqnWfJwsxhZQIZwsDFKQATWRvEyHBlMk+u5iIus674
 9oadqxOnCx2YfIRrVuTBe71f76XEX5BlZLgl0Jp2SMFKbg1DZYOh/J2PEy7+zuMrL61q3s3jLTN vFTcA
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241111083544.1845845-14-ardb+git@google.com>
Subject: [PATCH 6/6] arm64/mm: Drop configurable 48-bit physical address space limit
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_003609_584966_010E42AB 
X-CRM114-Status: GOOD (  22.52  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Currently, the maximum supported physical address space can be
configured as either 48 bits or 52 bits. The only remaining difference
between these in practice is that the former omits the masking and
shifting required to construct TTBR and PTE values, which carry bits #48
and higher disjoint from the rest of the physical address.

The overhead of performing these additional calculations is negligible,
and so there is little reason to retain support for two different
configurations, and we can simply support whatever the hardware
supports.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/Kconfig                     | 31 +-------------------
 arch/arm64/include/asm/assembler.h     | 13 ++------
 arch/arm64/include/asm/cpufeature.h    |  3 +-
 arch/arm64/include/asm/kvm_pgtable.h   |  3 +-
 arch/arm64/include/asm/pgtable-hwdef.h |  6 +---
 arch/arm64/include/asm/pgtable-prot.h  |  4 +--
 arch/arm64/include/asm/pgtable.h       | 11 +------
 arch/arm64/include/asm/sysreg.h        |  6 ----
 arch/arm64/mm/pgd.c                    |  9 +++---
 arch/arm64/mm/proc.S                   |  2 --
 scripts/gdb/linux/constants.py.in      |  1 -
 tools/arch/arm64/include/asm/sysreg.h  |  6 ----
 12 files changed, 14 insertions(+), 81 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index ec218ef22f2b..769af2da4db5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1405,38 +1405,9 @@ config ARM64_VA_BITS
 	default 48 if ARM64_VA_BITS_48
 	default 52 if ARM64_VA_BITS_52
 
-choice
-	prompt "Physical address space size"
-	default ARM64_PA_BITS_48
-	help
-	  Choose the maximum physical address range that the kernel will
-	  support.
-
-config ARM64_PA_BITS_48
-	bool "48-bit"
-	depends on ARM64_64K_PAGES || !ARM64_VA_BITS_52
-
-config ARM64_PA_BITS_52
-	bool "52-bit"
-	depends on ARM64_64K_PAGES || ARM64_VA_BITS_52
-	help
-	  Enable support for a 52-bit physical address space, introduced as
-	  part of the ARMv8.2-LPA extension.
-
-	  With this enabled, the kernel will also continue to work on CPUs that
-	  do not support ARMv8.2-LPA, but with some added memory overhead (and
-	  minor performance overhead).
-
-endchoice
-
-config ARM64_PA_BITS
-	int
-	default 48 if ARM64_PA_BITS_48
-	default 52 if ARM64_PA_BITS_52
-
 config ARM64_LPA2
 	def_bool y
-	depends on ARM64_PA_BITS_52 && !ARM64_64K_PAGES
+	depends on !ARM64_64K_PAGES
 
 choice
 	prompt "Endianness"
diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index ad63457a05c5..01a1e3c16283 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -342,14 +342,13 @@ alternative_cb_end
 	mrs	\tmp0, ID_AA64MMFR0_EL1
 	// Narrow PARange to fit the PS field in TCR_ELx
 	ubfx	\tmp0, \tmp0, #ID_AA64MMFR0_EL1_PARANGE_SHIFT, #3
-	mov	\tmp1, #ID_AA64MMFR0_EL1_PARANGE_MAX
 #ifdef CONFIG_ARM64_LPA2
 alternative_if_not ARM64_HAS_VA52
 	mov	\tmp1, #ID_AA64MMFR0_EL1_PARANGE_48
-alternative_else_nop_endif
-#endif
 	cmp	\tmp0, \tmp1
 	csel	\tmp0, \tmp1, \tmp0, hi
+alternative_else_nop_endif
+#endif
 	bfi	\tcr, \tmp0, \pos, #3
 	.endm
 
@@ -599,21 +598,13 @@ alternative_endif
  * 	ttbr:	returns the TTBR value
  */
 	.macro	phys_to_ttbr, ttbr, phys
-#ifdef CONFIG_ARM64_PA_BITS_52
 	orr	\ttbr, \phys, \phys, lsr #46
 	and	\ttbr, \ttbr, #TTBR_BADDR_MASK_52
-#else
-	mov	\ttbr, \phys
-#endif
 	.endm
 
 	.macro	phys_to_pte, pte, phys
-#ifdef CONFIG_ARM64_PA_BITS_52
 	orr	\pte, \phys, \phys, lsr #PTE_ADDR_HIGH_SHIFT
 	and	\pte, \pte, #PHYS_TO_PTE_ADDR_MASK
-#else
-	mov	\pte, \phys
-#endif
 	.endm
 
 /*
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index e889e12b7648..3852ef120484 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -862,9 +862,8 @@ static inline u32 id_aa64mmfr0_parange_to_phys_shift(int parange)
 	 * However, by the "D10.1.4 Principles of the ID scheme
 	 * for fields in ID registers", ARM DDI 0487C.a, any new
 	 * value is guaranteed to be higher than what we know already.
-	 * As a safe limit, we return the limit supported by the kernel.
 	 */
-	default: return CONFIG_ARM64_PA_BITS;
+	default: return 52;
 	}
 }
 
diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 03f4c3d7839c..c98643542597 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -30,8 +30,7 @@
 
 static inline u64 kvm_get_parange_max(void)
 {
-	if (kvm_lpa2_is_enabled() ||
-	   (IS_ENABLED(CONFIG_ARM64_PA_BITS_52) && PAGE_SHIFT == 16))
+	if (kvm_lpa2_is_enabled() || PAGE_SHIFT == 16)
 		return ID_AA64MMFR0_EL1_PARANGE_52;
 	else
 		return ID_AA64MMFR0_EL1_PARANGE_48;
diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index a970def932aa..7ad52dc4c16e 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -172,7 +172,6 @@
 #define PTE_SWBITS_MASK		_AT(pteval_t, (BIT(63) | GENMASK(58, 55)))
 
 #define PTE_ADDR_LOW		(((_AT(pteval_t, 1) << (50 - PAGE_SHIFT)) - 1) << PAGE_SHIFT)
-#ifdef CONFIG_ARM64_PA_BITS_52
 #ifdef CONFIG_ARM64_64K_PAGES
 #define PTE_ADDR_HIGH		(_AT(pteval_t, 0xf) << 12)
 #define PTE_ADDR_HIGH_SHIFT	36
@@ -182,7 +181,6 @@
 #define PTE_ADDR_HIGH_SHIFT	42
 #define PHYS_TO_PTE_ADDR_MASK	GENMASK_ULL(49, 8)
 #endif
-#endif
 
 /*
  * AttrIndx[2:0] encoding (mapping attributes defined in the MAIR* registers).
@@ -323,12 +321,10 @@
 /*
  * TTBR.
  */
-#ifdef CONFIG_ARM64_PA_BITS_52
 /*
- * TTBR_ELx[1] is RES0 in this configuration.
+ * TTBR_ELx[1] is RES0 when using 52-bit physical addressing
  */
 #define TTBR_BADDR_MASK_52	GENMASK_ULL(47, 2)
-#endif
 
 #ifdef CONFIG_ARM64_VA_BITS_52
 /* Must be at least 64-byte aligned to prevent corruption of the TTBR */
diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index a95f1f77bb39..b73acf25341f 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -81,7 +81,7 @@ extern unsigned long prot_ns_shared;
 #define lpa2_is_enabled()	false
 #define PTE_MAYBE_SHARED	PTE_SHARED
 #define PMD_MAYBE_SHARED	PMD_SECT_S
-#define PHYS_MASK_SHIFT		(CONFIG_ARM64_PA_BITS)
+#define PHYS_MASK_SHIFT		(52)
 #else
 static inline bool __pure lpa2_is_enabled(void)
 {
@@ -90,7 +90,7 @@ static inline bool __pure lpa2_is_enabled(void)
 
 #define PTE_MAYBE_SHARED	(lpa2_is_enabled() ? 0 : PTE_SHARED)
 #define PMD_MAYBE_SHARED	(lpa2_is_enabled() ? 0 : PMD_SECT_S)
-#define PHYS_MASK_SHIFT		(lpa2_is_enabled() ? CONFIG_ARM64_PA_BITS : 48)
+#define PHYS_MASK_SHIFT		(lpa2_is_enabled() ? 52 : 48)
 #endif
 
 /*
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index dd5dcf7ae056..dd4f1ad9ffca 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -69,10 +69,9 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
 	pr_err("%s:%d: bad pte %016llx.\n", __FILE__, __LINE__, pte_val(e))
 
 /*
- * Macros to convert between a physical address and its placement in a
+ * Helpers to convert between a physical address and its placement in a
  * page table entry, taking care of 52-bit addresses.
  */
-#ifdef CONFIG_ARM64_PA_BITS_52
 static inline phys_addr_t __pte_to_phys(pte_t pte)
 {
 	pte_val(pte) &= ~PTE_MAYBE_SHARED;
@@ -83,10 +82,6 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
 {
 	return (phys | (phys >> PTE_ADDR_HIGH_SHIFT)) & PHYS_TO_PTE_ADDR_MASK;
 }
-#else
-#define __pte_to_phys(pte)	(pte_val(pte) & PTE_ADDR_LOW)
-#define __phys_to_pte_val(phys)	(phys)
-#endif
 
 #define pte_pfn(pte)		(__pte_to_phys(pte) >> PAGE_SHIFT)
 #define pfn_pte(pfn,prot)	\
@@ -1493,11 +1488,7 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
 #define update_mmu_cache_pmd(vma, address, pmd) do { } while (0)
 
-#ifdef CONFIG_ARM64_PA_BITS_52
 #define phys_to_ttbr(addr)	(((addr) | ((addr) >> 46)) & TTBR_BADDR_MASK_52)
-#else
-#define phys_to_ttbr(addr)	(addr)
-#endif
 
 /*
  * On arm64 without hardware Access Flag, copying from user will fail because
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 9c98ff448bd9..11af40e501ae 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -928,12 +928,6 @@
 #define ID_AA64MMFR0_EL1_TGRAN_2_SUPPORTED_LPA2		0x3
 #define ID_AA64MMFR0_EL1_TGRAN_2_SUPPORTED_MAX		0x7
 
-#ifdef CONFIG_ARM64_PA_BITS_52
-#define ID_AA64MMFR0_EL1_PARANGE_MAX	ID_AA64MMFR0_EL1_PARANGE_52
-#else
-#define ID_AA64MMFR0_EL1_PARANGE_MAX	ID_AA64MMFR0_EL1_PARANGE_48
-#endif
-
 #if defined(CONFIG_ARM64_4K_PAGES)
 #define ID_AA64MMFR0_EL1_TGRAN_SHIFT		ID_AA64MMFR0_EL1_TGRAN4_SHIFT
 #define ID_AA64MMFR0_EL1_TGRAN_LPA2		ID_AA64MMFR0_EL1_TGRAN4_52_BIT
diff --git a/arch/arm64/mm/pgd.c b/arch/arm64/mm/pgd.c
index 0c501cabc238..8722ab6d4b1c 100644
--- a/arch/arm64/mm/pgd.c
+++ b/arch/arm64/mm/pgd.c
@@ -48,20 +48,21 @@ void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 
 void __init pgtable_cache_init(void)
 {
+	unsigned int pgd_size = PGD_SIZE;
+
 	if (pgdir_is_page_size())
 		return;
 
-#ifdef CONFIG_ARM64_PA_BITS_52
 	/*
 	 * With 52-bit physical addresses, the architecture requires the
 	 * top-level table to be aligned to at least 64 bytes.
 	 */
-	BUILD_BUG_ON(PGD_SIZE < 64);
-#endif
+	if (PHYS_MASK_SHIFT >= 52)
+		pgd_size = max(pgd_size, 64);
 
 	/*
 	 * Naturally aligned pgds required by the architecture.
 	 */
-	pgd_cache = kmem_cache_create("pgd_cache", PGD_SIZE, PGD_SIZE,
+	pgd_cache = kmem_cache_create("pgd_cache", pgd_size, pgd_size,
 				      SLAB_PANIC, NULL);
 }
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 8abdc7fed321..84657d04dc51 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -197,10 +197,8 @@ SYM_FUNC_ALIAS(__pi_idmap_cpu_replace_ttbr1, idmap_cpu_replace_ttbr1)
 
 	.macro	pte_to_phys, phys, pte
 	and	\phys, \pte, #PTE_ADDR_LOW
-#ifdef CONFIG_ARM64_PA_BITS_52
 	and	\pte, \pte, #PTE_ADDR_HIGH
 	orr	\phys, \phys, \pte, lsl #PTE_ADDR_HIGH_SHIFT
-#endif
 	.endm
 
 	.macro	kpti_mk_tbl_ng, type, num_entries
diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
index fd6bd69c5096..05034c0b8fd7 100644
--- a/scripts/gdb/linux/constants.py.in
+++ b/scripts/gdb/linux/constants.py.in
@@ -141,7 +141,6 @@ LX_CONFIG(CONFIG_ARM64_4K_PAGES)
 LX_CONFIG(CONFIG_ARM64_16K_PAGES)
 LX_CONFIG(CONFIG_ARM64_64K_PAGES)
 if IS_BUILTIN(CONFIG_ARM64):
-    LX_VALUE(CONFIG_ARM64_PA_BITS)
     LX_VALUE(CONFIG_ARM64_VA_BITS)
     LX_VALUE(CONFIG_PAGE_SHIFT)
     LX_VALUE(CONFIG_ARCH_FORCE_MAX_ORDER)
diff --git a/tools/arch/arm64/include/asm/sysreg.h b/tools/arch/arm64/include/asm/sysreg.h
index cd8420e8c3ad..daeecb1a5366 100644
--- a/tools/arch/arm64/include/asm/sysreg.h
+++ b/tools/arch/arm64/include/asm/sysreg.h
@@ -574,12 +574,6 @@
 #define ID_AA64MMFR0_EL1_TGRAN_2_SUPPORTED_MIN		0x2
 #define ID_AA64MMFR0_EL1_TGRAN_2_SUPPORTED_MAX		0x7
 
-#ifdef CONFIG_ARM64_PA_BITS_52
-#define ID_AA64MMFR0_EL1_PARANGE_MAX	ID_AA64MMFR0_EL1_PARANGE_52
-#else
-#define ID_AA64MMFR0_EL1_PARANGE_MAX	ID_AA64MMFR0_EL1_PARANGE_48
-#endif
-
 #if defined(CONFIG_ARM64_4K_PAGES)
 #define ID_AA64MMFR0_EL1_TGRAN_SHIFT		ID_AA64MMFR0_EL1_TGRAN4_SHIFT
 #define ID_AA64MMFR0_EL1_TGRAN_SUPPORTED_MIN	ID_AA64MMFR0_EL1_TGRAN4_SUPPORTED_MIN
-- 
2.47.0.277.g8800431eea-goog



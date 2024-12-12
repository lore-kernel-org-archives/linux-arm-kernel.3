Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EE1E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 08:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ey45ut0cYqhlv0rHJjDTgjPj+B5/bG+PQfUrVzCrXlU=; b=KN/7sClsH8/WYk3Qz/XTiGgyuE
	8YYTeEeV+1t+B5b2SgLX1z/pRQ9M6TberA//6C4K+hlA/LZDt8vV5fWLgWwosRaGWBXzYPXa2kA4T
	ISzLQPE+Du6Zo7Aks52bSSLSIqm1DFLvAdRmjguHecTUP1KyEYFjZP0GKdeVtg1U9Xf4PfVL6M8uI
	VIqFHQaIt6wYthN46O97zRE1S573KiLoTjUlkuBAFEg8eOTa8j+MgcZK1CuTApcDPFZgsy8Uv+SJg
	EUykBT6FEjULeWfev8VjhkI2HEsPJExttCfOBORM+EBCe8wPAKkzzgQh8lrHOBopBK9IlYKsCN3bP
	WUvMEZdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeXS-0000000HIZ8-0Rqu;
	Thu, 12 Dec 2024 08:27:14 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLePf-0000000HGmz-0yX5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 08:19:12 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4361efc9d23so2905025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 00:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733991549; x=1734596349; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ey45ut0cYqhlv0rHJjDTgjPj+B5/bG+PQfUrVzCrXlU=;
        b=E4H0BenbnAq5ruMwuouDHT2fAiKsHk4+GlD0Pj9GDqd3FZ8rbTlAvU2xIHqADw7vyM
         rh7LdSpSWs4o5iJRUWvWiWBH9hdekfCiX7QPMGE4vrO2oAEFtAKXUruiAlypxE5Zk8lk
         fQNXPPMKX0COka40IgTXeMfIPGRH7VKKKe1sXQ0FNav+9T7Wex0pKejT9dZuxaRZihT8
         85AZminT1Ki7E1l4I0IXDEJ71bViGtE7FoMgIm9ycLg1Jg92ZX19snBzx25v2kApNEg1
         +/t/aK1teCAr0w9xVa4Lg7rQFydM5kXmz+5hjSl3ugU9nt0xkD5YurVLRo50G94QHQFc
         EOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733991549; x=1734596349;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ey45ut0cYqhlv0rHJjDTgjPj+B5/bG+PQfUrVzCrXlU=;
        b=dSfO4L47el+AIq67ySwa84/X0EmLB1ceD8qvO5h5oDcTDQ+CR8DXxhkvVasRI19ra7
         PQmPqq2wddY++DXyqBa5+0feNQk07nSxbXgUF87/JSSDzB6gQ4WPfGk30p3BweQ2leOz
         s6krwN7h0lONZxIlcBaAFepPvW80i5xe+aCB2A2Gc3jEV/ldPExEgwtO/zxjmrAm/DKV
         fUYLRhk4TeUiadTSYkpNlsqHL7HI+AG87b8P9bMVk2Z8M54OdIrEx1AyPWU7EkqW1D7Y
         wq0ctDt2WAWnmkf3YuikkvDJSzd/Zwv37Z4JuIm2JrjUNMtpIiIlfRfI4iL4yJ7QtwPq
         rl1A==
X-Gm-Message-State: AOJu0YzS3qbFAp+8Y3+A4f1JXCZ8KklTq49GFx/v3xbHbJo1tFSk2e1t
	BdLhOwHxQVt+AC+opy6Lx+Eq9xkRAkzPuH0eor7b1yXl03Tv9nVHPzy7E4DdOdX2qLihxk3KgMd
	JaG0PyQYPoxVKAoPUkF6Va0Q8C8lKBoruQvEnZDh6IPp9pQtM1OMEf/wzH3XGtIxZ5Vmw5/Bg/n
	zzPDyaulJcjGO0YLM27w2sM4ehEIxjedYJegbQQXl2
X-Google-Smtp-Source: AGHT+IFcDPi/tJJwAsl19d48itWuAeTtp0GYsuRI58iTvVH0YxvBQoA7Eq57mdP63vpaZu5145ucgqLD
X-Received: from wmik9.prod.google.com ([2002:a7b:c409:0:b0:435:21e:7bec])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:35c9:b0:434:a734:d279
 with SMTP id 5b1f17b1804b1-4361c3c6fbfmr55375515e9.16.1733991549429; Thu, 12
 Dec 2024 00:19:09 -0800 (PST)
Date: Thu, 12 Dec 2024 09:18:48 +0100
In-Reply-To: <20241212081841.2168124-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241212081841.2168124-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=11772; i=ardb@kernel.org;
 h=from:subject; bh=5i2/jnuksoamN8To8RDijcFECekYd7sFcR9Y5NN+knE=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIT1qTpaiim1ZUHnYtpPcJ1cbnzrNnHa2Q5ixr5TlhGWD8
 uYVl106SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwEQq0hj+FzotbA6ceUY+nrGD
 00ziSm6ve9Th6l3fN9Yy7J+aad3wkOGvoKfJC5XUS049d+8fqROcdqun5HrjogyHl8sLZTTaVVJ 5AQ==
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212081841.2168124-14-ardb+git@google.com>
Subject: [PATCH v3 6/6] arm64/mm: Drop configurable 48-bit physical address
 space limit
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_001911_275750_4B561BA1 
X-CRM114-Status: GOOD (  23.10  )
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
index c1ca21adddc1..7ebd0ba32a32 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1416,38 +1416,9 @@ config ARM64_VA_BITS
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
index b64e49bd9d10..ed327358e734 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -885,9 +885,8 @@ static inline u32 id_aa64mmfr0_parange_to_phys_shift(int parange)
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
index aab04097b505..525aef178cb4 100644
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
index a9136cc551cc..9b34180042b2 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -176,7 +176,6 @@
 #define PTE_SWBITS_MASK		_AT(pteval_t, (BIT(63) | GENMASK(58, 55)))
 
 #define PTE_ADDR_LOW		(((_AT(pteval_t, 1) << (50 - PAGE_SHIFT)) - 1) << PAGE_SHIFT)
-#ifdef CONFIG_ARM64_PA_BITS_52
 #ifdef CONFIG_ARM64_64K_PAGES
 #define PTE_ADDR_HIGH		(_AT(pteval_t, 0xf) << 12)
 #define PTE_ADDR_HIGH_SHIFT	36
@@ -186,7 +185,6 @@
 #define PTE_ADDR_HIGH_SHIFT	42
 #define PHYS_TO_PTE_ADDR_MASK	GENMASK_ULL(49, 8)
 #endif
-#endif
 
 /*
  * AttrIndx[2:0] encoding (mapping attributes defined in the MAIR* registers).
@@ -327,12 +325,10 @@
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
index 6986345b537a..ec8124d66b9c 100644
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
@@ -1495,11 +1490,7 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
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
index b8303a83c0bf..f902893ec903 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -916,12 +916,6 @@
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
index b8edc5765441..51ed0e9d0a0d 100644
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
2.47.1.613.gc27f4b7a9f-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1E9C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5c+7YKxbb37QN6+/DrU0zqhCjEWNxIf9vXbIaiDob8I=; b=XIRxrNqJBqQoendhiYaBjkcXuF
	raAcJCjdL/XZWCpOPbNJLfmD7Pxqh95g1APUIaF50F98oJKzYcaWOgo9GDoRRfQoGr4tu/KzVph20
	op5ZwoQBJwKd5RKWZQU5P8iq4T5RNXm3JCwJbksUWlaVR0ZzRBaBk5O7sy+FEsrXR59FEqcbZ3bJy
	WDp0m41aD+CsWnw4ow8h7zPHs9cIXI3adN8FM/dEOufo9tr/muiGNEw5Gt3Bo7h8mir5qw/M2e0ZI
	mNH0Sd5OSIIzJYS+Sl5ISi332aEgAwiDigaa3JUerltfmtw82VGLBfW0wcpXwIUBPl/9qlINZ27bQ
	J4uIi1Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x676X-00000003rjy-40pf;
	Mon, 14 Sep 2026 13:52:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x676T-00000003rha-17Nw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:52:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4A051570;
	Mon, 14 Sep 2026 06:52:08 -0700 (PDT)
Received: from [127.0.1.1] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F60A3F882;
	Mon, 14 Sep 2026 06:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789393932; bh=a0XPwGbhmPF/8HQB5tl0tfRDc3dHm2jdpy2fD9dIAOw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Pfzm5hJ3feethkE3Lt+/Yi0zFezDiFNBYm62UaeS/yrfFexyWZ5fbgJcnY5dDxP/0
	 2T9TOcPMJpLUxmKN/g4RlGweBDexJjW+SpVe4eoyBWvQbUpGj2MaSFuD6QqTOaw7RS
	 AGhWCYfmKhKFpjN5exzGFjhmlpyiygeQNVXzo1rM=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Date: Mon, 14 Sep 2026 14:51:32 +0100
Subject: [PATCH 2/6] arm64: use hw_pte_val for HW PTE atomics
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-pte0_arm-v1-2-bb53b663e396@arm.com>
References: <20260914-pte0_arm-v1-0-bb53b663e396@arm.com>
In-Reply-To: <20260914-pte0_arm-v1-0-bb53b663e396@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-efi@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Muhammad Usama Anjum <usama.anjum@arm.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_065213_417790_968549C2 
X-CRM114-Status: GOOD (  14.56  )
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

Add hw_pte_val() to preserve an lvalue for the HW PTE bits, so atomic
updates can take their address. pte_val() expects a SW PTE value and
cannot operate directly on a distinct hw_pte_t.

With ARCH_HAS_HW_PTE_T, use pte_val() on the wrapper's __pte member;
otherwise, use pte_val() directly.

The atomic operations and their ordering are unchanged.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 10 +++++-----
 arch/arm64/mm/fault.c            |  6 +++---
 include/linux/pgtable_types.h    |  4 ++++
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 652ce413be389..4768ec59de555 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1303,7 +1303,7 @@ static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
 	do {
 		old_pte = pte;
 		pte = pte_mkold(pte);
-		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
+		pte_val(pte) = cmpxchg_relaxed(&hw_pte_val(*ptep),
 					       pte_val(old_pte), pte_val(pte));
 	} while (pte_val(pte) != pte_val(old_pte));
 
@@ -1346,7 +1346,7 @@ static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
 					       hw_pte_t *ptep,
 					       unsigned long pgsize)
 {
-	pte_t pte = __pte(xchg_relaxed(&pte_val(*ptep), 0));
+	pte_t pte = __pte(xchg_relaxed(&hw_pte_val(*ptep), 0));
 
 	switch (pgsize) {
 	case PAGE_SIZE:
@@ -1422,7 +1422,7 @@ static inline void ___ptep_set_wrprotect(struct mm_struct *mm,
 	do {
 		old_pte = pte;
 		pte = pte_wrprotect(pte);
-		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
+		pte_val(pte) = cmpxchg_relaxed(&hw_pte_val(*ptep),
 					       pte_val(old_pte), pte_val(pte));
 	} while (pte_val(pte) != pte_val(old_pte));
 }
@@ -1460,7 +1460,7 @@ static inline void __clear_young_dirty_pte(struct vm_area_struct *vma,
 		if (flags & CYDP_CLEAR_DIRTY)
 			pte = pte_mkclean(pte);
 
-		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
+		pte_val(pte) = cmpxchg_relaxed(&hw_pte_val(*ptep),
 					       pte_val(old_pte), pte_val(pte));
 	} while (pte_val(pte) != pte_val(old_pte));
 }
@@ -1830,7 +1830,7 @@ static inline bool ptep_try_set(hw_pte_t *ptep, pte_t new_pte)
 {
 	pteval_t old = 0;
 
-	if (!try_cmpxchg(&pte_val(*ptep), &old, pte_val(new_pte)))
+	if (!try_cmpxchg(&hw_pte_val(*ptep), &old, pte_val(new_pte)))
 		return false;
 
 	/*
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index b77f4be88e3ea..7d6c30f27214e 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -225,8 +225,8 @@ int __ptep_set_access_flags_anysz(struct vm_area_struct *vma,
 	/*
 	 * Setting the flags must be done atomically to avoid racing with the
 	 * hardware update of the access/dirty state. The PTE_RDONLY bit must
-	 * be set to the most permissive (lowest value) of *ptep and entry
-	 * (calculated as: a & b == ~(~a | ~b)).
+	 * be set to the most permissive (lowest value) of the current PTE and
+	 * entry (calculated as: a & b == ~(~a | ~b)).
 	 */
 	pte_val(entry) ^= PTE_RDONLY;
 	pteval = pte_val(pte);
@@ -235,7 +235,7 @@ int __ptep_set_access_flags_anysz(struct vm_area_struct *vma,
 		pteval ^= PTE_RDONLY;
 		pteval |= pte_val(entry);
 		pteval ^= PTE_RDONLY;
-		pteval = cmpxchg_relaxed(&pte_val(*ptep), old_pteval, pteval);
+		pteval = cmpxchg_relaxed(&hw_pte_val(*ptep), old_pteval, pteval);
 	} while (pteval != old_pteval);
 
 	/*
diff --git a/include/linux/pgtable_types.h b/include/linux/pgtable_types.h
index d6c5a7548550b..ee4eace5c3e1c 100644
--- a/include/linux/pgtable_types.h
+++ b/include/linux/pgtable_types.h
@@ -9,9 +9,13 @@
 #ifdef CONFIG_ARCH_HAS_HW_PTE_T
 typedef struct __hw_pte_t { pte_t __pte; } hw_pte_t;
 #define __pte_from_hw(pte)	((pte).__pte)
+
+#define hw_pte_val(x)  pte_val((x).__pte)
 #else
 #define hw_pte_t pte_t
 #define __pte_from_hw(pte)	(pte)
+
+#define hw_pte_val(x)  pte_val(x)
 #endif
 
 #endif /* !__ASSEMBLY__ */

-- 
2.47.3



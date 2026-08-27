Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD683C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unrQEc9LN1JZQh7e5YkkcFIaqqsfhvS1fmOT/8/PD+U=; b=pBLf3k2KQLnaF7WP+1+NdXt+a5
	ln5wo0WCOY5FKW7oYjeFa/WRpmYhb3dd1A/51ReI+GlUaRQu4PuUlf34lev/ET3QkG1gGubRM3KFO
	jKRp70NKXnrQUTFtGUJuGtTsRm2tLa0K0m28O/u4Prdb+vdMo7TkVCL5u9AITKfO9aKPwZUd7KmnL
	D9B3TnCSTVSHNWYyd6ED/f4rs9JlXtCQ4py7oukGWZ8yeDTA69qVLHcMXwn0fsTx07t770rD/VPnJ
	M2+r/UZK1g2l4MJJ2wGQGGtgpEm9tNkeDdipqe+i0VPFgWf7ny/1iClCIGtFB4+3hzMtgP6StOzoJ
	iaP89YEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdDa-00000004OXk-46FB;
	Thu, 27 Aug 2026 16:44:46 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdDP-00000004OT2-2P3p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:44:36 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4994cf6cdb9so14772465e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787849073; x=1788453873; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=unrQEc9LN1JZQh7e5YkkcFIaqqsfhvS1fmOT/8/PD+U=;
        b=J49Md+m3RdG2ldkx1PvkPdVm8y7Y6f9m942HOsfR3Va9Q4Lcb39QxdcQ9GTCA2zaJI
         2hf4OV3iKeo0++C6AOa+nT58ifPkG1spvEJmBQGA0yuCQNFNJbEGdZODpD+jUjdCE+OS
         lvVLI2kMu9Bg3ia+k1aLdn54FPQha0hCJjsuHryyf9XjbWA9QYBHNFYxp/9DLdqX5osn
         N63khvnauflqF1B8d5VGeyn58zLHM4io3+34PUgSEg4/95l9rhw40s23nusVZPBDqrWI
         cs59H/4g0bHY2htgY1NFLhM3uCUcHqY8mqjlJElusfKOvud3qnQjnCh+z9Nq6WFL5fqJ
         x60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849073; x=1788453873;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unrQEc9LN1JZQh7e5YkkcFIaqqsfhvS1fmOT/8/PD+U=;
        b=mTV08jDoP0sQ42nvi5swa06QWy+jLwkCirBYeI8PiVCzt5T9DOMaUxD6WnPZT9ZU0Y
         UMpw+xSMMP3HzeuHcyp4KJIDW/Ny+h894x2qW/wE5TP8mOkZwEcd+TG74EQ0KtG1sNOM
         VRR2ckk6lfnbYbhZ0yblXEMuXtnhZ1xH0V2TOuKyXxe8BbDGresDBpaymox1RoL8DCta
         //L6FVrDazTLILsMtzCzZhZN2q0FGnV2TXGZ+ZIrOGI07BcIMLCeswTENr+6EJDUH4p4
         XFcyyPyOpr+FR55A/3dzY4OhHX02BiMs4xku0B2Kq1NLHscooEndIOm1g5St9OB8o00D
         x/yQ==
X-Gm-Message-State: AFuF++nWWfCpnc0ZAGNDJx3UgSsYPQv1tQRAF/NhdCb6T0Fkna5HLx+q
	Akko7JbxH+jGxwmVwQALYR+IRN+EUbpQuUC5bql2SoJbfp0CrYDOIPB7Q8eQOZv0wVosXXmVRQ=
	=
X-Received: from wmlc16.prod.google.com ([2002:a7b:c850:0:b0:495:5edc:795b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1f8d:b0:499:621a:2ec2
 with SMTP id 5b1f17b1804b1-49b91c17c41mr4617635e9.3.1787849072790; Thu, 27
 Aug 2026 09:44:32 -0700 (PDT)
Date: Thu, 27 Aug 2026 18:44:12 +0200
In-Reply-To: <20260827164409.3421848-6-ardb+git@google.com>
Mime-Version: 1.0
References: <20260827164409.3421848-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5363; i=ardb@kernel.org;
 h=from:subject; bh=IXwvq/N/tjoj1rBZtZdDN7mLt+hNS7LMJFa0rm3k0+Y=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWtCZkzKm9Xbn65Wvf1HVXO2m+/z5fPaL7zrsHy43dJ5w
 ddHJXkzO0pZGMS4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEjEoY/qk95OHUKhcw3B27
 Rl9VrelVyptFld+fWJ62rI/wquyJf8PIsKV41pJtfLPmrCkyO/FOQzDky5EoqdVnymPfdMWcS5s Uzg4A
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827164409.3421848-8-ardb+git@google.com>
Subject: [RFC PATCH v2 2/4] arm64: mm: Use fault handler to permit
 swapper_pg_dir updates
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_094435_641344_A8608E07 
X-CRM114-Status: GOOD (  15.66  )
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

Instead of checking the destination of a page table descriptor update
against the virtual address of swapper_pg_dir in the kernel image, and
taking a dedicated path to perform such updates via a fixmap alias,
rely on a fault handler to do so if the plain store faulted.

This is more efficient for the general case, and makes it more
straight-forward to extend this logic to other page tables that may have
been allocated statically in the .rodata region of the kernel image.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/fixmap.h  |  1 +
 arch/arm64/include/asm/pgtable.h | 49 +++++++++-----------
 arch/arm64/mm/mmu.c              | 18 +++----
 3 files changed, 32 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
index 9191125738e9..8db791dcb4cb 100644
--- a/arch/arm64/include/asm/fixmap.h
+++ b/arch/arm64/include/asm/fixmap.h
@@ -99,6 +99,7 @@ enum fixed_addresses {
 	FIX_PUD,
 	FIX_P4D,
 	FIX_PGD,
+	FIX_PTVAL,
 
 	__end_of_fixed_addresses
 };
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 6000905a2e86..799cd9d52c28 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -35,6 +35,7 @@
 #include <asm/cmpxchg.h>
 #include <asm/fixmap.h>
 #include <asm/por.h>
+#include <asm/uaccess.h>
 #include <linux/mmdebug.h>
 #include <linux/mm_types.h>
 #include <linux/sched.h>
@@ -814,7 +815,7 @@ extern pgd_t idmap_pg_dir[];
 extern pgd_t tramp_pg_dir[];
 extern pgd_t reserved_pg_dir[];
 
-extern void set_swapper_pgd(pgd_t *pgdp, pgd_t pgd);
+void try_set_readonly_ptval(ptval_t *ptvalp, ptval_t ptval);
 
 static inline bool in_swapper_pgdir(void *addr)
 {
@@ -824,17 +825,14 @@ static inline bool in_swapper_pgdir(void *addr)
 
 static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 {
-#ifdef __PAGETABLE_PMD_FOLDED
-	if (in_swapper_pgdir(pmdp)) {
-		set_swapper_pgd((pgd_t *)pmdp, __pgd(pmd_val(pmd)));
-		return;
-	}
-#endif /* __PAGETABLE_PMD_FOLDED */
-
-	WRITE_ONCE(*pmdp, pmd);
+	__put_kernel_nofault(pmdp, &pmd, pmd_t, fault);
 
 	if (pmd_valid(pmd))
 		queue_pte_barriers();
+	return;
+
+fault:
+	try_set_readonly_ptval(&pmd_val(*pmdp), pmd_val(pmd));
 }
 
 static inline void pmd_clear(pmd_t *pmdp)
@@ -890,15 +888,14 @@ static inline bool pgtable_l4_enabled(void);
 
 static inline void set_pud(pud_t *pudp, pud_t pud)
 {
-	if (!pgtable_l4_enabled() && in_swapper_pgdir(pudp)) {
-		set_swapper_pgd((pgd_t *)pudp, __pgd(pud_val(pud)));
-		return;
-	}
-
-	WRITE_ONCE(*pudp, pud);
+	__put_kernel_nofault(pudp, &pud, pud_t, fault);
 
 	if (pud_valid(pud))
 		queue_pte_barriers();
+	return;
+
+fault:
+	try_set_readonly_ptval(&pud_val(*pudp), pud_val(pud));
 }
 
 static inline void pud_clear(pud_t *pudp)
@@ -971,13 +968,12 @@ static inline bool mm_pud_folded(const struct mm_struct *mm)
 
 static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 {
-	if (in_swapper_pgdir(p4dp)) {
-		set_swapper_pgd((pgd_t *)p4dp, __pgd(p4d_val(p4d)));
-		return;
-	}
-
-	WRITE_ONCE(*p4dp, p4d);
+	__put_kernel_nofault(p4dp, &p4d, p4d_t, fault);
 	queue_pte_barriers();
+	return;
+
+fault:
+	try_set_readonly_ptval(&p4d_val(*p4dp), p4d_val(p4d));
 }
 
 static inline void p4d_clear(p4d_t *p4dp)
@@ -1099,13 +1095,12 @@ static inline bool mm_p4d_folded(const struct mm_struct *mm)
 
 static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 {
-	if (in_swapper_pgdir(pgdp)) {
-		set_swapper_pgd(pgdp, __pgd(pgd_val(pgd)));
-		return;
-	}
-
-	WRITE_ONCE(*pgdp, pgd);
+	__put_kernel_nofault(pgdp, &pgd, pgd_t, fault);
 	queue_pte_barriers();
+	return;
+
+fault:
+	try_set_readonly_ptval(&pgd_val(*pgdp), pgd_val(pgd));
 }
 
 static inline void pgd_clear(pgd_t *pgdp)
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 9c1aa838e9d5..b97e4bf99ca5 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -63,34 +63,34 @@ static bool rodata_is_rw __ro_after_init = true;
  */
 long __section(".mmuoff.data.write") __early_cpu_boot_status;
 
-static DEFINE_SPINLOCK(swapper_pgdir_lock);
 static DEFINE_MUTEX(fixmap_lock);
 
-void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
+void noinstr try_set_readonly_ptval(ptval_t *ptvalp, ptval_t ptval)
 {
-	pgd_t *fixmap_pgdp;
+	static DEFINE_SPINLOCK(lock);
+
+	BUG_ON(!in_swapper_pgdir(ptvalp));
 
 	/*
 	 * Don't bother with the fixmap if swapper_pg_dir is still mapped
 	 * writable in the kernel mapping.
 	 */
 	if (rodata_is_rw) {
-		WRITE_ONCE(*pgdp, pgd);
+		WRITE_ONCE(*ptvalp, ptval);
 		dsb(ishst);
 		isb();
 		return;
 	}
 
-	spin_lock(&swapper_pgdir_lock);
-	fixmap_pgdp = pgd_set_fixmap(__pa_symbol(pgdp));
-	WRITE_ONCE(*fixmap_pgdp, pgd);
+	guard(spinlock)(&lock);
+	ptvalp = (ptval_t *)set_fixmap_offset(FIX_PTVAL, __pa_symbol(ptvalp));
+	WRITE_ONCE(*ptvalp, ptval);
 	/*
 	 * We need dsb(ishst) here to ensure the page-table-walker sees
 	 * our new entry before set_p?d() returns. The fixmap's
 	 * flush_tlb_kernel_range() via clear_fixmap() does this for us.
 	 */
-	pgd_clear_fixmap();
-	spin_unlock(&swapper_pgdir_lock);
+	clear_fixmap(FIX_PTVAL);
 }
 
 pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
-- 
2.55.0.887.g758fc8c411-goog



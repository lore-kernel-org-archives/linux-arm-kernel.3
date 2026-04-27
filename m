Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57686FF886A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTH9nHu8rDITPKAJB2BnahRrdCbOr3wfwwaQ1ZOWZK8=; b=bB7i6m+45GTXfc7r4FRYKGs8I0
	yF8YgCqon7mer+l1i2LyOCRmfErMhKPM4oC26eYxzYQ9BWS7HPsyZJfH5nTDQaBZtO2r7TkL+N52k
	oKfBsjVtSJntgTYvrMHoJvzfTWhT6GkigDc73PDwBc4qgA5mgoTdiVfHdzJW3ULqLS6ixW8Wgl88y
	6o4eUKTg5bR1gu0vwz97IWRMB09dfjdrhr0E9JyMKl9k140QbqgD5zqf15LE55PKDnNhu+DzIYesu
	tbeSJ+mloiVsERcQBLKsWpEl+Iw+R1bTxTlPhYX5bz3xZvXIRYlYbG9PIGdgsNpm8YZCf4hJSOe0k
	vC1VEwQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHO0M-0000000HCul-1C3A;
	Mon, 27 Apr 2026 15:36:14 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzz-0000000HCZL-3BCc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:35:53 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-4440c5944fbso1288118f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777304150; x=1777908950; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XTH9nHu8rDITPKAJB2BnahRrdCbOr3wfwwaQ1ZOWZK8=;
        b=cSy0diW4VLh1khGx8sHekYQRgpkJvaBBrdUt6LE7ZwelZnELWbxib0jgO5CpS9ku9E
         BEsREV9blCKRbkMVKuJ8QMq1olD4cib7vU8cs9keWxTL6cHxpsZGuQpnlL+PSY4VYOT8
         k72lxh9sSDwmNr2ZSXwtIsn5QhBc980HxLjL3eQg+4yyFTxfvT08YZ3YlG9ZEunN7nTa
         tvq9YZoDUjs+veRqlJrZfcnu24hCcnFzuEN4S06aOQnOJ82ZuxtiV+WW8vLEN9z8RJmH
         KfSOcpCbR1sRTDt9TIjPVRBVKe72w8S3JKEG5Dfc1T6GDCMQN72rBPPQv0a6rl2aRDQp
         QJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304150; x=1777908950;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XTH9nHu8rDITPKAJB2BnahRrdCbOr3wfwwaQ1ZOWZK8=;
        b=HEjELib//yFXGLlZHiLYhsyA3IsirYz9FfQlRyaCcKO2KgWB5T9Clde3CGdFcb4AsV
         Mi84wvXL7ly+NCNYYAksvCE27pOd9N0pDJmo8xuNSdRktRquydvl65Fu2MzqTZS6Dw4B
         ue5ylRvfypao8GunDyQOG+mB2F69HdlTWPXaWxszlgykUVvp636s3bg0cTciMgCE9UPV
         pz+Udlz3vSsrBBPqpW1VOalmKlfydn+5mcAZvxfr9WCrROq3EKImmYHs/x5mOrIZ9H11
         pMi8Eu1n1W5xFb5NJ3cFaKVgwB6XHND/45U4LeeXy7uY8wvjT55afM80J4f2za9u5WR8
         cDsg==
X-Gm-Message-State: AOJu0YyDeaIeCl7uDSaxxW5GqKJUzVhInCrP/f1WB98ghqxHkUqE7EEq
	LV/B2SgU9Iyhp4jOl9MbHt7EotmXychkUc1LXucCyoqUVWpDmlg56BOdJNB6zQ2MjAE63H6Vc+J
	jDZhcu1LHVS5nHuolIiIMIgu6/VtCaOdX4WNpHbgcOi4N5VnuinMjWaNHKzsYH9id8r80PMISWQ
	96Ww1v06G+tT+8PNs62yKR3ABaXW8Mw70GPRUI9Yv6toHY
X-Received: from wmcn9.prod.google.com ([2002:a05:600c:c0c9:b0:485:fb9c:ffa5])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3546:b0:488:81b1:ae36
 with SMTP id 5b1f17b1804b1-488fb7880camr604813405e9.23.1777304149544; Mon, 27
 Apr 2026 08:35:49 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:34:31 +0200
In-Reply-To: <20260427153416.2103979-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260427153416.2103979-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5803; i=ardb@kernel.org;
 h=from:subject; bh=YSdu4q+PtPsInD53oLl+3uBw5SBzUVoUd7FzWVZ14jY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN9E5+Lo4bOq9KZm6o4L8u/vb/hydxl+fVRaYE/zvc9Y
 VmglsHQUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYix8jIsKnEu41r6pMdV/e7
 tUrq7Z357SWjW05Bks+rK6s47Vdea2ZkmLNng5zCxX8/rKfelTlnZcUXtfa71MttQVn9jCEdZr+ LeQA=
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260427153416.2103979-31-ardb+git@google.com>
Subject: [PATCH v4 14/15] arm64: mm: Generalize manipulation code of read-only descriptors
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_083551_839103_A9CCCEC7 
X-CRM114-Status: GOOD (  17.15  )
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

Before moving the fixmap PUD/PMD tables into .rodata, update the
existing descriptor manipulation code so it will fallback to the fixmap
for any descriptor located in the .pgdir_rodata section.

This is slightly more costly, as it evaluates whether or not a
descriptor is in the kernel's rodata region at levels PMD and higher for
any configuration, rather than only when the level in question is the
root level.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/pgtable.h | 27 ++++++++++----------
 arch/arm64/kernel/vmlinux.lds.S  |  8 ++++--
 arch/arm64/mm/mmu.c              | 24 ++++++++---------
 3 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index a1c5894332d9..94235dd428be 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -816,23 +816,22 @@ extern pgd_t swapper_pg_dir[];
 extern pgd_t idmap_pg_dir[];
 extern pgd_t tramp_pg_dir[];
 extern pgd_t reserved_pg_dir[];
+extern pgd_t __pgdir_rodata_start[], __pgdir_rodata_end[];
 
-extern void set_swapper_pgd(pgd_t *pgdp, pgd_t pgd);
+extern void set_rodata_pte(pte_t *ptep, pte_t pte);
 
-static inline bool in_swapper_pgdir(void *addr)
+static inline bool in_pgdir_rodata(void *addr)
 {
-	return ((unsigned long)addr & PAGE_MASK) ==
-	        ((unsigned long)swapper_pg_dir & PAGE_MASK);
+	return addr >= (void *)__pgdir_rodata_start &&
+	       addr < (void *)__pgdir_rodata_end;
 }
 
 static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 {
-#ifdef __PAGETABLE_PMD_FOLDED
-	if (in_swapper_pgdir(pmdp)) {
-		set_swapper_pgd((pgd_t *)pmdp, __pgd(pmd_val(pmd)));
+	if (in_pgdir_rodata(pmdp)) {
+		set_rodata_pte((pte_t *)pmdp, __pte(pmd_val(pmd)));
 		return;
 	}
-#endif /* __PAGETABLE_PMD_FOLDED */
 
 	WRITE_ONCE(*pmdp, pmd);
 
@@ -893,8 +892,8 @@ static inline bool pgtable_l4_enabled(void);
 
 static inline void set_pud(pud_t *pudp, pud_t pud)
 {
-	if (!pgtable_l4_enabled() && in_swapper_pgdir(pudp)) {
-		set_swapper_pgd((pgd_t *)pudp, __pgd(pud_val(pud)));
+	if (in_pgdir_rodata(pudp)) {
+		set_rodata_pte((pte_t *)pudp, __pte(pud_val(pud)));
 		return;
 	}
 
@@ -974,8 +973,8 @@ static inline bool mm_pud_folded(const struct mm_struct *mm)
 
 static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 {
-	if (in_swapper_pgdir(p4dp)) {
-		set_swapper_pgd((pgd_t *)p4dp, __pgd(p4d_val(p4d)));
+	if (in_pgdir_rodata(p4dp)) {
+		set_rodata_pte((pte_t *)p4dp, __pte(p4d_val(p4d)));
 		return;
 	}
 
@@ -1102,8 +1101,8 @@ static inline bool mm_p4d_folded(const struct mm_struct *mm)
 
 static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 {
-	if (in_swapper_pgdir(pgdp)) {
-		set_swapper_pgd(pgdp, __pgd(pgd_val(pgd)));
+	if (in_pgdir_rodata(pgdp)) {
+		set_rodata_pte((pte_t *)pgdp, __pte(pgd_val(pgd)));
 		return;
 	}
 
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 2dca18574619..e5e1d0fd7f27 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -243,8 +243,12 @@ SECTIONS
 	reserved_pg_dir = .;
 	. += PAGE_SIZE;
 
-	swapper_pg_dir = .;
-	. += PAGE_SIZE;
+	.pgdir_rodata : {
+		__pgdir_rodata_start = .;
+		swapper_pg_dir = .;
+		. += PAGE_SIZE;
+		__pgdir_rodata_end = .;
+	}
 
 	. = ALIGN(SEGMENT_ALIGN);
 	__init_begin = .;
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index a464f3d2d2df..84d81bae07a7 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -65,34 +65,34 @@ static bool rodata_is_rw __ro_after_init = true;
  */
 long __section(".mmuoff.data.write") __early_cpu_boot_status;
 
-static DEFINE_SPINLOCK(swapper_pgdir_lock);
+static DEFINE_SPINLOCK(rodata_pgdir_lock);
 static DEFINE_MUTEX(fixmap_lock);
 
-void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
+void noinstr set_rodata_pte(pte_t *ptep, pte_t pte)
 {
-	pgd_t *fixmap_pgdp;
+	pte_t *fixmap_ptep;
 
 	/*
-	 * Don't bother with the fixmap if swapper_pg_dir is still mapped
-	 * writable in the kernel mapping.
+	 * Don't bother with the fixmap if rodata is still mapped
+	 * writable in the kernel and linear mappings.
 	 */
 	if (rodata_is_rw) {
-		WRITE_ONCE(*pgdp, pgd);
+		WRITE_ONCE(*ptep, pte);
 		dsb(ishst);
 		isb();
 		return;
 	}
 
-	spin_lock(&swapper_pgdir_lock);
-	fixmap_pgdp = pgd_set_fixmap(__pa_symbol(pgdp));
-	WRITE_ONCE(*fixmap_pgdp, pgd);
+	spin_lock(&rodata_pgdir_lock);
+	fixmap_ptep = pte_set_fixmap(__pa_nodebug(ptep));
+	WRITE_ONCE(*fixmap_ptep, pte);
 	/*
 	 * We need dsb(ishst) here to ensure the page-table-walker sees
 	 * our new entry before set_p?d() returns. The fixmap's
 	 * flush_tlb_kernel_range() via clear_fixmap() does this for us.
 	 */
-	pgd_clear_fixmap();
-	spin_unlock(&swapper_pgdir_lock);
+	pte_clear_fixmap();
+	spin_unlock(&rodata_pgdir_lock);
 }
 
 pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
@@ -1071,6 +1071,7 @@ void __init mark_linear_text_alias_ro(void)
 	/*
 	 * Remove the write permissions from the linear alias of .text/.rodata
 	 */
+	WRITE_ONCE(rodata_is_rw, false);
 	update_mapping_prot(__pa_symbol(_text), (unsigned long)lm_alias(_text),
 			    (unsigned long)__init_begin - (unsigned long)_text,
 			    pgprot_tagged(PAGE_KERNEL_RO));
@@ -1221,7 +1222,6 @@ void mark_rodata_ro(void)
 	 * to cover NOTES and EXCEPTION_TABLE.
 	 */
 	section_size = (unsigned long)__init_begin - (unsigned long)__start_rodata;
-	WRITE_ONCE(rodata_is_rw, false);
 	update_mapping_prot(__pa_symbol(__start_rodata), (unsigned long)__start_rodata,
 			    section_size, PAGE_KERNEL_RO);
 	/* mark the range between _text and _stext as read only. */
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog



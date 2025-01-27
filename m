Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB5DC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 09:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsGp3DbjRPLkoj2kwFjv1+EJYiVm/DSEknC/OoKntbQ=; b=nYsllDNO4vzpPDRI9KWDtyw2CZ
	VCdJzmZgJpmz/9RTtgg+4bZTAp6LmJh7ROkyCZ3CqDtGkAO0ZxXyAnq814rWa6ehyuyDeoXg8pT69
	K6RkvapP196TA3tqwQjv2XIIiyaXDI/7P0SrCOrDStOsa0oYmgalZ20hALOS5+Gck+OzX/UzJFmjS
	UIl+WZaqAhK8LXQgQ49zfbmcXMB7NGZYb17k7t7bgY6tqWUQju0IiraBHrtO+6n8cIRThv3zzzEl+
	VAuQYba7UVR18JN4z1g+qpoNY6H5IldnqBlEChtGTMW1EVtXsE0wTElgxtPiFuOGSdbQalEeAR9ap
	Sw0CIHVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLl9-000000024fT-1mSB;
	Mon, 27 Jan 2025 09:50:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLfr-000000023Rp-1vUl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 09:44:56 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so43306015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 01:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737971094; x=1738575894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsGp3DbjRPLkoj2kwFjv1+EJYiVm/DSEknC/OoKntbQ=;
        b=gi2jtG0AjyFnAET+fhZEGaeuAymsRSLJ4WZ7Zkd8pUMIBvbOu3uZjXpQeDXTUm2qZK
         Sw1Qq0aD+OC1AhC4mFyPGygs04fU8AQR/pumTxZ5VeOEGA9K4TdFU2a2zPY303E/Nq+D
         24SnfB0iPCHum2UIqtYlhIYhG5CtoxTKybaVq4oieYhqqBmkliITB1mDQK5czOKSTlKU
         eizn9LxAbjrJcog11cfjI1gzZyORDM0jomtLKUTuKhRsN0MxWrt3g6e8+boddYaSu8Gv
         hQr5nFI4SzQnu3ozNOHOijXX/IR8LRvHOPtuSJeYUNg8OWLdhrIyV4zQspzPA5Dg6eIq
         Vqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737971094; x=1738575894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsGp3DbjRPLkoj2kwFjv1+EJYiVm/DSEknC/OoKntbQ=;
        b=mZh0FHfFv2b7Nm7/Lr7Yk5efUc3noxGef0BwRNUbneqlIYnStdzSGOD39Oh+sD13TG
         +2RxrEMaIfSEXTDHj/W/S144TfOkOgcfJbbLIoyQJGhvMye+1qcM8Otr7Zzs+nU6qN1S
         oQzBQiLOIzh1IFV/MD63XlhYSZPk6nDIodxpc+il44hAm2mFrVn09EoHGsjffuo5Qwy3
         DBLA1KWpvOL/e+Uyz2DDGDJuSaRHknYm0r3c0sLZZ5V4FLreV2h5I1u2KmWyCWKY/pY8
         1GvzAYJ/eetQXRYM9SQk1pSjo48bP8ORWCQ6cX4Qr0WiyDpfpe8tMZXBkt2CHs9IyeP5
         Szow==
X-Forwarded-Encrypted: i=1; AJvYcCWwejIM8PuHlxA7H50iJLtSWxmEBstcdK1tOQ1XhL+emgWKrrFyt3JpSg+KcE+zkwESH+mBqbeHJJTEXIXImdh9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/s/zNZAtZb50SzhnWtytl8mA5gt42+A5KQWb7sAEj92gIJiL6
	CLMJFI48xfZe84WwoSGmneZTqJlfkd445NSmJ8HVrgLPqOcfpqiEM423Tl9zVig=
X-Gm-Gg: ASbGncuHA1iGsciMVFCWLEFGOfoxkLfLIY9U5AZg40A0D2xu2GmM87akexNcZY42Ulk
	y4tjI1vji0iWi5wVSv+sk/hH3mBcDrsUjV6nCENIZE4HI1L9ZP+w3QOov9NlMVbhTgLLaTKWrGk
	drxZmLYBTS9cLuCM+KeM2y/Nqc7jg+PUzhsMEXzOT7OyGCUMU8l2NErJWLJMQ4zuGqUgm/HQOov
	eNmTGZZo6QnFI4F/AkbgUT0yyXPii2aqNv/FA6hvXb9WQDmrkYdQwEIlxj8L1aRwcGEL8vjJv+3
	VfKSWeMqOMMsvKm+ReFQzKxPzlfDzGI=
X-Google-Smtp-Source: AGHT+IFDaK9cNMo23MROO6bkzC2nQlBGexsaacNWVhEd87bHI/6OEZGcK91epmkFjxQ01HSL43+DVA==
X-Received: by 2002:a05:600c:1ca9:b0:434:f297:8e78 with SMTP id 5b1f17b1804b1-438913cb65fmr390606995e9.7.1737971094091;
        Mon, 27 Jan 2025 01:44:54 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3e22:3e78:ce5a:32c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47eecasm124006275e9.6.2025.01.27.01.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:44:53 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 9/9] mm: Use common huge_ptep_clear_flush() function for riscv/arm64
Date: Mon, 27 Jan 2025 10:35:30 +0100
Message-Id: <20250127093530.19548-10-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250127093530.19548-1-alexghiti@rivosinc.com>
References: <20250127093530.19548-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_014455_512030_F310E4B2 
X-CRM114-Status: GOOD (  19.13  )
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

After some adjustments, both architectures have the same implementation
so move it to the generic code.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/hugetlb.h |  3 --
 arch/arm64/mm/hugetlbpage.c      | 61 --------------------------------
 arch/riscv/include/asm/hugetlb.h |  7 +---
 arch/riscv/mm/hugetlbpage.c      | 51 --------------------------
 include/linux/hugetlb_contpte.h  |  4 +++
 mm/hugetlb_contpte.c             | 15 ++++++++
 6 files changed, 20 insertions(+), 121 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index fd1de0caad3f..3f79e4b76711 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -35,9 +35,6 @@ static inline void arch_clear_hugetlb_flags(struct folio *folio)
 
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 #define arch_make_huge_pte arch_make_huge_pte
-#define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
-extern pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
-				   unsigned long addr, pte_t *ptep);
 
 void __init arm64_hugetlb_cma_reserve(void);
 
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 0430cb41f381..270e4580e12a 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -98,53 +98,6 @@ int find_num_contig(struct mm_struct *mm, unsigned long addr,
 	return CONT_PTES;
 }
 
-/*
- * Changing some bits of contiguous entries requires us to follow a
- * Break-Before-Make approach, breaking the whole contiguous set
- * before we can change any entries. See ARM DDI 0487A.k_iss10775,
- * "Misprogramming of the Contiguous bit", page D4-1762.
- *
- * This helper performs the break step.
- */
-static pte_t get_clear_contig(struct mm_struct *mm,
-			     unsigned long addr,
-			     pte_t *ptep,
-			     unsigned long pgsize,
-			     unsigned long ncontig)
-{
-	pte_t orig_pte = __ptep_get(ptep);
-	unsigned long i;
-
-	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++) {
-		pte_t pte = __ptep_get_and_clear(mm, addr, ptep);
-
-		/*
-		 * If HW_AFDBM is enabled, then the HW could turn on
-		 * the dirty or accessed bit for any page in the set,
-		 * so check them all.
-		 */
-		if (pte_dirty(pte))
-			orig_pte = pte_mkdirty(orig_pte);
-
-		if (pte_young(pte))
-			orig_pte = pte_mkyoung(orig_pte);
-	}
-	return orig_pte;
-}
-
-static pte_t get_clear_contig_flush(struct mm_struct *mm,
-				    unsigned long addr,
-				    pte_t *ptep,
-				    unsigned long pgsize,
-				    unsigned long ncontig)
-{
-	pte_t orig_pte = get_clear_contig(mm, addr, ptep, pgsize, ncontig);
-	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
-
-	flush_tlb_range(&vma, addr, addr + (pgsize * ncontig));
-	return orig_pte;
-}
-
 pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 		      unsigned long addr, unsigned long sz)
 {
@@ -277,20 +230,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
-			    unsigned long addr, pte_t *ptep)
-{
-	struct mm_struct *mm = vma->vm_mm;
-	size_t pgsize;
-	int ncontig;
-
-	if (!pte_cont(__ptep_get(ptep)))
-		return ptep_clear_flush(vma, addr, ptep);
-
-	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
-	return get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
-}
-
 static int __init hugetlbpage_init(void)
 {
 	if (pud_sect_supported())
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index 4c692dd82779..63c7e4fa342a 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -20,14 +20,9 @@ bool arch_hugetlb_migration_supported(struct hstate *h);
 #endif
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
-#define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
-pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
-			    unsigned long addr, pte_t *ptep);
-
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 #define arch_make_huge_pte arch_make_huge_pte
-
-#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
+#endif /* CONFIG_RISCV_ISA_SVNAPOT */
 
 #include <asm-generic/hugetlb.h>
 
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 8963a4e77742..ea1ae3a43d45 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -121,42 +121,6 @@ unsigned long hugetlb_mask_last_page(struct hstate *h)
 	return 0UL;
 }
 
-static pte_t get_clear_contig(struct mm_struct *mm,
-			      unsigned long addr,
-			      pte_t *ptep,
-			      unsigned long pte_num)
-{
-	pte_t orig_pte = ptep_get(ptep);
-	unsigned long i;
-
-	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++) {
-		pte_t pte = ptep_get_and_clear(mm, addr, ptep);
-
-		if (pte_dirty(pte))
-			orig_pte = pte_mkdirty(orig_pte);
-
-		if (pte_young(pte))
-			orig_pte = pte_mkyoung(orig_pte);
-	}
-
-	return orig_pte;
-}
-
-static pte_t get_clear_contig_flush(struct mm_struct *mm,
-				    unsigned long addr,
-				    pte_t *ptep,
-				    unsigned long pte_num)
-{
-	pte_t orig_pte = get_clear_contig(mm, addr, ptep, pte_num);
-	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
-	bool valid = !pte_none(orig_pte);
-
-	if (valid)
-		flush_tlb_range(&vma, addr, addr + (PAGE_SIZE * pte_num));
-
-	return orig_pte;
-}
-
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 {
 	unsigned long order;
@@ -173,21 +137,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
-			    unsigned long addr,
-			    pte_t *ptep)
-{
-	pte_t pte = ptep_get(ptep);
-	int pte_num;
-
-	if (!pte_napot(pte))
-		return ptep_clear_flush(vma, addr, ptep);
-
-	pte_num = arch_contpte_get_num_contig(vma->vm_mm, addr, ptep, 0, NULL);
-
-	return get_clear_contig_flush(vma->vm_mm, addr, ptep, pte_num);
-}
-
 static bool is_napot_size(unsigned long size)
 {
 	unsigned long order;
diff --git a/include/linux/hugetlb_contpte.h b/include/linux/hugetlb_contpte.h
index 02bce0ed93d8..911b9cd4aa4d 100644
--- a/include/linux/hugetlb_contpte.h
+++ b/include/linux/hugetlb_contpte.h
@@ -31,4 +31,8 @@ extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 extern void huge_ptep_set_wrprotect(struct mm_struct *mm,
 				    unsigned long addr, pte_t *ptep);
 
+#define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
+extern pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+				   unsigned long addr, pte_t *ptep);
+
 #endif /* _LINUX_HUGETLB_CONTPTE_H */
diff --git a/mm/hugetlb_contpte.c b/mm/hugetlb_contpte.c
index de505350ef48..d27c7599ce74 100644
--- a/mm/hugetlb_contpte.c
+++ b/mm/hugetlb_contpte.c
@@ -27,6 +27,7 @@
  *   - huge_ptep_get_and_clear()
  *   - huge_ptep_set_access_flags()
  *   - huge_ptep_set_wrprotect()
+ *   - huge_ptep_clear_flush()
  */
 
 pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
@@ -254,3 +255,17 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 
 	set_contptes(mm, addr, ptep, pte, ncontig, pgsize);
 }
+
+pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+			    unsigned long addr, pte_t *ptep)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	size_t pgsize;
+	int ncontig;
+
+	if (!pte_cont(__ptep_get(ptep)))
+		return ptep_clear_flush(vma, addr, ptep);
+
+	ncontig = arch_contpte_get_num_contig(mm, addr, ptep, 0, &pgsize);
+	return get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
+}
-- 
2.39.2



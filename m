Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED8AC36002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 13:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAv+4atVMvRknGVbTPj58gq6ySa46Mekau0XoGNQASg=; b=0A4jxvAzG9aOMafgDMX1tPqRuk
	aERZubQO75YDCBdodq7K0xtlq4Ed49mOl59iDsC1S3/UIE2n7ToUVdR3GESW+/RMQk0WL7HqJlVsr
	maWWlFs9LvA1SNT2w1jha/+3KxvdoaFogBxm8rW7zwm1x4kh2kDCGlKjBM6Q56m15GO3QzwseeBYx
	yA0Nb3Ek6+4r69J1OCnHiF+txxxBnyqmlcN16zYxv5mRyLiel0BqVzYuXW1qD6pcvg5jYtBK+hGgi
	QvGWW5okEt8u9ZmGCKMFnMlH6JGrwV3W4M6NqpqRlVbrHvHukfH829yGNO3gupzTWn64zf5RPh84x
	lGxGHQXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcDc-0000000EtHc-3SeM;
	Fri, 21 Mar 2025 13:15:24 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvc98-0000000Es50-1Yhw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 13:10:48 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso9110235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 06:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742562645; x=1743167445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAv+4atVMvRknGVbTPj58gq6ySa46Mekau0XoGNQASg=;
        b=mqLhF2BJDjSKTOLH1LlQNhh+5OkssbtWx27he6p+J4ozx+g0Qw4Ht4IvAr0si1Qr51
         8w4JSxw1asPouIQDimGyvZHexx9gmQqbcT4yTYzGCEG51yq74/vMRLpNgMmN8j5vsNDq
         HC4ZPprpUAjDznS7T2bd2H9/CNTVcpJud7/4J/MSXNgbFNeuD6WNKSf7rf7TjpsPeyR1
         X1F+6fcgvCed3WzGT7U24cjWyHZK4+KfhfsvHZYCYdagX8K+TSwpnwTAtmKLhj31kBKf
         3+UdW8ij84A0hhyR7Iaq7vje7F504/nJg8wdrGbdUYCzKB/v0YtEbOOgxwkgK8rSai3P
         db9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742562645; x=1743167445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAv+4atVMvRknGVbTPj58gq6ySa46Mekau0XoGNQASg=;
        b=cKwDHXe2ZfdMZ9FhQcpWv3rOUHvYu/bpHxTOiw6hMmKr+X7UDBf6HhlOhdpWNX+LRH
         Su7xp7+dLjgKjlxvbANz/b73KeniCNEZ1Y1Gx2aJCbyza9S10eMxs0RzDxLq195W1O8O
         zzU3y+6FTVKMKGyJoVdyQY0vSkNyDuHoi9qxTGcRjwPSdfSErkpBZgXxMA8FGSFH3C4w
         Z/UOMakbybF8VrxIOlKsQAd5PH7hvmWptmwUWsUWpCbL6Z1JZE4dEN/JQBLr4cHo/DLP
         iujlV/Pw6Tzk3NchpYbUEuvrqDpMVY3bvAYnE/xYG9nozbJw6IzXtQ+zbufCFSDRPCYR
         vMRA==
X-Forwarded-Encrypted: i=1; AJvYcCWbpL0svx01Lr5x2ju1v1MoBJXlCupcfjmFHkMn+AUtjDc1AjRJNh3cobmegyrZJLhBe7epZr5Xa772bXP8FUBB@lists.infradead.org
X-Gm-Message-State: AOJu0YyIHTN2mnzVoSpmE42R3ejHG0SDVRpyO/FaA5qDnOwvNPTPnGyM
	XTBTtizyfxNvAD3i1T0fDzYb0yMeXxx8Z9b1XgvrSedtHRUF0HDZQoyJZhYcKPY=
X-Gm-Gg: ASbGncul5YnXW+YXAWlHrNs8yWMKiMtYllAgeGkwd92nKZx9NOP5sRuv1FtjN3fP40S
	tRhSU5l7jiF8DEsux6csv2iSoPNy9NKhMXZbmYH5lFjfIACD9HIXvVmIXxLyZpdW1k8i5sTAe18
	zxtkJD2XQwDFnG3BX0tD7QyTNMH1/tHm4z28GGlwQWfJEeYF/SplD+qXtMh56Z/vOxmaei+AQyM
	m0NauPm4ave1SbmFPo+Mt5kV+SI9bDiEAuO2BvICtbmPtIuuGL37r4b2ORm+F8zAcVkAyUrMDd/
	tnVGkfxT0CeMsdmksqJO+5EXZ5rlLLYOWFXr5/RIELkvYGRO7kzVoGqk1b06/P7sFlSMKA==
X-Google-Smtp-Source: AGHT+IFFzxLTl7dkoWPQa6CIZER6lpnHzrVNqhIgyBgY3Y3nEtgERu0W1NS2+ffacirYXfcMWjF6NQ==
X-Received: by 2002:a05:600c:83cf:b0:439:91dd:cf9c with SMTP id 5b1f17b1804b1-43d509ec70cmr37202275e9.10.1742562644586;
        Fri, 21 Mar 2025 06:10:44 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3d12:52fe:c1cc:c94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d42b8fcd4sm47982695e9.1.2025.03.21.06.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:10:44 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 4/9] mm: Use common set_huge_pte_at() function for riscv/arm64
Date: Fri, 21 Mar 2025 14:06:30 +0100
Message-Id: <20250321130635.227011-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250321130635.227011-1-alexghiti@rivosinc.com>
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_061046_406585_2658829B 
X-CRM114-Status: GOOD (  20.61  )
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
 arch/arm64/mm/hugetlbpage.c      | 56 --------------------------------
 arch/riscv/include/asm/hugetlb.h |  5 ---
 arch/riscv/include/asm/pgtable.h | 13 ++++----
 arch/riscv/mm/hugetlbpage.c      | 50 ----------------------------
 include/linux/hugetlb_contpte.h  |  5 +++
 mm/hugetlb_contpte.c             | 56 ++++++++++++++++++++++++++++++++
 7 files changed, 68 insertions(+), 120 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 0604e01dca97..cfdc04e11585 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -35,9 +35,6 @@ static inline void arch_clear_hugetlb_flags(struct folio *folio)
 
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 #define arch_make_huge_pte arch_make_huge_pte
-#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
-extern void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
-			    pte_t *ptep, pte_t pte, unsigned long sz);
 #define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
 extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 				      unsigned long addr, pte_t *ptep,
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 60a2bb7575c1..6feb90ed2e7d 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -128,62 +128,6 @@ static pte_t get_clear_contig_flush(struct mm_struct *mm,
 	return orig_pte;
 }
 
-/*
- * Changing some bits of contiguous entries requires us to follow a
- * Break-Before-Make approach, breaking the whole contiguous set
- * before we can change any entries. See ARM DDI 0487A.k_iss10775,
- * "Misprogramming of the Contiguous bit", page D4-1762.
- *
- * This helper performs the break step for use cases where the
- * original pte is not needed.
- */
-static void clear_flush(struct mm_struct *mm,
-			     unsigned long addr,
-			     pte_t *ptep,
-			     unsigned long pgsize,
-			     unsigned long ncontig)
-{
-	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
-	unsigned long i, saddr = addr;
-
-	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
-		__ptep_get_and_clear(mm, addr, ptep);
-
-	flush_tlb_range(&vma, saddr, addr);
-}
-
-void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
-			    pte_t *ptep, pte_t pte, unsigned long sz)
-{
-	size_t pgsize;
-	int i;
-	int ncontig;
-	unsigned long pfn, dpfn;
-	pgprot_t hugeprot;
-
-	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
-
-	if (!pte_present(pte)) {
-		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
-			__set_ptes(mm, addr, ptep, pte, 1);
-		return;
-	}
-
-	if (!pte_cont(pte)) {
-		__set_ptes(mm, addr, ptep, pte, 1);
-		return;
-	}
-
-	pfn = pte_pfn(pte);
-	dpfn = pgsize >> PAGE_SHIFT;
-	hugeprot = pte_pgprot(pte);
-
-	clear_flush(mm, addr, ptep, pgsize, ncontig);
-
-	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
-		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
-}
-
 pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 		      unsigned long addr, unsigned long sz)
 {
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index 69393346ade0..7049a17b819d 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -24,11 +24,6 @@ bool arch_hugetlb_migration_supported(struct hstate *h);
 void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 		    pte_t *ptep, unsigned long sz);
 
-#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
-void set_huge_pte_at(struct mm_struct *mm,
-		     unsigned long addr, pte_t *ptep, pte_t pte,
-		     unsigned long sz);
-
 #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
 pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 			      unsigned long addr, pte_t *ptep,
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 286fe1a32ded..5b34b3c9c0f9 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -715,9 +715,8 @@ static inline pte_t pte_napot_clear_pfn(pte_t *ptep, pte_t pte)
 	return pte;
 }
 
-#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
-static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
-				       unsigned long address, pte_t *ptep)
+static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
+					 unsigned long address, pte_t *ptep)
 {
 	pte_t pte = __pte(atomic_long_xchg((atomic_long_t *)ptep, 0));
 
@@ -775,9 +774,8 @@ static inline void __set_ptes(struct mm_struct *mm, unsigned long addr,
 #define set_ptes			___set_ptes
 #define __set_ptes			___set_ptes
 
-#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
-static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
-				       unsigned long address, pte_t *ptep)
+static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
+					 unsigned long address, pte_t *ptep)
 {
 	pte_t pte = __pte(atomic_long_xchg((atomic_long_t *)ptep, 0));
 
@@ -787,6 +785,9 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 }
 #endif /* CONFIG_RISCV_ISA_SVNAPOT */
 
+#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
+#define ptep_get_and_clear	__ptep_get_and_clear
+
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
 {
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index b9eb6b7b214d..75faeacc8138 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -176,56 +176,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-static void clear_flush(struct mm_struct *mm,
-			unsigned long addr,
-			pte_t *ptep,
-			unsigned long pgsize,
-			unsigned long ncontig)
-{
-	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
-	unsigned long i, saddr = addr;
-
-	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
-		ptep_get_and_clear(mm, addr, ptep);
-
-	flush_tlb_range(&vma, saddr, addr);
-}
-
-/*
- * When dealing with NAPOT mappings, the privileged specification indicates that
- * "if an update needs to be made, the OS generally should first mark all of the
- * PTEs invalid, then issue SFENCE.VMA instruction(s) covering all 4 KiB regions
- * within the range, [...] then update the PTE(s), as described in Section
- * 4.2.1.". That's the equivalent of the Break-Before-Make approach used by
- * arm64.
- */
-void set_huge_pte_at(struct mm_struct *mm,
-		     unsigned long addr,
-		     pte_t *ptep,
-		     pte_t pte,
-		     unsigned long sz)
-{
-	size_t pgsize;
-	int i, pte_num;
-
-	pte_num = arch_contpte_get_num_contig(ptep, sz, &pgsize);
-
-	if (!pte_present(pte)) {
-		for (i = 0; i < pte_num; i++, ptep++, addr += pgsize)
-			set_ptes(mm, addr, ptep, pte, 1);
-		return;
-	}
-
-	if (!pte_napot(pte)) {
-		set_ptes(mm, addr, ptep, pte, 1);
-		return;
-	}
-
-	clear_flush(mm, addr, ptep, pgsize, pte_num);
-
-	set_ptes(mm, addr, ptep, pte, pte_num);
-}
-
 int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 			       unsigned long addr,
 			       pte_t *ptep,
diff --git a/include/linux/hugetlb_contpte.h b/include/linux/hugetlb_contpte.h
index 2ea17e4fe36b..135b68bd09ca 100644
--- a/include/linux/hugetlb_contpte.h
+++ b/include/linux/hugetlb_contpte.h
@@ -9,4 +9,9 @@
 #define __HAVE_ARCH_HUGE_PTEP_GET
 extern pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
 
+#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
+extern void set_huge_pte_at(struct mm_struct *mm,
+			    unsigned long addr, pte_t *ptep, pte_t pte,
+			    unsigned long sz);
+
 #endif /* _LINUX_HUGETLB_CONTPTE_H */
diff --git a/mm/hugetlb_contpte.c b/mm/hugetlb_contpte.c
index 500d0b96a680..cbf93ffcd882 100644
--- a/mm/hugetlb_contpte.c
+++ b/mm/hugetlb_contpte.c
@@ -30,3 +30,59 @@ pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 	}
 	return orig_pte;
 }
+
+/*
+ * ARM64: Changing some bits of contiguous entries requires us to follow a
+ * Break-Before-Make approach, breaking the whole contiguous set
+ * before we can change any entries. See ARM DDI 0487A.k_iss10775,
+ * "Misprogramming of the Contiguous bit", page D4-1762.
+ *
+ * RISCV: When dealing with NAPOT mappings, the privileged specification
+ * indicates that "if an update needs to be made, the OS generally should first
+ * mark all of the PTEs invalid, then issue SFENCE.VMA instruction(s) covering
+ * all 4 KiB regions within the range, [...] then update the PTE(s), as
+ * described in Section 4.2.1.". That's the equivalent of the Break-Before-Make
+ * approach used by arm64.
+ *
+ * This helper performs the break step for use cases where the
+ * original pte is not needed.
+ */
+static void clear_flush(struct mm_struct *mm,
+			unsigned long addr,
+			pte_t *ptep,
+			unsigned long pgsize,
+			unsigned long ncontig)
+{
+	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
+	unsigned long i, saddr = addr;
+
+	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
+		__ptep_get_and_clear(mm, addr, ptep);
+
+	flush_tlb_range(&vma, saddr, addr);
+}
+
+void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+		     pte_t *ptep, pte_t pte, unsigned long sz)
+{
+	size_t pgsize;
+	int i;
+	int ncontig;
+
+	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
+
+	if (!pte_present(pte)) {
+		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
+			__set_ptes(mm, addr, ptep, pte, 1);
+		return;
+	}
+
+	if (!pte_cont(pte)) {
+		__set_ptes(mm, addr, ptep, pte, 1);
+		return;
+	}
+
+	clear_flush(mm, addr, ptep, pgsize, ncontig);
+
+	set_contptes(mm, addr, ptep, pte, ncontig, pgsize);
+}
-- 
2.39.2



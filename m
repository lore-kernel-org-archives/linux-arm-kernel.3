Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEF6C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 09:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mhN3d8PsNley3p53cGFp5ftMvicJk5x5kFgKHD2MsE=; b=TES7drWqee7RkpoCMBS4xjuDFc
	b9B+A4FSsrOxFtkkD05fO7X9c7SQu9H2lrhoJze9APoZdeSTyM0HjPmsZD7WKnu4ReWyLb1EhV2gJ
	W2AT1/yHVpj3dP5BwvO6byhJQzm+nES2uRBMeyRu6ThGHzvaw4H1648HZHIGm9bGAPuu0sGugmbZQ
	TBF60wBAj7PL2X+6rhp0MVTAlUG17KWzgH60umaK6qRpLCt6TS9fRb6iRL1aaaVgugLDON0/bSDeI
	shv6KH0KckxgrrhA3wzdPI7Cc3M6eHNWICd10KtMYtOSB1PL9k+ejprvadjqMogpfm6yxbmJxiPPY
	ImewAddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLdF-000000022kx-156O;
	Mon, 27 Jan 2025 09:42:13 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLau-0000000222q-05M1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 09:39:50 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3863494591bso2290285f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 01:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737970786; x=1738575586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mhN3d8PsNley3p53cGFp5ftMvicJk5x5kFgKHD2MsE=;
        b=IMNnKrnnV7BVNJsFCWovMrK584DQJS+CvUyj9NF6EUDy+eUb1hA88Mva3eEThOiQA0
         U5WbjO55HH6ebGd0UH5Mvx6oqBz64JVGZ/WwQqfsX4HsaEDL0nHdpI1OKfBw/YWqrqjg
         RwSFPTmyi5e3eX5x3uUbmbymO90sbbiZpcAvgS9TnnqFq821kCLbXtve+sd0ZC1ZBiYb
         +2OU+dgjFnvKZAjOLTf4yN+77KOG5QGCPbLJlgjNIVVPkGL2z23IqiBPgbBfQEWiQ9dS
         GjL5QDNVRkInxEPBdKkc4l2zttSIq/aA3TWyPu+UoRMg5PQICUe8g9tBT//PN38lV650
         zfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737970786; x=1738575586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mhN3d8PsNley3p53cGFp5ftMvicJk5x5kFgKHD2MsE=;
        b=Dmtizjbx+LqEzOVSxpTj/ZZgx20FxwhtDH4ZRrnADuMa5ofBexFLouL7eT5/lFqZC+
         eyCtVvr1DnSZgayOcm045Fubx2R4GBHXzUyUNElbKjKnnRvP4fmXeoBKTNOUaBYTGzWJ
         XStJTwYKUMmq4kMJ6FBbwaNCmwtjMIQ/XNxtVq3EGYuquM9PWeiKZqMvZBzex3Uulcyz
         7i8yiBtGruBP4Kf3cMgucUBbdnQTyWheNmsi7CAHiAbbdwjLSagWIq6QJ54Ii3cuVRv2
         oSfYQMMFQIOCpSs+66jiODlc89SpmA2gVT84q+o2ljL0FmJuO2tD6jEZGaCquwCknc1b
         guug==
X-Forwarded-Encrypted: i=1; AJvYcCUREs8fjckclebK1DxoFQsamoHMXoslnNa4IFbzIC0Vvtg1O/F4BxucMDx4+f1lQ/Ar22o0G4T1Xq4h/5tw5dyu@lists.infradead.org
X-Gm-Message-State: AOJu0YytMbCRWtxbtlEFzUqMSv+vQcyxDzS59wlvA5DnwBxLyom014/u
	YusSIMSz3wCYJuiL0sOn8eTgETj35AjpWFhUM4K97yvUMuyI292d10jeiEQypPo=
X-Gm-Gg: ASbGncsQsPH6vQr5fO4Eg41KOaDb708MWcuz8VC95pxsJDqwcOd0wJNMtC1q1O3TnJE
	+ESdI0iDG86db6nM2/wa9JVYBJZNsJBuVnFEEjiCVhNsvep8C8ZJY5guSAO71J6uj+RRKTkU6Yp
	0HxDtUmlZmDuXeR7gPeOEv9Q28RzRpV0494CrVmrU+An6vqZ9SOnEMndHX3xXxSS8bnWrhm6+Zd
	4qMqRD6g4pM4JlQx7sXJkXncJEQEAaAudK2iUota7aQiB8Vy6ysOKsg6LlakQvq1UnEfqGbw/ds
	zTYcMe5d+QeGE0OOt/Y1VNRXPSmATQ4=
X-Google-Smtp-Source: AGHT+IFb60eslNQdePOaLfXv36Z0OpFdyDEXUXYChc5sJwAPhp8i6cvPTkFCm9BP5tmum6xqjAkWnA==
X-Received: by 2002:a05:6000:4022:b0:385:e013:73f6 with SMTP id ffacd0b85a97d-38bf59eff21mr37315469f8f.50.1737970786287;
        Mon, 27 Jan 2025 01:39:46 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3e22:3e78:ce5a:32c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb040sm10590537f8f.67.2025.01.27.01.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:39:46 -0800 (PST)
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
Subject: [PATCH v4 4/9] mm: Use common set_huge_pte_at() function for riscv/arm64
Date: Mon, 27 Jan 2025 10:35:25 +0100
Message-Id: <20250127093530.19548-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250127093530.19548-1-alexghiti@rivosinc.com>
References: <20250127093530.19548-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_013948_064005_522AB430 
X-CRM114-Status: GOOD (  21.60  )
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
 arch/arm64/mm/hugetlbpage.c      | 56 -----------------------------
 arch/riscv/include/asm/hugetlb.h |  5 ---
 arch/riscv/include/asm/pgtable.h |  8 +++--
 arch/riscv/mm/hugetlbpage.c      | 62 --------------------------------
 include/linux/hugetlb_contpte.h  |  5 +++
 mm/hugetlb_contpte.c             | 59 ++++++++++++++++++++++++++++++
 7 files changed, 69 insertions(+), 129 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 27d7f4bdd724..40d87a563093 100644
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
index 3458461adb90..02de680a6a0d 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -145,62 +145,6 @@ static pte_t get_clear_contig_flush(struct mm_struct *mm,
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
index d9f9bfb84908..28cbf5d761e1 100644
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
 			      unsigned long addr, pte_t *ptep);
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index d4e6427b8ca9..74d29d0af172 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -634,9 +634,8 @@ extern int ptep_set_access_flags(struct vm_area_struct *vma, unsigned long addre
 extern int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long address,
 				     pte_t *ptep);
 
-#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
-static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
-				       unsigned long address, pte_t *ptep)
+static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
+					 unsigned long address, pte_t *ptep)
 {
 	pte_t pte = __pte(atomic_long_xchg((atomic_long_t *)ptep, 0));
 
@@ -736,6 +735,9 @@ static inline pte_t ptep_get(pte_t *ptep)
 #define ptep_get			__ptep_get
 #endif /* CONFIG_RISCV_ISA_SVNAPOT */
 
+#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
+#define ptep_get_and_clear	__ptep_get_and_clear
+
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
 {
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index d51863824540..0ecb2846c3f0 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -173,68 +173,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
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
-	unsigned long hugepage_shift, pgsize;
-	int i, pte_num;
-
-	if (sz >= PGDIR_SIZE)
-		hugepage_shift = PGDIR_SHIFT;
-	else if (sz >= P4D_SIZE)
-		hugepage_shift = P4D_SHIFT;
-	else if (sz >= PUD_SIZE)
-		hugepage_shift = PUD_SHIFT;
-	else if (sz >= PMD_SIZE)
-		hugepage_shift = PMD_SHIFT;
-	else
-		hugepage_shift = PAGE_SHIFT;
-
-	pte_num = sz >> hugepage_shift;
-	pgsize = 1 << hugepage_shift;
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
index ec4189cd65b8..7acd734a75e8 100644
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
index a03e91d3efb1..677d714fd10d 100644
--- a/mm/hugetlb_contpte.c
+++ b/mm/hugetlb_contpte.c
@@ -10,6 +10,8 @@
 /*
  * Any arch that wants to use that needs to define:
  *   - __ptep_get()
+ *   - __set_ptes()
+ *   - __ptep_get_and_clear()
  *   - pte_cont()
  *   - arch_contpte_get_num_contig()
  */
@@ -17,6 +19,7 @@
 /*
  * This file implements the following contpte aware API:
  *   - huge_ptep_get()
+ *   - set_huge_pte_at()
  */
 
 pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
@@ -42,3 +45,59 @@ pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C720C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 09:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Ib7BO4DbRcQ5HoSRv1ee1R7qySu3xzgQBO2hzqpTQY=; b=Z+IyIu16c7JlkBNcrKrVa987ik
	3jDvO8DWM5HmnLw3umMKBoHINpTS1nrGlUyPN2R1gHRLAzkdqM8cXu7c0MM9KZ30nV1fvLAMNDgDk
	gwI+M8+t9kM6lpn3VL/0ONRuxLFr+zA0aPm2r/xReMlNusnXaposa9XxXX4qYgQuP2WHBWCpGnBgI
	FSE0KSI2KjsnmSbcye3tkVZzfTolvKN70r/gBgE6B6zFaskAVZVqHPOOgqmXsr/IRnZcTvy9Wsf+g
	b5p8JLurQVIy7528zrsDoo86h+fd3x9scs2AWD4FHlRcsAxWZWmTGXg2axEFiCV/5Npzxaxss5zmy
	J2j1bAhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLfq-000000023Rl-1ufO;
	Mon, 27 Jan 2025 09:44:54 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLct-000000022en-0DGn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 09:41:52 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4361f796586so45242155e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 01:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737970909; x=1738575709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ib7BO4DbRcQ5HoSRv1ee1R7qySu3xzgQBO2hzqpTQY=;
        b=0C9TUI3yxLa/ppsGi0hDrXgYW1ecu38qmn/GaXSgthjXL8ao+UBfCNFSmpwXNpplsK
         84Bm2EqjHn/ga/vIDdPLWpIeQUAG4I6Lo4ddX/3iCeYcLAls5/OGzygBqW75p9OlPV+J
         u+SsqZwOFKGFfiH+TEYTPzlqOg9zQGF/jBdDdBbPsM5jU8NpLX/8dhJE3AtoxhjBD9+t
         mUnd5EkN4luc1b6Bv9hQD3r1AsPtn6S6mKTJFD+DCqgSbNSwqF63Tp2V82XbtVfAtcEg
         FMvodncgwP2ZVbo47kbvgEKaRNDwR1XamhCZ+WZjCj4Vsnkt07/QvXCYLvgGEvx7L8rr
         k61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737970909; x=1738575709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Ib7BO4DbRcQ5HoSRv1ee1R7qySu3xzgQBO2hzqpTQY=;
        b=E+fYJ4uFlyfwI8ixT/e0Rl8FAX4QoJq5IOrbX0lvMySFppWmXP7QlFvQlfE32Q8sqm
         49G0T1PG2t9g6XhttvoNoTH5sXf2GK7Vm/tKPgP5E3fbOGhL1FBetRgXH5/sB1Hgzphc
         mHQMvCctmsDTwVUnpvd+7Y1ZkizuUqKdpD13GQfa7+j+8NQsndAQP++8qlLkCTyZ7XH0
         CZ3AqW811FyXp7SldtibiMSXlefXQqwkIsYF7tsi3zlKk0cayd6l9qZcigtjDJP1nt/I
         HPQcxNLOhgo3LRv1OcpU3T5pHL3YdR4kO9urVg1/i/scGXRA41KMkJ/zmNBQaW38lmhw
         kbag==
X-Forwarded-Encrypted: i=1; AJvYcCUbMDQc+aRl0KQRFvgPrM37OCmimtjBnKJTz9BJ5ECj8rHimNvKs7mUl7Qvq4Yj03AUmKbFUirYvN4Ud2szK4Zi@lists.infradead.org
X-Gm-Message-State: AOJu0YxCe/O+VZUPxo3f48Yf3rLC5vrYdX8noy3SXsNxU4wpaYM3DoPJ
	PnYiUN5K+8/Hpkyv+qV2rka6hjLBW25PrDgMp2O7LABE8eRpSPf84sE3y11cjjs=
X-Gm-Gg: ASbGncuSM4EGrDuXp+6NfGrZu7EuL+sNlRz7gaqOaR+Qj3TSlBYtavW2a4roQ9Z+ncp
	ge8iWh5AFrScn1PStl4eXFrA3TqifF0NhmSzroFQWZnZNHJ5juq481mbQiEvpsiqvODMvdCuoiL
	ujKa+ezYa/hZnoqa2hIEnm0pdfqLLJD6DI58XU3RxK9zyD1jKA4Dt90n0Ru5fXfNUyLscqzYfNT
	Bz+kqkVLLdUJr0Y6Fw7dXcUH2Ix876JRp8v2NaxKLRBSTZu7cz/NuNxYGJAgF7Ta9jCDF8R6XeZ
	KWuz42MnHM2inpw8wRVssozuTv9JA4A=
X-Google-Smtp-Source: AGHT+IE0wvAkHX9Lz2nK7eyxGx0auM1eq+y4AS6IYBZCccECBQROh0UBY1MLjeLntJwSdARX6LIQ6w==
X-Received: by 2002:a5d:64a3:0:b0:385:f909:eb2c with SMTP id ffacd0b85a97d-38bf57a77a2mr48324115f8f.38.1737970909255;
        Mon, 27 Jan 2025 01:41:49 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3e22:3e78:ce5a:32c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c42fcsm10707051f8f.96.2025.01.27.01.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:41:49 -0800 (PST)
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
Subject: [PATCH v4 6/9] mm: Use common huge_ptep_get_and_clear() function for riscv/arm64
Date: Mon, 27 Jan 2025 10:35:27 +0100
Message-Id: <20250127093530.19548-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250127093530.19548-1-alexghiti@rivosinc.com>
References: <20250127093530.19548-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_014151_090576_966600C9 
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

Note that get_clear_contig() function is duplicated in the generic and
the arm64 code because it is still used by some arm64 functions that
will, in the next commits, be moved to the generic code. Once all have
been moved, the arm64 version will be removed.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/hugetlb.h |  3 --
 arch/arm64/include/asm/pgtable.h | 15 ++++++++--
 arch/arm64/mm/hugetlbpage.c      | 19 ++-----------
 arch/riscv/include/asm/hugetlb.h |  4 ---
 arch/riscv/include/asm/pgtable.h |  4 ++-
 arch/riscv/mm/hugetlbpage.c      | 23 ++++-----------
 include/linux/hugetlb_contpte.h  |  4 +++
 mm/hugetlb_contpte.c             | 48 ++++++++++++++++++++++++++++++--
 8 files changed, 72 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index e4acaedea149..5c605a0a2017 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -39,9 +39,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 				      unsigned long addr, pte_t *ptep,
 				      pte_t pte, int dirty);
-#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
-extern pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
-				     unsigned long addr, pte_t *ptep);
 #define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
 extern void huge_ptep_set_wrprotect(struct mm_struct *mm,
 				    unsigned long addr, pte_t *ptep);
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index cebbfcfb0e53..c339b568ac51 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1831,12 +1831,23 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
 
 #endif /* CONFIG_ARM64_CONTPTE */
 
-static inline int arch_contpte_get_num_contig(pte_t *ptep,
-					      unsigned long size,
+extern int find_num_contig(struct mm_struct *mm, unsigned long addr,
+			   pte_t *ptep, size_t *pgsize);
+
+static inline int arch_contpte_get_num_contig(struct mm_struct *mm,
+					      unsigned long addr,
+					      pte_t *ptep, unsigned long size,
 					      size_t *pgsize)
 {
 	int contig_ptes = 0;
 
+	/*
+	 * If the size is not passed, we need to go through the page table to
+	 * find out the number of contiguous ptes.
+	 */
+	if (size == 0)
+		return find_num_contig(mm, addr, ptep, pgsize);
+
 	if (pgsize)
 		*pgsize = size;
 
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 541358f50b64..0b7a53fee55d 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -79,8 +79,8 @@ bool arch_hugetlb_migration_supported(struct hstate *h)
 }
 #endif
 
-static int find_num_contig(struct mm_struct *mm, unsigned long addr,
-			   pte_t *ptep, size_t *pgsize)
+int find_num_contig(struct mm_struct *mm, unsigned long addr,
+		    pte_t *ptep, size_t *pgsize)
 {
 	pgd_t *pgdp = pgd_offset(mm, addr);
 	p4d_t *p4dp;
@@ -277,21 +277,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
-			      unsigned long addr, pte_t *ptep)
-{
-	int ncontig;
-	size_t pgsize;
-	pte_t orig_pte = __ptep_get(ptep);
-
-	if (!pte_cont(orig_pte))
-		return __ptep_get_and_clear(mm, addr, ptep);
-
-	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
-
-	return get_clear_contig(mm, addr, ptep, pgsize, ncontig);
-}
-
 /*
  * huge_ptep_set_access_flags will update access flags (dirty, accesssed)
  * and write permission.
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index ca9930cdf2e6..0fbb6b19df79 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -20,10 +20,6 @@ bool arch_hugetlb_migration_supported(struct hstate *h);
 #endif
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
-#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
-pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
-			      unsigned long addr, pte_t *ptep);
-
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 			    unsigned long addr, pte_t *ptep);
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 08b24c0a579b..705d666e014d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -590,7 +590,9 @@ static inline void __set_ptes(struct mm_struct *mm, unsigned long addr,
 }
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
-static inline int arch_contpte_get_num_contig(pte_t *ptep, unsigned long size,
+static inline int arch_contpte_get_num_contig(struct mm_struct *mm,
+					      unsigned long addr,
+					      pte_t *ptep, unsigned long size,
 					      size_t *pgsize)
 {
 	unsigned long hugepage_shift;
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index e2093e7266a5..b44023336fd9 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -186,7 +186,8 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	if (!pte_napot(pte))
 		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
 
-	pte_num = arch_contpte_get_num_contig(ptep, 0, NULL);
+	pte_num = arch_contpte_get_num_contig(vma->vm_mm, addr, ptep, 0, NULL);
+
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
 	if (pte_dirty(orig_pte))
@@ -200,21 +201,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	return true;
 }
 
-pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
-			      unsigned long addr,
-			      pte_t *ptep)
-{
-	pte_t orig_pte = ptep_get(ptep);
-	int pte_num;
-
-	if (!pte_napot(orig_pte))
-		return ptep_get_and_clear(mm, addr, ptep);
-
-	pte_num = arch_contpte_get_num_contig(ptep, 0, NULL);
-
-	return get_clear_contig(mm, addr, ptep, pte_num);
-}
-
 void huge_ptep_set_wrprotect(struct mm_struct *mm,
 			     unsigned long addr,
 			     pte_t *ptep)
@@ -228,7 +214,8 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 		return;
 	}
 
-	pte_num = arch_contpte_get_num_contig(ptep, 0, NULL);
+	pte_num = arch_contpte_get_num_contig(mm, addr, ptep, 0, NULL);
+
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
 	orig_pte = pte_wrprotect(orig_pte);
@@ -246,7 +233,7 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 	if (!pte_napot(pte))
 		return ptep_clear_flush(vma, addr, ptep);
 
-	pte_num = arch_contpte_get_num_contig(ptep, 0, NULL);
+	pte_num = arch_contpte_get_num_contig(vma->vm_mm, addr, ptep, 0, NULL);
 
 	return get_clear_contig_flush(vma->vm_mm, addr, ptep, pte_num);
 }
diff --git a/include/linux/hugetlb_contpte.h b/include/linux/hugetlb_contpte.h
index d9892a047b2b..20d3a3e14e14 100644
--- a/include/linux/hugetlb_contpte.h
+++ b/include/linux/hugetlb_contpte.h
@@ -18,4 +18,8 @@ extern void set_huge_pte_at(struct mm_struct *mm,
 extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 			   pte_t *ptep, unsigned long sz);
 
+#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
+extern pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
+				     unsigned long addr, pte_t *ptep);
+
 #endif /* _LINUX_HUGETLB_CONTPTE_H */
diff --git a/mm/hugetlb_contpte.c b/mm/hugetlb_contpte.c
index c76d6b3d0121..0c86c6f77c29 100644
--- a/mm/hugetlb_contpte.c
+++ b/mm/hugetlb_contpte.c
@@ -22,6 +22,7 @@
  *   - huge_ptep_get()
  *   - set_huge_pte_at()
  *   - huge_pte_clear()
+ *   - huge_ptep_get_and_clear()
  */
 
 pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
@@ -32,7 +33,7 @@ pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 	if (!pte_present(orig_pte) || !pte_cont(orig_pte))
 		return orig_pte;
 
-	ncontig = arch_contpte_get_num_contig(ptep,
+	ncontig = arch_contpte_get_num_contig(mm, addr, ptep,
 					      page_size(pte_page(orig_pte)),
 					      NULL);
 
@@ -86,7 +87,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 	int i;
 	int ncontig;
 
-	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
+	ncontig = arch_contpte_get_num_contig(mm, addr, ptep, sz, &pgsize);
 
 	if (!pte_present(pte)) {
 		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
@@ -110,8 +111,49 @@ void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 	int i, ncontig;
 	size_t pgsize;
 
-	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
+	ncontig = arch_contpte_get_num_contig(mm, addr, ptep, sz, &pgsize);
 
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
 		__pte_clear(mm, addr, ptep);
 }
+
+static pte_t get_clear_contig(struct mm_struct *mm,
+			      unsigned long addr,
+			      pte_t *ptep,
+			      unsigned long pgsize,
+			      unsigned long ncontig)
+{
+	pte_t orig_pte = __ptep_get(ptep);
+	unsigned long i;
+
+	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++) {
+		pte_t pte = __ptep_get_and_clear(mm, addr, ptep);
+
+		/*
+		 * If HW_AFDBM (arm64) or Svadu (riscv) is enabled, then the HW
+		 * could turn on the dirty or accessed bit for any page in the
+		 * set, so check them all.
+		 */
+		if (pte_dirty(pte))
+			orig_pte = pte_mkdirty(orig_pte);
+
+		if (pte_young(pte))
+			orig_pte = pte_mkyoung(orig_pte);
+	}
+	return orig_pte;
+}
+
+pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
+			      unsigned long addr, pte_t *ptep)
+{
+	int ncontig;
+	size_t pgsize;
+	pte_t orig_pte = __ptep_get(ptep);
+
+	if (!pte_cont(orig_pte))
+		return __ptep_get_and_clear(mm, addr, ptep);
+
+	ncontig = arch_contpte_get_num_contig(mm, addr, ptep, 0, &pgsize);
+
+	return get_clear_contig(mm, addr, ptep, pgsize, ncontig);
+}
-- 
2.39.2



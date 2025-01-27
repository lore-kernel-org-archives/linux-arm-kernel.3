Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21845C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 09:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pa3kN5Pj/U9dm1V/qwQhRimY+zw1O6zUoccW70uHpSw=; b=hym6MiLz1QqC2/OdzbmE5yBMLg
	68CqULG0k7wm/hOm9KQ2lS/Oc+5G5jzImrmfJsGDP9FgsvXrr93IFgkHULwG9c6TVtkmuIeT4qicJ
	QCxxVmzcOF1C7G2+U/I0Zj7kt0ivk/9leRtDqPfz2gPhz4z7p5w1MlxPDfxckLvOygQhMerbuIacF
	V5HLAbDGHONfntosMWMLwGJF04VSgkgdt6mcsope8OfB6FjfN2wZzUJ4eUsk4JJSX1emLGr8Ud9YS
	CTN6RexTjBCYDNah/OUcVcQ34x+6UDuyk2Q/sU2vYT5Xff1rDrLXhleLsBIyYWHF6Gk4tim5NvIcf
	WGEL4jbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLag-000000021yB-49Ci;
	Mon, 27 Jan 2025 09:39:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLYu-000000021a1-09Ip
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 09:37:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso44708255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 01:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737970662; x=1738575462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pa3kN5Pj/U9dm1V/qwQhRimY+zw1O6zUoccW70uHpSw=;
        b=VmJpENrpN+vkDYTmpDYsIe4wB6gvavnoG9JYIy73Q0cmbhOXQYGKQ8eeFI9x9Jq8cR
         rxPYO4rLswF3o3OZVR5W2/cTB70etlDHjrMe/yF4yVTwH3xCMJkqVhjhZ+J1ttLktF5l
         s2suiG7hrWPFNCip3y0ZfhiFxEndnaO3eke7nsZML+ih08gL4LYFjUdzc12P1KLeJ+jD
         r708VaV05rDGoJ3MSDNwrSA9w6nTzTe3EJRDA5iyJnZGC6irEL6QiJFCvbtHM86NMkMx
         fNMOkVNDW8Q1p7G4k4ntajurS0wz2csCIJ8EXL49vRv+upuu9FsJjiLIo9/TGsfa5266
         QtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737970662; x=1738575462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pa3kN5Pj/U9dm1V/qwQhRimY+zw1O6zUoccW70uHpSw=;
        b=PNJH7zh61Qn9Z3RvQ7iTtgVlW0TESWZ2UKFqjoGobV3/dZ3AV0l/nbTR/hLkPIAspk
         poUxvy3tyZRp3Bie2LaeA+8BWub/6HN8oyDCi26u9irDLblh/FBl6E6E40ybjLPomY1o
         MVU2aoPCwasx9qjPIVsz/nmwcl+pvhpvJtOBb1jsSagz9/UNPFoRHYCDreU8WpprFHjQ
         ElFNWNMP91fVNfJo0oHL9pHmkOPtW4Piy7tajd0j64RMzZuEGN8tR7QA2j6gHO+2KsGX
         nghnZZjDHBCWHIyPZiUngx+u2Z2YJ9WyCNaSsm58ghFdAoUkr2lUnZ+4p553XmwgvNWd
         /UyA==
X-Forwarded-Encrypted: i=1; AJvYcCXm4tvPLElQ9kY9BQWibCgfQBw7t4agXSwH+TColBCiTWCrLvN0TNn4D5/qO8NxebjKByxQISmVWW4KBmZztLnh@lists.infradead.org
X-Gm-Message-State: AOJu0YwFY9M+gzdMsz6nFsdBKQHXpFVlUxRg4PmhzuEPtquC3vujybt/
	oTXXDz9no4i3rhaVdy0WvHC5N7XaUQqoZi1x0F0RdCr4J/gMoMmBMb/Nk7Gvpf4=
X-Gm-Gg: ASbGncuFS3R8Fzk7uNQfOMCjlcLvNtiVb18Fiat/FEVJ4m1eS9bvXH4gJitC5tQpenx
	XtAVXmuqq6hSMM1OladCIb/WDzWqI5iUsgacEBX9tz5eMwXBnKxE8d+DoFGprZIffHSHqbjut5e
	7O3qVvj0PCqnqybIh9Lr8yPfid/Dpzo/Tz5QkhO+JkMysbTK7gSGarEpEI7MoFfW2TfVj4db+I3
	AD35lPWw5tA9o7fDenThaioThzh5RcjU2wMaiU6QTvKq5zd5sAvKl38hPNaboQVGXYIZHPbHS5I
	1tmgMkEYopDlCyz6U3kTGolstCp9jis=
X-Google-Smtp-Source: AGHT+IHlygR1Rem42sW1brqnRYg+b7cppikaFDk94wrGvPPrCI76J4t5Wx9vdAYW3HFrhkgLyStnBg==
X-Received: by 2002:a05:600c:4f05:b0:434:fe62:28c1 with SMTP id 5b1f17b1804b1-438913ef83bmr346516855e9.18.1737970662539;
        Mon, 27 Jan 2025 01:37:42 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3e22:3e78:ce5a:32c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b1718741sm100844135e9.0.2025.01.27.01.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:37:42 -0800 (PST)
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
Subject: [PATCH v4 2/9] riscv: Restore the pfn in a NAPOT pte when manipulated by core mm code
Date: Mon, 27 Jan 2025 10:35:23 +0100
Message-Id: <20250127093530.19548-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250127093530.19548-1-alexghiti@rivosinc.com>
References: <20250127093530.19548-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_013744_074995_FBEF5548 
X-CRM114-Status: GOOD (  26.28  )
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

The core mm code expects to be able to extract the pfn from a pte. NAPOT
mappings work differently since its ptes actually point to the first pfn
of the mapping, the other bits being used to encode the size of the
mapping.

So modify ptep_get() so that it returns a pte value that contains the
*real* pfn (which is then different from what the HW expects) and right
before storing the ptes to the page table, reset the pfn LSBs to the
size of the mapping.

And make sure that all NAPOT mappings are set using set_ptes().

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable-64.h | 11 ++++
 arch/riscv/include/asm/pgtable.h    | 91 ++++++++++++++++++++++++++---
 arch/riscv/mm/hugetlbpage.c         |  9 +--
 3 files changed, 96 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 0897dd99ab8d..cddbe426f618 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -104,6 +104,17 @@ enum napot_cont_order {
 #define napot_cont_mask(order)	(~(napot_cont_size(order) - 1UL))
 #define napot_pte_num(order)	BIT(order)
 
+static inline bool is_napot_order(unsigned int order)
+{
+	unsigned int napot_order;
+
+	for_each_napot_order(napot_order)
+		if (order == napot_order)
+			return true;
+
+	return false;
+}
+
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
 #define HUGE_MAX_HSTATE		(2 + (NAPOT_ORDER_MAX - NAPOT_CONT_ORDER_BASE))
 #else
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 050fdc49b5ad..82b264423b25 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -296,6 +296,8 @@ static inline unsigned long pte_napot(pte_t pte)
 	return pte_val(pte) & _PAGE_NAPOT;
 }
 
+#define pte_valid_napot(pte)	(pte_present(pte) && pte_napot(pte))
+
 static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
 {
 	int pos = order - 1 + _PAGE_PFN_SHIFT;
@@ -305,6 +307,12 @@ static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
 	return __pte((pte_val(pte) & napot_mask) | napot_bit | _PAGE_NAPOT);
 }
 
+/* pte at entry must *not* encode the mapping size in the pfn LSBs. */
+static inline pte_t pte_clear_napot(pte_t pte)
+{
+	return __pte(pte_val(pte) & ~_PAGE_NAPOT);
+}
+
 #else
 
 static __always_inline bool has_svnapot(void) { return false; }
@@ -314,17 +322,14 @@ static inline unsigned long pte_napot(pte_t pte)
 	return 0;
 }
 
+#define pte_valid_napot(pte)	false
+
 #endif /* CONFIG_RISCV_ISA_SVNAPOT */
 
 /* Yields the page frame number (PFN) of a page table entry */
 static inline unsigned long pte_pfn(pte_t pte)
 {
-	unsigned long res  = __page_val_to_pfn(pte_val(pte));
-
-	if (has_svnapot() && pte_napot(pte))
-		res = res & (res - 1UL);
-
-	return res;
+	return __page_val_to_pfn(pte_val(pte));
 }
 
 #define pte_page(x)     pfn_to_page(pte_pfn(x))
@@ -559,8 +564,13 @@ static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
 
 #define PFN_PTE_SHIFT		_PAGE_PFN_SHIFT
 
-static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
-		pte_t *ptep, pte_t pteval, unsigned int nr)
+static inline pte_t __ptep_get(pte_t *ptep)
+{
+	return READ_ONCE(*ptep);
+}
+
+static inline void __set_ptes(struct mm_struct *mm, unsigned long addr,
+			      pte_t *ptep, pte_t pteval, unsigned int nr)
 {
 	page_table_check_ptes_set(mm, ptep, pteval, nr);
 
@@ -569,10 +579,13 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		if (--nr == 0)
 			break;
 		ptep++;
+
+		if (unlikely(pte_valid_napot(pteval)))
+			continue;
+
 		pte_val(pteval) += 1 << _PAGE_PFN_SHIFT;
 	}
 }
-#define set_ptes set_ptes
 
 static inline void pte_clear(struct mm_struct *mm,
 	unsigned long addr, pte_t *ptep)
@@ -627,6 +640,66 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 	return ptep_test_and_clear_young(vma, address, ptep);
 }
 
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
+			    pte_t *ptep, pte_t pteval, unsigned int nr)
+{
+	if (unlikely(pte_valid_napot(pteval))) {
+		unsigned int order = ilog2(nr);
+
+		if (!is_napot_order(order)) {
+			/*
+			 * Something's weird, we are given a NAPOT pte but the
+			 * size of the mapping is not a known NAPOT mapping
+			 * size, so clear the NAPOT bit and map this without
+			 * NAPOT support: core mm only manipulates pte with the
+			 * real pfn so we know the pte is valid without the N
+			 * bit.
+			 */
+			pr_err("Incorrect NAPOT mapping, resetting.\n");
+			pteval = pte_clear_napot(pteval);
+		} else {
+			/*
+			 * NAPOT ptes that arrive here only have the N bit set
+			 * and their pfn does not contain the mapping size, so
+			 * set that here.
+			 */
+			pteval = pte_mknapot(pteval, order);
+		}
+	}
+
+	__set_ptes(mm, addr, ptep, pteval, nr);
+}
+#define set_ptes			set_ptes
+
+static inline pte_t ptep_get(pte_t *ptep)
+{
+	pte_t pte = __ptep_get(ptep);
+
+	/*
+	 * The pte we load has the N bit set and the size of the mapping in
+	 * the pfn LSBs: keep the N bit and replace the mapping size with
+	 * the *real* pfn since the core mm code expects to find it there.
+	 * The mapping size will be reset just before being written to the
+	 * page table in set_ptes().
+	 */
+	if (unlikely(pte_valid_napot(pte))) {
+		unsigned int order = napot_cont_order(pte);
+		int pos = order - 1 + _PAGE_PFN_SHIFT;
+		unsigned long napot_mask = ~GENMASK(pos, _PAGE_PFN_SHIFT);
+		pte_t *orig_ptep = PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * napot_pte_num(order));
+
+		pte = __pte((pte_val(pte) & napot_mask) + ((ptep - orig_ptep) << _PAGE_PFN_SHIFT));
+	}
+
+	return pte;
+}
+#define ptep_get			ptep_get
+#else
+#define set_ptes			__set_ptes
+#define ptep_get			__ptep_get
+#endif /* CONFIG_RISCV_ISA_SVNAPOT */
+
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
 {
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 6b09cd1ef41c..59ed26ce6857 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -256,8 +256,7 @@ void set_huge_pte_at(struct mm_struct *mm,
 
 	clear_flush(mm, addr, ptep, pgsize, pte_num);
 
-	for (i = 0; i < pte_num; i++, ptep++, addr += pgsize)
-		set_pte_at(mm, addr, ptep, pte);
+	set_ptes(mm, addr, ptep, pte, pte_num);
 }
 
 int huge_ptep_set_access_flags(struct vm_area_struct *vma,
@@ -284,8 +283,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	if (pte_young(orig_pte))
 		pte = pte_mkyoung(pte);
 
-	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
-		set_pte_at(mm, addr, ptep, pte);
+	set_ptes(mm, addr, ptep, pte, pte_num);
 
 	return true;
 }
@@ -325,8 +323,7 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 
 	orig_pte = pte_wrprotect(orig_pte);
 
-	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
-		set_pte_at(mm, addr, ptep, orig_pte);
+	set_ptes(mm, addr, ptep, orig_pte, pte_num);
 }
 
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
-- 
2.39.2



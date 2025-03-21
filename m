Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945DAC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 13:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vd9K/fWiMAnzVZgWbX0wvtztqz4Hm8uA/kr1foq/koQ=; b=qhZZ5yVHgRgKx/iW7/bW17ZL8v
	MvCcaOsdLi9yyCco4VhvQfb+vDaes1IlUs+5yE0on+wbyRqQFYT8lr8SdX6ZVdrbRz/0NNCm4jCY0
	8RAHEHE4lzxV2U1W9ONSV3ubu9cAPDw1jDH2oDFQLfYuc1lm3Jw6Z+J6XQx6hfApH7B2hhqbAvaR/
	KXz6H4QOOgQcFlM7sgotki7u08EEvkilpcyFMzJimbZn4eGyNQ/CaipnBZyBNdrIJrKvbmEQycnPd
	5lRI7I7IWV/TXLaYbVGo68yKYhAA4rT4Vtlx1/bCenUiMYXcYiCs6rwZwKumoggewy8NflPKL93aV
	fLoHdqoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcMG-0000000Ev0F-3WDq;
	Fri, 21 Mar 2025 13:24:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcE5-0000000EtMN-1mwM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 13:15:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso20588615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 06:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742562952; x=1743167752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vd9K/fWiMAnzVZgWbX0wvtztqz4Hm8uA/kr1foq/koQ=;
        b=PI2LUMoW/npNaY4nzXl8yj6B9kyIkP0ropAJ//yvtWryamE5IF0+OUf7D+pX3TsxKY
         rQXT8zB2hcj9b/3Pb5ocbTInvPoJ0QB9g9oadiLzjLknzji3QciD/mlasEQ6G+6U5M1S
         1JJ/6P19kBSVFbH5hLp+1itG73jjzRSiFNjf/TA5ZDdNGtINt7hH6igycP96cEdV8sBC
         XiE1njMBUVRkYep+EAxfkeSungBB1Vq+OA02vtC1N8EnlqEuUqrkzn5XENQUC3tTPK4s
         NbLsy22qccuOeQmqSaaHpX572G9e8l6wVKA3YDS75mNpwOZAt2V9j85aAEqiDsuEcLxG
         oxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742562952; x=1743167752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vd9K/fWiMAnzVZgWbX0wvtztqz4Hm8uA/kr1foq/koQ=;
        b=LYbFPtBCfod7mFV6y2Y1w9Gf2JbxN+G29hUQPVUYi3go1kwPQvSdxAEy7zWiJOWUIf
         l2nudZaxgGr/z15mSS1inbfSbjBGBRTOqxOWToSwedzRI5bNDwv0NvbE9o4U38r/8+aR
         0nnvilgjL6qV6GONU4V8Q1DWni2TRKF/U5GNKiuwwcMHIYmdi2RT/ikKqZqpeV4JSjgN
         8DWuKU9YysHhvXsjTgUQqx8vAI3SpwDwzcZFet69imK1KuDd3aryKz3/Q/QmmAhWgFk6
         di9v0dGjxlyKvgylWpbUaemToSgTFhFbuaCayN1i3LZrQmlLQS2gEkmmImh9KwGdmwiz
         24Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXYwOImj0EcATSmEBQFVb3BwlViWyBsxnk0fM5+d2AKeEA8uXmhNCt4pPvApBouzK3KKaQK/3/ciyO1Kg2h/6dy@lists.infradead.org
X-Gm-Message-State: AOJu0YyAUJDEiUUMCHmxdRYul1503tjGQsJfZCF0Syu8lxlwom36K3i8
	ZnfFQMB9/zfzJaqNo8QhL7c8ccf50X4N4UJStWi1gC5e3PcfF/KpB5yQr7P4vkc=
X-Gm-Gg: ASbGncsgxrXeO8y1FkebzqXFuB0CVmfJ2xL+5V8GDQ4QgjaRUM4Fy/1on6uwAasDtLb
	IuSftLXjyb0NhkrdDOf1D11Lnbz771+RfiWm1mZazwllxyI5MMNspLzO2cH08nx2GGe75j9bCqt
	KZ1m/xTE+l8/gnUpbsOvIv7oY1dNtL3WLcLev0bagtXnFDmp3vrjFfDPA1ipInhFGu+e78EiRox
	9Mkm0ZzYbzjOaLAOBh5QOmr5lZJd6xnU2ePh87lJV0v0uLSXw1qgBnKvTmbRmIv4L2YCDpkNGvq
	6ND20qH5e045TZmhnsM6aL8AWuokqSduUaQx2aIDvM4eB6NJSkMupszwHr/VmGe85mcjKw==
X-Google-Smtp-Source: AGHT+IEeSuJJCualMyRGxNrWV663ipohlvvxYL4TpbesKMPlj8TlM2yLM3TCv4QBVXMIE7MjteYhiA==
X-Received: by 2002:a05:600c:83cf:b0:43c:ec28:d310 with SMTP id 5b1f17b1804b1-43d509ec838mr36046425e9.10.1742562951783;
        Fri, 21 Mar 2025 06:15:51 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3d12:52fe:c1cc:c94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdb06b9sm26435515e9.36.2025.03.21.06.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:15:51 -0700 (PDT)
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
Subject: [PATCH v5 9/9] mm: Use common huge_ptep_clear_flush() function for riscv/arm64
Date: Fri, 21 Mar 2025 14:06:35 +0100
Message-Id: <20250321130635.227011-10-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250321130635.227011-1-alexghiti@rivosinc.com>
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_061553_466700_D29910FC 
X-CRM114-Status: GOOD (  16.40  )
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
 arch/arm64/mm/hugetlbpage.c      | 60 --------------------------------
 arch/riscv/include/asm/hugetlb.h |  7 +---
 arch/riscv/mm/hugetlbpage.c      | 54 ----------------------------
 include/linux/hugetlb_contpte.h  |  4 +++
 mm/hugetlb_contpte.c             | 14 ++++++++
 6 files changed, 19 insertions(+), 123 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index f568467e8ba2..368600764127 100644
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
index 17f1ed34356d..08316cf4b104 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -82,52 +82,6 @@ int find_num_contig(struct mm_struct *mm, unsigned long addr,
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
-	pte_t pte, tmp_pte;
-	bool present;
-
-	pte = __ptep_get_and_clear(mm, addr, ptep);
-	present = pte_present(pte);
-	while (--ncontig) {
-		ptep++;
-		addr += pgsize;
-		tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
-		if (present) {
-			if (pte_dirty(tmp_pte))
-				pte = pte_mkdirty(pte);
-			if (pte_young(tmp_pte))
-				pte = pte_mkyoung(pte);
-		}
-	}
-	return pte;
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
@@ -260,20 +214,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
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
 	/*
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
index db13f7bcdd54..a6176415432a 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -121,45 +121,6 @@ unsigned long hugetlb_mask_last_page(struct hstate *h)
 	return 0UL;
 }
 
-static pte_t get_clear_contig(struct mm_struct *mm,
-			      unsigned long addr,
-			      pte_t *ptep,
-			      unsigned long ncontig)
-{
-	pte_t pte, tmp_pte;
-	bool present;
-
-	pte = ptep_get_and_clear(mm, addr, ptep);
-	present = pte_present(pte);
-	while (--ncontig) {
-		ptep++;
-		addr += PAGE_SIZE;
-		tmp_pte = ptep_get_and_clear(mm, addr, ptep);
-		if (present) {
-			if (pte_dirty(tmp_pte))
-				pte = pte_mkdirty(pte);
-			if (pte_young(tmp_pte))
-				pte = pte_mkyoung(pte);
-		}
-	}
-	return pte;
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
@@ -176,21 +137,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
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
index 9ec8792a2f4d..e217a3412b13 100644
--- a/include/linux/hugetlb_contpte.h
+++ b/include/linux/hugetlb_contpte.h
@@ -32,4 +32,8 @@ extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 extern void huge_ptep_set_wrprotect(struct mm_struct *mm,
 				    unsigned long addr, pte_t *ptep);
 
+#define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
+extern pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+				   unsigned long addr, pte_t *ptep);
+
 #endif /* _LINUX_HUGETLB_CONTPTE_H */
diff --git a/mm/hugetlb_contpte.c b/mm/hugetlb_contpte.c
index 629878765081..1dc211d6fbe1 100644
--- a/mm/hugetlb_contpte.c
+++ b/mm/hugetlb_contpte.c
@@ -242,3 +242,17 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 
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



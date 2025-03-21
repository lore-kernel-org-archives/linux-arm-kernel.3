Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E5AC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 13:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOImW0XTENLZqMOVas1NKgXRQH/ppGnjlH3sp/4Pu3c=; b=BK1KjudTxdWBGt3oY4p5mS2KwQ
	iOOpOtnilv7/0ZU3lff3Dn48VlKkFFJKwnjoEgugZjk377TtNkwpVrzHrxaXfvqDufZG9y6J7BMzw
	UiOZMo41VoZgMSITyvHEKihQm7xKwhSzq7N1xjrqzSOyK7D+SXW2xnZOkKjSf0Dx3G89mZxlYdCcZ
	bKBf5wH9ur3SqMaq5ybLoDIfO4AWmYM3y3hzCHKORYum6iKReRtr35cxfgbwm5NhCFEdfkROgDxLw
	kK4Sf8Avc+iy9Ma63PhyN+6PSBl0R+avqn/YGdQWC407cCKCWZvIUQ4d8wvDUDPqffnutGqzBm6Hw
	h0XshOnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcIx-0000000EuUR-3gwD;
	Fri, 21 Mar 2025 13:20:55 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcD5-0000000Et5e-3N2h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 13:14:53 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39130ee05b0so1860148f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 06:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742562890; x=1743167690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOImW0XTENLZqMOVas1NKgXRQH/ppGnjlH3sp/4Pu3c=;
        b=14qEUqAs8amlrTOY9101Dw80jQK7ZE7yhGLYHvbTB/m9DhgZi+ItZv3Ghuv9AI+s8f
         qY3N861mDyCCHeIW0XbRe0VGqHqzccp7wD5YKI/Ta6I13uj0Ig3N0At3eXCIZhp0L8qT
         e4VJyDO/IIPgAnZzInHDOWj3iz1/J51Ko5KUaWUPsGfrx8T4rdK80AVA0ckcV59cLkvX
         GFpJJkCqUxR14hYztGS59jxnuKpmY4X0kIuZ4ZtkzQTKPvNI1hPhXliRil4+3+SVid76
         mUFtvFSV/GLTZwWGapJmB6U12vAHCZsXLm7WP3Yss5lab/JXvcXkSL1pUgfIJ3iYM7ns
         gW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742562890; x=1743167690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOImW0XTENLZqMOVas1NKgXRQH/ppGnjlH3sp/4Pu3c=;
        b=hjKW0dXrGkDV0b4CX5W1kPSwPXSSfoaLuH5uo7TS0N/JhUTEoY3x82N1OBgxAAQXc+
         d1qHV2pHXTyWmeYKEJmfMd2qe0TFRUvnwy8srtvHG+bYeJhfqIvjZPEWzo1lyzUvOaGH
         mJj8jQ0aVMQvPVT3gdDWET35O2QAYdhUpD3cd9F0X90XhRDLkEbMsPCCuvTPjZdssAPB
         06aAUC5WlTZzvdbjFTOHiZQOZ2J6a4viqf0uw+kaQcxqPCjofpdUZW4vscN6kPr/xnJR
         Mbq/hjgyi2gRY737aubC6IrkcPQTOA5MiHJtaWk7ZgKuLLQDNRuxEDP0ISalv/hFFZUq
         UVPA==
X-Forwarded-Encrypted: i=1; AJvYcCWRV3tzvYSfvQa2HbO27ZVivruA3mtjd6SkI+ttNG42QbQTw7BU0lK1UIxGjkzx3K014fIxC6BtylicjyJM9pw5@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk5x8ZPMQCdqPFq7Q7bjyRJGY5bhJmoH8QeXW5zfzO2l6Iy8L3
	CU5gxu9I1EBkahGvlCd1EZVvw4X+tZ4vTgpDMzNsbYw2xC3l+ogCsRlL9TbnxfU=
X-Gm-Gg: ASbGnct2sLymC/LUPtZtkTq7/c2l9J5uxDjCHUpLVdtvYeEAg+iTigfSWrB502wQdmK
	2taNbu2mOk3vbswkcqxfTsUZUUrm5mm5lMGeb9bu4l5AFgeD/PoW4fA38t/PVdeMzIAIgLeAY46
	Ma07bwk2I30QC4WsPr6Nung7BwF1cPz6JEtF9r/SQjLgD7jEQEm85GthwZrB745qypDxrTbZCfR
	Yo2S4SV2Vdhzfqwrg8D6vRjwb+4OgOWV/wk4ZvNLAHSIJ2EgF+6pBzidvtYeUC4OY8LSXRAX9TF
	3yZ55T9ycmHIDpLjzoGqVQwqcRmusBglO05AkZFJqPiJQRmxCXVT1NKcOias+scHUsTRCg==
X-Google-Smtp-Source: AGHT+IG4Bh4b8ljgMGozvKhj+gGf/zTKUltGlpRU5vbjoRJl/qtI6QCkciAO8DnHWDVRjHELB4GFxw==
X-Received: by 2002:a05:6000:381:b0:399:737f:4e02 with SMTP id ffacd0b85a97d-3997f938798mr3602833f8f.39.1742562890297;
        Fri, 21 Mar 2025 06:14:50 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3d12:52fe:c1cc:c94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9eef37sm2294241f8f.85.2025.03.21.06.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:14:49 -0700 (PDT)
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
Subject: [PATCH v5 8/9] mm: Use common huge_ptep_set_wrprotect() function for riscv/arm64
Date: Fri, 21 Mar 2025 14:06:34 +0100
Message-Id: <20250321130635.227011-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250321130635.227011-1-alexghiti@rivosinc.com>
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_061451_843709_2F347695 
X-CRM114-Status: GOOD (  14.36  )
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
 arch/arm64/include/asm/hugetlb.h |  3 ---
 arch/arm64/mm/hugetlbpage.c      | 27 ---------------------------
 arch/riscv/include/asm/hugetlb.h |  4 ----
 arch/riscv/include/asm/pgtable.h |  7 ++++---
 arch/riscv/mm/hugetlbpage.c      | 22 ----------------------
 include/linux/hugetlb_contpte.h  |  4 ++++
 mm/hugetlb_contpte.c             | 20 ++++++++++++++++++++
 7 files changed, 28 insertions(+), 59 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 29a9dac52cef..f568467e8ba2 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -35,9 +35,6 @@ static inline void arch_clear_hugetlb_flags(struct folio *folio)
 
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 #define arch_make_huge_pte arch_make_huge_pte
-#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
-extern void huge_ptep_set_wrprotect(struct mm_struct *mm,
-				    unsigned long addr, pte_t *ptep);
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
 extern pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 				   unsigned long addr, pte_t *ptep);
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 03cb757f7935..17f1ed34356d 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -260,33 +260,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-void huge_ptep_set_wrprotect(struct mm_struct *mm,
-			     unsigned long addr, pte_t *ptep)
-{
-	unsigned long pfn, dpfn;
-	pgprot_t hugeprot;
-	int ncontig, i;
-	size_t pgsize;
-	pte_t pte;
-
-	if (!pte_cont(__ptep_get(ptep))) {
-		__ptep_set_wrprotect(mm, addr, ptep);
-		return;
-	}
-
-	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
-	dpfn = pgsize >> PAGE_SHIFT;
-
-	pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
-	pte = pte_wrprotect(pte);
-
-	hugeprot = pte_pgprot(pte);
-	pfn = pte_pfn(pte);
-
-	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
-		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
-}
-
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 			    unsigned long addr, pte_t *ptep)
 {
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index bf533c2cef84..4c692dd82779 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -24,10 +24,6 @@ bool arch_hugetlb_migration_supported(struct hstate *h);
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 			    unsigned long addr, pte_t *ptep);
 
-#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
-void huge_ptep_set_wrprotect(struct mm_struct *mm,
-			     unsigned long addr, pte_t *ptep);
-
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 #define arch_make_huge_pte arch_make_huge_pte
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 081385e0d10a..c41b49948ee9 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -665,9 +665,8 @@ extern int __ptep_set_access_flags(struct vm_area_struct *vma, unsigned long add
 extern int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long address,
 				     pte_t *ptep);
 
-#define __HAVE_ARCH_PTEP_SET_WRPROTECT
-static inline void ptep_set_wrprotect(struct mm_struct *mm,
-				      unsigned long address, pte_t *ptep)
+static inline void __ptep_set_wrprotect(struct mm_struct *mm,
+					unsigned long address, pte_t *ptep)
 {
 	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
 }
@@ -791,6 +790,8 @@ static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
 #define pte_clear		__pte_clear
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 #define ptep_set_access_flags	__ptep_set_access_flags
+#define __HAVE_ARCH_PTEP_SET_WRPROTECT
+#define ptep_set_wrprotect	__ptep_set_wrprotect
 
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index b2046f4bd445..db13f7bcdd54 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -176,28 +176,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-void huge_ptep_set_wrprotect(struct mm_struct *mm,
-			     unsigned long addr,
-			     pte_t *ptep)
-{
-	pte_t pte = ptep_get(ptep);
-	pte_t orig_pte;
-	int pte_num;
-
-	if (!pte_napot(pte)) {
-		ptep_set_wrprotect(mm, addr, ptep);
-		return;
-	}
-
-	pte_num = arch_contpte_get_num_contig(mm, addr, ptep, 0, NULL);
-
-	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
-
-	orig_pte = pte_wrprotect(orig_pte);
-
-	set_ptes(mm, addr, ptep, orig_pte, pte_num);
-}
-
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 			    unsigned long addr,
 			    pte_t *ptep)
diff --git a/include/linux/hugetlb_contpte.h b/include/linux/hugetlb_contpte.h
index e129578f6500..9ec8792a2f4d 100644
--- a/include/linux/hugetlb_contpte.h
+++ b/include/linux/hugetlb_contpte.h
@@ -28,4 +28,8 @@ extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 				      unsigned long addr, pte_t *ptep,
 				      pte_t pte, int dirty);
 
+#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
+extern void huge_ptep_set_wrprotect(struct mm_struct *mm,
+				    unsigned long addr, pte_t *ptep);
+
 #endif /* _LINUX_HUGETLB_CONTPTE_H */
diff --git a/mm/hugetlb_contpte.c b/mm/hugetlb_contpte.c
index b4c409d11195..629878765081 100644
--- a/mm/hugetlb_contpte.c
+++ b/mm/hugetlb_contpte.c
@@ -222,3 +222,23 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 
 	return 1;
 }
+
+void huge_ptep_set_wrprotect(struct mm_struct *mm,
+			     unsigned long addr, pte_t *ptep)
+{
+	int ncontig;
+	size_t pgsize;
+	pte_t pte;
+
+	if (!pte_cont(__ptep_get(ptep))) {
+		__ptep_set_wrprotect(mm, addr, ptep);
+		return;
+	}
+
+	ncontig = arch_contpte_get_num_contig(mm, addr, ptep, 0, &pgsize);
+
+	pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
+	pte = pte_wrprotect(pte);
+
+	set_contptes(mm, addr, ptep, pte, ncontig, pgsize);
+}
-- 
2.39.2



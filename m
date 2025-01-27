Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B30BC0218C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 09:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5hVtVN5ts8qRfTru3U6IxaXR2nRBQvNb9/UQuUojb8=; b=tJeC2rPoiHcQgO+IYuXlkTNtYG
	5eo6euyoClp8gyhi3TECCwJGiJlPWVGnFA6WyS9udYnBRyp7AjpQ74sTypO+ooAW2P8sdEYygbyoA
	Wb579fPpGbESbSJOGyfhBzGCcJpWmL/q74hTsn0lZ15wnBVG8hoCzc4zdZcCtErD+bctBKXO1iJ1H
	BHKau+glLmKVtB3Zhz2BaKpDaC9CVB+OcuArJJ4iFX5WMWM5PfdZdzh6GeARENHggNjNv4j27f7ui
	91hqC37jRr4tcJFJ4sW9of7BTEoE9zu7Rk7TiCExnYLzxVakGixFgsBI+INvyEoHXhPUUXyW2+G0/
	LIEv2YRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLiV-000000024HG-26OP;
	Mon, 27 Jan 2025 09:47:39 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLes-000000023Dr-01ks
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 09:43:55 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-385e0e224cbso2363861f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 01:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737971032; x=1738575832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5hVtVN5ts8qRfTru3U6IxaXR2nRBQvNb9/UQuUojb8=;
        b=fX9bd/0O9A8gsb5s5gsmSyBZf8wUDqUzXo6aDtGwG3CZesAU1UdGHGthq1PWMFkn7r
         JReEXjAzq4TD4RsctKoHwBZY34QxfMmehdJxKY+JPxVkBNcURWwtsyrMIKOqMkyU3BCh
         6O7f9B0WJL8CaPedFRDFZatakwp5cJltcplbKDDv6ojOnrOAddu6XcgXqJNgYU2gEEQm
         6wjuDwmP/vji0du3Rl4cOvIlIZvnBIwNBLfviZsJnILKWyKmdZ2hH3CRxDDzhgqrdCBi
         7kuJo/x8cHS7TUdP9k2F1sjr0XOamB1f9PcaNtKhKm+smMljXDS1Uv2shxzytFcPUQpH
         FA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737971032; x=1738575832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C5hVtVN5ts8qRfTru3U6IxaXR2nRBQvNb9/UQuUojb8=;
        b=d5HmtQGSmYWeHZQEabWKZ9wzorLya+7DK440iWMi2HIFgNyXQoSufRpnlOw0DEcHNg
         RPCAkEdB00alcvlkkEnfgVVl2nXIZekuv3INsmA99ecqWpTmhOnRyQQV1R4ZFBhV201S
         LMUEfZs86lT8sMLiYlK4WP/VlYu1zDQB29cAd7gNILT/WrOA2wxZsxf5zWmtF243CKHW
         RIAJVC5qSldTxC8QzKzQyC6NUKW7AslliBuq3fIJ+WQaiBYGpts+Y6u50J/0IKmn7D4G
         H1DJN9r68hPyfxJNMxYZLspDTHccaBm3Ok13fdvVrTxvHilcnTpwI6Mt+0p+dMXtnmJZ
         lavQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY6jFgR4+GZQK+d16EbfKRTFIgwcbqwWlWRfDZF0MOfKw/lDiRvfqkOjrcsVtp91YMygBDyFLZrLpdSCtP/H7n@lists.infradead.org
X-Gm-Message-State: AOJu0YyxRUMBN+oeXO71FJLku0fymAZAmxOQWx/yYeFluEQ39LWovmmx
	hLqyDEY8vtksv/dTRbTx2cHoAX6pBjriv/mM8AHvHRFYTaPyFc02UxpsPffcwPo=
X-Gm-Gg: ASbGncuafP+1RQrsitEb1nSmTX7AadnDBpCi0/FkUzCGtK5zjFp8GNgO410i1+hALaY
	/ULCdKSc5KbY6KkihcqbvsIdLU7tBiuJPff+xSA3Myw4Jz/F6PkRPW6Enpx9/IWv5/FAWWn+zLx
	gMWq56jkIBxEChittbTiMAF82RQu8jtiJhUQDwoNSgNuvYyKwbPoCGtV9kPa7dhjE/NmzitsiwO
	yU58FLwyX/Xi7EkI5GbLWPqXgW9O+sqEtM7Q3IXYa8/1AQmLz6ndNJ5TPbiagahQUd4TWIo3MDt
	e1I7/e+dpnOhZ3NQ5fhpxvCAOUFuVEU=
X-Google-Smtp-Source: AGHT+IFXkE/IMZA1k4v5FDtRJn2j5Onh6MT51lwkeaLHVsBqz96ACklS2Q489STBeMVgKrxepukPbg==
X-Received: by 2002:a05:6000:18a8:b0:385:f69a:7e5f with SMTP id ffacd0b85a97d-38bf57a9a86mr46329622f8f.38.1737971032476;
        Mon, 27 Jan 2025 01:43:52 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3e22:3e78:ce5a:32c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d6a6sm10405111f8f.26.2025.01.27.01.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:43:52 -0800 (PST)
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
Subject: [PATCH v4 8/9] mm: Use common huge_ptep_set_wrprotect() function for riscv/arm64
Date: Mon, 27 Jan 2025 10:35:29 +0100
Message-Id: <20250127093530.19548-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250127093530.19548-1-alexghiti@rivosinc.com>
References: <20250127093530.19548-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_014354_047498_B6BA329A 
X-CRM114-Status: GOOD (  14.85  )
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
 mm/hugetlb_contpte.c             | 22 ++++++++++++++++++++++
 7 files changed, 30 insertions(+), 59 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 654f5f2f03a3..fd1de0caad3f 100644
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
index 643ba2043f0f..0430cb41f381 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -277,33 +277,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
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
index 290d5fbfe031..5a29153a4013 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -645,9 +645,8 @@ static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
 	return pte;
 }
 
-#define __HAVE_ARCH_PTEP_SET_WRPROTECT
-static inline void ptep_set_wrprotect(struct mm_struct *mm,
-				      unsigned long address, pte_t *ptep)
+static inline void __ptep_set_wrprotect(struct mm_struct *mm,
+					unsigned long address, pte_t *ptep)
 {
 	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
 }
@@ -741,6 +740,8 @@ static inline pte_t ptep_get(pte_t *ptep)
 #define pte_clear		__pte_clear
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 #define ptep_set_access_flags	__ptep_set_access_flags
+#define __HAVE_ARCH_PTEP_SET_WRPROTECT
+#define ptep_set_wrprotect	__ptep_set_wrprotect
 
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 0e2ca7327479..8963a4e77742 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -173,28 +173,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
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
index fea47035ac38..02bce0ed93d8 100644
--- a/include/linux/hugetlb_contpte.h
+++ b/include/linux/hugetlb_contpte.h
@@ -27,4 +27,8 @@ extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 				      unsigned long addr, pte_t *ptep,
 				      pte_t pte, int dirty);
 
+#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
+extern void huge_ptep_set_wrprotect(struct mm_struct *mm,
+				    unsigned long addr, pte_t *ptep);
+
 #endif /* _LINUX_HUGETLB_CONTPTE_H */
diff --git a/mm/hugetlb_contpte.c b/mm/hugetlb_contpte.c
index 49950c1ce615..de505350ef48 100644
--- a/mm/hugetlb_contpte.c
+++ b/mm/hugetlb_contpte.c
@@ -14,6 +14,7 @@
  *   - __ptep_get_and_clear()
  *   - __pte_clear()
  *   - __ptep_set_access_flags()
+ *   - __ptep_set_wrprotect()
  *   - pte_cont()
  *   - arch_contpte_get_num_contig()
  */
@@ -25,6 +26,7 @@
  *   - huge_pte_clear()
  *   - huge_ptep_get_and_clear()
  *   - huge_ptep_set_access_flags()
+ *   - huge_ptep_set_wrprotect()
  */
 
 pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
@@ -232,3 +234,23 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 
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



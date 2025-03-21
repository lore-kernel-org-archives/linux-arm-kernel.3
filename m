Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EE1C36001
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 13:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+Ba9lH6i+4JHX31VX+vvn1rf15Jq1WxTsiq92NtkJo=; b=tlhedr73MzPD9y6fiFgcQjrZ+X
	ri5E1ycws+wF9VyhEmkCavhPmcBEjcN+w3H2BNYTeVLJy0D5meWdvcdrrHYOomNUIYEcEGdaNKcYP
	H30QoirJR4mqjeds96sac3jZNyTxEK5gT7kDAG4KvWs3VCda+6tSfsp4S9AmKjkzAtjpi+8hqyhUN
	56AHADdNaPq7xjl9b2cPh0fKqdykdQbzZDXi7cYGKTD4SsjQvdVq12ULwZL9A/VQqwT16Qjv1HVuP
	dfkdJ/B9peBzFza5ipg8M+WNcKDcAFAGyfvQX+wu5OA+7gbkAsCvAi0M1o5CNGx2htqD7B+9CPkbi
	epUU7h0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcFG-0000000Etbb-2NBB;
	Fri, 21 Mar 2025 13:17:06 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcA7-0000000EsLp-2MTy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 13:11:49 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1751276f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 06:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742562706; x=1743167506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+Ba9lH6i+4JHX31VX+vvn1rf15Jq1WxTsiq92NtkJo=;
        b=gAT+RXyYDzHUhNh+se7154L412bJnmpvmO7n8rDmf2+H3R5GQTuccUUmYnnZYWZsfI
         TNRZRO4G/zVSuaTjJDour7qFUaQLGnC8QnwU+J398Knw3fZTdbs/tvBrLMNwo5QX8dX6
         0NSyekD0p55jyuPsSDjzY3ql1jDPRgDrhCj2+G+RIqBAramF2e7Dkz2XKBjooEzxSUDM
         AbOXxbExRdr1/aTTbrsaABNH9lEUvjjqSU1m2U7AZ+Mthy9hQViE7zxFW7wyeoYFnbpB
         c7OI12TC/DEGV9sqEd3bPHPjqEagfq0/SDc6mtlLdKjbASDKKRVA37PcdSnIykW6rqWf
         5btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742562706; x=1743167506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+Ba9lH6i+4JHX31VX+vvn1rf15Jq1WxTsiq92NtkJo=;
        b=GxW8woXoZhZKUKmnFnbAZPUU3Qi2hhgLOAD6mSiZkZFoXRTYiO9okypFILip5J0cXG
         eBJcohQUYzlsAK4MGdaDhQ6ZMiFt9KLjd/IVFhpaK+FmG/+vpQyxB7MFzBWzC6IWyPA1
         Bu99shGFDb5pMOaTYBcE10gwQAPHplv1/XQRdPw6l0CYZkBlzy2msqOXv58+FwYO5D4t
         J9hqS+E9nfI6fDaIQmCbizCCQ6VI0UIqzYobrqrrdjscDzVYI9aF9lVA1nGztIWyReCP
         iytArWKsa+6Uyp46l0WdGjV4N+0e7GLwGkyHqt2tz90kF29gAMxGi7saMO1OfL7qgqT5
         igEA==
X-Forwarded-Encrypted: i=1; AJvYcCXnHfllkfBqWDDoAANMl4VhVedexqP4ZHsqBARDayFG81Ytrg+xXhmwnyJIk8+02pq74W/FBdza1qoxUgorDo2U@lists.infradead.org
X-Gm-Message-State: AOJu0YzfebueUODxRhGAcLvxDiDjLAmuBYdlt1duYXBgBKkk3RwMEnZ2
	/5R7GzztQMypPljk/IFgFd02pP3FiOVT8My+8WFZIHM8gp9JXjvFefpG2C93Oqk=
X-Gm-Gg: ASbGnctmUAURpevcV6dw3nNzbri4p9HiIZhntKSyWsDqbjvcVCJ7ByZzJcErsc+t3lI
	szJnQ2r7LZfIziclbHpw0wK1dbkmosrgHlTMGmmw7Kevkb8C3mwxi7rkidVyf2YL/vvTKf+1fO5
	heRP7fDvalie7k3BYfJiJUWAfKzsWKHskp+urrCwHPcfExMRhvnB3JfCjJ/j7Wn62zwgzfaUF1a
	nv78UGdatwnj9VqiDk5qFz3kOH4FLmZRiwI+7EPk+uuVMATl9rxX6u7VkujxXt58UzqMRVm1mMX
	aPD5zkA8sjRs3j/rD7Zr7M3TjC8AIwB5jN4cMIWfHxSb7EBJXjnuSpdI1uNyQa4+VF2tsA==
X-Google-Smtp-Source: AGHT+IEGZPDoYAPQGYmkPYx5aU5RVlINcZRG7cNrGB3gR0sMYyiWL8XPHTT0J17da9GbtboJpKfvoQ==
X-Received: by 2002:a05:6000:154a:b0:38f:3224:660b with SMTP id ffacd0b85a97d-3997f90a69bmr2874098f8f.22.1742562705888;
        Fri, 21 Mar 2025 06:11:45 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3d12:52fe:c1cc:c94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b26a6sm2310275f8f.44.2025.03.21.06.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:11:45 -0700 (PDT)
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
Subject: [PATCH v5 5/9] mm: Use common huge_pte_clear() function for riscv/arm64
Date: Fri, 21 Mar 2025 14:06:31 +0100
Message-Id: <20250321130635.227011-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250321130635.227011-1-alexghiti@rivosinc.com>
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_061147_604907_9307B347 
X-CRM114-Status: GOOD (  14.37  )
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

Both architectures have the same implementation so move it to generic code.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/hugetlb.h |  3 ---
 arch/arm64/mm/hugetlbpage.c      | 12 ------------
 arch/riscv/include/asm/hugetlb.h |  4 ----
 arch/riscv/include/asm/pgtable.h |  5 +++--
 arch/riscv/mm/hugetlbpage.c      | 19 -------------------
 include/linux/hugetlb_contpte.h  |  4 ++++
 mm/hugetlb_contpte.c             | 12 ++++++++++++
 7 files changed, 19 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index cfdc04e11585..ed75631ad63c 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -48,9 +48,6 @@ extern void huge_ptep_set_wrprotect(struct mm_struct *mm,
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
 extern pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 				   unsigned long addr, pte_t *ptep);
-#define __HAVE_ARCH_HUGE_PTE_CLEAR
-extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
-			   pte_t *ptep, unsigned long sz);
 
 void __init arm64_hugetlb_cma_reserve(void);
 
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 6feb90ed2e7d..99728b02a3ca 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -260,18 +260,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
-		    pte_t *ptep, unsigned long sz)
-{
-	int i, ncontig;
-	size_t pgsize;
-
-	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
-
-	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
-		__pte_clear(mm, addr, ptep);
-}
-
 pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 			      pte_t *ptep, unsigned long sz)
 {
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index 7049a17b819d..467bc30c2153 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -20,10 +20,6 @@ bool arch_hugetlb_migration_supported(struct hstate *h);
 #endif
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
-#define __HAVE_ARCH_HUGE_PTE_CLEAR
-void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
-		    pte_t *ptep, unsigned long sz);
-
 #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
 pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 			      unsigned long addr, pte_t *ptep,
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 5b34b3c9c0f9..72d3592454d3 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -651,8 +651,8 @@ static inline int arch_contpte_get_num_contig(pte_t *ptep, unsigned long size,
 }
 #endif
 
-static inline void pte_clear(struct mm_struct *mm,
-	unsigned long addr, pte_t *ptep)
+static inline void __pte_clear(struct mm_struct *mm,
+			       unsigned long addr, pte_t *ptep)
 {
 	__set_pte_at(mm, ptep, __pte(0));
 }
@@ -787,6 +787,7 @@ static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 #define ptep_get_and_clear	__ptep_get_and_clear
+#define pte_clear		__pte_clear
 
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 75faeacc8138..fe82284c3dc4 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -254,25 +254,6 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 	return get_clear_contig_flush(vma->vm_mm, addr, ptep, pte_num);
 }
 
-void huge_pte_clear(struct mm_struct *mm,
-		    unsigned long addr,
-		    pte_t *ptep,
-		    unsigned long sz)
-{
-	size_t pgsize;
-	pte_t pte = ptep_get(ptep);
-	int i, pte_num;
-
-	if (!pte_napot(pte)) {
-		pte_clear(mm, addr, ptep);
-		return;
-	}
-
-	pte_num = arch_contpte_get_num_contig(ptep, sz, &pgsize);
-	for (i = 0; i < pte_num; i++, addr += pgsize, ptep++)
-		pte_clear(mm, addr, ptep);
-}
-
 static bool is_napot_size(unsigned long size)
 {
 	unsigned long order;
diff --git a/include/linux/hugetlb_contpte.h b/include/linux/hugetlb_contpte.h
index 135b68bd09ca..e6aa9befa78c 100644
--- a/include/linux/hugetlb_contpte.h
+++ b/include/linux/hugetlb_contpte.h
@@ -14,4 +14,8 @@ extern void set_huge_pte_at(struct mm_struct *mm,
 			    unsigned long addr, pte_t *ptep, pte_t pte,
 			    unsigned long sz);
 
+#define __HAVE_ARCH_HUGE_PTE_CLEAR
+extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
+			   pte_t *ptep, unsigned long sz);
+
 #endif /* _LINUX_HUGETLB_CONTPTE_H */
diff --git a/mm/hugetlb_contpte.c b/mm/hugetlb_contpte.c
index cbf93ffcd882..e881b302dd63 100644
--- a/mm/hugetlb_contpte.c
+++ b/mm/hugetlb_contpte.c
@@ -86,3 +86,15 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 
 	set_contptes(mm, addr, ptep, pte, ncontig, pgsize);
 }
+
+void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
+		    pte_t *ptep, unsigned long sz)
+{
+	int i, ncontig;
+	size_t pgsize;
+
+	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
+
+	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
+		__pte_clear(mm, addr, ptep);
+}
-- 
2.39.2



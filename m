Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB354C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 09:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRFnXJIF4/2q4SeWU0XB4ffUEopf6Q+wLHMkPdh3cGw=; b=t0qGz1KtdZjtxpDOtDG+xcWIXS
	BgvHF+dnu6GLi6S9YjnBI73Y0qYeye4BkDfh+Wl5l2XKy2KK8CCzIu1HfhRAEhZ2rlFOg2p8nmALt
	iZvS7snOmR1JTE+IJcZvOIw4bsAiQ9JRw4/XbCN9ER+orQKzgAGYNMqRjKdQ36Muqc1zLt1bQ1LNj
	tjw2jTM3ncl/llSZxvCq9QYEToVMYFpbkf1SLUEO9RSL0ESppqp+IwJS+X42Puo39AdeaISi1LYc/
	8XQhdoeew3i6y7e6oDo7j3VWg/DHZes7dhPyDoQWD5AAWiBtSeZe6+YXekTKCdlf/PxSJ9iLDel/0
	XxQxIoxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLeY-0000000239Z-14Rr;
	Mon, 27 Jan 2025 09:43:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLbt-000000022Mz-2qgQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 09:40:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-436202dd730so28980995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 01:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737970848; x=1738575648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRFnXJIF4/2q4SeWU0XB4ffUEopf6Q+wLHMkPdh3cGw=;
        b=ImzJuwDIx2ePO++CDbSc9Py86TnFDTZsZqDKSNVbGpIgdqh9NJZM08BoK0A5viI6U2
         /m4oYSc2U7VODGi+4So9SlbRB+9npY5Xl71pid2ajjBdzF6+Pao2vmkPty5KP1TkGSng
         I5c82+R8RahLNg1qzCybT6J4UOBZKgf9Bhh4DPWdSJazSXMMaEMdWuiTczfENLuaTrkk
         rNnOHR1hD8OnzbExKZBSQVq3l/SOrU+izSZb9Qtzk3t4RlV2h25S5ztWbvsJzsKHrKLu
         6wi7/W6E8fsjGOlB78f43V696aKft5QLVyhWmcwFyM8W5QhMpjV69v0cJqmY2lgrvpH+
         1tKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737970848; x=1738575648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRFnXJIF4/2q4SeWU0XB4ffUEopf6Q+wLHMkPdh3cGw=;
        b=Ri1HDpw4fGKSIEgxHU7gg3bkRpCzORxv5RvDaWsGO0kbRpH6KO4m7CV+vqPOTKV6hR
         iIsXWSRjVuSG6hX2Ic1OfoJI9qiNpM7DAcDkPJUawLqtcB6dbw9tfbT4022Y6SmK1qV3
         YQQcnO6sHLoUVmStRwaBQnyYfv3X2idKha+QAHBkcpaahbTLNncIwOkHVHMYzE14CRQb
         u83ul21Rqg+FyVnoaefdAf7rYR6UKFbK2oo8JejhtyRpD9r9Pga+uscLgz+z8kgD2hvB
         cl2otb6qkvkF9yYgdp8wnBdBzpJrC/xurKDL2J0KwEgtwhBpbSp2aeP9dGKM/4JCMDzE
         utpw==
X-Forwarded-Encrypted: i=1; AJvYcCVe1OpY+jWUxmDAPt3ZvNAJi1EsUdUcsTOixukOOuNIbekm+Hiu7pA+9Aqg+O8s5C5q1N31Js4yvDDvenXby9iI@lists.infradead.org
X-Gm-Message-State: AOJu0YwBEShgZmltrbrrM3Z1UOF2NkvJ6kxBtdBLLrp1dRymk18cLfjp
	RwNp90E5OUCrhoxEO4fdMbPR6c12piklsO7qlpBMHgCRUTSu/ayTEkERKuhUtwQ=
X-Gm-Gg: ASbGncscxkN/4JgDbDVmzk36qXccIlJbZgKYmXnzeqXIkwNorJFjyLL9fhlISSGsCw6
	p52VsJTVTGXAw6eKUSV0WipmwgN8JTvAgbKRjXrxocYcfVhvEv5U8JD40ZpLTAlVGImfv0wbUvM
	KYCPmyHWWngO2+3XuYIIwYNf/wNAPtalcxe/msSOl6GpArcTgGw927rsPgGBZ4zRKvp6lK+3PgJ
	bHM+k5pMtRbtB5D7lo/AS5Gqy5+AMj0lbKc1v2nffLmgC6/fSlF0a+J4SveZNi7ajo0mF3zzEW8
	ZrGng9PbnSddLsoQBEtPOIz1W3H9nhg=
X-Google-Smtp-Source: AGHT+IHaxudRMH2a6X9Kau2FejbNNa+aNZH7OQ4Z4KpCCzwiphcNEJX34OXuuFlJfN/dPYRcVT3pPw==
X-Received: by 2002:a05:600c:6c9a:b0:438:a240:c54 with SMTP id 5b1f17b1804b1-438a2400d95mr279659705e9.9.1737970847952;
        Mon, 27 Jan 2025 01:40:47 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3e22:3e78:ce5a:32c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd57517fsm122917795e9.38.2025.01.27.01.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:40:47 -0800 (PST)
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
Subject: [PATCH v4 5/9] mm: Use common huge_pte_clear() function for riscv/arm64
Date: Mon, 27 Jan 2025 10:35:26 +0100
Message-Id: <20250127093530.19548-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250127093530.19548-1-alexghiti@rivosinc.com>
References: <20250127093530.19548-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_014049_720709_3D8BCA00 
X-CRM114-Status: GOOD (  15.14  )
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
 mm/hugetlb_contpte.c             | 14 ++++++++++++++
 7 files changed, 21 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 40d87a563093..e4acaedea149 100644
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
index 02de680a6a0d..541358f50b64 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -277,18 +277,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
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
 pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 			      unsigned long addr, pte_t *ptep)
 {
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index 28cbf5d761e1..ca9930cdf2e6 100644
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
 			      unsigned long addr, pte_t *ptep);
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 74d29d0af172..08b24c0a579b 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -621,8 +621,8 @@ static inline int arch_contpte_get_num_contig(pte_t *ptep, unsigned long size,
 }
 #endif
 
-static inline void pte_clear(struct mm_struct *mm,
-	unsigned long addr, pte_t *ptep)
+static inline void __pte_clear(struct mm_struct *mm,
+			       unsigned long addr, pte_t *ptep)
 {
 	__set_pte_at(mm, ptep, __pte(0));
 }
@@ -737,6 +737,7 @@ static inline pte_t ptep_get(pte_t *ptep)
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 #define ptep_get_and_clear	__ptep_get_and_clear
+#define pte_clear		__pte_clear
 
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 0ecb2846c3f0..e2093e7266a5 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -251,25 +251,6 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
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
index 7acd734a75e8..d9892a047b2b 100644
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
index 677d714fd10d..c76d6b3d0121 100644
--- a/mm/hugetlb_contpte.c
+++ b/mm/hugetlb_contpte.c
@@ -12,6 +12,7 @@
  *   - __ptep_get()
  *   - __set_ptes()
  *   - __ptep_get_and_clear()
+ *   - __pte_clear()
  *   - pte_cont()
  *   - arch_contpte_get_num_contig()
  */
@@ -20,6 +21,7 @@
  * This file implements the following contpte aware API:
  *   - huge_ptep_get()
  *   - set_huge_pte_at()
+ *   - huge_pte_clear()
  */
 
 pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
@@ -101,3 +103,15 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 
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



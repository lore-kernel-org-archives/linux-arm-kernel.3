Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C76C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 13:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tW5CZGKlc6dgOhT2HYLkHYDVp73Jiwu1Hc2Rif5lDWM=; b=ODc6NdJBjSTW6SCqhlGcYrfI0N
	WRsRejp35blMJnngQepp9vjJ3dQY1LS2KaGYVvH8V+aVKzbAkxh1erW64bHqXrcHLBTjp8HtO8ONP
	2r2Bw5w3XvEr96k49X70487pLGPPzJJTt5DJR2uBZ/oRymf03tI/L18NWYvx2tdQp8ykxYwxaFucb
	DLuXe/sJFfh74vC71PqeQV02SKrg+qQB3zNFlvLdfxmMV2Fhs7YrPv39+9C95ZNoO/nHnZKzWfYaM
	PHygT0G4Qii5hST9d5gsoJfqm19L/pIyCMUIVtJIV5XHXv5lBw0cqSKNW2iVzk5+YEX73hZUP1DXj
	3pBO8ogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcNv-0000000EvJQ-0ElF;
	Fri, 21 Mar 2025 13:26:03 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcB7-0000000EsYy-1EUn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 13:12:51 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso1326735f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742562768; x=1743167568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tW5CZGKlc6dgOhT2HYLkHYDVp73Jiwu1Hc2Rif5lDWM=;
        b=puYwddz8Wz+5V5YrPz2C2AcTgvDT4mKtmkEeH4loATwSKRXgec/hBnnIHbVyY5iX99
         XJbj7o+XUQz9QwtTeXsxV1+T95GhTQaVmC+gfCjXLN0ODUSMwH3joBtcrm9ZeCbgMy5l
         Ek/JROE7oNeRHAtrUxE/D2hTQBHy3trPvPcL6YHFW+l5uLcwW4AswEzsCyDJ8C2LB9MC
         QzrCr6oOEGQcE2oFvjVSGLuk19+uwLUn0g6zeszYFCUM02Vqwt3vJv6lkLR9VXMzXahT
         nS3aZhotDxEDXVdgx0M0YZ/wopd1FURCesZiNGP3gO364lvPf2zs4+COlqz7eUriMq+1
         DyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742562768; x=1743167568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tW5CZGKlc6dgOhT2HYLkHYDVp73Jiwu1Hc2Rif5lDWM=;
        b=WjWT+B4KDqzKoR5MznvhdEpROrKdJu72Uwbt5tpS5gtvNE76dfF8n7nCs94fZSxSGk
         HEhyXkBshxPbIt0AGYBHoF8p68PC0ETdodo1UEjkIL6wRgIweCWpooKaKZLBIWghWwlL
         PddPLM3l6xsUIY8byhnF4AWsJ/ouYAFYbZsu1fyFG5z1MKg/QnAQ73YiHvmcQAkA4PAJ
         AQcRhcYjrmakdRpxvSrSSaRXVsgraYxT5SuqoU4vYOlKobG1GGZJ+YRMblsgVDObQK5Y
         C9qQVHvGWB4u3w7iFtoSSpY8WRFey9Etl5JBrjQRMYqTyutbq7y8VqT39feSCg6NBCBy
         JNoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8B40TK2217SeO2veEf4ELPV/XRYiKssc9jQHHX13g3wIdUL30gpD3iLJFq/vW9PT91Hwcj7mp/VHnriuCqW4p@lists.infradead.org
X-Gm-Message-State: AOJu0YxNawQdn23FyYOL/qQujt2T10RvvMerk5+t+njJFe4r5+uA6Tex
	mCO41haqGd3YNwAQakBhi8xXKn9H9bWCpwN60w0PAnLxUqaaeD4JuxN8frtDKgk=
X-Gm-Gg: ASbGnct3UTgz03YIZXC3i/M7TqYg6zuqERa5fSIpkx/qV6d5Y1RfwaPjPjskCazItj1
	BOP6AnbfU04rz/ShTeT5eGKqq/DBEvnz3SqMjLeC/+1qr5k9agtjI5DiX3vDeK8tr+XKlajkfDj
	DWwRGxIS+gMirtHwxEtaYTjomKL1doqWAaYATkYxzCJGgOCvCqIiiuJHRHPvaJy/4xbON6qtk1O
	5m7dgaiUoEz9pQt3ceWC7MTnUOr/jJ98DY8DKO+ID2RwJir5GCNsPqUsFiTF5MVlZIGlVPNplo3
	CwZ1x70LyuuSefEKxmIFL33kcdHVKxyOnH6thTQRjmlVezi5EQFuvz9r3WosQ7Rprbdwcg==
X-Google-Smtp-Source: AGHT+IEUtROIBbu/cy/pImYWjl+q4lRngYo9z7idT6KT9+6QFPXCkP6BZJtyCAPZK3CSSAem4Gc0LA==
X-Received: by 2002:a5d:64af:0:b0:391:2db0:2961 with SMTP id ffacd0b85a97d-3997f932efcmr3394631f8f.38.1742562767493;
        Fri, 21 Mar 2025 06:12:47 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3d12:52fe:c1cc:c94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e66c7sm2356167f8f.79.2025.03.21.06.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:12:47 -0700 (PDT)
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
Subject: [PATCH v5 6/9] mm: Use common huge_ptep_get_and_clear() function for riscv/arm64
Date: Fri, 21 Mar 2025 14:06:32 +0100
Message-Id: <20250321130635.227011-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250321130635.227011-1-alexghiti@rivosinc.com>
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_061249_337992_DAAD15EB 
X-CRM114-Status: GOOD (  18.24  )
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
 arch/arm64/mm/hugetlbpage.c      | 10 -------
 arch/riscv/include/asm/hugetlb.h |  5 ----
 arch/riscv/mm/hugetlbpage.c      | 15 ----------
 include/linux/hugetlb_contpte.h  |  5 ++++
 mm/hugetlb_contpte.c             | 51 ++++++++++++++++++++++++++++++++
 6 files changed, 56 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index ed75631ad63c..9b1c25775bea 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -39,9 +39,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 				      unsigned long addr, pte_t *ptep,
 				      pte_t pte, int dirty);
-#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
-extern pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
-				     pte_t *ptep, unsigned long sz);
 #define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
 extern void huge_ptep_set_wrprotect(struct mm_struct *mm,
 				    unsigned long addr, pte_t *ptep);
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 99728b02a3ca..62a66ce2b2fe 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -260,16 +260,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
-			      pte_t *ptep, unsigned long sz)
-{
-	int ncontig;
-	size_t pgsize;
-
-	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
-	return get_clear_contig(mm, addr, ptep, pgsize, ncontig);
-}
-
 /*
  * huge_ptep_set_access_flags will update access flags (dirty, accesssed)
  * and write permission.
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index 467bc30c2153..0fbb6b19df79 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -20,11 +20,6 @@ bool arch_hugetlb_migration_supported(struct hstate *h);
 #endif
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
-#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
-pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
-			      unsigned long addr, pte_t *ptep,
-			      unsigned long sz);
-
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 			    unsigned long addr, pte_t *ptep);
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index fe82284c3dc4..87168123d4a2 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -203,21 +203,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	return true;
 }
 
-pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
-			      unsigned long addr,
-			      pte_t *ptep, unsigned long sz)
-{
-	pte_t orig_pte = ptep_get(ptep);
-	int pte_num;
-
-	if (!pte_napot(orig_pte))
-		return ptep_get_and_clear(mm, addr, ptep);
-
-	pte_num = arch_contpte_get_num_contig(ptep, sz, NULL);
-
-	return get_clear_contig(mm, addr, ptep, pte_num);
-}
-
 void huge_ptep_set_wrprotect(struct mm_struct *mm,
 			     unsigned long addr,
 			     pte_t *ptep)
diff --git a/include/linux/hugetlb_contpte.h b/include/linux/hugetlb_contpte.h
index e6aa9befa78c..1c8f46ff95ea 100644
--- a/include/linux/hugetlb_contpte.h
+++ b/include/linux/hugetlb_contpte.h
@@ -18,4 +18,9 @@ extern void set_huge_pte_at(struct mm_struct *mm,
 extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 			   pte_t *ptep, unsigned long sz);
 
+#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
+extern pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
+				     unsigned long addr, pte_t *ptep,
+				     unsigned long sz);
+
 #endif /* _LINUX_HUGETLB_CONTPTE_H */
diff --git a/mm/hugetlb_contpte.c b/mm/hugetlb_contpte.c
index e881b302dd63..82f49eb79ffb 100644
--- a/mm/hugetlb_contpte.c
+++ b/mm/hugetlb_contpte.c
@@ -98,3 +98,54 @@ void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
 		__pte_clear(mm, addr, ptep);
 }
+
+/*
+ * ARM: Changing some bits of contiguous entries requires us to follow a
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
+ * This helper performs the break step.
+ */
+static pte_t get_clear_contig(struct mm_struct *mm,
+			     unsigned long addr,
+			     pte_t *ptep,
+			     unsigned long pgsize,
+			     unsigned long ncontig)
+{
+	pte_t pte, tmp_pte;
+	bool present;
+
+	pte = __ptep_get_and_clear(mm, addr, ptep);
+	present = pte_present(pte);
+	while (--ncontig) {
+		ptep++;
+		addr += pgsize;
+		tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
+		if (present) {
+			if (pte_dirty(tmp_pte))
+				pte = pte_mkdirty(pte);
+			if (pte_young(tmp_pte))
+				pte = pte_mkyoung(pte);
+		}
+	}
+	return pte;
+}
+
+pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
+			      unsigned long addr, pte_t *ptep, unsigned long sz)
+{
+	int ncontig;
+	size_t pgsize;
+
+	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
+
+	return get_clear_contig(mm, addr, ptep, pgsize, ncontig);
+}
-- 
2.39.2



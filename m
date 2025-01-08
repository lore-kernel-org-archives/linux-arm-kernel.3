Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C430AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 07:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evJHXxUH8wpRsLAfhvt7S2AIimf3Ggw2vmlVHfN1TNM=; b=rtpLZH+xSPXHG4CZtH7jV67qd0
	O8pu9z98fOpYcZTKaig5fXCbDZzmQXC36rlnU0PjN6Ff1ed4RctUxdm5jnmcG4CGLh4p9ZPTE3BsW
	9UTXu2lXCpIbhawKgLVeD28DcKtC4qlInVXz+oUi+64f41NPlSPzYlkMBCNRaBV3ms7zo5YNmEy2p
	YphNnaLMLT/DLoTwcXpfqYIxSWXgHju2qAnrtUf5VN/KRvhKEudfyKm/dGi9PH6IDG1y8jvU4RXC1
	AJGZ5ATKV8KLHfaxN1NscuvtB6GXNgg3VV/02r7ISr2ueY9HeG4IZWLhLpHSCOXzpaSAl/sG5BG2O
	ilWizQtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQAd-00000007NaS-3IJ7;
	Wed, 08 Jan 2025 07:08:03 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQ3e-00000007KjW-1IWA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 07:00:51 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21661be2c2dso222200435ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 23:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319650; x=1736924450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evJHXxUH8wpRsLAfhvt7S2AIimf3Ggw2vmlVHfN1TNM=;
        b=gDGu2YL+b6ST5hY7X/TaZlgwkmhC1l2NAWKDtNDO9YmsJek6FqFunfT6nQhRqqYf4y
         Odd31HyJMIinedZrCP1EoVMZNpNIMMfu3MiPnj0b4dCLCH4kmpMx+C+A1ugpLoT0Xh2h
         frKXw5nJZuutDbYfoXwLS9z5T4vlFzV0HZ1c6DblaOwnZ+4U+d/exIiTRG1xG+QxcVav
         F6RYI5MmHd6KOyiAjQB+VZZAoqJTpP+0FATMBxIjJXqWPs1W46c8ZdQFKtu+y0v8Lv7r
         o5CZnkuzw8SclVXeZ8wFTTmwhwXAzSZrcZsjxhEDzBStzW7L6LkyNCLSpkvzoCLJKril
         rTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319650; x=1736924450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evJHXxUH8wpRsLAfhvt7S2AIimf3Ggw2vmlVHfN1TNM=;
        b=b3di3BN+8WIohf8+Nbqv6TTXTWxKcmaG7z7VpzObU2LQIXJA3NxnaBVjFvCdhtvVrp
         do7Vo8jL0tZNrJw/y845hcQATjfmjW+IjiPtZtQejZ3XjmaYy2vVQrfY/0eUUEgcNB3k
         gOnNJJn8sV9ekECUP12ujgA9eYaJuJLC94qGxTE8joO014ZIU3m0W7ukm88wCJPEex9V
         LIiPLP/LwGDfZgmCBtXLyyUJkc7k+/2lUhM/psqHuPcI9kXsI7rB4SUHWRs3YcONF48v
         kqO31paAj6f74Dq7Uyo/kw0oeXTZN6ZtK1XKZ21zdbpzHxAuc+ph1Cma784pNs3q5nMs
         jpVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU79R7HkalXoA8EFsV4ikMKDLn8s9RoRtpx6QuPEkp/xohC3ROVc3Hd9iixEgvUaOBh8zjWbCsnBohonMOrgLnO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz104i5PXJmP+tUV5uq1yIYN+pz+Jy5qeC0/Gu/ZJscpWU/iqAX
	DQ7Cr8wb8oscLs2nnpEdCs1/lUKP1lB6yApPC9P8FHHIA9A37v24RbOyHTx1UF8=
X-Gm-Gg: ASbGncsuBaL5DZSEdmHiyGD3sl5nMw4PO15vV3ijWyHATA1qfjVhl0f88CjILJudKvi
	zlJJruFfNK174PEEH1YQYqHIQi8wZNkBjMCd0ZASXY3db4fu4rei05NV6Wer4j8/v2ZWuaKNrKs
	G/nU2zY97F0mb8R11wW70Ztj2AViyNeoWtz5z8Y6AyfMV+kTI6JlRzEM4ziXejemL7XrebN16TP
	tIqRXDBvtmiGK51PnlO9CGhz0ECzjn2BLgg8kx4p/Q2vFF8WzK6F37+pxH62rWbWfERjb+LqFFe
	45npuG8CKoPTOKQKaNupzeHDWyc=
X-Google-Smtp-Source: AGHT+IF9X6lXCsguwyHO5KdCHubvdTIDd4Y888fAuDMWr6lGszjnzuDzetJYvdD8sXl2Z0Y5NvXbNg==
X-Received: by 2002:a17:902:cec3:b0:216:7ee9:220b with SMTP id d9443c01a7336-21a83f4f43amr30110425ad.22.1736319649715;
        Tue, 07 Jan 2025 23:00:49 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:00:49 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 06/17] s390: pgtable: add statistics for PUD and P4D level page table
Date: Wed,  8 Jan 2025 14:57:22 +0800
Message-Id: <4707dffce228ccec5c6662810566dd12b5741c4b.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_230050_376963_E7C43228 
X-CRM114-Status: GOOD (  11.42  )
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

Like PMD and PTE level page table, also add statistics for PUD and P4D
page table.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-s390@vger.kernel.org
---
 arch/s390/include/asm/pgalloc.h | 29 +++++++++++++++++++++--------
 arch/s390/include/asm/tlb.h     |  2 ++
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/arch/s390/include/asm/pgalloc.h b/arch/s390/include/asm/pgalloc.h
index 7b84ef6dc4b6d..a0c1ca5d8423c 100644
--- a/arch/s390/include/asm/pgalloc.h
+++ b/arch/s390/include/asm/pgalloc.h
@@ -53,29 +53,42 @@ static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	unsigned long *table = crst_table_alloc(mm);
 
-	if (table)
-		crst_table_init(table, _REGION2_ENTRY_EMPTY);
+	if (!table)
+		return NULL;
+	crst_table_init(table, _REGION2_ENTRY_EMPTY);
+	pagetable_p4d_ctor(virt_to_ptdesc(table));
+
 	return (p4d_t *) table;
 }
 
 static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
 {
-	if (!mm_p4d_folded(mm))
-		crst_table_free(mm, (unsigned long *) p4d);
+	if (mm_p4d_folded(mm))
+		return;
+
+	pagetable_p4d_dtor(virt_to_ptdesc(p4d));
+	crst_table_free(mm, (unsigned long *) p4d);
 }
 
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	unsigned long *table = crst_table_alloc(mm);
-	if (table)
-		crst_table_init(table, _REGION3_ENTRY_EMPTY);
+
+	if (!table)
+		return NULL;
+	crst_table_init(table, _REGION3_ENTRY_EMPTY);
+	pagetable_pud_ctor(virt_to_ptdesc(table));
+
 	return (pud_t *) table;
 }
 
 static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 {
-	if (!mm_pud_folded(mm))
-		crst_table_free(mm, (unsigned long *) pud);
+	if (mm_pud_folded(mm))
+		return;
+
+	pagetable_pud_dtor(virt_to_ptdesc(pud));
+	crst_table_free(mm, (unsigned long *) pud);
 }
 
 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long vmaddr)
diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
index e95b2c8081eb8..907d57a68145c 100644
--- a/arch/s390/include/asm/tlb.h
+++ b/arch/s390/include/asm/tlb.h
@@ -122,6 +122,7 @@ static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 {
 	if (mm_p4d_folded(tlb->mm))
 		return;
+	pagetable_p4d_dtor(virt_to_ptdesc(p4d));
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
@@ -140,6 +141,7 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 {
 	if (mm_pud_folded(tlb->mm))
 		return;
+	pagetable_pud_dtor(virt_to_ptdesc(pud));
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_p4ds = 1;
-- 
2.20.1



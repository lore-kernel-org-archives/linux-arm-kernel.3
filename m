Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06125E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 09:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyEzElX2/Cl2Hb0vACePBo9dDp7jwROhL3d0Mq9f7ig=; b=a0AFbekdahSoa4EJ5jY7+wd4al
	7TD5lYaNm4alTBPj3wbHWlwzGm/iw+/EnqSTHcCqZAiMCF/3wXeRBPmsmbktsZ5dyz8g6kfi3R6Qm
	SyzqJgQZ6vEe9JtLJwLg7dOdus1HFuLz4BwI1jafeaycq6JROFVArB9Yr5WMXovs09jG2P1eHN3QC
	W06OIh0ST1hEoXiMvKXY8VeFgm+ucCMU3T2COX8sjTm2vA1xEl0aDN1iqHFDmrbzoqquwBIvlI+s/
	fqn6Y/UqlOxkJZlHlrNUKbz+a/zsD/YGdROrcxNmy/lYGQiRzVuGv9Zb2uMAYj5MtSCxzlXn+dKxN
	Hw5Cx4Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfBH-00000009jjH-0Bi7;
	Mon, 23 Dec 2024 09:56:55 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPf0L-00000009hG8-0kVp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 09:45:38 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-728eedfca37so4215855b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 01:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947136; x=1735551936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyEzElX2/Cl2Hb0vACePBo9dDp7jwROhL3d0Mq9f7ig=;
        b=dHLqc/emEC32IdhbnFyJBVGn0kpxazeZeV79vtASzlkWZm7HDal4Jno5VPoETQ+K9e
         sugnFzXcWwF9ggYIDSZPbg9j5cn/dFkIsoLUZSN2Z4jWHEG6Rs/YrSCe+Ds69N9eck4N
         LltUJiJBEMbebWkHHoJebCuOybzlGGHXjlnxuN5mG/4BL7Z06byIbPffZaOxUbc+e000
         3Tz076Q5lUtb0AiHHV9R9lyc92pIzOZRUzNP2Pi0R1fMFgjYM2ocfX3JFlZcjwCSnO5F
         Pso5//zrMdNIVtnCnKvBnH46uTZk4zvJPx0HocH9EQq2VvkhJg71UKB/lk1ulWmxem/1
         rDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947136; x=1735551936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyEzElX2/Cl2Hb0vACePBo9dDp7jwROhL3d0Mq9f7ig=;
        b=MfxXpGgrbkQbC6EX89etESDa047r97m3Weq2oh7BqS7/kxS7+otB2bTBY4akkV4kv0
         C/Sk2Bd94CQV2sQ99ordJQgMy20Urwdi+SfCznw0zrE3pBohHqrDD0nFu13FhxXzQ1J3
         58RuBaaS580HWqsBG0rrA+JVP/nYBgKWYXJS5JNv5BD+ULSFdoygqJwbPZK1xoNZ/xfQ
         u5RJNcyhdonHMvRkd0Nh8UsIcUgKpDFWGeZwnMuTRmwUgje8qLdex4di+jUImmYoZUEw
         5RjGeY/ufR7UGR0dKB1zC60ng5XUCRrxxAl4mH+6G5MhusbRjFlPrsbRYpjSz2SgNhTw
         JqtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzzEK9pex0jHR0NKHecuSviASs7D8lDLSvd6st1WM9u9z06p2b4qwJssBdwo7ZLbFw9GDm8lxyOGcIhq9Wmu0y@lists.infradead.org
X-Gm-Message-State: AOJu0YzrCLSVKDP0UHh4CK08ihQHuF5PFh/YiKOuwmLNZdhzEwaMTFQA
	vFZAUsVnsShwD7G2GnIBjUh/XZaLytrGOtAnl2JuTiJKnavHuSjDLhGA+wjRJZc=
X-Gm-Gg: ASbGncvfjluim1Prth0yyu2hggg3VpLxa9bLALcVnSfoMFpYt4J9If57nAndFqvLlTV
	NnkziZEfinl4qvwvubBBMaAH2W2sHmYQDzByXE3okiDTUm2N98B+h4WUyHy83Cub0AwCnX99Ww9
	ZNTEex4dV42HIMEeG+Vf7V2r+oR7LABPkcWgpQ1WV74Vwy7zmhPvoYg+rHNmmx2OKSNBauerVET
	cWfdCKfTF2gjwD5IIC6+WAjSYUBAx0o56MzYdaL7l1swdhWjKyxJInnuqTpr6V9I/F53IKZU8BW
	U1Q+iHF81HZ+cszPDd8cqA==
X-Google-Smtp-Source: AGHT+IFFxsa0Y8D8QMIcsR8+VA1yaCfovsoDpuS31clip0UDjebZ+1TP8q/TeJDt5eTrdc0wzKH4iQ==
X-Received: by 2002:a05:6a00:399a:b0:725:b7dd:e668 with SMTP id d2e1a72fcca58-72abdebb868mr13954007b3a.17.1734947136545;
        Mon, 23 Dec 2024 01:45:36 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:45:36 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v3 12/17] s390: pgtable: also move pagetable_dtor() of PxD to __tlb_remove_table()
Date: Mon, 23 Dec 2024 17:40:58 +0800
Message-Id: <ad21b9392096336cf15aee46f68f9989a9cf877e.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_014537_261165_312B4990 
X-CRM114-Status: GOOD (  11.07  )
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

To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
PMD|PUD|P4D to __tlb_remove_table().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-s390@vger.kernel.org
---
 arch/s390/include/asm/tlb.h |  3 ---
 arch/s390/mm/pgalloc.c      | 14 ++++----------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
index 74b6fba4c2ee3..79df7c0932c56 100644
--- a/arch/s390/include/asm/tlb.h
+++ b/arch/s390/include/asm/tlb.h
@@ -102,7 +102,6 @@ static inline void pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 {
 	if (mm_pmd_folded(tlb->mm))
 		return;
-	pagetable_dtor(virt_to_ptdesc(pmd));
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
@@ -122,7 +121,6 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 {
 	if (mm_pud_folded(tlb->mm))
 		return;
-	pagetable_dtor(virt_to_ptdesc(pud));
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_p4ds = 1;
@@ -141,7 +139,6 @@ static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 {
 	if (mm_p4d_folded(tlb->mm))
 		return;
-	pagetable_dtor(virt_to_ptdesc(p4d));
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index 569de24d33761..c73b89811a264 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -180,7 +180,7 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 	return table;
 }
 
-static void pagetable_pte_dtor_free(struct ptdesc *ptdesc)
+static void pagetable_dtor_free(struct ptdesc *ptdesc)
 {
 	pagetable_dtor(ptdesc);
 	pagetable_free(ptdesc);
@@ -190,20 +190,14 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(table);
 
-	pagetable_pte_dtor_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 void __tlb_remove_table(void *table)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(table);
-	struct page *page = ptdesc_page(ptdesc);
 
-	if (compound_order(page) == CRST_ALLOC_ORDER) {
-		/* pmd, pud, or p4d */
-		pagetable_free(ptdesc);
-		return;
-	}
-	pagetable_pte_dtor_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -211,7 +205,7 @@ static void pte_free_now(struct rcu_head *head)
 {
 	struct ptdesc *ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
 
-	pagetable_pte_dtor_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
-- 
2.20.1



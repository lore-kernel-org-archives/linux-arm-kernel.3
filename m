Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F7CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 09:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+CB+suh8vMLKY78fggEtIk5gD9ivloFZvOHbrupXaAs=; b=z82yTW+um55aZ1FyuWGHo5jMes
	FkA8Cm6t0NJzRyiSqGRsZYF+24rSnU7g2JktMVpEGAFE2bvhEuJcgsO0vzerQNf4lcNu7KBx7WMui
	Wa4ROmgpXR0vScXyxeBJEm9uOGmbKlcocSpL9XStFGBfXOghczeJOOuVc/Ye1I+leDCJrVFmdp7gH
	BIlpBB5NQMnQrtvKu32tsF14TIjNr7h8fGb3CxeL5esUkmw12QCwzym0jL2sAn6kN/BJCECAgohd7
	XOvE02hf3ARzbRXcw16IwGB73yh5Eo8M9YaYrWCEZPtMgJwX2ntb4dWds2LPIUbHmN9f47FO5yrJw
	OUQuKaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMO7P-000000065Ew-2Mas;
	Sat, 14 Dec 2024 09:07:23 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMO4o-000000064Yi-2F4h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 09:04:44 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2161eb94cceso17512665ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 01:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734167081; x=1734771881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+CB+suh8vMLKY78fggEtIk5gD9ivloFZvOHbrupXaAs=;
        b=ae8JwId/SPhjU5F06pIAoBDXFn8/lejJ7rCBfYnb2lch13fQIyr7mWOZ0LZCno9oAE
         vfdV8C+DAtJQsE6OibGGnv97bdM+KONYtU0u8JIGG8r+d64peKGCsubheq8xBL02wizH
         Z73x1o1+0damhtTYeEDVNFOx8njvXfsJqzjCmJPLsH/iPXPRUI+RSMZp3iHVtqWISQ1G
         vtwCf+RlKoUyTFGKG0s7HqJ7qwvl/b8AfgKYUxOe1tvpVJFCVxMZUxItVISrH5tsFGx1
         luRv2P8nWmL0j+w+HOjVUxQhHoVZyVrcy3iKJLKtlXe4w13vQhiR/VSF5Byh9DLBovET
         A9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734167081; x=1734771881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+CB+suh8vMLKY78fggEtIk5gD9ivloFZvOHbrupXaAs=;
        b=I3lTRHjbTmPYELZoRtNvUaGmLFRvoQmEu8sRu6ASq5n2SKKbPtbFFVMdOE7bxYMaQP
         82AJzWqPK8gAqIKYILrLWMoD27lQzVxTDTmUUWAcOCIsXWY6enbQV9/bIDV1jY7G97TA
         JgQTHriFxIgeR7Em7hfJjhGFyAkS77Fq0I+35+tKgXcvUffLpdJyrYc/m7hTDSiYdzBP
         6d4APUhzWenUhFFRaeTL/PEjocMCPuU9bXy+MXKriZMJjtWv3ExQAkUWtC+rtL/Q1s7h
         Nyr1zoNn79oLzCyljBN55w5lHUTChTsNx+honyqyGQK3WvtAcV4rccxU8I4KopC4VwA5
         r/qw==
X-Forwarded-Encrypted: i=1; AJvYcCUSfhnKG1ja4vabQrUH0+i/oNusPwDavb0M3f1AMa4rz2+kJwFkhMZdVYbjRLUPMlMIi0rMbYfQa5gEP4Rv4z8z@lists.infradead.org
X-Gm-Message-State: AOJu0YyRd+3nfAOPJHW+9hyMC3kFR7Xe5a1WfR0QuS5jbL4q4T8WKWmB
	b6NEENJvl6oNcDoKkeAPOfUkAiJk1VXm3HsZIt8CXhHE47QouZnfiOmj5r+UKM8=
X-Gm-Gg: ASbGncvU5Mp5lxdAeTyjIW/oGnV+ZpHvpt8zmAR56EbRcJkJ8fCC4AGqVAWTvbrNzKv
	92bwbbk6q2Nq3J7RrKngFFBSr+hp4KitWq54N9VFdfgtE/R4wVUUmuthJDxdctT2X/SL8njv9lZ
	9opgLe2s3LNPm8ivvdUKiIcQMFJmQOED4geA6lQlTddLmCh3UyX57aE2m4dyOBn0YLk0CPskd37
	YcLpd/txF49/l7IAI/fY2gjxe776IMp4YXYXKlFWoR+lu7okWXXU2PXDFHv3/S1ksyfltfrZwrn
	eHOk64yRA4CczQxobPa43kzELxnQQg==
X-Google-Smtp-Source: AGHT+IE0QPwbAOQZHxlo/n3+wbqMrZuKXsuKTSsN4acRfuabgW+JUZvSc3827znPlMKVF1C6eV/6aw==
X-Received: by 2002:a17:902:dac6:b0:215:8847:435c with SMTP id d9443c01a7336-21892982123mr70599045ad.12.1734167081724;
        Sat, 14 Dec 2024 01:04:41 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([2409:8a28:f4f:a9a4:5d46:4ef0:daa9:1db8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5a90ba0sm905731a12.16.2024.12.14.01.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 01:04:40 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
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
	rientjes@google.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/12] arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Sat, 14 Dec 2024 17:02:53 +0800
Message-Id: <1781d3bab60aade7d64fbeb6682b9e73bd673d3c.1734164094.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734164094.git.zhengqi.arch@bytedance.com>
References: <cover.1734164094.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_010442_585104_CDC6DC0F 
X-CRM114-Status: GOOD (  10.92  )
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

Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
table pages can be freed together (regardless of whether RCU is used).
This prevents the use-after-free problem where the ptlock is freed
immediately but the page table pages is freed later via RCU.

Page tables shouldn't have swap cache, so use pagetable_free() instead of
free_page_and_swap_cache() to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/include/asm/tlb.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index 408d0f36a8a8f..93591a80b5bfb 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -9,11 +9,13 @@
 #define __ASM_TLB_H
 
 #include <linux/pagemap.h>
-#include <linux/swap.h>
 
 static inline void __tlb_remove_table(void *_table)
 {
-	free_page_and_swap_cache((struct page *)_table);
+	struct ptdesc *ptdesc = (struct ptdesc *)_table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #define tlb_flush tlb_flush
@@ -82,7 +84,6 @@ static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 
@@ -92,7 +93,6 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
@@ -106,7 +106,6 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 	if (!pgtable_l4_enabled())
 		return;
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
@@ -120,7 +119,6 @@ static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
 	if (!pgtable_l5_enabled())
 		return;
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
-- 
2.20.1



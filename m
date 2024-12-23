Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F6DE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 09:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/tJ15+vmer/NbqXoUznjybhQp/MgC6GOdT/GuQUXpM=; b=dylafXy42/ztprvgaLJTUPN0IN
	As7K53LbNK3/NaXrVMOnHnqFJVa/16RsSH8gyDGXqo5wcA922wX5u5OpNcwzcS880Nyh2sFUckGLv
	k91h7A9nrcu9m7j4xZJMkz5cBEG3sA+t6puc29Qk7CgaJqAER9tXhFe+23X2QPG/zGTL6HuiO3M34
	rs3ODs6PGAkJIfeJ/GaHeDecKPUWyl/DVH2tk9GEfm4UqUobADHt5FcZIIvXkqMzAdNz/MrGnxsIi
	gZoDuPx0ejyFGeGiUXvJRGuMx4T4k6Cc7bzxjvYp6//VBWHDjUgxS3v8FYKO3w7a7B4L9whC823Pg
	cSKnYrjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPf1Z-00000009hvW-0Ebj;
	Mon, 23 Dec 2024 09:46:53 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPeyH-00000009g9n-2vib
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 09:43:31 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-725c86bbae7so3476781b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 01:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947009; x=1735551809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/tJ15+vmer/NbqXoUznjybhQp/MgC6GOdT/GuQUXpM=;
        b=VY3XOzHwLvx6Xf7W1z+BGyRQXEuw2kIxzA6nwdtUvWhxV1/4eJWcv9c200FLpgIiRr
         yX587j8rvDds4waM/KQr8jLfs6Ywk1kwf6TVdec6zB+7hnK3DKDeDYSL0IQs5zJQXPBc
         ywWxVCi+uX+xpoLhp7kVlsqvJBeSkDRjMmfFm9QD52hKRiyQsj7buF8QCwBg5d7Q19pL
         15vGfuIVB9S63saaxU2AKg5KLZMyhNi/rWOdYvZRpMAlSZ7fQn5RKQKgjaikC3Yvssd5
         Y9CoePAOVXr78Wp3JDD7PtgdvigEU6i6f/fJij/S/66ogzdeNWg0KEsSFdZQHIjwA7wm
         8cJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947009; x=1735551809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/tJ15+vmer/NbqXoUznjybhQp/MgC6GOdT/GuQUXpM=;
        b=ax2GzY2kqIFTbjYUUpBmckSDY87Gd4Jtc1u5nTKF/OEKlcsMDv5PttaQeW+uYkBpit
         XneByaDmHvlJiqbJ50UOby2cMdnzGIi595OKfZ7nFDeW1tAx78NqPD5j1UR311M6cHe1
         xiBJHUa7tTVZois2aWMKQ5zL7eQUFmNw8dAFgiNGBt8+lmxU+fJXPJAZZ9j4t5+noYzg
         ChT6V8Gvuy0bPLw7b8wprYztiqhMM9fmvgQt5qoiEfHxeSgjos3s0WTDlkkVnRpopUrP
         qgaGksVEUHg7iIMqDp1A1RMjz4bQcar9hfi2Vmzhej1s9f6tps1RNKXO0sxhAvSWrtec
         FveQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiQLlutK58k3HsFs/IFNZnAAORWMsSJU8l9m+bWpzmsO+jlnIexMFeqU5/TxaKWVXpCvH2R78Q1x36PieB5yP2@lists.infradead.org
X-Gm-Message-State: AOJu0YxLrkQsMQyJ0pwlarHgNPEEbTUReOIZ4wLSn6nEu1S5Tp6lYaoL
	AgydQaJw8JM/1Ffw2EWfY1kkYtSbhiwO5oOXTDERx3ZLRhmpX99XsENLagAyF0s=
X-Gm-Gg: ASbGncuaY7fT0q1qxHf/i4ffZLmrlJeG0jxFR9YKEvtQQvNpfvnpJmexkx1xUlD+J7P
	duESlgqywZAsE+oNIfDTtC/Y1b1Zaj2zQ7Z4YGfVec1raUbSLA0+qM1zLuxeKpPyvSuPJ/3u5uK
	l7oCgcrHGoDKeidq+bWxoJcrW0gWgeYY1IVwVNULLcMmXeKFc9noG/UMF6H0raOfoDVwkK8PR9u
	fgiZoVkLe5w9Tfg3Hj23SVwr8ip2jyQl/9LRxfiGjMT0GGzC03L39pUhi+0vpQN2tJqVEj/MA6s
	5dV0Kfm3XkI71I1WOLiU0w==
X-Google-Smtp-Source: AGHT+IGn0WgNlH4n6jFU+xV15Lu8l6dnMV2FFWuW4zvXTMVJTCCaTT+ZxewqFKpQcJgKvmYU0RJrVw==
X-Received: by 2002:a05:6a00:35ca:b0:724:f86e:e3d9 with SMTP id d2e1a72fcca58-72abdecbdb4mr16058641b3a.14.1734947008718;
        Mon, 23 Dec 2024 01:43:28 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:43:28 -0800 (PST)
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
Subject: [PATCH v3 02/17] riscv: mm: Skip pgtable level check in {pud,p4d}_alloc_one
Date: Mon, 23 Dec 2024 17:40:48 +0800
Message-Id: <84ddf857508b98a195a790bc6ff6ab8849b44633.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_014329_777111_7D48F7FD 
X-CRM114-Status: GOOD (  12.17  )
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

From: Kevin Brodsky <kevin.brodsky@arm.com>

{pmd,pud,p4d}_alloc_one() is never called if the corresponding page
table level is folded, as {pmd,pud,p4d}_alloc() already does the
required check. We can therefore remove the runtime page table level
checks in {pud,p4d}_alloc_one. The PUD helper becomes equivalent to
the generic version, so we remove it altogether.

This is consistent with the way arm64 and x86 handle this situation
(runtime check in p4d_free() only).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/riscv/include/asm/pgalloc.h | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index f52264304f772..8ad0bbe838a24 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -12,7 +12,6 @@
 #include <asm/tlb.h>
 
 #ifdef CONFIG_MMU
-#define __HAVE_ARCH_PUD_ALLOC_ONE
 #define __HAVE_ARCH_PUD_FREE
 #include <asm-generic/pgalloc.h>
 
@@ -88,15 +87,6 @@ static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
 	}
 }
 
-#define pud_alloc_one pud_alloc_one
-static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
-{
-	if (pgtable_l4_enabled)
-		return __pud_alloc_one(mm, addr);
-
-	return NULL;
-}
-
 #define pud_free pud_free
 static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 {
@@ -118,15 +108,11 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 #define p4d_alloc_one p4d_alloc_one
 static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
-	if (pgtable_l5_enabled) {
-		gfp_t gfp = GFP_PGTABLE_USER;
-
-		if (mm == &init_mm)
-			gfp = GFP_PGTABLE_KERNEL;
-		return (p4d_t *)get_zeroed_page(gfp);
-	}
+	gfp_t gfp = GFP_PGTABLE_USER;
 
-	return NULL;
+	if (mm == &init_mm)
+		gfp = GFP_PGTABLE_KERNEL;
+	return (p4d_t *)get_zeroed_page(gfp);
 }
 
 static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
-- 
2.20.1



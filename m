Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF98E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 13:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nJ0bdEaVLB0+13gaCQHdoBfFkuXXT3Pqta7GOjv8Bo=; b=jvIaB2wWUQEGs3Xhb5fwwVRlCu
	TY6wQed54lNNHVQm8S3/LSIAokRC4+SLfG4TuLz0tMnuz9lUIgNisLaQ7CueY0c6hrBIxipOlzSd6
	XzkkBfxSsk/8CB5Yc4rbxrp2nVIjDsxgjxhA4h8UwmX2ulgxCIG9MPQYpqJBkCvgUXUi4w0v96MGa
	03KwjsRdMiQC4jhQV8OpmzI0zDq/Royj2qozL08ggeEly5MUL6VAHngJe2onDS2yBNE0kG0FZiCrv
	LJikx/7k5NNgZsZS8VivgLm11M5E0v0/ZCQWFgZt8wwxQEUYzNKpi550HJrrqTSK9uPqqlEaSMLat
	UGRiNe0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtnI-0000000GgKZ-0MnR;
	Wed, 18 Dec 2024 13:08:52 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtkV-0000000GfaM-0vNk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 13:06:00 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2163dc5155fso55965855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 05:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734527159; x=1735131959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nJ0bdEaVLB0+13gaCQHdoBfFkuXXT3Pqta7GOjv8Bo=;
        b=TGifs1C29YB8qB1pcTlGhI08D2dPJf9zCxR0+Zrr8DKBC5Jb6XnPDABFQ9vJNpaZ25
         yH8uHOe8Ml5f3cyS7lBOcfZE4uIqziiK0xwVd5lng2EY91FyjizTW7PF4Qj/0RD8jj24
         aHtxGywQ8DkIvgbzG3NiZevu/rip+q+UZtndxjTp4Hmn4r/zTKkB7CQZQaNTjUMqTXBu
         kW2NnnjHmzVtYc0+JFu1wfH70WHfklIR++NtBRFoO5KcT5jYhjNz5BxaLgfI1iavJ4eZ
         9EgBtgJ+q/7M6eLZrYjgpL00u9DHlzgF3yNV3WE2/h0ZPm7zNDXSuEvI13nzz3EHP/RD
         1JuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734527159; x=1735131959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nJ0bdEaVLB0+13gaCQHdoBfFkuXXT3Pqta7GOjv8Bo=;
        b=ZgFdMP8LLbEWm2WolY/S0HvhaSiMX3u+vYqHmfqVEax6k+c7c8Ccdq0rIIAq5I4J11
         M0FbS8P49lm/gSDFgsBi5g1rdiryB1AXusRHSwgO3Xxx7gVQpfLbMSFcWvu8MHHVg11+
         8E+gufEisk0UdjVSbvoSHWWiZR8FdSU82ow9vxWZaEGanP2GUiHrP30NSRkxaU7dUlbF
         J2tKGkcr1SAquBaKRX/ElSRC/9g1lCBRgbBOjr9kZEauuIxrhzgJg9Wz8TPvj3wnOsvu
         7Uhf8DUv5NdzZPGw0709SCZZdDH0/SSkqABBb+FQdBNy/KVBMd7nkhpzUmNts7GHcM6S
         tGMA==
X-Forwarded-Encrypted: i=1; AJvYcCU6B7skshilmgRC9S8COPdSe3s/rp5+CrZdQRObcWqkj7a29m/1MKr/aJcP4cqTHZVNZz5wKvpiIpCgdwohz5w/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy03RcDCSgV8Bxq1w89GjxBFlhdBTPd/BJ5hUCfWnjp71kbB073
	onTy/FgtyvLUJSsSera8KBq0mrKTrpiP5KtGFF1e+9AnyPK4nU0mSi8L9PxU+pM=
X-Gm-Gg: ASbGncv/UN0rsHdC6d70TGG21gjeiSZkI9YlvBz0i5o1YfGnwCt64XDz6uGluwRo+JP
	qdaKig6RYEF0ChqZqiUdfyBkzLyykb0nwjbimIsQjvuYjUbsBVRyp5bbzKXynG2hwgVf/1CkZvM
	PyrrziZSAU3WEIz1ziKw9WB3qwAhmMztkT2OXY6WihhZcFtUb2bjnA2roi6KcBjZQmbhkSFrpUV
	wB+MgesaHh9CmAfkAGFzjoM5uvY/BE7MGRkaRHvU3zx89i971wd023JJJuieRY7OthEvnZM4065
	vl1wGmKCXOA1w55QVLOmAg==
X-Google-Smtp-Source: AGHT+IFH9P+x/Mfn/YDKtSKvkH1s3GazvpYiwIZf55I8HG6lzpeJuaV9oSxqUwHwuTwe8mBCoFXtDw==
X-Received: by 2002:a17:903:41cf:b0:216:4dfe:3ebd with SMTP id d9443c01a7336-218d725ebd2mr32859975ad.50.1734527158730;
        Wed, 18 Dec 2024 05:05:58 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1db755dsm75751825ad.42.2024.12.18.05.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 05:05:58 -0800 (PST)
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
	rientjes@google.com,
	vishal.moola@gmail.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 07/15] arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Wed, 18 Dec 2024 21:04:43 +0800
Message-Id: <634f0236b4b4effc528b06e108b7bda51cd0ea2c.1734526570.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734526570.git.zhengqi.arch@bytedance.com>
References: <cover.1734526570.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_050559_260149_2F2BC5FB 
X-CRM114-Status: GOOD (  11.60  )
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
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080F4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 07:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRYydr57EpvJJkVepk/VS3bq1fMuYMijkZdKL5zejaA=; b=tG9Lls89Wn/JS0XZoMNfc3mTQD
	PVqz0ujRiryONn6Q+e8WCeJcc2Z5CpCIZgsaZRt9l2o5qUhYfhPRSZ39M3CpS86KY2daUdEEJj9DK
	wp5HbNeWnMVZx1NlULxaQSZLKQJwGB/CVnXZDXJYhBi8VMLGztFRuEH//8qYz7gfe02/e/WLxrOfk
	ozodmHBZjsV5mZTcw9y7i3vT0q2ZOriulasGTBwwMd+1AYWORE3se0+TY+GTdw6zbaAQUQ/r9btwN
	RVJU2nTdfR9nGTZhdL4/XF57LssxfwcsPfO7MXl5U2vFRsZ8NBuiapakIH3//J9bRL1viedIZclxT
	s7WLbh9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQGW-00000007OM4-03sC;
	Wed, 08 Jan 2025 07:14:08 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQ48-00000007L0x-1ERq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 07:01:22 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2161eb94cceso171118635ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 23:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319680; x=1736924480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRYydr57EpvJJkVepk/VS3bq1fMuYMijkZdKL5zejaA=;
        b=TBq2iZsuFTlRrrS75227Sh2ZV5KQJz8EyjQIE70O1/1XfO5C7cJnr/lUN63CR4qNwj
         DMk6KzEgzOt60eKc7c6XBO8a5Xe5WtT1ajJB9WMEmrnedayRIL6URr9Uuk15G+t5tiFj
         uSBmMNnKCG40wRiTHpI/dX3yaQIF08clGycbH4pbXgpGhATFNvM9w6ZRWgJ9jpDgaJWC
         9nLJ6QhCn5+1bN7rbfQQ3dnEuIML+dOmseyhjAK6Fssz14fJ3fA2KMe1fcJiEL9QbbE/
         Wgpg0FX4IdH8RTGLrQC7549X2q7xBtCgs4Xipag/gwAQA1qVixdif7SFjs6X4wP9RK4a
         yxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319680; x=1736924480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRYydr57EpvJJkVepk/VS3bq1fMuYMijkZdKL5zejaA=;
        b=LubQKSuEke72II8c4UZSDypwuWg5uEfetuvJtQoEUzHbtckc3A73PfEBf28Vj8vvCj
         bX/xfrE/7Ltu5T0ByNN9eItKPzOnpHJ/0DAyA6JSurPZkaC8FcSjV4SIUuFox6/BfXGE
         ZMlVmLzN+iccVCU6uioe4wPPYp5NOdiD/EmWK7nNJ4Js+BrUasOf0qAE3KrtkX7d66dh
         dAvm7yo8VBm4yCPtDWXQjaUSbMCw/vOY0Y+k97yg1XfcKfyu1SIh61ioEe14G3R+wygx
         8Estw2URb5IRlwY23epES00Ia9I8Rzf8uPT3OkQLsCzR4lWmYOYgYQE6OkNCXws74n8e
         o4uw==
X-Forwarded-Encrypted: i=1; AJvYcCW8IXE1PyOOqwTrU2241UbZw8/ohLCQq/a3kR5XwxWki6YiXgYwkmsQ01tLb212MiVls+f+aS2l/SsGTdXceYD8@lists.infradead.org
X-Gm-Message-State: AOJu0YxoJudZuGM5oiuhocnMKR0TlvpsqCHvD8O/QpO9iwWvCs9MN2Xo
	hNDaDcrxoe6H1L0m3bsx6YpYh0IKcC4QcH+OmOFSltCNlb5893x6eKBhVWKo+nM=
X-Gm-Gg: ASbGncuADyE6Yd+ajoym9HdOXZLuyYXJy4MRtHlgW28VCRH9AKoRnj76quEUzGX1Oo8
	6tlRD6VfqNDG5fWXIWJM0BlYwx1LCqXzE4I/f2Aiju2CvJXJMnLa+f1VsKuJhKAlJiETe/a+0Bx
	FeicvtUh1pvOJqw3eFutVhdQwWln0vJUd7Gtx8484YVxCEhIo72i8rHMSWqY5C8835AJRejZE2w
	OG9Y0i2YQjDOdcg5Gt1Gepl7UwJc1zsYMnmNNVDQq4Ox/laZ3lIiVXKqOx17Oq+BBT64KtcpFmR
	tZtPeD5coeD1Yoa83NUuhe6KIuU=
X-Google-Smtp-Source: AGHT+IGA+MEO+KKVHOehVcxKdAaP4kVFc+4x/MGW5FidU7ZYZhG+ejtfRbHdQiRj7WdzfqmV0LUjgQ==
X-Received: by 2002:a17:902:d352:b0:215:8847:435c with SMTP id d9443c01a7336-21a83f4b133mr25527805ad.12.1736319679689;
        Tue, 07 Jan 2025 23:01:19 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:01:19 -0800 (PST)
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
Subject: [PATCH v5 08/17] arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Wed,  8 Jan 2025 14:57:24 +0800
Message-Id: <327b4b8990729edd4ce97d9d5acbdaff2d9fa1d1.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_230120_351790_3E01C0AA 
X-CRM114-Status: GOOD (  11.65  )
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
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/include/asm/tlb.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index ef79bf1e8563f..59854c6b97bc5 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -26,12 +26,14 @@
 
 #else /* !CONFIG_MMU */
 
-#include <linux/swap.h>
 #include <asm/tlbflush.h>
 
 static inline void __tlb_remove_table(void *_table)
 {
-	free_page_and_swap_cache((struct page *)_table);
+	struct ptdesc *ptdesc = (struct ptdesc *)_table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #include <asm-generic/tlb.h>
@@ -41,7 +43,9 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
+#ifndef CONFIG_MMU_GATHER_TABLE_FREE
 	pagetable_dtor(ptdesc);
+#endif
 
 #ifndef CONFIG_ARM_LPAE
 	/*
@@ -61,7 +65,6 @@ __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 #ifdef CONFIG_ARM_LPAE
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
-- 
2.20.1



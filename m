Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A6BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 09:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=; b=ng9aMOGRVkGvSzb8NPlJxarN9L
	ARCOQ9Opx86Whi71QCvMQFN0ypDNLzOsQAe2eatinGgtcFGSCh0gW81KyRrDsPWY7Uur1acO8kt/f
	arx+3ve5UOHRACFILn/rMfwD+2nt6xx6d2hf/dzwsKObRiZxBAemw3rlNyOei7NwE6r1Ars94gyao
	0RzLhpDdvlFA/6MYnyFHUDNMzyhEgIoVQnfS9P19NXPxsaZlJAL0UKrTf7YHFrZEEI3aVqOBbf2TK
	XffDDFZsKrbIA8Gceqt4aIiro+TQtwxMa21QRDXheFtER4ofLpYE48P+7ITrE11qrNcbAscU3irOT
	1hbL+Mlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBwD-00000004uw6-1rht;
	Mon, 30 Dec 2024 09:19:49 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBn2-00000004sYC-30r2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 09:10:22 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21661be2c2dso104540335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 01:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549820; x=1736154620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=Ay2uO+oQ9ZMicfGr72kTrpArfMgM+qu9/EQQXyZsrBVmvr23JWeprgDQ2+6sI1hpJ4
         JdvfOn1jwbmINmY1bNDeKZE80+23mwEdHaQPvHNwhmXoTm6GABGs80obK9M/LMAXPBuW
         S1S+jlbtczzK5eQSeyOTtbsQQ7KMBR5NdQi4pquEjJLOg1fJ1D3jnoL7Gx5za4Keqdd7
         Jo7C8V8NKapS2Z3esQUeQUG+ikT6plcas5uWhVM+MdvU0kSUMNwNRYSuz5tR+cs4nAFb
         RQqJ/0UW/7tTzAnUl3acQMN5rckarCy2yPx2vsG/6LtZlMBNuAe6ngjGPU7C29EtQ3/D
         W0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549820; x=1736154620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=rd5Xxxq/Me9s1VUXd0nHn30qGPHyq+u6L9i1XrGKwdds4/5Bkyf7yT0+HFmW78uwIX
         NvT85wfheg7nu1Es/2Rg25E6WYayE8jsLqoBOX7a8YfiSE/tsGVENzZYgPDlHWJ3Nszv
         suxDdtmc/9SgG9k4M0tT33dub9xU6HGgA5+gqYm+3k/lyrR6TD8B7wHxUPDmolSgzqF2
         SqaGLl3IJ432En8tSN0kcVky9R6GxOTZ90+lNnVbVbtHIq3KCkKBnWNE+VWDNLTSISTb
         RT8EmZhPvVqbSJ/1b98FW7eJeOBXYiDE90shQuD3DG/LGrlI0q8rGTMHAD4hb5KwdVSb
         l1Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVxC4kvOxHg0CmTfOCizNVo5JkThArCypCKHaLG4zlaYaY2MyIg5U2Np1XZSslXlXkew9JrQ0XRQoePF1kuQIa0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm/yelreP1z7pq+wgz/kEvQcozpbBHwBDq4s2gQbWoYDZ6gBJr
	nrmqKBYeQHAJtBeCdJtLGDFUnA9pq2OCCekNyYFsDYAvusW2BWcb9F8SWLZq8gk=
X-Gm-Gg: ASbGnctFBEgdd7kPZcwxQEfrZ+SGl+k87E4GoziRQThDx/9Is1+owPuZAjnOLBpchEF
	ypnm+kgEDQ8C0ictrmo0CUSHKbL0BiBP7IINUl8QpGxY7O+eUqQ7S8A3DnNTtA7LoFH1xdLTOiz
	ADR/a7Z2tpKXwtJWfuOaFW0xGNc8pAQ4MdBfbJM+MXPog8/7axPYAQ1asFgZw6mIUH6KUiDbAeA
	o8vCC2HIkgBOEoEwahzDcs3A3upkZBKDRicEYar7zEptLa9FjbT6D/gaapPQUBT5ZfoHgMNU8Ds
	/nbhvwTLssOs6SEISxjZFw==
X-Google-Smtp-Source: AGHT+IFX/3Df8AQRXbgF3uoP6h0ZSX98E/foDuPWt5IdgjLk00IpLZqU8w+lhMMb/JJOCncpjT7B0g==
X-Received: by 2002:a05:6a21:670b:b0:1dc:7907:6d67 with SMTP id adf61e73a8af0-1e5e081c8d0mr60502051637.40.1735549820172;
        Mon, 30 Dec 2024 01:10:20 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:10:19 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v4 08/15] arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Mon, 30 Dec 2024 17:07:43 +0800
Message-Id: <955162bfbbcd9fbb3b074e1fe2aef4f64b61d6f9.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_011020_788042_2624029E 
X-CRM114-Status: GOOD (  11.70  )
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
 arch/arm/include/asm/tlb.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index ef79bf1e8563f..264ab635e807a 100644
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
@@ -41,8 +43,6 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_dtor(ptdesc);
-
 #ifndef CONFIG_ARM_LPAE
 	/*
 	 * With the classic ARM MMU, a pte page has two corresponding pmd
@@ -61,7 +61,6 @@ __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 #ifdef CONFIG_ARM_LPAE
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
-- 
2.20.1



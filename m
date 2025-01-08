Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1239FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 08:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzpcYcAmR7wIjJMr9qjJ0ueu9TAADg8s+gPSbWL3su4=; b=176YTXJRaEHqmxppPGKGd9Vvwv
	YIuQ8jtwZ3bLJXxqko8ipaOULWxBfYsHNAI7wjHkbVzWlLKs+KWA7+pC1MkLJPB+ehPSoq/KZzLn9
	24GgTYJVGG04Hdut+roGWpsHG+h9zY26RDJe8ddkh2HZXDs+vjshTI44Plpg1QLlRRG2f7jLvcotp
	f1t/uKp4rIvG6aEB/cQ0FdHtl/pClaCApsuIiOoKtfkrq44i1CcQ7qIAmHSksFapH9A1d4Zgu/etn
	olPwnuX7c4Snvw93Kg1O8d0pgWZqWqhR6d7v1+GylkBecTyubfmUijuowmqOWSvnffSk6mzYzVgVy
	nyxbSEcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRYr-00000007adR-1q96;
	Wed, 08 Jan 2025 08:37:09 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQ5u-00000007M39-0sft
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 07:03:12 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21a1e6fd923so29795145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 23:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319789; x=1736924589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzpcYcAmR7wIjJMr9qjJ0ueu9TAADg8s+gPSbWL3su4=;
        b=S5vdFaHFdQItXUNGs7H339t7u3R/c3dUU3b4Go215aB9bwk8Qyrf10btrcUkpba+j4
         tkdvLCaXn7z82Lvvex2C04hCU2RrzozLg9zL6FTp3citEv/F/LF+D0lnYPbWLU4JOFwe
         423twPHZk5fY8lvrmK8sa2nMklEr00wAONur9N41qKDN5nqo/6302Xi2TSaqB39d+JXM
         J2sP8rQVjkUITfVjs2ogsJzZyarxnpAjrIT4Ein+o8+RBi9+oZqB5IuUWbVvhga+fFnr
         JaCA9qdmi2O8IhoJfySZMIAtXH099oVKrM62HJBmVsNKcFobqneTQK2auN/lvh6+8jJN
         qwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319790; x=1736924590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzpcYcAmR7wIjJMr9qjJ0ueu9TAADg8s+gPSbWL3su4=;
        b=oQ+fucoRUKGdGjuvHD7te4OPwFYoWbh0aPnUaiGGCBlUhtDWzWrS9BuT6aeZeSEwI1
         dCYjfPB6UScHfNrAFdKUFbb8o4c/mi8Bk+1A74zKwfKwA6ojRlhobsFk/U1CpKjcABAv
         D7uIse2irSoznKMhLgPncno7GEe7/PVmSR8Eurg6R+zfDRJ9cj9PsrY1c7BOWDGV+CQl
         h7E0obXYnHMyqlH5VpK57/lsgmaJGIyok+xrtLeWTn3MeE/fnzzpoSU7IdaRmWzE1UVR
         sWK4x8EwqAQXblFhdHcw04WqSRsdKlAwzPXv6r8ONk6Q74qnTsKoOtGfoOm7lzB/S/bd
         CXrw==
X-Forwarded-Encrypted: i=1; AJvYcCVqFoxkWdSPjkHpWCt3a02nEgpNZg4eSKJPqA0iCPDcKWzC/ctu87fgj/p5vGAfmyVkpfRgTLscHd13+qk9LsxE@lists.infradead.org
X-Gm-Message-State: AOJu0YwQvBw+rEVAASgG56/nqwcTw0BB4thAz/1n65TYrKyNA4n3PiqA
	JHHxy3n91uZdByzSnkuMKzptECEby1exWFvgE6oSm/jDvnyiotm4vDvMSCW+o14=
X-Gm-Gg: ASbGncvxA4Ph/Ek4V2ZwSovpaXR1VB3a+Fow5VI8p2a1dGwrG8c7/VcqA2gi3U/Y/z4
	dEU1deh0vM3Z1Fa8dXs+7mx8uZZsrGO8kE2c/5g6MQB2+tv/UZ9kUuN23n48XVmKTtZAkvsh/R9
	xlEijGwdE6Tvhw5Znpsr7RhYRiM38boZe8MKYYxjHCcEPuotgB0XSVLTUY/pzflRgq9X/WwCr2R
	yDuLs92RU+3n+HQpnqeQFbzf1Cg/+FNvLeXOMtfrQDOyTPh0cNru9s/6bLLuxTwgX/5rlWt6dsE
	yCSAqP2qsPqVRzvpo/K3A08kQS0=
X-Google-Smtp-Source: AGHT+IGLH2wnugoAqXpKOjRMOcNm05e1d3DjACkQOqMsLyNNJS4LCZNqibWg6/9XtyaXTuj3byMh6A==
X-Received: by 2002:a17:902:e74f:b0:216:7cde:523 with SMTP id d9443c01a7336-21a83f6710dmr31869555ad.32.1736319789694;
        Tue, 07 Jan 2025 23:03:09 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:03:09 -0800 (PST)
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
Subject: [PATCH v5 15/17] mm: pgtable: completely move pagetable_dtor() to generic tlb_remove_table()
Date: Wed,  8 Jan 2025 14:57:31 +0800
Message-Id: <0c733ac867b287ec08190676496d1decebf49da2.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_230310_475648_0AC024E6 
X-CRM114-Status: GOOD (  14.62  )
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

For the generic tlb_remove_table(), it is implemented in the following two
forms:

1) CONFIG_MMU_GATHER_TABLE_FREE is enabled

tlb_remove_table
--> generic __tlb_remove_table()

2) CONFIG_MMU_GATHER_TABLE_FREE is disabled

tlb_remove_table
--> tlb_remove_page

For case 1), the pagetable_dtor() has already been moved to generic
__tlb_remove_table().

For case 2), now only arm will call tlb_remove_table()/tlb_remove_ptdesc()
when CONFIG_MMU_GATHER_TABLE_FREE is disabled. Let's move pagetable_dtor()
completely to generic tlb_remove_table(), so that the architectures can
follow more easily.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm/include/asm/tlb.h |  4 ----
 include/asm-generic/tlb.h  | 10 ++++++++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index b8eebdb598631..ea4fbe7b17f6f 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -34,10 +34,6 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-#ifndef CONFIG_MMU_GATHER_TABLE_FREE
-	pagetable_dtor(ptdesc);
-#endif
-
 #ifndef CONFIG_ARM_LPAE
 	/*
 	 * With the classic ARM MMU, a pte page has two corresponding pmd
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 69de47c7ef3c5..53ae7748f555b 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -220,14 +220,20 @@ static inline void __tlb_remove_table(void *table)
 
 extern void tlb_remove_table(struct mmu_gather *tlb, void *table);
 
-#else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
+#else /* !CONFIG_MMU_GATHER_TABLE_FREE */
 
+static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page);
 /*
  * Without MMU_GATHER_TABLE_FREE the architecture is assumed to have page based
  * page directories and we can use the normal page batching to free them.
  */
-#define tlb_remove_table(tlb, page) tlb_remove_page((tlb), (page))
+static inline void tlb_remove_table(struct mmu_gather *tlb, void *table)
+{
+	struct page *page = (struct page *)table;
 
+	pagetable_dtor(page_ptdesc(page));
+	tlb_remove_page(tlb, page);
+}
 #endif /* CONFIG_MMU_GATHER_TABLE_FREE */
 
 #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
-- 
2.20.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3113CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PfDfE++F3RWl/ExerU/oKoiEmKgLmIzVBxPm6lUCPRg=; b=KPXCOm4iGdFaw2vhG1FCvp/QjR
	IG+3uvs9MjYGcWH7wTQGwF0zupMcPEzCqjUTwI3nhy/NSf449pf696jEc/KcA3v2iWogGrib5dukE
	epjACjUoc9dFmHFFG5TbP0mT6jTDJcu4Dx2YG/WAtpBCFdWppeB1Fz5YiecS0uSmwEu5Lfh0qTznk
	CzkGbtcN5R+SSJAa1tnbzoli9nvk7eMn2+ntYTaxvbtn2RwDgCsBlp7iCWCTmJwWIEdGcRblSkVIw
	u20PEXC8mOxdmsahMzxbWABazH4hSBJ0xS4hUYvqUl0lQBGaPP98Xt1c+aYD/Q8n/mPre/MjXIbli
	TEMxoapQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDc-00000001yx6-2nBQ;
	Tue, 19 May 2026 15:18:52 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDN-00000001yeK-36GL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:18:39 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48fde68e420so34484945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779203915; x=1779808715; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PfDfE++F3RWl/ExerU/oKoiEmKgLmIzVBxPm6lUCPRg=;
        b=py6P8OPTBSwScaO5VT009B2IlcFP1Di7SSNpYsGypOI21y2r3k7EUlCg2tvqixRTdU
         QFjrXvAUZqUEUx4gtOM8tf/EOlxr22K4CDxSG4UcpJrPZG/j9Jl7BI/FoPM9hIYjL1r4
         EGKSIlVswap1WdKcvggAHYwES8ZabKD5HgKyX0FjcvnlOzNQ8bqTBUO0n4/RDK0zX79J
         qlItyhSHRKptbRRQOhBnxi4VfcT5po42JQc+PAf0/htyvWKMdf4rLMN2IfBnjrD0jo8L
         GzgKgHQbKzm4STrQiTnQgsQ8yrCcbSLpnsxiSzezrl31wIZ9jhuOncWIfr5VHRry75Vh
         Dl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203915; x=1779808715;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PfDfE++F3RWl/ExerU/oKoiEmKgLmIzVBxPm6lUCPRg=;
        b=gH2zbPF6BEadY/z8DTiz32WPUKGgR3kIU17VF7uok5Ezp3dkG+dCJpp+9G/FVt5W9Z
         Co/bC+uTIKOhJW5RaRJVqf5qYSTCQlA0tbkP5+nGlADsn6qd3Lnva0xnPPsZnbRzxzVz
         n5ItM81kOayXd7VanQbtKpHd5X1ctqa51bRvtlzyw6+fHLdHQo8B9u26q91Ln1AgZRt5
         VeR17G0APUngj54WpvjpKkehA7xq3NlJuAj339WT+sVaSRUFDUVXwS7AXwKwmdt9XeQS
         nh/K06YQliHdaadSKt+Dbmd1aGfCTjr1zOg9b/Kj6PDf8y6eAVjVkFRWXnQsffLMHQDd
         Zluw==
X-Gm-Message-State: AOJu0YxNDV1lqezTaeXfa1xzwcPOGVV6uT72m2s2m+rukQ2zkJDoiapc
	9omr7zoWZmO1faH3CNpbaoFFzkTEFhWVS1BYB7gTJo0AXhiHR3aHLvtb8Mc/xJtXkpxoUykzMsN
	aA6z8f/ARov5neSIR5Na0iZsMlhBVO5TcZQwvoYLZqQf6RTAdv78WwhO/pRaXJeIQsUmz+GpQbZ
	vP7FNGK4yLWZWyM5QR5LnmG7Hm3cJL3hNV1fdch+U3q9le
X-Received: from wmba2.prod.google.com ([2002:a05:600c:6dc2:b0:48a:5c24:d305])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:34d3:b0:48e:6db3:ff3a
 with SMTP id 5b1f17b1804b1-48fe63270fdmr290761875e9.16.1779203914736; Tue, 19
 May 2026 08:18:34 -0700 (PDT)
Date: Tue, 19 May 2026 17:16:25 +0200
In-Reply-To: <20260519151616.2557018-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260519151616.2557018-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3142; i=ardb@kernel.org;
 h=from:subject; bh=oIF//MguREFG3HyKwOy+szVys8PN/RKtASFWmsHeRws=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIYun7qyjai6rA2NnuvzBPcb5HcUWrJeV8kP0p63Z/GDyg
 rrEP3UdpSwMYlwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCIftBkZnt9bsqtX63WH7NG/
 r+plOE+Kat8O/Px/l8Tn0Pv1vFYc/xkZlu6eNVN6it3sFw7TGMSfrdvezmPDmlIWMfNT3b8Tb5/ UMwEA
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519151616.2557018-23-ardb+git@google.com>
Subject: [PATCH v5 08/13] arm64: kfence: Avoid NOMAP tricks when mapping the
 early pool
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_081837_861244_898301B1 
X-CRM114-Status: GOOD (  16.15  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Now that the map_mem() routines respect existing page mappings and
contiguous granule sized blocks with the contiguous bit cleared, there
is no longer a reason to play tricks with the memblock NOMAP attribute.

Instead, the kfence pool can be allocated and mapped with page
granularity first, and this granularity will be respected when the rest
of DRAM is mapped later, even if block and contiguous mappings are
allowed for the remainder of those mappings.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 25 ++++----------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 7cecd25aa83b..224fec6ce9d7 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1067,36 +1067,24 @@ static int __init parse_kfence_early_init(char *arg)
 }
 early_param("kfence.sample_interval", parse_kfence_early_init);
 
-static phys_addr_t __init arm64_kfence_alloc_pool(void)
+static void __init arm64_kfence_map_pool(void)
 {
 	phys_addr_t kfence_pool;
 
 	if (!kfence_early_init)
-		return 0;
+		return;
 
 	kfence_pool = memblock_phys_alloc(KFENCE_POOL_SIZE, PAGE_SIZE);
 	if (!kfence_pool) {
 		pr_err("failed to allocate kfence pool\n");
 		kfence_early_init = false;
-		return 0;
-	}
-
-	/* Temporarily mark as NOMAP. */
-	memblock_mark_nomap(kfence_pool, KFENCE_POOL_SIZE);
-
-	return kfence_pool;
-}
-
-static void __init arm64_kfence_map_pool(phys_addr_t kfence_pool)
-{
-	if (!kfence_pool)
 		return;
+	}
 
 	/* KFENCE pool needs page-level mapping. */
 	__map_memblock(kfence_pool, kfence_pool + KFENCE_POOL_SIZE,
 			pgprot_tagged(PAGE_KERNEL),
 			NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS);
-	memblock_clear_nomap(kfence_pool, KFENCE_POOL_SIZE);
 	__kfence_pool = phys_to_virt(kfence_pool);
 }
 
@@ -1128,8 +1116,7 @@ bool arch_kfence_init_pool(void)
 }
 #else /* CONFIG_KFENCE */
 
-static inline phys_addr_t arm64_kfence_alloc_pool(void) { return 0; }
-static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool) { }
+static inline void arm64_kfence_map_pool(void) { }
 
 #endif /* CONFIG_KFENCE */
 
@@ -1139,7 +1126,6 @@ static void __init map_mem(void)
 	phys_addr_t kernel_start = __pa_symbol(_text);
 	phys_addr_t kernel_end = __pa_symbol(__init_begin);
 	phys_addr_t start, end;
-	phys_addr_t early_kfence_pool;
 	int flags = NO_EXEC_MAPPINGS;
 	u64 i;
 
@@ -1156,7 +1142,7 @@ static void __init map_mem(void)
 	BUILD_BUG_ON(pgd_index(direct_map_end - 1) == pgd_index(direct_map_end) &&
 		     pgd_index(_PAGE_OFFSET(VA_BITS_MIN)) != PTRS_PER_PGD - 1);
 
-	early_kfence_pool = arm64_kfence_alloc_pool();
+	arm64_kfence_map_pool();
 
 	linear_map_requires_bbml2 = !force_pte_mapping() && can_set_direct_map();
 
@@ -1195,7 +1181,6 @@ static void __init map_mem(void)
 	__map_memblock(kernel_start, kernel_end, pgprot_tagged(PAGE_KERNEL),
 		       NO_CONT_MAPPINGS);
 	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
-	arm64_kfence_map_pool(early_kfence_pool);
 }
 
 void mark_rodata_ro(void)
-- 
2.54.0.563.g4f69b47b94-goog



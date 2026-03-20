Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2025D1098794
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5AT0J1SzBmKDTRI+MPd7NHNRTY3KrP/EHQWSy92u3Y=; b=D/6OcWQTKPA5UkIeOLtMV8rYdV
	rl46HZ0nOpbo6WWpWLyhR0bI5+lVUKkvAv2d7AAxxYSWBnBMKcOlQBLxbz0YX7fy/Kp2Moh7XRqMV
	W24Yykoz+WZSCZ+nVvKE7hNfldkdjurCise0p5Tn9NesMTYKsv+XcA6m1ug1ZOHFPYXL5tHqMnU0P
	iB7H4IIIRjBUq+9lGj1pbjj6C7s/E1eHFnX6XSc+4wi7MrqzmCQYjfxVWQo/23xD07DNZtW87whJl
	4xtORtuC3xOoi97LofSMX4b0FkVTjiCHCOJHwnQ4S6AFALWj9t3T8f90+7p2ArItE2mSWi9Swhl+X
	mqvh3Ldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKx-0000000CypI-3f4T;
	Fri, 20 Mar 2026 15:00:31 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKc-0000000CyTa-3Lgf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:00:12 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48544725bdeso15759635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774018807; x=1774623607; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=d5AT0J1SzBmKDTRI+MPd7NHNRTY3KrP/EHQWSy92u3Y=;
        b=unJmyjJwrdf1y6O7DA/o9x9Br3YJ775tYZpwFwjrauOKxu9+E+TdjopJln05cZOOgV
         fA3iM7XwuisPa5VcWlRnXhsVFUTLdplWnlPBH/JOhpO3lZHwk/dV4uVB81ZV5jeTTYEc
         UTCjS0ZuBppDjYKOu1vsxlW7KOlFiD8SgbdU5SoteNq/bnBZjbUWDww4hOGaeVoxpzaD
         gBstkKzo2I6Lrw8WvOjPpGX1M98+8X4pqScM5bpPC0SN+EFwYb4fwMmGgQO1S1UTzjDy
         3PI4lz0DX7DJ4aDR59rCTadFfBMNMUkylj1qBGoszR6GfxmWXHHF0+SIgAWy15P+Cjn0
         2I3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018807; x=1774623607;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d5AT0J1SzBmKDTRI+MPd7NHNRTY3KrP/EHQWSy92u3Y=;
        b=le0EI10VeeGrBxpekWDTrpVp7w3sQBwJm2o/5EY/JWm2o3SJEu0nKls40E52uLUEGC
         Jrnyd35HILpK957qsf7QoYDiJBi1djOwys19XIECQSU6/nl0WbRazjZHC0aY1pofQoq1
         x9rpEF96Yr0/fhfTleLXiBDDW8zZxttFrkH/Nhy+276NgIuOFm1HrWnQchTgavADmT0o
         TAxvOyQMxNRihZu6uPdWKNrMv1NYEvEmueaGiuNl0ZBtTPBIgQQ0jI/sHczQi75m7BWc
         2B4HIDGkH1ToRAV4LDrcKWpi+pwJLBl0oV/v93CstldeqT03rZFNWbNBpgAB0kQjanUz
         kvug==
X-Gm-Message-State: AOJu0YzNtoHI3yjee5F61eo8/1mv2j4qXVddui8sou9fzQNr2XLNqvI8
	T8lfbr9JA8+5MUUjsDoGJSHFoKvS8aTu8cjmc7Q3k056+78p6XXbV3iVBegYSqW2uzDNVOIplw=
	=
X-Received: from wmbhc20.prod.google.com ([2002:a05:600c:8714:b0:486:fe34:ca4f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:8401:b0:483:709e:f238
 with SMTP id 5b1f17b1804b1-486fee297demr40658355e9.29.1774018807146; Fri, 20
 Mar 2026 08:00:07 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:59:43 +0100
In-Reply-To: <20260320145934.2349881-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260320145934.2349881-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3121; i=ardb@kernel.org;
 h=from:subject; bh=VnAD88hkLu5Up6Du4sjF1AveOX8gYjjnmNe0JbrOG+0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIXNvwqMIO70jyYE/p2/KNi920Lz0X/ugW5nOKo/Md52XA
 26Hz1vaUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZiO5WR4d+tzgX3g9Jerc87
 E3eRxd664Iji4VvFHa9cJBU57ZbkBzMyPChvTPatULg0M6nmzqWtzAf+Zx1N+sL29ENg1lJm71n 5nAA=
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260320145934.2349881-23-ardb+git@google.com>
Subject: [PATCH v3 08/13] arm64: kfence: Avoid NOMAP tricks when mapping the
 early pool
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_080010_864000_5FCD4E86 
X-CRM114-Status: GOOD (  15.35  )
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
index 6780236b6cf8..1c434c242641 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1047,36 +1047,24 @@ static int __init parse_kfence_early_init(char *arg)
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
 
@@ -1108,8 +1096,7 @@ bool arch_kfence_init_pool(void)
 }
 #else /* CONFIG_KFENCE */
 
-static inline phys_addr_t arm64_kfence_alloc_pool(void) { return 0; }
-static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool) { }
+static inline void arm64_kfence_map_pool(void) { }
 
 #endif /* CONFIG_KFENCE */
 
@@ -1119,7 +1106,6 @@ static void __init map_mem(void)
 	phys_addr_t kernel_start = __pa_symbol(_text);
 	phys_addr_t kernel_end = __pa_symbol(__init_begin);
 	phys_addr_t start, end;
-	phys_addr_t early_kfence_pool;
 	int flags = NO_EXEC_MAPPINGS;
 	u64 i;
 
@@ -1136,7 +1122,7 @@ static void __init map_mem(void)
 	BUILD_BUG_ON(pgd_index(direct_map_end - 1) == pgd_index(direct_map_end) &&
 		     pgd_index(_PAGE_OFFSET(VA_BITS_MIN)) != PTRS_PER_PGD - 1);
 
-	early_kfence_pool = arm64_kfence_alloc_pool();
+	arm64_kfence_map_pool();
 
 	linear_map_requires_bbml2 = !force_pte_mapping() && can_set_direct_map();
 
@@ -1174,7 +1160,6 @@ static void __init map_mem(void)
 	 */
 	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, NO_CONT_MAPPINGS);
 	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
-	arm64_kfence_map_pool(early_kfence_pool);
 }
 
 void mark_rodata_ro(void)
-- 
2.53.0.959.g497ff81fa9-goog



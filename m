Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC770FF8869
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRW0Zv+9eSRHC2Z8bSw9fwUsmK+GqZsuc2Bm/mr5lio=; b=11QVD6vJWp1x4WKvQiAaGmG+gp
	lBBN2UNow0OkHwl67/3GnOyO9utXR6aZkPaYT0q7GkKyHJ0F+1w+bANkarSBPBm61Vv/o4LD45n/g
	2yUzeHw18nNP/z55PjH2IkpLzuN2r+waqME++vP/s2bhu50RhCbsgYrwE+0Df97xGPtS/i/eQ7ks5
	OS7+xHEYUes6ECVN3zSD0DRpNNUBaBd8vZKy+4DVrZWSEyw3IbkB/mt+5Na9y1LDyrRotTLWvUa5x
	rTwaRT2flzbHsAUPoBwGzKlkO+mKBClM1/hk2SJ/NF4vQhqhF643rwkWc/Ue0NGrIx3BbXBOX6hTF
	Glz8qPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzy-0000000HCYY-0OwU;
	Mon, 27 Apr 2026 15:35:50 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzt-0000000HCTR-0LTu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:35:46 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48a5adc12ffso39024555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777304143; x=1777908943; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XRW0Zv+9eSRHC2Z8bSw9fwUsmK+GqZsuc2Bm/mr5lio=;
        b=nXgDkJylSHX65xAQzRlDNGfx5z2O1hh2IfOB1Iuzwky0ykk7rh8T7rgnj2+Ff24RrM
         7TMgdY9SbKa9gRNkRGQHXGhCcbEWqLLjkHANSaaenLjSu2ekRpRKDLmuhD4024jG3z9y
         Ywyz/mgoH6qkI98i+awBisZMq3Xtnj1gwHiGYgYJCchywrEAhI4RBDlkSJsCeDtiHBuI
         KPgSnt86V+fmiATxHXQMyXePMPzqCLV0tXfZSSkasx2RE2HHywzJqozOioF5iqxkRxOB
         cgvKN0Ww3GY68gwvqdUSqBF6W87fboc0wHudZxkqYbsUazKEoXRoyQx/CHwgomF8vfSz
         T7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304143; x=1777908943;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XRW0Zv+9eSRHC2Z8bSw9fwUsmK+GqZsuc2Bm/mr5lio=;
        b=loqT+Kvw3SsG18Kumn19PELNJD3vmBBT1nprelShZRY/DAloLIadTITL+k+Zw8QAWv
         2uwqdVM60p//efFoApwl2GdvFNRetQoCxvGatNue2WfZsKlnRxdjuRDZ7f+xYo19UogT
         RZqeT4bixAx63ro3muRmdeDj2TEYMvGodSrQ61qOsWX51rJ6oHx96zlO/biTCcDgjU9v
         ffT/9jWHxkK3xhybeYrnOekCMOGLD7irhx9QGoF/1wFpK29NigNvGbfKwaMyKTz3RHqo
         2XOakXiPReBLa5Km+u98VvPqLPxyvZ8Jay+4xaXmlHx5adZjjnRX9V72/nCnx9K3BjrA
         0OBg==
X-Gm-Message-State: AOJu0YxywSq2os/BqDQozqmgDLFf0dVWhbZiehABtXmzRY4Q561Wu3Dz
	M2Mgd+EpnD/5Fb0hxzbd6ogN3QseG4Edz3UVRfWerYw2utktPjqQq9k45f3xde649ZarkAYhbJI
	oSY2vkZXRp1dYd+N4EKCSIyzjOZzffuM+DCfJB7WcbScsA+ttADqt3E8IE08fcNDD2l9gQupW5T
	vj0uUU7l6g/XuwuV4UdrGzLgbN0+qmDse3WoBp/czGwy5U
X-Received: from wmi26.prod.google.com ([2002:a05:600c:21a:b0:48a:591a:7a7f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6085:b0:488:936a:6220
 with SMTP id 5b1f17b1804b1-488fb782618mr560638815e9.21.1777304142771; Mon, 27
 Apr 2026 08:35:42 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:34:25 +0200
In-Reply-To: <20260427153416.2103979-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260427153416.2103979-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3127; i=ardb@kernel.org;
 h=from:subject; bh=j6jBQGBWye927YKYtEIXGLmbEkQZrSxTUWO+ZEqsDOA=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN9E6tZbZSRzXSOd4Kz7RcrfTl71zvelVlQ7kjb6c7+6
 +/LvbZ3lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgImcesvIMHmRmfnsqu7t5Yc4
 f/yT6uhbkVjgOtPMoPXVglXVv166rmL4H7fu82/15c+rukSuf9ApCKp0mWdk7517vtF+nva/d2u e8gAA
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260427153416.2103979-25-ardb+git@google.com>
Subject: [PATCH v4 08/15] arm64: kfence: Avoid NOMAP tricks when mapping the
 early pool
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_083545_137691_F9B21DD2 
X-CRM114-Status: GOOD (  15.69  )
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
index bfb2f1cae724..4eab40f4aa6f 100644
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
 
@@ -1194,7 +1180,6 @@ static void __init map_mem(void)
 	 */
 	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, NO_CONT_MAPPINGS);
 	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
-	arm64_kfence_map_pool(early_kfence_pool);
 }
 
 void mark_rodata_ro(void)
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog



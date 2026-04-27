Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CB2FF8869
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHBfAOq62ddYo5eYH63kmRGKW2W5oXHrS23q0wSzvjk=; b=oa60KurLGy5nm6wm7WdkZhyjde
	cLPglKyHmU70zNuxJUMToeg3PZmXXsCkicBMSXa1p1riZtjhDQfqENRg/7LRYfMa/Kums1RGndO7S
	KA1lbw8P/V+GmdOw644gzkCsv4h9LJxT8anMcDyzuSzU55FYAbFxqmUv03fA/uDLGsbb3t7b+J+X0
	Gk1CpX5g5g6FGTua+mU+ERqSxVOzQ724QfzwZ9VOYwBjpzvngS2OG5hnGFLN1eFTs/CrS8AuOgIom
	B+Nv2THAl3cB5SmQfxC9k2uxcY3bpx+HiLiKswuroGhKFZlYjilM55l8wGSqww3cCOdSMePVQIh7s
	Dwt9z8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHO0L-0000000HCu3-3cWD;
	Mon, 27 Apr 2026 15:36:13 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzz-0000000HCXd-1S1Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:35:52 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-488d8deb75fso85321545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777304149; x=1777908949; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LHBfAOq62ddYo5eYH63kmRGKW2W5oXHrS23q0wSzvjk=;
        b=mfJUn2BG8FESR05Oaq7jCqhjzAyTX9NpUNXkM8OtEPoI+JKfL+/I4FoPdUdGeiz7N0
         lltX53bhLUpnAZn/exhovWsedt4Hlgu/B+flBlr6yA9WaWw7mdAmtiuA0XBw5lvTIhoI
         qeWucel4hn52Jq/OmWgyZmpvYFmtjSdcNQ1K7d2M72MRrUDYmWPKG6PbPVpCAzQxQsK3
         MnOIkMDqozhxDo9NHOBhxuutIFvMIZN/Gc/e3ZLLm6CurmO1OCnQJlCCfNmrxt0pUjQD
         kU3hgEKVLE65dN22oyY/0SruhGMS2DgKhIQF8ymTgvbKTzQiK8RRztf6xXxFKOOYwxJS
         1Nig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304149; x=1777908949;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LHBfAOq62ddYo5eYH63kmRGKW2W5oXHrS23q0wSzvjk=;
        b=A5GWWSX2v7tjcYvVqGeYhpwn3ORph/CPiRAqA9zN8+nGPmigjyFYyNRqOV2tiu6mDQ
         o9AGtgb1a11AyK7lgbehC7JtXsL5syKoQ1hHkPhR636cMxpk8BF898M8bL7iYfWMMbEu
         vZHW+32OSnsYs7+yJL/i9JT373kXmOzOq/6WO98SXmM0qRfwzf8H2woLg4vjVD8WzE33
         jdHNBVGpzTcX0OFQlf6OO0IdSSzhrTqSFvW1Gwu7LCvaa3/mYKI3tTWdtFJvkTdq68cR
         +nSJO8ahS7VF/0IAhRr2bMG7W1Hbiuw1ZAiyzIY+yfLx8mrfzeT2dCFHuc0M8FXiYAmL
         gzgA==
X-Gm-Message-State: AOJu0Yxc0J4qz7aUyp7eFES0j9wEz5UFHWM6b4p4O2dqHmW9LKPLEd2s
	ZfTkZVyY0CEs5viPjehlCsDNJVZrfpMOFMXQB77FqQfqXGpB7hn57ZF6/ciFw4VojEjQ4Z043RI
	GlCGGvlEood0T6IrIy7YilOuzXGdPlRKk+ARJV8UKlezLb/fmOUruP44E73rN/MDINBR+5xsoU2
	84ffY3BM+ATqyf6MdVQqFckPqn/jIJCo2Y1idFPYKCBxAn
X-Received: from wmim14.prod.google.com ([2002:a7b:cb8e:0:b0:485:4f4a:bd84])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:628c:b0:48a:52d4:888c
 with SMTP id 5b1f17b1804b1-48a52d48985mr436500725e9.3.1777304148352; Mon, 27
 Apr 2026 08:35:48 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:34:30 +0200
In-Reply-To: <20260427153416.2103979-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260427153416.2103979-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3345; i=ardb@kernel.org;
 h=from:subject; bh=wQjR+F+1V7sUzLN4TnEphIKngbWEIlFdlV4UM9366h0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN9E8/zzp9rzJvuTrrssME56tgdeZGiCxu1/hnmHFEw2
 Kx3/PTcjlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjARdX2Gf7qTeGeyv/WQ3m+5
 YJN2SVKJmjhP0Cq12slhs9JOff29JYeR4fLhIoXXDu2TA92k7l89733+pdS0gHk/wh3rGVYs+M3 wjgkA
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260427153416.2103979-30-ardb+git@google.com>
Subject: [PATCH v4 13/15] arm64: mm: Unmap kernel data/bss entirely from the
 linear map
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
X-CRM114-CacheID: sfid-20260427_083551_436151_1C201926 
X-CRM114-Status: GOOD (  18.81  )
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

The linear aliases of the kernel text and rodata are mapped read-only in
the linear map as well. Given that the contents of these regions are
mostly identical to the version in the loadable image, mapping them
read-only and leaving their contents visible is a reasonable hardening
measure.

Data and bss, however, are now also mapped read-only but the contents of
these regions are more likely to contain data that we'd rather not leak.
So let's unmap these entirely in the linear map when the kernel is
running normally.

When going into hibernation or waking up from it, these regions need to
be mapped, so map the region initially, and toggle the valid bit so
map/unmap the region as needed.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 44 ++++++++++++++++----
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 9361b7efb848..a464f3d2d2df 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -24,6 +24,7 @@
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
 #include <linux/set_memory.h>
+#include <linux/suspend.h>
 #include <linux/kfence.h>
 #include <linux/pkeys.h>
 #include <linux/mm_inline.h>
@@ -1040,6 +1041,31 @@ static void __init __map_memblock(phys_addr_t start, phys_addr_t end,
 				 end - start, prot, early_pgtable_alloc, flags);
 }
 
+static void remap_linear_data_alias(bool unmap)
+{
+	set_memory_valid((unsigned long)lm_alias(__init_end),
+			 (unsigned long)(__fixmap_pgdir_start - __init_end) / PAGE_SIZE,
+			 !unmap);
+}
+
+static int arm64_hibernate_pm_notify(struct notifier_block *nb,
+				     unsigned long mode, void *unused)
+{
+	switch (mode) {
+	default:
+		break;
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+		remap_linear_data_alias(true);
+		break;
+	case PM_HIBERNATION_PREPARE:
+	case PM_RESTORE_PREPARE:
+		remap_linear_data_alias(false);
+		break;
+	}
+	return 0;
+}
+
 void __init mark_linear_text_alias_ro(void)
 {
 	/*
@@ -1048,6 +1074,16 @@ void __init mark_linear_text_alias_ro(void)
 	update_mapping_prot(__pa_symbol(_text), (unsigned long)lm_alias(_text),
 			    (unsigned long)__init_begin - (unsigned long)_text,
 			    pgprot_tagged(PAGE_KERNEL_RO));
+
+	remap_linear_data_alias(true);
+
+	if (IS_ENABLED(CONFIG_HIBERNATION)) {
+		static struct notifier_block nb = {
+			.notifier_call = arm64_hibernate_pm_notify
+		};
+
+		register_pm_notifier(&nb);
+	}
 }
 
 #ifdef CONFIG_KFENCE
@@ -1162,7 +1198,7 @@ static void __init map_mem(void)
 
 	/* Map the kernel data/bss so it can be remapped later */
 	__map_memblock(init_end, kernel_end, pgprot_tagged(PAGE_KERNEL),
-		       flags);
+		       flags | NO_BLOCK_MAPPINGS);
 
 	/* map all the memory banks */
 	for_each_mem_range(i, &start, &end) {
@@ -1174,12 +1210,6 @@ static void __init map_mem(void)
 		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
 			       flags);
 	}
-
-	/* Map the kernel data/bss read-only in the linear map */
-	__map_memblock(init_end, kernel_end, pgprot_tagged(PAGE_KERNEL_RO),
-		       flags);
-	flush_tlb_kernel_range((unsigned long)lm_alias(__init_end),
-			       (unsigned long)lm_alias(__fixmap_pgdir_start));
 }
 
 void mark_rodata_ro(void)
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog



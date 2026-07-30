Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E8CC54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u00RxS2OEU/Jkrk6J/93Lztn6eTwvbQr7TbXJRpbv68=; b=jHykHKU6WB5FTlEXas4wKQQ/ad
	9kdFIHdGboB2czVHEk9nxUkeDpIACZBISuP7YfB84Qqu0kZWGsDRIE/RZpe5eT9OzcsarTmm+Fv57
	gDuuUNFhgxFrRED151peyNhtlvwdajjF/88sWKFTDgYnwvQF5BIUNajVoBP/dwYVBfglRBS0w1JbA
	LQYD/+1X4OViqmBFVdghHhzBX49cgv98NnoBDfyGRsSMGclrUhnc6Z57OBHzTDc4rFFUql2yjBw6g
	D+uqhIj9kH6jV9oKUZCGlGMNTzxaekvdXyv69awzl4SkgtEklKAR53GRmgBpB7ulg7pobgpGYk4CD
	XDECA/1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMjN-00000009xPt-2RPO;
	Thu, 30 Jul 2026 09:07:09 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMjK-00000009xOi-2Iea
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 09:07:08 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c8612812170so148731a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 02:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785402426; x=1786007226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u00RxS2OEU/Jkrk6J/93Lztn6eTwvbQr7TbXJRpbv68=;
        b=LRrfXavPgSsjV2l0N79k6mCbcesu7zIpS1UouCRHc8qveibVLt/LGi+z5RygrZDLZE
         v7JSOPwFJMiSD+SOvo+GI9r0EQ/HkmHZW3QJ6mOFZ2F3vQL+yB2ufi8MkX07hXuZ8WkL
         FpL8J+k1Bm8KEsWaLs/KMobBVXpu/1Q+AUw9K9KKQWfRlTeYjzasP/TZyBW1Z5u96Oxb
         MHV709nrCgnZs6fI8aaYScgr64XehgKAyXjhDgIzSDyjBfCu65JHBP7TwtgEHez0BqHO
         G5EYQBCsoObddCC3WOIOCsRAq3CZStWF1UWpcW3RfL5qMt3MVelrDEOJNoocY5Fcgh0W
         Y3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785402426; x=1786007226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u00RxS2OEU/Jkrk6J/93Lztn6eTwvbQr7TbXJRpbv68=;
        b=pCJcBHBW42bDTg1p5a8b11cHqr8IqbNOqqPTswbx0rBmWSAYK6Gyu60CS3YEFteYUO
         efewEWlszHmCayQ9/47AFp1mT9SuHKECWGldELuPj5+WwiYzqCisMbB54TqxdUI6+20j
         mAgoOfGWr8Ixnf0yGQAJ2sBXkBJvGmiz/oPB8rY1/3bqL0+AvK6jdGGnVVdxygDQOetc
         2yJefo7SgOsXaWUamle+kmjffTDTyWjtQOGsNAb3LuaeeoKGFAjpv4Xs2cSUU2IET5TY
         jIJ91O0IriIsMCNAJ5J+Gcx2HUmuWj5p1zOgA14r1SBFqg4on3WgXdGYY6TZ+pM4+kCt
         DRtw==
X-Forwarded-Encrypted: i=1; AHgh+RrdYdVNz+Wfwb7ioVChchD0Vjgu+S5wCU1FG4OYdS+gs+ldbVaEl+jF8RPvxpW/VsP0z7wd9Wy3pOuGr5ywrLGo@lists.infradead.org
X-Gm-Message-State: AOJu0YyytlZG3d6gvtNwMqVxfMHcj6WXpk0+31NLnZH/7oWS5FNpMYS2
	PC4Kf4Md+RQNo0oo2KWEeTlWbgOpkJvBGNr3UdTDfNBo208XKXEy/WZx
X-Gm-Gg: AR+sD11f9xV25N7eWtp6g+glDJh8Oov+qZ9imaecfId3Bz5BQMIpImB/0it8eh2Fxft
	XlGrwUiheNJtjximDZjsruYDEngXhl1sF9q6ZmD7N4/hZnb27ASLkwChBqrvOSlub/gWDcmu/hw
	FsyUTghoLGf9Lp5DKlkevd4Q/5L8/0Jql9Q95kZOCV5UhH8jPBWDvbQ5qHjVoECRaQAILA+5GGJ
	KcChgLLjq8WxojMLynBAkEEn/LC+/tW8FoQUssAUvq526DX89EQOOG3xnFHE0Km3MaEyl+OXjsY
	cjZ5vCoQvBdU8yuUttUjQr33LjqBq3V/X8dkxEOtnO5ZVtCT4zNPQHIrAo+D8CWP015e71EAPUg
	4i5jNkx0lfIeZTBdQbvozzT9wSxFZ49CV+mvJ0UZYG3bwM1IssrZjTt37UedppJ7DmzQmFMu/uk
	pmavieNq1/szs4TyeMAaIx0Ha1+LfaI9QTGWTcMhunN+qXL1sbdjIYspsMHtf9dOtxVcv5fnTrT
	aSMLyj6wZA4RE13t/VvZw8j0OF1WV+p7xS0e/eBJ+o9zSaTo8jjuxZChLXlR9o8
X-Received: by 2002:a05:6a20:7f81:b0:3c3:2dc0:7cbd with SMTP id adf61e73a8af0-3c900541df0mr2314097637.1.1785402425540;
        Thu, 30 Jul 2026 02:07:05 -0700 (PDT)
Received: from debian.lan ([155.117.85.23])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba447107sm1902510a12.21.2026.07.30.02.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:07:04 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	usama.arif@linux.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	ziy@nvidia.com,
	baohua@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Xueyuan Chen <xueyuan.chen21@gmail.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v6 1/3] mm: make persistent huge zero folio read-only
Date: Thu, 30 Jul 2026 17:06:45 +0800
Message-ID: <20260730090647.2401252-2-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730090647.2401252-1-xueyuan.chen21@gmail.com>
References: <20260730090647.2401252-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_020707_147939_4CFAE21D 
X-CRM114-Status: GOOD (  19.48  )
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

The persistent huge zero folio is shared globally and should stay zero
after initialization. As Jann Horn pointed out[1], kernel bugs have ended
up writing to pages that were meant to be read-only, including in
security-sensitive cases. Making the persistent huge zero folio read-only
in the direct map turns such writes into faults instead of silent zero-page
corruption.

Add set_direct_map_ro_noflush() so mm code can make a direct-map range
read-only. Use an address-based signature to match ongoing direct-map
helper work[2], where existing page-based helpers may move the same way.
The helper is direct-map specific and leaves TLB invalidation to its
caller. Architectures without direct-map permission support keep existing
behavior through the generic stub.

The folio is allocated and zeroed through the writable direct map before
thp_shrinker_init() changes its permissions. thp_shrinker_init() is called
from hugepage_init(), which is registered as a subsys_initcall and runs
after SMP initialization. Stale writable kernel TLB entries may therefore
exist. Flush the direct-map range immediately after the page-table update
so they cannot bypass the read-only mapping.

GFP_TRANSHUGE includes __GFP_HIGHMEM. On 32-bit systems, the persistent
folio may therefore reside in high memory, where folio_address() returns
NULL. Such a folio has no permanent direct-map mapping to protect, so skip
the permission change and TLB flush.

Treat the direct-map permission change as best-effort. Architectures that
do not implement the helper keep the existing behavior via the generic
stub.

Inspired by Jann Horn's read-only zero page work[1] and follow-up
discussion[3] with Yang Shi.

Link: https://lore.kernel.org/r/20260508-ro-zeropage-v1-1-9808abc20b49@google.com [1]
Link: https://lore.kernel.org/r/0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org [2]
Link: https://lore.kernel.org/r/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com [3]
Link: https://lore.kernel.org/r/20260727113530.5cd347581a66b3279490a604@linux-foundation.org
Suggested-by: David Hildenbrand <david@kernel.org>
Suggested-by: Usama Arif <usama.arif@linux.dev>
Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 include/linux/set_memory.h | 29 +++++++++++++++++++++++++++++
 mm/huge_memory.c           | 20 +++++++++++++++++++-
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 3030d9245f5a..e83ced6a3827 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -40,6 +40,24 @@ static inline int set_direct_map_valid_noflush(struct page *page,
 	return 0;
 }
 
+/**
+ * set_direct_map_ro_noflush - make a direct-map range read-only
+ * @addr: start address in the direct map
+ * @nr_pages: number of pages starting at @addr
+ *
+ * Make the direct-map range starting at @addr read-only without invalidating
+ * TLBs. Callers must either ensure that no stale writable translations can
+ * be used, or treat the permission change as a best-effort hardening step.
+ *
+ * Return: 0 on success or when direct-map permission changes are unsupported,
+ * or a negative errno on failure.
+ */
+static inline int set_direct_map_ro_noflush(const void *addr,
+					    unsigned long nr_pages)
+{
+	return 0;
+}
+
 static inline bool kernel_page_present(struct page *page)
 {
 	return true;
@@ -56,6 +74,17 @@ static inline bool can_set_direct_map(void)
 }
 #define can_set_direct_map can_set_direct_map
 #endif
+
+#ifndef set_direct_map_ro_noflush
+/* See the comment above the generic fallback for the _noflush contract. */
+static inline int set_direct_map_ro_noflush(const void *addr,
+					    unsigned long nr_pages)
+{
+	return 0;
+}
+
+#define set_direct_map_ro_noflush set_direct_map_ro_noflush
+#endif
 #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 
 #ifdef CONFIG_X86_64
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 970e077019b7..2dfc7a4218c3 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -40,8 +40,10 @@
 #include <linux/pgalloc.h>
 #include <linux/pgalloc_tag.h>
 #include <linux/pagewalk.h>
+#include <linux/set_memory.h>
 
 #include <asm/tlb.h>
+#include <asm/tlbflush.h>
 #include "internal.h"
 #include "swap.h"
 
@@ -932,6 +934,8 @@ static int __init thp_shrinker_init(void)
 	shrinker_register(deferred_split_shrinker);
 
 	if (IS_ENABLED(CONFIG_PERSISTENT_HUGE_ZERO_FOLIO)) {
+		unsigned long addr;
+
 		/*
 		 * Bump the reference of the huge_zero_folio and do not
 		 * initialize the shrinker.
@@ -940,8 +944,22 @@ static int __init thp_shrinker_init(void)
 		 * that get_huge_zero_folio() will most likely not fail as
 		 * thp_shrinker_init() is invoked early on during boot.
 		 */
-		if (!get_huge_zero_folio())
+		if (!get_huge_zero_folio()) {
 			pr_warn("Allocating persistent huge zero folio failed\n");
+			return 0;
+		}
+
+		/* Highmem folios have no permanent direct-map mapping to protect. */
+		if (folio_test_highmem(huge_zero_folio))
+			return 0;
+
+		addr = (unsigned long)folio_address(huge_zero_folio);
+		/*
+		 * The folio was zeroed through the writable direct map. Flush
+		 * after the page-table update to invalidate stale translations.
+		 */
+		set_direct_map_ro_noflush((void *)addr, HPAGE_PMD_NR);
+		flush_tlb_kernel_range(addr, addr + HPAGE_PMD_SIZE);
 		return 0;
 	}
 
-- 
2.47.3



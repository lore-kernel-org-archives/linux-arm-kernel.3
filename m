Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900CEC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 09:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NM59zTITSAnSgD8fALdagpl6xYMLVePtK5I+sk28JTE=; b=oFQE/FcMKy7bw/XT+R9pDIPCaU
	i/jVyDqSbt6dPGqtBXYYI4SEUYd4JicMXYpxbH3J+c66oOymL4Dfbugvo+okINGBEsHDEouWbNHe6
	x1ECYLEOw6gsLRZWDGGgQ5cqNc29f4YmUXwnshXSzKHK1lhSQr3tXJpGpQlB89cDEhTFws54gZjsU
	ynu+cUJkZRLL7kmr+N6lWnLhrW0Di+98jH1jwcKDDLrn29z2wULTXKoYb4hKxICEIvBoH47JBrhEF
	0q3UxliHDb7YcZxMWtOeG3+AKx3eeHN2XKP+PqXuOnDzLUIBDbbLXWYnNKSsuhOih7vQupHspNmAh
	OxYXQfNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl1n9-00000003yZd-0MNk;
	Sat, 18 Jul 2026 09:57:07 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl1n6-00000003yZ8-3HW5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 09:57:06 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84a6f026675so491203b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 02:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784368624; x=1784973424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NM59zTITSAnSgD8fALdagpl6xYMLVePtK5I+sk28JTE=;
        b=rO6DzCqigAEHmdnToibTyctH0F1d4hpGpFMgW1x5PcUwE2+EdXacj9raY8pL59GzUa
         baCfI/DHXthqJPCLil34+OWWaVxk1vDqs5hIlmw+lF297rni2BSTH3BYCPXkip7kfPQT
         lDjYfyS+9P6DEfAW2N805d0S3TugXkdyAMcEKYE6Ivv6VICpOdYXw70ChV2TDRZCo6X3
         8pDbqFKgYBeObLX0afDe+M6psn4Vf1NQY1Mn0KVvYfiZOXRiBlF4oUOGvIDg/HIH3Hf6
         fSD9TC+unS932K12IOl9pWS6eH84v/fgbzdxWT121k7CaJoULIqCOUPxk9qfexdsQKSL
         4Xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784368624; x=1784973424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NM59zTITSAnSgD8fALdagpl6xYMLVePtK5I+sk28JTE=;
        b=dbTzjxaCIqoP6dvL7vpvVDXVxQHVa4AjEaStVaXAhjkG8+KILfpULmW0VJW4VHrDFc
         1A2Ipk2ynuJ9ff5o+bIgmmp5DM2L6CgR27AC+PUhRpXXXvu8R7ozWRidhmYMR98xSGci
         8v9LOe7SFahJDb6EQsJ467sIlZfB/arlClxcsFv6ougiozrbl5o5PyqW4zfs6o3y9Pxg
         Sf10P99mrfwREZDvWE/iy6v1PmRfRqa7IQvDkcemp3LUUYHZY7eyaIzcn5t57qSYz6h9
         J7mOsVJm/4KzeijcEp1yfgkiHsbiLyxhhmPz/N/gYraNZNFPleD9YL6qJ5oXhjm9E89X
         cyNg==
X-Forwarded-Encrypted: i=1; AHgh+RqyfLvTUrjIWEDWp6m4cOHyn1khcsG9jP4lvLzIHCjzyiXKsuGNAoAjym7kZ3GfSquXFTYfivQ8KComo/EobGzo@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf2eaLznrUWzWpFb633gBIiSZfhVatttfe9M00o7DyUE5Ql5lf
	zTTjFnkILbknKR4yfJQGKkwGwQgAu87ia7VcJdKRJUM4+LFQg3akD1aa
X-Gm-Gg: AfdE7cmTMNhN15yXyaPsDmct7fL392+eaNaSnbM4dB0KIIyaTjH/Lpq5r1fB5JNZ+IT
	7bur2e8q7HeysTpEEaa9DIAfLllJzFb7rMYHnWXLMxdnqiXXiS6X7vRZ7qUU9xvvJroLh3/npvE
	gCAUSk5n/s1peICKXvpX5sdkLxmnfESfqsfs2o51/7FKCg9qggdcoklZgKl+UHhQRSAnjoaPLwp
	lW8zfn6nzzyrLy80ldbmD5afd7FtUW5MqoTpdT5unW/a//fh+ZBJh9DkJqAIwFFBCI4y8gWu/Cg
	02921vfjN+xHkBMWwRo1HRJnCq2xrD5QM9sK779jps6RbQEA6qwfl7ri1NfmkQuFAIGYfbqv+ub
	ZqKF3qT/GRDi/SGmnZidOq7WXan8AtnMyRHnItYSOdn8jzmff0V/2AAU6Y2Ac6I4BEjqagPWcb2
	N1M4BgIsC3snxFyUhiaXCK/8UPbadvyGBPnYbo34Z/wyW0
X-Received: by 2002:a05:6a00:7287:b0:847:88aa:4f4f with SMTP id d2e1a72fcca58-84c29510c82mr3438599b3a.7.1784368623754;
        Sat, 18 Jul 2026 02:57:03 -0700 (PDT)
Received: from debian.lan ([240e:391:eb4:a240::1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af317c8sm2417248b3a.30.2026.07.18.02.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 02:57:03 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Jann Horn <jannh@google.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Mike Rapoport <rppt@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [RFC PATCH v4 1/3] mm: make persistent huge zero folio read-only
Date: Sat, 18 Jul 2026 17:56:45 +0800
Message-ID: <20260718095647.182592-2-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260718095647.182592-1-xueyuan.chen21@gmail.com>
References: <20260718095647.182592-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_025704_830556_2C045D47 
X-CRM114-Status: GOOD (  20.91  )
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

Treat the direct-map permission change as best-effort. Architectures that
do not implement the helper keep the existing behavior via the generic
stub.

Inspired by Jann Horn's read-only zero page work[1] and follow-up
discussion[3] with Yang Shi.

[1] https://lore.kernel.org/linux-mm/20260508-ro-zeropage-v1-1-9808abc20b49@google.com/
[2] https://lore.kernel.org/linux-mm/0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org/
[3] https://lore.kernel.org/linux-mm/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com/

Suggested-by: David Hildenbrand <david@kernel.org>
Suggested-by: Usama Arif <usama.arif@linux.dev>
Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 include/linux/set_memory.h | 29 +++++++++++++++++++++++++++++
 mm/huge_memory.c           | 16 +++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

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
index 970e077019b7..4425ae5560cb 100644
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
@@ -940,8 +944,18 @@ static int __init thp_shrinker_init(void)
 		 * that get_huge_zero_folio() will most likely not fail as
 		 * thp_shrinker_init() is invoked early on during boot.
 		 */
-		if (!get_huge_zero_folio())
+		if (!get_huge_zero_folio()) {
 			pr_warn("Allocating persistent huge zero folio failed\n");
+			return 0;
+		}
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


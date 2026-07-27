Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7A3C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 14:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NM59zTITSAnSgD8fALdagpl6xYMLVePtK5I+sk28JTE=; b=hEQ+iN2QCoHIQYZE7ifGJUMlmC
	FPnlE44wKogiAr/7V0jFgWV2XX23nXyMXog3VmE9dQ28dlB5M9Jukhu9Jj1VlAJJvjuN5NCUP/27T
	VVYCFUyh2hgPwZ/qAxq+eu2Ww5FMbL3le8s5HXu1GlKKeJY/o9rv3/7DvP2wxqZh3N0a6jagkcV2k
	wkR2qU7drj/fKiWubzNhROIGnJtmTt35lhses7ROdL+Io6C9K8guhxENPylb6esTkXhls0ILD6Zji
	rLPyXoxpaBbMFI/HCOY4arUqc6ZYkitBTtHoM32wioygosoMCpV9EjNR4Dgt/KotVwozdfL2RM3GX
	lksgFCUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMQO-000000030XI-2m2r;
	Mon, 27 Jul 2026 14:35:24 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMQF-000000030We-2rTD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 14:35:23 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ceeee8c46bso8356705ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 07:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785162915; x=1785767715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NM59zTITSAnSgD8fALdagpl6xYMLVePtK5I+sk28JTE=;
        b=ouSG0XPC0W+1fsIJYEjRIKoQZKjoX/qMJyl0n6MMCmQfPD+qBbv+sLRj1tyb91y4xM
         a2/9fG2fSoCGN6lIUcIXNTcjF7tivRNxWG982tdkMMmlOt6irq1hsfTqcmP1jPJLC7rl
         3an/qiKmOImxIcBlaM+VXlWUDlrfF+jjvYLgd7bXj1QgCzsEHDS8Sb7pt9k1vUSMbdTw
         9Xv5wsp8omOwxZDNb5mnHimuPsNuMWOU38d2bJn1txgxZxu1Wa7D3mjZpXwPuD3GaeGf
         ACUqLRKfujw/RG8puDbaxQNIO3XTxo+FmtqLeNJ57RQEMxXOzQe+YFcF2w548w4XMqJQ
         kpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162915; x=1785767715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NM59zTITSAnSgD8fALdagpl6xYMLVePtK5I+sk28JTE=;
        b=L+grJEgmisLsAx+tp01NpUcQxmN1IgzfDemBvZ8somz28S7EZKKhHaHHQ+yPN8k1m+
         zb5pzJTy9EWUMkNovYIi6HnmVnMy6kSQBhG2Oh7ZgiEEcyVtxfvdvainLWlNqEkgSzBp
         ElWxmYD5rvpsP2w6iQSwhqK4Worvi5Kid+66FB6Zo5D1Cshy2Uhs1JFsIBGvBV45H2m0
         xbUMmAYbo7N22PG85C/GtgZI5UpMIckOTjqBrSyQOMSxRNobbARljnm5Ft//WCRzXXdV
         BD3xnxF5NosgBC80dU5+Q6k1iYdkmO6yUPx1jyWNs5Kd88uPObRO4iKY5YU7HsBGu+o/
         74Fw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3YOkYtNLxVUw10AL30zV7E/PXUhwT14OgmMWaQTUrdRAe9hbF3SW6+02CjtreSg2x987DSJVPNszUxNWDJwuD@lists.infradead.org
X-Gm-Message-State: AOJu0YzF5qbnmu6rU4dBpr6v54EYjpIYOC3y6IF5UQYGh0zyjIF3B6MR
	EIx+kepOfKKEe5sVcxQM/NludreuVtKJcyunBgNRnCvcvNILpWHGZB4l
X-Gm-Gg: AR+sD128SxS8/LcShQtnd3OwiNQl59sipGgtIUvwNaHz+uWyAIAsGJ7tycOaYIClL3X
	g7UYuicshEHE3wEVlC8K+yy51m1wpgMchyymOOtqou02Ugh7p0rCE/rxLK5jU4ks3nBlsD/b+2N
	MvpKyZcoIAsAfupEwOovd9mSV6KnFmQuwOgcyWgMsvoWrxG+h6i/ZBptWGKTTEqMhrDIpkq0qPC
	w4X7q/XvS0Kc27dqhoet1YL9QayFvB/tL3we27y/d+7yUtJ8k+7QNPf3QuSvjqAo2iGelqTa9GK
	Oimq0D1bylikvIXpuafI1Chxf0ts2Ek+Cmz76JmdK83Ey3swtdSV+L0oobQPa7vFRv08Z1JNnvM
	EpH0iH+4pebflCY+qL98XPj2Eqt2bslSMbehqNrQA1sQ1aP8+zkgRcrazodiDk4z1RL2ezowOLs
	1R0omQ2kZuACCYdIl0ngknfTA3u/6KjCPSgR7coy8RZtjEY2T1dpIACNibru+aEl8ieh1b9NGvs
	w0=
X-Received: by 2002:a17:902:f710:b0:2ca:d344:7743 with SMTP id d9443c01a7336-2d00baddaddmr3424865ad.7.1785162914572;
        Mon, 27 Jul 2026 07:35:14 -0700 (PDT)
Received: from debian.lan ([141.11.42.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7d5297sm36877485ad.56.2026.07.27.07.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:35:14 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	jannh@google.com,
	yang@os.amperecomputing.com,
	rppt@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org
Subject: [PATCH v5 1/3] mm: make persistent huge zero folio read-only
Date: Mon, 27 Jul 2026 22:34:24 +0800
Message-ID: <20260727143426.1077133-2-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727143426.1077133-1-xueyuan.chen21@gmail.com>
References: <20260727143426.1077133-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_073515_748615_A5643BF2 
X-CRM114-Status: GOOD (  19.72  )
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E37BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yn77aa8uoI89j7RCjY/OwI/1RZwt436WtRsFNItz3AY=; b=N+Lc0IEqQvXrz/JIkKH06LqA/t
	hOd4+yskkpakEiOgdQtofJ4rt8DC7P2WNG+iVYKzrRKE+ZOqcbr7wv8eF4mzsHfH31fD5P0VIpx3M
	HgfPaQFbE7pnNhg17m1WD6l/WfDp5Ue0UT1v5WHZly4mEOJOp4tHGGFrabhPIdCJxH+ILg9w3BFq/
	0f11dV1IYNQXclFPZvXIaFpOxD37jWTKzgEy5XK/PyWtyvsWnXjSTckLcXPGyrXL4LFVuwIXadgax
	cZrZgHqXCrojEupNycwehCQkn0P3EV6t6BpX9siPn0wtbkJqetzyzBlAd7QgQqn+CTTqBhT+XxeF7
	0jRMx9nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhN-0000000GCCL-3PBm;
	Wed, 08 Jul 2026 03:11:45 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhF-0000000GC68-37nV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:39 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso242893a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480296; x=1784085096; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yn77aa8uoI89j7RCjY/OwI/1RZwt436WtRsFNItz3AY=;
        b=Y+dVe7A1pwTc5yP0WV3Abpoj0xgChR6u2CdtdGkIjVdpDbG+QzaNIJi6AAXkB0Buhx
         6w01Y2f5xKN0+7pvvaBdEY21rOQtZyd2OU6843nW7rLbeHhUOxZfizWR8DyNj3W/pzmk
         hZHGcH6Sx7QmG9DNX0nxFZPvWh7pLLqKph9Uigs6jL6KlsjrBY4Be9IGgPzqQTq3Fnq4
         YWAz5TVEi8b/VTTI/AOUaWhd7bpWWU7GPPT9ouihh02PBI480T4Aj5VU4QYNxjOxA2Sa
         eKzOhlILhSFMTI+uV/OolltOVYekX/knwRDW+i0RjF+y/3zQ2VCjzuHOAfyFwKtzWamH
         5X5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480296; x=1784085096;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yn77aa8uoI89j7RCjY/OwI/1RZwt436WtRsFNItz3AY=;
        b=DubMEbJEsslKsTluyuXth3ds5AhNAMiCFJbrBp7KJZP5PvngHfOyfDzs0z/4BcRNY6
         d5D3azkVgNh6USqkVwWNREnmgpjSD6oVP6RLEvPK2e5KBmXJWeZ92/118AOqtv8TTgRo
         OxN7HNTELHKXqnaNXA8aEIi35GfigEgwFAC7uhTqspPPb0KdO4F8SoICV37tZP1K5nOJ
         K3i01dc0LcCJAsdgTNI1AsoKZsAytq+MJOww0pcn7oDqlw+qdnHLjCgMht4kM7QHBa9/
         pbDgl8fYeys70uvvHFmSRcXAv6TLoSajEqrtjT40aVoGad9Pion4wywHXRm5h7HZpHcE
         BXPQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxPiXbKECcFGljHDGRzo/9PlP/1fArMQcVHWvPjj6DfH72rH6sWQvipd6I15eH8u37iV/PBx9WMlB09hz2wnlS@lists.infradead.org
X-Gm-Message-State: AOJu0YzZoHO1pLjbnMsJaIBxJ3O24R5VLDPJ9D+7q7aHc/8Vr93nXrnB
	C5W7+y4I5neRtedHoV/pNBRO6e0kJ9almvK1VTIA2SZKNeLo4qg0BQpVfjNJsNDtNkFrWK9INsI
	KhSZfLsBKy4Sn0zPDb/g+jA==
X-Received: from plkb6.prod.google.com ([2002:a17:903:fa6:b0:2ca:c401:c941])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5290:b0:381:6466:7160 with SMTP id 98e67ed59e1d1-38941acc1ddmr622962a91.26.1783480295545;
 Tue, 07 Jul 2026 20:11:35 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:12 +0000
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-3-jthoughton@google.com>
Subject: [PATCH 02/18] hugetlb_vmemmap: Move vmemmap_get_tail up
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_201137_834119_11283C27 
X-CRM114-Status: GOOD (  14.95  )
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

In a follow-up patch, it will be used in
vmemmap_remap_alloc().

No functional change intended.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/hugetlb_vmemmap.c | 52 ++++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index da29954e9533..8d4e8ee51fdd 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -355,6 +355,32 @@ static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
 	return -ENOMEM;
 }
 
+static struct page *vmemmap_get_tail(unsigned int order, struct zone *zone)
+{
+	const unsigned int idx = order - VMEMMAP_TAIL_MIN_ORDER;
+	struct page *tail, *p;
+	int node = zone_to_nid(zone);
+
+	tail = READ_ONCE(zone->vmemmap_tails[idx]);
+	if (likely(tail))
+		return tail;
+
+	tail = alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
+	if (!tail)
+		return NULL;
+
+	p = page_to_virt(tail);
+	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++)
+		init_compound_tail(p + i, NULL, order, zone);
+
+	if (cmpxchg(&zone->vmemmap_tails[idx], NULL, tail)) {
+		__free_page(tail);
+		tail = READ_ONCE(zone->vmemmap_tails[idx]);
+	}
+
+	return tail;
+}
+
 /**
  * vmemmap_remap_alloc - remap the vmemmap virtual address range [@start, end)
  *			 to the page which is from the @vmemmap_pages
@@ -491,32 +517,6 @@ static bool vmemmap_should_optimize_folio(const struct hstate *h, struct folio *
 	return true;
 }
 
-static struct page *vmemmap_get_tail(unsigned int order, struct zone *zone)
-{
-	const unsigned int idx = order - VMEMMAP_TAIL_MIN_ORDER;
-	struct page *tail, *p;
-	int node = zone_to_nid(zone);
-
-	tail = READ_ONCE(zone->vmemmap_tails[idx]);
-	if (likely(tail))
-		return tail;
-
-	tail = alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
-	if (!tail)
-		return NULL;
-
-	p = page_to_virt(tail);
-	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++)
-		init_compound_tail(p + i, NULL, order, zone);
-
-	if (cmpxchg(&zone->vmemmap_tails[idx], NULL, tail)) {
-		__free_page(tail);
-		tail = READ_ONCE(zone->vmemmap_tails[idx]);
-	}
-
-	return tail;
-}
-
 static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 					    struct folio *folio,
 					    struct list_head *vmemmap_pages,
-- 
2.55.0.795.g602f6c329a-goog



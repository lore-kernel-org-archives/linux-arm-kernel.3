Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C51C44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tYhyFlDTzE/YH6OeWF1FZ4zpUrrudSRzFbgqClNVeE=; b=DaepXpzYBtJRW05yv3avS4+9jW
	Q0diW8FQZTXPchO+70JCYejCDj0gQUNi/qWdvxRPV2nOglG5JaB4nlNySGtKPhrJwH5xJLdciP7yD
	GtSkBCilMaETcuHhJ7IUlEbG8M4xmpHn7QVeOVWf5M/LI9WYnx1r8FaAYFK07dmnVEQZBWjv6mJEd
	ynONNCJpLUohZuMqzlF8EI/WhF6/MfAciSaLgsPV1Rvs9KM1gxuG2HagM13RnYv2WPepGX6jrZi+e
	Hw+Uu34c+DSHe3X9Rcw5zcF9xC+jub3Y2+v1qwczg/kjRBb0GF4aYINBJ+BXgNKApKOKswKX2bFAI
	JIRgrx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIho-0000000GCoH-0veu;
	Wed, 08 Jul 2026 03:12:12 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhP-0000000GCDK-0idV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:49 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-847ac21582cso292932b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480306; x=1784085106; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9tYhyFlDTzE/YH6OeWF1FZ4zpUrrudSRzFbgqClNVeE=;
        b=kV/1/kMyMVoD8vbAUFp0P946Y05b2BcxQupQfKSn5IQcZAMN7qWVkoz8H8/3E48MK5
         0w8hgIchdoUfe2/Pp3E0WWY0SfT2CiV+oA7monacWtTZvCD0Ua/SctW0I9REvx407XsY
         0otcegQEofiVQqUBpuiXUbIqgxJDwMY2wEUZtfRSY8x6KlmreS1vp4HD7igmDco7Z7/e
         GaQzI06XHGI3zuF23cgPl0WrlXfd5LBXIpRWBbMzqH1Pe5bNTgopdhfZJe2WCdwfQ3FM
         0P5C824E80c/gUFjQv7YE+JCVs7L21IFSSA4RyPUaJ2w9SOKiiVZO0ET/ybRylHCTyEr
         MPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480306; x=1784085106;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9tYhyFlDTzE/YH6OeWF1FZ4zpUrrudSRzFbgqClNVeE=;
        b=rQZygh8vxpiNzfDT6rf1yyV5DWC01Q4Dn98Vu1r0WICWHjRz30C71TjzRvNUA5h/Dl
         bnTM/QDqDUO9YYRevLg8omhv0Qj+92f6w8xN9RbBMOzF7mfZhXVIAotRJvlQck+xXyst
         FLebQ8QSgI5Zs0dcbNe1duuuhXowuHMGSxu1JktR2/4JwrKosqPIyULp/aY/EaqISyip
         AlQRXZW/e1Vxobm+hYnYJPbyNN1nNmdqsQwR9gPXLSswLO8Y31k6Gd3Z2aW2s7PpRRRJ
         z98P8XG9OdDrvVxliDqxza/ri/z9wpY6WWDymiinepaJrfx1gFe2ITo+m9KvoBkvc+pb
         K1/A==
X-Forwarded-Encrypted: i=1; AHgh+RoiXfNowaelkVKvUNT+jUZqry+6OFCuXROKLHXylZkORl0bfDJbUrjh9cjZF087N/8TGbdqA6E8LMo8C8seuhZu@lists.infradead.org
X-Gm-Message-State: AOJu0YylcYTNZCjPSpgU9/CIGTf073I531sOkw9Sz9ve/CV5cSPHlcqS
	Rag+MEgLfJfNjSbeks44H1amRl91v0dUrYRntqYKQxLa/gsh4V9nVrCRSwCDLZsvOGIRqjjID3E
	ZZBqmDfQYis0dKfiNp8pz5A==
X-Received: from pfx50.prod.google.com ([2002:a05:6a00:a472:b0:846:f544:63be])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2294:b0:845:388b:56f with SMTP id d2e1a72fcca58-84842f9f250mr639122b3a.40.1783480305691;
 Tue, 07 Jul 2026 20:11:45 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:24 +0000
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-15-jthoughton@google.com>
Subject: [PATCH 14/18] hugetlb_vmemmap: Rename mm/hugetlb_vmemmap.h to mm/hugetlb_vmemmap_internal.h
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
X-CRM114-CacheID: sfid-20260707_201147_388021_475D0C96 
X-CRM114-Status: GOOD (  15.14  )
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

This avoids the confusion with the new header that will be added in late
commit, at include/linux/hugetlb_vmemmap.h.

The file rename in this patch isn't really required, but the header
guard (now named _MM_HUGETLB_VMEMMAP_INTERNAL_H) does need a rename.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 MAINTAINERS                                          | 2 +-
 mm/hugetlb.c                                         | 2 +-
 mm/hugetlb_sysfs.c                                   | 2 +-
 mm/hugetlb_vmemmap.c                                 | 4 ++--
 mm/{hugetlb_vmemmap.h => hugetlb_vmemmap_internal.h} | 6 +++---
 mm/sparse-vmemmap.c                                  | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)
 rename mm/{hugetlb_vmemmap.h => hugetlb_vmemmap_internal.h} (95%)

diff --git a/MAINTAINERS b/MAINTAINERS
index f37a81950e25..ff47013ce995 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12021,7 +12021,7 @@ F:	mm/hugetlb_cma.h
 F:	mm/hugetlb_sysctl.c
 F:	mm/hugetlb_sysfs.c
 F:	mm/hugetlb_vmemmap.c
-F:	mm/hugetlb_vmemmap.h
+F:	mm/hugetlb_vmemmap_internal.h
 F:	tools/testing/selftests/cgroup/test_hugetlb_memcg.c
 
 HVA ST MEDIA DRIVER
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 571212b80835..298673a6c57c 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -47,7 +47,7 @@
 #include <linux/node.h>
 #include <linux/page_owner.h>
 #include "internal.h"
-#include "hugetlb_vmemmap.h"
+#include "hugetlb_vmemmap_internal.h"
 #include "hugetlb_cma.h"
 #include "hugetlb_internal.h"
 #include <linux/page-isolation.h>
diff --git a/mm/hugetlb_sysfs.c b/mm/hugetlb_sysfs.c
index 79ece91406bf..83a95f5142f5 100644
--- a/mm/hugetlb_sysfs.c
+++ b/mm/hugetlb_sysfs.c
@@ -8,7 +8,7 @@
 #include <linux/page_owner.h>
 #include <linux/page-isolation.h>
 
-#include "hugetlb_vmemmap.h"
+#include "hugetlb_vmemmap_internal.h"
 #include "hugetlb_internal.h"
 
 #define HSTATE_ATTR_RO(_name) \
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index b445febac0d2..a490a34998d9 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -16,10 +16,10 @@
 #include <linux/mmdebug.h>
 #include <linux/pagewalk.h>
 #include <linux/pgalloc.h>
+#include <linux/hugetlb.h>
 
-#include "linux/hugetlb.h"
 #include <asm/tlbflush.h>
-#include "hugetlb_vmemmap.h"
+#include "hugetlb_vmemmap_internal.h"
 #include "internal.h"
 
 /**
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap_internal.h
similarity index 95%
rename from mm/hugetlb_vmemmap.h
rename to mm/hugetlb_vmemmap_internal.h
index 18b490825215..6b28780014bc 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap_internal.h
@@ -6,8 +6,8 @@
  *
  *     Author: Muchun Song <songmuchun@bytedance.com>
  */
-#ifndef _LINUX_HUGETLB_VMEMMAP_H
-#define _LINUX_HUGETLB_VMEMMAP_H
+#ifndef _MM_HUGETLB_VMEMMAP_INTERNAL_H
+#define _MM_HUGETLB_VMEMMAP_INTERNAL_H
 #include <linux/hugetlb.h>
 #include <linux/io.h>
 #include <linux/memblock.h>
@@ -95,4 +95,4 @@ static inline bool hugetlb_vmemmap_optimizable(const struct hstate *h)
 {
 	return hugetlb_vmemmap_optimizable_size(h) != 0;
 }
-#endif /* _LINUX_HUGETLB_VMEMMAP_H */
+#endif /* _MM_HUGETLB_VMEMMAP_INTERNAL_H */
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 99e2be39671b..94d5da9f8ab7 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -32,7 +32,7 @@
 #include <asm/dma.h>
 #include <asm/tlbflush.h>
 
-#include "hugetlb_vmemmap.h"
+#include "hugetlb_vmemmap_internal.h"
 
 /*
  * Flags for vmemmap_populate_range and friends.
-- 
2.55.0.795.g602f6c329a-goog



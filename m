Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D83ACA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4g1ObsslfRrIxGm9J1WErW3kJq6TK7lBBQX23Z9YIM=; b=OqGUbWFdCVUUQR9Zpv2G2PZYTc
	Y4SsE7PxpLu97R5yyTbmqDE0pnd9Z26K4QVpufpL6J5mMbpXwgE1WfRS9C2Sd34fLfmIbOKR5k437
	MA1yNGDJn8fMpXHAwP2GtQxXOsJgBkUIdlRiANnLmGA8cJ7Q22IRdGZ1V8ZL5e5ax8zUKrrhIp4nn
	PHFkPA9MHBhRsfWakfHSxwXy4XOlYFMRHYUmdeKNOv0iJmNBnNgJrb8yV/AD4rBPYhwnt9FYIzsKh
	srQbQvnYo+K4hzVhIDJ2uZgjWoCcuk2uR1IRaT2gTYWn0vub/m/lUCNHYRg7TiYKG9RoWYY447OeF
	g82cXu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVk-0000000CnOM-1TSb;
	Sat, 03 Oct 2026 00:21:56 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVc-0000000CnD8-3Gv1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:50 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-3a4f7eb79f2so75579a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986907; x=1791591707; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4g1ObsslfRrIxGm9J1WErW3kJq6TK7lBBQX23Z9YIM=;
        b=lja1wQEWd17CXAvpm8r7ba8h3DYpp0p2OyUK37wD2Y1Pf1yyOA9a8VeoZmaIYTttfH
         MQBnC3ZoQW1hzOKOefwvX7BkDXafrbmFAAhz1VGdGgzqB/kCsizbb1tRRoy/42gRaLum
         lZfkPW/s4VhgiQTES8BkXD8ZaSu2GhOO1Y1Z8xqnjv//cH7v59nu9H0fSgXKZfrTfiaJ
         Yd/iD31zwhIsIVgt2U+5b+/FsvoyTeoy12QrTtW0+/AH/xY12hkByemXYqxVFxAcW31K
         IQg5/0CzkYbRD61CF+0PoU+fS0LWyJLm9xFrw2IdZhu79pK6ZqG8qsJuOaKjnWnzWgiz
         ZkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986907; x=1791591707;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4g1ObsslfRrIxGm9J1WErW3kJq6TK7lBBQX23Z9YIM=;
        b=OfrR5Soq+Zd+LVPdox1gqjDyiuMysjVVyadRffq498HwPzSpNdL23JRRxazmMJI3JJ
         GiE/CghekSMt2k6vxbrUKbJNJeCGP3NDQgGwTXhu1fGLch90+JCGoabhvTTF9hm4TcPu
         gjhKslMZs7qX+5rCOwAtDBvTMy/owad8WNf+HqxKfqUd7jmgkpwhZjCWRcdzlPot11oq
         Mcw3vHNHXxsbWydDsYd9oUOnIh0pZOhf8snRNlvrCKbuRpR0wATaJ3tYeZnKZKIjuHkc
         q3O0RfhZ4Nc69xMpoO3SQBwVIU00h4U/ZdCirWvBiJ2Xxg5mFfrgIwNiSo1EDJVSKVrs
         r+TA==
X-Forwarded-Encrypted: i=1; AKwUvBzYH3r5FGzZRj5WKLLGd9N5vV3SIe+eiEDIGL50QRu/wGta/zQptcXykLXPW+4L9CGHrGH8jXIKHZ9O3LRTJ3Bn@lists.infradead.org
X-Gm-Message-State: AFq9FYKbk9KofRQUEC3mDuQNsePHbaackt9nZ1BFgtkI753xRAWAf2gK
	tdZqH5pXUq8oswPjXTBH8RHh/bWmug4CsTYCy+EXeNdJDjsAwscST1reJ09M7x24mal08ONV2Sk
	qj7iOUXcVYkRGvEAaavuvSw==
X-Received: from pjbmw9.prod.google.com ([2002:a17:90b:4d09:b0:3a7:239:2141])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4c05:b0:3a4:ba6e:65c9 with SMTP id 98e67ed59e1d1-3a6ce963ad0mr1812320a91.59.1790986907076;
 Fri, 02 Oct 2026 17:21:47 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:17 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-15-jthoughton@google.com>
Subject: [PATCH v2 14/20] hugetlb_vmemmap: Add fault injection for in-place
 vmemmap PTE updates
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_172148_837396_ECCEB28A 
X-CRM114-Status: GOOD (  19.13  )
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

try_update_vmemmap_pte() may fail, e.g. on arm64 when the update keeps
racing with hardware access flag updates. HVO handles such failures by
rolling back the optimization, or by leaving folios partially optimized
if the rollback or a later restore fails. These paths are rare to hit
normally.

Add a fault-injection capability, fail_hugetlb_vmemmap_pte, under
CONFIG_FAIL_HUGETLB_VMEMMAP. When a fault is injected, the PTE update
fails with -EAGAIN without touching the page tables, as if the in-place
update had given up.

It can be configured through debugfs or through the
fail_hugetlb_vmemmap_pte= boot option, the latter allowing failures to
be injected when optimizing bootmem folios.

Assisted-by: LLM
Signed-off-by: James Houghton <jthoughton@google.com>
---
 .../fault-injection/fault-injection.rst       |  6 +++
 lib/Kconfig.debug                             |  9 +++++
 mm/hugetlb_vmemmap.c                          | 38 ++++++++++++++++++-
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/Documentation/fault-injection/fault-injection.rst b/Documentation/fault-injection/fault-injection.rst
index c2d3996b5b40..403206645fa4 100644
--- a/Documentation/fault-injection/fault-injection.rst
+++ b/Documentation/fault-injection/fault-injection.rst
@@ -16,6 +16,11 @@ Available fault injection capabilities
 
   injects page allocation failures. (alloc_pages(), get_free_pages(), ...)
 
+- fail_hugetlb_vmemmap_pte
+
+  injects failures of the in-place vmemmap PTE remaps done by HugeTLB vmemmap
+  optimization. (try_update_vmemmap_pte())
+
 - fail_usercopy
 
   injects failures in user memory access functions. (copy_from_user(), get_user(), ...)
@@ -263,6 +268,7 @@ use the boot option::
 
 	failslab=
 	fail_page_alloc=
+	fail_hugetlb_vmemmap_pte=
 	fail_usercopy=
 	fail_make_request=
 	fail_futex=
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 134b15a44625..96cd1f1da94a 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2066,6 +2066,15 @@ config FAIL_PAGE_ALLOC
 	help
 	  Provide fault-injection capability for alloc_pages().
 
+config FAIL_HUGETLB_VMEMMAP
+	bool "Fault-injection capability for HugeTLB vmemmap optimization"
+	depends on FAULT_INJECTION && HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+	help
+	  Provide fault-injection capability for the in-place vmemmap page
+	  table updates done by HugeTLB vmemmap optimization (HVO), i.e.
+	  try_update_vmemmap_pte(). This exercises the rollback and
+	  partially-optimized folio paths.
+
 config FAULT_INJECTION_USERCOPY
 	bool "Fault injection capability for usercopy functions"
 	depends on FAULT_INJECTION
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index fabf2b25fe59..1eca03a3def3 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -17,6 +17,7 @@
 #include <linux/pgalloc.h>
 #include <linux/vmemmap-optimization.h>
 #include <linux/hugetlb.h>
+#include <linux/fault-inject.h>
 
 #include <asm/tlbflush.h>
 #include "hugetlb_vmemmap.h"
@@ -50,6 +51,39 @@ struct vmemmap_remap_walk {
 	unsigned long		flags;
 };
 
+#ifdef CONFIG_FAIL_HUGETLB_VMEMMAP
+static DECLARE_FAULT_ATTR(fail_hugetlb_vmemmap_pte);
+
+static int __init setup_fail_hugetlb_vmemmap_pte(char *str)
+{
+	return setup_fault_attr(&fail_hugetlb_vmemmap_pte, str);
+}
+__setup("fail_hugetlb_vmemmap_pte=", setup_fail_hugetlb_vmemmap_pte);
+
+#ifdef CONFIG_FAULT_INJECTION_DEBUG_FS
+static int __init fail_hugetlb_vmemmap_debugfs(void)
+{
+	fault_create_debugfs_attr("fail_hugetlb_vmemmap_pte", NULL,
+				  &fail_hugetlb_vmemmap_pte);
+	return 0;
+}
+late_initcall(fail_hugetlb_vmemmap_debugfs);
+#endif /* CONFIG_FAULT_INJECTION_DEBUG_FS */
+
+/*
+ * Inject failures as if the in-place update lost a race too many times
+ * (see the arm64 implementations), without touching the page tables.
+ */
+static int hvo_update_vmemmap_pte(unsigned long addr, pte_t *ptep, pte_t pte)
+{
+	if (should_fail(&fail_hugetlb_vmemmap_pte, PAGE_SIZE))
+		return -EAGAIN;
+	return try_update_vmemmap_pte(addr, ptep, pte);
+}
+#else
+#define hvo_update_vmemmap_pte		try_update_vmemmap_pte
+#endif /* CONFIG_FAIL_HUGETLB_VMEMMAP */
+
 static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 			     struct vmemmap_remap_walk *walk)
 {
@@ -235,7 +269,7 @@ static int vmemmap_remap_pte(pte_t *pte, unsigned long addr,
 		entry = mk_pte(walk->vmemmap_tail, PAGE_KERNEL_RO);
 	}
 
-	ret = try_update_vmemmap_pte(addr, pte, entry);
+	ret = hvo_update_vmemmap_pte(addr, pte, entry);
 	if (ret)
 		return ret;
 
@@ -279,7 +313,7 @@ static int vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 	 */
 	smp_wmb();
 
-	ret = try_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL));
+	ret = hvo_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL));
 	if (ret)
 		return ret;
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456A0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqMjZmPsv3+liEaC57LQksKr8l/QZSzOSPi/lkAXRvo=; b=cg/BaHhRr3OEe8acmBDZJlWDl9
	Sh0YINeC8jeH4Y83jX2Yq8j0xf3ywB7miiXtOf6cl49bhVG14iIXdCJtbiueZMAv7lbOpom7vtT18
	LyUt/bk0FQxl1nUwIp9BUWY0tArb3gOAQCjyCCeO2EMrMsN9lor526x4/MsdUwVHiwcE7AitFEU19
	cctk8hU9ABRojJHB45RSBnFFLEtgrLXzE/8HtJACklN9SufXEQF75FM13hCgpaqWNQzFOke5TYUl8
	5vRjrzBWNremCRlXYzqGvwWSrW8rbxvBsJD50x2Igcw1H8Y2Kp8UvzVbnL1nU++4eHXgDiTiEPh2J
	B6iKa8xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhP-0000000GCDZ-0bvQ;
	Wed, 08 Jul 2026 03:11:47 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhH-0000000GC7P-2g9b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:41 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2cc5faecf01so7049465ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480298; x=1784085098; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nqMjZmPsv3+liEaC57LQksKr8l/QZSzOSPi/lkAXRvo=;
        b=wUnC4uBTvy6tLnbUmhkJ5KvLiNUAriMjAxBrvODTBKQ5GKagXpTl7GYm77VI72wQ6f
         /X9eDweKySHeieTlcmYQzjBQN6yscsStI16ttB1QeZqaC+6U5saEmoSSVWEQ1Vk8w1pa
         6a4jxIsDy3DFtDR1hnnCHZs29UdTNrlRDeBHLQ8c5FA7ZmvQZPTjVUmZop4KMBry6r/i
         ZWcPZO6A6wglpAEBjOdrM1ZEfN9T0E/bh6QGl/s+targAI6jsyjQHdulxk6FpBuJud4L
         r0MzZ7z/ogcTleZyDjmBkYXsFw6anr+t5EkzDuO7Nl0VlLHNxpkV3O5E9b+7kOPCtbOo
         2IeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480298; x=1784085098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nqMjZmPsv3+liEaC57LQksKr8l/QZSzOSPi/lkAXRvo=;
        b=MX7aZ31JJ6V+xHF1XrV82JjfM3UM2cHAaRqxToIJfj9k47uXd73boTKv6FNJhRDqKt
         4HzIgnYacXMG1KvtlZJ3tty5ortAcp2xVZZBm852/S/BP9Y7/XvnQIH8UAx4Y9Mjipvc
         cu72LEjT7eFMI/CH/rF+eYa/d++SFEMk3KGIQIuXeP2A1HkSCEp9bdwIYbKp0wcuaLMz
         DJnUfeFQV+b7M5+2pKkAga7603i5yrySrMEKkx7oKdATi/68Bahn+r1z+PnF6SEyAF3+
         Ncp82HYX+OSHhapI3B21JzvOrL7VNzQzecH+EWkb8ZJHh+evmHkoDVdJunR565YcWvVU
         FPxw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+Z5rkx4uzyg82MQuK3z83eE+CXQ9V65A4MhG6XY50ANAVqq4tA7WNJUYVl4YSI0qkYpy0w51y7sRQNfPXEMde@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9XMrBzT4uu4Bu2GJaF9uUMqgI7SJ8MtjanpFySJmJOZ+d0yER
	Wg85DLUSEd9qv+fV9txGqEGb5vpY/OXBIAdjKpHcdH0lyaJ4DXL3I3TB2y7ZiZ5PGHbVtCOAioU
	bUgNZvfu0HhC/xcb8vBiulA==
X-Received: from plml12.prod.google.com ([2002:a17:903:184c:b0:2b6:417:db8d])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2b0b:b0:2ca:2753:f3cc with SMTP id d9443c01a7336-2ccea45a3a2mr7332045ad.33.1783480298065;
 Tue, 07 Jul 2026 20:11:38 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:15 +0000
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-6-jthoughton@google.com>
Subject: [PATCH 05/18] hugetlb_vmemmap: Allow architectures not to allow HVO
 at runtime
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
X-CRM114-CacheID: sfid-20260707_201139_697148_B535FE24 
X-CRM114-Status: GOOD (  15.91  )
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

Even if HVO is enabled, architectures may at run-time determine that it
cannot be used.

It may be the case that arch_supports_hugetlb_vmemmap_optimization()
returns false at first but eventually returns true. This is the case on
arm64. When this happens, bootmem hugepages won't be immediately HVOed,
but they will be optimized in prep_and_add_bootmem_folios(), part of
hugetlb_init().

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/asm-generic/hugetlb.h |  7 +++++++
 mm/hugetlb_vmemmap.c          | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/asm-generic/hugetlb.h b/include/asm-generic/hugetlb.h
index e1a2e1b7c8e7..c4796c54b702 100644
--- a/include/asm-generic/hugetlb.h
+++ b/include/asm-generic/hugetlb.h
@@ -128,4 +128,11 @@ static inline bool gigantic_page_runtime_supported(void)
 }
 #endif /* __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED */
 
+#ifndef __HAVE_ARCH_HVO_SUPPORTED
+static inline bool arch_hugetlb_vmemmap_optimization_supported(void)
+{
+	return IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP);
+}
+#endif /* __HAVE_ARCH_HVO_SUPPORTED */
+
 #endif /* _ASM_GENERIC_HUGETLB_H */
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 3951c043164a..21377f795293 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -17,6 +17,7 @@
 #include <linux/pagewalk.h>
 #include <linux/pgalloc.h>
 
+#include "linux/hugetlb.h"
 #include <asm/tlbflush.h>
 #include "hugetlb_vmemmap.h"
 #include "internal.h"
@@ -556,6 +557,9 @@ static bool vmemmap_should_optimize_folio(const struct hstate *h, struct folio *
 	if (!READ_ONCE(vmemmap_optimize_enabled))
 		return false;
 
+	if (!arch_hugetlb_vmemmap_optimization_supported())
+		return false;
+
 	if (!hugetlb_vmemmap_optimizable(h))
 		return false;
 
@@ -764,6 +768,14 @@ static bool vmemmap_should_optimize_bootmem_page(struct huge_bootmem_page *m)
 	if (!READ_ONCE(vmemmap_optimize_enabled))
 		return false;
 
+	/*
+	 * Architectures may return false here but true by the time
+	 * hugetlb_init() is called. In this case, although the folios will
+	 * not be pre-HVOed, they will be optimized in hugetlb_init().
+	 */
+	if (!arch_hugetlb_vmemmap_optimization_supported())
+		return false;
+
 	if (!hugetlb_vmemmap_optimizable(m->hstate))
 		return false;
 
-- 
2.55.0.795.g602f6c329a-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218BBCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0LSbObtLQixt10mRMgsu561+yH+1K8mdQenqKY5U4A=; b=lc4/4gu/Pp2ANwSrW/8uIXF5pG
	zkyOLZvzSQuDVlBnQceXeGJd/up98BAM5lqAT6nh5GokSDo1312lQni3yMtfjkKGaAtxYMp6cVz3j
	WzVgYd0yzt8V8lh/k3XS3wCfYzqJoFUU584xl4x78Z6CKmI5X0xjzeDfh5OQQh5sepExYt1ls5zIE
	4UY6sPRjgBgFbWZwCtmp+Jk6g8a1P770DPn4ICjxKo+WM0C1Hyoe0NU6DHRq/TXPc+q1XLH5XYD/g
	V9qTpxGm+kQFwTUf+arDPByWCkXdVc+w12ogbpfk/fzFJrnR0DiwGVI5pkhsNlrJS4HNShxbI1xOT
	KUNV2Zcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVZ-0000000Cn8w-3gxs;
	Sat, 03 Oct 2026 00:21:45 +0000
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVU-0000000Cn2k-2aE3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:42 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2d02df2bf09so106735ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986900; x=1791591700; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+0LSbObtLQixt10mRMgsu561+yH+1K8mdQenqKY5U4A=;
        b=Q0AFVd7Ww4JzQqTit998wfzMLMt1teaCd/5Koqw3C3SpzBYrGFIAFNNyifaBkIc2wF
         OOOFq2KP03NuIEAs/+3/KyyAmcO8C7KO198ZCZ2E+8CACtqM1jqGegsyLpVA78pXkGS3
         Jmm+ZtCVsg2B/gUXJC2Bsq3MiXPqkwFnbRgxx1cRP/Q96A6A96Q/IP8Ct2au8odNL/X2
         b/P8IAYwNXonZwyxquWP/OJ42w4WFf98XmJ0tuPGJu68ewFr6TgdznZrUgsJ8pdPV0L2
         b3Omy0B7G5ah7NrYeXUWNhd8RNH/nAsIu1I6CooUl6CawHRuBJT0vU4RaBwJIj/1UtwP
         KDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986900; x=1791591700;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+0LSbObtLQixt10mRMgsu561+yH+1K8mdQenqKY5U4A=;
        b=JEhyQyzKQ/pmn3rWPOjKctDQ8Cw9YUJycVDVZdhi8mhGC1VEPLRDDW+tHN3b0BXfQH
         554YmX8juEnJvT7oeD3GMBFX891bn6sh26QOjMrfl6CUf6MB8ZFlGUFmVbpquv0Mb1wZ
         SPxvbCF0Tqx1pNNR2qComdYPA+tlvfQqdzOd1SHMKi/dL1O5UPO7ZrlWjbN7aXQirqLQ
         DT4bQSoL4Ov4q6GqJy+OaiUpemjD32heknFhSrwBikMApWdR4EBmXTSG0ReLC5b1QjzB
         wBfydUysGk9QJVKA+f/XZo4NiqgMqPPoUxC5mBYvIeEzkvADqmL0XNOUyDqT9VQBnbkS
         4tkw==
X-Forwarded-Encrypted: i=1; AKwUvBwOspuBQ/d/VHz/YH4NpHzqAwnZSn4xy/D9I1sWQqARG2QuYIBx3Ceo1n2bRxr1Nrz47qVtpPKQ7YU5B9ISuM5E@lists.infradead.org
X-Gm-Message-State: AFq9FYKD6HUBvXvLJrr3a/05aLmF40q2sNxvFX18uQMCGOyfvlivs8Wc
	fq5xMIN8HPbdViPYO1oX2nINZq68PVp5gi/AEH0LJZRHNPrPtTN308XZ8JhVuXe/Uws0FEoQTbn
	OmQDpNCrdkdCPI/210KnCfA==
X-Received: from plev16.prod.google.com ([2002:a17:903:31d0:b0:2e2:c8c0:e8e2])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e88c:b0:2df:ad58:cf54 with SMTP id d9443c01a7336-2e49b60b6c4mr40943675ad.34.1790986899505;
 Fri, 02 Oct 2026 17:21:39 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:09 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-7-jthoughton@google.com>
Subject: [PATCH v2 06/20] hugetlb_vmemmap: Allow architectures to dynamically
 disallow HVO
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
X-CRM114-CacheID: sfid-20261002_172140_668344_F3EC4A25 
X-CRM114-Status: GOOD (  15.59  )
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

For arm64, only some platforms support HVO. Add an arch hook to prevent
HVO from taking affect if the architecture lacks support.

It may be the case that arch_supports_hugetlb_vmemmap_optimization()
returns false at first but eventually returns true. This is the case on
arm64. When this happens, bootmem hugepages won't be immediately HVOed,
but they will be optimized in prep_and_add_bootmem_folios().

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/asm-generic/hugetlb.h |  7 +++++++
 mm/hugetlb_vmemmap.c          | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/asm-generic/hugetlb.h b/include/asm-generic/hugetlb.h
index 635c41cc3479..8d24075d53d4 100644
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
index 3fdb1e4ce1a1..8596a462fee6 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -16,6 +16,7 @@
 #include <linux/pagewalk.h>
 #include <linux/pgalloc.h>
 #include <linux/vmemmap-optimization.h>
+#include <linux/hugetlb.h>
 
 #include <asm/tlbflush.h>
 #include "hugetlb_vmemmap.h"
@@ -529,6 +530,9 @@ static bool vmemmap_should_optimize_folio(const struct hstate *h, struct folio *
 	if (!READ_ONCE(vmemmap_optimize_enabled))
 		return false;
 
+	if (!arch_hugetlb_vmemmap_optimization_supported())
+		return false;
+
 	if (!hugetlb_vmemmap_optimizable(h))
 		return false;
 
@@ -731,6 +735,14 @@ void __init hugetlb_vmemmap_optimize_bootmem_page(unsigned long pfn, unsigned in
 	if (!READ_ONCE(vmemmap_optimize_enabled))
 		return;
 
+	/*
+	 * Architectures may return false here but true by the time
+	 * hugetlb_init() is called. In this case, although the folios will
+	 * not be pre-HVOed, they will be optimized in hugetlb_init().
+	 */
+	if (!arch_hugetlb_vmemmap_optimization_supported())
+		return;
+
 	section_set_compound_order_range(pfn, 1UL << order, order);
 }
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog



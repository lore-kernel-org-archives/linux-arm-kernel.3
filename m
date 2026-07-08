Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5A5C44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avFc8g+L1eyCm5XCDbsRZSWjyRAAOJ2Cs9ZxfGGqCu0=; b=sgSoOLvIZ+J1j0EA+VxmYj2iHI
	mXiksKRejF/lI4vxTWj5AkegZ/RvdS7sZDou5Tlc/jvE2GuNgsUrTBvVg4T+GOHhrRvtL5y/7kaj5
	ISXzqIpZwI+yX6FE2WA1jMah6ZDolXMKgDOkhT1dtcBLbLtfoCzdMo+6Smj693FURDR7jqGYK1KK3
	VehyQHOAN7UN5Xb+M9hS3YBAVEd7GiYnRwx9g6pBea/qeqUBMnyvAtr+jdpIi1ySqmbEB+L+fWXcd
	4NiVp0kLiXJdQcljYg1lmeaIihSri0JmHs8ZUxIYTht7jtfvTEsANyw5ropjqPnYlNMoAxKO/pPUN
	mAz/gyfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhU-0000000GCMs-2e1e;
	Wed, 08 Jul 2026 03:11:52 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhM-0000000GCAf-0ief
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:45 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2ccea73f81bso4132865ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480302; x=1784085102; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=avFc8g+L1eyCm5XCDbsRZSWjyRAAOJ2Cs9ZxfGGqCu0=;
        b=R3oesT0E2FGt4MflMBea2ceS5D3/QDwsZ4eIvbnznm0ZB1dsoxF4hvMqbebnmeGnSB
         gxixLbH9/iOQbUHMokLko049Qn3H7WMZR1iNzm1qLyrX+KOfm6cJzQoUjIGywxofyW20
         1/3nbrz+HA8/t85EdV9zEuVKWya/82YrYMURwycaD+MhyXxz1vSdGbd8WwAEZ6F5Gslu
         s6YQkvNZHWbKGKY5zoej1vZVPXM9aTMotdllhyjN+WJ+f7dT9Zsy5UA2K8a9jKAWFsLq
         ClFWWMOQ6nQ0ECjapoaIFPvEKt/Scil0TeLFgpEyuw3avmI7n++kcF2KF8r98ryeyNPM
         pnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480302; x=1784085102;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=avFc8g+L1eyCm5XCDbsRZSWjyRAAOJ2Cs9ZxfGGqCu0=;
        b=QmBH4K4xr245mQnkCntlHRDgeGm/UnFU7DiPTUTA3Z1DRDvNC6sQLHvMhKJwzb5j4r
         K47I9UUOYRhx4pj/i/jIzWJl69yd1HIfAftw9V+xo7ztCdqTfp2l/oRWSdX+tge3REmE
         4+96qyhHEC1Oyi3VGnTiIdDaG4soxdJSfm2UJCWVHAiHaQd5nJDsPxb7Ben9DUQifVxz
         YiLtiF19lRoMXo9+6NufCBJ/o1KK1UqzsoKaaXwC3rwg0FTfUMQ41QaQ8eqHzDX3RZew
         m3oYzhwCqNDgJ9//tieg2pRJ7xmiLiEn/jBUAwJ0+l51qbwPdZAd/N8QZWtSHIf4Lkzv
         PTxg==
X-Forwarded-Encrypted: i=1; AHgh+RqfeQYdvYdDmGAbE+ft0yd55vsB15azSAF32vs3PBDS4GphVFbxowoyM3MObyz5PBV5KVnpnPhA9UAXcTXZUSmw@lists.infradead.org
X-Gm-Message-State: AOJu0Ywth/7E11LNiKDwForx+6q4Hzfe2BrvL6U+U4bhfQPCQVNpcy7P
	ev6cMabnbHXS4rLh1fOUPn58PRZzjw+9W6AGFRe/YTsFTWeqIZQF+SHsNQw2h4aN86icJNQjJwo
	JWSnespa8KOIA5/WfJ9jHVA==
X-Received: from plcs20.prod.google.com ([2002:a17:903:30d4:b0:2c6:a770:7a87])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:32cb:b0:2ca:53e1:b915 with SMTP id d9443c01a7336-2ccea3b6c11mr7143285ad.14.1783480302107;
 Tue, 07 Jul 2026 20:11:42 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:20 +0000
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-11-jthoughton@google.com>
Subject: [PATCH 10/18] arm64: Support hugetlb vmemmap optimization
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
X-CRM114-CacheID: sfid-20260707_201144_236579_CCBF85C1 
X-CRM114-Status: GOOD (  14.98  )
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

Now that HVO is architecturally sound for arm64, enable support. Add a
new Kconfig for this support, as it comes with a regression, described
below.

Add a comment about BBML2_NOABORT where HVO is relying on it.

If a late-onlined CPU does not support HVO (HW AF and BBML2_NOABORT)
while all boot CPUs do support HVO, the late CPU won't be onlined after
this commit when a kernel is compiled with
HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/Kconfig   | 12 ++++++++++++
 mm/hugetlb_vmemmap.c |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919..cf4bd6bd7f11 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -259,6 +259,7 @@ config ARM64
 	select USER_STACKTRACE_SUPPORT
 	select VDSO_GETRANDOM
 	select VMAP_STACK
+	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if ARM64_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	help
 	  ARM 64-bit (AArch64) Linux support.
 
@@ -1607,6 +1608,17 @@ config ARCH_SPARSEMEM_ENABLE
 	def_bool y
 	select SPARSEMEM_VMEMMAP_ENABLE
 
+config ARM64_WANT_OPTIMIZE_HUGETLB_VMEMMAP
+	bool "Enable support for HugeTLB Vmemmap Optimization (HVO)"
+	default n
+	depends on HUGETLB_PAGE && SPARSEMEM_VMEMMAP && ARM64_HW_AFDBM
+	help
+	  Enable support for HVO. When enabled, late-onlining of CPUs that do
+	  not support features required by HVO will not be onlined if all boot
+	  CPUs do have such support.
+
+	  If unsure, say N
+
 config HW_PERF_EVENTS
 	def_bool y
 	depends on ARM_PMU
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 21377f795293..977249e22ed0 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -86,6 +86,10 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 
 		/* Make pte visible before pmd. See comment in pmd_install(). */
 		smp_wmb();
+		/*
+		 * On arm64, this requires BBML2_NOABORT. Its support has
+		 * already been checked.
+		 */
 		pmd_populate_kernel(&init_mm, pmd, pgtable);
 		if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
 			flush_tlb_kernel_range(start, start + PMD_SIZE);
-- 
2.55.0.795.g602f6c329a-goog



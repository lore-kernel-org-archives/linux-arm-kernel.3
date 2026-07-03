Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FCBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBfQ0Y2amoW1Wn3Q1LbOQJjLWTvXYln7NjUvp5UVSjM=; b=t2eaqKLJ5l1GeNW+UWiVVnhUGI
	21+9twzqcY4ud7O58mYgy+7cXFE7OphWuK+LBf/lleCjwfdxjf/8BGLfrFXouNBRKN16d+qw6MXvV
	/Tifu5IpptQrFiaFs9Q0O5Pz/ZCwlLv2Xly00f+KYYmuuZJJZ3qHbK5p5kjbR7xcY46mYhPJpoTHF
	FcCRVq069ciOKV6AsMkTVVxInPTSPIuFRSo975yOl+r6vuqUeIRROjOdTiPaoc7xdMPhbHceIJoZ6
	VO3q+P+M3d2GF0IPhcW03j7AOi8mWSLmOm5+jqoDd8s7lfI+9JtISRmCKmQr/Pp4+FfB/lqcmyCyI
	xGoIRwTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcIp-00000006pw8-1v5v;
	Fri, 03 Jul 2026 11:43:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcIm-00000006puA-3jQz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:43:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3DF41E2F;
	Fri,  3 Jul 2026 04:43:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BC5943FAA1;
	Fri,  3 Jul 2026 04:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783079004; bh=9JD/rGnP4z6sxKxaETbXjsBJM6V+qvu6dbKpCu5ZUWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tVEge0BjP5FjjmbkU4psRvLiJd6bT9jhj1hm1Pa4vOf3rdbXx6C7YaGHpoigAPzqO
	 vKdTkxgcIiMBdS93gKBCSr4GR2SegSbmQlxjG4YynzgaC0GjPSQiSEhJAQWBhw6M0z
	 NnXaV/42Hn1Ubhy+dmLVElzAxQsZflcB0qbag9k0=
From: Dev Jain <dev.jain@arm.com>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	david@kernel.org,
	liam@infradead.org
Cc: Dev Jain <dev.jain@arm.com>,
	riel@surriel.com,
	vbabka@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	kas@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	apopple@nvidia.com,
	rcampbell@nvidia.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	ak@linux.intel.com,
	nao.horiguchi@gmail.com,
	mel@csn.ul.ie,
	j-nomura@ce.jp.nec.com,
	pfalcato@suse.de,
	tglx@kernel.org,
	dave.hansen@intel.com,
	jpoimboe@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com
Subject: [PATCH v3 6/6] mm/mprotect: use huge_ptep_get() for hugetlb
Date: Fri,  3 Jul 2026 11:41:59 +0000
Message-ID: <20260703114202.365553-7-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703114202.365553-1-dev.jain@arm.com>
References: <20260703114202.365553-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_044324_980751_5B551D43 
X-CRM114-Status: GOOD (  11.29  )
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

prot_none_hugetlb_entry() is the hugetlb callback for the early
mprotect(PROT_NONE) PFN permission walk on x86.

The callback passes the decoded PFN to pfn_modify_allowed(). For a
hugetlb callback, the pte pointer refers to a hugetlb entry. On
architectures where hugetlb entries need huge_ptep_get(), reading that
entry with ptep_get() can make the permission check use the wrong PFN.

Use huge_ptep_get() before decoding the hugetlb PFN.

Currently there is no path which can trigger a bug: huge_ptep_get() is a
simple ptep_get() for x86, and the prot_none walk occurs only for x86.

So no need to backport - use the correct helper anyways.

Fixes: 42e4089c7890 ("x86/speculation/l1tf: Disallow non privileged high MMIO PROT_NONE mappings")
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/mprotect.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 9cbf932b028cf..6360d8a378023 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -699,14 +699,20 @@ static int prot_none_pte_entry(pte_t *pte, unsigned long addr,
 		0 : -EACCES;
 }
 
+#ifdef CONFIG_HUGETLB_PAGE
 static int prot_none_hugetlb_entry(pte_t *pte, unsigned long hmask,
 				   unsigned long addr, unsigned long next,
 				   struct mm_walk *walk)
 {
-	return pfn_modify_allowed(pte_pfn(ptep_get(pte)),
-				  *(pgprot_t *)(walk->private)) ?
-		0 : -EACCES;
+	const pte_t entry = huge_ptep_get(walk->mm, addr, pte);
+
+	if (pfn_modify_allowed(pte_pfn(entry), *(pgprot_t *)(walk->private)))
+		return 0;
+	return -EACCESS;
 }
+#else
+#define prot_none_hugetlb_entry	NULL
+#endif
 
 static int prot_none_test(unsigned long addr, unsigned long next,
 			  struct mm_walk *walk)
-- 
2.43.0



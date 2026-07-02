Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0D3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 05:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7WlNPyQYFLmwKtaNoFHPfAfBa2uK4w6WAKhq1umxydQ=; b=D8UBwis9+nxl23H9ZUMbZfp6d8
	SAr4tSbTgDy+tdAyoXD1jJ6IoHz4RWga019BuTw8EEOTEgvpsIgh8TbD5AJjM2l4a4ZxJFsjgCzcA
	GTphSYjID7u4vVJ4KTYt4SzE5DZyZMxC60JSReDSwynDa37rcEA11bjUBLQGDvhWkKIsgVTb6cWeb
	imvnoA0CB2FBmX0LGzqtaV5YzzGZ4rEdVpmjZ9eOFw6cdeaLgnzZIXe9JYwxHBcFMi0SlUA9/Si6J
	mBQtT+gpKhmrkmel0oF/hjiE64vYMwseo9sQ+FKGL669lac1N765m6/+l87hGqJDkiebj1HOsKVcu
	lgyOZjmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf9la-00000003adE-2uer;
	Thu, 02 Jul 2026 05:15:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf9lY-00000003abx-2DAX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 05:15:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 931883586;
	Wed,  1 Jul 2026 22:15:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9FD473F85F;
	Wed,  1 Jul 2026 22:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782969311; bh=I7ebyA7U2IBbmxUhqr2edCKpsPqBk8ef9pXwWM/RmMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XwiuRd6fXPuSeDCrNxNNkKqwrBYSGz1RsOiHZ5yaS3SYSxFlbr81/JHJw2EohRv8o
	 qv9BnEYkAoZfhAQrQQLoZ6ed2wJQFtICQu6bp2CRz3/7Tk6yfAD77F7NyrWWccjwwY
	 jOkQaquHu32CF45zppsHf3Dh8HoMhqITLb1Axt/c=
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
	rcampbell@nvidia.com,
	apopple@nvidia.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	j-nomura@ce.jp.nec.com,
	nao.horiguchi@gmail.com,
	ak@linux.intel.com,
	mel@csn.ul.ie,
	pfalcato@suse.de,
	jpoimboe@kernel.org,
	dave.hansen@intel.com,
	tglx@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com
Subject: [PATCH v2 6/6] mm/mprotect: use huge_ptep_get() for hugetlb
Date: Thu,  2 Jul 2026 05:13:40 +0000
Message-ID: <20260702051341.126509-7-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702051341.126509-1-dev.jain@arm.com>
References: <20260702051341.126509-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_221512_608767_615ADED2 
X-CRM114-Status: GOOD (  11.28  )
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
Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/mprotect.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 9cbf932b028cf..23779632d18bf 100644
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
+	pte_t entry = huge_ptep_get(walk->mm, addr, pte);
+
+	return pfn_modify_allowed(pte_pfn(entry),
 				  *(pgprot_t *)(walk->private)) ?
 		0 : -EACCES;
 }
+#else
+#define prot_none_hugetlb_entry	NULL
+#endif
 
 static int prot_none_test(unsigned long addr, unsigned long next,
 			  struct mm_walk *walk)
-- 
2.43.0



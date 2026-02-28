Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25963FEE4C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 07:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vKnFbDy7FB6sF7REDl1Rwe0wUQPquhjGlWDfeFYqFE=; b=P1O4BiPd+016iAAN0cO8Zys0yn
	6O+wu0mzISpGyru5sZiEP6Aq3fi9reEjw2gfPeZ0UNdTl2e3jmJ7Wn2DMxcKObXi6VNmcP3g0cEf1
	9ug0fGvzfIyIqdrsyw4kZ053gFyGxvrGJnqp0gRO2d/NjOggdscNDVVhyTyLX/Hpo+Bg1o0KCDz8p
	0fo9d7qp2oSRnQMTzwANMBDmF2tjpxQQUYTjoALgmGFAFHKyGdKydBTQPK5JxzB2XkRBJu8HMG9rz
	4OKojDBY8U8JeGhwZB1gv01BH47MHYoDHnHbtdlYp2hZXp4xjLxc2sRC3stMme6njswbbbB7OJG+s
	bJ84VVNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwEYK-00000009b8x-3lvx;
	Sat, 28 Feb 2026 07:15:52 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwEY3-00000009b2j-2P3u
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 07:15:37 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+vKnFbDy7FB6sF7REDl1Rwe0wUQPquhjGlWDfeFYqFE=;
	b=R2hHTXWA18ZhrxOkzNZLndRDgNWvHTt+4DcHZrJf/rsTQ5W2EDWOF0cxB/RCoS2dA7df9cByL
	8xnULNpZcgD71u+b36aCNilavhq6qOStTB4fDjckgq+oJm/h4yJIZPZzoYFBaja2Rnmzsy3r2Su
	MGv9qdoOdNwtKwG+o0Tz61c=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fNGYr3FQxz12LDx;
	Sat, 28 Feb 2026 15:10:40 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 4796C4056A;
	Sat, 28 Feb 2026 15:15:19 +0800 (CST)
Received: from huawei.com (10.50.87.63) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 28 Feb
 2026 15:15:18 +0800
From: Yin Tirui <yintirui@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <willy@infradead.org>,
	<david@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <luto@kernel.org>,
	<peterz@infradead.org>, <akpm@linux-foundation.org>,
	<lorenzo.stoakes@oracle.com>, <ziy@nvidia.com>,
	<baolin.wang@linux.alibaba.com>, <Liam.Howlett@oracle.com>,
	<npache@redhat.com>, <ryan.roberts@arm.com>, <dev.jain@arm.com>,
	<baohua@kernel.org>, <lance.yang@linux.dev>, <vbabka@suse.cz>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<anshuman.khandual@arm.com>, <rmclure@linux.ibm.com>,
	<kevin.brodsky@arm.com>, <apopple@nvidia.com>, <ajd@linux.ibm.com>,
	<pasha.tatashin@soleen.com>, <bhe@redhat.com>, <thuth@redhat.com>,
	<coxu@redhat.com>, <dan.j.williams@intel.com>, <yu-cheng.yu@intel.com>,
	<yangyicong@hisilicon.com>, <baolu.lu@linux.intel.com>, <jgross@suse.com>,
	<conor.dooley@microchip.com>, <Jonathan.Cameron@huawei.com>,
	<riel@surriel.com>
CC: <wangkefeng.wang@huawei.com>, <chenjun102@huawei.com>,
	<yintirui@huawei.com>
Subject: [PATCH RFC v3 1/4] x86/mm: Use proper page table helpers for huge page generation
Date: Sat, 28 Feb 2026 15:09:03 +0800
Message-ID: <20260228070906.1418911-2-yintirui@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228070906.1418911-1-yintirui@huawei.com>
References: <20260228070906.1418911-1-yintirui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.63]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_231536_232159_A85A9423 
X-CRM114-Status: GOOD (  12.39  )
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

Historically, several core x86 mm subsystems (vmemmap, vmalloc, and CPA)
have abused `pfn_pte()` to generate PMD and PUD entries by passing
pgprot values containing the _PAGE_PSE flag, and then casting the
resulting pte_t to a pmd_t or pud_t.

This violates strict type safety and prevents us from enforcing the rule
that `pfn_pte()` should strictly generate pte without huge page attributes.

Fix these abuses by explicitly using the correct level-specific helpers
(`pfn_pmd()` and `pfn_pud()`) and their corresponding setters
(`set_pmd()`, `set_pud()`).

For the CPA (Change Page Attribute) code, which uses `pte_t` as a generic
container for page table entries across all levels in
__should_split_large_page(), pack the correctly generated PMD/PUD values
into the pte_t container.

This cleanup prepares the ground for making `pfn_pte()` strictly filter
out huge page attributes.

Signed-off-by: Yin Tirui <yintirui@huawei.com>
---
 arch/x86/mm/init_64.c        | 6 +++---
 arch/x86/mm/pat/set_memory.c | 6 +++++-
 arch/x86/mm/pgtable.c        | 4 ++--
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index df2261fa4f98..d65f3d05c66f 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1518,11 +1518,11 @@ static int __meminitdata node_start;
 void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 			       unsigned long addr, unsigned long next)
 {
-	pte_t entry;
+	pmd_t entry;
 
-	entry = pfn_pte(__pa(p) >> PAGE_SHIFT,
+	entry = pfn_pmd(__pa(p) >> PAGE_SHIFT,
 			PAGE_KERNEL_LARGE);
-	set_pmd(pmd, __pmd(pte_val(entry)));
+	set_pmd(pmd, entry);
 
 	/* check to see if we have contiguous blocks */
 	if (p_end != p || node_start != node) {
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 40581a720fe8..87aa0e9a8f82 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -1059,7 +1059,11 @@ static int __should_split_large_page(pte_t *kpte, unsigned long address,
 		return 1;
 
 	/* All checks passed. Update the large page mapping. */
-	new_pte = pfn_pte(old_pfn, new_prot);
+	if (level == PG_LEVEL_2M)
+		new_pte = __pte(pmd_val(pfn_pmd(old_pfn, new_prot)));
+	else
+		new_pte = __pte(pud_val(pfn_pud(old_pfn, new_prot)));
+
 	__set_pmd_pte(kpte, address, new_pte);
 	cpa->flags |= CPA_FLUSHTLB;
 	cpa_inc_lp_preserved(level);
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 2e5ecfdce73c..61320fd44e16 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -644,7 +644,7 @@ int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
 	if (pud_present(*pud) && !pud_leaf(*pud))
 		return 0;
 
-	set_pte((pte_t *)pud, pfn_pte(
+	set_pud(pud, pfn_pud(
 		(u64)addr >> PAGE_SHIFT,
 		__pgprot(protval_4k_2_large(pgprot_val(prot)) | _PAGE_PSE)));
 
@@ -676,7 +676,7 @@ int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
 	if (pmd_present(*pmd) && !pmd_leaf(*pmd))
 		return 0;
 
-	set_pte((pte_t *)pmd, pfn_pte(
+	set_pmd(pmd, pfn_pmd(
 		(u64)addr >> PAGE_SHIFT,
 		__pgprot(protval_4k_2_large(pgprot_val(prot)) | _PAGE_PSE)));
 
-- 
2.22.0



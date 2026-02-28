Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1347FEE4CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 07:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WAYkRFCYpcA+nAu13ib8+d0IGvS7iebtzbag+H95n4=; b=EMhtzxT1HqQXbUOQhbz1mOSYS/
	NTU24DbRT3U7dzq7MU4LsXk8WWb3l2Ri1PW/BpdgmQX2ileK8sNUmHVg3POlMA4SDG9TNOBKGGSlw
	SLim/VZOiAL+A8ambtNHs9hQt8ALRVWoEK92CNiTgiM6SxwfydKL2WwZh5twZz1aJG6ObYrD2mIYr
	wWyZuKOQGedcCn2ou9uh6+4eTjmK7J8eRhrC8iOuBqqxaR9vxs7grOLhE7sPJOLztglR0XaHBuGKK
	ZsPJtQDT7vUdLkOfFuDOZfKTGIkJjvSnSV8Hwg2t+rHfEH9O8oPW8GWCBxvpbuYHCx2iADuW2xLhw
	AywT+1hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwEYL-00000009b9Y-1xjS;
	Sat, 28 Feb 2026 07:15:53 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwEY3-00000009b2k-2JMB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 07:15:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4WAYkRFCYpcA+nAu13ib8+d0IGvS7iebtzbag+H95n4=;
	b=LoTKhMsnG4bUuracOAyVcvy7GChGNh6pZ0RXf5XyLir4bwYo/l+8jGr8CLDvZFyTS5KqC73M5
	tcFI8XDj92UQ0NwM/PDBYjTSTLRu09DO2bv0fhN/8yVkr9XQyw+Wwb/ZZT4oJNaYFDxkRhi9SFL
	6yMWypZ6QWkvJvOIu++TKjk=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fNGYs1cGwznTVY;
	Sat, 28 Feb 2026 15:10:41 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 3B40B40568;
	Sat, 28 Feb 2026 15:15:20 +0800 (CST)
Received: from huawei.com (10.50.87.63) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 28 Feb
 2026 15:15:19 +0800
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
Subject: [PATCH RFC v3 2/4] mm/pgtable: Make pfn_pte() filter out huge page attributes
Date: Sat, 28 Feb 2026 15:09:04 +0800
Message-ID: <20260228070906.1418911-3-yintirui@huawei.com>
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
X-CRM114-CacheID: sfid-20260227_231538_597347_B0220C5F 
X-CRM114-Status: GOOD (  10.24  )
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

A fundamental principle of page table type safety is that `pte_t` represents
the lowest level page table entry and should never carry huge page attributes.

Currently, passing a pgprot with huge page bits (e.g., extracted via
pmd_pgprot()) into pfn_pte() creates a malformed PTE that retains the huge
attribute, leading to the necessity of the ugly `pte_clrhuge()` anti-pattern.

Enforce type safety by making `pfn_pte()` inherently filter out huge page
attributes:
- On x86: Strip the `_PAGE_PSE` bit.
- On ARM64: Mask out the block descriptor bits in `PTE_TYPE_MASK` and
  enforce the `PTE_TYPE_PAGE` format.
- On RISC-V: No changes required, as RISC-V leaf PMDs and PTEs share the
  exact same hardware format and do not use a distinct huge bit.

Signed-off-by: Yin Tirui <yintirui@huawei.com>
---
 arch/arm64/include/asm/pgtable.h | 4 +++-
 arch/x86/include/asm/pgtable.h   | 4 ++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index b3e58735c49b..f2a7a40106d2 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -141,7 +141,9 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
 
 #define pte_pfn(pte)		(__pte_to_phys(pte) >> PAGE_SHIFT)
 #define pfn_pte(pfn,prot)	\
-	__pte(__phys_to_pte_val((phys_addr_t)(pfn) << PAGE_SHIFT) | pgprot_val(prot))
+	__pte(__phys_to_pte_val((phys_addr_t)(pfn) << PAGE_SHIFT) | \
+		((pgprot_val(prot) & ~(PTE_TYPE_MASK & ~PTE_VALID)) | \
+		(PTE_TYPE_PAGE & ~PTE_VALID)))
 
 #define pte_none(pte)		(!pte_val(pte))
 #define pte_page(pte)		(pfn_to_page(pte_pfn(pte)))
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 1662c5a8f445..a4dbd81d42bf 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -738,6 +738,10 @@ static inline pgprotval_t check_pgprot(pgprot_t pgprot)
 static inline pte_t pfn_pte(unsigned long page_nr, pgprot_t pgprot)
 {
 	phys_addr_t pfn = (phys_addr_t)page_nr << PAGE_SHIFT;
+
+	/* Filter out _PAGE_PSE to ensure PTEs never carry the huge page bit */
+	pgprot = __pgprot(pgprot_val(pgprot) & ~_PAGE_PSE);
+
 	/* This bit combination is used to mark shadow stacks */
 	WARN_ON_ONCE((pgprot_val(pgprot) & (_PAGE_DIRTY | _PAGE_RW)) ==
 			_PAGE_DIRTY);
-- 
2.22.0



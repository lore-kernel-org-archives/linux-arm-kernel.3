Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BA7D59D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 16:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7CziZgx+9HCd1BDJXjJel6IzSJfW897C201ynhyS8o=; b=JPGk+iVcoJsUl7cbUGSOjkBTAS
	15I/yQCwI8UUq5k3WQ2t2I6IS4Op5RyRWKs0AwjNpooaQ805jHo5/8CRvtS1EeW1eTfeLzGPWrPME
	om6hZ6B2wfcg+ibtQS1zwiFK+9gBvBRenfRMiODijNzUPKkSERaQTxVMd0ICDFFbDhNc4g8EY9Bfi
	caUOW8x9UBMq4u2vhr1O6XOuKAnK7xMGPml0OVqK1u9bgWPsgVXnRomkkARjo+YCkzbruee2/57Bz
	t8rkNWg4VkCBZ+uytgPEGZH6uufohkwPh28sp80AFC1WT3uBgaCWnql7ID72l5yWoYHcqt8QmvwCT
	OYY1C/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5r9-00000000pDO-2NnU;
	Fri, 12 Dec 2025 16:18:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5r2-00000000pBc-3wd7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 16:18:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81B46165C;
	Fri, 12 Dec 2025 08:18:43 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AC4203F762;
	Fri, 12 Dec 2025 08:18:45 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	kevin.brodsky@arm.com,
	dev.jain@arm.com,
	yang@os.amperecomputing.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 2/2] arm64: mmu: use pagetable_alloc_nolock() while stop_machine()
Date: Fri, 12 Dec 2025 16:18:32 +0000
Message-Id: <20251212161832.2067134-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212161832.2067134-1-yeoreum.yun@arm.com>
References: <20251212161832.2067134-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_081857_423044_B9EB2A8C 
X-CRM114-Status: GOOD (  11.01  )
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

linear_map_split_to_ptes() and __kpti_install_ng_mappings()
are called as callback of stop_machine().
That means these functions context are preemption disabled.

Unfortunately, under PREEMPT_RT, the pagetable_alloc() or
__get_free_pages() couldn't be called in this context
since spin lock that becomes sleepable on RT,
potentially causing a sleep during page allocation.

To address this, pagetable_alloc_nolock().

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/mm/mmu.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 2ba01dc8ef82..0e98606d8c4c 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -475,10 +475,15 @@ static void __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
 static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm, gfp_t gfp,
 				       enum pgtable_type pgtable_type)
 {
-	/* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
-	struct ptdesc *ptdesc = pagetable_alloc(gfp & ~__GFP_ZERO, 0);
+	struct ptdesc *ptdesc;
 	phys_addr_t pa;
 
+	/* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
+	if (gfpflags_allow_spinning(gfp))
+		ptdesc  = pagetable_alloc(gfp & ~__GFP_ZERO, 0);
+	else
+		ptdesc  = pagetable_alloc_nolock(gfp & ~__GFP_ZERO, 0);
+
 	if (!ptdesc)
 		return INVALID_PHYS_ADDR;
 
@@ -869,6 +874,7 @@ static int __init linear_map_split_to_ptes(void *__unused)
 		unsigned long kstart = (unsigned long)lm_alias(_stext);
 		unsigned long kend = (unsigned long)lm_alias(__init_begin);
 		int ret;
+		gfp_t gfp = IS_ENABLED(CONFIG_PREEMPT_RT) ? __GFP_HIGH : GFP_ATOMIC;
 
 		/*
 		 * Wait for all secondary CPUs to be put into the waiting area.
@@ -881,9 +887,9 @@ static int __init linear_map_split_to_ptes(void *__unused)
 		 * PTE. The kernel alias remains static throughout runtime so
 		 * can continue to be safely mapped with large mappings.
 		 */
-		ret = range_split_to_ptes(lstart, kstart, GFP_ATOMIC);
+		ret = range_split_to_ptes(lstart, kstart, gfp);
 		if (!ret)
-			ret = range_split_to_ptes(kend, lend, GFP_ATOMIC);
+			ret = range_split_to_ptes(kend, lend, gfp);
 		if (ret)
 			panic("Failed to split linear map\n");
 		flush_tlb_kernel_range(lstart, lend);
@@ -1207,7 +1213,14 @@ static int __init __kpti_install_ng_mappings(void *__unused)
 	remap_fn = (void *)__pa_symbol(idmap_kpti_install_ng_mappings);
 
 	if (!cpu) {
-		alloc = __get_free_pages(GFP_ATOMIC | __GFP_ZERO, order);
+		if (IS_ENABLED(CONFIG_PREEMPT_RT))
+			alloc = (u64) pagetable_alloc_nolock(__GFP_HIGH | __GFP_ZERO, order);
+		else
+			alloc = __get_free_pages(GFP_ATOMIC | __GFP_ZERO, order);
+
+		if (!alloc)
+			panic("Failed to alloc kpti_ng_pgd\n");
+
 		kpti_ng_temp_pgd = (pgd_t *)(alloc + (levels - 1) * PAGE_SIZE);
 		kpti_ng_temp_alloc = kpti_ng_temp_pgd_pa = __pa(kpti_ng_temp_pgd);
 
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}



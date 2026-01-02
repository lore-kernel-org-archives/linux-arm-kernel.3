Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C29FA374F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 15:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1MsYzpODszChxoywYT57YZfAuj54FNxkoFk0cLt57w=; b=SVWxm06GtIey0wxK7pykh/Q2ws
	wsoF81NFiSIzm+L+FNcTnqO6PAXspAyrvZuKsfnAs1vB3hwNF2V0m0rrJ1cZPKrYNXtihtIa4xbfY
	Bh+ruyNPaLMEKeaCsDopXKQJzmuRnv5k6HNCKP5aTCB5TRrtT+RA7MnveGLDBO3St+iqAqX7W4f8/
	f1WOr0lbL3D9ucSiZ/KzSLDLC86p2GtJIr6lf/3c2eWacVqUNDITwx9CZh89KuH9cCrD4khLSeTtw
	FwGeUP1KYbQeUgBl0jclESN0/mg+/zwkIzus7uRPf0kYSZoyb/QES4q+0Ih0y93X7gxhlW/5LEX4F
	cHTmMiGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgmG-00000008PRE-2id3;
	Fri, 02 Jan 2026 15:09:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgmD-00000008PPn-3YHm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 15:09:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D3141424;
	Fri,  2 Jan 2026 07:09:10 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 643B73F5A1;
	Fri,  2 Jan 2026 07:09:14 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	kevin.brodsky@arm.com,
	quic_zhenhuah@quicinc.com,
	dev.jain@arm.com,
	yang@os.amperecomputing.com,
	chaitanyas.prakash@arm.com,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	lorenzo.stoakes@oracle.com,
	ardb@kernel.org,
	jackmanb@google.com,
	vbabka@suse.cz,
	mhocko@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v4 3/3] arm64: mmu: avoid allocating pages while installing ng-mapping for KPTI
Date: Fri,  2 Jan 2026 15:07:36 +0000
Message-Id: <20260102150736.1378818-4-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260102150736.1378818-1-yeoreum.yun@arm.com>
References: <20260102150736.1378818-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_070918_021762_414DF289 
X-CRM114-Status: GOOD (  13.01  )
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

The current __kpti_install_ng_mappings() allocates a temporary PGD
while installing the NG mapping for KPTI under stop_machine(),
using GFP_ATOMIC.

This is fine in the non-PREEMPT_RT case. However, it becomes a problem
under PREEMPT_RT because generic memory allocation/free APIs
(e.g., pgtable_alloc(), __get_free_pages(), etc.) cannot be invoked
in a non-preemptible context, except for the *_nolock() variants.
These generic allocators may sleep due to their use of spin_lock().

In other words, calling __get_free_pages(), even with GFP_ATOMIC,
is not allowed in __kpti_install_ng_mappings(), which is executed by
the stopper thread where preemption is disabled under PREEMPT_RT.

To address this, preallocate the page needed for the temporary PGD
before invoking __kpti_install_ng_mappings() via stop_machine().

Fixes: 47546a1912fc ("arm64: mm: install KPTI nG mappings with MMU enabled")
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/mm/mmu.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index cc086e91a506..7a7804dba381 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1362,7 +1362,7 @@ static phys_addr_t __init kpti_ng_pgd_alloc(enum pgtable_type type)
 	return kpti_ng_temp_alloc;
 }
 
-static int __init __kpti_install_ng_mappings(void *__unused)
+static int __init __kpti_install_ng_mappings(void *data)
 {
 	typedef void (kpti_remap_fn)(int, int, phys_addr_t, unsigned long);
 	extern kpti_remap_fn idmap_kpti_install_ng_mappings;
@@ -1370,10 +1370,9 @@ static int __init __kpti_install_ng_mappings(void *__unused)
 
 	int cpu = smp_processor_id();
 	int levels = CONFIG_PGTABLE_LEVELS;
-	int order = order_base_2(levels);
 	u64 kpti_ng_temp_pgd_pa = 0;
 	pgd_t *kpti_ng_temp_pgd;
-	u64 alloc = 0;
+	u64 alloc = *(u64 *)data;
 
 	if (levels == 5 && !pgtable_l5_enabled())
 		levels = 4;
@@ -1384,8 +1383,6 @@ static int __init __kpti_install_ng_mappings(void *__unused)
 
 	if (!cpu) {
 		int ret;
-
-		alloc = __get_free_pages(GFP_ATOMIC | __GFP_ZERO, order);
 		kpti_ng_temp_pgd = (pgd_t *)(alloc + (levels - 1) * PAGE_SIZE);
 		kpti_ng_temp_alloc = kpti_ng_temp_pgd_pa = __pa(kpti_ng_temp_pgd);
 
@@ -1416,16 +1413,16 @@ static int __init __kpti_install_ng_mappings(void *__unused)
 	remap_fn(cpu, num_online_cpus(), kpti_ng_temp_pgd_pa, KPTI_NG_TEMP_VA);
 	cpu_uninstall_idmap();
 
-	if (!cpu) {
-		free_pages(alloc, order);
+	if (!cpu)
 		arm64_use_ng_mappings = true;
-	}
 
 	return 0;
 }
 
 void __init kpti_install_ng_mappings(void)
 {
+	int order = order_base_2(CONFIG_PGTABLE_LEVELS);
+	u64 alloc;
 	/* Check whether KPTI is going to be used */
 	if (!arm64_kernel_unmapped_at_el0())
 		return;
@@ -1438,8 +1435,14 @@ void __init kpti_install_ng_mappings(void)
 	if (arm64_use_ng_mappings)
 		return;
 
+	alloc = __get_free_pages(GFP_KERNEL | __GFP_ZERO, order);
+	if (!alloc)
+		panic("Failed to alloc page tables\n");
+
 	init_idmap_kpti_bbml2_flag();
-	stop_machine(__kpti_install_ng_mappings, NULL, cpu_online_mask);
+	stop_machine(__kpti_install_ng_mappings, &alloc, cpu_online_mask);
+
+	free_pages(alloc, order);
 }
 
 static pgprot_t __init kernel_exec_prot(void)
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}



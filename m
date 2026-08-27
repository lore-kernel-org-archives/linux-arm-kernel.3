Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28275C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOTDgBkjYJFHvNQbfBQWTD/6fFe89tZAtGOjlb0y990=; b=IrLB1wWRFYBPwExplccS6+5vFt
	kg0bgkbnU24PvdocsjYFNtL0wLaJEU91A3ezqmnsJnwCca5sGPUjeFNTX0RIc/WXv+tUCpZ+/8DaJ
	vKKz8y7VTDPaoFKaMdGA1kjOc10YwEtk/gFb88WFPpPy9K5uZhAgbRKufD6gbjPeyKUIWwZDBsV5H
	cFnWiqLFvdPeEt36v78obbK/XzWT8y3gByT6CW9hJeyn+/Ota2UzjAg8ticX3GAFGhg9TqNqd3fdA
	i/Od+pz8HS6DfUzt6ME58Q0rWxEunKNPDtY/+T8HLQRH1/TMaUkIfoIac7bMunYlcO3MwclpIEqUL
	MM5KvMaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuN-00000004Jpm-3clj;
	Thu, 27 Aug 2026 16:24:55 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuC-00000004JhB-23JB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:24:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uOTDgBkjYJFHvNQbfBQWTD/6fFe89tZAtGOjlb0y990=;
	b=wtbL8sbN6tNfhYL36YDbdr/ivXINVqVkk90pUmq92rN8cLBL20/oYfcOC+UfURGULymSn/Yf1
	u0XqUbwXc5kYu2UuEba9a35jtyCNeRQF9KydgYEbxyPLIDONF88jLBvoo555mEitZA4/pudQ3PI
	/DPolqoyPJU9gC8IkMbs54k=
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KF1XKkzHnH5S;
	Fri, 28 Aug 2026 00:24:01 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 3ACEA4058E;
	Fri, 28 Aug 2026 00:24:37 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 19:24:36 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>, <cl@gentwo.org>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<liam@infradead.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<artem.kuzin@huawei.com>, <panov.nikita@huawei.com>
Subject: [RFC PATCH 11/18] mm: enable per-NUMA node kernel text and rodata replication
Date: Fri, 28 Aug 2026 00:11:51 +0800
Message-ID: <20260827161158.3618409-12-panov.nikita@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827161158.3618409-1-panov.nikita@huawei.com>
References: <20260827161158.3618409-1-panov.nikita@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.66.11]
X-ClientProxiedBy: mscpeml100003.china.huawei.com (10.199.174.67) To
 mscpeml500004.china.huawei.com (7.188.26.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_092444_909253_074CE702 
X-CRM114-Status: GOOD (  15.28  )
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
Reply-To: artem.kuzin@huawei.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Acked-by: Artem Kuzin <artem.kuzin@huawei.com>
Acked-by: Alexander Grubnikov <alexander.grubnikov@huawei.com>
Acked-by: Ilya Hanov <ilya.hanov@huawei-partners.com>
Acked-by: Denis Darvish <darvish.denis@huawei.com>
Signed-off-by: Nikita Panov <panov.nikita@huawei.com>
---
 arch/arm64/mm/context.c |  1 -
 arch/arm64/mm/mmu.c     |  8 ++++++--
 include/linux/mm.h      |  3 +++
 init/main.c             | 17 +++++++++++++++++
 mm/mm_init.c            |  3 +++
 5 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index 3afdae62784e..0f4a28b87469 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -11,7 +11,6 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/mm.h>
-#include <linux/numa_kernel_replication.h>
 
 #include <asm/cpufeature.h>
 #include <asm/mmu_context.h>
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index fa12461c0d8e..4bc8b748e303 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1040,10 +1040,10 @@ void __init create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
 				 pgd_pgtable_alloc_special_mm, flags);
 }
 
+#ifdef CONFIG_KERNEL_REPLICATION
 static void populate_mappings_prot(phys_addr_t phys, unsigned long virt,
 				   phys_addr_t size, pgprot_t prot)
 {
-#ifdef CONFIG_KERNEL_REPLICATION
 	int nid;
 
 	for_each_memory_node(nid) {
@@ -1051,10 +1051,14 @@ static void populate_mappings_prot(phys_addr_t phys, unsigned long virt,
 			page_to_phys(walk_to_page_node(nid, (void *)virt)),
 			virt, size, prot, NULL, 0);
 	}
+}
 #else
+static void populate_mappings_prot(phys_addr_t phys, unsigned long virt,
+				   phys_addr_t size, pgprot_t prot)
+{
 	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL, 0);
-#endif /* CONFIG_KERNEL_REPLICATION */
 }
+#endif /* CONFIG_KERNEL_REPLICATION */
 
 static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
 				phys_addr_t size, pgprot_t prot)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 8a7083c02203..0f3592038823 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4240,6 +4240,9 @@ extern int __meminit early_pfn_to_nid(unsigned long pfn);
 #endif
 
 extern void mem_init(void);
+#ifdef CONFIG_KERNEL_REPLICATION
+extern void preallocate_vmalloc_pages(void);
+#endif
 extern void __init mmap_init(void);
 
 extern void __show_mem(unsigned int flags, const nodemask_t *nodemask, int max_zone_idx);
diff --git a/init/main.c b/init/main.c
index d9d936707c19..249307e46818 100644
--- a/init/main.c
+++ b/init/main.c
@@ -109,6 +109,7 @@
 #include <linux/unaligned.h>
 #include <linux/vdso_datastore.h>
 #include <linux/hazptr.h>
+#include <linux/numa_kernel_replication.h>
 #include <net/net_namespace.h>
 
 #include <asm/io.h>
@@ -1038,12 +1039,20 @@ void start_kernel(void)
 	 * These use large bootmem allocations and must precede
 	 * initalization of page allocator
 	 */
+	numa_replication_init();
 	setup_log_buf(0);
 	vfs_caches_init_early();
 	sort_main_extable();
 	trap_init();
 	mm_core_init();
 	maple_tree_init();
+	/*
+	 * Kernel text replication should be done before
+	 * alloc/init first mm struct, due to it is necessary
+	 * to setup per-NUMA node translation tables and kernel
+	 * instances properly.
+	 */
+	numa_replicate_kernel_text();
 	poking_init();
 	ftrace_init();
 
@@ -1571,6 +1580,14 @@ static int __ref kernel_init(void *unused)
 	free_initmem();
 	mark_readonly();
 
+	/*
+	 * RODATA replication is done here due to
+	 * it is necessary to finalize the kernel
+	 * and modules initialization before
+	 */
+	numa_replicate_kernel_rodata();
+	numa_replication_fini();
+
 	/*
 	 * Kernel mappings are now finalized - update the userspace page-table
 	 * to finalize PTI.
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 1533aebafb68..d2b13d8887c8 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2679,6 +2679,9 @@ void __init mm_core_init(void)
 	ptlock_cache_init();
 	pgtable_cache_init();
 	debug_objects_mem_init();
+#ifdef CONFIG_KERNEL_REPLICATION
+	preallocate_vmalloc_pages();
+#endif
 	vmalloc_init();
 	/* If no deferred init page_ext now, as vmap is fully initialized */
 	if (!deferred_struct_pages)
-- 
2.34.1



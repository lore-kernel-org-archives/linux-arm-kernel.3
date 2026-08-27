Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825A9C61DCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEcX3HXLMzVOuLicTphBIj/R1Bu+Rm00Soec5tDKcys=; b=OAHRiDi6VG8wSOjkSkF7yxMate
	sTMkqvKq2xu5pfSO4isA/vevQ/zpFMzczXsnM/4wH9Em/F7e3/qproh6F2vCKRKgaOHc7kbVG8NZF
	FFvZDd6qcHetMQOxtKgCUc1X91B3Ib6NaPgvKZ1IgpDnqVf2icZuSb/RZ6TeWtDKAz7elvsDBegw+
	q8MMzg0sEwZtuBaB10Ec4qxN1C27GStD29ss2wHLAFqvXMROmWwzJt5XJLv4cdqdTNFkSB8bpNGfA
	CZ2qLmnK/At6Yq/dlQkOSBFAa5hMe0t/fzKnGPoB2VPB9bz3haEl6QRmpsyC7S+h/QM+jThdBHzGP
	4AQ4p1MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuO-00000004JrR-1oGu;
	Thu, 27 Aug 2026 16:24:56 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuC-00000004JhE-1hdN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:24:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CEcX3HXLMzVOuLicTphBIj/R1Bu+Rm00Soec5tDKcys=;
	b=EywF5R3EdvPAq5zPDcW+XuVFbk1/bBUity+jgaldkQtH15J6yMmiQLRhCnW/+p3b8uDcX0TO1
	Ax6VCwo0moAgqjpzspUqI4gkuwNmyv2ejH8HJreRveH306WGRUQxS41RlGX/9zjTKTQij6rPkqD
	t9bp17Vo0C1A4fOiICCfyes=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KD2c0vzHnH3v;
	Fri, 28 Aug 2026 00:24:00 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 5EC9B40570;
	Fri, 28 Aug 2026 00:24:36 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 19:24:35 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>, <cl@gentwo.org>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<liam@infradead.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<artem.kuzin@huawei.com>, <panov.nikita@huawei.com>
Subject: [RFC PATCH 04/18] arm64: add arch callbacks for kernel replication
Date: Fri, 28 Aug 2026 00:11:44 +0800
Message-ID: <20260827161158.3618409-5-panov.nikita@huawei.com>
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
X-CRM114-CacheID: sfid-20260827_092444_953914_74D68BD4 
X-CRM114-Status: GOOD (  11.98  )
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
 arch/arm64/include/asm/numa_replication.h | 54 +++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 arch/arm64/include/asm/numa_replication.h

diff --git a/arch/arm64/include/asm/numa_replication.h b/arch/arm64/include/asm/numa_replication.h
new file mode 100644
index 000000000000..441a399f9c51
--- /dev/null
+++ b/arch/arm64/include/asm/numa_replication.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_NUMA_REPLICATION_H
+#define __ASM_NUMA_REPLICATION_H
+
+#ifdef CONFIG_KERNEL_REPLICATION
+#include <asm/pgtable.h>
+#include <asm/tlbflush.h>
+#include <asm/pgalloc.h>
+#include <asm/memory.h>
+#include <asm/mmu_context.h>
+#include <linux/mm.h>
+#include <linux/seq_file.h>
+
+#define PAGE_TABLE_REPLICATION_LEFT  ((max((u64)_end - SZ_2G, (u64)MODULES_VADDR)) & PGDIR_MASK)
+#define PAGE_TABLE_REPLICATION_RIGHT ((((u64)_end + SZ_2G) & PGDIR_MASK) + PGDIR_SIZE - 1)
+
+static inline pgd_t *numa_replicate_pgt_pgd(int nid)
+{
+	pgd_t *new_pgd;
+	struct page *pgd_page;
+
+	pgd_page = alloc_pages_node_noprof(nid, GFP_PGTABLE_KERNEL, 2);
+	BUG_ON(pgd_page == NULL);
+
+	new_pgd = (pgd_t *)page_address(pgd_page);
+	new_pgd += (PAGE_SIZE * 2 / sizeof(pgd_t)); //Extra pages for KPTI
+	copy_page(new_pgd, swapper_pg_dir);
+
+	return new_pgd;
+}
+
+static inline void numa_load_replicated_pgd(pgd_t *pgd)
+{
+	cpu_replace_ttbr1(pgd);
+	local_flush_tlb_all();
+}
+
+static inline ssize_t numa_cpu_dump(struct seq_file *m)
+{
+	seq_printf(m, "NODE: #%02d, CPU: #%04d, ttbr1_el1: 0x%p, COMM: %s\n",
+		numa_node_id(),
+		smp_processor_id(),
+		(void *)read_sysreg(ttbr1_el1),
+		current->group_leader->comm);
+	return 0;
+}
+
+static inline void numa_sync_text_replicas(unsigned long start, unsigned long end)
+{
+	caches_clean_inval_pou(start, end);
+	icache_inval_all_pou();
+}
+#endif /* CONFIG_KERNEL_REPLICATION */
+#endif /* __ASM_NUMA_REPLICATION_H */
-- 
2.34.1



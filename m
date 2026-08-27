Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21428C61DCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKq7Nh2gcYohgYrYR5axiDJ4p1s9We/3CeTSchjvn7A=; b=GWXOvag3plsmZat4qwp9B7L4J4
	aS83f6z1Uu3J5MWp74lHtq448s1LN/84OGfIj9S0Tk+NDHF5Usbttg0pAgtkgPGcsbS+sdRArZyum
	MQ2ZYJRIBKHjtZFJOXzMU3qScyOG1zx6Hqrjade8w9imKZfHnGsTFkvT4hN6U81wVxEX45TV5ZWh4
	+5rmd+K7FKQ7aEEevV42NlhvSzLZsCPeUSODvuSR31041Nt5CDKTwMHB+et36HBCcH7psNjRedV8d
	mKza1bsa35ryUgGjCslGEQ/rSWkkeP9Bbc2Cnh/dh5JGE6u1kOxNsjDEkPqZKNTTmRzLrJlgWbEvW
	8ytqE3Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuP-00000004JtE-0BwA;
	Thu, 27 Aug 2026 16:24:57 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuG-00000004JkF-3seI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:24:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MKq7Nh2gcYohgYrYR5axiDJ4p1s9We/3CeTSchjvn7A=;
	b=CFxplSWMhRpP8AAbiY91FEFGTrBwzp0iMlr33Qf/OYA54NMunuxvtLsKNFYazG/V7FN0tYbCW
	qVnSK4U881PmSGi5eEBaNy7Ih6oUsQdS4opo6Pbu87KJhzl/SLUUsws+oXRpCITmnkyZjeHgHeG
	yehCK3Lv097Ecr7CG8SvsTI=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KX0GPXzJ46Yq;
	Fri, 28 Aug 2026 00:24:16 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 92A1F40570;
	Fri, 28 Aug 2026 00:24:37 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 19:24:37 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>, <cl@gentwo.org>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<liam@infradead.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<artem.kuzin@huawei.com>, <panov.nikita@huawei.com>
Subject: [RFC PATCH 12/18] arm64: make power management aware about kernel replication
Date: Fri, 28 Aug 2026 00:11:52 +0800
Message-ID: <20260827161158.3618409-13-panov.nikita@huawei.com>
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
X-CRM114-CacheID: sfid-20260827_092449_252524_84C0C68E 
X-CRM114-Status: GOOD (  11.78  )
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
 arch/arm64/include/asm/mmu_context.h | 4 ++++
 arch/arm64/kernel/hibernate.c        | 5 +++++
 arch/arm64/kernel/sleep.S            | 8 ++++++++
 mm/numa_kernel_replication.c         | 5 +++++
 4 files changed, 22 insertions(+)

diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 803b68758152..f364281d3442 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -136,10 +136,14 @@ static inline void cpu_install_ttbr0(phys_addr_t ttbr0, unsigned long t0sz)
 
 void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp);
 
+#ifndef CONFIG_KERNEL_REPLICATION
 static inline void cpu_enable_swapper_cnp(void)
 {
 	__cpu_replace_ttbr1(lm_alias(swapper_pg_dir), true);
 }
+#else
+void cpu_enable_swapper_cnp(void);
+#endif
 
 static inline void cpu_replace_ttbr1(pgd_t *pgdp)
 {
diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 7bf117427777..e9f5ddf37c4a 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -16,6 +16,7 @@
 #include <linux/sched.h>
 #include <linux/suspend.h>
 #include <linux/utsname.h>
+#include <linux/numa_kernel_replication.h>
 
 #include <asm/barrier.h>
 #include <asm/cacheflush.h>
@@ -113,7 +114,11 @@ int arch_hibernation_header_save(void *addr, unsigned int max_size)
 		return -EOVERFLOW;
 
 	arch_hdr_invariants(&hdr->invariants);
+#ifdef CONFIG_KERNEL_REPLICATION
+	hdr->ttbr1_el1		= virt_to_phys(this_node_pgd(&init_mm));
+#else
 	hdr->ttbr1_el1		= __pa_symbol(swapper_pg_dir);
+#endif /* CONFIG_KERNEL_REPLICATION */
 	hdr->reenter_kernel	= _cpu_resume;
 
 	/* We can't use __hyp_get_vectors() because kvm may still be loaded */
diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
index f093cdf71be1..8ad66ed70122 100644
--- a/arch/arm64/kernel/sleep.S
+++ b/arch/arm64/kernel/sleep.S
@@ -5,6 +5,10 @@
 #include <asm/assembler.h>
 #include <asm/smp.h>
 
+#ifdef CONFIG_KERNEL_REPLICATION
+.extern numa_setup_pgd
+#endif
+
 	.text
 /*
  * Implementation of MPIDR_EL1 hash algorithm through shifting
@@ -144,6 +148,10 @@ SYM_FUNC_START(_cpu_resume)
 	bl	kasan_unpoison_task_stack_below
 #endif
 
+#ifdef CONFIG_KERNEL_REPLICATION
+	bl 	numa_setup_pgd
+#endif
+
 	ldp	x19, x20, [x29, #16]
 	ldp	x21, x22, [x29, #32]
 	ldp	x23, x24, [x29, #48]
diff --git a/mm/numa_kernel_replication.c b/mm/numa_kernel_replication.c
index 082aabc6b8bc..b1c5cd2a1fa1 100644
--- a/mm/numa_kernel_replication.c
+++ b/mm/numa_kernel_replication.c
@@ -67,6 +67,11 @@ static int node_to_memory_node[MAX_NUMNODES];
 static bool pgtables_extra;
 static DEFINE_SPINLOCK(debugfs_lock);
 
+void cpu_enable_swapper_cnp(void)
+{
+	__cpu_replace_ttbr1(this_node_pgd(&init_mm), true);
+}
+
 bool is_text_replicated(void)
 {
 	return text_replicated;
-- 
2.34.1



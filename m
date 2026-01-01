Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85470EEEC1C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 22:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srr2Rd/TEcy3A2JJQDPXH1+aXxFy3yljG6lcR/gP5CI=; b=rj/LnOVizrg79locscr1OLz528
	rT6HSofWWW4/FT/e8okPM2g1onMd/ychAZnpBx8qBNJux1gzUenX8U7zv5W8udQ3Dw6GFdeb8khO8
	oAFLi6N8LWWdAX7fb4MDpVs2jV+oxGB8QuhpeZbrLxQnGVKwrDZiLnBZ5SCL5Ql4LzUUEDrgeutsd
	VI5xr+ssmvzTJqh3QFzUl5Msw5EBdzNFZMTAdqq9Keq8zQGjZAEoRqeCWCvZy8P7Wxwf23pOYXLyB
	YaWr4yETyFucTvMFvIjltJtmed+RYmNQf4TQ6qoDKgtcK4bNNGAtXRe85bYZZxQtLPYn2K/Dj8Bxx
	AZQ+wUMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbQxg-00000007YKK-0bew;
	Thu, 01 Jan 2026 22:16:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbQxe-00000007YIR-0Gfk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 22:16:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E76260054;
	Thu,  1 Jan 2026 22:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2894CC4CEF7;
	Thu,  1 Jan 2026 22:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767305761;
	bh=iE5HNXxcf5Yij69saaDAoVPz7iPaTsBAd7fg0JUxZYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=muHvVB3a10Akl60W77jSSqSOLSGnLSzt0LX9ziUqhp8Su9a3CdhYAPDfiUBa8doE1
	 r2Uad3NKMWcSZCcgNPa9ukJd+x1X/iyvE6FcC0ciaQ48TMVcUN4ydVTs45NjRjDQOP
	 ZNNBLqnW+1U3ELu0rDwrTFpZXz6tzS358v0g/cnSG4YYRsQ0dkTLH49M5MXv5F4aMs
	 0o48Y4d8UZFG/chECMx8CaKk+tLHp/fsT2Gc+3UJWOkH2OvtaGfXgZIUa0xoSh7sTh
	 zPYWTnu9hq3WwMWJ3hibzDCEkzgcW2+xU7Xi8XbeAlobi16xrWr1aOHydKIAcItS3f
	 OYx8qbidzQB9w==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chen Ridong <chenridong@huawei.com>,
	Danilo Krummrich <dakr@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Simon Horman <horms@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>,
	cgroups@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 13/33] sched/isolation: Convert housekeeping cpumasks to rcu pointers
Date: Thu,  1 Jan 2026 23:13:38 +0100
Message-ID: <20260101221359.22298-14-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260101221359.22298-1-frederic@kernel.org>
References: <20260101221359.22298-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

HK_TYPE_DOMAIN's cpumask will soon be made modifiable by cpuset.
A synchronization mechanism is then needed to synchronize the updates
with the housekeeping cpumask readers.

Turn the housekeeping cpumasks into RCU pointers. Once a housekeeping
cpumask will be modified, the update side will wait for an RCU grace
period and propagate the change to interested subsystem when deemed
necessary.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/sched/isolation.c | 58 +++++++++++++++++++++++++---------------
 kernel/sched/sched.h     |  1 +
 2 files changed, 37 insertions(+), 22 deletions(-)

diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 11a623fa6320..83be49ec2b06 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -21,7 +21,7 @@ DEFINE_STATIC_KEY_FALSE(housekeeping_overridden);
 EXPORT_SYMBOL_GPL(housekeeping_overridden);
 
 struct housekeeping {
-	cpumask_var_t cpumasks[HK_TYPE_MAX];
+	struct cpumask __rcu *cpumasks[HK_TYPE_MAX];
 	unsigned long flags;
 };
 
@@ -33,17 +33,28 @@ bool housekeeping_enabled(enum hk_type type)
 }
 EXPORT_SYMBOL_GPL(housekeeping_enabled);
 
+const struct cpumask *housekeeping_cpumask(enum hk_type type)
+{
+	if (static_branch_unlikely(&housekeeping_overridden)) {
+		if (housekeeping.flags & BIT(type)) {
+			return rcu_dereference_check(housekeeping.cpumasks[type], 1);
+		}
+	}
+	return cpu_possible_mask;
+}
+EXPORT_SYMBOL_GPL(housekeeping_cpumask);
+
 int housekeeping_any_cpu(enum hk_type type)
 {
 	int cpu;
 
 	if (static_branch_unlikely(&housekeeping_overridden)) {
 		if (housekeeping.flags & BIT(type)) {
-			cpu = sched_numa_find_closest(housekeeping.cpumasks[type], smp_processor_id());
+			cpu = sched_numa_find_closest(housekeeping_cpumask(type), smp_processor_id());
 			if (cpu < nr_cpu_ids)
 				return cpu;
 
-			cpu = cpumask_any_and_distribute(housekeeping.cpumasks[type], cpu_online_mask);
+			cpu = cpumask_any_and_distribute(housekeeping_cpumask(type), cpu_online_mask);
 			if (likely(cpu < nr_cpu_ids))
 				return cpu;
 			/*
@@ -59,28 +70,18 @@ int housekeeping_any_cpu(enum hk_type type)
 }
 EXPORT_SYMBOL_GPL(housekeeping_any_cpu);
 
-const struct cpumask *housekeeping_cpumask(enum hk_type type)
-{
-	if (static_branch_unlikely(&housekeeping_overridden))
-		if (housekeeping.flags & BIT(type))
-			return housekeeping.cpumasks[type];
-	return cpu_possible_mask;
-}
-EXPORT_SYMBOL_GPL(housekeeping_cpumask);
-
 void housekeeping_affine(struct task_struct *t, enum hk_type type)
 {
 	if (static_branch_unlikely(&housekeeping_overridden))
 		if (housekeeping.flags & BIT(type))
-			set_cpus_allowed_ptr(t, housekeeping.cpumasks[type]);
+			set_cpus_allowed_ptr(t, housekeeping_cpumask(type));
 }
 EXPORT_SYMBOL_GPL(housekeeping_affine);
 
 bool housekeeping_test_cpu(int cpu, enum hk_type type)
 {
-	if (static_branch_unlikely(&housekeeping_overridden))
-		if (housekeeping.flags & BIT(type))
-			return cpumask_test_cpu(cpu, housekeeping.cpumasks[type]);
+	if (static_branch_unlikely(&housekeeping_overridden) && housekeeping.flags & BIT(type))
+		return cpumask_test_cpu(cpu, housekeeping_cpumask(type));
 	return true;
 }
 EXPORT_SYMBOL_GPL(housekeeping_test_cpu);
@@ -96,20 +97,33 @@ void __init housekeeping_init(void)
 
 	if (housekeeping.flags & HK_FLAG_KERNEL_NOISE)
 		sched_tick_offload_init();
-
+	/*
+	 * Realloc with a proper allocator so that any cpumask update
+	 * can indifferently free the old version with kfree().
+	 */
 	for_each_set_bit(type, &housekeeping.flags, HK_TYPE_MAX) {
+		struct cpumask *omask, *nmask = kmalloc(cpumask_size(), GFP_KERNEL);
+
+		if (WARN_ON_ONCE(!nmask))
+			return;
+
+		omask = rcu_dereference(housekeeping.cpumasks[type]);
+
 		/* We need at least one CPU to handle housekeeping work */
-		WARN_ON_ONCE(cpumask_empty(housekeeping.cpumasks[type]));
+		WARN_ON_ONCE(cpumask_empty(omask));
+		cpumask_copy(nmask, omask);
+		RCU_INIT_POINTER(housekeeping.cpumasks[type], nmask);
+		memblock_free(omask, cpumask_size());
 	}
 }
 
 static void __init housekeeping_setup_type(enum hk_type type,
 					   cpumask_var_t housekeeping_staging)
 {
+	struct cpumask *mask = memblock_alloc_or_panic(cpumask_size(), SMP_CACHE_BYTES);
 
-	alloc_bootmem_cpumask_var(&housekeeping.cpumasks[type]);
-	cpumask_copy(housekeeping.cpumasks[type],
-		     housekeeping_staging);
+	cpumask_copy(mask, housekeeping_staging);
+	RCU_INIT_POINTER(housekeeping.cpumasks[type], mask);
 }
 
 static int __init housekeeping_setup(char *str, unsigned long flags)
@@ -162,7 +176,7 @@ static int __init housekeeping_setup(char *str, unsigned long flags)
 
 		for_each_set_bit(type, &iter_flags, HK_TYPE_MAX) {
 			if (!cpumask_equal(housekeeping_staging,
-					   housekeeping.cpumasks[type])) {
+					   housekeeping_cpumask(type))) {
 				pr_warn("Housekeeping: nohz_full= must match isolcpus=\n");
 				goto free_housekeeping_staging;
 			}
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index d30cca6870f5..475bdab3b8db 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -42,6 +42,7 @@
 #include <linux/ktime_api.h>
 #include <linux/lockdep_api.h>
 #include <linux/lockdep.h>
+#include <linux/memblock.h>
 #include <linux/minmax.h>
 #include <linux/mm.h>
 #include <linux/module.h>
-- 
2.51.1



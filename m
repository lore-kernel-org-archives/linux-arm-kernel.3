Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5826CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJyY9iiPaITFRDOTyIUc/nGpefxbz5qQ8u5Ctbbjk4w=; b=tgwHPvaKckankob5/YU5Rur6Ng
	30YxFgH7/chvZVxsYVj2Cm/4JwtChCWc0FLaPRXBkZ8HicT3iV6EKezIYzwlJfN+dJNue6T4GPUw8
	vJxrqEHRLGTY2z3uLUSXEEYLoCR686S/3x3movXSthZ5xdxb/S9rL+N0RqMvxCG/LeC2t+Dhdz7sB
	R4fVXflsymrbbYVPC+uoOV/kQvPoNlqEuPodtYlKHNb4hNW8xp4uF0dEGqxE05K9YM42Sw0k50xnh
	3qbFZ4auJmzh8tKpq2WvKY3qPLNrkXcnx8BBeveCCZP0MB7hixIN+PkDPUH51EBUOpSWtaHanKtf2
	3Vwhq/0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PFF-0000000EOUz-3ULt;
	Mon, 13 Oct 2025 20:34:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PFE-0000000EOTJ-1q3M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:34:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BCF8861E1B;
	Mon, 13 Oct 2025 20:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E1FC4CEE7;
	Mon, 13 Oct 2025 20:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760387621;
	bh=mOrMHInwUUAF5x2TPu0KohmBJDCPDZeedSNBGf5P0qs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kMPyVftYiGwonaPxPkSe84brMb9jqYboCwHd2zZBPRDl08dCi7W9fE2s2bthYnXhd
	 sumWJ+6bP3nbIGMrekCn/4W0sfHr/ZjeJqracwuQnQZtgB0r8+ROWsq6904EhhmAJz
	 lYhFT7jbWsj8yiFQ9tWF3MRKSvUn29nSSC6k9CZUmDsbtednhzyAjB/ypOW2I2fxDM
	 0HwfUM3M36s1BBQZiiZIkw4s2Z8YOmSjMugkiJIGNXGi0yn6c+xcd06HDEvL9Oao85
	 CB+af609sbR8m1MH9ROYKIki0Ke9Od/QppZoiPx17IV5O6heaqv8H11HIHNsJ/wiVc
	 h7ERmhn8Bw7ew==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
Subject: [PATCH 13/33] cpuset: Update HK_TYPE_DOMAIN cpumask from cpuset
Date: Mon, 13 Oct 2025 22:31:26 +0200
Message-ID: <20251013203146.10162-14-frederic@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013203146.10162-1-frederic@kernel.org>
References: <20251013203146.10162-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Until now, HK_TYPE_DOMAIN used to only include boot defined isolated
CPUs passed through isolcpus= boot option. Users interested in also
knowing the runtime defined isolated CPUs through cpuset must use
different APIs: cpuset_cpu_is_isolated(), cpu_is_isolated(), etc...

There are many drawbacks to that approach:

1) Most interested subsystems want to know about all isolated CPUs, not
  just those defined on boot time.

2) cpuset_cpu_is_isolated() / cpu_is_isolated() are not synchronized with
  concurrent cpuset changes.

3) Further cpuset modifications are not propagated to subsystems

Solve 1) and 2) and centralize all isolated CPUs within the
HK_TYPE_DOMAIN housekeeping cpumask.

Subsystems can rely on RCU to synchronize against concurrent changes.

The propagation mentioned in 3) will be handled in further patches.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/sched/isolation.h |  2 +
 kernel/cgroup/cpuset.c          |  2 +
 kernel/sched/isolation.c        | 75 ++++++++++++++++++++++++++++++---
 kernel/sched/sched.h            |  1 +
 4 files changed, 74 insertions(+), 6 deletions(-)

diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
index da22b038942a..94d5c835121b 100644
--- a/include/linux/sched/isolation.h
+++ b/include/linux/sched/isolation.h
@@ -32,6 +32,7 @@ extern const struct cpumask *housekeeping_cpumask(enum hk_type type);
 extern bool housekeeping_enabled(enum hk_type type);
 extern void housekeeping_affine(struct task_struct *t, enum hk_type type);
 extern bool housekeeping_test_cpu(int cpu, enum hk_type type);
+extern int housekeeping_update(struct cpumask *mask, enum hk_type type);
 extern void __init housekeeping_init(void);
 
 #else
@@ -59,6 +60,7 @@ static inline bool housekeeping_test_cpu(int cpu, enum hk_type type)
 	return true;
 }
 
+static inline int housekeeping_update(struct cpumask *mask, enum hk_type type) { return 0; }
 static inline void housekeeping_init(void) { }
 #endif /* CONFIG_CPU_ISOLATION */
 
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index aa1ac7bcf2ea..b04a4242f2fa 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1403,6 +1403,8 @@ static void update_unbound_workqueue_cpumask(bool isolcpus_updated)
 
 	ret = workqueue_unbound_exclude_cpumask(isolated_cpus);
 	WARN_ON_ONCE(ret < 0);
+	ret = housekeeping_update(isolated_cpus, HK_TYPE_DOMAIN);
+	WARN_ON_ONCE(ret < 0);
 }
 
 /**
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index b46c20b5437f..95d69c2102f6 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -29,18 +29,48 @@ static struct housekeeping housekeeping;
 
 bool housekeeping_enabled(enum hk_type type)
 {
-	return !!(housekeeping.flags & BIT(type));
+	return !!(READ_ONCE(housekeeping.flags) & BIT(type));
 }
 EXPORT_SYMBOL_GPL(housekeeping_enabled);
 
+static bool housekeeping_dereference_check(enum hk_type type)
+{
+	if (IS_ENABLED(CONFIG_LOCKDEP) && type == HK_TYPE_DOMAIN) {
+		/* Cpuset isn't even writable yet? */
+		if (system_state <= SYSTEM_SCHEDULING)
+			return true;
+
+		/* CPU hotplug write locked, so cpuset partition can't be overwritten */
+		if (IS_ENABLED(CONFIG_HOTPLUG_CPU) && lockdep_is_cpus_write_held())
+			return true;
+
+		/* Cpuset lock held, partitions not writable */
+		if (IS_ENABLED(CONFIG_CPUSETS) && lockdep_is_cpuset_held())
+			return true;
+
+		return false;
+	}
+
+	return true;
+}
+
+static inline struct cpumask *housekeeping_cpumask_dereference(enum hk_type type)
+{
+	return rcu_dereference_check(housekeeping.cpumasks[type],
+				     housekeeping_dereference_check(type));
+}
+
 const struct cpumask *housekeeping_cpumask(enum hk_type type)
 {
+	const struct cpumask *mask = NULL;
+
 	if (static_branch_unlikely(&housekeeping_overridden)) {
-		if (housekeeping.flags & BIT(type)) {
-			return rcu_dereference_check(housekeeping.cpumasks[type], 1);
-		}
+		if (READ_ONCE(housekeeping.flags) & BIT(type))
+			mask = housekeeping_cpumask_dereference(type);
 	}
-	return cpu_possible_mask;
+	if (!mask)
+		mask = cpu_possible_mask;
+	return mask;
 }
 EXPORT_SYMBOL_GPL(housekeeping_cpumask);
 
@@ -80,12 +110,45 @@ EXPORT_SYMBOL_GPL(housekeeping_affine);
 
 bool housekeeping_test_cpu(int cpu, enum hk_type type)
 {
-	if (housekeeping.flags & BIT(type))
+	if (READ_ONCE(housekeeping.flags) & BIT(type))
 		return cpumask_test_cpu(cpu, housekeeping_cpumask(type));
 	return true;
 }
 EXPORT_SYMBOL_GPL(housekeeping_test_cpu);
 
+int housekeeping_update(struct cpumask *mask, enum hk_type type)
+{
+	struct cpumask *trial, *old = NULL;
+
+	if (type != HK_TYPE_DOMAIN)
+		return -ENOTSUPP;
+
+	trial = kmalloc(sizeof(*trial), GFP_KERNEL);
+	if (!trial)
+		return -ENOMEM;
+
+	cpumask_andnot(trial, housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT), mask);
+	if (!cpumask_intersects(trial, cpu_online_mask)) {
+		kfree(trial);
+		return -EINVAL;
+	}
+
+	if (!housekeeping.flags)
+		static_branch_enable(&housekeeping_overridden);
+
+	if (!(housekeeping.flags & BIT(type)))
+		old = housekeeping_cpumask_dereference(type);
+	else
+		WRITE_ONCE(housekeeping.flags, housekeeping.flags | BIT(type));
+	rcu_assign_pointer(housekeeping.cpumasks[type], trial);
+
+	synchronize_rcu();
+
+	kfree(old);
+
+	return 0;
+}
+
 void __init housekeeping_init(void)
 {
 	enum hk_type type;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 0c0ef8999fd6..8fac8aa451c6 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -30,6 +30,7 @@
 #include <linux/context_tracking.h>
 #include <linux/cpufreq.h>
 #include <linux/cpumask_api.h>
+#include <linux/cpuset.h>
 #include <linux/ctype.h>
 #include <linux/file.h>
 #include <linux/fs_api.h>
-- 
2.51.0



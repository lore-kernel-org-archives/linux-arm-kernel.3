Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5B3D7237B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9Nm9/UDIo43IcDUT0eKYVHqVsy1qWtWdi8Lz6ZU9Cw=; b=kz13MwutDlBQ8osyK98WIFp0Qk
	29peWiJSfCgIcda+SpwxoNsKXqEnQzoDUF+yuXx+q8Z8QyiYoGwd/lKVQrA9qrGCq5XDpD6VhLuO4
	vOjsH/onOUfOF/wRhmt0EqV1xsrOE49d5+UW5Li1beeLV6wkYR1bIGrAlSOKxfN+iwtOE2Kgg21jb
	1+8SpG+t5dOmwFqptxjX2AY1HUYb4R7wfORjveFPcCbmfHH5Faf91YuohK6PUJSxOjgMys6IQ36Us
	XRKlF024n1tXWAzUGoWdV3pp8SW3ScbyFne8sLWyT0Fv9G1lt9gr30mrKAVYryZi6UHqwp2/vuuN7
	wG8m0NRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8vf-0000000Bdgo-19Gs;
	Sun, 25 Jan 2026 22:49:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8vd-0000000BdfZ-3aRi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 22:49:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A657600C3;
	Sun, 25 Jan 2026 22:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128EFC4CEF1;
	Sun, 25 Jan 2026 22:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769381397;
	bh=h4+1N6+onxTB3qHJHE3W5TiIbyuzvrEMpQNEnSESUL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kvQ5LnyzA+O6y4LUBWv/7wEJYWp46+ofYDM2EyONjVw1AIkqi6EB56+Oel9II/NLK
	 HHdKlb4PyDtYcmib4xuM5xdF8Af8P0DlSMiEcAtKW0KelHaT8vmw0qLVWbA9m+qoC7
	 tG+aNiq5gxL88NVCMk2hmDNjRsFYl9HKjZpsEdD9TsnHiXRrNFZD8zxXUssjMNHmqj
	 7i0PUx4Oyef4qEgji6Ns+v0gCbdZvVdcOaAqMJiNUHJpSKToUf0pDY3aXKvlxVkClJ
	 9/HGLvRC+cBbT8Fbyi27zOmB3eoGNswFV7aOlH4M+1RfBOxBANuYTERwWSSzl1GjLP
	 jt/8h7dy5BLBw==
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
Subject: [PATCH 30/33] kthread: Honour kthreads preferred affinity after cpuset changes
Date: Sun, 25 Jan 2026 23:45:37 +0100
Message-ID: <20260125224541.50226-31-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260125224541.50226-1-frederic@kernel.org>
References: <20260125224541.50226-1-frederic@kernel.org>
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

When cpuset isolated partitions get updated, unbound kthreads get
indifferently affine to all non isolated CPUs, regardless of their
individual affinity preferences.

For example kswapd is a per-node kthread that prefers to be affine to
the node it refers to. Whenever an isolated partition is created,
updated or deleted, kswapd's node affinity is going to be broken if any
CPU in the related node is not isolated because kswapd will be affine
globally.

Fix this with letting the consolidated kthread managed affinity code do
the affinity update on behalf of cpuset.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Reviewed-by: Waiman Long <longman@redhat.com>
---
 include/linux/kthread.h  |  1 +
 kernel/cgroup/cpuset.c   |  5 ++---
 kernel/kthread.c         | 41 ++++++++++++++++++++++++++++++----------
 kernel/sched/isolation.c |  3 +++
 4 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/include/linux/kthread.h b/include/linux/kthread.h
index 8d27403888ce..c92c1149ee6e 100644
--- a/include/linux/kthread.h
+++ b/include/linux/kthread.h
@@ -100,6 +100,7 @@ void kthread_unpark(struct task_struct *k);
 void kthread_parkme(void);
 void kthread_exit(long result) __noreturn;
 void kthread_complete_and_exit(struct completion *, long) __noreturn;
+int kthreads_update_housekeeping(void);
 
 int kthreadd(void *unused);
 extern struct task_struct *kthreadd_task;
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 801694de82a3..9a8292b7c7f1 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1208,11 +1208,10 @@ void cpuset_update_tasks_cpumask(struct cpuset *cs, struct cpumask *new_cpus)
 
 		if (top_cs) {
 			/*
+			 * PF_KTHREAD tasks are handled by housekeeping.
 			 * PF_NO_SETAFFINITY tasks are ignored.
-			 * All per cpu kthreads should have PF_NO_SETAFFINITY
-			 * flag set, see kthread_set_per_cpu().
 			 */
-			if (task->flags & PF_NO_SETAFFINITY)
+			if (task->flags & (PF_KTHREAD | PF_NO_SETAFFINITY))
 				continue;
 			cpumask_andnot(new_cpus, possible_mask, subpartitions_cpus);
 		} else {
diff --git a/kernel/kthread.c b/kernel/kthread.c
index 968fa5868d21..03008154249c 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -891,14 +891,7 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
 }
 EXPORT_SYMBOL_GPL(kthread_affine_preferred);
 
-/*
- * Re-affine kthreads according to their preferences
- * and the newly online CPU. The CPU down part is handled
- * by select_fallback_rq() which default re-affines to
- * housekeepers from other nodes in case the preferred
- * affinity doesn't apply anymore.
- */
-static int kthreads_online_cpu(unsigned int cpu)
+static int kthreads_update_affinity(bool force)
 {
 	cpumask_var_t affinity;
 	struct kthread *k;
@@ -924,7 +917,8 @@ static int kthreads_online_cpu(unsigned int cpu)
 		/*
 		 * Unbound kthreads without preferred affinity are already affine
 		 * to housekeeping, whether those CPUs are online or not. So no need
-		 * to handle newly online CPUs for them.
+		 * to handle newly online CPUs for them. However housekeeping changes
+		 * have to be applied.
 		 *
 		 * But kthreads with a preferred affinity or node are different:
 		 * if none of their preferred CPUs are online and part of
@@ -932,7 +926,7 @@ static int kthreads_online_cpu(unsigned int cpu)
 		 * But as soon as one of their preferred CPU becomes online, they must
 		 * be affine to them.
 		 */
-		if (k->preferred_affinity || k->node != NUMA_NO_NODE) {
+		if (force || k->preferred_affinity || k->node != NUMA_NO_NODE) {
 			kthread_fetch_affinity(k, affinity);
 			set_cpus_allowed_ptr(k->task, affinity);
 		}
@@ -943,6 +937,33 @@ static int kthreads_online_cpu(unsigned int cpu)
 	return ret;
 }
 
+/**
+ * kthreads_update_housekeeping - Update kthreads affinity on cpuset change
+ *
+ * When cpuset changes a partition type to/from "isolated" or updates related
+ * cpumasks, propagate the housekeeping cpumask change to preferred kthreads
+ * affinity.
+ *
+ * Returns 0 if successful, -ENOMEM if temporary mask couldn't
+ * be allocated or -EINVAL in case of internal error.
+ */
+int kthreads_update_housekeeping(void)
+{
+	return kthreads_update_affinity(true);
+}
+
+/*
+ * Re-affine kthreads according to their preferences
+ * and the newly online CPU. The CPU down part is handled
+ * by select_fallback_rq() which default re-affines to
+ * housekeepers from other nodes in case the preferred
+ * affinity doesn't apply anymore.
+ */
+static int kthreads_online_cpu(unsigned int cpu)
+{
+	return kthreads_update_affinity(false);
+}
+
 static int kthreads_init(void)
 {
 	return cpuhp_setup_state(CPUHP_AP_KTHREADS_ONLINE, "kthreads:online",
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index a30d19b641f7..3b725d39c06e 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -156,6 +156,9 @@ int housekeeping_update(struct cpumask *isol_mask)
 	err = tmigr_isolated_exclude_cpumask(isol_mask);
 	WARN_ON_ONCE(err < 0);
 
+	err = kthreads_update_housekeeping();
+	WARN_ON_ONCE(err < 0);
+
 	kfree(old);
 
 	return 0;
-- 
2.51.1



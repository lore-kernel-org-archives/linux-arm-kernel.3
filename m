Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0815CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VelxAYQGPxzFRKppVbzVPDcRe9JLicWTRb3EEwT2w4=; b=byxBLm3Pku6x0AbZNPn7XXuzmj
	+vONoTcPfeDimGoKDPQh7d5q9hqB6ghGyMvzXJliNmBhz+6OQPRcsxWlszAIVimovO7y0QXA436eA
	Is8weeG9tvN6ckNd2fQZkXNchrldEm5XZ6DlbYXRxqu4gq4M8R+92KAjlDzPXBu6Clz3D7RyRUnMD
	Z77fMSXmhTkYwe/AEz6VuHAwJcIZnKic+hmshVGYS7aeXLeIO4eOaKj7+PcbGeKMBr51jzJtiFtbz
	l8j1uv7oVqx892r9jhnjyi2Wrz31tMbVf+sL4PrzGbUW82gxPGGUhNS7P7izgtI8/80XQj7i0om6u
	xFLkw1PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PEu-0000000EOBI-2Z2s;
	Mon, 13 Oct 2025 20:33:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PEr-0000000EO9C-3SM2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:33:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F77948BCA;
	Mon, 13 Oct 2025 20:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11E6C116C6;
	Mon, 13 Oct 2025 20:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760387629;
	bh=9oNpqgYjTcFMTbPZgxvfSlFc0ojQ77K/A/hD7MumAUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lcJiOQaxzRbm/vnW/7YplQp1SHR/EYlMBi81fjw8+ud9d0xJzG/M5ydBd35kgDQby
	 MGqZa1++jHkG6de3/IShSXu/VPNz255mdDROulIq+v6Msd8lxXjl5Zb0UU1z8IA47e
	 u6UfgSZdJL9zfVNfvzwCazayfzsHaagNZ8IfWgHaJNYwwnscuTLrgjDyCNihTr+akx
	 w+H3pKN0hhDNQa+5kpthY11CkItIJJx8FHnkJgmoyYikqWxZnes+oPl9WfT239ZviD
	 2FAqBS3l3+R+gy+jLzqrv5oDUAFlF0mcRVnV6DrqPx+70lF5/NxORiMhMXicUM8yH1
	 LMYrBX6aQoFiw==
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
Subject: [PATCH 14/33] sched/isolation: Flush memcg workqueues on cpuset isolated partition change
Date: Mon, 13 Oct 2025 22:31:27 +0200
Message-ID: <20251013203146.10162-15-frederic@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013203146.10162-1-frederic@kernel.org>
References: <20251013203146.10162-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_133349_906535_A4BB495B 
X-CRM114-Status: GOOD (  16.27  )
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

The HK_TYPE_DOMAIN housekeeping cpumask is now modifyable at runtime. In
order to synchronize against memcg workqueue to make sure that no
asynchronous draining is still pending or executing on a newly made
isolated CPU, the housekeeping susbsystem must flush the memcg
workqueues.

However the memcg workqueues can't be flushed easily since they are
queued to the main per-CPU workqueue pool.

Solve this with creating a memcg specific pool and provide and use the
appropriate flushing API.

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/memcontrol.h |  4 ++++
 kernel/sched/isolation.c   |  2 ++
 kernel/sched/sched.h       |  1 +
 mm/memcontrol.c            | 12 +++++++++++-
 4 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 873e510d6f8d..001200df63cf 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -1074,6 +1074,8 @@ static inline u64 cgroup_id_from_mm(struct mm_struct *mm)
 	return id;
 }
 
+void mem_cgroup_flush_workqueue(void);
+
 extern int mem_cgroup_init(void);
 #else /* CONFIG_MEMCG */
 
@@ -1481,6 +1483,8 @@ static inline u64 cgroup_id_from_mm(struct mm_struct *mm)
 	return 0;
 }
 
+static inline void mem_cgroup_flush_workqueue(void) { }
+
 static inline int mem_cgroup_init(void) { return 0; }
 #endif /* CONFIG_MEMCG */
 
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 95d69c2102f6..9ec365dea921 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -144,6 +144,8 @@ int housekeeping_update(struct cpumask *mask, enum hk_type type)
 
 	synchronize_rcu();
 
+	mem_cgroup_flush_workqueue();
+
 	kfree(old);
 
 	return 0;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 8fac8aa451c6..8bfc0b4b133f 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -44,6 +44,7 @@
 #include <linux/lockdep_api.h>
 #include <linux/lockdep.h>
 #include <linux/memblock.h>
+#include <linux/memcontrol.h>
 #include <linux/minmax.h>
 #include <linux/mm.h>
 #include <linux/module.h>
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 1033e52ab6cf..1aa14e543f35 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -95,6 +95,8 @@ static bool cgroup_memory_nokmem __ro_after_init;
 /* BPF memory accounting disabled? */
 static bool cgroup_memory_nobpf __ro_after_init;
 
+static struct workqueue_struct *memcg_wq __ro_after_init;
+
 static struct kmem_cache *memcg_cachep;
 static struct kmem_cache *memcg_pn_cachep;
 
@@ -1975,7 +1977,7 @@ static void schedule_drain_work(int cpu, struct work_struct *work)
 {
 	guard(rcu)();
 	if (!cpu_is_isolated(cpu))
-		schedule_work_on(cpu, work);
+		queue_work_on(cpu, memcg_wq, work);
 }
 
 /*
@@ -5092,6 +5094,11 @@ void mem_cgroup_sk_uncharge(const struct sock *sk, unsigned int nr_pages)
 	refill_stock(memcg, nr_pages);
 }
 
+void mem_cgroup_flush_workqueue(void)
+{
+	flush_workqueue(memcg_wq);
+}
+
 static int __init cgroup_memory(char *s)
 {
 	char *token;
@@ -5134,6 +5141,9 @@ int __init mem_cgroup_init(void)
 	cpuhp_setup_state_nocalls(CPUHP_MM_MEMCQ_DEAD, "mm/memctrl:dead", NULL,
 				  memcg_hotplug_cpu_dead);
 
+	memcg_wq = alloc_workqueue("memcg", 0, 0);
+	WARN_ON(!memcg_wq);
+
 	for_each_possible_cpu(cpu) {
 		INIT_WORK(&per_cpu_ptr(&memcg_stock, cpu)->work,
 			  drain_local_memcg_stock);
-- 
2.51.0



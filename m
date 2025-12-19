Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04FED7879F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 18:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvZafF20dX0DXiolEUhtEEc+/8Hjr9aj5cypQn23Xm0=; b=jpyhoqeTbLY7qnEFyaHaWLBnBX
	+mSOfD60O6/nYKm8wwMELymBJkuh7KC3X6BkFI5IXWKeE8FH3/jEsG2sPxqHtiQL4plN+0J2GPFa9
	swLScFOLJ35uahbJMbYZxad3tKnLHn6cQq4Wt8Zg/dx5bBd2oSlX7WLdCCM7/LC3mApscvJzSSFzY
	m585fbds4aMH6WIw72pzbSJ2k1wulgBFcvNzrss3n1CcCnmPVkcgCEH3ti1J5Y0iEPKFcfgvIL4PP
	QUXZe90VP1V1ClDjuETvc0eGmzy+l4UyvGGCZao+QaAtYz8N6kEaTJB0VJQyFNxOLMu4Qz7XAZFzh
	h0tAuygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWezj-0000000Amzx-32pk;
	Fri, 19 Dec 2025 18:14:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWezZ-0000000Amnr-2Hm0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 18:14:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8837A15A1;
	Fri, 19 Dec 2025 10:14:09 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 389023F5CA;
	Fri, 19 Dec 2025 10:14:12 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev
Subject: [PATCH v2 28/45] arm_mpam: resctrl: Pick classes for use as mbm counters
Date: Fri, 19 Dec 2025 18:11:30 +0000
Message-ID: <20251219181147.3404071-29-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219181147.3404071-1-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_101417_710765_938DABFB 
X-CRM114-Status: GOOD (  25.29  )
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

From: James Morse <james.morse@arm.com>

resctrl has two types of counters, NUMA-local and global. MPAM has only
bandwidth counters, but the position of the MSC may mean it counts
NUMA-local, or global traffic.

But the topology information is not available.

Apply a heuristic: the L2 or L3 supports bandwidth monitors, these are
probably NUMA-local. If the memory controller supports bandwidth monitors,
they are probably global.

This also allows us to assert that we don't have the same class backing two
different resctrl events.

Because the class or component backing the event may not be 'the L3', it is
necessary for mpam_resctrl_get_domain_from_cpu() to search the monitor
domains too. This matters the most for 'monitor only' systems, where 'the
L3' control domains may be empty, and the ctrl_comp pointer NULL.

resctrl expects there to be enough monitors for every possible control and
monitor group to have one. Such a system gets called 'free running' as the
monitors can be programmed once and left running.  Any other platform will
need to emulate ABMC.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since rfc:
drop has_mbwu
---
 drivers/resctrl/mpam_internal.h |   8 ++
 drivers/resctrl/mpam_resctrl.c  | 136 +++++++++++++++++++++++++++++++-
 2 files changed, 142 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 9cb9eb97893b..6a2231b28cad 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -336,6 +336,14 @@ struct mpam_msc_ris {
 
 struct mpam_resctrl_dom {
 	struct mpam_component	*ctrl_comp;
+
+	/*
+	 * There is no single mon_comp because different events may be backed
+	 * by different class/components. mon_comp is indexed by the event
+	 * number.
+	 */
+	struct mpam_component   *mon_comp[QOS_NUM_EVENTS];
+
 	struct rdt_ctrl_domain	resctrl_ctrl_dom;
 	struct rdt_mon_domain	resctrl_mon_dom;
 };
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5fde610cc9d7..51caf3b82392 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -50,6 +50,14 @@ static bool exposed_mon_capable;
  */
 static bool cdp_enabled;
 
+/* Whether this num_mbw_mon could result in a free_running system */
+static int __mpam_monitors_free_running(u16 num_mbwu_mon)
+{
+	if (num_mbwu_mon >= resctrl_arch_system_num_rmid_idx())
+		return resctrl_arch_system_num_rmid_idx();
+	return 0;
+}
+
 bool resctrl_arch_alloc_capable(void)
 {
 	return exposed_alloc_capable;
@@ -290,6 +298,26 @@ static bool cache_has_usable_csu(struct mpam_class *class)
 	return true;
 }
 
+static bool class_has_usable_mbwu(struct mpam_class *class)
+{
+	struct mpam_props *cprops = &class->props;
+
+	if (!mpam_has_feature(mpam_feat_msmon_mbwu, cprops))
+		return false;
+
+	/*
+	 * resctrl expects the bandwidth counters to be free running,
+	 * which means we need as many monitors as resctrl has
+	 * control/monitor groups.
+	 */
+	if (__mpam_monitors_free_running(cprops->num_mbwu_mon)) {
+		pr_debug("monitors usable in free-running mode\n");
+		return true;
+	}
+
+	return false;
+}
+
 /*
  * Calculate the worst-case percentage change from each implemented step
  * in the control.
@@ -585,7 +613,36 @@ static void mpam_resctrl_pick_counters(void)
 				return;
 			}
 		}
+
+		if (class_has_usable_mbwu(class) && topology_matches_l3(class)) {
+			pr_debug("class %u has usable MBWU, and matches L3 topology",
+				 class->level);
+
+			/*
+			 * MBWU counters may be 'local' or 'total' depending on
+			 * where they are in the topology. Counters on caches
+			 * are assumed to be local. If it's on the memory
+			 * controller, its assumed to be global.
+			 */
+			switch (class->type) {
+			case MPAM_CLASS_CACHE:
+				counter_update_class(QOS_L3_MBM_LOCAL_EVENT_ID,
+						     class);
+				break;
+			case MPAM_CLASS_MEMORY:
+				counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID,
+						     class);
+				break;
+			default:
+				break;
+			}
+		}
 	}
+
+	/* Allocation of MBWU monitors assumes that the class is unique... */
+	if (mpam_resctrl_counters[QOS_L3_MBM_LOCAL_EVENT_ID].class)
+		WARN_ON_ONCE(mpam_resctrl_counters[QOS_L3_MBM_LOCAL_EVENT_ID].class ==
+			     mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID].class);
 }
 
 static int mpam_resctrl_control_init(struct mpam_resctrl_res *res,
@@ -925,6 +982,20 @@ static void mpam_resctrl_domain_insert(struct list_head *list,
 	list_add_tail_rcu(&new->list, pos);
 }
 
+static struct mpam_component *find_component(struct mpam_class *victim, int cpu)
+{
+	struct mpam_component *victim_comp;
+
+	guard(srcu)(&mpam_srcu);
+	list_for_each_entry_srcu(victim_comp, &victim->components, class_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		if (cpumask_test_cpu(cpu, &victim_comp->affinity))
+			return victim_comp;
+	}
+
+	return NULL;
+}
+
 static struct mpam_resctrl_dom *
 mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 {
@@ -973,8 +1044,32 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 	}
 
 	if (exposed_mon_capable) {
+		int i;
+		struct mpam_component *mon_comp, *any_mon_comp;
+
+		/*
+		 * Even if the monitor domain is backed by a different
+		 * component, the L3 component IDs need to be used... only
+		 * there may be no ctrl_comp for the L3.
+		 * Search each event's class list for a component with
+		 * overlapping CPUs and set up the dom->mon_comp array.
+		 */
+		for (i = 0; i < QOS_NUM_EVENTS; i++) {
+			struct mpam_resctrl_mon *mon;
+
+			mon = &mpam_resctrl_counters[i];
+			if (!mon->class)
+				continue;       // dummy resource
+
+			mon_comp = find_component(mon->class, cpu);
+			dom->mon_comp[i] = mon_comp;
+			if (mon_comp)
+				any_mon_comp = mon_comp;
+		}
+		WARN_ON_ONCE(!any_mon_comp);
+
 		mon_d = &dom->resctrl_mon_dom;
-		mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, &mon_d->hdr);
+		mpam_resctrl_domain_hdr_init(cpu, any_mon_comp, &mon_d->hdr);
 		mon_d->hdr.type = RESCTRL_MON_DOMAIN;
 		mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);
 		err = resctrl_online_mon_domain(r, mon_d);
@@ -996,6 +1091,39 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 	return dom;
 }
 
+/*
+ * We know all the monitors are associated with the L3, even if there are no
+ * controls and therefore no control component. Find the cache-id for the CPU
+ * and use that to search for existing resctrl domains.
+ * This relies on mpam_resctrl_pick_domain_id() using the L3 cache-id
+ * for anything that is not a cache.
+ */
+static struct mpam_resctrl_dom *mpam_resctrl_get_mon_domain_from_cpu(int cpu)
+{
+	u32 cache_id;
+	struct rdt_mon_domain *mon_d;
+	struct mpam_resctrl_dom *dom;
+	struct mpam_resctrl_res *l3 = &mpam_resctrl_controls[RDT_RESOURCE_L3];
+
+	lockdep_assert_cpus_held();
+
+	if (!l3->class)
+		return NULL;
+	/* TODO: how does this order with cacheinfo updates under cpuhp? */
+	cache_id = get_cpu_cacheinfo_id(cpu, 3);
+	if (cache_id == ~0)
+		return NULL;
+
+	list_for_each_entry_rcu(mon_d, &l3->resctrl_res.mon_domains, hdr.list) {
+		dom = container_of(mon_d, struct mpam_resctrl_dom, resctrl_mon_dom);
+
+		if (mon_d->hdr.id == cache_id)
+			return dom;
+	}
+
+	return NULL;
+}
+
 static struct mpam_resctrl_dom *
 mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
 {
@@ -1013,7 +1141,11 @@ mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
 			return dom;
 	}
 
-	return NULL;
+	if (r->rid != RDT_RESOURCE_L3)
+		return NULL;
+
+	/* Search the mon domain list too - needed on monitor only platforms. */
+	return mpam_resctrl_get_mon_domain_from_cpu(cpu);
 }
 
 int mpam_resctrl_online_cpu(unsigned int cpu)
-- 
2.43.0



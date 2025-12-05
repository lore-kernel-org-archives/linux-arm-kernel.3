Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997F3D374AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZfQ+aGj3m61SNyKTCeWun6Ft0jtTZ0KAeozAnaN7oA=; b=BWJR2EYUPkIYhGLUziAk+5xiCH
	Y8pEVux2I2+ikaSu2Gx2ejoJU4JktjrWmY5ZE9JL22m73S2JfaALj+Jc9U/u0xb9RfrslfIM/0bWA
	UDPVGjIay63uRmY7GqsrSXX2J6jmzgpKKO88UbjjP8YDU3HbY/lCAtYXEj47vxl91/OXDbYI0gDzK
	2SkqFRJELq6QBCyYIlSTAsBAGg4S6+b9eBRBgDUk+xuIC7ldsF0xp+ai9URaM0qQPoWvH521FApLf
	232MblifhLq0/QnQaXgxvthE+PSumbr5mMUsSQFJr903AWEM9Fxu9sgawz2rS/SSFkhio7m/Btcb7
	1/S1eifw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdr3-0000000A5sv-1SJ3;
	Fri, 05 Dec 2025 22:00:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdr0-0000000A5oQ-1QCO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 22:00:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72D181AED;
	Fri,  5 Dec 2025 14:00:34 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 102523F740;
	Fri,  5 Dec 2025 14:00:37 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: James Morse <james.morse@arm.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@kernel.org>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Ben Horgan <ben.horgan@arm.com>,
	rohit.mathew@arm.com,
	reinette.chatre@intel.com,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: [RFC PATCH 18/38] arm_mpam: resctrl: Add support for csu counters
Date: Fri,  5 Dec 2025 21:58:41 +0000
Message-Id: <20251205215901.17772-19-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_140042_453218_5593131F 
X-CRM114-Status: GOOD (  27.11  )
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

resctrl exposes a counter via a file named llc_occupancy. This isn't really
a counter as its value goes up and down, this is a snapshot of the cache
storage usage monitor.

Add some picking code to find a cache as close as possible to the L3 that
supports the CSU monitor.

If there is an L3, but it doesn't have any controls, force the L3 resource
to exist. The existing topology_matches_l3() and
mpam_resctrl_domain_hdr_init() code will ensure this looks like the L3,
even if the class belongs to a later cache.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_internal.h |   6 ++
 drivers/resctrl/mpam_resctrl.c  | 148 ++++++++++++++++++++++++++++++++
 2 files changed, 154 insertions(+)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 8684bd35d4ab..f9d2a1004c32 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -348,6 +348,12 @@ struct mpam_resctrl_res {
 	struct rdt_resource	resctrl_res;
 };
 
+struct mpam_resctrl_mon {
+	struct mpam_class	*class;
+
+	/* per-class data that resctrl needs will live here */
+};
+
 static inline int mpam_alloc_csu_mon(struct mpam_class *class)
 {
 	struct mpam_props *cprops = &class->props;
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index fe830524639e..fc1f054f187e 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -31,6 +31,16 @@ static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
 /* The lock for modifying resctrl's domain lists from cpuhp callbacks. */
 static DEFINE_MUTEX(domain_list_lock);
 
+/*
+ * The classes we've picked to map to resctrl events.
+ * Resctrl believes all the worlds a Xeon, and these are all on the L3. This
+ * array lets us find the actual class backing the event counters. e.g.
+ * the only memory bandwidth counters may be on the memory controller, but to
+ * make use of them, we pretend they are on L3.
+ * Class pointer may be NULL.
+ */
+static struct mpam_resctrl_mon mpam_resctrl_counters[QOS_NUM_EVENTS];
+
 static bool exposed_alloc_capable;
 static bool exposed_mon_capable;
 
@@ -258,6 +268,28 @@ static bool class_has_usable_mba(struct mpam_props *cprops)
 	return mba_class_use_mbw_max(cprops);
 }
 
+static bool cache_has_usable_csu(struct mpam_class *class)
+{
+	struct mpam_props *cprops;
+
+	if (!class)
+		return false;
+
+	cprops = &class->props;
+
+	if (!mpam_has_feature(mpam_feat_msmon_csu, cprops))
+		return false;
+
+	/*
+	 * CSU counters settle on the value, so we can get away with
+	 * having only one.
+	 */
+	if (!cprops->num_csu_mon)
+		return false;
+
+	return (mpam_partid_max > 1) || (mpam_pmg_max != 0);
+}
+
 /*
  * Calculate the worst-case percentage change from each implemented step
  * in the control.
@@ -499,6 +531,64 @@ static void mpam_resctrl_pick_mba(void)
 	}
 }
 
+static void counter_update_class(enum resctrl_event_id evt_id,
+				 struct mpam_class *class)
+{
+	struct mpam_class *existing_class = mpam_resctrl_counters[evt_id].class;
+
+	if (existing_class) {
+		if (class->level == 3) {
+			pr_debug("Existing class is L3 - L3 wins\n");
+			return;
+		} else if (existing_class->level < class->level) {
+			pr_debug("Existing class is closer to L3, %u versus %u - closer is better\n",
+				 existing_class->level, class->level);
+			return;
+		}
+	}
+
+	mpam_resctrl_counters[evt_id].class = class;
+	exposed_mon_capable = true;
+}
+
+static void mpam_resctrl_pick_counters(void)
+{
+	struct mpam_class *class;
+	bool has_csu;
+
+	lockdep_assert_cpus_held();
+
+	guard(srcu)(&mpam_srcu);
+	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		if (class->level < 3) {
+			pr_debug("class %u is before L3", class->level);
+			continue;
+		}
+
+		if (!cpumask_equal(&class->affinity, cpu_possible_mask)) {
+			pr_debug("class %u does not cover all CPUs",
+				 class->level);
+			continue;
+		}
+
+		has_csu = cache_has_usable_csu(class);
+		if (has_csu && topology_matches_l3(class)) {
+			pr_debug("class %u has usable CSU, and matches L3 topology",
+				 class->level);
+
+			/* CSU counters only make sense on a cache. */
+			switch (class->type) {
+			case MPAM_CLASS_CACHE:
+				counter_update_class(QOS_L3_OCCUP_EVENT_ID, class);
+				return;
+			default:
+				return;
+			}
+		}
+	}
+}
+
 static int mpam_resctrl_control_init(struct mpam_resctrl_res *res,
 				     enum resctrl_res_level type)
 {
@@ -578,6 +668,50 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
 	return comp->comp_id;
 }
 
+static void mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
+				      enum resctrl_event_id type)
+{
+	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
+	struct rdt_resource *l3 = &res->resctrl_res;
+
+	lockdep_assert_cpus_held();
+
+	/* There also needs to be an L3 cache present */
+	if (get_cpu_cacheinfo_id(smp_processor_id(), 3) == -1)
+		return;
+
+	/*
+	 * If there are no MPAM resources on L3, force it into existence.
+	 * topology_matches_l3() already ensures this looks like the L3.
+	 * The domain-ids will be fixed up by mpam_resctrl_domain_hdr_init().
+	 */
+	if (!res->class) {
+		pr_warn_once("Faking L3 MSC to enable counters.\n");
+		res->class = mpam_resctrl_counters[type].class;
+	}
+
+	/* Called multiple times!, once per event type */
+	if (exposed_mon_capable) {
+		l3->mon_capable = true;
+
+		/* Setting name is necessary on monitor only platforms */
+		l3->name = "L3";
+		l3->mon_scope = RESCTRL_L3_CACHE;
+
+		resctrl_enable_mon_event(type);
+
+		/*
+		 * Unfortunately, num_rmid doesn't mean anything for
+		 * mpam, and its exposed to user-space!
+		 * num-rmid is supposed to mean the number of groups
+		 * that can be created, both control or monitor groups.
+		 * For mpam, each control group has its own pmg/rmid
+		 * space.
+		 */
+		l3->mon.num_rmid = 1;
+	}
+}
+
 u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 			    u32 closid, enum resctrl_conf_type type)
 {
@@ -939,8 +1073,10 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
 int mpam_resctrl_setup(void)
 {
 	int err = 0;
+	enum resctrl_event_id j;
 	enum resctrl_res_level i;
 	struct mpam_resctrl_res *res;
+	struct mpam_resctrl_mon *mon;
 
 	cpus_read_lock();
 	for (i = 0; i < RDT_NUM_RESOURCES; i++) {
@@ -966,6 +1102,18 @@ int mpam_resctrl_setup(void)
 			break;
 		}
 	}
+
+	/* Find some classes to use for monitors */
+	mpam_resctrl_pick_counters();
+
+	for (j = 0; j < QOS_NUM_EVENTS; j++) {
+		mon = &mpam_resctrl_counters[j];
+		if (!mon->class)
+			continue;	// dummy resource
+
+		mpam_resctrl_monitor_init(mon, j);
+	}
+
 	cpus_read_unlock();
 
 	if (err || (!exposed_alloc_capable && !exposed_mon_capable)) {
-- 
2.39.5



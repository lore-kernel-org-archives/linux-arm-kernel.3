Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4010D374AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/IEOAy9vThaP4CoZtzsXa/sF1M+emL4GG/xfOIOoU5Q=; b=DfjU5PEOtRR5v1c4f+SoWpv96U
	rA+1lqITjpXH3U+b0xDu3UIeZvDNCtCQVbbEJebn8hxlTP5hPC6l93oo/9v8pW73NNbkz6k/hddLA
	VHZW4wJVGEjzoul9ynHushCdyyI43J1sL0rVmg1b6yA6e5PDNua81JBiwKKmIK4J6kHMKfmKI/wRD
	ZmWqMl2UIpYkOYNRfXsWl7nKF30iQBFQY3AfUOrD6vpwWvkcFGuT0lJrZnSLa2X01f+ggs2crG8+n
	MML0Gld3wPsWZJTBgtnuVVXzDQUXRemviaiPjdxW6GnBZQJDa/ItuatC8as7VmDw9z5l0zexf/xvn
	ZhvI1AZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdrE-0000000A68N-46Fd;
	Fri, 05 Dec 2025 22:00:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdrC-0000000A604-2m4n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 22:00:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C9D41BA8;
	Fri,  5 Dec 2025 14:00:46 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B1383F740;
	Fri,  5 Dec 2025 14:00:50 -0800 (PST)
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
Subject: [RFC PATCH 21/38] arm_mpam: resctrl: Pre-allocate assignable monitors
Date: Fri,  5 Dec 2025 21:58:44 +0000
Message-Id: <20251205215901.17772-22-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_140054_976442_25E5CEE3 
X-CRM114-Status: GOOD (  18.43  )
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

When there are not enough monitors, MPAM is able to emulate ABMC by making
a smaller number of monitors assignable. These monitors still need to be
allocated from the driver, and mapped to whichever control/monitor group
resctrl wants to use them with.

Add a second array to hold the monitor values indexed by resctrl's
cntr_id.

When CDP is in use, two monitors are needed so the available number of
counters halves. Platforms with one monitor will have zero monitors
when CDP is in use.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_internal.h |   7 +++
 drivers/resctrl/mpam_resctrl.c  | 102 ++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index b7c914febeb4..05101186af17 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -366,6 +366,13 @@ struct mpam_resctrl_mon {
 	 * un-assigned (closid, rmid) are -1.
 	 */
 	int			*mbwu_idx_to_mon;
+
+	/*
+	 * Array of assigned MBWU monitors, indexed by idx argument.
+	 * When ABMC is not in use, this array can be NULL. Otherwise
+	 * it maps idx to the allocated monitor.
+	 */
+	int			*assigned_counters;
 };
 
 static inline int mpam_alloc_csu_mon(struct mpam_class *class)
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index de5220fed97d..f607feaf0126 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -50,6 +50,12 @@ static bool exposed_mon_capable;
  */
 static bool cdp_enabled;
 
+/*
+ * L3 local/total may come from different classes - what is the number of MBWU
+ * 'on L3'?
+ */
+static unsigned int l3_num_allocated_mbwu = ~0;
+
 /* Whether this num_mbw_mon could result in a free_running system */
 static int __mpam_monitors_free_running(u16 num_mbwu_mon)
 {
@@ -58,6 +64,15 @@ static int __mpam_monitors_free_running(u16 num_mbwu_mon)
 	return 0;
 }
 
+/*
+ * If l3_num_allocated_mbwu is forced below PARTID * PMG, then the counters
+ * are not free running, and ABMC's user-interface must be used to assign them.
+ */
+static bool mpam_resctrl_abmc_enabled(void)
+{
+	return l3_num_allocated_mbwu < resctrl_arch_system_num_rmid_idx();
+}
+
 bool resctrl_arch_alloc_capable(void)
 {
 	return exposed_alloc_capable;
@@ -102,8 +117,25 @@ static void resctrl_reset_task_closids(void)
 	read_unlock(&tasklist_lock);
 }
 
+static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
+{
+	l3->mon.num_mbm_cntrs = l3_num_allocated_mbwu;
+	if (cdp_enabled)
+		l3->mon.num_mbm_cntrs /= 2;
+
+	if (l3->mon.num_mbm_cntrs) {
+		l3->mon.mbm_cntr_assignable = mpam_resctrl_abmc_enabled();
+		l3->mon.mbm_assign_on_mkdir = mpam_resctrl_abmc_enabled();
+	} else {
+		l3->mon.mbm_cntr_assignable = false;
+		l3->mon.mbm_assign_on_mkdir = false;
+	}
+}
+
 int resctrl_arch_set_cdp_enabled(enum resctrl_res_level ignored, bool enable)
 {
+	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
+	struct rdt_resource *l3 = &res->resctrl_res;
 	u32 partid_i, partid_d;
 
 	cdp_enabled = enable;
@@ -120,6 +152,7 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level ignored, bool enable)
 	WRITE_ONCE(arm64_mpam_global_default, mpam_get_regval(current));
 
 	resctrl_reset_task_closids();
+	mpam_resctrl_monitor_sync_abmc_vals(l3);
 
 	return 0;
 }
@@ -315,6 +348,11 @@ static bool class_has_usable_mbwu(struct mpam_class *class)
 		return true;
 	}
 
+	if (cprops->num_mbwu_mon) {
+		pr_debug("monitors usable via ABMC assignment\n");
+		return true;
+	}
+
 	return false;
 }
 
@@ -584,6 +622,8 @@ static int __alloc_mbwu_mon(struct mpam_class *class, int *array,
 		array[i] = mbwu_mon;
 	}
 
+	l3_num_allocated_mbwu = min(l3_num_allocated_mbwu, num_mbwu_mon);
+
 	return 0;
 }
 
@@ -727,6 +767,23 @@ static void mpam_resctrl_pick_counters(void)
 			     mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID].class);
 }
 
+bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
+{
+	if (r != &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res)
+		return false;
+
+	return mpam_resctrl_abmc_enabled();
+}
+
+int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
+{
+	lockdep_assert_cpus_held();
+
+	WARN_ON_ONCE(1);
+
+	return 0;
+}
+
 static int mpam_resctrl_control_init(struct mpam_resctrl_res *res,
 				     enum resctrl_res_level type)
 {
@@ -806,6 +863,41 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
 	return comp->comp_id;
 }
 
+/*
+ * This must run after all event counters have been picked so that any free
+ * running counters have already been allocated.
+ */
+static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
+{
+	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
+	size_t array_size = resctrl_arch_system_num_rmid_idx() * sizeof(int);
+	int *rmid_array __free(kfree) = kmalloc(array_size, GFP_KERNEL);
+	struct rdt_resource *l3 = &res->resctrl_res;
+	struct mpam_class *class = mon->class;
+	u16 num_mbwu_mon;
+
+	if (mon->mbwu_idx_to_mon) {
+		pr_debug("monitors free running\n");
+		return 0;
+	}
+
+	if (!rmid_array) {
+		pr_debug("Failed to allocate RMID array\n");
+		return -ENOMEM;
+	}
+	memset(rmid_array, -1, array_size);
+
+	num_mbwu_mon = class->props.num_mbwu_mon;
+	mon->assigned_counters = __alloc_mbwu_array(mon->class, num_mbwu_mon);
+	if (IS_ERR(mon->assigned_counters))
+		return PTR_ERR(mon->assigned_counters);
+	mon->mbwu_idx_to_mon = no_free_ptr(rmid_array);
+
+	mpam_resctrl_monitor_sync_abmc_vals(l3);
+
+	return 0;
+}
+
 static void mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 				      enum resctrl_event_id type)
 {
@@ -847,6 +939,16 @@ static void mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 		 * space.
 		 */
 		l3->mon.num_rmid = 1;
+
+		switch (type) {
+		case QOS_L3_MBM_LOCAL_EVENT_ID:
+		case QOS_L3_MBM_TOTAL_EVENT_ID:
+			mpam_resctrl_monitor_init_abmc(mon);
+
+			return;
+		default:
+			return;
+		}
 	}
 }
 
-- 
2.39.5



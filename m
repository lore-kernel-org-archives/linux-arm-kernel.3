Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD7B1090256
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pg678N4XNM/SnbHObFSPBUb9lNq+6y3WsuA7XmPBzEo=; b=hNUb0tkMw6xZHl52AZX0JxWWHV
	2zBKOr2ADBjqDRUXbdfnghsa1xpMPRbi2ba9/XpAnNRzRIybb3v6HtMkGIQ7subMERQkUpr8a3HB2
	IGSGCQ639NQA4a+0onxemnE/NHk5NhoxK9prLwK6PVcE6/kmTTJnDCPM/cJssg69a4aIT6IOybQ1d
	tpsO/IJ8NF5/ip/ow9xlwMwqhiANlvKedAHhvGKmK+4LS7jqm5S1ChSqsTures0006EXZk8e+JOe9
	Wtjcxy1km/6qWdAkrn32JzEZq5VJN8PV8HDdjM9Cyi2RNGZAgbioFNKsovnLzzkklUYeq+1OeeOJU
	DfE/9q/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GfF-0000000B7lN-34Pk;
	Thu, 19 Mar 2026 16:56:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Gf9-0000000B7iy-3kIP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:56:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59B4420E3;
	Thu, 19 Mar 2026 09:55:53 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 794683F7BD;
	Thu, 19 Mar 2026 09:55:56 -0700 (PDT)
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
	zengheng4@huawei.com
Subject: [RFC PATCH v2 2/5] arm_mpam: resctrl: Pre-allocate assignable monitors
Date: Thu, 19 Mar 2026 16:55:37 +0000
Message-ID: <20260319165540.381410-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319165540.381410-1-ben.horgan@arm.com>
References: <20260319165540.381410-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_095600_015046_931358D8 
X-CRM114-Status: GOOD (  22.86  )
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

MPAM is able to emulate ABMC, i.e. mbm_event mode, by making memory
bandwidth monitors assignable. Rather than supporting the 'default'
mbm_assign_mode always use 'mbm_event'mode even if there are sufficient
memory bandwidth monitors. The per monitor event configuration is only
provided by resctrl when in 'mbm_event' mode and so only allowing
'mbm_event' mode will make it easier to support per-monitor event
configuration for MPAM. For the moment, the only event supported is
mbm_total_event with no bandwidth type configuration. The 'mbm_assign_mode'
file will still show 'default' when there is no support for memory
bandwidth monitoring.

The monitors need to be allocated from the driver, and mapped to whichever
control/monitor group resctrl wants to use them with.

Add a second array to hold the monitor values indexed by resctrl's cntr_id.

When CDP is in use, two monitors are needed so the available number of
counters halves. Platforms with one monitor will have zero monitors when
CDP is in use.

Co-developed-by: James Morse <james.morse@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since rfc v1:
abmc enabled even if enough counters
Helpers from dropped free running commits
carry on with zero counters if using cdp
set config bits
use kmalloc_objs
drop tags for rework
Configure mbm_cntr_configurable, mbm_cntr_assign_fixed
---
 drivers/resctrl/mpam_internal.h |   6 +-
 drivers/resctrl/mpam_resctrl.c  | 135 +++++++++++++++++++++++++++++++-
 2 files changed, 137 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index dbb99d9b0795..02807531bd1b 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -415,7 +415,11 @@ struct mpam_resctrl_res {
 struct mpam_resctrl_mon {
 	struct mpam_class	*class;
 
-	/* per-class data that resctrl needs will live here */
+	/* Array of allocated MBWU monitors, indexed by (closid, rmid). */
+	int			*mbwu_idx_to_mon;
+
+	/* Array of assigned MBWU monitors, indexed by idx argument. */
+	int			*assigned_counters;
 };
 
 static inline int mpam_alloc_csu_mon(struct mpam_class *class)
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index c17577e52f58..74b6ca59ce4a 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -75,6 +75,8 @@ static DECLARE_WAIT_QUEUE_HEAD(wait_cacheinfo_ready);
  */
 static bool resctrl_enabled;
 
+static unsigned int l3_num_allocated_mbwu = ~0;
+
 bool resctrl_arch_alloc_capable(void)
 {
 	struct mpam_resctrl_res *res;
@@ -140,7 +142,7 @@ int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 
 bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
 {
-	return false;
+	return (r == &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res);
 }
 
 int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
@@ -185,6 +187,22 @@ static void resctrl_reset_task_closids(void)
 	read_unlock(&tasklist_lock);
 }
 
+static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
+{
+	l3->mon.num_mbm_cntrs = l3_num_allocated_mbwu;
+	if (cdp_enabled)
+		l3->mon.num_mbm_cntrs /= 2;
+
+	/*
+	 * Continue as normal even if there are zero counters to avoid giving
+	 * resctrl mixed messages.
+	 */
+	l3->mon.mbm_cntr_assignable = true;
+	l3->mon.mbm_assign_on_mkdir = true;
+	l3->mon.mbm_cntr_configurable = false;
+	l3->mon.mbm_cntr_assign_fixed = true;
+}
+
 int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 {
 	u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d = RESCTRL_RESERVED_CLOSID;
@@ -236,6 +254,7 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	WRITE_ONCE(arm64_mpam_global_default, mpam_get_regval(current));
 
 	resctrl_reset_task_closids();
+	mpam_resctrl_monitor_sync_abmc_vals(l3);
 
 	for_each_possible_cpu(cpu)
 		mpam_set_cpu_defaults(cpu, partid_d, partid_i, 0, 0);
@@ -605,6 +624,9 @@ static bool class_has_usable_mbwu(struct mpam_class *class)
 	if (!mpam_has_feature(mpam_feat_msmon_mbwu, cprops))
 		return false;
 
+	if (!cprops->num_mbwu_mon)
+		return false;
+
 	return true;
 }
 
@@ -933,6 +955,52 @@ static void mpam_resctrl_pick_mba(void)
 	}
 }
 
+static void __free_mbwu_mon(struct mpam_class *class, int *array,
+			    u16 num_mbwu_mon)
+{
+	for (int i = 0; i < num_mbwu_mon; i++) {
+		if (array[i] < 0)
+			continue;
+
+		mpam_free_mbwu_mon(class, array[i]);
+		array[i] = ~0;
+	}
+}
+
+static int __alloc_mbwu_mon(struct mpam_class *class, int *array,
+			    u16 num_mbwu_mon)
+{
+	for (int i = 0; i < num_mbwu_mon; i++) {
+		int mbwu_mon = mpam_alloc_mbwu_mon(class);
+
+		if (mbwu_mon < 0) {
+			__free_mbwu_mon(class, array, num_mbwu_mon);
+			return mbwu_mon;
+		}
+		array[i] = mbwu_mon;
+	}
+
+	l3_num_allocated_mbwu = min(l3_num_allocated_mbwu, num_mbwu_mon);
+
+	return 0;
+}
+
+static int *__alloc_mbwu_array(struct mpam_class *class, u16 num_mbwu_mon)
+{
+	int err;
+	int *array __free(kfree) = kmalloc_objs(*array, num_mbwu_mon);
+
+	if (!array)
+		return ERR_PTR(-ENOMEM);
+
+	memset(array, -1, num_mbwu_mon * sizeof(*array));
+
+	err = __alloc_mbwu_mon(class, array, num_mbwu_mon);
+	if (err)
+		return ERR_PTR(err);
+	return_ptr(array);
+}
+
 static void counter_update_class(enum resctrl_event_id evt_id,
 				 struct mpam_class *class)
 {
@@ -1087,9 +1155,46 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
 	return comp->comp_id;
 }
 
+/*
+ * This must run after all event counters have been picked so that any free
+ * running counters have already been allocated.
+ */
+static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
+{
+	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
+	struct rdt_resource *l3 = &res->resctrl_res;
+	struct mpam_class *class = mon->class;
+	u16 num_mbwu_mon;
+	size_t num_rmid = resctrl_arch_system_num_rmid_idx();
+
+	if (mon->mbwu_idx_to_mon) {
+		pr_debug("monitors free running\n");
+		return 0;
+	}
+
+	int *rmid_array __free(kfree) = kmalloc_objs(*rmid_array, num_rmid);
+
+	if (!rmid_array) {
+		pr_debug("Failed to allocate RMID array\n");
+		return -ENOMEM;
+	}
+	memset(rmid_array, -1, num_rmid * sizeof(*rmid_array));
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
 static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 				     enum resctrl_event_id type)
 {
+	int err = 0;
 	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
 	struct rdt_resource *l3 = &res->resctrl_res;
 
@@ -1131,8 +1236,19 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 */
 	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
 
-	if (resctrl_enable_mon_event(type, false, 0, NULL))
-		l3->mon_capable = true;
+	if (type == QOS_L3_MBM_TOTAL_EVENT_ID) {
+		err = mpam_resctrl_monitor_init_abmc(mon);
+		if (err)
+			return err;
+
+		static_assert(MAX_EVT_CONFIG_BITS == 0x7f);
+		l3->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
+	}
+
+	if (!resctrl_enable_mon_event(type, false, 0, NULL))
+		return -EINVAL;
+
+	l3->mon_capable = true;
 
 	return 0;
 }
@@ -1695,6 +1811,17 @@ void mpam_resctrl_exit(void)
 	resctrl_exit();
 }
 
+static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct mpam_class *class)
+{
+	u32 num_mbwu_mon = resctrl_arch_system_num_rmid_idx();
+
+	if (!mon->mbwu_idx_to_mon)
+		return;
+
+	__free_mbwu_mon(class, mon->mbwu_idx_to_mon, num_mbwu_mon);
+	mon->mbwu_idx_to_mon = NULL;
+}
+
 /*
  * The driver is detaching an MSC from this class, if resctrl was using it,
  * pull on resctrl_exit().
@@ -1717,6 +1844,8 @@ void mpam_resctrl_teardown_class(struct mpam_class *class)
 	for_each_mpam_resctrl_mon(mon, eventid) {
 		if (mon->class == class) {
 			mon->class = NULL;
+
+			mpam_resctrl_teardown_mon(mon, class);
 			break;
 		}
 	}
-- 
2.43.0



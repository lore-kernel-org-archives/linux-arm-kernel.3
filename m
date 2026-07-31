Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A688DC55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYfFx2VUTKDZGsWb5LE/+3cayi30qDuqaFLovhyt5Ns=; b=kRLWN4GVMArsmJ3b9umeRD2kNr
	MTg9gplCMXQx9h91EIsrOGUp7aR7kwP0lnaoO7wN64Qg/bEbLaIkOTGJ0ufc6Soj7bcZHtU4R5t6J
	nILJ8dEytyKBKyHm+nxG16g/9wTWt4bslg/pP0wEIdq7Ob+VlK5clB2q3UpNdQCJAn2w5vjip+yNz
	QnsnQSjp3lIf6ZZXsCQYqg8SptPMWZYR/el7e5fCEi0Pp2qjSp9qgnJBQ+URoS1NlrLVUd817gGbl
	zFIzR+G57cyXjuzrG5CgrOf9A8J7LLSeAJ/8n/rzkGw8xCWDTF/KAW1WYOlbvBTwVEf4gr/33o0Mm
	wIhT/czA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprPx-0000000DIbK-2H3N;
	Fri, 31 Jul 2026 17:53:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprPq-0000000DIYW-2Nc6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:53:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15C7F1595;
	Fri, 31 Jul 2026 10:52:57 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 65C8F3F66F;
	Fri, 31 Jul 2026 10:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785520381; bh=oFETPW6NhtNTT8WjwgjvgQW/w5CWhpJIecPjTzNE7SQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UA+JbSYgYk3ZMan+sEBhBoWC/4E87TOxkDEGDf7xU0j5ZRzOfLRO8RPXfM6Riff/A
	 1vt10u4O/3Lt6f7p0xA69aJEKUigU1crA64PgRdAIZoF4l29vxhP4cc/ZLoGeZVmwO
	 tXtk3uoaUJZzqRuN+9rfP5EGHWLvf9A6gKECB3+I=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com,
	will@kernel.org
Cc: james.morse@arm.com,
	fenghuay@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	andre.przywara@arm.com,
	gshan@redhat.com,
	tan.shaopeng@jp.fujitsu.com,
	sdonthineni@nvidia.com,
	jonathan.cameron@oss.qualcomm.com
Subject: [PATCH 2/6] arm_mpam: resctrl: Pre-allocate assignable monitors
Date: Fri, 31 Jul 2026 18:52:39 +0100
Message-ID: <20260731175243.904730-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731175243.904730-1-ben.horgan@arm.com>
References: <20260731175243.904730-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_105302_698073_50FFC73A 
X-CRM114-Status: GOOD (  24.12  )
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
mbm_assign_mode always use 'mbm_event' mode even if there are sufficient
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
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
Changes since rfc v1:
abmc enabled even if enough counters
Helpers from dropped free running commits
carry on with zero counters if using cdp
set config bits
use kmalloc_objs
drop tags for rework
Configure mbm_cntr_configurable, mbm_cntr_assign_fixed

Changes since rfc v2:
Don't set mon->assigned_counters to an error pointer
Fix mpam_resctrl_teardown_mon()
Remove free running check
Separate cleanup allocations, e.g. __free(), from the rest
Restrict scope on err in mpam_resctrl_monitor_init()

Changes since v3:
Correct NULL check in mpam_resctrl_teardown_mon() (Shaopeng)
variable allocation ordering in mpam_resctrl_pick_domain_id() (Shaopeng)
Move mon.* assignments from mpam_resctrl_monitor_sync_abmc_vals()
to mpam_resctrl_monitor_init_abmc() counters (Sashiko)
use kvmalloc_obj() for allocations that may be big on some
platforms (Sashiko)

Changes since v4:
Remove l3_num_allocated_mbwu (Koba)
indexed by idx -> indexed by resctrl's cntr_id (Fenghua)

Changes since v5:
Use -1 rather than ~1 (Gavin)
Add Gavin's R-b & T-b
---
 drivers/resctrl/mpam_internal.h |   6 +-
 drivers/resctrl/mpam_resctrl.c  | 143 +++++++++++++++++++++++++++++++-
 2 files changed, 145 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 04d1a59f02af..def0e3a65c23 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -409,7 +409,11 @@ struct mpam_resctrl_res {
 struct mpam_resctrl_mon {
 	struct mpam_class	*class;
 
-	/* per-class data that resctrl needs will live here */
+	/* Array of allocated MBWU monitors, indexed by (closid, rmid). */
+	int			*mbwu_idx_to_mon;
+
+	/* Array of assigned MBWU monitors, indexed by resctrl's cntr_id. */
+	int			*assigned_counters;
 };
 
 static inline int mpam_alloc_csu_mon(struct mpam_class *class)
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 0fce9703b869..0698a235d15c 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -140,7 +140,7 @@ int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 
 bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
 {
-	return false;
+	return (r == &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res);
 }
 
 int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
@@ -185,6 +185,26 @@ static void resctrl_reset_task_closids(void)
 	read_unlock(&tasklist_lock);
 }
 
+static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
+{
+	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID];
+
+	if (!mon->class)
+		return;
+
+	if (!mon->assigned_counters)
+		return;
+
+	l3->mon.num_mbm_cntrs = mon->class->props.num_mbwu_mon;
+	if (cdp_enabled)
+		l3->mon.num_mbm_cntrs /= 2;
+
+	/*
+	 * Continue as normal even if enabling cdp causes there to be
+	 * zero counters. This avoids giving resctrl mixed messages.
+	 */
+}
+
 int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 {
 	u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d = RESCTRL_RESERVED_CLOSID;
@@ -244,6 +264,7 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	WRITE_ONCE(arm64_mpam_global_default, mpam_get_regval(current));
 
 	resctrl_reset_task_closids();
+	mpam_resctrl_monitor_sync_abmc_vals(l3);
 
 	for_each_possible_cpu(cpu)
 		mpam_set_cpu_defaults(cpu, partid_d, partid_i, 0, 0);
@@ -613,6 +634,9 @@ static bool class_has_usable_mbwu(struct mpam_class *class)
 	if (!mpam_has_feature(mpam_feat_msmon_mbwu, cprops))
 		return false;
 
+	if (!cprops->num_mbwu_mon)
+		return false;
+
 	return true;
 }
 
@@ -935,6 +959,50 @@ static void mpam_resctrl_pick_mba(void)
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
+		array[i] = -1;
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
+	return 0;
+}
+
+static int *__alloc_mbwu_array(struct mpam_class *class, u16 num_mbwu_mon)
+{
+	int err;
+
+	int *array __free(kvfree) = kvmalloc_objs(*array, num_mbwu_mon);
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
@@ -1091,6 +1159,43 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
 	return comp->comp_id;
 }
 
+/*
+ * This must run after all event counters have been picked so that any free
+ * running counters have already been allocated.
+ */
+static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
+{
+	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
+	size_t num_rmid = resctrl_arch_system_num_rmid_idx();
+	struct rdt_resource *l3 = &res->resctrl_res;
+	struct mpam_class *class = mon->class;
+	u16 num_mbwu_mon;
+	int *cntrs;
+
+	int *rmid_array __free(kvfree) = kvmalloc_objs(*rmid_array, num_rmid);
+	if (!rmid_array) {
+		pr_debug("Failed to allocate RMID array\n");
+		return -ENOMEM;
+	}
+	memset(rmid_array, -1, num_rmid * sizeof(*rmid_array));
+
+	num_mbwu_mon = class->props.num_mbwu_mon;
+	cntrs = __alloc_mbwu_array(mon->class, num_mbwu_mon);
+	if (IS_ERR(cntrs))
+		return PTR_ERR(cntrs);
+	mon->assigned_counters = cntrs;
+	mon->mbwu_idx_to_mon = no_free_ptr(rmid_array);
+
+	l3->mon.mbm_cntr_assignable = true;
+	l3->mon.mbm_assign_on_mkdir = true;
+	l3->mon.mbm_cntr_configurable = false;
+	l3->mon.mbm_cntr_assign_fixed = true;
+
+	mpam_resctrl_monitor_sync_abmc_vals(l3);
+
+	return 0;
+}
+
 static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 				     enum resctrl_event_id type)
 {
@@ -1135,8 +1240,21 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 */
 	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
 
-	if (resctrl_enable_mon_event(type, false, 0, NULL))
-		l3->mon_capable = true;
+	if (type == QOS_L3_MBM_TOTAL_EVENT_ID) {
+		int err;
+
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
@@ -1699,6 +1817,23 @@ void mpam_resctrl_exit(void)
 	resctrl_exit();
 }
 
+static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct mpam_class *class)
+{
+	u32 num_mbwu_mon = class->props.num_mbwu_mon;
+
+	if (!mon->mbwu_idx_to_mon)
+		return;
+
+	if (mon->assigned_counters) {
+		__free_mbwu_mon(class, mon->assigned_counters, num_mbwu_mon);
+		kvfree(mon->assigned_counters);
+		mon->assigned_counters = NULL;
+	}
+
+	kvfree(mon->mbwu_idx_to_mon);
+	mon->mbwu_idx_to_mon = NULL;
+}
+
 /*
  * The driver is detaching an MSC from this class, if resctrl was using it,
  * pull on resctrl_exit().
@@ -1721,6 +1856,8 @@ void mpam_resctrl_teardown_class(struct mpam_class *class)
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



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D80606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z//Z3+Tv;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=xdD+Uyll
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=95DW2BtVw352RGGTbjz/IUklIVNUH2ZIuv3PyDF7IGA=; b=Z//Z3+Tvz08YMpZAcoBZFCdp3m
	waeYEXFAFrQEZ/g064speefeoIytrg5NbXda/9wkkw4TDTKD+rH6HBUuJNgZdQJAbLyFNo1uu7Wd/
	vQHlpGneZ+RIHNqB9qajF/N6QBi35sB3fU61fpvloi3GjC4e5gSSIgaTOK1JhpQH95uhLtYQSOzB7
	F+E5GAmxHhKsbTTU4YjbQt9COmqxHTxgjSh4dwc9rN8OeJxhSXtKdaujRiDT90KXpyExqEuCC5Aq8
	RNeYYRpS56F0R9C5sTBZTQYRCXP5h0YJYQFSmalZjb0dj83d02GnQu5MKEM7nsrq0kkATLE3AT3aS
	F78m1NKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPNh-00000009Azg-0eiH;
	Thu, 29 Oct 2026 12:37:21 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPN7-00000009AQy-3tQy;
	Thu, 29 Oct 2026 12:36:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=95DW2BtVw352RGGTbjz/IUklIVNUH2ZIuv3PyDF7IGA=;
	b=xdD+UylleJMd69XWFgiaYBjWlpk3fER82rt+ikSWixvFbrwuJz+u+vzNHO5RFD01NzSgzSVP5
	G9ZmJWgFL+2Kp+LBbAV46V/IBriBoCCpNTbo8zN6rWCvjikYaTvscpobFGdi2PiTMvLssB5Bwlt
	QzxTeBkPXn359zsQ9MafCYg=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHc6qX7zpSyc;
	Thu, 29 Oct 2026 20:36:28 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 827C140537;
	Thu, 29 Oct 2026 20:36:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:42 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <reinette.chatre@intel.com>, <james.morse@arm.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 07/19] arm_mpam: resctrl: Index monitor state by resource and event
Date: Thu, 29 Oct 2026 20:35:59 +0800
Message-ID: <20261029123611.1108424-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029123611.1108424-1-ruanjinjie@huawei.com>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_053646_319660_3E6D4722 
X-CRM114-Status: GOOD (  21.78  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The picked monitor class and the assignable counter state are kept in an
array indexed by event ID alone, and every monitor domain's component
array is filled from every event. Index the array by resource and event,
and fill a domain only from the events of its own resource.

This is plumbing for L2 support. It also replaces the MPAM_MAX_EVENT
bound with QOS_NUM_EVENTS, so an event ID is no longer used as an index
past the end of the array it indexes.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 146 ++++++++++++++++++---------------
 1 file changed, 82 insertions(+), 64 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index e436c3e6d4fc..abd4fbca48ab 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -37,21 +37,30 @@ static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
 	     rid++, res = &mpam_resctrl_controls[rid])
 
 /*
- * The classes we've picked to map to resctrl events.
- * Resctrl believes all the worlds a Xeon, and these are all on the L3. This
- * array lets us find the actual class backing the event counters. e.g.
+ * The classes we've picked to map to resctrl events, for each resource.
+ * This array lets us find the actual class backing the event counters. e.g.
  * the only memory bandwidth counters may be on the memory controller, but to
- * make use of them, we pretend they are on L3. Restrict the events considered
- * to those supported by MPAM.
+ * make use of them, we pretend they are on L3.
  * Class pointer may be NULL.
  */
-#define MPAM_MAX_EVENT QOS_MBM_TOTAL_EVENT_ID
-static struct mpam_resctrl_mon mpam_resctrl_counters[MPAM_MAX_EVENT + 1];
+static struct mpam_resctrl_mon mpam_resctrl_counters[RDT_NUM_RESOURCES][QOS_NUM_EVENTS];
 
-#define for_each_mpam_resctrl_mon(mon, eventid)					\
-	for (eventid = QOS_FIRST_EVENT, mon = &mpam_resctrl_counters[eventid];	\
-	     eventid <= MPAM_MAX_EVENT;						\
-	     eventid++, mon = &mpam_resctrl_counters[eventid])
+static struct mpam_resctrl_mon *
+mpam_resctrl_mon_by_rid(enum resctrl_res_level rid, enum resctrl_event_id evtid)
+{
+	return &mpam_resctrl_counters[rid][evtid];
+}
+
+static struct mpam_resctrl_mon *
+mpam_resctrl_mon(struct rdt_resource *r, enum resctrl_event_id evtid)
+{
+	return mpam_resctrl_mon_by_rid(r->rid, evtid);
+}
+
+#define for_each_mpam_resctrl_mon(mon, r, eventid)				\
+	for (eventid = QOS_FIRST_EVENT, mon = mpam_resctrl_mon(r, eventid);	\
+	     eventid < QOS_NUM_EVENTS;						\
+	     eventid++, mon = mpam_resctrl_mon(r, eventid))
 
 /* The lock for modifying resctrl's domain lists from cpuhp callbacks. */
 static DEFINE_MUTEX(domain_list_lock);
@@ -171,9 +180,9 @@ static void resctrl_reset_task_closids(void)
 	read_unlock(&tasklist_lock);
 }
 
-static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
+static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *r)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[QOS_MBM_TOTAL_EVENT_ID];
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mon(r, QOS_MBM_TOTAL_EVENT_ID);
 
 	if (!mon->class)
 		return;
@@ -181,9 +190,9 @@ static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
 	if (!mon->assigned_counters)
 		return;
 
-	l3->mon.num_mbm_cntrs = mon->class->props.num_mbwu_mon;
+	r->mon.num_mbm_cntrs = mon->class->props.num_mbwu_mon;
 	if (cdp_enabled)
-		l3->mon.num_mbm_cntrs /= 2;
+		r->mon.num_mbm_cntrs /= 2;
 
 	/*
 	 * Continue as normal even if enabling cdp causes there to be
@@ -381,9 +390,10 @@ struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
 	return &mpam_resctrl_controls[l].resctrl_res;
 }
 
-static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid)
+static int resctrl_arch_mon_ctx_alloc_no_wait(struct rdt_resource *r,
+					      enum resctrl_event_id evtid)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mon(r, evtid);
 
 	if (!mpam_is_enabled())
 		return -EINVAL;
@@ -416,7 +426,7 @@ void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
 	do {
 		prepare_to_wait(&resctrl_mon_ctx_waiters, &wait,
 				TASK_INTERRUPTIBLE);
-		*ret = resctrl_arch_mon_ctx_alloc_no_wait(evtid);
+		*ret = resctrl_arch_mon_ctx_alloc_no_wait(r, evtid);
 		if (*ret == -ENOSPC)
 			schedule();
 	} while (*ret == -ENOSPC && !signal_pending(current));
@@ -425,10 +435,11 @@ void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
 	return ret;
 }
 
-static void resctrl_arch_mon_ctx_free_no_wait(enum resctrl_event_id evtid,
+static void resctrl_arch_mon_ctx_free_no_wait(struct rdt_resource *r,
+					      enum resctrl_event_id evtid,
 					      u32 mon_idx)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mon(r, evtid);
 
 	if (!mpam_is_enabled())
 		return;
@@ -449,7 +460,7 @@ void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
 
 	kfree(arch_mon_ctx);
 
-	resctrl_arch_mon_ctx_free_no_wait(evtid, mon_idx);
+	resctrl_arch_mon_ctx_free_no_wait(r, evtid, mon_idx);
 }
 
 static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
@@ -523,7 +534,7 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 	struct mpam_component *mon_comp;
 	u32 mon_idx = *(u32 *)arch_mon_ctx;
 	enum mpam_device_features mon_type;
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mon(r, eventid);
 
 	resctrl_arch_rmid_read_context_check();
 
@@ -550,7 +561,7 @@ int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 			   u32 closid, u32 rmid, int mon_idx,
 			   enum resctrl_event_id eventid, u64 *val)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mon(r, eventid);
 	struct mpam_resctrl_dom *l3_dom;
 	struct mpam_component *mon_comp;
 
@@ -607,7 +618,7 @@ void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 			     u32 closid, u32 rmid, int cntr_id,
 			     enum resctrl_event_id eventid)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mon(r, eventid);
 	struct mpam_resctrl_dom *l3_dom;
 	struct mpam_component *mon_comp;
 
@@ -1079,10 +1090,11 @@ static int *__alloc_mbwu_array(struct mpam_class *class, u16 num_mbwu_mon)
 	return_ptr(array);
 }
 
-static void counter_update_class(enum resctrl_event_id evt_id,
+static void counter_update_class(enum resctrl_res_level rid,
+				 enum resctrl_event_id evt_id,
 				 struct mpam_class *class)
 {
-	struct mpam_class *existing_class = mpam_resctrl_counters[evt_id].class;
+	struct mpam_class *existing_class = mpam_resctrl_mon_by_rid(rid, evt_id)->class;
 
 	if (existing_class) {
 		if (existing_class->level == 3) {
@@ -1097,7 +1109,7 @@ static void counter_update_class(enum resctrl_event_id evt_id,
 		}
 	}
 
-	mpam_resctrl_counters[evt_id].class = class;
+	mpam_resctrl_mon_by_rid(rid, evt_id)->class = class;
 }
 
 static void mpam_resctrl_pick_counters(void)
@@ -1131,7 +1143,7 @@ static void mpam_resctrl_pick_counters(void)
 				if (update_rmid_limits(class))
 					break;
 
-				counter_update_class(QOS_OCCUP_EVENT_ID, class);
+				counter_update_class(RDT_RESOURCE_L3, QOS_OCCUP_EVENT_ID, class);
 				break;
 			default:
 				break;
@@ -1153,7 +1165,7 @@ static void mpam_resctrl_pick_counters(void)
 			 * and it's equivalent to mbm_total and so always use
 			 * mbm_total.
 			 */
-			counter_update_class(QOS_MBM_TOTAL_EVENT_ID, class);
+			counter_update_class(RDT_RESOURCE_L3, QOS_MBM_TOTAL_EVENT_ID, class);
 		}
 	}
 }
@@ -1178,7 +1190,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
 			      u32 cntr_id, bool assign)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mon(r, evtid);
 
 	if (evtid != QOS_MBM_TOTAL_EVENT_ID) {
 		pr_debug("unexpected event id\n");
@@ -1281,11 +1293,10 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
  * This must run after all event counters have been picked so that any free
  * running counters have already been allocated.
  */
-static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
+static int mpam_resctrl_monitor_init_abmc(struct rdt_resource *r,
+					  struct mpam_resctrl_mon *mon)
 {
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
 	size_t num_rmid = resctrl_arch_system_num_rmid_idx();
-	struct rdt_resource *l3 = &res->resctrl_res;
 	struct mpam_class *class = mon->class;
 	u16 num_mbwu_mon;
 	int *cntrs;
@@ -1304,21 +1315,22 @@ static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
 	mon->assigned_counters = cntrs;
 	mon->mbwu_idx_to_mon = no_free_ptr(rmid_array);
 
-	l3->mon.mbm_cntr_assignable = true;
-	l3->mon.mbm_assign_on_mkdir = true;
-	l3->mon.mbm_cntr_configurable = false;
-	l3->mon.mbm_cntr_assign_fixed = true;
+	r->mon.mbm_cntr_assignable = true;
+	r->mon.mbm_assign_on_mkdir = true;
+	r->mon.mbm_cntr_configurable = false;
+	r->mon.mbm_cntr_assign_fixed = true;
 
-	mpam_resctrl_monitor_sync_abmc_vals(l3);
+	mpam_resctrl_monitor_sync_abmc_vals(r);
 
 	return 0;
 }
 
-static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
+static int mpam_resctrl_monitor_init(struct rdt_resource *r,
 				     enum resctrl_event_id type)
 {
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
-	struct rdt_resource *l3 = &res->resctrl_res;
+	struct mpam_resctrl_res *res = container_of(r, struct mpam_resctrl_res,
+						    resctrl_res);
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mon(r, type);
 
 	lockdep_assert_cpus_held();
 
@@ -1337,7 +1349,7 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 */
 	if (!res->class) {
 		pr_warn_once("Faking L3 MSC to enable counters.\n");
-		res->class = mpam_resctrl_counters[type].class;
+		res->class = mon->class;
 	}
 
 	/*
@@ -1345,8 +1357,8 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 * monitoring class.
 	 * Setting name is necessary on monitor only platforms.
 	 */
-	l3->name = "L3";
-	l3->mon_scope = RESCTRL_L3_CACHE;
+	r->name = "L3";
+	r->mon_scope = RESCTRL_L3_CACHE;
 
 	/*
 	 * num-rmid is the upper bound for the number of monitoring groups that
@@ -1356,23 +1368,23 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 * this does mean userspace needs to know the architecture to correctly
 	 * interpret this value.
 	 */
-	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+	r->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
 
 	if (type == QOS_MBM_TOTAL_EVENT_ID) {
 		int err;
 
-		err = mpam_resctrl_monitor_init_abmc(mon);
+		err = mpam_resctrl_monitor_init_abmc(r, mon);
 		if (err)
 			return err;
 
 		static_assert(MAX_EVT_CONFIG_BITS == 0x7f);
-		l3->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
+		r->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
 	}
 
 	if (!resctrl_enable_mon_event(type, false, 0, NULL))
 		return -EINVAL;
 
-	l3->mon_capable = true;
+	r->mon_capable = true;
 
 	return 0;
 }
@@ -1683,7 +1695,7 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 		 * overlapping CPUs and set up the dom->mon_comp array.
 		 */
 
-		for_each_mpam_resctrl_mon(mon, eventid) {
+		for_each_mpam_resctrl_mon(mon, r, eventid) {
 			struct mpam_component *mon_comp;
 
 			if (!mon->class)
@@ -1859,11 +1871,12 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
 
 int mpam_resctrl_setup(void)
 {
-	int err = 0;
+	enum resctrl_event_id eventid;
 	struct mpam_resctrl_res *res;
-	enum resctrl_res_level rid;
 	struct mpam_resctrl_mon *mon;
-	enum resctrl_event_id eventid;
+	enum resctrl_res_level rid;
+	struct rdt_resource *r;
+	int err = 0;
 
 	wait_event(wait_cacheinfo_ready, cacheinfo_ready);
 
@@ -1893,14 +1906,16 @@ int mpam_resctrl_setup(void)
 	/* Find some classes to use for monitors */
 	mpam_resctrl_pick_counters();
 
-	for_each_mpam_resctrl_mon(mon, eventid) {
-		if (!mon->class)
-			continue;	// dummy resource
+	for_each_rdt_resource(r) {
+		for_each_mpam_resctrl_mon(mon, r, eventid) {
+			if (!mon->class)
+				continue;	// dummy resource
 
-		err = mpam_resctrl_monitor_init(mon, eventid);
-		if (err) {
-			pr_debug("Failed to initialise event %u\n", eventid);
-			goto internal_error;
+			err = mpam_resctrl_monitor_init(r, eventid);
+			if (err) {
+				pr_debug("Failed to initialise event %u\n", eventid);
+				goto internal_error;
+			}
 		}
 	}
 
@@ -1954,10 +1969,11 @@ static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct mpam_
 
 void mpam_resctrl_teardown_class(struct mpam_class *class)
 {
+	enum resctrl_event_id eventid;
+	struct mpam_resctrl_mon *mon;
 	struct mpam_resctrl_res *res;
 	enum resctrl_res_level rid;
-	struct mpam_resctrl_mon *mon;
-	enum resctrl_event_id eventid;
+	struct rdt_resource *r;
 
 	might_sleep();
 
@@ -1965,10 +1981,12 @@ void mpam_resctrl_teardown_class(struct mpam_class *class)
 		if (res->class == class)
 			res->class = NULL;
 	}
-	for_each_mpam_resctrl_mon(mon, eventid) {
-		if (mon->class == class) {
-			mon->class = NULL;
+	for_each_rdt_resource(r) {
+		for_each_mpam_resctrl_mon(mon, r, eventid) {
+			if (mon->class != class)
+				continue;
 
+			mon->class = NULL;
 			mpam_resctrl_teardown_mon(mon, class);
 		}
 	}
-- 
2.34.1



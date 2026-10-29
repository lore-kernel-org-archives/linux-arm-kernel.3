Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A00606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pfqVURv2;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=l4DQaP6U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U9zbs/6zsr8VkNiQeaQdPcfUuCnlAk84/yyZE8/+OXs=; b=pfqVURv2JXKnLa8PgGImeY6qFO
	v4NGpmbTaHDcx6mmyCxEpgFnRxK+ZCHYfQBTpsXsXYFjKnH4gbzrMbBBkCxWkN1JAKcPdgmlZJvWU
	3fubrxhRhIxLjXG3vt0CVlp93ZhQLKdLqjjYWivQtVjc7T623GXfXuO70GvxZOArR/315lpYxZUeZ
	ACkedL34/3SZbrou6v6WyLJjWQz2tWAQUBpvlA6wAhGFcoVDsOPLicpfhlXGEgyE0GrGevTtBbJIb
	gUrr/rlo6gGKo7dDP+Zvk4nARwbGhXhK9FYsBvmeDX17n4lUL8Z313T8cB8u7vMrrr5dDO830EttJ
	qYVWq0Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPNr-00000009BOb-2ThR;
	Thu, 29 Oct 2026 12:37:31 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPNB-00000009ASY-1Ppb;
	Thu, 29 Oct 2026 12:36:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=U9zbs/6zsr8VkNiQeaQdPcfUuCnlAk84/yyZE8/+OXs=;
	b=l4DQaP6UIBVt9ecLNzJKm1YFisRpgyHLxyqd0GC/+7hw2VV925dh24Gc0gjEdeo205HBrX0Yo
	/NfPuwv0mCofLSyBynfhjMmpXQTD1/PUzKvrQNide3w1XqiJCPza+R3WhG1xfrgXI3CmlJctrri
	le/wZL3zJRBjMyvcz4qRAS0=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jFkJ431SzznTV7;
	Thu, 29 Oct 2026 20:36:52 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id EFEE540578;
	Thu, 29 Oct 2026 20:36:45 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:44 +0800
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
Subject: [RFC PATCH v2 10/19] fs/resctrl: Track monitor events per resource
Date: Thu, 29 Oct 2026 20:36:02 +0800
Message-ID: <20261029123611.1108424-11-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261029_053650_125601_DD25B5B3 
X-CRM114-Status: GOOD (  19.38  )
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

The event table is indexed by event ID alone, so an event type can only
belong to one resource.

To support L2 monitor event, index it by resource and event ID instead.

Arch code enables events before resctrl can set anything up in the
resource, so look the row up by r->rid. A resource supports an event
when the entry has a name.

No functional change.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/internal.h         |  7 +--
 fs/resctrl/monitor.c          | 88 +++++++++++++++++++----------------
 fs/resctrl/rdtgroup.c         | 12 ++---
 include/linux/resctrl_types.h |  7 +--
 4 files changed, 62 insertions(+), 52 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 0368e19df24a..f84152734fd1 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -83,12 +83,13 @@ struct mon_evt {
 	void			*arch_priv;
 };
 
-extern struct mon_evt mon_event_all[QOS_NUM_EVENTS];
+extern struct mon_evt mon_event_all[RDT_NUM_RESOURCES][QOS_NUM_EVENTS];
 
 bool resctrl_is_mon_event_enabled_any(enum resctrl_event_id eventid);
 
-#define for_each_mon_event(mevt) for (mevt = &mon_event_all[QOS_FIRST_EVENT];	\
-				      mevt < &mon_event_all[QOS_NUM_EVENTS]; mevt++)
+#define for_each_mon_event(r, mevt)						\
+	for (mevt = &mon_event_all[(r)->rid][QOS_FIRST_EVENT];			\
+	     mevt < &mon_event_all[(r)->rid][QOS_NUM_EVENTS]; mevt++)
 
 /* Limit for mon_evt::binary_bits */
 #define MAX_BINARY_BITS	27
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index a19733fae36e..9b747b88fd6b 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -141,7 +141,7 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
 	void *arch_priv;
 	u64 val = 0;
 
-	arch_priv = mon_event_all[QOS_OCCUP_EVENT_ID].arch_priv;
+	arch_priv = mon_event_all[r->rid][QOS_OCCUP_EVENT_ID].arch_priv;
 	arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, QOS_OCCUP_EVENT_ID);
 	if (IS_ERR(arch_mon_ctx)) {
 		pr_warn_ratelimited("Failed to allocate monitor context: %pe",
@@ -769,7 +769,7 @@ static void mbm_update_one_event(struct rdt_resource *r, struct rdt_l3_mon_domai
 
 	rr.r = r;
 	rr.hdr = &d->hdr;
-	rr.evt = &mon_event_all[evtid];
+	rr.evt = &mon_event_all[r->rid][evtid];
 	if (resctrl_arch_mbm_cntr_assign_enabled(r)) {
 		rr.is_mbm_cntr = true;
 	} else {
@@ -1016,34 +1016,38 @@ void free_rmid_lru_list(void)
 	mutex_unlock(&rdtgroup_mutex);
 }
 
-#define MON_EVENT(_eventid, _name, _res, _fp)	\
+#define MON_EVENT(_eventid, _name, _fp)		\
 	[_eventid] = {				\
 	.name			= _name,	\
 	.evtid			= _eventid,	\
-	.rid			= _res,		\
 	.is_floating_point	= _fp,		\
 }
 
 /*
- * All available events. Architecture code marks the ones that
- * are supported by a system using resctrl_enable_mon_event()
- * to set .enabled.
+ * All available events, indexed by resource and event type. Architecture
+ * code marks the ones that are supported by a system using
+ * resctrl_enable_mon_event() to set .enabled. A resource supports an event
+ * when the entry has a name.
  */
-struct mon_evt mon_event_all[QOS_NUM_EVENTS] = {
-	MON_EVENT(QOS_OCCUP_EVENT_ID,			"llc_occupancy",	RDT_RESOURCE_L3,	false),
-	MON_EVENT(QOS_MBM_TOTAL_EVENT_ID,		"mbm_total_bytes",	RDT_RESOURCE_L3,	false),
-	MON_EVENT(QOS_MBM_LOCAL_EVENT_ID,		"mbm_local_bytes",	RDT_RESOURCE_L3,	false),
-	MON_EVENT(PMT_EVENT_ENERGY,			"core_energy",		RDT_RESOURCE_PERF_PKG,	true),
-	MON_EVENT(PMT_EVENT_ACTIVITY,			"activity",		RDT_RESOURCE_PERF_PKG,	true),
-	MON_EVENT(PMT_EVENT_STALLS_LLC_HIT,		"stalls_llc_hit",	RDT_RESOURCE_PERF_PKG,	false),
-	MON_EVENT(PMT_EVENT_C1_RES,			"c1_res",		RDT_RESOURCE_PERF_PKG,	false),
-	MON_EVENT(PMT_EVENT_UNHALTED_CORE_CYCLES,	"unhalted_core_cycles",	RDT_RESOURCE_PERF_PKG,	false),
-	MON_EVENT(PMT_EVENT_STALLS_LLC_MISS,		"stalls_llc_miss",	RDT_RESOURCE_PERF_PKG,	false),
-	MON_EVENT(PMT_EVENT_AUTO_C6_RES,		"c6_res",		RDT_RESOURCE_PERF_PKG,	false),
-	MON_EVENT(PMT_EVENT_UNHALTED_REF_CYCLES,	"unhalted_ref_cycles",	RDT_RESOURCE_PERF_PKG,	false),
-	MON_EVENT(PMT_EVENT_UOPS_RETIRED,		"uops_retired",		RDT_RESOURCE_PERF_PKG,	false),
-	MON_EVENT(PMT_EVENT_INST_RETIRED,		"inst_retired",		RDT_RESOURCE_PERF_PKG,	false),
-	MON_EVENT(PMT_EVENT_PCNT,			"pcnt",			RDT_RESOURCE_PERF_PKG,	false),
+struct mon_evt mon_event_all[RDT_NUM_RESOURCES][QOS_NUM_EVENTS] = {
+	[RDT_RESOURCE_L3] = {
+		MON_EVENT(QOS_OCCUP_EVENT_ID,		"llc_occupancy",	false),
+		MON_EVENT(QOS_MBM_TOTAL_EVENT_ID,	"mbm_total_bytes",	false),
+		MON_EVENT(QOS_MBM_LOCAL_EVENT_ID,	"mbm_local_bytes",	false),
+	},
+	[RDT_RESOURCE_PERF_PKG] = {
+		MON_EVENT(PMT_EVENT_ENERGY,		"core_energy",	true),
+		MON_EVENT(PMT_EVENT_ACTIVITY,		"activity",	true),
+		MON_EVENT(PMT_EVENT_STALLS_LLC_HIT,	"stalls_llc_hit",	false),
+		MON_EVENT(PMT_EVENT_C1_RES,		"c1_res",	false),
+		MON_EVENT(PMT_EVENT_UNHALTED_CORE_CYCLES, "unhalted_core_cycles",	false),
+		MON_EVENT(PMT_EVENT_STALLS_LLC_MISS,	"stalls_llc_miss",	false),
+		MON_EVENT(PMT_EVENT_AUTO_C6_RES,	"c6_res",	false),
+		MON_EVENT(PMT_EVENT_UNHALTED_REF_CYCLES, "unhalted_ref_cycles",	false),
+		MON_EVENT(PMT_EVENT_UOPS_RETIRED,	"uops_retired",	false),
+		MON_EVENT(PMT_EVENT_INST_RETIRED,	"inst_retired",	false),
+		MON_EVENT(PMT_EVENT_PCNT,		"pcnt",	false),
+	},
 };
 
 bool resctrl_enable_mon_event(struct rdt_resource *r,
@@ -1056,7 +1060,11 @@ bool resctrl_enable_mon_event(struct rdt_resource *r,
 			 binary_bits > MAX_BINARY_BITS))
 		return false;
 
-	mevt = &mon_event_all[eventid];
+	mevt = &mon_event_all[r->rid][eventid];
+	if (!mevt->name) {
+		pr_warn("Resource %d does not support event %d\n", r->rid, eventid);
+		return false;
+	}
 	if (mevt->enabled) {
 		pr_warn("Duplicate enable for event %d on resource %d\n",
 			eventid, r->rid);
@@ -1067,6 +1075,7 @@ bool resctrl_enable_mon_event(struct rdt_resource *r,
 		return false;
 	}
 
+	mevt->rid = r->rid;
 	mevt->any_cpu = any_cpu;
 	mevt->binary_bits = binary_bits;
 	mevt->arch_priv = arch_priv;
@@ -1079,7 +1088,7 @@ bool resctrl_is_mon_event_enabled(struct rdt_resource *r,
 				  enum resctrl_event_id eventid)
 {
 	return eventid >= QOS_FIRST_EVENT && eventid < QOS_NUM_EVENTS &&
-	       mon_event_all[eventid].enabled;
+	       mon_event_all[r->rid][eventid].enabled;
 }
 
 bool resctrl_is_mon_event_enabled_any(enum resctrl_event_id eventid)
@@ -1096,7 +1105,7 @@ bool resctrl_is_mon_event_enabled_any(enum resctrl_event_id eventid)
 
 u32 resctrl_get_mon_evt_cfg(struct rdt_resource *r, enum resctrl_event_id evtid)
 {
-	return mon_event_all[evtid].evt_cfg;
+	return mon_event_all[r->rid][evtid].evt_cfg;
 }
 
 /**
@@ -1341,11 +1350,11 @@ void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
 
 	if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
 		rdtgroup_assign_cntr_event(NULL, rdtgrp,
-					   &mon_event_all[QOS_MBM_TOTAL_EVENT_ID]);
+					   &mon_event_all[r->rid][QOS_MBM_TOTAL_EVENT_ID]);
 
 	if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
 		rdtgroup_assign_cntr_event(NULL, rdtgrp,
-					   &mon_event_all[QOS_MBM_LOCAL_EVENT_ID]);
+					   &mon_event_all[r->rid][QOS_MBM_LOCAL_EVENT_ID]);
 }
 
 /*
@@ -1399,11 +1408,11 @@ void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp)
 
 	if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
 		rdtgroup_unassign_cntr_event(NULL, rdtgrp,
-					     &mon_event_all[QOS_MBM_TOTAL_EVENT_ID]);
+					     &mon_event_all[r->rid][QOS_MBM_TOTAL_EVENT_ID]);
 
 	if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
 		rdtgroup_unassign_cntr_event(NULL, rdtgrp,
-					     &mon_event_all[QOS_MBM_LOCAL_EVENT_ID]);
+					     &mon_event_all[r->rid][QOS_MBM_LOCAL_EVENT_ID]);
 }
 
 static int resctrl_parse_mem_transactions(char *tok, u32 *val)
@@ -1615,9 +1624,9 @@ ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of, char *buf,
 		 * total and local events.
 		 */
 		if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
-			mon_event_all[QOS_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
+			mon_event_all[r->rid][QOS_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
 		if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
-			mon_event_all[QOS_MBM_LOCAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask &
+			mon_event_all[r->rid][QOS_MBM_LOCAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask &
 									   (READS_TO_LOCAL_MEM |
 									    READS_TO_LOCAL_S_MEM |
 									    NON_TEMP_WRITE_TO_LOCAL_MEM);
@@ -1724,8 +1733,8 @@ int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, voi
 		goto out_unlock;
 	}
 
-	for_each_mon_event(mevt) {
-		if (mevt->rid != r->rid || !mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
+	for_each_mon_event(r, mevt) {
+		if (!mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
 			continue;
 
 		sep = false;
@@ -1758,9 +1767,8 @@ static struct mon_evt *mbm_get_mon_event_by_name(struct rdt_resource *r, char *n
 {
 	struct mon_evt *mevt;
 
-	for_each_mon_event(mevt) {
-		if (mevt->rid == r->rid && mevt->enabled &&
-		    resctrl_is_mbm_event(mevt->evtid) &&
+	for_each_mon_event(r, mevt) {
+		if (mevt->enabled && resctrl_is_mbm_event(mevt->evtid) &&
 		    !strcmp(mevt->name, name))
 			return mevt;
 	}
@@ -1957,12 +1965,12 @@ int resctrl_l3_mon_resource_init(void)
 		return ret;
 
 	if (resctrl_arch_is_evt_configurable(QOS_MBM_TOTAL_EVENT_ID)) {
-		mon_event_all[QOS_MBM_TOTAL_EVENT_ID].configurable = true;
+		mon_event_all[r->rid][QOS_MBM_TOTAL_EVENT_ID].configurable = true;
 		resctrl_file_fflags_init("mbm_total_bytes_config",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 	}
 	if (resctrl_arch_is_evt_configurable(QOS_MBM_LOCAL_EVENT_ID)) {
-		mon_event_all[QOS_MBM_LOCAL_EVENT_ID].configurable = true;
+		mon_event_all[r->rid][QOS_MBM_LOCAL_EVENT_ID].configurable = true;
 		resctrl_file_fflags_init("mbm_local_bytes_config",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 	}
@@ -1974,9 +1982,9 @@ int resctrl_l3_mon_resource_init(void)
 
 	if (r->mon.mbm_cntr_assignable) {
 		if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
-			mon_event_all[QOS_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
+			mon_event_all[r->rid][QOS_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
 		if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
-			mon_event_all[QOS_MBM_LOCAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask &
+			mon_event_all[r->rid][QOS_MBM_LOCAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask &
 									   (READS_TO_LOCAL_MEM |
 									    READS_TO_LOCAL_S_MEM |
 									    NON_TEMP_WRITE_TO_LOCAL_MEM);
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5804921c57c8..8154e02b3d1c 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1208,8 +1208,8 @@ static int rdt_mon_features_show(struct kernfs_open_file *of,
 
 	if (!info_kn_lock(of->kn))
 		return -ENOENT;
-	for_each_mon_event(mevt) {
-		if (mevt->rid != r->rid || !mevt->enabled)
+	for_each_mon_event(r, mevt) {
+		if (!mevt->enabled)
 			continue;
 		seq_printf(seq, "%s\n", mevt->name);
 		if (mevt->configurable &&
@@ -2426,8 +2426,8 @@ static int resctrl_mkdir_event_configs(struct rdt_resource *r, struct kernfs_nod
 	if (ret)
 		return ret;
 
-	for_each_mon_event(mevt) {
-		if (mevt->rid != r->rid || !mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
+	for_each_mon_event(r, mevt) {
+		if (!mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
 			continue;
 
 		kn_subdir2 = kernfs_create_dir(kn_subdir, mevt->name, kn_subdir->mode, mevt);
@@ -3520,8 +3520,8 @@ static struct kernfs_node *_mkdir_mondata_subdir(struct kernfs_node *parent_kn,
 	if (ret)
 		goto out_destroy;
 
-	for_each_mon_event(mevt) {
-		if (mevt->rid != r->rid || !mevt->enabled)
+	for_each_mon_event(r, mevt) {
+		if (!mevt->enabled)
 			continue;
 		priv = mon_get_kn_priv(r->rid, domid, mevt, !hdr);
 		if (WARN_ON_ONCE(!priv)) {
diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index d0e56de038f0..307a74d3c928 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -43,9 +43,10 @@ enum resctrl_event_id {
 	QOS_FIRST_EVENT			= 0x01,
 
 	/*
-	 * Monitor event types. The resource an event belongs to is tracked
-	 * separately. These values match those used to program IA32_QM_EVTSEL
-	 * before reading IA32_QM_CTR on RDT systems.
+	 * Monitor event types. More than one resource may support the same
+	 * event type; the resource supplies the scope. These values match
+	 * those used to program IA32_QM_EVTSEL before reading IA32_QM_CTR on
+	 * RDT systems.
 	 */
 	QOS_OCCUP_EVENT_ID		= 0x01,
 	QOS_MBM_TOTAL_EVENT_ID		= 0x02,
-- 
2.34.1



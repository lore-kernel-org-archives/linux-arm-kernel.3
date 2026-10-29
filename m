Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23188606AA94
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mXIOXRyW;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=cH8hOHPr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nN8itL969BZCJ5eBWw6lG/BkNJtfISw9Jso9RQZ4cTw=; b=mXIOXRyW2i2cNLOmgAnPKJpZTX
	gxffA/sqfPRDExVnxQ3aW5LKdCHSslzNQgCpEJpWA+oq3qVNWWDgD4tFyaY5/aZkonL93PQzFXiKl
	hVNdAFri649WVQ2GJd2YtbiP5nCLWweh6hOU8YjZ9uAQXu+v7rSfFt7tq7kcnYQNRRI7B1dmEMxy1
	NeYFez1pkgZJKDn6W9kPuTjf98xWQcAo92VviFO3N4+szvt9y3lVmn4VYd3UDHIRZTtl5aqZUy0VT
	+cnamWBh415ueYOU7BTcDrl8PRCld1SkOs6xuEwYhVo/eiSjl6vU/yqIUuez3qY2p1cBE2MKcTTfE
	kb/FEilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPNj-00000009B4x-02F1;
	Thu, 29 Oct 2026 12:37:23 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPNB-00000009ASN-2HHJ;
	Thu, 29 Oct 2026 12:36:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nN8itL969BZCJ5eBWw6lG/BkNJtfISw9Jso9RQZ4cTw=;
	b=cH8hOHPr/G7fvf3gIJVTvxsOVkK9nZCmN0k5i0M/y8xfgGa4i5A9mzO+4k11v/LefycmBfzIO
	TT+uKLftEA09mSN/OPQbZ4lmBHVDM6wh0zhk2fVjYtW1LgJ0u7t3Ifq0os/zw50ldfnz9GHWNN1
	73MdsOYdZlJDsgLTz0iDyHo=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHj5nc6z1T4Fy;
	Thu, 29 Oct 2026 20:36:33 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1CD1E40538;
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
Subject: [RFC PATCH v2 09/19] x86,fs/resctrl: Pass the resource to the monitor event helpers
Date: Thu, 29 Oct 2026 20:36:01 +0800
Message-ID: <20261029123611.1108424-10-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261029_053649_961787_532EDF1C 
X-CRM114-Status: GOOD (  20.36  )
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

L2 and L3 caches support the same monitor event types, so the event
ID alone no longer says which resource an event belongs to.

So add the resource as an argument to below helper:
- resctrl_enable_mon_event()
- resctrl_is_mon_event_enabled()
- resctrl_get_mon_evt_cfg()

Code that only needs to know whether any resource has an event
uses the new resctrl_is_mon_event_enabled_any().

No functional change.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/x86/kernel/cpu/resctrl/core.c      |  9 +--
 arch/x86/kernel/cpu/resctrl/intel_aet.c |  2 +-
 arch/x86/kernel/cpu/resctrl/monitor.c   |  4 +-
 drivers/resctrl/mpam_resctrl.c          |  2 +-
 fs/resctrl/ctrlmondata.c                |  5 +-
 fs/resctrl/internal.h                   |  2 +
 fs/resctrl/monitor.c                    | 74 ++++++++++++++++---------
 fs/resctrl/rdtgroup.c                   | 34 ++++++------
 include/linux/resctrl.h                 |  9 ++-
 9 files changed, 84 insertions(+), 57 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 8842e3406ca5..f9fa9241bb16 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -433,12 +433,13 @@ static int domain_setup_ctrlval(struct rdt_resource *r, struct rdt_ctrl_domain *
  */
 static int l3_mon_domain_mbm_alloc(u32 num_rmid, struct rdt_hw_l3_mon_domain *hw_dom)
 {
+	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
 	size_t tsize = sizeof(*hw_dom->arch_mbm_states[0]);
 	enum resctrl_event_id eventid;
 	int idx;
 
 	for_each_mbm_event_id(eventid) {
-		if (!resctrl_is_mon_event_enabled(eventid))
+		if (!resctrl_is_mon_event_enabled(r, eventid))
 			continue;
 		idx = MBM_STATE_IDX(eventid);
 		hw_dom->arch_mbm_states[idx] = kcalloc(num_rmid, tsize, GFP_KERNEL);
@@ -969,15 +970,15 @@ static __init bool get_rdt_mon_resources(void)
 	bool ret = false;
 
 	if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
-		resctrl_enable_mon_event(QOS_OCCUP_EVENT_ID, false, 0, NULL);
+		resctrl_enable_mon_event(r, QOS_OCCUP_EVENT_ID, false, 0, NULL);
 		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL)) {
-		resctrl_enable_mon_event(QOS_MBM_TOTAL_EVENT_ID, false, 0, NULL);
+		resctrl_enable_mon_event(r, QOS_MBM_TOTAL_EVENT_ID, false, 0, NULL);
 		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL)) {
-		resctrl_enable_mon_event(QOS_MBM_LOCAL_EVENT_ID, false, 0, NULL);
+		resctrl_enable_mon_event(r, QOS_MBM_LOCAL_EVENT_ID, false, 0, NULL);
 		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_ABMC))
diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index 66cd8c2c7a51..a5978019a48c 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -290,7 +290,7 @@ static bool enable_events(struct event_group *e, struct pmt_feature_group *p)
 	}
 
 	for (int j = 0; j < e->num_events; j++) {
-		if (!resctrl_enable_mon_event(e->evts[j].id, true,
+		if (!resctrl_enable_mon_event(r, e->evts[j].id, true,
 					      e->evts[j].bin_bits, &e->evts[j]))
 			skipped_events++;
 	}
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 3838e0a13d36..b39950e08580 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -202,7 +202,7 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_l3_mon_domai
 	int idx;
 
 	for_each_mbm_event_id(eventid) {
-		if (!resctrl_is_mon_event_enabled(eventid))
+		if (!resctrl_is_mon_event_enabled(r, eventid))
 			continue;
 		idx = MBM_STATE_IDX(eventid);
 		memset(hw_dom->arch_mbm_states[idx], 0,
@@ -561,7 +561,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 	abmc_cfg.split.cntr_id = cntr_id;
 	abmc_cfg.split.bw_src = rmid;
 	if (assign)
-		abmc_cfg.split.bw_type = resctrl_get_mon_evt_cfg(evtid);
+		abmc_cfg.split.bw_type = resctrl_get_mon_evt_cfg(r, evtid);
 
 	smp_call_function_any(&d->hdr.cpu_mask, resctrl_abmc_config_one_amd, &abmc_cfg, 1);
 
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 2f1be12ec461..9779cef5dc04 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1382,7 +1382,7 @@ static int mpam_resctrl_monitor_init(struct rdt_resource *r,
 		r->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
 	}
 
-	if (!resctrl_enable_mon_event(type, false, 0, NULL))
+	if (!resctrl_enable_mon_event(r, type, false, 0, NULL))
 		return -EINVAL;
 
 	r->mon_capable = true;
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index c70a9939d126..2503970a1479 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -465,6 +465,7 @@ static int smp_mon_event_count(void *arg)
 ssize_t rdtgroup_mba_mbps_event_write(struct kernfs_open_file *of,
 				      char *buf, size_t nbytes, loff_t off)
 {
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	struct rdtgroup *rdtgrp;
 	int ret = 0;
 
@@ -484,12 +485,12 @@ ssize_t rdtgroup_mba_mbps_event_write(struct kernfs_open_file *of,
 	buf[nbytes - 1] = '\0';
 
 	if (!strcmp(buf, "mbm_local_bytes")) {
-		if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
+		if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
 			rdtgrp->mba_mbps_event = QOS_MBM_LOCAL_EVENT_ID;
 		else
 			ret = -EINVAL;
 	} else if (!strcmp(buf, "mbm_total_bytes")) {
-		if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
+		if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
 			rdtgrp->mba_mbps_event = QOS_MBM_TOTAL_EVENT_ID;
 		else
 			ret = -EINVAL;
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index e62a277dee85..0368e19df24a 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -85,6 +85,8 @@ struct mon_evt {
 
 extern struct mon_evt mon_event_all[QOS_NUM_EVENTS];
 
+bool resctrl_is_mon_event_enabled_any(enum resctrl_event_id eventid);
+
 #define for_each_mon_event(mevt) for (mevt = &mon_event_all[QOS_FIRST_EVENT];	\
 				      mevt < &mon_event_all[QOS_NUM_EVENTS]; mevt++)
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index b9c99c71f4f9..a19733fae36e 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -345,7 +345,7 @@ void free_rmid(u32 closid, u32 rmid)
 
 	entry = __rmid_entry(idx);
 
-	if (resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID))
+	if (resctrl_is_mon_event_enabled_any(QOS_OCCUP_EVENT_ID))
 		add_rmid_to_limbo(entry);
 	else
 		list_add_tail(&entry->list, &rmid_free_lru);
@@ -797,15 +797,16 @@ static void mbm_update_one_event(struct rdt_resource *r, struct rdt_l3_mon_domai
 static void mbm_update(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 		       struct rdtgroup *rdtgrp)
 {
+	enum resctrl_event_id evtid;
+
 	/*
 	 * This is protected from concurrent reads from user as both
 	 * the user and overflow handler hold the global mutex.
 	 */
-	if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
-		mbm_update_one_event(r, d, rdtgrp, QOS_MBM_TOTAL_EVENT_ID);
-
-	if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
-		mbm_update_one_event(r, d, rdtgrp, QOS_MBM_LOCAL_EVENT_ID);
+	for_each_mbm_event_id(evtid) {
+		if (resctrl_is_mon_event_enabled(r, evtid))
+			mbm_update_one_event(r, d, rdtgrp, evtid);
+	}
 }
 
 /*
@@ -1045,36 +1046,55 @@ struct mon_evt mon_event_all[QOS_NUM_EVENTS] = {
 	MON_EVENT(PMT_EVENT_PCNT,			"pcnt",			RDT_RESOURCE_PERF_PKG,	false),
 };
 
-bool resctrl_enable_mon_event(enum resctrl_event_id eventid, bool any_cpu,
+bool resctrl_enable_mon_event(struct rdt_resource *r,
+			      enum resctrl_event_id eventid, bool any_cpu,
 			      unsigned int binary_bits, void *arch_priv)
 {
+	struct mon_evt *mevt;
+
 	if (WARN_ON_ONCE(eventid < QOS_FIRST_EVENT || eventid >= QOS_NUM_EVENTS ||
 			 binary_bits > MAX_BINARY_BITS))
 		return false;
-	if (mon_event_all[eventid].enabled) {
-		pr_warn("Duplicate enable for event %d\n", eventid);
+
+	mevt = &mon_event_all[eventid];
+	if (mevt->enabled) {
+		pr_warn("Duplicate enable for event %d on resource %d\n",
+			eventid, r->rid);
 		return false;
 	}
-	if (binary_bits && !mon_event_all[eventid].is_floating_point) {
+	if (binary_bits && !mevt->is_floating_point) {
 		pr_warn("Event %d may not be floating point\n", eventid);
 		return false;
 	}
 
-	mon_event_all[eventid].any_cpu = any_cpu;
-	mon_event_all[eventid].binary_bits = binary_bits;
-	mon_event_all[eventid].arch_priv = arch_priv;
-	mon_event_all[eventid].enabled = true;
+	mevt->any_cpu = any_cpu;
+	mevt->binary_bits = binary_bits;
+	mevt->arch_priv = arch_priv;
+	mevt->enabled = true;
 
 	return true;
 }
 
-bool resctrl_is_mon_event_enabled(enum resctrl_event_id eventid)
+bool resctrl_is_mon_event_enabled(struct rdt_resource *r,
+				  enum resctrl_event_id eventid)
 {
 	return eventid >= QOS_FIRST_EVENT && eventid < QOS_NUM_EVENTS &&
 	       mon_event_all[eventid].enabled;
 }
 
-u32 resctrl_get_mon_evt_cfg(enum resctrl_event_id evtid)
+bool resctrl_is_mon_event_enabled_any(enum resctrl_event_id eventid)
+{
+	struct rdt_resource *r;
+
+	for_each_mon_capable_rdt_resource(r) {
+		if (resctrl_is_mon_event_enabled(r, eventid))
+			return true;
+	}
+
+	return false;
+}
+
+u32 resctrl_get_mon_evt_cfg(struct rdt_resource *r, enum resctrl_event_id evtid)
 {
 	return mon_event_all[evtid].evt_cfg;
 }
@@ -1210,7 +1230,7 @@ static void resctrl_reset_rmid_all(struct rdt_resource *r, struct rdt_l3_mon_dom
 	int idx;
 
 	for_each_mbm_event_id(evt) {
-		if (!resctrl_is_mon_event_enabled(evt))
+		if (!resctrl_is_mon_event_enabled(r, evt))
 			continue;
 		idx = MBM_STATE_IDX(evt);
 		memset(d->mbm_states[idx], 0, sizeof(*d->mbm_states[0]) * idx_limit);
@@ -1319,11 +1339,11 @@ void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
 	    !r->mon.mbm_assign_on_mkdir)
 		return;
 
-	if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
 		rdtgroup_assign_cntr_event(NULL, rdtgrp,
 					   &mon_event_all[QOS_MBM_TOTAL_EVENT_ID]);
 
-	if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
 		rdtgroup_assign_cntr_event(NULL, rdtgrp,
 					   &mon_event_all[QOS_MBM_LOCAL_EVENT_ID]);
 }
@@ -1377,11 +1397,11 @@ void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp)
 	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r))
 		return;
 
-	if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
 		rdtgroup_unassign_cntr_event(NULL, rdtgrp,
 					     &mon_event_all[QOS_MBM_TOTAL_EVENT_ID]);
 
-	if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
 		rdtgroup_unassign_cntr_event(NULL, rdtgrp,
 					     &mon_event_all[QOS_MBM_LOCAL_EVENT_ID]);
 }
@@ -1594,9 +1614,9 @@ ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of, char *buf,
 		 * Initialize the default memory transaction values for
 		 * total and local events.
 		 */
-		if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
+		if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
 			mon_event_all[QOS_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
-		if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
+		if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
 			mon_event_all[QOS_MBM_LOCAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask &
 									   (READS_TO_LOCAL_MEM |
 									    READS_TO_LOCAL_S_MEM |
@@ -1947,15 +1967,15 @@ int resctrl_l3_mon_resource_init(void)
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 	}
 
-	if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
 		mba_mbps_default_event = QOS_MBM_LOCAL_EVENT_ID;
-	else if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
+	else if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
 		mba_mbps_default_event = QOS_MBM_TOTAL_EVENT_ID;
 
 	if (r->mon.mbm_cntr_assignable) {
-		if (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID))
+		if (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID))
 			mon_event_all[QOS_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
-		if (resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID))
+		if (resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID))
 			mon_event_all[QOS_MBM_LOCAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask &
 									   (READS_TO_LOCAL_MEM |
 									    READS_TO_LOCAL_S_MEM |
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 92f0e3b68784..5804921c57c8 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -122,10 +122,10 @@ void rdt_staged_configs_clear(void)
 	}
 }
 
-static bool resctrl_is_mbm_enabled(void)
+static bool resctrl_is_mbm_enabled(struct rdt_resource *r)
 {
-	return (resctrl_is_mon_event_enabled(QOS_MBM_TOTAL_EVENT_ID) ||
-		resctrl_is_mon_event_enabled(QOS_MBM_LOCAL_EVENT_ID));
+	return (resctrl_is_mon_event_enabled(r, QOS_MBM_TOTAL_EVENT_ID) ||
+		resctrl_is_mon_event_enabled(r, QOS_MBM_LOCAL_EVENT_ID));
 }
 
 /*
@@ -191,7 +191,7 @@ static int closid_alloc(void)
 	lockdep_assert_held(&rdtgroup_mutex);
 
 	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) &&
-	    resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID)) {
+	    resctrl_is_mon_event_enabled_any(QOS_OCCUP_EVENT_ID)) {
 		cleanest_closid = resctrl_find_cleanest_closid();
 		if (cleanest_closid < 0)
 			return cleanest_closid;
@@ -2620,7 +2620,7 @@ static bool supports_mba_mbps(void)
 	struct rdt_resource *rmbm = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
 
-	return (resctrl_is_mbm_enabled() &&
+	return (resctrl_is_mbm_enabled(rmbm) &&
 		r->alloc_capable && is_mba_linear() &&
 		r->ctrl_scope == rmbm->mon_scope &&
 		!rmbm->mon.mbm_cntr_assignable);
@@ -3254,8 +3254,8 @@ static int rdt_get_tree(struct fs_context *fc)
 	if (resctrl_arch_alloc_capable() || resctrl_arch_mon_capable())
 		resctrl_mounted = true;
 
-	if (resctrl_is_mbm_enabled()) {
-		r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	if (resctrl_is_mbm_enabled(r)) {
 		list_for_each_entry_rcu(dom, &r->mon_domains, hdr.list, lockdep_is_cpus_held())
 			mbm_setup_overflow_handler(dom, MBM_OVERFLOW_INTERVAL,
 						   RESCTRL_PICK_ANY_CPU);
@@ -4559,9 +4559,9 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 	if (r->rid == RDT_RESOURCE_L3 &&
 	    domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3)) {
 		d = container_of(hdr, struct rdt_l3_mon_domain, hdr);
-		if (resctrl_is_mbm_enabled())
+		if (resctrl_is_mbm_enabled(r))
 			cancel_delayed_work_sync(&d->mbm_over);
-		if (resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID))
+		if (resctrl_is_mon_event_enabled(r, QOS_OCCUP_EVENT_ID))
 			cancel_delayed_work_sync(&d->cqm_limbo);
 	}
 
@@ -4581,7 +4581,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 		goto out_unlock;
 
 	d = container_of(hdr, struct rdt_l3_mon_domain, hdr);
-	if (resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID) && has_busy_rmid(d)) {
+	if (resctrl_is_mon_event_enabled(r, QOS_OCCUP_EVENT_ID) && has_busy_rmid(d)) {
 		/*
 		 * When a package is going down, forcefully
 		 * decrement rmid->ebusy. There is no way to know
@@ -4624,14 +4624,14 @@ static int domain_setup_l3_mon_state(struct rdt_resource *r, struct rdt_l3_mon_d
 	enum resctrl_event_id eventid;
 	int idx;
 
-	if (resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID)) {
+	if (resctrl_is_mon_event_enabled(r, QOS_OCCUP_EVENT_ID)) {
 		d->rmid_busy_llc = bitmap_zalloc(idx_limit, GFP_KERNEL);
 		if (!d->rmid_busy_llc)
 			return -ENOMEM;
 	}
 
 	for_each_mbm_event_id(eventid) {
-		if (!resctrl_is_mon_event_enabled(eventid))
+		if (!resctrl_is_mon_event_enabled(r, eventid))
 			continue;
 		idx = MBM_STATE_IDX(eventid);
 		d->mbm_states[idx] = kcalloc(idx_limit, tsize, GFP_KERNEL);
@@ -4639,7 +4639,7 @@ static int domain_setup_l3_mon_state(struct rdt_resource *r, struct rdt_l3_mon_d
 			goto cleanup;
 	}
 
-	if (resctrl_is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
+	if (resctrl_is_mbm_enabled(r) && r->mon.mbm_cntr_assignable) {
 		tsize = sizeof(*d->cntr_cfg);
 		d->cntr_cfg = kcalloc(r->mon.num_mbm_cntrs, tsize, GFP_KERNEL);
 		if (!d->cntr_cfg)
@@ -4691,13 +4691,13 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *hdr
 	if (err)
 		goto out_unlock;
 
-	if (resctrl_is_mbm_enabled()) {
+	if (resctrl_is_mbm_enabled(r)) {
 		INIT_DELAYED_WORK(&d->mbm_over, mbm_handle_overflow);
 		mbm_setup_overflow_handler(d, MBM_OVERFLOW_INTERVAL,
 					   RESCTRL_PICK_ANY_CPU);
 	}
 
-	if (resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(r, QOS_OCCUP_EVENT_ID))
 		INIT_DELAYED_WORK(&d->cqm_limbo, cqm_handle_limbo);
 
 mkdir:
@@ -4770,13 +4770,13 @@ void resctrl_offline_cpu(unsigned int cpu)
 
 	d = get_mon_domain_from_cpu(cpu, l3);
 	if (d) {
-		if (resctrl_is_mbm_enabled() && cpu == d->mbm_work_cpu) {
+		if (resctrl_is_mbm_enabled(l3) && cpu == d->mbm_work_cpu) {
 			mutex_unlock(&rdtgroup_mutex);
 			cancel_delayed_work_sync(&d->mbm_over);
 			mutex_lock(&rdtgroup_mutex);
 			mbm_setup_overflow_handler(d, 0, cpu);
 		}
-		if (resctrl_is_mon_event_enabled(QOS_OCCUP_EVENT_ID) &&
+		if (resctrl_is_mon_event_enabled(l3, QOS_OCCUP_EVENT_ID) &&
 		    cpu == d->cqm_work_cpu && has_busy_rmid(d)) {
 			mutex_unlock(&rdtgroup_mutex);
 			cancel_delayed_work_sync(&d->cqm_limbo);
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index c844f99fb824..0a60372299c5 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -419,10 +419,12 @@ u32 resctrl_arch_get_num_closid(struct rdt_resource *r);
 u32 resctrl_arch_system_num_rmid_idx(void);
 int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid);
 
-bool resctrl_enable_mon_event(enum resctrl_event_id eventid, bool any_cpu,
+bool resctrl_enable_mon_event(struct rdt_resource *r,
+			      enum resctrl_event_id eventid, bool any_cpu,
 			      unsigned int binary_bits, void *arch_priv);
 
-bool resctrl_is_mon_event_enabled(enum resctrl_event_id eventid);
+bool resctrl_is_mon_event_enabled(struct rdt_resource *r,
+				  enum resctrl_event_id eventid);
 
 bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt);
 
@@ -432,7 +434,8 @@ static inline bool resctrl_is_mbm_event(enum resctrl_event_id eventid)
 		eventid <= QOS_MBM_LOCAL_EVENT_ID);
 }
 
-u32 resctrl_get_mon_evt_cfg(enum resctrl_event_id eventid);
+u32 resctrl_get_mon_evt_cfg(struct rdt_resource *r,
+			    enum resctrl_event_id eventid);
 
 /* Iterate over all memory bandwidth events */
 #define for_each_mbm_event_id(eventid)				\
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6326F4BB6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 18:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSCW4eYSdBUrIRoaypB/6woJVIFXjzWUkwFo48mEUoY=; b=e2QByvddke9K8orG3IBsgsvCBc
	U4f5pnYnItAgeDiDAb4UbfkMqcOt2npBE1xEhYv2D7IGhCe4DmcSd+mgON6uJtZZmc3N4nRjMNqfC
	VXiwPcmS+n+emlGI9yVfUjue6+BeVS2sk5Krl3rke4aRPj02a8RAVE3O/q6/OOvFI2vdxDosAt4zP
	bY7A3whQeOW5V0dj3rPhkkCko9/RX2yU3J30jOCQC8Tmbr98Iy2HcvJXH+o7hxEp+gTAKpzpV1VhX
	9ekJ6Odd9E+i4Ph4ATocBt4eRl4czIDm+lcdf71Sr8n+xMU9J43XGyyBf5aoVY3e6nguty+HxMzuB
	7ULOwa0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwhW-00000002Z89-0P69;
	Tue, 24 Feb 2026 18:00:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwhP-00000002Yzf-2sSH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:59:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA97F1595;
	Tue, 24 Feb 2026 09:59:48 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 400603F59E;
	Tue, 24 Feb 2026 09:59:44 -0800 (PST)
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
	kvmarm@lists.linux.dev,
	zengheng4@huawei.com,
	linux-doc@vger.kernel.org
Subject: [PATCH v5 26/41] arm_mpam: resctrl: Add monitor initialisation and domain boilerplate
Date: Tue, 24 Feb 2026 17:57:05 +0000
Message-ID: <20260224175720.2663924-27-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224175720.2663924-1-ben.horgan@arm.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_095955_865190_221D78D5 
X-CRM114-Status: GOOD (  23.21  )
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

Add the boilerplate that tells resctrl about the mpam monitors that are
available. resctrl expects all (non-telemetry) monitors to be on the L3 and
so advertise them there and invent an L3 resctrl resource if required. The
L3 cache itself has to exist as the cache ids are used as the domain
ids.

Bring the resctrl monitor domains online and offline based on the cpus
they contain.

Support for specific monitor types is left to later.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
New patch but mostly moved from the existing patches to
separate the monitors from the controls and the boilerplate
from the specific counters.
Use l3->mon_capable in resctrl_arch_mon_capable() as
resctrl_enable_mon_event() now returns a bool.
---
 drivers/resctrl/mpam_internal.h |   7 ++
 drivers/resctrl/mpam_resctrl.c  | 142 +++++++++++++++++++++++++++++---
 2 files changed, 139 insertions(+), 10 deletions(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 57c3d9b962b9..472bd5d27baa 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -341,6 +341,7 @@ struct mpam_msc_ris {
 struct mpam_resctrl_dom {
 	struct mpam_component		*ctrl_comp;
 	struct rdt_ctrl_domain		resctrl_ctrl_dom;
+	struct rdt_l3_mon_domain	resctrl_mon_dom;
 };
 
 struct mpam_resctrl_res {
@@ -349,6 +350,12 @@ struct mpam_resctrl_res {
 	bool			cdp_enabled;
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
index 29efcad163e6..c14e59e8586d 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -34,6 +34,23 @@ static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
 	     rid < RDT_NUM_RESOURCES;						\
 	     rid++, res = &mpam_resctrl_controls[rid])
 
+/*
+ * The classes we've picked to map to resctrl events.
+ * Resctrl believes all the worlds a Xeon, and these are all on the L3. This
+ * array lets us find the actual class backing the event counters. e.g.
+ * the only memory bandwidth counters may be on the memory controller, but to
+ * make use of them, we pretend they are on L3. Restrict the events considered
+ * to those supported by MPAM.
+ * Class pointer may be NULL.
+ */
+#define MPAM_MAX_EVENT QOS_L3_MBM_TOTAL_EVENT_ID
+static struct mpam_resctrl_mon mpam_resctrl_counters[MPAM_MAX_EVENT + 1];
+
+#define for_each_mpam_resctrl_mon(mon, eventid)					\
+	for (eventid = QOS_FIRST_EVENT, mon = &mpam_resctrl_counters[eventid];	\
+	     eventid <= MPAM_MAX_EVENT;						\
+	     eventid++, mon = &mpam_resctrl_counters[eventid])
+
 /* The lock for modifying resctrl's domain lists from cpuhp callbacks. */
 static DEFINE_MUTEX(domain_list_lock);
 
@@ -63,6 +80,15 @@ bool resctrl_arch_alloc_capable(void)
 	return false;
 }
 
+bool resctrl_arch_mon_capable(void)
+{
+	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
+	struct rdt_resource *l3 = &res->resctrl_res;
+
+	/* All monitors are presented as being on the L3 cache */
+	return l3->mon_capable;
+}
+
 bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
 {
 	return mpam_resctrl_controls[rid].cdp_enabled;
@@ -651,6 +677,57 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
 	return comp->comp_id;
 }
 
+static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
+				     enum resctrl_event_id type)
+{
+	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
+	struct rdt_resource *l3 = &res->resctrl_res;
+
+	lockdep_assert_cpus_held();
+
+	/*
+	 * There also needs to be an L3 cache present.
+	 * The check just requires any online CPU and it can't go offline as we
+	 * hold the cpu lock.
+	 */
+	if (get_cpu_cacheinfo_id(raw_smp_processor_id(), 3) == -1)
+		return 0;
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
+	/*
+	 * Called multiple times!, once per event type that has a
+	 * monitoring class.
+	 * Setting name is necessary on monitor only platforms.
+	 */
+	l3->name = "L3";
+	l3->mon_scope = RESCTRL_L3_CACHE;
+
+	/*
+	 * num-rmid is the upper bound for the number of monitoring
+	 * groups that can exist simultaneously, including the
+	 * default monitoring group for each control group. Hence,
+	 * advertise the whole rmid_idx space even though each
+	 * control group has its own pmg/rmid space. Unfortunately,
+	 * this does mean userspace needs to know the architecture
+	 * to correctly interpret this value.
+	 */
+	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+
+	if (resctrl_enable_mon_event(type, false, 0, NULL))
+		l3->mon_capable = true;
+
+	return 0;
+}
+
 u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 			    u32 closid, enum resctrl_conf_type type)
 {
@@ -883,6 +960,7 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 {
 	int err;
 	struct mpam_resctrl_dom *dom;
+	struct rdt_l3_mon_domain *mon_d;
 	struct rdt_ctrl_domain *ctrl_d;
 	struct mpam_class *class = res->class;
 	struct mpam_component *comp_iter, *ctrl_comp;
@@ -922,6 +1000,20 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 	} else {
 		pr_debug("Skipped control domain online - no controls\n");
 	}
+
+	if (resctrl_arch_mon_capable()) {
+		mon_d = &dom->resctrl_mon_dom;
+		mpam_resctrl_domain_hdr_init(cpu, any_mon_comp, r->rid, &mon_d->hdr);
+		mon_d->hdr.type = RESCTRL_MON_DOMAIN;
+		err = resctrl_online_mon_domain(r, &mon_d->hdr);
+		if (err)
+			goto offline_ctrl_domain;
+
+		mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);
+	} else {
+		pr_debug("Skipped monitor domain online - no monitors\n");
+	}
+
 	return dom;
 
 offline_ctrl_domain:
@@ -973,6 +1065,11 @@ int mpam_resctrl_online_cpu(unsigned int cpu)
 
 				mpam_resctrl_online_domain_hdr(cpu, &ctrl_d->hdr);
 			}
+			if (resctrl_arch_mon_capable()) {
+				struct rdt_l3_mon_domain *mon_d = &dom->resctrl_mon_dom;
+
+				mpam_resctrl_online_domain_hdr(cpu, &mon_d->hdr);
+			}
 		}
 		if (IS_ERR(dom))
 			return PTR_ERR(dom);
@@ -993,8 +1090,9 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
 	guard(mutex)(&domain_list_lock);
 	for_each_mpam_resctrl_control(res, rid) {
 		struct mpam_resctrl_dom *dom;
+		struct rdt_l3_mon_domain *mon_d;
 		struct rdt_ctrl_domain *ctrl_d;
-		bool ctrl_dom_empty;
+		bool ctrl_dom_empty, mon_dom_empty;
 
 		if (!res->class)
 			continue;	// dummy resource
@@ -1012,7 +1110,16 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
 			ctrl_dom_empty = true;
 		}
 
-		if (ctrl_dom_empty)
+		if (resctrl_arch_mon_capable()) {
+			mon_d = &dom->resctrl_mon_dom;
+			mon_dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &mon_d->hdr);
+			if (mon_dom_empty)
+				resctrl_offline_mon_domain(&res->resctrl_res, &mon_d->hdr);
+		} else {
+			mon_dom_empty = true;
+		}
+
+		if (ctrl_dom_empty && mon_dom_empty)
 			kfree(dom);
 	}
 }
@@ -1022,12 +1129,15 @@ int mpam_resctrl_setup(void)
 	int err = 0;
 	struct mpam_resctrl_res *res;
 	enum resctrl_res_level rid;
+	struct mpam_resctrl_mon *mon;
+	enum resctrl_event_id eventid;
 
 	wait_event(wait_cacheinfo_ready, cacheinfo_ready);
 
 	cpus_read_lock();
 	for_each_mpam_resctrl_control(res, rid) {
 		INIT_LIST_HEAD_RCU(&res->resctrl_res.ctrl_domains);
+		INIT_LIST_HEAD_RCU(&res->resctrl_res.mon_domains);
 		res->resctrl_res.rid = rid;
 	}
 
@@ -1043,25 +1153,37 @@ int mpam_resctrl_setup(void)
 		err = mpam_resctrl_control_init(res);
 		if (err) {
 			pr_debug("Failed to initialise rid %u\n", rid);
-			break;
+			goto internal_error;
 		}
 	}
-	cpus_read_unlock();
 
-	if (err) {
-		pr_debug("Internal error %d - resctrl not supported\n", err);
-		return err;
+	for_each_mpam_resctrl_mon(mon, eventid) {
+		if (!mon->class)
+			continue;	// dummy resource
+
+		err = mpam_resctrl_monitor_init(mon, eventid);
+		if (err) {
+			pr_debug("Failed to initialise event %u\n", eventid);
+			goto internal_error;
+		}
 	}
 
-	if (!resctrl_arch_alloc_capable()) {
-		pr_debug("No alloc(%u) found - resctrl not supported\n",
-			 resctrl_arch_alloc_capable());
+	cpus_read_unlock();
+
+	if (!resctrl_arch_alloc_capable() && !resctrl_arch_mon_capable()) {
+		pr_debug("No alloc(%u) or monitor(%u) found - resctrl not supported\n",
+			 resctrl_arch_alloc_capable(), resctrl_arch_mon_capable());
 		return -EOPNOTSUPP;
 	}
 
 	/* TODO: call resctrl_init() */
 
 	return 0;
+
+internal_error:
+	cpus_read_unlock();
+	pr_debug("Internal error %d - resctrl not supported\n", err);
+	return err;
 }
 
 static int __init __cacheinfo_ready(void)
-- 
2.43.0



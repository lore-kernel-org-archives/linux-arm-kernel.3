Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F2BD374B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5C0bcpK/gABDLDEb9SSU7Qvc1CaV71jT8k95UDL4pd4=; b=TSz/uexvD3ZtZeSMuLK2jvKS6H
	hMVKqn+WE4bC65bztKcVkbviJsZliZec+CuCG7KuBEFGS6are7ePiWcSVQ3DQaUgbWww8Ii3theth
	hbKF5Hi2cFN6Yp5iymAtqk7BAdwePhyO2tnjEBU2JCmR+LfRPCpdtYU1SkXeoLTg8eCiL0Dq6R64S
	0kiBaTHkLwg1tZ0rG6BJdxN3LUtNFDf+ofdf9A8ZUgxtKKhmwR5XjJr5d/m9yQsda5pdMrwjOGj1z
	lXccPwkXQ7IrGvdrGAISPWMDdf74VJzF0RDFFHIIwoSZWPJ1Apl0CZRq2qCozQfO+eFN5wiOYNesg
	aoiV/ljg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdrq-0000000A6tq-3Qys;
	Fri, 05 Dec 2025 22:01:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdrn-0000000A6oG-3VTA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 22:01:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB6F21AC1;
	Fri,  5 Dec 2025 14:01:22 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89EBB3F740;
	Fri,  5 Dec 2025 14:01:26 -0800 (PST)
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
Subject: [RFC PATCH 30/38] arm_mpam: resctrl: Call resctrl_exit() in the event of errors
Date: Fri,  5 Dec 2025 21:58:53 +0000
Message-Id: <20251205215901.17772-31-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_140132_181549_742D9E12 
X-CRM114-Status: GOOD (  24.16  )
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

All of MPAMs errors indicate a software bug, e.g. an out-of-bounds
partid has been generated. When this happens, the mpam driver
is disabled.

If resctrl_init() succeeded, also call resctrl_exit() to
remove resctrl.

mpam_devices.c calls mpam_resctrl_teardown_class() when a class
becomes incomplete, and can no longer be used by resctrl. If
resctrl was using this class, then resctrl_exit() is called.
This in turn removes the kernfs hierarchy from the filesystem
and free()s memory that was allocated by resctrl.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c  | 32 +++++++++++--
 drivers/resctrl/mpam_internal.h |  4 ++
 drivers/resctrl/mpam_resctrl.c  | 80 +++++++++++++++++++++++++++++++++
 3 files changed, 112 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index fccebfd980d8..1334093fc03e 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -73,6 +73,14 @@ static DECLARE_WORK(mpam_broken_work, &mpam_disable);
 /* When mpam is disabled, the printed reason to aid debugging */
 static char *mpam_disable_reason;
 
+/*
+ * Whether resctrl has been setup. Used by cpuhp in preference to
+ * mpam_is_enabled(). The disable call after an error interrupt makes
+ * mpam_is_enabled() false before the cpuhp callbacks are made.
+ * Reads/writes should hold mpam_cpuhp_state_lock, (or be cpuhp callbacks).
+ */
+static bool mpam_resctrl_enabled;
+
 /*
  * An MSC is a physical container for controls and monitors, each identified by
  * their RIS index. These share a base-address, interrupts and some MMIO
@@ -1627,7 +1635,7 @@ static int mpam_cpu_online(unsigned int cpu)
 			mpam_reprogram_msc(msc);
 	}
 
-	if (mpam_is_enabled())
+	if (mpam_resctrl_enabled)
 		mpam_resctrl_online_cpu(cpu);
 
 	return 0;
@@ -1673,7 +1681,7 @@ static int mpam_cpu_offline(unsigned int cpu)
 {
 	struct mpam_msc *msc;
 
-	if (mpam_is_enabled())
+	if (mpam_resctrl_enabled)
 		mpam_resctrl_offline_cpu(cpu);
 
 	guard(srcu)(&mpam_srcu);
@@ -2535,6 +2543,7 @@ static void mpam_enable_once(void)
 	}
 
 	static_branch_enable(&mpam_enabled);
+	mpam_resctrl_enabled = true;
 	mpam_register_cpuhp_callbacks(mpam_cpu_online, mpam_cpu_offline,
 				      "mpam:online");
 
@@ -2594,24 +2603,39 @@ void mpam_reset_class(struct mpam_class *class)
 void mpam_disable(struct work_struct *ignored)
 {
 	int idx;
+	bool do_resctrl_exit;
 	struct mpam_class *class;
 	struct mpam_msc *msc, *tmp;
 
+	if (mpam_is_enabled())
+		static_branch_disable(&mpam_enabled);
+
 	mutex_lock(&mpam_cpuhp_state_lock);
 	if (mpam_cpuhp_state) {
 		cpuhp_remove_state(mpam_cpuhp_state);
 		mpam_cpuhp_state = 0;
 	}
+
+	/*
+	 * Removing the cpuhp state called mpam_cpu_offline() and told resctrl
+	 * all the CPUs are offline.
+	 */
+	do_resctrl_exit = mpam_resctrl_enabled;
+	mpam_resctrl_enabled = false;
 	mutex_unlock(&mpam_cpuhp_state_lock);
 
-	static_branch_disable(&mpam_enabled);
+	if (do_resctrl_exit)
+		mpam_resctrl_exit();
 
 	mpam_unregister_irqs();
 
 	idx = srcu_read_lock(&mpam_srcu);
 	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
-				 srcu_read_lock_held(&mpam_srcu))
+				 srcu_read_lock_held(&mpam_srcu)) {
 		mpam_reset_class(class);
+		if (do_resctrl_exit)
+			mpam_resctrl_teardown_class(class);
+	}
 	srcu_read_unlock(&mpam_srcu, idx);
 
 	mutex_lock(&mpam_list_lock);
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 3a68ebd498fa..b13d5e55e701 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -450,12 +450,16 @@ int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
 
 #ifdef CONFIG_RESCTRL_FS
 int mpam_resctrl_setup(void);
+void mpam_resctrl_exit(void);
 int mpam_resctrl_online_cpu(unsigned int cpu);
 void mpam_resctrl_offline_cpu(unsigned int cpu);
+void mpam_resctrl_teardown_class(struct mpam_class *class);
 #else
 static inline int mpam_resctrl_setup(void) { return 0; }
+static inline void mpam_resctrl_exit(void) { }
 static inline int mpam_resctrl_online_cpu(unsigned int cpu) { return 0; }
 static inline void mpam_resctrl_offline_cpu(unsigned int cpu) { }
+static inline void mpam_resctrl_teardown_class(struct mpam_class *class) { }
 #endif /* CONFIG_RESCTRL_FS */
 
 /*
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index eb3caee45470..506063bd3348 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -52,6 +52,12 @@ static bool exposed_mon_capable;
  */
 static bool cdp_enabled;
 
+/*
+ * If resctrl_init() succeeded, resctrl_exit() can be used to remove support
+ * for the filesystem in the event of an error.
+ */
+static bool resctrl_enabled;
+
 /*
  * L3 local/total may come from different classes - what is the number of MBWU
  * 'on L3'?
@@ -310,6 +316,9 @@ static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid)
 {
 	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
 
+	if (!mpam_is_enabled())
+		return -EINVAL;
+
 	if (!mon->class)
 		return -EINVAL;
 
@@ -352,6 +361,9 @@ static void resctrl_arch_mon_ctx_free_no_wait(enum resctrl_event_id evtid,
 {
 	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
 
+	if (!mpam_is_enabled())
+		return;
+
 	if (!mon->class)
 		return;
 
@@ -449,6 +461,9 @@ int resctrl_arch_rmid_read(struct rdt_resource	*r, struct rdt_mon_domain *d,
 
 	resctrl_arch_rmid_read_context_check();
 
+	if (!mpam_is_enabled())
+		return -EINVAL;
+
 	if (eventid >= QOS_NUM_EVENTS || !mon->class)
 		return -EINVAL;
 
@@ -1343,6 +1358,9 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	lockdep_assert_cpus_held();
 	lockdep_assert_irqs_enabled();
 
+	if (!mpam_is_enabled())
+		return -EINVAL;
+
 	/*
 	 * No need to check the CPU as mpam_apply_config() doesn't care, and
 	 * resctrl_arch_update_domains() relies on this.
@@ -1408,6 +1426,9 @@ int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
 	lockdep_assert_cpus_held();
 	lockdep_assert_irqs_enabled();
 
+	if (!mpam_is_enabled())
+		return -EINVAL;
+
 	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
 		for (t = 0; t < CDP_NUM_TYPES; t++) {
 			cfg = &d->staged_config[t];
@@ -1769,11 +1790,70 @@ int mpam_resctrl_setup(void)
 		}
 
 		err = resctrl_init();
+		if (!err)
+			WRITE_ONCE(resctrl_enabled, true);
 	}
 
 	return err;
 }
 
+void mpam_resctrl_exit(void)
+{
+	if (!READ_ONCE(resctrl_enabled))
+		return;
+
+	WRITE_ONCE(resctrl_enabled, false);
+	resctrl_exit();
+}
+
+static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct mpam_class *class)
+{
+	u32 num_mbwu_mon = l3_num_allocated_mbwu;
+
+	if (!mon->mbwu_idx_to_mon)
+		return;
+
+	if (mon->assigned_counters) {
+		__free_mbwu_mon(class, mon->assigned_counters, num_mbwu_mon);
+		mon->assigned_counters = NULL;
+		kfree(mon->mbwu_idx_to_mon);
+	} else {
+		__free_mbwu_mon(class, mon->mbwu_idx_to_mon, num_mbwu_mon);
+	}
+	mon->mbwu_idx_to_mon = NULL;
+}
+
+/*
+ * The driver is detaching an MSC from this class, if resctrl was using it,
+ * pull on resctrl_exit().
+ */
+void mpam_resctrl_teardown_class(struct mpam_class *class)
+{
+	int i;
+	struct mpam_resctrl_res *res;
+	struct mpam_resctrl_mon *mon;
+
+	might_sleep();
+
+	for (i = 0; i < RDT_NUM_RESOURCES; i++) {
+		res = &mpam_resctrl_controls[i];
+		if (res->class == class) {
+			res->class = NULL;
+			break;
+		}
+	}
+	for (i = 0; i < QOS_NUM_EVENTS; i++) {
+		mon = &mpam_resctrl_counters[i];
+		if (mon->class == class) {
+			mon->class = NULL;
+
+			mpam_resctrl_teardown_mon(mon, class);
+
+			break;
+		}
+	}
+}
+
 #ifdef CONFIG_MPAM_KUNIT_TEST
 #include "test_mpam_resctrl.c"
 #endif
-- 
2.39.5



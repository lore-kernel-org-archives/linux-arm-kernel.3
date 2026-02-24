Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01820F4BB6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 18:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKKI+isea8vPm7ii47Zr5aCC+yIVG6SGQ9nnVtLhJGk=; b=GpuNlNU1eDurkyQej8LREB0gJi
	G+xLwggIwIrEhYTeDplMDTtxoFm2dp4MhiaufNC64uP1a4ZUmbU1upMLrrEjJ2wBM8Bll9Kzqr5ZF
	NciwGTkW6/ljLYk6ptaCIIA45K11QLdwrCrTEcFCQ7O0Dt6dYobDiwBFA69Fv5OMI2g8Opd1es7DT
	Hgp6+U8Y5ZwYPGO+U4tWHR5+g0qTFPoi9hnC/N5nGOW0sgKQa/S7rlBvZKS5mAuE3IbdqWfyaY8bQ
	nrvyveu/snkM5Yv8zgIb+xRniHfm/uSwAYQiZdIWNXteDSY++UoCn8n9dUagAAvGnceCn8htZIDYx
	KeKsvixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwhQ-00000002Z1Q-2hwP;
	Tue, 24 Feb 2026 17:59:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwhF-00000002Ykw-1z9g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:59:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBF77339;
	Tue, 24 Feb 2026 09:59:37 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 193B13F59E;
	Tue, 24 Feb 2026 09:59:38 -0800 (PST)
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
	linux-doc@vger.kernel.org,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Dave Martin <Dave.Martin@arm.com>
Subject: [PATCH v5 25/41] arm_mpam: resctrl: Add support for 'MB' resource
Date: Tue, 24 Feb 2026 17:57:04 +0000
Message-ID: <20260224175720.2663924-26-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224175720.2663924-1-ben.horgan@arm.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_095945_667196_E7F922F8 
X-CRM114-Status: GOOD (  35.69  )
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

resctrl supports 'MB', as a percentage throttling of traffic from the
L3. This is the control that mba_sc uses, so ideally the class chosen
should be as close as possible to the counters used for mbm_total. If
there is a single L3 and the topology of the memory matches then the
traffic at the memory controller will be equivalent to that at egress of
the L3. If these conditions are met allow the memory class to back MB.

MB's percentage control should be backed either with the fixed point
fraction MBW_MAX or bandwidth portion bitmaps. The bandwidth portion
bitmaps is not used as its tricky to pick which bits to use to avoid
contention, and may be possible to expose this as something other than a
percentage in the future.

Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Co-developed-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v2:
Code flow change
Commit message 'or'

Changes since v3:
initialise tmp_cpumask
update commit message
check the traffic matches l3
update comment on candidate_class update, only mbm_total
drop tags due to rework

Changes since v4:
Move __free declarations to point of first use
New line for a '{'
set r->alloc_capable last (Reinette)
---
 drivers/resctrl/mpam_resctrl.c | 275 ++++++++++++++++++++++++++++++++-
 1 file changed, 274 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index fc5877eb5970..29efcad163e6 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -252,6 +252,33 @@ static bool cache_has_usable_cpor(struct mpam_class *class)
 	return class->props.cpbm_wd <= 32;
 }
 
+static bool mba_class_use_mbw_max(struct mpam_props *cprops)
+{
+	return (mpam_has_feature(mpam_feat_mbw_max, cprops) &&
+		cprops->bwa_wd);
+}
+
+static bool class_has_usable_mba(struct mpam_props *cprops)
+{
+	return mba_class_use_mbw_max(cprops);
+}
+
+/*
+ * Calculate the worst-case percentage change from each implemented step
+ * in the control.
+ */
+static u32 get_mba_granularity(struct mpam_props *cprops)
+{
+	if (!mba_class_use_mbw_max(cprops))
+		return 0;
+
+	/*
+	 * bwa_wd is the number of bits implemented in the 0.xxx
+	 * fixed point fraction. 1 bit is 50%, 2 is 25% etc.
+	 */
+	return DIV_ROUND_UP(MAX_MBA_BW, 1 << cprops->bwa_wd);
+}
+
 /*
  * Each fixed-point hardware value architecturally represents a range
  * of values: the full range 0% - 100% is split contiguously into
@@ -302,6 +329,154 @@ static u16 percent_to_mbw_max(u8 pc, struct mpam_props *cprops)
 	return val;
 }
 
+static u32 get_mba_min(struct mpam_props *cprops)
+{
+	if (!mba_class_use_mbw_max(cprops)) {
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+
+	return mbw_max_to_percent(0, cprops);
+}
+
+/* Find the L3 cache that has affinity with this CPU */
+static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
+{
+	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
+
+	lockdep_assert_cpus_held();
+
+	return mpam_get_cpumask_from_cache_id(cache_id, 3, tmp_cpumask);
+}
+
+/*
+ * topology_matches_l3() - Is the provided class the same shape as L3
+ * @victim:		The class we'd like to pretend is L3.
+ *
+ * resctrl expects all the world's a Xeon, and all counters are on the
+ * L3. We allow some mapping counters on other classes. This requires
+ * that the CPU->domain mapping is the same kind of shape.
+ *
+ * Using cacheinfo directly would make this work even if resctrl can't
+ * use the L3 - but cacheinfo can't tell us anything about offline CPUs.
+ * Using the L3 resctrl domain list also depends on CPUs being online.
+ * Using the mpam_class we picked for L3 so we can use its domain list
+ * assumes that there are MPAM controls on the L3.
+ * Instead, this path eventually uses the mpam_get_cpumask_from_cache_id()
+ * helper which can tell us about offline CPUs ... but getting the cache_id
+ * to start with relies on at least one CPU per L3 cache being online at
+ * boot.
+ *
+ * Walk the victim component list and compare the affinity mask with the
+ * corresponding L3. The topology matches if each victim:component's affinity
+ * mask is the same as the CPU's corresponding L3's. These lists/masks are
+ * computed from firmware tables so don't change at runtime.
+ */
+static bool topology_matches_l3(struct mpam_class *victim)
+{
+	int cpu, err;
+	struct mpam_component *victim_iter;
+
+	lockdep_assert_cpus_held();
+
+	cpumask_var_t __free(free_cpumask_var) tmp_cpumask = CPUMASK_VAR_NULL;
+	if (!alloc_cpumask_var(&tmp_cpumask, GFP_KERNEL))
+		return false;
+
+	guard(srcu)(&mpam_srcu);
+	list_for_each_entry_srcu(victim_iter, &victim->components, class_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		if (cpumask_empty(&victim_iter->affinity)) {
+			pr_debug("class %u has CPU-less component %u - can't match L3!\n",
+				 victim->level, victim_iter->comp_id);
+			return false;
+		}
+
+		cpu = cpumask_any_and(&victim_iter->affinity, cpu_online_mask);
+		if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
+			return false;
+
+		cpumask_clear(tmp_cpumask);
+		err = find_l3_equivalent_bitmask(cpu, tmp_cpumask);
+		if (err) {
+			pr_debug("Failed to find L3's equivalent component to class %u component %u\n",
+				 victim->level, victim_iter->comp_id);
+			return false;
+		}
+
+		/* Any differing bits in the affinity mask? */
+		if (!cpumask_equal(tmp_cpumask, &victim_iter->affinity)) {
+			pr_debug("class %u component %u has Mismatched CPU mask with L3 equivalent\n"
+				 "L3:%*pbl != victim:%*pbl\n",
+				 victim->level, victim_iter->comp_id,
+				 cpumask_pr_args(tmp_cpumask),
+				 cpumask_pr_args(&victim_iter->affinity));
+
+			return false;
+		}
+	}
+
+	return true;
+}
+
+/*
+ * Test if the traffic for a class matches that at egress from the L3. For
+ * MSC at memory controllers this is only possible if there is a single L3
+ * as otherwise the counters at the memory can include bandwidth from the
+ * non-local L3.
+ */
+static bool traffic_matches_l3(struct mpam_class *class)
+{
+	int err, cpu;
+
+	lockdep_assert_cpus_held();
+
+	if (class->type == MPAM_CLASS_CACHE && class->level == 3)
+		return true;
+
+	if (class->type == MPAM_CLASS_CACHE && class->level != 3) {
+		pr_debug("class %u is a different cache from L3\n", class->level);
+		return false;
+	}
+
+	if (class->type != MPAM_CLASS_MEMORY) {
+		pr_debug("class %u is neither of type cache or memory\n", class->level);
+		return false;
+	}
+
+	cpumask_var_t __free(free_cpumask_var) tmp_cpumask = CPUMASK_VAR_NULL;
+	if (!alloc_cpumask_var(&tmp_cpumask, GFP_KERNEL)) {
+		pr_debug("cpumask allocation failed\n");
+		return false;
+	}
+
+	if (class->type != MPAM_CLASS_MEMORY) {
+		pr_debug("class %u is neither of type cache or memory\n",
+			 class->level);
+		return false;
+	}
+
+	cpu = cpumask_any_and(&class->affinity, cpu_online_mask);
+	err = find_l3_equivalent_bitmask(cpu, tmp_cpumask);
+	if (err) {
+		pr_debug("Failed to find L3 downstream to cpu %d\n", cpu);
+		return false;
+	}
+
+	if (!cpumask_equal(tmp_cpumask, cpu_possible_mask)) {
+		pr_debug("There is more than one L3\n");
+		return false;
+	}
+
+	/* Be strict; the traffic might stop in the intermediate cache. */
+	if (get_cpu_cacheinfo_id(cpu, 4) != -1) {
+		pr_debug("L3 isn't the last level of cache\n");
+		return false;
+	}
+
+	return true;
+}
+
 /* Test whether we can export MPAM_CLASS_CACHE:{2,3}? */
 static void mpam_resctrl_pick_caches(void)
 {
@@ -343,9 +518,68 @@ static void mpam_resctrl_pick_caches(void)
 	}
 }
 
+static void mpam_resctrl_pick_mba(void)
+{
+	struct mpam_class *class, *candidate_class = NULL;
+	struct mpam_resctrl_res *res;
+
+	lockdep_assert_cpus_held();
+
+	guard(srcu)(&mpam_srcu);
+	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		struct mpam_props *cprops = &class->props;
+
+		if (class->level != 3 && class->type == MPAM_CLASS_CACHE) {
+			pr_debug("class %u is a cache but not the L3\n", class->level);
+			continue;
+		}
+
+		if (!class_has_usable_mba(cprops)) {
+			pr_debug("class %u has no bandwidth control\n",
+				 class->level);
+			continue;
+		}
+
+		if (!cpumask_equal(&class->affinity, cpu_possible_mask)) {
+			pr_debug("class %u has missing CPUs\n", class->level);
+			continue;
+		}
+
+		if (!topology_matches_l3(class)) {
+			pr_debug("class %u topology doesn't match L3\n",
+				 class->level);
+			continue;
+		}
+
+		if (!traffic_matches_l3(class)) {
+			pr_debug("class %u traffic doesn't match L3 egress\n",
+				 class->level);
+			continue;
+		}
+
+		/*
+		 * Pick a resource to be MBA that as close as possible to
+		 * the L3. mbm_total counts the bandwidth leaving the L3
+		 * cache and MBA should correspond as closely as possible
+		 * for proper operation of mba_sc.
+		 */
+		if (!candidate_class || class->level < candidate_class->level)
+			candidate_class = class;
+	}
+
+	if (candidate_class) {
+		pr_debug("selected class %u to back MBA\n",
+			 candidate_class->level);
+		res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
+		res->class = candidate_class;
+	}
+}
+
 static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 {
 	struct mpam_class *class = res->class;
+	struct mpam_props *cprops = &class->props;
 	struct rdt_resource *r = &res->resctrl_res;
 
 	switch (r->rid) {
@@ -375,6 +609,19 @@ static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 		r->cache.shareable_bits = resctrl_get_default_ctrl(r);
 		r->alloc_capable = true;
 		break;
+	case RDT_RESOURCE_MBA:
+		r->schema_fmt = RESCTRL_SCHEMA_RANGE;
+		r->ctrl_scope = RESCTRL_L3_CACHE;
+
+		r->membw.delay_linear = true;
+		r->membw.throttle_mode = THREAD_THROTTLE_UNDEFINED;
+		r->membw.min_bw = get_mba_min(cprops);
+		r->membw.max_bw = MAX_MBA_BW;
+		r->membw.bw_gran = get_mba_granularity(cprops);
+
+		r->name = "MB";
+		r->alloc_capable = true;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -389,7 +636,17 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
 	if (class->type == MPAM_CLASS_CACHE)
 		return comp->comp_id;
 
-	/* TODO: repaint domain ids to match the L3 domain ids */
+	if (topology_matches_l3(class)) {
+		/* Use the corresponding L3 component ID as the domain ID */
+		int id = get_cpu_cacheinfo_id(cpu, 3);
+
+		/* Implies topology_matches_l3() made a mistake */
+		if (WARN_ON_ONCE(id == -1))
+			return comp->comp_id;
+
+		return id;
+	}
+
 	/* Otherwise, expose the ID used by the firmware table code. */
 	return comp->comp_id;
 }
@@ -429,6 +686,12 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	case RDT_RESOURCE_L3:
 		configured_by = mpam_feat_cpor_part;
 		break;
+	case RDT_RESOURCE_MBA:
+		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
+			configured_by = mpam_feat_mbw_max;
+			break;
+		}
+		fallthrough;
 	default:
 		return resctrl_get_default_ctrl(r);
 	}
@@ -440,6 +703,8 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	switch (configured_by) {
 	case mpam_feat_cpor_part:
 		return cfg->cpbm;
+	case mpam_feat_mbw_max:
+		return mbw_max_to_percent(cfg->mbw_max, cprops);
 	default:
 		return resctrl_get_default_ctrl(r);
 	}
@@ -487,6 +752,13 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 		cfg.cpbm = cfg_val;
 		mpam_set_feature(mpam_feat_cpor_part, &cfg);
 		break;
+	case RDT_RESOURCE_MBA:
+		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
+			cfg.mbw_max = percent_to_mbw_max(cfg_val, cprops);
+			mpam_set_feature(mpam_feat_mbw_max, &cfg);
+			break;
+		}
+		fallthrough;
 	default:
 		return -EINVAL;
 	}
@@ -761,6 +1033,7 @@ int mpam_resctrl_setup(void)
 
 	/* Find some classes to use for controls */
 	mpam_resctrl_pick_caches();
+	mpam_resctrl_pick_mba();
 
 	/* Initialise the resctrl structures from the classes */
 	for_each_mpam_resctrl_control(res, rid) {
-- 
2.43.0



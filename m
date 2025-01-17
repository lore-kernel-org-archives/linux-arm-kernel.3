Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2D5C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 15:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QitnK0ytXNvjWSL2ZdU07Uu+ftrgxcG/+yNwzZN9c8E=; b=jxzWf1iczdt/8k5TSfyvCVCpVU
	r3WKGxpgCR3QW0a/7wD/2l1TERf9cEtCVqzuAzdBSgL5dQWR8fliQGEAnyo0Q4ZyZmaZUYn48s65o
	4JPgijXhAfj8XgPXLB189/7GlnE0pQViVnPm7d5f+q7ZHaKlF5vpfFlu1C8x5B5FQ45WdJhbUdHDM
	uFhow56G6Znb1u4IJGU5cTH2gC1SSLPEl4M9UoRq1R3Fxu6A1WtSVtUsBSn7ICZDvOc10jzUjPn5l
	MSyaX3pHKAu79iHB6EYwu1FrMN9o7fJhhh7alfhOWgQqtrLwXYQH8z5ZOY62SOwMk7zLp6mvBOEAW
	MsVfaZ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoNR-00000000dah-44g2;
	Fri, 17 Jan 2025 15:35:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYo05-00000000ZFe-3KrV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 15:11:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09ED61691;
	Fri, 17 Jan 2025 07:11:38 -0800 (PST)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF5873F73F;
	Fri, 17 Jan 2025 07:11:08 -0800 (PST)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Zeng Heng <zengheng4@huawei.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH v2 06/11] arm_mpam: Introduce flexible CLOSID/RMID translation
Date: Fri, 17 Jan 2025 15:10:28 +0000
Message-Id: <20250117151033.1517882-19-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117151033.1517882-1-Dave.Martin@arm.com>
References: <20250117151033.1517882-1-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_071109_915750_7C64FD46 
X-CRM114-Status: GOOD (  29.83  )
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

Currently, the MPAM driver uses the resctrl CLOSID directly as the
MPAM Partition Identifier (PARTID; possibly modified to give
different PARTIDs to code and data when Code/Data Partitioning /
CDP is enabled), and uses the resctrl RMID directly as the MPAM
Performance Monitoring Group identifier (PMG).

In preparation for using the MPAM PARTID Narrowing feature to allow
more resctrl monitoring groups to be provided than the number of
PMG values supported by the hardware, a more flexible remapping
scheme is needed.

Factor out ID translation operations in the MPAM resctrl glue code
into a couple of self-contained helpers, and call them as
appropriate.

The translation scheme has a single parameter, partid_per_closid,
which is currently hard-wired to 1.

As a result, this patch should have no effect on functionality.

Logic to determine / control the mapping parameters can be
introduced later.

The ID transformation may be visualised as follows:

without CDP:
  +---------------------------------------------------+-----------+
  |                       CLOSID                      |    RMID   |
  +---------------------------------------------------+-------+---+
  |                           PARTID                  :       |PMG|
  +-----------------------------------------------------------+---+

and with CDP, where the "CDP" field is 0 for the data sub-
partition and 1 for the code sub-partition:
  +-----------------------------------------------+---+-----------+
  |                     CLOSID                    |CDP|    RMID   |
  +-----------------------------------------------+---+-------+---+
  |                           PARTID                  :       |PMG|
  +-----------------------------------------------------------+---+

where each box represents a non-negative integer spanning some
fixed range starting from zero, and horizontal concatenation
denotes multiplying the value denoted by the left-hand box by the
span of the right-hand box, and adding the result to the value
denoted by the right-hand box; thus, most-significant fields are on
the left.

(Except for the span of each field not necessarily being a power of
two, this is conceptually identical to concatenation and cutting of
bitfields.)

The dotted segment indicates the least significant part of PARTID,
which spans partid_per_closid PARTIDs and discriminates monitoring
groups that use the same MPAM PMG value.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>

---

Changes since RFCv1:

 * [bugfix] Add CDP index properly in mpam_resctrl_partid_range().

   (Also reported by Shaopeng Tan.)

 * [relaxation] Remove requirement that mpam_pmg_max + 1 is a power
   of two.

   (This constraint is redundant, due to the use of multiply/add
   transformations of MPAM IDs in place of shift/OR.)
---
 drivers/platform/arm64/mpam/mpam_resctrl.c | 211 +++++++++++----------
 1 file changed, 112 insertions(+), 99 deletions(-)

diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index aa8a6c077918..f834753a3274 100644
--- a/drivers/platform/arm64/mpam/mpam_resctrl.c
+++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
@@ -156,6 +156,18 @@ static bool mpam_resctrl_hide_cdp(enum resctrl_res_level rid)
 	return cdp_enabled && !resctrl_arch_get_cdp_enabled(rid);
 }
 
+static unsigned int partid_per_closid = 1;
+
+static unsigned int mpam_num_pmg(void)
+{
+	return mpam_pmg_max + 1;
+}
+
+static unsigned int mpam_num_rmid(void)
+{
+	return mpam_num_pmg() * partid_per_closid;
+}
+
 /*
  * MSC may raise an error interrupt if it sees an out or range partid/pmg,
  * and go on to truncate the value. Regardless of what the hardware supports,
@@ -163,35 +175,73 @@ static bool mpam_resctrl_hide_cdp(enum resctrl_res_level rid)
  */
 u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
 {
-	return mpam_partid_max + 1;
+	u32 res = (mpam_partid_max + 1) / partid_per_closid;
+
+	WARN_ON(res < 1);
+	return res;
 }
 
-u32 resctrl_arch_system_num_rmid_idx(void)
+static void mpam_resctrl_partid_range(u32 closid, enum resctrl_conf_type type,
+				      const struct rdt_resource *r,
+				      u16 *min_partid, u16 *max_partid)
 {
-	u8 closid_shift = fls(mpam_pmg_max);
-	u32 num_partid = resctrl_arch_get_num_closid(NULL);
+	u16 base_partid = closid;
+	u16 span = 1;
 
-	return num_partid << closid_shift;
+	if (cdp_enabled) {
+		base_partid *= 2;
+		if (mpam_resctrl_hide_cdp(r->rid) ||
+		    type == CDP_NONE)
+			span *= 2;
+		else if (type == CDP_CODE)
+			base_partid++;
+	}
+
+	*min_partid = base_partid * partid_per_closid;
+	if (max_partid)
+		*max_partid = *min_partid + (span * partid_per_closid - 1);
 }
 
-u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
+static void mpam_resctrl_hwid(u32 closid, u32 rmid,
+			      u16 *partid_d, u16 *partid_i, u8 *pmg)
 {
-	u8 closid_shift = fls(mpam_pmg_max);
+	const u16 pmg_hi = rmid / mpam_num_pmg();
+	const u16 pmg_lo = rmid % mpam_num_pmg();
+	u16 base_partid = closid;
+	u16 partid_stride = 0;
+
+	if (cdp_enabled) {
+		base_partid *= 2;
+		partid_stride = 1;
+	}
+
+	partid_stride *= partid_per_closid;
+	base_partid *= partid_per_closid;
+	base_partid += pmg_hi;
 
-	BUG_ON(closid_shift > 8);
+	*partid_d = base_partid;
+	if (partid_i)
+		*partid_i = base_partid + partid_stride;
 
-	return (closid << closid_shift) | rmid;
+	*pmg = pmg_lo;
 }
 
-void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
+u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
+{
+	return closid * mpam_num_rmid() + rmid;
+}
+
+u32 resctrl_arch_system_num_rmid_idx(void)
 {
-	u8 closid_shift = fls(mpam_pmg_max);
-	u32 pmg_mask = ~(~0 << closid_shift);
+	u32 num_closid = resctrl_arch_get_num_closid(NULL);
 
-	BUG_ON(closid_shift > 8);
+	return resctrl_arch_rmid_idx_encode(num_closid, 0);
+}
 
-	*closid = idx >> closid_shift;
-	*rmid = idx & pmg_mask;
+void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
+{
+	*closid = idx / mpam_num_rmid();
+	*rmid = idx % mpam_num_rmid();
 }
 
 void resctrl_arch_sched_in(struct task_struct *tsk)
@@ -203,21 +253,14 @@ void resctrl_arch_sched_in(struct task_struct *tsk)
 
 void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid)
 {
+	u16 partid_d, partid_i;
+	u8 pmg;
+
 	BUG_ON(closid > U16_MAX);
 	BUG_ON(rmid > U8_MAX);
 
-	if (!cdp_enabled) {
-		mpam_set_cpu_defaults(cpu, closid, closid, rmid, rmid);
-	} else {
-		/*
-		 * When CDP is enabled, resctrl halves the closid range and we
-		 * use odd/even partid for one closid.
-		 */
-		u32 partid_d = resctrl_get_config_index(closid, CDP_DATA);
-		u32 partid_i = resctrl_get_config_index(closid, CDP_CODE);
-
-		mpam_set_cpu_defaults(cpu, partid_d, partid_i, rmid, rmid);
-	}
+	mpam_resctrl_hwid(closid, rmid, &partid_d, &partid_i, &pmg);
+	mpam_set_cpu_defaults(cpu, partid_d, partid_i, pmg, pmg);
 }
 
 void resctrl_arch_sync_cpu_closid_rmid(void *info)
@@ -236,41 +279,38 @@ void resctrl_arch_sync_cpu_closid_rmid(void *info)
 
 void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
 {
+	u16 partid_d, partid_i;
+	u8 pmg;
+
 	BUG_ON(closid > U16_MAX);
 	BUG_ON(rmid > U8_MAX);
 
-	if (!cdp_enabled) {
-		mpam_set_task_partid_pmg(tsk, closid, closid, rmid, rmid);
-	} else {
-		u32 partid_d = resctrl_get_config_index(closid, CDP_DATA);
-		u32 partid_i = resctrl_get_config_index(closid, CDP_CODE);
-
-		mpam_set_task_partid_pmg(tsk, partid_d, partid_i, rmid, rmid);
-	}
+	mpam_resctrl_hwid(closid, rmid, &partid_d, &partid_i, &pmg);
+	mpam_set_task_partid_pmg(tsk, partid_d, partid_i, pmg, pmg);
 }
 
 bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
 {
+	u16 min_partid, max_partid;
 	u64 regval = mpam_get_regval(tsk);
 	u32 tsk_closid = FIELD_GET(MPAM1_EL1_PARTID_D, regval);
 
-	if (cdp_enabled)
-		tsk_closid >>= 1;
-
-	return tsk_closid == closid;
+	mpam_resctrl_partid_range(closid, CDP_NONE, NULL,
+				  &min_partid, &max_partid);
+	return tsk_closid >= min_partid && tsk_closid <= max_partid;
 }
 
 /* The task's pmg is not unique, the partid must be considered too */
 bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
 {
+	u16 partid_d;
+	u8 pmg;
 	u64 regval = mpam_get_regval(tsk);
-	u32 tsk_closid = FIELD_GET(MPAM1_EL1_PARTID_D, regval);
-	u32 tsk_rmid = FIELD_GET(MPAM1_EL1_PMG_D, regval);
-
-	if (cdp_enabled)
-		tsk_closid >>= 1;
+	u16 tsk_partid_d = FIELD_GET(MPAM1_EL1_PARTID_D, regval);
+	u8 tsk_pmg = FIELD_GET(MPAM1_EL1_PMG_D, regval);
 
-	return (tsk_closid == closid) && (tsk_rmid == rmid);
+	mpam_resctrl_hwid(closid, rmid, &partid_d, NULL, &pmg);
+	return (tsk_partid_d == partid_d) && (tsk_pmg == pmg);
 }
 
 struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
@@ -370,6 +410,7 @@ int resctrl_arch_rmid_read(struct rdt_resource	*r, struct rdt_mon_domain *d,
 	struct mpam_resctrl_dom *dom;
 	u32 mon = *(u32 *)arch_mon_ctx;
 	enum mpam_device_features type;
+	u16 partid_d, partid_i, pmg;
 
 	resctrl_arch_rmid_read_context_check();
 
@@ -391,27 +432,23 @@ int resctrl_arch_rmid_read(struct rdt_resource	*r, struct rdt_mon_domain *d,
 	if (cfg.mon == USE_RMID_IDX)
 		cfg.mon = resctrl_arch_rmid_idx_encode(closid, rmid);
 
+	mpam_resctrl_hwid(closid, rmid, &partid_d, &partid_i, &cfg.pmg);
 	cfg.match_pmg = true;
-	cfg.pmg = rmid;
+	cfg.pmg = pmg;
 	cfg.opts = resctrl_evt_config_to_mpam(dom->mbm_local_evt_cfg);
 
 	if (irqs_disabled()) {
 		/* Check if we can access this domain without an IPI */
 		err = -EIO;
 	} else {
-		if (cdp_enabled) {
-			cfg.partid = closid << 1;
-			err = mpam_msmon_read(dom->comp, &cfg, type, val);
-			if (err)
-				return err;
+		cfg.partid = partid_d;
+		err = mpam_msmon_read(dom->comp, &cfg, type, val);
 
-			cfg.partid += 1;
+		if (partid_i != partid_d) {
+			cfg.partid = partid_i;
 			err = mpam_msmon_read(dom->comp, &cfg, type, &cdp_val);
 			if (!err)
 				*val += cdp_val;
-		} else {
-			cfg.partid = closid;
-			err = mpam_msmon_read(dom->comp, &cfg, type, val);
 		}
 	}
 
@@ -423,6 +460,7 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
 {
 	struct mon_cfg cfg;
 	struct mpam_resctrl_dom *dom;
+	u16 partid_d, partid_i;
 
 	if (eventid != QOS_L3_MBM_LOCAL_EVENT_ID)
 		return;
@@ -433,14 +471,13 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
 
 	dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
 
-	if (cdp_enabled) {
-		cfg.partid = closid << 1;
-		mpam_msmon_reset_mbwu(dom->comp, &cfg);
+	mpam_resctrl_hwid(closid, rmid, &partid_d, &partid_i, &cfg.pmg);
 
-		cfg.partid += 1;
-		mpam_msmon_reset_mbwu(dom->comp, &cfg);
-	} else {
-		cfg.partid = closid;
+	cfg.partid = partid_d;
+	mpam_msmon_reset_mbwu(dom->comp, &cfg);
+
+	if (partid_i != partid_d) {
+		cfg.partid = partid_i;
 		mpam_msmon_reset_mbwu(dom->comp, &cfg);
 	}
 }
@@ -1051,15 +1088,6 @@ int mpam_resctrl_setup(void)
 		err = -EOPNOTSUPP;
 
 	if (!err) {
-		if (!is_power_of_2(mpam_pmg_max + 1)) {
-			/*
-			 * If not all the partid*pmg values are valid indexes,
-			 * resctrl may allocate pmg that don't exist. This
-			 * should cause an error interrupt.
-			 */
-			pr_warn("Number of PMG is not a power of 2! resctrl may misbehave");
-		}
-
 		err = resctrl_init();
 		if (!err)
 			WRITE_ONCE(resctrl_enabled, true);
@@ -1081,7 +1109,7 @@ static void mpam_resctrl_exit(void)
 u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 			    u32 closid, enum resctrl_conf_type type)
 {
-	u32 partid;
+	u16 partid;
 	struct mpam_config *cfg;
 	struct mpam_props *cprops;
 	struct mpam_resctrl_res *res;
@@ -1097,15 +1125,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
 	cprops = &res->class->props;
 
-	/*
-	 * When CDP is enabled, but the resource doesn't support it,
-	 * the control is cloned across both partids.
-	 * Pick one at random to read:
-	 */
-	if (mpam_resctrl_hide_cdp(r->rid))
-		type = CDP_DATA;
-
-	partid = resctrl_get_config_index(closid, type);
+	mpam_resctrl_partid_range(closid, type, r, &partid, NULL);
 	cfg = &dom->comp->cfg[partid];
 
 	switch (r->rid) {
@@ -1126,7 +1146,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 		return -EINVAL;
 	}
 
-	if (!r->alloc_capable || partid >= resctrl_arch_get_num_closid(r) ||
+	if (!r->alloc_capable || partid > mpam_partid_max ||
 	    !mpam_has_feature(configured_by, cfg))
 		return resctrl_get_default_ctrl(r);
 
@@ -1147,8 +1167,8 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 			    u32 closid, enum resctrl_conf_type t, u32 cfg_val)
 {
-	int err;
-	u32 partid;
+	int err = 0;
+	u16 partid, min_partid, max_partid;
 	struct mpam_config cfg;
 	struct mpam_props *cprops;
 	struct mpam_resctrl_res *res;
@@ -1163,8 +1183,10 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
 	cprops = &res->class->props;
 
-	partid = resctrl_get_config_index(closid, t);
-	if (!r->alloc_capable || partid >= resctrl_arch_get_num_closid(r))
+	mpam_resctrl_partid_range(closid, t, r, &min_partid, &max_partid);
+	if (!r->alloc_capable ||
+	    min_partid > mpam_partid_max ||
+	    max_partid > mpam_partid_max)
 		return -EINVAL;
 
 	cfg.features = 0;
@@ -1190,22 +1212,13 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 		return -EINVAL;
 	}
 
-	/*
-	 * When CDP is enabled, but the resource doesn't support it, we need to
-	 * apply the same configuration to the other partid.
-	 */
-	if (mpam_resctrl_hide_cdp(r->rid)) {
-		partid = resctrl_get_config_index(closid, CDP_CODE);
+	for (partid = min_partid; partid <= max_partid; partid++) {
 		err = mpam_apply_config(dom->comp, partid, &cfg);
 		if (err)
-			return err;
-
-		partid = resctrl_get_config_index(closid, CDP_DATA);
-		return mpam_apply_config(dom->comp, partid, &cfg);
-
-	} else {
-		return mpam_apply_config(dom->comp, partid, &cfg);
+			break;
 	}
+
+	return err;
 }
 
 /* TODO: this is IPI heavy */
-- 
2.34.1



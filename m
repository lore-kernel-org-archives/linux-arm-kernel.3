Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32D7C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 15:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwBiR0KoJJNeOuXY8pezhnJ02fB7ERpTlTC6BUe2pNU=; b=yfqGpNDiZs2paFLMow8xYe0ZYG
	kkqHRtFW4xUotl6DPhtmoeb+AIqR0MSuSO6294mBvj6evCe15AhJY9LYWcu39jKZcfjW0z/S4lOHr
	NtKfKWuFNMZkpfj9CzmM5ouqwgkCGeO4x8YdTNAf06f2a2f9OpOyyHuscmYF/I8mRwUcL8RSsjjxz
	Nb4frVx8e/NocHBJCWP1VYkkEcZSeduBdugzEBkS2cbgpLFu2BMWIZZGh6C0JxLKzWlco3AnWSQWp
	XyRbvj5PLSRg/JUrbLyiSfu9B4peIlMqMZ0ntDmiYgBGhsXtChPRtYRmDCsIeOt4UAFtpUg5q+EMr
	eqTmAFQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoCE-00000000blV-3yDT;
	Fri, 17 Jan 2025 15:23:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnzx-00000000ZGb-2GuX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 15:11:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B32C1476;
	Fri, 17 Jan 2025 07:11:29 -0800 (PST)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C8DF3F73F;
	Fri, 17 Jan 2025 07:11:00 -0800 (PST)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Zeng Heng <zengheng4@huawei.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH v2 09/11] arm_mpam: Add control partition identifier to mpam_config
Date: Fri, 17 Jan 2025 15:10:19 +0000
Message-Id: <20250117151033.1517882-10-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117151033.1517882-1-Dave.Martin@arm.com>
References: <20250117151033.1517882-1-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_071101_666637_CE9675AF 
X-CRM114-Status: GOOD (  17.40  )
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

Currently, MPAM PARTIDs are assigned 1:1 to resctrl control groups.
This means that an MSC that implements PARTID Narrowing can simply
program the PARTID value for intPARTID where needed.

In order to enable multiple PARTIDs to be assigned to a single
control group in a flexible manner, the PARTID value cannot be used
directly for the intPARTID, so in the mpam_devices backend,
Narrowing MSCs need an explicit identifier for the control /
resource regulation group.

Add a field cpartid to struct mpam_config to hold this identifier,
and wire up the resctrl glue code to pass a suitable value.

In common with the handling of other parameters, make programming
of MPAMCFG_INTPARTID unconditional when applying control updates.

When no cpartid is supplied, e.g., during driver startup, intPARTID
is programmed with 0.  (There is no architectural reset value for
MPAMCFG_INTPARTID even for PARTID 0, but the architecture can be
interpreted as suggesting intPARTID 0 as the default, so this is as
good a choice as any.)  Control updates through resctrl will always
supply a cpartid, identifying the affected resctrl control
partition.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
---
 drivers/platform/arm64/mpam/mpam_devices.c  | 10 ++++++++--
 drivers/platform/arm64/mpam/mpam_internal.h |  7 +++++++
 drivers/platform/arm64/mpam/mpam_resctrl.c  | 16 +++++++++++-----
 3 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
index 6b326506c359..4b43dfef1cdc 100644
--- a/drivers/platform/arm64/mpam/mpam_devices.c
+++ b/drivers/platform/arm64/mpam/mpam_devices.c
@@ -1531,6 +1531,7 @@ static void mpam_quirk_post_config_change(struct mpam_msc_ris *ris, u16 partid,
 static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 				      struct mpam_config *cfg)
 {
+	u16 intpartid = 0;
 	u32 pri_val = 0;
 	u16 cmax = MPAMCFG_CMAX_CMAX;
 	u16 bwa_fract = MPAMCFG_MBW_MAX_MAX;
@@ -1543,9 +1544,13 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 	__mpam_part_sel(ris->ris_idx, partid, msc);
 
 	if (mpam_has_feature(mpam_feat_partid_nrw, rprops)) {
+		if (mpam_has_feature(mpam_feat_partid_nrw, cfg))
+			intpartid = cfg->cpartid;
+
 		mpam_write_partsel_reg(msc, INTPARTID,
-				       MPAMCFG_INTPARTID_INTERNAL | partid);
-		__mpam_intpart_sel(ris->ris_idx, partid, msc);
+				       MPAMCFG_INTPARTID_INTERNAL | intpartid);
+
+		__mpam_intpart_sel(ris->ris_idx, intpartid, msc);
 	}
 
 	if (mpam_has_feature(mpam_feat_cpor_part, rprops)) {
@@ -3084,6 +3089,7 @@ static mpam_features_t mpam_update_config(struct mpam_config *cfg,
 {
 	mpam_features_t changes = 0;
 
+	maybe_update_config(cfg, mpam_feat_partid_nrw, newcfg, cpartid, changes);
 	maybe_update_config(cfg, mpam_feat_cpor_part, newcfg, cpbm, changes);
 	maybe_update_config(cfg, mpam_feat_mbw_part, newcfg, mbw_pbm, changes);
 	maybe_update_config(cfg, mpam_feat_mbw_max, newcfg, mbw_max, changes);
diff --git a/drivers/platform/arm64/mpam/mpam_internal.h b/drivers/platform/arm64/mpam/mpam_internal.h
index 5af6ed60272e..965f4fea3012 100644
--- a/drivers/platform/arm64/mpam/mpam_internal.h
+++ b/drivers/platform/arm64/mpam/mpam_internal.h
@@ -300,6 +300,13 @@ struct mpam_config {
 	u16	mbw_max;
 	u16	mbw_min;
 
+	/*
+	 * Control partition; resource regulation context for stateful controls
+	 * Valid if features has mpam_feat_partid_nrw.
+	 * For MSCs that implement PARTID Narrowing, this is intPARTID.
+	 */
+	u16	cpartid;
+
 	struct mpam_garbage	garbage;
 };
 
diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index eb1ef5d2bc57..f1d0d9f59771 100644
--- a/drivers/platform/arm64/mpam/mpam_resctrl.c
+++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
@@ -205,7 +205,8 @@ u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
 
 static void mpam_resctrl_partid_range(u32 closid, enum resctrl_conf_type type,
 				      const struct rdt_resource *r,
-				      u16 *min_partid, u16 *max_partid)
+				      u16 *min_partid, u16 *max_partid,
+				      u16 *cpartid)
 {
 	u16 base_partid = closid;
 	u16 span = 1;
@@ -222,6 +223,9 @@ static void mpam_resctrl_partid_range(u32 closid, enum resctrl_conf_type type,
 	*min_partid = base_partid * partid_per_closid;
 	if (max_partid)
 		*max_partid = *min_partid + (span * partid_per_closid - 1);
+
+	if (cpartid)
+		*cpartid = base_partid;
 }
 
 static void mpam_resctrl_hwid(u32 closid, u32 rmid,
@@ -318,7 +322,7 @@ bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
 	u32 tsk_closid = FIELD_GET(MPAM1_EL1_PARTID_D, regval);
 
 	mpam_resctrl_partid_range(closid, CDP_NONE, NULL,
-				  &min_partid, &max_partid);
+				  &min_partid, &max_partid, NULL);
 	return tsk_closid >= min_partid && tsk_closid <= max_partid;
 }
 
@@ -1147,7 +1151,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
 	cprops = &res->class->props;
 
-	mpam_resctrl_partid_range(closid, type, r, &partid, NULL);
+	mpam_resctrl_partid_range(closid, type, r, &partid, NULL, NULL);
 	cfg = &dom->comp->cfg[partid];
 
 	switch (r->rid) {
@@ -1205,13 +1209,15 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
 	cprops = &res->class->props;
 
-	mpam_resctrl_partid_range(closid, t, r, &min_partid, &max_partid);
+	cfg.features = 0;
+	mpam_set_feature(mpam_feat_partid_nrw, &cfg);
+	mpam_resctrl_partid_range(closid, t, r, &min_partid, &max_partid,
+				  &cfg.cpartid);
 	if (!r->alloc_capable ||
 	    min_partid > mpam_partid_max ||
 	    max_partid > mpam_partid_max)
 		return -EINVAL;
 
-	cfg.features = 0;
 	switch (r->rid) {
 	case RDT_RESOURCE_L2:
 	case RDT_RESOURCE_L3:
-- 
2.34.1



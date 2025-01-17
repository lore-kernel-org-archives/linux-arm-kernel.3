Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71315C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 15:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ti7z7aGxgyNg3NP1KGOazGTJTj9oL5Ii72aBNEkeHYA=; b=BjsIJE2JVoRvLyGja1P9dG/UjU
	iSdc0D6STRLTH7W+2FHxTJHdxq2jj3CnqxgTUzAr4/Pl5FcxP+DwvrdCeRGUqV4CxoyENCJBQkfJp
	ATqcm6szX5FmJ4QANyAqE70rrz1SX5DTh8Y9MMqeXwe1GYZEHd0bR7GG2n6VGdvlOlpWdc3uVO1N2
	g2RXCeEsPcVsnrTKwLxpnwOotG6sd/kb0kXkPHRHbzCZaoJcPawozwH5KFDL8e9gJ6J/E8pDwMgm8
	LhnIoPADwbyPO36ZXwGefUdbSN69C7dJqoovPLpbyxEoSjPljxX+CM+94a7ImY2HUQb4o4Z5T8gII
	OUVKdOzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoEh-00000000cFn-1EGS;
	Fri, 17 Jan 2025 15:26:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnzz-00000000ZGb-0FHO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 15:11:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 490781476;
	Fri, 17 Jan 2025 07:11:31 -0800 (PST)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A6C53F73F;
	Fri, 17 Jan 2025 07:11:02 -0800 (PST)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Zeng Heng <zengheng4@huawei.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH v2 11/11] arm_mpam: Detect whether the system can alias PARTIDs
Date: Fri, 17 Jan 2025 15:10:21 +0000
Message-Id: <20250117151033.1517882-12-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117151033.1517882-1-Dave.Martin@arm.com>
References: <20250117151033.1517882-1-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_071103_193660_DCB587A9 
X-CRM114-Status: GOOD (  22.53  )
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

In order to be able to assign multiple PARTIDs freely to resource
control groups, it is necessary that all MSCs that are used by resctrl
either implement PARTID Narrowing (so that PARTIDs can be remapped
explicitly) or otherwise only have controls whose resource regulation
is stateless and so whose behaviour would not be affected by splitting
a control group across multiple PARTIDs.

Detect this property at the RIS level and merge it up the MPAM devices
tree.

Export the common global result as mpam_partid_aliasing, and apply
it to the PARTIDs-per-CLOSID configuration.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>

---

Currently, this the logic is simple and may forbid PARTID aliasing
on some systems that can support it as a result of the precise set
of MSCs and controls that are exposed through resctrl.

The aim is to make this logic more flexible later.
---
 drivers/platform/arm64/mpam/mpam_devices.c  | 48 ++++++++++++++++++---
 drivers/platform/arm64/mpam/mpam_internal.h |  2 +
 drivers/platform/arm64/mpam/mpam_resctrl.c  | 12 +++++-
 3 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
index 4b43dfef1cdc..0182c922638f 100644
--- a/drivers/platform/arm64/mpam/mpam_devices.c
+++ b/drivers/platform/arm64/mpam/mpam_devices.c
@@ -68,6 +68,7 @@ static DEFINE_MUTEX(mpam_cpuhp_state_lock);
  */
 u16 mpam_partid_max;
 u8 mpam_pmg_max;
+bool mpam_partid_aliasing; /* PARTID aliasing supported */
 static bool partid_max_init, partid_max_published;
 static DEFINE_SPINLOCK(partid_max_lock);
 
@@ -828,6 +829,7 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 	struct mpam_msc *msc = ris->vmsc->msc;
 	struct mpam_props *props = &ris->props;
 	struct mpam_class *class = ris->vmsc->comp->class;
+	bool partid_can_alias = true;
 
 	lockdep_assert_held(&msc->probe_lock);
 	lockdep_assert_held(&msc->part_sel_lock);
@@ -836,6 +838,8 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 
 	/* Cache Capacity Partitioning */
 	if (FIELD_GET(MPAMF_IDR_HAS_CCAP_PART, ris->idr)) {
+		partid_can_alias = false;
+
 		ris->ccap_idr = mpam_read_partsel_reg(msc, CCAP_IDR);
 
 		props->cmax_wd = FIELD_GET(MPAMF_CCAP_IDR_CMAX_WD, ris->ccap_idr);
@@ -884,14 +888,20 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 		 */
 		props->bwa_wd = min(props->bwa_wd, 16);
 
-		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features))
+		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features)) {
 			mpam_set_feature(mpam_feat_mbw_max, props);
+			partid_can_alias = false;
+		}
 
-		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MIN, mbw_features))
+		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MIN, mbw_features)) {
 			mpam_set_feature(mpam_feat_mbw_min, props);
+			partid_can_alias = false;
+		}
 
-		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_PROP, mbw_features))
+		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_PROP, mbw_features)) {
 			mpam_set_feature(mpam_feat_mbw_prop, props);
+			partid_can_alias = false;
+		}
 	}
 
 	/* Priority partitioning */
@@ -988,17 +998,26 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 	 * RIS with PARTID narrowing don't have enough storage for one
 	 * configuration per PARTID. If these are in a class we could use,
 	 * reduce the supported partid_max to match the numer of intpartid.
-	 * If the class is unknown, just ignore it.
+	 * If the MSC won't be used for anything or implements PARTID
+	 * Narrowing then PARTIDs can be assigned freely, so PARTID
+	 * aliasing can be supported regardless of the resource
+	 * controls present.
 	 */
-	if (FIELD_GET(MPAMF_IDR_HAS_PARTID_NRW, ris->idr) &&
-	    class->type != MPAM_CLASS_UNKNOWN) {
+	if (class->type == MPAM_CLASS_UNKNOWN)
+		partid_can_alias = true;
+	else if (FIELD_GET(MPAMF_IDR_HAS_PARTID_NRW, ris->idr)) {
 		u32 nrwidr = mpam_read_partsel_reg(msc, PARTID_NRW_IDR);
 		u16 partid_max = FIELD_GET(MPAMF_PARTID_NRW_IDR_INTPARTID_MAX, nrwidr);
 
 		mpam_set_feature(mpam_feat_partid_nrw, props);
 		msc->partid_max = min(msc->partid_max, partid_max);
+
+		partid_can_alias = true;
 	}
 
+	if (partid_can_alias)
+		mpam_set_feature(mpam_feat_partid_aliasing, props);
+
 	mpam_mon_sel_outer_unlock(msc);
 }
 
@@ -2368,6 +2387,10 @@ static void __props_mismatch(struct mpam_props *parent,
 		mpam_clear_feature(mpam_feat_dspri_part_0_low, &parent->features);
 	}
 
+	/* PARTID aliasing must be supported everywhere, or not at all: */
+	if (!mpam_has_feature(mpam_feat_partid_aliasing, parent))
+		mpam_clear_feature(mpam_feat_partid_aliasing, &parent->features);
+
 	if (alias) {
 		/* Merge features for aliased resources */
 		parent->features |= child->features;
@@ -2486,6 +2509,7 @@ static void mpam_enable_merge_features(struct list_head *all_classes_list)
 {
 	struct mpam_class *class;
 	struct mpam_component *comp;
+	bool partid_can_alias = true, comp_partid_aliasing;
 
 	lockdep_assert_held(&mpam_list_lock);
 
@@ -2495,9 +2519,19 @@ static void mpam_enable_merge_features(struct list_head *all_classes_list)
 
 		mpam_enable_init_class_features(class);
 
-		list_for_each_entry(comp, &class->components, class_list)
+		list_for_each_entry(comp, &class->components, class_list) {
 			mpam_enable_merge_class_features(comp);
+
+			comp_partid_aliasing = mpam_has_feature(
+				mpam_feat_partid_aliasing, &class->props);
+			partid_can_alias = partid_can_alias &&
+				comp_partid_aliasing;
+		}
 	}
+
+	spin_lock(&partid_max_lock);
+	mpam_partid_aliasing = partid_can_alias;
+	spin_unlock(&partid_max_lock);
 }
 
 static char *mpam_errcode_names[16] = {
diff --git a/drivers/platform/arm64/mpam/mpam_internal.h b/drivers/platform/arm64/mpam/mpam_internal.h
index 965f4fea3012..6e10e4789506 100644
--- a/drivers/platform/arm64/mpam/mpam_internal.h
+++ b/drivers/platform/arm64/mpam/mpam_internal.h
@@ -215,6 +215,7 @@ enum mpam_device_features {
 	mpam_feat_msmon_mbwu_hw_nrdy,
 	mpam_feat_msmon_capt,
 	mpam_feat_partid_nrw,
+	mpam_feat_partid_aliasing, /* derived feature */
 	MPAM_FEATURE_LAST,
 };
 #define MPAM_ALL_FEATURES      ((1<<MPAM_FEATURE_LAST) - 1)
@@ -474,6 +475,7 @@ static inline void mpam_assert_srcu_read_lock_held(void)
 /* System wide partid/pmg values */
 extern u16 mpam_partid_max;
 extern u8 mpam_pmg_max;
+extern bool mpam_partid_aliasing;
 
 /* Scheduled work callback to enable mpam once all MSC have been probed */
 void mpam_enable(struct work_struct *work);
diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index 1f31b1455f66..5b296e3e27c2 100644
--- a/drivers/platform/arm64/mpam/mpam_resctrl.c
+++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
@@ -160,7 +160,8 @@ static bool mpam_resctrl_hide_cdp(enum resctrl_res_level rid)
 	return cdp_enabled && !resctrl_arch_get_cdp_enabled(rid);
 }
 
-static unsigned int partid_per_closid = 1;
+static unsigned int bootparam_partid_per_closid = 1;
+static unsigned int partid_per_closid;
 
 static int mpam_resctrl_partid_per_closid_set(const char *val,
 					      const struct kernel_param *kp)
@@ -178,7 +179,7 @@ static const struct kernel_param_ops mpam_resctrl_partid_per_closid_ops  = {
 };
 
 device_param_cb(partid_per_closid, &mpam_resctrl_partid_per_closid_ops,
-		&partid_per_closid, 0444);
+		&bootparam_partid_per_closid, 0444);
 
 static unsigned int mpam_num_pmg(void)
 {
@@ -1113,6 +1114,13 @@ int mpam_resctrl_setup(void)
 	if (!err && !exposed_alloc_capable && !exposed_mon_capable)
 		err = -EOPNOTSUPP;
 
+	partid_per_closid = bootparam_partid_per_closid;
+	if ((!mpam_partid_aliasing && bootparam_partid_per_closid > 1) ||
+	    resctrl_arch_get_num_closid(NULL) < 1) {
+		pr_warn("Hardware incompatible with PARTID aliasing, limiting monitoring groups\n");
+		partid_per_closid = 1;
+	}
+
 	if (!err) {
 		err = resctrl_init();
 		if (!err)
-- 
2.34.1



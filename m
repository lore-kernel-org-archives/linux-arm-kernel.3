Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AD2CF45AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFyG0lndtUYeNlD5K4QpmR4kqgIYQmiVfIJxD6f+4cY=; b=nTE8BtyMFe3dsWSMQ+n/Obufgp
	l0tYlyrM/Jv1pBZP6JXOTZBRMrojeIfgh9e5V6R+Jix+CqDNyys3BcnSIreu5sBPkxZ1cpxFCT2GI
	aPlbkR4dSdQVtOkr02ZEeo2BRJgfYRhyFQ1/ebx4liKFBWZq+96HGOVF2zrA8U+SFCCTCPOO5/S9b
	gHsT5AbDoWzr+mJfLTJwVUrb7Si9no1gI8TdajdVDm6HHxTTaDLJoMj8K2ofnq7NJqvw4f5UgRxoM
	7M5sfJuHr5m58Q3KnBovBoEJJrcqQ+SJEeMmSl63+kqSiH2ImqcvMOInz16MhssWeqh3USOsioH3G
	8b7X9ixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLKM-00000005oE9-31wW;
	Mon, 12 Jan 2026 17:03:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLKJ-00000005oB8-3EJY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:03:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F6F1153B;
	Mon, 12 Jan 2026 09:03:28 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E181B3F694;
	Mon, 12 Jan 2026 09:03:29 -0800 (PST)
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
	Zeng Heng <zengheng4@huawei.com>
Subject: [PATCH v3 41/47] arm_mpam: Generate a configuration for min controls
Date: Mon, 12 Jan 2026 16:59:08 +0000
Message-ID: <20260112165914.4086692-42-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112165914.4086692-1-ben.horgan@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_090335_910601_7A1D2E57 
X-CRM114-Status: GOOD (  25.49  )
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

MPAM supports a minimum and maximum control for memory bandwidth. The
purpose of the minimum control is to give priority to tasks that are below
their minimum value. Resctrl only provides one value for the bandwidth
configuration, which is used for the maximum.

The minimum control is always programmed to zero on hardware that supports
it.

Generate a minimum bandwidth value that is 5% lower than the value provided
by resctrl. This means tasks that are not receiving their target bandwidth
can be prioritised by the hardware.

For component reset reuse the same calculation so that the default is a
value resctrl can set.

CC: Zeng Heng <zengheng4@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since rfc:
Add reset_mbw_min
Clear min cfg when setting max
use mpam_extend_config on component reset

Changes since v2:
bwa_wd limit to 16 moved to earlier patch
restrict scope of min and delta variables
move code out of loop so smaller change for quirking min
move testing into its own commit
---
 drivers/resctrl/mpam_devices.c  | 69 ++++++++++++++++++++++++++++++---
 drivers/resctrl/mpam_internal.h |  3 ++
 drivers/resctrl/mpam_resctrl.c  |  2 +
 3 files changed, 69 insertions(+), 5 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 9fbe4fe3b13a..37bd8efc6ecf 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1394,8 +1394,12 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 	}
 
 	if (mpam_has_feature(mpam_feat_mbw_min, rprops) &&
-	    mpam_has_feature(mpam_feat_mbw_min, cfg))
-		mpam_write_partsel_reg(msc, MBW_MIN, 0);
+	    mpam_has_feature(mpam_feat_mbw_min, cfg)) {
+		if (cfg->reset_mbw_min)
+			mpam_write_partsel_reg(msc, MBW_MIN, 0);
+		else
+			mpam_write_partsel_reg(msc, MBW_MIN, cfg->mbw_min);
+	}
 
 	if (mpam_has_feature(mpam_feat_mbw_max, rprops) &&
 	    mpam_has_feature(mpam_feat_mbw_max, cfg)) {
@@ -1510,6 +1514,7 @@ static void mpam_init_reset_cfg(struct mpam_config *reset_cfg)
 		.reset_cpbm = true,
 		.reset_mbw_pbm = true,
 		.reset_mbw_max = true,
+		.reset_mbw_min = true,
 	};
 	bitmap_fill(reset_cfg->features, MPAM_FEATURE_LAST);
 }
@@ -2408,6 +2413,45 @@ static void __destroy_component_cfg(struct mpam_component *comp)
 	}
 }
 
+static void mpam_extend_config(struct mpam_class *class, struct mpam_config *cfg)
+{
+	struct mpam_props *cprops = &class->props;
+	u16 min_hw_granule, max_hw_value, res0_bits;
+
+	/*
+	 * Calculate the values the 'min' control can hold.
+	 * e.g. on a platform with bwa_wd = 8, min_hw_granule is 0x00ff because
+	 * those bits are RES0. Configurations of this value are effectively
+	 * zero. But configurations need to saturate at min_hw_granule on
+	 * systems with mismatched bwa_wd, where the 'less than 0' values are
+	 * implemented on some MSC, but not others.
+	 */
+	res0_bits = 16 - cprops->bwa_wd;
+	max_hw_value = ((1 << cprops->bwa_wd) - 1) << res0_bits;
+	min_hw_granule = ~max_hw_value;
+
+	/*
+	 * MAX and MIN should be set together. If only one is provided,
+	 * generate a configuration for the other. If only one control
+	 * type is supported, the other value will be ignored.
+	 *
+	 * Resctrl can only configure the MAX.
+	 */
+	if (mpam_has_feature(mpam_feat_mbw_max, cfg) &&
+	    !mpam_has_feature(mpam_feat_mbw_min, cfg)) {
+		u16 min, delta;
+
+		delta = ((5 * MPAMCFG_MBW_MAX_MAX) / 100) - 1;
+		if (cfg->mbw_max > delta)
+			min = cfg->mbw_max - delta;
+		else
+			min = 0;
+
+		cfg->mbw_min = max(min, min_hw_granule);
+		mpam_set_feature(mpam_feat_mbw_min, cfg);
+	}
+}
+
 static void mpam_reset_component_cfg(struct mpam_component *comp)
 {
 	int i;
@@ -2426,6 +2470,8 @@ static void mpam_reset_component_cfg(struct mpam_component *comp)
 			comp->cfg[i].mbw_pbm = GENMASK(cprops->mbw_pbm_bits - 1, 0);
 		if (cprops->bwa_wd)
 			comp->cfg[i].mbw_max = GENMASK(15, 16 - cprops->bwa_wd);
+
+		mpam_extend_config(comp->class, &comp->cfg[i]);
 	}
 }
 
@@ -2701,24 +2747,37 @@ static bool mpam_update_config(struct mpam_config *cfg,
 	maybe_update_config(cfg, mpam_feat_cpor_part, newcfg, cpbm, has_changes);
 	maybe_update_config(cfg, mpam_feat_mbw_part, newcfg, mbw_pbm, has_changes);
 	maybe_update_config(cfg, mpam_feat_mbw_max, newcfg, mbw_max, has_changes);
+	maybe_update_config(cfg, mpam_feat_mbw_min, newcfg, mbw_min, has_changes);
 
 	return has_changes;
 }
 
 int mpam_apply_config(struct mpam_component *comp, u16 partid,
-		      struct mpam_config *cfg)
+		      struct mpam_config *user_cfg)
 {
 	struct mpam_write_config_arg arg;
 	struct mpam_msc_ris *ris;
+	struct mpam_config cfg;
 	struct mpam_vmsc *vmsc;
 	struct mpam_msc *msc;
 
 	lockdep_assert_cpus_held();
 
 	/* Don't pass in the current config! */
-	WARN_ON_ONCE(&comp->cfg[partid] == cfg);
+	WARN_ON_ONCE(&comp->cfg[partid] == user_cfg);
+
+	/*
+	 * Copy the config to avoid writing back the 'extended' version to
+	 * the caller.
+	 * This avoids mpam_devices.c setting a mbm_min that mpam_resctrl.c
+	 * is unaware of ... when it then changes mbm_max to be lower than
+	 * mbm_min.
+	 */
+	cfg = *user_cfg;
+
+	mpam_extend_config(comp->class, &cfg);
 
-	if (!mpam_update_config(&comp->cfg[partid], cfg))
+	if (!mpam_update_config(&comp->cfg[partid], &cfg))
 		return 0;
 
 	arg.comp = comp;
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index d9f52023d730..69cb75616561 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -278,10 +278,12 @@ struct mpam_config {
 	u32	cpbm;
 	u32	mbw_pbm;
 	u16	mbw_max;
+	u16	mbw_min;
 
 	bool	reset_cpbm;
 	bool	reset_mbw_pbm;
 	bool	reset_mbw_max;
+	bool	reset_mbw_min;
 
 	struct mpam_garbage	garbage;
 };
@@ -618,6 +620,7 @@ static inline void mpam_resctrl_teardown_class(struct mpam_class *class) { }
  * MPAMCFG_MBW_MAX - MPAM memory maximum bandwidth partitioning configuration
  *                   register
  */
+#define MPAMCFG_MBW_MAX_MAX_NR_BITS	16
 #define MPAMCFG_MBW_MAX_MAX		GENMASK(15, 0)
 #define MPAMCFG_MBW_MAX_HARDLIM		BIT(31)
 
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index e7b839c478fd..019f7a1d74fd 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1446,6 +1446,8 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
 			cfg.mbw_max = percent_to_mbw_max(cfg_val, cprops);
 			mpam_set_feature(mpam_feat_mbw_max, &cfg);
+			/* Allow the min to be calculated from the max */
+			mpam_clear_feature(mpam_feat_mbw_min, &cfg);
 			break;
 		}
 		fallthrough;
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A72D374B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPnYc7Nj2VUBmRTmPYDdoSF1MpKhSPML+gyA6p58mn8=; b=DV6zaHs6a0/m45s5MgxrraVqIt
	sljMUqgVXSaYKi3VkWrZ8aIDrLD7+xp82Ly2vppsf3fG9nB5I3qiW/iT8Okphm7NRD5UjFkxKo6S+
	VINrxh/63SfulRw4Oa1jSqc4Lxy4p4Bh2Cc2Flf6kS9kGaW/eacJYZCxyJzv0pcbVcejdw+APJb5X
	zcGLn3sB8S9oSJaBHpmK+43h6YTh9DEkCCjol1oqXw9ig7IdN5ZsojMo0cxdrGfUNH8WIGI9N0Mu0
	6RlL5gnFDiJVAecY3l7k/T89DKdTHCwGe2uYLmzOyoAb+zexNVcXBh5q5UBURQMU1/2W+84e0vMRv
	1hye8XhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdsD-0000000A7LR-3Ndg;
	Fri, 05 Dec 2025 22:01:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdsB-0000000A7Cv-2eu2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 22:01:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 657E41C00;
	Fri,  5 Dec 2025 14:01:47 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5F883F740;
	Fri,  5 Dec 2025 14:01:50 -0800 (PST)
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
Subject: [RFC PATCH 36/38] arm_mpam: Add workaround for T241-MPAM-4
Date: Fri,  5 Dec 2025 21:58:59 +0000
Message-Id: <20251205215901.17772-37-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_140155_998077_593C787C 
X-CRM114-Status: GOOD (  22.96  )
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

From: Shanker Donthineni <sdonthineni@nvidia.com>

In the T241 implementation of memory-bandwidth partitioning, in the
absence of contention for bandwidth, the minimum bandwidth setting
can affect the amount of achieved bandwidth. Specifically, the
achieved bandwidth in the absence of contention can settle to any
value between the values of MPAMCFG_MBW_MIN and MPAMCFG_MBW_MAX.
Also, if MPAMCFG_MBW_MIN is set zero (below 0.78125%), once a core
enters a throttled state, it will never leave that state.

The first issue is not a cocern if the MPAM software allows to
program MPAMCFG_MBW_MIN through the sysfs interface. This patch
ensures program MBW_MIN=1 (0.78125%) whenever MPAMCFG_MBW_MIN=0
is programmed.

In the scenario where the resctrl doesn't support the MBW_MIN
interface via sysfs, to achieve bandwidth closer to MW_MAX in the
absence of contention, software should configure a relatively narrow
gap between MBW_MIN and MBW_MAX. The recommendation is to use a 5%
gap to mitigate the problem.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
[ morse: Added as second quirk, adapted to use the new intermediate values
  in mpam_extend_config() ]
Signed-off-by: James Morse <james.morse@arm.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 +
 drivers/resctrl/mpam_devices.c              | 60 ++++++++++++++++-----
 drivers/resctrl/mpam_internal.h             |  1 +
 3 files changed, 49 insertions(+), 14 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 4e86b85fe3d6..b18bc704d4a1 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -248,6 +248,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | NVIDIA         | T241 MPAM       | T241-MPAM-1     | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
+| NVIDIA         | T241 MPAM       | T241-MPAM-4     | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | Freescale/NXP  | LS2080A/LS1043A | A-008585        | FSL_ERRATUM_A008585         |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index f1f03ceade0a..5ba0aa703807 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -678,6 +678,12 @@ static const struct mpam_quirk mpam_quirks[] = {
 	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
 	.workaround = T241_SCRUB_SHADOW_REGS,
 	},
+	{
+	/* NVIDIA t241 erratum T241-MPAM-4 */
+	.iidr       = MPAM_IIDR_NVIDIA_T421,
+	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
+	.workaround = T241_FORCE_MBW_MIN_TO_ONE,
+	},
 	{ NULL }, /* Sentinel */
 };
 
@@ -1622,6 +1628,22 @@ static void mpam_init_reset_cfg(struct mpam_config *reset_cfg)
 	bitmap_fill(reset_cfg->features, MPAM_FEATURE_LAST);
 }
 
+/*
+ * This is not part of mpam_init_reset_cfg() as high level callers have the
+ * class, and low level callers a ris.
+ */
+static void mpam_wa_t241_force_mbw_min_to_one(struct mpam_config *cfg,
+					      struct mpam_props *props)
+{
+	u16 max_hw_value, min_hw_granule, res0_bits;
+
+	res0_bits = 16 - props->bwa_wd;
+	max_hw_value = ((1 << props->bwa_wd) - 1) << res0_bits;
+	min_hw_granule = ~max_hw_value;
+
+	cfg->mbw_min = min_hw_granule + 1;
+}
+
 /*
  * Called via smp_call_on_cpu() to prevent migration, while still being
  * pre-emptible. Caller must hold mpam_srcu.
@@ -2524,7 +2546,8 @@ static void __destroy_component_cfg(struct mpam_component *comp)
 static void mpam_reset_component_cfg(struct mpam_component *comp)
 {
 	int i;
-	struct mpam_props *cprops = &comp->class->props;
+	struct mpam_class *class = comp->class;
+	struct mpam_props *cprops = &class->props;
 
 	mpam_assert_partid_sizes_fixed();
 
@@ -2539,6 +2562,10 @@ static void mpam_reset_component_cfg(struct mpam_component *comp)
 			comp->cfg[i].mbw_pbm = GENMASK(cprops->mbw_pbm_bits - 1, 0);
 		if (cprops->bwa_wd)
 			comp->cfg[i].mbw_max = GENMASK(15, 16 - cprops->bwa_wd);
+
+		if (mpam_has_quirk(T241_FORCE_MBW_MIN_TO_ONE, class))
+			mpam_wa_t241_force_mbw_min_to_one(&comp->cfg[i],
+							  &class->props);
 	}
 }
 
@@ -2825,6 +2852,18 @@ static void mpam_extend_config(struct mpam_class *class, struct mpam_config *cfg
 	u16 min, min_hw_granule, delta;
 	u16 max_hw_value, res0_bits;
 
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
 	/*
 	 * MAX and MIN should be set together. If only one is provided,
 	 * generate a configuration for the other. If only one control
@@ -2834,19 +2873,6 @@ static void mpam_extend_config(struct mpam_class *class, struct mpam_config *cfg
 	 */
 	if (mpam_has_feature(mpam_feat_mbw_max, cfg) &&
 	    !mpam_has_feature(mpam_feat_mbw_min, cfg)) {
-		/*
-		 * Calculate the values the 'min' control can hold.
-		 * e.g. on a platform with bwa_wd = 8, min_hw_granule is 0x00ff
-		 * because those bits are RES0. Configurations of this value
-		 * are effectively zero. But configurations need to saturate
-		 * at min_hw_granule on systems with mismatched bwa_wd, where
-		 * the 'less than 0' values are implemented on some MSC, but
-		 * not others.
-		 */
-		res0_bits = 16 - cprops->bwa_wd;
-		max_hw_value = ((1 << cprops->bwa_wd) - 1) << res0_bits;
-		min_hw_granule = ~max_hw_value;
-
 		delta = ((5 * MPAMCFG_MBW_MAX_MAX) / 100) - 1;
 		if (cfg->mbw_max > delta)
 			min = cfg->mbw_max - delta;
@@ -2856,6 +2882,12 @@ static void mpam_extend_config(struct mpam_class *class, struct mpam_config *cfg
 		cfg->mbw_min = max(min, min_hw_granule);
 		mpam_set_feature(mpam_feat_mbw_min, cfg);
 	}
+
+	if (mpam_has_quirk(T241_FORCE_MBW_MIN_TO_ONE, class) &&
+	    cfg->mbw_min <= min_hw_granule) {
+		cfg->mbw_min = min_hw_granule + 1;
+		mpam_set_feature(mpam_feat_mbw_min, cfg);
+	}
 }
 
 int mpam_apply_config(struct mpam_component *comp, u16 partid,
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 70b78cfd1f5b..01882f0acee2 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -223,6 +223,7 @@ struct mpam_props {
 /* Workaround bits for msc->quirks */
 enum mpam_device_quirks {
 	T241_SCRUB_SHADOW_REGS,
+	T241_FORCE_MBW_MIN_TO_ONE,
 	MPAM_QUIRK_LAST,
 };
 
-- 
2.39.5



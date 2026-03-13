Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D07105F7AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zo63nR/GgNbbPAPEw+8SfW4LdWx0P3sA3NeLdC1qWxA=; b=0JdouIvNYog4yJRGNEO0LRWHbx
	tdbxawymOQD1fSPVoBKMUXALoeDkKg97NU1V8iZAXqVGzGIEQMVk0OlKBaTFPBTixdDe44ZaW2nXe
	6BGTcLWV8mLvkCVlUVKJJgbKrtMfbmJtAuSCRNn8Yg0K5E4pZIXLxktb7qDVn/wCVzPNvqACpJUv0
	HN7FexmKYPzJz+agEikTOem33IS8SEI1B6YDVkisf+i9rdcGEHfF5M18N0rZfxnCSw2jHni9UJS5v
	Djy8GmiVolXbpaAKUYIdWdj1QPJghl7O0+N3MZ2oNNhUkIofbulm0Dr9Mx3qSEgBpbwnlbPteFUmS
	X5a7ojog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13pJ-00000000Sw2-05ZC;
	Fri, 13 Mar 2026 14:49:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13pE-00000000Sp2-3ByW
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 14:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zo63nR/GgNbbPAPEw+8SfW4LdWx0P3sA3NeLdC1qWxA=; b=aThc40kj5UPJwpLG35B4Cr4KOj
	XPY2TTBBDXl+NHOb6XV2dWzLry6x9pwKPr98iCLtHjq1v7xyfiYvmxr83qnDGahSKmegfOsGPJnHw
	A0DCM0JLGU2ov9cGVGtMtVftuV7yt70NCRxxQJI/tIGVhZcnyuW7wBYJ+pAA4oVVI/HsbVJSCSr2N
	jNp71xHsvrR+cnFuDLY9vv+ru9YO97gnEenR5FVpytmRVEdHOq4UOqj4bc/XeGg8l7MemzFgQfk6k
	9oO1uV2RbrcVsixbL+EvwCLqmQkdEAutH0PYdPx0HQNdDvKdQAPjaHL+7WKHuCocG+dQaHwRIY8mj
	9nlfohXQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13p6-00000003aHP-40CB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:49:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D374425DC;
	Fri, 13 Mar 2026 07:49:01 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 134313F7BD;
	Fri, 13 Mar 2026 07:49:03 -0700 (PDT)
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
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v6 37/40] arm_mpam: Add workaround for T241-MPAM-4
Date: Fri, 13 Mar 2026 14:46:14 +0000
Message-ID: <20260313144617.3420416-38-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313144617.3420416-1-ben.horgan@arm.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_144909_392148_2EA63CBC 
X-CRM114-Status: GOOD (  19.96  )
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

In the T241 implementation of memory-bandwidth partitioning, in the absence
of contention for bandwidth, the minimum bandwidth setting can affect the
amount of achieved bandwidth. Specifically, the achieved bandwidth in the
absence of contention can settle to any value between the values of
MPAMCFG_MBW_MIN and MPAMCFG_MBW_MAX.  Also, if MPAMCFG_MBW_MIN is set
zero (below 0.78125%), once a core enters a throttled state, it will never
leave that state.

The first issue is not a concern if the MPAM software allows to program
MPAMCFG_MBW_MIN through the sysfs interface. This patch ensures program
MBW_MIN=1 (0.78125%) whenever MPAMCFG_MBW_MIN=0 is programmed.

In the scenario where the resctrl doesn't support the MBW_MIN interface via
sysfs, to achieve bandwidth closer to MBW_MAX in the absence of contention,
software should configure a relatively narrow gap between MBW_MIN and
MBW_MAX. The recommendation is to use a 5% gap to mitigate the problem.

Clear the feature MBW_MIN feature from the class to ensure we don't
accidentally change behaviour when resctrl adds support for a MBW_MIN
interface.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
[ morse: Added as second quirk, adapted to use the new intermediate values
in mpam_extend_config() ]

Changes since rfc:
MPAM_IIDR_NVIDIA_T421 -> MPAM_IIDR_NVIDIA_T241
Handling when reset_mbw_min is set

Changes since v3:
Move the 5% gap policy back here
Clear mbw_min feature in class

Changes since v5:
Calculate min from max when resetting
---
 Documentation/arch/arm64/silicon-errata.rst |  2 +
 drivers/resctrl/mpam_devices.c              | 55 +++++++++++++++++++--
 drivers/resctrl/mpam_internal.h             |  1 +
 3 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index a65620f98e3a..a4b246655e37 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -249,6 +249,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | NVIDIA         | T241 MPAM       | T241-MPAM-1     | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
+| NVIDIA         | T241 MPAM       | T241-MPAM-4     | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | Freescale/NXP  | LS2080A/LS1043A | A-008585        | FSL_ERRATUM_A008585         |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index b1753498f07f..f13537ec7ab5 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -679,6 +679,12 @@ static const struct mpam_quirk mpam_quirks[] = {
 	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
 	.workaround = T241_SCRUB_SHADOW_REGS,
 	},
+	{
+	/* NVIDIA t241 erratum T241-MPAM-4 */
+	.iidr       = MPAM_IIDR_NVIDIA_T241,
+	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
+	.workaround = T241_FORCE_MBW_MIN_TO_ONE,
+	},
 	{ NULL } /* Sentinel */
 };
 
@@ -1464,6 +1470,37 @@ static void mpam_quirk_post_config_change(struct mpam_msc_ris *ris, u16 partid,
 		mpam_apply_t241_erratum(ris, partid);
 }
 
+static u16 mpam_wa_t241_force_mbw_min_to_one(struct mpam_props *props)
+{
+	u16 max_hw_value, min_hw_granule, res0_bits;
+
+	res0_bits = 16 - props->bwa_wd;
+	max_hw_value = ((1 << props->bwa_wd) - 1) << res0_bits;
+	min_hw_granule = ~max_hw_value;
+
+	return min_hw_granule + 1;
+}
+
+static u16 mpam_wa_t241_calc_min_from_max(struct mpam_props *props,
+					  struct mpam_config *cfg)
+{
+	u16 val = 0;
+	u16 max;
+	u16 delta = ((5 * MPAMCFG_MBW_MAX_MAX) / 100) - 1;
+
+	if (mpam_has_feature(mpam_feat_mbw_max, cfg)) {
+		max = cfg->mbw_max;
+	} else {
+		/* Resetting. Hence, use the ris specific default. */
+		max = GENMASK(15, 16 - props->bwa_wd);
+	}
+
+	if (max > delta)
+		val = max - delta;
+
+	return val;
+}
+
 /* Called via IPI. Call while holding an SRCU reference */
 static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 				      struct mpam_config *cfg)
@@ -1504,9 +1541,18 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 			mpam_write_partsel_reg(msc, MBW_PBM, cfg->mbw_pbm);
 	}
 
-	if (mpam_has_feature(mpam_feat_mbw_min, rprops) &&
-	    mpam_has_feature(mpam_feat_mbw_min, cfg))
-		mpam_write_partsel_reg(msc, MBW_MIN, 0);
+	if (mpam_has_feature(mpam_feat_mbw_min, rprops)) {
+		u16 val = 0;
+
+		if (mpam_has_quirk(T241_FORCE_MBW_MIN_TO_ONE, msc)) {
+			u16 min = mpam_wa_t241_force_mbw_min_to_one(rprops);
+
+			val = mpam_wa_t241_calc_min_from_max(rprops, cfg);
+			val = max(val, min);
+		}
+
+		mpam_write_partsel_reg(msc, MBW_MIN, val);
+	}
 
 	if (mpam_has_feature(mpam_feat_mbw_max, rprops)) {
 		if (mpam_has_feature(mpam_feat_mbw_max, cfg))
@@ -2288,6 +2334,9 @@ static void mpam_enable_merge_class_features(struct mpam_component *comp)
 
 	list_for_each_entry(vmsc, &comp->vmsc, comp_list)
 		__class_props_mismatch(class, vmsc);
+
+	if (mpam_has_quirk(T241_FORCE_MBW_MIN_TO_ONE, class))
+		mpam_clear_feature(mpam_feat_mbw_min, &class->props);
 }
 
 /*
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index e38954a735d8..010f4e16a637 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -224,6 +224,7 @@ struct mpam_props {
 /* Workaround bits for msc->quirks */
 enum mpam_device_quirks {
 	T241_SCRUB_SHADOW_REGS,
+	T241_FORCE_MBW_MIN_TO_ONE,
 	MPAM_QUIRK_LAST
 };
 
-- 
2.43.0



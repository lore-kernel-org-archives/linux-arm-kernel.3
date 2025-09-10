Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24D8CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 20:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2tlUKCYuaQT6KYJJ9IHiadryWk4ZV1y1fjsPikbRCE=; b=ea9CrbcFV5AUl0GUwOmJb8AGkb
	lzNXu395EDQWAxRyzTNDdaBaV1Ux7iDJUsui6oVx82pKapvgRX1X+lXo1TJKvlMr9ilddwbct3QfT
	Cok6YiLOdIeR5uOtlD8ZYporvIqNraX3o/g+f2dYNER1OLG12gsFQtRDd9+DYh43T/FLMXefl+LJ6
	eyjY2wvfMkhx0tMECqwj+wl+t7D+hP/R/GNFllH4xOyRxe6B7yRx1XvxKne5c7XUxFJcUDbMH/CG6
	LM3r+8WnYRVHJbMAcwGKj1oaiUDw8bydlEwg5FD2BTpJTrOvdFRGicwm1HTq5nYkQGUVCuzyETP+P
	wS/09oyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRit-0000000Gfp7-2DjN;
	Wed, 10 Sep 2025 20:47:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRis-0000000GfoT-06tD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 10 Sep 2025 20:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=o2tlUKCYuaQT6KYJJ9IHiadryWk4ZV1y1fjsPikbRCE=; b=SwlVRS/Ooyl88+4/J7ncdpIS7O
	HvDG8ygYGYdfPgtYpGysSgnoYd8KqH8gFEP+cEGylmtDNccFxTV+voPiFExk5e9cfWLaX80Ko0SnX
	LvjoJxCU2VGQPXFFH4Jps1b+lJuwebbOYAD9zOCvNq8r/mpIVzhjxLl9fzcoV1MKounwU6CLecssB
	DahCTpyD2qF5gC6Dw2Gv/I3Yd0gq6kj3MVRhyCxClGHqrmP2EzCU244hhMuQKAg2RbWDZYCO/8cA1
	kUirrL+/t5CkEkUvIoJBKp3kcqhwJ51Xa8/h74aCdiZLwYai10FUAyJxqzZNrqIoRzUPg6yR6ztQL
	YeA5jv5g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRgN-00000005xGt-1JJN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 20:47:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBB431D34;
	Wed, 10 Sep 2025 13:44:26 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73E003F63F;
	Wed, 10 Sep 2025 13:44:30 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
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
	David Hildenbrand <david@redhat.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>
Subject: [PATCH v2 13/29] arm_mpam: Probe the hardware features resctrl supports
Date: Wed, 10 Sep 2025 20:42:53 +0000
Message-Id: <20250910204309.20751-14-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250910204309.20751-1-james.morse@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_214516_634996_C1EBD759 
X-CRM114-Status: GOOD (  21.07  )
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

Expand the probing support with the control and monitor types
we can use with resctrl.

CC: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
Changes since v1:
 * added an underscore to a variable name.

Changes since RFC:
 * Made mpam_ris_hw_probe_hw_nrdy() more in C.
 * Added static assert on features bitmap size.
---
 drivers/resctrl/mpam_devices.c  | 151 ++++++++++++++++++++++++++++++++
 drivers/resctrl/mpam_internal.h |  53 +++++++++++
 2 files changed, 204 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index a26b012452e2..ba8e8839cdc4 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -138,6 +138,20 @@ static inline void _mpam_write_partsel_reg(struct mpam_msc *msc, u16 reg, u32 va
 }
 #define mpam_write_partsel_reg(msc, reg, val)  _mpam_write_partsel_reg(msc, MPAMCFG_##reg, val)
 
+static inline u32 _mpam_read_monsel_reg(struct mpam_msc *msc, u16 reg)
+{
+	mpam_mon_sel_lock_held(msc);
+	return __mpam_read_reg(msc, reg);
+}
+#define mpam_read_monsel_reg(msc, reg) _mpam_read_monsel_reg(msc, MSMON_##reg)
+
+static inline void _mpam_write_monsel_reg(struct mpam_msc *msc, u16 reg, u32 val)
+{
+	mpam_mon_sel_lock_held(msc);
+	__mpam_write_reg(msc, reg, val);
+}
+#define mpam_write_monsel_reg(msc, reg, val)   _mpam_write_monsel_reg(msc, MSMON_##reg, val)
+
 static u64 mpam_msc_read_idr(struct mpam_msc *msc)
 {
 	u64 idr_high = 0, idr_low;
@@ -572,6 +586,136 @@ static struct mpam_msc_ris *mpam_get_or_create_ris(struct mpam_msc *msc,
 	return found;
 }
 
+/*
+ * IHI009A.a has this nugget: "If a monitor does not support automatic behaviour
+ * of NRDY, software can use this bit for any purpose" - so hardware might not
+ * implement this - but it isn't RES0.
+ *
+ * Try and see what values stick in this bit. If we can write either value,
+ * its probably not implemented by hardware.
+ */
+static bool _mpam_ris_hw_probe_hw_nrdy(struct mpam_msc_ris * ris, u32 mon_reg)
+{
+	u32 now;
+	u64 mon_sel;
+	bool can_set, can_clear;
+	struct mpam_msc *msc = ris->vmsc->msc;
+
+	if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
+		return false;
+
+	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, 0) |
+		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
+	_mpam_write_monsel_reg(msc, mon_reg, mon_sel);
+
+	_mpam_write_monsel_reg(msc, mon_reg, MSMON___NRDY);
+	now = _mpam_read_monsel_reg(msc, mon_reg);
+	can_set = now & MSMON___NRDY;
+
+	_mpam_write_monsel_reg(msc, mon_reg, 0);
+	now = _mpam_read_monsel_reg(msc, mon_reg);
+	can_clear = !(now & MSMON___NRDY);
+	mpam_mon_sel_unlock(msc);
+
+	return (!can_set || !can_clear);
+}
+
+#define mpam_ris_hw_probe_hw_nrdy(_ris, _mon_reg)			\
+        _mpam_ris_hw_probe_hw_nrdy(_ris, MSMON_##_mon_reg)
+
+static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
+{
+	int err;
+	struct mpam_msc *msc = ris->vmsc->msc;
+	struct device *dev = &msc->pdev->dev;
+	struct mpam_props *props = &ris->props;
+
+	lockdep_assert_held(&msc->probe_lock);
+	lockdep_assert_held(&msc->part_sel_lock);
+
+	/* Cache Portion partitioning */
+	if (FIELD_GET(MPAMF_IDR_HAS_CPOR_PART, ris->idr)) {
+		u32 cpor_features = mpam_read_partsel_reg(msc, CPOR_IDR);
+
+		props->cpbm_wd = FIELD_GET(MPAMF_CPOR_IDR_CPBM_WD, cpor_features);
+		if (props->cpbm_wd)
+			mpam_set_feature(mpam_feat_cpor_part, props);
+	}
+
+	/* Memory bandwidth partitioning */
+	if (FIELD_GET(MPAMF_IDR_HAS_MBW_PART, ris->idr)) {
+		u32 mbw_features = mpam_read_partsel_reg(msc, MBW_IDR);
+
+		/* portion bitmap resolution */
+		props->mbw_pbm_bits = FIELD_GET(MPAMF_MBW_IDR_BWPBM_WD, mbw_features);
+		if (props->mbw_pbm_bits &&
+		    FIELD_GET(MPAMF_MBW_IDR_HAS_PBM, mbw_features))
+			mpam_set_feature(mpam_feat_mbw_part, props);
+
+		props->bwa_wd = FIELD_GET(MPAMF_MBW_IDR_BWA_WD, mbw_features);
+		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features))
+			mpam_set_feature(mpam_feat_mbw_max, props);
+	}
+
+	/* Performance Monitoring */
+	if (FIELD_GET(MPAMF_IDR_HAS_MSMON, ris->idr)) {
+		u32 msmon_features = mpam_read_partsel_reg(msc, MSMON_IDR);
+
+		/*
+		 * If the firmware max-nrdy-us property is missing, the
+		 * CSU counters can't be used. Should we wait forever?
+		 */
+		err = device_property_read_u32(&msc->pdev->dev,
+					       "arm,not-ready-us",
+					       &msc->nrdy_usec);
+
+		if (FIELD_GET(MPAMF_MSMON_IDR_MSMON_CSU, msmon_features)) {
+			u32 csumonidr;
+
+			csumonidr = mpam_read_partsel_reg(msc, CSUMON_IDR);
+			props->num_csu_mon = FIELD_GET(MPAMF_CSUMON_IDR_NUM_MON, csumonidr);
+			if (props->num_csu_mon) {
+				bool hw_managed;
+
+				mpam_set_feature(mpam_feat_msmon_csu, props);
+
+				/* Is NRDY hardware managed? */
+				hw_managed = mpam_ris_hw_probe_hw_nrdy(ris, CSU);
+				if (hw_managed)
+					mpam_set_feature(mpam_feat_msmon_csu_hw_nrdy, props);
+			}
+
+			/*
+			 * Accept the missing firmware property if NRDY appears
+			 * un-implemented.
+			 */
+			if (err && mpam_has_feature(mpam_feat_msmon_csu_hw_nrdy, props))
+				dev_err_once(dev, "Counters are not usable because not-ready timeout was not provided by firmware.");
+		}
+		if (FIELD_GET(MPAMF_MSMON_IDR_MSMON_MBWU, msmon_features)) {
+			bool hw_managed;
+			u32 mbwumon_idr = mpam_read_partsel_reg(msc, MBWUMON_IDR);
+
+			props->num_mbwu_mon = FIELD_GET(MPAMF_MBWUMON_IDR_NUM_MON, mbwumon_idr);
+			if (props->num_mbwu_mon)
+				mpam_set_feature(mpam_feat_msmon_mbwu, props);
+
+			if (FIELD_GET(MPAMF_MBWUMON_IDR_HAS_RWBW, mbwumon_idr))
+				mpam_set_feature(mpam_feat_msmon_mbwu_rwbw, props);
+
+			/* Is NRDY hardware managed? */
+			hw_managed = mpam_ris_hw_probe_hw_nrdy(ris, MBWU);
+			if (hw_managed)
+				mpam_set_feature(mpam_feat_msmon_mbwu_hw_nrdy, props);
+
+			/*
+			 * Don't warn about any missing firmware property for
+			 * MBWU NRDY - it doesn't make any sense!
+			 */
+		}
+	}
+}
+
 static int mpam_msc_hw_probe(struct mpam_msc *msc)
 {
 	u64 idr;
@@ -592,6 +736,7 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 	mutex_lock(&msc->part_sel_lock);
 	idr = mpam_msc_read_idr(msc);
 	mutex_unlock(&msc->part_sel_lock);
+
 	msc->ris_max = FIELD_GET(MPAMF_IDR_RIS_MAX, idr);
 
 	/* Use these values so partid/pmg always starts with a valid value */
@@ -614,6 +759,12 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 		mutex_unlock(&mpam_list_lock);
 		if (IS_ERR(ris))
 			return PTR_ERR(ris);
+		ris->idr = idr;
+
+		mutex_lock(&msc->part_sel_lock);
+		__mpam_part_sel(ris_idx, 0, msc);
+		mpam_ris_hw_probe(ris);
+		mutex_unlock(&msc->part_sel_lock);
 	}
 
 	spin_lock(&partid_max_lock);
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 4cc44d4e21c4..5ae5d4eee8ec 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -112,6 +112,55 @@ static inline void mpam_mon_sel_lock_init(struct mpam_msc *msc)
 	raw_spin_lock_init(&msc->_mon_sel_lock);
 }
 
+/*
+ * When we compact the supported features, we don't care what they are.
+ * Storing them as a bitmap makes life easy.
+ */
+typedef u16 mpam_features_t;
+
+/* Bits for mpam_features_t */
+enum mpam_device_features {
+	mpam_feat_ccap_part = 0,
+	mpam_feat_cpor_part,
+	mpam_feat_mbw_part,
+	mpam_feat_mbw_min,
+	mpam_feat_mbw_max,
+	mpam_feat_mbw_prop,
+	mpam_feat_msmon,
+	mpam_feat_msmon_csu,
+	mpam_feat_msmon_csu_capture,
+	mpam_feat_msmon_csu_hw_nrdy,
+	mpam_feat_msmon_mbwu,
+	mpam_feat_msmon_mbwu_capture,
+	mpam_feat_msmon_mbwu_rwbw,
+	mpam_feat_msmon_mbwu_hw_nrdy,
+	mpam_feat_msmon_capt,
+	MPAM_FEATURE_LAST,
+};
+static_assert(BITS_PER_TYPE(mpam_features_t) >= MPAM_FEATURE_LAST);
+
+struct mpam_props {
+	mpam_features_t		features;
+
+	u16			cpbm_wd;
+	u16			mbw_pbm_bits;
+	u16			bwa_wd;
+	u16			num_csu_mon;
+	u16			num_mbwu_mon;
+};
+
+static inline bool mpam_has_feature(enum mpam_device_features feat,
+				    struct mpam_props *props)
+{
+	return (1 << feat) & props->features;
+}
+
+static inline void mpam_set_feature(enum mpam_device_features feat,
+				    struct mpam_props *props)
+{
+	props->features |= (1 << feat);
+}
+
 struct mpam_class {
 	/* mpam_components in this class */
 	struct list_head	components;
@@ -151,6 +200,8 @@ struct mpam_vmsc {
 	/* mpam_msc_ris in this vmsc */
 	struct list_head	ris;
 
+	struct mpam_props	props;
+
 	/* All RIS in this vMSC are members of this MSC */
 	struct mpam_msc		*msc;
 
@@ -162,6 +213,8 @@ struct mpam_vmsc {
 
 struct mpam_msc_ris {
 	u8			ris_idx;
+	u64			idr;
+	struct mpam_props	props;
 
 	cpumask_t		affinity;
 
-- 
2.39.5



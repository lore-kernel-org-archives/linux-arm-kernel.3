Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2ED4CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 17:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlXiaxiXuj0mz7/9xHNYLFW1U/KrSe+PFzitiWtaebk=; b=ywRPzzzBuHnFhM4XCLG+ekQJv8
	5I6NH4sdpZlkr4VMi+QDzqBnGmotODGGJit1UwI654soaCfYFHbme2Fci5BDmd/xpGTaSKh5On0SK
	rK6kvEBONOIarH/JK/ICogpUAeQTgYVW6c7fYGZC+AbCSWLaBLYqS1f56lrsEE36qgRzAhdh4sRuM
	UGnxdPhZz1Y6wGDtS8Lzd62PGScJ49RLfU1PicYAEdQoklDzB1M8Ev6SZFawjvg9y78qKGInR9HDC
	Hekk/2D0zt9rvn4Je/rtor4CE1rkWnshbZyqrEk+EEY+3FYjSz4KUwCXHtgaQ3g12WZjBGjmbL2YW
	ZIik84ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2c6-0000000GTDm-3EAN;
	Mon, 17 Nov 2025 17:02:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2c4-0000000GTBi-45mh
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 17:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DlXiaxiXuj0mz7/9xHNYLFW1U/KrSe+PFzitiWtaebk=; b=WgJbcbxCAGihU4EDKTomFGien2
	+1krLdwrw7/YVt8kt4aNCEDBSfTxqA1DzsJjMk4Y5W7opx9idLyT/SecmUVZ1FmgCRN1eDdKTeSWv
	r3FLixziHKOZPpZyt9k56AfK+nhUBAojIR0IUqPMApwgrI71ch2WVeXw22QQsf6RYxj7XdP4d/LEe
	WsAfBJJp45uwpPEFEmiaw5lnCRp3pIB1ncgx2Bc/t4ae2yG+WiV8Fu55KZPv1nZqWe0va3eTXMH4l
	f+9hPAOMMsQWggOPKGdguTiY12NepemNSpITk6XB77PQItUz8wDIKfd1fNcyggPalTAijjMcnCL9o
	+umC1oyA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1kM-00000007ixw-1QT2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 16:06:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD244FEC;
	Mon, 17 Nov 2025 09:01:47 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2215A3F66E;
	Mon, 17 Nov 2025 09:01:50 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: james.morse@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	bobo.shaobowang@huawei.com,
	carl@os.amperecomputing.com,
	catalin.marinas@arm.com,
	dakr@kernel.org,
	dave.martin@arm.com,
	david@redhat.com,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gregkh@linuxfoundation.org,
	gshan@redhat.com,
	guohanjun@huawei.com,
	jeremy.linton@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	peternewman@google.com,
	quic_jiles@quicinc.com,
	rafael@kernel.org,
	robh@kernel.org,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	sudeep.holla@arm.com,
	tan.shaopeng@fujitsu.com,
	will@kernel.org,
	xhao@linux.alibaba.com,
	Dave Martin <Dave.Martin@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v5 16/34] arm_mpam: Probe the hardware features resctrl supports
Date: Mon, 17 Nov 2025 16:59:55 +0000
Message-ID: <20251117170014.4113754-17-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117170014.4113754-1-ben.horgan@arm.com>
References: <20251117170014.4113754-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_160630_805696_E566443F 
X-CRM114-Status: GOOD (  19.31  )
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

Expand the probing support with the control and monitor types
we can use with resctrl.

CC: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Carl Worth <carl@os.amperecomputing.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v3:
Drop the =0 in the enum (Jonathan)
---
 drivers/resctrl/mpam_devices.c  | 149 ++++++++++++++++++++++++++++++++
 drivers/resctrl/mpam_internal.h |  33 +++++++
 2 files changed, 182 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index b0374dea1727..574093c8e95a 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -170,6 +170,22 @@ static inline void _mpam_write_partsel_reg(struct mpam_msc *msc, u16 reg, u32 va
 
 #define mpam_write_partsel_reg(msc, reg, val)  _mpam_write_partsel_reg(msc, MPAMCFG_##reg, val)
 
+static inline u32 _mpam_read_monsel_reg(struct mpam_msc *msc, u16 reg)
+{
+	mpam_mon_sel_lock_held(msc);
+	return __mpam_read_reg(msc, reg);
+}
+
+#define mpam_read_monsel_reg(msc, reg) _mpam_read_monsel_reg(msc, MSMON_##reg)
+
+static inline void _mpam_write_monsel_reg(struct mpam_msc *msc, u16 reg, u32 val)
+{
+	mpam_mon_sel_lock_held(msc);
+	__mpam_write_reg(msc, reg, val);
+}
+
+#define mpam_write_monsel_reg(msc, reg, val)   _mpam_write_monsel_reg(msc, MSMON_##reg, val)
+
 static u64 mpam_msc_read_idr(struct mpam_msc *msc)
 {
 	u64 idr_high = 0, idr_low;
@@ -548,6 +564,133 @@ static struct mpam_msc_ris *mpam_get_or_create_ris(struct mpam_msc *msc,
 	return ERR_PTR(-ENOENT);
 }
 
+/*
+ * IHI009A.a has this nugget: "If a monitor does not support automatic behaviour
+ * of NRDY, software can use this bit for any purpose" - so hardware might not
+ * implement this - but it isn't RES0.
+ *
+ * Try and see what values stick in this bit. If we can write either value,
+ * its probably not implemented by hardware.
+ */
+static bool _mpam_ris_hw_probe_hw_nrdy(struct mpam_msc_ris *ris, u32 mon_reg)
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
+	_mpam_ris_hw_probe_hw_nrdy(_ris, MSMON_##_mon_reg)
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
@@ -591,6 +734,12 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
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
index b62ee55e1ed5..09c27000234d 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -5,12 +5,14 @@
 #define MPAM_INTERNAL_H
 
 #include <linux/arm_mpam.h>
+#include <linux/bitmap.h>
 #include <linux/cpumask.h>
 #include <linux/io.h>
 #include <linux/llist.h>
 #include <linux/mutex.h>
 #include <linux/srcu.h>
 #include <linux/spinlock.h>
+#include <linux/srcu.h>
 #include <linux/types.h>
 
 #define MPAM_MSC_MAX_NUM_RIS	16
@@ -110,6 +112,33 @@ static inline void mpam_mon_sel_lock_init(struct mpam_msc *msc)
 	raw_spin_lock_init(&msc->_mon_sel_lock);
 }
 
+/* Bits for mpam features bitmaps */
+enum mpam_device_features {
+	mpam_feat_cpor_part,
+	mpam_feat_mbw_part,
+	mpam_feat_mbw_min,
+	mpam_feat_mbw_max,
+	mpam_feat_msmon,
+	mpam_feat_msmon_csu,
+	mpam_feat_msmon_csu_hw_nrdy,
+	mpam_feat_msmon_mbwu,
+	mpam_feat_msmon_mbwu_hw_nrdy,
+	MPAM_FEATURE_LAST
+};
+
+struct mpam_props {
+	DECLARE_BITMAP(features, MPAM_FEATURE_LAST);
+
+	u16			cpbm_wd;
+	u16			mbw_pbm_bits;
+	u16			bwa_wd;
+	u16			num_csu_mon;
+	u16			num_mbwu_mon;
+};
+
+#define mpam_has_feature(_feat, x)	test_bit(_feat, (x)->features)
+#define mpam_set_feature(_feat, x)	set_bit(_feat, (x)->features)
+
 struct mpam_class {
 	/* mpam_components in this class */
 	struct list_head	components;
@@ -149,6 +178,8 @@ struct mpam_vmsc {
 	/* mpam_msc_ris in this vmsc */
 	struct list_head	ris;
 
+	struct mpam_props	props;
+
 	/* All RIS in this vMSC are members of this MSC */
 	struct mpam_msc		*msc;
 
@@ -160,6 +191,8 @@ struct mpam_vmsc {
 
 struct mpam_msc_ris {
 	u8			ris_idx;
+	u64			idr;
+	struct mpam_props	props;
 
 	cpumask_t		affinity;
 
-- 
2.43.0



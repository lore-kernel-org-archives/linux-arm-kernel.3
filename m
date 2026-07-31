Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E9DC55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYcOnb5WeApK2t4jAtP3rBymtJtoSqwVDMT3boYmSUM=; b=zE3I2ulDlteGzNLL/VjgkoCBjB
	6BvnEH/sje2ll+0EiKwE7otz58+tkMptOKPngOR7tpoSMXVEBLfjE41xJo1XWSElKk2Eei1BI98s3
	RKOKeGTpTb5TQsW3bFuXaDciLIEVEf3qZf4wJBIlce+DVbTXypXKgmv2POT4CIhuVZKzZ/gPsmfIA
	1XSWZvSIVRpBBDPxF8GHQZ3eqRjaDMFKzf2dTcTjsMzDkY8uJaSGzVn+3NEoiNgFy17XYSHFqL13h
	Fxincfq2glBrcKlc0SxjTRsk4k39JMEVID4c2qbkfgXJF4Ap6cMy3OmGehulrgNtIiGazTHPDWCP1
	Q7NkyvVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqeE-0000000DCS8-0Y1z;
	Fri, 31 Jul 2026 17:03:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqeA-0000000DCQt-0rJ8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:03:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4334022C7;
	Fri, 31 Jul 2026 10:03:40 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7CE93F66F;
	Fri, 31 Jul 2026 10:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785517424; bh=L152i8X2M1rjv9ih66ZpSFkp4aFXkyirB5ea9ojFK1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K9gYX3TA3usAsRsV1iZHCUn7MxLgnGIpOP9prRyQeFUHzE7KLQb6z3whtMJJIYBDq
	 89xPjtbF8hPdZWpNUmcuOA3Ee7o13SIhDrmLrVEQjaDK3EEYcgge1D16nvclLCVq/R
	 fj9/cW25carzpH8B5pNNshzygLi+aGmpreKr2iiw=
From: Andre Przywara <andre.przywara@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Srinivas Ramana <sramana@qti.qualcomm.com>,
	Niyas Sait <niyas.sait@arm.com>,
	Lee Trager <lee@trager.us>,
	Ritwick Sharma <ritwick.sharma@arm.com>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 02/11] arm_mpam: propagate MSC access errors for hw_probe functions
Date: Fri, 31 Jul 2026 19:03:15 +0200
Message-ID: <20260731170324.2927758-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731170324.2927758-1-andre.przywara@arm.com>
References: <20260731170324.2927758-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_100346_352927_3D31B68D 
X-CRM114-Status: GOOD (  18.42  )
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

Allow the functions probing for MSC hardware and features to return an
error, and propagate read and write errors from the lower level up.
This uses some "scoped cleanup" functions like scoped_guard() and
ACQUIRE() to avoid the complexity of error handling when a lock has been
taken. Since the mon_sel_lock is a bit special (even more so in an
upcoming patch), we define a new GUARD type for it.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c  | 126 +++++++++++++++++++++-----------
 drivers/resctrl/mpam_internal.h |   4 +
 2 files changed, 87 insertions(+), 43 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 04d504031752..017e5bf067bc 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -798,38 +798,46 @@ static bool mpam_ris_hw_probe_csu_nrdy(struct mpam_msc_ris *ris)
 	bool can_set, can_clear;
 	struct mpam_msc *msc = ris->vmsc->msc;
 
-	if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
+	ACQUIRE(mon_sel_lock, guard)(msc);
+	if (ACQUIRE_ERR(mon_sel_lock, &guard))
 		return false;
 
 	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, 0) |
 		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
-	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+	if (mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel))
+		return false;
 
 	/* Hardware might ignore nrdy if it's not enabled */
 	ctl_val = MSMON_CFG_CSU_CTL_TYPE_CSU;
 	ctl_val |= MSMON_CFG_x_CTL_MATCH_PARTID;
 	ctl_val |= MSMON_CFG_x_CTL_MATCH_PMG;
 	ctl_val |= MSMON_CFG_x_CTL_EN;
-	mpam_write_monsel_reg(msc, CFG_CSU_FLT, 0);
-	mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val);
+	if (mpam_write_monsel_reg(msc, CFG_CSU_FLT, 0))
+		return false;
+	if (mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val))
+		return false;
 
-	_mpam_write_monsel_reg(msc, MSMON_CSU, MSMON___NRDY);
-	_mpam_read_monsel_reg(msc, MSMON_CSU, &now);
+	if (_mpam_write_monsel_reg(msc, MSMON_CSU, MSMON___NRDY))
+		return false;
+	if (_mpam_read_monsel_reg(msc, MSMON_CSU, &now))
+		return false;
 	can_set = now & MSMON___NRDY;
 
-	_mpam_write_monsel_reg(msc, MSMON_CSU, 0);
+	if (_mpam_write_monsel_reg(msc, MSMON_CSU, 0))
+		return false;
 	/* Configuration change to try and coax hardware into setting nrdy */
-	mpam_write_monsel_reg(msc, CFG_CSU_FLT, 0x1);
-	_mpam_read_monsel_reg(msc, MSMON_CSU, &now);
+	if (mpam_write_monsel_reg(msc, CFG_CSU_FLT, 0x1))
+		return false;
+	if (_mpam_read_monsel_reg(msc, MSMON_CSU, &now))
+		return false;
 	can_clear = !(now & MSMON___NRDY);
-	mpam_mon_sel_unlock(msc);
 
 	return (!can_set || !can_clear);
 }
 
-static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
+static int mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 {
-	int err;
+	int fw_has_nrdy_err, err;
 	struct mpam_msc *msc = ris->vmsc->msc;
 	struct device *dev = &msc->pdev->dev;
 	struct mpam_props *props = &ris->props;
@@ -842,7 +850,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 	if (FIELD_GET(MPAMF_IDR_HAS_CCAP_PART, ris->idr)) {
 		u32 ccap_features;
 
-		mpam_read_partsel_reg(msc, CCAP_IDR, &ccap_features);
+		err = mpam_read_partsel_reg(msc, CCAP_IDR, &ccap_features);
+		if (err)
+			return err;
 
 		props->cmax_wd = FIELD_GET(MPAMF_CCAP_IDR_CMAX_WD, ccap_features);
 		if (props->cmax_wd &&
@@ -867,7 +877,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 	if (FIELD_GET(MPAMF_IDR_HAS_CPOR_PART, ris->idr)) {
 		u32 cpor_features;
 
-		mpam_read_partsel_reg(msc, CPOR_IDR, &cpor_features);
+		err = mpam_read_partsel_reg(msc, CPOR_IDR, &cpor_features);
+		if (err)
+			return err;
 
 		props->cpbm_wd = FIELD_GET(MPAMF_CPOR_IDR_CPBM_WD, cpor_features);
 		if (props->cpbm_wd)
@@ -877,8 +889,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 	/* Memory bandwidth partitioning */
 	if (FIELD_GET(MPAMF_IDR_HAS_MBW_PART, ris->idr)) {
 		u32 mbw_features;
-
-		mpam_read_partsel_reg(msc, MBW_IDR, &mbw_features);
+		err = mpam_read_partsel_reg(msc, MBW_IDR, &mbw_features);
+		if (err)
+			return err;
 
 		/* portion bitmap resolution */
 		props->mbw_pbm_bits = FIELD_GET(MPAMF_MBW_IDR_BWPBM_WD, mbw_features);
@@ -907,8 +920,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 	/* Priority partitioning */
 	if (FIELD_GET(MPAMF_IDR_HAS_PRI_PART, ris->idr)) {
 		u32 pri_features;
-
-		mpam_read_partsel_reg(msc, PRI_IDR, &pri_features);
+		err = mpam_read_partsel_reg(msc, PRI_IDR, &pri_features);
+		if (err)
+			return err;
 
 		props->intpri_wd = FIELD_GET(MPAMF_PRI_IDR_INTPRI_WD, pri_features);
 		if (props->intpri_wd && FIELD_GET(MPAMF_PRI_IDR_HAS_INTPRI, pri_features)) {
@@ -929,20 +943,24 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 	if (FIELD_GET(MPAMF_IDR_HAS_MSMON, ris->idr)) {
 		u32 msmon_features;
 
-		mpam_read_partsel_reg(msc, MSMON_IDR, &msmon_features);
+		err = mpam_read_partsel_reg(msc, MSMON_IDR, &msmon_features);
+		if (err)
+			return err;
 
 		/*
 		 * If the firmware max-nrdy-us property is missing, the
 		 * CSU counters can't be used. Should we wait forever?
 		 */
-		err = device_property_read_u32(&msc->pdev->dev,
-					       "arm,not-ready-us",
-					       &msc->nrdy_usec);
+		fw_has_nrdy_err = device_property_read_u32(&msc->pdev->dev,
+							   "arm,not-ready-us",
+							   &msc->nrdy_usec);
 
 		if (FIELD_GET(MPAMF_MSMON_IDR_MSMON_CSU, msmon_features)) {
 			u32 csumonidr;
 
-			mpam_read_partsel_reg(msc, CSUMON_IDR, &csumonidr);
+			err = mpam_read_partsel_reg(msc, CSUMON_IDR, &csumonidr);
+			if (err)
+				return err;
 
 			props->num_csu_mon = FIELD_GET(MPAMF_CSUMON_IDR_NUM_MON, csumonidr);
 			if (props->num_csu_mon) {
@@ -960,7 +978,7 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 				 * Accept the missing firmware property if NRDY appears
 				 * un-implemented.
 				 */
-				if (err && hw_managed)
+				if (fw_has_nrdy_err && hw_managed)
 					dev_err_once(dev, "Counters are not usable because not-ready timeout was not provided by firmware.");
 			}
 		}
@@ -968,7 +986,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 			bool has_long;
 			u32 mbwumon_idr;
 
-			mpam_read_partsel_reg(msc, MBWUMON_IDR, &mbwumon_idr);
+			err = mpam_read_partsel_reg(msc, MBWUMON_IDR, &mbwumon_idr);
+			if (err)
+				return err;
 
 			props->num_mbwu_mon = FIELD_GET(MPAMF_MBWUMON_IDR_NUM_MON, mbwumon_idr);
 			if (props->num_mbwu_mon) {
@@ -1001,16 +1021,22 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 		u16 partid_max;
 		u32 nrwidr;
 
-		mpam_read_partsel_reg(msc, PARTID_NRW_IDR, &nrwidr);
+		err = mpam_read_partsel_reg(msc, PARTID_NRW_IDR, &nrwidr);
+		if (err)
+			return err;
+
 		partid_max = FIELD_GET(MPAMF_PARTID_NRW_IDR_INTPARTID_MAX, nrwidr);
 
 		mpam_set_feature(mpam_feat_partid_nrw, props);
 		msc->partid_max = min(msc->partid_max, partid_max);
 	}
+
+	return 0;
 }
 
 static int mpam_msc_hw_probe(struct mpam_msc *msc)
 {
+	int ret;
 	u64 idr;
 	u16 partid_max;
 	u8 ris_idx, pmg_max;
@@ -1025,11 +1051,15 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 	}
 
 	/* Grab an IDR value to find out how many RIS there are */
-	mutex_lock(&msc->part_sel_lock);
-	mpam_msc_read_idr(msc, &idr);
-	mpam_read_partsel_reg(msc, IIDR, &msc->iidr);
+	scoped_guard(mutex, &msc->part_sel_lock) {
+		ret = mpam_msc_read_idr(msc, &idr);
+		if (ret)
+			return ret;
 
-	mutex_unlock(&msc->part_sel_lock);
+		ret = mpam_read_partsel_reg(msc, IIDR, &msc->iidr);
+		if (ret)
+			return ret;
+	}
 
 	mpam_enable_quirks(msc);
 
@@ -1040,10 +1070,15 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 	msc->pmg_max = FIELD_GET(MPAMF_IDR_PMG_MAX, idr);
 
 	for (ris_idx = 0; ris_idx <= msc->ris_max; ris_idx++) {
-		mutex_lock(&msc->part_sel_lock);
-		__mpam_part_sel(ris_idx, 0, msc);
-		mpam_msc_read_idr(msc, &idr);
-		mutex_unlock(&msc->part_sel_lock);
+		scoped_guard(mutex, &msc->part_sel_lock) {
+			ret = __mpam_part_sel(ris_idx, 0, msc);
+			if (ret)
+				return ret;
+
+			ret = mpam_msc_read_idr(msc, &idr);
+			if (ret)
+				return ret;
+		}
 
 		partid_max = FIELD_GET(MPAMF_IDR_PARTID_MAX, idr);
 		pmg_max = FIELD_GET(MPAMF_IDR_PMG_MAX, idr);
@@ -1051,17 +1086,22 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 		msc->pmg_max = min(msc->pmg_max, pmg_max);
 		msc->has_extd_esr = FIELD_GET(MPAMF_IDR_HAS_EXTD_ESR, idr);
 
-		mutex_lock(&mpam_list_lock);
-		ris = mpam_get_or_create_ris(msc, ris_idx);
-		mutex_unlock(&mpam_list_lock);
-		if (IS_ERR(ris))
-			return PTR_ERR(ris);
+		scoped_guard(mutex, &mpam_list_lock) {
+			ris = mpam_get_or_create_ris(msc, ris_idx);
+			if (IS_ERR(ris))
+				return PTR_ERR(ris);
+		}
 		ris->idr = idr;
 
-		mutex_lock(&msc->part_sel_lock);
-		__mpam_part_sel(ris_idx, 0, msc);
-		mpam_ris_hw_probe(ris);
-		mutex_unlock(&msc->part_sel_lock);
+		scoped_guard(mutex, &msc->part_sel_lock) {
+			ret = __mpam_part_sel(ris_idx, 0, msc);
+			if (ret)
+				return ret;
+
+			ret = mpam_ris_hw_probe(ris);
+			if (ret)
+				return ret;
+		}
 	}
 
 	/* Clear any stale errors */
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 04d1a59f02af..57f2b3dbf7d0 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -162,6 +162,10 @@ static inline void mpam_mon_sel_lock_init(struct mpam_msc *msc)
 	raw_spin_lock_init(&msc->_mon_sel_lock);
 }
 
+DEFINE_GUARD(mon_sel, struct mpam_msc *,
+	     mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
+DEFINE_GUARD_COND(mon_sel, _lock, mpam_mon_sel_lock(_T), _RET);
+
 /* Bits for mpam features bitmaps */
 enum mpam_device_features {
 	mpam_feat_cpor_part,
-- 
2.43.0



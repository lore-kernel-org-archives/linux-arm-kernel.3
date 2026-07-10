Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC765C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3Tmq1m0/VpLbVxQwHnhSg1P4sueEusoJ24AznkMEN0=; b=j023YGOslYdpDwii/Jy0UfdJzg
	yysAOnnqoVKFwAreauVS17fPuiS4k66MIki0YkxGP4AupgAowzRnwclDHJ9itNW9a+yOZpzwejzpX
	EyWaJiVCV9KYlL59Af8w3B4x7LRGTNNNAoKUN1cLw4TPCLhf44K4WAO12SaeD7oHeVAC4p97je6So
	V6/7S7xMIr9T6eVoAQwBitwA2mrG0vq45FD5rKC4jXfOCt0GItJJ902hHasHP67skhJWE+uMQPWm+
	8D41Ym9KPiKRDh1clwmjejTvlSgNucnUOVXhiiqFY70rLYV0Ms9Kwr15RQT/TuIro6K7Qzhjyowbt
	GrlEJQEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCU6-000000056iE-3PjM;
	Fri, 10 Jul 2026 14:45:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCU4-000000056gy-1tEv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:45:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F41E41BC0;
	Fri, 10 Jul 2026 07:45:38 -0700 (PDT)
Received: from e142021.munich.arm.com (e142021.arm.com [10.41.150.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54FCE3F7B4;
	Fri, 10 Jul 2026 07:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783694743; bh=6OlvW+eQ2GaznRaP8rXR5TDcvHWDz1dS7H74bnFx2nQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p1EdBmwKIzR9Aqe49t7set5L0KE+U/nIc2FBlEzULKQLlFoAbWQcOCDALqhJtfZZY
	 FtO/b8sGj45lK2kRifdhFifBwLG85Lc+d4BbVRz2eYAhHpapCKZ58Ij92laZxOzrfw
	 5sAsSqWEjHiyLUbYA2A5owhrUyIxSvcM8eByQn0k=
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
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/16] arm_mpam: propagate MSC read errors for hw_probe functions
Date: Fri, 10 Jul 2026 16:45:07 +0200
Message-ID: <20260710144520.917375-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710144520.917375-1-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_074544_573303_F71C6456 
X-CRM114-Status: GOOD (  14.49  )
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
error, and propagate read errors from the lower level up.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/mpam_devices.c | 70 ++++++++++++++++++++++++----------
 1 file changed, 50 insertions(+), 20 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 8fd2c38c821c..b1bd047da203 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -785,7 +785,7 @@ static void mpam_enable_quirks(struct mpam_msc *msc)
 static bool mpam_ris_hw_probe_csu_nrdy(struct mpam_msc_ris *ris)
 {
 	u32 now, mon_sel, ctl_val;
-	bool can_set, can_clear;
+	bool can_set, can_clear, ret = false;
 	struct mpam_msc *msc = ris->vmsc->msc;
 
 	if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
@@ -804,20 +804,26 @@ static bool mpam_ris_hw_probe_csu_nrdy(struct mpam_msc_ris *ris)
 	mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val);
 
 	_mpam_write_monsel_reg(msc, MSMON_CSU, MSMON___NRDY);
-	_mpam_read_monsel_reg(msc, MSMON_CSU, &now);
+	if (_mpam_read_monsel_reg(msc, MSMON_CSU, &now))
+		goto out_unlock;
 	can_set = now & MSMON___NRDY;
 
 	_mpam_write_monsel_reg(msc, MSMON_CSU, 0);
 	/* Configuration change to try and coax hardware into setting nrdy */
 	mpam_write_monsel_reg(msc, CFG_CSU_FLT, 0x1);
-	_mpam_read_monsel_reg(msc, MSMON_CSU, &now);
+	if (_mpam_read_monsel_reg(msc, MSMON_CSU, &now))
+		goto out_unlock;
 	can_clear = !(now & MSMON___NRDY);
+
+	ret = !can_set || !can_clear;
+
+out_unlock:
 	mpam_mon_sel_unlock(msc);
 
-	return (!can_set || !can_clear);
+	return ret;
 }
 
-static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
+static int mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 {
 	int err;
 	struct mpam_msc *msc = ris->vmsc->msc;
@@ -832,7 +838,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 	if (FIELD_GET(MPAMF_IDR_HAS_CCAP_PART, ris->idr)) {
 		u32 ccap_features;
 
-		mpam_read_partsel_reg(msc, CCAP_IDR, &ccap_features);
+		err = mpam_read_partsel_reg(msc, CCAP_IDR, &ccap_features);
+		if (err)
+			return err;
 
 		props->cmax_wd = FIELD_GET(MPAMF_CCAP_IDR_CMAX_WD, ccap_features);
 		if (props->cmax_wd &&
@@ -857,7 +865,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 	if (FIELD_GET(MPAMF_IDR_HAS_CPOR_PART, ris->idr)) {
 		u32 cpor_features;
 
-		mpam_read_partsel_reg(msc, CPOR_IDR, &cpor_features);
+		err = mpam_read_partsel_reg(msc, CPOR_IDR, &cpor_features);
+		if (err)
+			return err;
 
 		props->cpbm_wd = FIELD_GET(MPAMF_CPOR_IDR_CPBM_WD, cpor_features);
 		if (props->cpbm_wd)
@@ -867,8 +877,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
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
@@ -897,8 +908,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
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
@@ -919,7 +931,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 	if (FIELD_GET(MPAMF_IDR_HAS_MSMON, ris->idr)) {
 		u32 msmon_features;
 
-		mpam_read_partsel_reg(msc, MSMON_IDR, &msmon_features);
+		err = mpam_read_partsel_reg(msc, MSMON_IDR, &msmon_features);
+		if (err)
+			return err;
 
 		/*
 		 * If the firmware max-nrdy-us property is missing, the
@@ -932,7 +946,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 		if (FIELD_GET(MPAMF_MSMON_IDR_MSMON_CSU, msmon_features)) {
 			u32 csumonidr;
 
-			mpam_read_partsel_reg(msc, CSUMON_IDR, &csumonidr);
+			err = mpam_read_partsel_reg(msc, CSUMON_IDR, &csumonidr);
+			if (err)
+				return err;
 
 			props->num_csu_mon = FIELD_GET(MPAMF_CSUMON_IDR_NUM_MON, csumonidr);
 			if (props->num_csu_mon) {
@@ -958,7 +974,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 			bool has_long;
 			u32 mbwumon_idr;
 
-			mpam_read_partsel_reg(msc, MBWUMON_IDR, &mbwumon_idr);
+			err = mpam_read_partsel_reg(msc, MBWUMON_IDR, &mbwumon_idr);
+			if (err)
+				return err;
 
 			props->num_mbwu_mon = FIELD_GET(MPAMF_MBWUMON_IDR_NUM_MON, mbwumon_idr);
 			if (props->num_mbwu_mon) {
@@ -991,16 +1009,22 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
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
@@ -1016,10 +1040,12 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 
 	/* Grab an IDR value to find out how many RIS there are */
 	mutex_lock(&msc->part_sel_lock);
-	mpam_msc_read_idr(msc, &idr);
-	mpam_read_partsel_reg(msc, IIDR, &msc->iidr);
-
+	ret = mpam_msc_read_idr(msc, &idr);
+	if (!ret)
+		ret = mpam_read_partsel_reg(msc, IIDR, &msc->iidr);
 	mutex_unlock(&msc->part_sel_lock);
+	if (ret)
+		return ret;
 
 	mpam_enable_quirks(msc);
 
@@ -1032,8 +1058,10 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 	for (ris_idx = 0; ris_idx <= msc->ris_max; ris_idx++) {
 		mutex_lock(&msc->part_sel_lock);
 		__mpam_part_sel(ris_idx, 0, msc);
-		mpam_msc_read_idr(msc, &idr);
+		ret = mpam_msc_read_idr(msc, &idr);
 		mutex_unlock(&msc->part_sel_lock);
+		if (ret)
+			return ret;
 
 		partid_max = FIELD_GET(MPAMF_IDR_PARTID_MAX, idr);
 		pmg_max = FIELD_GET(MPAMF_IDR_PMG_MAX, idr);
@@ -1050,8 +1078,10 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 
 		mutex_lock(&msc->part_sel_lock);
 		__mpam_part_sel(ris_idx, 0, msc);
-		mpam_ris_hw_probe(ris);
+		ret = mpam_ris_hw_probe(ris);
 		mutex_unlock(&msc->part_sel_lock);
+		if (ret)
+			return ret;
 	}
 
 	/* Clear any stale errors */
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F60BCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jW8Bo52HHxWIglBgmJI0kgACpkPc6ciMthrdQiPFOZI=; b=gWuLz+Kz9Xtnndg77n1Z/E62+x
	JKyp8gJC3Q2Tx5NWm2vGbiSzpSSkYSdss0TsbDvR2am08dyDLH7ckc4dYR89Unq4FiESq1rQWfEwH
	1CeBAdOPKiQy8T7e3GQZEliJSa3pJUWE1manEjL3h+dIXE0FXJlx1KxXrpySpMGhFUs7InEPe0Z0H
	WlY2smS+nfbDDa3Ki6B7S058zBTHxKMeKvuh4mK9cs9QxmayLAzHeC8Y0PyVdE6LkORm41N02MHj4
	mU2p77UR9e4d3qGyb9f0zAhiQnMdHOzv5zv/lLlfitOkwwbANUywlf2g3npUwLi2yOS7uY0+RCsNj
	fXlio0pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChFO-0000000CBra-3Lbp;
	Fri, 02 Oct 2026 17:40:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChFF-0000000CBeS-2aIF
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 Oct 2026 17:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jW8Bo52HHxWIglBgmJI0kgACpkPc6ciMthrdQiPFOZI=; b=QJgzBDGEeH9A8C2zr3giQ+GvaN
	c30ZmOH/z/zfQBY3SucyVrN2FwgAIaEkspRq4V1PxTh+wAQdmEAwkGlBWpQG8pAEGmSWcItGOs2/W
	tijRIwc9tDu4ovFoi/3WSebJP0XF3VmcylHyt4LO0CjcSHu18ACk1KHjB4k7EVefIzEawsa3DAexr
	4tNAeLPup59FSioOTpTgfZnp8P8nD/oaYJAbXn0gEhOpn1xKxVZcfFnK8hWizlDxIsGnbMW3XU0wz
	cspA7O/EtfJGn/euLM0HDLJrixAEqfttsbt2AeczJ8jg0azPDU1wDUPdSjoN4U4aOuF5lG642Kqx8
	qYqM9aKA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xChFA-00000006BLd-3q2V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C02A7143D;
	Fri,  2 Oct 2026 10:40:18 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0954E3F882;
	Fri,  2 Oct 2026 10:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962822; bh=e8VFjOMzXnpJq12dQyBfB6rSfENO4nTU9cq77a8/ABQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZkVBeQ8abb6fVyWRhaZpoWz6bH8fUMc199ejw+5rjx3PW1pk7YLONl9KWIDZX5JZo
	 hh1uYsd6olwP0Pb/7YHGt/QeRjqJIKAkzpctQUKuXIPaxYLMeHwujZwYtKV4SB2qZK
	 PMg83p4MtB4inMdkETLUYl75L8+6TZy7XIfYEC0w=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Gavin Shan <gshan@redhat.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 16/27] arm_mpam: propagate MSC access errors for hw_probe functions
Date: Fri,  2 Oct 2026 18:39:29 +0100
Message-ID: <20261002173941.292319-17-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_184026_098760_90FCE3E0 
X-CRM114-Status: GOOD (  21.29  )
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

From: Andre Przywara <andre.przywara@arm.com>

Allow the functions probing for MSC hardware and features to return an
error, and propagate read and write errors from the lower level up.
This uses some "scoped cleanup" functions like scoped_guard() and
ACQUIRE() to avoid the complexity of error handling when a lock has been
taken. Since the mon_sel_lock is a bit special (even more so in an
upcoming patch), we define a new GUARD type for it.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Gavin Shan <gshan@redhat.com> # on NVIDIA Grace Hopper
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c  | 145 ++++++++++++++++++++++----------
 drivers/resctrl/mpam_internal.h |   4 +
 2 files changed, 103 insertions(+), 46 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 77502a87f0f4..a5365b56b1e7 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -792,44 +792,62 @@ static void mpam_enable_quirks(struct mpam_msc *msc)
  * Try and see what values stick in this bit. If we can write either value,
  * its probably not implemented by hardware.
  */
-static bool mpam_ris_hw_probe_csu_nrdy(struct mpam_msc_ris *ris)
+static int mpam_ris_hw_probe_csu_nrdy(struct mpam_msc_ris *ris)
 {
 	u32 now, mon_sel, ctl_val;
 	bool can_set, can_clear;
 	struct mpam_msc *msc = ris->vmsc->msc;
+	int ret;
 
-	if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
-		return false;
+	ACQUIRE(mon_sel_lock, guard)(msc);
+	ret = ACQUIRE_ERR(mon_sel_lock, &guard);
+	if (ret)
+		return ret;
 
 	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, 0) |
 		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
-	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+	ret = mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+	if (ret)
+		return ret;
 
 	/* Hardware might ignore nrdy if it's not enabled */
 	ctl_val = MSMON_CFG_CSU_CTL_TYPE_CSU;
 	ctl_val |= MSMON_CFG_x_CTL_MATCH_PARTID;
 	ctl_val |= MSMON_CFG_x_CTL_MATCH_PMG;
 	ctl_val |= MSMON_CFG_x_CTL_EN;
-	mpam_write_monsel_reg(msc, CFG_CSU_FLT, 0);
-	mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val);
+	ret = mpam_write_monsel_reg(msc, CFG_CSU_FLT, 0);
+	if (ret)
+		return ret;
+	ret = mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val);
+	if (ret)
+		return ret;
 
-	_mpam_write_monsel_reg(msc, MSMON_CSU, MSMON___NRDY);
-	_mpam_read_monsel_reg(msc, MSMON_CSU, &now);
+	ret = _mpam_write_monsel_reg(msc, MSMON_CSU, MSMON___NRDY);
+	if (ret)
+		return ret;
+	ret = _mpam_read_monsel_reg(msc, MSMON_CSU, &now);
+	if (ret)
+		return ret;
 	can_set = now & MSMON___NRDY;
 
-	_mpam_write_monsel_reg(msc, MSMON_CSU, 0);
+	ret = _mpam_write_monsel_reg(msc, MSMON_CSU, 0);
+	if (ret)
+		return ret;
 	/* Configuration change to try and coax hardware into setting nrdy */
-	mpam_write_monsel_reg(msc, CFG_CSU_FLT, 0x1);
-	_mpam_read_monsel_reg(msc, MSMON_CSU, &now);
+	ret = mpam_write_monsel_reg(msc, CFG_CSU_FLT, 0x1);
+	if (ret)
+		return ret;
+	ret = _mpam_read_monsel_reg(msc, MSMON_CSU, &now);
+	if (ret)
+		return ret;
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
@@ -842,7 +860,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 	if (FIELD_GET(MPAMF_IDR_HAS_CCAP_PART, ris->idr)) {
 		u32 ccap_features;
 
-		mpam_read_partsel_reg(msc, CCAP_IDR, &ccap_features);
+		err = mpam_read_partsel_reg(msc, CCAP_IDR, &ccap_features);
+		if (err)
+			return err;
 
 		props->cmax_wd = FIELD_GET(MPAMF_CCAP_IDR_CMAX_WD, ccap_features);
 		if (props->cmax_wd &&
@@ -867,7 +887,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 	if (FIELD_GET(MPAMF_IDR_HAS_CPOR_PART, ris->idr)) {
 		u32 cpor_features;
 
-		mpam_read_partsel_reg(msc, CPOR_IDR, &cpor_features);
+		err = mpam_read_partsel_reg(msc, CPOR_IDR, &cpor_features);
+		if (err)
+			return err;
 
 		props->cpbm_wd = FIELD_GET(MPAMF_CPOR_IDR_CPBM_WD, cpor_features);
 		if (props->cpbm_wd)
@@ -877,8 +899,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
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
@@ -907,8 +930,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
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
@@ -929,20 +953,24 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
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
@@ -954,13 +982,16 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 					mpam_set_feature(mpam_feat_msmon_csu_xcl, props);
 
 				/* Is NRDY hardware managed? */
-				hw_managed = mpam_ris_hw_probe_csu_nrdy(ris);
+				err = mpam_ris_hw_probe_csu_nrdy(ris);
+				if (err < 0)
+					return err;
+				hw_managed = err;
 
 				/*
 				 * Accept the missing firmware property if NRDY appears
 				 * un-implemented.
 				 */
-				if (err && hw_managed)
+				if (fw_has_nrdy_err && hw_managed)
 					dev_err_once(dev, "Counters are not usable because not-ready timeout was not provided by firmware.");
 			}
 		}
@@ -968,7 +999,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 			bool has_long;
 			u32 mbwumon_idr;
 
-			mpam_read_partsel_reg(msc, MBWUMON_IDR, &mbwumon_idr);
+			err = mpam_read_partsel_reg(msc, MBWUMON_IDR, &mbwumon_idr);
+			if (err)
+				return err;
 
 			props->num_mbwu_mon = FIELD_GET(MPAMF_MBWUMON_IDR_NUM_MON, mbwumon_idr);
 			if (props->num_mbwu_mon) {
@@ -1001,16 +1034,22 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
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
@@ -1025,11 +1064,15 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
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
 
@@ -1040,10 +1083,15 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
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
@@ -1051,17 +1099,22 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
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
index def0e3a65c23..68a6cf2b9cc7 100644
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
2.53.0



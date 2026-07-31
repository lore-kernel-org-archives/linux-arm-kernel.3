Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DA3C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jncQKKJdoj1AHK3uF1GUH2dZFDfQ6IqNejO7fZPnS4c=; b=zXlGhDG4jViLB6PCs4+NtHuh8N
	5aGdfjuEHa3oaopYVSIGi8f7SiQFUgsaWoHJV4nyuBBSg38uTN3s2zVzRoRHshcrMuMoZaYZTuL+x
	XXrTPfIOwv80QlUQlugctXfv7p4G6zqK581BdXMazcceLidmM95OoJ1O5zeMHgpZcd89iRcJj7J2D
	9LCeZL5qUfMbVjPd/wI/ypKDNzOxKU7xWXDjMaYAQsivkK+orXwnoQinWcak0otRiG9eWJw178bjQ
	sU653hdtdQMpwsdXVTscwbFKoc8F3+WOrq3/w25IzzjfEKlm/0/lBKlimUmlCAtO877tdovIFvGbz
	91QoWbKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqex-0000000DCnC-1Wnw;
	Fri, 31 Jul 2026 17:04:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqeT-0000000DCY0-2Mlh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:04:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A88015A1;
	Fri, 31 Jul 2026 10:04:00 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEBAE3F66F;
	Fri, 31 Jul 2026 10:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785517444; bh=5PpeRHkvy/LH7iFOCDp+he/zr2RWvoTAUKtbhXqd6oc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DHjp5T88f82AA7JL1ROok6LguzRUax7TKhzvETp9p+UMvIqiVaFzXpkxweVabB6oO
	 0NTxxvyJ7w5ZDVe9T5r+S7MFiz503bYc6vphdXifJ1g1EUyZ15XSSvJOySsNh9ocoR
	 9iR+EARlO4Pvc8h8Btygf6asgLunm5Z2vMvVbz0w=
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
Subject: [PATCH v7 07/11] arm_mpam: propagate MSC access errors for mpam_reprogram_ris_partid()
Date: Fri, 31 Jul 2026 19:03:20 +0200
Message-ID: <20260731170324.2927758-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731170324.2927758-1-andre.przywara@arm.com>
References: <20260731170324.2927758-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_100405_687098_8ECFBD4A 
X-CRM114-Status: GOOD (  17.86  )
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

Allow the mpam_reprogram_ris_partid() function check for and return
errors, and propagate MSC read and write errors from the lower level up.
This also covers the callers of this function: mpam_reset_ris() and
apply_config().

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/mpam_devices.c | 136 ++++++++++++++++++++++-----------
 1 file changed, 93 insertions(+), 43 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 38450c55e45e..32088ad1d67e 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1601,7 +1601,7 @@ void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx)
 	}
 }
 
-static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
+static int mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
 {
 	u32 num_words, msb;
 	u32 bm = ~0;
@@ -1610,15 +1610,19 @@ static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
 	lockdep_assert_held(&msc->part_sel_lock);
 
 	if (wd == 0)
-		return;
+		return 0;
 
 	/*
 	 * Write all ~0 to all but the last 32bit-word, which may
 	 * have fewer bits...
 	 */
 	num_words = DIV_ROUND_UP(wd, 32);
-	for (i = 0; i < num_words - 1; i++, reg += sizeof(bm))
-		__mpam_write_reg(msc, reg, bm);
+	for (i = 0; i < num_words - 1; i++, reg += sizeof(bm)) {
+		int ret = __mpam_write_reg(msc, reg, bm);
+
+		if (ret)
+			return ret;
+	}
 
 	/*
 	 * ....and then the last (maybe) partial 32bit word. When wd is a
@@ -1626,7 +1630,7 @@ static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
 	 */
 	msb = (wd - 1) % 32;
 	bm = GENMASK(msb, 0);
-	__mpam_write_reg(msc, reg, bm);
+	return __mpam_write_reg(msc, reg, bm);
 }
 
 static void mpam_apply_t241_erratum(struct mpam_msc_ris *ris, u16 partid)
@@ -1699,8 +1703,8 @@ static u16 mpam_wa_t241_calc_min_from_max(struct mpam_props *props,
 }
 
 /* Called via IPI. Call while holding an SRCU reference */
-static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
-				      struct mpam_config *cfg)
+static int mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
+				     struct mpam_config *cfg)
 {
 	u32 pri_val = 0;
 	u16 cmax = MPAMCFG_CMAX_CMAX;
@@ -1708,34 +1712,53 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 	struct mpam_props *rprops = &ris->props;
 	u16 dspri = GENMASK(rprops->dspri_wd, 0);
 	u16 intpri = GENMASK(rprops->intpri_wd, 0);
+	int ret;
 
-	mutex_lock(&msc->part_sel_lock);
-	__mpam_part_sel(ris->ris_idx, partid, msc);
+	guard(mutex)(&msc->part_sel_lock);
+	ret = __mpam_part_sel(ris->ris_idx, partid, msc);
+	if (ret)
+		return ret;
 
 	if (mpam_has_feature(mpam_feat_partid_nrw, rprops)) {
 		/* Update the intpartid mapping */
-		mpam_write_partsel_reg(msc, INTPARTID,
-				       MPAMCFG_INTPARTID_INTERNAL | partid);
+		ret = mpam_write_partsel_reg(msc, INTPARTID,
+					     MPAMCFG_INTPARTID_INTERNAL | partid);
+		if (ret)
+			return ret;
 
 		/*
 		 * Then switch to the 'internal' partid to update the
 		 * configuration.
 		 */
-		__mpam_intpart_sel(ris->ris_idx, partid, msc);
+		ret = __mpam_intpart_sel(ris->ris_idx, partid, msc);
+		if (ret)
+			return ret;
 	}
 
 	if (mpam_has_feature(mpam_feat_cpor_part, rprops)) {
-		if (mpam_has_feature(mpam_feat_cpor_part, cfg))
-			mpam_write_partsel_reg(msc, CPBM, cfg->cpbm);
-		else
-			mpam_reset_msc_bitmap(msc, MPAMCFG_CPBM, rprops->cpbm_wd);
+		if (mpam_has_feature(mpam_feat_cpor_part, cfg)) {
+			ret = mpam_write_partsel_reg(msc, CPBM, cfg->cpbm);
+			if (ret)
+				return ret;
+		} else {
+			ret = mpam_reset_msc_bitmap(msc, MPAMCFG_CPBM,
+						    rprops->cpbm_wd);
+			if (ret)
+				return ret;
+		}
 	}
 
 	if (mpam_has_feature(mpam_feat_mbw_part, rprops)) {
-		if (mpam_has_feature(mpam_feat_mbw_part, cfg))
-			mpam_reset_msc_bitmap(msc, MPAMCFG_MBW_PBM, rprops->mbw_pbm_bits);
-		else
-			mpam_write_partsel_reg(msc, MBW_PBM, cfg->mbw_pbm);
+		if (mpam_has_feature(mpam_feat_mbw_part, cfg)) {
+			ret = mpam_reset_msc_bitmap(msc, MPAMCFG_MBW_PBM,
+						    rprops->mbw_pbm_bits);
+			if (ret)
+				return ret;
+		} else {
+			ret = mpam_write_partsel_reg(msc, MBW_PBM, cfg->mbw_pbm);
+			if (ret)
+				return ret;
+		}
 	}
 
 	if (mpam_has_feature(mpam_feat_mbw_min, rprops)) {
@@ -1748,27 +1771,47 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 			val = max(val, min);
 		}
 
-		mpam_write_partsel_reg(msc, MBW_MIN, val);
+		ret = mpam_write_partsel_reg(msc, MBW_MIN, val);
+		if (ret)
+			return ret;
 	}
 
 	if (mpam_has_feature(mpam_feat_mbw_max, rprops)) {
-		if (mpam_has_feature(mpam_feat_mbw_max, cfg))
-			mpam_write_partsel_reg(msc, MBW_MAX, cfg->mbw_max);
-		else
-			mpam_write_partsel_reg(msc, MBW_MAX, MPAMCFG_MBW_MAX_MAX);
+		if (mpam_has_feature(mpam_feat_mbw_max, cfg)) {
+			ret = mpam_write_partsel_reg(msc, MBW_MAX, cfg->mbw_max);
+			if (ret)
+				return ret;
+		} else {
+			ret = mpam_write_partsel_reg(msc, MBW_MAX,
+						     MPAMCFG_MBW_MAX_MAX);
+			if (ret)
+				return ret;
+		}
 	}
 
-	if (mpam_has_feature(mpam_feat_mbw_prop, rprops))
-		mpam_write_partsel_reg(msc, MBW_PROP, 0);
+	if (mpam_has_feature(mpam_feat_mbw_prop, rprops)) {
+		ret = mpam_write_partsel_reg(msc, MBW_PROP, 0);
+		if (ret)
+			return ret;
+	}
 
-	if (mpam_has_feature(mpam_feat_cmax_cmax, rprops))
-		mpam_write_partsel_reg(msc, CMAX, cmax);
+	if (mpam_has_feature(mpam_feat_cmax_cmax, rprops)) {
+		ret = mpam_write_partsel_reg(msc, CMAX, cmax);
+		if (ret)
+			return ret;
+	}
 
-	if (mpam_has_feature(mpam_feat_cmax_cmin, rprops))
-		mpam_write_partsel_reg(msc, CMIN, 0);
+	if (mpam_has_feature(mpam_feat_cmax_cmin, rprops)) {
+		ret = mpam_write_partsel_reg(msc, CMIN, 0);
+		if (ret)
+			return ret;
+	}
 
-	if (mpam_has_feature(mpam_feat_cmax_cassoc, rprops))
-		mpam_write_partsel_reg(msc, CASSOC, MPAMCFG_CASSOC_CASSOC);
+	if (mpam_has_feature(mpam_feat_cmax_cassoc, rprops)) {
+		ret = mpam_write_partsel_reg(msc, CASSOC, MPAMCFG_CASSOC_CASSOC);
+		if (ret)
+			return ret;
+	}
 
 	if (mpam_has_feature(mpam_feat_intpri_part, rprops) ||
 	    mpam_has_feature(mpam_feat_dspri_part, rprops)) {
@@ -1783,12 +1826,14 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 		if (mpam_has_feature(mpam_feat_dspri_part, rprops))
 			pri_val |= FIELD_PREP(MPAMCFG_PRI_DSPRI, dspri);
 
-		mpam_write_partsel_reg(msc, PRI, pri_val);
+		ret = mpam_write_partsel_reg(msc, PRI, pri_val);
+		if (ret)
+			return ret;
 	}
 
 	mpam_quirk_post_config_change(ris, partid, cfg);
 
-	mutex_unlock(&msc->part_sel_lock);
+	return 0;
 }
 
 /* Call with msc cfg_lock held */
@@ -1891,6 +1936,7 @@ static int mpam_reset_ris(void *arg)
 	u16 partid, partid_max;
 	struct mpam_config reset_cfg = {};
 	struct mpam_msc_ris *ris = arg;
+	int ret;
 
 	if (ris->in_reset_state)
 		return 0;
@@ -1898,8 +1944,11 @@ static int mpam_reset_ris(void *arg)
 	spin_lock(&partid_max_lock);
 	partid_max = mpam_partid_max;
 	spin_unlock(&partid_max_lock);
-	for (partid = 0; partid <= partid_max; partid++)
-		mpam_reprogram_ris_partid(ris, partid, &reset_cfg);
+	for (partid = 0; partid <= partid_max; partid++) {
+		ret = mpam_reprogram_ris_partid(ris, partid, &reset_cfg);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
@@ -1938,9 +1987,8 @@ static int __write_config(void *arg)
 {
 	struct mpam_write_config_arg *c = arg;
 
-	mpam_reprogram_ris_partid(c->ris, c->partid, &c->comp->cfg[c->partid]);
-
-	return 0;
+	return mpam_reprogram_ris_partid(c->ris, c->partid,
+					 &c->comp->cfg[c->partid]);
 }
 
 static void mpam_reprogram_msc(struct mpam_msc *msc)
@@ -3088,6 +3136,7 @@ int mpam_apply_config(struct mpam_component *comp, u16 partid,
 	struct mpam_msc_ris *ris;
 	struct mpam_vmsc *vmsc;
 	struct mpam_msc *msc;
+	int ret;
 
 	lockdep_assert_cpus_held();
 
@@ -3105,14 +3154,15 @@ int mpam_apply_config(struct mpam_component *comp, u16 partid,
 				 srcu_read_lock_held(&mpam_srcu)) {
 		msc = vmsc->msc;
 
-		mutex_lock(&msc->cfg_lock);
+		guard(mutex)(&msc->cfg_lock);
 		list_for_each_entry_srcu(ris, &vmsc->ris, vmsc_list,
 					 srcu_read_lock_held(&mpam_srcu)) {
 			arg.ris = ris;
-			mpam_touch_msc(msc, __write_config, &arg);
+			ret = mpam_touch_msc(msc, __write_config, &arg);
+			if (ret)
+				return ret;
 			ris->in_reset_state = false;
 		}
-		mutex_unlock(&msc->cfg_lock);
 	}
 
 	return 0;
-- 
2.43.0



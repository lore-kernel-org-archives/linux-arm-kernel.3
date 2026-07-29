Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D89C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnONrwS7i9PELrW9gCcPqsphMgE07zHPljI65nd43+U=; b=YdNW2WuxvGpkGRM3750mFyVjd6
	jVaqNFx0uvoViuNFaLgFABTBnu9YH03Fk5fgg3/aRJa7YZQ2dU3gLyml8ji0mtubsNveDSi2iZB2I
	oXbL9OWQYLv0iZ2/+xpYRy7LOpaHsSnd66W+jeRGg+JhXkSscpeTJXC1wiYesNSK0PX4FUE5V/CcK
	PT7AZO6E9ylMrPuhDNH6T5OB/oqq013N9UYLIxJABmfh8p3S16RfLvga94eyN2jLDTFnynSFnTIm9
	huT0rb0AVp/BG0rCqDTDwMlm0NliaFB/bY6d/4CVXT58KQt3RjLEFqEI4NnUEOUK1+eOzQbbW3OoT
	o6fOQUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4Xx-000000089VT-3UHd;
	Wed, 29 Jul 2026 13:42:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4Xd-000000089Jp-3ZPL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:41:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32AA61595;
	Wed, 29 Jul 2026 06:41:45 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 607843F86F;
	Wed, 29 Jul 2026 06:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785332509; bh=F9FvhzVtVCl4fejes1m+F6Y/NB10TRxdlh7qkWcAb74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lCx0evZy2QVyS/5nhd4zgBwbmirKKE9MKhxnV2pYJiK5rLOAL0w3P1zqxLWUXJkgx
	 Vf5q7FMDpzw4dTYJXhxeGopVPKIOl0nBjvkoJBunYi54wa2IeeyNRFHnOthLQyioxJ
	 QujvmOO238rVQoIUzItmGZw2v7yW5Z5CeEB5SReI=
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
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/10] arm_mpam: propagate MSC access errors for MBWU counters
Date: Wed, 29 Jul 2026 15:41:17 +0200
Message-ID: <20260729134124.2506269-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729134124.2506269-1-andre.przywara@arm.com>
References: <20260729134124.2506269-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_064149_976849_F7244366 
X-CRM114-Status: GOOD (  14.18  )
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

Allow the mpam_msc_read_mbwu_l() function to return an error, and
propagate errors from the lower level up. This also changes the users
of this function.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 45 +++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 017e5bf067bc..32ad1864f70f 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1132,8 +1132,9 @@ static bool mpam_ris_has_mbwu_long_counter(struct mpam_msc_ris *ris)
 		mpam_has_feature(mpam_feat_msmon_mbwu_44counter, &ris->props));
 }
 
-static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
+static int mpam_msc_read_mbwu_l(struct mpam_msc *msc, u64 *res)
 {
+	int ret;
 	int retry = 3;
 	u32 mbwu_l_low;
 	u32 mbwu_l_high1, mbwu_l_high2;
@@ -1143,20 +1144,30 @@ static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
 	WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
 	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
 
-	__mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
+	ret = __mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
+	if (ret)
+		return ret;
+
 	do {
 		mbwu_l_high1 = mbwu_l_high2;
-		__mpam_read_reg(msc, MSMON_MBWU_L, &mbwu_l_low);
-		__mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
+		ret = __mpam_read_reg(msc, MSMON_MBWU_L, &mbwu_l_low);
+		if (ret)
+			return ret;
+		ret = __mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
+		if (ret)
+			return ret;
 
 		retry--;
 	} while (mbwu_l_high1 != mbwu_l_high2 && retry > 0);
 
-	if (mbwu_l_high1 == mbwu_l_high2)
-		return ((u64)mbwu_l_high1 << 32) | mbwu_l_low;
+	if (mbwu_l_high1 == mbwu_l_high2) {
+		*res = ((u64)mbwu_l_high1 << 32) | mbwu_l_low;
+	} else {
+		pr_warn("Failed to read a stable value\n");
+		*res = MSMON___L_NRDY;
+	}
 
-	pr_warn("Failed to read a stable value\n");
-	return MSMON___L_NRDY;
+	return 0;
 }
 
 static void mpam_msc_zero_mbwu_l(struct mpam_msc *msc)
@@ -1315,10 +1326,12 @@ static void __ris_msmon_read(void *arg)
 	struct mpam_msc *msc = m->ris->vmsc->msc;
 	u32 mon_sel, ctl_val, flt_val, cur_ctl, cur_flt;
 
-	if (!mpam_mon_sel_lock(msc)) {
+	ACQUIRE(mon_sel_lock, guard)(msc);
+	if (ACQUIRE_ERR(mon_sel_lock, &guard)) {
 		m->err = -EIO;
 		return;
 	}
+
 	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
 		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
 	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
@@ -1378,7 +1391,9 @@ static void __ris_msmon_read(void *arg)
 	case mpam_feat_msmon_mbwu_44counter:
 	case mpam_feat_msmon_mbwu_63counter:
 		if (m->type != mpam_feat_msmon_mbwu_31counter) {
-			now = mpam_msc_read_mbwu_l(msc);
+			m->err = mpam_msc_read_mbwu_l(msc, &now);
+			if (m->err)
+				return;
 			nrdy = now & MSMON___L_NRDY;
 
 			if (m->type == mpam_feat_msmon_mbwu_63counter)
@@ -1412,7 +1427,6 @@ static void __ris_msmon_read(void *arg)
 	default:
 		m->err = -EINVAL;
 	}
-	mpam_mon_sel_unlock(msc);
 
 	if (nrdy)
 		m->err = -EBUSY;
@@ -1767,6 +1781,7 @@ static int mpam_save_mbwu_state(void *arg)
 {
 	int i;
 	u64 val;
+	int ret;
 	struct mon_cfg *cfg;
 	u32 cur_flt, cur_ctl, mon_sel;
 	struct mpam_msc_ris *ris = arg;
@@ -1777,7 +1792,8 @@ static int mpam_save_mbwu_state(void *arg)
 		mbwu_state = &ris->mbwu_state[i];
 		cfg = &mbwu_state->cfg;
 
-		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
+		ACQUIRE(mon_sel_lock, guard)(msc);
+		if (ACQUIRE_ERR(mon_sel_lock, &guard))
 			return -EIO;
 
 		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
@@ -1788,7 +1804,9 @@ static int mpam_save_mbwu_state(void *arg)
 		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
 
 		if (mpam_ris_has_mbwu_long_counter(ris)) {
-			val = mpam_msc_read_mbwu_l(msc);
+			ret = mpam_msc_read_mbwu_l(msc, &val);
+			if (ret)
+				return ret;
 			mpam_msc_zero_mbwu_l(msc);
 		} else {
 			u32 val32;
@@ -1804,7 +1822,6 @@ static int mpam_save_mbwu_state(void *arg)
 		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
 		mbwu_state->correction += val;
 		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
-		mpam_mon_sel_unlock(msc);
 	}
 
 	return 0;
-- 
2.43.0



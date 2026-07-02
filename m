Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BB5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKjKff55SWQg6eX2cHt6Ikw+mn7cUY4FVZ0GealhbYM=; b=uUcJSPS13Qn7NZrYbIPvxTGGrn
	bCfPhoR3OjIsaunoymmSws2vIFpnAJhnCCnFIkSIcNWCQmx75gvRMHUA2h9Y3+fETarhPAewvqU0H
	5dzzRyIsN4OykC83SP52oHPtWcZ/uIWtNRp5RS1h+Wf/O1SWK61PB75pQwF1895cquhSumK0//tb2
	lahOgFWZwaw2RfToxmTTu6AcrS6M33MWLGtFuoiulXRNUnjPHPij+jAJgmlWmBQ57pK3oZPSBT5Oj
	aGvXgcpC1foXOdrBBfK4dw6dxqYdPRbOJFnUgyLp3Km7rtpTgQMoNGzgEkNdwvzetPFJ27woGlwYM
	Sfrtcw5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKCH-00000004zpz-0XrI;
	Thu, 02 Jul 2026 16:23:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKCE-00000004zmK-0UED
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:23:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCB0C1570;
	Thu,  2 Jul 2026 09:23:20 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84B753F673;
	Thu,  2 Jul 2026 09:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783009405; bh=uBY3r0i1U+Smsm1FpuV7cA66Sr4eMf43tDr9fZh5SeU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RJWIPDVZE7SLqExZhG3+62Rxq4z0WzQnJ6K45kOTSUopZsAMf/2p5Cl5nCHDroXtg
	 u7kcNprznCipLpDMElQxh6I8+lS+ssyxw/WuDOho04m/6kpHgSFuHs8ytKYG4CeJ/H
	 1odh9Fk7EJILCAvJwixvfRmoRSXBF3DV41kn2u7Y=
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
Subject: [PATCH v2 11/15] arm_mpam: propagate MSC write errors for remaining MSC write users
Date: Thu,  2 Jul 2026 18:22:25 +0200
Message-ID: <20260702162229.4008659-12-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702162229.4008659-1-andre.przywara@arm.com>
References: <20260702162229.4008659-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_092326_448320_83740156 
X-CRM114-Status: GOOD (  15.08  )
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

Allow the remaining MSC device functions to return an error, and
propagate write errors from the lower level up.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>

propagate write errors up for mpam_save_mbwu_state()
---
 drivers/resctrl/mpam_devices.c | 76 ++++++++++++++++++++++------------
 1 file changed, 49 insertions(+), 27 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index f3558d248c38..addc25e78345 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1150,15 +1150,20 @@ static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
 	return MSMON___L_NRDY;
 }
 
-static void mpam_msc_zero_mbwu_l(struct mpam_msc *msc)
+static int mpam_msc_zero_mbwu_l(struct mpam_msc *msc)
 {
+	int ret;
+
 	mpam_mon_sel_lock_held(msc);
 
 	WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
 	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
 
-	__mpam_write_reg(msc, MSMON_MBWU_L, 0);
-	__mpam_write_reg(msc, MSMON_MBWU_L + 4, 0);
+	ret = __mpam_write_reg(msc, MSMON_MBWU_L, 0);
+	if (!ret)
+		ret = __mpam_write_reg(msc, MSMON_MBWU_L + 4, 0);
+
+	return ret;
 }
 
 static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
@@ -1237,10 +1242,11 @@ static inline void clean_msmon_ctl_val(u32 *cur_ctl)
 		*cur_ctl &= ~MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L;
 }
 
-static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
-				     u32 flt_val)
+static int write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
+				    u32 flt_val)
 {
 	struct mpam_msc *msc = m->ris->vmsc->msc;
+	int ret;
 
 	/*
 	 * Write the ctl_val with the enable bit cleared, reset the counter,
@@ -1248,26 +1254,37 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
 	 */
 	switch (m->type) {
 	case mpam_feat_msmon_csu:
-		mpam_write_monsel_reg(msc, CFG_CSU_FLT, flt_val);
-		mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val);
-		mpam_write_monsel_reg(msc, CSU, 0);
-		mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
+		ret = mpam_write_monsel_reg(msc, CFG_CSU_FLT, flt_val);
+		if (!ret)
+			ret = mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val);
+		if (!ret)
+			ret = mpam_write_monsel_reg(msc, CSU, 0);
+		if (!ret)
+			ret = mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
 		break;
 	case mpam_feat_msmon_mbwu_31counter:
 	case mpam_feat_msmon_mbwu_44counter:
 	case mpam_feat_msmon_mbwu_63counter:
-		mpam_write_monsel_reg(msc, CFG_MBWU_FLT, flt_val);
-		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val);
-		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
+		ret = mpam_write_monsel_reg(msc, CFG_MBWU_FLT, flt_val);
+		if (!ret)
+			ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val);
+		if (!ret)
+			ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL,
+						    ctl_val | MSMON_CFG_x_CTL_EN);
 		/* Counting monitors require NRDY to be reset by software */
-		if (m->type == mpam_feat_msmon_mbwu_31counter)
-			mpam_write_monsel_reg(msc, MBWU, 0);
-		else
-			mpam_msc_zero_mbwu_l(m->ris->vmsc->msc);
+		if (!ret) {
+			if (m->type == mpam_feat_msmon_mbwu_31counter)
+				ret = mpam_write_monsel_reg(msc, MBWU, 0);
+			else
+				ret = mpam_msc_zero_mbwu_l(m->ris->vmsc->msc);
+		}
 		break;
 	default:
 		pr_warn("Unexpected monitor type %d\n", m->type);
+		return -EINVAL;
 	}
+
+	return ret;
 }
 
 static u64 __mpam_msmon_overflow_val(enum mpam_device_features type)
@@ -1323,7 +1340,9 @@ static void __ris_msmon_read(void *arg)
 	}
 	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
 		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
-	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+	ret = mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+	if (ret)
+		goto out_unlock;
 
 	switch (m->type) {
 	case mpam_feat_msmon_mbwu_31counter:
@@ -1359,14 +1378,16 @@ static void __ris_msmon_read(void *arg)
 			  cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
 
 	if (config_mismatch || reset_on_next_read) {
-		write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
+		ret = write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
 		overflow = false;
 	} else if (overflow) {
-		mpam_write_monsel_reg(msc, CFG_MBWU_CTL,
-				      cur_ctl &
-				      ~(MSMON_CFG_x_CTL_OFLOW_STATUS |
-					MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L));
+		ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL,
+					    cur_ctl &
+					    ~(MSMON_CFG_x_CTL_OFLOW_STATUS |
+					    MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L));
 	}
+	if (ret)
+		goto out_unlock;
 
 	switch (m->type) {
 	case mpam_feat_msmon_csu:
@@ -1801,24 +1822,25 @@ static int mpam_save_mbwu_state(void *arg)
 
 		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
 			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
-		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
-		ret = mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
+		ret = mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+		if (!ret)
+			ret = mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
 		if (!ret)
 			ret = mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
 		if (!ret)
-			mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
+			ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
 
 		if (!ret) {
 			if (mpam_ris_has_mbwu_long_counter(ris)) {
 				val = mpam_msc_read_mbwu_l(msc);
-				mpam_msc_zero_mbwu_l(msc);
+				ret = mpam_msc_zero_mbwu_l(msc);
 			} else {
 				u32 val32;
 
 				ret = mpam_read_monsel_reg(msc, MBWU, &val32);
 				if (!ret) {
 					val = val32;
-					mpam_write_monsel_reg(msc, MBWU, 0);
+					ret = mpam_write_monsel_reg(msc, MBWU, 0);
 				}
 			}
 		}
-- 
2.43.0



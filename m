Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745C9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32j0bCmR2IZkuZbLc6V40ddMWvMYSDiq5H/y4QMFkqc=; b=mi969Duor58ZbKGtY3X0NFYllL
	v6p98lKowtJ91PtYzzLFp1tO6zJPrfSTJ/ALHcbU6csRzEWF8i51yT79P/BoJfxRQDb0luhESYdXo
	7eVuzUiDM/e9wJeXypgomWVDl7ry8nU53WPzsN9UVI9PuPms8dGk5VAjNQDAy3iU4Yh1HXlh/YEaN
	BcHcv4Kkzw7iDGlYs6nJTsc4r7wLGt8yco3jrn9MRX8kvwLDsjknAQlKqqSVerhbSl6D7ZzURaw4Y
	KjxMNvvtMpvHjt4dluBqARdTgh9SSMPZyZxgZ959+J+ah2dJh8e087aKXK0cQ/ic358PIUjNY1QT+
	j0zUSoDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCUl-000000057Ei-0nUn;
	Fri, 10 Jul 2026 14:46:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCUg-000000057AE-449G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:46:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E2EC1E7D;
	Fri, 10 Jul 2026 07:46:18 -0700 (PDT)
Received: from e142021.munich.arm.com (e142021.arm.com [10.41.150.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66A073F7B4;
	Fri, 10 Jul 2026 07:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783694782; bh=WtcZ/lz6Y4sstu37684hXhuRNeyEWlPaNp0P3ZOkqxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y4uv8qddqGOJHgNiy52IwDnKcQrEoYx9pbr6gY/c7L49WvB1czzARNV8fiiA/uoVb
	 fHHSo9H8pCGy2Zh7FFJ4fvgmy0Jx3Z40NqnU9lFWZ4JGxSrCLt56js9aKTTFF/HjPs
	 yFAopq1X9nMpfF2NeS7CfQGC8g0nUQSpmYE5uF2I=
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
Subject: [PATCH v3 12/16] arm_mpam: propagate MSC write errors for remaining MSC write users
Date: Fri, 10 Jul 2026 16:45:16 +0200
Message-ID: <20260710144520.917375-13-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710144520.917375-1-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_074623_156553_018D2D98 
X-CRM114-Status: GOOD (  14.96  )
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
 drivers/resctrl/mpam_devices.c | 82 +++++++++++++++++++++++-----------
 1 file changed, 56 insertions(+), 26 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 222515a01b35..ca73029654b6 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1162,15 +1162,20 @@ static int mpam_msc_read_mbwu_l(struct mpam_msc *msc, u64 *res)
 	return ret;
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
@@ -1249,10 +1254,11 @@ static inline void clean_msmon_ctl_val(u32 *cur_ctl)
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
@@ -1260,26 +1266,37 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
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
@@ -1334,7 +1351,9 @@ static void __ris_msmon_read(void *arg)
 	}
 	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
 		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
-	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+	ret = mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+	if (ret)
+		goto out_unlock;
 
 	switch (m->type) {
 	case mpam_feat_msmon_mbwu_31counter:
@@ -1370,14 +1389,16 @@ static void __ris_msmon_read(void *arg)
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
@@ -1810,20 +1831,27 @@ static int mpam_save_mbwu_state(void *arg)
 
 		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
 			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
-		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+		ret = mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+		if (ret)
+			goto out_unlock;
 		ret = mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
 		if (ret)
 			goto out_unlock;
 		ret = mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
 		if (ret)
 			goto out_unlock;
-		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
+		ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
+		if (ret)
+			goto out_unlock;
 
 		if (mpam_ris_has_mbwu_long_counter(ris)) {
 			ret = mpam_msc_read_mbwu_l(msc, &val);
 			if (ret)
 				goto out_unlock;
-			mpam_msc_zero_mbwu_l(msc);
+
+			ret = mpam_msc_zero_mbwu_l(msc);
+			if (ret)
+				goto out_unlock;
 		} else {
 			u32 val32;
 
@@ -1832,7 +1860,9 @@ static int mpam_save_mbwu_state(void *arg)
 				goto out_unlock;
 
 			val = val32;
-			mpam_write_monsel_reg(msc, MBWU, 0);
+			ret = mpam_write_monsel_reg(msc, MBWU, 0);
+			if (ret)
+				goto out_unlock;
 		}
 
 		if (val != MSMON___L_NRDY) {
-- 
2.43.0



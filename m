Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BDAC55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBJ3m/fmdwt0zHamuvMPsK+UeXhV2hDYwj0CdOll30A=; b=HtoiTpQemF+StlRnFAqOAnAjlR
	49SKENmRYUdWDBfBh6qbD9T0YFYKzXDRUSHjDKy0FTJlpCuy2CZzIUNQnWSiHWN+/fu0I5sfehTCc
	Yw10S8ypcvw3duwxCupZPfYaX0VTXXCyzS2ImV/FpcVyXseRoVmw5mXgrgldUa4SHBCYN9+gfV3Up
	InEKtRQfAJKkCBl9+1ap9lq5xjcViOpf7QtePddFTjA2Y/BHrJqb0smJv5NA/0+bRIjl/Yqn7wh1k
	o484NuvGYnQ2NbKAK0xzslMXtJQ+uO896hrKEvIsHxC0F1NnBefMie+5dRhidXUsVVsYNdZgZYu/K
	uMnSDTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqeS-0000000DCX9-42JX;
	Fri, 31 Jul 2026 17:04:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqeL-0000000DCUE-1GYC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:03:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 803B715A1;
	Fri, 31 Jul 2026 10:03:52 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08BDB3F66F;
	Fri, 31 Jul 2026 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785517436; bh=3jaKwvIO1NqykpoIxCIBXvIeBCZICoGVtMjYWCvuuTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IqF/vDE5iAKsF1S29EfW4BJOvT3tVUu4q1i4YpwvJoiW4ZasxvVgBZA78IcEfXePn
	 rk24N3rvPR37QnaifEnCfud9SV/frl9gXXi0z5N1UbKUnPr5ks7gKwa32v+NKQUOf3
	 GlY/c6mBmGLoPYAu2EvGZ61YwGa2n1eLqHOn924o=
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
Subject: [PATCH v7 05/11] arm_mpam: propagate MSC access errors for __ris_msmon_read()
Date: Fri, 31 Jul 2026 19:03:18 +0200
Message-ID: <20260731170324.2927758-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731170324.2927758-1-andre.przywara@arm.com>
References: <20260731170324.2927758-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_100357_414716_6898CD60 
X-CRM114-Status: GOOD (  14.46  )
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

Allow the function for RIS accesses to return an error, and propagate
read and write errors from the lower level up.
This function is a bit special, since it can be called via an SMP
helper, so the prototype must stay as void. So propagate any errors
using the "err" field in the struct passed in as the sole argument to
that function.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 36 +++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 9d9f0c635527..fa8ed20a6740 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1333,6 +1333,10 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type,
 	return overflow_val;
 }
 
+/*
+ * This function might be called via smp_call_function_any(), so propagate
+ * errors inside the arg struct.
+ */
 static void __ris_msmon_read(void *arg)
 {
 	u64 now;
@@ -1356,7 +1360,9 @@ static void __ris_msmon_read(void *arg)
 
 	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
 		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
-	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+	m->err = mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+	if (m->err)
+		return;
 
 	switch (m->type) {
 	case mpam_feat_msmon_mbwu_31counter:
@@ -1376,7 +1382,9 @@ static void __ris_msmon_read(void *arg)
 	 * Read the existing configuration to avoid re-writing the same values.
 	 * This saves waiting for 'nrdy' on subsequent reads.
 	 */
-	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
+	m->err = read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
+	if (m->err)
+		return;
 
 	if (mpam_feat_msmon_mbwu_31counter == m->type)
 		overflow = cur_ctl & MSMON_CFG_x_CTL_OFLOW_STATUS;
@@ -1390,18 +1398,24 @@ static void __ris_msmon_read(void *arg)
 			  cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
 
 	if (config_mismatch || reset_on_next_read) {
-		write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
+		m->err = write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
+		if (m->err)
+			return;
 		overflow = false;
 	} else if (overflow) {
-		mpam_write_monsel_reg(msc, CFG_MBWU_CTL,
-				      cur_ctl &
-				      ~(MSMON_CFG_x_CTL_OFLOW_STATUS |
-					MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L));
+		m->err = mpam_write_monsel_reg(msc, CFG_MBWU_CTL,
+					    cur_ctl &
+					    ~(MSMON_CFG_x_CTL_OFLOW_STATUS |
+					    MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L));
+		if (m->err)
+			return;
 	}
 
 	switch (m->type) {
 	case mpam_feat_msmon_csu:
-		mpam_read_monsel_reg(msc, CSU, &now32);
+		m->err = mpam_read_monsel_reg(msc, CSU, &now32);
+		if (m->err)
+			return;
 		nrdy = now32 & MSMON___NRDY;
 		now = FIELD_GET(MSMON___VALUE, now32);
 
@@ -1423,7 +1437,9 @@ static void __ris_msmon_read(void *arg)
 			else
 				now = FIELD_GET(MSMON___L_VALUE, now);
 		} else {
-			mpam_read_monsel_reg(msc, MBWU, &now32);
+			m->err = mpam_read_monsel_reg(msc, MBWU, &now32);
+			if (m->err)
+				return;
 			nrdy = now32 & MSMON___NRDY;
 			now = FIELD_GET(MSMON___VALUE, now32);
 		}
@@ -1792,6 +1808,8 @@ static int mpam_restore_mbwu_state(void *_ris)
 			mwbu_arg.val = &val;
 
 			__ris_msmon_read(&mwbu_arg);
+			if (mwbu_arg.err && mwbu_arg.err != -EBUSY)
+				return mwbu_arg.err;
 		}
 	}
 
-- 
2.43.0



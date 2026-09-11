Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433DEC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 11:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L392qMLpAhYsB3qxFg3bxG4Ybzfg50T6UbkZAWEEPCc=; b=zrJJwufwhxhxN5909LpQsSiyyN
	dtjYCGE+bubFr+K/SZz595gpLNmeJbMaQCNwlxhg/m4O0xqsl8FVgiXh7T+bYmcCiTZZddCLY+ABE
	gBflK4Zwr3fNBrTb2py5hIBLuOSwfV9VPDj+p+Kj9a+SFpaTuVzZaQ41EJaOzT08695agiIgO2rNw
	QbynVU6VeiFtX4AcUo7mYwrNeJHwzvnmU4bQUYFr0HsSTUu/Io307Y/vlDqRUO7N8gn+agoKCL3Qh
	IqXs7spmlAAXVOj9pFp1WClUbL1GV/s7czL40+8DF6Qc2xQ40TaAWya690z3mCSSrcJD5el80EQEt
	hlznyXLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zRY-0000000GVT0-08Eb;
	Fri, 11 Sep 2026 11:29:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zRN-0000000GVNi-3Dra
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 11:29:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73EB316F2;
	Fri, 11 Sep 2026 04:29:04 -0700 (PDT)
Received: from e142021.arm.com (unknown [10.57.6.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2240A3F59E;
	Fri, 11 Sep 2026 04:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789126148; bh=JUYW6rzzZKURsfUY87KV0xgd0hseR11dCrFozrEpdjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E9wtwsxqL2MJYh1xcTw5EJqu45aIS7n1nLYuQfeWBYi6LS+RgjC9uEL++/ybJ8iC8
	 v73m552o6OoRxJolsn80FjGEmlJFm882nvpf+dx11d6ChQU3W0Rt+c0XXlaA8KjFFy
	 if3EywiWDI3hNwXBqT2bEhI/Ezrf2ub129f32o6g=
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
	Gavin Shan <gshan@redhat.com>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 05/14] arm_mpam: propagate MSC access errors for __ris_msmon_read()
Date: Fri, 11 Sep 2026 13:28:26 +0200
Message-ID: <20260911112835.714162-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911112835.714162-1-andre.przywara@arm.com>
References: <20260911112835.714162-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_042909_884470_8680920B 
X-CRM114-Status: GOOD (  14.69  )
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
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Gavin Shan <gshan@redhat.com> # on NVIDIA Grace Hopper
---
 drivers/resctrl/mpam_devices.c | 36 +++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index bfad65596f172..6a514cc9251ec 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1332,6 +1332,10 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type,
 	return overflow_val;
 }
 
+/*
+ * This function might be called via smp_call_function_any(), so propagate
+ * errors inside the arg struct.
+ */
 static void __ris_msmon_read(void *arg)
 {
 	u64 now;
@@ -1355,7 +1359,9 @@ static void __ris_msmon_read(void *arg)
 
 	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
 		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
-	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+	m->err = mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+	if (m->err)
+		return;
 
 	switch (m->type) {
 	case mpam_feat_msmon_mbwu_31counter:
@@ -1375,7 +1381,9 @@ static void __ris_msmon_read(void *arg)
 	 * Read the existing configuration to avoid re-writing the same values.
 	 * This saves waiting for 'nrdy' on subsequent reads.
 	 */
-	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
+	m->err = read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
+	if (m->err)
+		return;
 
 	if (mpam_feat_msmon_mbwu_31counter == m->type)
 		overflow = cur_ctl & MSMON_CFG_x_CTL_OFLOW_STATUS;
@@ -1389,18 +1397,24 @@ static void __ris_msmon_read(void *arg)
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
+					       cur_ctl &
+					       ~(MSMON_CFG_x_CTL_OFLOW_STATUS |
+					       MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L));
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
 
@@ -1422,7 +1436,9 @@ static void __ris_msmon_read(void *arg)
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
@@ -1796,6 +1812,8 @@ static int mpam_restore_mbwu_state(void *_ris)
 			mwbu_arg.val = &val;
 
 			__ris_msmon_read(&mwbu_arg);
+			if (mwbu_arg.err && mwbu_arg.err != -EBUSY)
+				return mwbu_arg.err;
 		}
 	}
 
-- 
2.43.0



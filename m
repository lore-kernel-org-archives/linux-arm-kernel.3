Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B96CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RVyekUV5mdoZ4nvl9zvE6ylYm4sabPoBqWh87ozPTM=; b=eXHTtMGYVg+v19ik3cBf7L12py
	bgGfHcpca2AUlF70669c46bGpJWRbUpaQAFb5f6/ZwtXPy7rHq7jVDQSg8+bQK5GjEJ5dIeEbEL/6
	6oxYep6m61Ik2Z7sOiXvZlJAxbFlUthBFpqKYBRSYWzEkRhWP6Rf++4BNMNuZKLNV90MTuBYHi7IN
	t1AISCp1I2Oz6KsaaC/7MZk6MlgnAxFV5lE3p4qQEJFBAgUUaWD3WPQQu69UiYD70feKLdVPGZoWt
	rQL0tq1XF69qd27dpCwt66Ea6ScsqgllUPhVnejeWS7HHGCRz+Y6hp48DSsSNwiRrnZpp2Fh3wK7d
	7E9G9+oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChFX-0000000CBwY-2JM3;
	Fri, 02 Oct 2026 17:40:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChFD-0000000CBME-2nZN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 139181476;
	Fri,  2 Oct 2026 10:40:23 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AFCF3F882;
	Fri,  2 Oct 2026 10:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962826; bh=2rwqXU/cdfqeeI5YRwhfXMpOZ0jS6Eq5du19497SmVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kXbtQNX+Im0Gz4IssfCAyayt8pRJ3yLIgUYbzKE0nK1Ce/L+xBQjDyBccIwwhgo0H
	 qGtQpeNwb+z0Q91RhM8Ix7w2PmFXUMnp/5aRX4OfsN6wQPGYvPOrBJlipUX+Z056+l
	 HgpCFo2rPo9x49/oSXJbuGZ0PgEGs81MMb26I3Rw=
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
Subject: [PATCH 19/27] arm_mpam: propagate MSC access errors for __ris_msmon_read()
Date: Fri,  2 Oct 2026 18:39:32 +0100
Message-ID: <20261002173941.292319-20-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_104027_965835_C1BDF1DD 
X-CRM114-Status: GOOD (  14.79  )
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
[morse: Fixed merge conflicts in mpam_save_mbwu_state() and __ris_msmon_read()]
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c | 37 +++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 72a5d1ab9684..853e5c5d7158 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1339,6 +1339,10 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type,
 	return overflow_val;
 }
 
+/*
+ * This function might be called via smp_call_function_any(), so propagate
+ * errors inside the arg struct.
+ */
 static void __ris_msmon_read_locked(struct mon_read *m)
 {
 	u64 now;
@@ -1357,7 +1361,9 @@ static void __ris_msmon_read_locked(struct mon_read *m)
 
 	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
 		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
-	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+	m->err = mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+	if (m->err)
+		return;
 
 	switch (m->type) {
 	case mpam_feat_msmon_mbwu_31counter:
@@ -1377,7 +1383,9 @@ static void __ris_msmon_read_locked(struct mon_read *m)
 	 * Read the existing configuration to avoid re-writing the same values.
 	 * This saves waiting for 'nrdy' on subsequent reads.
 	 */
-	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
+	m->err = read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
+	if (m->err)
+		return;
 
 	if (mpam_feat_msmon_mbwu_31counter == m->type)
 		overflow = cur_ctl & MSMON_CFG_x_CTL_OFLOW_STATUS;
@@ -1391,18 +1399,24 @@ static void __ris_msmon_read_locked(struct mon_read *m)
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
 
@@ -1424,7 +1438,9 @@ static void __ris_msmon_read_locked(struct mon_read *m)
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
@@ -1831,6 +1847,9 @@ static int mpam_restore_mbwu_state(void *_ris)
 		__ris_msmon_read_locked(&mbwu_arg);
 
 		mpam_mon_sel_unlock(msc);
+
+		if (mbwu_arg.err && mbwu_arg.err != -EBUSY)
+			return mbwu_arg.err;
 	}
 
 	return 0;
-- 
2.53.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C3CC982DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sreAU0BS+DqcvHBxjm+BtQnYeiqCGox/2f+AQPwNxY=; b=eCSh83Y7QZjYQ5VQ4kP/U6i4nA
	RUmttZG5N4MjtMnOSw4n9ZfG5tYSaWf8YsYjwZawn/t2q0Mhz/FBlhoVFtb5QsCTD6LyWhZF5OiiB
	1KLLbpqSDd5vuxTGMCaPwte7XmQ/xFAn1IGcrFdUi0cwj+ylC/FJ5VIuRstOHgLfkmWyOgghTI0L3
	gRC0N7S7tuZXQuzDMIWhy+tJz0Er85Za01IC7bsG1o+xrQpDYVH4fd9Vcc//GLz/eBajuxURHkN4M
	hLIUoKgZ2kNzgk/vOIKlWoEy5Xp/MZJLLjqzVbpnXWEmVFNVmYAOFvHGpBwC11aRWxHVYcepWMv+R
	ChzAwltA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXd-0000000BbEK-1ESv;
	Thu, 17 Sep 2026 14:56:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXO-0000000Bb6l-400E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:56:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E4821F91;
	Thu, 17 Sep 2026 07:56:30 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 54DBF3F86F;
	Thu, 17 Sep 2026 07:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789656993; bh=lb4IRP+Y1Hz2fJbSNi4TVLYctKlrDlgtGYuXAuzDSJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nr/3FAiGv7IZVAPqm9GBEIy/0+t1vKHstf/mzx+RjYYIEe7/+PDk81EwkzBgG995Z
	 a/ecN+6wPCPhEMzpyDbaq+QUFGHPkPyXEREU3Irk49O44GJs+eNXfPeiplSo+mzv3H
	 IcIBpYHxf+2jze7w9j2rD/utgrFcwMDxJKk0Kqc0=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v2 04/12] arm_mpam: Add missing mon_sel locking in MBWU save and restore
Date: Thu, 17 Sep 2026 15:56:09 +0100
Message-ID: <20260917145617.2202986-5-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917145617.2202986-1-ben.horgan@arm.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_075635_037308_CB7EA243 
X-CRM114-Status: GOOD (  12.13  )
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

The mon_sel_lock is used to protect the mbwu_state, as well as h/w accesses
that use MPAMCFG_MON_SEL. However, in mpam_restore/save_mbwu_state(),
mbwu_state is accessed without holding the mon_sel_lock.

Add the missing locking.

Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
Changes since v1:

'continue' if monitor enabled
move locking earlier in mpam_save_mbwu_state() and adjust commit message
---
 drivers/resctrl/mpam_devices.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index e349db525882..d39d210574a6 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1652,17 +1652,26 @@ static int mpam_restore_mbwu_state(void *_ris)
 	u64 val;
 	struct mon_read mwbu_arg;
 	struct mpam_msc_ris *ris = _ris;
+	struct mpam_msc *msc = ris->vmsc->msc;
 	struct mpam_class *class = ris->vmsc->comp->class;
 
 	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
-		if (ris->mbwu_state[i].enabled) {
-			mwbu_arg.ris = ris;
-			mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
-			mwbu_arg.type = mpam_msmon_choose_counter(class);
-			mwbu_arg.val = &val;
+		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
+			return -EIO;
 
-			__ris_msmon_read(&mwbu_arg);
+		if (!ris->mbwu_state[i].enabled) {
+			mpam_mon_sel_unlock(msc);
+			continue;
 		}
+
+		mwbu_arg.ris = ris;
+		mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
+		mwbu_arg.type = mpam_msmon_choose_counter(class);
+		mwbu_arg.val = &val;
+
+		mpam_mon_sel_unlock(msc);
+
+		__ris_msmon_read(&mwbu_arg);
 	}
 
 	return 0;
@@ -1680,12 +1689,12 @@ static int mpam_save_mbwu_state(void *arg)
 	struct mpam_msc *msc = ris->vmsc->msc;
 
 	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
-		mbwu_state = &ris->mbwu_state[i];
-		cfg = &mbwu_state->cfg;
-
 		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
 			return -EIO;
 
+		mbwu_state = &ris->mbwu_state[i];
+		cfg = &mbwu_state->cfg;
+
 		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
 			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
 		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
-- 
2.43.0



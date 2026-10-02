Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C378BCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/VyqMaa3V9/j1NJyWEh1lLEg4F1dj9SA947AQWdcao=; b=w2j5n/j7RctohZLeseVXxFqb6f
	MfX2ZuyiRPozX8Dfzn5+6DEiXBHFVf6VUeMjn6xPzQbKJ7jHKM8qC3oceOxW4eDDH9pUYyV+aIWjN
	uAnl25Nrhy+q1B5lgP2kkd30YMS6KWOVfY4A+WROIoIl3OTlL+tWH8ebctgvtBk04azY2AFHmZ+Gm
	SOWhkY4nvneZKe6ZTVWMFKgEY+bT2eqR5ngAjeBo2colJkd7fpe6MX14v6/nGgt9f5ZFj20/3Hw2b
	WsBRXNckpzCUl4q/N0TPcTGJ3k8Qg1AQi2vnIWfZznHkh0YnGmsgUuMrSabLga6Qhbo5iXf/5beME
	wieNy+mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEy-0000000CBLc-1Pb6;
	Fri, 02 Oct 2026 17:40:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEv-0000000CBF5-1aO9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22DCD143D;
	Fri,  2 Oct 2026 10:40:05 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 753563F85F;
	Fri,  2 Oct 2026 10:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962808; bh=rHSvUIIV7QeZBpB7ZFmLNNiR5O+uM/0SX1H6HfDNUI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dk5dFWUVN+1rcnQXOchrWKCY9qpkpS78Gxzc1Sfia5+BcXRwQWrP+XBow4iQwL1Je
	 5DXFTZY0wtCmh3Br5u8VhxDplY4dHQ8/lIuiMR//e8tAeY+iQc6oGalX7Yhbo/fsfR
	 SMWcVlz6T+ruitBUK690abf2efLhOuKE9QcSgMyU=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Gavin Shan <gshan@redhat.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 06/27] arm_mpam: Use __ris_msmon_read() for saving MBWU state
Date: Fri,  2 Oct 2026 18:39:19 +0100
Message-ID: <20261002173941.292319-7-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_104009_470606_EBFDA2F3 
X-CRM114-Status: GOOD (  18.20  )
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

From: Ben Horgan <ben.horgan@arm.com>

mbwu_save_mbwu_state() reads the MBWU counters and adds that to a saved
correction value. However, the type of counter to read is determined by the
RIS rather than the class and overflow is not taken into account. Fix this
and mitigate against further divergence by using a locked variant of the
same helper used for user monitor reads, __ris_msmon_read(). Using the
locked variant avoids having to drop and retake the mon_sel lock. If the
lock was dropped, an interleaved monitor read which detects overflow would
cause the overflow not to be accounted for in the saved value of
mbwu_state->correction. The correction is no longer updated for disabled
counters but this has no effect as the saved values are not expected to be
useful for disabled counters.

Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
[morse: Added comment on correction being included in mpam_save_mbwu_state()]
Reviewed-by: James Morse <james.morse@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c | 68 +++++++++++++++++++++++-----------
 1 file changed, 47 insertions(+), 21 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 6df48bec82e2..a3d58a51dc73 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1029,12 +1029,6 @@ struct mon_read {
 	bool				waited_timeout;
 };
 
-static bool mpam_ris_has_mbwu_long_counter(struct mpam_msc_ris *ris)
-{
-	return (mpam_has_feature(mpam_feat_msmon_mbwu_63counter, &ris->props) ||
-		mpam_has_feature(mpam_feat_msmon_mbwu_44counter, &ris->props));
-}
-
 static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
 {
 	int retry = 3;
@@ -1202,13 +1196,12 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type,
 	return overflow_val;
 }
 
-static void __ris_msmon_read(void *arg)
+static void __ris_msmon_read_locked(struct mon_read *m)
 {
 	u64 now;
 	bool nrdy = false;
 	bool config_mismatch;
 	bool overflow = false;
-	struct mon_read *m = arg;
 	struct mon_cfg *ctx = m->ctx;
 	bool reset_on_next_read = false;
 	struct mpam_msc_ris *ris = m->ris;
@@ -1216,10 +1209,8 @@ static void __ris_msmon_read(void *arg)
 	struct mpam_msc *msc = m->ris->vmsc->msc;
 	u32 mon_sel, ctl_val, flt_val, cur_ctl, cur_flt;
 
-	if (!mpam_mon_sel_lock(msc)) {
-		m->err = -EIO;
-		return;
-	}
+	mpam_mon_sel_lock_held(msc);
+
 	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
 		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
 	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
@@ -1312,7 +1303,6 @@ static void __ris_msmon_read(void *arg)
 	default:
 		m->err = -EINVAL;
 	}
-	mpam_mon_sel_unlock(msc);
 
 	if (nrdy)
 		m->err = -EBUSY;
@@ -1323,6 +1313,21 @@ static void __ris_msmon_read(void *arg)
 	*m->val += now;
 }
 
+static void __ris_msmon_read(void *arg)
+{
+	struct mon_read *m = arg;
+	struct mpam_msc *msc = m->ris->vmsc->msc;
+
+	if (!mpam_mon_sel_lock(msc)) {
+		m->err = -EIO;
+		return;
+	}
+
+	__ris_msmon_read_locked(m);
+
+	mpam_mon_sel_unlock(msc);
+}
+
 static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
 {
 	int err, any_err = 0;
@@ -1674,9 +1679,9 @@ static int mpam_restore_mbwu_state(void *_ris)
 
 		mbwu_state->reset_on_next_read = true;
 
-		mpam_mon_sel_unlock(msc);
+		__ris_msmon_read_locked(&mwbu_arg);
 
-		__ris_msmon_read(&mwbu_arg);
+		mpam_mon_sel_unlock(msc);
 	}
 
 	return 0;
@@ -1688,10 +1693,12 @@ static int mpam_save_mbwu_state(void *arg)
 	int i;
 	u64 val;
 	struct mon_cfg *cfg;
+	struct mon_read mbwu_arg;
 	u32 cur_flt, cur_ctl, mon_sel;
 	struct mpam_msc_ris *ris = arg;
 	struct msmon_mbwu_state *mbwu_state;
 	struct mpam_msc *msc = ris->vmsc->msc;
+	struct mpam_class *class = ris->vmsc->comp->class;
 
 	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
 		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
@@ -1708,17 +1715,36 @@ static int mpam_save_mbwu_state(void *arg)
 		cur_ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
 		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
 
-		if (mpam_ris_has_mbwu_long_counter(ris))
-			val = mpam_msc_read_mbwu_l(msc);
-		else
-			val = mpam_read_monsel_reg(msc, MBWU);
-
 		cfg->mon = i;
 		cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
 		cfg->match_pmg = FIELD_GET(MSMON_CFG_x_CTL_MATCH_PMG, cur_ctl);
 		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
-		mbwu_state->correction += val;
 		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
+
+		if (!mbwu_state->enabled) {
+			mpam_mon_sel_unlock(msc);
+			continue;
+		}
+
+		val = 0;
+		mbwu_arg = (struct mon_read) {
+			.ris = ris,
+			.ctx = cfg,
+			.type = mpam_msmon_choose_counter(class),
+			.val = &val,
+		};
+
+		__ris_msmon_read_locked(&mbwu_arg);
+
+		mbwu_state->reset_on_next_read = true;
+		if (!mbwu_arg.err) {
+			/*
+			 * __ris_msmon_read_locked() already included the
+			 * previous correction value.
+			 */
+			mbwu_state->correction = val;
+		}
+
 		mpam_mon_sel_unlock(msc);
 	}
 
-- 
2.53.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A37C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+23Gj7C6pz3jyp1B63zC+kAQ0hrNI+Xvox4g3vWSQs=; b=1eQxwt4VnuenWqZHt/HQqcXO26
	2JavcMoKOtJUIk/LPp+JiWHhSy+W+XncrVrPSCNOO++hmyZLnRYc9BB5fB8dVeY/FoKpmLvQf4NNx
	xIocOIRn/39Cu+hN7WQFUCg7SLcNJDtQrV2WjqduRvm1LK7h+kAVv/YrYCyxZDaVDb0rNmF+UjVPJ
	ZIofwcTtrxy90qgN2DWSIumOKALAy8LVwy9ekxIGQToKnK8KAsuRnlLUEeZRbhlbJfnXltTPmTlxI
	5m5EHd7DZ650juwiqft8OFrjn7nAUjknVgJGoKm7Kd2nW3xqPnRee1z6A1lAbHRCQOPBPSecqYu5y
	3V00voog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9pw-00000004rpl-46ED;
	Fri, 10 Jul 2026 11:56:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9pu-00000004rnn-3ub6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:56:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70BF71E7D;
	Fri, 10 Jul 2026 04:56:01 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 80F043F85F;
	Fri, 10 Jul 2026 04:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783684565; bh=tRbKY3Y19Zi1hPsx89QQ0nDyhprmvEfYYBE29iBt8W8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mAV5/wqwjOcCLHo/yVnps8/NXBWX0Em5u/f4B57WeJTb+wIMPXjuRdPz35uVRQ51b
	 oNFEwappB2TLuLcSOezRAHteDcsfFwnENWp7Va20C0YGY0eT+RXiJom8e40+jK1AR8
	 fQz1pfnXszVUYYcvzjIYypWcCs/jzChjpQUuM6vs=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com
Subject: [PATCH v1 06/11] arm_mpam: Use __ris_msmon_read() for saving MBWU state
Date: Fri, 10 Jul 2026 12:55:40 +0100
Message-ID: <20260710115546.29644-7-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710115546.29644-1-ben.horgan@arm.com>
References: <20260710115546.29644-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_045607_038093_8EC0D2F9 
X-CRM114-Status: GOOD (  14.89  )
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

mbwu_save_mbwu_state() reads the MBWU counters and adds that to a saved
correction value. However, the type of counter to read is determined by the
RIS rather than the class and overflow is not taken into account. Fix this
and mitigate against further divergence by using the same helper as used
for user reads, __ris_msmon_read().

Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 222fc248067e..a49f426aefc0 100644
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
@@ -1687,6 +1681,7 @@ static int mpam_save_mbwu_state(void *arg)
 	struct mpam_msc_ris *ris = arg;
 	struct msmon_mbwu_state *mbwu_state;
 	struct mpam_msc *msc = ris->vmsc->msc;
+	struct mpam_class *class = ris->vmsc->comp->class;
 
 	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
 		mbwu_state = &ris->mbwu_state[i];
@@ -1702,18 +1697,32 @@ static int mpam_save_mbwu_state(void *arg)
 		cur_flt = mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
 		cur_ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
 
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
 		mpam_mon_sel_unlock(msc);
+
+		if (mbwu_state->enabled) {
+			struct mon_read mbwu_arg = {
+				mbwu_arg.ris = ris,
+				mbwu_arg.ctx = cfg,
+				mbwu_arg.type = mpam_msmon_choose_counter(class),
+				mbwu_arg.val = &val,
+			};
+
+			val = 0;
+			__ris_msmon_read(&mbwu_arg);
+
+			if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
+				return -EIO;
+
+			mbwu_state->reset_on_next_read = true;
+			if (!mbwu_arg.err)
+				mbwu_state->correction = val;
+			mpam_mon_sel_unlock(msc);
+		}
 	}
 
 	return 0;
-- 
2.43.0



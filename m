Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF98CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0YagE8rflxUswe6sAAs865u831nLtV6oL2GHgnEg8Y=; b=nWHsQhCJTY1cI2+KdDDc8mQMWW
	tCpE0B0SsWiHTs+VdKXoHrgh5HJ9FxmZyAH+gerX/9psnvWVyD9r4PTFqM3lsX9TtEwV+9RBRR8Ol
	HxA7j3O9sMEJ8GPKspa2Dq7aaHIatDPjmovXldnSEzmKFnnhaEdm1uSy5vfCLfabmMjRiIpZwptni
	WzViQDHTrIGXJGZAnBtWXnOz+QtgsdxV9uqkQjsCr49WVFAT8ZRCJpQJ2HcZxFTM6DzIv6FzKliww
	gL7/aQ0daqsbuCyPcj3kDrGoDK5hI+3w7J/yAM1UEZbd68G7y/t6xMd9J43ZGz0zEZNQWbqVUcPEN
	QbMbHxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEv-0000000CBHe-0Hlu;
	Fri, 02 Oct 2026 17:40:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEs-0000000CBF6-2pFk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AC05143D;
	Fri,  2 Oct 2026 10:40:02 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BABD33F85F;
	Fri,  2 Oct 2026 10:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962805; bh=xHWUygO4qxy8ieQBIbBK4CiBLOdC4aiT1dsQJP56zew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e1oTxFoRmwrcbEyc1rw5GZ1G8x88W9bLnE19gRWv4cLKSx8sOXTI0dBArbpU77khG
	 KD8en7qNFl8LYZ3iVmfcMYMnNKqUt2CwCfKFhXJBaugH1IdkfczCMDKDXb+v8/91/E
	 rT4J7oqknePVa7f0jsT9RKLa6mFGUmUhgqVx5qkE=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Gavin Shan <gshan@redhat.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 04/27] arm_mpam: Add missing mon_sel locking in MBWU save and restore
Date: Fri,  2 Oct 2026 18:39:17 +0100
Message-ID: <20261002173941.292319-5-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_104006_806245_0837D3CA 
X-CRM114-Status: GOOD (  13.28  )
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

The mon_sel_lock is used to protect the mbwu_state, as well as h/w accesses
that use MPAMCFG_MON_SEL. However, in mpam_restore/save_mbwu_state(),
mbwu_state is accessed without holding the mon_sel_lock.

Add the missing locking.

Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: James Morse <james.morse@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
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
+		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
+			return -EIO;
+
 		mbwu_state = &ris->mbwu_state[i];
 		cfg = &mbwu_state->cfg;
 
-		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
-			return -EIO;
-
 		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
 			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
 		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
-- 
2.53.0



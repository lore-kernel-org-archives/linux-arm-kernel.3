Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35880C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTc8oT/JBEk60mfcn2YWFelkVLerjBNQr0lhJ1lLxyQ=; b=k6mC+vY0o4GwKNoj/8OhNsUCW9
	aKOEEEjhIb0UFMQQAY0yIr1GcMjWKxbKgRwVFFZVx6oYkko7zwFVotojQIPA+Y74xiHO9wiI2aO63
	bzRZ8fWsoWxAd9Z298Ay4c8fOxyYplsT1IBpBqzIKziTs0y6cBcsBzuNxVWp2xrV7HXxIsB5lHFEC
	libJv9QwxePtXUdwDBhzXT22ORsjCLMCfZjRH7EViXEqmU+30j0czxPKE/bMh8+0EyRZJTx0fy4o5
	CChYZV2toRKPDQS4sy4C1xEZ5zklLsj7IstVC7VvtmgLqQpJdVg/tSWEX+yfRjCypT1l7LOTVho1p
	OT8dbzuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9q8-00000004rzd-0iUk;
	Fri, 10 Jul 2026 11:56:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9pw-00000004rl4-0qXp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:56:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08ECE2328;
	Fri, 10 Jul 2026 04:56:03 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 148503F85F;
	Fri, 10 Jul 2026 04:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783684567; bh=IhqgtJ551+2AeSwFpzXLRHOVZq41eD4WsNI+b8vq1tw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cDaJUQ8/PWoExErsDnu7+UF3RhX+jeze4GyzNpulPD67xdWd6Lf092pxuD+Qgki9K
	 nrfbxEG5xy9IXuBgPL0kS+8l6jFEs+Ab3wQ1iva4GbTqsEHJlfD8/y2EuyfptdROHQ
	 z4ElX+kFYDp+PczEeyNWEBi4FUOs+4A/gev+FqG0=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com
Subject: [PATCH v1 07/11] arm_mpam: Initialize all of struct mon_read in mpam_restore_mbwu_state()
Date: Fri, 10 Jul 2026 12:55:41 +0100
Message-ID: <20260710115546.29644-8-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710115546.29644-1-ben.horgan@arm.com>
References: <20260710115546.29644-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_045608_282856_C5476801 
X-CRM114-Status: GOOD (  12.00  )
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

m->err may be read before initialization in __ris_msmon_read() when called
from mpam_restore_mbwu_state().

Initialize the whole struct mon_read in mpam_restore_mbwu_state() and fix
the spelling of mbwu in the name.

Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index a49f426aefc0..c9adc450f087 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1640,7 +1640,6 @@ static int mpam_restore_mbwu_state(void *_ris)
 {
 	int i;
 	u64 val;
-	struct mon_read mwbu_arg;
 	struct mpam_msc_ris *ris = _ris;
 	struct msmon_mbwu_state *mbwu_state;
 	struct mpam_msc *msc = ris->vmsc->msc;
@@ -1653,16 +1652,18 @@ static int mpam_restore_mbwu_state(void *_ris)
 			return -EIO;
 
 		if (ris->mbwu_state[i].enabled) {
-			mwbu_arg.ris = ris;
-			mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
-			mwbu_arg.type = mpam_msmon_choose_counter(class);
-			mwbu_arg.val = &val;
+			struct mon_read mbwu_arg = {
+				.ris = ris,
+				.ctx = &ris->mbwu_state[i].cfg,
+				.type = mpam_msmon_choose_counter(class),
+				.val = &val
+			};
 
 			mbwu_state->reset_on_next_read = true;
 
 			mpam_mon_sel_unlock(msc);
 
-			__ris_msmon_read(&mwbu_arg);
+			__ris_msmon_read(&mbwu_arg);
 		} else {
 			mpam_mon_sel_unlock(msc);
 		}
-- 
2.43.0



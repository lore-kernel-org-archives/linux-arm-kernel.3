Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4848C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrrA01oBiydfU/wKB+VGgAejpF5U9FOglxu6FBKF8p8=; b=zcGh3JNgUXWv42OveoBqYD64OB
	F0urVS/9pPo3QqWST4AQEkywPJweOjfKDaP2guAkdUl5kkTN2MdKFPsuqSygG7StQiBU98VibIQ4O
	RJKdbymgrpDbXDHHwDbzXEP4IjVDrQwsT567gICHebifmzlxwMErG+hfB8sdpjnPc8px37Ch82u8h
	To03VeMUfGelsdkH33EdJDD8pYUp4e2vlYL4j6lU9Yz/eimo5z0UPLTrLXsIFOmloN+1+gmm/hxf6
	vRPR9asWSwTDLW+nYN9T01DVkoVCMuBY/obCRN6lAt1sJQhHeI28q283pMNV03MFMmfzT7prQuu02
	f9vlLOxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9pw-00000004rp3-3Kie;
	Fri, 10 Jul 2026 11:56:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9pr-00000004rl4-1Z5V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:56:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 592661FC7;
	Fri, 10 Jul 2026 04:55:58 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 64C083F85F;
	Fri, 10 Jul 2026 04:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783684562; bh=nuBpyWDhg01mGE5l/NpZBdUueEbff+jPNB0ll2EAWDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bpo82XloTyfop1H+/X+gjvyK+b+6o4mN8JjbsxDvVKtrkQ08SqcPmDMPnyR+w5tqd
	 4iSOxN6020bi8CL0Q9g2l847PV2Z0Iog24QeDa5KITH9PfQcCDLaW8DgDQ4QhDgLeO
	 C5PHcqhkZhX6h3z2dXfFq9R/7moDeTjXEOH5r1X8=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com
Subject: [PATCH v1 04/11] arm_mpam: Add missing mon_sel locking in MBWU restore
Date: Fri, 10 Jul 2026 12:55:38 +0100
Message-ID: <20260710115546.29644-5-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710115546.29644-1-ben.horgan@arm.com>
References: <20260710115546.29644-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_045603_469632_679479D5 
X-CRM114-Status: GOOD (  11.69  )
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
that use MPAMCFG_MON_SEL. However, in mpam_restore_mbwu_state() mbwu_state
is accessed without holding the mon_sel_lock.

Add the missing locking.

Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 11b10c3bc334..b34e2a368516 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1648,16 +1648,24 @@ static int mpam_restore_mbwu_state(void *_ris)
 	u64 val;
 	struct mon_read mwbu_arg;
 	struct mpam_msc_ris *ris = _ris;
+	struct mpam_msc *msc = ris->vmsc->msc;
 	struct mpam_class *class = ris->vmsc->comp->class;
 
 	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
+		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
+			return -EIO;
+
 		if (ris->mbwu_state[i].enabled) {
 			mwbu_arg.ris = ris;
 			mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
 			mwbu_arg.type = mpam_msmon_choose_counter(class);
 			mwbu_arg.val = &val;
 
+			mpam_mon_sel_unlock(msc);
+
 			__ris_msmon_read(&mwbu_arg);
+		} else {
+			mpam_mon_sel_unlock(msc);
 		}
 	}
 
-- 
2.43.0



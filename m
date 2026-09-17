Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D05C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4T21p5fz//chkUODZPiI1zn6kT0I4W2mxbLW6WmsHec=; b=LbXo57P35sdTVn5piQf4Hr/EtD
	kEL2sEV6kVmhoMnsaGq19oMWG+iRF0IEQHIW3dvdw/OQEu6GZOgjuPS3SVdJH+U2DYKm9pdmfE9s5
	0a8vwIp3nT6IRPnrqWTTpe7HG6l9dF79nJ2ejL4ddqr+Nz6A180e0Ct6Nsm4THgQXjzqesRoxIf/j
	wPWq+qiNFopXGVIPQ28RkAumYsQzuA0IUYmZDoMsgAnGNgM4w6jq3pnXViM+hHCUHpFu6YQ+pLTWI
	TDN2+Ooe3SuNULiEYr3ZFkq7tYIu0CasKykGvxk2q3xO4RrQxKF1QjgsReKPzbh+koiHS090kqJK3
	ynpEO6yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXd-0000000BbFi-379w;
	Thu, 17 Sep 2026 14:56:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXT-0000000Bb61-3bCj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:56:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5587B1FCD;
	Thu, 17 Sep 2026 07:56:35 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7F2443F86F;
	Thu, 17 Sep 2026 07:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789656998; bh=MGyp/ALeEy8uuqHVHvuEIqk/S0nAwjOKbP8LJumLzqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QFpRxlaqHNExmxbF9n3J1atQLgPtiUU4QQzyLYIBvlV8hljnmGqUf4MFwbJT3pde0
	 DCZAf6WR8si/awQJQMxIdFNboJccRLoclMQLPKbF8z3mpBf3OykpFj0192kZU/1TYR
	 uYyf2fz0EjVfoM4AUKuWW5qM6JpJ+6ReH2VfPVpY=
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
Subject: [PATCH v2 07/12] arm_mpam: Initialize all of struct mon_read in mpam_restore_mbwu_state()
Date: Thu, 17 Sep 2026 15:56:12 +0100
Message-ID: <20260917145617.2202986-8-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917145617.2202986-1-ben.horgan@arm.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_075639_940024_878DD1D7 
X-CRM114-Status: GOOD (  10.58  )
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

m->err and *m->val may be read before initialization in __ris_msmon_read()
when called from mpam_restore_mbwu_state().

Initialize the whole struct mon_read in mpam_restore_mbwu_state() and fix
the spelling of mbwu in the name.

Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
Changes since v1:

Set val to 0 (Lee)
Use existing mbwu_arg variable
---
 drivers/resctrl/mpam_devices.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 62562ce2f9aa..cdc2d9d19e19 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1655,7 +1655,7 @@ static int mpam_restore_mbwu_state(void *_ris)
 {
 	int i;
 	u64 val;
-	struct mon_read mwbu_arg;
+	struct mon_read mbwu_arg;
 	struct mpam_msc_ris *ris = _ris;
 	struct msmon_mbwu_state *mbwu_state;
 	struct mpam_msc *msc = ris->vmsc->msc;
@@ -1672,14 +1672,17 @@ static int mpam_restore_mbwu_state(void *_ris)
 			continue;
 		}
 
-		mwbu_arg.ris = ris;
-		mwbu_arg.ctx = &mbwu_state->cfg;
-		mwbu_arg.type = mpam_msmon_choose_counter(class);
-		mwbu_arg.val = &val;
+		val = 0;
+		mbwu_arg = (struct mon_read) {
+			.ris = ris,
+			.ctx = &mbwu_state->cfg,
+			.type = mpam_msmon_choose_counter(class),
+			.val = &val,
+		};
 
 		mbwu_state->reset_on_next_read = true;
 
-		__ris_msmon_read_locked(&mwbu_arg);
+		__ris_msmon_read_locked(&mbwu_arg);
 
 		mpam_mon_sel_unlock(msc);
 	}
-- 
2.43.0



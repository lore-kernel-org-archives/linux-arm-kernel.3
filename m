Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3242C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qw5Kw5Q8mXjuaDVvaCqJiAqQYgD9B70SyPtrEBC5RQ=; b=PKm78FjZ/wbw2QFR1MioTsc9bA
	b/WK2vOPPub/SG03i6LZ1MLlGEPgzB2rGKfnAf7q3059XpUlFAKhBi+2y7XfgwT5iqnCj2UNka7Sh
	+f96rIScmFOH881yNpKoItGOAPmsPR/FYQGhzmTpV95w5ZXLnPQynhw0V2UvaLi0jqkFk5J1lA00f
	y2x3Io31OpVbp7yGHN7LYu4sRhlDq3MhQ4A3JF+T5W51JrzryWRKIW16nVdpOEP8SU7yLn6GTpvQl
	u55ZjxtkeuR5q6JRHGXWq2UItmhigatjxRq9pdIXf19f8olwlYdMCNr2cg6EZu9ltPNyMnGmTakeq
	DAPVKaqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXd-0000000BbEn-1nIg;
	Thu, 17 Sep 2026 14:56:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXQ-0000000Bb61-0gYR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:56:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9F3C1FC4;
	Thu, 17 Sep 2026 07:56:31 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1177A3F86F;
	Thu, 17 Sep 2026 07:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789656995; bh=xXU2j6Vlto2OKlCswyt9x1bLuTnySAcZffwGOCbaRbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VFBQdp/JVixGXtOxuJU1o8za8y8MkMXHCDT8D2M+w4XzsxOgiMz0evSBT+/YG3FWE
	 PxBnFzKOL2Nif8TNAKNZ5SGlRR0HUmIfJm81dEpYmpO3YYUyBwboFWkxoI4kKNjgfc
	 pG3P3Uk955/em+dpKoTFyiHYeDw1yPz9fupj9Odg=
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
Subject: [PATCH v2 05/12] arm_mpam: Ensure MBWU counters are reset on restore
Date: Thu, 17 Sep 2026 15:56:10 +0100
Message-ID: <20260917145617.2202986-6-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917145617.2202986-1-ben.horgan@arm.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_075636_253637_205EAC7D 
X-CRM114-Status: GOOD (  11.89  )
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

When an MSC becomes inaccessible due to cpu offline CFG_MBWU_CTL is set to
zero in mpam_save_mbwu_state(). This is very likely to mean that the config
will mismatch when restoring and so the monitor will be reset. However, the
state may have been lost and so there are no guarantees. Ensure the reset
happens by setting the reset_on_next_read and remove the unnecessary writes
from mpam_save_mbwu_state().

Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
---
Changes since v1:
Use local variable mbwu_state consistently (Shaopeng)
Only access ris->mbwu_state when have the mon_sel_lock
---
 drivers/resctrl/mpam_devices.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index d39d210574a6..6cba3ef21cc8 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1652,6 +1652,7 @@ static int mpam_restore_mbwu_state(void *_ris)
 	u64 val;
 	struct mon_read mwbu_arg;
 	struct mpam_msc_ris *ris = _ris;
+	struct msmon_mbwu_state *mbwu_state;
 	struct mpam_msc *msc = ris->vmsc->msc;
 	struct mpam_class *class = ris->vmsc->comp->class;
 
@@ -1659,16 +1660,20 @@ static int mpam_restore_mbwu_state(void *_ris)
 		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
 			return -EIO;
 
-		if (!ris->mbwu_state[i].enabled) {
+		mbwu_state = &ris->mbwu_state[i];
+
+		if (!mbwu_state->enabled) {
 			mpam_mon_sel_unlock(msc);
 			continue;
 		}
 
 		mwbu_arg.ris = ris;
-		mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
+		mwbu_arg.ctx = &mbwu_state->cfg;
 		mwbu_arg.type = mpam_msmon_choose_counter(class);
 		mwbu_arg.val = &val;
 
+		mbwu_state->reset_on_next_read = true;
+
 		mpam_mon_sel_unlock(msc);
 
 		__ris_msmon_read(&mwbu_arg);
@@ -1701,15 +1706,11 @@ static int mpam_save_mbwu_state(void *arg)
 
 		cur_flt = mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
 		cur_ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
-		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
 
-		if (mpam_ris_has_mbwu_long_counter(ris)) {
+		if (mpam_ris_has_mbwu_long_counter(ris))
 			val = mpam_msc_read_mbwu_l(msc);
-			mpam_msc_zero_mbwu_l(msc);
-		} else {
+		else
 			val = mpam_read_monsel_reg(msc, MBWU);
-			mpam_write_monsel_reg(msc, MBWU, 0);
-		}
 
 		cfg->mon = i;
 		cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
-- 
2.43.0



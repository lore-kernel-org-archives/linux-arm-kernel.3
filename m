Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA715C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pst6NDItdmvO9Ds5HqsLqxVSYAC/2aECezqB8oRfKDQ=; b=NaNlkVNRCRueSpJf9r3bbVr1XF
	3j0+0T0tQSei/dglyQeOzBwC7SzHlrxgQVZKTrXo+ONb32lImG6CUBPrMeWZ+5us5X84cUnkqNYl7
	1bfwhaFT7UW4RDUSO92W1+fQhSQR5ysw+LpfdI8c/YSYxN7pDRQd8VSKq0xyHqODUGagnxrodnoHB
	mVwLZPs7VQm5a/8NCFSpG0lahSdph2dzru2wQebnSlR20fNhNnz1T/OVnGFXqctUk6YD1Brajskjm
	deiWSHfYrCize9PUG0kcf8d1p9Q91wRNeYO7ep9cWC4Zwdy+U+Gv3UQxLX4oEEGNgymIn+ssLrywX
	l0iFiQCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9pw-00000004rpP-3gum;
	Fri, 10 Jul 2026 11:56:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9pt-00000004rl4-2ue6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:56:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFDF32308;
	Fri, 10 Jul 2026 04:55:59 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC6213F85F;
	Fri, 10 Jul 2026 04:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783684564; bh=gywOZrzhJ41YWIQWWOF3b/dr0W/CIWVRpFcmyEH9INg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P28bDA5R+CGGc4K7Iv7MVn248/MD3daSdui+1kYDh/4sjWaeBLf0v1AM9Ck0TwH2j
	 eOBwzHL5JLsjnLj21U22oB7zk9MASDQD1g31XAHC5GLIt3OFUBYYFza78EjKWp+SPI
	 i+shhLS65o2UplWaqBZ3SbwD+jcqMsLUPQBa1mI4=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com
Subject: [PATCH v1 05/11] arm_mpam: Ensure MBWU counters are reset on restore
Date: Fri, 10 Jul 2026 12:55:39 +0100
Message-ID: <20260710115546.29644-6-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710115546.29644-1-ben.horgan@arm.com>
References: <20260710115546.29644-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_045605_780189_D0E71AE7 
X-CRM114-Status: GOOD (  13.60  )
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
---
 drivers/resctrl/mpam_devices.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index b34e2a368516..222fc248067e 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1648,10 +1648,13 @@ static int mpam_restore_mbwu_state(void *_ris)
 	u64 val;
 	struct mon_read mwbu_arg;
 	struct mpam_msc_ris *ris = _ris;
+	struct msmon_mbwu_state *mbwu_state;
 	struct mpam_msc *msc = ris->vmsc->msc;
 	struct mpam_class *class = ris->vmsc->comp->class;
 
 	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
+		mbwu_state = &ris->mbwu_state[i];
+
 		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
 			return -EIO;
 
@@ -1661,6 +1664,8 @@ static int mpam_restore_mbwu_state(void *_ris)
 			mwbu_arg.type = mpam_msmon_choose_counter(class);
 			mwbu_arg.val = &val;
 
+			mbwu_state->reset_on_next_read = true;
+
 			mpam_mon_sel_unlock(msc);
 
 			__ris_msmon_read(&mwbu_arg);
@@ -1696,15 +1701,11 @@ static int mpam_save_mbwu_state(void *arg)
 
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



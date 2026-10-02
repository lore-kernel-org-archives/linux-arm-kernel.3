Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CEBCA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuFHX8bKTlg6VSQ3/HW7h5EF431voBtoqU2/HfCFA+E=; b=DSTY6tAvnBrhWAtzw13UANeu7p
	Ykotw3qtsG0WduoKa5xNimKfLwT987muG5tJRg4Et/I9drggoarsFXd1tLGdLhsGKEzK6HJazVg0l
	KBA5xTXL56NS6zOOH/6aalHcBUbS50z5BjxqwqEQd+aX9d8C+/ZFyaCrtXLb1XYmB/nTembrvm0P4
	ilmoD7n4kWBHf1gR4e4HOi2qh8N5jqM/9J4C8R9rPHslJ2hz1VeTk3R0MPlHR4HfJvMINigZHQxx9
	Of/7xT8YkTQDPE3/o52dFOLAgsEqKocQeZpxDaQLYxnGw2M9yJ7F2RHab3Z6q1eXy86Im9NuRWqwa
	nQBX80cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEy-0000000CBLJ-0xWT;
	Fri, 02 Oct 2026 17:40:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEt-0000000CBGI-2lvR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C03F11476;
	Fri,  2 Oct 2026 10:40:03 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DF453F85F;
	Fri,  2 Oct 2026 10:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962807; bh=2z6lQAPfhNRBpq+PqgVGmjh/g4ygpbXZ1Fizlb0OwUM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WwXdUfoUsKfATYg3zsJPZnaozbMyOVpK6/bESsHCSyhApj50GlavipSIxM39LlLIW
	 FMdpbbzhMKq+KcwoZd1jbAUfaVADp5YF44fsHL6h+TPtkKmOQbnkXS+h44Hv1Hwi6V
	 K2vLsogtOgVyRE4XE1HuojolSTFXckd7Pkm2Apgw=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Gavin Shan <gshan@redhat.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 05/27] arm_mpam: Ensure MBWU counters are reset on restore
Date: Fri,  2 Oct 2026 18:39:18 +0100
Message-ID: <20261002173941.292319-6-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_104007_745871_6288CA3F 
X-CRM114-Status: GOOD (  12.98  )
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

When an MSC becomes inaccessible due to cpu offline CFG_MBWU_CTL is set to
zero in mpam_save_mbwu_state(). This is very likely to mean that the config
will mismatch when restoring and so the monitor will be reset. However, the
state may have been lost and so there are no guarantees. Ensure the reset
happens by setting the reset_on_next_read and remove the unnecessary writes
from mpam_save_mbwu_state().

Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: James Morse <james.morse@arm.com>
[morse: Restored clearing of CTL register for kexec/powerdown]
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index d39d210574a6..6df48bec82e2 100644
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
@@ -1703,13 +1708,10 @@ static int mpam_save_mbwu_state(void *arg)
 		cur_ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
 		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
 
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
2.53.0



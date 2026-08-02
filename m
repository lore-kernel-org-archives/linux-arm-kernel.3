Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACB3C55184
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 16:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frSe+XQnis0Oph5HgKHmJyD+L45rNWS6tMBKUWzAmJQ=; b=XfYrj5rpjknxscvozBK5/y3Tnf
	YelfN2GDViu/dXfSXSfQ+I1dIDX/W7blv0P0EqLJNy/YeoZ0a+wEfGpgbF9b704hrsPEZyZTf+1/Q
	1sTh2treS6yLg155zbXvDRbQbhVmsF2SkO92nltCqG7BoOP4xfC/PJLP0pDZso3R3cryT/rzbT0b3
	t6cuj36Nio3blhEJBcXC6zVoqkJnN4nGJ545vR/xNwBBEl1gx2BqOmva7Ze//KoGm/wtsrZWx5lsU
	eJ/prli28QADLA2R39K0C26RQgFZEQd0JERY+CWoxS70DNtSETXstd3payhbKACOGI8PGSVjuOjtx
	mmU/HGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZRX-0000000FqmG-3bDJ;
	Sun, 02 Aug 2026 16:53:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZRW-0000000FqlA-1T9a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 16:53:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C123760E00;
	Sun,  2 Aug 2026 16:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933B71F000E9;
	Sun,  2 Aug 2026 16:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785689621;
	bh=frSe+XQnis0Oph5HgKHmJyD+L45rNWS6tMBKUWzAmJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ISHKPQefFHyKqP5/QFFo9F67iZ0sZK66AprGjw418KGtjlaKVlM5wdei2qxX/uqVJ
	 YRa7DOoj5rJn07bHI+ZPcxyE6/tvX19vwxJN2vqw7Jgz8TxuVziWsy1i0Cuae8Qs+W
	 tfelHDB8YILzsNBqVcshQAAuWJgGTQGfI3M/mxoG727MwGkTNnE+5KfhelkMv7eWg3
	 PyidwIziSMPkCVx7LrAcqbfiqJktVAHU3/EmlGjU6o041S4GGEn6yQdQYApYSLA5SH
	 y2oi8gOHVD+bvUT7ZOBMMpjgLMFPutWMhpRnhZpumhmDVPrjXdRm6yPvTAm2SD6SVw
	 MbpoLdlhQkwbA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wqZRT-0000000BVIZ-312t;
	Sun, 02 Aug 2026 16:53:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH v3 2/8] clocksource/drivers/arm_arch_timer: Add a static key indicating the need for a runtime workaround
Date: Sun,  2 Aug 2026 17:53:21 +0100
Message-ID: <20260802165327.385217-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260802165327.385217-1-maz@kernel.org>
References: <20260802165327.385217-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, tglx@kernel.org, ben.horgan@arm.com, daniel.lezcano@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

In order to decide whether we can read the architected counter without
disabling preemption to look up a workaround, introduce a static key
that denotes whether a workaround is required at all.

The behaviour of this new static key is a bit unusual:

- it starts as 'true', indicating that workarounds are required

- when all possible CPUs have booted at least once, and that it
  has been established that none of them require a workaround,
  the key flips to 'false'

Of course, as long as not all the CPUs have booted once, you
are stuck with slow accessors, but that's what you get for not
sharing your toys.

Things are made a bit complicated because static keys cannot be
flipped from a CPUHP callback. Instead, schedule a deferred work
from there. Yes, this is fun.

Nothing is making use of this stuff yet, but watch this space.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/clocksource/arm_arch_timer.c | 35 ++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index c02e97f9b7af5..8ee317e33c864 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -90,6 +90,8 @@ static int arch_counter_get_width(void)
 /*
  * Architected system timer support.
  */
+static inline bool arch_counter_broken_accessors(void);
+
 static noinstr u64 raw_counter_get_cntpct_stable(void)
 {
 	return __arch_counter_get_cntpct_stable();
@@ -555,10 +557,42 @@ static bool arch_timer_counter_has_wa(void)
 {
 	return atomic_read(&timer_unstable_counter_workaround_in_use);
 }
+
+static DEFINE_STATIC_KEY_TRUE(broken_cnt_accessors);
+
+static inline bool arch_counter_broken_accessors(void)
+{
+	return static_branch_unlikely(&broken_cnt_accessors);
+}
+
+static void enable_direct_accessors(struct work_struct *wk)
+{
+	pr_info("Enabling direct accessors\n");
+	static_branch_disable(&broken_cnt_accessors);
+}
+
+static void arch_timer_set_direct_accessors(void)
+{
+	static DECLARE_WORK(enable_accessors_wk, enable_direct_accessors);
+	int cpu;
+
+	if (!arch_counter_broken_accessors())
+		return;
+
+	/* Each CPU with non-zero IRQ has booted at least once */
+	for_each_cpu(cpu, cpu_possible_mask)
+		if (!per_cpu_ptr(arch_timer_evt, cpu)->irq)
+			return;
+
+	if (!arch_timer_counter_has_wa())
+		schedule_work(&enable_accessors_wk);
+}
 #else
 #define arch_timer_check_ool_workaround(t,a)		do { } while(0)
 #define arch_timer_this_cpu_has_cntvct_wa()		({false;})
 #define arch_timer_counter_has_wa()			({false;})
+static inline bool arch_counter_broken_accessors(void)	{ return false ; }
+#define arch_timer_set_direct_accessors()		do { } while(0)
 #endif /* CONFIG_ARM_ARCH_TIMER_OOL_WORKAROUND */
 
 static __always_inline irqreturn_t timer_handler(const int access,
@@ -841,6 +875,7 @@ static int arch_timer_starting_cpu(unsigned int cpu)
 	}
 
 	arch_counter_set_user_access();
+	arch_timer_set_direct_accessors();
 
 	return 0;
 }
-- 
2.47.3



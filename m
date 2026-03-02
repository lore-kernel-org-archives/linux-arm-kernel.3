Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC865E9B357
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77NzOXsFscUEYSIPzpW63RovUXgHgTBaAIY3/pEj/Z0=; b=1G03nuZcHIh+hLHiUDirWOy5A+
	8I4lXuicOUcF2GlXR8pIWqspIRDI88q5I/8XgxxNJqKLlX665INez2emCO37gJUq6hsLptjnnmJnS
	q1Vp/MmxXvvb/HZisEjNARDc1bNHXR+Tlb19ol5qbOeXTVCXgouNWXhW1ZNbK9E3xZHPOSMoRP40R
	irFGKmGcaAcVBK0Q0+hm6vKeSjHoZ4guB1JYilFDvhx/EH71QCSrVQ2ZdOczTyOU0QW1LeB/QmBKT
	pX0/96aDPIGOl7Qx28IVlZ5xw3+YCCM8KkTdqBoJcTWvyC6Lk0p9jBxSbQgZ6XVk9/3RsFXbHuhRt
	YwRaIb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0X3-0000000Chph-0uZX;
	Mon, 02 Mar 2026 10:29:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0X2-0000000Cho7-0kvt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DB3160018;
	Mon,  2 Mar 2026 10:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D7EC19425;
	Mon,  2 Mar 2026 10:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772447383;
	bh=RWsHN5U+WMS2JsLtHvvjkJBwH8qQN/pVdfbYmms77H8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nCIWpyvLbpNI41cEWQoUfqc5GRvl4MFYGtJuBYT7u2LgeY+ZpY3eYOwSCj4gs+905
	 dJrjImIsmx/9ymryzc3ofvHDBNZutkHeqWdnonvjDVIkpnQhXPugXLpK+wGbtZ2fWd
	 5ek8kmkufHutK04tVd5wv7xhku6bp5UtEkCf3jZMzmxcDGG9n8c5SbnzQwFETnjzDM
	 pvAuQyL8oqnAKDNig+Nc0YZyehzXK2OMxdZpX1bJLKmORtO4F/sBmE6dIq/qWODfBS
	 7D02rRu1oMG26Aml6+YB1MrH9zauAXkYoIWJMnbcLpiTzZjdvbcwFZxXN69hoTERjJ
	 fD222U3imkkNg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vx0Wy-0000000FBCc-2YEB;
	Mon, 02 Mar 2026 10:29:40 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 3/5] clocksource/drivers/arm_arch_timer: Drop the arch_counter_get_cnt{p,v}ct_stable() accessors
Date: Mon,  2 Mar 2026 10:29:35 +0000
Message-ID: <20260302102937.1516059-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302102937.1516059-1-maz@kernel.org>
References: <20260302102937.1516059-1-maz@kernel.org>
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

Further simplify the counter accessors by eliminating the *_stable()
ones, which serve little purpose at this stage.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/clocksource/arm_arch_timer.c | 38 +++++++++-------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 723ba698b8c46..ee21804d6613c 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -100,19 +100,12 @@ static noinstr u64 raw_counter_get_cntpct(void)
 	return __arch_counter_get_cntpct();
 }
 
-static notrace u64 arch_counter_get_cntpct_stable(void)
+static notrace u64 arch_counter_get_cntpct(void)
 {
-	u64 val;
-	preempt_disable_notrace();
-	val = __arch_counter_get_cntpct_stable();
-	preempt_enable_notrace();
-	return val;
-}
-
-static noinstr u64 arch_counter_get_cntpct(void)
-{
-	if (arch_counter_broken_accessors())
-		return arch_counter_get_cntpct_stable();
+	if (arch_counter_broken_accessors()) {
+		guard(preempt_notrace)();
+		return __arch_counter_get_cntpct_stable();
+	}
 
 	return __arch_counter_get_cntpct();
 }
@@ -125,19 +118,12 @@ static noinstr u64 raw_counter_get_cntvct(void)
 	return __arch_counter_get_cntvct();
 }
 
-static notrace u64 arch_counter_get_cntvct_stable(void)
+static notrace u64 arch_counter_get_cntvct(void)
 {
-	u64 val;
-	preempt_disable_notrace();
-	val = __arch_counter_get_cntvct_stable();
-	preempt_enable_notrace();
-	return val;
-}
-
-static noinstr u64 arch_counter_get_cntvct(void)
-{
-	if (arch_counter_broken_accessors())
-		return arch_counter_get_cntvct_stable();
+	if (arch_counter_broken_accessors()) {
+		guard(preempt_notrace)();
+		return __arch_counter_get_cntvct_stable();
+	}
 
 	return __arch_counter_get_cntvct();
 }
@@ -342,10 +328,10 @@ void erratum_set_next_event_generic(const int access, unsigned long evt,
 	ctrl &= ~ARCH_TIMER_CTRL_IT_MASK;
 
 	if (access == ARCH_TIMER_PHYS_ACCESS) {
-		cval = evt + arch_counter_get_cntpct_stable();
+		cval = evt + arch_counter_get_cntpct();
 		write_sysreg(cval, cntp_cval_el0);
 	} else {
-		cval = evt + arch_counter_get_cntvct_stable();
+		cval = evt + arch_counter_get_cntvct();
 		write_sysreg(cval, cntv_cval_el0);
 	}
 
-- 
2.47.3



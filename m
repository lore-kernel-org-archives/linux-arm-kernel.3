Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE2DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 08:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yMRr1YnRufFQyRdhQsyWFfFy6KrEdPv4Kd5cbN2l9AM=; b=B1tUZuGoAwabI9Eg5/vVlQTB9m
	DrpXNNL4BGCz6qABLF8DL93r3EEPW6XcslgIeUDou3Q0PLdRaw+wyBmWpgvTJvOmixXXh3tSxyMmP
	ZPN+AoJpj8MvGNasRgWX9Dx+ZOrzg0UsF1KQSyeG4UyX5c5pHhd1jfjLiVlW4UjiUC/E0mxgapF3R
	r+52ZMnZYZZmTCXQuPoTt4DMjEgT4vnXITdxZz+R8uZu43V800eRDk9oaltyPYzciSkP55u8PWI43
	0J2nCnxyF4y6FpCRpBUtLJJqZ8LRDo4Vdr2yZd0lqwhXAhkgG+yiCW2RcBEcaEc+c45CCXgJK220N
	FJP2tUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6HY-00000004QNL-2d8l;
	Fri, 10 Jul 2026 08:08:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6HX-00000004QMS-3KSc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 08:08:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D0059600C3;
	Fri, 10 Jul 2026 08:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E831F000E9;
	Fri, 10 Jul 2026 08:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783670902;
	bh=yMRr1YnRufFQyRdhQsyWFfFy6KrEdPv4Kd5cbN2l9AM=;
	h=From:To:Cc:Subject:Date;
	b=F74lVtJn8yP11LSnX5DZVSgoTqViU/1Dd4PHw4l1+l25unBJUhQd/JbHzqhXS/O7A
	 59KdLma9Bxa2FguYjjfzLOvpZBJJF+feyyHv0AAztcW6th2S/5nYuse7FFoRpAofNq
	 CvT3nvYvBQHOPh6HQMFrzDRhdn2t4E9/tHf1wqbl8xKh2666BC5QBi8WQCAe/yvjcb
	 ON40hV3aFdw50HW1gYJ7BP9WH/YaBYZB2Kpa5cfLpVD7ulmr68C2n9RP8uPH5qkG84
	 isl9on0Tazw3X1VQsHcrqnOzeopF0RGVWgNW6lCJVDLXKFWQvELn0TlCKYQe9Y80+J
	 3Lq6w1simx6Mg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=lobster-girl.client.m3-hotspots.de)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wi6HU-00000003acG-0TOe;
	Fri, 10 Jul 2026 08:08:20 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: John <therealgraysky@proton.me>,
	Daniel Drake <dan@reactivated.net>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] clocksource/drivers/arm_arch_timer: Workaround bcm2712 broken EL2 virtual timer
Date: Fri, 10 Jul 2026 09:09:58 +0100
Message-ID: <20260710080958.491620-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, therealgraysky@proton.me, dan@reactivated.net, m.szyprowski@samsung.com, florian.fainelli@broadcom.com, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com
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

It appears that the bcm2712 SoC found in the relatively popular
RPi5 has a broken EL2 virtual timer.

We do not know the reason why the timer isn't working (the timer
is ticking, but the interrupt never fires), and the SoC vendor
doesn't communicate on the reason why this isn't working, leaving
users and maintainers in the dark.

Paper over the issue by detecting the broken HW, falling back to
the physical timer instead, and let the user know about it.
Also taint the kernel as the machine is definitely not compliant
with the spec, and we don't know what else is wrong with it.

Reported-by: John <therealgraysky@proton.me>
Reported-by: Daniel Drake <dan@reactivated.net>
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>
---
 drivers/clocksource/arm_arch_timer.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 4adf756423de9..7b4a98df6962b 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -1090,6 +1090,27 @@ static int __init arch_timer_common_init(void)
 	return arch_timer_arch_init();
 }
 
+static bool __init has_broken_el2_vtimer(void)
+{
+	/*
+	 * SoCs described here have been found to be broken, though no
+	 * explanation has been volunteered by the vendor. Let the user know
+	 * we're papering over the vendor's lack of communication.
+	 */
+	static const char * const broken_el2_vtimer[] __initconst = {
+		"brcm,bcm2712",
+		NULL
+	};
+
+	if (of_machine_compatible_match(broken_el2_vtimer)) {
+		add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
+		pr_warn_once(HW_ERR "Known broken EL2 virtual timer, ignoring it\n");
+		return true;
+	}
+
+	return false;
+}
+
 /**
  * arch_timer_select_ppi() - Select suitable PPI for the current system.
  *
@@ -1115,7 +1136,8 @@ static int __init arch_timer_common_init(void)
 static enum arch_timer_ppi_nr __init arch_timer_select_ppi(void)
 {
 	if (is_kernel_in_hyp_mode()) {
-		if (arch_timer_ppi[ARCH_TIMER_HYP_VIRT_PPI])
+		if (arch_timer_ppi[ARCH_TIMER_HYP_VIRT_PPI] &&
+		    !has_broken_el2_vtimer())
 			return ARCH_TIMER_HYP_VIRT_PPI;
 
 		pr_warn_once(FW_BUG "VHE-capable CPU without EL2 virtual timer interrupt\n");
-- 
2.47.3



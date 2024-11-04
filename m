Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754FCD1BDE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 19:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tr/CFOKYD1rmcvrlItMpMX4YrUFhUOs+XXQs3S8RrrE=; b=2uE51K5y2b/T3a9G6IBDovqj49
	LZ0Wb+9eHIOTFPoDrjCu7NvDOsoJXtOQQILa0eAMFoIoK5tGdxJ7rQHDU8IDebtUPSMELJCdcHdMI
	qlN5xzjx+OdW6pHinD/qBgD9stupfwn/SG1siehR93X+6Z46HFQFNT8gnByZQsYcHlTS4O0e+F4KL
	Xx8/pC1iAbBkhNF96daVQAJO8GLGRmDlMe1fpppG8TRZ8op2pUhdaYQbQROek8iUtALQGlkoZplmJ
	KCHSAR30XF2vQIXTLWON44gslCfyYkElVXCi/vywmPP9Odtzu7ky2Q1QIV7XzLaZAqZmVFcjvLXXP
	Agz//iTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82Su-0000000ErXs-1Nr4;
	Mon, 04 Nov 2024 19:10:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82PC-0000000EqfW-3jLX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 19:06:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A4CB5C0474;
	Mon,  4 Nov 2024 19:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D51BC4CECE;
	Mon,  4 Nov 2024 19:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730747185;
	bh=wMGuXVghL+bQd4b7q/UhbB4pOglwKLk0XTn4dCQA4jA=;
	h=From:To:Cc:Subject:Date:From;
	b=ikmH/Wafqqp/NoIKBlkRHVfaRHzrw3vGSly8hlCNwdqk0x9QZUldb7kfdRkLsdpUG
	 P1vqv4hv2lICBkPn9vRKJXsiYuQ3XJbqFf++EHJW47uCS2nlTtLLeMCJCTEclYHZEp
	 z2gsgkxg48IykI3mkKVKMTVSQ7QhLfh61SfSYc8tXETcklhwi0hDnB2GhfrZRFbR+w
	 twCl+Jh+4S1LOYsWULZa3yYnROMMnBi6n6sNYrAl9HYBVdZH068VE1E9Qp67pvNq7d
	 eHjgwpVPSN7O3ebrm+o2FT3ZEUEIvlQAP4UAAdVv8Cyj95KrcHgL+PS4/FBazY46Ha
	 U+Tj9dVeS8lvg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clocksource/drivers/arm_arch_timer: Use of_property_present() for non-boolean properties
Date: Mon,  4 Nov 2024 13:05:06 -0600
Message-ID: <20241104190505.272805-2-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_110626_995469_28E513D1 
X-CRM114-Status: GOOD (  12.74  )
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

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/clocksource/arm_arch_timer.c       | 2 +-
 drivers/clocksource/timer-ti-dm-systimer.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 03733101e231..7bd099f728a9 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -1430,7 +1430,7 @@ static int __init arch_timer_of_init(struct device_node *np)
 
 	arch_timers_present |= ARCH_TIMER_TYPE_CP15;
 
-	has_names = of_property_read_bool(np, "interrupt-names");
+	has_names = of_property_present(np, "interrupt-names");
 
 	for (i = ARCH_TIMER_PHYS_SECURE_PPI; i < ARCH_TIMER_MAX_TIMER_PPI; i++) {
 		if (has_names)
diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
index c2dcd8d68e45..c33c3b5e0e07 100644
--- a/drivers/clocksource/timer-ti-dm-systimer.c
+++ b/drivers/clocksource/timer-ti-dm-systimer.c
@@ -202,10 +202,10 @@ static bool __init dmtimer_is_preferred(struct device_node *np)
 
 	/* Secure gptimer12 is always clocked with a fixed source */
 	if (!of_property_read_bool(np, "ti,timer-secure")) {
-		if (!of_property_read_bool(np, "assigned-clocks"))
+		if (!of_property_present(np, "assigned-clocks"))
 			return false;
 
-		if (!of_property_read_bool(np, "assigned-clock-parents"))
+		if (!of_property_present(np, "assigned-clock-parents"))
 			return false;
 	}
 
-- 
2.45.2



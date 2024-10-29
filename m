Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18B0D2AB3F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 13:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ga2rM0e+P+PEec8HVnLJIMPVRFZel2d8tN3agp7YdK8=; b=vW30km1IhjmdL9miQNg2mSxoy6
	oLB8FFD0yHtKsqnIqHn1oPHI/kROIRnvPUIrR+P8zZWL4KMBb/v8NzK7L/gzcfUYpUZuZsiVdwJZv
	K3td3B1ya9KaY944CUknIVwmmSXQjbXhRP8liy1c+y8uwoLxWBxNgAS31iJal1Bj2laiZQd7Wh94R
	CVS2PQt+WLtLBnmwQf8vcEqnKKIx+/LC+CmohY6jdUKIoujzfDrCdVgDf7cIafyG+3ZMzi2x0aYEA
	AeXVo8nM3FHtH2VrOVf0Mw0UssEdnh/nT33bXeEPsE8dvc1bmmJtqvO6F6FYFquIBvQKLXHKA/wvd
	HWFYj9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mGg-0000000EZd1-1Ns8;
	Tue, 29 Oct 2024 13:28:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lkd-0000000ETjT-3q0C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:55:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6111F5C5DF1;
	Tue, 29 Oct 2024 12:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F200C4CEE3;
	Tue, 29 Oct 2024 12:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730206511;
	bh=SMDyXbB2S/Xna6nklNIq1bBj07R+0sg6UmAJM+SQqgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GJGiwWQziuAXIPGEsbIeJ67Cd8ikiouNRZJSB4eheC82PZohay8AluOa2Ue3HyJtE
	 pvZpAEvcev+b6Ypw1kLSzCZXx+oCXKts5Hbwf/AMw624tkpy7Pbfuk2n92KojPJ0dX
	 lPWwUiAPwMaQdBK4DroBjRkVqwGg2t3UUinbtC2zdeARkSRyRCAyvhldUlwc0wRhbN
	 51zxRjzqAGWxCJQhIm91Qal6QN6EPuE2zefKyf1sS0QMvXhuU4XPAhCOOChUxY6/2U
	 lPYo/+VFVOwrsbcNQBU6X43BjdcMg5tgg3l3is10WSoKOyl79a+ffyILQB89rGYWIY
	 k9tAmBr4myx8A==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 07/10] clocksource/drivers/exynos_mct: Remove clockevents shutdown call on offlining
Date: Tue, 29 Oct 2024 13:54:48 +0100
Message-ID: <20241029125451.54574-8-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241029125451.54574-1-frederic@kernel.org>
References: <20241029125451.54574-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_055512_039844_F1490339 
X-CRM114-Status: GOOD (  10.62  )
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

The clockevents core already detached and unregistered it at this stage.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 drivers/clocksource/exynos_mct.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index ef8cb1b71be4..e6a02e351d77 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -496,7 +496,6 @@ static int exynos4_mct_dying_cpu(unsigned int cpu)
 		per_cpu_ptr(&percpu_mct_tick, cpu);
 	struct clock_event_device *evt = &mevt->evt;
 
-	evt->set_state_shutdown(evt);
 	if (mct_int_type == MCT_INT_SPI) {
 		if (evt->irq != -1)
 			disable_irq_nosync(evt->irq);
-- 
2.46.0



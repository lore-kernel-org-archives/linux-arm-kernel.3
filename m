Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA50CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 06:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w3G6GlUab3e6f4TFCVq8d6T8r0SZ5EJKyXqe5fy/Vgs=; b=1agW+uc8eHXnEybp5MBoCpQbze
	D3Q6rgr6KFglr81LGrOm2rw90oIrKYj4yxrm9HMoiyqCH9jz8cfd5o5lAMUqpe46+WP1RvxGtVfiA
	wvecj7ItJrUEhyf5Iv/jFOXR5kvZuN+jBsK1/MnNrUoOZCdtYLSQj+0lntHQv/pj/KenFQqWs3HQo
	bLjs91dpkDrYLYL0/ZQEyGbZ+dhbT9a8NjyikJ1FSEUyCZhJ4UsJRF0taIhlFUSlW/ah+3zE0XI49
	VxNspHX9kWrrK1vToy1j03vo7MTe6yvsNwym0dKn+nTa6WBTqOCKqwFHHrbEBpiBtA1kxIj/DaBhI
	QYhAXLHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHG3A-0000000Gjry-05OP;
	Fri, 07 Nov 2025 06:34:20 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHG38-0000000GjpY-1Aex
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 06:34:19 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762497239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w3G6GlUab3e6f4TFCVq8d6T8r0SZ5EJKyXqe5fy/Vgs=;
	b=bQdP75aOsgI+a8SNUTYqvrM/S6ozyeWpzoROrsCt86/JAAI6P0ZpOjenj8PUGIa6fHQzti
	VYCX4YIIYn2BaI712sSz0xGTd5GPiYONfZYzyot57wwYYuF0TRjvB9Nv0+8Tp/PMDAsD3I
	/lHUg867cYMAC56u4oi3TvTFdAf9Id4=
From: Enlin Mu <enlin.mu@linux.dev>
To: mani@kernel.org,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-unisoc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	enlin.mu@unisoc.com,
	enlin.mu@linux.dev
Subject: [PATCH V2] clocksource/drivers/rda: Add sched_clock_register for RDA8810PL SoC
Date: Fri,  7 Nov 2025 14:33:47 +0800
Message-Id: <20251107063347.3692-1-enlin.mu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_223418_449435_60B8398B 
X-CRM114-Status: GOOD (  10.31  )
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

From: Enlin Mu <enlin.mu@unisoc.com>

The current system log timestamp accuracy is tick, which can not
meet the usage requirements and needs to reach nanoseconds.
Therefore, the sched_clock_register funciton needs to be add.

Signed-off-by: Enlin Mu <enlin.mu@unisoc.com>
---
 drivers/clocksource/timer-rda.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-rda.c b/drivers/clocksource/timer-rda.c
index fd1199c189bf..0be8e05970e2 100644
--- a/drivers/clocksource/timer-rda.c
+++ b/drivers/clocksource/timer-rda.c
@@ -13,6 +13,7 @@
 
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/sched_clock.h>
 
 #include "timer-of.h"
 
@@ -153,7 +154,7 @@ static struct timer_of rda_ostimer_of = {
 	},
 };
 
-static u64 rda_hwtimer_read(struct clocksource *cs)
+static u64 rda_hwtimer_clocksource_read(void)
 {
 	void __iomem *base = timer_of_base(&rda_ostimer_of);
 	u32 lo, hi;
@@ -167,6 +168,11 @@ static u64 rda_hwtimer_read(struct clocksource *cs)
 	return ((u64)hi << 32) | lo;
 }
 
+static u64 rda_hwtimer_read(struct clocksource *cs)
+{
+	return rda_hwtimer_clocksource_read();
+}
+
 static struct clocksource rda_hwtimer_clocksource = {
 	.name           = "rda-timer",
 	.rating         = 400,
@@ -185,6 +191,7 @@ static int __init rda_timer_init(struct device_node *np)
 		return ret;
 
 	clocksource_register_hz(&rda_hwtimer_clocksource, rate);
+	sched_clock_register(rda_hwtimer_clocksource_read, 64, rate);
 
 	clockevents_config_and_register(&rda_ostimer_of.clkevt, rate,
 					0x2, UINT_MAX);
-- 
2.39.5



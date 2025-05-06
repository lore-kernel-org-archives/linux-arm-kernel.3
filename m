Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786E1C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUI8mxa13I1ALNn4kkk2pSY1KU5lEkvMWQI3vBwVdJk=; b=vu2Rm2+zllvIRv6bwe/ooB9A5e
	V2gtJ1DJTYIiQTTCKPOKt0gTRvjCgVjZwIsHvme0eR/9a9nfpEp8Nw6UkBiIDDc+vudy1glAkJWC4
	SSbT6u4xrvAmfz8b1RtuvyW8kw8FntRfZ+EKFKJcBrEkkLlAsSIhHyLaWcm/AGR/CSMnEtKJXGRv7
	gzMDfTSTctw6tJsvAPyRIC3JvZrz2GFa3lJnN3iEx8U1l55/I17t2mBAK84a2QD6xCvoOldrdotKw
	JOtWBLm35fBt2W7ZuGcblAYo8PcrjTNZCFgnTFPxDOA40x3N1pb75z23IEOuHXkNp6bS4PKhjGpwY
	XWu0c9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUae-0000000DucF-0Nqz;
	Wed, 07 May 2025 02:32:56 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOZB-0000000DK7e-3tAX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 20:07:03 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2260c91576aso55276855ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 13:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746562021; x=1747166821; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUI8mxa13I1ALNn4kkk2pSY1KU5lEkvMWQI3vBwVdJk=;
        b=A8gxxUWqbHhNsQj/oROTY80DVAoI7gTPkkkfuP1oDpSDBSqjZ6mW8l5Bw+iDldh1Qp
         66BpJTtXZtSX5b5ZwRV46nEF57tSxX7uTIpYuw1DfnHe65OSshVB0muL1mw2jVxzY3O2
         Ivn3//nRopvUGqWCREPfCa8brddioNkN6UZqbIUtAUgOphDWodxqDYhPO2t6yHlYjbLp
         Y/ZjgAiuo14UOFL8H/zGopAB+GudrxaME260PDT7OjXiCkvPoK6g5ggX5IjYihbHA5Ke
         QiG2En+MA7Y6TPTlvsfSVoDxYwrYWv1xF5ab2LQ8fZy0G30cT1RyQFmVmG3gA4cwp6sC
         eK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746562021; x=1747166821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUI8mxa13I1ALNn4kkk2pSY1KU5lEkvMWQI3vBwVdJk=;
        b=XSsE7xLYoY7oEUzQwdlp7ytIa8bTfkk9cP/9korQ+0+iRldyEyYBpf3sDKcIVYEC/q
         +cIKKXLdA8yHC1+mwCoLKevdo87ZmJxM4mw+eOrNZCzJJWp/uqBUORR1VGSKp5nfdu03
         8jCSBgpTB/lgCKEZYJVZefLrdXSSIFfMhS0PUdoTU8Sr6M3mKVD7/7xHB6ieAoBkGv/Z
         5RzwcVXMQwjh9s9Yn1NQaRiCD3cvtWff7xBps0NU9QhX2dEHTWMJu+1ryZo1KqrR1vXx
         4AZaZ5BthJEbLW4XPcnvG7cY6sVFJbiWm8sOjY3ivhUq3nJyExJ3VXWLZDcha3jCBgmB
         x0Cg==
X-Gm-Message-State: AOJu0Yzmt7HE5Qr0A7OU+UYdmgktDjAkoDjrrh/Dz9qp4U0fXhtTTU35
	zTWj7oQz7sskl7xlMca8Onca7nQpy+9s8U1rvWKjnbFQHaRebAIa
X-Gm-Gg: ASbGnctc2SE8S/OT+PBRIr+j7+DozuvpkM6gUG+N4Qw8TpDby6sof7LVPvib7qzau4m
	1GstrJQ1+w4gWJTiLmv+t7p0R2HF9ejMKtJlogigtJNvuPdTKh/87n/e/HOF3XAcrEgG2VqZJn8
	r+NbvKvs0B8ycMEnP5elYH1P+vd6PfG2bN2kEkmBuIgSp1DNMPvgM6x3xE21c5Xi51/Lqmxz76b
	tQ/A/MNQuwPuaJZjwxF5BGzScQNCTzONCksuaVq/KWQ/ZHPXHqUvVyha4bz2mVZ6ZVzHZ03CqH/
	SBAjOryMKw0PnbVT7ZXbw5tY/d+/Rk6lxZwl/OQBnqi9GzFOfQev
X-Google-Smtp-Source: AGHT+IF5Y/rAQRJKhkkEXMCmbHoTWOuNGZSTyFjbU30GZOxKgVTOMASIzkupAneNrvC8khb4NbQ1jg==
X-Received: by 2002:a17:903:f90:b0:220:ca08:8986 with SMTP id d9443c01a7336-22e5ecade3bmr8339645ad.22.1746562020867;
        Tue, 06 May 2025 13:07:00 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97absm78378635ad.62.2025.05.06.13.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:07:00 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 07 May 2025 00:06:13 +0400
Subject: [PATCH 2/3] clocksource/drivers/timer-vt8500: Add watchdog
 functionality
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-vt8500-timer-updates-v1-2-6b76f7f340a6@gmail.com>
References: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
In-Reply-To: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746562005; l=5194;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=rs25g11CJBXBRYyaXrvG97XFkeNvmD+nVlB+j3jsEDY=;
 b=oDKDtMHT3iU0PdwOZVXCTa/pmq+GInkIZmIaCIFJ6y84zT/N+41IEs31oxfVlhRznAxwXT2o5
 zpe4U9hDZ0LAi3tK+tw8nvKR/WP7BkBy5fhiRer08v0t8jU0VBOK/5K
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_130701_973351_740AD7AF 
X-CRM114-Status: GOOD (  22.50  )
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

VIA/WonderMedia system timer IP can generate a watchdog reset when its
clocksource counter matches the value in the match register 0 and
watchdog function is enabled. For this to work, obvously the clock event
device must use a different match register (1~3) and respective interrupt.

Check if at least two interrupts are provided by the device tree, then use
match register 1 for system clock events and match register 0 for watchdog
respectively.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/clocksource/Kconfig        |  6 +++-
 drivers/clocksource/timer-vt8500.c | 58 ++++++++++++++++++++++++++++++++++----
 2 files changed, 58 insertions(+), 6 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 487c8525996724fbf9c6e9726dabb478d86513b9..e4f9aade058af1adc279274c6c711658f9f4cd0a 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -177,9 +177,13 @@ config TEGRA186_TIMER
 
 config VT8500_TIMER
 	bool "VT8500 timer driver" if COMPILE_TEST
+	depends on ARCH_VT8500 || COMPILE_TEST
 	depends on HAS_IOMEM
+	select WATCHDOG
+	select WATCHDOG_CORE
 	help
-	  Enables support for the VT8500 driver.
+	  Enables support for the timer and watchdog found on
+	  VIA/WonderMedia VT8500 and related SoCs.
 
 config NPCM7XX_TIMER
 	bool "NPCM7xx timer driver" if COMPILE_TEST
diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/timer-vt8500.c
index 9f28f30dcaf83ab4e9c89952175b0d4c75bd6b40..4e44133d455e1e9e016ddb6dfddca422295ab15c 100644
--- a/drivers/clocksource/timer-vt8500.c
+++ b/drivers/clocksource/timer-vt8500.c
@@ -22,6 +22,8 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 
+#include <linux/watchdog.h>
+
 #define VT8500_TIMER_OFFSET	0x0100
 #define VT8500_TIMER_HZ		3000000
 
@@ -55,6 +57,9 @@
 #define MIN_OSCR_DELTA		16
 
 static void __iomem *regbase;
+static unsigned int sys_timer_ch;	 /* which match register to use
+					  * for the system timer
+					  */
 
 static u64 vt8500_timer_read(struct clocksource *cs)
 {
@@ -81,15 +86,15 @@ static int vt8500_timer_set_next_event(unsigned long cycles,
 	int loops = msecs_to_loops(10);
 	u64 alarm = clocksource.read(&clocksource) + cycles;
 
-	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(0)
+	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(sys_timer_ch)
 	       && --loops)
 		cpu_relax();
-	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(0));
+	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(sys_timer_ch));
 
 	if ((signed)(alarm - clocksource.read(&clocksource)) <= MIN_OSCR_DELTA)
 		return -ETIME;
 
-	writel(TIMER_INT_EN_MATCH(0), regbase + TIMER_INT_EN_REG);
+	writel(TIMER_INT_EN_MATCH(sys_timer_ch), regbase + TIMER_INT_EN_REG);
 
 	return 0;
 }
@@ -120,6 +125,40 @@ static irqreturn_t vt8500_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int vt8500_watchdog_start(struct watchdog_device *wdd)
+{
+	u64 cycles = wdd->timeout * VT8500_TIMER_HZ;
+	u64 deadline = clocksource.read(&clocksource) + cycles;
+
+	writel((u32)deadline, regbase + TIMER_MATCH_REG(0));
+	writel(TIMER_WD_EN, regbase + TIMER_WATCHDOG_EN_REG);
+	return 0;
+}
+
+static int vt8500_watchdog_stop(struct watchdog_device *wdd)
+{
+	writel(0, regbase + TIMER_WATCHDOG_EN_REG);
+	return 0;
+}
+
+static const struct watchdog_ops vt8500_watchdog_ops = {
+	.start			= vt8500_watchdog_start,
+	.stop			= vt8500_watchdog_stop,
+};
+
+static const struct watchdog_info vt8500_watchdog_info = {
+	.identity		= "VIA VT8500 watchdog",
+	.options		= WDIOF_MAGICCLOSE |
+				  WDIOF_KEEPALIVEPING |
+				  WDIOF_SETTIMEOUT,
+};
+
+static struct watchdog_device vt8500_watchdog_device = {
+	.ops			= &vt8500_watchdog_ops,
+	.info			= &vt8500_watchdog_info,
+	.max_hw_heartbeat_ms	= -1UL / (VT8500_TIMER_HZ / 1000),
+};
+
 static int __init vt8500_timer_init(struct device_node *np)
 {
 	int timer_irq, ret;
@@ -131,7 +170,9 @@ static int __init vt8500_timer_init(struct device_node *np)
 		return -ENXIO;
 	}
 
-	timer_irq = irq_of_parse_and_map(np, 0);
+	sys_timer_ch = of_irq_count(np) > 1 ? 1 : 0;
+
+	timer_irq = irq_of_parse_and_map(np, sys_timer_ch);
 	if (!timer_irq) {
 		pr_err("%s: Missing irq description in Device Tree\n",
 								__func__);
@@ -140,7 +181,7 @@ static int __init vt8500_timer_init(struct device_node *np)
 
 	writel(TIMER_CTRL_ENABLE, regbase + TIMER_CTRL_REG);
 	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
-	writel(~0, regbase + TIMER_MATCH_REG(0));
+	writel(~0, regbase + TIMER_MATCH_REG(sys_timer_ch));
 
 	ret = clocksource_register_hz(&clocksource, VT8500_TIMER_HZ);
 	if (ret) {
@@ -163,6 +204,13 @@ static int __init vt8500_timer_init(struct device_node *np)
 	clockevents_config_and_register(&clockevent, VT8500_TIMER_HZ,
 					MIN_OSCR_DELTA * 2, 0xf0000000);
 
+	if (!sys_timer_ch) {
+		pr_info("%s: Not enabling watchdog: only one irq was given\n",
+			__func__);
+	} else {
+		watchdog_register_device(&vt8500_watchdog_device);
+	}
+
 	return 0;
 }
 

-- 
2.49.0



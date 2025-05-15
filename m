Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BE6C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 19:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89X5cDkgwMX67Wp+mdH+TqpQpjI3cSH5Pn7YIWEV0tU=; b=ZFriaeqOpDWZpRt+Y38PVZD13w
	M983sQnGnKTtI+poVM5re+sMM48H2NzPrsgxSXEWU4FdoCa/KgnXuPLQ3375YDH2AHNCHFhhqKp+7
	SuGIKNkbhn/kNQ2gUd02zAmI88uDq5bwZU1wlR4yZhPcp+0lKfSWcJFGcvICMVfGEK5xNsLnTClUs
	xMW9hgf3GOyQqf+F00wWLM10kSixhYAFqZkp9lcTfgVyWh1B+eNsjc/Q2n41hIb9LXFV2eXWQNzTZ
	PFjM9Sne9a7hOrSaSCEJjIRSi7A0MczPs5UsQIcspOHL0PwOfYGK8LpTftmMgdqeFx9ba6rF+JB19
	xWk5A0ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdt6-00000001daV-45XP;
	Thu, 15 May 2025 19:05:00 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdjz-00000001c9C-00ri
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 18:55:36 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso1387171e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 11:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747335333; x=1747940133; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89X5cDkgwMX67Wp+mdH+TqpQpjI3cSH5Pn7YIWEV0tU=;
        b=lkL4zC5/G1e80vF8W9Jx6H8WCK0BKGf+aPi/TrLXGaDZZAu2zNf3wAr5h8yOu+J8Vg
         OsyU/YOMMshMNf3axTStzeXtc6h5p5oWJXFE3+hfs63N25jwedwBp3Dem+5+aT1XYQ6i
         UO1Nkff8U67XQJ2Jc+QW4DncaxJJGu3ueRnREO11aLlsydl9gw4XqedDVNlzdeAjTXDQ
         jPTJ4O2XZ0LPgVBVm+57BljogX2XcSabOLC25e2Yr/1YekdbBm43uBuApXVz7AbLUPBm
         eNAKJEvax2zAi1F0jT9ExKMw/zp5rVFMVP+5jX5ORSRfBo5lYIr9FrheMxzdHi2OPfbt
         c4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335333; x=1747940133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89X5cDkgwMX67Wp+mdH+TqpQpjI3cSH5Pn7YIWEV0tU=;
        b=Eit1dfyoLSyY+s0im3mz5DnOLWqSHrU3e4r7yales8zIAfb5NOjd20I7gcSC+bvnMJ
         5i2S+fc5QF6LaBYqs6vOgjAa+4JR+mUuI9yKNfw5+Gu24lkRqCF/WPNE2rYwSg4oTEkC
         St+MMFIT3UYRYAgPCehsxEY4SAKVPua0k7Ig/uuGWpiEJKyTEXVyhAvJ5ygBtCkkpZoh
         j5gnI8d9FPDago6za6gGh3HKMVMzruok6LO1DPTzNutr3HYjy7aDnBdLzLpDmE7K4wD2
         HyS8YziL3aq5D2R7jEZR92hl6tI8TOtgaWHqyX/H0TRyZ3S2tEMDxBXNsdJVVtF5tTYn
         COig==
X-Gm-Message-State: AOJu0YxMjgI6DEI9yZRR/x3MMrG6c5Jeaob7FChbtn1CPubXAh47cqf5
	aFW7VbuwDzWx+RBcaWnSdYz934O/HxggSQkwQ7YNCFMk5N/DbuPgSW+4
X-Gm-Gg: ASbGnctZKW7/MhI/YlpiQkdHfkxs824Clv+jmmazVlb+FDirq/05gUAem5qnTMdTUwO
	arzBJbyKcUimAUzaQThp/0GVgZqZ8ndEAaOXxq8SWFxvPD95l6QcHHpRHUMkS2fUNGEVC3ZVFsI
	jxTvA9Wc7eQ752mkzyfvT/F9nLrIQQIc+KTnmsQAEX2QHUp7kDwoAbOenZh65mIb+/NUflBYyeQ
	L6LwYaZq5gcjHsk9XqR5Y6lrx9KhhngX0g28pAfLPl2Bd+sqXJPJWAPa7POH7hB6Vzl3apIqFRB
	nnc7MGX4CtZn9qr7tUFmNBO0LTG2i1bksaT2EoP8Ee9Bj4CILzYD+F8mXEFJ8U5E
X-Google-Smtp-Source: AGHT+IFXphhaPfRYQNVaaNL19dEd3OxAeFx5dTiTdykGmgZQ7ms0RJw5IjYe+nVQU2nwQqYh4pYpSA==
X-Received: by 2002:a05:6512:3e04:b0:54b:f33:cc16 with SMTP id 2adb3069b0e04-550e71b2359mr207965e87.16.1747335332811;
        Thu, 15 May 2025 11:55:32 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702dd8asm60389e87.196.2025.05.15.11.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:55:32 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 15 May 2025 21:55:28 +0300
Subject: [PATCH v3 3/4] clocksource/drivers/timer-vt8500: Prepare for
 watchdog functionality
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-vt8500-timer-updates-v3-3-2197a1b062bd@gmail.com>
References: <20250515-vt8500-timer-updates-v3-0-2197a1b062bd@gmail.com>
In-Reply-To: <20250515-vt8500-timer-updates-v3-0-2197a1b062bd@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747335328; l=4681;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=QbpS/kQkJJiwh5PckUNMqicAThM5PNWf6q83MVBs0Vs=;
 b=NNBbfD5AkIXlxdWKECjLPB/BWipzyhlLO3lQ2bGgNY4WpyUStbEqnzJqvlhuzrdozgq9Wdp/4
 Rok+ZGrpZS4BrkT3pqfAh/A97GspyxUL7USnY8hmvT2cWFBEYgTAV8x
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_115535_054649_663534E2 
X-CRM114-Status: GOOD (  23.65  )
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

VIA/WonderMedia system timer can generate a watchdog reset when its
clocksource counter matches the value in the match register 0 and
watchdog function is enabled. For this to work, obvously the clock event
device must use a different match register (1~3) and respective interrupt.

Check if at least two interrupts are provided by the device tree, then use
match register 1 for system clock events and reserve match register 0 for
the watchdog. Instantiate a platform device for the watchdog and give it
access to the MMIO registers base of the timer through platform data.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/clocksource/timer-vt8500.c | 68 +++++++++++++++++++++++++++++++++++---
 1 file changed, 63 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/timer-vt8500.c
index 9f28f30dcaf83ab4e9c89952175b0d4c75bd6b40..122cc046140d5e9edff20ff41a49b4e62064dd40 100644
--- a/drivers/clocksource/timer-vt8500.c
+++ b/drivers/clocksource/timer-vt8500.c
@@ -21,6 +21,8 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
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
@@ -131,7 +136,9 @@ static int __init vt8500_timer_init(struct device_node *np)
 		return -ENXIO;
 	}
 
-	timer_irq = irq_of_parse_and_map(np, 0);
+	sys_timer_ch = of_irq_count(np) > 1 ? 1 : 0;
+
+	timer_irq = irq_of_parse_and_map(np, sys_timer_ch);
 	if (!timer_irq) {
 		pr_err("%s: Missing irq description in Device Tree\n",
 								__func__);
@@ -140,7 +147,7 @@ static int __init vt8500_timer_init(struct device_node *np)
 
 	writel(TIMER_CTRL_ENABLE, regbase + TIMER_CTRL_REG);
 	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
-	writel(~0, regbase + TIMER_MATCH_REG(0));
+	writel(~0, regbase + TIMER_MATCH_REG(sys_timer_ch));
 
 	ret = clocksource_register_hz(&clocksource, VT8500_TIMER_HZ);
 	if (ret) {
@@ -166,4 +173,55 @@ static int __init vt8500_timer_init(struct device_node *np)
 	return 0;
 }
 
+/*
+ * This probe gets called after the timer is already up and running. This will create
+ * the watchdog device as a child since the registers are shared.
+ */
+static int vt8500_timer_probe(struct platform_device *pdev)
+{
+	struct platform_device *vt8500_watchdog_device;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	if (!sys_timer_ch) {
+		dev_info(dev, "Not enabling watchdog: only one irq was given");
+		return 0;
+	}
+
+	if (!regbase)
+		return dev_err_probe(dev, -ENOMEM,
+			"Timer not initialized, cannot create watchdog");
+
+	vt8500_watchdog_device = platform_device_alloc("vt8500-wdt", -1);
+	if (!vt8500_watchdog_device)
+		return dev_err_probe(dev, -ENOMEM,
+			"Failed to allocate vt8500-wdt");
+
+	/* Pass the base address as platform data and nothing else */
+	vt8500_watchdog_device->dev.platform_data = regbase;
+	vt8500_watchdog_device->dev.parent = dev;
+
+	ret = platform_device_add(vt8500_watchdog_device);
+	if (ret)
+		platform_device_put(vt8500_watchdog_device);
+
+	return ret;
+}
+
+static const struct of_device_id vt8500_timer_of_match[] = {
+	{ .compatible = "via,vt8500-timer", },
+	{},
+};
+
+static struct platform_driver vt8500_timer_driver = {
+	.probe  = vt8500_timer_probe,
+	.driver = {
+		.name = "vt8500-timer",
+		.of_match_table = vt8500_timer_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+builtin_platform_driver(vt8500_timer_driver);
+
 TIMER_OF_DECLARE(vt8500, "via,vt8500-timer", vt8500_timer_init);

-- 
2.49.0



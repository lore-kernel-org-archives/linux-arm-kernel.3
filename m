Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2042FC54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 20:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVj4QdpKyJy1TysJDpfKSHEayttC0HkOKItZdYkWES8=; b=c196+kyPocHBUsoTXSRlTJH5o3
	uG8JoNKaD5WvP+b8+K+tBOubC+KBgEasa0zwGsZBDtolOiN+E1CR+KwF2rFA7RO6hU3mv1shLSfPl
	224nu1uRx0aBFWG5fTIm7WfAk4lQoeDHxpyC2qrwFwbTlpaW7pCzwVDVLrtqb/ZszTRCuodHAWg3W
	PoeaK+1FXMhyqQuyooWRe7kKOrUckKfEjslMDlMWG58DGGTpy5ol0s/xOqGAQOmKXY5q6UoeAtH9K
	LUkpbJeqkzLg7HLKk3wmi799XN0D/tTsJWXe+ykUX0kAvb/E3712TvoJvXEKZ42HGhQ/N081BSvz5
	94xbmr/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHTIY-0000000E3Lg-0rek;
	Tue, 20 May 2025 20:10:50 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHTAQ-0000000E1xn-3GI8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 20:02:27 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-742c2ed0fe1so3512299b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 13:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747771346; x=1748376146; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EVj4QdpKyJy1TysJDpfKSHEayttC0HkOKItZdYkWES8=;
        b=ZuQPCd+k41N8I8FjLguj2WRu44oyz1JklRtxCz7D94pShONDrTfR8T01omauwJISGA
         MyCLAFB3NgBPviIoH/3l/AxJ8ckBGVbnnQuvW99vbpLyt99QmI82XkbS1J3NllR42c8e
         BnSRs5fDL9zCszsG8pyrm0m8r0RdMKhtz48vMLtPnivTbir/eSdfL4NK74/O+accmliZ
         enFtrhNbWL4/JCM085SIutrg+ksAwcl0asj9Bca9ybLQ2pzJbuS/PrD4Z5Yd5Eewf11C
         98l/x2NRIc567HIzx34AQPZiLj1GmFHaHLR+7fMSGhEv1BRu93LcDUjHpok0KCD0pEmF
         1FmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747771346; x=1748376146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EVj4QdpKyJy1TysJDpfKSHEayttC0HkOKItZdYkWES8=;
        b=Rd00JWt145jWP2viDPp+3zkEsIeynXhF2+ng2wf3PnJRJ/hY0Pa2u+cevZ7ds0Slxz
         4eVKA+9eCfXdoogwxuczo4dYN3qWecmBR9d0JuthAu9wO5gKjD3MscvD2u2Ex01v1c0w
         3Jtd7lRGufHYzyPlGKz3EwE/Xqu7eVeimJcxBpDi1zsnaq4GQp0Gd+sFMnpx8z4o9k5k
         YKnuIl6f7WqJiEBZGFyERtFU8WzGTLn1SYq09BBUT3i7FcBVDI2hMJBd4dKODzIoYgEi
         Yvr+Mhs8nVfq1DC9TmCfhWv4rfMTEuTINGEf7+VHgjv7RnMvNmgRI+RRKOOhtMDtsw+1
         qOwg==
X-Gm-Message-State: AOJu0YzknwLFEZItrH+KW9XuyGobsgYsS/gvP/o+ayb9E944h85EIPlo
	H69bMlAdW5Jg4LaYDhK6YnclvsU+YuL1eoYJ/5ciYL/jx5kuJcPCpBD8fCgYq2HK0OM=
X-Gm-Gg: ASbGncv/7ec3/+f3UwR1QmbyYiLEdP3WFuBrl+uJNsftsJ4Gs8LITQ0KWPZoT0p7pqr
	skF6gOHEHF6GAo/5+czwsd9t8gOcL9KG3QBJnmzd5f786fac+BYgp9aQJvpVNjNGDSKa4L/RiUY
	RgQ12hPEyV1fyesOxvYY05SP2aTy5qcT+8Xp4ZorgmHEaPjJzGpfRO4QgKX7aE0vynFTg+oKTvx
	2lxj06F2DpG5+slT2YPYcTZe3xJBPHY+O4/kOS/wm82bZky3986yskq6JOTcEAIrX4xnlUiUklf
	fhtL7BhzXqlL2iC9u2DRROPKQalvSFVdRXZxR4NufFla+es1gsASsmqTIsNyXOU=
X-Google-Smtp-Source: AGHT+IHawJXBy+wXx8lstzqPJ4hjRI0aRBTMUAoi7fZ7uwVulgJmYoOmNI0Nfk2+Fj+HzTGI99vvJA==
X-Received: by 2002:a05:6a20:881:b0:215:eafc:abda with SMTP id adf61e73a8af0-216218a2ddemr19786796637.18.1747771345791;
        Tue, 20 May 2025 13:02:25 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a0d0sm8412340a12.14.2025.05.20.13.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:02:25 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 00:01:43 +0400
Subject: [PATCH v4 3/4] clocksource/drivers/timer-vt8500: Prepare for
 watchdog functionality
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-vt8500-timer-updates-v4-3-2d4306a16ae4@gmail.com>
References: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
In-Reply-To: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747771315; l=9776;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=4Tq1P5wMAyzNhGs6OsPD/EAgY3O3LxnsxawhPzisegU=;
 b=uwtxTk93WEH7YrvWVoi9J9CaR1kb87nXPsGnRmAIu+AWAHsg+jnclK3pyXQr+Pj2ccGqeRJga
 21uRFgu8JIqCszMuFcJbwHyZY4C/9wOm2xrCdxNCADnB918wDTeRRQ2
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_130226_833968_AECF0FCB 
X-CRM114-Status: GOOD (  29.74  )
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
the watchdog. Instantiate an auxiliary device for the watchdog

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 MAINTAINERS                        |   1 +
 drivers/clocksource/Kconfig        |   1 +
 drivers/clocksource/timer-vt8500.c | 141 +++++++++++++++++++++++++++----------
 include/linux/vt8500-timer.h       |  48 +++++++++++++
 4 files changed, 152 insertions(+), 39 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 783e5ee6854b69cca87b6f0763844d28b4b2213f..5362095240627f613638197fda275db6edc16cf7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3447,6 +3447,7 @@ F:	drivers/tty/serial/vt8500_serial.c
 F:	drivers/video/fbdev/vt8500lcdfb.*
 F:	drivers/video/fbdev/wm8505fb*
 F:	drivers/video/fbdev/wmt_ge_rops.*
+F:	include/linux/vt8500-timer.h
 
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 487c8525996724fbf9c6e9726dabb478d86513b9..92f071aade10b7c0f0bba4b47dc6228a5e50360f 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -178,6 +178,7 @@ config TEGRA186_TIMER
 config VT8500_TIMER
 	bool "VT8500 timer driver" if COMPILE_TEST
 	depends on HAS_IOMEM
+	select AUXILIARY_BUS
 	help
 	  Enables support for the VT8500 driver.
 
diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/timer-vt8500.c
index 9f28f30dcaf83ab4e9c89952175b0d4c75bd6b40..91ebb63e14a85ba34c09f89855b4d5f3f9585d03 100644
--- a/drivers/clocksource/timer-vt8500.c
+++ b/drivers/clocksource/timer-vt8500.c
@@ -11,50 +11,24 @@
  * Alexey Charkov. Minor changes have been made for Device Tree Support.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
-#include <linux/delay.h>
 
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-
-#define VT8500_TIMER_OFFSET	0x0100
-#define VT8500_TIMER_HZ		3000000
-
-#define TIMER_MATCH_REG(x)	(4 * (x))
-#define TIMER_COUNT_REG		0x0010	 /* clocksource counter */
-
-#define TIMER_STATUS_REG	0x0014
-#define TIMER_STATUS_MATCH(x)	BIT((x))
-#define TIMER_STATUS_CLEARALL	(TIMER_STATUS_MATCH(0) | \
-				 TIMER_STATUS_MATCH(1) | \
-				 TIMER_STATUS_MATCH(2) | \
-				 TIMER_STATUS_MATCH(3))
-
-#define TIMER_WATCHDOG_EN_REG	0x0018
-#define TIMER_WD_EN		BIT(0)
-
-#define TIMER_INT_EN_REG	0x001c	 /* interrupt enable */
-#define TIMER_INT_EN_MATCH(x)	BIT((x))
-
-#define TIMER_CTRL_REG		0x0020
-#define TIMER_CTRL_ENABLE	BIT(0)	 /* enable clocksource counter */
-#define TIMER_CTRL_RD_REQ	BIT(1)	 /* request counter read */
-
-#define TIMER_ACC_STS_REG	0x0024	 /* access status */
-#define TIMER_ACC_WR_MATCH(x)	BIT((x)) /* writing Match (x) value */
-#define TIMER_ACC_WR_COUNTER	BIT(4)	 /* writing clocksource counter */
-#define TIMER_ACC_RD_COUNTER	BIT(5)	 /* reading clocksource counter */
-
-#define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
-
-#define MIN_OSCR_DELTA		16
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/vt8500-timer.h>
 
 static void __iomem *regbase;
+static unsigned int sys_timer_ch;	 /* which match register to use
+					  * for the system timer
+					  */
 
 static u64 vt8500_timer_read(struct clocksource *cs)
 {
@@ -75,21 +49,26 @@ static struct clocksource clocksource = {
 	.flags          = CLOCK_SOURCE_IS_CONTINUOUS,
 };
 
+static u64 vt8500_timer_next(u64 cycles)
+{
+	return clocksource.read(&clocksource) + cycles;
+}
+
 static int vt8500_timer_set_next_event(unsigned long cycles,
 				    struct clock_event_device *evt)
 {
 	int loops = msecs_to_loops(10);
-	u64 alarm = clocksource.read(&clocksource) + cycles;
+	u64 alarm = vt8500_timer_next(cycles);
 
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
@@ -131,7 +110,9 @@ static int __init vt8500_timer_init(struct device_node *np)
 		return -ENXIO;
 	}
 
-	timer_irq = irq_of_parse_and_map(np, 0);
+	sys_timer_ch = of_irq_count(np) > 1 ? 1 : 0;
+
+	timer_irq = irq_of_parse_and_map(np, sys_timer_ch);
 	if (!timer_irq) {
 		pr_err("%s: Missing irq description in Device Tree\n",
 								__func__);
@@ -140,7 +121,7 @@ static int __init vt8500_timer_init(struct device_node *np)
 
 	writel(TIMER_CTRL_ENABLE, regbase + TIMER_CTRL_REG);
 	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
-	writel(~0, regbase + TIMER_MATCH_REG(0));
+	writel(~0, regbase + TIMER_MATCH_REG(sys_timer_ch));
 
 	ret = clocksource_register_hz(&clocksource, VT8500_TIMER_HZ);
 	if (ret) {
@@ -166,4 +147,86 @@ static int __init vt8500_timer_init(struct device_node *np)
 	return 0;
 }
 
+static void vt8500_timer_aux_uninit(void *data)
+{
+	auxiliary_device_uninit(data);
+}
+
+static void vt8500_timer_aux_delete(void *data)
+{
+	auxiliary_device_delete(data);
+}
+
+static void vt8500_timer_aux_release(struct device *dev)
+{
+	struct auxiliary_device *aux;
+
+	aux = container_of(dev, struct auxiliary_device, dev);
+	kfree(aux);
+}
+
+/*
+ * This probe gets called after the timer is already up and running. This will
+ * create the watchdog device as a child since the registers are shared.
+ */
+static int vt8500_timer_probe(struct platform_device *pdev)
+{
+	struct vt8500_wdt_info *wdt_info;
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
+	wdt_info = kzalloc(sizeof(*wdt_info), GFP_KERNEL);
+	if (!wdt_info)
+		return dev_err_probe(dev, -ENOMEM,
+			"Failed to allocate vt8500-wdt info");
+
+	wdt_info->timer_next = &vt8500_timer_next;
+	wdt_info->wdt_en = regbase + TIMER_WATCHDOG_EN_REG;
+	wdt_info->wdt_match = regbase + TIMER_MATCH_REG(0);
+	wdt_info->auxdev.name = "vt8500-wdt";
+	wdt_info->auxdev.dev.parent = dev;
+	wdt_info->auxdev.dev.release = &vt8500_timer_aux_release;
+
+	ret = auxiliary_device_init(&wdt_info->auxdev);
+	if (ret) {
+		kfree(wdt_info);
+		return ret;
+	}
+	ret = devm_add_action_or_reset(dev, vt8500_timer_aux_uninit,
+				       &wdt_info->auxdev);
+	if (ret)
+		return ret;
+
+	ret = auxiliary_device_add(&wdt_info->auxdev);
+	if (ret)
+		return ret;
+	return devm_add_action_or_reset(dev, vt8500_timer_aux_delete,
+					&wdt_info->auxdev);
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
diff --git a/include/linux/vt8500-timer.h b/include/linux/vt8500-timer.h
new file mode 100644
index 0000000000000000000000000000000000000000..97ee0716cd84c447b38bbc05535f63fc43e73ef3
--- /dev/null
+++ b/include/linux/vt8500-timer.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef LINUX_VT8500_TIMER_H_
+#define LINUX_VT8500_TIMER_H_
+
+#include <linux/auxiliary_bus.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/types.h>
+
+#define VT8500_TIMER_HZ		3000000
+
+#define TIMER_MATCH_REG(x)	(4 * (x))
+#define TIMER_COUNT_REG		0x0010	 /* clocksource counter */
+
+#define TIMER_STATUS_REG	0x0014
+#define TIMER_STATUS_MATCH(x)	BIT((x))
+#define TIMER_STATUS_CLEARALL	(TIMER_STATUS_MATCH(0) | \
+				 TIMER_STATUS_MATCH(1) | \
+				 TIMER_STATUS_MATCH(2) | \
+				 TIMER_STATUS_MATCH(3))
+
+#define TIMER_WATCHDOG_EN_REG	0x0018
+#define TIMER_WD_EN		BIT(0)
+
+#define TIMER_INT_EN_REG	0x001c	 /* interrupt enable */
+#define TIMER_INT_EN_MATCH(x)	BIT((x))
+
+#define TIMER_CTRL_REG		0x0020
+#define TIMER_CTRL_ENABLE	BIT(0)	 /* enable clocksource counter */
+#define TIMER_CTRL_RD_REQ	BIT(1)	 /* request counter read */
+
+#define TIMER_ACC_STS_REG	0x0024	 /* access status */
+#define TIMER_ACC_WR_MATCH(x)	BIT((x)) /* writing Match (x) value */
+#define TIMER_ACC_WR_COUNTER	BIT(4)	 /* writing clocksource counter */
+#define TIMER_ACC_RD_COUNTER	BIT(5)	 /* reading clocksource counter */
+
+#define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
+
+#define MIN_OSCR_DELTA		16
+
+struct vt8500_wdt_info {
+	struct auxiliary_device auxdev;
+	u64 (*timer_next)(u64 cycles);
+	void __iomem *wdt_en;
+	void __iomem *wdt_match;
+};
+
+#endif /* LINUX_VT8500_TIMER_H_ */

-- 
2.49.0



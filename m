Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD179C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 13:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQKGhwbmZ43ciINYKTiP6sq8CUZKw6oXNW6FzpaC7Fk=; b=qIFaFMpBfng1j58WG8MQu8Mk14
	00PJ05k3OK0xbBfqV6D1vurnl+KZaB7ySpVHVT0sHI6oEc7Sg4Owu5ptLbyAJXcKjJ7JIIf6pwok/
	YYoQvZq4+I+uE6pxQ6Nb8AX3PKvdHoGDCEzM72cOp7cf0zUn0TZQyGBro1Dgnru0UaO6KIoryDONn
	iblbjKnAbo20wjYvISpOgfyCLtkXu/nLh5+QjY6lDZgfBLHMLOh9CBFFwly2KGJdASlng16qzQ7oL
	ud8p9CA4TBA/ypWy3jffWyf68c66KBhOJnrUUtnoM5Wcja0Pj7RsjThfQhJwjRWFqPBYdJInh/lHW
	F4SqG/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjgS-0000000Fy9s-38Op;
	Wed, 21 May 2025 13:40:36 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHj46-0000000FrVl-2p3t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 13:01:00 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-23229fdaff4so42779605ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 06:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747832458; x=1748437258; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQKGhwbmZ43ciINYKTiP6sq8CUZKw6oXNW6FzpaC7Fk=;
        b=d2BaYla8jlzzQ5FRvyOBmmFQwRnH5kjEjcS5Ob4RbnKadqwuj1LcaXsG34bxzXl9OD
         2Tp5Bzv93RyltcdQaB/g032Rw1gxS19386sjL3ClABM0LzykZOuYJf0jNzo/HbWtGxgA
         i6+OesBLaE1XBm6xwntSFXtTuBIKqZPobL3Y+NNXXETOCDFhlstrwXGFHf3LrciPUJ0q
         7WHWVs1Qk+UAPgxilz2Tnhsu114V77CQ3joOcLhxMb5dAGgyNB0yGXOinpFCZNKAPN3Q
         NkFU5QGDTXyd1SAft6AKW40ROlAK1j4Q2Mk90xenYdvfrZfqqxOeA7ZEIIJdgCcgFIHT
         pyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832458; x=1748437258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQKGhwbmZ43ciINYKTiP6sq8CUZKw6oXNW6FzpaC7Fk=;
        b=dHP+ie/kRPZHkJ0TdkURb+aMVzKxnw/8UV9CnucF4DQJuQ7ln1wd78xYy3bIVFIMU7
         brEcAs1XgDFY6W8+LLUtQjxB69lOGk/BdAOm5a/vsFwyVeVqE5ZSuRzxT5qLLeUiBXlL
         UNwBS5Vs+VtApkXn9mPBF9aBYNHUgm8sd0ISJwvppm6cht4IaNjpV1v8W/kCKttixhqq
         pt4EHcnIbiMc7dp1Ly/y3TlnYZKnp3YL/Gw/FMTlTenzvIIjXKJ8CvobXyLeOCKS7ivV
         4LKnJ0PehfbpO+SAaXu+fMpeGuDM+uHDUxU6U5xRin7aOu9CCZsIWS9LqhMOUzZ0QoBL
         CtTw==
X-Gm-Message-State: AOJu0Yzo1umQZnDvGRVs1u83TBiDL9Vd0WZe7dJWqRtOsdjeTf7GuKIx
	WLJ15PC3UZ1WqF74higICs841d2p11DoU6eoV0YTrXOfUUTZd+KIJTNt
X-Gm-Gg: ASbGncvMRRY7z/G+53QP0OruDKIOSxF9gxjV9GgltdYulJrmzcr7b8w1Org4PQV6LSz
	oUQeUsN8t4EqrElouWtoHRCMg4bmPFoX89ejclIJFX02innAv6MZ13BztoIwFy1481wtu51NVH/
	47i9wDBSrcdKRDrGTFYxAaA9zSu01jsaZIKnPph63/okCK2lw5k8DFSU8QC62cuouF9oQM7+wqK
	PuvzXvnFubUX/i3x2hi3JMswoYN5Gz7MzQhho1D6YUaQv6JLh2dee37ie01nBres5ycEjKn/zYF
	zxzf6qhkR29ZtwwNXYIoOE6YEuZS5FmnzkpiMU/98pdpYKlby+n4vUsEuW0W47g=
X-Google-Smtp-Source: AGHT+IE/CI59rniEOzJnILrKuwYM2BM+raG05jALn5qCLJ55FzqnbuzIf/xag3o9vCcPeD0ND4rCbg==
X-Received: by 2002:a17:903:2303:b0:223:52fc:a15a with SMTP id d9443c01a7336-231d452d4ddmr288148495ad.33.1747832457370;
        Wed, 21 May 2025 06:00:57 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb017sm92691165ad.53.2025.05.21.06.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:00:56 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 17:00:11 +0400
Subject: [PATCH v5 3/4] clocksource/drivers/timer-vt8500: Prepare for
 watchdog functionality
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-vt8500-timer-updates-v5-3-7e4bd11df72e@gmail.com>
References: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
In-Reply-To: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747832426; l=7757;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=rg55iyiBHKG2wUOvJ00x2/JyRj3YceESEI11ZlcTUbI=;
 b=cF6O+EGvJNIViW1p29lPWRaARr1A37alZOAWvCWsjQtQxmtkizxbGxYHHLADItD2WV24cAPU/
 LNBkbPi2/HuDaFbo9u9sEIjP9z9Dk1fkxCXHVP7cQEiFUOfQm159gRj
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_060058_729871_F19152A4 
X-CRM114-Status: GOOD (  28.42  )
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
 drivers/clocksource/timer-vt8500.c | 111 ++++++++++++++++++++++++++++++++++---
 include/linux/vt8500-timer.h       |  18 ++++++
 4 files changed, 122 insertions(+), 9 deletions(-)

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
index 9f28f30dcaf83ab4e9c89952175b0d4c75bd6b40..cdea5245f8e41d65b8b9bebad3fe3a55f43a18fa 100644
--- a/drivers/clocksource/timer-vt8500.c
+++ b/drivers/clocksource/timer-vt8500.c
@@ -11,6 +11,7 @@
  * Alexey Charkov. Minor changes have been made for Device Tree Support.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
@@ -22,9 +23,6 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 
-#define VT8500_TIMER_OFFSET	0x0100
-#define VT8500_TIMER_HZ		3000000
-
 #define TIMER_MATCH_REG(x)	(4 * (x))
 #define TIMER_COUNT_REG		0x0010	 /* clocksource counter */
 
@@ -53,8 +51,14 @@
 #define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
 
 #define MIN_OSCR_DELTA		16
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/vt8500-timer.h>
 
 static void __iomem *regbase;
+static unsigned int sys_timer_ch;	 /* which match register to use
+					  * for the system timer
+					  */
 
 static u64 vt8500_timer_read(struct clocksource *cs)
 {
@@ -75,21 +79,26 @@ static struct clocksource clocksource = {
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
@@ -131,7 +140,9 @@ static int __init vt8500_timer_init(struct device_node *np)
 		return -ENXIO;
 	}
 
-	timer_irq = irq_of_parse_and_map(np, 0);
+	sys_timer_ch = of_irq_count(np) > 1 ? 1 : 0;
+
+	timer_irq = irq_of_parse_and_map(np, sys_timer_ch);
 	if (!timer_irq) {
 		pr_err("%s: Missing irq description in Device Tree\n",
 								__func__);
@@ -140,7 +151,7 @@ static int __init vt8500_timer_init(struct device_node *np)
 
 	writel(TIMER_CTRL_ENABLE, regbase + TIMER_CTRL_REG);
 	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
-	writel(~0, regbase + TIMER_MATCH_REG(0));
+	writel(~0, regbase + TIMER_MATCH_REG(sys_timer_ch));
 
 	ret = clocksource_register_hz(&clocksource, VT8500_TIMER_HZ);
 	if (ret) {
@@ -166,4 +177,86 @@ static int __init vt8500_timer_init(struct device_node *np)
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
index 0000000000000000000000000000000000000000..b8e9000495c509e9c8e8f4098d6bd33de27b3ec4
--- /dev/null
+++ b/include/linux/vt8500-timer.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef LINUX_VT8500_TIMER_H_
+#define LINUX_VT8500_TIMER_H_
+
+#include <linux/auxiliary_bus.h>
+#include <linux/io.h>
+#include <linux/types.h>
+
+#define VT8500_TIMER_HZ		3000000
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



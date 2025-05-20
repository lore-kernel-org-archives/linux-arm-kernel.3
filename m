Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D41C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 20:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OilI7sycFnkHdmKoo1s8NQ3T9dco8FEq3kcJbQef9xQ=; b=oBs12PVSO88tHa+OKXlKVe64mq
	BaYcrRZq+Ug1lChylplFNSJLfGvqln4EAJt/naK7ge6yDiw0NNv7ZJLOSK72myy4dYkJNRNf6bd2V
	Mo1YcxwBPjQuXq2R9MrtvBQoSntG9AiGE2rXiskhpWKvHQtEXvc7GOjZ2tOfwwqy8gRUXNENzATUx
	n4oaD3PbzYeDhr1Z9I+d/+ggpahRWFpy8F25gkS/wiiRZCd59XiQ4Ik3k60iq6vaJ5d2WUr+OdkLq
	bIagDA9kKZXGhA3C9T+9gVTOZwwhUvqaO0bP09VVreUXPrLOpHf4cKstiXBXyLjfrBIsdi41dbNkO
	gh9Pz0xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHTKe-0000000E3bh-47yx;
	Tue, 20 May 2025 20:13:00 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHTAa-0000000E20Y-1re3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 20:02:37 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-742c3d06de3so3597079b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 13:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747771355; x=1748376155; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OilI7sycFnkHdmKoo1s8NQ3T9dco8FEq3kcJbQef9xQ=;
        b=UgwvCr98/O8CjtaNruc0lU0ZoF9g+O5mlzua2xq3MD3ZB9Ktel1nXeHxoGUhqZHWs4
         XiuvTPh35tCICebpzs7iCegtZ/flc2rjBe7BpmQckyiZUB1A3rT0NOnBdI9iFTMx3u9K
         iEynTLBcCgCZymycq3CxksToCXXBe7o1JCjiohbaWt5RutgkAG17Evdvawivd49ODh+7
         csmZnqSBm/Z7P9GCCvKe6RYMtodpe8x9TA0OEse9N8SWm3wKQFA1cS2EuKeTkegnBRvS
         8suEq+80PWEGhjjYcZQWe6tp1xoxLFr5h9cNSFR/nYOVgcILiHBT+1Cq6ey5HxHhvzwM
         xKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747771355; x=1748376155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OilI7sycFnkHdmKoo1s8NQ3T9dco8FEq3kcJbQef9xQ=;
        b=vNo3A4zVq0W6+raZmVmfzYNvDjSyrsnQrdzMYJ9Us/Cqyu0QKJXwJW+V0YS+ztXYeG
         VvTa7OvhruxmweBBssukaObbyqSwVwetWaEY+iaAQKjSGRZLzglyXDBsCn9QLEPzNf49
         pACWjpjSqR5qDwl7pVI9RtvVx5SYuKx0OC4Qn4yRNUaHDZ4659ZAVb4ULLh1bg0RYXrN
         G5ucm/iPVG670Ov28m62+/4at59VL0g72fy8x/cUypsIJnkppBnaaKcP5oU7IOzA0X7S
         3x0BYs9wE/1NeTIIxWQShDsw0x3ThMaVtQ8KEMs11ybP2is+vVGgjxCjSvy+kUkufjNo
         rAEg==
X-Gm-Message-State: AOJu0YzfcAHRvT2mqEDGFqK3e7yjTzwEf+mqfXaCBSaT2icSSMd9ioXG
	5OpAX0xrZFNgkCzZd1ZdS1QC+eKF0ucwWCw19Fb2SS6epS1tzZz6hUDx
X-Gm-Gg: ASbGncsBY5UpGVGs27uZRsi2A2rxw5/pDn+UbyXs3E2TgAJiRpeAri8oShO3QlqM6Wr
	NAxBIARuu1qkimC6CHGSJIwlsKZObnfKcAg/mVTd7G5AF2NKVZ8fNbDk4mmGtpzzvFkGe+XYEgs
	I+MG05y8qYYd6/3qpktpkIksNL8pz/3FXeimR2JRoyxDNWdjCT5VLB0Bv7XuSEkHzqveXvy8ioM
	G6d2VYLN4m6d6oKPufq//r0XDzWj2A++mHcBI3fI0lVbwAQVLptFxqTv3hQBbLo9+nzCvZwzZiv
	NgqzkBV3iGoRJR0ApV/sC/OzeYOcLKQBXjFdbFG2z5TykF1MicE/gL9OXpe4cMM=
X-Google-Smtp-Source: AGHT+IEhswQQobet3SESatd0Ctpu3CzAb+wp/b+kOVjsj+yXjzeVIvW0SymyOexlFvQlNXrXVnoyHQ==
X-Received: by 2002:a05:6a20:6f8c:b0:215:f519:e2dc with SMTP id adf61e73a8af0-2170cb25042mr26000159637.14.1747771355447;
        Tue, 20 May 2025 13:02:35 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a0d0sm8412340a12.14.2025.05.20.13.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:02:35 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 00:01:44 +0400
Subject: [PATCH v4 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-vt8500-timer-updates-v4-4-2d4306a16ae4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747771315; l=5323;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=qeLngx3703X+Z3T6OTmsiw5w/nGbO6F+UA6hRWuYz9Q=;
 b=E9764OMTvoClSJRuZ7a/FQ8x0MgaPIWF+b2u9p2Kz7GTxhjaJrF7IO8KAdCNGK8Pe5jJohMLN
 ZuEitiKIh3NDdywXAKwsst8un4CHZtcsI0DSGnvdnIblGrV0iZNwYlO
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_130236_492503_FDC44BC7 
X-CRM114-Status: GOOD (  22.00  )
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

VIA/WonderMedia SoCs can use their system timer's first channel as a
watchdog device which will reset the system if the clocksource counter
matches the value given in its match register 0 and if the watchdog
function is enabled.

Since the watchdog function is tightly coupled to the timer itself, it
is implemented as an auxiliary device of the timer device

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 MAINTAINERS                   |  1 +
 drivers/watchdog/Kconfig      | 15 ++++++++
 drivers/watchdog/Makefile     |  1 +
 drivers/watchdog/vt8500-wdt.c | 80 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5362095240627f613638197fda275db6edc16cf7..97d1842625dbdf7fdca3556260662dab469ed091 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3447,6 +3447,7 @@ F:	drivers/tty/serial/vt8500_serial.c
 F:	drivers/video/fbdev/vt8500lcdfb.*
 F:	drivers/video/fbdev/wm8505fb*
 F:	drivers/video/fbdev/wmt_ge_rops.*
+F:	drivers/watchdog/vt8500-wdt.c
 F:	include/linux/vt8500-timer.h
 
 ARM/ZYNQ ARCHITECTURE
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0d8d37f712e8cfb4bf8156853baa13c23a57d6d9..8049ae630301a98123f97f6e3ee868bd3bf1534a 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -2003,6 +2003,21 @@ config PIC32_DMT
 	  To compile this driver as a loadable module, choose M here.
 	  The module will be called pic32-dmt.
 
+config VT8500_WATCHDOG
+	tristate "VIA/WonderMedia VT8500 watchdog support"
+	depends on ARCH_VT8500 || COMPILE_TEST
+	select WATCHDOG_CORE
+	select AUXILIARY_BUS
+	help
+	  VIA/WonderMedia SoCs can use their system timer as a hardware
+	  watchdog, as long as the first timer channel is free from other
+	  uses and respective function is enabled in its registers. To
+	  make use of it, say Y here and ensure that the device tree
+	  lists at least two interrupts for the VT8500 timer device.
+
+	  To compile this driver as a module, choose M here.
+	  The module will be called vt8500-wdt.
+
 # PARISC Architecture
 
 # POWERPC Architecture
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index c9482904bf870a085c7fce2a439ac5089b6e6fee..3072786bf226c357102be3734fe6e701f753d45b 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
 obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
 obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
 obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
+obj-$(CONFIG_VT8500_WATCHDOG) += vt8500-wdt.o
 
 # X86 (i386 + ia64 + x86_64) Architecture
 obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-wdt.c
new file mode 100644
index 0000000000000000000000000000000000000000..54fe5ad7695de36f6b3c1d28e955f00bef00e9db
--- /dev/null
+++ b/drivers/watchdog/vt8500-wdt.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2025 Alexey Charkov <alchark@gmail.com */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/container_of.h>
+#include <linux/io.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/watchdog.h>
+#include <linux/vt8500-timer.h>
+
+static int vt8500_watchdog_start(struct watchdog_device *wdd)
+{
+	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
+	u64 deadline = info->timer_next(wdd->timeout * VT8500_TIMER_HZ);
+
+	writel((u32)deadline, info->wdt_match);
+	writel(TIMER_WD_EN, info->wdt_en);
+	return 0;
+}
+
+static int vt8500_watchdog_stop(struct watchdog_device *wdd)
+{
+	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
+
+	writel(0, info->wdt_en);
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
+static int vt8500_wdt_probe(struct auxiliary_device *auxdev,
+			    const struct auxiliary_device_id *id)
+{
+	struct vt8500_wdt_info *info;
+	struct watchdog_device *wdd;
+
+	wdd = devm_kzalloc(&auxdev->dev, sizeof(*wdd), GFP_KERNEL);
+	if (!wdd)
+		return -ENOMEM;
+
+	wdd->info = &vt8500_watchdog_info;
+	wdd->ops = &vt8500_watchdog_ops;
+	wdd->max_hw_heartbeat_ms = U32_MAX / (VT8500_TIMER_HZ / 1000);
+	wdd->parent = &auxdev->dev;
+
+	info = container_of(auxdev, struct vt8500_wdt_info, auxdev);
+	watchdog_set_drvdata(wdd, info);
+
+	return devm_watchdog_register_device(&auxdev->dev, wdd);
+}
+
+static const struct auxiliary_device_id vt8500_wdt_ids[] = {
+	{ .name = "timer_vt8500.vt8500-wdt" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(auxiliary, my_auxiliary_id_table);
+
+static struct auxiliary_driver vt8500_wdt_driver = {
+	.name =	"vt8500-wdt",
+	.probe = vt8500_wdt_probe,
+	.id_table = vt8500_wdt_ids,
+};
+module_auxiliary_driver(vt8500_wdt_driver);
+
+MODULE_AUTHOR("Alexey Charkov <alchark@gmail.com>");
+MODULE_DESCRIPTION("Driver for the VIA VT8500 watchdog timer");
+MODULE_LICENSE("GPL");

-- 
2.49.0



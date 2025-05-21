Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BC9C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 13:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUsodPmJtak7dzPlFPK8l9nfS7vdyCUD4wkq3fhB9qw=; b=v5RrJMrQ7GJUgm3AZCsNGKjg1e
	brYaCt5cmF4jbuGAnecRJouSZTpG9Nu4DRFTmX4oND0qsKebmewgM2rtqVmZeEiyPypkU1G1inv3p
	HZMjgzXCkwPgAJuueLtjpSrLvGCcxDOBCabeW0v01yhO4qyulMKNG3VewsoyT3SiDxv3OCFWiGdfv
	qZ5IQ656My2r9wv5dPY+6UKhamnQiiORvfJpdMBgGU06pffulqANdQlL57c6DjrjbFPj1chWgAW2K
	9Cu6WxipznNLB+/16WM2PlfHigbGj2fWiTLTR6DokWsIGu4h483U1JJVg7ceeKaBgtROMX91Z2dgW
	n5YS1gnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjic-0000000FyNn-1yeJ;
	Wed, 21 May 2025 13:42:50 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHj4F-0000000FrXR-2vz7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 13:01:08 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-23274dbcbc2so20333405ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747832467; x=1748437267; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUsodPmJtak7dzPlFPK8l9nfS7vdyCUD4wkq3fhB9qw=;
        b=lsn19+ipV6WJd0z2yNxBojAICs6yaeS63EHafJJ1ZTTvOtvp4ku0N5DMPCiEO3OVy4
         3+Fh9nMDhqwvfhzMmj9fNNwGOa4Spl7xIqExPtSZBcMAR0OIWARUUy47/aAjHIItx6iw
         C2eNt+YRrPo28hwLFRe+D5U8VSm6YhtJZCR/klrh0XAF3y7r3D15dbNfh1hec2RNqyMq
         SaXRkt1nu9br9H5TPGAuQXi5NqNmFS8CyFuJ0/vGiunAt38I62hsKTMO+MsXEMJEBmWZ
         McmpnhQ7QYY1YlXS65vA4lyRLkjYzwkXzbFSobNVRKEe97jx9eUqRUU4xPZQqTAypXHz
         ps2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832467; x=1748437267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUsodPmJtak7dzPlFPK8l9nfS7vdyCUD4wkq3fhB9qw=;
        b=pPZtGnska6QDUo1tyM9nx00LUTpVhGDVpK+h0bhl9HmioVyQ3dZj+EOQk3G/JDPXYk
         G1zc7De1hWgha6yRnu/SB5/6aGXfqkAyGLdpqzuDzLsrO8TENK4efTPyakjK0BYhroLX
         AEJsOo//w/MlMHghcGh4LC5ySbZKFBe1u3Cs1oulI/fhoQDu0foK88ULdSmEQFoOje4x
         xctnk1yuuEl5/5WHXbEP73939REUBsJFZJqKy6oX9hACgrDQUXnSVb47RbbYPSG1XNHf
         ffr2+qJzQwLo8xD4uCuEe+qfOzIBaVPSojQGqgrmjgqMTxf+lRcp62vFidEXlw6uxMKs
         an6g==
X-Gm-Message-State: AOJu0YxTHxMPedU5G+0eyOl966mIPC7T//sp5O7ce0AYNztlBWXd80+o
	JQsMR/vWm9VvnwLAB1q/OVgbrAhqzEEMFTGg2pC5VX2bQv4qFVoix3jvNQIeW0QV0es=
X-Gm-Gg: ASbGncsAGznKfNxdMLUkmQklklWWhP1J199VfAGvFKzQgXCQy/EQRdohNw3sH/yGZel
	6BOSC1y9ABk6SM7GRclhfk/qKd8JZewwtscrdPWenqa51cktz1+BjzhfPoWqX+L5tfvnQgVE9IN
	4YmOMy0I8CmWB/Uix6EJXhTFzf91qMxJ4yvlCkh9hnsBmxU7fRBGPXFNMWYhwKmuKnCvntJKz8h
	9JmSmI4voZxUcQKaor0e5grrlGSVYXdWRfGR6H5nhwha41xdrw7j5iT8bWUq+6R6QjzOQcdCe6/
	A/UHwlFef5jNSgR3ilsWGzAg5NEkRRj56X3b/eHXabe2S72zI1RixL5OZwpWfIc=
X-Google-Smtp-Source: AGHT+IHi9JKW8hrJ0oTUZGRbjiYsmE67PwWiZFYcvvLI4U1V7ygYEi+JkVupxNUINvhANVgU2PeZAg==
X-Received: by 2002:a17:903:2284:b0:22f:b25b:8e93 with SMTP id d9443c01a7336-231de3b9f2cmr307998035ad.48.1747832466871;
        Wed, 21 May 2025 06:01:06 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb017sm92691165ad.53.2025.05.21.06.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:01:06 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 17:00:12 +0400
Subject: [PATCH v5 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-vt8500-timer-updates-v5-4-7e4bd11df72e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747832426; l=5807;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=fg2O/NiYrG5jnAySQDhAJUCwCiNOphjw1AELvkeniPk=;
 b=lPyHbAc5NFVsW+VOhQpf2YBYDPTf4Ebr3BvqCdjt0B+TlJG5YPcpy/khytwwsZQyC7Hi/lIy3
 NeyS5Nvh+ayDb6Z7dhbTmUqbOjMp82ryHbvz0/v7CfcGs3yxL+GxZru
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_060107_744620_3543B44E 
X-CRM114-Status: GOOD (  24.02  )
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
 drivers/watchdog/vt8500-wdt.c | 88 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 105 insertions(+)

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
index 0d8d37f712e8cfb4bf8156853baa13c23a57d6d9..2e59303306feba7e15a015c2fce25b1290dc4cbc 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1115,6 +1115,21 @@ config SUNPLUS_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called sunplus_wdt.
 
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
 # X86 (i386 + ia64 + x86_64) Architecture
 
 config ACQUIRE_WDT
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
index 0000000000000000000000000000000000000000..a47ee714e7c0172e89a31b0d6c064fff338bd5b6
--- /dev/null
+++ b/drivers/watchdog/vt8500-wdt.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2025 Alexey Charkov <alchark@gmail.com */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/container_of.h>
+#include <linux/io.h>
+#include <linux/limits.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/watchdog.h>
+#include <linux/vt8500-timer.h>
+
+static int vt8500_watchdog_start(struct watchdog_device *wdd)
+{
+	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
+	u32 deadline = min(wdd->timeout * 1000, wdd->max_hw_heartbeat_ms);
+
+	/* The deadline is matched against the hardware clocksource counter,
+	 * which is a u32 value incrementing at VT8500_TIMER_HZ and continuing
+	 * past wraparound. When the return value of timer_next is greater than
+	 * U32_MAX then the match should occur after the hardware counter wraps
+	 * around, thus we take only the lower 32 bits of timer_next return val
+	 */
+	deadline = info->timer_next((u64)deadline * (VT8500_TIMER_HZ / 1000));
+	writel(deadline, info->wdt_match);
+	writel(1, info->wdt_en);
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



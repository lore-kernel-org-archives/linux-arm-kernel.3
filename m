Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA8DC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 16:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxVX0Y3q1zKn8AHlmxm4fkgMmDWH56ItPYhoC7G/EYs=; b=BX2IIgN9qoauEGc5ewAWdmfMuT
	jh1VHzv8ignlzAd+peyHU1pZa2XWNkhXF4l+/wPpsLxC3LNNeKicskmJj9f2seHPPK6tQPGB0kHZ4
	3T6O/CbUg/i6y923UQWWXkPAms81C/XRKVo7WynPqWRyK0BUVG255L5V8Ng9w9X0qpq27kPCSqQBV
	M2MoSzbrm34lRMETtxteAQMIqsVQYO83EwcSBzxxEkv7SE2wgU0ODixAb3V6DXYUUtcOzKCcP1ToY
	dbi0GZR6kDEZPn42MYanyCpsUqa5r2H9Th2aw8GwtYSoInN6xVi7b7VPL5I0EjDkCFZ7eyMfjvxBB
	+N57vCYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGfO-0000000FIRc-3qyY;
	Fri, 11 Jul 2025 16:32:06 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFta-0000000FAzb-0cUn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 15:42:43 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-73c17c770a7so3030594b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 08:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1752248561; x=1752853361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxVX0Y3q1zKn8AHlmxm4fkgMmDWH56ItPYhoC7G/EYs=;
        b=DgAfGn/icyES8dQunh8t5LAmEYuGQgd7YS6Gvs/a/+LoeQS01ap2KriJJbbQJ48BV5
         srd4IpZYQ2kgru7zu4Bwxa88iG4GJ4a/uyXgfKj6ubzyphVrZp/XX6/kbN3hZElLBH9D
         IajVDJ2V0H2yRrR/qOIUX3nh0qGXaHciuAkB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752248561; x=1752853361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxVX0Y3q1zKn8AHlmxm4fkgMmDWH56ItPYhoC7G/EYs=;
        b=P84fx7Yl2PEJhmC7Vm92bIMp1Yr/OAw52CoagOo0CGXcC07kvDFVVqlfJlJtBWrumA
         Oh34KpbSKNJ7um8GmBZqNMs2PUDJKeE1yrH+/OVdRK2HZa5qJ0LvW6Dpd53q3+FFMaSP
         bVe8jRE5Mp2seV7sFT16Y8eL6ugry8KwV6w17KsBvbhyFeAuSoIaGil4SQvMPVg3BkJc
         fRS+42Jfqv8F8SerqNg+caz4M62afaqeJmhur8Oi+tlUosajrFHBMfmcbRczmrfzpbfQ
         M2414rYDdYpKXR4IYQBi+Knkd0br7dQ/x844tcK1miSKqLpiWzgkNZ34meo5ILuGdBvE
         Yv7g==
X-Forwarded-Encrypted: i=1; AJvYcCUY68Y7hzLvsaOO5W7kYz8Ci79dkenU9evK4beCSMMDv12D87fNINcB2vWwG8yhDLzqfjg32R1tT/hsWTodj9yM@lists.infradead.org
X-Gm-Message-State: AOJu0YyKRaTxOEBeR7A04gbaFYIM+6lpj7saCb8xrbIjKXAF3sWE61oY
	cAxK6ftZrt7gAbFt6gvpL7M/OdwZSnBA1A2WtAY+2IGeZx6p8iDHTLHCHK4m1OMjXQ==
X-Gm-Gg: ASbGncuF09ebnp69s/Ms2YbiM0EQD7NL4/Qjcb2YJnU5SMhxum23ogr2MLuUvaNl9LS
	LXsVKZ//xLG3tS3hrY1TGGXh/Lxr47OOHkQQmfV2an7ejOoz54CX6aucVoEcMCGXvTYJFvJudmF
	EHU9u7wswmYK2G0edYS5GAKEXb8IVVOnsWg2keyLQQvl0H/bRZGv6PkZWQ2M63Z4YWaiEEXOZM6
	oG+JseXG6nFJxYqJLn2hj7jEleM2bTOprEdMtuugwdfyT6xaqVyXSSoESWllVC6npoAe8YomZ3x
	VtdVY8sYjq6Ip0gZgd/LI57eK6JPHwDjMj6nxrEHYNOEDR9hpw6NX015/nGKD2e0wpgiWKosH91
	/yotqnT5tFjdT0kUwxFt8VeRNozjXtVYguXS9Zr+4Ld80zstFG2AsNTYHqXwBf2JrvuCm
X-Google-Smtp-Source: AGHT+IHvi48zWnlChEAQBDWzefinVC/2H0fk+4SbSA/0wv9N/ywaQmI7QE1QuH03kCgKn58gcjxDIQ==
X-Received: by 2002:a05:6a00:4fc1:b0:748:f750:14c6 with SMTP id d2e1a72fcca58-74ee244a41emr4543842b3a.14.1752248561343;
        Fri, 11 Jul 2025 08:42:41 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5ccesm5762420b3a.27.2025.07.11.08.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 08:42:40 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	kamal.dasu@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Kamal Dasu <kdasu@broadcom.com>
Subject: [PATCH 2/4] hwspinlock: brcmstb hardware semaphore support
Date: Fri, 11 Jul 2025 11:42:19 -0400
Message-Id: <20250711154221.928164-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711154221.928164-1-kamal.dasu@broadcom.com>
References: <20250711154221.928164-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_084242_186307_36445E81 
X-CRM114-Status: GOOD (  21.73  )
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

From: Kamal Dasu <kdasu@broadcom.com>

Added support for brmstb_hwspinlock driver that makes use of
the hwspinlock framework. Driver uses SUN_TOP_CTRL_SEMAPHORE_[1:15]
registers to implement the hardware semaphore. With this change
other brcmstb drivers can use hwspin_trylock() and hwspin_unlock()
apis and make use of this hwspinlock framework. Other driver dt nodes
just need to use a reference to the &hwspinlock and the lock id
they want to use.
e.g. hwlocks = <&hwspinlock0 0>;

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/hwspinlock/Kconfig              |  9 +++
 drivers/hwspinlock/Makefile             |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c | 98 +++++++++++++++++++++++++
 3 files changed, 108 insertions(+)
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index 3874d15b0e9b..551afa8df2d0 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -63,4 +63,13 @@ config HSEM_U8500
 
 	  If unsure, say N.
 
+config HWSPINLOCK_BRCMSTB
+	tristate "Broadcom Setttop Hardware Semaphore functionality"
+	depends on ARCH_BRCMSTB || COMPILE_TEST
+	help
+	  Broadcom settop hwspinlock driver.
+	  Say y here to support the Broadcom Hardware Semaphore functionality, which
+	  provides a synchronisation mechanism on the SoC.
+
+	  If unsure, say N.
 endif # HWSPINLOCK
diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
index a0f16c9aaa82..4f5c05403209 100644
--- a/drivers/hwspinlock/Makefile
+++ b/drivers/hwspinlock/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_HWSPINLOCK_SPRD)		+= sprd_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_STM32)		+= stm32_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_SUN6I)		+= sun6i_hwspinlock.o
 obj-$(CONFIG_HSEM_U8500)		+= u8500_hsem.o
+obj-$(CONFIG_HWSPINLOCK_BRCMSTB)	+= brcmstb_hwspinlock.o
diff --git a/drivers/hwspinlock/brcmstb_hwspinlock.c b/drivers/hwspinlock/brcmstb_hwspinlock.c
new file mode 100644
index 000000000000..c27d53e06edf
--- /dev/null
+++ b/drivers/hwspinlock/brcmstb_hwspinlock.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * brcmstb HWSEM driver
+ *
+ * Copyright (C) 2025 Broadcom
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/hwspinlock.h>
+#include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
+#include "hwspinlock_internal.h"
+
+#define BRCMSTB_MAX_SEMAPHORES		16
+#define RESET_SEMAPHORE			0
+
+#define HWSPINLOCK_VAL			'L'
+
+static int brcmstb_hwspinlock_trylock(struct hwspinlock *lock)
+{
+	void __iomem *lock_addr = lock->priv;
+
+	writel(HWSPINLOCK_VAL, lock_addr);
+
+	return (readl(lock_addr) == HWSPINLOCK_VAL);
+}
+
+static void brcmstb_hwspinlock_unlock(struct hwspinlock *lock)
+{
+	void __iomem *lock_addr = lock->priv;
+
+	/* release the lock by writing 0 to it */
+	writel(RESET_SEMAPHORE, lock_addr);
+}
+
+static void brcmstb_hwspinlock_relax(struct hwspinlock *lock)
+{
+	ndelay(50);
+}
+
+static const struct hwspinlock_ops brcmstb_hwspinlock_ops = {
+	.trylock	= brcmstb_hwspinlock_trylock,
+	.unlock		= brcmstb_hwspinlock_unlock,
+	.relax		= brcmstb_hwspinlock_relax,
+};
+
+static int brcmstb_hwspinlock_probe(struct platform_device *pdev)
+{
+	struct hwspinlock_device *bank;
+	struct hwspinlock *hwlock;
+	void __iomem *io_base;
+	int i, num_locks = BRCMSTB_MAX_SEMAPHORES;
+
+	io_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(io_base)) {
+		dev_err(&pdev->dev, "semaphore iobase mapping error\n");
+		return PTR_ERR(io_base);
+	}
+
+	bank = devm_kzalloc(&pdev->dev, struct_size(bank, lock, num_locks),
+			    GFP_KERNEL);
+	if (!bank)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, bank);
+
+	for (i = 0, hwlock = &bank->lock[0]; i < num_locks; i++, hwlock++)
+		hwlock->priv = io_base + sizeof(u32) * i;
+
+	return devm_hwspin_lock_register(&pdev->dev, bank,
+					 &brcmstb_hwspinlock_ops,
+					 0, num_locks);
+}
+
+static const struct of_device_id brcmstb_hwspinlock_ids[] = {
+	{ .compatible = "brcm,brcmstb-hwspinlock", },
+	{ /* end */ },
+};
+MODULE_DEVICE_TABLE(of, brcmstb_hwspinlock_ids);
+
+static struct platform_driver brcmstb_hwspinlock_driver = {
+	.probe		= brcmstb_hwspinlock_probe,
+	.driver		= {
+		.name	= "brcmstb_hwspinlock",
+		.of_match_table = brcmstb_hwspinlock_ids,
+	},
+};
+
+module_platform_driver(brcmstb_hwspinlock_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Hardware Spinlock driver for brcmstb");
+MODULE_AUTHOR("Kamal Dasu <kdasu@broadcom.com>");
-- 
2.34.1



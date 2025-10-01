Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A18CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 18:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUuZQrnmJtbF5ECpFYAH41ueWDcOLNVLh/7zyV6Y6a0=; b=C8mTf/rj3i2bOG97oHJd/oEuN5
	MN2ZrcNJAGZ0Hi4ghELdlLR8d/sjOoKaXyA7vwxjLFCwtLf5HSdkea8Cr37YqSJduNb+LCnCcTmPR
	mgl+ve9qqnH90E/8TS3ORx/TzFl1ifNWPfPs95rb6oDnV9rXjSr270CF4k4jVujPcOgjVFQkVOJRq
	DHMgiTdnvviDj1ntUfQ3wcTsm5MHVfY+pPIamg+H1CSGpmBENLQXt/EWOhMVP9WDqKq6/DYUob536
	p3XsVfBx128cRg1R1TEq3+20PqWSIDbCTl7W1p/d8ZWX5SCHxsPHO/wzkQY30dxbzLzKrap3hMaWx
	XDZfMtCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41OO-00000008jCG-0EXi;
	Wed, 01 Oct 2025 18:17:32 +0000
Received: from mail-il1-x164.google.com ([2607:f8b0:4864:20::164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41OL-00000008jAT-3RKf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 18:17:31 +0000
Received: by mail-il1-x164.google.com with SMTP id e9e14a558f8ab-4248746aabfso772085ab.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 11:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759342649; x=1759947449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zUuZQrnmJtbF5ECpFYAH41ueWDcOLNVLh/7zyV6Y6a0=;
        b=EMYWLoDaeTve9F5N6p6WCQAgVq9DpzpNCbzwHFZXNyPfxz9wCHPj05C4oYg9UoTocx
         8nqv26vZGxOyhWKdZDECplb3jAGe//TslTagE+s8rWcQy6dSP+ph5MzvTvGxODRc2/5R
         wLBrigjhkBa5qYzcfHBdiyisfuNW3KhgAGZlX6TPL4sA2Z6yFJGiEMTXIjXEXaT+Mjkf
         z71vNDY33shK1u6MSmiCeO9D5+Wqtdkqyi0c0DG6PYpp2B1KB+kjpvzUZy5llrmB6jsp
         cYbUb4hyh42r7oVYLQ9y2IOXMeTGPUQQoCKRzi3CxXMRfi20RBslYhBDw0l5TTdzamgu
         GZZA==
X-Forwarded-Encrypted: i=1; AJvYcCVzK3gsJq5hZOWVRZpuxSKd6U1cF/WXw7LvOmwkfFQ03hfcUEGQogKkVO0n92jj1A5+lJ6ybLER6UXj76QNqGhN@lists.infradead.org
X-Gm-Message-State: AOJu0YzuB48mewL9Qbu+1UjwuIYGl6TzzR5Mb/jhAMAtmda5ZAW7xtWE
	A5OcCDWq61vtfhKjMtfWkWFyM5nyoSfl6s7Ei2FUb1HpsorcGRH3ZvEL7Q8gA9rEZZJy5CUVezR
	ZyQwreZBUzs9xIviOiEWOPILY+fY2xDghMAm1PsBz9cYgww3j1lcRgoYD2rlk7v0zghXObkZ7zP
	tLa6JSKjcSVpRxzZotbpu2QotJ98EZufnA4RSQf/eZ9ySUJV8TkF5o/eihQlbURKs0W0Xz3DPXR
	3ZXJN+QcXhgAV55VtrEwnZHAFc=
X-Gm-Gg: ASbGncuNMO0oBaYRkQSYeBFdxhFvhiNs2pSCTmj5NkaGpIIcKZKA2SfeYTJdHF6UEsk
	Sws7yaKjBMaZlw3YGGvHb2SUd+WDf78qnEuHm6kGzCYQYsqCebDp1LimTBh3FcLRKmXU5LIMC2D
	iQ63mifU+kNaHouymRxbaMZKrsLD2tT23F56o0nCfhf/bdEQbpEfV1tp27Gxvr5KIUQGPn9tsF9
	wzALQgBu2LXv4UBGj7bZtpfUcqaQZLPoccYJJMa9KXJYDB4YQChCjCo67ajnQprD5e4ntT/XjeD
	AI88C/evXrACAKPSgtSv88VN2dVaKqpF4qITiEcRV1YGczlpHrTgXCjPGHV0Moxsqq/w6syWMcs
	M8fyoWrYVH6kUxsqyjXjaFp4UzszMx4eEM+eWY5lgxTbZTp8ACCEgpuR8YzlETeUJ5ZLzI2gACr
	XWHufl
X-Google-Smtp-Source: AGHT+IGCa20eeRImaZcIL9PsP7po00YP8Di6r/s2xk5joEQpMWooiEp5Ux4te+KNPKGpyjYRzWvBJHxT07tb
X-Received: by 2002:a05:6e02:1486:b0:427:a3b1:316f with SMTP id e9e14a558f8ab-42d81612602mr66523065ab.13.1759342648800;
        Wed, 01 Oct 2025 11:17:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-57b5ed2787bsm10387173.26.2025.10.01.11.17.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Oct 2025 11:17:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dd6887656cso8715461cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 11:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759342648; x=1759947448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUuZQrnmJtbF5ECpFYAH41ueWDcOLNVLh/7zyV6Y6a0=;
        b=aOvplFI7ML7n+T+xwhMCSiLg+cCnhw+MQH3pU+goc/gtjsnRoqe7Le3ANPigOzYVG6
         NiZsAInSPlzYMc2HdSsCfx9pAJHfQNYJtN0z0CC7RArESscegbVGNJVQi8VRFCEeY9Jc
         C9etCOuDXH8A6xg5VjVeIwumgxWUUW9Ac4wHo=
X-Forwarded-Encrypted: i=1; AJvYcCVJgrcekPPEW/w19bhJnILGMK/ZEsU/VlCoftIBf1oYBxdHBRobpv09Ftjth17G83tifbw4b3ubMybwXvZSawKm@lists.infradead.org
X-Received: by 2002:a05:622a:4d90:b0:4de:f3d7:6964 with SMTP id d75a77b69052e-4e41cd01379mr61196181cf.24.1759342647794;
        Wed, 01 Oct 2025 11:17:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4d90:b0:4de:f3d7:6964 with SMTP id d75a77b69052e-4e41cd01379mr61195441cf.24.1759342647212;
        Wed, 01 Oct 2025 11:17:27 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55c9e78cfsm3847671cf.27.2025.10.01.11.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 11:17:26 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: peng.fan@oss.nxp.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v2 2/3] hwspinlock: brcmstb hardware semaphore support
Date: Wed,  1 Oct 2025 14:16:40 -0400
Message-Id: <20251001181641.1561472-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001181641.1561472-1-kamal.dasu@broadcom.com>
References: <20251001181641.1561472-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_111729_879705_7F2A5780 
X-CRM114-Status: GOOD (  23.30  )
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
 drivers/hwspinlock/Kconfig              | 11 ++-
 drivers/hwspinlock/Makefile             |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c | 96 +++++++++++++++++++++++++
 3 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index 3874d15b0e9b..39797cadfd0b 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -8,6 +8,16 @@ menuconfig HWSPINLOCK
 
 if HWSPINLOCK
 
+config HWSPINLOCK_BRCMSTB
+	tristate "Broadcom Setttop Hardware Semaphore functionality"
+	depends on ARCH_BRCMSTB || COMPILE_TEST
+	help
+	  Broadcom settop hwspinlock driver.
+	  Say y here to support the Broadcom Hardware Semaphore functionality, which
+	  provides a synchronisation mechanism on the SoC.
+
+	  If unsure, say N.
+
 config HWSPINLOCK_OMAP
 	tristate "OMAP Hardware Spinlock device"
 	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX || SOC_AM33XX || SOC_AM43XX || ARCH_K3 || COMPILE_TEST
@@ -62,5 +72,4 @@ config HSEM_U8500
 	  SoC.
 
 	  If unsure, say N.
-
 endif # HWSPINLOCK
diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
index a0f16c9aaa82..35f2d94d8ba2 100644
--- a/drivers/hwspinlock/Makefile
+++ b/drivers/hwspinlock/Makefile
@@ -4,6 +4,7 @@
 #
 
 obj-$(CONFIG_HWSPINLOCK)		+= hwspinlock_core.o
+obj-$(CONFIG_HWSPINLOCK_BRCMSTB)	+= brcmstb_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_OMAP)		+= omap_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_QCOM)		+= qcom_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_SPRD)		+= sprd_hwspinlock.o
diff --git a/drivers/hwspinlock/brcmstb_hwspinlock.c b/drivers/hwspinlock/brcmstb_hwspinlock.c
new file mode 100644
index 000000000000..0b164c57192e
--- /dev/null
+++ b/drivers/hwspinlock/brcmstb_hwspinlock.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * brcmstb HWSEM driver
+ *
+ * Copyright (C) 2025 Broadcom
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/hwspinlock.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include "hwspinlock_internal.h"
+
+#define BRCMSTB_NUM_SEMAPHORES		16
+#define RESET_SEMAPHORE			0
+
+#define HWSPINLOCK_VAL			'L'
+
+static int brcmstb_hwspinlock_trylock(struct hwspinlock *lock)
+{
+	void __iomem *lock_addr = (void __iomem *)lock->priv;
+
+	writel(HWSPINLOCK_VAL, lock_addr);
+
+	return (readl(lock_addr) == HWSPINLOCK_VAL);
+}
+
+static void brcmstb_hwspinlock_unlock(struct hwspinlock *lock)
+{
+	void __iomem *lock_addr = (void __iomem *)lock->priv;
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
+	int i, num_locks = BRCMSTB_NUM_SEMAPHORES;
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
+	for (i = 0, hwlock = &bank->lock[0]; i < num_locks; i++, hwlock++)
+		hwlock->priv = (void __iomem *)(io_base + sizeof(u32) * i);
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
+MODULE_AUTHOR("Kamal Dasu <kdasu.dasu@broadcom.com>");
-- 
2.34.1



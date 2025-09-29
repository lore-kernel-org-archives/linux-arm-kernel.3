Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F527CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 20:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wA3uOR00VQG2MYj5nJtUQY0pkQ46ZSnhVcxuOfdZq+A=; b=ReoG0UAcDjnU0eA5o1fechC0ox
	xT+xJ9Loi1orQpqNdvfSUYy9EazmAMH0hw2R9I3QHKpVVrF6ZBAKwpEqtNr0frzhoZJ7cDeXlpW4F
	MvrFv4+1z7uD4eQqt+qDAk2pbdsUgkn3eO3bJ6x1Olaj3hCqs7DBXNUpkSvJ/gY8MoGNKxyEpLQ8j
	uJ3iiK0QYbx0CU2RytXMg3+oVN/BsHtHJX6YQMEOMHrg7OyigFRxp0+VxrkrvUCo/MB8uASJL/yG+
	sloXQnaTDc1nOZVNOkT4G/VG+qm5xpwze7UBNjx2t58WYuwp/5sGUJVrJt8hp9KhitzpN4a//jUBg
	tgdVoj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3K9W-00000003Q2U-0Lj7;
	Mon, 29 Sep 2025 20:07:18 +0000
Received: from mail-io1-xd64.google.com ([2607:f8b0:4864:20::d64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3K9S-00000003Q08-4Bfd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 20:07:16 +0000
Received: by mail-io1-xd64.google.com with SMTP id ca18e2360f4ac-9335a918867so7000739f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 13:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759176431; x=1759781231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wA3uOR00VQG2MYj5nJtUQY0pkQ46ZSnhVcxuOfdZq+A=;
        b=WvqCFnMulOX89zgaeGQ1g/Xp3kM5vL2T7xnotUWhBAtDLoALpBjMyYwrbePV/eub85
         /afoXa/Ce7QUJp7y+yogCtILGXgzdIVwgFdlPr2HhW/y47Tk1rSgVZzwbsdOHvOJbVQT
         K5HOvWdTObCBGtDj7QIOfg44vEK36gPVnYrLUwfjaVTXQEUNH6Uf/K3yVkbVAGp8OflF
         0gXDVFAFUnr6NX8+l4pjquFzfUypI0dfJ3Ywkh50NunmvRgpgXofQhxx68F332AFFkb8
         a6hYc254sVhrrW7TWPQ4bWJnhNEBDVxOwGTuuoUO9nb+2eEj7HxKDTBec0o+UN1n9a5c
         WQcA==
X-Forwarded-Encrypted: i=1; AJvYcCWCKxj+XDPvMPJugbFOu99G2ZQSIXn+0fYSvn17fKU05LaRxufO0VIUsYjnmKMOoZCLV9tBItsKseWsNcrzb6jH@lists.infradead.org
X-Gm-Message-State: AOJu0YyC5kJZshw1ogYCu6RrDeB/ayYSN+4msN89ewO2VHBwKc8eiPIy
	oPnXILWsiP7B3tzSOVC86LRoMLLt1D0VuxfQ4Rrm0bZU3UZo6xuqE3L9svQJicdRhNxm8+GJoC8
	XH12Wgz98LfhI9YUUWJku/cyX1+HLJdC0FlbScy4t563FbigVSUDCbdvcxQUp/HcunlDGKRr7z9
	xZ7vFa6K4/MMtpLk8wLsi57Yy6EMjnxckzYKS+NLLrkpMSNlMNHTr0lAP+u2R301kBJbJvg6v+l
	lPZZ9Rrv8wnNBwEA7CHI8vDg7M=
X-Gm-Gg: ASbGncuajw9H73ZVhwszam0Md4GxlCEvBDAkC2hvR7d0fXJBRP1HDo4UJfwuhHt06O1
	a7pBTR/ML10IQTqZYxuoH65yri69A7MwyUEphuVHkg32IVk/N3b53SSJVqiMpCcWsMzayDMt0v+
	hSISCPLqgrUjG6nIW/c44l3H3FjgTBveuBmkQhTfm27wwTE3uzZkXNSTqAQj9BqrPOgWH8vEiXK
	VJ+AiJFPdXNAZ+Juc7T4Qt1oL3L1UaNLtXs0q1TNwm0BBqONShXsakFfwFo+K+/rBeKpdjhklow
	SMDTxdD9eyaNiAqtMGiJDisauDxfgxAbQKDyC7d1DiXrldO6MMcx7enY9H9Wo85VFx7cZERZSqP
	ljMbxiDPZ+RhwBEALNxN9kqHYCGG1nYhKKhXc/INrcT20zl5fE8527aURnOFX9fHOUvo4t2rOlc
	E=
X-Google-Smtp-Source: AGHT+IERmLYZzwMHrqgDjgcfqcNnCE5zUO+ZJDv5SzcLiU8L8/wieKxt7WiGdhxrRv1qwN6FQXL6GL/yoBk7
X-Received: by 2002:a05:6602:484:b0:8fd:765f:3142 with SMTP id ca18e2360f4ac-929c2f2057dmr675315639f.11.1759176430770;
        Mon, 29 Sep 2025 13:07:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-56a64211cb2sm720209173.7.2025.09.29.13.07.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Sep 2025 13:07:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b55443b4114so3507719a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 13:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759176429; x=1759781229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wA3uOR00VQG2MYj5nJtUQY0pkQ46ZSnhVcxuOfdZq+A=;
        b=QA1uQrie0CiducPTFHvZKaz9tx/ieg7+Ru9IxByAsLxeVnzx8wbhtKp80iT1lGbhf7
         PwMlBue3twShgNlsyp8e5qKc9FgSPkhpe5F+MaQnkLIIOR01kDVD1Uz4qNCwEpevQzS+
         uDsnkqFUujrQPKcObRLens+3jvopsK8pXdWtU=
X-Forwarded-Encrypted: i=1; AJvYcCWUd5wUzsrAG8+GOtSUW9RetfYXNrM6mET+dQg4Z4Idr9YXRlYcjrlVVFxBIQPE68fTuvLFkFnPCLrXf7h6VkaN@lists.infradead.org
X-Received: by 2002:a17:90b:3143:b0:32e:1ff5:5af4 with SMTP id 98e67ed59e1d1-3342a2fe9ddmr18545841a91.35.1759176429381;
        Mon, 29 Sep 2025 13:07:09 -0700 (PDT)
X-Received: by 2002:a17:90b:3143:b0:32e:1ff5:5af4 with SMTP id 98e67ed59e1d1-3342a2fe9ddmr18545816a91.35.1759176428992;
        Mon, 29 Sep 2025 13:07:08 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33838735194sm2121479a91.22.2025.09.29.13.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 13:07:08 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH 2/3] hwspinlock: brcmstb hardware semaphore support
Date: Mon, 29 Sep 2025 16:06:26 -0400
Message-Id: <20250929200628.3699525-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_130715_048903_A2E4B069 
X-CRM114-Status: GOOD (  22.72  )
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
index 000000000000..56206431a94c
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



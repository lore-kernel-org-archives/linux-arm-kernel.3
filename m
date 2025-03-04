Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516FCC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 13:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MW5kUntubaDIQWagA8yaVJ6BvgFmQoLHNp/d0jaynvw=; b=Ew6GIfQSqEVJfsgQBxB847c/cG
	oznH1ni1RPIOUix5CPa+gGDOj3hjl179UP6M+sxXjwKZt9T43R80wjVyL+tkKGyDFpIo2zwdkwP4B
	LiourBBYiTBJdzdiR0FLJmw3zIgXLvrlSbhj0SyleePjwHLARK97ngIBCMUZbLOzh2JoVcj0lEXP/
	MnIzY3vdd47C3d4e0WD8dhpsQc4xYNXBbk+k4hr0kWqYV8SU78posDartEkdYPqrg5Sw3E4PH8LRh
	hY/xCGfmDw0/kOg60IO05LRDzztIKWCun5CJG8jOMbcVyfJqL1s+WVBD31t3ASQ5DoWH++AqwM9e6
	t+vOy3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSBj-00000004lcA-2J0X;
	Tue, 04 Mar 2025 13:19:59 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSA9-00000004lR4-1Rho
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 13:18:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43bbc8b7c65so24854675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 05:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741094299; x=1741699099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MW5kUntubaDIQWagA8yaVJ6BvgFmQoLHNp/d0jaynvw=;
        b=lwAeJyqKXVel5EWk32lRqhIvk3fMxjkJwbFqmvlw7zCrWysANKVqe2fyBsnOw1moDU
         AaeiYQDR5lqQCMVC0XezxU7t3rbgUhoCou8IK5Auu8l+hrL7rQGMhj58ebMFZz40mbQ3
         9tt1dVdLrK+QrZfWbVC5WcJcEulB1aglalil0OutebpzTcuvqdI1LchJx4iaF01SuBos
         zlGf08dWjYDEjzzfn7iixQoB0pdxhTTq+qh99O0apwYho2OYWX8DatC0sMba+tSN7eD7
         MwcwLt567Mr+51M5SyNfz616iStAOxXDJifYR75C/AHpKLUKlcaDrQ4MuKzFvNQkzKMO
         XHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741094299; x=1741699099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MW5kUntubaDIQWagA8yaVJ6BvgFmQoLHNp/d0jaynvw=;
        b=NDl7yRwpwkFUExUmXXow2TfRplTp8dbqi23uUyGh6M09hCB0QIeB2iC/Dn98vBZ+aV
         HwS3L+vx/eNMgVhG7fjEvKk5pkAfXz6P2g5Ua6H2ReHOYiQp0Die+Dzxwm7MZ0kwGbOl
         Zk12qbz0mbQOKbWZm6ZvfR+yzss0Bpj+hBIIY1u4emBdKLS+W4MNyTrQh457PB/D+c3X
         2HbBnFjwntFS92k4GIQTmUo/0KVzPikSKexfctzcxVBZjLicr/LXeqsbw5BF6hrr4+fR
         PQmZCthT04KPjgapX0grLI6eVNMwAuYe5inNSaEPnW5vHsnE1bgqyf98MTOcoEO64afx
         zahQ==
X-Gm-Message-State: AOJu0Yz+ryaQtuuvUO+mF9h1n8CPIAbyxTrsD7tuNv6Wk32g6mGpN5Gd
	LIoTHqT1NCDwKGRTXtlIRF5+aNhJ/nR0YrK9QnvkOop7EwRGJPRkophYCkRkj4Y=
X-Gm-Gg: ASbGncvHjriGN+vQL/REKzAO8X2pGfG8EMxkru2I5RcmkRfEuf/uPGdmazLGhm2spew
	t+24Tvlllq9ZKTtZ5SBGfcxB+jkb5+I0wEyLxwAskG8Ebml9hD33x373axn15SuEQYyaBLxxpgI
	Ja2k8crbqpflvH+5Bvz46n0LVf7zNWickH7ke5KP0R724oZZIX55O89QNyd54lmySwuIHf/07Mw
	AZVKZ3pFLsW928Ep4WLx3SIBHDk9GYrSalDAK5pUkwYe9pgcCQsfwXvwuQ7KEdgOTt1LvqIoeo1
	H3AXtjfGbhI/1UI+PRBAKMB7nGpWLaU3eZO9545HLVHD
X-Google-Smtp-Source: AGHT+IF2PB3JIwFkQ/IoI14wzgDJzP7fz9S7sdWqpHpbFlU2+2ElCaz504decofi9DRWSmcB7J4Qiw==
X-Received: by 2002:a05:600c:4182:b0:43b:ce36:756e with SMTP id 5b1f17b1804b1-43bce3676dbmr16293955e9.12.1741094299293;
        Tue, 04 Mar 2025 05:18:19 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6018:7257:350d:e85e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bad347823sm144931545e9.0.2025.03.04.05.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 05:18:18 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] irqchip: davinci-cp-intc: remove public header
Date: Tue,  4 Mar 2025 14:18:14 +0100
Message-ID: <20250304131815.86549-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_051821_582014_8965D2A9 
X-CRM114-Status: GOOD (  20.64  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are no more users of irq-davinci-cp-intc.h (da830.c doesn't use
any of its symbols). Remove the header and make the driver stop using the
config structure.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/mach-davinci/da830.c               |  1 -
 drivers/irqchip/irq-davinci-cp-intc.c       | 31 ++++++++-------------
 include/linux/irqchip/irq-davinci-cp-intc.h | 25 -----------------
 3 files changed, 12 insertions(+), 45 deletions(-)
 delete mode 100644 include/linux/irqchip/irq-davinci-cp-intc.h

diff --git a/arch/arm/mach-davinci/da830.c b/arch/arm/mach-davinci/da830.c
index 2e497745b624..a044ea5cb4f1 100644
--- a/arch/arm/mach-davinci/da830.c
+++ b/arch/arm/mach-davinci/da830.c
@@ -11,7 +11,6 @@
 #include <linux/gpio.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/irqchip/irq-davinci-cp-intc.h>
 
 #include <clocksource/timer-davinci.h>
 
diff --git a/drivers/irqchip/irq-davinci-cp-intc.c b/drivers/irqchip/irq-davinci-cp-intc.c
index f4f8e9fadbbf..42224ca43d5e 100644
--- a/drivers/irqchip/irq-davinci-cp-intc.c
+++ b/drivers/irqchip/irq-davinci-cp-intc.c
@@ -11,7 +11,6 @@
 #include <linux/init.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
-#include <linux/irqchip/irq-davinci-cp-intc.h>
 #include <linux/irqdomain.h>
 #include <linux/io.h>
 #include <linux/of.h>
@@ -155,23 +154,21 @@ static const struct irq_domain_ops davinci_cp_intc_irq_domain_ops = {
 };
 
 static int __init
-davinci_cp_intc_do_init(const struct davinci_cp_intc_config *config,
+davinci_cp_intc_do_init(struct resource *res, unsigned int num_irqs,
 			struct device_node *node)
 {
-	unsigned int num_regs = BITS_TO_LONGS(config->num_irqs);
+	unsigned int num_regs = BITS_TO_LONGS(num_irqs);
 	int offset, irq_base;
 	void __iomem *req;
 
-	req = request_mem_region(config->reg.start,
-				 resource_size(&config->reg),
+	req = request_mem_region(res->start, resource_size(res),
 				 "davinci-cp-intc");
 	if (!req) {
 		pr_err("%s: register range busy\n", __func__);
 		return -EBUSY;
 	}
 
-	davinci_cp_intc_base = ioremap(config->reg.start,
-				       resource_size(&config->reg));
+	davinci_cp_intc_base = ioremap(res->start, resource_size(res));
 	if (!davinci_cp_intc_base) {
 		pr_err("%s: unable to ioremap register range\n", __func__);
 		return -EINVAL;
@@ -200,12 +197,12 @@ davinci_cp_intc_do_init(const struct davinci_cp_intc_config *config,
 	davinci_cp_intc_write(1, DAVINCI_CP_INTC_HOST_ENABLE_IDX_SET);
 
 	/* Default all priorities to channel 7. */
-	num_regs = (config->num_irqs + 3) >> 2;	/* 4 channels per register */
+	num_regs = (num_irqs + 3) >> 2; /* 4 channels per register */
 	for (offset = 0; offset < num_regs; offset++)
 		davinci_cp_intc_write(0x07070707,
 			DAVINCI_CP_INTC_CHAN_MAP(offset));
 
-	irq_base = irq_alloc_descs(-1, 0, config->num_irqs, 0);
+	irq_base = irq_alloc_descs(-1, 0, num_irqs, 0);
 	if (irq_base < 0) {
 		pr_err("%s: unable to allocate interrupt descriptors: %d\n",
 		       __func__, irq_base);
@@ -213,7 +210,7 @@ davinci_cp_intc_do_init(const struct davinci_cp_intc_config *config,
 	}
 
 	davinci_cp_intc_irq_domain = irq_domain_add_legacy(
-					node, config->num_irqs, irq_base, 0,
+					node, num_irqs, irq_base, 0,
 					&davinci_cp_intc_irq_domain_ops, NULL);
 
 	if (!davinci_cp_intc_irq_domain) {
@@ -229,31 +226,27 @@ davinci_cp_intc_do_init(const struct davinci_cp_intc_config *config,
 	return 0;
 }
 
-int __init davinci_cp_intc_init(const struct davinci_cp_intc_config *config)
-{
-	return davinci_cp_intc_do_init(config, NULL);
-}
-
 static int __init davinci_cp_intc_of_init(struct device_node *node,
 					  struct device_node *parent)
 {
-	struct davinci_cp_intc_config config = { };
+	unsigned int num_irqs;
+	struct resource res;
 	int ret;
 
-	ret = of_address_to_resource(node, 0, &config.reg);
+	ret = of_address_to_resource(node, 0, &res);
 	if (ret) {
 		pr_err("%s: unable to get the register range from device-tree\n",
 		       __func__);
 		return ret;
 	}
 
-	ret = of_property_read_u32(node, "ti,intc-size", &config.num_irqs);
+	ret = of_property_read_u32(node, "ti,intc-size", &num_irqs);
 	if (ret) {
 		pr_err("%s: unable to read the 'ti,intc-size' property\n",
 		       __func__);
 		return ret;
 	}
 
-	return davinci_cp_intc_do_init(&config, node);
+	return davinci_cp_intc_do_init(&res, num_irqs, node);
 }
 IRQCHIP_DECLARE(cp_intc, "ti,cp-intc", davinci_cp_intc_of_init);
diff --git a/include/linux/irqchip/irq-davinci-cp-intc.h b/include/linux/irqchip/irq-davinci-cp-intc.h
deleted file mode 100644
index 8d71ed5b5a61..000000000000
--- a/include/linux/irqchip/irq-davinci-cp-intc.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) 2019 Texas Instruments
- */
-
-#ifndef _LINUX_IRQ_DAVINCI_CP_INTC_
-#define _LINUX_IRQ_DAVINCI_CP_INTC_
-
-#include <linux/ioport.h>
-
-/**
- * struct davinci_cp_intc_config - configuration data for davinci-cp-intc
- *                                 driver.
- *
- * @reg: register range to map
- * @num_irqs: number of HW interrupts supported by the controller
- */
-struct davinci_cp_intc_config {
-	struct resource reg;
-	unsigned int num_irqs;
-};
-
-int davinci_cp_intc_init(const struct davinci_cp_intc_config *config);
-
-#endif /* _LINUX_IRQ_DAVINCI_CP_INTC_ */
-- 
2.45.2



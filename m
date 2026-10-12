Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BADCA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNojFJwmE0oVprdqqjx/OIelZ/6m6PVyF1/QNYvXH3o=; b=xtiHEFEuZndPt1ZP+LeMPOH2YI
	twv+MfqR0c9nsDT+05LbOYfdiyQQJ43Rc4m6JOPFC/tN7cYdHaimsI058TYsbTgUW0nHy1OiEs33p
	WdGfkGbseW2rRJ5nF3UrSDSQwzkjhZ3WDo0LqtP/cFFlhljDvaQwYKxflwHKKFPLjuNqshEXTalCY
	/CVpAOOuBKaH575Y6qwMT3kcFtHde8ycScg888aK4w2OWNPiRlKIBRujrVKObnODOdOPOPssm8qGk
	b/ut3bmCbYQ2+XpcCbPKH5vhXZVEY0YYa0yPsFVZp0pljcmGR11sSV++5kf7qz7Tkm1V20A7Godt9
	Lss0rDrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCyU-0000000AAXh-0M8j;
	Mon, 12 Oct 2026 10:09:42 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCyP-0000000AAUu-0LPI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:09:39 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48af27fe287so1448537f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 03:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799775; x=1792404575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNojFJwmE0oVprdqqjx/OIelZ/6m6PVyF1/QNYvXH3o=;
        b=RusOWCMeHJxHTw5vhJw6YXgvpWhPE13+1HCUgUWISpcPRwghQNN1Rwy2791huR1WtH
         8HSP+HGPzgb8oLmq02lHmAR9N0EBH9M0Nw/Pg2D6oJEMW9ZYx2sGiqUUTsS2vle8zSA/
         wtYMTgA8eZjR4VXsHYOQF8thlBomqFkG4afht0yWlc9eAY7nas7I+GxPZ5xhlaZjF2tX
         paQXszyNc+s64YTghIuYh0YrfT4/l3i/Q+VcSH7hEkmunkESB/cSd8VABrBl4M5AdAIS
         i1LeL12Klq5HWxfZqyP+eLNzV5UsFjfRJFjFSUl15Qxoim8zNGdks8oxeUYBmLYB2NyN
         Aqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799775; x=1792404575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNojFJwmE0oVprdqqjx/OIelZ/6m6PVyF1/QNYvXH3o=;
        b=uAyPWzoPcn4S5iVRkVEQY26p6AF04jCspFBOSTsebqSXkn6ykcLJ7BtfyL7rFtG2qY
         4GWHfzabwiC93kUc3oxdTE6NDMQKqCWzhDNmbCpxqMVM266x5VETRWg2kDTlcLi98wUJ
         A+TYrrxZHNb0+r2CK3qmm8Oxwy7XplznMCgc+UCV+d/tsV5pspA2l2NcryUPCaXBq39g
         opSyWnmGiJoe7rxQLHGSe7eyvc4+nBM/zwlxVqAvIF1abHkwts6LPi89YkQakSP8dby+
         jgBWgbgkvXeC+7JYt79ZvZmp5SqR83+0ncWIfLrRLEXa6HV5AImAe1+t1cJkMaouhsnK
         9z7g==
X-Forwarded-Encrypted: i=1; AKwUvBwlewHIVMxKZrbsf6YilZHDM3+FA9L0nK4g7QEFgzRotuCRlgCPzsYhRBxSpmF5rqG+3z8FVso/2zguwudxznPn@lists.infradead.org
X-Gm-Message-State: AFq9FYIPXWM7gmpBr7H0crH/xaZBDSGII2k0kZaQCDoJ6yemWXccoapE
	GdRPc2j2Z4v7BNhGO0RfoOPUiz6hsDBT4iSPA2vwBgE/5q+vshrMDPMAJXMBo1P0tlikuQ==
X-Gm-Gg: AYBFou0KDb9i6r1wRcAxFqdyKwAmn6IWDr+39meqUtaj5E5cN8wRsMUDmjCRdWCeXWA
	fmQMvZ94BlONTpbTgaq21SYOoyD/GOpdP0v+z+aOjFHqJ5Ou6DaCeclvtDggVLGHdlOh2DBL67P
	587fR+W9ryGQVoY6Gt81iwGr70lhiGkfhE8v08/GXoE9tVsnC1WhyazvjBHo7veFW+FL0Yc9jMc
	j3UgB+9A1BuWRP3VmXUxxCqlWodmr+nB37L8TwxMzU9tKh3Q219v5sOFo5OPNhVWmAJ+yvweshD
	0K+I2J/t22QyB+HzwKLZS6yysxBU/QsY9ebPZs5YgHJxUKzGxsD2x5AKXh9IBc5HnqsatEANS7A
	mrp5+e3IOuBFCPl5DEyUzHb+aK6xT8eB9H7S0p/EXpIEVPLo0V2mvTq8WlT6iFIeEKWJRWS1xX3
	qClodAXRKf20VllXQrdYaR6D4QeYTbUGJaXgdqwI8B4WjQypVRQPcsLbnibzDbL4Q30roUKxn/m
	b6G0UBtEeGr/PKq4v409VV0g522fmC9
X-Received: by 2002:a05:600c:3f0c:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a18e498471mr190194615e9.20.1791799775134;
        Mon, 12 Oct 2026 03:09:35 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:34 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 04/11] pinctrl: sunxi: add Allwinner B288 pin controller driver
Date: Mon, 12 Oct 2026 11:08:09 +0100
Message-ID: <20261012100816.331033-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_030937_611508_0257B56E 
X-CRM114-Status: GOOD (  19.34  )
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

80 pins across ports B, C, D, F and G; the mux values come from the DT.
Port C has no external interrupts. PH0 is BSP FPGA-only and omitted.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/Kconfig              | 10 +++++
 drivers/pinctrl/sunxi/Makefile             |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c | 49 ++++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index dc62eba96348..a08186133090 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -56,6 +56,16 @@ config PINCTRL_SUN8I_A23_R
 	default MACH_SUN8I
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN8I_B288
+	bool "Support for the Allwinner B288 PIO"
+	default MACH_SUN8I
+	select PINCTRL_SUNXI
+	help
+	  Say Y here to enable pin controller and GPIO support for the
+	  Allwinner B288 (sun8iw10p1) SoC, as used in e-book readers such
+	  as the PocketBook Verse. This covers ports B, C, D, F and G,
+	  including the four banks of external interrupt capable pins.
+
 config PINCTRL_SUN8I_H3
 	bool "Support for the Allwinner H3 PIO"
 	default MACH_SUN8I
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index 951b3f1e4b4f..5129c0f19f3e 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_PINCTRL_SUN50I_A100)	+= pinctrl-sun50i-a100.o
 obj-$(CONFIG_PINCTRL_SUN50I_A100_R)	+= pinctrl-sun50i-a100-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_A83T)	+= pinctrl-sun8i-a83t.o
 obj-$(CONFIG_PINCTRL_SUN8I_A83T_R)	+= pinctrl-sun8i-a83t-r.o
+obj-$(CONFIG_PINCTRL_SUN8I_B288)	+= pinctrl-sun8i-b288.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3)		+= pinctrl-sun8i-h3.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3_R)	+= pinctrl-sun8i-h3-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_V3S)		+= pinctrl-sun8i-v3s.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
new file mode 100644
index 000000000000..f973c2b3f2eb
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Allwinner B288 (sun8iw10p1) SoC pinctrl driver.
+ *
+ * Bank sizes and the interrupt mux derived from Allwinner's BSP driver
+ * pinctrl-sun8iw10p1.c, which is:
+ * Copyright (C) 2014 Jackie Hwang <huangshr@allwinnertech.com>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-sunxi.h"
+
+/* PH0 exists only on the BSP's FPGA platform and is omitted. */
+static const u8 b288_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG */
+	{  0, 17, 15, 29,  0,  7, 12 };
+
+static const u8 b288_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG */
+	{  0,  6,  0,  6,  0,  6,  6 };
+
+static struct sunxi_pinctrl_desc b288_pinctrl_data = {
+	.irq_banks	= 4,
+};
+
+static int b288_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_dt_table_init(pdev, b288_nr_bank_pins,
+					   b288_irq_bank_muxes,
+					   &b288_pinctrl_data, 0);
+}
+
+static const struct of_device_id b288_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun8i-b288-pinctrl", },
+	{}
+};
+
+static struct platform_driver b288_pinctrl_driver = {
+	.probe	= b288_pinctrl_probe,
+	.driver	= {
+		.name		= "sun8i-b288-pinctrl",
+		.of_match_table	= b288_pinctrl_match,
+	},
+};
+builtin_platform_driver(b288_pinctrl_driver);
-- 
2.52.0



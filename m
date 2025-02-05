Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3142CC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgfFrjRxyOW1xOgdcC7mwiMGS+SjeOrC7s5Z2O3ZWyY=; b=Wz9uRcGPgG/wLl4Ja7PvrN11M7
	ouuSGkzaz5mwbFGvCd0vKvssSLFdbYsgE09UOpf8Y2AyIZ0L//bIHv1BHfZH7BLJrCpM7wIAYSMAQ
	tUM83CfoNVWHuPHw027ROdAnKkW+ivdFuDBeQ6Y4DXHD/5Oh7mF6OFj8fFeBAAXWWk4r43ekynNHD
	WKsNxsb71616TJ/hXFVH/A1RePviY5+RuR8vwVkwnKL5OC/ePNrCqCAbOJMtJxUiHZFOdiASlWHsg
	FqSVVj0U4hzvULqGJrRz6ZYhh87lviYkZECrIqUTK6+9M7zd6OcFz8tLZ84m4TZF3cU5S1UqhQLXl
	+PY/ZOqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tff0F-00000003Jfl-09FZ;
	Wed, 05 Feb 2025 12:59:39 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfetO-00000003HoX-02eJ;
	Wed, 05 Feb 2025 12:52:35 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5dce3763140so521248a12.3;
        Wed, 05 Feb 2025 04:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759952; x=1739364752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgfFrjRxyOW1xOgdcC7mwiMGS+SjeOrC7s5Z2O3ZWyY=;
        b=dEqJ1rtT3hTGstlwLMx0SSFQECbTFyUInca5pl6FMnEJ5pThvKk/IP3l79YTXR8FZ2
         3btazh3rxDpbatbmFdVzGx9e2NdECyUO+Pcs1qURoIY/bMBHfv0+t1U031sNBn2+xVWQ
         COsPxTpyJ/2AEZOGo05tIxISSd/cia/C55Oc7ugjJ+vV7UlUXPE8TI18w/qa+8L7UJ7K
         4TCQxMjA3qcCYbjnGMh/7cQvgLEKYIHnP47yxe/4vhgBESulWSZzqAHCXsZEwAt+QcYO
         0lZlAWUMlDrAVqQyMkaoYe91QsBWyeZxJhmqzEXeahkUkLsL4KQ+2RzYariev8yBmlnW
         otuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759952; x=1739364752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgfFrjRxyOW1xOgdcC7mwiMGS+SjeOrC7s5Z2O3ZWyY=;
        b=By5jx8L/e94wePAHfX1ziNE7fY8eXgEBUhWWclqQHY3mn7yrqUSBB3zQUQows6O8+q
         rZ3vztMg02rR0IkcwBQyU+/kC1El93PYyMdGqlRkZjMYpz/IgtKF9GLTczwYCGvw88jE
         My/Eevr0nXm9ONdUpVjkOJp12VcnAXd1kBzi0oeUH3W+3VR+bXMbD9MadGXT5NhlP7iD
         2FwGiw4m5UAWuUXimPPBeDu7H6PQWkosvCAS8EvMnkAF1BrerMCA64exOfkk9oVZHUuL
         7IsBT6mEHMoG8KPayvBRjKNDExYHRbK3AznCupReU0y598nFGFA9sdRm2XesZI/EAHFs
         28Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUN4ZX41Op8NE2UWDyq1MHn7v3z/jnURG4yH0356t9MjMCW/lhclP5eK/xXZP7bKr1908BbThHLDzXN+4M=@lists.infradead.org, AJvYcCW6ru4SywUSeZ9cOs7fySOdEEFUbw7I5ZeVcUgDH21ma+dVh0YN2Pp+KrFzeMbhAwsvgYL9W7yd3/xC@lists.infradead.org, AJvYcCWccwvVYJsEHL6NEblpUu3LdHH7CFphBKmBDy5wSdBf4DlHlqCU/jGuN5jKuygeww+NEMkH244fXypYMCKS04b8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+2VonQmKdTwxAe7pNHuLUQdTjaqB2YP5kBIfi/IqTIlzpxnDb
	5In3t1FT1tkVWrdqgmlhojeaUwF0Fg5SVQEDiSlVHhwehRhpZOtH
X-Gm-Gg: ASbGncvo15l7aYZIy6cJL8YQ6OkZQeDJArseG0IcbiGGjI0yV/EY/YPli/QhnZFRj4b
	pe1zt7StwcM3eEw5qiODLZck+VY/70P+o0dixozAxCWsWdF3kza6s9zmUwW0Ugyvyry+mu+Hx/Y
	1Vp2Ufo+lBt+Tvj/SagTvplfjdCJeoL5w7vEjht4gyBeZlu5tbADufFpeYq/h1kfl39IOelKJGi
	emUJ2CyTauWkIzstHFlMxTZfTB/5SyGv/i+NMVG8CfcexDTD5Yad9WPWdQZv7nCvO5xDes7+bW9
	XOgcqXWJ9Zaeb+pv0g+janeytavll/4Y5jg8Qa+ivFDw/Q==
X-Google-Smtp-Source: AGHT+IEAbQlJM9YpeCWJhaXrMd8JjdEQmk1PIGdg1MxSU0j0zzL77t1J5QeVhoIykZ9fWSW5KttwGw==
X-Received: by 2002:a05:6402:350c:b0:5d0:b51c:8479 with SMTP id 4fb4d7f45d1cf-5dcdb7179ccmr3428449a12.10.1738759951997;
        Wed, 05 Feb 2025 04:52:31 -0800 (PST)
Received: from localhost.localdomain (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724055e5sm11559997a12.45.2025.02.05.04.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:52:31 -0800 (PST)
From: Andras Szemzo <szemzo.andras@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 02/10] pinctrl: sunxi: add driver for Allwinner V853
Date: Wed,  5 Feb 2025 13:52:17 +0100
Message-Id: <20250205125225.1152849-3-szemzo.andras@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250205125225.1152849-1-szemzo.andras@gmail.com>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_045234_048220_504690AE 
X-CRM114-Status: GOOD (  18.15  )
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

The V853 family has multiple package variants, from BGA to QFN88.
The latter has co-packaged DRAM and fewer pins, and less features (pin muxes).
All family members can be supported by a single driver, as the available pins
with allowed muxes is the same across the devices.

This new pinctrl driver depends on the new sunxi device-tree based mux support
patch series [1].

[1]: https://lore.kernel.org/linux-sunxi/20241111005750.13071-1-andre.przywara@arm.com/T/

Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
---
 drivers/pinctrl/sunxi/Kconfig              |  5 ++
 drivers/pinctrl/sunxi/Makefile             |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c | 53 ++++++++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index a78fdbbdfc0c..fac9c61039e2 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -81,6 +81,11 @@ config PINCTRL_SUN9I_A80_R
 	default MACH_SUN9I
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN8I_V853
+	bool "Support for the Allwinner V853/V851S/V851SE PIO"
+	default MACH_SUN8I
+	select PINCTRL_SUNXI
+
 config PINCTRL_SUN20I_D1
 	bool "Support for the Allwinner D1 PIO"
 	default MACH_SUN8I || (RISCV && ARCH_SUNXI)
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index 2ff5a55927ad..8937b56b2ef4 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_PINCTRL_SUN8I_A83T_R)	+= pinctrl-sun8i-a83t-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3)		+= pinctrl-sun8i-h3.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3_R)	+= pinctrl-sun8i-h3-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_V3S)		+= pinctrl-sun8i-v3s.o
+obj-$(CONFIG_PINCTRL_SUN8I_V853)	+= pinctrl-sun8i-v853.o
 obj-$(CONFIG_PINCTRL_SUN20I_D1)		+= pinctrl-sun20i-d1.o
 obj-$(CONFIG_PINCTRL_SUN50I_H5)		+= pinctrl-sun50i-h5.o
 obj-$(CONFIG_PINCTRL_SUN50I_H6)		+= pinctrl-sun50i-h6.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c
new file mode 100644
index 000000000000..fb2112ee12d0
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Allwinner V853 SoC pinctrl driver.
+ *
+ * Copyright (c) 2025 Andras Szemzo <szemzo.andras@gmail.com>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-sunxi.h"
+
+static const u8 v853_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  */
+	{ 22,  0, 12, 23, 18,  7,  8, 16,  5 };
+
+static const unsigned int v853_irq_bank_map[] = { 0, 2, 3, 4, 5, 6, 7, 8 };
+
+static const u8 v853_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG  PH  PI */
+	{ 14,  0, 14, 14, 14, 14, 14, 14, 14 };
+
+static struct sunxi_pinctrl_desc v853_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(v853_irq_bank_map),
+	.irq_bank_map = v853_irq_bank_map,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+};
+
+static int v853_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_dt_table_init(pdev, v853_nr_bank_pins,
+					   v853_irq_bank_muxes,
+					   &v853_pinctrl_data,
+					   SUNXI_PINCTRL_NEW_REG_LAYOUT |
+					   SUNXI_PINCTRL_ELEVEN_BANKS);
+}
+
+static const struct of_device_id v853_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun8i-v853-pinctrl", },
+	{}
+};
+
+static struct platform_driver v853_pinctrl_driver = {
+	.probe	= v853_pinctrl_probe,
+	.driver	= {
+		.name		= "sun8i-v853-pinctrl",
+		.of_match_table	= v853_pinctrl_match,
+	},
+};
+builtin_platform_driver(v853_pinctrl_driver);
-- 
2.39.5



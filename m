Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B4EC98332
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 15:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rs4mPvhdimrxqSm9i6pYQocUZNbH6k7UKi/I3AiX7uM=; b=uFyTlwz9vgn8aKjYk2klb8wqgt
	9IeV0weI6Rjhr/WcnzEt0AxMs1hzoqtkNjOTrXBpV/EB4xaaKYDycxjjzKOX3+W2pFSdULHLohqEa
	1J83003RSMXYDeTcDnt1FSkM96zlwhzcgqI1ctOWGVycXQrC75GS9dsBvzZM1tNaoTqiT7p9GUCOt
	ZyNPauyxdTzr1IAT9q7KiWQBR3TTJkCQKBUT5vR0GU8dEnnhtLr29KyS8f6iai+HZJ84rdQdCZ6Fg
	0Gq/+HbSkaELAhbagF/TU58A7ZsHckAZkMTjzFHFv4cDu0/1Vl8ri04JAA+rJ7LJFvcEtB2LqYkSG
	HgJIuGtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqY1-0000000GUmj-2fBd;
	Sun, 27 Sep 2026 15:12:13 +0000
Received: from mail-wr2-x0c.google.com ([2a00:1450:4864:30::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqXz-0000000GUl9-1hvm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 15:12:12 +0000
Received: by mail-wr2-x0c.google.com with SMTP id ffacd0b85a97d-482f6350f91so1274854f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 08:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521929; x=1791126729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rs4mPvhdimrxqSm9i6pYQocUZNbH6k7UKi/I3AiX7uM=;
        b=d8v1JsZaNPns5DJIjWwJWuNPnozsJGHT3f0JJR0eKC/VtXo46JMEvqBgdSCIga21O6
         752S0ninFD7Zi8WWEVGviWI6dBDDS4qMVfA3YcD5qNxSVZidAd2KAbdTr8yrW21+p7e3
         yF95IzklUpGR12Lq+lpD4LYE1D0nVgXNxiF2uM9bE4X29SI1lN8j4mGgmE7HR9q/SIBD
         j0jp0SUBhqIAKPhlOlFb0BUweNeTzAyyHFN/0O9QgZ/zIOJks6Qwa10MxpIDpREAwHzz
         C6dEQ/4Tksfe8JGdpPBXutr66avJ5fEhsVyHuAXeMtPNkwC2150Z7yit7ZLt8eEXPGnw
         I9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521929; x=1791126729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rs4mPvhdimrxqSm9i6pYQocUZNbH6k7UKi/I3AiX7uM=;
        b=hTJsihfc3kOeoVyBC4uVZhj7ihOFoXyryk/ju43ed5BrWufjaJr+7hXL5r6DQC6WAL
         BTOsCDALe3cJEZVN1iUf4KbZX3+JIqyCArN0yemdxP20K+13BhX3ajYpxD/ryIHa4nji
         WndBOhIndl2Kk2robPdWhrZLDHkSHSaYK8W0/xaaN9cieiGQGsHVEY1Uu/Rt1N1reqMo
         MZHb3zRSshetAGiXzcsqQFV0FzITeopmKsetj49EI9mYNHaCZJNeRmd9uR1S5hQgSQqd
         3TyC0Xq61VbEl/AOC9zQYBlXsbDH+iguHVWL7QfMXImRHmxUDfU0TN93hKbAUNBg69xI
         s8jg==
X-Forwarded-Encrypted: i=1; AKwUvBxSJOGsyDFxtbjC8fdiP0E7cLG0ec8WzLbjjr2A1UvpAGebz2MefWi3djrRBE+lNdSHgef69o3ibt1c1+4TF/eQ@lists.infradead.org
X-Gm-Message-State: AFq9FYKB28C/HA2l31hGuGLMNSG6yrIs9VXwIq83hF6GzSKAwmyogNU3
	n5rlUu+mHWeF+tsYQNwqg+WWvMmeYQKxVMudFEJJc66lqxZBqBAc1CT3
X-Gm-Gg: AYBFou1wfURbCfgl1sTVcrmKoB4iN+13kc1UgWRBngpGfUYsPstUsDRRlPgCfdCUEfH
	EpftBiphtLwkxJhcne1BOaYfj42JwxTfjQt65jRfBEVFB+hyU4AWgEPcr//kV5NdhEpTUS/y8BU
	7dL36snpBtdgCfcm1dkMn8VCmObf+EDUMYivqgexU3HavMHOR83h7xBsk52XhdZgswUkDB6CG4N
	rJvdJlzYcBmOKYEuTqSY2gLs4Bh+830gzKm64QxpfPlh+bI6Q+YakN7yXcLVQPwwQ/uRcZ+hQ1O
	B6Je2sze4O/DFxDzag5SSOw+wdTtOR1geRzJHvRxqeIB72kw7wkDmXo57bYXqpLzl81JP/6W7aQ
	QAdUJ/1FlnaC/hbbRGv9BFC/kNNAmFIrAuozVkf3S2ZW9gk1peS8vp1+WDzex046v8cVhi/UcMo
	3GJnlrIiTjKfdcxd5+PdkJqck8aCWcFdjsWzWL6qyRicMjwce8MJys5vVf5SetdYF/gBC8zpTzT
	S2As1bwiYJwtAuyC877mVUlay/RTqWg
X-Received: by 2002:a05:6000:4692:b0:488:6ed9:b11d with SMTP id ffacd0b85a97d-48884e0d903mr5840808f8f.52.1790521929459;
        Sun, 27 Sep 2026 08:12:09 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:08 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 04/11] pinctrl: sunxi: add Allwinner B288 pin controller driver
Date: Sun, 27 Sep 2026 16:10:09 +0100
Message-ID: <20260927151016.186493-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_081211_476723_66C25F86 
X-CRM114-Status: GOOD (  19.65  )
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
 drivers/pinctrl/sunxi/Kconfig              | 10 ++++
 drivers/pinctrl/sunxi/Makefile             |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c | 53 ++++++++++++++++++++++
 3 files changed, 64 insertions(+)
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
index 000000000000..98dd4ead4c32
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
@@ -0,0 +1,53 @@
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
+/* Port C has no external interrupts. */
+static const unsigned int b288_irq_bank_map[] = { 1, 3, 5, 6 };
+
+static const u8 b288_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG */
+	{  0,  6,  0,  6,  0,  6,  6 };
+
+static struct sunxi_pinctrl_desc b288_pinctrl_data = {
+	.irq_banks	= ARRAY_SIZE(b288_irq_bank_map),
+	.irq_bank_map	= b288_irq_bank_map,
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
2.53.0



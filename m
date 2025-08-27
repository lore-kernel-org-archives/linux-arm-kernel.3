Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601C2CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NP62jCtJT+dUkA0JE4QBmFqmyFOUOJehxqUTC1++vw=; b=RjNnKQQBZ4vpIHU8kqfV5+ucXm
	Im89NixGm3DPypj8IpFSTYQ/z1EWkgopJRr6u5zYT/o1obk+TPnlvivPMqSXe4BWFhh8JYzeQF8zm
	2gzvjvrQpvV3a1NOQhZnwChflBX9GMOZupRKbLqFTbqUuH0ILGwehf0Hd0Tw5mviMZLnNCJW2PXaA
	7uxrncJaWxLlZMg+eQsBwrRWW6OKljxG38QyXVNs7cMGKSVaE3r+xC1oK4cQepSgpU7i6kXJ70EYi
	KD5Y/slgotlRbNbn8lgZ8C8oUPkWXl1aBliACCQGQrlXp+UPPhSW7qQLupDmvzljiABE0O3cxOZQY
	KXGqvN7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIRV-0000000G1qT-1eTx;
	Wed, 27 Aug 2025 15:52:09 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urFTo-0000000FSIc-08zP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 12:42:21 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3cb9268511bso906523f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 05:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756298538; x=1756903338; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NP62jCtJT+dUkA0JE4QBmFqmyFOUOJehxqUTC1++vw=;
        b=QsRip10lMCbylzg/oTK65JBQg9IAmSzolr8+VVtY70BBuHtnwZFZnI0MJPWRrRwbee
         V64R73nRwtlVY2QHhup9+zKYhhp2tiRaSR23jVMCX0c65WzS3HwAlZGEPo+vnrUMeSMm
         RZOFucGIy/sHiTjmYXjP3WURUEuUl9phqHV5CUyDNUWrBINjpIDZelLRCRlv6H5l2zlw
         wdH3oqvonZmWlFT2lUiEYtXsOh8jeBueux4UYzoLkK9pmIzd8Ts8xuO+UPVOMLBwTQFM
         mb0dEZ0uz8ABYuGOxpU8WA8ykTyONbb11Rh6VFuLVmy5WeAAUwUxpRI/OMUiAsvM5y74
         rziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756298538; x=1756903338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NP62jCtJT+dUkA0JE4QBmFqmyFOUOJehxqUTC1++vw=;
        b=rI0yyiN8epYVf6ZpEngLO4ITgKqvTSqgJP54WgfUNBxo1bVimkQMaylX4sVpE/gxbs
         4JK9+g3KCC/9nxpIkznAKY95LYX0X6Tcb818ogz0xY6CgmrCT6PMyA3gBBIZRvaiRjU6
         3BSVkVIniiWrhyujU5LrY7I7w6G/HA0J39ANm8yHhccCpELEa8CpB+bZlAzE5zrsRjec
         K9A2jj/O6pBoHhWzWZlcJoB6adHIq/4XA41QGAxBazhfnJ8+JLY0dE3HZX8mkSw035lg
         intFsVWDrkQ36tPQD1+0pJaLhJl72ID5IdmcAdis5ttN0g3iS22cmzXBtxwAz1mxA4jH
         cIJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsyQ7rzOU2A8ZnnvI7BcEch8qfwOBNsjBR8+lYYYQi8usNvZn/7XzN8k3LnETb63S6LwEf8BalusdUWbutnI/l@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4ubvjG4OmGFzVrBmbcvfMQ0kDPnoLYtJ7HU/UbFbsA5FUe6th
	HIEr3SQaxrbHwmsABfkMN8+IWTVzfHTSRtUekk2gnZA1LF3HSmiSCgJGcS1QchDuDWw=
X-Gm-Gg: ASbGncuZ+dsM12/B18J5Li/OPKbA8auol4nm9N32bJ2kMu/AdVkAxqA04S0RnVf181v
	Ev9xOKj2hYn2rd4XAW1kem74tuMneQy74vG0wEO0Cd2I55CNAyiYyx23iSmt0YDlMocUHk6MKNg
	vnXJkXFSlVCQ1fKRE8Th8d2xR2DE3Fyl3frqmjAzSi8a5Ejb2bBkIZsmCg2xkuKo+T87vHoaHN0
	ZtJBeGbF66a508K3Z7QV88vbW9N2++Dl9xz7HPN/IRkr5syJQARqU3km0ggsjq5DjvgWuXGKULJ
	+MTHfsU5deYPKz9KulxzE/iykaYhnOVZ4b/wEguH2G/sI8vXS0MmUK7vpvub+qCT8Q0Yj59gVSt
	5UrAVjjHlzHBPiUJ1CM95ytak0JuNjy4HSFNXqkAGJRlLZo+l80jJ2tqxhgJGC2e//7xGM/9KMx
	MXYQ==
X-Google-Smtp-Source: AGHT+IGCykOrz3Ls5FsENqVCJUHPX3kaNYmIuKO1r4y9r/6R/x/q73zW/EfEZWxqDVlpSEdJd3mILg==
X-Received: by 2002:a05:6000:2411:b0:3c7:c594:232a with SMTP id ffacd0b85a97d-3c7c59427c6mr10897000f8f.19.1756298538239;
        Wed, 27 Aug 2025 05:42:18 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cbab3ead0dsm6439420f8f.29.2025.08.27.05.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:42:17 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 27 Aug 2025 12:42:13 +0000
Subject: [PATCH v2 3/5] clk: samsung: add Exynos ACPM clock driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-acpm-clk-v2-3-de5c86b49b64@linaro.org>
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
In-Reply-To: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756298535; l=7253;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=CjPSf0JcvfE5W5RPnVdJxx5tBeiX99q+c7xebVDWfmk=;
 b=0Ba+Ymd/OUWS8Zi93fBaCsEVXNgbYq78bO0mwgK4kg9TlZDI6WFDwGs7+rI9Z0K4sI8CHUorN
 CG+HjumlfJhDktCvJuIyjJ+H2cH4OiKHmSeTNLKVoB3TA8dHZBqJ7ab
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_054220_088303_9BBCBFDB 
X-CRM114-Status: GOOD (  26.37  )
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

Add the Exynos ACPM clock driver. It provides support for clocks that
are controlled by firmware that implements the ACPM interface.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/clk/samsung/Kconfig            |  10 +++
 drivers/clk/samsung/Makefile           |   1 +
 drivers/clk/samsung/clk-acpm.c         | 148 +++++++++++++++++++++++++++++++++
 include/linux/platform_data/clk-acpm.h |  24 ++++++
 4 files changed, 183 insertions(+)

diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index 76a494e95027af26272e30876a87ac293bd56dfa..fe05212d7dd882adde9cd5c656cd0d58d501c42f 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
 	  status of the certains clocks from SoC, but it could also be tied to
 	  other devices as an input clock.
 
+config EXYNOS_ACPM_CLK
+	tristate "Clock driver controlled via ACPM interface"
+	depends on EXYNOS_ACPM_PROTOCOL || COMPILE_TEST
+	help
+	  This driver provides support for clocks that are controlled by
+	  firmware that implements the ACPM interface.
+
+	  This driver uses the ACPM interface to interact with the firmware
+	  providing all the clock controlls.
+
 config TESLA_FSD_COMMON_CLK
 	bool "Tesla FSD clock controller support" if COMPILE_TEST
 	depends on COMMON_CLK_SAMSUNG
diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index b77fe288e4bb484c68d1ff497acc0b83d132ea03..04b63436b12f6f5169575d74f54b105e97bbb052 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos990.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov9.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov920.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-gs101.o
+obj-$(CONFIG_EXYNOS_ACPM_CLK)		+= clk-acpm.o
 obj-$(CONFIG_S3C64XX_COMMON_CLK)	+= clk-s3c64xx.o
 obj-$(CONFIG_S5PV210_COMMON_CLK)	+= clk-s5pv210.o clk-s5pv210-audss.o
 obj-$(CONFIG_TESLA_FSD_COMMON_CLK)	+= clk-fsd.o
diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
new file mode 100644
index 0000000000000000000000000000000000000000..e0db63ba1e07efdae53e340bc24c3576b2a5fd04
--- /dev/null
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Samsung Exynos ACPM protocol based clock driver.
+ *
+ * Copyright 2025 Linaro Ltd.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/firmware/samsung/exynos-acpm-protocol.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_data/clk-acpm.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+struct acpm_clk {
+	u32 id;
+	struct clk_hw hw;
+	unsigned int mbox_chan_id;
+	const struct acpm_handle *handle;
+};
+
+#define to_acpm_clk(clk) container_of(clk, struct acpm_clk, hw)
+
+static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct acpm_clk *clk = to_acpm_clk(hw);
+
+	return clk->handle->ops.dvfs_ops.get_rate(clk->handle,
+					clk->mbox_chan_id, clk->id, 0);
+}
+
+static int acpm_clk_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
+{
+	/*
+	 * We can't figure out what rate it will be, so just return the
+	 * rate back to the caller. acpm_clk_recalc_rate() will be called
+	 * after the rate is set and we'll know what rate the clock is
+	 * running at then.
+	 */
+	return 0;
+}
+
+static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+			     unsigned long parent_rate)
+{
+	struct acpm_clk *clk = to_acpm_clk(hw);
+
+	return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
+					clk->mbox_chan_id, clk->id, rate);
+}
+
+static const struct clk_ops acpm_clk_ops = {
+	.recalc_rate = acpm_clk_recalc_rate,
+	.determine_rate = acpm_clk_determine_rate,
+	.set_rate = acpm_clk_set_rate,
+};
+
+static int acpm_clk_ops_init(struct device *dev, struct acpm_clk *aclk,
+			     const char *name)
+{
+	struct clk_init_data init = {};
+
+	init.name = name;
+	init.ops = &acpm_clk_ops;
+	aclk->hw.init = &init;
+
+	return devm_clk_hw_register(dev, &aclk->hw);
+}
+
+static int acpm_clk_probe(struct platform_device *pdev)
+{
+	const struct acpm_clk_platform_data *pdata;
+	const struct acpm_handle *acpm_handle;
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **hws;
+	struct device *dev = &pdev->dev;
+	struct acpm_clk *aclks;
+	unsigned int mbox_chan_id;
+	int i, err, count;
+
+	pdata = dev_get_platdata(&pdev->dev);
+	if (!pdata)
+		return dev_err_probe(dev, -EINVAL,
+				     "Failed to get platform data.\n");
+
+	acpm_handle = devm_acpm_get_by_node(dev, dev->parent->of_node);
+	if (IS_ERR(acpm_handle))
+		return dev_err_probe(dev, PTR_ERR(acpm_handle),
+				     "Failed to get acpm handle.\n");
+
+	count = pdata->nr_clks;
+	mbox_chan_id = pdata->mbox_chan_id;
+
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, count),
+				GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num = count;
+	hws = clk_data->hws;
+
+	aclks = devm_kcalloc(dev, count, sizeof(*aclks), GFP_KERNEL);
+	if (!aclks)
+		return -ENOMEM;
+
+	for (i = 0; i < count; i++) {
+		const struct acpm_clk_variant *variant = &pdata->clks[i];
+		unsigned int id = variant->id;
+		struct acpm_clk *aclk;
+
+		if (id >= count)
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid ACPM clock ID.\n");
+
+		aclk = &aclks[id];
+		aclk->id = id;
+		aclk->handle = acpm_handle;
+		aclk->mbox_chan_id = mbox_chan_id;
+
+		hws[id] = &aclk->hw;
+
+		err = acpm_clk_ops_init(dev, aclk, variant->name);
+		if (err)
+			return dev_err_probe(dev, err,
+					     "Failed to register clock.\n");
+	}
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					   clk_data);
+}
+
+static struct platform_driver acpm_clk_driver = {
+	.driver	= {
+		.name = "acpm-clocks",
+	},
+	.probe = acpm_clk_probe,
+};
+module_platform_driver(acpm_clk_driver);
+
+MODULE_ALIAS("platform:acpm-clocks");
+MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
+MODULE_DESCRIPTION("Samsung Exynos ACPM clock driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/platform_data/clk-acpm.h b/include/linux/platform_data/clk-acpm.h
new file mode 100644
index 0000000000000000000000000000000000000000..8327435fbb603472346b14b81160ffe98a79486b
--- /dev/null
+++ b/include/linux/platform_data/clk-acpm.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Samsung Exynos Alive Clock and Power Manager (ACPM) clock driver.
+ *
+ * Copyright 2025 Linaro Ltd.
+ */
+
+#ifndef __LINUX_PLATFORM_DATA_CLK_ACPM_H__
+#define __LINUX_PLATFORM_DATA_CLK_ACPM_H__
+
+#include <linux/types.h>
+
+struct acpm_clk_variant {
+	unsigned int id;
+	const char *name;
+};
+
+struct acpm_clk_platform_data {
+	const struct acpm_clk_variant *clks;
+	unsigned int nr_clks;
+	unsigned int mbox_chan_id;
+};
+
+#endif /* __LINUX_PLATFORM_DATA_CLK_ACPM_H__ */

-- 
2.51.0.261.g7ce5a0a67e-goog



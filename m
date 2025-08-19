Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F68ECA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5BohF4EtiUuYNnWKjjEQo5YJp9OK645hWvc5QEpxWs4=; b=380nGJK7oBogaMAJ9cz//7oY1z
	EmiBzDkawshBFw3m7nN6we+4i57Oew2HLMQLg3exeHplyAfmwiYH848pU0vS0Ua+1gCNCqTrqpUHv
	JIyP5ZJXksxmVszni8tkqtKrAWe99bu3CBtPKFGH3n+g3mjbXsIUvhERqyeLYgDPPgaPVhOPY1NFh
	iENUm/TyjB0g+IO6nErG2IMWE+tDOPDoPzhzBIHBnXwZAAYxr4MumddnltXYwv78dFq02S/hi1GqU
	KXo0k2CdCVPzUzpcdpqkgdkMg+iiFgbbOAwrZS7E+GjFxpNOv0kNaICNos9K0u7WYt3NlwCyxPacD
	9lqUrAAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoN67-0000000Aign-2vd8;
	Tue, 19 Aug 2025 14:13:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKmr-0000000AKLz-0UTe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:45:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45a1b0becf5so28284295e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 04:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755603956; x=1756208756; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BohF4EtiUuYNnWKjjEQo5YJp9OK645hWvc5QEpxWs4=;
        b=tW6xSutXwHvS8ckkGEDq0mV1nCeKDwCsKayYQhzKc9dWBqB4B23p41ZlfPkUVzpyRj
         QuRbh3HN/+9yYZ0gugrMhSw2GVXLWc77D7hngSMlo0Nh5A5w7veblNZiFNt7UiWHOfJm
         S9PZgHiUJgYOIYu2VMv9UZBjsYztOal/04CD//NG+7J+44yhQl4LkIxOUyME10nmjPFo
         8PZ7WR/FMix/Zjfn/ip5oWfSFlbWh0eMugS/worAYRMvLS3Dif2ImiFdRa3nk+BhPRLG
         hfnwdSbMnfcY1drSqOKIvcVSneTrZDjcwqPVGWMGmgHpt4wcSFFCcAdPR0MUa5wPL72X
         6iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603956; x=1756208756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BohF4EtiUuYNnWKjjEQo5YJp9OK645hWvc5QEpxWs4=;
        b=tIpbInPJZYsrpZ+C1Ons97REcUXnjZrn6T3cDm9I6JlcMSCDKDOVYeVaigvvHaagzG
         Y12AY4LWHbvVvLRXSjtIPUa1FhYZWYVmCMvItjShjTPF/1yV70LTnCeBSJNKk1QSHmZ8
         OlnbBJPUtTfQDBDtjM13UYXFbrLDSaa4GLXXMpVayAVgGESvYTuRpNsjboJA2I1sDvkW
         LFRD7+eq3hQKWv8YK0AfXOWjJZBf8rRQHFtOnXkDneTABKIfE5Nm9tb11pSy2ne0R5Zt
         UCslAr2zQlT8YFw2KAEVp3wnqN71/KfJhdb832FpQysGJvJCJcVrogC4WNjnexYR2VfQ
         KMSw==
X-Forwarded-Encrypted: i=1; AJvYcCWMxiI9VMSXA/V9TInla5s2ddU0yc8uRVNtI6SvGK/W0pwpF53TmxkpECHFa4zmqcmhPuDLQQG6Qu72SegAywjE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1J0o6xbYByoTEmcYbJj/sWVDx85MlEbC4HTUQIyw6Lc77ag9R
	N6WignozLHeIpMITTOdQ3Yah6Jk6xhAl6nfTkLOdDaMWXsnDmDz0+MR+ojhZBgRpB1s=
X-Gm-Gg: ASbGncvbcD8MbtcQrtCin11DSPhvGCuoeYoXfJTXo1/f8x3lFHnni54TlndS8xagazU
	KI/eJszSBy8IZacCqTMh5bEEJezA9v4jifK9JdYKU6qOerY6ViZVoW5eAoMfU2doOTjM36wPbrd
	BhDk7gmzfOTrxxsfUKpXfuvAbpg4OlEkHTbmC8mHyM5Hz7+1DYLJPKTSebpnvFY+xh7Uxib5ikq
	FFHQ1IqXJXZ7VvFeu/FVUBfNpWZ+TPlWYOvbm2sOku9JFRYMxIgmvjWM5N5cR33/YDA+kuzT62r
	zxAqsgi6TTeNK5xuShyvRJPhY4oPFqhMcmKyYvLKz4pkMadwrvh+4IUy9hL5rx9g39J5bh+QCBt
	I1IJ8gvUTlxx4p64JY078WvPw20MYDDSIGUJVdmw9OKdxuM/ybvlCr25CndW8Z1Huxg/NypDdJX
	bK6ttWOY84l2KT
X-Google-Smtp-Source: AGHT+IHiPrZjgMCEzLKrHz6FpbpVq1VUkxFTXmy6o02XM5DHXgqXcijADKLMgzV7WnkvIgeHncjraQ==
X-Received: by 2002:a05:6000:2004:b0:3a5:2d42:aa25 with SMTP id ffacd0b85a97d-3c0ed1f348bmr1564826f8f.50.1755603955683;
        Tue, 19 Aug 2025 04:45:55 -0700 (PDT)
Received: from ta2.c.googlers.com (245.92.187.35.bc.googleusercontent.com. [35.187.92.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788df7sm3430817f8f.48.2025.08.19.04.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:45:55 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 19 Aug 2025 11:45:38 +0000
Subject: [PATCH 3/3] clk: samsung: add Exynos ACPM clock driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org>
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
In-Reply-To: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755603952; l=7617;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=8q8yoH0OH0fUK6u5BVFDQi4Ifhan8hzBsvGgsfXDGMU=;
 b=jxt0eQAwhd6DT9TsOur1oHjS9c7qn2o8JHVXwh1iXrKemD+TMGRIF/c1A3mQ6S8uUBRB/Gj+w
 JSq9nsCgOR8C9NcNGgFYfkyO5z5ydEhAoZC8DCIZ2Wuhdkgo3JIYJTs
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_044557_191940_107C698A 
X-CRM114-Status: GOOD (  25.28  )
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
 drivers/clk/samsung/Kconfig    |  10 +++
 drivers/clk/samsung/Makefile   |   1 +
 drivers/clk/samsung/clk-acpm.c | 192 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 203 insertions(+)

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
index 0000000000000000000000000000000000000000..e3e648331ad54072876f52a63b11fe259a0b9be2
--- /dev/null
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -0,0 +1,192 @@
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
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#include <dt-bindings/clock/google,gs101.h>
+
+struct acpm_clk {
+	u32 id;
+	struct clk_hw hw;
+	unsigned int acpm_chan_id;
+	const struct acpm_handle *handle;
+};
+
+#define to_acpm_clk(clk) container_of(clk, struct acpm_clk, hw)
+
+struct acpm_clk_variant {
+	unsigned int id;
+	const char *name;
+};
+
+struct acpm_clk_match_data {
+	const struct acpm_clk_variant *clks;
+	unsigned int nr_clks;
+	unsigned int acpm_chan_id;
+};
+
+static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct acpm_clk *clk = to_acpm_clk(hw);
+
+	return clk->handle->ops.dvfs_ops.get_rate(clk->handle,
+					clk->acpm_chan_id, clk->id, 0);
+}
+
+static long acpm_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long *parent_rate)
+{
+	/*
+	 * We can't figure out what rate it will be, so just return the
+	 * rate back to the caller. acpm_clk_recalc_rate() will be called
+	 * after the rate is set and we'll know what rate the clock is
+	 * running at then.
+	 */
+	return rate;
+}
+
+static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+			     unsigned long parent_rate)
+{
+	struct acpm_clk *clk = to_acpm_clk(hw);
+
+	return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
+					clk->acpm_chan_id, clk->id, rate);
+}
+
+static const struct clk_ops acpm_clk_ops = {
+	.recalc_rate = acpm_clk_recalc_rate,
+	.round_rate = acpm_clk_round_rate,
+	.set_rate = acpm_clk_set_rate,
+};
+
+static int __init acpm_clk_ops_init(struct device *dev, struct acpm_clk *aclk,
+				    const char *name)
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
+static int __init acpm_clk_probe(struct platform_device *pdev)
+{
+	const struct acpm_clk_match_data *match_data;
+	const struct acpm_handle *acpm_handle;
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **hws;
+	struct device *dev = &pdev->dev;
+	struct acpm_clk *aclks;
+	unsigned int acpm_chan_id;
+	int i, err, count;
+
+	acpm_handle = devm_acpm_get_by_node(dev, dev->parent->of_node);
+	if (IS_ERR(acpm_handle))
+		return dev_err_probe(dev, PTR_ERR(acpm_handle),
+				     "Failed to get acpm handle.\n");
+
+	match_data = of_device_get_match_data(dev);
+	if (!match_data)
+		return dev_err_probe(dev, -EINVAL,
+				     "Failed to get match data.\n");
+
+	count = match_data->nr_clks;
+	acpm_chan_id = match_data->acpm_chan_id;
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
+		const struct acpm_clk_variant *variant = &match_data->clks[i];
+		struct acpm_clk *aclk = &aclks[i];
+
+		hws[i] = &aclk->hw;
+
+		aclk->id = variant->id;
+		aclk->handle = acpm_handle;
+		aclk->acpm_chan_id = acpm_chan_id;
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
+#define ACPM_CLK(_id, cname)					\
+	{							\
+		.id		= _id,				\
+		.name		= cname,			\
+	}
+
+static const struct acpm_clk_variant gs101_acpm_clks[] __initconst = {
+	ACPM_CLK(CLK_ACPM_DVFS_MIF, "mif"),
+	ACPM_CLK(CLK_ACPM_DVFS_INT, "int"),
+	ACPM_CLK(CLK_ACPM_DVFS_CPUCL0, "cpucl0"),
+	ACPM_CLK(CLK_ACPM_DVFS_CPUCL1, "cpucl1"),
+	ACPM_CLK(CLK_ACPM_DVFS_CPUCL2, "cpucl2"),
+	ACPM_CLK(CLK_ACPM_DVFS_G3D, "g3d"),
+	ACPM_CLK(CLK_ACPM_DVFS_G3DL2, "g3dl2"),
+	ACPM_CLK(CLK_ACPM_DVFS_TPU, "tpu"),
+	ACPM_CLK(CLK_ACPM_DVFS_INTCAM, "intcam"),
+	ACPM_CLK(CLK_ACPM_DVFS_TNR, "tnr"),
+	ACPM_CLK(CLK_ACPM_DVFS_CAM, "cam"),
+	ACPM_CLK(CLK_ACPM_DVFS_MFC, "mfc"),
+	ACPM_CLK(CLK_ACPM_DVFS_DISP, "disp"),
+	ACPM_CLK(CLK_ACPM_DVFS_BO, "b0"),
+};
+
+static const struct acpm_clk_match_data acpm_clk_gs101 __initconst = {
+	.clks = gs101_acpm_clks,
+	.nr_clks = ARRAY_SIZE(gs101_acpm_clks),
+	.acpm_chan_id = 0,
+};
+
+static const struct of_device_id acpm_clk_ids[] __initconst = {
+	{
+		.compatible = "google,gs101-acpm-dvfs-clocks",
+		.data =  &acpm_clk_gs101,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, acpm_clk_ids);
+
+static struct platform_driver acpm_clk_driver __refdata = {
+	.driver	= {
+		.name = "acpm-clocks",
+		.of_match_table = acpm_clk_ids,
+	},
+	.probe = acpm_clk_probe,
+};
+module_platform_driver(acpm_clk_driver);
+
+MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
+MODULE_DESCRIPTION("Samsung Exynos ACPM clock driver");
+MODULE_LICENSE("GPL");

-- 
2.51.0.rc1.167.g924127e9c0-goog



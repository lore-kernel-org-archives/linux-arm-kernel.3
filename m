Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EBACA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 18:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DhFOFHz0h/WoJvYuWdsxmXTZqYVyhlXjR9PRjd8hmc=; b=xgL70hxKNhst+FfKUVQYWNVa8h
	IVJOopPcC0bwu0qLjYwJ2T6/w6GKXFyDui1pkidbm47ktMTwt+8cKHqxcJx6LCO2GxZxtlPfOlhLD
	l0ayXoDX6njm5w3MOXmH7mMHGO9NE6UzV9GmahqmGgH4dLqgMEuMFRj5Tl0dP9/F0nW8zQJWHwYel
	M9MS9lnk/k+vJ1i+6vCiAr2VZyV4ln7ZdwjyedQzpNJK2Qwj3+Vqr8VEGGRRziYenQ/SIWODUM3sk
	3c4w2uvMua2ydzZvkg3uE7acss7kVASCG4Jfcc+Ey/7rMIot2Tp2wuilR0MIRi6Ia71uikEpMFRSA
	4w1euCtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrpf-00000007G0I-3VUG;
	Wed, 03 Sep 2025 18:03:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnyh-00000006f3k-1Aw2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:56:48 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45b89147cfbso32059965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 06:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756907806; x=1757512606; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2DhFOFHz0h/WoJvYuWdsxmXTZqYVyhlXjR9PRjd8hmc=;
        b=THWMGI8fPz7lWpRs/+rtF/g+jxjGDmQNm6kBKwbhf59UeBfzdSOZ/3Co2UyWKEU3A7
         8ejwZRFdS9JjiG/g+zn5F3znOxXQJ3OBsdVqoICO1Kmx0vH0VAkKmjGi5MCAbRss+jCQ
         31aE9ONyURE31ydya+LHXsNZW4+ZJqc4ErhC+7mcCAj6uAMuYdEBf2KS+mGvA/q+lnAX
         NgHuYVTR9xQDEQsXrVAIaq7CyuhRXGebJgNLIhU1NhIZbQs5pNwLZPCZ7NIOyfV5zl2A
         St46Cs5+jL4nJjxFb56GuWmdmtoNdZpyVC9F2s2MSlDHOyti59LNCnskvfCgTEmKMRLs
         8h0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756907806; x=1757512606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DhFOFHz0h/WoJvYuWdsxmXTZqYVyhlXjR9PRjd8hmc=;
        b=VOnlf2NvXe7ob8QiMmDBvfxb34dmka0/7bWzh/VSV0Z7mOqlbwto4R9ZErlzrmv161
         akS40jD7sesSt9+8c+xJgzigI6w3HbMBQGJxy4XZyLebs0iFV1lh0LkiJQNuJOYHRmq9
         EylfOvYcm3aqyUb316qYMGvR2clwDepgkNMF2itxSm6mRCjz5Ts1u6zEO4xb/3UbQNMb
         IDOhAHcR+eFOS2rwIBWWko0qFjlar5zg6DZCglhsPQ+pOua+z03qiLwCLb7Ejsn8hACD
         3vE9MqSYV7nbPIS7GRDTHC0LQy3yf99v58yxceDsgO+pMYmffwWh25PmXUEbuFXVBnyv
         ME6g==
X-Forwarded-Encrypted: i=1; AJvYcCUKv1ZmAN22P+toC1B/wZvvAQ0aEhE2L3jhlo8eH2JzuBP+ghH7LMrWDQc2FO7kRKzHwjcmrUWaR+58dbMWmesQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhf/H/WKIWWdNLkuahcVMcpz8CKUUqGRLQfDarMtPpKpud23d2
	js1V76rGVXPnDn9NRL9B65WfZOAnJ6dyl1JNMc28zKO5w9B30lfuQb/jAdQedRCegRw=
X-Gm-Gg: ASbGncv5FLSz0aGYuGxCOJMeSc1GpL61z2NWT4MfG842PQBfSfrqG+Fh9GVIsyriA5Q
	KWJoY1rP2Q6ZUBigX0DsE/06tVQHH6i8+qzBArgSbZaEH/J29cCFNMUL77cF0RmrFDBuENQePMc
	pTFufx483oAziXTci/Xe1tf00tHxo3dz4TluRRiFCNFhixIwpQd7oyCAxzUiFOb0jPqOXf+MIP/
	kx47S1bBBu+1xfU5iifhQwWn9UyRiZalXunY+Of+icAEwxCkMsM1Fq+po2IQqO6XP4zhOpjGctg
	HNIIl2tnGbS1u/LgqSNBv+dAkhz0qly+kzyAo09aBcuOxb7zDRJzN1eYp4tBq//mjXJNNr0+BGT
	DNqGxAs1SApd46r4SJY6Pdu7uihmgAatw3E0eXYFWY1wi52QUzE8UrYTvbhDL/JsCb+XxlOYgt/
	CT1w==
X-Google-Smtp-Source: AGHT+IEyhCiL5ktj6QTvi8D22BxRnvNrT0TFR8jIAtkM1Xw+jjOyOz5Fh9eZ2GFeGHUXa5FnjJ21NQ==
X-Received: by 2002:a05:600c:4f8f:b0:456:f1e:205c with SMTP id 5b1f17b1804b1-45b85550704mr128247375e9.4.1756907805637;
        Wed, 03 Sep 2025 06:56:45 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87632365sm197257135e9.16.2025.09.03.06.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:56:45 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Sep 2025 13:56:40 +0000
Subject: [PATCH v3 3/5] clk: samsung: add Exynos ACPM clock driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-acpm-clk-v3-3-65ecd42d88c7@linaro.org>
References: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
In-Reply-To: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756907802; l=7939;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=KqqXaXmMUQsdCpJZVRGT6WfJSbl5ckiI5/av635g9bs=;
 b=9vLkq71OeAOD3a5unJd3JpZ9FJbTx9oYJdRYUIZOTH3T3hJqpbbEK3FjNnU3NHKBBIK/QLrtM
 Rfj6Crt3udhCPC91VIy257mL7F5KRwj8tOrkizZRa86OzTnk2YJs4JT
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_065647_328057_755F6D7B 
X-CRM114-Status: GOOD (  26.04  )
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
 drivers/clk/samsung/Kconfig    |  10 ++
 drivers/clk/samsung/Makefile   |   1 +
 drivers/clk/samsung/clk-acpm.c | 203 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 214 insertions(+)

diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8ff95e029c52436e5c7f 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
 	  status of the certains clocks from SoC, but it could also be tied to
 	  other devices as an input clock.
 
+config EXYNOS_ACPM_CLK
+	tristate "Clock driver controlled via ACPM interface"
+	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
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
index 0000000000000000000000000000000000000000..fe24471c41fcaab43b62b552949c26520b98c1e3
--- /dev/null
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Samsung Exynos ACPM protocol based clock driver.
+ *
+ * Copyright 2025 Linaro Ltd.
+ */
+
+#include <dt-bindings/clock/google,gs101-acpm.h>
+#include <linux/array_size.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/firmware/samsung/exynos-acpm-protocol.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+enum acpm_clk_dev_type {
+	GS101_ACPM_CLK_ID,
+};
+
+struct acpm_clk {
+	u32 id;
+	struct clk_hw hw;
+	unsigned int mbox_chan_id;
+	const struct acpm_handle *handle;
+};
+
+struct acpm_clk_variant {
+	unsigned int id;
+	const char *name;
+};
+
+struct acpm_clk_driver_data {
+	const struct acpm_clk_variant *clks;
+	unsigned int nr_clks;
+	unsigned int mbox_chan_id;
+};
+
+#define to_acpm_clk(clk) container_of(clk, struct acpm_clk, hw)
+
+#define ACPM_CLK(_id, cname)					\
+	{							\
+		.id		= _id,				\
+		.name		= cname,			\
+	}
+
+static const struct acpm_clk_variant gs101_acpm_clks[] = {
+	ACPM_CLK(GS101_CLK_ACPM_DVFS_MIF, "mif"),
+	ACPM_CLK(GS101_CLK_ACPM_DVFS_INT, "int"),
+	ACPM_CLK(GS101_CLK_ACPM_DVFS_CPUCL0, "cpucl0"),
+	ACPM_CLK(GS101_CLK_ACPM_DVFS_CPUCL1, "cpucl1"),
+	ACPM_CLK(GS101_CLK_ACPM_DVFS_CPUCL2, "cpucl2"),
+	ACPM_CLK(GS101_CLK_ACPM_DVFS_G3D, "g3d"),
+	ACPM_CLK(GS101_CLK_ACPM_DVFS_G3DL2, "g3dl2"),
+	ACPM_CLK(GS101_CLK_ACPM_DVFS_TPU, "tpu"),
+	ACPM_CLK(GS101_CLK_ACPM_DVFS_INTCAM, "intcam"),
+	ACPM_CLK(GS101_CLK_ACPM_DVFS_TNR, "tnr"),
+	ACPM_CLK(GS101_CLK_ACPM_DVFS_CAM, "cam"),
+	ACPM_CLK(GS101_CLK_ACPM_DVFS_MFC, "mfc"),
+	ACPM_CLK(GS101_CLK_ACPM_DVFS_DISP, "disp"),
+	ACPM_CLK(GS101_CLK_ACPM_DVFS_BO, "b0"),
+};
+
+static const struct acpm_clk_driver_data acpm_clk_gs101  = {
+	.clks = gs101_acpm_clks,
+	.nr_clks = ARRAY_SIZE(gs101_acpm_clks),
+	.mbox_chan_id = 0,
+};
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
+	enum acpm_clk_dev_type type = platform_get_device_id(pdev)->driver_data;
+	const struct acpm_clk_driver_data *drv_data;
+	const struct acpm_handle *acpm_handle;
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **hws;
+	struct device *dev = &pdev->dev;
+	struct acpm_clk *aclks;
+	unsigned int mbox_chan_id;
+	int i, err, count;
+
+	switch (type) {
+	case GS101_ACPM_CLK_ID:
+		drv_data = &acpm_clk_gs101;
+		break;
+	default:
+		return dev_err_probe(dev, -EINVAL, "Invalid device type\n");
+	}
+
+	acpm_handle = devm_acpm_get_by_node(dev, dev->parent->of_node);
+	if (IS_ERR(acpm_handle))
+		return dev_err_probe(dev, PTR_ERR(acpm_handle),
+				     "Failed to get acpm handle.\n");
+
+	count = drv_data->nr_clks;
+	mbox_chan_id = drv_data->mbox_chan_id;
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
+		const struct acpm_clk_variant *variant = &drv_data->clks[i];
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
+static const struct platform_device_id acpm_clk_id[] = {
+	{ "gs101-acpm-clk", GS101_ACPM_CLK_ID },
+	{},
+};
+MODULE_DEVICE_TABLE(platform, acpm_clk_id);
+
+static struct platform_driver acpm_clk_driver = {
+	.driver	= {
+		.name = "acpm-clocks",
+	},
+	.probe = acpm_clk_probe,
+	.id_table = acpm_clk_id,
+};
+module_platform_driver(acpm_clk_driver);
+
+MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
+MODULE_DESCRIPTION("Samsung Exynos ACPM clock driver");
+MODULE_LICENSE("GPL");

-- 
2.51.0.338.gd7d06c2dae-goog



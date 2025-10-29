Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DE5CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3VoDc4JO2kSm8qVM4RA31MFseJ8uanXq2MvOCfPyqg=; b=fIgQR2rwzb9l216eHKBpUBXrYr
	2OTpY/4KrTblxQWPRBHs1IeTewiYNaECn5I78/D20ddcpc5lA4blV+jpd/bjAxnkXrLAgixCXYAlj
	VtLxiK0esdwosJnN4r65shttQyNam3d7uwH5XWY7HbS2OjycZVFzEmmcTTaiRfUWjfMgnVa3sYipn
	083DCECcdwlWG4+A7XUL4+yPkqtAME1/zDiWYyMSni1bj/LzCScTIyTbZINYGSf+4hGofzKGRmCP+
	g2IN4aZnFkErLCxiVgwedp5Ap1ePuIytoFSHpTvx3G/yfGFr/TGMN0JqVGpfgDXUTVIjdGU87N4fS
	ksuKhYnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6f0-00000001SoP-32nG;
	Wed, 29 Oct 2025 13:56:22 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6ep-00000001ShM-05HE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 13:56:12 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b5a8184144dso1139596766b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 06:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746167; x=1762350967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3VoDc4JO2kSm8qVM4RA31MFseJ8uanXq2MvOCfPyqg=;
        b=Nr2QU/fVw/AWeI3SSfjtuUv+FA4Up2BfIZTiT9WJaFarDDEVYHNq8iEFjGgBvLADmZ
         4cJiMeI1dFM6HpbuPN5q2wvjzn+8NCBpEtwm5MR95EJiFeSFjTNvlsDlZNSr2T5vnM/4
         ddeEQ84Ss/QWgdkB+Ipn7Gji2LNYs5yFh0+o9YBfv278Pq5WErUK0fO1FCqyQQRsmhYH
         M2tpj4j3y0hDu+g1Gr06O2QN86EbKx5hhinR1nOPdv/lo6UjqSMspdzEQI2dEURCWVAS
         auNuKSuJ4mzEpQI/yFJivNvtNVrxaupGGgMH2slrXpqL+z3Mg2HGTi0XUJzP8DmiEJhs
         qx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746167; x=1762350967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3VoDc4JO2kSm8qVM4RA31MFseJ8uanXq2MvOCfPyqg=;
        b=ara4lOYB2rDKE8ak5qL9Svzlc7fNxr7VIqY2vIqY1Dyi1wTIQ6iEJiL5T8kkZMEHG9
         l4MKQVL+kZJuh8zTX7Xm8RND7iuO83Gy1EuR19TuuQMegz5CpD983vPCbJkoJvJFwvfQ
         3MEvlJutgGRS+tdwLVrIaPtmwH1HSmOxvw9FPWbbXcneTbKrC6sAfWBuJDgR3e5VVe5Z
         yCEw91l7CGE+8yTzS16BK0fcLDOL2/4AGGKBmTVEHiCgTddny7AkWAI942SLyAzNRl7c
         tbb7pg6lyC4yxgu9LfQwQP4UubBgTZvUA8MTA/Z6ieULHTe8FonDEVnmSlUx63Psgtvf
         85mg==
X-Forwarded-Encrypted: i=1; AJvYcCWNhZRFvrcJXV/pKjrBPhb+zlqSo4t8TocgED/RYXSZwnKf7z1wZkV55Qp4yOH6SBsiaIJx+CF3SQxKqTOyrT+l@lists.infradead.org
X-Gm-Message-State: AOJu0YxFk+CQbkZzUXRtu0BK4qCPHtx4th6y4VWcgNB0LbRIRod3Oo7m
	DCEYt3gPtfSp4lMQwtrtKOl89Duv6ROV1yFDv3pbnjEWwEzljZe7owfr
X-Gm-Gg: ASbGnctRiwc32Mm/a2Wcn13DzpS6PUr2HIADDlAb3i33/YBsXayZvlL+smHqwy8C0TK
	WkzQhcxZ2o2EPUYG9Dw1ZI+UwY3CLYYUykRkMDdrTBKSVCwiwJ3UnULGPvnLjUnOXPueCx4ETFM
	qVNl/ZtFPQTxDmqC+bv5aDnkEn7SesH9sJvbSHXkOOmKuJswwyc6E+I0bvl8Yjbn/VrH++TenBu
	3v6HyGdiIiLGXFJIUW9EGuSPPnzCjr7OwRLMqcPfmfBDtwqQp1+vrxwdCKKQkp2+IcHn6lD5yQh
	RButPL+kALdQSVovOOqIurWlT/03QW5vv1oywlDSTglVawa/iPPsT347pi5SEZuQ9TH0Kt1/NjA
	WkZMyrUFxpo/U6eA4wMHyYuroOn1gkvPEz25qThtchG7lWX0qplggJbRhlHvUjJxEbQ8SMGyjRT
	1kcRJaIdCmzDtK5qT/M6OLkfHJvw==
X-Google-Smtp-Source: AGHT+IFJsqqYrA0WrTuMNeD7nw3M886Ul6n9khe7BJCg7Kfwbb6WZmCEdmQ2yDNV4wiQtrjXo+zUqQ==
X-Received: by 2002:a17:906:f588:b0:b6d:bf78:8bde with SMTP id a640c23a62f3a-b703d2e3f70mr271201766b.7.1761746167029;
        Wed, 29 Oct 2025 06:56:07 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:06 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 3/8] clk: imx: add driver for imx8ulp's sim lpav
Date: Wed, 29 Oct 2025 06:52:24 -0700
Message-ID: <20251029135229.890-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_065611_111059_3D3153EC 
X-CRM114-Status: GOOD (  26.85  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The i.MX8ULP System Integration Module (SIM) LPAV module is a block
control module found inside the LPAV subsystem, which offers some clock
gating options and reset line assertion/de-assertion capabilities.

Therefore, the clock gate management is supported by registering the
module's driver as a clock provider, while the reset capabilities are
managed via the auxiliary device API to allow the DT node to act as a
reset and clock provider.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/clk/imx/Makefile               |   1 +
 drivers/clk/imx/clk-imx8ulp-sim-lpav.c | 160 +++++++++++++++++++++++++
 2 files changed, 161 insertions(+)
 create mode 100644 drivers/clk/imx/clk-imx8ulp-sim-lpav.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 03f2b2a1ab63..208b46873a18 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -41,6 +41,7 @@ clk-imx-lpcg-scu-$(CONFIG_CLK_IMX8QXP) += clk-lpcg-scu.o clk-imx8qxp-lpcg.o
 clk-imx-acm-$(CONFIG_CLK_IMX8QXP) = clk-imx8-acm.o
 
 obj-$(CONFIG_CLK_IMX8ULP) += clk-imx8ulp.o
+obj-$(CONFIG_CLK_IMX8ULP) += clk-imx8ulp-sim-lpav.o
 
 obj-$(CONFIG_CLK_IMX1)   += clk-imx1.o
 obj-$(CONFIG_CLK_IMX25)  += clk-imx25.o
diff --git a/drivers/clk/imx/clk-imx8ulp-sim-lpav.c b/drivers/clk/imx/clk-imx8ulp-sim-lpav.c
new file mode 100644
index 000000000000..1614d9209734
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8ulp-sim-lpav.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <dt-bindings/clock/imx8ulp-clock.h>
+
+#include <linux/auxiliary_bus.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#define SYSCTRL0 0x8
+
+#define IMX8ULP_HIFI_CLK_GATE(gname, cname, pname, bidx)	\
+	{							\
+		.name = gname "_cg",				\
+		.id = IMX8ULP_CLK_SIM_LPAV_HIFI_##cname,	\
+		.parent = { .fw_name = pname },			\
+		.bit = bidx,					\
+	}
+
+struct clk_imx8ulp_sim_lpav_data {
+	void __iomem *base;
+	struct regmap *regmap;
+	spinlock_t lock; /* shared by MUX, clock gate and reset */
+	unsigned long flags; /* for spinlock usage */
+	struct clk_hw_onecell_data clk_data; /*  keep last */
+};
+
+struct clk_imx8ulp_sim_lpav_gate {
+	const char *name;
+	int id;
+	const struct clk_parent_data parent;
+	u8 bit;
+};
+
+static struct clk_imx8ulp_sim_lpav_gate gates[] = {
+	IMX8ULP_HIFI_CLK_GATE("hifi_core", CORE, "core", 17),
+	IMX8ULP_HIFI_CLK_GATE("hifi_pbclk", PBCLK, "bus", 18),
+	IMX8ULP_HIFI_CLK_GATE("hifi_plat", PLAT, "plat", 19)
+};
+
+static void clk_imx8ulp_sim_lpav_lock(void *arg) __acquires(&data->lock)
+{
+	struct clk_imx8ulp_sim_lpav_data *data = dev_get_drvdata(arg);
+
+	spin_lock_irqsave(&data->lock, data->flags);
+}
+
+static void clk_imx8ulp_sim_lpav_unlock(void *arg) __releases(&data->lock)
+{
+	struct clk_imx8ulp_sim_lpav_data *data = dev_get_drvdata(arg);
+
+	spin_unlock_irqrestore(&data->lock, data->flags);
+}
+
+static const struct regmap_config clk_imx8ulp_sim_lpav_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.lock = clk_imx8ulp_sim_lpav_lock,
+	.unlock = clk_imx8ulp_sim_lpav_unlock,
+};
+
+static int clk_imx8ulp_sim_lpav_probe(struct platform_device *pdev)
+{
+	struct clk_imx8ulp_sim_lpav_data *data;
+	struct regmap_config regmap_config;
+	struct auxiliary_device *adev;
+	struct clk_hw *hw;
+	int i, ret;
+
+	data = devm_kzalloc(&pdev->dev,
+			    struct_size(data, clk_data.hws, ARRAY_SIZE(gates)),
+			    GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, data);
+
+	memcpy(&regmap_config, &clk_imx8ulp_sim_lpav_regmap_cfg, sizeof(regmap_config));
+	regmap_config.lock_arg = &pdev->dev;
+
+	/*
+	 * this lock is used directly by the clock gate and indirectly
+	 * by the reset and mux controller via the regmap API
+	 */
+	spin_lock_init(&data->lock);
+
+	data->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(data->base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->base),
+				     "failed to ioremap base\n");
+	/*
+	 * although the clock gate doesn't use the regmap API to modify the
+	 * registers, we still need the regmap because of the reset auxiliary
+	 * driver and the MUX drivers, which use the parent device's regmap
+	 */
+	data->regmap = devm_regmap_init_mmio(&pdev->dev, data->base, &regmap_config);
+	if (IS_ERR(data->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->regmap),
+				     "failed to initialize regmap\n");
+
+	data->clk_data.num = ARRAY_SIZE(gates);
+
+	for (i = 0; i < ARRAY_SIZE(gates); i++) {
+		hw = devm_clk_hw_register_gate_parent_data(&pdev->dev,
+							   gates[i].name,
+							   &gates[i].parent,
+							   CLK_SET_RATE_PARENT,
+							   data->base + SYSCTRL0,
+							   gates[i].bit,
+							   0x0, &data->lock);
+		if (IS_ERR(hw))
+			return dev_err_probe(&pdev->dev, PTR_ERR(hw),
+					     "failed to register %s gate\n",
+					     gates[i].name);
+
+		data->clk_data.hws[i] = hw;
+	}
+
+	adev = devm_auxiliary_device_create(&pdev->dev, "reset", NULL);
+	if (!adev)
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "failed to register aux reset\n");
+
+	ret = devm_of_clk_add_hw_provider(&pdev->dev,
+					  of_clk_hw_onecell_get,
+					  &data->clk_data);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register clk hw provider\n");
+
+	/* used to probe MUX child device */
+	return devm_of_platform_populate(&pdev->dev);
+}
+
+static const struct of_device_id clk_imx8ulp_sim_lpav_of_match[] = {
+	{ .compatible = "fsl,imx8ulp-sim-lpav" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, clk_imx8ulp_sim_lpav_of_match);
+
+static struct platform_driver clk_imx8ulp_sim_lpav_driver = {
+	.probe = clk_imx8ulp_sim_lpav_probe,
+	.driver = {
+		.name = "clk-imx8ulp-sim-lpav",
+		.of_match_table = clk_imx8ulp_sim_lpav_of_match,
+	},
+};
+module_platform_driver(clk_imx8ulp_sim_lpav_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("i.MX8ULP LPAV System Integration Module (SIM) clock driver");
+MODULE_AUTHOR("Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>");
-- 
2.43.0



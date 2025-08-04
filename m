Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4A2C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 16:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YGz5cPkWnmWx7O4iWL1ZseG9pwFetBBfmo91nT+/vc=; b=LBsDeAClULBTU+7a3FDv1Wcdzf
	2g+FGe4oAiBk5pjTlAQOGfJlncWq5lMfGlIbp32M+qpVYliSPed+w8lWvrnG5EgzlB8tqeNp5v7MR
	bLrX10a4gBtIGAMGMMCqskkBHeb7Yhvz0dySnZp68M6F6DXGF3yBnqtvTdLkZ2DGd3CZfEmxaw676
	EhZgwtuOuI7ZAmP/sgxxl5QLt1L12+Ct2WqS2HCGjuUAaLTGjBQ1Bs8jeoGkxvQzbKu1kucLS2ms/
	Yh3zZMx3BqyJ90k2BOR6xdY5TMKaf96dzS+SNu2nhDsRcaduNAQkl4P/4TkT03su78W1Xo9I2GfU7
	a2PytNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiy1W-0000000AyWM-1gtY;
	Mon, 04 Aug 2025 16:26:54 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixX0-0000000Atn4-07uM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 15:55:23 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-af8fd1b80e5so763109966b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 08:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322920; x=1754927720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YGz5cPkWnmWx7O4iWL1ZseG9pwFetBBfmo91nT+/vc=;
        b=AW9vNDqvHoY1AOKW9w6IqvHSUSA17sgotn+zHtMbVEmW1x4a2p5yI0u73uktshdHv5
         ihFJM0nsAP6f6zssRsCtfPRAlGQ/ZWiDXnUYwDz14iJ5JChuuzYqb5Ak86ZAj3fCtaOH
         DP9TqyXq4svGI4cBlYyuQFM7DQy1Ow9bFn7RTpFFJGVpxh/I844Q1sckUrZymapIL9My
         2FYHeG1zq7SOMfzCFHiYbDH3ebnxw4ZaCLj5SWHsuUOvtp+Jb8pOo1RpA7ZrMpUDLwTr
         /7qaedN0J7AzHduCdq498K/M9KkSrg6VED59IvcPGdwAyf7G/tNCLWpbYtE8vLA1JwVr
         JwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322920; x=1754927720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YGz5cPkWnmWx7O4iWL1ZseG9pwFetBBfmo91nT+/vc=;
        b=p02soHzd4iBimkAwcb2wbN4YvySzH+7802TNWXvlg1pNdmjfg+J058cwgVDOsdFARl
         mZw+YksWwmSLykzngz+HhRNdEvVisao7kKr+Ha2feSTEPTcTDIaQ9da52DxhxGBQ/acu
         +TLSLe7ytzkZKXz9MXZXYLCKK2dZJdJ/P1ZY9eoRWEtHSKB5DtlyhierhVrZzJBtzBaK
         oVqZz8dB1Dac8V8awVR5mpcY2wreHlBBirNMCfTq4ApnEAUKfmoTCoYVadVLb92O9ZcC
         E5BiGwHQNLV3PApsIs+KJt8ymrFYyCDCiqwr+19zmsdjRqE9cuPx26807wtsV6q6U0Xg
         kUUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7c2pkeaQR8ts/OwXI/LL9VRI4nazBqIxwtj8Ujcfe2kbze+CQX0zXNJQXIQyNZ2DSktvr3W/jAYgHV9oHSPwT@lists.infradead.org
X-Gm-Message-State: AOJu0YyOdRsSGuGYaAYcL8i2IvomFBDbUqF66BDXdmH1Qm9Hjg45AcyI
	wI1pHZdCklbdU9AX85MV29fw7czcQ0HvC/NAlxKMxgOnMTthmCWtrM4F
X-Gm-Gg: ASbGncvX+FVHRH/rC12JkEL4PRnAHJvTmw15KWGExL8ybdRHdaUMU9nYk9NcwHv8ZD0
	sArm0oF9A56ObMXLz1wlirHqvWtJOqqqxqFKP47JKSQZyargjtnwgtXHyDix4KJ2O43cDWOxV6a
	mUi0xxdusrCo8+chYkBLujFKdQK0lDICLC+j6rr91lKr4LENO4vvRBPHGU6cqnBRz5sqH9iKXQv
	i6GvR+s5zxKxTn/JQD+K4Xtj+qJLIKTm44sDiQljfguDbecEPEqs2dh4ix6RXcjS7KNcH95zAeE
	FWLkY4+7Vh5hsUjuWev4ZEoEirvTl9D5WrWAdXcYmZy6ijVK+FJvI60eVWRJiloDH77CkudyXE1
	iun2J4NPigYd4lNF6DaOwsl+MxQYbuaa6d1cNxGfaADjEAxvwHjWGn1zPs7Y=
X-Google-Smtp-Source: AGHT+IH4rhYeZkTEYN60QVQIBmD6LxL8fP1yhq7naPH7BzL1Kc6gHZhe60uNsm5lfC+/+dGfYxNwSQ==
X-Received: by 2002:a17:906:d54f:b0:ad8:9c97:c2e5 with SMTP id a640c23a62f3a-af93fda17edmr1041557166b.0.1754322920274;
        Mon, 04 Aug 2025 08:55:20 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a075a74sm761114266b.17.2025.08.04.08.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:55:19 -0700 (PDT)
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
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 4/7] clk: imx: add driver for imx8ulp's sim lpav
Date: Mon,  4 Aug 2025 11:54:04 -0400
Message-Id: <20250804155407.285353-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_085522_091471_76E90CDC 
X-CRM114-Status: GOOD (  24.92  )
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
 drivers/clk/imx/clk-imx8ulp-sim-lpav.c | 162 +++++++++++++++++++++++++
 2 files changed, 163 insertions(+)
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
index 000000000000..2019e0a61216
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8ulp-sim-lpav.c
@@ -0,0 +1,162 @@
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
+
+#define SYSCTRL0 0x8
+
+#define IMX8ULP_HIFI_CLK_GATE(gname, cname, pname, bidx)	\
+	{							\
+		.name = gname"_cg",				\
+		.id = IMX8ULP_CLK_SIM_LPAV_HIFI_##cname,	\
+		.parent = { .fw_name = pname, .name = pname },	\
+		.bit = bidx,					\
+	}
+
+struct clk_imx8ulp_sim_lpav_data {
+	void __iomem *base;
+	struct clk_hw_onecell_data clk_data;
+};
+
+struct clk_imx8ulp_sim_lpav_gate {
+	const char *name;
+	int id;
+	const struct clk_parent_data parent;
+	u8 bit;
+} gates[] = {
+	IMX8ULP_HIFI_CLK_GATE("hifi_core", CORE, "hifi_core", 17),
+	IMX8ULP_HIFI_CLK_GATE("hifi_pbclk", PBCLK, "lpav_bus", 18),
+	IMX8ULP_HIFI_CLK_GATE("hifi_plat", PLAT, "hifi_plat", 19)
+};
+
+#ifdef CONFIG_RESET_CONTROLLER
+static void clk_imx8ulp_sim_lpav_aux_reset_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	kfree(adev);
+}
+
+static void clk_imx8ulp_sim_lpav_unregister_aux_reset(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int clk_imx8ulp_sim_lpav_register_aux_reset(struct platform_device *pdev)
+{
+	struct auxiliary_device *adev __free(kfree) = NULL;
+	int ret;
+
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return -ENOMEM;
+
+	adev->name = "reset";
+	adev->dev.parent = &pdev->dev;
+	adev->dev.release = clk_imx8ulp_sim_lpav_aux_reset_release;
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to initialize aux dev\n");
+		return ret;
+	}
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		dev_err(&pdev->dev, "failed to add aux dev\n");
+		return ret;
+	}
+
+	return devm_add_action_or_reset(&pdev->dev,
+					clk_imx8ulp_sim_lpav_unregister_aux_reset,
+					no_free_ptr(adev));
+}
+#else
+static int clk_imx8ulp_sim_lpav_register_aux_reset(struct platform_device *pdev)
+{
+	return 0;
+}
+#endif /* CONFIG_RESET_CONTROLLER */
+
+static int clk_imx8ulp_sim_lpav_probe(struct platform_device *pdev)
+{
+	struct clk_imx8ulp_sim_lpav_data *data;
+	struct clk_hw *hw;
+	int i, ret;
+
+	data = devm_kzalloc(&pdev->dev,
+			    struct_size(data, clk_data.hws, IMX8ULP_CLK_SIM_LPAV_END),
+			    GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(data->base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->base),
+				     "failed to ioremap base\n");
+
+	data->clk_data.num = IMX8ULP_CLK_SIM_LPAV_END;
+
+	for (i = 0; i < ARRAY_SIZE(gates); i++) {
+		hw = devm_clk_hw_register_gate_parent_data(&pdev->dev,
+							   gates[i].name,
+							   &gates[i].parent,
+							   CLK_SET_RATE_PARENT,
+							   data->base + SYSCTRL0,
+							   gates[i].bit,
+							   0x0, NULL);
+		if (IS_ERR(hw))
+			return dev_err_probe(&pdev->dev, PTR_ERR(hw),
+					     "failed to register %s gate\n",
+					     gates[i].name);
+
+		data->clk_data.hws[i] = hw;
+	}
+
+	ret = clk_imx8ulp_sim_lpav_register_aux_reset(pdev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
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
2.34.1



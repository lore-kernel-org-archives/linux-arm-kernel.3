Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F8FCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/BYF33DXlVlPj+AeWQJ/lLnj1HAK6WNR64lw8fuXu8=; b=wsTJr7Z5arb5bV1VD44fY+CjoQ
	dKBXnV24BCcv+uvqo28auJfQXQwBWTf4OLi7nPChX3zfNgkXpr/2W/SdL8LZYfl82T3ab+D/pOpV4
	qqJ6+Y3zo/LJrHOx7G38SvjWFJECeJ8ZrZ9BFFziZ6jUV7xxfe4wpRtdvipvEbrwJhiHyJ3ta5JVX
	dF0r1rzo+YWetnCBM6GBwMQnD3mhBJhfy/SiSfdQJY9tgO6UtxKWLQaLWJ6ImgIa2HJ/7oTLwVpyt
	vzoTX04eOPspNlOPjwB6yZVFNwJuZbbKO6DLhN/vCWx2qoEDvs4wdaHnprAL8zcERVocEUIsKU8O6
	VVQumnkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFld-0000000BktJ-351x;
	Tue, 04 Nov 2025 12:04:05 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFlb-0000000Bkqh-2Cai
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:04:04 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b6d3effe106so852764366b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 04:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257842; x=1762862642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/BYF33DXlVlPj+AeWQJ/lLnj1HAK6WNR64lw8fuXu8=;
        b=OnxUGgNgxcbZmv+vhy6gwRPwziwMqsa00gcxGegVJEyXt5tkt5Sdp02MC9aP78Ebo/
         7G7enZ27F0W8eWHfLGzoDSnOGloK7ebUBWwoaP2bi9ejQ68WajPo51f1sreCG5556Zjb
         Btm7Vpf25nHT7dwqFg1fUqe45Pjdpfmi3rucLMviPCYlhkz/cW0B8zYlacVFQ+q9nJIl
         JNabSdivhrLAE3roudUGG1XC/XYlzCsF7M2VEdgE8TwlA6rIDzoqgTqN3VuWhqpD9uLD
         Q5Y2yszI6PVufQcj41En6q34jbg3rJxUhYlyge+v+nxt/iBUAIRT8Tc2ktBhJdsPrKh9
         YOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257842; x=1762862642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/BYF33DXlVlPj+AeWQJ/lLnj1HAK6WNR64lw8fuXu8=;
        b=gUYWMF74ZP8QrhmQeCBgOK5Wy2Vnl2uuTHSZr0bHBupEGvI3LLS+SJa+nXS38Hr+7X
         d8BXlYnxh2QckQ+g8H+FSLpCgMORhgHhaxPssfaGtYvds+5twuHRSXwjcYHDndOHr/fw
         ERFzEtRTK94gXcbogkG0hBht8jRZiuf7nprLxikMy62QW27q9ssXAtXF/7N2JQ6q/zPv
         dMs3TRwl8DMC55/1vbpn3EZ/sbuVemlXgP9Ub0xOWKepGJMoWjSUFAbKv7kutKONtQqM
         NbwKWd2alnUih5OKMSWJGi7rsYSJSHeRMpGzT0xMg0MbtgVyfblAK+772k9ty4MMRp/q
         L3YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKVhMj/FCFI7CEh2J957giqKzoTzdmT4oaQHuvtBQPAVWQJVJSLuEQhM6lliWUtWWRZEpxwdA2+tcZVP1UnkJs@lists.infradead.org
X-Gm-Message-State: AOJu0YxnVJfsuL968hom5i4VfCERTlmrxaPrn99/hlYFv/Ha2KjX5eqQ
	9oOo8YMTWZvCPKrnb/JKolj9AJa/GcL425Xy2IJsT9XMceaFuLEdcTtE
X-Gm-Gg: ASbGnctc/PC9wS/TLE0+H4ksPgzjN0t/wEA4KGkYcl1o0PNN2tak+vwPrtM8XZAcLts
	DzOSS6O6DHF3uMGy3+z4LEByxRBsoHeZGLUjoVYC8CkBN04nXLUIZEAoHHSz/l8dJsoQ29OpTpv
	wQSwaZlTC5Xyl0pSW97SavgeKPFGEZMiZXki2P/KfBTC1hYqnGcFPjekyi0IGvvoy5ZX7V8hBvc
	XXYa/Pc2izu+Fcc4xfOVJnXxPw08Q2lupViCVXazlShyMxOl+baK7I02eKtYFXMx5f4fg6NqTO9
	AEdtdEQOKKsUglKQk1lScvSfTsv74oznMygkYAogWHCNt1nGiXr4BT3FDXP8a9Ubcj/e0acwSB5
	FrnD40Q3fc8D4voNGZgGasOsNUaLF8DuafhnrOY2zJ15YJz7Vk6uHRpXn16P+7qMZyOxL/8z9lL
	Cd2BX2ynBLC1odvuEqGTVOsT81/xoad/dcMD6m
X-Google-Smtp-Source: AGHT+IENrgHXUckIu1P8DzjyOH/pQJ15zIuOl+8iK5w7p2OYmzxyymXxjra+BK5po5WGmx8SH+hcTg==
X-Received: by 2002:a17:906:fe4e:b0:b65:abf2:417a with SMTP id a640c23a62f3a-b7070891072mr1736993766b.64.1762257841281;
        Tue, 04 Nov 2025 04:04:01 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:04:00 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 3/8] clk: imx: add driver for imx8ulp's sim lpav
Date: Tue,  4 Nov 2025 04:02:56 -0800
Message-ID: <20251104120301.913-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_040403_607864_3D8880D5 
X-CRM114-Status: GOOD (  27.13  )
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
 drivers/clk/imx/Kconfig                |   1 +
 drivers/clk/imx/Makefile               |   1 +
 drivers/clk/imx/clk-imx8ulp-sim-lpav.c | 156 +++++++++++++++++++++++++
 3 files changed, 158 insertions(+)
 create mode 100644 drivers/clk/imx/clk-imx8ulp-sim-lpav.c

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index 6ff6d934848a..b292e7ca5c24 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -105,6 +105,7 @@ config CLK_IMX8ULP
 	tristate "IMX8ULP CCM Clock Driver"
 	depends on ARCH_MXC || COMPILE_TEST
 	select MXC_CLK
+	select AUXILIARY_BUS
 	help
 	    Build the driver for i.MX8ULP CCM Clock Driver
 
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
index 000000000000..990c95b89b75
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8ulp-sim-lpav.c
@@ -0,0 +1,156 @@
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
+static int clk_imx8ulp_sim_lpav_probe(struct platform_device *pdev)
+{
+	const struct regmap_config regmap_config = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+		.lock = clk_imx8ulp_sim_lpav_lock,
+		.unlock = clk_imx8ulp_sim_lpav_unlock,
+		.lock_arg = &pdev->dev,
+	};
+	struct clk_imx8ulp_sim_lpav_data *data;
+	struct auxiliary_device *adev;
+	struct regmap *regmap;
+	void __iomem *base;
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
+	/*
+	 * this lock is used directly by the clock gate and indirectly
+	 * by the reset and mux controller via the regmap API
+	 */
+	spin_lock_init(&data->lock);
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(base),
+				     "failed to ioremap base\n");
+	/*
+	 * although the clock gate doesn't use the regmap API to modify the
+	 * registers, we still need the regmap because of the reset auxiliary
+	 * driver and the MUX drivers, which use the parent device's regmap
+	 */
+	regmap = devm_regmap_init_mmio(&pdev->dev, base, &regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
+				     "failed to initialize regmap\n");
+
+	data->clk_data.num = ARRAY_SIZE(gates);
+
+	for (i = 0; i < ARRAY_SIZE(gates); i++) {
+		hw = devm_clk_hw_register_gate_parent_data(&pdev->dev,
+							   gates[i].name,
+							   &gates[i].parent,
+							   CLK_SET_RATE_PARENT,
+							   base + SYSCTRL0,
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



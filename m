Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD3DCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 23:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTJvnCX97zl8Q3Az39cCSa2xLcWpPk7njCqUODW2NfI=; b=VszqrNdrnkKwfbhyIBr8R1woPz
	WfloP/7tn4pZp1QWtwWJsP4/sKpMxZDIiUTQplGlh1RGhuS2/Ea4uzgYuW8DjAis6uMcXacpz4DlX
	gtE3rir3fqirGG98Ksn+18/GBe+uqFLghWUlC2JlT+l4KKQvlHV6nOKRDfHUByPTO/ODOwbZdgGsL
	7DaX6OVElBVaiO/7nKcRb1br0qvhjUYkTMvPMfyVyWtPjjueioMmMizSZBAn1UkMGL6spE/QYrQOU
	tui8U9l+vptDlvuImoPEZe1TpMA1teuzwN3K7dcreYM90hNH+F4Aiv2mQTs9c48W4koe0paeaxpt5
	e+Leus5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9uFE-00000009DGL-3HJc;
	Fri, 17 Oct 2025 23:52:24 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9uFC-00000009DCZ-185c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 23:52:23 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-7246755a21cso34617717b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 16:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760745141; x=1761349941; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TTJvnCX97zl8Q3Az39cCSa2xLcWpPk7njCqUODW2NfI=;
        b=Du5AiQZB1Xa9WO/Jm8QqtvNEZ+F/sk8X53V4kfleb69mZhDYCuJ7H3VS2kBGEFBr2O
         wUYWFBMDRLWgfzVZgCWRUjMyRh8bak7qXxD3w3DasnbaFfBBnaBt5eDvxt98153JTH1g
         6ULCqzSI/36B7rFDw4b8dgkLvYtGqgkASpyyKtd5687F4eavNBKCNo1j+4fMTdTM4ZpA
         BRhB9KB+ENpDHMLn8ZUv+KvyjdDo30OmgLowtkx0X08fry8NoPufgTSShW9Xeu/m8FU8
         DXyk3kB3JxpMWTaFHekOKmf+/AC/y3YniLwZgYqu4bQwFpcYDrpl2u7ec2Z9axJ2v7lg
         caow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760745141; x=1761349941;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TTJvnCX97zl8Q3Az39cCSa2xLcWpPk7njCqUODW2NfI=;
        b=w3KT9Tv/E65QdrCguWv3PyWFG8EmXjHCIUAp8sUqU9nX8+K6eFzdnVMVBYJ/MN5LsF
         U+D5ZX+Bjj1HrFkNpsMeGpGJHMe6woe0nJORDo2hX+8FonQDU/U9lrd2cjmr+OYIRI3a
         OzFJw1Vqqj/zl/EqqrhpqzUUfVS1B0UkDABk8mLnd0JhuPebKxzLy9tiXpGUOulTFYJW
         jk3oLa6BsK8PbZYk0dZJVWh/IIHGu3HerKD9xtHNxIknCtE76xMjXdi2aAFa0CwSfczR
         5l9b5b5xOSqFpHNQ7V8jquk3572IFliPfjL1Jr1kY+uWKJg0OTA41N9EBf5yhB33tOh/
         gwlw==
X-Forwarded-Encrypted: i=1; AJvYcCViB3QYeO+ri6WMsE/H3vGVSrt9VhWvLMU/LYIXaJiGQhj1eVqabZeMYAuPfp2FBEEqMiG6uXeZChsqQF40tZ9+@lists.infradead.org
X-Gm-Message-State: AOJu0YxgDzruEw7joNZFHVlJ/HUT81blQUAibPtRVX0nuMKmKK48I2Au
	iXODjsZ55Hje9UUXtU1QdSDaQUUsnpK4iVFYHvQv91CXn7P62vjZV8uXrsi/AcVlTrxajrOl4Na
	d/56xjQ==
X-Google-Smtp-Source: AGHT+IEB8647GbAUz8tnDDb+FEo04Ip6jQ7zKRQGu482r5jTXozTqpF5nH0nY6K+/jQ8CqmLbpwGoZ34vMg=
X-Received: from ybsb2.prod.google.com ([2002:a05:6902:302:b0:eb8:98e4:aa59])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690e:1483:b0:63e:29ad:ad4
 with SMTP id 956f58d0204a3-63e29ad0e36mr136107d50.30.1760745140757; Fri, 17
 Oct 2025 16:52:20 -0700 (PDT)
Date: Fri, 17 Oct 2025 23:51:59 +0000
In-Reply-To: <20251017235159.2417576-1-royluo@google.com>
Mime-Version: 1.0
References: <20251017235159.2417576-1-royluo@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017235159.2417576-3-royluo@google.com>
Subject: [PATCH v4 2/2] phy: Add Google Tensor SoC USB PHY driver
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_165222_331782_1BCACA11 
X-CRM114-Status: GOOD (  25.16  )
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

Support the USB PHY found on Google Tensor G5. This particular USB PHY
supports both high-speed and super-speed operations, and is integrated
with the SNPS DWC3 controller that's also on the SoC.
This initial patch specifically adds functionality for high-speed.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/phy/Kconfig          |  13 ++
 drivers/phy/Makefile         |   1 +
 drivers/phy/phy-google-usb.c | 271 +++++++++++++++++++++++++++++++++++
 3 files changed, 285 insertions(+)
 create mode 100644 drivers/phy/phy-google-usb.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 58c911e1b2d2..fe32d1356002 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -101,6 +101,19 @@ config PHY_NXP_PTN3222
 	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
 	  Speed and High Speed.
 
+config PHY_GOOGLE_USB
+	tristate "Google Tensor SoC USB PHY driver"
+	depends on HAS_IOMEM
+	depends on OF
+	depends on TYPEC
+	select GENERIC_PHY
+	help
+	  Enable support for the USB PHY on Google Tensor SoCs, starting with
+	  the G5 generation. This driver provides the PHY interfaces to
+	  interact with the SNPS eUSB2 and USB 3.2/DisplayPort Combo PHY, both
+	  of which are integrated with the DWC3 USB controller.
+	  This driver currently supports USB high-speed.
+
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index c670a8dac468..1d7a1331bd19 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
 obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
 obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
+obj-$(CONFIG_PHY_GOOGLE_USB)		+= phy-google-usb.o
 obj-y					+= allwinner/	\
 					   amlogic/	\
 					   broadcom/	\
diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.c
new file mode 100644
index 000000000000..75e4233a5ab5
--- /dev/null
+++ b/drivers/phy/phy-google-usb.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * phy-google-usb.c - Google USB PHY driver
+ *
+ * Copyright (C) 2025, Google LLC
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/reset.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/mutex.h>
+#include <linux/cleanup.h>
+#include <linux/usb/typec_mux.h>
+
+#define USBCS_USB2PHY_CFG19_OFFSET 0x0
+#define USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV GENMASK(19, 8)
+
+#define USBCS_USB2PHY_CFG21_OFFSET 0x8
+#define USBCS_USB2PHY_CFG21_PHY_ENABLE BIT(12)
+#define USBCS_USB2PHY_CFG21_REF_FREQ_SEL GENMASK(15, 13)
+#define USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL BIT(19)
+
+#define USBCS_PHY_CFG1_OFFSET 0x28
+#define USBCS_PHY_CFG1_SYS_VBUSVALID BIT(17)
+
+enum google_usb_phy_id {
+	GOOGLE_USB2_PHY,
+	GOOGLE_USB_PHY_NUM,
+};
+
+struct google_usb_phy_instance {
+	int index;
+	struct phy *phy;
+	int num_clks;
+	struct clk_bulk_data *clks;
+	struct reset_control *rsts;
+};
+
+struct google_usb_phy {
+	struct device *dev;
+	void __iomem *u2phy_cfg_base;
+	void __iomem *dp_top_base;
+	struct google_usb_phy_instance insts[GOOGLE_USB_PHY_NUM];
+	/* serialize phy access */
+	struct mutex phy_mutex;
+	struct typec_switch_dev *sw;
+	enum typec_orientation orientation;
+};
+
+static inline struct google_usb_phy *to_google_usb_phy(struct google_usb_phy_instance *inst)
+{
+	return container_of(inst, struct google_usb_phy, insts[inst->index]);
+}
+
+static void set_vbus_valid(struct google_usb_phy *gphy)
+{
+	u32 reg;
+
+	if (gphy->orientation == TYPEC_ORIENTATION_NONE) {
+		reg = readl(gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
+		reg &= ~USBCS_PHY_CFG1_SYS_VBUSVALID;
+		writel(reg, gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
+	} else {
+		reg = readl(gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
+		reg |= USBCS_PHY_CFG1_SYS_VBUSVALID;
+		writel(reg, gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
+	}
+}
+
+static int google_usb_set_orientation(struct typec_switch_dev *sw,
+				      enum typec_orientation orientation)
+{
+	struct google_usb_phy *gphy = typec_switch_get_drvdata(sw);
+
+	dev_dbg(gphy->dev, "set orientation %d\n", orientation);
+
+	gphy->orientation = orientation;
+
+	if (pm_runtime_suspended(gphy->dev))
+		return 0;
+
+	guard(mutex)(&gphy->phy_mutex);
+
+	set_vbus_valid(gphy);
+
+	return 0;
+}
+
+static int google_usb2_phy_init(struct phy *_phy)
+{
+	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
+	struct google_usb_phy *gphy = to_google_usb_phy(inst);
+	u32 reg;
+	int ret = 0;
+
+	dev_dbg(gphy->dev, "initializing usb2 phy\n");
+
+	guard(mutex)(&gphy->phy_mutex);
+
+	reg = readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
+	reg &= ~USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL;
+	reg &= ~USBCS_USB2PHY_CFG21_REF_FREQ_SEL;
+	reg |= FIELD_PREP(USBCS_USB2PHY_CFG21_REF_FREQ_SEL, 0);
+	writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
+
+	reg = readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG19_OFFSET);
+	reg &= ~USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV;
+	reg |= FIELD_PREP(USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV, 368);
+	writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG19_OFFSET);
+
+	set_vbus_valid(gphy);
+
+	ret = clk_bulk_prepare_enable(inst->num_clks, inst->clks);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(inst->rsts);
+	if (ret) {
+		clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
+		return ret;
+	}
+
+	reg = readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
+	reg |= USBCS_USB2PHY_CFG21_PHY_ENABLE;
+	writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
+
+	return ret;
+}
+
+static int google_usb2_phy_exit(struct phy *_phy)
+{
+	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
+	struct google_usb_phy *gphy = to_google_usb_phy(inst);
+	u32 reg;
+
+	dev_dbg(gphy->dev, "exiting usb2 phy\n");
+
+	guard(mutex)(&gphy->phy_mutex);
+
+	reg = readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
+	reg &= ~USBCS_USB2PHY_CFG21_PHY_ENABLE;
+	writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
+
+	reset_control_assert(inst->rsts);
+	clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
+
+	return 0;
+}
+
+static const struct phy_ops google_usb2_phy_ops = {
+	.init		= google_usb2_phy_init,
+	.exit		= google_usb2_phy_exit,
+};
+
+static struct phy *google_usb_phy_xlate(struct device *dev,
+					const struct of_phandle_args *args)
+{
+	struct google_usb_phy *gphy = dev_get_drvdata(dev);
+
+	if (args->args[0] >= GOOGLE_USB_PHY_NUM) {
+		dev_err(dev, "invalid PHY index requested from DT\n");
+		return ERR_PTR(-ENODEV);
+	}
+	return gphy->insts[args->args[0]].phy;
+}
+
+static int google_usb_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct google_usb_phy *gphy;
+	struct phy *phy;
+	struct google_usb_phy_instance *inst;
+	struct phy_provider *phy_provider;
+	struct typec_switch_desc sw_desc = { };
+	int ret;
+
+	gphy = devm_kzalloc(dev, sizeof(*gphy), GFP_KERNEL);
+	if (!gphy)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, gphy);
+	gphy->dev = dev;
+
+	ret = devm_mutex_init(dev, &gphy->phy_mutex);
+	if (ret)
+		return ret;
+
+	gphy->u2phy_cfg_base = devm_platform_ioremap_resource_byname(pdev,
+								     "u2phy_cfg");
+	if (IS_ERR(gphy->u2phy_cfg_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->u2phy_cfg_base),
+				    "invalid usb2 cfg\n");
+
+	gphy->dp_top_base = devm_platform_ioremap_resource_byname(pdev,
+								  "dp_top");
+	if (IS_ERR(gphy->dp_top_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->dp_top_base),
+				    "invalid dp top\n");
+
+	inst = &gphy->insts[GOOGLE_USB2_PHY];
+	inst->index = GOOGLE_USB2_PHY;
+	phy = devm_phy_create(dev, NULL, &google_usb2_phy_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy),
+				     "failed to create usb2 phy instance\n");
+	inst->phy = phy;
+	phy_set_drvdata(phy, inst);
+	ret = devm_clk_bulk_get_all_enabled(dev, &inst->clks);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get u2 phy clks\n");
+	inst->num_clks = ret;
+
+	inst->rsts = devm_reset_control_array_get_exclusive(dev);
+	if (IS_ERR(inst->rsts))
+		return dev_err_probe(dev, PTR_ERR(inst->rsts),
+				     "failed to get u2 phy resets\n");
+
+	phy_provider = devm_of_phy_provider_register(dev, google_usb_phy_xlate);
+	if (IS_ERR(phy_provider))
+		return dev_err_probe(dev, PTR_ERR(phy_provider),
+				     "failed to register phy provider\n");
+
+	pm_runtime_enable(dev);
+
+	sw_desc.fwnode = dev_fwnode(dev);
+	sw_desc.drvdata = gphy;
+	sw_desc.name = fwnode_get_name(dev_fwnode(dev));
+	sw_desc.set = google_usb_set_orientation;
+
+	gphy->sw = typec_switch_register(dev, &sw_desc);
+	if (IS_ERR(gphy->sw))
+		return dev_err_probe(dev, PTR_ERR(gphy->sw),
+				     "failed to register typec switch\n");
+
+	return 0;
+}
+
+static void google_usb_phy_remove(struct platform_device *pdev)
+{
+	struct google_usb_phy *gphy = dev_get_drvdata(&pdev->dev);
+
+	typec_switch_unregister(gphy->sw);
+	pm_runtime_disable(&pdev->dev);
+}
+
+static const struct of_device_id google_usb_phy_of_match[] = {
+	{
+		.compatible = "google,gs5-usb-phy",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, google_usb_phy_of_match);
+
+static struct platform_driver google_usb_phy = {
+	.probe	= google_usb_phy_probe,
+	.remove = google_usb_phy_remove,
+	.driver = {
+		.name		= "google-usb-phy",
+		.of_match_table	= google_usb_phy_of_match,
+	}
+};
+
+module_platform_driver(google_usb_phy);
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Google USB phy driver");
-- 
2.51.0.858.gf9c4a03a3a-goog



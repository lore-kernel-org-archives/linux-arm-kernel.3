Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6356ECCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 21:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PsD+60KDxRA63pKuk3kGCvoA2vQ4JCKP7PSH6fRAYgs=; b=wT0nWSZIVBBGrELZNVLMWnciWU
	1Q3l9sdiZ4JY9qrPcQ8pwG28gRZOgPxoJNjTy/59RFupHbfoAxrbWWTMJnVkKWoxYKD2JfsBMSAyu
	g4re1DT4e6HOmVmM6evvwnvsbBGYOj9axtUaBPazp4cjSFAU02U2CSdARH0Ixa3R61RviZex30MqI
	7OECl7vFEgF+xgAqdMBsESw80uslSOwZxD0eI6YSvFz3pAHXIl+VIX3llyaHl/WE5/82f3MQPBdu5
	/g2RObuAAGAiCehDfWFqijW8J9/tL8Ff3dSrRe3mIVZQ+cLfVw1KmrpXDZoItKKTP582mZbWNlLnm
	Go+g7ohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEDum-00000003075-1ea3;
	Wed, 29 Oct 2025 21:41:08 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEDui-0000000304e-0nMQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 21:41:05 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-26985173d8eso6051705ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 14:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761774061; x=1762378861; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PsD+60KDxRA63pKuk3kGCvoA2vQ4JCKP7PSH6fRAYgs=;
        b=HmF2nR7xojF8+niGZ8qk/4qaz2Ho8Cou6/a+kLuNa0Onc1IfHU2qoTUbWYPw0xMR/h
         NTAj9jU5OAcNKvkjd6p/hp6NadUcxE0j1griTedD2YRz4G9YonOFc8xL4TBd8uVIIL5K
         1SAi7otGiexSuFEBOj5X+QXBlLVMpwo8fqXZ0IF4jVif/DLuz2PXN4QjieLcqSClJJEV
         FoBjwnSdLhvzhfqS9ZBjs3bhwo7nmhuEvnLe5plowZq/Rll2mGIX4VNzOAutGM6Z2/JV
         R2ff5zPlmVSrfQptcUWCmDKPFNdP0zhaViPexWBboP/I72oPFP5NxyqHRrhvTRd/kFK7
         lytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761774061; x=1762378861;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PsD+60KDxRA63pKuk3kGCvoA2vQ4JCKP7PSH6fRAYgs=;
        b=aJZnJu23EJvFsebu9+9OUIMe7RAqYLLThL6Tx7NpMQl+SBfO/u+ahMNpceVSCbKKq1
         btBfQyUqamlnJVZFKggBx6QBnms++Z7pnn9V4hILbGzk/LKfXm5+0Xdf2IQFvPWr1uH2
         vzzMgwQSHwCQLmpeK7eigj+2jgtUVaQaXCzTb4dcw9j7JH1eDiRMMX/kNpOTywCY/ogz
         EQDfh+jEIVE/x7kJC0+lxCPmy+zx3FjAVhLisjhGy1t3ZvmfTygCB7hwnwnDibAO0u8Q
         Ci4Ls2bqU7efmOzBijD7Lv4zGF1HjxGKZlR+0Y8ttSZGL6jL1RQbeKfLkxzQX42rnHiZ
         Zeyw==
X-Forwarded-Encrypted: i=1; AJvYcCWE/xpd9dDnCn6fPaNPQ1i5sj1Fb9Z5nKkLIEvHmwtxJJOQnpip8/eZkEBFgshEKXNgQqWzv92p6Ng1BAqmGVgQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwnUbP0+xZPNHFPgQJomIZfna+zh+vSkm2m/kb+R9f5NlRqVHI6
	CyRnLntZMQS5Ph1+hVHzz0JpMAP+7e1v/H2dA7s+REHb7z/+llRrvX6ftkIwslEFSJh3Pif7MGk
	P8WXLig==
X-Google-Smtp-Source: AGHT+IEMfFp8ZCC0xNU0mSbhzy5iC7snXPJKFHRF56WugTXlGgarRnyuyK6BjOFtMaCJF60s6FLDD+G3tTU=
X-Received: from plbli15.prod.google.com ([2002:a17:903:294f:b0:267:fa7d:b637])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ec8d:b0:269:87a3:43b8
 with SMTP id d9443c01a7336-294ee217833mr7098535ad.4.1761774061567; Wed, 29
 Oct 2025 14:41:01 -0700 (PDT)
Date: Wed, 29 Oct 2025 21:40:32 +0000
In-Reply-To: <20251029214032.3175261-1-royluo@google.com>
Mime-Version: 1.0
References: <20251029214032.3175261-1-royluo@google.com>
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251029214032.3175261-3-royluo@google.com>
Subject: [PATCH v5 2/2] phy: Add Google Tensor SoC USB PHY driver
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Doug Anderson <dianders@google.com>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_144104_256704_B66A9594 
X-CRM114-Status: GOOD (  26.05  )
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
index 58c911e1b2d2..be237847efed 100644
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
+	  of which are integrated with the DWC3 USB DRD controller.
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
index 000000000000..02c6e9f2912e
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
+	void __iomem *usb2_cfg_base;
+	void __iomem *usb3_top_base;
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
+		reg = readl(gphy->usb3_top_base + USBCS_PHY_CFG1_OFFSET);
+		reg &= ~USBCS_PHY_CFG1_SYS_VBUSVALID;
+		writel(reg, gphy->usb3_top_base + USBCS_PHY_CFG1_OFFSET);
+	} else {
+		reg = readl(gphy->usb3_top_base + USBCS_PHY_CFG1_OFFSET);
+		reg |= USBCS_PHY_CFG1_SYS_VBUSVALID;
+		writel(reg, gphy->usb3_top_base + USBCS_PHY_CFG1_OFFSET);
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
+	reg = readl(gphy->usb2_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
+	reg &= ~USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL;
+	reg &= ~USBCS_USB2PHY_CFG21_REF_FREQ_SEL;
+	reg |= FIELD_PREP(USBCS_USB2PHY_CFG21_REF_FREQ_SEL, 0);
+	writel(reg, gphy->usb2_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
+
+	reg = readl(gphy->usb2_cfg_base + USBCS_USB2PHY_CFG19_OFFSET);
+	reg &= ~USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV;
+	reg |= FIELD_PREP(USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV, 368);
+	writel(reg, gphy->usb2_cfg_base + USBCS_USB2PHY_CFG19_OFFSET);
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
+	reg = readl(gphy->usb2_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
+	reg |= USBCS_USB2PHY_CFG21_PHY_ENABLE;
+	writel(reg, gphy->usb2_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
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
+	reg = readl(gphy->usb2_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
+	reg &= ~USBCS_USB2PHY_CFG21_PHY_ENABLE;
+	writel(reg, gphy->usb2_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
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
+	gphy->usb2_cfg_base = devm_platform_ioremap_resource_byname(pdev,
+								    "usb2_cfg");
+	if (IS_ERR(gphy->usb2_cfg_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->usb2_cfg_base),
+				    "invalid usb2 cfg\n");
+
+	gphy->usb3_top_base = devm_platform_ioremap_resource_byname(pdev,
+								    "usb3_top");
+	if (IS_ERR(gphy->usb3_top_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->usb3_top_base),
+				    "invalid usb3 top\n");
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
2.51.1.851.g4ebd6896fd-goog



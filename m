Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D54CCD186
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 06:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ka8Q7nlHWOoI2RkFnFPZVDeuOoF3NtDVxhEhxWMkISg=; b=z/n4I+VS/uat3nCecB3cJKluOL
	+ejfuklNZTx5g0+H0Qns9raQ+OsZHYMwtEqNrbJRevYwwyJssAQDolGg8qXHaqmY685R420mvwsao
	lefMHLnsZYFGobXbAmio5Jo8sv5fNlmg9Nl3VavgK2IF99BOZr8Ypw+0gCtGkfaXtGySnEXv4f5ft
	KzOAZD6wgn0vkyTLiFF4TPRYMvhKgOV73uIjIe8LfPt+weMtmE0cmtS1J93+GCblVUSDzFOkXebSa
	SWf00DAYcYbQyVoXbE3rnEWgwZDDG/IIzLG9rgoOyWTFjVmHr/lEbQu7pB9ByV4xBzGeo0SQtUg+a
	LShYBILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6NDu-00000003FMY-3qBz;
	Wed, 08 Oct 2025 06:00:26 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6NDr-00000003FIN-1oxc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 06:00:24 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-28e8d1d9b13so80897965ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 23:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759903222; x=1760508022; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ka8Q7nlHWOoI2RkFnFPZVDeuOoF3NtDVxhEhxWMkISg=;
        b=Mw+4jh8Lbw9l/96CzsaTBlxvipBh4F7dUhSz98A+ZT5jSMUOCH6NCg1NLwub61K0Jt
         ePTHcIp/ujnA4zz9EL4O7uQXAWnXE5AAFSkciZkC0uFKM3HWeHyJRQelOvkp1nvrW8rd
         zH3Ew0x2q95vkz64Q5dER1g7LrZAj1xHCTqjk5NVVROxL3OQ5xy/wWOEeZEZkCe35szA
         4vNLcpP5ztQhTrB7siFDVvyPxNoOpI34JvyE/VFRHF0T97KFTui1GroRiBuSTu+GJxQT
         E52UFSh9feNKo68+5FcKjpIJGoMXFVj03Y8E+EP0zlB+NITpb3v9diMkAdpkscaWVLOR
         l58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759903222; x=1760508022;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ka8Q7nlHWOoI2RkFnFPZVDeuOoF3NtDVxhEhxWMkISg=;
        b=HATuZ3qGtcJ0c48Fv7i/q+W3caD1itTOMmJRQ3eROidsIAnVLpzzWLu09Q2egNXQw8
         k+7VKkmqTNwO5suluXMrNNNODRK19Woy6fX0oZ8PobP1AJFe9OBQ+aGdv42zqs4boCZf
         jl3O9dkWnI0g1qMnXVmIIO3Q2LiX8Jz5t5Ydz8q7P936NN4AOUQObAJUoHgK59BFw3qY
         4tpUPLb2JKgqy4lvm9pmREU5fxPsL4sOMdHiREyKqtIGC7xuPCPVu7yWHk+5r7QmYUWf
         9RfyQ5Ftt05OT5WjOer1cv9JFNG44dwiqhEv9Ciw/m3bz4YnOw4QZUvIxTqr9sRLs6zO
         NHuA==
X-Forwarded-Encrypted: i=1; AJvYcCVCjv3yDcFOeN7BCAsw9XI+M8TG3/pIPFTfbvv1Whx9Zp35CFY7fJdoD7rCA6lW2PnpqYGWlDi4HNamTbzfdLkU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1mhvI8+mfJUZ0kJwKibMS3r7vFVUWzWT+BIjKzGHLaTht80rH
	EPYfPWSGGvEdNf6L562wxJnL/EMZ7aCcMbPBKiLYkmea+fxjPiOXJlIEaGIWUHrF94kkqRrpp8l
	CDqL0SA==
X-Google-Smtp-Source: AGHT+IHEgK0iSfGPTqrfxzDEFvxdlz9aMrrAMDN66bGMiYvI5hGjGDvEExy9qsuc4PeR2LLXj7IghdV+NhY=
X-Received: from plot12.prod.google.com ([2002:a17:902:8c8c:b0:27d:6f45:42ec])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a6b:b0:25c:abb3:9bae
 with SMTP id d9443c01a7336-29027385222mr27269835ad.48.1759903222057; Tue, 07
 Oct 2025 23:00:22 -0700 (PDT)
Date: Wed,  8 Oct 2025 06:00:00 +0000
In-Reply-To: <20251008060000.3136021-1-royluo@google.com>
Mime-Version: 1.0
References: <20251008060000.3136021-1-royluo@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008060000.3136021-5-royluo@google.com>
Subject: [PATCH v2 4/4] phy: Add Google Tensor SoC USB PHY driver
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_230023_480321_BAC18DDB 
X-CRM114-Status: GOOD (  26.26  )
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
 drivers/phy/Kconfig          |  14 ++
 drivers/phy/Makefile         |   1 +
 drivers/phy/phy-google-usb.c | 286 +++++++++++++++++++++++++++++++++++
 3 files changed, 301 insertions(+)
 create mode 100644 drivers/phy/phy-google-usb.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 58c911e1b2d2..0966ab0297df 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -101,6 +101,20 @@ config PHY_NXP_PTN3222
 	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
 	  Speed and High Speed.
 
+config PHY_GOOGLE_USB
+	tristate "Google Tensor SoC USB PHY driver"
+	depends on HAS_IOMEM
+	depends on OF
+	depends on TYPEC
+	depends on USB_DWC3_GOOGLE
+	select GENERIC_PHY
+	default USB_DWC3_GOOGLE
+	help
+	  Enable support for the USB PHY on Google Tensor SoCs, starting with
+	  the G5 generation. This driver provides the PHY interfaces to
+	  interact with the SNPS eUSB2 and USB 3.2/DisplayPort Combo PHY, both
+	  of which are integrated with the DWC3 USB controller.
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
index 000000000000..4027d38dc34b
--- /dev/null
+++ b/drivers/phy/phy-google-usb.c
@@ -0,0 +1,286 @@
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
+#define USBCS_TOP_CTRL_CFG1_OFFSET 0x0
+#define USBCS_TOP_CTRL_CFG1_USB2ONLY_MODE BIT(5)
+
+enum google_usb_phy_id {
+	GOOGLE_USB2_PHY,
+	GOOGLE_USB_PHY_NUM,
+};
+
+struct google_usb_phy_instance {
+	int index;
+	struct phy *phy;
+	struct clk *clk;
+	struct reset_control *rst;
+};
+
+struct google_usb_phy {
+	struct device *dev;
+	void __iomem *usb2_cfg_base;
+	void __iomem *dp_top_base;
+	void __iomem *usb_top_cfg_base;
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
+	 /*
+	  * TODO: usb2only mode should be removed once usb3 is supported
+	  */
+	reg = readl(gphy->usb_top_cfg_base + USBCS_TOP_CTRL_CFG1_OFFSET);
+	reg |= USBCS_TOP_CTRL_CFG1_USB2ONLY_MODE;
+	writel(reg, gphy->usb_top_cfg_base + USBCS_TOP_CTRL_CFG1_OFFSET);
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
+	ret = clk_prepare_enable(inst->clk);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(inst->rst);
+	if (ret) {
+		clk_disable_unprepare(inst->clk);
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
+	reset_control_assert(inst->rst);
+	clk_disable_unprepare(inst->clk);
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
+								    "usb2_cfg_csr");
+	if (IS_ERR(gphy->usb2_cfg_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->usb2_cfg_base),
+				    "invalid usb2 cfg csr\n");
+
+	gphy->dp_top_base = devm_platform_ioremap_resource_byname(pdev,
+								  "dp_top_csr");
+	if (IS_ERR(gphy->dp_top_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->dp_top_base),
+				    "invalid dp top csr\n");
+
+	gphy->usb_top_cfg_base = devm_platform_ioremap_resource_byname(pdev,
+								       "usb_top_cfg_csr");
+	if (IS_ERR(gphy->usb_top_cfg_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->usb_top_cfg_base),
+				    "invalid usb top cfg csr\n");
+
+	inst = &gphy->insts[GOOGLE_USB2_PHY];
+	inst->index = GOOGLE_USB2_PHY;
+	phy = devm_phy_create(dev, NULL, &google_usb2_phy_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy),
+				     "failed to create usb2 phy instance\n");
+	inst->phy = phy;
+	phy_set_drvdata(phy, inst);
+	inst->clk = devm_clk_get(dev, "usb2_phy_clk");
+	if (IS_ERR(inst->clk))
+		return dev_err_probe(dev, PTR_ERR(inst->clk),
+				     "failed to get usb2 phy clk\n");
+	inst->rst = devm_reset_control_get_exclusive(dev, "usb2_phy_reset");
+	if (IS_ERR(inst->rst))
+		return dev_err_probe(dev, PTR_ERR(inst->rst),
+				     "failed to get usb2 phy reset\n");
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
2.51.0.710.ga91ca5db03-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE9DE8FDBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 00:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imcuwF0JUlN4OspxFvUKhy2NCyFIaWBW487YqewJS3w=; b=rixWqqdG52r+k4vm3QihPFTTgp
	Qn8Jq0yh2qlxlcdh4LDHWBXSWa8gp8MRy33Jg7bWCgZcPtAHRcO9sMbz7PLLT9o7Znc5NB1N7V9Vf
	l0z1e3a4yW/4+5SMzoNJvs4ZUNhPJNlZlpyqHJCqXaIqu+OlwCgKT35RVAeqKpi4CnzL8BsMg4L9z
	+9fW9xb7M432Rr3ioNf+jBg4ItxLhn3vTbtzUHAE5t3Z9BLS4zbCNBeiOTsabol3yz75Zt4nfhU8u
	YuhdJeHx6OWwB1x+XQqkk9TraO6CqC8eAcO3KmIIhsp2ocfl3F/mjWcSTboJ/Q0FX+VN/grCdAueE
	ctXzYGHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZIZB-00000001bsY-2sxe;
	Sat, 27 Dec 2025 00:53:57 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZIZ6-00000001bpY-3wcb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 00:53:54 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b609c0f6522so13369206a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 16:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766796831; x=1767401631; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=imcuwF0JUlN4OspxFvUKhy2NCyFIaWBW487YqewJS3w=;
        b=Qq9SvKwni07IHFX1czxJn0oV+dPP/pNMsFimzbj8Fgoum8nMMvXqsYV0/LIPM3zEFF
         ipE3QK0frQbCDwaB/a9s02VOlSgDb5O1iDyt/8u1z2hqjG3l5p8ZQ7IPaPUZvhqcxNdL
         njWYHG7z/+ZI38IhIUhbUoSQaFhWpwHEsXWgyNCB1S4W78bp3e0CYtLV2TA9PHYs/WF6
         0egfv/HC1pdDoPseTpDQall5jtla4iBS0zvJ+E6IRg0bHjWn7MFWsycfYitv3GQEeRI4
         hjkjPZjz3WUXcyrXPXfGJZOC4pvRlBPyzWej1iNfNtK+LCAFVONO++dGWnxxzhNgXTNo
         lfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766796831; x=1767401631;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=imcuwF0JUlN4OspxFvUKhy2NCyFIaWBW487YqewJS3w=;
        b=jbd2VoQj+D/3ZidEHvfrl3y8ecqM00jmpSI6VIA4xYgx8ABagZb0+uLFtMNvqWE2CD
         lY2iEESnKZJLiBl0BL6d2Yg73LLm5vA1STNyzrGCrkLnb/PiJOOrQaitcA+fB+ftTC9l
         1ZwaEuRk9lATop3RAO4+eTm6ekdTOlkok6fKGknSdv3YKWu5ppmym9Oscurp1j5+En5z
         vbOW4uTpozvVxUqlPeP04MUOL0TCS6XvpxP7P9UxH81SQleYU8NPT37wD4ZdKfNEU8YS
         72tHOL+mUmj7FfuXXxDITNBd/ByY0fZIx+KsPZDDWh6xh8GUzfamwsPBGxYDFPHCea3L
         Fjpw==
X-Forwarded-Encrypted: i=1; AJvYcCWhMsIwJx6YSOOBEXXNMwEfZA7TCAwbmDqNsazCF9VX9UIdKHZMKHOAP313auL273ohjB8Tg2iWBSwsTSwIoYgw@lists.infradead.org
X-Gm-Message-State: AOJu0YycFJur/ql2gMZv++Fuwd4fEMYU3Fb8AeBoNt/43K92tssxR7Qe
	koaE/cOdLsWIAcqm4trya0CDy7z87uIqS8W85Pm0HFL6C3OVZe+ufaffuoQMZ+ZyK9ftst4nUjL
	0q7AB6w==
X-Google-Smtp-Source: AGHT+IGy0NYsjSqfSY20rF06aXmXWh0DNWhjyzSD+Ty9D3mRax7bNY8RDRXwpW5ypRxibWuuFXtjthoHhiA=
X-Received: from dlww9.prod.google.com ([2002:a05:7022:ea29:b0:11d:fd0d:f00f])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6887:b0:11b:a892:80b4
 with SMTP id a92af1059eb24-121721ab83amr29076221c88.5.1766796831481; Fri, 26
 Dec 2025 16:53:51 -0800 (PST)
Date: Sat, 27 Dec 2025 00:53:29 +0000
In-Reply-To: <20251227-phyb4-v10-0-e8caf6b93fe7@google.com>
Mime-Version: 1.0
References: <20251227-phyb4-v10-0-e8caf6b93fe7@google.com>
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766796826; l=12064;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=Q5SXXqBxPBUl+JV1mRuyOtPON0e8BKeGJC72RsaNL2I=; b=LviRio2A3aHLenK3RYCpmiwVtMO+0cAxKsaLFJCFcSw3hQUIea3n9BIP++GkzuOJPK80AgUTt
 BXWcwXA+KbXDc/Bp+D4eSCez9mKU2bWkKGDrrfgdkiwX6s0kJk+3TGG
X-Mailer: b4 0.14.2
Message-ID: <20251227-phyb4-v10-2-e8caf6b93fe7@google.com>
Subject: [PATCH v10 2/2] phy: Add Google Tensor SoC USB PHY driver
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_165352_992288_B4869FDF 
X-CRM114-Status: GOOD (  23.53  )
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

Support the USB PHY found on Google Tensor G5 (Laguna). This
particular USB PHY supports both high-speed and super-speed
operations, and is integrated with the SNPS DWC3 controller that's
also on the SoC. This initial patch specifically adds functionality
for high-speed.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
 MAINTAINERS                  |   1 +
 drivers/phy/Kconfig          |  10 ++
 drivers/phy/Makefile         |   1 +
 drivers/phy/phy-google-usb.c | 296 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 308 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index faedcf6994e0be0c29c03dc424ca86bc9a1bbd70..f220fbba72391ed8011e02d3e9c0dfe438c9d723 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10725,6 +10725,7 @@ F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
+F:	drivers/phy/phy-google-usb.c
 F:	drivers/soc/samsung/gs101-pmu.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
 F:	include/dt-bindings/clock/google,gs101*
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 678dd0452f0aa0597773433f04d2a9ba77474d2a..07e71441dece2456423744a1cf90fa4719b6288f 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -25,6 +25,16 @@ config GENERIC_PHY_MIPI_DPHY
 	  Provides a number of helpers a core functions for MIPI D-PHY
 	  drivers to us.
 
+config PHY_GOOGLE_USB
+	tristate "Google Tensor SoC USB PHY driver"
+	select GENERIC_PHY
+	help
+	  Enable support for the USB PHY on Google Tensor SoCs, starting with
+	  the G5 generation (Laguna). This driver provides the PHY interfaces
+	  to interact with the SNPS eUSB2 and USB 3.2/DisplayPort Combo PHY,
+	  both of which are integrated with the DWC3 USB DRD controller.
+	  This driver currently supports USB high-speed.
+
 config PHY_LPC18XX_USB_OTG
 	tristate "NXP LPC18xx/43xx SoC USB OTG PHY driver"
 	depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index bfb27fb5a494283d7fd05dd670ebd1b12df8b1a1..1d3a8333ce1512c2ec21012aacd75ddbbea81889 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -6,6 +6,7 @@
 obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
 obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+= phy-core-mipi-dphy.o
 obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
+obj-$(CONFIG_PHY_GOOGLE_USB)		+= phy-google-usb.o
 obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+= phy-lpc18xx-usb-otg.o
 obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.c
new file mode 100644
index 0000000000000000000000000000000000000000..ab20bc20f19eae2268ad62f9d8be4387f9bad92d
--- /dev/null
+++ b/drivers/phy/phy-google-usb.c
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * phy-google-usb.c - Google USB PHY driver
+ *
+ * Copyright (C) 2025, Google LLC
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
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
+	struct google_usb_phy *parent;
+	unsigned int index;
+	struct phy *phy;
+	unsigned int num_clks;
+	struct clk_bulk_data *clks;
+	unsigned int num_rsts;
+	struct reset_control_bulk_data *rsts;
+};
+
+struct google_usb_phy {
+	struct device *dev;
+	struct regmap *usb_cfg_regmap;
+	unsigned int usb2_cfg_offset;
+	void __iomem *usbdp_top_base;
+	struct google_usb_phy_instance *insts;
+	/*
+	 * Protect phy registers from concurrent access, specifically via
+	 * google_usb_set_orientation callback.
+	 */
+	struct mutex phy_mutex;
+	struct typec_switch_dev *sw;
+	enum typec_orientation orientation;
+};
+
+static void set_vbus_valid(struct google_usb_phy *gphy)
+{
+	u32 reg;
+
+	if (gphy->orientation == TYPEC_ORIENTATION_NONE) {
+		reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+		reg &= ~USBCS_PHY_CFG1_SYS_VBUSVALID;
+		writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+	} else {
+		reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+		reg |= USBCS_PHY_CFG1_SYS_VBUSVALID;
+		writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
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
+	struct google_usb_phy *gphy = inst->parent;
+	u32 reg;
+	int ret;
+
+	dev_dbg(gphy->dev, "initializing usb2 phy\n");
+
+	guard(mutex)(&gphy->phy_mutex);
+
+	regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
+	reg &= ~USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL;
+	reg &= ~USBCS_USB2PHY_CFG21_REF_FREQ_SEL;
+	reg |= FIELD_PREP(USBCS_USB2PHY_CFG21_REF_FREQ_SEL, 0);
+	regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
+
+	regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG19_OFFSET, &reg);
+	reg &= ~USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV;
+	reg |= FIELD_PREP(USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV, 368);
+	regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG19_OFFSET, reg);
+
+	set_vbus_valid(gphy);
+
+	ret = clk_bulk_prepare_enable(inst->num_clks, inst->clks);
+	if (ret)
+		return ret;
+
+	ret = reset_control_bulk_deassert(inst->num_rsts, inst->rsts);
+	if (ret) {
+		clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
+		return ret;
+	}
+
+	regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
+	reg |= USBCS_USB2PHY_CFG21_PHY_ENABLE;
+	regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
+
+	return 0;
+}
+
+static int google_usb2_phy_exit(struct phy *_phy)
+{
+	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
+	struct google_usb_phy *gphy = inst->parent;
+	u32 reg;
+
+	dev_dbg(gphy->dev, "exiting usb2 phy\n");
+
+	guard(mutex)(&gphy->phy_mutex);
+
+	regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
+	reg &= ~USBCS_USB2PHY_CFG21_PHY_ENABLE;
+	regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
+
+	reset_control_bulk_assert(inst->num_rsts, inst->rsts);
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
+	struct typec_switch_desc sw_desc = { };
+	struct google_usb_phy_instance *inst;
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct google_usb_phy *gphy;
+	struct phy *phy;
+	u32 args[1];
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
+	gphy->usb_cfg_regmap =
+		syscon_regmap_lookup_by_phandle_args(dev->of_node,
+						     "google,usb-cfg-csr",
+						     ARRAY_SIZE(args), args);
+	if (IS_ERR(gphy->usb_cfg_regmap)) {
+		return dev_err_probe(dev, PTR_ERR(gphy->usb_cfg_regmap),
+				     "invalid usb cfg csr\n");
+	}
+
+	gphy->usb2_cfg_offset = args[0];
+
+	gphy->usbdp_top_base = devm_platform_ioremap_resource_byname(pdev,
+								     "usbdp_top");
+	if (IS_ERR(gphy->usbdp_top_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->usbdp_top_base),
+				    "invalid usbdp top\n");
+
+	gphy->insts = devm_kcalloc(dev, GOOGLE_USB_PHY_NUM, sizeof(*gphy->insts), GFP_KERNEL);
+	if (!gphy->insts)
+		return -ENOMEM;
+
+	inst = &gphy->insts[GOOGLE_USB2_PHY];
+	inst->parent = gphy;
+	inst->index = GOOGLE_USB2_PHY;
+	phy = devm_phy_create(dev, NULL, &google_usb2_phy_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy),
+				     "failed to create usb2 phy instance\n");
+	inst->phy = phy;
+	phy_set_drvdata(phy, inst);
+
+	inst->num_clks = 2;
+	inst->clks = devm_kcalloc(dev, inst->num_clks, sizeof(*inst->clks), GFP_KERNEL);
+	if (!inst->clks)
+		return -ENOMEM;
+	inst->clks[0].id = "usb2";
+	inst->clks[1].id = "usb2_apb";
+	ret = devm_clk_bulk_get(dev, inst->num_clks, inst->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get u2 phy clks\n");
+
+	inst->num_rsts = 2;
+	inst->rsts = devm_kcalloc(dev, inst->num_rsts, sizeof(*inst->rsts), GFP_KERNEL);
+	if (!inst->rsts)
+		return -ENOMEM;
+	inst->rsts[0].id = "usb2";
+	inst->rsts[1].id = "usb2_apb";
+	ret = devm_reset_control_bulk_get_exclusive(dev, inst->num_rsts, inst->rsts);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get u2 phy resets\n");
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
+		.compatible = "google,lga-usb-phy",
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
2.52.0.358.g0dd7633a29-goog



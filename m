Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6270ED2CE1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 03:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mn09YZqG3ZdR2hhM9u1NP9jyRV9UZLpDnmXLBTuRe8o=; b=D3cxU+/w5SX3O6ix2ljOErnNAP
	ubG2atoCtMIjTpu5NAQsdfevZsq7hTEn06d8JWdwOsgDD1LAkrrgpIytd6EeRs2fxJq866dgd9vGi
	07gK6YE2D+OUGLGWalQgMKYyLnYVuiyKbCqBoUYRnP8w5NMFE72euDx2+cmz7MuP7RZx/td14+saM
	RxssvR9amy0vVQqMtJqzYpgPnMrfNp93BP17JiPDpGp9e+MKv5PdVhIGjtlhX5zeER+sXX8PE6S1r
	0ro6/wIG071nt6Miuj8OGfVak23Lbb7rVkR7gOqpiHqYILARqfj+hdWeymX2W0rLfi1s+gwTte6Dc
	qHuK0Izw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRMtu-00000008zVz-2fCq;
	Fri, 05 Dec 2025 03:54:35 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRMtj-00000008zT1-2YRG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 03:54:25 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-bb27b422cf2so2629729a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 19:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764906861; x=1765511661; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mn09YZqG3ZdR2hhM9u1NP9jyRV9UZLpDnmXLBTuRe8o=;
        b=heDFQyID2Spiwwi7VjtHF5Wl5L6h9ugoWCNb4LAZoU6+xS4z/kbZKqSAn4u0O2xhG4
         WzrZ8WQlnm7Sj0mM8DVPUzohquOEVBvcT+Zx26M28dXLSksMoNcSata0/JeQu5KOHkV8
         7zgtHFQNQ5lzciN1tsx5+n0eJOLE3O7302PtJzaN6fbEkcZVBbmodqTDg28OhTdREBBE
         bLcISl3XDVpchr+FebyKldbkoaSr4hwkQAKg0CUTvgW8kLEJrSzByO9emEgy6c5uUCQP
         RJjsUDSmEud/B85kOYjo5vce54iiGtK3G5v2o1wOa3FVpOtpWum7sZOFTATUUv2ITSij
         OlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764906861; x=1765511661;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mn09YZqG3ZdR2hhM9u1NP9jyRV9UZLpDnmXLBTuRe8o=;
        b=ZFgL4KMUNaDHFdDaarktGJMM1a1FyPo2VU83L/Ce6UKlvWxg9uK+XEBqcwq7kJB2L0
         ucT55tpnqKN32M1hpArXFvvRpeK06Gs5zlTXCeRCqe+qVGe2o0aFtrQsj6U3bw3Af8WT
         JfYHQBdNn8xvErX5nwJ29Wh/3PnO4lu5y3jjcd7t/rrMrycWSnt+uJZbIbk6zI2jBHe9
         wNIM34bBaQVPM0Swv+7t0SKGXotglcHpgQqYmlxNuvZ12CJTNVa478hJQTj2dq5rOB8/
         FlccAQjZm6f9UBIzPptV3iOMMNjrhEcynaGT7N7FBiyl/Yii7yeEAiCifDm3k7+bQq6G
         FgWA==
X-Forwarded-Encrypted: i=1; AJvYcCVkuzmyQblTHeZQv3CGFfjSw+WIbbwlqVCFDq8M4tbAqgNxWsuHYKUQWIvJuQQ54CbBFwXFKUf6eLcPYKvWO0cn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6JNh7I+FP4WKtGLYMK7O7si10sMggNzFcZHdd4nLyrkc16i4V
	drtryNndevtSxPxTs/RY5RSAoa1pDnYZ1iCarGYbYaLIDR4q/20d71OiUWBRqQ6X8ZCyPXyVYAY
	FlnHTGg==
X-Google-Smtp-Source: AGHT+IGG53FWe3vmtRiPdnG4O3/PlCMEDtVYNzemkJs1ZKi2r2jqUT5PlkwvhAKEZUJ2VsGpyH4KBa04hQ4=
X-Received: from dybph6.prod.google.com ([2002:a05:7301:4186:b0:2a4:5178:f11f])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:77c4:b0:2a4:64ae:e071
 with SMTP id 5a478bee46e88-2ab92e2c2d5mr4487405eec.30.1764906860783; Thu, 04
 Dec 2025 19:54:20 -0800 (PST)
Date: Fri, 05 Dec 2025 03:54:12 +0000
In-Reply-To: <20251205-phyb4-v8-0-c59ea80a4458@google.com>
Mime-Version: 1.0
References: <20251205-phyb4-v8-0-c59ea80a4458@google.com>
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764906855; l=12047;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=e6ybp/g2YKAsTFm85i/pZ1GWUt6srg9NZgNspiBJfBI=; b=aPMwC6IXXLZjdFvjLaHMP+MW7P7R3+YzZWUpMwX/QNdl5kDjdZEwBzSOIwH84YnGNu03atpr1
 4UgU/Z0yNNMCsirdhamMbf+qz/Upam4qGRnty7Q8Rn8poz8EikyKPMn
X-Mailer: b4 0.14.2
Message-ID: <20251205-phyb4-v8-2-c59ea80a4458@google.com>
Subject: [PATCH v8 2/2] phy: Add Google Tensor SoC USB PHY driver
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_195423_662637_9576D011 
X-CRM114-Status: GOOD (  24.12  )
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
 drivers/phy/Kconfig          |  11 ++
 drivers/phy/Makefile         |   1 +
 drivers/phy/phy-google-usb.c | 295 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 308 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 27e6f9e20f5e83b861c6a04dededb93b8561715c..50ffe42c7c373914aa96314430f35843efc1dc07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10665,6 +10665,7 @@ F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
+F:	drivers/phy/phy-google-usb.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
 F:	include/dt-bindings/clock/google,gs101.h
 K:	[gG]oogle.?[tT]ensor
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 678dd0452f0aa0597773433f04d2a9ba77474d2a..c6fbf83de656349f5c9be27a18748b9bd327f683 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -101,6 +101,17 @@ config PHY_NXP_PTN3222
 	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
 	  Speed and High Speed.
 
+config PHY_GOOGLE_USB
+	tristate "Google Tensor SoC USB PHY driver"
+	depends on ARCH_GOOGLE || COMPILE_TEST
+	select GENERIC_PHY
+	help
+	  Enable support for the USB PHY on Google Tensor SoCs, starting with
+	  the G5 generation (Laguna). This driver provides the PHY interfaces
+	  to interact with the SNPS eUSB2 and USB 3.2/DisplayPort Combo PHY,
+	  both of which are integrated with the DWC3 USB DRD controller.
+	  This driver currently supports USB high-speed.
+
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index bfb27fb5a494283d7fd05dd670ebd1b12df8b1a1..aeaaaf988554a24bb572d8b34b54638a6a3aed73 100644
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
index 0000000000000000000000000000000000000000..97e345fdab9b3679e7a76f6957ae3814ef3420e8
--- /dev/null
+++ b/drivers/phy/phy-google-usb.c
@@ -0,0 +1,295 @@
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
+	int index;
+	struct phy *phy;
+	int num_clks;
+	struct clk_bulk_data *clks;
+	int num_rsts;
+	struct reset_control_bulk_data *rsts;
+};
+
+struct google_usb_phy {
+	struct device *dev;
+	struct regmap *usb_cfg_regmap;
+	unsigned int usb2_cfg_offset;
+	void __iomem *usbdp_top_base;
+	struct google_usb_phy_instance insts[GOOGLE_USB_PHY_NUM];
+	/*
+	 * Protect phy registers from concurrent access, specifically via
+	 * google_usb_set_orientation callback.
+	 */
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
+	struct google_usb_phy *gphy = to_google_usb_phy(inst);
+	u32 reg;
+	int ret = 0;
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
+	inst = &gphy->insts[GOOGLE_USB2_PHY];
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
2.52.0.223.gf5cc29aaa4-goog



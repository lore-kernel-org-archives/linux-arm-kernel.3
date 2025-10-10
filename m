Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD01CCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 20:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cy6GouhBVW6s2NTnVqmrY/myMZPh7UG7EmUWWoH+r4=; b=r1Xp5u8CCXU8QLcil+0dqyoPXc
	B348nWddSZTjZQfahD86k5mVBASVYSL6ugMndVMOOtNnn8CVptUrjcWI6s6hlkdtT8prnlu+6xJE7
	kGahfY9JygUfgc85lsnG+ApJdro5dGY2UprztV+Jy0FklMEZein9LETsISOl8dQMiCEtcuoHiuHOW
	EZCK9W/c87sg+pn8fP9O885dU6o2zSaVvVKsG/x3iefbD4hjBytp0SqDjDaFPOb1jhGLVd1OTU+3J
	OhfJ9AlNYQhsRRDU8Lhkm/9V0liN7Ow5zlklRoK3DS04q67nIvJAEALRRFRYZEHDE2sSui5+upYsI
	9VrFQxZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7JXZ-00000009IeM-35Ug;
	Fri, 10 Oct 2025 20:16:37 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7JXX-00000009Ia8-0SGq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 20:16:36 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-7448a11535aso54285347b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 13:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760127393; x=1760732193; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9cy6GouhBVW6s2NTnVqmrY/myMZPh7UG7EmUWWoH+r4=;
        b=Tf/2gnDm5uhIFqMLv3zddsYZwBLwlTyw+tvwDsJJS9UfzMlPt2cDr+6ICyLsjX5AOF
         DxEKWZTXV3LisDEk5419HlFzld3DMtuGAYu6kbz9EoW36PANygshNqXlxJI5nA3N9Sm2
         slguuXs8+tF/L45jE2V6NamMr61A2hPZEt0lG81UbuVm5N1xQioO42g7SDt6J1FkbKze
         KXaEHPhaVuC4+Z1Fzfa6JqNM28/hdwHz4HHE02B84M/SV4CbKLZRP582+joai7ZrjOxS
         0MoHNHUqf9gjXOtNUW6entxqi3a+YZZdCZ+9xXgYJNFmWv8E13235C49iFYsO8fWfJWw
         /fYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760127393; x=1760732193;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9cy6GouhBVW6s2NTnVqmrY/myMZPh7UG7EmUWWoH+r4=;
        b=nGe+gjD7VtdW+9nwHVN7Ct4KePw80IhrATIH0oqtN2/I+Kam9+fiH9JmVHiFFvd7Zp
         63K8bmrROAZ9/NbMgAJnKz/loj6dsesm8cjbWyI9ovr7FG093eLu/dcyHFUsPXer5Bz3
         P5TtxkAiD3gglUVTOAAjBJ5juxOEpO58+sj7j3cGDCFrZq7bbrk6HTmhgX9QBU+0EJkX
         TGR+2tEhZYC3xcSVeu6n7j8K1GJmYmz3bxEEbCWVH/u7F4FxO7uK91UDtjL5/D3agAYE
         m4d3kuYxC6BnMpHyAndJGla0QNa0OGk+IeYZMjl0brNV5lahSkGnPeEt+ypPRQ+A87wu
         L9Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXIlRBY+gU1yzp6rWWHz+LmxtobCo3YKG++pmT/utuOtge2Ts20/zUGdOrumyqTIJ1IoM8QvunxEvVSCbi3jf7M@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq9b75AxVaHt+1xC4P7vFMbEj3rK00dZHEWjbPEz/R0DZqEvCZ
	RHlwM/DUVH6CddN4u+h3d+QjXeVvwxrUtV1Ty9zgBlRGIZybajICIEho+kcA3f9xKpRiGCj3WwM
	mat5Arw==
X-Google-Smtp-Source: AGHT+IEbWQmNfsUoS0E86B8Mc7MgJPmXk9Os/ELYWWcQPdwSpoX4iRHmFp337Cqx69RXAXo6fdN1nrsPZUQ=
X-Received: from ywu4.prod.google.com ([2002:a05:690c:9a84:b0:767:a90d:1198])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690c:3693:b0:780:f8b7:c177
 with SMTP id 00721157ae682-780f8b7c4f5mr91345807b3.16.1760127393148; Fri, 10
 Oct 2025 13:16:33 -0700 (PDT)
Date: Fri, 10 Oct 2025 20:16:07 +0000
In-Reply-To: <20251010201607.1190967-1-royluo@google.com>
Mime-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com>
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
Message-ID: <20251010201607.1190967-5-royluo@google.com>
Subject: [PATCH v3 4/4] phy: Add Google Tensor SoC USB PHY driver
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
X-CRM114-CacheID: sfid-20251010_131635_167994_8917ACE5 
X-CRM114-Status: GOOD (  26.10  )
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
 drivers/phy/Kconfig          |  15 ++
 drivers/phy/Makefile         |   1 +
 drivers/phy/phy-google-usb.c | 286 +++++++++++++++++++++++++++++++++++
 3 files changed, 302 insertions(+)
 create mode 100644 drivers/phy/phy-google-usb.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 58c911e1b2d2..a01f91d6e05e 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -101,6 +101,21 @@ config PHY_NXP_PTN3222
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
index 000000000000..883abe64300c
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
+	void __iomem *u2phy_cfg_base;
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
+	gphy->u2phy_cfg_base = devm_platform_ioremap_resource_byname(pdev,
+								     "u2phy_cfg");
+	if (IS_ERR(gphy->u2phy_cfg_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->u2phy_cfg_base),
+				    "invalid usb2 cfg csr\n");
+
+	gphy->dp_top_base = devm_platform_ioremap_resource_byname(pdev,
+								  "dp_top");
+	if (IS_ERR(gphy->dp_top_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->dp_top_base),
+				    "invalid dp top csr\n");
+
+	gphy->usb_top_cfg_base = devm_platform_ioremap_resource_byname(pdev,
+								       "usb_top_cfg");
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
+	inst->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(inst->clk))
+		return dev_err_probe(dev, PTR_ERR(inst->clk),
+				     "failed to get usb2 phy clk\n");
+	inst->rst = devm_reset_control_get(dev, NULL);
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
2.51.0.740.g6adb054d12-goog



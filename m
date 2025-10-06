Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E846CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 23:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdBa1dNHqFCAS2+hTTbLrjvc4+nTHZT05jW4kQYHqAU=; b=1yrXmLnoRDY8l/hZe5DI5D9Rfx
	Y8Lug9y12yMH+mPCKtTs1yamV2Zx776DQe03y9lano8+EYDVnz7lqTZ9eSpLwxNoyxPAhBiuOCgs6
	ZnlW3CEVJOuN8bVNjY2GDmkOc1NQF8Y3demwPHTPawMx9tpvzXhUUbX9LH1I+vnKwSE9c/TS8BuPf
	dl3wPyhQlmc9K5QfBIqC/kvlnzCp7zC0BB+/jbVFm0H10ZLuoYMMeLHQ/0I35G7aAjhEV/SyBU+lv
	Ku4K8a71WGgNUjC/jUJOKgudKIOOndvUfq1hByZShiaLSJDhNo/DJ6SxGpzSWeO48TSZOnOBT+4pt
	/0vnerXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uWu-00000000zxI-0gvI;
	Mon, 06 Oct 2025 23:22:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uWs-00000000zw4-3whc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Oct 2025 23:22:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HdBa1dNHqFCAS2+hTTbLrjvc4+nTHZT05jW4kQYHqAU=; b=gxRBRbwINjYpKfv0wu/Gvd12Gh
	Ya/ysvxcYcFPRx9mzVmgdVBbNNhFDtxOAbSlrJX8WugVZrZP4aaXgHB7p32fEpWGZ51Rb3L7tKWTz
	Y3ySUN5gndporAjH3uajGSg5VGa8zJqbvuS5N6c/fZyWFYoVpnp2aJ4d6j33jxBIODgeH08ke13lA
	d80jTuKWKHrCx6yDdhX+dJmc7+3M0IIjxGDGmGtPUVB6LdPSbqDDLEJOWjZUaFlDB2d9ram1jAPUU
	0rAoYcVHaLGsgN7sHSYHx8Rwg1rOyVtKYfHrrlko1BToUH3Y93AP7YccSgHlRzevtwCkmkZbWJ3g0
	k+/6RbBg==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uWo-0000000HFYa-1op0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 23:22:05 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so4585090a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 16:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759792918; x=1760397718; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HdBa1dNHqFCAS2+hTTbLrjvc4+nTHZT05jW4kQYHqAU=;
        b=h74nSn2WVm50ojN1/wf+cwbixZJN77ek3CNhYKvStXvA27nAB0cbF6p2WOgt7aRkJC
         483A38AnlLIv4LEnxmoqWVITsW87KHxpWuJd233GQbtC1G9gjV5zzxFiZ3qG8F6nbaxI
         vHsF/jh2aIaSh6/5lMfb1FD+vLpTTwQg01mWRVrsjWIAcDIbeGx2VrQAChUDwQsRPSYj
         qIDlUbMtR03gAzye+QdG9vo0XrukWGVUkOU5od/v2zB3U8uumB3eXkoMJEVEWeB9kx3a
         4kFqQFDjmNRU/VKSocogi5KTYbl0H41Avc30dQDZjixF12D4LQ6EnnKTxGrs4r9OJDLP
         +NuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759792918; x=1760397718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HdBa1dNHqFCAS2+hTTbLrjvc4+nTHZT05jW4kQYHqAU=;
        b=HNs3L3kEcXsvxUrkt1ZBZkavwoZ73o/fh1Dw89gVk10AT00yuh4UjC7fWWpyI5cfXP
         bBGg+U4E7HqTDHEX6inXVJgGwLBknlbg+sfbmYq/OC6+5fHKUHPSQfTbdPJuXUMaMTbg
         Exnzs5H5HeLovhTxb7FjMHTaqE4q4RqPh52eOOY9w6KnAltOgUhs1ulc5ayYC1A3+8uz
         f8vqz7iMrYI8PNBWkXg59ZHo5LAjmkgtlzYFp1SAMc6nqV5XIJ4CSgVe4Ighj/0aZ4NQ
         cLIoaCpH2zONMl5tcHoWu4zH9gawUog08dAyong13TPe5L5/Qmmh3/ZqEwGS59hNGqYP
         emeg==
X-Forwarded-Encrypted: i=1; AJvYcCVn5vZbboqZsx3G3qZHZjdE+n/YfcWAZAofUmNbnSOvrnhsq2ioezJeB8WuiRpauIkmcpev95uakR5O/jv1aZ+a@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/KDIivy1xG3KEdHcQLCDFwn/x7MnEDP5Gi7PZ6f0ou3I9aq/v
	7xY+STmcrkdgFW/xXlMXQmznBU56Aldicie2ZHUI9RAUMARaUDcRJYaYi1XLzb/u62sa/P7iYah
	ezUQ3PQ==
X-Google-Smtp-Source: AGHT+IHCrazxJE0VodxQkYh/ySiAwffUOkcLakkOzySzdYCDetGseFf+qCf9zIoQeCWY/XlH7ga9uvTYgzY=
X-Received: from pjbb16.prod.google.com ([2002:a17:90a:110:b0:32f:46d:993b])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a8f:b0:330:852e:2bcc
 with SMTP id 98e67ed59e1d1-339c27b94e9mr15676987a91.21.1759792918222; Mon, 06
 Oct 2025 16:21:58 -0700 (PDT)
Date: Mon,  6 Oct 2025 23:21:24 +0000
In-Reply-To: <20251006232125.1833979-1-royluo@google.com>
Mime-Version: 1.0
References: <20251006232125.1833979-1-royluo@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251006232125.1833979-4-royluo@google.com>
Subject: [PATCH v1 3/4] usb: dwc3: Add Google SoC USB PHY driver
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_002202_548904_6E75E6F3 
X-CRM114-Status: GOOD (  26.24  )
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

Support the USB PHY found on Google Tensor SoCs.
This particular USB PHY supports both high-speed and super-speed
operations, and is paired with the SNPS DWC3 controller that's also
integrated on the SoCs.
This initial patch specifically adds functionality for high-speed.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/phy/Kconfig                 |   1 +
 drivers/phy/Makefile                |   1 +
 drivers/phy/google/Kconfig          |  15 ++
 drivers/phy/google/Makefile         |   2 +
 drivers/phy/google/phy-google-usb.c | 286 ++++++++++++++++++++++++++++
 5 files changed, 305 insertions(+)
 create mode 100644 drivers/phy/google/Kconfig
 create mode 100644 drivers/phy/google/Makefile
 create mode 100644 drivers/phy/google/phy-google-usb.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 58c911e1b2d2..7772c04d5f5c 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -106,6 +106,7 @@ source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
 source "drivers/phy/cadence/Kconfig"
 source "drivers/phy/freescale/Kconfig"
+source "drivers/phy/google/Kconfig"
 source "drivers/phy/hisilicon/Kconfig"
 source "drivers/phy/ingenic/Kconfig"
 source "drivers/phy/lantiq/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index c670a8dac468..1b6dd784351c 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -18,6 +18,7 @@ obj-y					+= allwinner/	\
 					   broadcom/	\
 					   cadence/	\
 					   freescale/	\
+					   google/	\
 					   hisilicon/	\
 					   ingenic/	\
 					   intel/	\
diff --git a/drivers/phy/google/Kconfig b/drivers/phy/google/Kconfig
new file mode 100644
index 000000000000..2ba13b77c819
--- /dev/null
+++ b/drivers/phy/google/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Phy drivers for Google platforms
+#
+config PHY_GOOGLE_USB
+	tristate "Google Tensor SoC series USB PHY driver"
+	depends on HAS_IOMEM
+	depends on OF
+	depends on TYPEC
+	depends on USB_DWC3_GOOGLE
+	select GENERIC_PHY
+	default y
+	help
+	  Add support for the USB PHY on Google SoC series, providing
+	  the PHY interface for the integrated USB DRD controller.
diff --git a/drivers/phy/google/Makefile b/drivers/phy/google/Makefile
new file mode 100644
index 000000000000..f926bd033533
--- /dev/null
+++ b/drivers/phy/google/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_PHY_GOOGLE_USB)	+= phy-google-usb.o
diff --git a/drivers/phy/google/phy-google-usb.c b/drivers/phy/google/phy-google-usb.c
new file mode 100644
index 000000000000..f666ea6fbd4e
--- /dev/null
+++ b/drivers/phy/google/phy-google-usb.c
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
+	gphy->usb2_cfg_base =
+			devm_platform_ioremap_resource_byname(pdev, "usb2_cfg_csr");
+	if (IS_ERR(gphy->usb2_cfg_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->usb2_cfg_base),
+				    "invalid usb2 cfg csr\n");
+
+	gphy->dp_top_base =
+			devm_platform_ioremap_resource_byname(pdev, "dp_top_csr");
+	if (IS_ERR(gphy->dp_top_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->dp_top_base),
+				    "invalid dp top csr\n");
+
+	gphy->usb_top_cfg_base =
+			devm_platform_ioremap_resource_byname(pdev, "usb_top_cfg_csr");
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
+		.compatible = "google,usb-phy",
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
2.51.0.618.g983fd99d29-goog



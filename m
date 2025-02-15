Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905D9C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 12:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51FSJwa1B8JQtgUr5uBGNpS4S0Fx4/SRveFo1cyR6gk=; b=LjEBLfAI3qlVtBeeXh4ISeiDGV
	foFwGNYt/fmXcjA3IO9jhyQvwwFtJwAYrcrJsRYqIrsoC3HylXC/TPbJDN3eNABVQe2KBAj0vIEUE
	7VwK0LpJvMD2PNBBNIgKj+MioLntOAzapAWhoBfwaxsw4W1jmGhWVt5oQe0aUD6gGina6kOrzO6hl
	JKE/vfQ1+eUhfzsptZuwdTPIXLlnbcw/nJe66wAOfVCfSQOxpQCCgvoLQObF899oY8HoPaagF6vNV
	CmR5RWMGJGAg3qLstjdQMZ8Wy3kabGHqwjSWds576mk3Bx58/zmS8+fdP7F8Sy6bkTZxcJthLUmrT
	LA7z6F+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHJB-0000000039D-14Ft;
	Sat, 15 Feb 2025 12:30:09 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHDW-000000002HY-342v;
	Sat, 15 Feb 2025 12:24:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43690d4605dso18403265e9.0;
        Sat, 15 Feb 2025 04:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739622257; x=1740227057; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51FSJwa1B8JQtgUr5uBGNpS4S0Fx4/SRveFo1cyR6gk=;
        b=bxem5QDoKXoKdnT8HgZGnFJN0csPu81+iGNODm4LII1ZBH4k06aN1tV6nud8FLeiNF
         9EqVren6Q3ASYjUd8NNW7r5kIIMxVlx6izQ3Dgadp2OUhIESmbeOWP85mkepYv0gT8wm
         6ExJIfUA/QFr5p3mY32mqwzPXQAtvdRQ5mHLlbBZeUbHRzHSVBpKGsKADmvuJMsVDVXQ
         ma0I6udu/f6LHhs6/cG86M1DuY5K9YRRnNT/Pwu48S2FgVQx7xsE37N9Yzkr8sccpceH
         XPhzS4NHtNLvdiMxs78PJ21nxLCK/ZfQLcyzz2NocuHTAWzY/Y8kEUByjjipSLbxFbYw
         elzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739622257; x=1740227057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51FSJwa1B8JQtgUr5uBGNpS4S0Fx4/SRveFo1cyR6gk=;
        b=Fd0UfNJa8ObQ9RCZM8f5zuT5ibQUuUb5KpNTgaBzWl4Z5Sos4ARx6T2d5lUSv5/Tnl
         aYrwNqAPq9w1nH2321qVZ7G9xEOduOlDXNAd66ccGqBm1g1wiCp1yRc3XEfO1ycAxpeb
         aDkwGLzEmM2mQWLvs40KzJKoAxBnF8b6HDbUfMtlsR4n/l2QRF+4kesbMxTyKkfGUrSu
         yfEmXglr2Q7wDcuI5YgopouRJo6xjjClbdbh2iv60cI2Pr/CG9mm9o5WIz+vtPTVwwLW
         oqwzWWZFy8Kk1W2iG6tL3qGMkt+juqgls2KQuILQvHTJEQtfDIDYDYkQR7JsVxktjx+D
         5S2A==
X-Forwarded-Encrypted: i=1; AJvYcCWffpUXvGJCyocxf6rBdG0vZtkBsQD2BZ1poTZrhHkumno8MoyDuQpsw1UR/7ptqSzrXbM+Hds5xr4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk0nRezNCDZhgV5cJsq/WPTYyS4CdHEJ6Au7Oj3ppHbzHdQE4c
	WFKID02ZIwbw/snb5vb+nUD2UCnAx4khQ7AeobUd471xUsBbLZAjX3toXg==
X-Gm-Gg: ASbGncsZhoS6JjCU2EcZa1+4SEyiBLhMgspCc6n8/YqelnELm5do5jWikCCddCq9yrP
	5Qm7UA3/b3HaqmJ/uzSYH7EP9AJaSU0onvvSfGFCJh3Qxp/YkzONfq49Rd+DfIuKw5s95nFv2BQ
	lBiNlZgGTgyfNWEJ9o2WSHQ3fs8JhfrUL8bB/x6+9MZqIQ80taSx37/+feYvJaq4JhWUbqNPdvI
	D9N86qns0S2kjkT39VGuVCr3hkhFjX60iPAINcaSDX23rI4J9hO7CpgO7OkvA/VdDcXwHRCJrLH
	9w5bNlps1JfjXR3Pq17rNwzvB2xo1wHML+U3kbCz9bWkVhuIFHFRsZ9rCpxMVCRsWRQ=
X-Google-Smtp-Source: AGHT+IGDu08NJm74LFNesvbHRE+N6+Y2beeK3Y8t6PLpq9R6tKeeegQvlmaspOLtMEpL/BcR/opmmQ==
X-Received: by 2002:a05:600c:4f51:b0:434:ff9d:a3a1 with SMTP id 5b1f17b1804b1-4396e6d4aa8mr25721445e9.2.1739622257010;
        Sat, 15 Feb 2025 04:24:17 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5b40sm7188175f8f.68.2025.02.15.04.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 04:24:16 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] phy: samsung: add Exynos2200 SNPS eUSB2 driver
Date: Sat, 15 Feb 2025 14:24:08 +0200
Message-ID: <20250215122409.162810-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_042418_780759_EA3742C2 
X-CRM114-Status: GOOD (  22.82  )
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

The Exynos2200 SoC uses Synopsis eUSB2 PHY for USB 2.0. Add a new
driver for it.

eUSB2 on Exynos SoCs is usually paired alongside a USB PHY controller.
Currently the driver is modelled to take and enable/disable the usb phy
controller when needed.

The driver is based on information from downstream drivers.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/samsung/Kconfig                   |  13 +
 drivers/phy/samsung/Makefile                  |   1 +
 .../phy/samsung/phy-exynos2200-snps-eusb2.c   | 351 ++++++++++++++++++
 3 files changed, 365 insertions(+)
 create mode 100644 drivers/phy/samsung/phy-exynos2200-snps-eusb2.c

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index e2330b089..f62285254 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -77,6 +77,19 @@ config PHY_S5PV210_USB2
 	  particular SoC is compiled in the driver. In case of S5PV210 two phys
 	  are available - device and host.
 
+config PHY_EXYNOS2200_SNPS_EUSB2
+	tristate "Exynos2200 eUSB 2.0 PHY driver"
+	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
+	depends on HAS_IOMEM
+	depends on USB_DWC3_EXYNOS
+	select GENERIC_PHY
+	select MFD_SYSCON
+	default y
+	help
+	  Enable USBCON PHY support for Exynos2200 SoC.
+	  This driver provides PHY interface for eUSB 2.0 controller
+	  present on Exynos5 SoC series.
+
 config PHY_EXYNOS5_USBDRD
 	tristate "Exynos5 SoC series USB DRD PHY driver"
 	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
index fea1f96d0..90b84c7fc 100644
--- a/drivers/phy/samsung/Makefile
+++ b/drivers/phy/samsung/Makefile
@@ -14,5 +14,6 @@ phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4210_USB2)	+= phy-exynos4210-usb2.o
 phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4X12_USB2)	+= phy-exynos4x12-usb2.o
 phy-exynos-usb2-$(CONFIG_PHY_EXYNOS5250_USB2)	+= phy-exynos5250-usb2.o
 phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
+obj-$(CONFIG_PHY_EXYNOS2200_SNPS_EUSB2)	+= phy-exynos2200-snps-eusb2.o
 obj-$(CONFIG_PHY_EXYNOS5_USBDRD)	+= phy-exynos5-usbdrd.o
 obj-$(CONFIG_PHY_EXYNOS5250_SATA)	+= phy-exynos5250-sata.o
diff --git a/drivers/phy/samsung/phy-exynos2200-snps-eusb2.c b/drivers/phy/samsung/phy-exynos2200-snps-eusb2.c
new file mode 100644
index 000000000..ee6d96411
--- /dev/null
+++ b/drivers/phy/samsung/phy-exynos2200-snps-eusb2.c
@@ -0,0 +1,351 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+
+#define EXYNOS2200_EUSB2_RST_CTRL		0x0
+#define EXYNOS2200_UTMI_PORT_RESET_MASK		GENMASK(5, 4)
+#define EXYNOS2200_EUSB_PHY_RESET_MASK		GENMASK(1, 0)
+
+#define EXYNOS2200_EUSB2_CMN_CTRL		0x4
+#define EXYNOS2200_PHY_CFG_RPTR_MODE		BIT(10)
+#define EXYNOS2200_REF_FREQ_SEL			GENMASK(6, 4)
+#define EXYNOS2200_PHY_ENABLE			BIT(0)
+
+#define EXYNOS2200_EUSB2_PLLCFG0		0x8
+#define EXYNOS2200_PLL_FB_DIV_MASK		GENMASK(19, 8)
+
+#define EXYNOS2200_EUSB2_PLLCFG1		0xc
+#define EXYNOS2200_PLL_REF_DIV			GENMASK(11, 8)
+
+#define EXYNOS2200_EUSB2_TESTSE			0x20
+#define EXYNOS2200_TEST_IDDQ			BIT(6)
+
+struct exynos2200_snps_eusb2_phy_drvdata {
+	const char * const *clk_names;
+	int n_clks;
+	const char * const *regulator_names;
+	int n_regulators;
+};
+
+struct exynos2200_snps_eusb2_phy {
+	struct phy *phy;
+	void __iomem *base;
+
+	struct clk *ref_clk;
+	struct clk_bulk_data *clks;
+	const struct exynos2200_snps_eusb2_phy_drvdata *drv_data;
+	struct reset_control *phy_reset;
+
+	struct regulator_bulk_data *vregs;
+
+	enum phy_mode mode;
+
+	struct phy *repeater;
+	struct phy *usbcon;
+};
+
+static void exynos2200_snps_eusb2_phy_write_mask(void __iomem *base, u32 offset,
+						 u32 mask, u32 val)
+{
+	u32 reg;
+
+	reg = readl_relaxed(base + offset);
+	reg &= ~mask;
+	reg |= val & mask;
+	writel_relaxed(reg, base + offset);
+
+	/* ensure above write is completed */
+	readl_relaxed(base + offset);
+}
+
+static int exynos2200_snps_eusb2_ref_clk_init(struct exynos2200_snps_eusb2_phy *phy)
+{
+	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
+
+	switch (ref_clk_freq) {
+	case 19200000:
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_CMN_CTRL,
+						     EXYNOS2200_REF_FREQ_SEL,
+						     0);
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG0,
+						     EXYNOS2200_PLL_FB_DIV_MASK,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 368));
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG1,
+						     EXYNOS2200_PLL_REF_DIV,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 0));
+		break;
+
+	case 20000000:
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_CMN_CTRL,
+						     EXYNOS2200_REF_FREQ_SEL,
+						     FIELD_PREP(EXYNOS2200_REF_FREQ_SEL, 1));
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG0,
+						     EXYNOS2200_PLL_FB_DIV_MASK,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 352));
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG1,
+						     EXYNOS2200_PLL_REF_DIV,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 0));
+		break;
+
+	case 24000000:
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_CMN_CTRL,
+						     EXYNOS2200_REF_FREQ_SEL,
+						     FIELD_PREP(EXYNOS2200_REF_FREQ_SEL, 2));
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG0,
+						     EXYNOS2200_PLL_FB_DIV_MASK,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 288));
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG1,
+						     EXYNOS2200_PLL_REF_DIV,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 0));
+		break;
+
+	case 26000000:
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_CMN_CTRL,
+						     EXYNOS2200_REF_FREQ_SEL,
+						     FIELD_PREP(EXYNOS2200_REF_FREQ_SEL, 3));
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG0,
+						     EXYNOS2200_PLL_FB_DIV_MASK,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 263));
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG1,
+						     EXYNOS2200_PLL_REF_DIV,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 0));
+		break;
+
+	case 48000000:
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_CMN_CTRL,
+						     EXYNOS2200_REF_FREQ_SEL,
+						     FIELD_PREP(EXYNOS2200_REF_FREQ_SEL, 2));
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG0,
+						     EXYNOS2200_PLL_FB_DIV_MASK,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 288));
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG1,
+						     EXYNOS2200_PLL_REF_DIV,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 1));
+		break;
+
+	default:
+		dev_err(&phy->phy->dev, "unsupported ref_clk_freq:%lu\n", ref_clk_freq);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int exynos2200_snps_eusb2_phy_init(struct phy *p)
+{
+	struct exynos2200_snps_eusb2_phy *phy = phy_get_drvdata(p);
+	int ret;
+
+	ret = regulator_bulk_enable(phy->drv_data->n_regulators, phy->vregs);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(phy->drv_data->n_clks, phy->clks);
+	if (ret) {
+		dev_err(&p->dev, "failed to enable clocks, %d\n", ret);
+		goto disable_vreg;
+	}
+
+	ret = phy_init(phy->usbcon);
+	if (ret) {
+		dev_err(&p->dev, "usbcon init failed. %d\n", ret);
+		goto disable_ref_clk;
+	}
+
+	exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_RST_CTRL,
+					     EXYNOS2200_UTMI_PORT_RESET_MASK |
+					     EXYNOS2200_EUSB_PHY_RESET_MASK,
+					     FIELD_PREP(EXYNOS2200_UTMI_PORT_RESET_MASK, 0x1) |
+					     FIELD_PREP(EXYNOS2200_EUSB_PHY_RESET_MASK, 0x1));
+	fsleep(50); /* required after holding phy in reset */
+
+	exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_CMN_CTRL,
+					     EXYNOS2200_PHY_CFG_RPTR_MODE,
+					     EXYNOS2200_PHY_CFG_RPTR_MODE);
+
+	/* update ref_clk related registers */
+	ret = exynos2200_snps_eusb2_ref_clk_init(phy);
+	if (ret)
+		return ret;
+
+	exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_TESTSE,
+					     EXYNOS2200_TEST_IDDQ,
+					     0);
+	fsleep(10); /* required after releasing test_iddq */
+
+	exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_RST_CTRL,
+					     EXYNOS2200_EUSB_PHY_RESET_MASK,
+					     0);
+
+	exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_CMN_CTRL,
+					     EXYNOS2200_PHY_ENABLE,
+					     EXYNOS2200_PHY_ENABLE);
+
+	exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_RST_CTRL,
+					     EXYNOS2200_UTMI_PORT_RESET_MASK,
+					     0);
+	return 0;
+
+disable_ref_clk:
+	clk_disable_unprepare(phy->ref_clk);
+
+disable_vreg:
+	regulator_bulk_disable(phy->drv_data->n_regulators, phy->vregs);
+
+	return ret;
+}
+
+static int exynos2200_snps_eusb2_phy_exit(struct phy *p)
+{
+	struct exynos2200_snps_eusb2_phy *phy = phy_get_drvdata(p);
+
+	phy_exit(phy->usbcon);
+
+	clk_disable_unprepare(phy->ref_clk);
+	regulator_bulk_disable(phy->drv_data->n_regulators, phy->vregs);
+
+	return 0;
+}
+
+static const struct phy_ops exynos2200_snps_eusb2_phy_ops = {
+	.init		= exynos2200_snps_eusb2_phy_init,
+	.exit		= exynos2200_snps_eusb2_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+static int exynos2200_snps_eusb2_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct exynos2200_snps_eusb2_phy *phy;
+	const struct exynos2200_snps_eusb2_phy_drvdata *drv_data;
+	struct phy_provider *phy_provider;
+	struct phy *generic_phy;
+	int ret;
+
+	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+
+	drv_data = of_device_get_match_data(dev);
+	if (!drv_data)
+		return -EINVAL;
+	phy->drv_data = drv_data;
+
+	phy->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(phy->base))
+		return PTR_ERR(phy->base);
+
+	phy->clks = devm_kcalloc(dev, drv_data->n_clks,
+				 sizeof(*phy->clks), GFP_KERNEL);
+	if (!phy->clks)
+		return -ENOMEM;
+
+	for (int i = 0; i < drv_data->n_clks; ++i)
+		phy->clks[i].id = drv_data->clk_names[i];
+
+	ret = devm_clk_bulk_get(dev, drv_data->n_clks,
+				phy->clks);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get phy clock(s)\n");
+
+	for (int i = 0; i < phy->drv_data->n_clks; ++i) {
+		if (!strcmp(phy->clks[i].id, "ref")) {
+			phy->ref_clk = phy->clks[i].clk;
+			break;
+		}
+	}
+
+	phy->vregs = devm_kcalloc(dev, drv_data->n_regulators,
+				  sizeof(*phy->vregs), GFP_KERNEL);
+	if (!phy->vregs)
+		return -ENOMEM;
+	regulator_bulk_set_supply_names(phy->vregs,
+					drv_data->regulator_names,
+					drv_data->n_regulators);
+	ret = devm_regulator_bulk_get(dev, drv_data->n_regulators,
+				      phy->vregs);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	/* we treat the usblink controller phy as a separate phy */
+	phy->usbcon = devm_of_phy_get_by_index(dev, np, 0);
+	if (IS_ERR(phy->usbcon))
+		return dev_err_probe(dev, PTR_ERR(phy->usbcon),
+				     "failed to get usbcon\n");
+
+	generic_phy = devm_phy_create(dev, NULL, &exynos2200_snps_eusb2_phy_ops);
+	if (IS_ERR(generic_phy)) {
+		dev_err(dev, "failed to create phy %d\n", ret);
+		return PTR_ERR(generic_phy);
+	}
+
+	dev_set_drvdata(dev, phy);
+	phy_set_drvdata(generic_phy, phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider)) {
+		dev_err(dev, "failed to register phy provider\n");
+		return PTR_ERR(phy_provider);
+	};
+
+	return 0;
+}
+
+static const char * const exynos2200_clk_names[] = {
+	"ref", "apb", "ctrl",
+};
+
+static const char * const exynos2200_regulator_names[] = {
+	"vdd", "vdda12",
+};
+
+static const struct exynos2200_snps_eusb2_phy_drvdata exynos2200_snps_eusb2_phy = {
+	.clk_names		= exynos2200_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos2200_clk_names),
+	.regulator_names	= exynos2200_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos2200_regulator_names),
+};
+
+static const struct of_device_id exynos2200_snps_eusb2_phy_of_match_table[] = {
+	{
+		.compatible = "samsung,exynos2200-snps-eusb2-phy",
+		.data = &exynos2200_snps_eusb2_phy,
+	}, { },
+};
+MODULE_DEVICE_TABLE(of, exynos2200_snps_eusb2_phy_of_match_table);
+
+static struct platform_driver exynos2200_snps_eusb2_phy_driver = {
+	.probe		= exynos2200_snps_eusb2_phy_probe,
+	.driver = {
+		.name	= "exynos2200-snps-eusb2-hsphy",
+		.of_match_table = exynos2200_snps_eusb2_phy_of_match_table,
+	},
+};
+
+module_platform_driver(exynos2200_snps_eusb2_phy_driver);
+MODULE_DESCRIPTION("Exynos2200 SNPS eUSB2 PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0



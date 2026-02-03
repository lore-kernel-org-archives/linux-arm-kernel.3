Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCF4E87846
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMWMFGgY8hFgLjdTl2Yu6amxW1e7tik9P3AEAeibj40=; b=b09TawUQh5xqJn3LBDGS+b0eMv
	9VLFtHTgMVXB3c/7vf8SswjDve3l0Vs9l1BX+I/56b3rIbgnUtlXjjLZVQNezUv/zKMy9VYaCQxm2
	/RJQC8u8sxDOQBaNEIo2NmaQmyMbI0Bi+of84TZpV0NDHIfAzzJLAHPGgtwyzDTijj0r9GlNFPqYM
	y9iebwDJy3+BDd1UrOyBO1NJRSjq/VM3OLAwLOi65ROsbAacL+4QvtfuQKNWHSBbPyH6/cd7gHzeB
	SMQ/1NVo+zxKbIXWpMgQvW/FEd3AskWA7HjFLMwIeR9V3GgQ241iMUSmrqu/vStVW9x15wPLEbudz
	ZQh+oEEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ7f-00000006v2s-203s;
	Tue, 03 Feb 2026 16:19:27 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ7d-00000006uxv-0cGa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 16:19:26 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so61924735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 08:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770135563; x=1770740363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMWMFGgY8hFgLjdTl2Yu6amxW1e7tik9P3AEAeibj40=;
        b=FjCz19rNp5E73QtEJTDzUzNGzxxV/1PCFBYBtPGtuZ58/txVkmWQ8l5+7l4PyGA/gR
         +cn9t05KqHX8rqe/UrWq9JEgzAImPxXYuwUSsjRYnbGFQT+G0ifFQI/jSy7wa4gqNFTE
         RpR6bhnfhMyJ8Aqh6TuYFJR+EFXfRcPv2reTeyzr89oVp3hYvyxQu71kqmaDr6UWy6tg
         mFR47Y6GvxVAa+Xs7NTDCkmTSpd4T1leyQEC697L5ulh+zrfwIAWV5H9muVDbzk2TfOc
         Na3GOLBZ2pNHQRWm9A/j0GEUFOZobkgoKbaayML+7pJWcCJnedcBzGDP16QM3hAU0INt
         EKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770135563; x=1770740363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yMWMFGgY8hFgLjdTl2Yu6amxW1e7tik9P3AEAeibj40=;
        b=j1nNOlCtYwdDY0Yb/cEzTpv0Xdd+uNot5YobjnGrWKGS/XVjPVJ8kkaClCHwS2DY2+
         CdScxhDjcs8xRgV9N8koGxernhDhkT1GGivvJhwFt8rUVPMNd03hzFTi+mj11wkrw3M8
         4wKe7JtdSwgY221iTteMLCVzY4oAFzXV+x4IotOL0yrsHpzsJqj5T5+e7nV5ZA/HgHol
         k4RtWI+KdsVivpqZU8c/jm5VQgrK/H6BnJ/C/Hn/qsbLI14+hKcDSzMISDaEpBN6In+c
         dK8SmYFN/t9lxiJwpW14Ug+IPkUAkiFx2CLcWW3cwCGGWLh9pWz5VzFRuaCYQxzy6ib2
         Hxgw==
X-Forwarded-Encrypted: i=1; AJvYcCU+WzKJplosBhefTHXeanNQyid9MbpsZRDKq41/wMpkSZVKoEf7JCz9dwq4gU2349BxlwcucwrT5gmvHYoM8Q8N@lists.infradead.org
X-Gm-Message-State: AOJu0YxYm9FIaIO0Ojrl2bRgb70l1lSyBWJnwjc1BCNBmZ4FCIrpi01K
	NIUUZ5WL9vaTrkVU5qw3vPIr46lpgv/bNg9KM8FRbaC4gUNEGCCOFB9dXlCmVdXQToU=
X-Gm-Gg: AZuq6aLKb020oxLmUmdTEdeudmVf7499OV16UozE7B18xqUru7Fo67imz063IQWg7Ux
	2MoZRxgql6GyPIB1z420mkqmhBS/ahoXqFnZgFrcs6MGfcT4V7yAnj3qdBTu1BFPNlB06UnbtKM
	uYERaNN3XMhjZdjln3fqnGOqs6+nO4nJpaSFULZUaKqWL8/KP2GzEciqGdUe9s9BZwKZiOMVaJ2
	hzzS2Eowwij6LnhE5RKLnl9yB/nMqJFMC7Sro5pWCL48o8ogTbJ/N3Vmq7TDTjMGQkOny7KaPtQ
	dkCu6/s7/zppLACk3UOfqepDFuslOVGNxEgax0lSySq2ZhSlbEEVOuc2pXjxnrJsj1Y245VLrlS
	mGoG5LRPLzaM9KygSvJEmpzf+cR7IqIQvZroO5uv+WSAZP6wp3cyUo7zXYvLWrFL7g5IJjTd1BV
	iOoyJmEeUX2Mnpsctv5+6A0nhC3crQAg==
X-Received: by 2002:a05:600c:1e8b:b0:479:1ac2:f9b8 with SMTP id 5b1f17b1804b1-4830e9794a8mr1995565e9.21.1770135562397;
        Tue, 03 Feb 2026 08:19:22 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:81d1:b874:c1dc:42e5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dbd21f5dsm144120785e9.8.2026.02.03.08.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 08:19:20 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ciprianmarian.costea@oss.nxp.com,
	s32@nxp.com,
	p.zabel@pengutronix.de,
	linux@armlinux.org.uk,
	ghennadi.procopciuc@nxp.com,
	Ionut.Vicovan@nxp.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	horms@kernel.org
Cc: Frank.li@nxp.com
Subject: [PATCH 2/4 v2] phy: s32g: Add serdes subsystem phy
Date: Tue,  3 Feb 2026 17:19:15 +0100
Message-ID: <20260203161917.1666696-3-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203161917.1666696-1-vincent.guittot@linaro.org>
References: <20260203161917.1666696-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_081925_323427_79E7B58E 
X-CRM114-Status: GOOD (  25.50  )
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

s32g SoC family includes 2 serdes subsystems which are made of one PCIe
controller, 2 XPCS and one Phy. The Phy got 2 lanes that can be configure
to output PCIe lanes and/or SGMII.

Implement PCIe phy support

Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Co-developed-by: Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com>
Signed-off-by: Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com>
Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Co-developed-by: Bogdan Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Bogdan Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 drivers/phy/freescale/Kconfig               |   9 +
 drivers/phy/freescale/Makefile              |   1 +
 drivers/phy/freescale/phy-nxp-s32g-serdes.c | 583 ++++++++++++++++++++
 3 files changed, 593 insertions(+)
 create mode 100644 drivers/phy/freescale/phy-nxp-s32g-serdes.c

diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index 81f53564ee15..45184a3cdd69 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -61,3 +61,12 @@ config PHY_FSL_LYNX_28G
 	  found on NXP's Layerscape platforms such as LX2160A.
 	  Used to change the protocol running on SerDes lanes at runtime.
 	  Only useful for a restricted set of Ethernet protocols.
+
+config PHY_S32G_SERDES
+	tristate "NXP S32G SERDES support"
+	depends on ARCH_S32 || COMPILE_TEST
+	select GENERIC_PHY
+	help
+	  This option enables support for S23G SerDes PHY used for
+	  PCIe & Ethernet
+
diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
index 658eac7d0a62..86d948417252 100644
--- a/drivers/phy/freescale/Makefile
+++ b/drivers/phy/freescale/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_PHY_FSL_IMX8M_PCIE)	+= phy-fsl-imx8m-pcie.o
 obj-$(CONFIG_PHY_FSL_IMX8QM_HSIO)	+= phy-fsl-imx8qm-hsio.o
 obj-$(CONFIG_PHY_FSL_LYNX_28G)		+= phy-fsl-lynx-28g.o
 obj-$(CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY)	+= phy-fsl-samsung-hdmi.o
+obj-$(CONFIG_PHY_S32G_SERDES)		+= phy-nxp-s32g-serdes.o
diff --git a/drivers/phy/freescale/phy-nxp-s32g-serdes.c b/drivers/phy/freescale/phy-nxp-s32g-serdes.c
new file mode 100644
index 000000000000..321a80c02be5
--- /dev/null
+++ b/drivers/phy/freescale/phy-nxp-s32g-serdes.c
@@ -0,0 +1,583 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * SerDes driver for S32G SoCs
+ *
+ * Copyright 2021-2026 NXP
+ */
+
+#include <dt-bindings/phy/phy.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/processor.h>
+#include <linux/reset.h>
+#include <linux/units.h>
+
+#define S32G_SERDES_MODE_MAX			5
+
+#define EXTERNAL_CLK_NAME			"ext"
+#define INTERNAL_CLK_NAME			"ref"
+
+/* Serdes Sub system registers */
+
+#define S32G_PCIE_PHY_GEN_CTRL			0x0
+#define  REF_USE_PAD				BIT(17)
+#define  RX_SRIS_MODE				BIT(9)
+
+#define S32G_PCIE_PHY_MPLLA_CTRL		0x10
+#define  MPLL_STATE				BIT(30)
+
+#define S32G_SS_RW_REG_0			0xF0
+#define  SUBMODE_MASK				GENMASK(3, 0)
+#define  CLKEN_MASK				BIT(23)
+#define  PHY0_CR_PARA_SEL			BIT(9)
+
+/* PCIe phy subsystem registers */
+
+#define S32G_PHY_REG_ADDR			0x0
+#define  PHY_REG_EN				BIT(31)
+
+#define S32G_PHY_REG_DATA			0x4
+
+#define RAWLANE0_DIG_PCS_XF_RX_EQ_DELTA_IQ_OVRD_IN	0x3019
+#define RAWLANE1_DIG_PCS_XF_RX_EQ_DELTA_IQ_OVRD_IN	0x3119
+
+/*
+ * Until now, there is no generic way to describe and set PCIe clock mode.
+ * PCIe controller uses the default CRNS = 0 mode.
+ */
+enum pcie_phy_mode {
+	CRNS = 0, /* Common Reference Clock, No Spread Spectrum */
+	CRSS = 1, /* Common Reference Clock, Spread Spectrum */
+	SRNS = 2, /* Separate Reference Clock, No Spread Spectrum */
+	SRIS = 3  /* Separate Reference Clock, Spread Spectrum */
+};
+
+struct s32g_serdes_ctrl {
+	void __iomem *ss_base;
+	struct reset_control *rst;
+	struct clk_bulk_data *clks;
+	int nclks;
+	u32 ss_mode;
+	unsigned long ref_clk_rate;
+	bool ext_clk;
+};
+
+struct s32g_pcie_ctrl {
+	void __iomem *phy_base;
+	struct reset_control *rst;
+	struct phy *phy;
+	enum pcie_phy_mode phy_mode;
+	bool powered_on;
+};
+
+struct s32g_serdes {
+	struct s32g_serdes_ctrl ctrl;
+	struct s32g_pcie_ctrl pcie;
+	struct device *dev;
+};
+
+/* PCIe phy subsystem */
+
+#define S32G_SERDES_PCIE_FREQ			(100 * HZ_PER_MHZ)
+
+static int s32g_pcie_check_clk(struct s32g_serdes *serdes)
+{
+	struct s32g_serdes_ctrl *sctrl = &serdes->ctrl;
+	unsigned long rate = sctrl->ref_clk_rate;
+
+	if (rate != S32G_SERDES_PCIE_FREQ) {
+		dev_err(serdes->dev, "PCIe PHY cannot operate at %lu HZ\n", rate);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static bool s32g_pcie_phy_is_locked(struct s32g_serdes *serdes)
+{
+	u32 mplla = readl(serdes->ctrl.ss_base + S32G_PCIE_PHY_MPLLA_CTRL);
+	const u32 mask = MPLL_STATE;
+
+	return (mplla & mask) == mask;
+}
+
+/* Serdes RFM says between 3.4 and 5.2 ms depending of pll */
+#define S32G_SERDES_LOCK_TIMEOUT_MS		6
+
+static int s32g_pcie_phy_power_on_common(struct s32g_serdes *serdes)
+{
+	struct s32g_serdes_ctrl *sctrl = &serdes->ctrl;
+	struct s32g_pcie_ctrl *pcie = &serdes->pcie;
+	u32 reg;
+	int val, ret = 0;
+
+	ret = s32g_pcie_check_clk(serdes);
+	if (ret)
+		return ret;
+
+	reg = readl(sctrl->ss_base + S32G_PCIE_PHY_GEN_CTRL);
+
+	/* if PCIE PHY is in SRIS mode */
+	if (pcie->phy_mode == SRIS)
+		reg |= RX_SRIS_MODE;
+
+	if (sctrl->ext_clk)
+		reg |= REF_USE_PAD;
+	else
+		reg &= ~REF_USE_PAD;
+
+	writel(reg, sctrl->ss_base + S32G_PCIE_PHY_GEN_CTRL);
+
+	/* Monitor Serdes MPLL state */
+	ret = read_poll_timeout(s32g_pcie_phy_is_locked, val,
+				(val),
+				0,
+				S32G_SERDES_LOCK_TIMEOUT_MS, false, serdes);
+	if (ret) {
+		dev_err(serdes->dev, "Failed to lock PCIE phy\n");
+		return -ETIMEDOUT;
+	}
+
+	/* Set PHY register access to CR interface */
+	reg = readl(sctrl->ss_base + S32G_SS_RW_REG_0);
+	reg |=  PHY0_CR_PARA_SEL;
+	writel(reg, sctrl->ss_base + S32G_SS_RW_REG_0);
+
+	return ret;
+}
+
+static void s32g_pcie_phy_write(struct s32g_serdes *serdes, u32 reg, u32 val)
+{
+	writel(PHY_REG_EN, serdes->pcie.phy_base + S32G_PHY_REG_ADDR);
+	writel(reg | PHY_REG_EN, serdes->pcie.phy_base + S32G_PHY_REG_ADDR);
+	usleep_range(100, 110);
+	writel(val, serdes->pcie.phy_base + S32G_PHY_REG_DATA);
+	usleep_range(100, 110);
+	writel(0, serdes->pcie.phy_base + S32G_PHY_REG_ADDR);
+}
+
+static int s32g_pcie_phy_power_on(struct s32g_serdes *serdes)
+{
+	struct s32g_pcie_ctrl *pcie = &serdes->pcie;
+	struct s32g_serdes_ctrl *ctrl = &serdes->ctrl;
+	u32 iq_ovrd_in;
+	int ret = 0;
+
+	ret = s32g_pcie_phy_power_on_common(serdes);
+	if (ret)
+		return ret;
+
+	/* RX_EQ_DELTA_IQ_OVRD enable and override value for PCIe lanes */
+	iq_ovrd_in = RAWLANE0_DIG_PCS_XF_RX_EQ_DELTA_IQ_OVRD_IN;
+
+	s32g_pcie_phy_write(serdes, iq_ovrd_in, 0x3);
+	s32g_pcie_phy_write(serdes, iq_ovrd_in, 0x13);
+
+	if (ctrl->ss_mode == 0) {
+		iq_ovrd_in = RAWLANE1_DIG_PCS_XF_RX_EQ_DELTA_IQ_OVRD_IN;
+
+		s32g_pcie_phy_write(serdes, iq_ovrd_in, 0x3);
+		s32g_pcie_phy_write(serdes, iq_ovrd_in, 0x13);
+	}
+
+	pcie->powered_on = true;
+
+	return 0;
+}
+
+/* PCIe phy ops function */
+
+static int s32g_serdes_phy_power_on(struct phy *p)
+{
+	struct s32g_serdes *serdes = phy_get_drvdata(p);
+
+	return s32g_pcie_phy_power_on(serdes);
+}
+
+static int s32g_serdes_phy_power_off(struct phy *p)
+{
+	struct s32g_serdes *serdes = phy_get_drvdata(p);
+
+	serdes->pcie.powered_on = false;
+
+	return 0;
+}
+
+static inline bool is_pcie_phy_mode_valid(int mode)
+{
+	switch (mode) {
+	case CRNS:
+	case CRSS:
+	case SRNS:
+	case SRIS:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int s32g_serdes_phy_set_mode_ext(struct phy *p,
+					enum phy_mode mode, int submode)
+{
+	struct s32g_serdes *serdes = phy_get_drvdata(p);
+
+	if (mode != PHY_MODE_PCIE)
+		return -EINVAL;
+
+	if (!is_pcie_phy_mode_valid(submode))
+		return -EINVAL;
+
+	/*
+	 * Do not configure SRIS or CRSS PHY MODE in conjunction
+	 * with any SGMII mode on the same SerDes subsystem
+	 */
+	if ((submode == CRSS || submode == SRIS) &&
+	    serdes->ctrl.ss_mode != 0)
+		return -EINVAL;
+
+	/*
+	 * Internal reference clock cannot be used with either Common clock
+	 * or Spread spectrum, leaving only SRNSS
+	 */
+	if (submode != SRNS &&  !serdes->ctrl.ext_clk)
+		return -EINVAL;
+
+	if (serdes->pcie.powered_on)
+		dev_warn(serdes->dev, "The phy is already powered on.\n");
+
+	serdes->pcie.phy_mode = submode;
+
+	return 0;
+}
+
+static const struct phy_ops serdes_pcie_ops = {
+	.power_on	= s32g_serdes_phy_power_on,
+	.power_off	= s32g_serdes_phy_power_off,
+	.set_mode	= s32g_serdes_phy_set_mode_ext,
+};
+
+static struct phy *s32g_serdes_phy_xlate(struct device *dev,
+					 const struct of_phandle_args *args)
+{
+	struct s32g_serdes *serdes;
+	struct phy *phy;
+
+	serdes = dev_get_drvdata(dev);
+	if (!serdes)
+		return ERR_PTR(-EINVAL);
+
+	phy = serdes->pcie.phy;
+
+	return phy;
+}
+
+/* Serdes subsystem */
+
+static int s32g_serdes_assert_reset(struct s32g_serdes *serdes)
+{
+	struct device *dev = serdes->dev;
+	int ret;
+
+	ret = reset_control_assert(serdes->pcie.rst);
+	if (ret) {
+		dev_err(dev, "Failed to assert PCIE reset: %d\n", ret);
+		return ret;
+	}
+
+	ret = reset_control_assert(serdes->ctrl.rst);
+	if (ret) {
+		dev_err(dev, "Failed to assert SerDes reset: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int s32g_serdes_deassert_reset(struct s32g_serdes *serdes)
+{
+	struct device *dev = serdes->dev;
+	int ret;
+
+	ret = reset_control_deassert(serdes->pcie.rst);
+	if (ret) {
+		dev_err(dev, "Failed to assert PCIE reset: %d\n", ret);
+		return ret;
+	}
+
+	ret = reset_control_deassert(serdes->ctrl.rst);
+	if (ret) {
+		dev_err(dev, "Failed to assert SerDes reset: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int s32g_serdes_init(struct s32g_serdes *serdes)
+{
+	struct s32g_serdes_ctrl *ctrl = &serdes->ctrl;
+	u32 reg0;
+	int ret;
+
+	ret = clk_bulk_prepare_enable(ctrl->nclks, ctrl->clks);
+	if (ret) {
+		dev_err(serdes->dev, "Failed to enable SerDes clocks\n");
+		return ret;
+	}
+
+	ret = s32g_serdes_assert_reset(serdes);
+	if (ret)
+		goto disable_clks;
+
+	/* Set serdes mode */
+	reg0 = readl(ctrl->ss_base + S32G_SS_RW_REG_0);
+	reg0 &= ~SUBMODE_MASK;
+	if (ctrl->ss_mode == 5)
+		reg0 |= 2;
+	else
+		reg0 |= ctrl->ss_mode;
+	writel(reg0, ctrl->ss_base + S32G_SS_RW_REG_0);
+
+	/* Set Clock source: internal or external */
+	reg0 = readl(ctrl->ss_base + S32G_SS_RW_REG_0);
+	if (ctrl->ext_clk)
+		reg0 &= ~CLKEN_MASK;
+	else
+		reg0 |= CLKEN_MASK;
+
+	writel(reg0, ctrl->ss_base + S32G_SS_RW_REG_0);
+
+	/* Wait for the selection of working mode (as per the manual specs) */
+	usleep_range(100, 110);
+
+	ret = s32g_serdes_deassert_reset(serdes);
+	if (ret)
+		goto disable_clks;
+
+	dev_info(serdes->dev, "Using mode %d for SerDes subsystem\n",
+		 ctrl->ss_mode);
+
+	return 0;
+
+disable_clks:
+	clk_bulk_disable_unprepare(serdes->ctrl.nclks,
+				   serdes->ctrl.clks);
+
+	return ret;
+}
+
+static int s32g_serdes_get_ctrl_resources(struct platform_device *pdev, struct s32g_serdes *serdes)
+{
+	struct s32g_serdes_ctrl *ctrl = &serdes->ctrl;
+	struct device *dev = &pdev->dev;
+	int ret, idx;
+
+	ret = of_property_read_u32(dev->of_node, "nxp,sys-mode",
+				   &ctrl->ss_mode);
+	if (ret) {
+		dev_err(dev, "Failed to get SerDes subsystem mode\n");
+		return -EINVAL;
+	}
+
+	if (ctrl->ss_mode > S32G_SERDES_MODE_MAX) {
+		dev_err(dev, "Invalid SerDes subsystem mode %u\n",
+			ctrl->ss_mode);
+		return -EINVAL;
+	}
+
+	ctrl->ss_base = devm_platform_ioremap_resource_byname(pdev, "ss_pcie");
+	if (IS_ERR(ctrl->ss_base)) {
+		dev_err(dev, "Failed to map 'ss_pcie'\n");
+		return PTR_ERR(ctrl->ss_base);
+	}
+
+	ctrl->rst = devm_reset_control_get_exclusive(dev, "serdes");
+	if (IS_ERR(ctrl->rst))
+		return dev_err_probe(dev, PTR_ERR(ctrl->rst),
+				     "Failed to get 'serdes' reset control\n");
+
+	ctrl->nclks = devm_clk_bulk_get_all(dev, &ctrl->clks);
+	if (ctrl->nclks < 1) {
+		ret = ctrl->nclks ? : -EINVAL;
+		return dev_err_probe(dev, ret,
+				     "Failed to get SerDes clocks\n");
+	}
+
+	idx = of_property_match_string(dev->of_node, "clock-names", EXTERNAL_CLK_NAME);
+	if (idx < 0)
+		idx = of_property_match_string(dev->of_node, "clock-names", INTERNAL_CLK_NAME);
+	else
+		ctrl->ext_clk = true;
+
+	if (idx < 0) {
+		dev_err(dev, "Failed to get Phy reference clock source\n");
+		return -EINVAL;
+	}
+
+	ctrl->ref_clk_rate = clk_get_rate(ctrl->clks[idx].clk);
+	if (!ctrl->ref_clk_rate) {
+		dev_err(dev, "Failed to get Phy reference clock rate\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int s32g_serdes_get_pcie_resources(struct platform_device *pdev, struct s32g_serdes *serdes)
+{
+	struct s32g_pcie_ctrl *pcie = &serdes->pcie;
+	struct device *dev = &pdev->dev;
+
+	pcie->phy_base = devm_platform_ioremap_resource_byname(pdev,
+							       "pcie_phy");
+	if (IS_ERR(pcie->phy_base)) {
+		dev_err(dev, "Failed to map 'pcie_phy'\n");
+		return PTR_ERR(pcie->phy_base);
+	}
+
+	pcie->rst = devm_reset_control_get_exclusive(dev, "pcie");
+	if (IS_ERR(pcie->rst))
+		return dev_err_probe(dev, IS_ERR(pcie->rst),
+				     "Failed to get 'pcie' reset control\n");
+
+	return 0;
+}
+
+static int s32g2_serdes_create_phy(struct s32g_serdes *serdes, struct device_node *child_node)
+{
+	struct s32g_serdes_ctrl *ctrl = &serdes->ctrl;
+	struct phy_provider *phy_provider;
+	struct device *dev = serdes->dev;
+	int ss_mode = ctrl->ss_mode;
+	struct phy *phy;
+
+	if (of_device_is_compatible(child_node, "nxp,s32g2-serdes-pcie-phy")) {
+		/* no PCIe phy lane */
+		if (ss_mode > 2)
+			return 0;
+
+		phy = devm_phy_create(dev, child_node, &serdes_pcie_ops);
+		if (IS_ERR(phy))
+			return PTR_ERR(phy);
+
+		phy_set_drvdata(phy, serdes);
+
+		phy->attrs.mode = PHY_MODE_PCIE;
+		phy->id = 0;
+		serdes->pcie.phy = phy;
+
+		phy_provider = devm_of_phy_provider_register(&phy->dev, s32g_serdes_phy_xlate);
+		if (IS_ERR(phy_provider))
+			return PTR_ERR(phy_provider);
+
+	} else {
+		dev_warn(dev, "Skipping unknown child node %pOFn\n", child_node);
+	}
+
+	return 0;
+}
+
+static int s32g_serdes_parse_lanes(struct device *dev, struct s32g_serdes *serdes)
+{
+	int ret;
+
+	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
+		ret = s32g2_serdes_create_phy(serdes, of_port);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int s32g_serdes_probe(struct platform_device *pdev)
+{
+	struct s32g_serdes *serdes;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	serdes = devm_kzalloc(dev, sizeof(*serdes), GFP_KERNEL);
+	if (!serdes)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, serdes);
+	serdes->dev = dev;
+
+	ret = s32g_serdes_get_ctrl_resources(pdev, serdes);
+	if (ret)
+		return ret;
+
+	ret = s32g_serdes_get_pcie_resources(pdev, serdes);
+	if (ret)
+		return ret;
+
+	ret = s32g_serdes_parse_lanes(dev, serdes);
+	if (ret)
+		return ret;
+
+	return s32g_serdes_init(serdes);
+}
+
+static int __maybe_unused s32g_serdes_suspend(struct device *device)
+{
+	struct s32g_serdes *serdes = dev_get_drvdata(device);
+
+	clk_bulk_disable_unprepare(serdes->ctrl.nclks, serdes->ctrl.clks);
+
+	return 0;
+}
+
+static int __maybe_unused s32g_serdes_resume(struct device *device)
+{
+	struct s32g_serdes *serdes = dev_get_drvdata(device);
+	struct s32g_pcie_ctrl *pcie = &serdes->pcie;
+	int ret;
+
+	ret = s32g_serdes_init(serdes);
+	if (ret) {
+		dev_err(device, "Failed to initialize\n");
+		return ret;
+	}
+
+	/* Restore PCIe phy power */
+	if (pcie->powered_on) {
+		ret = s32g_pcie_phy_power_on(serdes);
+		if (ret)
+			dev_err(device, "Failed to power-on PCIe phy\n");
+	}
+
+	return ret;
+}
+
+static const struct of_device_id s32g_serdes_match[] = {
+	{
+		.compatible = "nxp,s32g2-serdes",
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, s32g_serdes_match);
+
+static const struct dev_pm_ops s32g_serdes_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(s32g_serdes_suspend,
+				  s32g_serdes_resume)
+};
+
+static struct platform_driver s32g_serdes_driver = {
+	.probe		= s32g_serdes_probe,
+	.driver		= {
+		.name	= "phy-s32g-serdes",
+		.of_match_table = s32g_serdes_match,
+		.pm = &s32g_serdes_pm_ops,
+	},
+};
+module_platform_driver(s32g_serdes_driver);
+
+MODULE_AUTHOR("Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>");
+MODULE_DESCRIPTION("S32CC SerDes driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0



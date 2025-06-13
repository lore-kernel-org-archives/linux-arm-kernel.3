Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCFFC71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 07:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=739P3skwYBjoXkzcHrbyj7sQBQmgQa8eb3YQLj+Z4qI=; b=GwuZ/Xxs6Qr/T02uiPujFonpFi
	zUumjgavGyBKL+M7LQrlvfSX6sfdJoO4wOHHpLu4wPzn0F4YrlBWjNE819lqIYvj6n+o2UWil+USe
	sk8JKW+0JAqdkyE/OGaHNY4cBx4s8VRYEKbxGcd11ABqOmRcXAGsju2XqYz0lczIYosnDpKngTQi6
	sU9Uah86QW6Kv5q9i9NJslChNM0DbIuDaifZr6wSmBy5l5tMHNS1+QaFo5ayte7L0oHVDfZMjDc+E
	nz1R1O63vxlxoFTPf58nHbWS1g11BjsHdoEt4epI8TBxmKHPviFujB9AETGjKAbZVjkuxCuXfsxE0
	c2AvNidA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPylU-0000000Fabm-3cWo;
	Fri, 13 Jun 2025 07:23:52 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyYN-0000000FZIU-43di
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 07:10:22 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250613071017epoutp03cf6c894037e8bfafee32b32707424197~IiJJuAfWi2387123871epoutp03D
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 07:10:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250613071017epoutp03cf6c894037e8bfafee32b32707424197~IiJJuAfWi2387123871epoutp03D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749798617;
	bh=739P3skwYBjoXkzcHrbyj7sQBQmgQa8eb3YQLj+Z4qI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PbOrmapjWlT5vrEkLJJBR3Q8I0xaAgtMOgOx9S4c4T13tJs7hyfrUOpqX/e3CZa8a
	 YX+MKVtqNGfkJ57UGzvVa/VDyH/DnyzLGN3Sy/Hv8lzgDhPuI4+T8ytsIKgrQCOYi3
	 ZqYxg8rZSpWp+QalDfcA+enLW78P7XvBuMd4mR9g=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250613071017epcas5p40081ccc5957d8844810a036c9bc40b79~IiJJF0bWh2402624026epcas5p4u;
	Fri, 13 Jun 2025 07:10:17 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.178]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bJVsL324zz6B9mS; Fri, 13 Jun
	2025 07:10:14 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250613055053epcas5p377269bcc2c8567c00a2298d86c0d26a4~IhD0lS1gb2142921429epcas5p3f;
	Fri, 13 Jun 2025 05:50:53 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250613055050epsmtip139c9b199a62574ba703ee5deb54c66be~IhDx0u9U70399103991epsmtip1D;
	Fri, 13 Jun 2025 05:50:50 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v3 5/9] phy: exyons5-usbdrd: support HS combo phy for
 ExynosAutov920
Date: Fri, 13 Jun 2025 11:26:09 +0530
Message-Id: <20250613055613.866909-6-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613055613.866909-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250613055053epcas5p377269bcc2c8567c00a2298d86c0d26a4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055053epcas5p377269bcc2c8567c00a2298d86c0d26a4
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055053epcas5p377269bcc2c8567c00a2298d86c0d26a4@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_001020_333477_B833A6C1 
X-CRM114-Status: GOOD (  20.29  )
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

This SoC has a single USB 3.1 DRD combo phy that supports both
UTMI+ (HS) and PIPE3 (SS) and three USB2.0 DRD HS phy controllers
those only support the UTMI+ (HS) interface.

Support UTMI+ combo phy for this SoC which is somewhat simmilar to
what the existing Exynos850 support does. The difference is that
some register offsets and bit fields are defferent from Exynos850.

Add required change in phy driver to support combo HS phy for this SoC.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 202 +++++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 15965b4c6f78..ac7bc1d1afd2 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -41,6 +41,13 @@
 #define EXYNOS2200_CLKRST_LINK_PCLK_SEL		BIT(1)
 
 #define EXYNOS2200_DRD_UTMI			0x10
+
+/* ExynosAutov920 bits */
+#define UTMICTL_FORCE_UTMI_SUSPEND		BIT(13)
+#define UTMICTL_FORCE_UTMI_SLEEP		BIT(12)
+#define UTMICTL_FORCE_DPPULLDOWN		BIT(9)
+#define UTMICTL_FORCE_DMPULLDOWN		BIT(8)
+
 #define EXYNOS2200_UTMI_FORCE_VBUSVALID		BIT(1)
 #define EXYNOS2200_UTMI_FORCE_BVALID		BIT(0)
 
@@ -250,6 +257,22 @@
 #define EXYNOS850_DRD_HSP_TEST			0x5c
 #define HSP_TEST_SIDDQ				BIT(24)
 
+#define EXYNOSAUTOV920_DRD_HSP_CLKRST		0x100
+#define HSPCLKRST_PHY20_SW_PORTRESET		BIT(3)
+#define HSPCLKRST_PHY20_SW_POR			BIT(1)
+#define HSPCLKRST_PHY20_SW_POR_SEL		BIT(0)
+
+#define EXYNOSAUTOV920_DRD_HSPCTL		0x104
+#define HSPCTRL_VBUSVLDEXTSEL			BIT(13)
+#define HSPCTRL_VBUSVLDEXT			BIT(12)
+#define HSPCTRL_EN_UTMISUSPEND			BIT(9)
+#define HSPCTRL_COMMONONN			BIT(8)
+
+#define EXYNOSAUTOV920_DRD_HSP_TEST		0x10c
+
+#define EXYNOSAUTOV920_DRD_HSPPLLTUNE		0x110
+#define HSPPLLTUNE_FSEL				GENMASK(18, 16)
+
 /* Exynos9 - GS101 */
 #define EXYNOS850_DRD_SECPMACTL			0x48
 #define SECPMACTL_PMA_ROPLL_REF_CLK_SEL		GENMASK(13, 12)
@@ -2025,6 +2048,182 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static void
+exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
+{
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 reg;
+
+	/*
+	 * Disable HWACG (hardware auto clock gating control). This
+	 * forces QACTIVE signal in Q-Channel interface to HIGH level,
+	 * to make sure the PHY clock is not gated by the hardware.
+	 */
+	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
+	reg |= LINKCTRL_FORCE_QACT;
+	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
+
+	/* De-assert link reset */
+	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
+	reg &= ~CLKRST_LINK_SW_RST;
+	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
+
+	/* Set PHY POR High */
+	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
+	reg |= HSPCLKRST_PHY20_SW_POR | HSPCLKRST_PHY20_SW_POR_SEL;
+	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
+
+	/* Enable UTMI+ */
+	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
+	reg &= ~(UTMICTL_FORCE_UTMI_SUSPEND | UTMICTL_FORCE_UTMI_SLEEP |
+		UTMICTL_FORCE_DPPULLDOWN | UTMICTL_FORCE_DMPULLDOWN);
+	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
+
+	/* set phy clock & control HS phy */
+	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
+	reg |= HSPCTRL_EN_UTMISUSPEND | HSPCTRL_COMMONONN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
+
+	usleep_range(100, 105);
+
+	/* Set VBUS Valid and DP-Pull up control by VBUS pad usage */
+	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
+	reg |= FIELD_PREP_CONST(LINKCTRL_BUS_FILTER_BYPASS, 0xf);
+	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
+
+	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
+	reg |= EXYNOS2200_UTMI_FORCE_VBUSVALID | EXYNOS2200_UTMI_FORCE_BVALID;
+	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
+
+	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
+	reg |= HSPCTRL_VBUSVLDEXTSEL | HSPCTRL_VBUSVLDEXT;
+	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
+
+	/* Setting FSEL for refference clock */
+	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPPLLTUNE);
+	reg &= ~HSPPLLTUNE_FSEL;
+	switch (phy_drd->extrefclk) {
+	case EXYNOS5_FSEL_50MHZ:
+		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 7);
+		break;
+	case EXYNOS5_FSEL_26MHZ:
+		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 6);
+		break;
+	case EXYNOS5_FSEL_24MHZ:
+		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 2);
+		break;
+	case EXYNOS5_FSEL_20MHZ:
+		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 1);
+		break;
+	case EXYNOS5_FSEL_19MHZ2:
+		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 0);
+		break;
+	default:
+		dev_warn(phy_drd->dev, "unsupported ref clk: %#.2x\n",
+			 phy_drd->extrefclk);
+		break;
+	}
+	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPPLLTUNE);
+
+	/* Enable PHY Power Mode */
+	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
+	reg &= ~HSP_TEST_SIDDQ;
+	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
+
+	/* before POR low, 10us delay is needed to Finish PHY reset */
+	usleep_range(10, 15);
+
+	/* Set PHY POR Low */
+	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
+	reg |= HSPCLKRST_PHY20_SW_POR_SEL;
+	reg &= ~(HSPCLKRST_PHY20_SW_POR | HSPCLKRST_PHY20_SW_PORTRESET);
+	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
+
+	/* after POR low and delay 75us, PHYCLOCK is guaranteed. */
+	usleep_range(75, 80);
+
+	/* force pipe3 signal for link */
+	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
+	reg |= LINKCTRL_FORCE_PIPE_EN;
+	reg &= ~LINKCTRL_FORCE_PHYSTATUS;
+	reg |= LINKCTRL_FORCE_RXELECIDLE;
+	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
+}
+
+static void
+exynosautov920_usbdrd_hsphy_disable(struct exynos5_usbdrd_phy *phy_drd)
+{
+	u32 reg;
+	void __iomem *reg_phy = phy_drd->reg_phy;
+
+	/* set phy clock & control HS phy */
+	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
+	reg |= UTMICTL_FORCE_UTMI_SUSPEND | UTMICTL_FORCE_UTMI_SLEEP;
+	reg &= ~(UTMICTL_FORCE_DPPULLDOWN | UTMICTL_FORCE_DMPULLDOWN);
+	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
+
+	/* Disable PHY Power Mode */
+	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
+	reg |= HSP_TEST_SIDDQ;
+	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
+
+	/* clear force q-channel */
+	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
+	reg &= ~LINKCTRL_FORCE_QACT;
+	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
+
+	/* link sw reset is need for USB_DP/DM high-z in host mode */
+	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
+	reg |= CLKRST_LINK_SW_RST;
+	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
+}
+
+static int exynosautov920_usbdrd_phy_init(struct phy *phy)
+{
+	return exynos850_usbdrd_phy_init(phy);
+}
+
+static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	int ret = 0;
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret)
+		return ret;
+
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI)
+		exynosautov920_usbdrd_hsphy_disable(phy_drd);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	return 0;
+}
+
+static const struct phy_ops exynosautov920_usb31drd_phy_ops = {
+	.init		= exynosautov920_usbdrd_phy_init,
+	.exit		= exynosautov920_usbdrd_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+static const struct
+exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920[] = {
+	{
+		.id		= EXYNOS5_DRDPHY_UTMI,
+		.phy_init	= exynosautov920_usbdrd_utmi_init,
+	},
+};
+
+static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_hsphy = {
+	.phy_cfg		= usbdrd_hsphy_cfg_exynosautov920,
+	.phy_ops		= &exynosautov920_usb31drd_phy_ops,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+};
+
 static const struct phy_ops exynosautov920_usbdrd_phy_ops = {
 	.init		= exynos850_usbdrd_phy_init,
 	.exit		= exynos850_usbdrd_phy_exit,
@@ -2250,6 +2449,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos850-usbdrd-phy",
 		.data = &exynos850_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynosautov920-usbdrd-hsphy",
+		.data = &exynosautov920_usbdrd_hsphy
 	}, {
 		.compatible = "samsung,exynosautov920-usbdrd-phy",
 		.data = &exynosautov920_usbdrd_phy
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079D2CFD317
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 10:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuTqdQnUnvnjiygEaL4YutUcKFPwNvAkYKhRzSsLoX8=; b=IUIAfewuQl2ZVF6wge+wDfoKXC
	Syu5SVb/9msOvHzy2SjpHQHc/iVv/PkBpH/ysSK27FR/+G0Q+FLIohuYp+/R1PjJhGKvKLFKMqt09
	0/77TPFXTUyObacx4O6fknP+DdkP6P38gdDC52cKnrRMY0e+iILOb4TmhGqVDwJQ/yD2wxTTmuxPV
	3OCOLD7U0gEivztZfUi2A4oTY1zsTZJt081BOJl3xqMjhiwXi4uiA7d0Ng3ryHe+SWg9EoTgGecAy
	OIudODcIzTXwvS7IJoNm4M7+hml9mSHAJZt6/AuuS6sq4xnifFrx3lLZYOrmYv08TENFBGWvPOOl0
	yeo+Saqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUGS-0000000BTib-2ZwN;
	Mon, 24 Nov 2025 10:57:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUGR-0000000BThG-228S
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 24 Nov 2025 10:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AuTqdQnUnvnjiygEaL4YutUcKFPwNvAkYKhRzSsLoX8=; b=mC2b4G8cqObROkRAdNxiEMroQe
	jwwLuaXALb9Lgbys5aPdROdNMHLINN+7QfnXBYuwP++JW3Sah7qk9fAuAAI4nFjXr41jEWiNpWv6M
	45o+wcXR7aPKaq5cKbXs7F+r2OlipxPsDfLBjC96Rf0K8B+1Fg1HgliFDEytOE83xWHU4I6dkB3vS
	N3t5rHNhOuw6vo84lZ81egCBz1ZJPP3a6+U+h3eQy2GpcetkhQFDUMJpsTNhMpL2gy2piN6Pe1ydu
	JzhPLgsZv94eW27RkwLflRA43z9OSuw3syN34UwhtDkJeG1vf9lVXUHykCOdSi20bAKCaLEmWG2Rz
	pSAYB/Ow==;
Received: from mailout2.samsung.com ([203.254.224.25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTOl-00000003SgC-3hGi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 10:02:22 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251124105740epoutp02c16740d336e0f5746daeb48d2d3e1d4e~67CfeHcne0994009940epoutp02Z
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 10:57:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251124105740epoutp02c16740d336e0f5746daeb48d2d3e1d4e~67CfeHcne0994009940epoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763981860;
	bh=AuTqdQnUnvnjiygEaL4YutUcKFPwNvAkYKhRzSsLoX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PU9uD1ga90Zyhq6FfDHkPwATVBwqVQHz28lytptMmR7ySa4uvsLwmYKoCydHgZAiT
	 J3Tb/YgwhuHwrif9cieqi04MzaY1WPq02spNmQjtJRsFyByAaXPM/E2zqaGMflmFE6
	 cLdfHZ9Qkpfl4n45WawXYKW63FJ68HSUMFAKmiXU=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20251124105739epcas5p2fec1828857c0b0f2eb04280353a0f676~67CeoHqfV0160201602epcas5p2l;
	Mon, 24 Nov 2025 10:57:39 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.95]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dFN821Hqpz6B9m5; Mon, 24 Nov
	2025 10:57:38 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251124105737epcas5p4dae6fb134f3338d7420d52a0deb9434a~67CdNAZ890296302963epcas5p4E;
	Mon, 24 Nov 2025 10:57:37 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251124105731epsmtip284f63dd32f2489b143c4c93341d3cf2f~67CXQ8yE81716317163epsmtip2H;
	Mon, 24 Nov 2025 10:57:30 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	johan@kernel.org, ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v10 4/6] phy: exynos5-usbdrd: support HS combo phy for
 ExynosAutov920
Date: Mon, 24 Nov 2025 16:34:51 +0530
Message-Id: <20251124110453.2887437-5-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251124110453.2887437-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251124105737epcas5p4dae6fb134f3338d7420d52a0deb9434a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251124105737epcas5p4dae6fb134f3338d7420d52a0deb9434a
References: <20251124110453.2887437-1-pritam.sutar@samsung.com>
	<CGME20251124105737epcas5p4dae6fb134f3338d7420d52a0deb9434a@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_100220_626463_596430F5 
X-CRM114-Status: GOOD (  20.77  )
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

Support UTMI+ combo phy for this SoC, which is somewhat similar to
what the existing Exynos850 supports. The difference is that some
register offsets and bit fields are different from Exynos850.

Add required change in phy driver to support combo HS phy for this SoC.

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 211 +++++++++++++++++++++++
 1 file changed, 211 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 7416d2e1e358..5bbf78d44a74 100644
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
@@ -2054,6 +2077,140 @@ static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
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
+	fsleep(100);
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
+
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
+	fsleep(10);
+
+	/* Set PHY POR Low */
+	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
+	reg |= HSPCLKRST_PHY20_SW_POR_SEL;
+	reg &= ~(HSPCLKRST_PHY20_SW_POR | HSPCLKRST_PHY20_SW_PORTRESET);
+	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
+
+	/* after POR low and delay 75us, PHYCLOCK is guaranteed. */
+	fsleep(75);
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
+	fsleep(10);
+	reg &= ~CLKRST_LINK_SW_RST;
+	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
+}
+
 static int exynosautov920_usbdrd_phy_init(struct phy *phy)
 {
 	struct phy_usb_instance *inst = phy_get_drvdata(phy);
@@ -2095,6 +2252,27 @@ static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
 	return 0;
 }
 
+static int exynosautov920_usbdrd_combo_phy_exit(struct phy *phy)
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
+	/* enable PHY isol */
+	inst->phy_cfg->phy_isol(inst, true);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	return 0;
+}
+
 static int exynosautov920_usbdrd_phy_power_on(struct phy *phy)
 {
 	struct phy_usb_instance *inst = phy_get_drvdata(phy);
@@ -2146,6 +2324,36 @@ static const char * const exynosautov920_usb20_regulators[] = {
 	"dvdd", "vdd18", "vdd33",
 };
 
+static const struct phy_ops exynosautov920_usbdrd_combo_hsphy_ops = {
+	.init		= exynosautov920_usbdrd_phy_init,
+	.exit		= exynosautov920_usbdrd_combo_phy_exit,
+	.power_on	= exynosautov920_usbdrd_phy_power_on,
+	.power_off	= exynosautov920_usbdrd_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static const struct
+exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920[] = {
+	{
+		.id		= EXYNOS5_DRDPHY_UTMI,
+		.phy_isol	= exynos5_usbdrd_phy_isol,
+		.phy_init	= exynosautov920_usbdrd_utmi_init,
+	},
+};
+
+static const
+struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_combo_hsphy = {
+	.phy_cfg		= usbdrd_hsphy_cfg_exynosautov920,
+	.phy_ops		= &exynosautov920_usbdrd_combo_hsphy_ops,
+	.pmu_offset_usbdrd0_phy	= EXYNOSAUTOV920_PHY_CTRL_USB20,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynosautov920_usb20_regulators,
+	.n_regulators		= ARRAY_SIZE(exynosautov920_usb20_regulators),
+};
+
 static const struct phy_ops exynosautov920_usbdrd_phy_ops = {
 	.init		= exynosautov920_usbdrd_phy_init,
 	.exit		= exynosautov920_usbdrd_phy_exit,
@@ -2380,6 +2588,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos990-usbdrd-phy",
 		.data = &exynos990_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynosautov920-usbdrd-combo-hsphy",
+		.data = &exynosautov920_usbdrd_combo_hsphy
 	}, {
 		.compatible = "samsung,exynosautov920-usbdrd-phy",
 		.data = &exynosautov920_usbdrd_phy
-- 
2.34.1



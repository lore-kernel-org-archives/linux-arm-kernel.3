Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47235C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 14:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJ167illKN1TO8G0fjABg4r+eK06fCfby4plELWDkek=; b=rQgMHzHV0AD9FsYJTF9HLMQgkB
	554qoTijCHX7TzWBk8w/8bkHd48lUc5KjtitxB/8xfH+KkxCho2MEb0fCyHf+ENKHb5+Zt7T/zTcg
	FuT9XcbtLUyNASfjgANEGiwg9Q8T9XSomSZ2QPs/RNsiq+e9hAesqOAnReBxlOsjjjyicKLgIpsT+
	2iysLbBpvMlWxEHRRe3nH4CaJQK1YGPFe+bgwCQejHD6ETeo0djkKkVN9GY5wCE8GmMN8y40wE2tw
	Of0HzZC+y6hevpYMfich+FrPzuQ8jS61AU7iCqPrXajxYdmD5tjiFc1QjmIY1ZegMsIUcxUVmosfz
	wn5qiNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcMr-00000005mb0-0iIk;
	Tue, 01 Jul 2025 14:53:53 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaim-00000005SRV-2hop
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 13:08:26 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250701130822epoutp01bd47169be0e4914da90dee1ed42bffa7~OIo8TVLzj1289512895epoutp01D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Jul 2025 13:08:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250701130822epoutp01bd47169be0e4914da90dee1ed42bffa7~OIo8TVLzj1289512895epoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751375303;
	bh=jJ167illKN1TO8G0fjABg4r+eK06fCfby4plELWDkek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BOTAPZNn5LylCo+g0S/V2Sz21ViRc9Bw0sq6CZSTPAjWQSzx2OhKguFIF7nrPMlkI
	 Tpo/9y3VXibQz9Si40ZCx4+W00s9zgR/LyaOtsmKur1EIpbm5JXhrwakNlAxnUBo+4
	 KTtHj9sNpu25vu6m+FjWOQhKPj1SjZfMj+aeJkRo=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250701130822epcas5p30fdd35c885c18e2142f3b6e3e8c81add~OIo7yr9vY0162201622epcas5p3n;
	Tue,  1 Jul 2025 13:08:22 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.180]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bWjyD4nc9z3hhT7; Tue,  1 Jul
	2025 13:08:20 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250701120012epcas5p4def7f4d718241407b598ad961d32c1f8~OHtaxgs2v2655426554epcas5p4F;
	Tue,  1 Jul 2025 12:00:12 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250701120009epsmtip1f9012c673877687574ad3fd991ebdd62~OHtX5xkLN1547115471epsmtip1o;
	Tue,  1 Jul 2025 12:00:09 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org,
	neil.armstrong@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v4 6/6] phy: exynos5-usbdrd: support SS combo phy for
 ExynosAutov920
Date: Tue,  1 Jul 2025 17:37:06 +0530
Message-Id: <20250701120706.2219355-7-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701120706.2219355-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250701120012epcas5p4def7f4d718241407b598ad961d32c1f8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250701120012epcas5p4def7f4d718241407b598ad961d32c1f8
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
	<CGME20250701120012epcas5p4def7f4d718241407b598ad961d32c1f8@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_060825_002985_CD488563 
X-CRM114-Status: GOOD (  30.00  )
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

This SoC has a DWC3 compatible link controller and single USB 3.1 DRD
combo phy that supports both UTMI+ (HS) and PIPE3 (SS) and three USB2.0
DRD HS phy controllers those only support the UTMI+ (HS) interface.

Combo phy is combination of two phys. Among these phys, one supports
USB3.1 SSP+(10Gbps) protocol and is backwards compatible to the
USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is required to support
USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data rates.

Add required change in phy driver to support combo SS phy for this SoC.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c    | 327 +++++++++++++++++++-
 include/linux/soc/samsung/exynos-regs-pmu.h |   1 +
 2 files changed, 324 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 8a1cd63b29ce..9e70bc815937 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -273,6 +273,36 @@
 #define EXYNOSAUTOV920_DRD_HSPPLLTUNE		0x110
 #define HSPPLLTUNE_FSEL				GENMASK(18, 16)
 
+/* ExynosAutov920 phy usb31drd port reg */
+#define EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL	0x000
+#define PHY_RST_CTRL_PIPE_LANE0_RESET_N_OVRD_EN	BIT(5)
+#define PHY_RST_CTRL_PIPE_LANE0_RESET_N		BIT(4)
+#define PHY_RST_CTRL_PHY_RESET_OVRD_EN		BIT(1)
+#define PHY_RST_CTRL_PHY_RESET			BIT(0)
+
+#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0	0x0004
+#define PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR		GENMASK(31, 16)
+#define PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK		BIT(8)
+#define PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK		BIT(4)
+#define PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL		BIT(0)
+
+#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON1	0x0008
+
+#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2	0x000c
+#define PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_EN		BIT(0)
+#define PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA		GENMASK(31, 16)
+
+#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG0	0x100
+#define PHY_CONFIG0_PHY0_PMA_PWR_STABLE		BIT(14)
+#define PHY_CONFIG0_PHY0_PCS_PWR_STABLE		BIT(13)
+#define PHY_CONFIG0_PHY0_ANA_PWR_EN		BIT(1)
+
+#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7	0x11c
+#define PHY_CONFIG7_PHY_TEST_POWERDOWN		BIT(24)
+
+#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG4	0x110
+#define PHY_CONFIG4_PIPE_RX0_SRIS_MODE_EN	BIT(2)
+
 /* Exynos9 - GS101 */
 #define EXYNOS850_DRD_SECPMACTL			0x48
 #define SECPMACTL_PMA_ROPLL_REF_CLK_SEL		GENMASK(13, 12)
@@ -2079,6 +2109,253 @@ static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static void
+exynosautov920_usb31drd_cr_clk(struct exynos5_usbdrd_phy *phy_drd, bool high)
+{
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 reg = 0;
+
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+	if (high)
+		reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
+	else
+		reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
+
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+	fsleep(1);
+}
+
+static void
+exynosautov920_usb31drd_port_phy_ready(struct exynos5_usbdrd_phy *phy_drd)
+{
+	struct device *dev = phy_drd->dev;
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	static const unsigned int timeout_us = 20000;
+	static const unsigned int sleep_us = 40;
+	u32 reg = 0;
+	int err;
+
+	/* Clear cr_para_con */
+	reg &= ~(PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
+			PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR);
+	reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+	writel(0x0, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON1);
+	writel(0x0, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
+
+	exynosautov920_usb31drd_cr_clk(phy_drd, true);
+	exynosautov920_usb31drd_cr_clk(phy_drd, false);
+
+	/*
+	 * The maximum time from phy reset de-assertion to de-assertion of
+	 * tx/rx_ack can be as high as 5ms in fast simulation mode.
+	 * Time to phy ready is < 20ms
+	 */
+	err = readl_poll_timeout(reg_phy +
+				EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0,
+			reg, !(reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK),
+			sleep_us, timeout_us);
+	if (err)
+		dev_err(dev, "timed out waiting for rx/tx_ack: %#.8x\n", reg);
+
+	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+}
+
+static void
+exynosautov920_usb31drd_cr_write(struct exynos5_usbdrd_phy *phy_drd,
+				 u16 addr, u16 data)
+{
+	struct device *dev = phy_drd->dev;
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 cnt = 0;
+	u32 reg = 0;
+
+	/* Pre Clocking */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+	reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+
+	/*
+	 * tx clks must be available prior to assertion of tx req.
+	 * tx pstate p2 to p0 transition directly is not permitted.
+	 * tx clk ready must be asserted synchronously on tx clk prior
+	 * to internal transmit clk alignment sequence in the phy
+	 * when entering from p2 to p1 to p0.
+	 */
+	do {
+		exynosautov920_usb31drd_cr_clk(phy_drd, true);
+		exynosautov920_usb31drd_cr_clk(phy_drd, false);
+		cnt++;
+	} while (cnt < 15);
+
+	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+
+	/*
+	 * tx data path is active when tx lane is in p0 state
+	 * and tx data en asserted. enable cr_para_wr_en.
+	 */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
+	reg &= ~PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA;
+	reg |= FIELD_PREP(PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA, data) |
+		PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_EN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
+
+	/* write addr */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR;
+	reg |= FIELD_PREP(PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR, addr) |
+		PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
+		PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+
+	/* check cr_para_ack*/
+	cnt = 0;
+	do {
+		/*
+		 * data symbols are captured by phy on rising edge of the
+		 * tx_clk when tx data enabled.
+		 * completion of the write cycle is acknowledged by assertion
+		 * of the cr_para_ack.
+		 */
+		exynosautov920_usb31drd_cr_clk(phy_drd, true);
+		reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
+		if ((reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK))
+			break;
+
+		exynosautov920_usb31drd_cr_clk(phy_drd, false);
+
+		/*
+		 * wait for minimum of 10 cr_para_clk cycles after phy reset
+		 * is negated, before accessing control regs to allow for
+		 * internal resets.
+		 */
+		cnt++;
+	} while (cnt < 10);
+
+	if (cnt == 10)
+		dev_dbg(dev, "CR write failed to 0x%04x\n", addr);
+	else
+		exynosautov920_usb31drd_cr_clk(phy_drd, false);
+}
+
+static void
+exynosautov920_usb31drd_phy_reset(struct exynos5_usbdrd_phy *phy_drd, int val)
+{
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 reg;
+
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+	reg &= ~PHY_RST_CTRL_PHY_RESET_OVRD_EN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+	if (val)
+		reg |= PHY_RST_CTRL_PHY_RESET;
+	else
+		reg &= ~PHY_RST_CTRL_PHY_RESET;
+
+	reg |= PHY_RST_CTRL_PHY_RESET_OVRD_EN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+}
+
+static void
+exynosautov920_usb31drd_lane0_reset(struct exynos5_usbdrd_phy *phy_drd, int val)
+{
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 reg;
+
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+	reg |= PHY_RST_CTRL_PIPE_LANE0_RESET_N_OVRD_EN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+	if (val)
+		reg &= ~PHY_RST_CTRL_PIPE_LANE0_RESET_N;
+	else
+		reg |= PHY_RST_CTRL_PIPE_LANE0_RESET_N;
+
+	reg &= ~PHY_RST_CTRL_PIPE_LANE0_RESET_N_OVRD_EN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
+}
+
+static void
+exynosautov920_usb31drd_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
+{
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 reg;
+
+	/*
+	 * Phy and Pipe Lane reset assert.
+	 * assert reset (phy_reset = 1).
+	 * The lane-ack outputs are asserted during reset (tx_ack = rx_ack = 1)
+	 */
+	exynosautov920_usb31drd_phy_reset(phy_drd, 1);
+	exynosautov920_usb31drd_lane0_reset(phy_drd, 1);
+
+	/*
+	 * ANA Power En, PCS & PMA PWR Stable Set
+	 * ramp-up power suppiles
+	 */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG0);
+	reg |= PHY_CONFIG0_PHY0_ANA_PWR_EN | PHY_CONFIG0_PHY0_PCS_PWR_STABLE |
+		PHY_CONFIG0_PHY0_PMA_PWR_STABLE;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG0);
+
+	fsleep(10);
+
+	/*
+	 * phy is not functional in test_powerdown mode, test_powerdown to be
+	 * de-asserted for normal operation
+	 */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
+	reg &= ~PHY_CONFIG7_PHY_TEST_POWERDOWN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
+
+	/*
+	 * phy reset signal be asserted for minimum 10us after power
+	 * supplies are ramped-up
+	 */
+	fsleep(10);
+
+	/*
+	 * Phy and Pipe Lane reset assert de-assert
+	 */
+	exynosautov920_usb31drd_phy_reset(phy_drd, 0);
+	exynosautov920_usb31drd_lane0_reset(phy_drd, 0);
+
+	/* Pipe_rx0_sris_mode_en  = 1 */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG4);
+	reg |= PHY_CONFIG4_PIPE_RX0_SRIS_MODE_EN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG4);
+
+	/*
+	 * wait for lane ack outputs to de-assert (tx_ack = rx_ack = 0)
+	 * Exit from the reset state is indicated by de-assertion of *_ack
+	 */
+	exynosautov920_usb31drd_port_phy_ready(phy_drd);
+
+	/* override values for level settings */
+	exynosautov920_usb31drd_cr_write(phy_drd, 0x22, 0x00F5);
+}
+
+static void
+exynosautov920_usb31drd_ssphy_disable(struct exynos5_usbdrd_phy *phy_drd)
+{
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 reg;
+
+	/* 1. Assert reset (phy_reset = 1) */
+	exynosautov920_usb31drd_lane0_reset(phy_drd, 1);
+	exynosautov920_usb31drd_phy_reset(phy_drd, 1);
+
+	/* phy test power down */
+	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
+	reg |= PHY_CONFIG7_PHY_TEST_POWERDOWN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
+}
+
 static void
 exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 {
@@ -2173,12 +2450,15 @@ exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	/* after POR low and delay 75us, PHYCLOCK is guaranteed. */
 	fsleep(75);
 
-	/* force pipe3 signal for link */
+	/* Disable forcing pipe interface */
 	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
-	reg |= LINKCTRL_FORCE_PIPE_EN;
-	reg &= ~LINKCTRL_FORCE_PHYSTATUS;
-	reg |= LINKCTRL_FORCE_RXELECIDLE;
+	reg &= ~LINKCTRL_FORCE_PIPE_EN;
 	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
+
+	/* Pclk to pipe_clk */
+	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
+	reg |= EXYNOS2200_CLKRST_LINK_PCLK_SEL;
+	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
 }
 
 static void
@@ -2226,6 +2506,8 @@ static int exynosautov920_usbdrd_phy_init(struct phy *phy)
 		/* Bypass PHY isol when first USB is powered on */
 		if ((atomic_inc_return(&usage_count) == 1))
 			inst->phy_cfg->phy_isol(inst, false);
+	} else if (inst->phy_cfg->id == EXYNOS5_DRDPHY_PIPE3) {
+		inst->phy_cfg->phy_isol(inst, false);
 	}
 
 	/* UTMI or PIPE3 specific init */
@@ -2275,6 +2557,10 @@ static int exynosautov920_usbdrd_combo_phy_exit(struct phy *phy)
 		/* enable PHY isol when all USBs are powered off */
 		if (atomic_dec_and_test(&usage_count))
 			inst->phy_cfg->phy_isol(inst, true);
+	} else if (inst->phy_cfg->id == EXYNOS5_DRDPHY_PIPE3) {
+		exynosautov920_usb31drd_ssphy_disable(phy_drd);
+
+		inst->phy_cfg->phy_isol(inst, true);
 	}
 
 	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
@@ -2333,6 +2619,36 @@ static const char * const exynosautov920_regulator_names[] = {
 	"avdd075_usb", "avdd18_usb20", "avdd33_usb20",
 };
 
+static const struct
+exynos5_usbdrd_phy_config usb31drd_phy_cfg_exynosautov920[] = {
+	{
+		.id		= EXYNOS5_DRDPHY_PIPE3,
+		.phy_isol	= exynos5_usbdrd_phy_isol,
+		.phy_init	= exynosautov920_usb31drd_pipe3_init,
+	},
+};
+
+static const struct phy_ops exynosautov920_usb31drd_combo_ssphy_ops = {
+	.init		= exynosautov920_usbdrd_phy_init,
+	.exit		= exynosautov920_usbdrd_combo_phy_exit,
+	.power_on	= exynosautov920_usbdrd_phy_power_on,
+	.power_off	= exynosautov920_usbdrd_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static const
+struct exynos5_usbdrd_phy_drvdata exynosautov920_usb31drd_combo_ssphy = {
+	.phy_cfg		= usb31drd_phy_cfg_exynosautov920,
+	.phy_ops		= &exynosautov920_usb31drd_combo_ssphy_ops,
+	.pmu_offset_usbdrd0_phy	= EXYNOSAUTOV920_PHY_CTRL_USB31,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynosautov920_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynosautov920_regulator_names),
+};
+
 static const struct phy_ops exynosautov920_usbdrd_combo_hsphy_ops = {
 	.init		= exynosautov920_usbdrd_phy_init,
 	.exit		= exynosautov920_usbdrd_combo_phy_exit,
@@ -2597,6 +2913,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos990-usbdrd-phy",
 		.data = &exynos990_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynosautov920-usb31drd-combo-ssphy",
+		.data = &exynosautov920_usb31drd_combo_ssphy
 	}, {
 		.compatible = "samsung,exynosautov920-usbdrd-combo-hsphy",
 		.data = &exynosautov920_usbdrd_combo_hsphy
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index 4923f9be3d1f..f96c773b85c9 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -690,4 +690,5 @@
 
 /* exynosautov920 */
 #define EXYNOSAUTOV920_PHY_CTRL_USB20				(0x0710)
+#define EXYNOSAUTOV920_PHY_CTRL_USB31				(0x0714)
 #endif /* __LINUX_SOC_EXYNOS_REGS_PMU_H */
-- 
2.34.1



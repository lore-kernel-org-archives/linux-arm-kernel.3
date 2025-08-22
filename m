Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4B1CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oC8+wABge0eCpTBWQPlU18vFXIcnsK90CnWdr7GdcF0=; b=eVZ14NBmkqPROBkje5/4D3cekU
	4mHBzArkAdoKfb5NGxKpNh8WUYkoRNcxHDE+bktx97l/AxJer+pWG1szb16QRIcxQx+C8ww7mrw9u
	NmIo/TNE2N/1dV3wpYftM4wezBRNJiZQZjszGkMz3OI6b8psrLo3yhckR/VNIS4ObkKGldJPtK03U
	/U6jD6WgU0wyjNXASHxIo/aSZRditI0yQGi7f9QiyQSpd4cic7nxgshJB65yvwVhdTgd1M460NE55
	WqCU9lZaqmYddl4/Ojj8YmFis179ye61L/WAVQgySSVdhqa9gTKCOmo3Qo46nLSrVP13f4jeQWqfu
	VHs8SR+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphp5-000000043fV-0uvr;
	Sat, 23 Aug 2025 06:33:55 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upO6C-0000000234F-3ikk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:30:18 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250822093015epoutp02e6eb1f2fbb7581f7e9cae3fae50a4ba0~eDNVfjSkS3249432494epoutp02c
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 09:30:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250822093015epoutp02e6eb1f2fbb7581f7e9cae3fae50a4ba0~eDNVfjSkS3249432494epoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755855015;
	bh=oC8+wABge0eCpTBWQPlU18vFXIcnsK90CnWdr7GdcF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZH6PYPrhWOWaVpXT/9iua43AVryK2wLo0e3a7IGOJ0SzkxjrVBDdv7DPwrKxOk5gb
	 ATyUfI0RoHbCBERLLog9OrWLfyflxw5nfWQ3YczOhNA24C20K78LjezRu1e+66uau4
	 YCLKVGwitwHOaDi8ACDvmIfMWU4wmJKHr4xbzMm4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250822093013epcas5p2bab419bb1e649c19f62192e4cf3d7b04~eDNUPQNeC1655716557epcas5p2Y;
	Fri, 22 Aug 2025 09:30:13 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c7ZfX6pxlz2SSKb; Fri, 22 Aug
	2025 09:30:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250822093012epcas5p1550eebdc0d2847ebf09945ae46c8335d~eDNSry0-u1782717827epcas5p1X;
	Fri, 22 Aug 2025 09:30:12 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250822093008epsmtip2f0b5f002918da8bd620095e7371c982e~eDNPhAT0m0037000370epsmtip2S;
	Fri, 22 Aug 2025 09:30:08 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, igor.belwon@mentallysanemainliners.org,
	johan@kernel.org, m.szyprowski@samsung.com, s.nawrocki@samsung.com,
	pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v7 2/6] phy: exynos5-usbdrd: support HS phy for
 ExynosAutov920
Date: Fri, 22 Aug 2025 15:08:41 +0530
Message-Id: <20250822093845.1179395-3-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822093845.1179395-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250822093012epcas5p1550eebdc0d2847ebf09945ae46c8335d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250822093012epcas5p1550eebdc0d2847ebf09945ae46c8335d
References: <20250822093845.1179395-1-pritam.sutar@samsung.com>
	<CGME20250822093012epcas5p1550eebdc0d2847ebf09945ae46c8335d@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_023017_241938_3C683AA1 
X-CRM114-Status: GOOD (  16.92  )
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

Enable UTMI+ phy support for this SoC which is very similar to what
the existing Exynos850 supports.

Add required change in phy driver to support HS phy for this SoC.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c    | 123 ++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |   2 +
 2 files changed, 125 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index a88ba95bdc8f..b238d14e2f4a 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -2054,6 +2054,126 @@ static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static int exynosautov920_usbdrd_phy_init(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret)
+		return ret;
+
+	/* Bypass PHY isol */
+	inst->phy_cfg->phy_isol(inst, false);
+
+	/* UTMI or PIPE3 specific init */
+	inst->phy_cfg->phy_init(phy_drd);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	return 0;
+}
+
+static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret)
+		return ret;
+
+	exynos850_usbdrd_phy_exit(phy);
+
+	/* enable PHY isol */
+	inst->phy_cfg->phy_isol(inst, true);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	return 0;
+}
+
+static int exynosautov920_usbdrd_phy_power_on(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	int ret;
+
+	dev_dbg(phy_drd->dev, "Request to power_on usbdrd_phy phy\n");
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_core_clks,
+				      phy_drd->core_clks);
+	if (ret)
+		return ret;
+
+	/* Enable supply */
+	ret = regulator_bulk_enable(phy_drd->drv_data->n_regulators,
+				    phy_drd->regulators);
+	if (ret) {
+		dev_err(phy_drd->dev, "Failed to enable PHY regulator(s)\n");
+		goto fail_supply;
+	}
+
+	return 0;
+
+fail_supply:
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_core_clks,
+				   phy_drd->core_clks);
+
+	return ret;
+}
+
+static int exynosautov920_usbdrd_phy_power_off(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+
+	dev_dbg(phy_drd->dev, "Request to power_off usbdrd_phy phy\n");
+
+	/* Disable supply */
+	regulator_bulk_disable(phy_drd->drv_data->n_regulators,
+			       phy_drd->regulators);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_core_clks,
+				   phy_drd->core_clks);
+
+	return 0;
+}
+
+static const char * const exynosautov920_usb20_regulators[] = {
+	"dvdd075-usb20", "vdd18-usb20", "vdd33-usb20",
+};
+
+static const struct phy_ops exynosautov920_usbdrd_phy_ops = {
+	.init		= exynosautov920_usbdrd_phy_init,
+	.exit		= exynosautov920_usbdrd_phy_exit,
+	.power_on       = exynosautov920_usbdrd_phy_power_on,
+	.power_off      = exynosautov920_usbdrd_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920[] = {
+	{
+		.id		= EXYNOS5_DRDPHY_UTMI,
+		.phy_isol	= exynos5_usbdrd_phy_isol,
+		.phy_init	= exynos850_usbdrd_utmi_init,
+	},
+};
+
+static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_phy = {
+	.phy_cfg		= phy_cfg_exynosautov920,
+	.phy_ops		= &exynosautov920_usbdrd_phy_ops,
+	.pmu_offset_usbdrd0_phy	= EXYNOSAUTOV920_PHY_CTRL_USB20,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynosautov920_usb20_regulators,
+	.n_regulators		= ARRAY_SIZE(exynosautov920_usb20_regulators),
+};
+
 static const struct exynos5_usbdrd_phy_config phy_cfg_gs101[] = {
 	{
 		.id		= EXYNOS5_DRDPHY_UTMI,
@@ -2260,6 +2380,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos990-usbdrd-phy",
 		.data = &exynos990_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynosautov920-usbdrd-phy",
+		.data = &exynosautov920_usbdrd_phy
 	},
 	{ },
 };
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index 71e0c09a49eb..4923f9be3d1f 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -688,4 +688,6 @@
 #define GS101_GRP2_INTR_BID_UPEND				(0x0208)
 #define GS101_GRP2_INTR_BID_CLEAR				(0x020c)
 
+/* exynosautov920 */
+#define EXYNOSAUTOV920_PHY_CTRL_USB20				(0x0710)
 #endif /* __LINUX_SOC_EXYNOS_REGS_PMU_H */
-- 
2.34.1



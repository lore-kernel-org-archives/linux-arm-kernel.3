Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58B1C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 07:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=Dgb1ngpCR4vwZb6TG7VDqdD3XYLGgbrQsP5sDw19djY=; b=YUbuEAdHKbJ2m7
	XpPRn2Ph13mHqH6ksrRdHeFx93T6phpKdjMSIXqH5fRLCdSLyb7x+WPpRpjaEer/mBCwurg3Z2kf7
	bmY36dLLF2i3Q3kdLPeSpbjV9FYwmBkVDq825TdZD2Pc/RjCMWKrcek44aCoYtRRxLa5SwmjsgqGj
	M3YHxd8SNekXLvXmguJrL94BPswrNkCg9neRq4g+Qisru1W8hii8DXSpFidG/6Gtbc249KFT4VYbb
	8eE/LEkWvAlfoH4wemg02BCCVwry9fdgZvhwQ2r+Tn1PG3+edd37Vu5rNUqqIrEcb7yVnkVMX/rUm
	0MnT16O4Hr93Z77iWAJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0w3r-00000008g7d-32x4;
	Mon, 31 Aug 2026 07:04:07 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0w3l-00000008g6P-0VUx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 07:04:06 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260831070352epoutp010c9a7e83cfd31ad8bd923d64dc517c34~Q0eTJ44Xi1312713127epoutp010
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 07:03:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260831070352epoutp010c9a7e83cfd31ad8bd923d64dc517c34~Q0eTJ44Xi1312713127epoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788159832;
	bh=Dgb1ngpCR4vwZb6TG7VDqdD3XYLGgbrQsP5sDw19djY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=HpEkP/DH2n3xOOnopyTG0qva57RbDbJxtyXz9+oOxmY8Iyh9gDXTw3bAC7n8LAUDg
	 DAqiynEYOZ3p/3o9xt4zC6d/NleFHw0K9c4qxtESdhu5WwJaCu6qIyOZZj6BxRGyPE
	 rh2L8c8kc0EvfNz9jnqg5UZp/OCp4ph4RV4lnZAo=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260831070351epcas5p46018d94a0c2ca993ee8680a5e0628591~Q0eSQ4KUS1551015510epcas5p4m;
	Mon, 31 Aug 2026 07:03:51 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hYKj24Kvvz3hhT4; Mon, 31 Aug
	2026 07:03:50 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0~Q0eQsfTZ_1106911069epcas5p4l;
	Mon, 31 Aug 2026 07:03:49 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260831070346epsmtip1c4aeecb2495ffbcfc6ef1ee7dbfb8368~Q0eNxrS9g0914309143epsmtip1D;
	Mon, 31 Aug 2026 07:03:46 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, krzk@kernel.org,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, pritam.sutar@samsung.com,
	andre.draszik@linaro.org, kernel@lvkasz.us, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
	muhammed.ali@samsung.com, thiagu.r@samsung.com, Selvarasu Ganesan
	<selvarasu.g@samsung.com>
Subject: [PATCH] phy: exynos5-usbdrd: Use dynamic phy_cfg size to prevent
 OOB access
Date: Mon, 31 Aug 2026 12:33:09 +0530
Message-Id: <20260831070309.158069-1-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
X-CMS-MailID: 20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0
References: <CGME20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_000401_843684_E33CD808 
X-CRM114-Status: GOOD (  21.91  )
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

The probe loop currently iterates using EXYNOS5_DRDPHYS_NUM (2),
creating both UTMI and PIPE3 PHY instances regardless of the SoC
capability. Several SoCs (Exynos2200, Exynos7870, Exynos850, Exynos990,
and ExynosAutoV920) provide phy_cfg arrays containing only a single
element.

On these SoCs, when the loop reaches index 1, the driver reads past the
end of the rodata array, populating the second PHY instance with garbage
data. Since the configuration structure contains critical function
pointers (phy_isol, phy_init, set_refclk), any subsequent access to this
PHY instance via exynos5_usbdrd_phy_xlate could result in a kernel oops.

Fix this by adding 'n_phy_cfg' to struct exynos5_usbdrd_phy_drvdata to
store the actual size of the phy_cfg array for each SoC. Update the
probe loop and the xlate function to bound their access against this
value instead of the hardcoded EXYNOS5_DRDPHYS_NUM.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 8711a3b62c8e..311d1c25eb3e 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -477,6 +477,7 @@ struct exynos5_usbdrd_phy_config {
 
 struct exynos5_usbdrd_phy_drvdata {
 	const struct exynos5_usbdrd_phy_config *phy_cfg;
+	int n_phy_cfg;
 	const struct exynos5_usbdrd_phy_tuning **phy_tunes;
 	const struct phy_ops *phy_ops;
 	const char * const *clk_names;
@@ -1164,7 +1165,7 @@ static struct phy *exynos5_usbdrd_phy_xlate(struct device *dev,
 {
 	struct exynos5_usbdrd_phy *phy_drd = dev_get_drvdata(dev);
 
-	if (WARN_ON(args->args[0] >= EXYNOS5_DRDPHYS_NUM))
+	if (WARN_ON(args->args[0] >= phy_drd->drv_data->n_phy_cfg))
 		return ERR_PTR(-ENODEV);
 
 	return phy_drd->phys[args->args[0]].phy;
@@ -1993,6 +1994,7 @@ static const char * const exynos5_regulator_names[] = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos2200_usb32drd_phy = {
 	.phy_cfg		= phy_cfg_exynos2200,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos2200),
 	.phy_ops		= &exynos2200_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS2200_PHY_CTRL_USB20,
 	.clk_names		= exynos5_clk_names,
@@ -2006,6 +2008,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos2200_usb32drd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos5),
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.pmu_offset_usbdrd1_phy	= EXYNOS5420_USBDRD1_PHY_CONTROL,
@@ -2019,6 +2022,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos5),
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.clk_names		= exynos5_clk_names,
@@ -2031,6 +2035,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos5),
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.pmu_offset_usbdrd1_phy	= EXYNOS5433_USBHOST30_PHY_CONTROL,
@@ -2044,6 +2049,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos5),
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.clk_names		= exynos5_clk_names,
@@ -2056,6 +2062,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos7870,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos7870),
 	.phy_tunes		= exynos7870_tunes,
 	.phy_ops		= &exynos7870_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
@@ -2069,6 +2076,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos850,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos850),
 	.phy_ops		= &exynos850_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.clk_names		= exynos5_clk_names,
@@ -2097,6 +2105,7 @@ static const struct exynos5_usbdrd_phy_tuning *exynos990_tunes[PTS_MAX] = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos850,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos850),
 	.phy_ops		= &exynos850_usbdrd_phy_ops,
 	.phy_tunes		= exynos990_tunes,
 	.pmu_offset_usbdrd0_phy	= EXYNOS990_PHY_CTRL_USB20,
@@ -2629,6 +2638,7 @@ static const struct phy_ops exynosautov920_usb31drd_combo_ssphy_ops = {
 static const
 struct exynos5_usbdrd_phy_drvdata exynosautov920_usb31drd_combo_ssphy = {
 	.phy_cfg		= usb31drd_phy_cfg_exynosautov920,
+	.n_phy_cfg		= ARRAY_SIZE(usb31drd_phy_cfg_exynosautov920),
 	.phy_ops		= &exynosautov920_usb31drd_combo_ssphy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOSAUTOV920_PHY_CTRL_USB31,
 	.clk_names		= exynos5_clk_names,
@@ -2659,6 +2669,7 @@ exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920[] = {
 static const
 struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_combo_hsphy = {
 	.phy_cfg		= usbdrd_hsphy_cfg_exynosautov920,
+	.n_phy_cfg		= ARRAY_SIZE(usbdrd_hsphy_cfg_exynosautov920),
 	.phy_ops		= &exynosautov920_usbdrd_combo_hsphy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOSAUTOV920_PHY_CTRL_USB20,
 	.clk_names		= exynos5_clk_names,
@@ -2687,6 +2698,7 @@ static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920[] = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynosautov920,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynosautov920),
 	.phy_ops		= &exynosautov920_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOSAUTOV920_PHY_CTRL_USB20,
 	.clk_names		= exynos5_clk_names,
@@ -2863,6 +2875,7 @@ static const char * const gs101_regulator_names[] = {
 
 static const struct exynos5_usbdrd_phy_drvdata gs101_usbd31rd_phy = {
 	.phy_cfg			= phy_cfg_gs101,
+	.n_phy_cfg			= ARRAY_SIZE(phy_cfg_gs101),
 	.phy_tunes			= gs101_tunes,
 	.phy_ops			= &gs101_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy		= GS101_PHY_CTRL_USB20,
@@ -3020,7 +3033,7 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 
 	dev_vdbg(dev, "Creating usbdrd_phy phy\n");
 
-	for (i = 0; i < EXYNOS5_DRDPHYS_NUM; i++) {
+	for (i = 0; i < drv_data->n_phy_cfg; i++) {
 		struct phy *phy = devm_phy_create(dev, NULL, drv_data->phy_ops);
 
 		if (IS_ERR(phy))
-- 
2.17.1



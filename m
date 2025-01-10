Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4911CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 12:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgTUAt4+lirCcUdi2U9e9XMaC6AuT0r7NuvKX2TEiQ4=; b=tMNKjZEtSHGgJem/Tjr6+hP0iP
	vJbj597Pd6lDXYvoWO6NiFXOtIcyMdbsrDugyPwPUbLdJNMNsPby3+MjQZwJEakTUVe77JTjvBIto
	YVWYqB3uBF1E1KtVE21e6B6PfvNpV92Nmuj3kzhhXPp58Ky4K/INJvxm+P2wGo905ox7lOjngI1A1
	rf1KnM5CvjcY0JUPwzeu4v8xh4t6A5DQ8g3e8iyb3NwPCRpF1y9/EN6Uy6cns04a83Lvw2pqBn+Ts
	Ciw7OPaGF0KJH660dxbAGZHwrtB9IRuKKU9phlwF7g5jouY1QlDwtKbjrV8hJPzJFbMWt+Ie4WxLl
	120AlKug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEHk-0000000FIkj-2jK7;
	Fri, 10 Jan 2025 12:38:44 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEFL-0000000FISM-1C9X;
	Fri, 10 Jan 2025 12:36:16 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ACNYdQ027018;
	Fri, 10 Jan 2025 13:36:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	RgTUAt4+lirCcUdi2U9e9XMaC6AuT0r7NuvKX2TEiQ4=; b=ePDJ2c4D26+mJkbz
	3oLHPWg22xF5bcubycxAgRJu9/Yw/4OdD7wAVV6kS2VHzs45sP+sPNMNLVD64nkB
	FeEAutoswgX5Vxwg4Zec1DwDiZZyt223nnaZplSeNPOErLVRCnKTMSnAMHVfsQLj
	BSLUTx7QCX4r4dw3lHtvL8cIHip28QDb1ViXGuEcqMqayMZObyhz8Ne0BXTJxOEi
	H7ckjgy4U8gn5GML2cpJ7Am/2w/N4YzWDIad1YXdkSa85aJqr0kiuWRazQFOwYVz
	uAeVlnUCun9d7RF1PbmUk5ZeqTVjK9cpSReSfQj1BQPw3tg5OFAnLiW5J9i1JS2F
	K9VLqw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 442mw0k59n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 13:36:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4301C4004A;
	Fri, 10 Jan 2025 13:34:49 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 268532A8EFF;
	Fri, 10 Jan 2025 13:34:17 +0100 (CET)
Received: from localhost (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 10 Jan
 2025 13:34:16 +0100
From: Christian Bruel <christian.bruel@foss.st.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <p.zabel@pengutronix.de>,
        <linux-phy@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <fabrice.gasnier@foss.st.com>
CC: Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH 1/1] phy: stm32: Optimize tuning values from DT.
Date: Fri, 10 Jan 2025 13:33:56 +0100
Message-ID: <20250110123356.974839-2-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110123356.974839-1-christian.bruel@foss.st.com>
References: <20250110123356.974839-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_043615_603658_8C3D9122 
X-CRM114-Status: GOOD (  17.12  )
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

phy_init can be recalled during PM resume. Thus cache the tuning values
from the device tree.
Don't read the known default ohm value from regmap.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 drivers/phy/st/phy-stm32-combophy.c | 82 ++++++++++++++---------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/phy/st/phy-stm32-combophy.c b/drivers/phy/st/phy-stm32-combophy.c
index 49e9fa90a681..198f1b4ba095 100644
--- a/drivers/phy/st/phy-stm32-combophy.c
+++ b/drivers/phy/st/phy-stm32-combophy.c
@@ -86,6 +86,10 @@ struct stm32_combophy {
 	struct clk_bulk_data clks[ARRAY_SIZE(combophy_clks)];
 	int num_clks;
 	bool have_pad_clk;
+	bool have_ssc;
+	int rx_eq;
+	u32 microohm;
+	u32 microvolt;
 	unsigned int type;
 	bool is_init;
 	int irq_wakeup;
@@ -112,27 +116,15 @@ static const struct clk_impedance imp_lookup[] = {
 	{ 3999000, { 571000, 648000, 726000, 803000 } }
 };
 
-static int stm32_impedance_tune(struct stm32_combophy *combophy)
+static void stm32_impedance_tune(struct stm32_combophy *combophy)
 {
-	u8 imp_size = ARRAY_SIZE(imp_lookup);
-	u8 vswing_size = ARRAY_SIZE(imp_lookup[0].vswing);
 	u8 imp_of, vswing_of;
-	u32 max_imp = imp_lookup[0].microohm;
-	u32 min_imp = imp_lookup[imp_size - 1].microohm;
-	u32 max_vswing = imp_lookup[imp_size - 1].vswing[vswing_size - 1];
-	u32 min_vswing = imp_lookup[0].vswing[0];
-	u32 val;
 	u32 regval;
 
-	if (!of_property_read_u32(combophy->dev->of_node, "st,output-micro-ohms", &val)) {
-		if (val < min_imp || val > max_imp) {
-			dev_err(combophy->dev, "Invalid value %u for output ohm\n", val);
-			return -EINVAL;
-		}
-
+	if (combophy->microohm) {
 		regval = 0;
 		for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++) {
-			if (imp_lookup[imp_of].microohm <= val) {
+			if (imp_lookup[imp_of].microohm <= combophy->microohm) {
 				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of);
 				break;
 			}
@@ -145,19 +137,14 @@ static int stm32_impedance_tune(struct stm32_combophy *combophy)
 				   STM32MP25_PCIEPRG_IMPCTRL_OHM,
 				   regval);
 	} else {
-		regmap_read(combophy->regmap, SYSCFG_PCIEPRGCR, &val);
-		imp_of = FIELD_GET(STM32MP25_PCIEPRG_IMPCTRL_OHM, val);
+		/* default is 50 ohm */
+		imp_of = 3;
 	}
 
-	if (!of_property_read_u32(combophy->dev->of_node, "st,output-vswing-microvolt", &val)) {
-		if (val < min_vswing || val > max_vswing) {
-			dev_err(combophy->dev, "Invalid value %u for output vswing\n", val);
-			return -EINVAL;
-		}
-
+	if (combophy->microvolt) {
 		regval = 0;
 		for (vswing_of = 0; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++) {
-			if (imp_lookup[imp_of].vswing[vswing_of] >= val) {
+			if (imp_lookup[imp_of].vswing[vswing_of] >= combophy->microvolt) {
 				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of);
 				break;
 			}
@@ -170,8 +157,6 @@ static int stm32_impedance_tune(struct stm32_combophy *combophy)
 				   STM32MP25_PCIEPRG_IMPCTRL_VSWING,
 				   regval);
 	}
-
-	return 0;
 }
 
 static int stm32_combophy_pll_init(struct stm32_combophy *combophy)
@@ -197,7 +182,7 @@ static int stm32_combophy_pll_init(struct stm32_combophy *combophy)
 		cr1_val |= SYSCFG_COMBOPHY_CR1_REFSSPEN;
 	}
 
-	if (of_property_present(combophy->dev->of_node, "st,ssc-on")) {
+	if (combophy->have_ssc) {
 		dev_dbg(combophy->dev, "Enabling clock with SSC\n");
 		cr1_mask |= SYSCFG_COMBOPHY_CR1_SSCEN;
 		cr1_val |= SYSCFG_COMBOPHY_CR1_SSCEN;
@@ -253,22 +238,14 @@ static int stm32_combophy_pll_init(struct stm32_combophy *combophy)
 	reset_control_assert(combophy->phy_reset);
 
 	if (combophy->type == PHY_TYPE_PCIE) {
-		ret = stm32_impedance_tune(combophy);
-		if (ret)
-			goto out_iso;
+		stm32_impedance_tune(combophy);
 
 		cr1_mask |= SYSCFG_COMBOPHY_CR1_REFUSEPAD;
 		cr1_val |= combophy->have_pad_clk ? SYSCFG_COMBOPHY_CR1_REFUSEPAD : 0;
 	}
 
-	if (!of_property_read_u32(combophy->dev->of_node, "st,rx-equalizer", &val)) {
-		dev_dbg(combophy->dev, "Set RX equalizer %u\n", val);
-		if (val > SYSCFG_COMBOPHY_CR4_RX0_EQ) {
-			dev_err(combophy->dev, "Invalid value %u for rx0 equalizer\n", val);
-			ret = -EINVAL;
-			goto out_iso;
-		}
-
+	if (combophy->rx_eq != -1) {
+		dev_dbg(combophy->dev, "Set RX equalizer %u\n", combophy->rx_eq);
 		regmap_update_bits(combophy->regmap, SYSCFG_COMBOPHY_CR4,
 			   SYSCFG_COMBOPHY_CR4_RX0_EQ, val);
 	}
@@ -314,9 +291,6 @@ static int stm32_combophy_pll_init(struct stm32_combophy *combophy)
 
 	return 0;
 
-out_iso:
-	reset_control_deassert(combophy->phy_reset);
-
 out:
 	regmap_update_bits(combophy->regmap, SYSCFG_COMBOPHY_CR2,
 			   SYSCFG_COMBOPHY_CR2_ISO_DIS, 0);
@@ -522,6 +496,12 @@ static int stm32_combophy_probe(struct platform_device *pdev)
 	struct stm32_combophy *combophy;
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
+	u8 imp_size = ARRAY_SIZE(imp_lookup);
+	u8 vswing_size = ARRAY_SIZE(imp_lookup[0].vswing);
+	u32 max_imp = imp_lookup[0].microohm;
+	u32 min_imp = imp_lookup[imp_size - 1].microohm;
+	u32 max_vswing = imp_lookup[imp_size - 1].vswing[vswing_size - 1];
+	u32 min_vswing = imp_lookup[0].vswing[0];
 	int ret, irq;
 
 	combophy = devm_kzalloc(dev, sizeof(*combophy), GFP_KERNEL);
@@ -569,6 +549,26 @@ static int stm32_combophy_probe(struct platform_device *pdev)
 						 combophy->irq_wakeup);
 	}
 
+	if (of_property_present(dev->of_node, "st,ssc-on"))
+		combophy->have_ssc = true;
+
+	if (!of_property_read_u32(dev->of_node, "st,rx-equalizer", &combophy->rx_eq)) {
+		if (combophy->rx_eq > SYSCFG_COMBOPHY_CR4_RX0_EQ)
+			return dev_err_probe(dev, combophy->rx_eq,
+					     "Invalid value for rx0 equalizer\n");
+	} else
+		combophy->rx_eq = -1;
+
+	if (!of_property_read_u32(dev->of_node, "st,output-micro-ohms", &combophy->microohm))
+		if (combophy->microohm < min_imp || combophy->microohm > max_imp)
+			return dev_err_probe(dev, combophy->microohm,
+					     "Invalid value for output ohm\n");
+
+	if (!of_property_read_u32(dev->of_node, "st,output-vswing-microvolt", &combophy->microvolt))
+		if (combophy->microvolt < min_vswing || combophy->microvolt > max_vswing)
+			return dev_err_probe(dev, combophy->microvolt,
+					     "Invalid value for output vswing\n");
+
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable pm runtime\n");
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059EAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 09:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjLVTN7/RI83990q23Vq9VUZh5/11YsOgwaHHfMOObk=; b=J60O7/yaoKJARGHJx22F8B2+Xc
	Q1xZVzjrp0i+LjTf+1iLuFMeyJm6OOnjP/tgJ/CLLUNkMRIIsyTFTBCh7GPQaAmnOHtkcxnqkL9WH
	o24YifhPEIKy0Rz9CFraLgYIc+E++itpjoxGxVIHj5IZOybVxB9kaT9sC/hNkFdk3Re+DNqjQzBDs
	T/ROuf5jXtgCHmDTq/gJxl57oQPjYN9jNKOMaT+BTqXiS0GljR/jp4QbyAjY3ChGVsD3VmClonFFR
	bXNEcG1/LBghf7G/BgBzZ3R0M15UJg7lox1whoZRNK6KpfIOJkQrF9ejvGO1u2G4FggM6yfjQO+9w
	i7WLPVqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1hI-0000000BfuV-0KMm;
	Tue, 24 Dec 2024 09:59:28 +0000
Received: from mail-m3294.qiye.163.com ([220.197.32.94])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1Th-0000000BdHB-2BnJ;
	Tue, 24 Dec 2024 09:45:26 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aa90537;
	Tue, 24 Dec 2024 17:40:20 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Shaohan Yao <shaohan.yao@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	linux-pm@vger.kernel.org,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-kernel@vger.kernel.org,
	Zhang Rui <rui.zhang@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 2/2] thermal: rockchip: Support the rk3562 SoC in thermal driver
Date: Tue, 24 Dec 2024 17:40:15 +0800
Message-Id: <20241224094015.3816301-2-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241224094015.3816301-1-kever.yang@rock-chips.com>
References: <20241224094015.3816301-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkwYSFZMS0MaSx9KQh5JTxlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f809ecbd03afkunm6aa90537
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OBQ6NAw5MzIWUUpKSzgLMRMS
	VjgKCU9VSlVKTEhOS0hISUlKTExMVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFNSU9NNwY+
DKIM-Signature: a=rsa-sha256;
	b=ju8NuTRxypQ+vafyGJ0EUsS7lZDiIqnBPvtmdVI7pJzN+Eu5oIh9DG/7SIRnpGPR/w2vje8FkNyuKmgnygw4Dii1Oaube9ACQdzDPWm24yf9qRvNX/eQzxUeLxP5uavAyLjI1ljDr3xGRMpaD/bLTLCCDrw9Jd85ybrEuc2RmrM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=NjLVTN7/RI83990q23Vq9VUZh5/11YsOgwaHHfMOObk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_014525_749731_75DBC6A3 
X-CRM114-Status: GOOD (  13.97  )
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

From: Shaohan Yao <shaohan.yao@rock-chips.com>

There are one Temperature Sensor on rk3562, channel 0 is for chip.

Signed-off-by: Shaohan Yao <shaohan.yao@rock-chips.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

 drivers/thermal/rockchip_thermal.c | 112 ++++++++++++++++++++++++++++-
 1 file changed, 111 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
index f551df48eef9..aec0e634bd1f 100644
--- a/drivers/thermal/rockchip_thermal.c
+++ b/drivers/thermal/rockchip_thermal.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2014-2016, Fuzhou Rockchip Electronics Co., Ltd
+ * Copyright (c) 2014-2021, Fuzhou Rockchip Electronics Co., Ltd.
+ * Copyright (c) 2021-2024, Rockchip Electronics Co., Ltd.
  * Caesar Wang <wxt@rock-chips.com>
  */
 
@@ -185,6 +186,8 @@ struct rockchip_thermal_data {
 #define TSADCV2_AUTO_PERIOD_HT			0x6c
 #define TSADCV3_AUTO_PERIOD			0x154
 #define TSADCV3_AUTO_PERIOD_HT			0x158
+#define TSADCV9_Q_MAX				0x210
+#define TSADCV9_FLOW_CON			0x218
 
 #define TSADCV2_AUTO_EN				BIT(0)
 #define TSADCV2_AUTO_EN_MASK			BIT(16)
@@ -195,6 +198,7 @@ struct rockchip_thermal_data {
 #define TSADCV2_AUTO_TSHUT_POLARITY_MASK	BIT(24)
 
 #define TSADCV3_AUTO_Q_SEL_EN			BIT(1)
+#define TSADCV3_AUTO_Q_SEL_EN_MASK		BIT(17)
 
 #define TSADCV2_INT_SRC_EN(chn)			BIT(chn)
 #define TSADCV2_INT_SRC_EN_MASK(chn)		BIT(16 + (chn))
@@ -220,6 +224,12 @@ struct rockchip_thermal_data {
 #define TSADCV5_AUTO_PERIOD_HT_TIME		1622 /* 2.5ms */
 #define TSADCV6_AUTO_PERIOD_TIME		5000 /* 2.5ms */
 #define TSADCV6_AUTO_PERIOD_HT_TIME		5000 /* 2.5ms */
+#define TSADCV7_AUTO_PERIOD_TIME		3000 /* 2.5ms */
+#define TSADCV7_AUTO_PERIOD_HT_TIME		3000 /* 2.5ms */
+#define TSADCV12_AUTO_PERIOD_TIME		3000 /* 2.5ms */
+#define TSADCV12_AUTO_PERIOD_HT_TIME		3000 /* 2.5ms */
+#define TSADCV3_Q_MAX_VAL			0x7ff /* 11bit 2047 */
+#define TSADCV12_Q_MAX_VAL			0xfff /* 12bit 4095 */
 
 #define TSADCV2_USER_INTER_PD_SOC		0x340 /* 13 clocks */
 #define TSADCV5_USER_INTER_PD_SOC		0xfc0 /* 97us, at least 90us */
@@ -230,6 +240,8 @@ struct rockchip_thermal_data {
 
 #define PX30_GRF_SOC_CON2			0x0408
 
+#define RK3562_GRF_TSADC_CON			0x0580
+
 #define RK3568_GRF_TSADC_CON			0x0600
 #define RK3568_GRF_TSADC_ANA_REG0		(0x10001 << 0)
 #define RK3568_GRF_TSADC_ANA_REG1		(0x10001 << 1)
@@ -497,6 +509,45 @@ static const struct tsadc_table rk3399_code_table[] = {
 	{TSADCV3_DATA_MASK, 125000},
 };
 
+static const struct tsadc_table rk3562_code_table[] = {
+	{0, -40000},
+	{1419, -40000},
+	{1428, -35000},
+	{1436, -30000},
+	{1445, -25000},
+	{1453, -20000},
+	{1462, -15000},
+	{1470, -10000},
+	{1479, -5000},
+	{1487, 0},
+	{1496, 5000},
+	{1504, 10000},
+	{1512, 15000},
+	{1521, 20000},
+	{1529, 25000},
+	{1538, 30000},
+	{1546, 35000},
+	{1555, 40000},
+	{1563, 45000},
+	{1572, 50000},
+	{1580, 55000},
+	{1589, 60000},
+	{1598, 65000},
+	{1606, 70000},
+	{1615, 75000},
+	{1623, 80000},
+	{1632, 85000},
+	{1640, 90000},
+	{1648, 95000},
+	{1657, 100000},
+	{1666, 105000},
+	{1674, 110000},
+	{1682, 115000},
+	{1691, 120000},
+	{1699, 125000},
+	{TSADCV2_DATA_MASK, 125000},
+};
+
 static const struct tsadc_table rk3568_code_table[] = {
 	{0, -40000},
 	{1584, -40000},
@@ -834,6 +885,37 @@ static void rk_tsadcv8_initialize(struct regmap *grf, void __iomem *regs,
 			       regs + TSADCV2_AUTO_CON);
 }
 
+static void rk_tsadcv12_initialize(struct regmap *grf, void __iomem *regs,
+				   enum tshut_polarity tshut_polarity)
+{
+	writel_relaxed(TSADCV12_AUTO_PERIOD_TIME, regs + TSADCV3_AUTO_PERIOD);
+	writel_relaxed(TSADCV12_AUTO_PERIOD_HT_TIME,
+		       regs + TSADCV3_AUTO_PERIOD_HT);
+	writel_relaxed(TSADCV2_HIGHT_INT_DEBOUNCE_COUNT,
+		       regs + TSADCV3_HIGHT_INT_DEBOUNCE);
+	writel_relaxed(TSADCV2_HIGHT_TSHUT_DEBOUNCE_COUNT,
+		       regs + TSADCV3_HIGHT_TSHUT_DEBOUNCE);
+	writel_relaxed(TSADCV12_Q_MAX_VAL, regs + TSADCV9_Q_MAX);
+	writel_relaxed(TSADCV3_AUTO_Q_SEL_EN | TSADCV3_AUTO_Q_SEL_EN_MASK,
+		       regs + TSADCV2_AUTO_CON);
+	if (tshut_polarity == TSHUT_HIGH_ACTIVE)
+		writel_relaxed(TSADCV2_AUTO_TSHUT_POLARITY_HIGH |
+			       TSADCV2_AUTO_TSHUT_POLARITY_MASK,
+			       regs + TSADCV2_AUTO_CON);
+	else
+		writel_relaxed(TSADCV2_AUTO_TSHUT_POLARITY_MASK,
+			       regs + TSADCV2_AUTO_CON);
+
+	if (!IS_ERR(grf)) {
+		regmap_write(grf, RK3562_GRF_TSADC_CON, RK3568_GRF_TSADC_TSEN);
+		udelay(15);
+		regmap_write(grf, RK3562_GRF_TSADC_CON, RK3568_GRF_TSADC_ANA_REG0);
+		regmap_write(grf, RK3562_GRF_TSADC_CON, RK3568_GRF_TSADC_ANA_REG1);
+		regmap_write(grf, RK3562_GRF_TSADC_CON, RK3568_GRF_TSADC_ANA_REG2);
+		usleep_range(100, 200);
+	}
+}
+
 static void rk_tsadcv2_irq_ack(void __iomem *regs)
 {
 	u32 val;
@@ -1258,6 +1340,30 @@ static const struct rockchip_tsadc_chip rk3399_tsadc_data = {
 	},
 };
 
+static const struct rockchip_tsadc_chip rk3562_tsadc_data = {
+	.chn_offset = 0,
+	.chn_num = 1, /* one channels for tsadc */
+
+	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
+	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
+	.tshut_temp = 95000,
+
+	.initialize = rk_tsadcv12_initialize,
+	.irq_ack = rk_tsadcv4_irq_ack,
+	.control = rk_tsadcv4_control,
+	.get_temp = rk_tsadcv4_get_temp,
+	.set_alarm_temp = rk_tsadcv3_alarm_temp,
+	.set_tshut_temp = rk_tsadcv3_tshut_temp,
+	.set_tshut_mode = rk_tsadcv3_tshut_mode,
+
+	.table = {
+		.id = rk3562_code_table,
+		.length = ARRAY_SIZE(rk3562_code_table),
+		.data_mask = TSADCV2_DATA_MASK,
+		.mode = ADC_INCREMENT,
+	},
+};
+
 static const struct rockchip_tsadc_chip rk3568_tsadc_data = {
 	/* cpu, gpu */
 	.chn_offset = 0,
@@ -1337,6 +1443,10 @@ static const struct of_device_id of_rockchip_thermal_match[] = {
 		.compatible = "rockchip,rk3399-tsadc",
 		.data = (void *)&rk3399_tsadc_data,
 	},
+	{
+		.compatible = "rockchip,rk3562-tsadc",
+		.data = (void *)&rk3562_tsadc_data,
+	},
 	{
 		.compatible = "rockchip,rk3568-tsadc",
 		.data = (void *)&rk3568_tsadc_data,
-- 
2.25.1



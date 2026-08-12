Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A913C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLkRIh3f7frFkLGTVinkb+1IKXnkAcUxQmCJsWgQGaI=; b=X01XCcp3R0E//d93a6WObyzHc4
	y3ZkKYLzgE6HNcyxnVxfHHSLcRBnVvbYFzVNNB1Rod5lg1Y9VIkTT0vonscUKsnM8bq1I1HI9cdt9
	dsLO0VMahB+D4u9R41bHF9csAXEDjtr+WrjUkziRsS33xOpPgDfNdPa0+3Zjss5S1VUbIRHMD6xfj
	2akMwyO5rnuQ31jMmdn3n3mMDCadtFPQi1f7GZJZYg49C27FR3u9R5RfesapN04uLwjfeTtFJiGJV
	qicFUSGZ1Zfj+wzWBHcV8CvskZgwvGG3+h0k7bVJF3s9dIkXzQzNhpzEsWQ+F7x8tZgWNi8U7r7BS
	MKA9aGOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu50R-0000000Fi8A-1HlL;
	Wed, 12 Aug 2026 09:12:15 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu50B-0000000FhvV-3eAn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:12:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mq9C1ix6qaflyVyrYtH5/vnSfepHu6sQojLl3RgnvsYyEIepIHSh1T4b1NpVzlIQZnO4gtDTfY2hThapWAk1Wkg8rWx/LCqWUocJfj+gNjg9xvFzcdZHXmwAhpFZ1F0e2IesIP00DFzHRZtCYBbrGaaEHb30Qz+fJvFqdNOW1QSogCNgcZZCAnn3lLxWBL/OmMFGiEdFqX0vhKQ/JH7sV91hYvYaS8hvSxzHnoXX6q9S+K8jRWr1bgb7eLu5rl6dtbNAluiNNdD46ym15OVt/DBLbkJ+3jUz0oQLMx882w44c3QjRYvpdKt/P+HhOCv2CEm0rWpYIr+FmAAbrYeeuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLkRIh3f7frFkLGTVinkb+1IKXnkAcUxQmCJsWgQGaI=;
 b=AgJVkEOl1PsdYoQplioNBT94tkxsa+N/ITF46DSgZZFins33xVXSEogfMp3FuKzHuczSs6D6pWSmsRp57lEvojJTA4PTfMbuafpQRoRdB06eTvXcHu6I3tLUEpppNPbV9i2VwTEzprAiAn6sNJKyxUbcGIY/uOMScn/TvB4BN+sZ1BsEt4K5y3e8HrE4YICyDk+HP4uXh+yZo5oMXADVPzabiji7KRzJxhzU80pq3ssgb36wD02pbiE7o4hxi0goFPGaZnWeOAabPj5SESM+WWKyVh4uX43MQlbj3dorBVPV2tSv5/7wbKPoUGvNZ98ywtETJdgs+nGbMzq8A+ZpVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lunn.ch smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLkRIh3f7frFkLGTVinkb+1IKXnkAcUxQmCJsWgQGaI=;
 b=ZZ0Im4XTp5e41iVcZtR5j4OXX/kpewnEwtmk4VSW7Dl2IuiM6jWCKnRvR5DQMu3A7lKf/k453PzeXW6kNl/Q5SxKdvaAkHxTXqT82SInKbPgzyju4fdiAnZYq3YLwR2qYz2anOCZtZFHwFs/tA3Yx1IBURvSntnS6r4M2i28Z268C2vepDrlVd1ceFwKBVSe/NJaLnfZ3PVlICX9jWhmkmTMh07NSBYnrjRhj3P7r++iygxP2X2gAV11AQLhjDKg6F3w8eZAyZcGRpb2rD9DKSIzuZix65A0oHkNQplyVDnTeaPxWRvtX9fZfmgHsB8ksxdjbRuLyyDEN3F++ZygSw==
Received: from AS9PR06CA0616.eurprd06.prod.outlook.com (2603:10a6:20b:46e::25)
 by AS8PR10MB7255.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:618::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 09:11:46 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:20b:46e:cafe::26) by AS9PR06CA0616.outlook.office365.com
 (2603:10a6:20b:46e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.13 via Frontend Transport; Wed,
 12 Aug 2026 09:11:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Wed, 12 Aug 2026 09:11:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 12 Aug
 2026 11:17:15 +0200
Received: from localhost (10.252.2.245) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 12 Aug
 2026 11:11:45 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Alexandre Torgue" <alexandre.torgue@foss.st.com>, <linusw@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Vladimir Oltean
	<vladimir.oltean@nxp.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [net-next,PATCH v2 2/5] net: ethernet: stmmac: stm32: support the phy-supply regulator binding
Date: Wed, 12 Aug 2026 11:11:19 +0200
Message-ID: <20260812091122.566439-3-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812091122.566439-1-christophe.roullier@foss.st.com>
References: <20260812091122.566439-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.2.245]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000043:EE_|AS8PR10MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: 836ecc06-6a4d-45b6-1454-08def851bbc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|82310400026|7416014|376014|36860700016|921020|56012099006|18002099003|10067099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: UC38qs8KIGoBcymlRp5aAD+/YhdU7kBsFSGiktLgVOMXHZSvgQBlGdi5/kZgRj6bOzet7panDUp40UECFkPwKYlX9bZWUZJSjttlLRcLYivgFRgNGT37Gp5Hl8mruJj7Udc6NEvW5KEU6YaOZeOpILareKScaVf46SBaXeFSeByGthfWdGuz0ebFaF26MjNyNmagQkY9OYMP6b6SkA2bCsKigu7ijlxlghmOh1kuZQu3wuLQkiYsm7bXmMmZiApJZ28ZV9aAb7BHad2dtSkg5MxceaLnDOvfMlDF1upfxADRUnbhL/tctUAn3xdHrjmSfMlKC4iiW1HNJMqlCi/nz91QVGt65x+8tY4nB2srNvcZEIYgWVOh2borHskHeAIJFyIINsMk6OBCfc1GB+4dKGTGG4Xp9SbKL6CUWb7yu3VwEKHeHvWtv/5kVcCkRNDm6dNzQ4MBbCsXuEH94LEkXhQn2FxyX7xwBKfwS4il75sLWnz+sR+2qCRfZNLaz72yre4yO8lf3EdW3LcUrfMKmR6m3BAObrgsdwFnT86E85llNBPX0ARfOYdiu2w5CMI8G+o8HpEukktVYhWkXFWvvc8rgdZoegUKVZ+SYuTTu2bueQbX5hglMS9zFWd8wYtNExEx5vZgA0ttaLKJF14WUI8yi971qvECYO3ohKZx2KyJxAxb3l++Bl16xWPqASk9gJytS0mL+K4C2VIhU+Sh0ymXeG+nzf/SY+LnAAswCWqFa/2tUp+v6uFAHx4fINGS
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(7416014)(376014)(36860700016)(921020)(56012099006)(18002099003)(10067099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: N0/9QbKGJ8bUMGa3snDMHlKWZ4PzsenlN6Qab4YV0xeYZzzktAGWX5fXD/5JgciAUvCpKAG8Mf1EvO/ghtdBrbOE1VCUt76qEo8ZNNdFCPBS3MQYIvmsgzZn/uTBcrY3OF7nSUbX12P+7NlGYFX7EMEi4LGdxapPLNyS8W6dQkdAmSu9hZRjis/gzrZPBzdlI5yFmjVIo5ko30Ib5ujlzE8Z5f7HHrVg2mHRjnkCnZ5yCD0jJ0LvbioyhFAW4yo6CiYh/B1AyE7rQ7RnQErIiBFHo/0R9NLfmg/XIducoBT7aJzcbiPRdOqdRZLpTk+vkYkkeYVobJNRmM5VQ56Ag8EfKuC4TYOrk5uZoiSgy8pnGf0994+Mc5iQmKiJdy5Otim8O+0G7NQ1+WVgjffTOIotRxZGk8Kkqf87fXmgCAM7Inu8hR4MAuM3i1aNeSPI
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 09:11:45.8802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 836ecc06-6a4d-45b6-1454-08def851bbc7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_021200_386133_3AB48F59 
X-CRM114-Status: GOOD (  18.52  )
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

Configure the phy regulator if defined by the "phy-supply" DT phandle.

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 51 ++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index e1b260ed4790b..4597f605ec1bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -14,6 +14,7 @@
 #include <linux/of_net.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -98,6 +99,7 @@ struct stm32_dwmac {
 	u32 mode_reg;		 /* MAC glue-logic mode register */
 	u32 mode_mask;
 	struct regmap *regmap;
+	struct regulator *regulator;
 	u32 speed;
 	const struct stm32_ops *ops;
 	struct device *dev;
@@ -423,6 +425,16 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
 	if (IS_ERR(dwmac->regmap))
 		return PTR_ERR(dwmac->regmap);
 
+	dwmac->regulator = devm_regulator_get_optional(dev, "phy");
+	if (IS_ERR(dwmac->regulator)) {
+		if (PTR_ERR(dwmac->regulator) == -EPROBE_DEFER) {
+			dev_dbg(dev, "phy regulator is not available yet, deferred probing\n");
+			return -EPROBE_DEFER;
+		}
+		dev_dbg(dev, "no regulator found\n");
+		dwmac->regulator = NULL;
+	}
+
 	if (dwmac->ops->is_mp2)
 		return 0;
 
@@ -522,6 +534,27 @@ static int stm32_dwmac_resume(struct device *dev, void *bsp_priv)
 	return stm32_dwmac_init(priv->plat);
 }
 
+static int phy_power_on(struct stm32_dwmac *bsp_priv, bool enable)
+{
+	int ret;
+	struct device *dev = bsp_priv->dev;
+
+	if (!bsp_priv->regulator)
+		return 0;
+
+	if (enable) {
+		ret = regulator_enable(bsp_priv->regulator);
+		if (ret)
+			dev_err(dev, "fail to enable phy-supply\n");
+	} else {
+		ret = regulator_disable(bsp_priv->regulator);
+		if (ret)
+			dev_err(dev, "fail to disable phy-supply\n");
+	}
+
+	return 0;
+}
+
 static int stm32_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -576,12 +609,18 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
 			goto err_clk_disable;
 	}
 
-	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+	ret = phy_power_on(plat_dat->bsp_priv, true);
 	if (ret)
 		goto err_clk_disable_suspend;
 
+	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+	if (ret)
+		goto err_gmac_powerdown;
+
 	return 0;
 
+err_gmac_powerdown:
+	phy_power_on(plat_dat->bsp_priv, false);
 err_clk_disable_suspend:
 	if (dwmac->ops->clk_rx_enable_in_suspend)
 		clk_disable_unprepare(dwmac->clk_rx);
@@ -614,16 +653,26 @@ static void stm32_dwmac_remove(struct platform_device *pdev)
 		dev_pm_clear_wake_irq(&pdev->dev);
 		device_init_wakeup(&pdev->dev, false);
 	}
+
+	phy_power_on(priv->plat->bsp_priv, false);
 }
 
 static int stm32mp1_suspend(struct stm32_dwmac *dwmac)
 {
+	/* Keep the PHY up if we use Wake-on-Lan. */
+	if (!device_may_wakeup(dwmac->dev))
+		phy_power_on(dwmac, false);
+
 	return clk_prepare_enable(dwmac->clk_ethstp);
 }
 
 static void stm32mp1_resume(struct stm32_dwmac *dwmac)
 {
 	clk_disable_unprepare(dwmac->clk_ethstp);
+
+	/* The PHY was up for Wake-on-Lan. */
+	if (!device_may_wakeup(dwmac->dev))
+		phy_power_on(dwmac, true);
 }
 
 static struct stm32_ops stm32mcu_dwmac_data = {
-- 
2.43.0



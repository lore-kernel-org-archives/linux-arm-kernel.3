Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744D6CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 01:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ON9zurSJSI4QQT1BMl1VRtFngSU5U/rUteO/tCC7Fn0=; b=d3eF7r5sPzztsIvS9jmV0lyTuw
	fOyOqwjPP32OBqrabo7nNU73fWUL1RJe80VWQKM2jTZLJJlf+6XERYtNbCYK1ojovRgQ4aVQWT5Bt
	WsHVGadjOiuxDlMernix9HPApsgs/3SQ0rSI8sJ2Q1xoNaqSNYD1DOqNfe1hFrk3RuSvll0pQhLvw
	srGnSaaEouMkP56scb9Qbl+RAElUkC1NvjYTEW2eEP0KViSmBDPDlm8/QTtg27hUyd3YELPJp5RTy
	f9qpOeC4XKDiubyLpyt+BDf7Ex0xovnR6EqC1RAbOTRuKRjeatU3CwxtM6f1T4TVEBrAcCuoYKkDh
	2nvHVISQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJiH0-0000000C6cl-2738;
	Mon, 04 May 2026 01:39:02 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJiGt-0000000C6Xi-1OoT;
	Mon, 04 May 2026 01:38:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSNzCaMJRFHO+2IBNd1eOeVfQ3h0g7QDlgE1V7GndGjx8+jyKNjG785q/oly1s9jcZXp6wsjF6Q8NISpBFgOu31Sf1g1n9HxzLEBvFgG0ewyTATpBDfe5tH777PNZqHb2y3OGZVem8ouN5BtgwarOhXIP/lN/LFxURpvT0yPDU0OKbzX5Fw1M1QBVr10vl4vR7FOjrbpyEr2BKCDfM8h6dy3FKzYGJiwxjxxKWiYd+NATYfy/Y6qNv8qYZ/hkhPU6YveWD5DKtviL8bbWBT7GYEqV41RRjIhweXUzuNGYhYX3gcKRkUSG7t+f9fbWNpfYBsKKb7rMrvicUUsQ+8C9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ON9zurSJSI4QQT1BMl1VRtFngSU5U/rUteO/tCC7Fn0=;
 b=Ht8d4rvPLhxvz4MyzA4fP/uyIyLm0n9wv3uIpHIL8WdQcFBFJ1ReAuw+9qNmC3whE8xOlhIfXL0L1SIrF9rEfH2HR8DjF/OOnOXbB17E7ZBgA7pkjVq5m4IIvn7BEKtF02buBbgsKOLnSSEg8pKe8AXuKGvLJJ9uMYCg6bYmwqhv6dB/rUlonrow4XRaqQv9iJTwVDiKZeHT3sIRjfte0Xb1jpyhiDolCjRFG36D/nzPQMswh0HZO0vjuJyfYfDXdYWlCVHxouqBLQIoHepid57xwOnckggYGvZDWMY3yGubRmA4Rgvyg6WdFo5oqF9GM09FizYAc6E49SJODAzrkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ON9zurSJSI4QQT1BMl1VRtFngSU5U/rUteO/tCC7Fn0=;
 b=oVc5RjWTLQiXXm1RC5GyCSLKkyzIWsbiU+XavLpYK5/+aiVtAJFQbQ3+0VkP1F/oK5J7iel/XJXZBa+t+H3aNDg0907TilyoBB01GL9SIIteJh1XNgActl7jptgG+btDmIekNsqGreLOhGmC2c+e6rK4yX7b686eyFfVe4Se2BkRBLWTGfNpnrg2g9mTW+OsqSu/GoS5P+1rgyzVkW7NrFKgZSpqp3O9hl+0nH9RJnEad0Z7n5v5NtvlKDvqxmFwn94mVeCePlOTlLwuCx1ckmMzH0TuRxPc6br67s4d/XgGyy8zSzO1C22oLOFfIPjaklilt/artpX93dVKHgTrcQ==
Received: from DS7PR05CA0101.namprd05.prod.outlook.com (2603:10b6:8:56::21) by
 LV0PR18MB927459.namprd18.prod.outlook.com (2603:10b6:408:33d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 01:38:47 +0000
Received: from DM2PEPF00003FC3.namprd04.prod.outlook.com
 (2603:10b6:8:56:cafe::3e) by DS7PR05CA0101.outlook.office365.com
 (2603:10b6:8:56::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.13 via Frontend Transport; Mon,
 4 May 2026 01:38:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 DM2PEPF00003FC3.mail.protection.outlook.com (10.167.23.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Mon, 4 May 2026 01:38:47 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id D0A204186B5B;
	Sun,  3 May 2026 18:36:50 -0700 (PDT)
From: Tzu-Hao Wei <twei@axiado.com>
Date: Mon, 04 May 2026 09:38:33 +0800
Subject: [PATCH RESEND v3 2/4] phy: axiado: add Axiado eMMC PHY driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-axiado-ax3000-add-emmc-phy-driver-support-v3-2-3ab7eb45b0c5@axiado.com>
References: <20260504-axiado-ax3000-add-emmc-phy-driver-support-v3-0-3ab7eb45b0c5@axiado.com>
In-Reply-To: <20260504-axiado-ax3000-add-emmc-phy-driver-support-v3-0-3ab7eb45b0c5@axiado.com>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9023; i=twei@axiado.com;
 h=from:subject:message-id; bh=YBprfDKFNQn6DMWhRJHAypcI9/qyZHy+Jg3oeuFZQSY=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBp9/imRhvYgYqDBP5EjqAtK/SumOryJWzA+erZb
 T7TrAf/BL2JAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaff4pgAKCRB4EDBdxFrx
 1zwfC/9GEP5H3mgQG2et/viQlGShEh7I+YkyYgnvnoD1Gxj09VC/GxbfHo/KGJuPnma/4QQ0XEt
 hJg1+gsr7ITB7YSNhwn2gF63eO8zNC13DTb4UjmSNl1aLOfOAbqoo2RSwXYOYv7M+9r8dHyc2Ma
 UkNEIV7/cgn2+hgh2SWiDOgY1qN/F/l1jDzwi5ybT7CINk+ws4qjzAwwC64GFPL+8lgHK+decvf
 NzQKzv01n+gwUSf0Mx0TMNS4xL+Zbkj/86kcLZUyMym9jn+hTCnjNhQbXDxSCh/SVrYNq94BCxD
 CbOOr8RtPUl/5cCxXepp0czxyu4STGw4FzyfiuCYbbkAO8sMi4OOneryHZYngPqCsaIcvEiNdES
 0riycpjJI7LCyGbLiuQcfM4VSP5MJHa7qpsdLwSimlmindF3fqKX0cgFXvHTHXoW7y/3PwfQtlv
 Hk2bt9tJir0mxbSSQGTi9y6uT+CjwYgV1tnrpVcE2++qvdZQQdM46fHJxjFZekTikqJnA=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC3:EE_|LV0PR18MB927459:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3d705d-46fd-4b00-e3da-08dea97de2a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|34020700016|42112799006|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: Tl9VpJkmOoTO65tDQPahiY8+PdblLfJ7XfH9uHgqxvnIJ6X5+JjguY6wpeLF8Wd8sUSP/KaO8BKZ0/XGm2BuKx2TRjgDDB5JYENmeq3a2ZKlWKd0nc+3eRgU7+CZWcwvPpgMwiDjBLO0LdoWpKlvSBQ51uww8xPOZciB9UPjgGiR4NxhM1PF7uTcDGivEPGpR3P4C2XHf3tmAnlnEIylnR3/OpwlD+rEzEj+YFB23XLYT80xvPcbRnJL28nL22ucT/K46blmbRXryScStEwAPzzRZlIXVSGqLyDzt6jZTa7Hm+3ExnYrP2BxjHzaoj7rmKWGLnO4TY07glDrjj+MKPr3MvVi86w29SFT5eMK2QK1uCkUFFFCX+bIChtcXYhwyReN8RSwgWa+9R/0n2tWrdCgCZjfs6306IP3Z8Djq7zcsZE4pI0FNGxMvXPYqHF793jwESDBMqTPApFZw73AQ7nP0A7vt2xjIh708U/NgI4gi13scaTFM3VAq9BEoESATAQauNhKNUt46Rd4qNNS1yORBIHUDyBA38LO9yd9XStcLOuuq/Jza7YXFB62WlOAZo36od7I/RfnC1+I7f5RilTNG3L3ltIcJC/gHKSH8DEzJXgX4hw3MZfC+3GwQ6B4UoSe1cUfUpewSVLL0S+e2Ey/kpfJjX+Eb+gsPysw+bUhsTmtAWkD2BR2AmF3K9ofenBiCFQIi+CTrMsKO1mKYjtbIT6f5eI9gzUCZSjzaBE=
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(34020700016)(42112799006)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +GSiwcnUSDp4IrpUJlkCN+4u1he6WIMzzGbfPHxN0s3W8WtbInU0b/fcfbD+T3EHVr4V9x7Bp3WXzfghjm2QUSuJNOJRej8Q9xR90ngdYetuR1TnLj+AWHKzGL9aDS4KsB6DMnfP/7hkvlPis2EVLvHLKe9Yzq5M495e6gJVu5Bf5un8Xtj9Qml/xai16Zg6hH61CaSJJ3z7RnnIfrF2yirjDieB4E1vonMy/96BGYcI92D2obBWy+d/ngtkqdrCXrjneYPRWOkgSqQ2uNIwyitDuXo89opJ2ke7wtdIO4kzZgpOIMRTU1CjS94oEdt3aMK3AwPm9ChtEI43bNVES8B2W5W71PGO+CKFZwiieS53m+bp6NfBdCQI92+ALJB1DlPkS3KRWMcCHmdPIVWYj67DILDlj2XWQ5FPk/wloPSI8HF9499dA/KxHMUp2+VD
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 01:38:47.0640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3d705d-46fd-4b00-e3da-08dea97de2a8
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR18MB927459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_183855_448931_633B5F3B 
X-CRM114-Status: GOOD (  16.88  )
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

From: SriNavmani A <srinavmani@axiado.com>

It provides the required configurations for Axiado eMMC PHY driver for
HS200 mode.

Signed-off-by: SriNavmani A <srinavmani@axiado.com>
Co-developed-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 drivers/phy/Kconfig                  |   1 +
 drivers/phy/Makefile                 |   1 +
 drivers/phy/axiado/Kconfig           |  11 ++
 drivers/phy/axiado/Makefile          |   1 +
 drivers/phy/axiado/phy-axiado-emmc.c | 217 +++++++++++++++++++++++++++++++++++
 5 files changed, 231 insertions(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 678dd0452f0aa0597773433f04d2a9ba77474d2a..b802274ea45a84bd36d7c0b7fb90e368a5c018b4 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -103,6 +103,7 @@ config PHY_NXP_PTN3222
 
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
+source "drivers/phy/axiado/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
 source "drivers/phy/cadence/Kconfig"
 source "drivers/phy/freescale/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index bfb27fb5a494283d7fd05dd670ebd1b12df8b1a1..f1b9e4a8673bcde3fdc0fdc06a3deddb5785ced1 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
 obj-y					+= allwinner/	\
 					   amlogic/	\
+					   axiado/	\
 					   broadcom/	\
 					   cadence/	\
 					   freescale/	\
diff --git a/drivers/phy/axiado/Kconfig b/drivers/phy/axiado/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..d159e0345345987c7f48dcd12d3237997735d2b5
--- /dev/null
+++ b/drivers/phy/axiado/Kconfig
@@ -0,0 +1,11 @@
+#
+# PHY drivers for Axiado platforms
+#
+
+config PHY_AX3000_EMMC
+	tristate "Axiado eMMC PHY driver"
+	depends on OF && (ARCH_AXIADO || COMPILE_TEST)
+	select GENERIC_PHY
+	help
+	  Enables this to support for the AX3000 EMMC PHY driver.
+	  If unsure, say N.
diff --git a/drivers/phy/axiado/Makefile b/drivers/phy/axiado/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..1e2b1ba016092eaffdbd7acbd9cdc8577d79b35c
--- /dev/null
+++ b/drivers/phy/axiado/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_PHY_AX3000_EMMC)		+= phy-axiado-emmc.o
diff --git a/drivers/phy/axiado/phy-axiado-emmc.c b/drivers/phy/axiado/phy-axiado-emmc.c
new file mode 100644
index 0000000000000000000000000000000000000000..e0e2174776ad027df0a10a8c4741b1b4ef9ef40e
--- /dev/null
+++ b/drivers/phy/axiado/phy-axiado-emmc.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Axiado eMMC PHY driver
+ *
+ * Copyright (C) 2017 Arasan Chip Systems Inc.
+ * Copyright (C) 2022-2026 Axiado Corporation (or its affiliates).
+ *
+ * Based on Arasan Driver (sdhci-pci-arasan.c)
+ * sdhci-pci-arasan.c - Driver for Arasan PCI Controller with integrated phy.
+ */
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+
+/* Arasan eMMC 5.1 - PHY configuration registers */
+#define CAP_REG_IN_S1_MSB		0x04
+#define PHY_CTRL_1			0x38
+#define PHY_CTRL_2			0x3c
+#define PHY_CTRL_3			0x40
+#define STATUS				0x50
+
+#define DLL_ENBL	BIT(26)
+#define RTRIM_EN	BIT(21)
+#define PDB_ENBL	BIT(23)
+#define RETB_ENBL	BIT(1)
+
+#define REN_STRB	BIT(27)
+#define REN_CMD_EN	GENMASK(20, 12)
+
+/* Pull-UP Enable on CMD Line */
+#define PU_CMD_EN	GENMASK(11, 3)
+
+/* Selection value for the optimum delay from 1-32 output tap lines */
+#define OTAP_DLY	0x02
+/* DLL charge pump current trim default [1000] */
+#define DLL_TRM_ICP	0x08
+/* Select the frequency range of DLL Operation */
+#define FRQ_SEL	0x01
+
+#define OTAP_SEL_MASK		GENMASK(10, 7)
+#define DLL_TRM_MASK		GENMASK(25, 22)
+#define DLL_FRQSEL_MASK		GENMASK(27, 25)
+
+#define OTAP_SEL(x)		(FIELD_PREP(OTAP_SEL_MASK, x) | OTAPDLY_EN)
+#define DLL_TRM(x)		(FIELD_PREP(DLL_TRM_MASK, x) | DLL_ENBL)
+#define DLL_FRQSEL(x)	FIELD_PREP(DLL_FRQSEL_MASK, x)
+
+#define OTAPDLY_EN	BIT(11)
+
+#define SEL_DLY_RXCLK	BIT(18)
+#define SEL_DLY_TXCLK	BIT(19)
+
+#define CALDONE_MASK	0x40
+#define DLL_RDY_MASK	0x1
+#define MAX_CLK_BUF0	BIT(20)
+#define MAX_CLK_BUF1	BIT(21)
+#define MAX_CLK_BUF2	BIT(22)
+
+#define CLK_MULTIPLIER	0xc008e
+#define POLL_TIMEOUT_MS	3000
+#define POLL_DELAY_US	100
+
+struct axiado_emmc_phy {
+	void __iomem *reg_base;
+	struct device *dev;
+};
+
+static int axiado_emmc_phy_init(struct phy *phy)
+{
+	struct axiado_emmc_phy *ax_phy = phy_get_drvdata(phy);
+	struct device *dev = ax_phy->dev;
+	u32 val;
+	int ret;
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_1);
+	writel(val | RETB_ENBL | RTRIM_EN, ax_phy->reg_base + PHY_CTRL_1);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | PDB_ENBL, ax_phy->reg_base + PHY_CTRL_3);
+
+	ret = readl_poll_timeout(ax_phy->reg_base + STATUS, val,
+				 val & CALDONE_MASK, POLL_DELAY_US,
+				 POLL_TIMEOUT_MS * 1000);
+	if (ret) {
+		dev_err(dev, "PHY calibration timeout\n");
+		return ret;
+	}
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_1);
+	writel(val | REN_CMD_EN | PU_CMD_EN, ax_phy->reg_base + PHY_CTRL_1);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_2);
+	writel(val | REN_STRB, ax_phy->reg_base + PHY_CTRL_2);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | MAX_CLK_BUF0 | MAX_CLK_BUF1 | MAX_CLK_BUF2,
+	       ax_phy->reg_base + PHY_CTRL_3);
+
+	writel(CLK_MULTIPLIER, ax_phy->reg_base + CAP_REG_IN_S1_MSB);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | SEL_DLY_RXCLK | SEL_DLY_TXCLK,
+	       ax_phy->reg_base + PHY_CTRL_3);
+
+	return 0;
+}
+
+static int axiado_emmc_phy_power_on(struct phy *phy)
+{
+	struct axiado_emmc_phy *ax_phy = phy_get_drvdata(phy);
+	struct device *dev = ax_phy->dev;
+	u32 val;
+	int ret;
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_1);
+	writel(val | RETB_ENBL, ax_phy->reg_base + PHY_CTRL_1);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | PDB_ENBL, ax_phy->reg_base + PHY_CTRL_3);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_2);
+	writel(val | OTAP_SEL(OTAP_DLY), ax_phy->reg_base + PHY_CTRL_2);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_1);
+	writel(val | DLL_TRM(DLL_TRM_ICP), ax_phy->reg_base + PHY_CTRL_1);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | DLL_FRQSEL(FRQ_SEL), ax_phy->reg_base + PHY_CTRL_3);
+
+	ret = read_poll_timeout(readl, val, val & DLL_RDY_MASK, POLL_DELAY_US,
+				POLL_TIMEOUT_MS * 1000, false,
+				ax_phy->reg_base + STATUS);
+	if (ret) {
+		dev_err(dev, "DLL ready timeout\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int axiado_emmc_phy_power_off(struct phy *phy)
+{
+	struct axiado_emmc_phy *ax_phy = phy_get_drvdata(phy);
+	u32 val;
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_1);
+	val &= ~(DLL_TRM_MASK | DLL_ENBL);
+	writel(val, ax_phy->reg_base + PHY_CTRL_1);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	val &= ~(DLL_FRQSEL_MASK | PDB_ENBL);
+	writel(val, ax_phy->reg_base + PHY_CTRL_3);
+
+	return 0;
+}
+
+static const struct phy_ops axiado_emmc_phy_ops = {
+	.init = axiado_emmc_phy_init,
+	.power_on = axiado_emmc_phy_power_on,
+	.power_off = axiado_emmc_phy_power_off,
+	.owner = THIS_MODULE,
+};
+
+static const struct of_device_id axiado_emmc_phy_of_match[] = {
+	{ .compatible = "axiado,ax3000-emmc-phy" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, axiado_emmc_phy_of_match);
+
+static int axiado_emmc_phy_probe(struct platform_device *pdev)
+{
+	struct axiado_emmc_phy *ax_phy;
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct phy *generic_phy;
+
+	if (!dev->of_node)
+		return -ENODEV;
+
+	ax_phy = devm_kzalloc(dev, sizeof(*ax_phy), GFP_KERNEL);
+	if (!ax_phy)
+		return -ENOMEM;
+
+	ax_phy->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ax_phy->reg_base))
+		return PTR_ERR(ax_phy->reg_base);
+
+	ax_phy->dev = dev;
+
+	generic_phy = devm_phy_create(dev, dev->of_node, &axiado_emmc_phy_ops);
+	if (IS_ERR(generic_phy))
+		return dev_err_probe(dev, PTR_ERR(generic_phy),
+				     "failed to create PHY\n");
+
+	phy_set_drvdata(generic_phy, ax_phy);
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static struct platform_driver axiado_emmc_phy_driver = {
+	.probe = axiado_emmc_phy_probe,
+	.driver = {
+		.name = "axiado-emmc-phy",
+		.of_match_table = axiado_emmc_phy_of_match,
+	},
+};
+module_platform_driver(axiado_emmc_phy_driver);
+
+MODULE_DESCRIPTION("AX3000 eMMC PHY Driver");
+MODULE_AUTHOR("Axiado Corporation");
+MODULE_LICENSE("GPL");

-- 
2.34.1



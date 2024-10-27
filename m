Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189DFD10C1B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 11:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KQYxqCNqjgBgoADfol0s8i3WZwblUUwlEvY2lkYP0+o=; b=Z7QTQtupgcvYeHuBbwlMIbthHs
	t8uwGUD6/I9vSy1n6D1EpFOUxrcPWbH9McE5d/xprJAp7igW5s/9O1XS/dXU9vFkpYXaaVNqSbUav
	E4ekXJkzHlqicqDVkSBRdi7lnXosqPadai0RkpFdk9aUrFe4kjxmjh9VwxayrmIE7yW9hYTiydExo
	2ComN5kSAbsR4J5v2Kk72RiBhW3UeRKpTbfovmrp5axEtLdh86VZaxp4PVEjVMQxUk81ICiZJXeO3
	Yp25c/T9cN/x+yRNwfN4zl8gvQDF3AYBdRIhhdguz2T3x16XoaGpMhXLMrr7D7cnuSfMSfmsB0ocF
	6kIbyVxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t51SG-000000087cC-0rmH;
	Sun, 27 Oct 2024 11:29:08 +0000
Received: from mail-vi1eur05on2062b.outbound.protection.outlook.com ([2a01:111:f403:2613::62b] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t51Qe-000000087Ip-1yC9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 11:27:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZgmHvJIsvrOrfWL88En+9dlxa0ia1/oZJzpaKKxmo/EMmTPw/0u66PvW1uPbutEXlNszmWFe6TVF7HJ3UZhoPJAx9Cy78Aic8e2T6tTfZP4kHLSfb98gas97Wc+V7qZwrXChXBlEiiVLZ8/2pxQeV77046FDC5P1yVQCShq8LP/rR8UFQu9+W56x/Gww05ApDi6tmTy24NYZOCtuB3wEeUmw9JQvxiVF/f2d6vRW7HnWf2a2ODjQLNW1Nr558y/gdf0qrYVLtQkKEi6PYAX+ie+JMzZKuk9m/BcykowU6Ol/WK22cd2RcHiDKu4yBRb0mThv6irA7+A/Vwx4RMobw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQYxqCNqjgBgoADfol0s8i3WZwblUUwlEvY2lkYP0+o=;
 b=S9Hbz8daV4rgfOzsVOuyT9qCmuITNx2eNFy5HzNONk71VVbMvRXBNr8tJifHfuKR7FEmqPO3qxwP/GYy1/sskT6biz+onwBfXG3L/16FjatnqjWTPZeKO80LKkUzd1rYrjBh90dJxi3IVo4UD/57s8hpT/qBZ76Upo4NP8bNYtDI+UffqXOkI38CVkj74UMM//ZHcto1VK47WMPc6fiXDkznV8rw/fA/T3+Lz7gf9e7zTkYZA8CsqDGYEx7bvCEq0uHOheQegjtTyum8wQJ9YoLBP4rgJDR0NEBuffhDw5wW7L2F2xvfvWNQpUbRLTAMIs2Tq8GJ+U954XmlCwNtvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQYxqCNqjgBgoADfol0s8i3WZwblUUwlEvY2lkYP0+o=;
 b=RJd+tBlr4Gxh9dmaYYA5oUTb6h5dXRHL02g43Cem5i/gNcbAhu9xHf8BzJSxKLIn/buMGaQur/2WYRqXUu5iveTP6ZNoCa/DzDF4gl9wrC78/K5B1RsCLsbwIStwsN1la/yCKAq20tLyw/Vld+ihy4wE2akyjJmCScZrRXy/mUOTKwPf6QYhsCKU0hG/mW7eOBmAciHJ2ueo4wwN3iIk4GKyZplobPzNaQYd4/fo4MQqHzzoje6bGcqCvYayaCjJZsycUHX9mXOkT6Zrit5N8GjwA/buuXaA2o8eBnmY5bKUm9pbQ+xU8/D3kjNZ3O1krvL+xa4zXayn/YfjWIF2hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9644.eurprd04.prod.outlook.com (2603:10a6:102:242::11)
 by AM9PR04MB8470.eurprd04.prod.outlook.com (2603:10a6:20b:415::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Sun, 27 Oct
 2024 11:27:16 +0000
Received: from PAXPR04MB9644.eurprd04.prod.outlook.com
 ([fe80::6979:311a:bf0c:1a49]) by PAXPR04MB9644.eurprd04.prod.outlook.com
 ([fe80::6979:311a:bf0c:1a49%5]) with mapi id 15.20.8093.021; Sun, 27 Oct 2024
 11:27:16 +0000
From: alice.guo@oss.nxp.com
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"alice.guo" <alice.guo@nxp.com>
Subject: [PATCH v1] soc: imx: Add SoC device register for i.MX9
Date: Sun, 27 Oct 2024 19:25:57 +0800
Message-Id: <20241027112557.3866257-1-alice.guo@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:3:17::33) To PAXPR04MB9644.eurprd04.prod.outlook.com
 (2603:10a6:102:242::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9644:EE_|AM9PR04MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 13d40c47-cf74-4857-349e-08dcf67a4f6e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v8oy6HP4bF6C6aUeqk25ICTuCwk9VRB9zjVv2j2OAxJIqteA5INSWDB01YdC?=
 =?us-ascii?Q?fDT43AN84Sr6JEPhpinAzLffSpY1YfVLCMlFlqe2KsYbeo1E2XsDFGYbFlaS?=
 =?us-ascii?Q?LT2eRRP3vUKZyy6tvHZFnnV0Pz+9U6Fsza3MK8vnLbdDohKvK7Cg1DVAYI0j?=
 =?us-ascii?Q?NxOMmStzgW+wl3TiIq0RNOjaIbBl4QW52ywXRoTmuyAe7rkvc5TON+MjwUBf?=
 =?us-ascii?Q?Ay1cEcni6OCxovLYjRiFyX7OewQsmIi3YQdj+7eqvG/jysjhFcSKSTeTXPOY?=
 =?us-ascii?Q?oNtJ37llcHpw2MMMpmfacENrS6ngvHteBTiWAYdPgwF1AhQhaRahMYzLTDTx?=
 =?us-ascii?Q?/u6Jf8YtUW0ISs1kI9GKM/ku4kPq+BLTgglQiyhp3VC4Q0pm49jMnGi6K2t3?=
 =?us-ascii?Q?fe0Bsms4iKGKcXobwN5VdQa70mIgXt6EOGd5xgqf8PIWs1Bu+tjlOzoqkxrK?=
 =?us-ascii?Q?sefQFvCkZkFA+QvhKETHybNaeeadqOcjtmmM7x6IVbJdhmRolgYXQ8g9vbc7?=
 =?us-ascii?Q?DT2LijA9krFTc/G7tdEXSLUeelYICj+TMDqixQW6HjJEQSkRgPaGMBG/79UA?=
 =?us-ascii?Q?VHozTEfLYdxO/2xdd4iELbsVEdqQmRLxhZu02YuWuWhX46Y7N0hlaC8HyZX/?=
 =?us-ascii?Q?YlqrLHidIPltFWYVWaTOg3El/Pq11zsE/vht7FDJnxKAtfgiRFpDbEJlzI7I?=
 =?us-ascii?Q?yrUxDyXb+1gGZQaQNMrvkIM2w6QypYyZJGTJ+0PBfE1F/3ZX5immVCWu+bXe?=
 =?us-ascii?Q?kcKbxiHwMGvLYGy/kCr/eaQ7+wGMiMbpmmypUNkiCi46bfeKLTFp1d1I8S/r?=
 =?us-ascii?Q?+VELV0phQhIzAaJIDJXb8/76Aukp11KwQxJRIhgLdHFLP/Ux/UHLRYewX2JQ?=
 =?us-ascii?Q?ReChDk4FJlq98lEmRw1fqhNn+LCig+0K2Z2X+Dw7VB94fhEI9wYmLpvfdAek?=
 =?us-ascii?Q?LXbuKNEuSXcCNn+nr3668einYM4F0nyiziVjJgG+N8uvnUDMzcAY6BL3wkbm?=
 =?us-ascii?Q?J1CLAl/C7ck/NeBAwxPE6z4EPDLArNh92YGyUz+xW1PI9iMab406widYq5Q7?=
 =?us-ascii?Q?0F0H0wLKJY4MmR9CmQUYcEILUaILXZ+F0iydfoF1/duhEn1lnoksFhhXoioZ?=
 =?us-ascii?Q?A59Vlce2I+QCm3mtEetTFc7kla2u0YB4+CokszpLq5la/XENjBnm89/M693R?=
 =?us-ascii?Q?XkgUtzh3XzsiWI/mCyjaQLlliZGM5OpfIwa4Z6Nb1RcOeFI26BxbHImAepzR?=
 =?us-ascii?Q?b5Q+2Oi2hC/jJjFhZBU7PsLN7eeGIKjEF5KzhOtH/oW83ECEj242PQdq7VBg?=
 =?us-ascii?Q?KRHu1/l9+7BjRRvENSo2y1NlC7we+Se8H9o0VI3HuE1EIkz8CaKCTXv1Bf9F?=
 =?us-ascii?Q?kqFZuDs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LuMivvl7zcBY9dHzu5c7LfkwXgRnfEyZ9cZw0KLRY6dt6HtE4SswqD/iZVgH?=
 =?us-ascii?Q?Isw2ou8ZnCpMHzpmFDYizcVmxqPnsqH4Vr6ofsSAKXwU+CfBCmaeSm8i7FJK?=
 =?us-ascii?Q?LEaZPotU59GTwspnbZ5tKfTDCsFpgavL74GfNjdEgF8oDtmE04uWVfmP2WsJ?=
 =?us-ascii?Q?t6R6ODp2SqLd6c04jHWQtDBjf1kWRyD4flMfIQde4StgSSwX1boRBJ7wF4Fj?=
 =?us-ascii?Q?DL+cFIjb9bKZqLK1GyO57hyjcqFruDdreQp3d8VTPCg6k17bFcVLdF8aZ2zG?=
 =?us-ascii?Q?O67CpgwYAHRdDX+qFzAUvP4wcCUfeIrTwZH2kbDW5hTiRWJaLONoRTzkiWG2?=
 =?us-ascii?Q?0kwAH+K0h6di60oo58KfqpieQNtIj40LBPnlRxfNuNds6b4jDfLzfb8r3oZN?=
 =?us-ascii?Q?ziTmoD1PZBPMIPoh2gUEcjqzQkjXvh63O1UlDgTYkFWbcJtdMk5bt6RC2CpL?=
 =?us-ascii?Q?o23GWtl7bgdikWm40uyXFt1v0POcLu/ZEVJVy8n4QQ4LPdkX+WkrBp8rmOBM?=
 =?us-ascii?Q?lZeVddHiJFprV1YkepM1/yMDwfV8/L/RL3PCoEThRHcM7JQ4riFeDVMXsC5q?=
 =?us-ascii?Q?JQdah0mVFoapGHuSV38RdgsqtI0csLlOtbo4a8Jnm7YqNYk8jCcHjM0YkyEn?=
 =?us-ascii?Q?2x+QGkSOrPQwt/c4kHUKluVTd5omuAOKx7BNPhq3r+o48mNrXOt6Adb2uNLn?=
 =?us-ascii?Q?zUzS+l+dE/ea/JRQLODgnH/xeNHtLmPV105gXvavW9grJkEV84zeyS+brJlI?=
 =?us-ascii?Q?OFP7fGq6qJQXdTj3hH6tjgo/qKdnHnk5jtyCTSkREu1tPhZwkYHvIJ/XTM5w?=
 =?us-ascii?Q?UM6MLwDHQPWhLJyN+XloMODaMa9d+xGEIlWqVIRtvAdOFj4Brp8s9ArcXdan?=
 =?us-ascii?Q?752Y6/p1l0w+7FgDJx4MCo/WiZePQxdeu7O4SSkZLg1c9sRLxJZj2ZOpuhej?=
 =?us-ascii?Q?vhI3liq96YsF+tH5o13aCLYWqQxseBDz+Jb3hphFNcba9ryZ90z9yxiQ4F/x?=
 =?us-ascii?Q?wnFm+oh6wH4JlrvrPTqaue+bL+ZXi5klz1W9aApg1YOn4aZ9QoOEZJI9Ct9D?=
 =?us-ascii?Q?PLhF4tuBm3yvbxaBybVhUX+irdEvIrI4QWJZy1DhY2SHHK6rthlukfZJqu8f?=
 =?us-ascii?Q?Mk0riLo9EPrl/WnY2EncL9kDZGgzMvZhhiuoPCldNYbGx7s5uPfyyL+aMfMF?=
 =?us-ascii?Q?6MvNTPj+DyjK6WMaMdV/ci8k8f0nm+x7o/DnktLcWtnzPVUt5qCcFGcBrAhm?=
 =?us-ascii?Q?wlHnGYFpddCSQ9FBx1Co3QRFvqXFLi14ztYtM+YWKBaWdeS6aUCOe7oMUwei?=
 =?us-ascii?Q?oMnpYsZlJaOSuy4okWhysID9gcfmNhab2kbzWVYNzmh9LEUWhWsCYO72/74s?=
 =?us-ascii?Q?LPQ7v0dyjh0eqOM8251anViXLJvSoWVxuqwhyfjJJnCX+jC1jFGZOjMn1xBd?=
 =?us-ascii?Q?/fCWxLX0qympHf4S97ff4YFyUydiIP1QQrVQJPsJwxhXMgLeIOdMIiAb3b2x?=
 =?us-ascii?Q?lmQPR1Q9uem1ppqYG/AyJJBYpvn73bv7qFSc8NGjvCXTZWcirBuCRbZiy/y9?=
 =?us-ascii?Q?r6veTC+s1aw2Cfq2gXocJO14KSBx6VHiKadWovp+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13d40c47-cf74-4857-349e-08dcf67a4f6e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9644.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2024 11:27:16.1514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AiGo5F7pru/F3oIVF2LIwCJ5gyB9RQ7kDIMY8eHu2s2rRTFgg+4XUS0oipidKbBLJfRdDXsMkZd44w6n4j527Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8470
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_042728_555178_AB4E2C95 
X-CRM114-Status: GOOD (  16.11  )
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

From: "alice.guo" <alice.guo@nxp.com>

i.MX9 SoCs have SoC ID, SoC revision number and chip unique identifier
which are provided by the corresponding ARM trusted firmware API. This
patch intends to use SMC call to obtain these information and then
register i.MX9 SoC as a device.

Signed-off-by: alice.guo <alice.guo@nxp.com>
---
 drivers/soc/imx/Makefile   |   2 +-
 drivers/soc/imx/soc-imx9.c | 102 +++++++++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/imx/soc-imx9.c

diff --git a/drivers/soc/imx/Makefile b/drivers/soc/imx/Makefile
index 3ad321ca608a..ca6a5fa1618f 100644
--- a/drivers/soc/imx/Makefile
+++ b/drivers/soc/imx/Makefile
@@ -3,4 +3,4 @@ ifeq ($(CONFIG_ARM),y)
 obj-$(CONFIG_ARCH_MXC) += soc-imx.o
 endif
 obj-$(CONFIG_SOC_IMX8M) += soc-imx8m.o
-obj-$(CONFIG_SOC_IMX9) += imx93-src.o
+obj-$(CONFIG_SOC_IMX9) += imx93-src.o soc-imx9.o
diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
new file mode 100644
index 000000000000..7e8a8b2efa61
--- /dev/null
+++ b/drivers/soc/imx/soc-imx9.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/sys_soc.h>
+
+#define IMX_SIP_GET_SOC_INFO	0xc2000006
+#define SOC_ID(x)		(((x) & 0xFFFF) >> 8)
+#define SOC_REV_MAJOR(x)	((((x) >> 28) & 0xF) - 0x9)
+#define SOC_REV_MINOR(x)	(((x) >> 24) & 0xF)
+
+static int imx9_soc_device_register(void)
+{
+	struct soc_device_attribute *attr;
+	struct arm_smccc_res res;
+	struct soc_device *sdev;
+	u32 soc_id, rev_major, rev_minor;
+	u64 uid127_64, uid63_0;
+	int err;
+
+	attr = kzalloc(sizeof(*attr), GFP_KERNEL);
+	if (!attr)
+		return -ENOMEM;
+
+	err = of_property_read_string(of_root, "model", &attr->machine);
+	if (err) {
+		err = -EINVAL;
+		goto attr;
+	}
+
+	attr->family = kasprintf(GFP_KERNEL, "Freescale i.MX");
+
+	/*
+	 * Retrieve the soc id, rev & uid info:
+	 * res.a1[31:16]: soc revision;
+	 * res.a1[15:0]: soc id;
+	 * res.a2: uid[127:64];
+	 * res.a3: uid[63:0];
+	 */
+	arm_smccc_smc(IMX_SIP_GET_SOC_INFO, 0, 0, 0, 0, 0, 0, 0, &res);
+	if (res.a0 != SMCCC_RET_SUCCESS) {
+		err = -EINVAL;
+		goto family;
+	}
+
+	soc_id = SOC_ID(res.a1);
+	rev_major = SOC_REV_MAJOR(res.a1);
+	rev_minor = SOC_REV_MINOR(res.a1);
+
+	attr->soc_id = kasprintf(GFP_KERNEL, "i.MX%2x", soc_id);
+	attr->revision = kasprintf(GFP_KERNEL, "%d.%d", rev_major, rev_minor);
+
+	uid127_64 = res.a2;
+	uid63_0 = res.a3;
+	attr->serial_number = kasprintf(GFP_KERNEL, "%016llx%016llx", uid127_64, uid63_0);
+
+	sdev = soc_device_register(attr);
+	if (IS_ERR(sdev)) {
+		err = -ENODEV;
+		goto soc_id;
+	}
+
+	return 0;
+
+soc_id:
+	kfree(attr->soc_id);
+	kfree(attr->serial_number);
+	kfree(attr->revision);
+family:
+	kfree(attr->family);
+attr:
+	kfree(attr);
+	return err;
+}
+
+static int __init imx9_soc_init(void)
+{
+	int ret = 0;
+
+	if (of_machine_is_compatible("fsl,imx91") ||
+		of_machine_is_compatible("fsl,imx93") ||
+		of_machine_is_compatible("fsl,imx95")) {
+		ret = imx9_soc_device_register();
+		if (ret) {
+			pr_err("%s: imx9_soc_device_register returned %d\n", __func__, ret);
+			return ret;
+		}
+	}
+
+	return ret;
+}
+device_initcall(imx9_soc_init);
+
+MODULE_AUTHOR("NXP");
+MODULE_DESCRIPTION("NXP i.MX9 SoC");
+MODULE_LICENSE("GPL");
-- 
2.34.1



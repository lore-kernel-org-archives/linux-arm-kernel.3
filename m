Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87BBC5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 09:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNx6eBfl0N811jz1IxmswtYitC8wLJOihiiuJw78rK4=; b=1NDD3/XMZlrpL7l9fE/ct8Ap4N
	42GbeAVW8IzfdkYqXz+9pQSlsdhzolT3/4WExUjwdWAjjGGzy0FEr1h67ftQ+HfnBVh6K4MQ7yGnx
	agm5ms4OvQimS0bPvDoKf2XICVZCUIqTi2vsFM1JbBIIK4xjFGVaKTMT/TO1WxiiUJdqYp6nFhp8+
	2hwhExYYPM6F56+qyRBK5eyBwUZeLkPAaaRRLqNbBDwutSxVKuZe9MjZHb2GEfyoQ8C0Mjm8wxomP
	7U/dQFFSHLaXXumaCu2D2fSd7pWJnMPZWfXjrD7VFpCTP9rJs0jxEmflcFhQ9IpzDe7A9YqSRfAH4
	89Af2xrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcGQ-00000009Ndv-3aJp;
	Wed, 19 Aug 2026 09:07:14 +0000
Received: from mail-northeuropeazon11010070.outbound.protection.outlook.com ([52.101.84.70] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcGL-00000009Nb0-3goo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 09:07:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fkaGXby20Yh9UMxhaztmTi7WMjHtAzS6eDBssqalIbXgnPb8Frc0veN3ocxLzwDClV7YF96DiMX3xWMfdPSVyci78T+Je/yUDuQukCKlEc4RCG9Gyd+qRS3zl6wlDXR7oBBKkPw9biwVn/i+MjFDn3g/23AFyHD/T7zcfwxtjuyIXGgN1ZoJwiHz0znFDqk+VSUls5LvKBos21whxG6STI33TTwBu/JZcdjNG94uZKESxrwFLQ0+o5NTpJNN9LQgWDJTSlASfMufLXD2leYgg0VUjyQdXibmW8/JS9GkYN0yGhqheM1v5OnZoIK679AC6T1uIRAPfzInKAP47tlXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNx6eBfl0N811jz1IxmswtYitC8wLJOihiiuJw78rK4=;
 b=LCNiDASlUtVp5d4kow9l90qX1l06AXIrNKVHe5L/mCj0d/LZdDdTRukRsdm4zkX9Niyoizb9WqkvsXtUgL7XlehZi7ldYkQtGpr/ph5T82Tjb84I4ZkkhDQ1foocwLFhMNsTNLbon2w60w7i/JMQfwWR+D0uzdEbRSyTatz3vw7jKkMCAbsLLeAYtlCqAKn1wBtR9u+Xc92C8eE14Fyq6s4TW2ZelhPluRPZFa+eGI4MAr7XXAedoW1tsM7DR4VrRMB77s7VXm9fGJIOLbbjSE0A9K8WFUWt92w1JiKD1JepNrBcxvekC3Yb1Zy6yuJ3oxJZkAJCxYykQfmjLdiucQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNx6eBfl0N811jz1IxmswtYitC8wLJOihiiuJw78rK4=;
 b=sNzuUAAVObpUSWlHPyNw2ySZlued31e1QRrhUbCA+Z+C4d7qtdta6QTfQ7NKAN+WqCcqq6Xk5HmqCY03zEu5w7UasjnkxBzOPsQ/N9R6FYioJDpRucxpQAM07QIygzJ+/eFv9oiewCdAjVRNgKrBFGvm/wCu+c1iqlWWDq5ta2Ld/fr3A1o1XkJDSt4xWf7QEeqW/d1L5XjNFqE+o2t5Jq5Al1vVOueRPRyzniW6cgpuawLHvQuBpjgZpKenOjL6/NUnCVoqMBvNjgB0ATE51uJOM56pNfIsu6aRKYPE1e7F3T0gkkVtrLdED5mwNImnfM0+Kcgvm1kfH56qgIOI3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by DB8PR04MB7146.eurprd04.prod.outlook.com (2603:10a6:10:127::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 09:07:06 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 09:07:06 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 5/5] irqchip/imx-irqsteer: Allow building as module
Date: Wed, 19 Aug 2026 18:05:43 +0900
Message-Id: <20260819090543.585131-6-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0089.apcprd01.prod.exchangelabs.com
 (2603:1096:990:55::20) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|DB8PR04MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b9ff18e-30d8-4a86-b531-08defdd13db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|19092799006|376014|10067099003|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: ehkOPF77snXBqRwdAfHN2L2HZppjeUQ3lSKktQeNxlmJlYtQfSumyuhAsHSluBzJFShPG5iPv0LD5WyrmiYUoNrB+2uElKQNTdoUr//Pp95XL73jldePOnXGneBXgBI927V3UAnoIoTX9xM9BnclWcMKKsi4gxIS2VppDddwRBn0wrrq+bZe02YX3V5/Je6rn9rw1f51eO2Dm0LcaIyEjM6EW0NLADigNC9eSTAjqqo/BJoJo0RPXIQg9KnbGDn0MzS+bq4CpWeJWfUP++qBLUtQNMixkTt0whYp0jlc5boeOYjyK2rUCfSet9w5RWTSFn8M/TFCJapggMWsCjsbQR131VFlEpZOmGfcstRRgjW8zveHCL/udw4JuLCUiAmULbOQ4XO67RdhfPlBBJjrsNFMZtQYlm00r3MRU+T2EUqCF/jXRJX179NVg7jHo4CdgPnOWdzOL5yZxIy2Dv+vySaoLDQxUBFd0NS1r8+LLZOIFkKq6P0+1sovYnXrbTM2bMSH1yCCxk2CPMH5rrq1RrnIEcWrOUjSvKLvdZyuzfbWCLaVI8J0NYHdnJ4lmsy43k3z1b/LMdtDZCK7HEYx3n5IUXW8Ck9BAw+IvrrAzkiUPWAV8Z3jzJsLjsprJsYWcizBT4fmkKFxLDraR4h8gEssqSUSWzgYgIDhwpopdnQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(19092799006)(376014)(10067099003)(56012099006)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JBmuU5k+qGxNtW5/oYYUCH2nmXuRyFNdJ50Xe3lPiXjr5uh3R8Goa+2/7CZg?=
 =?us-ascii?Q?vl/4YoFrdbVxma8zTr2VGQAooZyQkVNkWAcTvqPE2f+QehEFMS4SHJuhC0Xg?=
 =?us-ascii?Q?BNPxgRtwfcyvSMvL0W69r5p420f2+mGUy459o2Z7K6mgm39B1hrf9XTRU1vU?=
 =?us-ascii?Q?v65iNz7w3ESZ5OeF5tQNviM2IaajiAxR9V0PC2ds58rdoTm5nhVuGIHb9csn?=
 =?us-ascii?Q?Z+oMVTldIz4UvaprCi3FADrWoDOLhhF4KkqOmzeMSMRJJVXpV0LvY1vv8mRD?=
 =?us-ascii?Q?uqvLlsOUUNHkvSLhVbOAW73Y8k3w9ldCKhVmc95DOEI85fSwJOLZnae41nGR?=
 =?us-ascii?Q?Kf5iPjc58z4J9uchd8jA19BjdoiCMA6koVRf+sN6a9HCS9poceOrr4cP3m0F?=
 =?us-ascii?Q?QtgdgnxSEbfFTKEuqZvbG36+EOT8CAL2PkH+HZbIeacKf8z2YCjV1LjjWyYs?=
 =?us-ascii?Q?STbckagSGYO421TdDvUjxasOvAvVVnN3IPpeoGSsEOJh3+bVr3kZJMGFxTXX?=
 =?us-ascii?Q?Odrd5k54vtWO/TXTI/yr0NiZLfXXbCcNCkrEd7aCacOuADmcRmULlo9wrT2P?=
 =?us-ascii?Q?6e18p4cBRlVcaY4eIwwAZBDbUNo3MHxQ25T3h7Spwz/+3pDl63l/Qvndvcs9?=
 =?us-ascii?Q?gb73YcAdDr8bfDAQkvdaDZB19aLBCvM/GMVW0TFUPsjC5Am98Iqq1pQp7xLw?=
 =?us-ascii?Q?DA49ACazHDq3D/rhAD/MkSNTM/3PZzcotGRo2eCrSjfWK3chAZRCKPxnGn4L?=
 =?us-ascii?Q?yr3vr3EPe9OosVPZun2CUzk3M5dRYw+roEIM5oS9/IraU33BFWhDhWejDbWv?=
 =?us-ascii?Q?cCu2yiVLKCPxDwKeB2Sy/R9AMqdj3QCrDVm0ejQRl4JUaxKEIulW+3Jp4qUY?=
 =?us-ascii?Q?+ZR/Xt3OKlSMig1Ul0EUs/C7MFQLzKuskYxkMeBK2hJ7iH4RKEYFAJ0dDIaM?=
 =?us-ascii?Q?oh/zFyER26psNgEwPyesz3gWUxF+dc+voQ5Ok2TXtZxfy4qYBnA/BDccwXbn?=
 =?us-ascii?Q?xLSsC77c8bqplUtOz48Q2BiVuKuo196cETvaun539IyhelAyYUurMuAzcLei?=
 =?us-ascii?Q?whquLrCE3EXs3/HTpH6Wn6IYaDXv7xAVqFTPN8RLGRZQp7M77L32H7u1LcUj?=
 =?us-ascii?Q?sxzmfv2962vRGdcdaNVlAJMZUQB+YfXkkNk9eQhF2lzjNIZZnd76EZH9Qhuf?=
 =?us-ascii?Q?ZVJ2yZcgrJerx24cv5FIErlCNBhqa5YbvjIVb6oM6K1PFdTTM/8UWNIBZeRA?=
 =?us-ascii?Q?54af2ilue85RwZHlQf7RGttlND5iFBpjnYGjzNjk5bKi+4vSgMZ5nCQR+FBj?=
 =?us-ascii?Q?cS+jqezcwB1VfQ27nsVGgBNsqLr3EPT8tPeKgtQzq+Nwyf057Osnx+OA+uJi?=
 =?us-ascii?Q?4iNtRbytp81uY+7aNgrOpMK750totFovgqo4tqNKA2+92v0j0Z6zq7ezpmFw?=
 =?us-ascii?Q?Kiw0LPIxDh8nPb7C358Og+AqsIsEPUnr5MDnIHS6vuc0aNaWeziN8VvN8euK?=
 =?us-ascii?Q?B2hdGyKeW4dQWODT1naC5IFPVeVdSjyuO16gqqUMR3NAR2JG9GvQ5N1Dzsap?=
 =?us-ascii?Q?MHXH4UdbYRH0Bs6+AhEH32DeNDoYT7eBYZ/eWVE21/Te7+s8vRHWmv2VWUg1?=
 =?us-ascii?Q?EJY8Rrr1AEmO4NL/mSmJgEOHLJzDpR4K7sk0w2Q7nU0Vm0/oasUzC46BSLU1?=
 =?us-ascii?Q?YZVildCWh5FRmiQxBsIeUVDoQ3OGxUGJZXP1Cl+b/K5ZG1Fb/l7nIUALjC7s?=
 =?us-ascii?Q?68RYin2k6gqWIsc3Ir0Q5lMFPhFwwfs3LAAD3M5JIWRa6eDlFNtO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9ff18e-30d8-4a86-b531-08defdd13db7
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 09:07:05.9639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qjWGXoL9dsCG6m1epfAK/EbYB2n6W1zdPaukDWUMU131/Ryq+g01tq4pFMpOC2BbBpWHdAYSjS3gpkixy3HPohKsKiVCaP2fbAUq8Az4yflDWyCTPul2etf6pdVj6G0M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_020709_929179_A922A5E2 
X-CRM114-Status: GOOD (  22.69  )
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

From: Jindong Yue <jindong.yue@nxp.com>

Make the driver buildable as a module by turning the Kconfig symbol into
a tristate and using module_platform_driver() instead of
builtin_platform_driver().

Now that the driver can be unloaded and reloaded, let the driver core
own the clock and runtime PM lifetime so that the probe() error path and
remove() do not have to hand-balance them:

 - acquire the clock with devm_clk_get_enabled() instead of a bare
   devm_clk_get() followed by a manual clk_prepare_enable(), so it is
   prepared/enabled for the device lifetime and released on unbind;
 - keep only clk_enable()/clk_disable() in the runtime PM callbacks,
   since prepare/unprepare is now handled once by devres;
 - enable runtime PM with devm_pm_runtime_set_active_enabled(), which
   marks the device active (matching the enabled clock) and disables
   runtime PM on unbind.

With the clock, runtime PM and IRQ domain all owned by devres, remove()
and the probe() error path only have to dispose of the parent IRQ
mappings.

Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/irqchip/Kconfig            |  2 +-
 drivers/irqchip/irq-imx-irqsteer.c | 36 +++++++++++++++++-------------
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..105108d2e6ff 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -555,7 +555,7 @@ config CSKY_APB_INTC
 	  the controller's register.
 
 config IMX_IRQSTEER
-	bool "i.MX IRQSTEER support"
+	tristate "i.MX IRQSTEER support"
 	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
 	default y if ARCH_MXC || ARCH_S32
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index a9909ecb6fef..a60cc527e619 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -10,6 +10,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
@@ -193,7 +194,7 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 		return PTR_ERR(data->regs);
 	}
 
-	data->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
+	data->ipg_clk = devm_clk_get_enabled(&pdev->dev, "ipg");
 	if (IS_ERR(data->ipg_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(data->ipg_clk),
 				     "failed to get ipg clk\n");
@@ -226,12 +227,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 			return -ENOMEM;
 	}
 
-	ret = clk_prepare_enable(data->ipg_clk);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to enable ipg clk: %d\n", ret);
-		return ret;
-	}
-
 	/* steer all IRQs into configured channel */
 	if (irqsteer_has_chanctrl(data->devtype_data))
 		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
@@ -271,12 +266,21 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
+	if (ret)
+		goto err_irq;
 
 	return 0;
+
+err_irq:
+	for (i = 0; i < data->irq_count; i++) {
+		if (!data->irq[i])
+			break;
+
+		irq_set_chained_handler_and_data(data->irq[i], NULL, NULL);
+		irq_dispose_mapping(data->irq[i]);
+	}
 out:
-	clk_disable_unprepare(data->ipg_clk);
 	return ret;
 }
 
@@ -293,8 +297,6 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 						 NULL, NULL);
 		irq_dispose_mapping(irqsteer_data->irq[i]);
 	}
-
-	clk_disable_unprepare(irqsteer_data->ipg_clk);
 }
 
 #ifdef CONFIG_PM
@@ -324,7 +326,7 @@ static int imx_irqsteer_suspend(struct device *dev)
 	struct irqsteer_data *irqsteer_data = dev_get_drvdata(dev);
 
 	imx_irqsteer_save_regs(irqsteer_data);
-	clk_disable_unprepare(irqsteer_data->ipg_clk);
+	clk_disable(irqsteer_data->ipg_clk);
 
 	return 0;
 }
@@ -334,7 +336,7 @@ static int imx_irqsteer_resume(struct device *dev)
 	struct irqsteer_data *irqsteer_data = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(irqsteer_data->ipg_clk);
+	ret = clk_enable(irqsteer_data->ipg_clk);
 	if (ret) {
 		dev_err(dev, "failed to enable ipg clk: %d\n", ret);
 		return ret;
@@ -357,6 +359,7 @@ static const struct of_device_id imx_irqsteer_dt_ids[] = {
 	{ .compatible = "nxp,s32n79-irqsteer",	.data = &s32n79_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, imx_irqsteer_dt_ids);
 
 static struct platform_driver imx_irqsteer_driver = {
 	.driver = {
@@ -367,4 +370,7 @@ static struct platform_driver imx_irqsteer_driver = {
 	.probe		= imx_irqsteer_probe,
 	.remove		= imx_irqsteer_remove,
 };
-builtin_platform_driver(imx_irqsteer_driver);
+module_platform_driver(imx_irqsteer_driver);
+
+MODULE_DESCRIPTION("i.MX IRQSTEER interrupt multiplexer/remapper driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1



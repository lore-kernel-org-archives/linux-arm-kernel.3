Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC8CC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/O7+fpY2TJCqu6tyXgKbZuI2Wj/vyfkMQHjHKcLOGs=; b=sLW7BqdKW8g0E4JxHNJ5XavxDg
	6T+HJXN1KXgdMvijRa3fPUOu43PbrOOx+5nIHwixk4tQseaRPvBpx1ExVeJTpP1AVy1b4fpl6+iOi
	2hpoEmnbQhLie6mhcGx0NjdX+qt/6BAAE9ACqJUK0rPMLZMNXg2PWnoIcJG9r3CrWiGbKb6GkGg/K
	aIXhMV72ZrMnAoBMZJ2mtQqD9RNT1aYF+boeB72nkLVlP6Aw56JmkW4oXYsfcCeuNbRwSaBUoncum
	6fbdrDfaPjHp6XAF/4v9dFmSAhVlNKFQx/1v0CNhCQBaE0SuCUh6saPKe9/C82kzJucHqPcCsezVJ
	euxoAV6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMEA-0000000D3JF-3awG;
	Fri, 21 Aug 2026 10:11:58 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxME7-0000000D3G7-43UJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 10:11:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j72tKn+6mGgtv4AWE16lOlz69dX31m/wQt4simFh/ONU7LK59opFncJo/rugryFDgiG+J5Y5jeVaDHPO6KpCgZ7/uUGvB1STeN01FzRQE/gwCOHUf2fpyju+SjAdyPM28MBlEaar5/sQYAhmj8TwqkwwJbOr8TJoDj0a+7sDPSiMiOFIxOmivwvloOsqhLqDeRLfBzv3z48Q99fLFw4QJFEs2ADbs0lJmHyduPAOn3Ay7q4GfqMzjDCuewDoiGaomGend1bzcXLenAqOa0fissogf4U1gLfi2tWGJLnKWc1h9lYbGxYCGQcY0rUf6tHacs8m2uX24P7Ndg64eXa+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/O7+fpY2TJCqu6tyXgKbZuI2Wj/vyfkMQHjHKcLOGs=;
 b=H5wQDQD+sZtH71rshakoFg9QyfWSPdFDs7sigOkB7lBa2KXy2BWbdNWCaUQMvcIQ3Z8Hfhk1lpELbBb6f99KINOViqSoO4k0KwW521K3EILdXvwiTz2Zvy256n5RsefmTtQaC5jHH1B1zNY2kztbSkhUM35HPOj94Qt1smKXdSO8xuzAr7JE00Kc5ChHwsr/dFZZAViaRTO/ndDbockGpfURgkmN6Gq4itXELhOBu0zEsBT3XVc65e+lpZUZI6itU3XWCOlJNQ59z44GNbXrg0JViZVxJ6GO4ehBqbaQSq5CzUelngRT4J5OgsOvZAfVUln/quYPE54sz+QLxrD1UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/O7+fpY2TJCqu6tyXgKbZuI2Wj/vyfkMQHjHKcLOGs=;
 b=jQyCHjU1XYxcJ9T9k2ov0g3PJ1yK1NLVNpfne14rwdR6kN+vbUIs7qRexMlOWQG7X7Ll8yILa9oVkDcLSbpXVAiCDGBuCNj78LAS8+JPWQFVtPnbOD0Eqxj8PvcdAhxzdTG5uPYXDh+PMnVIa3iqjjof6rJSumoEdYD9vWNrW+qNvUjtsOjLevjy8hAw0sr+uWWX/Dna15kEfzFcbXx155fEiWhgSq5cXVh9dAiQcrmx/2GcvOb3gQ4PmTDKLH9HilTQSav/kZ2AIAmksBz44UIq1mga8sFzVtYEXqPBbDdr0yhuA7tuA1PytQl5QOR13D1ZyG4SeurEO34iMUv4AA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by AM8PR04MB7971.eurprd04.prod.outlook.com (2603:10a6:20b:234::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 10:11:52 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 10:11:52 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 7/9] irqchip/imx-irqsteer: Allow building as module
Date: Fri, 21 Aug 2026 19:10:37 +0900
Message-Id: <20260821101039.4037925-8-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|AM8PR04MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b4b9b6-f950-482e-2c74-08deff6c9eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: +I8dGOsswNbrNiUqY3WtMFXFPCkm7/BZ0thk+UAjlr+0CjOFhtQzM4wd5xrJ/Wb2JQjkPxeIGwPsDQLhjvpksVWKKET2Wo7b/rMBiy1ifdblPd7fCXEs0jCe23RuhZ5lBvsqbZMEfwoWum1TEWbAgX7PWGoPUX6T3qe9AZlzlbGb5P/p1y8kevMQLi78NrBC2ZJAUhH2VX24+4a4iuJ+GUDXtLA1LvdoRMLCyyorItRg/Fw+km0i0ymqVdx862OcH+80rALxrPNEA+eM3pKRSi5EqnlexMhGFx7Eqagx/Ov54ZIPku3s4nM588GKPYqDr5HzBXDcnyHyqCE9ysldsovWHd3UTXMWXJlvi3rfvhGfkMeAzZnlrfRonFkWFfTkDYrVoNfVc9fpZRiCVz2Vmy99qA2ArKjIgVZhCBl+1naVagxrY5Mg+QtrbH8ccIa/xuWN5hlHDGGCH7w1t2HtAdAuQ9DbOCOfViDCgqLrNQgKvvZ/eUcpQeA8YzHtZ6IUp9zAolSduIjDrQ/nJaIFWfQYJqoP9BUESqt+FeReszTjqhxUKptLL0cAZXlEB9efrMsCkaqEeWJupc30cfikOz3vANX8GjMK10DzWr/jEcPRBmpt2hTAf6Qpyi9ZE0Ufqg8ejaF6obpxCEbrsVvRzUs3gxy8hLX+XHnWicEaXPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RKHLl8UDv87On6vnsZ7UJPD47Rphq8Y8yTkB22py/VjshEcV4k5H/LTrskJU?=
 =?us-ascii?Q?5YUoKLs2On+1uaNJi2vz+ity241xmdbwxji5lRIW2pj0MTHejE67Cc5gFEac?=
 =?us-ascii?Q?wi98FORJ/HPXK/5q7jovd0CLCjmjfAD/6vGRA6Po0nFmv2a4e2dTe4paesnI?=
 =?us-ascii?Q?S5IOoqzVEjDKuGO5Hl/gMbW1Vrei4VXDwETNCPxIiJq4aFxwmrVfri0FGPjx?=
 =?us-ascii?Q?oTFPjEILueJpwfPV9AdC7S317b9UTe6YvNf6u9pQDrZf2Gi3yNBAS/5BnAT/?=
 =?us-ascii?Q?loA5GSm+V+oNY9AEwf0jyjEGQsDbL+LrhBzhwVY5NBXUkNXNN9Z0dnKsnu0g?=
 =?us-ascii?Q?5nqRRUHYaBGaEFC4TICReQETQc5SBVjKBt3Zrts3LgfFkqTs0AnQXwJzNFgN?=
 =?us-ascii?Q?oZQI1K5t6xWRZJFPtO0yA3BYjkH+wDVEIdDppCYNlnwS9fMgmlF+AAY9P5lz?=
 =?us-ascii?Q?pSmwNbt/q9CmPQOrgPLV0EtFVTnYpW961G6zrJkreJYyQtgkU+5PGSxzoFZ1?=
 =?us-ascii?Q?vacR2ffTQSMHN5m4mSreotvlDkdui0r8JCuH5ty0GBGTjqlbV25cVmW+yFqO?=
 =?us-ascii?Q?Nei2ZrWu/w8fkVm0Cupe6Ve23qmPBm5I2xw6SbAprGHBOiM8Egaft11lyWDz?=
 =?us-ascii?Q?YEeL7nR5yMTDCz9Didr0WvZQH8LNvjt5qCMgERNvTjIpOTnhRB8v0H3ARPMF?=
 =?us-ascii?Q?XmW7aPqqgNw1xo2IDUptLTUKu35X8G4eUQ+goKQd2YpJbP8q+Z8sV7Hx9E8e?=
 =?us-ascii?Q?cajD70p4hriuauYUFMttPaATkv+RWUMJdBu9RstqsQybDeBMGfsZJkxhreMU?=
 =?us-ascii?Q?ApKWQ0Zo8pvq9uHe4P8RtPj9ykbFr/rlKZM39skTIVhqZaOomKi+WTESx8mN?=
 =?us-ascii?Q?dMmELoSKRcU6tJl5TUrgmHu6pp1y2POHM8b3F+3c0/JRxVP+8JxEy9LJgcPM?=
 =?us-ascii?Q?LlVoB3i1qq46GQzh1Jxbrw39l3TWo1FxAT2XN316LN1vjI9O8X+5S/h5EPi9?=
 =?us-ascii?Q?FpNkJ8Qpr8RdrN5BJt0DQnJEm9Di/c++2uGniR7CG5den8WPxdSg/y5fOY/2?=
 =?us-ascii?Q?1r9WBpNz30nkFa6TsH8GN9IPy91UBHhEiLq63Tq51oXrO3wRKOFcf5YD5e72?=
 =?us-ascii?Q?7h++ex8MGXTlf6rp7CcvdX/7/Lo6z3EKe3AnfDlIv4l4kR98Tj+DMCfcugfw?=
 =?us-ascii?Q?4LUTKxTZgeGWniq1hBA6ytnOxilnUTUB36dyHBpb+Hm8qynSOQ5FMkJFB6QZ?=
 =?us-ascii?Q?1Sjw4VJwkFiB3F30EQ/xjfhsE0zCFyRsG2kmKWuynxl3ymkHgogSYJkR5Wfe?=
 =?us-ascii?Q?wG76C1eMr/EZ6tbRPBSQNbKC22TlJBLqwXdoROz8nWBHWQfNfCsAmO1Lig9S?=
 =?us-ascii?Q?dWjlIBoOIE4GUuiJRDrP3B/hZZmHFKTrfbyruRSAfk7ty1veypGUASChgLLw?=
 =?us-ascii?Q?yI8vsIbd7WPNsPQAMl8Y51a39BiKXYxrSTaTVSlCjM9WhPu7tWK35N4Wcv3h?=
 =?us-ascii?Q?DyAnc4hkQF+ldDe8Cl8sjtkJhQHmKygZ6fIp0tFwLe2kwvyX2flZ6nci+uF9?=
 =?us-ascii?Q?+DOHZn9TtTD8uKhm24SmXAl7cubyEDgkUOwlkf70Ilh9Mpmzaqu4iKpn45he?=
 =?us-ascii?Q?cCGoglPd5bMtKeAUDjmHQ0rIsoETi+LFbkvKYAXirvSd92WckTHZrMDOhJMD?=
 =?us-ascii?Q?e/hYl0lgj4rnUlVnsIZaUiPw9tyOluTDDdQiNxAgzl4rftywiteIFF2saJk4?=
 =?us-ascii?Q?twAgnVcrvmYt0OGEs7RB6IX3HZcrMpCKhrEwFXQ4x9MLVuMB+58T?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b4b9b6-f950-482e-2c74-08deff6c9eb3
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:11:51.9839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S53RV1YmkBJiWYCMXpUbwoMjKRa/YSdUZLMuYCJqMqaPm9gRrLp8DFTYZhAkj/ybLUZDcFHJlPqqFSfGD/Ec265Fg7BScqhzk1XvBY3IaNvy1G4oI8NBkribsu3kxqip
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7971
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_031156_051609_7280146E 
X-CRM114-Status: GOOD (  13.08  )
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
builtin_platform_driver(), and add the MODULE_DEVICE_TABLE() and module
metadata needed for autoloading.

The clock, runtime PM and IRQ domain are already owned by devres, so no
further teardown is needed to support unbind and reload.

Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/irqchip/Kconfig            | 2 +-
 drivers/irqchip/irq-imx-irqsteer.c | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

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
index c2f58787f9a8..dad09e095ed1 100644
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
@@ -370,6 +371,7 @@ static const struct of_device_id imx_irqsteer_dt_ids[] = {
 	{ .compatible = "nxp,s32n79-irqsteer",	.data = &s32n79_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, imx_irqsteer_dt_ids);
 
 static struct platform_driver imx_irqsteer_driver = {
 	.driver = {
@@ -380,4 +382,7 @@ static struct platform_driver imx_irqsteer_driver = {
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



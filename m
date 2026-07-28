Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47481C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WOIlg6hKgFhogHzKNMm3hBjWt4GiYXqg3A+qU6swZZw=; b=z7IgZQXxszcJfBndNtJ3qF9zV/
	QaRdlqEBdhKlDYd57YvEbyRJAAVaK2Vfkl3+LPGQ5QG71nZZHvZ2cGK/ihQyY0J0tAwwQf3Pq5+Y5
	8flSOKrxMYLnI1ySzYQPY7M0z+sIv/1DsRERh6XxB9JDzrgGf0/Jf7V98H1e9bWfosX3PT3Rv5FFQ
	WRLgbX/gnwCMvbXPlgqlHA7x2Yv1cAlFSUL9P9P4/aO/Fhko0vSZO5yDAKxrRJzmn5Hd6PMKT506Z
	g6A4+OtIUeJS/Bz93wMSjkl0j5lztOFzYc7jU7jcPIpMZ1QnlzMHsrYzSCAvDcLMTIbT+uUJBW6Lv
	K4x+/DCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woe1I-00000004nqy-1gqQ;
	Tue, 28 Jul 2026 09:22:40 +0000
Received: from mail-westeuropeazon11013000.outbound.protection.outlook.com ([52.101.72.0] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woe1F-00000004nqF-1vd5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:22:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSK7lIcEbqe35PYDlKdnntnfwMoY/xcddHvj8Qke4Ku4tSFlikH3HFHeXPlCW1TLYYkLn5qb4wwtcZpUTlHhac2OyD5y4TC2ZrSInUw1jkfV4DSH+EG9zS8x5zOdI+z2ztysdw2L/RreNiZ68QtXvhkonycPjwGd64qGw0zZPX+nNx0eQG17xYmK4/zqdNUR7wGJvVvBHH3sAdEpz/AxAuslsihkPYpcvbm0WqGr09tX98bUCCQ+wg2WoL2UD4cyd4r4AkN84yXl6xuKssYIXGWQ1z3PedtrgeNKEpU+q7X567Qgo6ACE8UiqNTK3bEKr8j/KsKNH9Prro6EKUZi3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOIlg6hKgFhogHzKNMm3hBjWt4GiYXqg3A+qU6swZZw=;
 b=deWFNg2W1WwejCGiCYH1V4389+8u4nqTmiPC1REGSK2J8ET7+8iUULEb6p41/JWOItwT99QyPVDPZDugsRwBJ8qrCwqn/1mbWpoB5sj+1iSHA5eg8NrEUWPJFiH+lbWwdEJ3KXvS0U63xGYgmGInPtUrMHBpUOosyIu2BOUNdYNm/tMiO1c62E+V2s8v9NCG+uW/Fda1fIXdwt8+GSC9jR4kH3XoI7CFTtHIJ0HUN3nqGMJhe/aVkhoQJwQnb4p3mINGsBQYZn7TeLLOBtfOZTwElhs8ZHihH3NAw0vV3AhRltbKhAiRvftUsKwjBH93FXOEob+H6rvwJdOHAqzaJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOIlg6hKgFhogHzKNMm3hBjWt4GiYXqg3A+qU6swZZw=;
 b=BxtlaqA7sV31ardYNksMz23OVmeq4577WGJ3t9cK7sp4NGAqHF0e7slimlsXISX79lnykRfwjhbqghJU4+BG4825G3YcBw9ddCa1KvXI5d2dAoGHmjLo+GZ/5DpQ6ULbbxuA8NsWcYEPPSwa8vGrRYqAq7g1glPgv66ZCB7I+leSpyOjXnJ/foKreB6WA82jOB3/aDICD/eQMy2hsX3LPLScFAszQ1relA6z+sQMasounBIIgvQ5z/ehPWKkQwvxalV5k0UgGIlqwpt0AqsKNdQPboDHCZQQx9EcUX6yxNtH2UJGCGLAq7pZr7MIzIvU1uNE1FK4aXovvys045wrNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by FRRPR04MB12569.eurprd04.prod.outlook.com (2603:10a6:d10:1cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 09:22:30 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%4]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 09:22:30 +0000
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
Subject: [PATCH v2] irqchip/imx-irqsteer: Allow building as module
Date: Tue, 28 Jul 2026 18:22:19 +0900
Message-Id: <20260728092219.525449-1-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0057.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::7) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|FRRPR04MB12569:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ffa8c73-bdf1-44c5-83bf-08deec89be80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: EI0kAtKMHZ0dosglu+Op70TaCufQh0HHMx9z1PQdSGwqcL7yGCtWik3+t2VRLUfCoz81yeWwdOJ1/diHHq8B6T5ICBLxEYSmUNESkm316AZ/fu85djgrIl0bZErquNmrzZVxtf6DEz7paZKTLGm8QEHeGRGvhNz+mHFhqVeuxFRJ7fFJ2YYnbOkKVYMn4LxBaqZhlSDHxLQs3jhl+znmlTxmBuu5kGRVIpUFkZFqDlPJZg0He/vBFnAb3BNxPZWJjUqjQfdLrtM+s4257SWaaxDUe5+JQ+3wCa2b+jr0KUAzNzEAGpZEd16U26Y0KNGIGIxcqpPa/Qy43ebphRc2NFDSPN/b74SUwAinIHOyzcaZhXsUs1dkSe0TqlMoalg8K2zV1U1J0TX7+tLfAHeOrgRrblFSmxVhCUbaiIVNZ99ELZndSqfQCzCVaMbp6CbqqgWMG3LrQsAl1eJqsPEaLVttQY3KTYYPTpvFrAo01Yw4bRtnXJMZtQsZuoycL9l/cl87fi7c39+UgdJGXDV3DZKV6TPaDzYSTM8g9+zIkvLekfpZigxdcn/IjqbyrqsJjAxKt5Umg6cF0S1rrvUB7BcVhfFwy8LRX5uDJJnL8E3k3JjGNpre7u2eW3jlYYse4bA2wx5jNpM2Ik+p0FeXjVm5pkqVD9pmiDBOed3A6SI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eELPCGNqv4I2j6sOUmTC9MVLmPhFV9EqxZWQMekyDOC+Ry6AmAbpzWL34hMu?=
 =?us-ascii?Q?y0fCpHNsl3wOCvsgYRJsCIIirz+aY3vB9HeXdYs4aDW/QnTtpNNY8W1rC1e3?=
 =?us-ascii?Q?HOl6ULnjP9QpYBg7JpseRiiIbi5N/wcSSZ1hsIo0biSVf3P+Q2JieD1f00eR?=
 =?us-ascii?Q?7+737Tao1UzWIgPVBVMvIOqtFEHlD0421+X5Bw5EHKIIofsXr8TZ6F5j8GHS?=
 =?us-ascii?Q?9tL96Jjxr5YZV7P64cVjU6jNIBCv4v4aJ8asje2Mjdm3Jm2m3kXAdW1fpHm2?=
 =?us-ascii?Q?pGLq/W3nIhOHKBcGLA0KEEh4cAlGusmjjHc4hHo4tJRdHRizrfIW+IlRQJCI?=
 =?us-ascii?Q?5cTO8EdTgil2MZiLFMiZQ0DQkhxPSiM/fWidlhDtwBw2HAASAJ08/ow61Mh/?=
 =?us-ascii?Q?t3zG+GtPphmo9gxsn7ne5hjppKwg5OSOGuQ2MHKo43R7/ZvH5tg3BiMJynmf?=
 =?us-ascii?Q?/eoIriFwrcMyo6kIDd8AVSmwki+oM60/94YeWqE7l9y/MqIitQn/XXwRLxk6?=
 =?us-ascii?Q?iMsbdHrIlgA+ihvNo8uDmuhweiFHoHciSRmOKmO3d3ZVwdvYXMvCmdPidqX0?=
 =?us-ascii?Q?2M4e5Y68NPfEmgHE8jKc4ktzdyps7kLRKvBbrv7XCSQ1BI7Y8TYTND3EmSjF?=
 =?us-ascii?Q?jYXzvxOjDPs3+3K7Vcg3N/nYdsZkk7OiAlK7azLI3PLb/vVy0MELvDrQYaPu?=
 =?us-ascii?Q?SkHA9WRTRtFfDrSXd8OsnxF6AK0EQg+UogFY2VtHqiHHKBgCM1ylEI9lOeox?=
 =?us-ascii?Q?P7TYw9YF/HOCOwJUE64EZUHbPIhmgOmQw2oPkLQ39tfmihqcXKqIs/RzhPpF?=
 =?us-ascii?Q?TWDyYQ4Yw+ANz2Hcv0GUnKVt6krhO6SgT0pmE3h3Y476tFYXsJurnefNQqOh?=
 =?us-ascii?Q?i02Ku0FNc0M/Fnz02RUsnjJhgGgVhiPa0Y2sqp3oquLUtfp2q69+6GlzdVn/?=
 =?us-ascii?Q?syOZdfwmXZv7js7ig76I948h5fUadqpsv6Ll/asVKY+74VhvPe+LcFGHR0gj?=
 =?us-ascii?Q?hdBeYNM4Z69/ju0fJKdV88fCxJhIZDEMdaF7rIw/AJtQYnimViJD5i6qUdEh?=
 =?us-ascii?Q?FVSghHhj75kN9kTAFIHuGXT/uJCW4I5jWZbBQuGJ9aKBR846dkmUtAFlShln?=
 =?us-ascii?Q?StG9ZpmPV37UTdB04Vi/Ine8ngTxY/6S20yf/XLVCfbwx1KXT75ch3QgfaIX?=
 =?us-ascii?Q?RIMckJ4WJ8bNC8XPgfiHtsLj6v3nch5y4shPP3Gz6awoRI2GyF5+xwt5tD+3?=
 =?us-ascii?Q?llmK3j1XD9QF0cskb/6xsgrM5AUPr7ReKfY85J++8JUMqp4UdE1QLJBqgpT4?=
 =?us-ascii?Q?DKDDp7k4MzVfD9jKoEv/px+5yaXvI0Yd68knpiYitzExM90KvyWCH1QadtLY?=
 =?us-ascii?Q?pckFw2+S1uFlsA7nWLMxCPLcnUquey5/1+aCvez2g4zwB3iIvqnhMhuK79NB?=
 =?us-ascii?Q?OopC3ckTngfV2uKJQsQmdatTSgLo9Pu7ltuCAnOFZIR7jYPm8Nj99BCHsten?=
 =?us-ascii?Q?2XTAiD4VDRbGP/dKSMEHnDpRCOGJoQS2Dmn5ZE4FFHXMqeFsXiOy4oXab4Lw?=
 =?us-ascii?Q?bBsRFsLi2KkYNSw1rsHIWOKS/pLUhR+zgfnLJF0ixS+0wVd8wOwLzq3ji5fP?=
 =?us-ascii?Q?x4E60JZHdChsj5aYmup7lxzF7J6hWG8IrIFtBku7LP6P1d5/PW7YI9NhETAV?=
 =?us-ascii?Q?lhDpIX0sKiZsxzT9d0l00rJ6sshqvnNvTI7zZvqLDjZ+BDOWPXT0QzriquEt?=
 =?us-ascii?Q?V3kwB6eIo1E+tyGK6wjsPvXOLLSc5RxThaal82Do8hVwmXuPACdN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffa8c73-bdf1-44c5-83bf-08deec89be80
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 09:22:30.2673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nLxGT5f9lUXN5RZndWFJ7l0xccNwHB4Alc9BARngXRwFKNTCGdE3AQjp5eOqhJs4HaSL884Locd3W7IOXyC4uP4phDDdEZ0F7I9X2ju4wvrRNfD+dPfMqoUlr0xV/nz4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12569
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_022237_512478_63371958 
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

From: Jindong Yue <jindong.yue@nxp.com>

Make the driver buildable as a module by turning the Kconfig symbol into
a tristate and using module_platform_driver() instead of
builtin_platform_driver().

The existing remove() was incomplete for the module case, where the
driver can now be unloaded and reloaded. Fix it up:

 - dispose the parent IRQ mappings from irq_of_parse_and_map(), which
   were leaked on unload;
 - dispose the child mappings before irq_domain_remove(), otherwise the
   irq_descs keep pointing at imx_irqsteer_irq_chip in the freed module,
   which blows up on the next /proc/interrupts read;
 - resume the device before clk_disable_unprepare(), since it may be
   runtime suspended with the clock already off, and skip the disable if
   the resume fails;
 - disable runtime PM to balance the pm_runtime_enable() from probe().

Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
Changes in v2 (addressing Sashiko AI review of v1):
 - remove(): dispose child and parent IRQ mappings before
   irq_domain_remove(), fixing a use-after-free of imx_irqsteer_irq_chip
   (in freed module memory) on the next /proc/interrupts read after
   unload;
 - remove(): disable runtime PM to balance the pm_runtime_enable() from
   probe(), so reload no longer warns about unbalanced runtime PM; resume
   the device first and skip clk_disable_unprepare() if the resume fails,
   keeping the ipg clock balanced.

v1: https://lore.kernel.org/r/20260724090136.3595894-1-Zhipeng.wang_1@oss.nxp.com
 drivers/irqchip/Kconfig            |  2 +-
 drivers/irqchip/irq-imx-irqsteer.c | 26 +++++++++++++++++++++++---
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 42f2278a702d..07db3b678f94 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -560,7 +560,7 @@ config CSKY_APB_INTC
 	  the controller's register.
 
 config IMX_IRQSTEER
-	bool "i.MX IRQSTEER support"
+	tristate "i.MX IRQSTEER support"
 	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
 	default y if ARCH_MXC || ARCH_S32
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 87b07f517be3..da3889036182 100644
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
@@ -274,7 +275,7 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 static void imx_irqsteer_remove(struct platform_device *pdev)
 {
 	struct irqsteer_data *irqsteer_data = platform_get_drvdata(pdev);
-	int i;
+	int hwirq, i, ret;
 
 	for (i = 0; i < irqsteer_data->irq_count; i++) {
 		if (!irqsteer_data->irq[i])
@@ -282,11 +283,26 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 
 		irq_set_chained_handler_and_data(irqsteer_data->irq[i],
 						 NULL, NULL);
+		irq_dispose_mapping(irqsteer_data->irq[i]);
 	}
 
+	for (hwirq = 0; hwirq < irqsteer_data->reg_num * 32; hwirq++)
+		irq_dispose_mapping(irq_find_mapping(irqsteer_data->domain,
+						     hwirq));
+
 	irq_domain_remove(irqsteer_data->domain);
 
-	clk_disable_unprepare(irqsteer_data->ipg_clk);
+	/*
+	 * Device may be runtime suspended, with the ipg clock already gated.
+	 * Resume it so the clock is balanced by the disable below; if resume
+	 * fails the clock stays gated, so skip the disable in that case.
+	 */
+	ret = pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
+
+	if (ret >= 0)
+		clk_disable_unprepare(irqsteer_data->ipg_clk);
 }
 
 #ifdef CONFIG_PM
@@ -349,6 +365,7 @@ static const struct of_device_id imx_irqsteer_dt_ids[] = {
 	{ .compatible = "nxp,s32n79-irqsteer",	.data = &s32n79_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, imx_irqsteer_dt_ids);
 
 static struct platform_driver imx_irqsteer_driver = {
 	.driver = {
@@ -359,4 +376,7 @@ static struct platform_driver imx_irqsteer_driver = {
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



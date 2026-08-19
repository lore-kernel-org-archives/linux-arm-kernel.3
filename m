Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B753C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 09:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caeOx/ga5Mr2BEk4Rql3rMxuHZnEq6lMnOO04Eohiq8=; b=1gFEx2y9kiuRRCVJuhUIzV3b7+
	yr6lC3y/Yz7pplx7OIDJTC10cDlS64tWGtm0hK5rQXn3K8E49W/RcD8DxO2FV7LBEOp2Lw5j4UDKA
	4URZh87QGTCSQccwjBB+XiYFAkoyShuZBgiTbF4m/FlHYPJmoncNx80KoVjgekWRaFp33qM0z8P2j
	ZLwJdjwfOAqRyuZsocJd267mNaMe/Kl9DFckXuFQ11kQskLfdVZg2ilS/miH9Pd13Lm4xuPn12RQ4
	P7lCsxNYfBFGtfwXGL1CzzRR1MRJga56uNbAtnK3jh3Ux8Fjf3XA9FIU8+GJVoew+gTycdz4JR+zz
	7GNomOpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcFS-00000009NEq-3kej;
	Wed, 19 Aug 2026 09:06:14 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcFP-00000009NCW-1Tbj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 09:06:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvgPWr7m2/jd5WlonqTvgatnibU8vpIrLXGv7uZzG5Z+sTVWM3bJfh2B4+/HT+IPBy0wWhMUiQXnWQ0/Oz48FwpGAJaPyvRbZf85fypEA2Xz9FEzsD1ulfMq8s/+iK5ftfxhHXX3kjqHj5JzT5EZ72UE9ginmDuAIOGXjcyenw5T6bYusU19KnpzGpvpsp2NKrKyWsjdks6RIEhE/GTILO3B2X3LLzHiJUUWj2i2Ut7OW12869E923drJIF+74Emwa5/9B+zwIHRWuRtEUDGdrdM7pUXJ0STZiD++Z2ZvXCwpy01hIWkPXXlYkxr0yEtvVJfJa5Lu5NrfFyCKegehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=caeOx/ga5Mr2BEk4Rql3rMxuHZnEq6lMnOO04Eohiq8=;
 b=OvtkOM8crJflKFksfquYQjBeFciHZZ3RrYJ34YvMmpeBNHn578LQMXuPuxk8pTBTD5uf7jpvM5i0OSf4HiY58voW+a+qYjvrEKE01lBq+wz+uv9NPvo6eOI3j0M3DoYNEbnbqo3HmWspHfGz8Qn3Pt/izImIVH8oHs9MZd8aDvgKLQBjvsLGx7tWNbA7pkgF6owB2tCqavGZe0ItA14jNjoBFnnDxkB/t3WV0Q7TVmyVB6080v8sCfoHcsa68p9W30iTIE96sOQKvm+ADwm54jJH06h/IJYN2fdNBurvzGbbOYg9fJaI8Va8S9GQI/ZWJPF1li5POyE5Hkduv611Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caeOx/ga5Mr2BEk4Rql3rMxuHZnEq6lMnOO04Eohiq8=;
 b=qWudPy7l+VwU/gLW7BGspjbd6nneUQbyLBXVHNONEygcgyDiKYN/TRal3xUOK8ptHgrewNSrMla/pXESKa/LyoVHs206LsrAMrynVlrd0tKcv2x21DwRky5ofgWAC22jtuNn0CiRl9J/gezSMP5QALxgi9tAGRoFmUKrwtpNtj0n7UTlbADub2yzTjqnKp3LnTPnJgBvulrWBItO2twyDY+xU9Zv1UrtXq0FbCR+rCoRvT6rVsc6lDFZx7V0DlJlmZsV+jITQgvq5vpDigt8ytrO+LhoAw+LjVgKF3lcDc+uUUQ+2xcrabjJHJMauOPcsAn6Ac4f7g9rbpCAQo5e1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by DB8PR04MB7146.eurprd04.prod.outlook.com (2603:10a6:10:127::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 09:06:07 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 09:06:07 +0000
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
Subject: [PATCH v4 2/5] irqchip/imx-irqsteer: Use devm to manage the IRQ domain
Date: Wed, 19 Aug 2026 18:05:40 +0900
Message-Id: <20260819090543.585131-3-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0195.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::17) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|DB8PR04MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fdf4201-09fe-4aff-6bf9-08defdd11ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|19092799006|376014|10067099003|56012099006|3023799007|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: UhhGufGos7uY0mqeYIi0JFa4ssd8yjkSLbod9FGI1B2Clc9FdgHXmSWtVHEb9sgaQLc1oiwzbU6bva69xJwjUNFR4/Vq0uftbSnyUj58MVEp9NhISXGe5Omw3SkbAEHW2Ri/Qmq5YzreqwW6vCJ6c2qRvCdzkg1cscz5v7RLokyK+O3YXFN1/C8Uk2g9hOscSJ2fkwkDEmqS1VmBszhk6j3poQxQHoR9uuIg6naSnVoBCIP45MibE86ProJ8ZpevrGpz0+mIZfmtQ8ZDN3CJ4J+1eL2Ah+FZ34e6SF2SBxgi/sjPQQQf3TlV9GUB8TKOdIDOjl+ygmj1H1mGIALtt0l++IWVJ39bticlKofNjINN79wNj16whRVGA4LD26OKJeW/Kbu24ePHFBRvrvNEzUqd32rFNPrlH4xPIgeQaJnmOoUPWw/N63TDREVWW2hnuiFIJ03eu7koFerTMOmSHU/7NIDswY1LFiEFxB0Ng8nH7H0g7KeE71lKzaNdvLYc5YzF4598O8zt2kWioeaySl1ktuhYIkwiLjyxW6ywrfHsyG//f1lyw8wGoZUaIHlEsLvLCxl/NKF6O186I1s0IvNw2tkpaQBk0tdNhHueBpvxTFVkkg+8gnyZ/DexA5Cpuqi40x77YnshCkdu3gWP9SyrFyVUKOmpIzuBpMb9lnw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(19092799006)(376014)(10067099003)(56012099006)(3023799007)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ldCoH13thgfX3FDtQj893aOF3bonOVMQuSBpWb6aCZyuhIs6/oCHVWHGsiK6?=
 =?us-ascii?Q?u0THXTd82c1TI+pBjdS5rHC/pRJm2SYCBiaPmfJdTDH4Ctn24JO54h7Rjc4B?=
 =?us-ascii?Q?gEQVV6E1olgwCYiglfKhPZ+/uQh6EXcQAfc313/+XB7fBwKSwj7hGKo2VQfj?=
 =?us-ascii?Q?ZxOWJIxuGTDcDKlRmCUjmfzsugePmiGUxGTe37zU6xTWoJGCP1twerTKseoo?=
 =?us-ascii?Q?Xs3ZQTigMTU2ZPcUwyJyrMKCqOb7Sza7cpMq02CjF/fVg9Ida06e2w2uqM1N?=
 =?us-ascii?Q?jd8P0q3IT4fg2bVIFhIaSWS/R8a2aXYgAFYxSymYS0+0607b761RXKaMRcxZ?=
 =?us-ascii?Q?Wx3BmB76RNSOnDzCi++KjU6QwKTastU4rmQ+Qja81DnvGIrnt1XL18x1B1TW?=
 =?us-ascii?Q?av5eB7ZqRTGtk4dlF0xBO+Ue7BXATpF/EvwZfOhT+iTX9UIsr2oBjl5xd0PW?=
 =?us-ascii?Q?YZv3SbEoAPXXslOs2ptY9MYkJynYfrDgasQLAUmD39pWSLMfXaaNe1eAOEnC?=
 =?us-ascii?Q?B3jzAY2psF4NI1yQixUydvz9X2+Q3U0bfrNPufX/uyCY+zbP/P2HInQxl9nx?=
 =?us-ascii?Q?AKN+D1IH1gIBN3LKhh9hgPyjZTNgNVMizAX3pLVGsDiGCUeuYgtZCEG8Ogg3?=
 =?us-ascii?Q?HiTrIUO8PxL62p2ZbyhdtuFH3qIRc6LB7PINuUF8V4IRyl4tBmE1hguq3pef?=
 =?us-ascii?Q?ViYp9ihytFLSRaRYU5hO//0SoEprgcYklBTGU6VAPqHSh6TbXZhRZGq4IFDG?=
 =?us-ascii?Q?Ep/3ppvhBYG3S1Ng913QHQ6xnCBq6YjP7jX3OEC2zMOyGMKEYOaDvNcywRkY?=
 =?us-ascii?Q?g2WJI8blG6x07vjK4T5hnl/qMAVxbj1hyLAPnORhaVCYyacq614DJfdEWKEP?=
 =?us-ascii?Q?it2VNMZ08Q9VON9rC9gVxtH0c8sBujz4WoWIRQSbE0HvLbGh5n0jh8n1+bs7?=
 =?us-ascii?Q?0hv3coZZQqDiZZd8XK7Un02kEpyZtk57FZ/vksm66JD/rFKsUmLPe+YUU7s8?=
 =?us-ascii?Q?tY9cBCxZKubG19uO97j60beVzLFVafmN7UssTgoKZgiWhDzLMCnWNOfnG9U5?=
 =?us-ascii?Q?KIK6cdW/GnrDKhkUjXKA/xFl0mLMs8dexOmo8cHvzoyCBu/qkvrDzL7OoaDq?=
 =?us-ascii?Q?/UttDAMBNM1EDKeNYeTzEYW1N6jACdgmg5WqFTJyRHH2QpCkjxAwj4Rwowv2?=
 =?us-ascii?Q?IlmNI6mZtOvVpdrrc2WNzNdjFpG9eE+CSEJc8/k2OdBmElbjnXDEgJsoSxtS?=
 =?us-ascii?Q?OoSNp+pX8HUIanm7gdr6FwGXbC/P+waSu1hTAzm43ZYYoYqDsW9t/q4FSPyj?=
 =?us-ascii?Q?rJ5EpyG+7wC2XkEGAhm5qsikKWG7akVcsNFHHFwB+eCWvL98KWylLRna9ZGK?=
 =?us-ascii?Q?f0sa4WspfLHmwuDFkeoFKpXNEfNqEI3sf1QH2C6RBW7sSZo8HxyAOHj1SYOp?=
 =?us-ascii?Q?i0YELkO8TwRezhybP+IVmWzwKbCDAnP6IUF0Arrv1dgmN25t33h+tDcPhpmx?=
 =?us-ascii?Q?l2rXh9M0rmCVr08LUM75RQ/DfW8xinigZyAFj3OPAA8uwW5Heu15VKgcB6MZ?=
 =?us-ascii?Q?84/39LTPIX2MO47G6u40LZP4Yy/Jf1s5EMfMceJzW/wYeyrr+qtug6dJlc+3?=
 =?us-ascii?Q?vpuDoffkr/ESrC81Jyf4bX/hYPvdt1yJtet1bh3QB8Ka8nPpGQ4XUASntqoz?=
 =?us-ascii?Q?2yRFOz+hMvAf6l5sj9MQBMmQmgrZT2bVEdx1jhME53AaLL1LTPQtxsMTZNNb?=
 =?us-ascii?Q?YJnVSPvjLX4lL4axTH9Wn0ZKJjf2vUwzp6Q7OZMnagu1sCgzA0Xo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fdf4201-09fe-4aff-6bf9-08defdd11ae0
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 09:06:07.6044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aECjrrFUFmfhl5Egy7h6x/B+HbDaClCVfBTM4s6/WNm1XL5cCxSTyLod+tbKLqOOwWTX/25KUnZeYeipHMNIcEI2Bzi1reoS3mlR6lG4sgh0Au7Fo55fm9g8AWp0Le0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_020612_444619_FAA82BAF 
X-CRM114-Status: GOOD (  14.70  )
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

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

probe() creates the IRQ domain with irq_domain_create_linear() and only
tears it down on the remove() path. On the probe() error path after the
domain has been created (the fsl,num-irqs sanity check), the single
error label just calls clk_disable_unprepare() and returns, leaking the
freshly created domain. The domain-creation failure path happens to
share the same label correctly only because the domain is NULL there.

Create the domain with the new devm_irq_domain_create_linear() so the
domain is removed automatically on unbind and on any probe() failure
after it has been created. This fixes the leak on the sanity-check error
path and lets remove() drop its explicit irq_domain_remove().

Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 87b07f517be3..359b8ebc1bae 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -236,8 +236,9 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	if (irqsteer_has_chanctrl(data->devtype_data))
 		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
 
-	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
-						&imx_irqsteer_domain_ops, data);
+	data->domain = devm_irq_domain_create_linear(&pdev->dev, dev_fwnode(&pdev->dev),
+						     data->reg_num * 32,
+						     &imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
 		dev_err(&pdev->dev, "failed to create IRQ domain\n");
 		ret = -ENOMEM;
@@ -284,8 +285,6 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 						 NULL, NULL);
 	}
 
-	irq_domain_remove(irqsteer_data->domain);
-
 	clk_disable_unprepare(irqsteer_data->ipg_clk);
 }
 
-- 
2.34.1



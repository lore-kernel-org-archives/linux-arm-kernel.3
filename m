Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF332CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 12:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wM5sjP6SZCA33pDd7W+DmuuSfoAyutOwIG7Glbhvjlc=; b=WAF6fZ0+GIW+Yn7UtXskHAi/2O
	3QGdvUjE3bBf59DK4/CFK5Nr1P6p+KeDPVKVqE9/0JQ0+uHhQ30ytquf70zlbcMJGnW/bRKuGShpM
	FogTFzk/EP/D34nZF8RxWvYlheaI7TAkROYfW2eMHxl651EDAdNuWV/O01D5jRbYXpSW5jsadqiyf
	BZFraUsvtTcFkV7cm3PtxsWJSYXZadtgxPNkg2YX69Acoc/IT5QoLQJycJ6zLck+1fZOrZ2ct9Njd
	XaVIAKhPxNwqq+RR8NWscqUjHV33hEm581sekARu7ROKXAJ1UAOQtmvVub3BcWZpLlVzFr1rWAfPc
	t1VwIfMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCyYX-0000000DScG-2XLi;
	Sat, 03 Oct 2026 12:09:33 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCyYT-0000000DSaY-3Obp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 12:09:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXWvDL1sraPSo5+45+YFRWDJy/azbWfKT8VLJVJLqwXGkghjWvBxMnwfIOAtAEtQUZhPVb1PeKQZekTd92xEMgr9RuKumNz2WIUiU74cqe3J+kdyn1u7sMdEJDyAmmy8LDXXrXd81dR9rkwCThMXVjRc59cTqRwAh1iJp2ldvY+KWnkwP6kEOV189HwG63FJMpf1SMWFTLawm33SryLMFDABmtx5HlTFjem2M9sDQwmxgkXchZ7bnoPGdKvmr4cpY3HaFrmGprWDh4q/ULUR3gfry9QIp21y8gtBnGvHuHAIZIEZOPg/h5D11bZocib8+H5uU16R30bbFibNC4EmAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wM5sjP6SZCA33pDd7W+DmuuSfoAyutOwIG7Glbhvjlc=;
 b=qraTCd0ktUKCdFh58W7flQAawrvmegw0OgCUFXkzMGsPsF+0Q5DMf24STVdl9NTt5428eFLl/QMQ7Z9dXgswPGYpDmFqReGclJN/Aqg0vsBrBhINISsVeJLbnx0rMx9ZFWL+mbRs2OGOFcLyyCe2AUlfZRzPma98xeKuNmE6IbSzhErDAXpD2FcdlhPzAe5NfJoM3CCc1yXdjTZMYWswkXXPUXOKndu76/vYqJ3gKMBXN7CcXNf1AIgA0EQ87pWcGbV25UY+AD5k0Tto+r3NoqK3aI0FHCeTY6RmToVzDzwUflmH5mj/NqDATpJ3A0XpxuE657r2qEFayHSgD9P3Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wM5sjP6SZCA33pDd7W+DmuuSfoAyutOwIG7Glbhvjlc=;
 b=REzvjy6hgdCsLqMbTbUjqatMpWrCVxmLUu3Z1jbq25c/gYqi1lZAoHd6x2cg4gcanGq87CibebMZqt22RzTIEUBXenx6Osy5ywUhMB/fm+pjlLhL2oMafsMzMTVmXMH/KZucfwEym9/kssxiYoCa0vvZrPFE4dSEe55Ztw50sivk/prxTjIrI5Dt4CJ6y3tfVFhMwfMRsDYGOVJ/7/vMFdsFk6oZ8M1xQoLdeCF/ZH7fWi3NF32dc3PZnDNZjm9ajytR5Z8mLbqJYr+LvCvoQ+rtbcXL1WlENoOn+MyFwnJf2tGvbZCq/CxZ2kasIaTiBrUkJ8cuYqXrRcSEt2dWCQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU0PR04MB9467.eurprd04.prod.outlook.com (2603:10a6:10:35b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 12:09:27 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Sat, 3 Oct 2026
 12:09:27 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 03 Oct 2026 20:06:43 +0800
Subject: [PATCH 1/9] gpio: mxc: fix race between chained IRQ handler
 install and probe completion
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-gpio-mxc-cleanup-v1-1-dad728ce27f2@nxp.com>
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0269.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU0PR04MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: da6d8da3-f948-4a13-4549-08df21472c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: R2yyB80rnwNpOu7I3lVvpVZxOSgU0Vo2L6ndGZ84rO+w4FWRoiA3tmSz1h0Z2tT9CmKrtZjQA0ETH7jaMTJrdiJaHF1xgMX9QS3nAllsJXAkH1C6sxT3GdCBdXqi8Sa6VFrCVVG+n0GJKweMgMRdtbh3Mwd6i45DFxoxuPxox8O8fCF/7FBDPLmGH6b1jbc8YmahfoCz1j4KP2ofbna/qPUycFwFY/tWLrDWYQz8Gm8b0gtV6tOPO6Q4mYpS7fsB84qSRCL9uQIaHkdNLhLka5dTsQMI2Xj0GI+GU9QCRWaSQqSma8yyXfR3xxOLlYxgGvm451w/yKTIdswz/HgYqaG5ItiPp0w8PNcREpDdGKFhiN/mqfnkooUI8v/P/KZ/ffV/hKtbtFLuB1QSDtuKksDRXKuXYuThrsuvbcMIzuifrfnk3pNRpwwTLC/DumtsyHmZgmJyGZCjSjZhDQ9JV1xWRMZh/xnFVAJFFVuGQivE+2ihnCvX5O7AqJavQba03Qi1ojkwNb0hmOWJS7NQG7pkfwu3+iV2zKfjly7pRbhMCcXojFAYjr4+22+ceTWUgE4RHnMQPkowJHoV+2tLeS/s8DFOxg/o8cJEqob1CqIKRTxKPVSHt9sjnAfQiM8edL2M7SNLeGHBW1KroCxKz9hW5SnikLk+nO6bg37UWNs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmZmOTk0bGREUUpIbWYxNlp0VkJYVW45RHYyRHBpYlhSaU15RTlrWGFRdHgw?=
 =?utf-8?B?M3JMTXlWUmtTWFpGQnliVzIyZnNCYSs4NUMxVWptemNoeVgzellXanJiaVlq?=
 =?utf-8?B?RE5GNWlzYkJBZlRUZ2xieEhMY0swM2RwTFg2cGFyc05xY2NpZFZRcHdMNndY?=
 =?utf-8?B?V1VyNWNxUy9pbGttRkV3MGE2eHlLYThjNWVKS3dYMDZGaWtFZyt4UW8zVG1a?=
 =?utf-8?B?VnIxaHR1RTN5TG43bG1GajMxdnJwaE80MEJyUzJEeGJQL2pzZHJrN3pEbFln?=
 =?utf-8?B?NHd1MGNlTzAxUlhSWkVNc3lMS1BRb2hoZlBFMWdRL1h3cEdXZzhWMFBvaml3?=
 =?utf-8?B?WkJMamFTNldhYnN4RjBFdkVNZmFkV01ucnQ3OHFJcXAveVpoS2d4RVk5Qzkv?=
 =?utf-8?B?TXZYbXRaRTI3SDV2RGVJQXJ2TU81L0R5UWlQNnNoY0JTbEhPbEJkNys5VlJ6?=
 =?utf-8?B?WlovQ0NVQ2d5emRSWG1UUVNYS1pQY2k1QTJqZXprc3lVSElZczI3VXg1c0ZE?=
 =?utf-8?B?d1hMUlM4bGtwSUtJamJSVkIwSEJJSFVxU05BbVN1SFhDRzJjQ21QQXcyd0lS?=
 =?utf-8?B?YUMrZ1EvUnNMalNDR2xGUkFDY1JLam1icXRIU2h6L21YMWJSS0VBdjJqRGoz?=
 =?utf-8?B?ekNWUFFaOXJlSWRsYTlWSFRhN2JTdXdxL2RvaU55SU1zc2FHZW4yczd6RjY3?=
 =?utf-8?B?UnZnV0UrdnIrYWN0NEV2VnNiaE5pcUJ5VmFJTGNDTXVWd0FrcmRmNjNUTWwr?=
 =?utf-8?B?L3ZYeUlzQk5pNzMvVCtsc0g1eDJaZjFtUGZMRXdLTTBXbkh4OHJlQVRidGg4?=
 =?utf-8?B?bzMrd2VRb05ZS0ZGK2JsMVIrZXNXUmc0Z1Y2RlBXbk8vZWFrMVNMbTV3K0I3?=
 =?utf-8?B?SXdOZjFqUVJ1c1J3M0pxU1BVejIzaXJzNDFUbHBQU1RET1ZKVUZLQ3lSMklt?=
 =?utf-8?B?WXVFYUdEYklPbnJsdGVOT2pSNWdOa1R0bGQ0cU4xcmlIZWJPTC9mKzRNSzQ5?=
 =?utf-8?B?RE41dmVteEdzMTlwMmFPSDBjQXZ4Q0tuMDg5M0JoY2tqOXZSSk5NdDdOVFdB?=
 =?utf-8?B?RlZ5TGI5eUZOYWNjcytWY05iQ25JazdzZ0o4eGpBOTlmcTAxdFczQi9jZ2gr?=
 =?utf-8?B?c3Ria0hrWFZ4ZW1yaEVXQnZJVUZIeVVoNWxHU2ZmZ3ZsZHVzblhzanpiWmc4?=
 =?utf-8?B?dmNYcy9kb1dBNFN1eFJlVmVNSzkwUENpU0IyaVYyTWZtQk5VSVlFT1Z3Tm9T?=
 =?utf-8?B?RGpBcVkzSHJ4Zy92ZFFVTlR5enVoOGU5QVNtWWZoaHFUYkdaeVg1NzZNYXB4?=
 =?utf-8?B?VStkV2ZqWUt1Y0d2cEZsWVRPTzBXV1lXdFplUHdWQXpvbzNpS3NYdHp1TFdw?=
 =?utf-8?B?bzhia1ZiY3RJYURadFdNRzB2NHljYlJBdi94OHhEN2I3dTJuQ0hoVE5Hdmsv?=
 =?utf-8?B?c290SVc1UHVQK3VtY0MvMzNSeVY2bExIdTRKNmNrTHFQYkxFQ3R5alRrZ1RQ?=
 =?utf-8?B?QlQrcWV0ZGVHbTBRa2lFS3RicVdTajVSUGVmL0dqQzJZa0FmZ3F0Q0pxUkdp?=
 =?utf-8?B?MmpWZ1FXV3BsWEpXMzRaVEIwTlduRDJGeU1wZHRlU2U2a2o3eE9yMElNemtm?=
 =?utf-8?B?WFpIaVg0ZnpVMlV3ZzBzdEdsN01rbTNmVisyckVhZWphQjJKMWIrK0tzNTU0?=
 =?utf-8?B?WmltckpzbDBmaGNxNXlSSEJuNHFwUUpvaElJWGZQditkRUhzMzFOYksxV2hq?=
 =?utf-8?B?aW9zdlZjVFZHMk9KNUhPOGIyZEI4SUtLeHRDUzJhYnNOZGJYTUxSUDB5emJO?=
 =?utf-8?B?ZHNISGNTbGpCNDV6bWd3KzNFVHZQcnBabUFSNGdPQSs2RUZ1b3pOekN5Y3FF?=
 =?utf-8?B?VGpWYUNmWVhqRnExL1NBU1Z3cVpWWVNpc1p5Q043STlGUGpIU25DV3U5MTJu?=
 =?utf-8?B?ZXRCUkV4WFlxRWFrb2xqWHV2NCtsYjY4Z3dVbk10aGxOZ1lNeDYyaEVRTzJV?=
 =?utf-8?B?bzM0QldUNERTclEvQTYzRTFnaTF3SnFqNG9CRGZhTXY0TjBIVTlhWkhBUFFT?=
 =?utf-8?B?SlNyVlVoWllKWnJCam5Rb1hyT2diYVJHMmQzV1NHNktsSEg2TjYzdUI1Nk8z?=
 =?utf-8?B?R3hFS1YzWGZSN1VPaHB5VXJxWndqaGd5d1JxRzJIdis0aUZDNUJrbkZEMk1a?=
 =?utf-8?B?cU05dm51cmRSRFZxeFJ0MDVOVW5vSWtYK1NlaFdTQjhSN29yK3dwem9qSkF1?=
 =?utf-8?B?bWtjZXc2WnVON0VXOVYvalNOSFVSUlRSMkRqdk10MnJFZVRIb3dkbTlJOHJQ?=
 =?utf-8?B?R3pPNGFiMlZuUnNzazE3YjZpeVdGOEJHZHJDb25Ca1FKMDd2bmo0M3EvVDZt?=
 =?utf-8?Q?/NcZP0zmb2K5j4KrcpZSPLAJaiOp1a/mB3xti?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da6d8da3-f948-4a13-4549-08df21472c22
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 12:09:27.8140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6UyvGKG/Zi5M2DFj/uzCkA9QUxQGikmHFdpQbTjjOW11+/JK+jDLqPEJ+heEkGp1zcH98TnJ2V2s5h0zNRGHZaMtqO5AkqlIB48cjAmDZcGLvCxBn711WaHa46b/yQp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9467
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_050929_861969_5FE72063 
X-CRM114-Status: GOOD (  14.20  )
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

From: Peng Fan <peng.fan@nxp.com>

mxc_update_irq_chained_handler() is called before the IRQ domain, the
generic IRQ chip, and the port list entry are set up. If an interrupt
arrives in that window:

 - mx3_gpio_irq_handler() calls generic_handle_domain_irq() with
   port->domain still NULL.
 - mx2_gpio_irq_handler() walks mxc_gpio_ports, but the port has not
   been added to the list yet.

Additionally, if any of the subsequent probe steps (gpio_generic_chip_init,
devm_gpiochip_add_data, irq_domain_create_legacy, or mxc_gpio_init_gc)
fail, the error paths never unregister the chained handler, leaving a
dangling handler that points at freed memory.

Move the handler installation after all its dependencies are ready and
after list_add_tail(), so the handler is never live while the data
structures it touches are incomplete, and is never installed if probe
fails.

Fixes: 5f6d1998adeb ("gpio: mxc: release the parent IRQ in runtime suspend")
Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 7e2690d92df6..e05f276a50e8 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -474,8 +474,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	} else
 		port->mx_irq_handler = mx3_gpio_irq_handler;
 
-	mxc_update_irq_chained_handler(port, true);
-
 	config.dev = &pdev->dev;
 	config.sz = 4;
 	config.dat = port->base + GPIO_PSR;
@@ -525,6 +523,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 
+	mxc_update_irq_chained_handler(port, true);
+
 	platform_set_drvdata(pdev, port);
 	pm_runtime_put_autosuspend(&pdev->dev);
 

-- 
2.51.0



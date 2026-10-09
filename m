Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2955BCA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 18:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVHyCJ4uAcDCzln8UtPn9NMnTZcZeh0H7aLRQ6pnmcU=; b=CWIB+dd/KGvtLMxhgPYXgihprl
	8tTPDIUk+kteD0cp/+FCHg8+BXSZIaZYqdr4U/6AdwWp6pYo60tfzPhLinzByAz7HxfiBxA8ioFFS
	WOP76NsgD9vChsntXX2dXejFYt8TY7cWwhrsmUs0alxYLIAEpJtuADotw15+ARVE7Pd7SfF6p3U1V
	PNAHwhrgAAQ5Rd/lkj26oOwCzzt/MeFFZGfl/FW+YyyQhcRVfyvQa/YCPhsJHknR98bKklYz9uqBN
	gmDsDIYL9PANi9LZhTiWi/kW2mbpqiyJuv3UL2OLRiot/TYWXpa8LAuO56lq6bQ/Y2fRYxNE1A2XG
	12jRCGvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFF1I-00000006s5F-46jk;
	Fri, 09 Oct 2026 18:08:36 +0000
Received: from mail-northeuropeazon11010047.outbound.protection.outlook.com ([52.101.84.47] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFF1B-00000006s0P-3CON
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 18:08:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dsa29TWuBxMky562jStV+TdJ2jDQ87fxDYV2cE5LGaUimAgqpfbN3gP0PArqj2Pavs7J8Ug4stpb4kuqH1Ptb9YztNzCfAsEssIpPti+S7fgQAVw953ppPs5yidZ10X5Yp89L6rfFFY/BfXYv0Pl3Xx7wE1YM7+68O+5jqXE7AnFn7UfA0Y++UntrgP/X51TBPX4OQpNNmoDYTtKtBSxld+DOXaPdEalkpEcef3j2YzjI7AozDLgvgXgxK2i9O963pYowdr1T/ce6hoR72xIHMvyc+If4xkN5zhaVf7VRaaLHFKTD4+tYwOLgPY8NR+/EOLkZpGpJcvNKCWHKg1F1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVHyCJ4uAcDCzln8UtPn9NMnTZcZeh0H7aLRQ6pnmcU=;
 b=WfcYYYe21TmC3RrdvjjlctYVS7VH2OInlRgAY383QTEE3RywFmyTq3V6VOsMi8g66Ey6/Z/eWkhsd6cQBXAxeU91JrRknLOP4neUX5/ZjCtxCS7zfAaaChhq5yQsUX/vZmdfPmrMzs3OQdZ/pJeo2SVZVIycUTkbwhMfjq6oLfaV+x11PcvyiW4neMIwfP9juV4usTckng0bars2EUZF78cOZGEPEcB9ehfBZDCfnDOag+R9tEXLhBh3WnnPrtToILr7WUBz2e4TVeBrwZW4g2B1Qc/mApmBjZ14ODxAvuYd27tZbBBXyPCMHEXghQRvlOpWnzz8zYgf24CKRqAC1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVHyCJ4uAcDCzln8UtPn9NMnTZcZeh0H7aLRQ6pnmcU=;
 b=tTk+Epj4Fz3Zz6CGWgTGekR4sJZj7uKo7YYHyVAsx3ooFOL4OgwbUg3G9IjpjX5/P21Ofs6qPktcy/I9b2xJNvucXRxQcOqup2susp4AeVBZ5+z7+LZTzboHAgkWcfTRcbZ3qQAYmYCRtRX/ujH/v6WE7dnBp1zKVHrOMfmjYkSjX8YW0BXCa4dmebUlqDPzC4RkZQIioqLTyPmaLnxXWf/gz3c+wFYJ5f8JH2QlY6MkWxRvBS+MkEYVTxz3I5DZp3lu2NZevSnAmpdGYn05x0qZ/zUgpoJscseZ9oGHLI8qjeuS5HQKtpqKspyBwJUPs7S1w+oi1/Mtw++vtGMw9w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11189.eurprd04.prod.outlook.com (2603:10a6:150:27c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:08:26 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 18:08:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 10 Oct 2026 02:05:22 +0800
Subject: [PATCH v5 01/13] gpio: mxc: fix race between chained IRQ handler
 install and probe completion
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-gpio-mxc-cleanup-v5-1-1e59e6ddfa00@nxp.com>
References: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
In-Reply-To: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11189:EE_
X-MS-Office365-Filtering-Correlation-Id: b719e2b6-347f-4cf7-6e77-08df2630509a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|19092799006|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: JJi6he9m+Nrq9sEk/9IaKFq39lOcMnDhpRVecNBf07QC3lRbDgkrDHFXngYrUQ3QMNvPcpki0GRd8TzHospL7ff/IFj/GWsM/7kF+eaZ43Uw/6KY65EYRkS9yDf3NEOudsNfTIlrkND4hgft7hHERC9uByLy9e9BeHZXaQpr8+YFGk1P9T0VydOkHM+4ER37er0VXXiKUgLtDVx/+ghbsFQMHxukBOV6EfTNxIFprXWiZeaRKMH3McSYXhqvxZ4leINU1VejwFxFY6R1cxBABYqeoXqTbyAaashTKVdkZo7EmuApOvlcbJbgOILcebIDs9LEL/mz2VT2R/d6u+2TU1G3ydRnQ5rVvfVa/H9/6MZYnCniUoIhQykqAHf/dleQeod3I6J6hqYH70dVdxFqSzJ3MqKY/wfkWa3IQsOPlSb7X+OVn1IO5Ay/8trIEtse0FTBy0PoklCs2iz1k2oXeKv/wP4ZCgcgOB7iNy4mNXYBqaFOmczDra15+pj1mqNRYCM7DPNQ7nFVvG7IASN/lzFN2kcGPOpZLHFCgM6J0DirWFy8hlnFt4rMlGYHEmomfIpb5QvJGt08JEh+8Oe2SJZgBBn4tdueXtfDVtE6iOz/k3t4TrCc4Y6fH3e/gSoSv7Wn5O2dKWP+GhFWt9Rqi9HVYWXx+5LawaLkAPyP/Fg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(19092799006)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmZhcm01OGxtYmRjK3J5eVJzUWplb3doMzNKQVhQYXNuTk5rRWJrbmVaTXBY?=
 =?utf-8?B?TGxqQlJQam85cnNkZkJuQkdMSXlYcXhxaGtOcm50Y2IyUWcrbjJpcVl4T1VO?=
 =?utf-8?B?UzllZ0VVczcvdVNOaDVDTU02Yk5NZFA0K3lIZUZyc3lCRnR4YlZtZ2YzZnRm?=
 =?utf-8?B?blJKWGU0Ym9KekFtZDBJVFE1U2VCa2JjZ2hrd3dXNERmaGxEYWppWTZINTRF?=
 =?utf-8?B?bE1FMUI2SUpGWnAveXlxWXNuKzJvWVh5T2pXeEY2VlljNEJ4dERocVIyMDZ3?=
 =?utf-8?B?RC9aN29QRGVzK1VxZHgvMjcxNkR1M0VmaE1RL1l1YXRKUXNYUTRzemRPMVZO?=
 =?utf-8?B?am1qeEQxM2NZWU9hSEo5M3dGVGNvN2ZiZmI1MSt5c1J4bXZRQUZOOERLVElG?=
 =?utf-8?B?dFZSZGliZHBBNXB0cjlxbnpNVlNGWk4zeGNXLy9ZQXk3a1Z4L3Bxb20raVNm?=
 =?utf-8?B?SnFUN0ZPSGlhZEk3OFpla3k2RFhNdXpEZnlIeVNqb1lzVXdKYUoyUFdhNkFk?=
 =?utf-8?B?NDF0c1NYN3dqeGdqVkxCRzFadHNGd1BFZmJlOUxhZG9TZ0ord1FGN0s3dmF0?=
 =?utf-8?B?WmRmVWE0NTMrNzB4MXJFbzhzVUhIT3NGM3VtWWcxS3NFL1hyV1h3YWoyRzQy?=
 =?utf-8?B?SEJCZSsvVS81K1Y1VlhDdFNDUUVGVytBVUJIN29zSHBRZ0xVQ3VzZXA5VEY4?=
 =?utf-8?B?TUVOLzFkNzl2ZTBuc1gxMldNTy9DMWwvRkt4ZG5KS05HNlJsSURLUmxmeTZN?=
 =?utf-8?B?MnZ0QkNoMDlrVzFyVHNycWpvTDduYVNrY0QvM1pWQStubmlLMEJGZnB5Wmtm?=
 =?utf-8?B?KzNTMmQ5MkRoUjBvQTVob0M1YkNRdlAvNE4vVGQ3MmxQRjdTNk1PK0dtYlpL?=
 =?utf-8?B?VHJVQkliRXQ3WXhGUWVsYk8xN1Y2VDVKeXZWTHYrQWxJZktjdzNpVDdoZSts?=
 =?utf-8?B?Tkx6aTgwcnJnRjlkMDlLbk44eGhpd2hPU2I5c3BVTlhiOHhrdGVVTEZ2MHlC?=
 =?utf-8?B?dVUzRFgwWm54NFB5MGhwREE0WlB4UE9WS04vMzJkd0tJV2J2L0xBdGJNK2RQ?=
 =?utf-8?B?RlJ3QXkxT1AvSWozM0QyZy9vVjJ5L2NjNllWdnlub0d3cVNjWTlCVUZ5UlVF?=
 =?utf-8?B?OWtYNHJ4azRuaXJuUkpNeTEwNXNVc0VTUHphZ1lTQWdDNXJjbVI1cE5tdWFi?=
 =?utf-8?B?T2IvanAvWmZrb2lqZkw0bDVjaXFReFdOWEZyem13clowSHVNNUVqamhrSnhO?=
 =?utf-8?B?R2k5TTVIMDk3RnlLbjFiS0xJQkZ5RVFYcmxzemZGNzdkazFJRVgxM3lhNFh5?=
 =?utf-8?B?d1Z0RVFPWEtIVkhTVTErUzJHcHkvWmVmZ0lhbi9mWlNIeTcrZHY0UkRieFBj?=
 =?utf-8?B?N0ZvUVpyMHoxeEREK1hHYzZaQkxxMm1pNXJnaWVKQ0RZTHpxeWZHbFdIUGYx?=
 =?utf-8?B?emJwYXZ6Rlp3S2tmaDh3RW9MbVFsblYrQXRJOU53MVBXd1Z6L1Iwd3plejhP?=
 =?utf-8?B?N2dSZ09XdlRMVlozSGx0ME9wZ3g4cTBCWkFNaXJRbkNmcTl5anA1bHlEQUwy?=
 =?utf-8?B?cnp6T003YmhTWCs1a0NYWTRvaDRhZklPZ0lhQ25VQW1DSUxMZXJPc0FUby80?=
 =?utf-8?B?RSs3Y0QxWU1jYWgzYkpCbnR6blVHcHpQKytzZi9zNmpHOVMyWXhJY1FrSG4z?=
 =?utf-8?B?M29MZDhhaUt2QnBrR1g0RUQxUVhpbmxldk10aVlYRVIrRUlRdkZQZGc4VTJE?=
 =?utf-8?B?bEFpWHFiMXA0dzJocXRjQ3BDTUZXSzAraDZqNVNveU5XUG5oRTZYUGRCQkRG?=
 =?utf-8?B?Wkh2K0xjcWpMeklGdUFXSkRBZmcyckRhckVTTkg2ZmJTMGJBREZlYjEzQVVj?=
 =?utf-8?B?WU1JWTY3RFhncWh5dXVieFFRYm1Va0Y5ODJIb2VKRkxueUt3OFFlcXh0Ri9C?=
 =?utf-8?B?ampsTU84cmZWV3g3MGs2cEd5bENHYUdnbzQwdEYwL0ZlejBlTTdtUUJVM2E5?=
 =?utf-8?B?YjhETEE2REtEUVJicGxUbTl1TU9JaUwwU0RCeFk4dURtKzZlVjRjUGh6aXp4?=
 =?utf-8?B?YXVVUUNqTlNJRk1LU2sweG50azJUMmVyN1BhaVpJMVJ3dWVqcmFKbEJwdGl0?=
 =?utf-8?B?Wi9kTHRRRmg5OWwybFl1MWRxcldEL05VNGdGejB6aFZZRkU2dG5MM3dNOXpx?=
 =?utf-8?B?cm1LenpvR1RicVlZdVF3T1R5R01jRTg5Zmg3eXRtSStQczBsdkozV0pjR2Q0?=
 =?utf-8?B?ZVNKWGw4c01ZMVFLYnllNlEyZlJMRkZSM0hUQnhyOTJ6a1h1UmVCUFVxUlJG?=
 =?utf-8?B?Mlp1Z1lmNE1NeVp4WiswM3BFempDSjhsR3dWaFpWZVBBZkd3SWk3WnRMc21O?=
 =?utf-8?Q?2+vHJ0ugguaKZYsi7V5RPlovyXGJNqQ8vlmgs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b719e2b6-347f-4cf7-6e77-08df2630509a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:08:26.5119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTSt4yAmSIUZVVP4EzaoIJ2EAa6/zqtiZoRNWr2pH2kkUOjjc1Mg7Vpg3ccRkiTlxAeRwPvy4SVb6zR54cFD4/W0GLOtrI7ATQhhYg6/WffERf9ytibxPpj4IwkUF/9d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_110831_593126_373B3CA2 
X-CRM114-Status: GOOD (  14.47  )
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

Additionally, if any of the subsequent probe steps
(gpio_generic_chip_init(), devm_gpiochip_add_data(),
irq_domain_create_legacy(), or mxc_gpio_init_gc()) fail, the error
paths never unregister the chained handler, leaving a dangling handler
that points at freed memory.

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



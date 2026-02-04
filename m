Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BD7E9D410
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 16:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmEkU0S0RXIa2OOogZkY6h6TokXUwmUoWTYCwxsFH7U=; b=dd3cMpFW7xeMAbophsPdzRn1CN
	DMcSHrQ3St9XXBCTUK8p0rZ24+pG+LOkzc6IiKQ5L7goUbCvxJNx++9FQn0MOaVv82TvR3/+hWRDk
	ltWh8KQtu8EoMeFN4oNQ7MKzWUYcYvuIPhu71WclKOES4ez1MW3Atoor8Ir7hNkAKOi5KMq4bpQTj
	iOS+pfMj4F+NzdBy5Bv0xYWhAudmKC/609//b9POb1GpFkHAMS+EsriFt4kaXRHSS4CfHzwVtY528
	4Dd85L6JdUUiWu33GK9Nck/E8HbMiw05mdgH2p+taztUaaGJ10VHhi2NLoLddViFURheVGqRO0Mp3
	GBrZuaew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfsW-00000008lu3-482s;
	Wed, 04 Feb 2026 16:37:20 +0000
Received: from mail-northeuropeazon11012009.outbound.protection.outlook.com ([52.101.66.9] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfsV-00000008lt9-02lK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 16:37:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqfxffTCP77FcEAj9TpyHfYKHD0YJmI6nIwgbIuFZdatKjAh+LUmlU1w+VubODVdGbv9Oy9yqywCWOi9UL9uIo037zDmlRQ++9LXMt3ZPa52XWwqvq2FTZ8OIV0rJ9dOuYjIGJgNIT/Mkpp6Vk/q5kfeFY+4fRmWgH2PNEz1Nbp6mCtfIEg6ZP+3WvYi4G5IN+3Wu0dF2Nzpq///8AaJhGzZgsd26byp2abEdHpYxTOCFkBxB3yqFgdGAfXR7qdAzM5Ktl9Th9Fm+xjQCero8qQEWymnEH+Ty1xV84uekSlZHhr0LcDfJOfozrnZgXJTvii/o/Tl2iTwR/cC4/8rCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmEkU0S0RXIa2OOogZkY6h6TokXUwmUoWTYCwxsFH7U=;
 b=DUJUfpgWRrN5pfDFYCXlOtdIeYWkjsPEPft7KUKOJ5UaOqqA1KCzS+Yr062R36JxqIQO1xMOJ+TFb5fewj+u5CZe4gCpeVg3ut6lnJXJp3IcpVgu6ztboVspzbFhUHr99a9AEVzcQNmlHN9hX23L4grsQQaeg3UsxFPiFqhIQZ8sh0/oyZinV9jAyu4uZvKXiNbvVspXcMymU49fiP90PRR4DitBNYc7gyg33+j4RQX7zDZT49RBEPRuLrKMMmCTzh0bJPm3ehy7QTGuEH/eVETWSZo2Q3XUSUbZejSyTXy72UkB7WXN6EKZlBZX/T1jw8sD7H/+ZdnTX4lqjfBd4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmEkU0S0RXIa2OOogZkY6h6TokXUwmUoWTYCwxsFH7U=;
 b=oGQFDTOJ7Wz5e8fR5iwY+gjI+0MGkaCJQDWP5IMA8QHmCc8P+3k6Z4S3OKmoyOx+tDKjuknnDgUcXi8ZX/SPg5BkMuKaQn4UtnoEyolXh1qBG8znLz/YHj6yRfqD6RURXdNxbDw2cTtuVfaVQuBGP85aCnv0e5lmOt8lF848IpojC9QqkkEOFSfneIicJWuqog3gmuEHHusR3vTBEpHNKJYlZdVJ3MhkkeJfmw8kQRQG6oePA+m1i6RcHYfeAlXV3VJZWrARfNwh5NDs/E/iwegSGiSYp6BNxX4nBOXOQkW1V5zzlv4qXsi6pXrb9k0nYQILXQgDDp8Z2N/G5m0W+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10566.eurprd04.prod.outlook.com (2603:10a6:800:268::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 16:37:13 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 16:37:13 +0000
Date: Wed, 4 Feb 2026 11:37:03 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
	tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 4/4] ASoC: fsl_asrc_dma: allocate memory from dma
 device
Message-ID: <aYN1rzjXkot0MY5N@lizhi-Precision-Tower-5810>
References: <20260203031345.3850533-1-shengjiu.wang@nxp.com>
 <20260203031345.3850533-5-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203031345.3850533-5-shengjiu.wang@nxp.com>
X-ClientProxiedBy: BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10566:EE_
X-MS-Office365-Filtering-Correlation-Id: 0abd5696-b186-44b4-c604-08de640ba69b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z5Z3xDnMHrQ8/UPkjEuD2JLpy85XWKEXYE4QelQm2JnRPIsPvTi0NTXLUD/S?=
 =?us-ascii?Q?vQvSaQosR2vGR+FdlloZZNN5x/pYBLnebgW7iQ8IQ+4SXrhJ7fb8LPVU0jee?=
 =?us-ascii?Q?ueTT57D3BV4uWVbpL6589ruaEB4PcDTr9/aD2nBChvhOd1QOBLaAGrWusZs5?=
 =?us-ascii?Q?zrvfaV5LCn4KJ16cYavuAikbJyjWMmB6j2pS/XvrAuORfMK6s8Eyl4+RRDpI?=
 =?us-ascii?Q?24mgzwT9wLwuruTVpDYU++CG+2RXVQxIXVaYsVuDrgL1HlDMjbGqvsSMhcll?=
 =?us-ascii?Q?twNeGZQIV75FvYkqF7anenFLXhgSdCCmNzMHJsczxEqKIfSynLmHQ7ftaCNK?=
 =?us-ascii?Q?S7eviuijcaQVJWCwewGkiB7DTAf7AKbzEATi16nVcFfizrpZkzqkcOT3R2hn?=
 =?us-ascii?Q?uGBki/m/NW1rZdKbw2xvXny/SLEThtNF5VXmQXp/IH4E0c47vg+EwNeUaydQ?=
 =?us-ascii?Q?WuL/Dv0883w4AnCBf4jXevEEjSe+EWX6zk6qARq4fqW05kFBI4tOLwte0xPT?=
 =?us-ascii?Q?I7jLGSLtoCELn9uEPYd3t7DEFpSYTdglhh61ogkQuOzpkakJd2JEmslbobjL?=
 =?us-ascii?Q?Zx2D1AGP7XFoXbVNQ0MO2CKqXAZweIiIWiMlQ+fwwiKs5T5pwAFLr2j08KUB?=
 =?us-ascii?Q?OmHXE++LITY85xs6sdU//+5OeWV0Y9unO3k/MFoi51sA6/M60+wurJfRRK3p?=
 =?us-ascii?Q?a+uuUMGvZGvdEjqLNe954s18KUdwG8BJ60N2wkpksHWUMsxgOcSdGabscH9s?=
 =?us-ascii?Q?8dK2daCLVoTBCxPxrEWdW5z/Ig1YF8lbN5t7/Ez+9dOqiXLf5ppfk74aCoy3?=
 =?us-ascii?Q?UWm66MncN9B1bvc5AIkvgSF7FY8dGkKf9cGYfzakmIsvKKw7ESV+WU1S/QAP?=
 =?us-ascii?Q?3fIKMm6PoWifs4ZzPv5nEoCo9QwsOPk1DTg7gFATqSYyOEqbO1Awwq5P1pap?=
 =?us-ascii?Q?eYvp1ca5IAVkNKUEf/LyOPF6/trH1vwUIfJWm1uyVrqW/QxwvSSqqfGFxDQm?=
 =?us-ascii?Q?NGWWOGz6JaJJ/aIKLTl2isciwvQpO7MaSrW5S9gDiUlF1Ot2aowLN//JGmVz?=
 =?us-ascii?Q?H+w8Ui9R0WHhT3/KWLs6uTYijnK66DDTM70FE2LeGuQYJ96ObZdPaDXXuXjB?=
 =?us-ascii?Q?45h3FHXvRUdD0BrhXJsgE2ttWjbc6DlR4peAYiwQAcXDqlh0/MrBVTrVBa4+?=
 =?us-ascii?Q?uJTznVw8pe+rdZPl3gWs+kgafopCtQHW7+9MWLeQyq6j1h/Gh+0zqq65rJNO?=
 =?us-ascii?Q?GyxzpgGvrbLB4rz6OxeIM6EfHEaQT8ZwDnWj0K7inntxZwQ3jmWnMXDgZ+Gk?=
 =?us-ascii?Q?++tv/KtcPXJEvGzxvjKLBRxziWkuVAqqmG/6om2yfSPLF204wNwRA3rKa/2d?=
 =?us-ascii?Q?RkAmYM4YVFVcIqS8iGW0SrRovY66koP9oufPmtaAg1iWHisZPIguJRLTumvx?=
 =?us-ascii?Q?j4EkuT3eb6G51Lop7bj/fbomK36S3H7xf8Z2CErt+1lGb7Rst/Ma8DDd4RsX?=
 =?us-ascii?Q?WHr0uK4IWWMnRmkGcASYs7cFV/43yf1/wT9Btt2/ibzS9qK/GYi3VHtXyAQi?=
 =?us-ascii?Q?JFC5ZI3lGHAc1cz1m3R2hQp5HlNGfAj9LuT1KMJjDoquyKSOEcEO8Gp9rYD4?=
 =?us-ascii?Q?bByWt2l1xE3X2u0fTy0M39E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VbPQEltQY0IC7Y0EUF+urJC4WsNZPoLV8t2UWVroO82rhI4JUqMC4C935Vgm?=
 =?us-ascii?Q?D66/U2C+c0111m/UniESkW4Bak0/qSHnxlJH2Vf+brSlGks3gDryARLkf92g?=
 =?us-ascii?Q?AexSgz2Yqd2p8suaCMHalOd7eTGtBCuEe/rLijkpDKz8ZG24ffyDdLM8Luul?=
 =?us-ascii?Q?t/TfWvKgQToZeeWEtNPKgIFuBbqpgTEvjG24t+1cxCIC+adgRiFnUYuXHLVr?=
 =?us-ascii?Q?MoMosXJS4Eeb+uaAshrAmZKhq8m0cZHdsqvbjGO9h5MB1wdadtHjw/Sd+95a?=
 =?us-ascii?Q?+3vxNhheAAG71SLN2ZKxPdORe083Ka1Z++sh6qmg94TTJWt0gEH1Gb7jgKOe?=
 =?us-ascii?Q?0FvvLRNtZMBut+asHU9pkRJpg9buNDL7G82ZqVQqQZs2iMB9zgAcliLd9Cxd?=
 =?us-ascii?Q?ZrwYmfbzk8Ets0PysHT1Qu5/oq5hjXn0bPwYMpfDimFDULubJ93Gd2G/6LVe?=
 =?us-ascii?Q?woe17bA6aolH63dGHLZQbZwKO4X79HTXBD5zXfyKBrkz5qy3Ed+LPNnOSDLI?=
 =?us-ascii?Q?7LSldQnIN01rCk0sT85W7UcW0t+8hncnOsKoMpiLjvsyeGeDlF4fJCXyWOAV?=
 =?us-ascii?Q?5HRASHroqP4LjEU6JM5dxwTSdhqTF6zUAzpKUnxEu8r5TkeKHLAaA7ffGZen?=
 =?us-ascii?Q?rwc/TeQMphSl2TTfA6La+BDUI0q13b/JadE3VbAIF+Ns6prhREUFxKQnKsP5?=
 =?us-ascii?Q?qSA7eUnjlCg2ITS0MU/EUb4QodJ/Y9dkywtCibOgfb3xoftUz64WA7spO654?=
 =?us-ascii?Q?q/PD9nSt0PuLm9qM1deSJTYTwDrG3UCkG3WK25u1cGNQqHyfirLHrch0rRP7?=
 =?us-ascii?Q?bXtAEsvNsGqwBL0ZOZ3vH/swX/sHLsLS7h3Erajyew6uSnD93NLGk7Y2tRgo?=
 =?us-ascii?Q?R27MTstkpdvhfXfng2dIingdN2o/T6CKRH7ZO95zGL5wEQWAEyBG60wr5lq8?=
 =?us-ascii?Q?DOrSfMofM4wrAzk4+P8JPLd4rB5vpeGwntDcd3qTSfmQhucLh32bT6MInY+Y?=
 =?us-ascii?Q?GSo9H7X92az7Yl7e72VruSAY7kHxXFbvDP6FCtD3rBHMC/5/ybvUalWOSOIJ?=
 =?us-ascii?Q?a4uN2Qj0DSM5QbUKRDBqazsn0RMEu8QYBC7KJ+Q8pZgV5yGLf1lYGha+xTc3?=
 =?us-ascii?Q?fQVchIbsybejN+kHdqFN3egCtxU/3AmKMwGvBjafpM7PG9S50hHqQgPuio+a?=
 =?us-ascii?Q?DdSkCrFh15SCeJ0GVatJcspBOxSeiVSRh6WtGU0/v2TIu0LXS+YAoGWEv/ls?=
 =?us-ascii?Q?j5+15ggolPZuSw23cONSXwSS7JFtzke21OF0ZJOuQ0UZZj2/Tfc6ZPkNeNGQ?=
 =?us-ascii?Q?gY9C9vI8X/Ug/3VoLTLXsWYgcfCcFKJeWG/oHPQHCvMBLTJNTeXWxd024iNk?=
 =?us-ascii?Q?1xv4rGw8sBCMqYGyZ+NlKvlHSnUuEhiwIOO2XJzpwKnsbx9aiwL3IreiPU3d?=
 =?us-ascii?Q?4VXRqdsb0ycJ0WlUhuFnPTVv61AbSbQ7rn7AjAfiGrMIZT0hHxGEr9qXvF68?=
 =?us-ascii?Q?npm/8egib/WFjkT6gGJSKiXzXtAys6shoE6eVwYxIkNRYtzO1l8cmpoxolUM?=
 =?us-ascii?Q?gM92nWzTv2qgeXXEyq7Ohuez6nY6SET27c1c/7KhBT7HIWzfQqP8DgBsBoG2?=
 =?us-ascii?Q?Wgd1dmq16c9WDWeybm/b/9P6rsCX83r+lDgTGOEeeYpBN3TmG2zEy17BUqrP?=
 =?us-ascii?Q?Nuv/jGGLE+8tNa5HXufxzU8XEII1K2+8pziIuPX+fjLyKyxh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0abd5696-b186-44b4-c604-08de640ba69b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 16:37:13.7411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvoGia8l0B5w43mc6cVPlcQX6Kwjhz8FsaBrnM6ADZ0mtAGYwuzsg8BGThGOsGvbWpEnYkDNA7ufdJ5Ff1ZJJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10566
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_083719_055441_C6B1C660 
X-CRM114-Status: GOOD (  24.92  )
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

On Tue, Feb 03, 2026 at 11:13:45AM +0800, Shengjiu Wang wrote:
> The dma-coherent property is used to indicate a device is capable of
> coherent DMA operations. On i.MX952, one of EDMA devices support such
> feature, in order to support the EDMA device, the memory needs to be
> allocated from the DMA device.
>
> The code change here is to make this driver compatible for non
> dma-coherent and dma-coherent dma devices.

Make this driver to support both non dma-coherent and dma-coherent dma
engine.

Remove dma coerce_mask_and coherent() because DMA provider already set it
according to its capability.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

Frank

>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc_dma.c | 48 ++++++++++++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index 7dacc06b2f02..348b0aabfa68 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -449,18 +449,52 @@ fsl_asrc_dma_pcm_pointer(struct snd_soc_component *component,
>  static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
>  				struct snd_soc_pcm_runtime *rtd)
>  {
> -	struct snd_card *card = rtd->card->snd_card;
> +	struct device *dev = component->dev;
> +	struct fsl_asrc *asrc = dev_get_drvdata(dev);
> +	struct fsl_asrc_pair *pair;
>  	struct snd_pcm *pcm = rtd->pcm;
> +	struct dma_chan *chan;
>  	int ret;
>
> -	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
> -	if (ret) {
> -		dev_err(card->dev, "failed to set DMA mask\n");
> -		return ret;
> +	pair = kzalloc(size_add(sizeof(*pair), asrc->pair_priv_size), GFP_KERNEL);
> +	if (!pair)
> +		return -ENOMEM;
> +
> +	pair->asrc = asrc;
> +	pair->private = (void *)pair + sizeof(struct fsl_asrc_pair);
> +
> +	/* Request a pair, which will be released later.
> +	 * Request pair function needs channel num as input, for this
> +	 * pair, we just request "1" channel temporarily.
> +	 */
> +	ret = asrc->request_pair(1, pair);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to request asrc pair\n");
> +		goto req_pair_err;
> +	}
> +
> +	/* Request a dma channel, which will be released later. */
> +	chan = asrc->get_dma_channel(pair, IN);
> +	if (!chan) {
> +		dev_err(dev, "failed to get dma channel\n");
> +		ret = -EINVAL;
> +		goto dma_chan_err;
>  	}
>
> -	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
> -					    card->dev, FSL_ASRC_DMABUF_SIZE);
> +	ret = snd_pcm_set_fixed_buffer_all(pcm,
> +					   SNDRV_DMA_TYPE_DEV,
> +					   chan->device->dev,
> +					   FSL_ASRC_DMABUF_SIZE);
> +
> +	dma_release_channel(chan);
> +
> +dma_chan_err:
> +	asrc->release_pair(pair);
> +
> +req_pair_err:
> +	kfree(pair);
> +
> +	return ret;
>  }
>
>  struct snd_soc_component_driver fsl_asrc_component = {
> --
> 2.34.1
>


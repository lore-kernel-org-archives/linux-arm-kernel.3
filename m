Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA9BD41D6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 16:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXobp9gUHWhx1MooJME5Rq99PUBdjI3IYkYdYt8qg+Y=; b=CTw3DUIBxgW4i9xSnCk2/snAZ3
	vlXHDHS5FIl59hhB0Oias7j6uliySzSYtfpMvOijSLfEdDZ3+bqP3s2nRe74cjDcexmZLu5uSZtOZ
	lzpEroCCX61ajGFI61eX3kf0BFG2s4qyleuK8BhvQhjvdY++8sLVh6rZHYdjIz6GaKzvK+BTx5/bZ
	m9WqfA4AObkSOloAagTeNiNAUlZLmmlG+Fod5lIQGURqrWDcxyyhFpzFxm8YUPptk5zMOnEv8XrV5
	z08EluDfB0zYVIBUQ8d25hXAZlG3cl9N6XWU0ZSjujbFdSH31L34I6eRMjd7F2ojkPlbTWx+pnaab
	WtDthxyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjyh-0000000Gzg5-283U;
	Thu, 11 Dec 2025 16:57:19 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjye-0000000Gze2-2ueZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 16:57:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUO/xISKEWzBJdH527PkMAnBHvKxPYsZHYfA/DlLRTLj78RTeCTXSRur+rSHz1/4xLS89xtreWw5/M3lpUgT8d2I36BCAhrQacIJr10CTrF9zv5mcnvm9s66TDbejCObvI1dbR5Z8ykv4+GH229p2Toa/CVwpU747E8RNE/pIi9+/TRiWK19iprT/UuyRezpt3J4s58oVEVK9tdM4MmCPy8t3oFZGwTSy8LPCKD5uC23eyUYvOxRsUcuB8FkJTo7wZHd+VNMextn3ytDKmmiMh39CArUZ882Rp598ADXYzE3exuSBLwOvqu/IA6cTmPWqrw0N7PlMdqFVBtx94s1/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXobp9gUHWhx1MooJME5Rq99PUBdjI3IYkYdYt8qg+Y=;
 b=uYrf8wCTMznrO0owhxyZRaWVqcI3GeDvk0WG/ahqt2IYTPQZWSIEo+vKOahcMxFyEkC/nlNACT+1PEV8e0SRASPAF2KaRF+YCgPVOxJIPk1nYgoXtZC+sFEZixKvHUY4QW7W4EUBcEaufcayCuycyIeZFZSlBkg/jnlSseI4GXZTkiLjex5hxnuCrsNwXREYOxJ9U4n4xJvOeF3frU45kwO45NkcTjNyf9Y/TLkP7AJxFAMZ+QeTjkmr/dhYwfycqM1HIiw04IsclLAz+oI8sm494ukjWa7gvoIn0QUEYZZqlOd6CtrzEBfjW5Ha8Kbc0ruFC0Ox3EgemtyXrHLu3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXobp9gUHWhx1MooJME5Rq99PUBdjI3IYkYdYt8qg+Y=;
 b=J/p/4xMp2/HY2KxqAKN6zDq59JnJ3Ae4tBPorxjx57MlLUeohTX5C+/n7m0fISHTI1OaF1o3TUN3KaToULq8JwTFU1qKI0yWO3iLPHDX6OECq6op3wpfHkG8BzHyOBZ5PRRCMvTKOJegpGS7WU3qfK8OxOXNQNcp0vHflVTzjh3Q6d0X+eAPToIEVvps1kcLiem+E2HNh5J/YATyKpUNnjnyxwMGyNVvo4e0PNGMh9BloT9SbLAz4skeBpQHGFVk3V8UOEOTp4WQNqNdzLMp3/8n+XfLbt+KSLBETFyN3ZkeL/9rhzsxLCu0rUOuxABmKlM4J+4/bqy9vkdKNrIEpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PR3PR04MB7449.eurprd04.prod.outlook.com (2603:10a6:102:86::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 16:57:12 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 16:57:12 +0000
Date: Thu, 11 Dec 2025 11:57:04 -0500
From: Frank Li <Frank.li@nxp.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: ulf.hansson@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4] pmdomain: imx: Fix reference count leak in
 imx_gpc_probe()
Message-ID: <aTr34BiVU+xPvuq9@lizhi-Precision-Tower-5810>
References: <20251211040252.497759-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211040252.497759-1-vulab@iscas.ac.cn>
X-ClientProxiedBy: BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::7) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PR3PR04MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6b365f-5434-4aac-a0f5-08de38d65421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a/r5yqq9vNqgwglLzRNOIu9ZmtDxl+V5UoWfaDbXOEaEYpy/XYfceMMrnYwm?=
 =?us-ascii?Q?D7iiL/6HJM0W/Nx9jJb0V7K3Q4uQ0rZkbh8gKuvRQBXoXuS4muEGe0OeVC58?=
 =?us-ascii?Q?Zd4LBp2spIsLhOn4IUU61htG6143JK7bPlTEP8TA2xGNgod2YMVVyjMj4pHY?=
 =?us-ascii?Q?WMXrsmMfdxRvlJnmrpbQ2mNOgRLxvDUJTQA1Dkt2Is2MH5CSlKhBiR9YOia3?=
 =?us-ascii?Q?wC+BoGY723j/Elpm+VBGm6asgTzBzB24L5z3URrtYWBig55D9rC+6hXEW+CW?=
 =?us-ascii?Q?BiryBuudvCjYdfIbY5oX4OqDQUh0HNJypNdDckQEs1QaJcZ2xHD0dy4br1v+?=
 =?us-ascii?Q?CJw1VvGkeH/q/MHMI1boxET+eGS5SRf3E4JT+/BbdmMKW+PBWu+ObE4sXw9b?=
 =?us-ascii?Q?0ppq427zCDVSuSrEqGhSYfGHEypeuLXXKQ4nMjM9qFA8/Mcw0cAY5u8rkX4k?=
 =?us-ascii?Q?vRrNKsmjJgZUSoJCzEbsx5yxfaEfKp80g2Vfm+6nJQJF39wjmjpbt3Ghscwz?=
 =?us-ascii?Q?DUwhB9GDzSQWSdO70kWDGPB3HuHd99u3cElAEDymJIL7waSNCe+NA/zy5o/5?=
 =?us-ascii?Q?b8NqIq00xowJUEniTOFZHeGTFvdQ7+DxeVugLkFES/wtTBbHCEtDxlmpgP1s?=
 =?us-ascii?Q?U4YjrX1TBOYyyTwtkB9ZOFTDt9osd1CeZHP1AUlJIHrorUlOUh+QeuJ7P5hW?=
 =?us-ascii?Q?DOaFAZUjTnSOL18CGUDRlpQsxTiPHwFeMnUU3Z6i2ePsbCVazmIKdxuU5CZZ?=
 =?us-ascii?Q?VLPEYdLeHjhLRByD/28+6rDsISg4Z7ybKFDNESQJeM9+jG5vfdc2kkSwtVv2?=
 =?us-ascii?Q?Y8TC1EeXxB73sgWhX62Vw8Dzk0qCpaEMFYfiLX8Nk8M8/n9AzrF/+YzS7MWh?=
 =?us-ascii?Q?rBHxRZpN6vZZttVZwbC2AabXXGzfy+489CJ0xBIbRegojY7YAp0cupykyDk7?=
 =?us-ascii?Q?5zKZ5+1LBaKT2BWtt7TsIGElK5GYHWkSBcsVnuRfZ6CQZJ56+0HhnTenOKHy?=
 =?us-ascii?Q?JP7q9b2Z8BMOFslkDvINwl+MEUT9MKQ3EIGkjlDrIH1Z1PffTqCArvQGBzLq?=
 =?us-ascii?Q?VLILj+9BYmyeQqlvr7ogFdlRgbtNtRjIvmT/vQAVr7/goAOw4YvjFKu8DqIZ?=
 =?us-ascii?Q?UQvE+9lxr/qPrLP+9jXItSisSjijvo6yc71nKi3k5vVwe5Y8x6UoHwXyE1gE?=
 =?us-ascii?Q?eiQb2lVhMFZ6RHoZLfR7LZ8gvpU6+ZMGSUt4MAmS9jV2IZODPlESxpEwAH52?=
 =?us-ascii?Q?x+T3mYkHtQxCV/NDiEDvWp16DSSOXbouim4GqULol1gzBkUU1qDtDRLfgl/m?=
 =?us-ascii?Q?W3GK8NU8xXfF74IKk6A0GZ4fUS7tAhIUTy3pMjiYKwNY6eURLboFM+GBoT/F?=
 =?us-ascii?Q?9YFkjt8ok9Q4B5Zgwk3pqIKEQnWD5TT1hoTyhbNOQGtniNzCifuhMbUutRhJ?=
 =?us-ascii?Q?PMP5Th/1kLLniKx6Dux2+c8w9oer4J9U5HiPft8GLgwEKUaEP9BA2UnWRCTZ?=
 =?us-ascii?Q?nILqICKay2SHfPITyFPWcmlXe39uuQedIOXo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hVyrHZvaKQWaKTymp+zokItvSjPWCSUzEjwwUiA+mPibcaxQVGi3IHPY6JSU?=
 =?us-ascii?Q?4VCVYkvK2MuA/oQH3EVu6YHCyJbMXfNAq7U0IwCVEY0+hX4OXa6mL6ta2VEA?=
 =?us-ascii?Q?aVjQErpX5GaE9HGXzq/X8sfBex1giWweQI1w7T+AABwfCIDyd8jmBEjUcj/P?=
 =?us-ascii?Q?v1+nQcf147zfz3l0f94Ym4cEoTTw6blHfiJRHW21HWFAoj28fFqbEpCkMVG7?=
 =?us-ascii?Q?yEOsGb7tHNmc5Ec9YAUYMcz4j7WK4QI43TQpVGkEi5pVepvypcaJFnwwx3t/?=
 =?us-ascii?Q?eR3VDlNeUUHUFDrHzPr522pIUtRwC68c358D4ceaZ9TWtQqlY8AJoEF0dfSL?=
 =?us-ascii?Q?hQR5gTFgU8bDcsFLKtY+KF2MJIEvJUZwLlEVFZ0SNoILR+mDoZEaglE/zpVa?=
 =?us-ascii?Q?eHtbKcznYsHWo9wN5IbJ0Pf/r5D8Yb3naGJcqW9BJKbY45/6j+V9P1OjzQBX?=
 =?us-ascii?Q?94pw1wWq6qV8w7W60q9fhXXU8g9s5F6QcMyV25AtarhgfO8WgllHusQz8L6D?=
 =?us-ascii?Q?3efY7DNXzpZlqBOdqE9UxJV7PYQnr3cSw9EzRtlPQv4bUfeJ1wQZBh/qX6xD?=
 =?us-ascii?Q?M1xJ4Ed5UDzxJv87HL/e/3phus2/fjMh5eHH30uVmeu6Z9+s5tpAdeNmnSDn?=
 =?us-ascii?Q?bcF7OukOe6nwWICk37DDN8PhU0C1bUzKinWASiwI7ya3UdLoc2cJB4Yg4GFF?=
 =?us-ascii?Q?wWLljdbcyMYkJgRe/NNcIyel2WgBOIDQ4wXYq6lC5Fvv+RdRTelGG6kxQIpP?=
 =?us-ascii?Q?cTETYhKqhUEkElHKixIJuepDwOdYWOvBek6w2kIWrgIxwYv1igl/CZBhujSS?=
 =?us-ascii?Q?9UGzDbvnhMqwan9/j7fn1eKZyhnFYUm2zzIJZOMf6hIDdimgNQa+8xc044Jf?=
 =?us-ascii?Q?+PlQa+OBk/yc3apqrzzh2yo3r9m/nfxoLtdwdTthA3QYFlpN9F/vFBBNQEFH?=
 =?us-ascii?Q?uvoQlnKXJtxjF2VTt2l2ufFcdsqz3rUM3bpj1u+WtA8YBsZBucuYYKUIXU15?=
 =?us-ascii?Q?T8X5Eu8tzMs9+5QIKCrGa0iqrLsq4vYMH7clT7yYAHhnyHGALNo3TOCKNdFh?=
 =?us-ascii?Q?5549s4BMq/zA6dxk5gWoTmN6QJRhuCL9Gm9P5Mac4KGUJJtXfdV6eCMmBjBz?=
 =?us-ascii?Q?BIb2rPd65XdAGwdm+dcZSHWbhVr0VlVXRqVydNEfgprKz6Qu7tfjsrTHPSoV?=
 =?us-ascii?Q?PmqLn/NFcpYOKkqucVDyED19gw3uQFCZ0ap3AYFMaIqQgTksVhdLqF6V1Svv?=
 =?us-ascii?Q?XVa8ruE3GXqQuh5146Crvz1fXz+UYCYx0SlRS0IQ81fKC+0XujL2qUPNB67w?=
 =?us-ascii?Q?pji12YyIdpUi8/kccTOD+kPu5t9HpD9WcbECbP2r5rLhjp5FPGZDx9nr0ZKa?=
 =?us-ascii?Q?teD+WT62cZerAcmUuDqv57qfzRqchuFYwxCeiV6NK2C/T7PFHT1kAJSnMvNg?=
 =?us-ascii?Q?VBtJLxfr0mwn+T43T79TA+XHZ401G/cvBhcWhi4ydHoykrcj+3NEVb0By0B9?=
 =?us-ascii?Q?WFNQpU1GxYiskL6ptLEeLYK24Has+DbBMW+yvL1wmwebVc0ZWGvRVnDzGl5l?=
 =?us-ascii?Q?NpUvPBMX42XOWioJOUHW6jPMtDR8MZ/sPcTKQ9uT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6b365f-5434-4aac-a0f5-08de38d65421
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 16:57:12.1856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PY9VTjXTFU3ncyNb9hxovKqqc592JOjfsplYt2439wSLVtO3BjiJA1tvHNvA2DEN/xO468AnL40WmpKLbCpR5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7449
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_085716_749164_02DCF816 
X-CRM114-Status: GOOD (  18.94  )
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

On Thu, Dec 11, 2025 at 04:02:52AM +0000, Wentao Liang wrote:
> of_get_child_by_name() returns a node pointer with refcount incremented.
> Use the __free() attribute to manage the pgc_node reference, ensuring
> automatic of_node_put() cleanup when pgc_node goes out of scope.
>
> This eliminates the need for explicit error handling paths and avoids
> reference count leaks.
>
> Fixes: 721cabf6c660 ("soc: imx: move PGC handling to a new GPC driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
> Change in V4:
> - Fix typo error in code
>
> Change in V3:
> - Ensure variable is assigned when using cleanup attribute
>
> Change in V2:
> - Use __free() attribute instead of explicit of_node_put() calls
> ---
>  drivers/pmdomain/imx/gpc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index f18c7e6e75dd..56a78cc86584 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -403,13 +403,12 @@ static int imx_gpc_old_dt_init(struct device *dev, struct regmap *regmap,
>  static int imx_gpc_probe(struct platform_device *pdev)
>  {
>  	const struct imx_gpc_dt_data *of_id_data = device_get_match_data(&pdev->dev);
> -	struct device_node *pgc_node;
> +	struct device_node *pgc_node __free(device_node)
> +		= of_get_child_by_name(pdev->dev.of_node, "pgc");
>  	struct regmap *regmap;
>  	void __iomem *base;
>  	int ret;
>
> -	pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");
> -
>  	/* bail out if DT too old and doesn't provide the necessary info */
>  	if (!of_property_present(pdev->dev.of_node, "#power-domain-cells") &&
>  	    !pgc_node)
> --
> 2.34.1
>


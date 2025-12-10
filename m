Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38914D3C91D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 15:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UQvzWk765SAQZvXHAtTHMHgTYskLRLxG2/Nb8QoU9g=; b=AiWfKfHxj3nsnRv5vqhMs8YIVK
	ks6e/xozIZ4hajzNS7H+ghLjNEARrq3MsWSQrr3VLVyEmju0gYYmxT7smu5zE23xVHkOAqkdkCCEO
	GkePcUF2t1SI5PoUCEZ3QEI+7rPMFZToDpcgXyjVZJqx6NG0ygfRNZA+UT0QvnjW5ZVXJ95vwSMKv
	W+0rEGmTDz+gQZXBGdX+4CRuhsHRd0gNMgNWGZDDpd9EoSYPUINiQe5Fa5nyywKc4qbG2zuU7IwzT
	2KD6wp32PZqdzMwpoynqYxQF3GyrWJrh/S9c/0SW+1+IvrxKM0KSDkJrrnrjSTXePNnkcyaNiXlJL
	1LSF7YAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTM3N-0000000FZ57-0SEk;
	Wed, 10 Dec 2025 15:24:33 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTM3K-0000000FZ4g-3n98
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 15:24:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGmUP27h8KgBh5BmC9lrE+yGJuU6n/4Hc9TmjIP1QbqKaOvDvW7XyY+j4cf2xMcpd8XZ9lOjcmvR/4Nscs/5P9j0CoXe0kYMk6q6YsBC7IXldzAA5JQX0q/ArYThH1mNjASYnzQ8dtQddQmLxCp7qP8/jdpiXGNreRxf/hjRzxNtTBRWPMZKK/G4dSGY19QdYX2jO7alYLKqC4Y0EdNrVEKez81pAzdgIdPXq8Hq/FkwD/9MkrH9a2DpkT9W204h/Hisyv+ZPsBSLIYknNojWp67+Bn0lM8rvWxxlzJmXwo3fbAS57mO24S8TQItPT7ri22e9ME8pCEqgDiBCHZ3FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UQvzWk765SAQZvXHAtTHMHgTYskLRLxG2/Nb8QoU9g=;
 b=cNVVF3CpU3CuUXcpNs76NBAXeCjHqyHu0GioD9RVAs+ZVMHMgllOIn1PPP7we+lG6K3qN8EOSjI0bxTObptkarS/DDtrC1YghVs9Rh4uM7gkddqsjywxtK4qfyLxUPEZ6ClYBJBxwHZ9JSw3RgiJpIuifeB/ydXuoAs2+krjhW+HDk19qpITUGSixLK2ey/VPO4K6clAufAT0amzY5yJ7qG82ttTQ2JTUB7Ks1tYFBa01m91EcubfZt2GHKUAHaVOYODunp7SZuOaQXhibka1LcqIdUlu890cz9lYIAY6LTEtAN7KL48awBX1yfwIktHY30pUvjV1wssZbEUt2l4ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UQvzWk765SAQZvXHAtTHMHgTYskLRLxG2/Nb8QoU9g=;
 b=chyatg21IakaCe9fyOrB1EhEwEOosbW2mQYI0QC2mvvw0/ytvwVexgwWnCOqyE93gK1F/56UMGmwc/zyV7MgfYgN36O9IN4h1O0n2g7V5TjoLBj2taZTHjU/DhNDzt8SPTjKhPGjwEUe8bDNB3ZyAsRYhYqgdvWvuPGI0ahiEHbqrkKrgVOuwIMR2HYEpCKx1hEjc8rIJUW+9rION2o4tZWVAYzmDIZCX1KbtzhpQTEtvxFKF2zns6SVrESMevWcl6QwmpMZfnpmOVgA4tn6JVA3NXcF0EjllyRxFYh0nRRt4OOtxeBLNEZDCioJ+Lll3yCLp46J8JmXysMWugcVxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM0PR04MB11931.eurprd04.prod.outlook.com (2603:10a6:20b:6fd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 15:24:26 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 15:24:26 +0000
Date: Wed, 10 Dec 2025 10:24:19 -0500
From: Frank Li <Frank.li@nxp.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: ulf.hansson@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] pmdomain: imx: Fix reference count leak in
 imx_gpc_probe()
Message-ID: <aTmQo6L96/PcpVq0@lizhi-Precision-Tower-5810>
References: <20251210033524.34600-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210033524.34600-1-vulab@iscas.ac.cn>
X-ClientProxiedBy: PH8PR20CA0011.namprd20.prod.outlook.com
 (2603:10b6:510:23c::14) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM0PR04MB11931:EE_
X-MS-Office365-Filtering-Correlation-Id: 5413c80e-e5f0-4fdb-f055-08de3800341f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LxYdAwoGlXYr1vPPDaOc7q3CNHLY9GtlUgneYJ0h1FQqerRFtcKzIPzD8qBV?=
 =?us-ascii?Q?VXnXheh9VMCIETBaFzB5ugB/i/+0LHGXTuvxVbwaKtL+8s9unqH4ZTBKu24s?=
 =?us-ascii?Q?fF9E/fKhmMUNhSHvqSph/KvlhtJfxBf24iQ/xcJwS6jxTKW0njjxEedvyiyY?=
 =?us-ascii?Q?syq9CkcvA1yGWqYZabjGpoLKCqoOQtbWBGRQs9xSb2yTKUICoyTnsQ9pZcL0?=
 =?us-ascii?Q?5gPoA05l4lCTtEQuVbnUWylUkwVmkfogMBFa8yedhwQrG5NERSMpBVAtjqGf?=
 =?us-ascii?Q?AmZ3bbDnsNVkFRG7WsPCwHrsGhR3ZBEFEQRY4NIt2G39L7WsDcB2612Fwaum?=
 =?us-ascii?Q?Ae7M6+QKlzTIX2JVnKMb3lsGKdwQoED/ERD2Omo5A0SrAgU4dlBRGrFZgl2M?=
 =?us-ascii?Q?RC8BWngxsvXV1wZHqq5Y77DNne6a8RpzSLXKaUt8Rr9obyKmqSM5lJ0z/2CP?=
 =?us-ascii?Q?hEXgwRqr3gVrQ3BwhyGgKS9/3jAiiqJgZS5hWZJwghVIntv5g0JMYYoC8lq3?=
 =?us-ascii?Q?5r7yIC04arets76rTiE1T9gy1eNtdiJawmSQ68utktrSq/01y3DHQlls9TTT?=
 =?us-ascii?Q?YiGvWpDB37Owwtm6F4HPqPs1mAo3lfxZD4cHL+HIaiyLhkxQzEM6IAcaslBK?=
 =?us-ascii?Q?GvF3QnW5yb53fR9QlNg/F2MoanG/5V7UD3UvIdsO3drgZ+/rsZ16L2JG9I06?=
 =?us-ascii?Q?tpPX2C0V6HOZtMRY/9dvKvXS+Z+qNIrLCWWjSxjVrptyBzwskxGV65ngiQ6z?=
 =?us-ascii?Q?PgVWK8IkEK2v9SQpzq7clevgOXlJvjqH+L8uG7ReBlPN4cdiC3ioM9Vm5oO9?=
 =?us-ascii?Q?v+xyKam3Lr0PmztCBNIcRPFQpgLuUVTxbwASydQaA2azIJRcnGwlXCkfXEKp?=
 =?us-ascii?Q?JV9pxF7eS0dLJGUltoCPaiSyhVFiVgaHjwxAuvfNZoaVerYFgXwEBEW8Fg5X?=
 =?us-ascii?Q?eo5drxebrHDeCijVDxJi4Z4okZHu/QOvpOp6S4K4MI3nekEPc3ONE5nlJN3Q?=
 =?us-ascii?Q?qHyFNqyg5VvpGtl9ILEGyrxoAjMoAbr99G0jy6WgCQxOtI6SOLx18j7vkqk7?=
 =?us-ascii?Q?oHrIRdlEnipGVI5MbP55r5I9eljf8NqD/LdhuWAxex+ljuU+K5E1Y90TDLMa?=
 =?us-ascii?Q?KFZIkSn97PcYXQ6QWSfmjP1h5aznZkwWgMFwVuvsiNb2GQtrs3T+vIsFEr+G?=
 =?us-ascii?Q?PqBTIxEiS/LGP7TO8ohOtO6hzeXgnbrzcLo5IfuzUMiwOMu4vxYefQhquVVB?=
 =?us-ascii?Q?Vj/Xpi7XVhLmV+SeCCFfIHTOwk5uFL4+yIcItUXM0/xbTtKorvbXCz4HNWjF?=
 =?us-ascii?Q?zfw+DC5swZ9nsS4dV8IUFYZBcrF3gLbqc5ALbn3ExOa/xTZH6+Gndyq8JWgy?=
 =?us-ascii?Q?4tH3IN2HvIdTlUzUEY6Dvt8g9eD1AWOcH8ur4n7KfT7SMlOkE5xFO2a9z3jt?=
 =?us-ascii?Q?mVOF3WpyUmT7YnM80SeE71z4t4RfDo+3CTvWWTB/yf0/leuOblQGnvYHvTo6?=
 =?us-ascii?Q?W51WrvtkfOR6yptacEeqCHtRIvHdlOFflaki?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6fK1yasb0Ys8Seom0nJIO9Ar5UrfOpDvfpo9W7w/TrBTuHib7GJUKsRklUzg?=
 =?us-ascii?Q?jMFnWJJUT7ltXLOzAxr/zXtKHxqlrPElerOH3rZXF901NSQBdXSMEM6q2tJc?=
 =?us-ascii?Q?447MNubseWyLmuxaEADjxvlpyvoTa9ZUWFsQR90q1tIn5q4p4uTlxebxfhTn?=
 =?us-ascii?Q?BIP7CO8SMDcOa5B5MOnZBPjFWyydWsOENnVNWANrEYEu6LRIf86A034Atq+z?=
 =?us-ascii?Q?wCAvU37q9jjLXHSmpe/1C4xHJ4yzXhJuLvom45l8gSwQSXxdWB2SAazRg5ku?=
 =?us-ascii?Q?2VpPa2E3G4KpXo2+s8E93JQqggXNBCjPnfKBw/ZQmAZ/w6JClObGSzc7jgsF?=
 =?us-ascii?Q?B3wfh2kMYPEdgYpfYE7PzeWd0HUtL81c5lMZ7x8si8c84q/2is3pM5IlCA59?=
 =?us-ascii?Q?StgqjyjfamnZ9K/KIFJMi8t4DSeRg6ZXXmnkwberLnBoKbF0rrmKwvjvITXD?=
 =?us-ascii?Q?QNK8SyQY1yXWIo14UxBQL5yxOTJcw25Pg8TmvYu6AKpmXWREjMW63KALsNFg?=
 =?us-ascii?Q?pgLNTy8Dxcr9vyyO71l11Ikw47OVqHF2pg31c+Xvi/YmkMzggg2YizjxONk1?=
 =?us-ascii?Q?EDXGMBjGcc0rvVWHvNPMsFbJkclWbzfbgUTu9vQ+cEQquNxiUlUDzekWIrmx?=
 =?us-ascii?Q?O7mgJpk/Ib7dVugv11KGSDiJ+PpUsjwmDcH7/rDot/iyFOXsutWFlJLuX6bj?=
 =?us-ascii?Q?A7yIO//5fKrMeZAtvrdyqDQ/QLHkGnI8X9aDWMiHYYSoOhR6+wMu/BHCXmK4?=
 =?us-ascii?Q?Rl8T0ZJB7YW8BCVQq/9U6XlMSjskSDk6L7jkiJFWVXcXrpBL/gos0r8/nowU?=
 =?us-ascii?Q?zGSqKYw5bKmNhyU2mkbBQ7wdGOjquRZ4unJBCWSnEDQcUl49fG4Qphl/T3oq?=
 =?us-ascii?Q?+JZyWDiMNh3przVKVRDilAa30SeQakl5hPMbzGQE5o3SGrkO9UJ0U+gSqaEA?=
 =?us-ascii?Q?pDGkKlk9VsdINJGX4N5VfiRdjIIvWjS4C7hXEiaaMzRKjTSm9y0t64Ega1aG?=
 =?us-ascii?Q?r25x4fsqxh+hzgIbi7fzozIufZHdoJQnBzuWgwcMKk0DAnVUhpWj1llBYtx6?=
 =?us-ascii?Q?Sgkvjn4yPEDHWsjFBraVIBNrcQT+OygCEYbLCPuXlC0AM3lQU7KghEMgkiMn?=
 =?us-ascii?Q?Db273CdMG51FccpcuM3Q5KWCUOYnjaeeR8i7UrGaIbxXiper6jEpZysU++eT?=
 =?us-ascii?Q?EEJMkDTNf1q2X2S85s/meWcEknsOQu9DJ1ojrlS8XDQCqCRpcafLHE7rbtjI?=
 =?us-ascii?Q?sgEkaupngIPdC8/8dVnwDil3rCbHgTg0X13VhWLOrtUEIMphO6Mt246q5LHQ?=
 =?us-ascii?Q?LQVR+X++GAYHGj6YhxOL7rgT0SO/Nc1tqEZn+J0Jd41OfWyRRfPo7ccIUXpL?=
 =?us-ascii?Q?M9j+OhtBs99gwhdVDTmoUY+at/Z3cq3jhfYLQTOJWxc0n7/fSsNCGOJrgsIC?=
 =?us-ascii?Q?JSExrg4F0POYCJMC7Z2/W0Tq0+SPWdeHt+N9kCAWs6k6dPkAfNl7bSrLwLq8?=
 =?us-ascii?Q?NHt+zdye5WW4UvpB436YXuMBhCS+YfTQ0uafYdIaDg5xFppLJz6TKzcIsyZJ?=
 =?us-ascii?Q?wcPLr87Azb0F64wXrQl5l5tbQLtQkwMbhYxFKSTj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5413c80e-e5f0-4fdb-f055-08de3800341f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 15:24:26.0089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/fA8wVz+Jjw1R2y8bYlqb8Z2FmiA7OC74Kg/GUR/Tip0ePVyCDYVdwiqLGcfdnZ7PeI1e2H0H1OfBlHvGtUaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11931
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_072430_961031_94231912 
X-CRM114-Status: GOOD (  19.67  )
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

On Wed, Dec 10, 2025 at 03:35:24AM +0000, Wentao Liang wrote:
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
>
> ---
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
> index f18c7e6e75dd..0fb3250dbf5f 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -403,13 +403,12 @@ static int imx_gpc_old_dt_init(struct device *dev, struct regmap *regmap,
>  static int imx_gpc_probe(struct platform_device *pdev)
>  {
>  	const struct imx_gpc_dt_data *of_id_data = device_get_match_data(&pdev->dev);
> -	struct device_node *pgc_node;
> +	struct device_node *pgc_node __free(pgc_node)
> +		= of_get_child_by_name(pdev->dev.of_node, "pgc");

Does it pass build? Sorry I have typo at previous comments.

struct device_node *pgc_node __free(device_node) = of_get_child_by_name(pdev->dev.of_node, "pgc");
                                    ^^^^^^^^^^^

Frank


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


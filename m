Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC26CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ueF3YR/BGuDlSXldtbE6qqPf9DIpXetlVuV8iOPdaIs=; b=28ixdHrLf1jowfkRnZJ0/c2p0j
	ZfooZ463bXBsU9C5lLBYtsXePDpBd9bibyKOc9gmhUVx7UX7Sg34H8h5/w2OoF8cwkN/1OUByTbkV
	dXdjqJ7hUQ5uUg/ePckYvYKnwyfrl29tU+gqIW/Mk1AUNaH6SR8SmaMSGysxhrsSSVzzmaoqnonx5
	DFLHNH4SDXHQnvjO4aizKQ5Rt4jlb3gnIvVqbpwIL5/ycRDs7QjcZo4m6UdKGj0QZvVCaZelhoPPD
	RvH/BSLFZzENZAhwCznCz/MJWQ9t3PYmSu1Io/V0iL04at0t/0GaG8dkqjo9ddU+vZAbXQWFC+K71
	yI0uwbOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5mM7-00000000Bpj-1wt2;
	Mon, 06 Oct 2025 14:38:27 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5mM3-00000000Boi-33dP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 14:38:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9cBWI75ejPpTDplEo/a8ufnVm5aI2CBSHVqkLYtV772rxXqaFcmpypllAKgGUuRK7oZDVBcRtSuP6BslvtwjdzIxj5tEuNA+PH0tHtQGPyVSnJ25gyvfmDnKW7xAsIr99JidctZSkw8pJu41DA9j6lvw4IKgbLYrxm3XcUVcem8mzBi0PvTi4oHRf72DvOIPH6pqXU0/9m8G3VcV6xSMw3Cd1BBsroyQMyUxRPp9bft4ZElV79x70a3JvDokRjQJDX9diUqyKBXqok3TlAwHJO2123Xkal7023+Lo1eSgJYiDSEH2WHuq7OF2uBnNghnPXgtf6JT0DXoUArMwECXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueF3YR/BGuDlSXldtbE6qqPf9DIpXetlVuV8iOPdaIs=;
 b=jHsRxmgJ+Bcw+QlUtOWzcQEf8ydrfU2cxuMRG3SBfpLXOJ5Gef/NWEazrH/Nj5pdJ/+GA5JL+yXYj9+jApVJ8UomnJVXF/vIou9F4GaxFwuZoozAVGCBnHVGqja5HqJ29gsL98cAxvB4ujWg0bknhwjTrEymjsEyPG5eEVW9OeYvof93xW4U0IJAivwsZAUy8huXxMJy4Y8GBd6+qUfF3VByQ1mwt6Q2dHJLwOzaZQ/y62FpMQ7dqYozB0JtAmYZIWleGID2xUgj58cgla3ebS24kB74j/gvGXtJtk+I87MqI9sbHi5oYy6mPLlB0LlGtl/NYT4DvU3JtskFAes9tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueF3YR/BGuDlSXldtbE6qqPf9DIpXetlVuV8iOPdaIs=;
 b=oNB3mnTXHIQrU5iyNY8izt/KwZxS1iMxumBgT0GhRnplqXQt+63W1SkZuHHJq2ZxQ+lUhcH4RJW1ZFew13B60TcpdZY3zd/mkyehGDs4nzzM65AP0VORL1ct9KF+IbQMDLTJGlla7AN1HdHhCCaBdt4dMDxuC+DcsOCU0AdTeA31u+x4toWuNOwAs3hmK+GNG68il3MAvCyumr733zVuRZc8JvWvzNpIqf3IiWVe6w7vPofci0e5MdPLambD1OUIQmDKueGb+trnHPgoZRjs38rSDK5JFp2jVkCoyYuzn8AZTuOwtsdhSrzmWsZfQMpDi9GE4wjs22Kf/kXT2Od8vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI0PR04MB10495.eurprd04.prod.outlook.com (2603:10a6:800:235::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 14:38:10 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9182.015; Mon, 6 Oct 2025
 14:38:09 +0000
Date: Mon, 6 Oct 2025 10:37:59 -0400
From: Frank Li <Frank.li@nxp.com>
To: alexandre.belloni@bootlin.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx6q-evi: fix rtc compatible
Message-ID: <aOPUR8UAVND5SDNy@lizhi-Precision-Tower-5810>
References: <20251005215146.3804629-1-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005215146.3804629-1-alexandre.belloni@bootlin.com>
X-ClientProxiedBy: SJ0PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::26) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI0PR04MB10495:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b10d957-41bf-4b46-18e5-08de04e5f873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VYYEl+aWb8vJSGoTS7m9ajeArG7wlE43NxgYE4RuGhQzrQ/nRtj9xm7Ctdqr?=
 =?us-ascii?Q?HgUc72epWojDW5j5HYpPqa0+MoKk/ituhtQLgRuz/fpOscfbTut4jdIxASB7?=
 =?us-ascii?Q?1W6vJbeO6CASLD0AGdDlehify5Gtj3M5J36FXpPbv7xj5AkgNmlYjGCHRUP7?=
 =?us-ascii?Q?Ub9Qtm/gGUyyJYZvkb/HcvLj8P90s6zR9E6g7fBtm3uW+Oj1aN6ZZfsmhkq2?=
 =?us-ascii?Q?m+18vaNLqs5iXrwoYAL+l7ZxR2hTw3WKE3GvaI9UMTNmGmZHMmTo+h8sMVOT?=
 =?us-ascii?Q?deMPuaf2gc8hRnV1W1cVTVWrry55y18TaqOua6/mUI9oyFkSsiOcU1rfhwIu?=
 =?us-ascii?Q?XX1sJj0R2UXlaKnIkz85axvOWGlKg4kx5QdSj/36JMcgvjsPxL/TUBCu8jro?=
 =?us-ascii?Q?VLre9fy/9QF/74lQLYMdAI1BjQq1rwyWiknYiB9IXGixoCHXf2AJUcCiLn3U?=
 =?us-ascii?Q?bQpiRo5Ne+T94q8oZyDgUXEL7Ufb3gRXqG9i4j6K28JT9OCj8ynUq/y47tgU?=
 =?us-ascii?Q?9FB0hDsngAGVhZnvUh4wwBqmCGQ8sFjfg/heVNC/plDjvb8Sjgcw2Cl7Iagj?=
 =?us-ascii?Q?PqkH+yPMdqplgQq2JEmstEWTXmGN/jgh3p4agaNcPB8Qe7COfvGDXnm81CEd?=
 =?us-ascii?Q?Pn6dd7HhRVLP5QdVTe/Hh+o7rJkHWhl/loy/+VbSZYGgBpjn1+iC947hncvN?=
 =?us-ascii?Q?yK2KX+qxm/zgWZczMJz1znv7RIZEq+iaJ2DoSX/Z9IFurYDmmkwDSQAJHhc4?=
 =?us-ascii?Q?MqXw051LCLXNs2q75KbkQyaxjJOA2JLI66vj8Dy1kxYbqSBxN44HwtpK0hGi?=
 =?us-ascii?Q?v2/ouTBsn+dXzXgLvcdnd9Fh8tZXXusm9Fwfx0yITDZ39LyUTN8OylcAAch8?=
 =?us-ascii?Q?6h5Vr8crRSItIrAY7lF2kWB7VQPYlTC8EmvVEYNbl2rmldc5HOJJWwbGdNQy?=
 =?us-ascii?Q?I8zh6OO/Sj9fXAwAuci5er6PSiDjlNTGfZ3I1qP54mGJ0cIX/7s04rlzNX+F?=
 =?us-ascii?Q?BNFix2rinDKD3Xd83g/lyDlavJXQzYKb6G7U2JJxynHNCwJoYmOltya8K+cq?=
 =?us-ascii?Q?hIsBxF+b3YV1PTMBSfhR1RkqcALRHsszbZKbes9DPe8te3FfGp6o2Mj4BY4i?=
 =?us-ascii?Q?ZZO/phoTwwqyvq/8u5s4X/VIgKDxm3S82mf3Js0RejJCXZsqoDQrnqhzHcUt?=
 =?us-ascii?Q?93UA9B/F9yZQQog/Cjja9t7cH+YttReaB0EC4CUBrFUAPo541OpjMQaST9qz?=
 =?us-ascii?Q?KdRJBJTTNqPPtzLCVlhp18FQ0s0kBkCcWRG6gInnjIraFNsh4nSobu8Blk4y?=
 =?us-ascii?Q?V9UOSpVkxzniD7MBlZ/Pl97yq5GVtaFzHV8LtSgdO+jThDncfh9GnoJEyim1?=
 =?us-ascii?Q?cLp5jZOdovopJm6+38EH+LZuLa4zYQTPo7P3MZVGbTzdIAjz45fxMPSDxE4u?=
 =?us-ascii?Q?18dNzfT5xlukdKZ1vAd2lQmyQ2cRYbvzykfJyZLAJKL3WSKnsmFZoUfPeq5C?=
 =?us-ascii?Q?4Xc7K/lviaNBhIYMyfDgy7wVG5SMnCdo6Mmc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PBmd403ZHsla23gJk7Ky4t32vkiVIJY863r60XADvIgNk3YN/ooVO7ZIR1UG?=
 =?us-ascii?Q?xGKslycdH5hxVFMq9oTNndj+SgGIdoMpmmPpdDo8+sKb56lvBXxmWf12H8av?=
 =?us-ascii?Q?YQppOAaDDZ/ba80SJHgZmOMoM0cTnKpVeCf1PDXUhhRAMikn3OLgF7EwBvE/?=
 =?us-ascii?Q?weDxYGoucvXot1epfmpM2Po5fHD0h74YL93f4E5dqcQyXvyrhOJMXOFKU+iM?=
 =?us-ascii?Q?nY/QGVSDool7ZF6JZGtIW9JFrTmwuily4yrWjtigu518fWiCtQFsDvj6Hk3u?=
 =?us-ascii?Q?c5guF36Fm45EfB+699GvG/SfHSPyOK6GaTwL7ro8ke6Sj92pR304q1585Br+?=
 =?us-ascii?Q?ZVJxhxUm21Sq41yuwpZRcPSnDzkk4k+jOmRw/DwZNs55/ubdy0/4Q0ein4vF?=
 =?us-ascii?Q?G8QHBucAueg9PeAkdhSlvXiR0JRjXtm7V5vFNC6cfPZZzJ+xLlyWaJJ9icDW?=
 =?us-ascii?Q?ThuoGkeH7oq1V2jh7fz3yWDaVTkUSuh9Ga/9Vf46846XsIECGEFEYz0MYQj5?=
 =?us-ascii?Q?tZbGzbFpwCWlyXSlgPDpKr0s5fmZe4baWHVqwgqDfs2XegWW1WsXpax4zk/L?=
 =?us-ascii?Q?FevVSq5XdF9xDNzRwO6dbelexl+a6Byd8TnZbSXhk+pzHV+5RHInZg9keL29?=
 =?us-ascii?Q?f+76qldaxDIEkQlDkNYK4EW3qXMgjjimcjTvvdXIzSqBLuWz8wS/X/FsYjKw?=
 =?us-ascii?Q?2S7dH0o5bi0GfrCuOJFz38wWVYMA7k1IpJujpyNVz9+clPAl3OA6izio+Zei?=
 =?us-ascii?Q?22J96FyOFuPh26PrS2TOSDswLnHmB7Sn702CGrSZcwO/Fc2Ve8brYtSMI/vj?=
 =?us-ascii?Q?I1vWU8NGIkTcZd2UJGFqoY62g0H/gBYqp0InRa2L4O8x3aCAEC7dvNUmdY9g?=
 =?us-ascii?Q?JpQfwI0akfPpy3eqSavZKFKkkGYSw/6setiX5MQqm3imDEZgi19mwGzQPWix?=
 =?us-ascii?Q?ggrtEpNlOL6rkt/x//HiAy9Os88P37wTb8C7qYGMkGxa6YWYDHPKU5Vm3aRP?=
 =?us-ascii?Q?WSL+gQV78UynVx4WFibu9Wyb6vVgzYtmmSN5PjY7xPjhps1XoM1JsX3FSgqf?=
 =?us-ascii?Q?Os0olJWvRf/cl0RIKfaCJefAR+5zw/JUZ9ZzjzTifjYqF2KTHfJzdq1y4c2S?=
 =?us-ascii?Q?Am/yGHr4xp5zmS4ai1VwtMeVwU5CP3rIo6yPL7Q+0IPbW4tnkS7RRH6ey7tc?=
 =?us-ascii?Q?O7/NdAN+0FmtiWL8lAEENgcwVpf6OzwwELQYs8JCfWlqVERpgF4I+7WPKpda?=
 =?us-ascii?Q?ul33iXTZVLZXLuLDLYJKWTN+DyJR7VQqAU1IS4og3WODb1+Ui/0U2UPBRJ+7?=
 =?us-ascii?Q?jmelXij6sScpBrirV9fNSGuKckYr1TI0LV4ucSAz0Ubi4T3lkTpvml4AtvIN?=
 =?us-ascii?Q?hHUHKCKZf0VSS010pbQ2AS3y4AZBAn677v3tsJFzQ5RrU5k2KBLy6WKlbrqA?=
 =?us-ascii?Q?nPSL5IJJbERfHYdlm1gbI31czXYu7X7b0AqIWNBNu6ZnLrywo4BM2puALBBI?=
 =?us-ascii?Q?d6+gf9IGgocdurv2NRNVNQ4BFnniV+XYjvxEQZmjN3nscBC3uxbOa6qiVwOv?=
 =?us-ascii?Q?LJqOc1EXro/C8TGamcWHW/vCzHY4jQxeRNTL2DO+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b10d957-41bf-4b46-18e5-08de04e5f873
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 14:38:09.7952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zt1x0ABinkPiBE9YeKKOqdJHtsRRLn0hm1+gExuDXklNge5w7JPUhd3ceL8IChEVYnnDVEDHk6TwcuWyFDuMtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_073823_770449_57F223F9 
X-CRM114-Status: GOOD (  16.71  )
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

On Sun, Oct 05, 2025 at 11:51:45PM +0200, alexandre.belloni@bootlin.com wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> The correct compatible is nxp,pcf2123
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm/boot/dts/nxp/imx/imx6q-evi.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-evi.dts b/arch/arm/boot/dts/nxp/imx/imx6q-evi.dts
> index 78d941fef5df..5da9631cb3ec 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6q-evi.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6q-evi.dts
> @@ -134,7 +134,7 @@ eeprom: m95m02@1 {
>  	};
>
>  	pb_rtc: rtc@3 {
> -		compatible = "nxp,rtc-pcf2123";
> +		compatible = "nxp,pcf2123";
>  		spi-max-frequency = <2450000>;
>  		spi-cs-high;
>  		reg = <3>;
> --
> 2.51.0
>


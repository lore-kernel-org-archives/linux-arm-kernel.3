Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B70CCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 13:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPBfYogXyJ9Rtedz5EIOhEyJsTuSAoUt3DAIFCpDvRo=; b=j8xBvf3K5/pAPHB4JlLzYdmznO
	iQXzUQNQrM08l8hwXn7NmEqpyy8nWFa3GQajkusY4k10jRT6nHZgy8d4e8kWWlHGsa9g4ifaizRTB
	1NzshiQmjh9ydoNA+Zm+b8bfIsxZqxUEwZ5jIUWXH0+aE+ytHFlV2Xm4Y6aMNeYF7C+I8ox/0amEp
	sTe8Cg54tiy0sIKP4VHh9o+fBJi3S8Y3FlZF39bQtFBONVlieG4gZyh8TdoBVJMy7My4sCLtr2DEH
	uYf4VC1F50hFeUf6TDOChdvWpIcAClk/pVry+aJuI63VId0yXAjfsdHgzFU1N9nEdtw7cVQUZXj8H
	yIvVc+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUP8r-0000000D6nw-48Ih;
	Tue, 02 Jun 2026 13:26:49 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUP8p-0000000D6mZ-0Ein
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 13:26:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KX8HklwpNJopbBkc4eIYdrLE00ffP2hNYcqK8DNtFHhUvw23jU+InQAU3IklMPyFCmO95dUobtOAB/S4Q+ZZ9/k5BexQK5fc1+pA9qZkioZyjnYQk9s1glipQxDnEDAvu2G0RHDRdA11OB8uTMPOZdOS5tAGk4z2+V4e3fC+RSYBvVG6Rq4ArL3HGdF0fISy6ctjkFs21vD+M+jKzgkRTGtY8J42Xwyo2rooj4ughBcRbKogFpHt9F5oOb8qsOpmpioRDOU6cVYBlUwI/s3fRQzhimSxOhFMjuW2mMitCxf0UG489Bej2bfA5ffpYzZRVH1ai8Ep8++Fqy/2VPlIng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPBfYogXyJ9Rtedz5EIOhEyJsTuSAoUt3DAIFCpDvRo=;
 b=AoQ7uUEjhFdtuKyRVCjSOsxwOPLUYVsgovDdmqrajjWsP3O8sR5GaHXkcnb7azWK2K39OYiJsD0mHRUqt0GqS+Q55gChm3X1FfvoPAp5JqsUMmdyEBYKNnqhWklpQXR+osmr+Mxt73PiDKsCYBKCDxjkgw7zgrB9fp+QFY0vcIucjDvpYjee30JHTW1Q9r8NSfsMxEsgZSiwWCqW01h1Bz+xCVzEn91GslSQ1sYf0jbTVa6/PuDahuu7WbgRxnK4jT8NI1DhysYMNRVBfoAlf3qj8kkkoe98cFrVUneAgpWMdXuaamjVfTqskWw7XnHsXqPDswSsJfc96btObJGXgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPBfYogXyJ9Rtedz5EIOhEyJsTuSAoUt3DAIFCpDvRo=;
 b=d5cRhdEh8EuXiqUM4Obr+RAR5TLl3398uzeSG0b5N+Mxef5yZlJUK6hWULDjaSLIrxL0K8S82apTIt+6dtv2g42CX8TnNVeuxF51ZlgPvxFZ4StyHX+vNABEe4WqFNFajGutzVOfqeisMwmGFN0gSJjpOc5t0uTwbEAxDFxSNLGbCJHLe4QFLDN79MbmAKMVKRAhibH+qM0es/tEsramaXrLgQNUKgOef/KbilWi2L9Gw0F223mOW70CJz4mZFZK6WqpsNYFlju+P+clnMuVPhsDtw1C7esh4HH4ncqJ+5+IwGOq2c3QGL8oo3a2cGlqRuzkXael2yDSC7vTxoEjQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB7554.eurprd04.prod.outlook.com (2603:10a6:20b:2da::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 13:26:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 13:26:41 +0000
Date: Tue, 2 Jun 2026 09:26:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH v4 0/1] add PWM DTS support for S32G2/S32G3 SoCs
Message-ID: <ah7aCJwV3cIPmYKM@lizhi-Precision-Tower-5810>
References: <20260602102351.3477106-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602102351.3477106-1-khristineandreea.barbulescu@oss.nxp.com>
X-ClientProxiedBy: PH7PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:510:174::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d2b809-8164-485c-4b51-08dec0aa94e3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|11063799006|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: prApVeMBUn2lWYZpF7zZtp2kOlucNssnUewbnZxx2OwX1oogEgLuDQIqoGC6c/3URqZeGq9avuvUfEXcyPNdSeXuRz8f3zMD4Nj82RE2S/iX2JorhtB5q3SI+shCwZIlynvjiT6ATtJPOmZGlvbfKKjAhc21f0jcI17m6Qv1wVI4vtDx1VuvVujYNhmcDQe5j+IXqIQWrm4nybTOFzMK/DLzUfVXboHW90IzRet8ZlAntKJUIixOrrqZI44qq2NEthKUf3nDl0GDBaxxG0F7it2S9ehk0Jt/Rxl0HzLB/pGmaNVdKPZrXIbMxvwmvYOMU2C6VD5Q+roFolXlLt1aTB7ojfKLDPgHATKNTdxUh7Xs+QSJO2y/TjiJ5WjjMobCt9nfHA+nQ6wyShOoszI/8FdE3JcGMFqtQ6T9YpmwS0ZAAHnWOI92dXjay824+eEN7UhYfxsxKE/OVpkeJfD73cLn/4FWqEbf3ncvmzED/TsPiFPGR0CE4eCT2ldwSG1HT7+K88knCrILevfT4ulLY+D9vA8nkpv/nXJpTOlq8dlRn6KO8saw/miiDsRQeWesXtXsjQcAz1hI/JNzLTOoD6Qy3v2uKIpaivD0kdzZOtbUtzoQG5rTccwroQGHGxuszwyyFhjcr7507IAKh3+6su4RdDRsSn9zcUdqocOSRR/GjHM/1Y6oLjsaV7hucdlhRclrtdpEBrGLw8TjUFOvG76zyWB7G+yHJnJjhNR8GTbgv46lQZTrHU5ZAAn/bOiv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gTBxqayd5j3uxiKxhXKqc74C/sJMhkfmuanI9VDlpaPneGlfFpy2boa7yo52?=
 =?us-ascii?Q?a+DUGdqeIEdlv0SiSfgG3UXMI9b7O8XGZKTzn2kfIaOUHmXiXcRwu7y7sBV/?=
 =?us-ascii?Q?0ZL8ZVzyqtfBtqeW8ZCGrGTxUp6MqtYgGFTrW/bdIJLmATlzT8LD64CnpVof?=
 =?us-ascii?Q?Mshs6wgadRYhPQwktgOg6gyaNZnMPXHjJS0Qh3UAHZewScwxh6pbW/zC/2FC?=
 =?us-ascii?Q?hy602krlpdReZhgL7EnUPPTOhGQ1fhw4KrXHpbfB53vwxbjod/zAxXrsPN6s?=
 =?us-ascii?Q?CDMftrXhNU00Fn7GODs3poDV6dRvQcHtuQ/9V0JQkZBDb2fXjwpzKmy608br?=
 =?us-ascii?Q?VvDqoXttZBEQfkpTzuDEbGzH+FqDfheQUkp5g4DhIJbk1vC4iWuZOSkGmIEz?=
 =?us-ascii?Q?6Xn52TqEZG1KhviRYXQEhD3hCika+3r6hwE4MZCNJ51PIVe6VXgx3ONasBR0?=
 =?us-ascii?Q?c6cV+xFb0Ia6X48mi8/LyfNDPOUkBIfoA59HzGHR9V/GtBPDIB+2NHzaNA0H?=
 =?us-ascii?Q?tKiqBkHC/oXQ+W83ZeUy13WvwGgo+hXWXHNGMAr8quDRQgUqbY4h+txeCe/v?=
 =?us-ascii?Q?QfE3UbOjrfVavCXipI1/4BqFafYnFJ6dT9zgGeljYbNP+oXWiFDsvWGQbo7+?=
 =?us-ascii?Q?gxR/nk79PfidxSFIJJpueP9g6+ZoXm6mCCVhU20XbBZNoL74AwTSuJjPWk+p?=
 =?us-ascii?Q?CJVn22K80+ldk3OO9Eoa+C9DZh+UUfv+xsfENlYrckuorVlcVjpt6FJIktQE?=
 =?us-ascii?Q?VEFZOBRoomDaPV4cxYPnqZepEvX3TYe9jWftIHS3KGm7wt3D9MfxQ+6uBWFg?=
 =?us-ascii?Q?eg7XwSRUnmjdi/yAXlzbGjn/yJsIPBAm5RSXJN83HkZX+jPl0oboApbzL84d?=
 =?us-ascii?Q?FmsdTO0LouZwsn5iVWiYR73YV6qdUbrKdl61gKhEOJtdpsUfin7Tqpl0Y2CP?=
 =?us-ascii?Q?0xHvn684Wb3HiBtgZIA8D6faXG3/GZ7Q1CnMScnLa4rpcIP3AfL1PEIuilPn?=
 =?us-ascii?Q?eoQmWSMnRtDAIZMbGz0SizzfFKndhbP19ZuYErq9djJkgv3oI2xtVrhz51Jj?=
 =?us-ascii?Q?Zqi+xzGvvKXe4pWUHcqEr/Wn+obWT8iTCbJq27M32xGCP1/oXywmmegDLFzF?=
 =?us-ascii?Q?5FUiKp37ku93zjmDYCWhRx9wzGK/PyepGuouIhZKnrXj0puXcLZrxEORhOqD?=
 =?us-ascii?Q?OSCPKPDlgNaFG517We4egQA2PCTBGHpUOvtkGeC/y3gQJzOOxVlBBCAJ9MRI?=
 =?us-ascii?Q?bUu428zIA3lHY0exk8sxVZmJYA+slCNPmYhwVNuUqgXMC39pBitTNUWCIDlQ?=
 =?us-ascii?Q?MMBg8CLgjZCZs/hLn4bK9+89WeN4ChoL5YSPm1cZ5+FSglQYCZzBWr0pN5AT?=
 =?us-ascii?Q?/oyuKPjY7GbF+nIncIPAY4ehv0kPs0XS1HaN5u3IIXTUhqH+NRyJYHJHGPmH?=
 =?us-ascii?Q?dfUE7PS+7PmanvQoQPU9CPZIURsboXCwPyx6rNT4bM/T6jgGfoaSFom2xS9v?=
 =?us-ascii?Q?uFvnp8Hj6Yl+lLPweZ+q3lbZbQ+eNnHavnAJyBLI3GajOkuMXXT9LxB7g9Ni?=
 =?us-ascii?Q?B0h9VsDscAGFYq2C6mhrPj1qZVu1kMFcwkwGwgVVugcE++0dQa2RZ/HAKKBS?=
 =?us-ascii?Q?EAXIgK/8Clsr18W+586aBEqfuxQ0AP/h6xFrbMurkiIUOhF3XxPFWNMpiarc?=
 =?us-ascii?Q?R8FAPAfEQ8GGZtwHqYzYzD/NNWbfYG1UK5sGQq4sprFs3UBa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d2b809-8164-485c-4b51-08dec0aa94e3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:26:41.1893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LD0TMDlLasaEtbfTbxcdoaZEdkLUt4llqQELV7TK2qMKkM3+/PzKfoKTEpvwxpEpDXEf7rxeplYdZzc9kBQ70w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7554
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_062647_096518_D2DD6B40 
X-CRM114-Status: GOOD (  15.05  )
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

On Tue, Jun 02, 2026 at 12:23:50PM +0200, Khristine Andreea Barbulescu wrote:
> This patchset aims to add one change to the S32G2/S32G3 dtsi support:
> - Add PWM dts support for S32G SoC based boards

Please bump version at next time. use the same version will cause the
confuse.

Only keep the same version when use RESEND.

Frank
>
> v4 -> v3:
> - fix indentantions again
>
> v3 -> v2:
> - remove vendor internal issue tracker
>
> v2 -> v1:
> - fix indentation alignment
> - use hyphens for pwm pinctrl nodes
> - sort pwm nodes alphabetically
>
> Khristine Andreea Barbulescu (1):
>   arm64: dts: s32g: add PWM support for s32g2 and s32g3
>
>  arch/arm64/boot/dts/freescale/s32g2.dtsi      | 26 +++++++
>  arch/arm64/boot/dts/freescale/s32g3.dtsi      | 28 +++++++
>  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 78 ++++++++++++++++++-
>  3 files changed, 131 insertions(+), 1 deletion(-)
>
> --
> 2.34.1
>


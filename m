Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1122ECD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 15:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IL5EBDbSbJROO6ZT+oh12F6Rva+5F52Gs0SU+Wifpek=; b=FuKvQcmRNWnNC8WT8LwxY80fxx
	sHT0ngXRLE9DRA9tj5y2RK9lFuso+UvybZ0MvuDmLP5GDj0DakIZpcTL9rijV+Os+hJXx5hPbRcR9
	y3FKU7SsQ/tuCm7h3cMWrKB7tdG2zY4DMmr7Zq9PieIaYZhYdRZ+tPP9NY3PmmrOCWTS9DIieLSBe
	nl9CrckPHN3Hgzj0FiWSB7L52BgnySXyF+nHfhLFfD6Cjmh98B7l/Rsd9MF5VqVCkEittCmLgTjv7
	/Y1D+miN2bzvs5sMhLqN6Vj+rpAAXSr7i4VJtE1xp7R6dftMzsqq5cg4CeN0FUN3BF1iLGLyGDgNO
	An7WzQTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWX6-00000000pOB-3se7;
	Fri, 05 Jun 2026 15:32:28 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWX4-00000000pNM-0lwp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 15:32:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KS2HAU0o5mOThIeeixGomr1STrZ235R0vUNZ1fZWC7+/ugE/N/+rxQ72sVkrqyzc73C7T+v8PuDEOdQzR+zaNfTPhcKjG40vXU5yDl7rf47RfUBJY+GsMIQEyIbrOmY3qIUHvxQp0VGX/6Nn502Jsl3r7K+LyTgLkolj3y8+dQ6LMchq/uJ4KHbUzD6/p8zkyjGwGgaBYokLs36/UqmiVSCBL0skcqxK4hQ3LMApiiC/2g1PPawb4LZ+D/NVhFG9Dr7sv7hDH21jXZ4iQYWal4XjzJTC6P8xfM/HgWno9PUiF7NxtmH0w3aOOJLRy17Kv3HQ5lkisLeBFx7fYYzNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IL5EBDbSbJROO6ZT+oh12F6Rva+5F52Gs0SU+Wifpek=;
 b=h3LbcXqMFo0fa6RHYUeV2A1MOi8f+0v1KSmBaggP0eFHc0gcecdiesrv5O3ows1mwRjIygBZix+eAFJZ8BUGZ6NOYX3t+M60fNSVnhtXzB71jCokjMi0V7qXARVCrvoo7sqjr3B3f44/uLiRc/7E2RFyvcdHjv6gp2qXK8eUtixUTjZu6LSsjCVZ+YjvUifdLgV27grLRgpuVkV3D/qllYgKENUkhutZcVyDtbNDqYuW+mUprnN2lBap7WV8sUJFeVGdMDsh5kXjWLC87k2dPPt06Sa2maKXwuA8Uql3/ywWrIXZmCHU1H1i/rg0GsE7a4Ny3wE2v6TW9pkN6uVFqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IL5EBDbSbJROO6ZT+oh12F6Rva+5F52Gs0SU+Wifpek=;
 b=hrEFDV5xCMVlpKhCqtxjJi5ZqunqwdcmsvJjSxl4ua1k06o5jazwZw+GnGxodGzvBmRY+gJ7XjuVrqLGlK47AKRlg0CbAj+k/Cmmm511lmzsl4q05PXvKsgfrk30Se2bkxPMcFgXyeZkYt8IkPz/mDka/RuGof5vCWDZb281UpBkscdFUmH4yG2SaD2Ls3WZzniMYqb5+z1Ks+gi5cw5+0PIakRfwtJF5WJ36qiDIjyIi7TVXqzrXoMqZSWWGnQqJiuJdRopVLuPO8VuIuKD3Y4NrdSiwwFzDzcPuxpXouVT01Xwaz4im99Q/IY3GUQo//k/Em9nJQJhkGv8K9Z46Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VE1PR04MB7454.eurprd04.prod.outlook.com (2603:10a6:800:1a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 15:32:22 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 15:32:22 +0000
Date: Fri, 5 Jun 2026 11:32:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Joy Zou <joy.zou@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Ye Li <ye.li@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: dma: fsl-edma: add dma-channel-mask
 property description
Message-ID: <aiLr_gi7X8ROoCFq@lizhi-Precision-Tower-5810>
References: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
 <20260211-b4-imx95-v2x-v4-1-10852754b267@nxp.com>
 <cf7b4c03-e1f4-4439-8077-2f8677bb2cea@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf7b4c03-e1f4-4439-8077-2f8677bb2cea@gmail.com>
X-ClientProxiedBy: PH0PR07CA0101.namprd07.prod.outlook.com
 (2603:10b6:510:4::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VE1PR04MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: 50e7c883-2bb5-43ec-a9f1-08dec317a366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|4143699003|11063799006|56012099006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: ROSuYVcFmT+9UELQ1inIp7AV5v/vwWp0JhnFmQ2YzopuuIRsBJYHlyCGw6I9Sx5pswoYiLnwj5Mp924rNHBxNRIGY72CEwJC1zeu+WNR6Kh/lpq5Vs6B2YDYN63QXC5QPqm9HOYFtNF5SszrsczPyXPLTTpvIUUdkjAc9AH2DX3guYZjVlgMOc3j8dH87vhxIf69iJFlwzIUyxlmDteUiInF3ipkAINNhIJhvFoKRYO2fsXJvRNkLKVYio54bI7xszgC08iuze2BeLn3MNCS6v6UtPX6gAuFlH0YDG8tykmX/43nXvlGlgACpyoLt87AVjY/uOvikwRHBaKn6y82KDWKMuW3MJnN8iuAC+eU+oLP2bM3geqVHENrKdzqaLbsD7onX174bjUTPCOhq0+OEiyt3VBmi1dvarwM+xLXONy3wYPip+ShnYdR3QGVS3ODKwgdkxRbCmkljJ9WhNyNkqfvAJgFFX8VWju7OAcqJzcMeVnhM+ElHQ3UW/we9ggtgJcGzjK6imBdSmUovO6Xkn6accGbvM1c5zDWuoKaTQJG9fjusorgz50G54gERY/qE6oCSoZVT4vwglX8gk4RnfB3bDwaHDYv3I/T8e6/tfEADfdiL86hh8n8EzqwKXap3vrsvFEFMUvHwsDbi1vs9c4EaLy5uInfmT026BzXrJBD94yj9RPepKTJvyS/ZmVcjZ6lJZa3tDEAFbOaFmyUavVurVm0Eh/8IpglIrcbbD6i7TlG74bmqnGQSz0qo7s9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+WKP/HVYPfK58dKz0hoj0jZf0gS1fMtXS/hJ9M+YbuN2Zy37ZsMpnNtUqtoB?=
 =?us-ascii?Q?SWMlP2y5osp3QNIhSKVFPmgWxG/KdPEJr1kD/M7TG+dAESaGstYAv8deHVdL?=
 =?us-ascii?Q?oB8YKw3rYW2yxII2u/0Xyzdx/R+AtqGhYwyIsOt+tKiqpyUEoyPuXl/0X2Ry?=
 =?us-ascii?Q?IndU/nDUHa749y6OF8RGDG7R+OEVKamn1gZ7Z5m+aTLfpXhELnL152PxgQU+?=
 =?us-ascii?Q?jHII6ICPIlxZeXcsrRSDOJj4Gl6FN8rEegbMqn7rdp6i4uLRj7YvgL/o/RON?=
 =?us-ascii?Q?8bNgPef4ASxkST+ws+PieYWV4/bVdbU/knKlJttmTQ7lHkblUuODtuopcPT0?=
 =?us-ascii?Q?dQUsgdESsPzXBmqLMb56xWa5HXE4T59GjnuOHXJP0iwA/1ZaPd5zhJyGPeCI?=
 =?us-ascii?Q?Bv+kbILFalBxysvt6RvesAUogwMIyFF3pv0kUndSYVa7XnoYJ9kezQuSBs2N?=
 =?us-ascii?Q?pf9ftwKhMBy2/hPaV47n+OIc3InskgarLgitjsdiZVAsuss7w7UoXKT57jrs?=
 =?us-ascii?Q?YNpfIEDQ8pIRfEPg/Qub1stVm1kVLVQ61ZN5P16K4NLwQYF1mS0gDPHbDo5+?=
 =?us-ascii?Q?mWeP+X/kwNoDL4DEOCwVvQ1WxZGQcJ6MOgKZNDFQRDwZNMo0fTbCq6bE+44+?=
 =?us-ascii?Q?MGRjKVzZmA+lM5bK9LrMeSUENSbF7acN3lyOQ4Btk/O4V5QVbtSwos9MdHqz?=
 =?us-ascii?Q?eBwo5gcVXWPl+qc740Cl2PnLkj1u5raj7pV6Mrbntzw5aGNPeCAWM4gZpZsP?=
 =?us-ascii?Q?Cry7iJM5JVF1GLMbiWKNC8u5300Nmb96cIa3IQcLYT9mEvApnnsGs/9Rptbe?=
 =?us-ascii?Q?XCiqTKQQbQFxKsp78Gn0hhKzSQLsbnH/x6JjSyr7b2OaNpm9TO5okioD3L4G?=
 =?us-ascii?Q?NANsIzl9fuNV7Cb7lR+AA9G+pw0Obw3ytsjqvqGqrbYIB+fzrb9YC5/TAWVV?=
 =?us-ascii?Q?I4GLkRMm0Fctj6+IACx+X3Q+Z1WH8e5ShL4iEKdghJomCDxup4EyPy2TGRPV?=
 =?us-ascii?Q?Kjb4dBtfU95W+4CjBanS9+FfUQ/UEEQJyvKwdnjdcSVNtGRmzR8L197RHG6h?=
 =?us-ascii?Q?YBA0eEcDV70UyCyIMfluUcstCOfUg0vCe+oSqLvrI2SJOcJzfaIeQtA5XkrJ?=
 =?us-ascii?Q?F7cxIauv3s+XpI16+fGNc3uevdeZg8H7Z3yS34rSgBhtOgy7WN8Zxeh+6/jU?=
 =?us-ascii?Q?NclFbAtvUmsuSEyXDTp1t8mxV7VBy65E6GCYTmSYInIxQvODD4NtvSiztYxU?=
 =?us-ascii?Q?jpvdpeo9VKeRf6JCw/RLlh6RaFtlsqCyP1FBT8Yg3vYMNZHLcQR5tpY6QPAH?=
 =?us-ascii?Q?IaobVW7bNARkmBFPKwuvpMrSnEi96hf4HCTo5MQEzb5qEpJcaWMkxYGHKltY?=
 =?us-ascii?Q?phZn4oFjpEaiXoP9+8vFxTi0vEjfOoV9bPdtoiuVeCmBcL21pI+s1cZQuQoK?=
 =?us-ascii?Q?OqFpIVFLMxlI5qn4pZ+4LJjUkY3XEnTOMNGkJNbFuEJK0+otV8oDK4QD7JWg?=
 =?us-ascii?Q?rKLO635vRlEYObVVpC56e81CeFMDy6FqKqp8tVG/NUQfJ5Dz7KC755nZBcRX?=
 =?us-ascii?Q?FIPtzWmy3kHECOSjAVJ1SlXJWu0p/kEQGFBpV56ool3nUvEWX0fl+yrGLRdp?=
 =?us-ascii?Q?JEVyOlH86MQz9DIQcA6NFRnrnFFluIGrQGMWI9ENYaaLhMvdIJE3+3utRTD6?=
 =?us-ascii?Q?HP6G7VUmZXQlGgyStTJJEno47Hx/3AKmte1meklajszzhdqA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e7c883-2bb5-43ec-a9f1-08dec317a366
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 15:32:22.7441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1E9VhNo8GtzfXmOKhva1OofY1STBBVszZbKrDjJUuljsPBVgjFTyd02Vlf+jfGBAMsThgGR/16EFzQ2MHuO0bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7454
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_083226_530662_E84DC296 
X-CRM114-Status: GOOD (  18.53  )
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

On Fri, Jun 05, 2026 at 03:44:23AM -0700, Laurentiu Mihalcea wrote:
>
>
> On 2/11/2026 1:28 AM, Joy Zou wrote:
> > Add documentation for the dma-channel-mask property in the fsl-edma
> > binding. This property uses an inverted bit definition: bit value 0
> > indicates the channel is available, while bit value 1 indicates
> > unavailable.
> >
> > That was already used widely for i.MX8, i.MX9. Correcting the definition
> > will break backward compatibility. This reversal only impacts the eDMA
> > dts node and driver, and doesn't impact DMA consumer. Therefore,
> > keep the inverted definition.
> >
> > Also add a note at the top of the binding to highlight this inverted
> > definition to prevent confusion.
> >
> > Signed-off-by: Joy Zou <joy.zou@nxp.com>
> Hi,
>
> I believe this patch hasn't been picked up yet even though it's been ACK'd by one of the
> DT binding maintainers.
>
> Frank Li, can you please take it into your tree?

I ping vnod in irc yesterday, let wait for few days, if he don't pick, I
will pick it.

Frank
>
>
> Thanks,
> Laurentiu


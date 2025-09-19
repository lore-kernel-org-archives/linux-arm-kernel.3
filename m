Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E348CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16grxjIfa0mBc9L8TcKE6nhI7AIBLCag9JtBi81ZbKQ=; b=dA3Pth2ceMd6APDbRFa1X42n7a
	uMMkrBlx5KYKHXI/C+7m0nJSASd2C9ynn9wtzn4SJMYBy0VNQshRLjA1s9EhvR1CATm2BvWygYeo5
	VfyjX+nCxAS+G9XCFmSXkaJvgP9/Utn4WQFDFP3LBpMfoT7WFqHX6FBmh78ueiyZRQCLRMi5OBw9Q
	b2L/OY/Qcn6gsvsbBu0pJ0WbL+x1fsHBRXKIu3jeORAe8hURz290+zVI9OV0hrtr5dK6AmWQhVBjg
	t8hkqZXe7d+vC+DPCEmzTMe4WcyyrdhtIeTVs+VkMWB8NGhjkxEB6aINQZ/Ck/QW2i4FbapFEiMM1
	coOI+FLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcVa-00000003Dn3-1z7U;
	Fri, 19 Sep 2025 14:54:46 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcVY-00000003Dm6-1vDn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 14:54:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCmEsV56Wtm5YxHAO5ALbKo7ntBWrKDPf4vkXPWNuRWBLJskRp8VosPAe7fyGTwWZyIwAS27bSilfr9Tr8pFlZcwK/I9vPA2OxN1NwZGOqVwABgLqYSPqeJigb/MJRiQ7Q7EpqZzZi9+ODBM7SWO9qgHjES+cvTp/qS8gTMnLavrliVri/OfAQ2ohlTQtMsmultvNkic5kSZ0e82UvUDNPiHYQbbJ4FQkDAAwabWiUwwt1FgM06iup9Vf17MD3QnNVamhQVL22sTgp6w1iKEryG+aQnhKK1MWx3oEdc8ga9izPaFZjdCvJSGu2WvqFXKyrHl3vRoxQFmgpdpjXQxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16grxjIfa0mBc9L8TcKE6nhI7AIBLCag9JtBi81ZbKQ=;
 b=KO2T1ROAtcR3aXEH2z/z2vLbusgB0ZUH6K0lETXOyeK528OU4qMhE1lFs+nPmTfBYD1x+yRrai1QVaPwTa+ociVHXkHZGyVTPv85lLZwCHkK5n4HZ+7zUXET3pzkSXXLIlQLEKohWCDmzmAYCOwesCUtQtSNgXTd4vk1XoKy6AxAKDB2iLfhhHzGbY4DiuWhpfDHUnCG/fBKsIBCxuCkiHyOhjYKQWCQcs866izx0/IV30AgDPkPQaEeMl+A7HGMimDCcQi81FWl59pVGOyBouSPHI/wXvNGlmB1xtnlDcCm22GBUv3o2y4CRiU37bvXYwR0VfF1yyg/P5WugPyXSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16grxjIfa0mBc9L8TcKE6nhI7AIBLCag9JtBi81ZbKQ=;
 b=EN5enjU1dzdhGUcjQniLcgTVqoiwEEXpDE6h2D5+Ye0DhOW3glTzI0pocOTS2WwdL8hNZ2QlLuRm/5jb8QG0UEOfsjtTj+Gh8+x4u45mlQ0I74zR7BNDJG2gWjy9P9l+rfcgpgTmajI/urRbHX3ScyQmKX/vimh0DQbGuMmaSRA9EExOb1z4TDnSf0VhPvH9bNrsNa+oUABq8Xs7dAg/zUPQOBN9NccUR93axAwt/q9q800aowEvTgXWTxkTYQ6QbvFEL6nQAiUlcarb/jAqSYd8ZgGsM1QzdOlpZEvcHkRjEBEkOjAN+Hz/4O/GctrBhqg8BT6OuIkOqyCnxxOFOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 14:54:41 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 14:54:41 +0000
Date: Fri, 19 Sep 2025 10:54:31 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/14] drm/imx: dc-fu: Fix dimensions
Message-ID: <aM1up3DXHi+V1KYj@lizhi-Precision-Tower-5810>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
 <20250704-imx8-dc-prefetch-v1-4-784c03fd645f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-imx8-dc-prefetch-v1-4-784c03fd645f@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0163.namprd05.prod.outlook.com
 (2603:10b6:a03:339::18) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB8897:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c9b009-f362-4e57-5c7f-08ddf78c76c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+9f2Aq/gjIRCjRVGc/SCx9GVpBb0V9l+I6cOL1HauGqWJfTfNlGmLqnCF7ud?=
 =?us-ascii?Q?NeEFAYg8e4d/lsPD203jbovgouMqPngrmVA6+vQo+WdjeAvHt9hEPTLFOwpd?=
 =?us-ascii?Q?vrgRIKxyVblPNh1/j7qt8xOysKgUlOuf/2R+X+ZNJkWYqxYGaZhjWKgIRqhF?=
 =?us-ascii?Q?3KNXbePKW9HTmmWkcHR++Nz3BqE5ib7rrcyOZFXl3c4EhS6IDB5osyRd4tb/?=
 =?us-ascii?Q?YOI8TIk9px0CXYCKP+F9oQOc7WiWYJbgBOgZ07OFSmuHVbXCRKGcl4n1/E46?=
 =?us-ascii?Q?aMYfWOFdtvGgogZYjp+PeKbWHuw8ehZn2pmuvbrx2n4E+/x2Abelbei1xqeb?=
 =?us-ascii?Q?xyRPVLgYkKEPYz1bgAi8jiqRDv+RweXje9w1YnxQdeE60yRn/udn6Zh/phV9?=
 =?us-ascii?Q?acw+lZoSLW57+4CwbKFZvFestWHodRhR6Z6JGCiez+1mVNgQUW8ahpsRUbgb?=
 =?us-ascii?Q?HNA7aouXz6Pxf2IgUApqbDRkRlSnj+4RtKapWZaRtZ0BIpbBNfdyILv5EmOz?=
 =?us-ascii?Q?OcBHJCEejG1+LT+kuYT8rABUVbQyrERD7DxZlhV7Yfd9zpdtSiOc/nBC0iTm?=
 =?us-ascii?Q?nEU9XGZO066ErdNddE+IkMt/SRQ/LkRCvVYWeaxZWojj+Pjn6e6cKvmr6WiS?=
 =?us-ascii?Q?Dtu4YTRJqcnhLtB8DFATdJuH+uG2Kmha+4aGZfxYeGKeVwNSnAzffBqiopXV?=
 =?us-ascii?Q?Vmw41NU8Ao5Tvj+KThcbbEi8jTHIVyI9bGO8uU91mWk2KujQSWkCTb5MTs4S?=
 =?us-ascii?Q?ZWOfqPrGIYpCXOxYpSE3PS6cNzbCEnSeDtCM6eSEGMBnJIQBeH1QGf2opuxA?=
 =?us-ascii?Q?ui7l517Gl/eQB40BvHncuZfTWntLT40jecTtbjgrurzdXKzRVOQwezJduWEr?=
 =?us-ascii?Q?ZuglyfpkPwSjbmFz+jh3GVbZiGZ0E52ymDglYcjMqYVj5G2ON/JcLxmh3AJH?=
 =?us-ascii?Q?08KfrFmjJc/al1Gdtf2HsA9gqRou4RrrCoxrTrrkIgdHNNSnCRE9GUkyaPZO?=
 =?us-ascii?Q?VmC1yEyx/kJyePG0GN/72alu9CqRsZpRS/hPZo/u3WBFC55aq6Jut+VGvkql?=
 =?us-ascii?Q?L4uoAn8MCitGCChGGELA5gxMYajSQ48gAGQk1uhMzdc+fp0OzVHO+rJnGhR/?=
 =?us-ascii?Q?QyhZsA7QLft5iO71WHAihNaej7CsSS57EJzrpqCu/uYu+baikmZkSivNMkeu?=
 =?us-ascii?Q?L/Wf8G1JpN3dJLZlPrch9r8+J4iHLpucSOqXReU1QSKRvjxSiU20Y79aJuQB?=
 =?us-ascii?Q?W9hpXsu2mS6WzsJu/Mf/oAEvV6vgFQwaopWOswI5h10h1Gp7JFxQRKyStCx9?=
 =?us-ascii?Q?1X+DG/+S8OpsxJspH7dL5/6kGUiZKsGbtaKT0F6Cnbfyn3Rz0XzUCeJTB0b5?=
 =?us-ascii?Q?vWVbk+ubX19MWbbowP7UEURf5bNmdlre/bEUXlVDm9qwf+V+AluzDf0gfEZO?=
 =?us-ascii?Q?GE3iGf24B5zMNRL1PreFs9TbO66Jksg8AOK+gVzn1sb2owHNXWrxsg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wgZ7gIqlpFDwoY5nJ8j3ixdrRiNyY7l5AWVLSKkE4hLju+4DDTUESLwsZwDA?=
 =?us-ascii?Q?Nuy+7xKxzUdfjgdqvstmuVt0aHla1/06O5WIBUcXNrOOSILkjhs1WCSRzTum?=
 =?us-ascii?Q?OfMv6E81jDUJ5FklHBZwqOlNsQ88jt93b8D555glqVzzjPgsoPdFllaW0YNq?=
 =?us-ascii?Q?2tsdYKPshT+3A78SlFQ7lwSl2QwX49qouwE3rRmMjYgPiFmPRbMvtsC1CeVK?=
 =?us-ascii?Q?wAQDtQ9FCW70cA0V4Bcugjrvtbn22dT1AvMjeTwFX/dgH8PmooJpTKsY3H/w?=
 =?us-ascii?Q?glDH2C45Fjvo7q8SbbCl3NRXIoOjHPZnoAuyQDPosP24j4X6Ea6mGMYgKy5V?=
 =?us-ascii?Q?LO56aIAXoKfliPwwsnw9y+RCLvxfG95/7/u46DNf08i5Y1IK4xsdqTnV3X+Y?=
 =?us-ascii?Q?XW13ElSBip1vuBJBPXuIvZxy9nsW6mSTggduxGSMe1LwdjCFaI4FolPp6yFC?=
 =?us-ascii?Q?cy4kXuQDMFoDNMJBUCnztcoPtxQ5LAd2vNgOkfzFFzRNS+9tG5cuvL8M4VI5?=
 =?us-ascii?Q?P2PovIQTjT2GI74sLe9vCJvH9Hd9TIzEnBKhqU0yD9tEDoEOgjeVJ9BVIGOx?=
 =?us-ascii?Q?TfvK2lG/YHk5DhzbWpgS5Jyqj0sOm+peQXvcl5t4gTKAbNgNhHx9Y4Teth4H?=
 =?us-ascii?Q?qT6UfVLXFNBvgL0PIKM59/5xR322S9GjdoiRNFfObSiLF7oDAMFLmx+USo6T?=
 =?us-ascii?Q?/O+3ZP8VtLV8L1V06V9vF9+Onl0JRxJjIpeXvVmUp/AQ4jfe4O3aqBBp9hSP?=
 =?us-ascii?Q?HMauGOg/0OZMP3NhdcHEGuWEpizC4HW4lHU6qMzeXegLPuec9uzZknT3Ttkl?=
 =?us-ascii?Q?yAIx+4hxQhEW8t2XbeoLnBVtZ6f0ZUPUUqvpcONkoDTR3J6FBLTpQFV2I/Lr?=
 =?us-ascii?Q?WOsi/POu90FmBRrGYQ2xX+HId8xF6jxBYTbLnGPj2Q2RThWMywj+AnvE8sfA?=
 =?us-ascii?Q?0oSncHPa1YRw+7bkW7+XBrLzrGFZXRiAQVqvgXXGhKPBYtuTWx6S1w95j/V2?=
 =?us-ascii?Q?YYU8TL1pkkyrejBKxq1HaCduabNGTrai6jFN2+TXmVQFTe4UcCU8fK7aI8jL?=
 =?us-ascii?Q?Vt9h+TMT/9jkoNs6mbWqKHOwvL+l9fCVWjOfWywVRi+5FMiDLoqVJ1CJjY9s?=
 =?us-ascii?Q?B0xJZbdlNRDi8LPvxMD5BYIOBlYay/JnnU1Lwm4rW6vG/xZlts1yJ3LvQ8+Z?=
 =?us-ascii?Q?y7ZuRsks9fSCKKLG6y5nB0An7+oyYKEduM8HW0prXzVEY3tQyAe0GRH48XVt?=
 =?us-ascii?Q?+Wnc92CA7pTFcaHgbuk4VytC0qKUuPagaJCQwQD3eP6UdInmEM4wTs3lBX1T?=
 =?us-ascii?Q?RuwFap0a7tr470Tlxs3SFTbvWzt2w6l4oTkSjpUEcBZw7bYmPsRDhPXA2wqf?=
 =?us-ascii?Q?tEIdGolnCxFXTaxmNzXJBfZU7Qs7V4mhy3V7laLQFmNqsJcxSkzJ8s4UxODh?=
 =?us-ascii?Q?YHjRXLeQtdz4gYEeXKaiCueuZjJzvjGSURg1q7MhwJCqgk7E7xPYHefH9w8I?=
 =?us-ascii?Q?k4gLRLfRXHTjHL6Y8BCQDvnK/voW1rNKrWWjcpC+y5TfxUQFCHgM/XPd7ml2?=
 =?us-ascii?Q?Ad6qIsjSCvvzcy8yrl2xmT6EYDupAFKcFub5U+BA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c9b009-f362-4e57-5c7f-08ddf78c76c1
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 14:54:41.7482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gp0BAKWBl3IsR5crAuHMQFE04OfgNVpr5LQcSEIZmKZQ/+ZVqs/nnWZPFf05uWgM18hlr7K6byts79U4dAjwgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8897
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_075444_499688_442B2AD3 
X-CRM114-Status: GOOD (  17.90  )
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

On Fri, Jul 04, 2025 at 05:03:51PM +0800, Liu Ying wrote:
> Fix off-by-one issue in LINEWIDTH, LINECOUNT, FRAMEWIDTH and FRAMEHEIGHT
> macro definitions.  The first two macros are used to set a fetchunit's
> source buffer dimension and the other two are used to set a fetchunit's
> frame dimension.  It appears that display controller itself works ok
> without this fix, however, it enters panic mode when prefetch engine(DPRC
> and PRGs) attaches to it without this fix.
>
> Fixes: 0e177d5ce01c ("drm/imx: Add i.MX8qxp Display Controller pixel engine")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/gpu/drm/imx/dc/dc-fu.c | 4 ++--
>  drivers/gpu/drm/imx/dc/dc-fu.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
> index f94c591c815891468a5c2a940076963eeaa4d51c..b36d3034b8d5962eaab212b6b65ebbb5c29f978c 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.c
> @@ -31,8 +31,8 @@
>  #define STRIDE(x)			FIELD_PREP(STRIDE_MASK, (x) - 1)
>
>  /* SOURCEBUFFERDIMENSION */
> -#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
> -#define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x))
> +#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x) - 1)
> +#define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x) - 1)
>
>  /* LAYEROFFSET */
>  #define LAYERXOFFSET(x)			FIELD_PREP(GENMASK(14, 0), (x))
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
> index e016e1ea5b4e0471cf6627782603e72d0475c4e8..518d1af49f5ae9d4f67da5e6c2e80abd7e962120 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.h
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.h
> @@ -38,8 +38,8 @@
>  #define SOURCEBUFFERENABLE		BIT(31)
>
>  /* FRAMEDIMENSIONS */
> -#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
> -#define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x))
> +#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x) - 1)
> +#define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x) - 1)
>
>  /* CONTROL */
>  #define INPUTSELECT_MASK		GENMASK(4, 3)
>
> --
> 2.34.1
>


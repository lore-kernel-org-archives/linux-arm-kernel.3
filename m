Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EFFC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 16:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+oLQeMbJifdne4SBDc1v0kcVsA3kayRbQPRLmAZmH6g=; b=zQha+lHEVzLCs0X2jwCrMgtV/P
	fvaawg07pElOZvLfp728Yl/+orUckPfIbhMZOEscVRwMc4kwt7C1jSx011oCPoO9ZBQGYD3ixpUOL
	+x8eBNa6ZnTXUgHIF0QN8ACUqzvaXloF0S8qwV52t0RUeVr02MtXCY3d+5bYNst7KYCgx/XXA0Akv
	a1JHAYaqsm+7ZdVSvzVIJq/ZDtsjBlXnEyipOsSkU6PjSe9OWNBrIOihc9kdES/pN1T5xI2U1AC2n
	15ZXCJkyQS1jFOQn0PWCnm97z8wYwaE/y9/6sFizJEBWvs0p9XZpTMczLbmPi6zRxc/MQCIQIeO1z
	kPh1aB6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQtk-0000000ADjk-2T1E;
	Fri, 07 Feb 2025 16:08:08 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQqj-0000000AD8U-2NLl;
	Fri, 07 Feb 2025 16:05:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cF064I3pfa2T0dVSWmKSVgw1xN21ux40bYKvn0KA9pqpeXBDa1ZZd6WNUahSSrwJ2TsnrIH+xK2MN3wHGgDfr6NfkJotICOYumcQRgPDR1qWNDx1dRyPFbFRyUBCfHf2OKcqoCv6RbZO7yos5gB402XKymjmRnE2FrVyDRviQCk8WGWxv2KH7X0YL8O4ffn6qb/YcIlcCJ6x7SFklyBq9JAhYxvxoQZpRe03mlIx8L0MXALBeyYpygxc3LVi3z5ZWfgpfuMKsClxAy7NThkhasUGNnfnNEJzawL4Kpw09ZebGanOTzNaZy+WfGcaDWiMKt9ranpVw21sNs8HNAfEOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oLQeMbJifdne4SBDc1v0kcVsA3kayRbQPRLmAZmH6g=;
 b=JTev3BWAg6FmTnwkOXP5m6WzbOhVstjB9NLJ7yKwJBMmKmG8f5JoOrz9laGye+qEXIpBlOJjZfQIoiyWsnidrNlYSnP5o8sTarOhGd5aMHNBt0e/zRAqBB0+69KSdJBuOgKolg7k19kQXDngdMKJCITPsSczR8hIhDTUxBnUiaOcywYGKS4LG9RwFRYVU6uu/3L/tAwFuo4x2eiTsUatQIPtd+cxZuEgdF1UIKaaY45kjsQ9t0GfLEKKR0VslxNggaQdykl8CgMYjETJ+9SvKrN+i5HYHshq3mpUcFhkic+Pnxi+qOUIB44AVuteHdvLN3EPd6N5HiUv26FVIl4fpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+oLQeMbJifdne4SBDc1v0kcVsA3kayRbQPRLmAZmH6g=;
 b=CuS4COOjFY9COKdLxfXb3gERXUdQtJ0wEpxW3sTUAgPAj1op8ahSoP4U6LABL9FD5IamZvHsOzks0ZmAwztiD2Gb8ZE1PpfdbkdNKZVrcJ4Qz0lurVki5yyGJQv/fAAz7WCdqVDZvWd4mA9RQ4z2ylFXdO6bX2dTAoxe9NR4QKqBG0so/P+W1BaT5qpnAf9SktqJp3idecb6Gd8AUfFcV9iGDwFNtwtH3s3vYoqdVJxgEI2j6ZNjpy8UJ0YaesfIgf8ZdbMLHWmNJYqQjkqu7PouJho46gOeQSSfFHpf9YhfzDRDaNfy8m3np/Wi1BRTHtcip/X4G+nPxTaj/u4fww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10173.eurprd04.prod.outlook.com (2603:10a6:800:245::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 16:04:52 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 16:04:51 +0000
Date: Fri, 7 Feb 2025 11:04:44 -0500
From: Frank Li <Frank.li@nxp.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: disable IOMMU when running rk3588
 in PCIe endpoint mode
Message-ID: <Z6YvHCT51CQxlqkL@lizhi-Precision-Tower-5810>
References: <20250207143900.2047949-2-cassel@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207143900.2047949-2-cassel@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0209.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10173:EE_
X-MS-Office365-Filtering-Correlation-Id: c8bafec7-72f6-48d0-a5e0-08dd47912798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i3bMA8t3QQZsO22gc40yZWO/UPBSWW6kbkZNvDb7qMv3wSpWL5TLSe3bM6f0?=
 =?us-ascii?Q?xYeYmavmbdFmMmYadWXhNJQVDy04nno4OGP8ZU6WR2DtUpBxHWqZ/Ifvtnto?=
 =?us-ascii?Q?alGKAkXcAyu6WVhqoqhgdBtaAw2sgOp2JWKZ0I6rrpp5ISikYat0cU4ipS3t?=
 =?us-ascii?Q?k/s5zWkTvOy+b3iJ1J3ZNDdGZPBuqxKOO1ZIVeOQmUCzunB01uPCAVyT7CGM?=
 =?us-ascii?Q?i1deyzxbQ3Rw71ZI7lTppn4ik20/gFRL7Vo+VUUdEtTb0jk2qalf+570JAaP?=
 =?us-ascii?Q?F5GKP8nkNZwYF7E2UzWp8quOlIPO+Hqjx+5c5MWJsF19QA5pd1YWCgjG7did?=
 =?us-ascii?Q?Zy41xRABPxw41qyzI8FhFkytj8BrlgQ07X8t9ry0JNIYLHHtDhuAGMZJWs5x?=
 =?us-ascii?Q?4pSBEiBRjdwMcqXArr9Lj38U8y9eU7Ae6BBLMqhRiPdvZCKf72StlExpzWqR?=
 =?us-ascii?Q?2FULqnmeifYoSYdIfQQSwXsRbEcZI01oJyk82YcutZOiHw1VaytZDd2xAa7e?=
 =?us-ascii?Q?i8VoStvrHtBEKdxAztQkWjFx3QU1fRyYpkFTscUoVTXN8AaqgtWm2g0yAb0k?=
 =?us-ascii?Q?pswqnSKq/Fl0NxW31VGSTA7hv9XAyPYgTsN2pY/1esIwbUf3dhIeSEdNpdEz?=
 =?us-ascii?Q?gr04yQFwp9Nsbq7bBm1vAWbmxHQ2mMSkRovbqtIDa4TMZCg25DLlR+jvoulU?=
 =?us-ascii?Q?BITYWhBHAiMqFc7xHCE6nFFYpVcDEo1inP7iPArAm3xbeWymR9DzLqwnJ/6T?=
 =?us-ascii?Q?Uf8ARyayEiExFNOOKstb9XcFLGXTXeKlF6n8QZ/8hfflmKvouUMEr/2LWpWF?=
 =?us-ascii?Q?EX74TCsAV7SerklQB9CIoabNuylwUYg9OCMil0+czG/9H8pWMsVpOT86DKBS?=
 =?us-ascii?Q?tjHsM/jMlS3fJ7hFhksJZ8qES7qmR0fYkN9291hIcs3CdxhtjxnM1AId16tj?=
 =?us-ascii?Q?OCDv/AckaCG7V2aHn9QiwuuvRIm2zGpU+Z2xfw3LSpdMsd8ZCTWWyLcSWCv8?=
 =?us-ascii?Q?/akSGuJwjV537hZbW/DdstIUVfoRGxM9cbuX4lMlbQAZbXubyjZV6A4LTccS?=
 =?us-ascii?Q?tnaXWYphgSqhqL9UWKpKfVzFB7JwqXRHO/FLZunGosvEshcuIKlY8S5+5P67?=
 =?us-ascii?Q?48N8nnO7/bUuJFfq7h7sc1UlMsYtJxZWqy/Yl9XwWqet87rEkhjPlG4RjfUZ?=
 =?us-ascii?Q?O2eAGhoqkRBPIS3cB+W1ySSWAW9bke6JrwGSjfkdAyiYX1ByODy2LwpYCgIs?=
 =?us-ascii?Q?3G23LRkNQ8ZOF6CoEq6D3WnmhczC0NVavKK9FGJWWiyf22qWsz5KUL5e06nF?=
 =?us-ascii?Q?nr0FuBAgEN16HV9xkkMUr0VZY4lTqCyZ/47oUh5OX08sQ7w3cazQ7lZTPKxo?=
 =?us-ascii?Q?r0j5fiy1XgioaFLy6Sc83e8mCvRxfoLtXz+NxtYm8ObCeZEatHreD1k3qb4w?=
 =?us-ascii?Q?NH/XZ1S8m6nIjnbe91ASp230n0+82MKx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W5aRn0U81RIV1fIDOUnHWdjKWYTyTXQrXJPdFf2bey/stbnB991yUygmelbn?=
 =?us-ascii?Q?bZHa0h72djb42tlKsTpuBmD36nrj6MxNAQXhTHll6w59VCjh+30SJQh1c8WD?=
 =?us-ascii?Q?PYLDRrAZ5/nrglscRL/sP/SHQ/gXzabTNHEk9qeFmxtYlLX8AVYcoWRzviA3?=
 =?us-ascii?Q?zfzRoiwv+cP5DLzMInT1F+dbYBMWGJxQjm+62EYQVTJM5kKihEfO9ryaj+rh?=
 =?us-ascii?Q?SYvpQgg/K/OGjsz2OOLxyrNri5g41RME7oIBvFGTf83ozH6ygfE+Gvqczkw6?=
 =?us-ascii?Q?Ld9AzNvWtgJig1ydcFe3GLii6xUW/YtW5GHHNa+1kbjRQqm7zAe/N9Xrzpgj?=
 =?us-ascii?Q?TzvBhKYoJjr6FD4srMHoxVVvAHf84H3PRxqkGmZ8mNSg4WKzn9TfwnVlIEJY?=
 =?us-ascii?Q?RAA52aZQxHHR9/FBFudhJkyZTNFgBsMdN8MeZ5hvA1xcTQqcCN9bq0DW7HU/?=
 =?us-ascii?Q?lx2lmTddVW1WAjcAL6KmURoCpeFmK+/PNwz6ATDo8CmCp36V7+mP8PoxFNy2?=
 =?us-ascii?Q?RTFGyGP5B2Yy9/3H6qyJRlMCBx9oZheRuIRM245/4UQdvgKqkrmzC3qaiG3T?=
 =?us-ascii?Q?Zd1Z0T7AWQ9g/64YwGcz+6auetnzyQ2LtY4BPJuAFrPRjDtf+rkNEwQKU+RA?=
 =?us-ascii?Q?HoW7oISAYY9ixyk6MXAFuPyRcgHClOanHf6aEl95LsoBbUapEG8Yjdzhdy9t?=
 =?us-ascii?Q?hATRG5r9bjTWfIIBrDHINaTXsTmFX53y6PenVOBCzYFGfbM//rLWw8TnWls7?=
 =?us-ascii?Q?FhBjDDONe+GQMbSD/HEyuOWiBcYxuWtIS1cj7PpI0X6uvHxoCFu1/VAVOHtD?=
 =?us-ascii?Q?risPB0jl/P8xHwDVEB1Hjk7V9zFYQVI/ndzuW3tnwLVYX1mJRubzZ/F2oWeb?=
 =?us-ascii?Q?kh98HblOuooO+VekVNTOYkdwyZpLTFiiJlzn5+F2w32QvZjE+UYkU9va3aam?=
 =?us-ascii?Q?wJaQvgugnzOykEk7jkHY/xDVmLZ6X6ajVkhXflpO/LNH+ORQy8kU2U5ftq16?=
 =?us-ascii?Q?bwOyCEbUwNSlTdxZ+o20m4dfjW1oNBxUV7z1SihykyHSMN6ZnGkpFalaewIO?=
 =?us-ascii?Q?YnbRAEGlfr8XR8SWbwt+AKDQ5HPP/Nhmlh0U4IZLmFpVOrpkpZcFS4ao2sfV?=
 =?us-ascii?Q?JEBi+/lOmIHpFL5unxf2Jd/QPkfBNWmszhBxlRfqa69EXN59X32JJX5zwYBq?=
 =?us-ascii?Q?NCnMIQyusCbk3jsIXxhpvnUbxnaMLAEHq4Fr+dkyd27jyYbqoYkqjt56rNCd?=
 =?us-ascii?Q?7NLXb1gy+fL2StyPjFD/YDRwEYFEOZONPjqYIsntbMvbFYI5e+j9CiJf1fQK?=
 =?us-ascii?Q?tGBZJOS2nLCTpSj0+XQ9BsJavDrVNfCourAHfXNjf/S11e+ErFR+9n7vO0+B?=
 =?us-ascii?Q?/M5DGnenK0Z7h95uVGPxN/Z/ilC8Kyb9GQreMQFaLWzk05tshzioqGXaoJhG?=
 =?us-ascii?Q?wGdaDBkjeu48CEIbA5RFbjowsqnrE9624ZmQHotqNKBmQBL+7laNUIMEetMq?=
 =?us-ascii?Q?CVZdcEr7RgPXlPPHa1sUEwlmbXwNvHtt/Ylg3oqxS90rEsMItrr0RGRVcraq?=
 =?us-ascii?Q?XPRw2qUdlFnG5KxywtU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bafec7-72f6-48d0-a5e0-08dd47912798
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 16:04:51.7789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZRw3eqz98mjzKYlZyKvroVYr2nDEWhLFyZU9kvQtjCoE6gSislbuWnvCYMOuWjRww6Lsvdyf3RH34o9BTcpZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_080501_608588_F88E9C7B 
X-CRM114-Status: GOOD (  29.44  )
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

On Fri, Feb 07, 2025 at 03:39:01PM +0100, Niklas Cassel wrote:
> Commit da92d3dfc871 ("arm64: dts: rockchip: enable the mmu600_pcie IOMMU
> on the rk3588 SoC") enabled the mmu600_pcie IOMMU, both in the normal case
> (when all PCIe controllers are running in Root Complex mode) and in the
> case when running the pcie3x4 PCIe controller in Endpoint mode.
>
> There have been no issues detected when running the PCIe controllers in
> Root Complex mode. During PCI probe time, we will add a SID to the IOMMU
> for each PCI device enumerated on the bus, including the root port itself.
>
> However, when running the pcie3x4 PCIe controller in Endpoint mode, we
> will only add a single SID to the IOMMU (the SID specified in the iommus
> DT property).
>
> The enablement of IOMMU in endpoint mode was verified on setup with two
> Rock 5b:s, where the BDF of the Root Complex has BDF (00:00.0).
>
> A Root Complex sending a TLP to the Endpoint will have Requester ID set
> to the BDF of the initiator. On the EP side, the Requester ID will then
> be used as the SID. This works fine if the Root Complex has a BDF that
> matches the iommus DT property, however, if the Root Complex has any other
> BDF, we will see something like:
> arm-smmu-v3 fc900000.iommu: event: C_BAD_STREAMID client: (unassigned sid) sid: 0x1600 ssid: 0x0
> on the endpoint side.
>
> For PCIe controllers running in endpoint mode that always uses the
> incoming Requester ID as the SID, the iommus DT property simply isn't
> a viable solution. (Neither is iommu-map a viable solution, as there is
> no enumeration done on the endpoint side.)
>
> Thus, partly revert commit da92d3dfc871 ("arm64: dts: rockchip: enable the
> mmu600_pcie IOMMU on the rk3588 SoC") by disabling the PCI IOMMU when
> running the pcie3x4 PCIe controller in Endpoint mode.
>
> Since the PCI IOMMU is working as expected in the normal case, keep it
> enabled when running all PCIe controllers in Root Complex mode.
>
> Fixes: da92d3dfc871 ("arm64: dts: rockchip: enable the mmu600_pcie IOMMU on the rk3588 SoC")
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

I notify this problem when try to enable msi doorbell problem. Some system
(may most sysystem simple use PCIe Requester ID (BDF) as stream ID. BDF is
variances depend on host system's configuration.

Some platform supports mask BD. The key EP don't known request ID before
recieve a request from PCI RC.

May we need discuss at PCI mail list to figure out how to resolve this
problem.

Frank

> ---
>  arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi           | 1 -
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtso | 4 ++++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> index 42b57e27ee4c..b5feefda9d2d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> @@ -215,7 +215,6 @@ pcie3x4_ep: pcie-ep@fe150000 {
>  		interrupt-names = "sys", "pmc", "msg", "legacy", "err",
>  				  "dma0", "dma1", "dma2", "dma3";
>  		max-link-speed = <3>;
> -		iommus = <&mmu600_pcie 0x0000>;
>  		num-lanes = <4>;
>  		phys = <&pcie30phy>;
>  		phy-names = "pcie-phy";
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtso b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtso
> index 672d748fcc67..f229cb49da68 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtso
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtso
> @@ -23,3 +23,7 @@ &pcie3x4_ep {
>  	vpcie3v3-supply = <&vcc3v3_pcie30>;
>  	status = "okay";
>  };
> +
> +&mmu600_pcie {
> +	status = "disabled";
> +};
> --
> 2.48.1
>


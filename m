Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1813DC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 19:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoGmjMqIx5Dwqr3SsHhNvw0fOhzhJL7KispYEos1YYw=; b=cJaZzY4u/Xc5sps4IZlsh1CR87
	A7uSKn1h5EbU/RawhrLCqcH22ANzH+uUFJ4jPQ/k/HuBP5FifyuXWtBImaKRkvK3yzHj9xlb1WUtj
	K42kndtcG6Tsr7icupbaDf9QVOPtXx0fNXWno9cQhBRDgtLQICpDRGMEDMsfXKUg+AL1I4zwEKnHe
	pmtLrvzy58gKez697x+gW1caPr2Pg4PjQ2QHhkk2+TGJVy9PHkaPrAS6Jh91DK0Bwvtp6Ix3DHnTX
	YhEPCN7ZWO0/gJHcT3hVCqoYbY2KAxV4ajpmcetz5DS5BQ7KcbOR7pTVgbeAOic6HfdU1NH8yiBtt
	zdf0n5+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzfq7-00000004iW3-0qNi;
	Thu, 27 Aug 2026 19:32:43 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzfq4-00000004iV7-20KF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 19:32:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVUmkvsqRc4bcQOqREJG3PnmLFqDiH/zrBmQijiP1zfKYFAs1VcpQzCYWK6k5hd5SfEUgOo4xFUEUdwHp7nL3XJp1/e3XG2adShVNTkYoum6d9fQfUtzW8tSl4hGW6B/RHa73eVR8daC09ttnjWNjPlZkIisOTp/S7WwPENjX3e4/BPJxuKQVbNUmKeVAE9BV3dE3yUCrtmDubsZoo6GJJ0ClVuQw5wWE26EpfStr9g93e4E6MnLoKI7N9DMposQSR1go+uU10N2mO9OATyvLPzxap+9mSMAYLM0ERTqXWhzo4H0KsZ9zfDrsDlObP0cZtkrXSep01a/o9srvsLt+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoGmjMqIx5Dwqr3SsHhNvw0fOhzhJL7KispYEos1YYw=;
 b=oaesmBkH90NzhKidwaxxnMdQFr7MmENxaaUrlgRC7r1XIZSvWuGpg5ChsNKeELoc1NJD6zmJ4waAEBWn4G5gGhgLS/U4vjzkSHjlGajuq0GJJyMo/LwG9mi0p1VsH+HGI45n99rRRvu5HxOF8MnXDpyE80IpzXRs4AagGNtgFcWXm4qGG8AOBegjJR5Of6lAj0IplSqfgI0RmHfmzM4r3p6AaVSdoykgk52S3ZBoubiF2wW3sa1A3f3rNC6TMfhk8qmOJQ62D+wxoMRg5PKabnhX7jn7DkaJZzhU50MY3jzGw/Q5CbB5bexLGYTM13U/4OYoCBlXaYFrvVjmmji61w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoGmjMqIx5Dwqr3SsHhNvw0fOhzhJL7KispYEos1YYw=;
 b=EBry+nJcTzdph6lohbyqfc3WXT9X3bordrJv2/UTEQAvM5cbiEYXTLSEZzQpuv1Ls2Hy0MAEWD3mvkRlc7feZHTlpqQJ7SoLWc12JgFsY0mbWAYgAUMkMGbxqb+MmT8W1UY8AO8iPmV5WAyeSqlA0cdlbDgexS1Awku0MEdVt6OcwNwr/ah73yOyBwMAtiAvOizXp2ihh9+j91EnftKPZ/mVP35u1FId+b0drEb8pAMUCoUZnKsA6cQ+dv/ctfw1Ojfgj0GpKD4pFKLbbR9F7QxAQSK2Ix2/BnjVHlRi9eEvokKrNmPXtyyr4uauhKYmVLj2tpqUCuNLetx4Iviudw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10779.eurprd04.prod.outlook.com (2603:10a6:150:21c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 19:32:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 19:32:31 +0000
Date: Thu, 27 Aug 2026 14:32:19 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: Re: [PATCH v6 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Message-ID: <apCQw3St9NXgm260@SMW015318>
References: <cover.1787851637.git.stefano.r@variscite.com>
 <11592f9d727337fedf02fdb107a24e935f3ebce4.1787851637.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11592f9d727337fedf02fdb107a24e935f3ebce4.1787851637.git.stefano.r@variscite.com>
X-ClientProxiedBy: PH7P220CA0144.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10779:EE_
X-MS-Office365-Filtering-Correlation-Id: af4a1c1c-b660-402e-8145-08df0471ef8f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|19092799006|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PZcJ1O2qH463JcBeDdeUiOfZdpCAUU9+bxMjQwptZYUgTyI9PaerbM5wX3Q4MHfs12GMEXWHtk3vQfVFFP6iHUOwfK2sfzciPqnCwW/ZRdRoNIhZ9tChILA+FqWVrQ6ri7xx9u6ot+6DDkYvxbgICUX2zqmOSa+Jvx0bSY1NKwYyLtUryBt5Y/jnOwc/jiEKfD+7szFd4jmUoAq/GStEHYPUFPeMx42PMD+c/DTjbfNkWXkbUkD855hiI55yRXiDGkr4g0F9efRQskkdi4qNTpw2R9o5fLprCZbZfhck3qfWxB1S6pecmw40apsDVt3ISSmXzoq4Px3pFx3WMBZQREwMk75NGGN/89rTlJZVEcXu8S+dZaWldlASIproiKYpNVFueGT8XghMU2RSMdaI9VwamwmgpgOZ3jfYmEGOfub/Jcsd4c2pozjxDviG8RiW8H+jPIyU4lSaVerRGFnWaiIA2xpyrxCkCD9gKGS4WjhWCwlXCzf1vxBq9iY3uQNnprnM3j3jE6N0Pr+Ef+U4JL3RuNDm6YzOJ627UXjq+NQtSYS/GXyL7xbr/V/6WemG9vOqbU1DtawO6DInaktUAk0ed7q09QE2GfxjeQ0D+hQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(19092799006)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+qMQ80y1OLp+CmxiTH9xQXBxklXWFh8L4SYWCfqn4emRxmutB0Dj32awwH3b?=
 =?us-ascii?Q?VRlmWt71/asyk7BaCO1shRR8+Nrxen8lL/mPj6Wa/xdMKceD/zru4PRAHr7K?=
 =?us-ascii?Q?R80ZayTPpqNkEZtYFa6eGAyclfhUh0I1Ui405Mq4p95qrhoo4ZLwXx41Bxq5?=
 =?us-ascii?Q?yzjFk1sk/6fqsJxfnLgsxcPsMvE/Yrzna7VBkObBrCM+Huznjyfebn5DR32f?=
 =?us-ascii?Q?e/2IVruOlnO7TQEN5T3uAp2CJTSP9C285XcU1fS98wH+49iMl7UoQouL7/NQ?=
 =?us-ascii?Q?ErQ6EzTip4boMvrrzqALytgzaft9/4m0KMPcX7k/pzo5WwaQM2IzRa3mARES?=
 =?us-ascii?Q?zSitFZ1f4MWJ1U7p5wA8R8/KccKsUYXBOcFAB9XgF+zH/jatBFlw234iz5qs?=
 =?us-ascii?Q?VHw3lqB5dJdySXn1bTCeeDTMmw9servOEJi8E8ZYI/GDzJn1epmf0D7xjGFD?=
 =?us-ascii?Q?55LN4mYWH4kSuFDMfKyYxJZ2PyfUjkpo/0znigaOFvEPsaqowzCC0pL8lZtp?=
 =?us-ascii?Q?bwuQvLicnVX7ElpH+DhOCauu3agB8VWqNfwgs6LKW9f4oH/bqhuulimlh9BB?=
 =?us-ascii?Q?sEUnBln9mfsD+yNsXM83JnR6ODbQ7dHwIGorAFaPrpFq4CjPeaHE88PpgD62?=
 =?us-ascii?Q?BPqwADChH+DbU1W6rIXmoucfr0uj2hZZq4GjJqTCFAnKPuLclNx0PSv8qefE?=
 =?us-ascii?Q?kYIs6wehaXqQ8ku2lkjVUZIgXtXzM0tqejcsAH+9z5rEjJWme5ak85HwpPcL?=
 =?us-ascii?Q?sbaVW0QpDs1PkNCHbWSxaKUi6XHUAe4OHUO6uarDtxt60W9Tlr4BVRBC4DC1?=
 =?us-ascii?Q?EBY8A3GGtaz+k6mVhzttvZHtTMkgrQeyrbXM7kRh4l2pXoC+k0CSOVMiaYm2?=
 =?us-ascii?Q?ioGu6yzLX+oKH/DWVp27IzR6nIRYRupm7Yopzk2ftvJNdMlOmlJpmRZnfOmm?=
 =?us-ascii?Q?RQvF8D3FCIgpUIKsUcYgKHc2aLsy4+LteUtiFuClGaBUOQNVxa1kB7uRBUcQ?=
 =?us-ascii?Q?HJ5eIP9fZR4QMU2C5ZRJ2hAZNANGaJVxc+BOF9RMVR18GoqfZzqSkMMiTl8c?=
 =?us-ascii?Q?lj4ib4b2UFKR8hvJBOnHBkK0CNpWbfClD8+jB//297vysBskxEOzekgrzOL6?=
 =?us-ascii?Q?27f0R2zle1IzRx5b2KFN0Iwd4ts5XCzjtemJG7ACm8XQkcDb+dUPkg/MtqUE?=
 =?us-ascii?Q?an14KgXh8eCL87pBLrfZuagnrdn+mnk6mz5B0fdBhsiEf6iyA123pP7KuBBH?=
 =?us-ascii?Q?lZfaY0FhTU1L0+TTPEcX7totdx71GNxAV0Jk7KqvxwTSb1UaS1DdqfmAy8B4?=
 =?us-ascii?Q?LKcVKndia1md5AmgW6fwsLCiVw999VaqTTjq0m0dCVxbCJe0W5siJpyFXX30?=
 =?us-ascii?Q?geAs2UnDVfcTXZe04ART+uYKzbz0uicUHTQJ21/Pr/5NPvv6B9lPewFVkgLp?=
 =?us-ascii?Q?nWWOCLlnqWs7K8ik9SQdsbdD2UMX4h/3GQPZ3l4Z1vzdmvE93S7/Lhrpwke4?=
 =?us-ascii?Q?0ZDwhXLz666z4XibqnA1uZ7P6suH6aiLfAAwZ3yvzR/henZYNxVqGyWNAAYZ?=
 =?us-ascii?Q?yM9OvHOMO1gqF11Zc5eUUAoVNi2pDWqVWapZm2MmDToq2foIncbEFUlSWhm3?=
 =?us-ascii?Q?7nmZeig+Qf8rgkGRLXr970h5o7JVi3EkEiw2+lFkPbCw5O3sSdPrLOrsAyeb?=
 =?us-ascii?Q?M6UN5zGKBPIc7nk2/Z8TMWck/RDAfWOzMLyr3MHylR6F6nNSF0sSCCBGUXYm?=
 =?us-ascii?Q?BRgzY0lrSJwWWbMQVMHuz2tsUyfDCrKnfZ1i/POeTC5eptyL0GFE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af4a1c1c-b660-402e-8145-08df0471ef8f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 19:32:31.0383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0FFcRLkbb/l58f6frwFqZoxb0gC755EciK8HsZrfMW/CnChU4mE+UZrzlS1RX/ygcOOQl+d9UPOccvQmYMOrTVuzy5eGF9Eu3jnFD3dsDriviZfK0ROYF7E0fhfvb8z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10779
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_123240_522970_27E3C13F 
X-CRM114-Status: GOOD (  14.50  )
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

On Thu, Aug 27, 2026 at 07:28:47PM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add device tree support for the Variscite VAR-SOM-MX7 system on module.
>
> The module is based on the NXP i.MX7Dual SoC and is available in
> multiple configurations and hardware revisions.
>
> Add the common SoM description together with support for:
> - eMMC storage
> - NAND storage
> - WM8731 audio codec
> - VAR-SOM-MX7 V2 hardware revision
>
> Only SoM-specific peripherals are described here. Carrier board specific
> interfaces are provided by the respective carrier board device trees.
>
> Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> + *
...
> + */
> +
> +/delete-node/ &codec_wm8904;
> +/delete-node/ &wm8904;

Now, don't prefer delete-node in dts, which make maintaince difficult.

imx7d-var-som + wm8904
imx7d-var-som + wm8791

Seem to other, why not use dt overylay for difference audio codec

Frank


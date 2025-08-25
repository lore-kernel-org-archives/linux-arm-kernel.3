Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69F0CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 16:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDUGguZpxePTywgjsy8m7l3lzaHtz+hNpeGwcPRSqzc=; b=vmfroMspVqAkz6PK0JzjGYx4e5
	nWe9FC5e/Q6h2BckrYO4onP2KW/DwBUrUZgmR3TzJ5DHRmWEV07EZcJelmiV5mtSErwnNA+W+Ex2J
	p2V3bRvFBpvBqQLE36H5ADuuSuR3K8gl9MSvGYvbYKvONIIfXY4YLOs4Z+G/WYdnM8bJbvt8y2A/M
	tXvUGkp0kNJnhDrOPeiljzjwEJQctNi+QpP3U3zSVzE9UIYzar4tyYBYLYSEvsH+kB2Cn6FIQwmWd
	z2ChAy1ztIvaHycOG62vSLMxRg4T/VHVrOH0iFIOr3SkDtuRbBIAsQVjvGqNeyE71I+rD2aIRe9n0
	2hfBmQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqa6h-00000008fl8-3RJc;
	Mon, 25 Aug 2025 16:31:43 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZIg-00000008Y2I-0PyF;
	Mon, 25 Aug 2025 15:40:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3R0od7x7LGRiTYG17x5KPAc7b9i72IxchOJRRJGThrfP07wbN8/eQfXFM9KPuZ0vkLMbfzrbMxhjvKXX4u93H/A9UTknKzcnoopNyFux2Y+yVoGK+jc++CF/C2Q+5fY7YEtUl1P6MsWaqROahpxmRy4WuFAhm4OZ777vND4ZG6YrMxhNqu3eIR5fa+JfoKsWLqLAxKzzgbT4SRL9wVc0nm4ZQ/eetOsmS4Wq3XSfitLnM7jR6scRkESIzfmheIEQslqrYESlrXPF8J+W7kELl1IQQca3cDUtt1gl8vCGMadutnFzardZ87OgnVqRQl8So/E0CzRZ7nmghxO0mnISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDUGguZpxePTywgjsy8m7l3lzaHtz+hNpeGwcPRSqzc=;
 b=hsm+5lD8n4xAtlJbFQIi8bs3M+TuUZWT3H7oyKplaO9AZzCnfuYCKvXcHNaXrUk2PXGGFIiB7Q0zi3SeNqjQL7Ypg++f3/E9lwZt4zwlE+rcX/Vry1ESKTNBBE4T3LhahhHvEXs1fB/kullswCXEAXY6T63BGHoouD2vYYSmxZef06KnMUs9SZIsD6BRRxGOoVJ2Gtpi0d52HRN8mAwJtO7kLxeWiEtodOnH6RARNWZBpNYFgITedoD+BsfSUJNJpkamjiR+md29y71MZOS1CampQQzFbsRU2XapeGpdvICW+JjWCyrC9GeTSBU6DGpSZ8G4Bc2ffapFdngvk5se1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDUGguZpxePTywgjsy8m7l3lzaHtz+hNpeGwcPRSqzc=;
 b=JleO6wBrSHDULoxPeslIWSxbipyTCm7RP/WhieScitbL03Mfh6Dj6vaIriTkUzOCmDJGpWPRvI79q7ZCLKbbtIaHPn4zMGsHN8uCrIMkmpMVweYwZ6HvensGu2WjOCFQtzkdhf3YQVzY/aCzxxWbDo1nMUcBvebyS5lmBiFSEq2pYkJ1CSI6yOGhbzswHNfSv6QyFPIKT5be37tFpuzYJaXyUgjlckUQIUwS5ARtZv7opVktKWeHWdFmhV0vdpf812+qdMp1r7Q7lzIn3ceu4W6fjskD0YAkiUuL/FADfeepgtCXbDniiX49z3bDriQQoLtl0PfQf0Yek/j3ysqICA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB9PR04MB9554.eurprd04.prod.outlook.com (2603:10a6:10:302::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Mon, 25 Aug
 2025 15:39:53 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Mon, 25 Aug 2025
 15:39:53 +0000
Date: Mon, 25 Aug 2025 11:39:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: ti,tcan104x-can: Document NXP
 TJA1051/1048
Message-ID: <aKyDvtH0U9Idxq19@lizhi-Precision-Tower-5810>
References: <20250825-can-v2-0-c461e9fcbc14@nxp.com>
 <20250825-can-v2-1-c461e9fcbc14@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-can-v2-1-c461e9fcbc14@nxp.com>
X-ClientProxiedBy: BYAPR06CA0025.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::38) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB9PR04MB9554:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd90089-ab6f-4b12-53e9-08dde3eda267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pQLIEC/Seyku7BdFAT79LZH6Xlf6SiYz0JDrApFmD86e5s64HwIa5SpYUYzN?=
 =?us-ascii?Q?7KkfjlqO8yYYb9r+aqA2BTJhjkB/EPwYAqWg60hFrq0FpXO3cjq3qYNJ9ysH?=
 =?us-ascii?Q?k0k7WQoic/zVuZEz3EPiU9gmAGhCDRRam2+CtYIOkIo32w10PrqtUjNGaKms?=
 =?us-ascii?Q?kc48ka3spptP8PGLyDMF4n3y2WtutNa+Fw6HQHB1n9AFIU87Huk7GxaLC428?=
 =?us-ascii?Q?y81NTfTjP0J+PaZQr2B1P7nOuMNHIa9VhjN9n/JzoTG9O4Xq07AaWaEvifsQ?=
 =?us-ascii?Q?yovoH1fhOm/UXKV0l2rkXTfivG7T2kC+x9XvQ3gN9KyBWYIPx0mp57vNO6s8?=
 =?us-ascii?Q?CC7g7EkThF4iFy8E94OSOM9byfYLh4hTiWdG0mEa8jA4lfCMs7IjjR0ob1ID?=
 =?us-ascii?Q?L79i76yvk6NIGJJJwe/mj7qgh2fHAE6D5zFQlTAlSTngMYI77x1RJIHgLRn6?=
 =?us-ascii?Q?p7KvdVUn346v8V2oeNBuj8v0BvyC7FsQb2+3avcsqEuu5wz45NKwjh31/QXP?=
 =?us-ascii?Q?0e1B8ER2Mh7gFz1y9KAOrGRR0UxacD0ljD1dIsszXludCqi3ac3Y6wN+aOFv?=
 =?us-ascii?Q?h7Jxdz8izrmVxv6EPmHc/xr4hwCep1gjwN51EiUy84bv8QMfOvRY3K4ZRH7g?=
 =?us-ascii?Q?C4yMT2ei5LgaMGY9B4W6nb5Py0nTEM3/or5LzJnMo1VN4hflqC74RrIN5N82?=
 =?us-ascii?Q?d7G4YTUupe8bOVrZTOB1rp1OLEFtzz2CcO1h9qY7zueO+zCystS7da8igayU?=
 =?us-ascii?Q?Opm1VTXi6Wc2mmcraIiq4rpJ3rodYR6zY2s8j4qXybwN/6W9QwDhXLN4CxBw?=
 =?us-ascii?Q?eQ8lDcm3gkkG/BL9Z/c5Tsz/LX/epQDHUbIQCoaO4ROGMVcKDbnzOCb/z086?=
 =?us-ascii?Q?mDHrud3415UTL/wB4vNYHpt6xeA93P9dk14YSw95hKQAI76M4J6qEc1rHJ4J?=
 =?us-ascii?Q?rVfuiLFnbj5W0a7RxkKj9etvQI1qgHV8zL8q+jWFy96UEt6lG8TbGwY+mWyX?=
 =?us-ascii?Q?UTHx8sgS2ZdrRjlAxUbwyS/JxxkpVExaC9bxRBuratxtTubeQLrPlW7VDncH?=
 =?us-ascii?Q?SBbUUTyGq+spPqEqDz/xq0QGQDtKiwV8yntmsPCA7o3baKIZdyM08rVy2dAG?=
 =?us-ascii?Q?Ye38n8Gko+t40fVUcra3+f2z8kuivQvaLnb1sQUFEW5yUGdD/IQUrrckyyw8?=
 =?us-ascii?Q?y4RjipTEBE79Fp/OfDF35DwMoJEJuJI5E6nugvNoXPIrYUF4orQaoiW84Xb/?=
 =?us-ascii?Q?S9VIn/AmyZzupapUY7Q6GoDSyuOQCr1dzmE0EbOs+uV8JH/o6UpKn6lwMcVc?=
 =?us-ascii?Q?9U0L8+jl8mTV+f9EMQcimYHshD1VQXKKorkgc6bo98RR03K1sIb3NPD3uPpt?=
 =?us-ascii?Q?5AMcZPhVc13rRUU6GRarq8WuT5KWRmUqxwHPNhDYFOGUtPlPra058vGbeMQz?=
 =?us-ascii?Q?VrdwdJwZeLslcoqKUI8U4naSGwGgu8ukjK2Uq5UtUqFlh4KoJNn9dg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w2QOQxQk9JprU8rYva573Pg88nL+jqZtVQbeHbTpE0Iw9mJDKs/QJvTurNDm?=
 =?us-ascii?Q?cHoxycnzKSuvEyGPx+hfev1Axe8gK65SHGCVHojGDkY/VYA/5GfsqdLUv/ny?=
 =?us-ascii?Q?2BqnhFBWwmZvm/VoNshN0wVTyXokIo0oTyo9oqiZ9xaXVghmp5vEJKQDw2rf?=
 =?us-ascii?Q?rfKMvi/VpfA7SfwyqaQK9IQ6KZ0WI3Bd/1NZFHtiB7hC96aJpZup+XEgbrxx?=
 =?us-ascii?Q?ux4vXp4YyID+MhL9P5xXJQIbtnddYfW3h/I07TFHRzrSvT2VzQwesB8yvZO+?=
 =?us-ascii?Q?j9LX89uYrepfNfcd8qgyJdUaoT3C1kcGyb7PV2vfiVbJc6wA1k+cgRFsVkbq?=
 =?us-ascii?Q?Fcm0dho5nNmThZD47wX/A8j97c1jL3pMKG3Eg8QotXbB9mwno+zJTGCY9xgI?=
 =?us-ascii?Q?SM8DDkiYgYXm2WxJ/p47qZlaJsSieXi3g8QQWTJv2aa3aUMYAdiCEeuhEvtT?=
 =?us-ascii?Q?bAwAwrWEpZdV+fVk/OXIkbdTqMjEy3eA1aGH1E5IauTTBoFswode4SG174Y/?=
 =?us-ascii?Q?KUxArV6RzZrl1ASFd/k4dz3bpUET+nsXvdTD5aWROYN/RZiQb0tkQDc+noBj?=
 =?us-ascii?Q?dWslKZeIXrnw3JhzoCJLAv3lzgPkgoRv7jph5/G6+9/ezGtQ0RBS6e5+2+fE?=
 =?us-ascii?Q?9LGP60eHb0ivP+i2FvyV3L3sbRAwCVlJ8n8pdVwtw3jBNGMHvsZcHW/4TeUf?=
 =?us-ascii?Q?rSYdACb8jiJ+C43PRlHdLLfMFR0ZumQqS1sMEN6DBm/UDjWWb354vzQR9mrb?=
 =?us-ascii?Q?hkfx4OqsSHnfhXoH+J/wm84GlU1ywyM72LwTntt3JNbukRWtmFr0QZ+0npBq?=
 =?us-ascii?Q?dfLphjH7r8x1tnJrH1CFR/+LxnLtYycvPSzF15xIJWOF57f9i5AJs8SAw7+e?=
 =?us-ascii?Q?kkOeOKZ10kSCZXAS8kk95dyjdmwrUJbmZAlyHKSiUcZ8jdkG0Nn41lcqKqfm?=
 =?us-ascii?Q?e8XMcoWtQo/usOKDu6WDPCi7HB7AEG+mUMobuv9TrgCvPSTtKLgx1CzBtIIe?=
 =?us-ascii?Q?mQg97qrxsZISVsVt460dSkZFQUZhLkL2WP9ru7GfQYTo/CeDEDf/fjQNHno0?=
 =?us-ascii?Q?BU4Gh5XrralRpIz97N5DfZFI5CeiVq483xaM43afV1NtWvOrJTZsx6ueA9Tj?=
 =?us-ascii?Q?YwwrwRVqIvlUINdxUpXcHzFY78BCgO+Yv+3HHFZQcpTEH4wIdQ/gqlubmcHC?=
 =?us-ascii?Q?w9uzckj10QVSM+9LQ9bqPI+41Csr3yidwqI8M3m7/VKMNtsVeDFcs3pF45PI?=
 =?us-ascii?Q?0eJKnIIV8WS1yTRhzyRYiUAB+pDEcHlxWZSfKRV1hMoqUxbZ/9TO01kLB8Hv?=
 =?us-ascii?Q?GgoeE48y64Kg09F0T3ePed27U5WPoCM3/hszWgR43i8aAQGqphEY1mWO5Zl5?=
 =?us-ascii?Q?9PLbpTfz4jnM7SrMxDXL3l7UVqoOhY+LHUNQf5X1S/uqoOECwENGxhBYUi5N?=
 =?us-ascii?Q?qaXfmAAe0xkUFCV+LCY+KsZn4EUquOtDUK9ZL+6Rlgd2ewt6OxNKRWeX7RHj?=
 =?us-ascii?Q?M8ow10z7iyW3VnV+IBUCgXa09u0XAYZmrh4eeFAZ18hkS2RwAVWZIDpUKTkz?=
 =?us-ascii?Q?24FYBre4k4hhw+U5LRLHvUg0ALaHiVyHPPheyR41?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd90089-ab6f-4b12-53e9-08dde3eda267
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 15:39:53.0053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARBKr9JjKNc7GUyVsDqzuJYfguhoqxdnVrPA2jPjF/fZPvC1+o1B7qVrhCULmnVExU1R4ffn+s6xCUGlOl9ABw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9554
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_084002_156719_E61E9197 
X-CRM114-Status: GOOD (  16.67  )
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

On Mon, Aug 25, 2025 at 04:36:42PM +0800, Peng Fan wrote:
> The TJA1051 is a high-speed CAN transceiver which is a pin-compatible
> alternative for TI TCAN1043 with Sleep mode supported, and has a compatible
> programming model, therefore use ti,tcan1043 as fallback compatible.
>
> The TJA1048 is a dual high-speed CAN transceiver with Sleep mode supported.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/phy/ti,tcan104x-can.yaml   | 33 ++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> index 4a8c3829d85d3c4a4963750d03567c1c345beb91..3ae08815225d82b6a09cf8a6deacadbddf781fed 100644
> --- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> +++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> @@ -19,18 +19,23 @@ properties:
>            - enum:
>                - microchip,ata6561
>            - const: ti,tcan1042
> +      - items:
> +          - enum:
> +              - nxp,tja1051
> +          - const: ti,tcan1043
>        - enum:
>            - ti,tcan1042
>            - ti,tcan1043
> +          - nxp,tja1048
>            - nxp,tjr1443
>
> -  '#phy-cells':
> -    const: 0
> +  '#phy-cells': true

need restrict number, although you limit in allOf, still prefer provide
wide restriction here.

     'phy-cells':
        enum: [ 0, 1]

>
>    standby-gpios:
>      description:
>        gpio node to toggle standby signal on transceiver
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>
>    enable-gpios:
>      description:
> @@ -53,12 +58,34 @@ required:
>    - compatible
>    - '#phy-cells'
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,tja1048
> +    then:
> +      properties:
> +        '#phy-cells':
> +          const: 1
> +        standby-gpios:
> +          minItems: 2
> +          maxItems: 2
> +    else:
> +      properties:
> +        '#phy-cells':
> +          const: 0
> +        standby-gpios:
> +          minItems: 1
> +          maxItems: 1
> +
>  additionalProperties: false
>
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
>
> +

uncessary change here

Frank
>      transceiver1: can-phy {
>        compatible = "ti,tcan1043";
>        #phy-cells = <0>;
>
> --
> 2.37.1
>


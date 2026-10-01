Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C72CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiyZBJgbOoYuz5RyNOY2DuPfXiiEPbb+XfqeoO5XTxs=; b=A+IA852X1tHmfgDoh0uSSVEkiz
	JEBQXNwMbv19aTTtmA/pnEp8Ouxmx0xXJ5TieSFx72x5F7paNqPqF8dO+//yPzWKi3Kj9Szwmfk4U
	snf2b8KwVpohRB8FUscMAYrkFFZg/odFSZZnfUToFn7LJrBJYG37OVR/NtL5ChrCOeP5wMfPg3og7
	upCOeSmKBO+Lx/HQZnaAhmZJZq8eDdIN1yuNkiRmuKPXfiuM+N8W/QlJ1KMjdZu81OAp7ZaMY3bBf
	Jt575ol91QX0i7NV63mR/wVtE+/K9C7aAAHe3j8cAYMHnEi5cVHWOg8MF0KB5xwpIJqypSB+QBiRE
	KCxgYuIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHYH-00000009LML-196D;
	Thu, 01 Oct 2026 14:14:25 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHYF-00000009LLi-0fFl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:14:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOgF+0PZfK4xTgN9eH5nzuCeXgUteb5EwOUbKTrLbCailospH12JEot46RdvMl0v474RXHyWisPH1AydgLDbAyU6VGswXhN3+MIv7HD3i25zEBSMVHTqGgoQRKRERJHV8i8F7J+iJOUW5f1Ygte8oiaiGvmVvtx9o2fLqxIWEOZTfJnkN4RGSHV+D3Gg9FWvpXmeIFoHOTwESwX6hW30n+rRdNVAxJ7qrpCKUhuCEtpmYBASHAlyGqrDKW5vwGBHIv3gj/AaA35MdrYQYrQGQGyNW/mWfYhbKgG1Enzh5+dls90NnSnOOptU69zV2RYTx0po1cBHS4dlrsL3IQuh6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiyZBJgbOoYuz5RyNOY2DuPfXiiEPbb+XfqeoO5XTxs=;
 b=rT+O7nfaMSY2Sa5uuZ2Z9Hh7h/UyYMKy8/zt6WLgiUeb8MusUbTPZ/2gqBzgGygd5TOsOFhwPEtHByJ8DTGE3kZmdnq4mnlJgEO9+V7YEFbDawA9ut/mZchX1uDvwmsCJsve2QOXG/eCfaqCumq0u/2vV1n6emX4QeRigQpU2STcloHTjOgfOYDcZG2A967ys1nwjUdVLZ/0CavrDs2AVpoC71IQ0J1y/Ap0HNdxSZ2eQHj/s5ea/PoJ2iOLLeEX0G1cbKH5AqigIQJQ56b0cluhQMie/gYnM3evDEMEbOlpLBOBjJ+ZQv7dOPHvKMgBa8a4WYxOvnywGq8+3MYCfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiyZBJgbOoYuz5RyNOY2DuPfXiiEPbb+XfqeoO5XTxs=;
 b=M9metBCsxho81frc23hLrdDRQ16SSodus4Jdhs3sLdnvhrAvElTCNvsyeiXEsMto5MTtcCGRPG4wCHXLtqZjuL6/b7UaVPpdYMpUaA58DXG9hHqJQKpRP9vtCTS4IU+/1e7yis1PTcKAnxz+jKY1hv8D932xsCY8z6fagdkzp0FIrVNKMbFnOJ063n3z2ei7hYe9o7V7AnOUkP8MOkzeIiEj7QRXhnploGlTqWiDBngGG9TaorFl78/k+oxVwFao0ML7xefWJx/z3Hmaz3OW6LKbiI7v/FHaIhopZ8fl+vO6YcVFpKWkmFP7RgX08TnwVSgzpuSoJzJxdUClthOZww==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8302.eurprd04.prod.outlook.com (2603:10a6:102:1ca::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 14:14:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 14:14:15 +0000
Date: Thu, 1 Oct 2026 09:14:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: connector: Add Toradex camera
 connector
Message-ID: <ar5qrJNqp6pt40vY@SMW015318>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
 <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>
X-ClientProxiedBy: PH0PR07CA0035.namprd07.prod.outlook.com
 (2603:10b6:510:e::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c11816e-8886-45cc-659b-08df1fc6463a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|1800799024|7416014|23010399003|366016|10067099003|56012099006|11063799006|3023799007|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Al9TgdSbZgjTMekI33EI+By4MiPgnlmtwaqXrguU1gK27T5RN4+Ube7PvyQ6n34sw2iHX8+YoYZUCtHfa5O272TesorETfi3ezecbIDYA4p4q78eoaXvRx5Od4gSjI6w4G2Zd7AQTYRALhv/CR1FECc+jAJN+MSbdHEVeZj/rsCOUA4qhRrtqmEtfvFJb1Ehkx/7ZnlzgsD4t4UFjeIarqjjWtVfD/MaLK+7MPsZTjO5d9siYt3EwS+qdOHDtXEF40AdXxjYbopWboWCT3r5pNmTxv0MWWRQ/WCRjODEeUXAmizQCESHAp+EummVQ2eO78RuOHkyNt1JwSTwq5hdpOij4FayUGE0uDw47P5c7/1n+z9Vh2jPKPqwYgvyg2cIpTBe9tTrRanhT7U66zQ5i1IQn6BD4Nmqlro95qqEKVrl2DlaD0c521S0/edHygY1lAgUBIOJbEDreGh3js0aCXmoTspx8ATsJDsvggFkhm8eEyk4CdknUYXPc7sqoJ4lucOWINxYI99+i568Y0/oeC9Tx+TzGV3lgq0ndAAln25+uMGKtkZO/pws55E/D5svAgaKK4Z13X/MFEygvR4UDS3i4uoy9MvlM3l1QpvMMS01e150zOiqYMtSPcgEVV6m
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(7416014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(3023799007)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X5FhlsZvNBGfb4jo5J/YJiX2dj3e9EPPm2WnkZoGihy8b8uZXd5oxjkzi6IQ?=
 =?us-ascii?Q?+LpsNVUdSlLEV/dHwZTuKjKAhXAm1A7Cqxg7+NVd7Soj6vf4hamhj2n7Ql34?=
 =?us-ascii?Q?ItAd6wxstpbkrfr8Bns+k5dLgF0m29/Ivmq7JkP6Zpe/f8T2MtALqdZh0Lh+?=
 =?us-ascii?Q?5l2WDsHtJo0zDasZUQumBzWR3XXIo+a4uHYTwQawMNuPrOIs63KAe7333dhf?=
 =?us-ascii?Q?/lC54tAcM/61zpEJTXNWUh3sqaOWSerQnmKVAmvOUhBtw6LvdYMy5/PA+O30?=
 =?us-ascii?Q?S6ZPHTLQVjMllppiJaZbOevtahUQEXlILGZzFN+6LBp/Pq9m5i18EcpiLZIk?=
 =?us-ascii?Q?TrBJiGclJNXXFm6mEZF648zVbaExmDOEkAvhcDiF9iiUoBcNeh3RpLtENrvV?=
 =?us-ascii?Q?7OZC/jDlG4Cff69mKhWMJMJsQOveceg1vPcXpt+DHqeNohTabAjScIp0kpI4?=
 =?us-ascii?Q?LjZx2bsBZDrGcuGhfPMXeQCRby0jR9xVXJtVk56mnhmbX5E+z4/s2FnzVnSk?=
 =?us-ascii?Q?BB4wQ87hU1SL3ysGdfQAIA3YtRV7fIOxvizSa4wMMbltbKWWWpMdrnQzyn9u?=
 =?us-ascii?Q?3WDh0GIOOxyshwmhfqvESlX5MYJxaWHZkK72b1dAjd55NEGI5MT38sooJ/q7?=
 =?us-ascii?Q?rgP1HYAB/LTSko2BsxSI5XZZIZT0dUfjp7u6s8dSi3zT2miwpk3Xp4nLzv9W?=
 =?us-ascii?Q?zzohS8bjSYzmrI7VwhiAR7rgmPJ4w9GyjZcILy1v9bWegr9QCicf23GUovOB?=
 =?us-ascii?Q?9EBaDCWZORjIoJGjXxqopCmpbRRYqjheGeruPu/Kcj6KNi8NwEJRlsIDs4AB?=
 =?us-ascii?Q?D4F3yR1cIsa9zYqBZ2oLCwotU0bUh9LHsXmddVXVTPWII3A6D3jUHPMROaGY?=
 =?us-ascii?Q?nszGF83Dy4U0tD3N1sndlxhaB2dtAgwACUkFn/q0Jr0UiZEvFXuGt3yD+sD3?=
 =?us-ascii?Q?WQo9JRtYN4nHsdW42d/Av7W3SX75P0ABU3LVGbC7fldVVO41TzWOePcEFTLj?=
 =?us-ascii?Q?Uq/gEyyHH6HAyaRjArYOgR5KXaL87I21a7wTkDfARESAWhBBOsYyU7kKwlcE?=
 =?us-ascii?Q?oRNQe+sBSsDyBGsM7Rd2U4nF4KmbqMdHDh3zEQgcC6K2ze1cBo06z2t/EKTf?=
 =?us-ascii?Q?WRDdVmKIpW/nAWtbtkmGdspR6cKypuv2vfG6IAkYvwgzOiFRLZBw4rjiSLsJ?=
 =?us-ascii?Q?bo76HRcu3F9iTvi5zv2Q83X5Q478j0s1qUS0xS6Rv7/Dw39ntTbZXETfKB2y?=
 =?us-ascii?Q?8zFYRxF6OH8ggX9rSn4BVAODX4DHcqMmAXmkqoX6wMPxiKL6pcbOgnsA78ud?=
 =?us-ascii?Q?OVPqCDI7Lw9yUN/mmaP5RyDn5k49ByKbPfA0mdNbwT8+CZh8ofugClFCepjI?=
 =?us-ascii?Q?LDpP8DsMrNvjseuEpUPxuEnCxTDW7pJ2jU3wchGLnomqHIYZTTRSTqxZ4ZEq?=
 =?us-ascii?Q?fZ/2rva7yfplMJEIz+LGjpDzrVQXkKX+EDJBFPzf6B4i0To+iV1S/mbAGSXl?=
 =?us-ascii?Q?Yw/sG8xtpGj8pnYFruV/fHlVzGyBaPJDIxXXZnb6NqNeC1N8ZBhXeQqnhVIq?=
 =?us-ascii?Q?C9+jbvbZ228oUpOyG+vyAtCRABhP8E7oNUHKvXhLD0H1pkprZlGteUXDsfHV?=
 =?us-ascii?Q?B1sktPTiis/mH8RSfZQrGNYzre4iZU/QSrLAkyt26dEZRAySAVR0KCgI8jk/?=
 =?us-ascii?Q?zjXBbxoTILtFL8pJcv+TAJnDjSUsWIOMnKB1woiUM86RljA6liTar4/riffX?=
 =?us-ascii?Q?9rlds9cQD796liMfFv47agqrbKY+CaUBejYXODIqJgrVWyD8PSjp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c11816e-8886-45cc-659b-08df1fc6463a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:14:15.5288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+d7zhR0z3uXgXUX375N4C3vrMm/AC2qSfLoLVIpnTBdvBfMhK6VEaumm+nPa3HTR79g7EzrOkxHp3hR9yBDgPlBnhjzkZFGnKPNDCUuvfm3I03nUPn3TiqRe0979NMv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8302
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_071423_207572_8F947AEF 
X-CRM114-Status: GOOD (  20.86  )
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

On Thu, Oct 01, 2026 at 01:44:11PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> Toradex boards route the sideband signals of their 24-pin camera
> connectors to different GPIO controllers. Camera overlays which name
> those controllers directly must therefore be duplicated for each host
> board.
>
> Describe reset, power-down, detection and power-control as
> connector-local GPIO functions. This lets an accessory overlay remain
> independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> remain described separately because the GPIO nexus does not abstract
> them.
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../connector/toradex,camera-connector.yaml        | 81 ++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> new file mode 100644
> index 000000000000..27fee3defde7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/toradex,camera-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/base.yaml#
> +
> +title: Toradex camera connector GPIO nexus
> +
> +maintainers:
> +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> +
> +description: |
> +  Toradex carrier boards share a common 24-pin, 0.5 mm pitch FFC/FPC camera
> +  connector carrying MIPI CSI-2, I2C, clock, power, and sideband GPIO signals.
> +  This binding describes the sideband signals as a GPIO nexus. The other
> +  connector resources remain described by the surrounding board device tree.
> +
> +  The nexus exposes connector-local GPIO function numbers to camera overlays
> +  and maps the functions wired by a carrier board to their GPIO controllers.
> +  GPIO specifiers contain a function number followed by standard GPIO flags.
> +  A board may omit functions which it does not wire.
> +
> +  The function numbers are:
> +    - 0: Camera reset, connector pin 11
> +    - 1: Camera power-down, connector pin 22
> +    - 2: Camera identification, connector pin 23
> +    - 3: Camera power control, connector pin 24
> +
> +properties:
> +  compatible:
> +    const: toradex,camera-connector
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-map:
> +    minItems: 1
> +    maxItems: 4
> +
> +  gpio-map-mask:
> +    items:
> +      - const: 0xffffffff
> +      - const: 0
> +
> +  gpio-map-pass-thru:
> +    items:
> +      - const: 0
> +      - const: 0xffffffff
> +
> +required:
> +  - compatible
> +  - "#gpio-cells"
> +  - gpio-map
> +  - gpio-map-mask
> +  - gpio-map-pass-thru
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    camera-connector {
> +        compatible = "toradex,camera-connector";
> +        #gpio-cells = <2>;
> +        /*
> +         * 0: Camera reset, connector pin 11
> +         * 1: Camera power-down, connector pin 22
> +         * 2: Camera identification, connector pin 23
> +         * 3: Camera power control, connector pin 24
> +         */
> +        gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
> +                   <1 0 &gpio1 1 GPIO_ACTIVE_HIGH>,
> +                   <2 0 &gpio1 2 GPIO_ACTIVE_HIGH>,
> +                   <3 0 &gpio1 3 GPIO_ACTIVE_HIGH>;
> +        gpio-map-mask = <0xffffffff 0x0>;
> +        gpio-map-pass-thru = <0x0 0xffffffff>;
> +    };
> +
> +...
>
> --
> 2.43.0
>
>


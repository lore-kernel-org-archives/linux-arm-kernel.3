Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DA2C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 19:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jh2yBW63wOHtObB+SLulGW5NuW/gFjTKNtrZrICTjhs=; b=HIkIW05qH9Ny+9OefpLp+fACH1
	YhIQ+h4g9UtEcJ7iyobMBCbbXJOllPI32ZGL4GQ6SfBFgkz43MmxIQRBhSPOAt2PqGFDmNScQ0K43
	M7GN+ippqaKi1czy1B4QSNoDbnJ1VEaUEQX7x8pdbf7Ig5gMY6WzsLtwPrhKZj9heANEyf9KxFCJq
	17+Uhn9NQsZvgYiDIbuJfCvQJDd36sKRhV3X6eK4MHcr717SQKi/33LVDtSWuw2pLIBdIarTxk2N2
	auhr0E5Qy6/g2fOdtIWZoezEP4DUW20yxxQ6bgZdX385laxgKiomwUZB8nhd2Oj1FcJXbgvaT1wvn
	583YsxPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u03tV-000000074JB-3Iuu;
	Wed, 02 Apr 2025 19:37:01 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u03rk-0000000743O-10xF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 19:35:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSjsPDUG99gAqPK2K0FB2UsYDpton+fgrk8o9UjeW63xeiqAIgOX6+dLTzenoSRdzIPcX2CqrY3xk162/iSWHgmT4+CNm/Ms3nqCZ5koQPYb6F9ae4/y91tHHKXJOOKgdrbbvW/K27n9a8yC13tdi3IJiZ+WW1GtjQiWJy1/tD7AYDnuBRlij0aaXh9zs77cjELQv6CNSDcB70m6aqWzXCi/sD0Z8/jtLl1Xltd6+3RyXJoNU+/yjdQYLtwK00+7DcB75HMgofTd3U35RF/eERm6Q7B1OZyxLxGUjT/BDW/6i+gGnKMLJC8zUg12gXIwep89vHAccT8MNMCilpqM8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jh2yBW63wOHtObB+SLulGW5NuW/gFjTKNtrZrICTjhs=;
 b=SNtGt+GUCxJY2Kr+tzp1nBLuwsGIRGrYRgCmLlZRP7wqtX7Ln6z2/OPemIC/8Qh6/FXdDTgpYorKDgZiYYXzEQpM1w7z7c4JNd8jKcsZZQxHJfBzedBL1v7CYj27Qk+0zNh89fjXwAl/auq2wAxCyIhx+Na81jQ+Hce5O6Zh1dziQrRp4RGkIB7yQgBIdrLmVfFcHoTGsJ8qK+RW3J/Dq0Lc+ib8PVEXUiBC0pvb5Z/vtHUNNJprzSzaqNvMgSd5osWDILEUMy/oGB0sMb83fIPjRjrsQJdK2b1sCiq0754O/X49BD3JyxYS8XZSDv5Vh2iJPjEKwfNYgbFAdUMNnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh2yBW63wOHtObB+SLulGW5NuW/gFjTKNtrZrICTjhs=;
 b=LYTjBk23qsa0g1uZ2bByy7/dRtkF+i4o1LWsSkNsZfTAZpxJHeu4McQ6XWT3Jse94gOG3H+DNy/vSmdDP+jRpalTvUweq9lEI9dBCXSb5IJWN4AmQJfGTFm3FkieWHUywQ7Mt0Ct092SI3VP5qGd7yd5qraPLxqAU7asK/9G6x4ldfpO0JAoJXdqTlduFyJyeZtvOXVzAeVKBZaR81hMAy51L9PLyo2o2RiovUv1yzHnxDdEyDMlIV03p1Ahyp4nYSX9bTUWSFRdCSlYwmphrkR8OFVoSiT5L7zwrbgz1VjPysRvM434vZGuR/9NvgvLrYrH4LLeeCAqAk0qAz8EwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10599.eurprd04.prod.outlook.com (2603:10a6:10:593::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 19:35:08 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 19:35:08 +0000
Date: Wed, 2 Apr 2025 15:35:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 7/9] arm64: dts: freescale: Add the BOE av101hdt-a10
 variant of the Moduline Displayy
Message-ID: <Z+2RZGGkhkxMOEQI@lizhi-Precision-Tower-5810>
References: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
 <20250402-initial_display-v4-7-9f898838a864@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-initial_display-v4-7-9f898838a864@gocontroll.com>
X-ClientProxiedBy: BYAPR06CA0025.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::38) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10599:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd5cd90-517e-40bd-557e-08dd721d79c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lIRy9tTdTa3oTf/8NiEff16ehRRbQ25HomA+bTMKlkyLbKuMrbT5oVqpF+Q1?=
 =?us-ascii?Q?Rm9BN2yrcYpECpIO8Vfs3mwrEM5fJMOZ2reyszXKptyFcTCbpwccdT7DJYde?=
 =?us-ascii?Q?t7rZUDKIxmbbN15nBazZvbowxTbiFGrYo0IY6zCu7SGW0CmynbDsETi2NqQQ?=
 =?us-ascii?Q?E1kNt2DDcySrekF9bvE7PBXdvRHE50rFhjm5eB21Zwu43/x0N/A0jemcqwTP?=
 =?us-ascii?Q?o+XSCIoo6GgjjXiBRbfxIp+4DD/f64jDN+6jryLakmvHRzaxF9l5Q7QmlvwM?=
 =?us-ascii?Q?Gn2TS+5YUE8Itr2tseEf9isQ0gGAb8iOjdByw26k3PdiRcTncah6oCaXAoMA?=
 =?us-ascii?Q?eAIVxJCY7IvNvZ5X8E3LFYPFOOoRx3Smi0zaxk8GDqCOg8yaw1BuSdhe5i5k?=
 =?us-ascii?Q?AnMYguAZ048Wnyb545ebFHSPiDWRaUmb1wsumygVX4g+JMeH4kEWRWv85J66?=
 =?us-ascii?Q?/yG8q++rn+x/36ee0si8+j8ArnrePamlXy7sZzzCxojWIPQiMKvC73xyaCu4?=
 =?us-ascii?Q?D9O3PXDWJrLXf0Tda22Quo2JiEMzhHE/I8qKN0agY6i9PflV4060xlIvctPF?=
 =?us-ascii?Q?WAWgSuWupMWyeccxUv++jEb0AiNgziuDGDclxmj36sbR0zfWzAX0YnH/vN63?=
 =?us-ascii?Q?5QjJaXgFPYoUpP5+ZiP0pEUdZJf9Fl+9UXs6C6U7TDDs9SyK39CuO5fYA/FU?=
 =?us-ascii?Q?P/xr/lvM9I1EES8x3u7OTAQcXrZoitOPwduF8x+aedRu2idOjv5rj8wMRMo1?=
 =?us-ascii?Q?lOWeWz+520L3/tY+i5ufyA+e7ZJn5Emc+BER3ULBVoQHF8B/8heJMeXcNK3k?=
 =?us-ascii?Q?P/8Pr6Ec3XUGFrx6PkSKgG11aiWod3r/tCmRHK+if28dWipqAS++nQ7QQnwh?=
 =?us-ascii?Q?NV3SMJykAKaW0b9UwEcLigRTLJ7gFTWiks97cIYLT3nbkFdUNvddRD2UhZ8K?=
 =?us-ascii?Q?AvIO876sSuGA0o+V4uPAdOjymwwmpi51N/iRe92oUucOkniL3u//fVUn7zl/?=
 =?us-ascii?Q?84NTQgSv11rI44WKt7/bqxEFUrWrxUrVKQVVsnhmtH1rXOmH2nwTv91BlkfP?=
 =?us-ascii?Q?HsZX1mlcCKBYSoZ0RF0+W26v6EK5UWfjkoHiSK1X9aZCbtFj9WyZsY+6X8GA?=
 =?us-ascii?Q?/FquzZncrsx1VwDqJhf/iZHn6HiAyKaKS1h0giTGrjurwoABJJbc2IjnrStj?=
 =?us-ascii?Q?hvR4OcEK9wAr5v1WghxVuw7ztWSsv5r5iALB2bgcEbr+rpLh1dRgKm1Ig6sR?=
 =?us-ascii?Q?z781nphLOiM0zmhOxsd4gl0OdUREB6FLSOCoN/kq6w5tvohhSex/cHI4Mc15?=
 =?us-ascii?Q?VgQo1ZBa2Ki6HDBlXx10b8lrkh0zn5fHzn2I2i6pOIApc+OuYxB7N/D2eK3k?=
 =?us-ascii?Q?d1TesGYqK3Q4vsj8HWcG1DD95HGwFqtQm55bbjZljlxZkkFOVFJ+/D7ylosU?=
 =?us-ascii?Q?xooRHbpBeEbzcA/2g7SmRmrUSc342OIW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gWCTyIVginU03Mrud6qiS4fwDU1CMbOg5MbPROBfRvk6TjVw8nODkcg7pP6I?=
 =?us-ascii?Q?DcVlrQokF2AA00zoKJaV5a2AjRI87tChbEWxF4tvsHiIqA2ClZTjG7ekFBFD?=
 =?us-ascii?Q?4sgGhDiAXA0nThoK/Tf9D/H/4tnOZZr2KyvnIpZpIA5+dRXtv/lz56WXJ+f5?=
 =?us-ascii?Q?WRuq+1MdJxBisztdQdlAAwYoLh+YjX3/5asQAU06GdH2ax8z4grNgyh+6tis?=
 =?us-ascii?Q?7WT8gI0rk03THDoIYlxnT3M+wLKdMCuKN3Qh90eiQzqyyxGuj7tHA7RqPDxu?=
 =?us-ascii?Q?ACsZgL6qO7oUadtVx+5xqRWf+o3KHw72kKxJ9W6aevcLk6zYKuQqdJJaB3zO?=
 =?us-ascii?Q?aFhssm5tYzPLCbmzaVZEH4ekZ3Q5/vWEsvj3Uigi/675i6cpSZ3lUbP41lNe?=
 =?us-ascii?Q?EZq2PIGhA2BDz7OL8boXG/psjwbiJUNQn4A+jJ5lSS5wfsCyl73LX4KdNC8c?=
 =?us-ascii?Q?n6w38v9ECQEyMiZKcHn+yNYt2+oRFznsJJYA5TZFV2ycmOXl2cqD2TbTM9o0?=
 =?us-ascii?Q?KeD8qdPl/0yxOi+hTnQtzW2mYQzNIi6dg/XKQG1j+oUAPeKyNTiHtCHdzJpP?=
 =?us-ascii?Q?GuC0BMFwI4B+BhQCbBs7rmhXWCqTzCLjVtKMJuoBY/KlENY92i4PFX4Xg+pJ?=
 =?us-ascii?Q?2dUOzR4pE4VgGA23sIeJVKlEX5fK45XGiD2ZXPU9eYZfNDBui14+J5YghTxv?=
 =?us-ascii?Q?Ufy/NONONYg7CzlAd7kQRAORZBDbsYpD4yf6NlXQirGC+/9TNy0whlaNe8j0?=
 =?us-ascii?Q?GgcMV8j+Na39MO0Sdq7L63/iBP+im9fKJxw0QbYZeqjZjkIF+yz1PISxwBf7?=
 =?us-ascii?Q?bwpILSF1iX+xxkfagRSCu3y2/h/6A+PHOx60uyBKPU85jfelxWRjYHvmVfdV?=
 =?us-ascii?Q?cMdPUh4VoQl0om9Q+03aEylrx26+M20O7qK0qknCCyNRXwG+xQsmZ1B56IGw?=
 =?us-ascii?Q?BHlI2mQhSEZB3y+JFaP1/6hZwIcisXap0c7lpLTDM8cm+Dw3cGXuRu/juCDW?=
 =?us-ascii?Q?vTIEGs6pcZrNt6GA8NUO5K7RqhWl4Ug3ApLqzj48chr5PLGSV/irT3Cx/d6M?=
 =?us-ascii?Q?Yxyk+bUdWjoLt+VapAo2ytIGoO3oNllJDbYTaL+Rv1GyQT0YrJ7BRNWqKmMc?=
 =?us-ascii?Q?KQYB+0wqgNDWD5DMnDEEPDEqtHIY7axI96OCuPA/2Edha9BIYMAQpLnmBqoQ?=
 =?us-ascii?Q?MdqlA4mgvjj2g8IdrnRVNu2KOwjx3o7cbG8elEIaaLT+DN0ooargax/ExVdj?=
 =?us-ascii?Q?Wft/p2sQQ8CS3anfV7YouMBylYYEklBV6Ighj6j41i3ZeU+gpMLbzkbedDmj?=
 =?us-ascii?Q?5juOkl7bQJ5PfzFYtNwYplZdzyQayz69Iru39c2KtimZ1dcrZDbz+u/ChdmX?=
 =?us-ascii?Q?+EQ0kPRWSbiAXGV8iUOu2sKkxq7JFu0Oe7HaogAOsps2z6zo864MP6dnkK32?=
 =?us-ascii?Q?NOrx0Q1y62I43qedGvhfB/hEqnhJ2HND1pwAWMgyk9cdcQbzBidnPZLDoauH?=
 =?us-ascii?Q?pX8IcXq5gNJxmZZpPQLrvTv2eoBxV2n39tMn5tR4tzgv5KY6K/As+zmhqxab?=
 =?us-ascii?Q?vR2hVv75iudFeKmnTg0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd5cd90-517e-40bd-557e-08dd721d79c2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 19:35:08.0148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LelQuA8AwtMOvn5mP3GurG78Y54P26LvaQkkqJL6C4EUlcIDAmuaWGqXPbJB+4inGAp7zs2zUxrzp8J3345VSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10599
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_123512_286723_679CB104 
X-CRM114-Status: GOOD (  23.98  )
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

On Wed, Apr 02, 2025 at 09:07:10AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> Add the BOE av101hdt-a10 variant of the Moduline Display, this variant
> comes with a 10.1 1280x720 display with a touchscreen (not working in
> mainline).
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>
> ---
> Currently the backlight driver is not available, this will be upstreamed
> in a future patch series. It is a Maxim max25014atg.
>
> The touchscreen has a Cypress CYAT81658-64AS48 controller which as far as
> I know is not supported upstream, the driver we currently use for this is
> a mess and I doubt we will be able to get it in an upstreamable state.
> ---
>  ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso | 102 +++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..2855d7090988380ca0d4df8459cd1a67049f1080
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2025 GOcontroll B.V.
> + * Author: Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +#include <dt-bindings/clock/imx8mp-clock.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +#include "imx8mp-pinfunc.h"
> +
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +	model = "GOcontroll Moduline Display with BOE av101hdt-a10 display";
> +
> +	panel {
> +		compatible = "boe,av101hdt-a10";
> +		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&pinctrl_panel>;
> +		pinctrl-names = "default";
> +		power-supply = <&reg_3v3_per>;
> +		reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			panel_lvds_in: endpoint {
> +				remote-endpoint = <&ldb_lvds_ch0>;
> +			};
> +		};
> +	};
> +
> +	reg_vbus: regulator-vbus {
> +		compatible = "regulator-fixed";
> +		power-supply = <&reg_6v4>;
> +		regulator-always-on;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-name = "usb-c-vbus";
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl_panel: panelgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07
> +			MX8MP_DSE_X1
> +			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09
> +			MX8MP_DSE_X1
> +		>;
> +	};
> +};
> +
> +&lcdif2 {
> +	status = "okay";
> +};
> +
> +&lvds_bridge {
> +	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>, <&clk IMX8MP_VIDEO_PLL1>;
> +	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
> +	assigned-clock-rates = <0>, <1054620000>;
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			ldb_lvds_ch0: endpoint {
> +				remote-endpoint = <&panel_lvds_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&usb3_1 {
> +	status = "okay";
> +};
> +
> +&usb3_phy1 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_1 {
> +	dr_mode = "host";
> +
> +	connector {
> +		compatible = "usb-c-connector";
> +		data-role = "host";
> +		pd-disable;
> +		vbus-supply = <&reg_vbus>;
> +
> +		port {
> +			high_speed_ep: endpoint {
> +				remote-endpoint = <&usb1_hs_ep>;
> +			};
> +		};
> +	};
> +
> +	port {
> +		usb1_hs_ep: endpoint {
> +			remote-endpoint = <&high_speed_ep>;
> +		};
> +	};
> +};

why need enable usb3 in overlay file, I suppose it should be already enabled
at base dtb file.

Frank
>
> --
> 2.49.0
>
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C612D107BCD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 18:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5jcaFlg7wQXjyDOL2oE/RKgdyxRauH/LeZ+d9xwJaY=; b=zNWk3uQzHqE6f3ZUs9Z9Wu6ZWY
	w8xGQpd+U0TSD0GlklTaqqeH8KSurHZNxyK1xy/W8lxOqYWBZRDa4XpRRxCsoXyBo5yWclfn2oGnp
	FAUebp9XYTUHS4YJCBLGwu8Avh8JysUHN1irbasLFPvU3wNOXvkzgKbKyVOJR/oiJvNbFMkvGvHDs
	9fXeifZfLiHLdOf+GYIdWgwgtgPIMqGYVpk2TJrtq4nl7MVDbLdAzIvE+48ijGKdKWuVIh6TaUibW
	fUbfU9P2n6LYr5KOWS/+N1d0n9KyXpNq3Ycv5IaJUnoKfMrX9H6G/7EyH0H6b00M75Cr2rUaA75RG
	RrZK01vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w17gL-00000000ydL-1Er4;
	Fri, 13 Mar 2026 18:56:21 +0000
Received: from mail-northeuropeazon11011002.outbound.protection.outlook.com ([52.101.65.2] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w17gI-00000000ycG-43G5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 18:56:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSnGf06ISJKnmVeFlpdfnP7AIzjU+4vjazOVTGbXMEHSROmN0JPMUucisOl3YdqYJKlXpryyIeKMUu5gAjkWiHmBFAF/0xqFtQzY/CnpcfZGCP6LHx9LQ6H9+kRp32oL0jkiXxBLUXwN9MSLnnSlbh1JqIpL2YW1ClNLB3rmzrO5cEBpRGom+LgjdONGFd1NMybpUV5LxUERQT1uTlBj3+VvFdiERjFXE+FTgv7BK0JP6yIDBb4rVPS8zXP2YC4HM6+2lMFpeY0LfX0pp7KSn4KpVX6aaH3QtVclsmzP7LSPl1J92l0RcEz5LL4f5r2DSDoB0OhIGBCrZBm4/bxzVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5jcaFlg7wQXjyDOL2oE/RKgdyxRauH/LeZ+d9xwJaY=;
 b=MxC08N+4U9XT5AJhsokPCqGjc8iLEQ+KYoDbhfMJI1wxxNcmhSPuF+c2VPwOYcgKsNLXmv/DV3xGLwth+pKYiOCKKjzcFIIiMD8hvrH5JA54BzF/2e35vpUM5o1A8jnQE7X5nI6nqXBW2ddnmHRuasiSq1nwHiLZcIy4QqiZmcTY7tzEpanzuWQS6+3udyIRS1EBqZbnm6TuItR1MbIggvasksjRTzHkCWo2qtK2o3r/qrxeGAOEeFpxpaGJhsRxBA1rJ+GK+tBDqNkgWYeGNmVJdEAO5rp1qcyuXzndDUWPm/UMBtaCcPtCRj5scLUjgWQbfWwgyHGcSrGCobDTng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5jcaFlg7wQXjyDOL2oE/RKgdyxRauH/LeZ+d9xwJaY=;
 b=b81A0PIWdq83A4m8se0R2W8fP5TVSyHQ/O9cr/8bW/TJTEw9SvkU376y2kF5eDmPE/j499dNPpuwXDzRlNmU5HZzIdYPvSIckNuS3idrmsg+Xo+QHEmaBarMsh9baYFL++1AOhqOYQMr6YVpGyM2MAj64knYFHnaBhpdeXFpA5G5N/K3Ms7FeLXs9kPsI4INwyGF0dWoHiLQDAmFoBQl1IZeK9XIqdkC724TNgfZ7yZvHOM4H1MXv2cw5LjWvtuVpO8jXsVOcLLR94Bo81ZJEYTKcNq5vZ850msMVu7yrbn00CyJ9LfeMo47tc9u8CnjlWu0iKXzw7tb6fWL3MalhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10325.eurprd04.prod.outlook.com (2603:10a6:150:1e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 18:56:05 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 18:56:09 +0000
Date: Fri, 13 Mar 2026 14:56:03 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 0/2] Add support for Variscite DART-MX95 and Sonata
 board
Message-ID: <abRdwy_AS046QVRI@lizhi-Precision-Tower-5810>
References: <20260313174707.26902-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313174707.26902-1-stefano.r@variscite.com>
X-ClientProxiedBy: SJ0PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10325:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb4199e-b199-4883-0cad-08de81323031
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|52116014|7416014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: GFCi4JbMws0nYIxZqw6mJkuAb/zykDVGGSCceHkunYgy5l4Qw+gttpoX/umGiwFkyC6wwiE7cXGA4+uH18qWye6sv+Nmns0u0lzIDWwDp846JsJUscE64qjYnKKfzEM5QrjvJDX6TL1cDS2eYJ+JAtMw6f13FGNKMnRWurK3UHWSpra2AeXlnDktJ7FXpC/Ca1J+ielpLs8ohzWvyLor7nfmIL54yiTTvZB3nabJb04jTVZTARy1E3+ftp0bXOc84lDOWu0JlCoAvcU1yMblDXiRI4DXfjp6IsOXBH+jfvRKYq6QLckwoPQaJpOybMXIwTIDcyzUkOMIya5MZ5/mu5SE5r97BrmGURzHw9pJq2+dABadJcFATFZnW9lppiV8UHIWzxqSaAX4rf2RC6yBnO3SFyIGMYFpfAPEkB6GF60HTQqcPG0Pmbmm08fm/oYkWhbv+hdYIbFWXuoty2jLsICmcZD0O6wsKN9NB4sneUhI9A2zoAO/nFkdTcuZ65YjXuGkK+D6ush9LA4AFxAsDPsDRBfAc+LAR0cbzy/uIvP9UyP8vPFPkPoHO2d/9PWjiKAdC8A1M8W2cyQUOKNTZDkwzqvb17wbwyN2AVFpdm1cBfIl9l81u+xEqVjZT8Ero8/hWo3oejAGEY+7GJo2d/fIq58Xb1jTK8s0gkINxIieYAlkT914vjB2hZi//jJURxK1jIXN0oSUs7qHKSdHKGDrPUTi27LZDwmxjRZj0UYwiksOC+7r/NIllkJXQK0B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(52116014)(7416014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N9MuOXV7aE1QOk1NLetyZCrTNQYSpSjNSCYJ0EizX9ofOJKXXpuJkaqVf8eL?=
 =?us-ascii?Q?4lM+BAAT1DkkTEoRDhiE5+DWfgBJ2bscMFpQfq62t2b16GAfRSuDMHEjjJsz?=
 =?us-ascii?Q?VJaZulgI4UK5ht8Tl941CVFRVJpUEUBTbvJuYQahU6tfB5Mw1ILbQCJq6GJp?=
 =?us-ascii?Q?iJ3QMwvLf3UDAMq14DQa+Q+NzbVaWRCKkvOIc6kDUqWYqxUwxqRwKt2Nktwi?=
 =?us-ascii?Q?SpOhDtaG8sXS8A+koRHvkRTo+s1DLSsSQklAiUm3EwDSuFXFotc3DqKIU4WB?=
 =?us-ascii?Q?fxCaCjUxJKx0V2oSW7oNPB9VFsE2m5r2+C1XKDe8tZVhexALwAa9FgTdlMfx?=
 =?us-ascii?Q?rfk5FBmXYrSl4zIVat48ETdg0splyZcdjnqEKE6zwNiuR49kaFySatYobLYL?=
 =?us-ascii?Q?laPMZV5hXI5j/aR6RgqHWI9WOld7JMHFFwQjJeiy5Ug8fCLJCKcM4B8w3CAh?=
 =?us-ascii?Q?IBEZrr+640c3300turR3PtktndALIlD9ajDW3q0PNasTNjfNfJN7zZohQzcH?=
 =?us-ascii?Q?9o8vwxCiIgIo6wN4GPK8d6l3jt6ExMyD7D5jde2lZx2PvTBuaxITAo9UGH28?=
 =?us-ascii?Q?XtO8cNlbIaf32J6crLAjDInZki84nY+83gnYz6QLGvutM3WG/PMhvJnPSmg5?=
 =?us-ascii?Q?nRiQG3t4za+dMjp0092e6v6vF4qSC9q2KeMXzqD6d5N0OqJO8kq35Yn1XOM2?=
 =?us-ascii?Q?SLjoqWe+2FJzUTedxJmeIZx1R/U7dRiAVhya+TMaA7hPv/bDANEgT6FiWp9p?=
 =?us-ascii?Q?Jxvbzy9rVtDLxaKL+nlcIQeITz8ChP1Ggthw89r6mgEeIZ+R5r8nuXhUdyse?=
 =?us-ascii?Q?ZCYhYdU2mt3DJ0WKW1KXiqYbxYEHUNN4lywnXMp2F/DhLFXo5hewy85yMozj?=
 =?us-ascii?Q?GDhidFaKS2tsGvZinm93CMfcelJnXu4EN2fJ0r8+N2ZDtFmKsnkJk9SLiyuS?=
 =?us-ascii?Q?sBnZvTwQNiuz/t5H4VXb143J4T6z5eI94xLL9HUbW3XKmJouOlWZpg009qXg?=
 =?us-ascii?Q?q2kvw/K7UXG7Jef9PnwuFhSuXRwu8uIojYirUuV63SXUkUZoqYzOHf/43M2M?=
 =?us-ascii?Q?CIT+H/g8xt0U8biDwarG+3C5cYxJR97U1bxkQe6VBfY4N21MeTSnqZ5QwZuY?=
 =?us-ascii?Q?abe34qtXafReSZXceEPFRX01gOVm48QdGEHdeaRRar0+lEbv70lTa07Dc6j6?=
 =?us-ascii?Q?JFul63bPhI+/sn2P6Ffy/8MxKILYKjP2LaFRM6GBaJURnn6RKT735F/Svz5W?=
 =?us-ascii?Q?vv33TWDjLxwS9iUE/CwpdEPo7Yh4Eyvf8knSOlMyOw5FDxQoDdnC6is/9KMc?=
 =?us-ascii?Q?mWJaDWRPUbnzr/UDlkOv5U/IJvDewVGYEDIY9tS9Wi1NcP/8RM7GyR0anLG8?=
 =?us-ascii?Q?96qO/5LNP6Iq+WTGhnADv5WUesm/NRmuZrb/iOneSFnVPWMUlGdjpQ/+BLMK?=
 =?us-ascii?Q?g5U87xuWue8YaeB3KNMb7rUno+PV7jQlrrqHZ9Rm22VDf2sf64zkhxOdDxxJ?=
 =?us-ascii?Q?weziYrVlToS0HoIvxFBW54kEBzACoL3oEqCcG9CtdLtvpYCWCOor4ZGh5xHp?=
 =?us-ascii?Q?p/0Pqh0MJbMtHeUXP3aOBDpP+3/hiHbpyDvCZz9tDM7zHZOng0c0C1zwdp2U?=
 =?us-ascii?Q?cT72TRLdYSPGrrpCnfwDKts3WNwsir/WNuKQ0VewVNxM5CRs71If798id5gR?=
 =?us-ascii?Q?ZN0mjUua7CSx0992aFk80uQMu91bLfDBsk8zUQW4L7u6/uZCPzKlwt27Wx4h?=
 =?us-ascii?Q?dCbvclUBbA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb4199e-b199-4883-0cad-08de81323031
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 18:56:09.1047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fa6YfOJhRSxYqAwD9AiTJkj5+fWWU2w3jB89695olZt8j9l1ucA45GcBMefdvgxA4rCCRrzlnbk8wAxa5IN3vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10325
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_115619_011853_F520B9CD 
X-CRM114-Status: GOOD (  20.66  )
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

On Fri, Mar 13, 2026 at 06:47:01PM +0100, Stefano Radaelli wrote:
> This patch series adds support for the Variscite DART-MX95 system on
> module and the Sonata carrier board.
>
> The series includes:
> - Device tree bindings documentation for both SOM and carrier board
> - SOM device tree with on-module peripherals
> - Sonata carrier board device tree with board-specific features
>
> The implementation follows the standard SOM + carrier board pattern
> where the SOM dtsi contains only peripherals mounted on the module,
> while carrier-specific interfaces are enabled in the board dts.
>
> v7:
> - Order nodes in symphony dts

Can you run https://github.com/lznuaa/dt-format for new file to easy
track and check by script later.

Frank

> v6:
> - Order by node name instead of by label
> v5:
> - Fix newlines and nodes order
> v4:
> - Fix typo in spacing
> - Remove vpu and cm7 reserved memory
> - Add GPIO_OPEN_DRAIN to i2c gpios
> - Move pinmux to eof
> v3:
> - Fix specific node names with generic ones
> - Remove fixed-link property for SFP
> - Audio regulator cleanup
> v2:
> - Add SFP cage node for enetc_port2 following sff,sfp.yaml binding
>
> Stefano Radaelli (2):
>   arm64: dts: freescale: Add support for Variscite DART-MX95
>   arm64: dts: imx95-var-dart: Add support for Variscite Sonata board
>
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx95-var-dart-sonata.dts   | 591 ++++++++++++++++++
>  .../boot/dts/freescale/imx95-var-dart.dtsi    | 425 +++++++++++++
>  3 files changed, 1017 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
>
>
> base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
> prerequisite-patch-id: 7ed0e453f554c70d0fafd5147d4d9b62cac6c10f
> --
> 2.47.3
>


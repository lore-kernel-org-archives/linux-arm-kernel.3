Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53958FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJf/O4acA/OvYHIonYDlJYfQr3sd90ohw9CPzQrd1lY=; b=AQCsxLsHsbMRVwij05eRWgrs54
	as6NWomvl2KBlhTfkFBnqRItdbptWbXKbz7j5IzJpMSz0ezBqK7bNNuEIDk07gYMFMjknWlzN5N2H
	fP2qOBH0/ga+xFtQ8WSHXYQIz/ZRnW005RB1keiQlfc/vEmVBLznDhKvwuz1cBIYeJq6iAfHglkMK
	F/N26fesRQN4BuAPwJW2QCq+NlcZjf5JGnW8k3x7CkiftIZOns0vVoJ1sIFU33hEdOqFic5QTHUkh
	dL5uqx4Ye5bdRoIp9xMXCbhKDLQl1qCq7ewYSG0KKqfKLONmEES+rxJjhjHCz5H+7ui1WQy0A3X40
	TWfC/Q8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHo6-0000000GfOU-2Ejl;
	Tue, 05 May 2026 15:35:34 +0000
Received: from mail-northeuropeazon11012021.outbound.protection.outlook.com ([52.101.66.21] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHo3-0000000GfNj-17XY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:35:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucO7GI4BsuBflPfQ8QZfWAQ8zExp+kwbkMwWU9bsdFj5o4JpnUTB24E94nZoxM3Yp2J5E2NNtgdJ6i4qAUj26H42rmFg8LPlXOMFSdoypPoQTUlZAxXhYoefnxU2Xkg2vOtynCqB5wBXt/NIoBKa26IMCGw1UAszX+eaD2Owkocko/Th1OGNWF78TRK6uMwSCd/8P52nbuzGB6Sx13Iygl831WV0UIlT7/mcwTvrXi7dd+XkvmaS+NgdqkdzedO/luXt07ej4uBGfZTwDvFkKF9l92igqyuLcl/eYc39aykmSHNzY2IhHELjOx+cfSbtxtwogjss/k4eCNZqih+ZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJf/O4acA/OvYHIonYDlJYfQr3sd90ohw9CPzQrd1lY=;
 b=NYZOBXaIZmC4gE37rEFXbDhZZ6GmTzmsARcB5xOvpLTyElLCSmtqCtPPjUvkqjbrC6hhThLsWTPjSqWACHk4oliZyzJi9aGELC5SH+6kqgcjN1aRY1uhjTsuzqjN8gQLImHUa7Y1T6YfWaRGGqOcSOcIBxUT4lCPh25+hKIrvVlahm0ibeanYR8w7U/nzrXAoUY5Da/W9FnzWG1zOnxbQqbw0HRNOpy/8oIYoEm9bN/zmhNAmD5BxwNzpiiGErNF/05xAypZPzWSpT1CjJOyTjha/XTohpi0pNVoQtUHDXotuRqCt6DHFaHeNq7SjsDb+ln+yK35kIrtvHO3O9zToQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJf/O4acA/OvYHIonYDlJYfQr3sd90ohw9CPzQrd1lY=;
 b=n2WqAZYbbgFDQkHndNvnuekqS94jUs+xIBlHfgdecjKl7/ZK8QlPrhsZ83rC2mEqbnlcgvj+HtKQtsMECsLix3Iqt7KtRMlc6nPcuiHo/9vrUFJRgo5cmTzIq4dHYAs7CG5A6iyIRdBO+o0wQDHBol0pjBKBmZfvWFJNSq/Rid891ExhcJtxHp7OSAwFYLa7FE6ebLphdkSDZ/yyTRxHCAYIBGXQFnPMSkZBQMoaaHWopHV/nBfYeAqa8cTM/WHTexKKNXOubvvdOz+LjjQ3PCRdaZGZiqvbBlzPEHVRhDTyenax9F3p31eu2EGkjDAxpPwdUxsfUscXAG3g4lVUNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS5PR04MB11370.eurprd04.prod.outlook.com (2603:10a6:20b:6c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 15:35:26 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 15:35:26 +0000
Date: Tue, 5 May 2026 11:35:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/1] arm64: dts: add tqma9596la-mba95xxca
Message-ID: <afoONpDS1ccIfS7Q@lizhi-Precision-Tower-5810>
References: <20260505061344.1785663-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505061344.1785663-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SN7PR04CA0162.namprd04.prod.outlook.com
 (2603:10b6:806:125::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS5PR04MB11370:EE_
X-MS-Office365-Filtering-Correlation-Id: c2e0e991-d01b-4232-ca6d-08deaabbedef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|19092799006|52116014|376014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: r65gkM0PhKUkOZcViCZ7yOsZ6fe6l0mCbSqDUH+QNYn+yM4qJiw903bn1YsGwhVnb+cPjFL5Bx7S9CfWl/rLaJ9JfZu8Ld1SMhHimiVGvsC58ye9VUn8+N8Xa7QzZPOt2vktvODpY4ikMsXSThIMOZn5VfFmunbjzs1ewELR6+BEs02MqnaAPQarW6RysaniPakaM0p8hFPcrMU6aEkDTowHRXNjrAERkymgfhhNv44UVefVV1Y7RuR9JiDDJAXiiz21pd62cCDQjP3eB1ccNqgPvkVOkcfSJcz/nlvVOaRA+ZiM8vtkjbHX8tqUfk2Bez6vezdvlrEKSJJOe9+zL9DpDOc2Ls/UfEnY4vwUynV/lo0hzrcSA+zdqNQ3Nf5jugI1faIqNBIpg7n0lpF/OURR2JpG/CF4elP4/PqrBA9YAsNTgLJHhu/xjS1T23AkaH6MnJcR7m+OVYqMEnP1TOkxwdah0T0robr/zhQb50c2ZF9dD2Ru8cF2gEIsbiUbDCWDq16Kb04+pho7JMpRj9CdEIAAiAUxr5JHn3BzbgHJX+hX9v25dgnFXDn8O6QrNBWUKM4nunNU2RvtFjuiILGHJs4EOzI25FauWEL7NwvhWxD9qwZxL2Nhq/W5y3MdadO7FwTEUNd59r4GRzNnj8QBWZfw3lJ7LG5id891TR0wuE1u3nJRjNuqQwHQxDr6WkyfTX/4rklQAYaSP21ElX7LwTR+eGxQYcg7oC8wfy1XtvX5uNd6fA1sPkfnvw3C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(19092799006)(52116014)(376014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5ZJRFsZheK+l9+7yACax4OetD/3+1n+q/5NxsZmLrMbGENRy31xXNN+w+ke+?=
 =?us-ascii?Q?EovLD1BGDExiF4SGEKr4Iw+Hrr2e6egvCWeWOMZbGn/CxH/wWcl7Fcamo2Hm?=
 =?us-ascii?Q?b6OJwmLchLQuRu2MC3gBqUksmk6ItwK7K63smYJ9tFGH9stTm+ztsvJdN+PP?=
 =?us-ascii?Q?vQ9Kgq6yAmyvpEkcd5sB7EabrG1EiLbvJH2CTdqfiGMDsd+1yIX5BvEO9HSU?=
 =?us-ascii?Q?Gge84Qw4InHL15W5++O562UWWyZ6MUWkyXAlGICMOHWR+Ykp42o1y1NYiWcs?=
 =?us-ascii?Q?LY9jxfzXd7FJNpIfxxgD5tZsqncWAONAu7/qMANG4ZvghJfvRD9nXbnvdK4k?=
 =?us-ascii?Q?jFTkLskb9Cr25tD2kGiLkFLoVw/aXJIdaqDvIuWDEghvODT/r16p0tt0hvLb?=
 =?us-ascii?Q?eN2M3VZutJ9M/Sna275k9c2GrEh9Vo7ZwT8VgJrcR7FAhW2cgDelKa7A9CCP?=
 =?us-ascii?Q?P4plZcj/Laj9de5haSQjlyixx4Ir8JltPTQRKpnYjV+8F4jtjGX/nUKx9i8j?=
 =?us-ascii?Q?W2YjN29UcpS4fjGhDZZfNqTDBNnYPOnKWM4ei6B58w/VbxTXdZDJJSv6I8i/?=
 =?us-ascii?Q?eKyGk1bKiiBZupX4vpUk9s4+guUVH1BWaXyJBhehLltzUl0+COdq6ArLqiur?=
 =?us-ascii?Q?S1Pl082BNjfynyBNLkW3HWNKTjRvarT0NgdGDgxnRc5DyRyA1YNoV3TM4ed2?=
 =?us-ascii?Q?SOogquAJFObZk/+r9WO3Hjyw0Fg+qMLE9sE9YO1psLFE06ym4VYc6XHYB8RV?=
 =?us-ascii?Q?278eudr00ZsJ+4eyxz1O2Bc5pzDV8TmT3W8gtzB5mcjeC9DuCAK3+Eznb7SN?=
 =?us-ascii?Q?fUKlbgUI0DG4hQtQS8mZFhk+96FC3BF/djEtlPTFkGE9By/UPfNwDEttn1sU?=
 =?us-ascii?Q?qFhjTtrP4baLZFEcfEBnG2K+CEIfmmWh6i7B7EKVSXbMrp8dP+mHMYjCClW0?=
 =?us-ascii?Q?jdXei20wX56LDMnpoKEDCwedZkECXjVpPAztuO9qcJAd8B4joFgoYPaPUm7+?=
 =?us-ascii?Q?i7hRMBt4xDNu1ODvaxUOwxv0kEkSrKy2n6RBq3qmNfxAPOWm1on/nHWndnQr?=
 =?us-ascii?Q?B5wuUbSepih9o46FI6BGFeYyjCpf5Px2CYNIHETza7o5D1f2sdoO7xg1Uuj9?=
 =?us-ascii?Q?3j9glM7hoIxP+evteStnK/y5z/ZHS1/i0RusPnH9n091i+ELHrd7wu7hSj70?=
 =?us-ascii?Q?hfuEBJkoAkuwsqBevz1tCv7JwwX9MVr2xm+P9XlqG5mnKfXw5JxDBJiPNpW1?=
 =?us-ascii?Q?KBaXB6U0Xpo4IUQ2l2C9ogTrAFSi4zmM2blJuzkAGenkOZ9PuXRH1VAoVvkR?=
 =?us-ascii?Q?gOoo/7FEU5IeHy26W2U/gPIuVcL0aeJu37hT6XuqPSkaubKQBU+dztsYYvwe?=
 =?us-ascii?Q?sZPRo4UBwpTAqw9sonVZAhqBmdNBVXGVDiDU6Y0J2f9kElVm+shtoBCd7snn?=
 =?us-ascii?Q?jzM1Q0k9xD5CFvii7LUpIGSNTq7ypSTkCxwbRVgc6CWXDZnlz2bNJ090QfRx?=
 =?us-ascii?Q?9Aj9bHIZpgTGNIa7z56XjKDj/CAmf56LDaT5kfxILYExH+b/nfdBAo9YuDDW?=
 =?us-ascii?Q?8LPTxuPKRm7ugC7b25T01GItChnBc2fgYaSZS1kc6tPgu2PV2irbksSg5K/Z?=
 =?us-ascii?Q?cYPJUqCgwtfWZ5jo/EKobPmvhzIKQtcTnP3bu+Bhoo1K62aOuAn/nkRl6NPX?=
 =?us-ascii?Q?3zCzoVPHi7cWzVB80FzwSnJVSzEWGApoFHV0uqqXjuXtOkIi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e0e991-d01b-4232-ca6d-08deaabbedef
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 15:35:26.2589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4h1qPj6p74HfKzCTwXHUbVZXU9+T6A1yZPrhXzVZ+stSrMkKnUKw2qsWSdUvhPVONbcvtyveWZ9eEzft/3dl9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_083531_312564_8F818A05 
X-CRM114-Status: GOOD (  25.14  )
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

On Tue, May 05, 2026 at 08:13:42AM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
>
> This adds support for TQMa95xxLA modules, designed to be soldered
> on a carrier board. MBa95xxCA is a carrier reference board / starter kit
> design.
>
> There is a common device tree for all variants with e.g. reduced
> CPU core / feature count.
>
> Enable the external accessible PCIe controllers as host,
> add clocking and reset GPIO. While at it, add hogs for GPIO
> lines from the M.2 slots until M.2 connector driver is available.
>
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v4:
> * Fix LPSPI4 pad muxing and control
>
> Changes in v3:
> * Moved reserved-memory to board-lebel
> * Remove VPU reserved memory (unused for now)
> * Fix typo in connector comment
>
> Changes in v2:
> * removed useless regulator
> * added USB PD source configuration
> * Removed unused uart-has-rtscts properties (unused by LPUART)
> * Fixed RTS/CTS pullups in pinctrl
> * Added thermalzone on module
>
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../freescale/imx95-tqma9596la-mba95xxca.dts  | 961 ++++++++++++++++++
>  .../boot/dts/freescale/imx95-tqma9596la.dtsi  | 278 +++++
>  3 files changed, 1240 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596la.dtsi
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 711e36cc2c990..b47db26224bb9 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -507,6 +507,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> new file mode 100644
> index 0000000000000..1894c2b7db1f0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> @@ -0,0 +1,961 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (c) 2024-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Alexander Stein
> + * Author: Markus Niebel
> + */
> +
...
> +
> +		m2-keyb-wdisable1-hog {
> +			gpio-hog;
> +			gpios = <12 GPIO_ACTIVE_LOW>;
> +			output-low;
> +			line-name = "M2_KEYB_WDISABLE1#";
> +		};

These GPIOs have not been refered, so ti,tca9539 may probe after pci driver.
Please monitor thread about m.2 key e
https://lore.kernel.org/linux-pci/7kpwgrxgtrpavmm2aezv66csuumma6wzsqtwvmojwgrtiqasjf@gczv34l6pnma/


> +	};
> +
...
> +
> +/* X16 M2 / E-Key mPCIe */
> +&pcie0 {
> +	pinctrl-0 = <&pinctrl_pcie0>;
> +	pinctrl-names = "default";
> +	clocks = <&scmi_clk IMX95_CLK_HSIO>,
> +		 <&scmi_clk IMX95_CLK_HSIOPLL>,
> +		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> +		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
> +		 <&pcieclk 1>;
> +	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";

use "extref", refer pci-imx6.c to use external clock.

	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref", "extref"

otherwise pcie controller will use internal pll by default.

> +	reset-gpios = <&expander2 8 GPIO_ACTIVE_LOW>;
> +	/* Not supported on REV.0100 */
> +	/* supports-clkreq; */
> +	status = "okay";
> +};
> +
> +/* X17 M2 / B-Key PCIe */
> +&pcie1 {
> +	pinctrl-0 = <&pinctrl_pcie1>;
> +	pinctrl-names = "default";
> +	clocks = <&scmi_clk IMX95_CLK_HSIO>,
> +		 <&scmi_clk IMX95_CLK_HSIOPLL>,
> +		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> +		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
> +		 <&pcieclk 0>;
> +	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";

the same here.

Frank
>


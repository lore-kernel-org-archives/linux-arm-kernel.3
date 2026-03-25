Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA72109C02D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGiGgg5Zd6Hy1LT4A8o+mz0IWMCHiK0/VW/7irwh2AE=; b=GG0owLoaWODbgdpdWkrc+fj+/w
	La93wII736CVXimhMb+uv+u/6YN4+6z58Yu1YijviI5mKt/yc/DprsZkdzTaI152YuEIea5hMvyuq
	fnhm/2O5bJ2I2X6sdEprUkLdD5/bpRub0QrZcbV/SXL0ji0UV9pR2/3O7TLzuTn7wp6kwx1jnf0PV
	zn3ZECUbDQpTopRBtIsNnSpFDAFX+k7LT8LbXBCCnbvZ2PftHTe5L2N4hNwlCp1Ri7ArgsE4xX8zP
	lB5c86+QNX84dh3e0P+rshoBoDY84Dw3I5fXr1Tn9RHfkF7I406FdKo6VBrlT7CosmgtbXz4C6QM/
	KIggpVFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PdQ-00000003ilj-4AoF;
	Wed, 25 Mar 2026 14:55:04 +0000
Received: from mail-francesouthazon11011025.outbound.protection.outlook.com ([40.107.130.25] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PdP-00000003ikk-0GPF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:55:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/hRYR8qaABGRJs9uMMdbOzh5d4zoRpK6bN0Vu/5A1inT23Xh05++qzzxPMgESfxL6TogUROwipR6bGF+sqR82y2pawiX7+PZcATGiQcE33vp+8lkSbnqx+9QL+WWPuRCPrpIRyqlFWSTaBZJsYOXSif5T5vWeTuawlttxssWuE/EueeW8dV7F4ZUJd4/gdNMQu4o/pJy8cw/VQj9Fw1wFDwqZRy0YvGef8PholY3lo7WiGKiGVmkwAEq+FfNnRlBFHroHzSNsk/LllCCnxx9MELtIacRNgSKbxWWz6yQN7uhnfzDvxXp3KPmWo+erS1c+6EA4giT+n7Bx7/OkXRzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGiGgg5Zd6Hy1LT4A8o+mz0IWMCHiK0/VW/7irwh2AE=;
 b=NynJZhbuZknnqvhcxmuxMDrbRnRCOkAk2KTgmxeGw4ADTPxg7XJAIxb5/Pv9Ej9VtHiVYL9neOV6xVEu9FgDbGnLT/ambd1vRzb9DDJ0T1TX3rADQ7h/YtgcnWp3WNauWHgFe8x/I4GfZbCrEsWXGnma+VXWNgIfg+G92J061RaW1lhoDQQmRmIQBJVnqBOAZ35Ki4etzpsP55d4FwjrWUn9e7gmxqyfgIyKjxSx3Il0ZwVaLqP9XkB3Dl0qqT5dNwCZz7wLYTaaj3yB+U7tg2bAOBvQEvXZEjmz1OcABfJdVUOUSqcQUILgXr7V8qY8OKAku+G6CNac1Ny9ci4tJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGiGgg5Zd6Hy1LT4A8o+mz0IWMCHiK0/VW/7irwh2AE=;
 b=QhZ/5DcxV0UU78fc8JRehbcXSxSO2Gd4GMvY+xMr72m1IGoZm6WVTvIZx4OqQ/1r3fkZf8rCxXEW3sq2a5bjTMiM8Ds+0HPf0tIvl4ofaFObW0HtX1NdcOzHm9/jGsH93TMyfhdLembuDFTvg6lAdNqX1CzhUZh3EwJWgM5VL2GShGaXd+sSJVSiq5IjXmzmdqjYOAlZl+Z2+E7hk2euLT2PXXu1tfdxEAXwN5N0E4VWRv+1jrEyIF9Z+qaoESNfNmDiAYFOXgKo0j8anoFUjV5DiJsrsqYTzJJ2sIzyKbozPsGVoHuZpM08vCPb/nVGNoNwQscKckIYbicrFEg/Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB7489.eurprd04.prod.outlook.com (2603:10a6:20b:281::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 14:54:56 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 14:54:55 +0000
Date: Wed, 25 Mar 2026 10:54:46 -0400
From: Frank Li <Frank.li@nxp.com>
To: Franz Schnyder <fra.schnyder@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Franz Schnyder <franz.schnyder@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH 3/3] arm64: dts: freescale: imx95-toradex-smarc: Use
 gpio-hog for WIFI_UART_EN
Message-ID: <acP3NiGvRCc1SgjE@lizhi-Precision-Tower-5810>
References: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
 <20260325115513.707914-1-fra.schnyder@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325115513.707914-1-fra.schnyder@gmail.com>
X-ClientProxiedBy: BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ccdb7a-487e-46df-2a23-08de8a7e7a10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: RfJ8269rF4ijR/3BTjs2TEKafrzDW+Y49tr1G+c/r7R6mvENVzDXtYRc/wKkB+Huf/cVfAwca6flr1Z1esDZbKDMAFpmPWb73rW71UpNF4ZK4P8vprxrEMxz5lgV5pylTCVUw7xHeqN1wuFaicBFhvTE/MGaPqgrD4DNDvd8BWIcZ1qny7zNwX6m9SlY7+Z2af0QzXRv6/mbzzsRfuad+fI+3fPTgA8iE9s/Wk451iKto7A7fL2kGoQ9ewPJkoj8EhY0apVhNDy0CvC/c4k7GfPGpoN8kwBYVPinPlbh5vAOud7p0iNNB0EnYkielrLQPUYlkQbyZb1i3uQclQ9Mna7KnpXkVmcUFUBpb0ZdHQOXizoiu2KlduY1eOmfa8yRE+D9yKzYff0TVN5eyvVcxqy5Atq2PPVyEWTxgWDkeMP+BTHIbd/Da0xX/9w1d4Ao5lkEyTuv5EGeHQjLiBcASHssxPm6bTukXfUuqJYPF50avbG0EeVh0JkrONZSEIcMh+JZUOcmpPDbViXnADl6iG2s97e04Q3zD8/jO/NCiPk2wVeE+6bSt1xJucVS+jpjzx1XZ8ZFWoQmCNSH4EoEFSb/AMNpJqFH9dUCn8t7Pi6AOPvgTXJV+K1cf0lwsW7psiPOZniNOg3BsvgriJCd+1ADiCVTEK/VwO06IMwu8JtoMeaxzExiFCri6S96BL33h62ETRz8vhN2ep3tokrMx03azIrEkHsjm5JVkHU2mOPFBOuzylnWT1i6BwV0QZcI56eBGpeOVYRqxvhq2NwTXoaXrPEAK/DyWzV46ko89jA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OyYzziY9kPjzX973U2eUWVjz9JUQy9yj/cXEkoBa/q9/E5KOU1RnUtrms+8e?=
 =?us-ascii?Q?6SHNaEGZ7z5S/Xdm/6yKvdqbqHvd7iVZkR1IJEAJVQ9Pz6wv0vQolnVY//UN?=
 =?us-ascii?Q?sDy+4bXIQ4mUHflZgF5ymO1pPUyzpXbgAhTYHhTk19xfvi6QJ7syyHzdIUHu?=
 =?us-ascii?Q?N0c419bYqu40Cc2WWhVaaIh35caUS1IRUcwsLzy76C9sRNlyiqCQB87DLwIR?=
 =?us-ascii?Q?p1ipkDAM2dwRnVMfPzpdGsvX1M9z3SlkX/b7sPXcmtVhm9peomqjrb+SPwfb?=
 =?us-ascii?Q?DKc0DHDm64axscG5XqyOf+NtC8+VOAgea0FpBqMjyXvxhBNNM2AVr6SEkuko?=
 =?us-ascii?Q?xRuf/orUx27TOW7evxoSUgbFq7wy82PXKCNjeW715vfb7TSgvLfxQt7rSFK8?=
 =?us-ascii?Q?hcWdgr1MSza08+EPbraOhLM/zw8DS5HnbV11ebSNF121uEthm9rrTee6Dhr+?=
 =?us-ascii?Q?HyZ9FWXVl8jkoEgYXBu3OyoWmvuz/1oMKQlsd0XSFDi4jNqKtGRKtHY98TwL?=
 =?us-ascii?Q?uJVRJkYjHqgyS2da59sVGmR5X1G5Y34hITgQpcOZ+uERO6HDrtJmXRXfG+KW?=
 =?us-ascii?Q?1Rb2yAnW9LvfWEKvTUeMlQWmdE/ek4Crk7kLjNwec5jagkJwfIhsvWNhim0F?=
 =?us-ascii?Q?0JuX5dApsOs8RQ2flZ6qRcIlGj9RhOTVC+2Tzc9hJA/CBUj1XDQ7ZiBoiiFO?=
 =?us-ascii?Q?NcmlpT9/oLQgdKskBAlctqTpFMTqzMeA00EAEWwVHRobo8FUDWIbcW9Tu8jU?=
 =?us-ascii?Q?qMORlpV30k9uf8IAGya7pdypy8ERBHbOWUOPcHcvMTELtcdVxxwHNtWFLy9x?=
 =?us-ascii?Q?xGl8BOEMLovW2tK7u1PplvAnUFH4U1vf2tl9vGlglxkFenBYHBvLf+srDag0?=
 =?us-ascii?Q?rI8zRx6ryws0IFahH28P2JH4CUid3TgLzphAqMVifAolioUvdqBAep6nbH4/?=
 =?us-ascii?Q?bFhvwvXRW1mihXhiPtFj2sZV/BjRoxnNIG2q1FpTCtzJ2rT0CkRSY74yw8mZ?=
 =?us-ascii?Q?Wt8zVnxgQkPNmKxttXxSSRvWX1WrtjFDF8A2FomOWMoDn7nvmqfF/zTVKm4X?=
 =?us-ascii?Q?CtEysRbmvCyMIYwP4l9hcbaCYKqL4RLKAuFym0/hBxBM+1NRltgW+NnUoDMQ?=
 =?us-ascii?Q?HkdjvHLmsF3gcPgjz26nuhfGEsKfGC2MPr7LvJvp9o9yaPvxi9J3g7yiMCJe?=
 =?us-ascii?Q?RuJu0WWbu1IKDg9LEucvyTZwLbkS/IbfKE6T4T1VtfQ8oad4cGWL4Y/Iwvc8?=
 =?us-ascii?Q?msyj+9wjlWWWRd4F9aPocrvtORGPg1Kzdzfya5O6cZv+reaGxN8eTk08AS77?=
 =?us-ascii?Q?NSY5CCCut9f/Not+2eCBWlYbRvfChn3Gs51Xi1SzLY1mViZj/bcAfz5UgcDM?=
 =?us-ascii?Q?KUN+/AqsESPZGSKa/yAp3NsDwjXSZ4R1/vP1rVHEiN99RLTC4aeA0smXJNSs?=
 =?us-ascii?Q?DTLb7LKUx2QBuIsIDLDyyUNzbU3EgzdZZWbsund9PWJAzLi76YrfXHIiukbS?=
 =?us-ascii?Q?5XvwrnugFxeRuF+0QE46omOizZvgz+OvHSEBUwCwE6xR3HTJbuKN8ezbsd4U?=
 =?us-ascii?Q?HK/rHJ0PVjdweKlrGsiLJKT5wVKlU52GkBtU3g4dlZwlL99FKBmi5hMJWeNw?=
 =?us-ascii?Q?IhwRier9ONrnqzedbFqaaMIZ++cYwkZ2RLsLZFy2xTnHFXVHMSpa7iKMVwO3?=
 =?us-ascii?Q?kD0Z8p4xQEvOFLV0tT8LDRigN4aWosSb//KbC1z6oxT6Ap9E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ccdb7a-487e-46df-2a23-08de8a7e7a10
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:54:55.3598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7GONJexe0fDk8Usu/Pjk+sDyttq07SV6WrfdnE+ScZoApu/72UzhgEfENec3r32sl09sMssPrFQEcKXaLqxvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7489
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_075503_127097_5054CF80 
X-CRM114-Status: GOOD (  18.15  )
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

On Wed, Mar 25, 2026 at 12:55:11PM +0100, Franz Schnyder wrote:
> From: Franz Schnyder <franz.schnyder@toradex.com>
>
> On the Toradex SMARC iMX95, the WiFi UART signals are shared with the
> JTAG. The WIFI_UART_EN signal is used to select between these
> two functions.
>
> Configure the signal as gpio-hog and drive it high to select the UART
> function by default. Add a label to override the hog in derived
> device trees.

gpio hog have problem about probe order, are you sure gpio device probe
before pcie?

I have not seen any place refer to wifi_uart_en.

Frank

>
> Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
> index a90edefc5197..29e3f5bf867b 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
> @@ -451,6 +451,13 @@ som_gpio_expander_1: gpio@21 {
>  			"",
>  			"",
>  			"SMARC_SDIO_WP";
> +
> +		wifi_uart_en: wifi-uart-en-hog {
> +			gpio-hog;
> +			gpios = <12 GPIO_ACTIVE_HIGH>;
> +			line-name = "WIFI_UART_EN";
> +			output-high;
> +		};
>  	};
>
>  	embedded-controller@28 {
> --
> 2.43.0
>


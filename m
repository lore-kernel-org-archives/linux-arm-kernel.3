Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069C7CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 16:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZV2+/9YwKrVY/8J7/dDAP0QtArJ+rX8i0FDE6EotV4=; b=JSv8tJNPefj2ZlWtIRak2iIypC
	XGSjHD/MXfEm9cKFi4/gTi9bZnNpeIMV+DfBJtyxywB209k2farQKHq8pno1Syc7o+lWPmLiuqJ0g
	t5JbX/mmCejAmFO60Hd9UbYO0gkm49/PXwB2uhzdqhhggwRmGYJoTfbLf9bjF9qyCfMwTwYOPJLyE
	X9Y2qspS4ONpsA4eol6bjhvcERP6dE6EFEe1Nnh9DxZEih/jR5F1d+8DthfmuyoV4FgikgTZSwmiM
	4wtqakN5FMozMUMohlK8y1rl0qvBJ/Ly2OEMFeLc3k44qXY72wgZCbt6Y9fGUAsWPYKVEBW5eXFkB
	WZiff5KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNNy-00000002FAH-2YCl;
	Tue, 19 May 2026 16:33:38 +0000
Received: from mail-northeuropeazon11010057.outbound.protection.outlook.com ([52.101.84.57] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNNw-00000002F9L-0rXD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 16:33:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHqImdohD3qlXmVs3m1h1MXmWsJZimCDqWpJCsOHgZCPR8woYJlybkTXmrzIEBbznkl9fTZHG6D+/gTcsPyRvSjegM0dZjv//+ZCSZan3o4tCFdo01icIzMkyehejyyv1NajkGj5Pj481FyU7bHx5940d4gsRDGaqv5+CG2p0OGgcXAWJGb7RWjxb9OikBNTE7eLsXGM1PYdQYsinI96+h2geK3l119XA7EzcyEOMDYeGltZPVAGctsEkpr7w4FOjTlzhM4luWbJU1drGgmDu9DAnKNLoazfE86Kd5crzhKtch9E3gjwCqW163fDnB4yN7sHfOI4xN+cmoDrPazD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fp7LcO4KXBSqAGESkHq5Rj9V7Bt2LAXjY5BsYawZJ5g=;
 b=agS+Tyxtpq/Sz7y30ARuN+ywcCU7YI5Hxb+eVbuxXCJ+Uoaxshva4Lt+33ht5Mk+cttiTsmUThATGvaM0sjSO0lJ9dr+mA/b802z1tWN/f2+l6RmmEKKsMLVxtihcKRgUGV6KHpoKvOYYneaBf/2AhJ1sV0fU/kTI3qUgd4UieuMZiDk4HqgSEg4kpuZJaibQsCueywSs8YT7VHthrHXxVZ0C13u976Z+esZHRTcUGmpenaHDW6Idrmwd7IkKhixvxhJqVXDGDEeeXk8r+domukB4djIRsNCvgSYPVGbNTsOuhgDYbzWj+CzRcKsA0b4fDqlCu3VNc3bELf4w6UMoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fp7LcO4KXBSqAGESkHq5Rj9V7Bt2LAXjY5BsYawZJ5g=;
 b=RqDtID2hWWtLou6bkijtaTwpkrnQed/SnrwohMDkbCqE6K3FXYiKtoFIUcpTI50tSnZ0q+zqJ4pnp42PXCfjoothh4GitrFzo9QHwLe8PPilnmSELgwRcV3d7Ekt5/bEHbQ8RVJuC4DKhuMlRbXLh7wNWoirVH+ltctUxTjYWcGmxHzH7qHnn3ZO3Vt49t+d+nu/G+ArL54EEGpZ7Sa7Uo4EGmP4UUFoUKD87FNakD2VimJex0A3UAb4y+LiGcg2uQ1ZBxIQK0JXV2qEcMr1NArLBTIHeTzMJIkb1XwtinoDbQIKP6HFGqD3bdavYlnUuzcv8ItuMdLf1+LJMCpnlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by VI1PR04MB9978.eurprd04.prod.outlook.com (2603:10a6:800:1d7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 16:33:27 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 16:33:27 +0000
Date: Tue, 19 May 2026 12:33:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Franz Schnyder <fra.schnyder@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Franz Schnyder <franz.schnyder@toradex.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Antoine Gouby <antoine.gouby@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 2/3] arm64: dts: freescale: add Aquila iMX95 support
Message-ID: <agyQzmR7wxgOlD2X@lizhi-Precision-Tower-5810>
References: <20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com>
 <20260506-add-aquila-imx95-v1-2-69c8ee1c5413@toradex.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506-add-aquila-imx95-v1-2-69c8ee1c5413@toradex.com>
X-ClientProxiedBy: PH7PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:510:174::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|VI1PR04MB9978:EE_
X-MS-Office365-Filtering-Correlation-Id: e198afe3-eb8a-48a2-8979-08deb5c45a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|52116014|366016|38350700014|4143699003|56012099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: Eyz5PMBy3jMYeZZnqvlyAHLiY6earofbGkVH94Pr4duubV+MCAlM9rxnTabuqTLIqUB8eYsFVF7Im5yzhLBwBCy2GmRqTjFjsx96N2ZvYbHxis8nCp72Do/cLjwgZw+p5loWzFu2XKnUF6MJ+z48NoDFuKI7HPmJQfoNyHlaPF2J5u9ncxcAFGt1zE6Qw9jhsw4HtXV5TjU9pLZMl3DsAw+Tb/xuKCCsnFEaElIo5xHhO5HSG8O8B7K4wfcwOuo5huPv3rP/VJaEV5vGge45ptnWkGqvjrUS0bY9wRDKAkbkXJZCF3KVKPE9NOlInZXw1TMtEz93A/6MliFEmyZrlgf8NLVdvRisRrgR9KDdxEChfJL3j1gzRs6qrbfIhi8TOH8fnsnQd77+WbRIEcf2Yun01RrUDQwLhj9JefWE0UeDXT2IIrpn5cU9tJDGQNmlB6C/dNgJ76QGbfsquYQVNdvP5pFjG5kGjrzysxiJaJ3kCtR+I9iYN/2wO8+ihAUaw98gRRplPAp0Gwfihnla5XSiHkp5tKcsTo0ah3hrpCfVrVbQGKYGqv2VH5sxYB3AOPTAdNTrI7qtn5NxwqvUTAOqLhNIbJamNCnEOJ+xashuf+y8R5gyV/SyNfdiJGKxBDtqzYefINdHmq5wBwnQbQqJ7j2opuogioy9rk7YqUYFL7I2ZJBNDMPhNpX70XqLLDbMSLm3+oSQLMXwINHxRkg2f6PH8ISFJrjkkiYH9G7zid4Rgw3GzAV6L1BZOkgY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(52116014)(366016)(38350700014)(4143699003)(56012099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Us7y8ckhH+zzmG7nyFhOI9Pei6akS1vUf/es2CFmgyUFPE1WRre44XA1yq?=
 =?iso-8859-1?Q?5CSKxOSegu5FZv7VDBIU+KnhkjLqEis7BESHK6km251YAlgHzslFxQnEZ6?=
 =?iso-8859-1?Q?TjA5YmNP0bVHXZCzi/7+RPLJTkg4qrriaY/MZ9JJOTU7Y5Pq5TK71GbcAg?=
 =?iso-8859-1?Q?FN23x4epu/NqE+xgO6QllJI1jcwqbj3xzITORapQlQAQl58/Ab0PWPVMVf?=
 =?iso-8859-1?Q?1AXykB3O1sOItL2+7rY5jSSjRKknlYw5a+c6UKmqG2q7L4IK38Wwz0fTyi?=
 =?iso-8859-1?Q?yQPPZeSw9slDjqxNYWgsHntkh9F3mD7EQbPAvfquajugMEbJA6eiwqSLHO?=
 =?iso-8859-1?Q?lVxu20ft1j+pkDjKLhNmdV0H+oEAYN8J94BkHUcoDpI2BibxewymAngsKn?=
 =?iso-8859-1?Q?YgFAMF6ndPlSZgNtmqTm/bceZ4OSg+cNjOSZZ4KHha9s0DjPV1f/S2vHeP?=
 =?iso-8859-1?Q?NsX4YcahsNBsNpsN0nfzvSilHo3U6o59I8Ob0GHp5H0zodvawRhJ6fM4OS?=
 =?iso-8859-1?Q?55tD6ERbtCMdT59erX6LXSPLbhOPhWv1Xrk3eLpw7vRcwDiaIR7H9ejV5g?=
 =?iso-8859-1?Q?UWPjG8y7AJ+4IddLsBhtsgG5JoG+nfmGpyt91+mCNf5I7YtyyD7wMEHncN?=
 =?iso-8859-1?Q?EHfWYZwfTSoMqxTk3qQHEqitfN7+r02QYetIINfUHqn61HbF1AC9faGXXn?=
 =?iso-8859-1?Q?a4+Tcx9DuFVNcykJZBo+rn9LlJcPk04rVIdp5YOVbdl6zOyFms/FStgXe0?=
 =?iso-8859-1?Q?1gkTwTA7SiGo7IsFMSoj9NDLqZnK+YEIv00UvL2+k6xZkRfZfScfi/ELEu?=
 =?iso-8859-1?Q?MaTv7TWqrfxu2tv2KtbYi0Po1HXGsOiiuEoVoCotUFh3G67bJEqjI03vP+?=
 =?iso-8859-1?Q?pqS1hVi0rOrZE4iMHEkoSdLUdYtLoH2YFZJBVJD+GuL3ck4SK3QC6CYQVu?=
 =?iso-8859-1?Q?OURd9D/+xqZpB6JXrPQiCIO1F7syeQq3ufz4I6KXvmPexWnGcJx+nNpuvy?=
 =?iso-8859-1?Q?BLxDNiJi4VTOd0jBNlkJpENo8HzpaDtctwPVZA+CxrVYPglnOYU+YAkSVo?=
 =?iso-8859-1?Q?AJmEJ5Se9A24sZ6x7oZ4ncCbpV39VSrvsvawyI7w+WBTFmAMa0sWQB0fDj?=
 =?iso-8859-1?Q?qMojnr/ro+j1zUh2IjxAflVNcurIyotif3MwGD8LPpuueTscTmxbKiXP5N?=
 =?iso-8859-1?Q?VIOxnXoEoUtiuqLWmPgGwBBhR4J11EgWHsBmuWu7lqMwu48wSt2U8GVK+9?=
 =?iso-8859-1?Q?beNLYqq6o/ubd1Lx8Uy3rJ6gT2M5Z1zIy08B98lNfQPCZQwLz2/zcNKBXt?=
 =?iso-8859-1?Q?GEADXspb+KdbGLhVwe3+Re/NchpbFuMbi6qPZAUJUtATICdaZcPO7BK4+l?=
 =?iso-8859-1?Q?2ExsRcByn3q9JTEU58Tlidlr02EX1AmN8rrBsrHG9PascKS4EHMnNMXjDI?=
 =?iso-8859-1?Q?uNHKEIVOzKDoE4HDg9ffWgIo2uFfgaPfwF9erA+PgeGAIJrVBzMtwF10ks?=
 =?iso-8859-1?Q?9ntegtGL+8gKLRqer5imMHWdSkWhI6Em5s5wR/E5Rpcv3TT6U3NKd8p419?=
 =?iso-8859-1?Q?zgTEhS5g8Xz/N3ai2H5UbTcNAzJ9W2CrPtIM/7uRVvvrhMKaJxwp3J0Mdc?=
 =?iso-8859-1?Q?QlN/JM7lp0PahQYX/TsYYzAlQ9SNp3tHwBkqMSvVyYLWPJDMvcb1qW9D3D?=
 =?iso-8859-1?Q?LyGMY5Z6w42WkgSLDzIEbGAtl0Djo2O7yDTrN68/g0MoyZiHRXUwb48b8+?=
 =?iso-8859-1?Q?u6JTkgaZGwLe0uLxGojm/kLvJAZ4may3mdgfRd5Y7N4GPjBM8ufcvYzN0L?=
 =?iso-8859-1?Q?/lP9AVASJA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e198afe3-eb8a-48a2-8979-08deb5c45a30
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 16:33:26.9192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VC3CiHn4bDVV0IY6JCQ2xhOpg/7I28wTUK4WkveqRIZrgqW1vvT5OMfCrPArgBcJlzHKG4oHSK8+PhvHxBmXwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9978
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_093336_248507_FD0E59D3 
X-CRM114-Status: GOOD (  14.02  )
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

On Wed, May 06, 2026 at 03:01:56PM +0200, Franz Schnyder wrote:
> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
>
> Add support for the Toradex Aquila iMX95 and its development carrier
> board.
>
> The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR5 RAM,
> up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
> Ethernet PHY, a 10 Gigabit Ethernet interface, an I2C EEPROM and
> Temperature Sensor, an RX8130 RTC, one Quad lane CSI interface, one Quad
> lane DSI or CSI interface, one LVDS interface (one or two channels), and
> some optional addons: DisplayPort (through a DSI-DP bridge), TPM 2.0,
> and a WiFi/BT module.
>
...
> +
> +&scmi_iomuxc {
> +	/* Aquila ETH_2_XGMII_MDIO */
> +	pinctrl_emdio: emdiogrp {
> +		fsl,pins = <IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC	0x57e>, /* Aquila B90 */
> +			   <IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO	0x97e>; /* Aquila B89 */
> +	};
> +
> +	/* Aquila ETH_1 */
> +	pinctrl_enetc0: enetc0grp {
> +		fsl,pins = <IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e>, /* ENET1_TX_CTL */
> +			   <IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK		0x58e>, /* ENET1_TXC    */
> +			   <IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x50e>, /* ENET1_TDO    */
> +			   <IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x50e>, /* ENET1_TD1    */
> +			   <IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x50e>, /* ENET1_TD2    */
> +			   <IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x50e>, /* ENET1_TD3    */
> +			   <IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e>, /* ENET1_RX_CTL */
> +			   <IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK		0x58e>, /* ENET1_RXC    */
> +			   <IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x57e>, /* ENET1_RD0    */
> +			   <IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x57e>, /* ENET1_RD1    */
> +			   <IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x57e>, /* ENET1_RD2    */
> +			   <IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e>; /* ENET1_RD3    */
> +	};
> +
> +	pinctrl_ctrl_dp_clk_en: dpclkengrp {
> +		fsl,pins = <IMX95_PAD_SAI1_TXFS__AONMIX_TOP_GPIO1_IO_BIT11	0x11e>; /* CTRL_DP_CLK_EN */
> +	};
> +
> +	pinctrl_ctrl_gpio_exp_int: gpioexpintgrp {
> +		fsl,pins = <IMX95_PAD_SAI1_TXD0__AONMIX_TOP_GPIO1_IO_BIT13	0x31e>; /* CTRL_GPIO_EXP_INT# */
> +	};
> +
> +	/* Aquila CTRL_WAKE1_MICO# */
> +	pinctrl_ctrl_wake1_mico: ctrlwake1micogrp {
> +		fsl,pins = <IMX95_PAD_XSPI1_SS1_B__GPIO5_IO_BIT11	0x31e>; /* Aquila D6 */
> +	};

This list is quite long, need keep alphabet order by node name. To reduce
this kinds problem, suggest run https://github.com/lznuaa/dt-format for
new dts.

Frank


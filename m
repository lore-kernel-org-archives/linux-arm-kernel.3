Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A047C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tZFBtzyZDSigOh5uTWMLxc0LJYx3Age1sXYxmruuNg=; b=P5THG2MIv9FOgQlP3IvTvu04E7
	n8GUWs5BFCS5Pk8d349RhtNLqUgckhC9jOZGWKwJrtrfIE75sUyiP17B/AGaNs0nMTZpHOrbfO3Pk
	1F+dDwAztPNm4xyQEMlQb7BYACCqtm4Zpq3ZBz76teGBkSs57ANGhtcVZ0CTrEFibh8P6W7aOHBrZ
	wxku0nWDfFPHYmJsgPhZAZO37q0jTEbCubugsp0UIFuqVugTKEzQhJNvrwllez77G4HgMrCZv630U
	V55NP6E0sVuXKCeDDFr9CaL4UMVfQIj2EDgh1WeDeArt6H4oTNMyGMQRcPKV6t870NdWpvwTf89ZC
	O78ObAQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFKj-0000000FGx1-0X9J;
	Mon, 29 Jun 2026 16:59:45 +0000
Received: from mail-francecentralazon11013058.outbound.protection.outlook.com ([40.107.162.58] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFKg-0000000FGwh-2hd9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:59:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOzVgEArI0x8jeMjeE61YDG1q8V0RXQfc38vytRWzC18fWtzz6hPZtvncweN5FeMC70O3xYwjx3Qjy14LqTdDCAWA4QAuUykzuq98zpJAgncDGe8dtM/jNQPXBlYhvhDvZCc6peMm1pP3TqCe68azAjxy9l/FQpeIm8N1tdyL4C5+cEu0ywdfCvWfOpo09k1b3CP8ztwtoNJlprV+ukOEycaX9YNcyF96P+3taEGhqK3Lt1KDOOoyWhGxBqe1+3bBcRskFY7176zy6c2GFiQIkBFf4okebAaSItIkys0QNEdulNfzKUtsVrsfF2jFVvVqezAOmFQ0uHqroccOEmknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tZFBtzyZDSigOh5uTWMLxc0LJYx3Age1sXYxmruuNg=;
 b=ig4OOmI8EFZYfXA7DtHQGUtpLR3COgaaipQjEojWMl58tdjEpOPsXwtC1p9Acrt6FozibULdwZBhwcynUHi3uo9Y5si4BeATIBkidISH4ummnPzJeiUaHkeXfJqKU3WapsMlI3dAjbFfQvTsx8YrAU951ryCxsVOSfF3ug5AYPhbJt7Wb21W2tvHjHqHMN7ZlAHk5TNMoKnCdQUSM2FRW1g0XVzJvDUK1w8I5WOYxmumuFRckdqFnjiSJYydj6/6zv4sN3jJa/MaNcJ7J/BPc9xQ77+AwzhA0sLwSA9pVQg+m2iTaNERqEvmRnRfi8GdKjgSUkdFjQNIbRItlaJS+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tZFBtzyZDSigOh5uTWMLxc0LJYx3Age1sXYxmruuNg=;
 b=LsQKTi2l4HZKnriHwN6ec6O5z5ZbPHA6M0NRToidiP3/cFn8DfLJk/gSLaOqB3VUDvBD7hhGbBuvxRv4wxCoQUE/HD2++kRajKf0pyfc3dtl6cw3tqYZbj7Nk+qefxoZj32+8D8VF/G9eP0SgKoQRdC05aSo7WwXaiiLqjCZa4oKq/SVOS+sDJ/7wwjjjFh8BPtE5bkJxThxKLXPdUeizOlFyQSlCkMvoHlypD+qnDr2ZIe1CZV0JBCrQdVuM0XW0wKlDvFFHM9e23k5R9G7OCS6taXEk6i+AvW+7gSGCEmlfFs3kBg05QWKUP8/6g4vUoLIKazw+WnvzP7OrHWAUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9452.eurprd04.prod.outlook.com (2603:10a6:10:367::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 16:59:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 16:59:31 +0000
Date: Mon, 29 Jun 2026 12:59:23 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: hongxing.zhu@oss.nxp.com
Cc: sherry.sun@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, frank.li@nxp.com, s.hauer@pengutronix.de,
	festevam@gmail.com, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v4] arm64: dts: imx94: Add Root Port node and PERST
 property
Message-ID: <akKka5-QXhO4h8lx@lizhi-Precision-Tower-5810>
References: <20260616072334.1107262-1-hongxing.zhu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616072334.1107262-1-hongxing.zhu@oss.nxp.com>
X-ClientProxiedBy: SN7PR04CA0227.namprd04.prod.outlook.com
 (2603:10b6:806:127::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c6359c-eb10-403b-2f06-08ded5ffc999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|7416014|19092799006|1800799024|22082099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: SxCJJB3v6tRhYK1vCGMdJ6T6AEXYnIqUeOKsJJaY2MAjJFdDW/EfC6zfRCfel7AxffGKQ88jWNhsOXzQJpd7il+uz6EENzg+TYh+xRdsd2JEkKJ3+nhqjmWtohNC7EqDoz7XL51+uorr9qdSxgsWWDw9DzelCUQ/01nLO6A/DHk/m2UDEUYM19Jr4xJwkc1iJ2iK5xMfbxUZelvgnE/yFLDCt7jyhjh6gScDJ61h1nojcd9M8QFYidp1VVBJnkuIU8umV8o0UB1DrHX2SdAUoUOZd5I4onPQTYl0JAsgO04D7TxWw0K/wZqCNIMN0N0Xw5HrdBfl812Gu3vSsHoXlSd+hl64uklAaHX40aC5Pn2EwUboYeG3BElbNM6zuSDM/5tEE1I6bMcVDibjmcNBZ9G/CyZspXO4sXHmQ9P1g5Q/UwIA8EVXDwcF53cQDMrIr3U0pG9KOoE6imn56QYHcP9Lqgl9MYrSeaDrIw0QEb3UA0SZyYSb3kqCwra3whWv3zp7pLbwgPo/Y8tSVc5BBLHnpY/fMuGonPUAJFRVpWDMs3/YXabk406OpwM0XriLuQYpFoZ4/Qpb5kN4z8sWRxNxibLddpqqHuMTF3OUbZk5SLPDcaJIok7oY0Mpr+HGp6lWz1wmsKMkg367Xl16Ua5z1ytvhOQftKxxwAJHjzE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(19092799006)(1800799024)(22082099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+FS9Kfe8FmqEvTO8PSu3+ne6l9RW9lD53ncQGTwxx9bKjE6Js8yDAQNAIsl8?=
 =?us-ascii?Q?NRWlWEGwfkFHMmlLl6Evh56PNM5o4UP7ueP/sR1hETHy5g5PPCn5VHAPl3oi?=
 =?us-ascii?Q?jxLfNUbbDDQatmnhL2x6R9jFICWTjhbp9V2yg1sN7YL3CE/CchKOYe3ylrr3?=
 =?us-ascii?Q?st0rxul5Ssgdo5ukcTLaOPVPKSw/SQ7oZvYi9PgwHohuRhQ8UC4khGqAYSpI?=
 =?us-ascii?Q?LaI+aUgkbzK7ivcPirdXRbk8ff/e3uU1uEfkTkxZwnaLVqkMSKv1tQuyNzIO?=
 =?us-ascii?Q?2dV04MLAUN5Bzni0TT7BbdzC/magV09kZeowVfypYWhERgMhRX3jaGCgV0z1?=
 =?us-ascii?Q?2HjgdhzPWU22Jbsxahw58V9DaQN69OSdcP2MX1SW5BpahH4hMzeu8sQDp1ai?=
 =?us-ascii?Q?ZmgLWuwKWG+OBa63WaxUNOH/u0M71bi/KGw3cXALTkvHkhwSG67CoXJCdNY3?=
 =?us-ascii?Q?JT5cP/HLJHks1YdR/DvVl01orYIkxoQ1VIJAPBJ2qh1NEFUdDAxUG7hrR8EI?=
 =?us-ascii?Q?0Lbqzq9Ge5O9bDubPT+iM86ja2kpdhnUMSo2st6fx5LCWKE8vHeeKZYUsA2z?=
 =?us-ascii?Q?T1oL7ctudrAz09+fZCbAys9PlJ/H0ZW+ZIxOLbW6CAWuYsyZApS2KBd4MEGy?=
 =?us-ascii?Q?k1jisUu2ZB7Q6g9+xzpJR29ulQtAhokoPBOGUvUPXvQQO6iFfAaVStIpvrIM?=
 =?us-ascii?Q?3v4RA9axROMuPqpcn+47yYwkwPl/KB2pzwcAVjbrQBmkl7K/FdWQIgcNGvIZ?=
 =?us-ascii?Q?FEhW2OE3erYzKZGV3uTtfeztdhQAXdVMfGjvul4BKJIy+JY3AzITTtwVDQH1?=
 =?us-ascii?Q?oCfBLiPZjHnZ2T9Oh9FPce/zDJU69ilyZUt3XJY9RyF2Z46NnaRrLOzse3Zu?=
 =?us-ascii?Q?c15XylCdHsGoRXVeY6fEtPYv/5hVpiMq2d0mfzbNdCwf/BbLBA6GaINtyB7Y?=
 =?us-ascii?Q?dY+JZ4PIAkC6Br5OwRT4tj8iw3wlFFORX0Jxx4Gi4NwcD0Zh+OKIWxZvRXb7?=
 =?us-ascii?Q?8gI7Yae1yIjRrUaUT1gGuZt444j2p9iom4Yw0PDdpJ2Q/Cak5EHwSAkqkJPn?=
 =?us-ascii?Q?FKtfybQbgsFd4WUGxmJSvbtvR+TnMuh4YkpweWqhY3li/VaKGg5Ae9WiisvT?=
 =?us-ascii?Q?x3H6iWZle4HKOa9IE2fcYvIjzF+fAaaPlVe7raEzwxn9CoohizI7D4GrTHhy?=
 =?us-ascii?Q?9HZw79PCaINB9fVkEVKsBoCU+29m9sJrVHotzyqyIR2X3e9gFLEDL7lG99BE?=
 =?us-ascii?Q?XZoKfLp6kPCglAPJhTYRujLYPdHvELy5aM2u6+vazWcE1P8IQE+4Jm8pTlJT?=
 =?us-ascii?Q?sHJNdfM0Tb3axsrV/KGpMFCVtQuy9H44OgrrEntph9bHqu1PA5QtlY1bgl0l?=
 =?us-ascii?Q?epJfD+zk9er5ulFSk570oyL8APcmbb+p2Va6FjVKVlG4LYxLb+fAep4Yna0d?=
 =?us-ascii?Q?HWexP6S3IF2aHfNwA3qq7thYZPpukMQyexilTRHK7skHPjgFn69VZXMDkJd8?=
 =?us-ascii?Q?hvDDVK3i6aHBff1t19A8zyj6T3BE/WvGf8otWOd4xQOUSSDRal/1ZWPLljNG?=
 =?us-ascii?Q?3Dr/1ABRmFNtwkfJecRJ9aSBvHDIOy1SIP1fhU+se52Gkj+l7Cr4L/iXCdmt?=
 =?us-ascii?Q?At25qBDFfn1TgQGb3pavaZpicj7dMCCmuweXDk5iN+wAskEfsel4rr95VAV7?=
 =?us-ascii?Q?ZOCYCiA/x9FHHtmehaSn6ZoQJEob73j7LcQCZbqk1/P9eiEVGINMRf8nTslc?=
 =?us-ascii?Q?tkcm+dBXzdEnizsAvV620Ruj//ZCsreXEl3WUaCY6sWr7nEUlyCq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c6359c-eb10-403b-2f06-08ded5ffc999
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 16:59:31.0476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDItjImGOGw+gmnqxPsu+H5MgM79RIy75Sd4bkOybD8t8vULidkA7qgPv3eqfTTYMSo9H7WFmwK7DF/s5K3mwCkKiGCFy+WrM+gLt4XRlLFJpJqvDBzdMvzG9rV7RR8t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9452
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_095942_686722_CFCA064D 
X-CRM114-Status: GOOD (  18.68  )
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

On Tue, Jun 16, 2026 at 03:23:34PM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
>
> Since describing the PCIe PERST# property under Host Bridge node is now
> deprecated, it is recommended to add it to the Root Port node, so
> creating the Root Port node and add the reset-gpios property in Root
> Port.
> Move the regulator to Root Port nodes as well, because that the PCI
> pwrctrl framework had been integrated into pci-imx6 driver.
>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx94.dtsi     | 11 +++++++++++
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 14 ++++++++++----
>  arch/arm64/boot/dts/freescale/imx943.dtsi    | 11 +++++++++++

use two patch, one patch only change chip's dtsi, the other one update
boards's dts

Frank

>  3 files changed, 32 insertions(+), 4 deletions(-)
> ---
> Changes in v4:
> Add the description of regualtor changes into commit message too.
>
> Changes in v3:
> - Move the regulator to Root Port node as well, since [2] had been
>   settled.
> - Collect Reviewed-by tag issued by Sherry.
>
> Changes in v2:
> - Delete reset-gpio properties in PCIe bridge node.
> - Correct the "reset-gpio" property to "reset-gpios".
>
> Since the patch-set [1] issued by Sherry had been landed. Add according
> changes on i.MX943 board too.
> [1] https://lkml.org/lkml/2026/6/1/1461
> [2] https://lore.kernel.org/imx/20260520084904.2424253-1-sherry.sun@oss.nxp.com/
>
> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
> index 1f9035e6cf159..dfbb73603cb24 100644
> --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -1411,6 +1411,17 @@ pcie0: pcie@4c300000 {
>  			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
>  			fsl,max-link-speed = <3>;
>  			status = "disabled";
> +
> +			pcie0_port0: pcie@0 {
> +				compatible = "pciclass,0604";
> +				device_type = "pci";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
>  		};
>
>  		pcie0_ep: pcie-ep@4c300000 {
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index 7cfd424689507..674410e541cba 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -1034,12 +1034,15 @@ &pcie0 {
>  		 <&pcie_ref_clk>;
>  	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
>  		      "ref", "extref";
> -	reset-gpio = <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
> -	vpcie3v3aux-supply = <&reg_m2_wlan>;
>  	supports-clkreq;
>  	status = "okay";
>  };
>
> +&pcie0_port0 {
> +	reset-gpios = <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
> +	vpcie3v3aux-supply = <&reg_m2_wlan>;
> +};
> +
>  &pcie0_ep {
>  	pinctrl-0 = <&pinctrl_pcie0>;
>  	pinctrl-names = "default";
> @@ -1058,12 +1061,15 @@ &pcie1 {
>  		 <&pcie_ref_clk>;
>  	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
>  		      "ref", "extref";
> -	reset-gpio = <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
> -	vpcie3v3aux-supply = <&reg_slot_pwr>;
>  	supports-clkreq;
>  	status = "okay";
>  };
>
> +&pcie1_port0 {
> +	reset-gpios = <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
> +	vpcie3v3aux-supply = <&reg_slot_pwr>;
> +};
> +
>  &pcie1_ep {
>  	pinctrl-0 = <&pinctrl_pcie1>;
>  	pinctrl-names = "default";
> diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
> index cf5b3dbb47ff7..01152fd0efa5e 100644
> --- a/arch/arm64/boot/dts/freescale/imx943.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
> @@ -255,6 +255,17 @@ pcie1: pcie@4c380000 {
>  			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
>  			fsl,max-link-speed = <3>;
>  			status = "disabled";
> +
> +			pcie1_port0: pcie@0 {
> +				compatible = "pciclass,0604";
> +				device_type = "pci";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
>  		};
>
>  		pcie1_ep: pcie-ep@4c380000 {
> --
> 2.34.1
>


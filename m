Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E2EC369A9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 17:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMuwhXvBJm7VGun4zxetGlvT1SCykZCS3UNE4Hy6y8g=; b=mQu8n5L7oAY/eDGf0kpnqcP1wt
	KfEQQLpBCFYtzlIswfyz1Bk5drKKCFiLgX4Vmp7aSOmOB2/WnStWqTU3XlivWWG8dM8anQ05psxAo
	oy5l1U9zBDSVnxhmQXWEdgx4O3OcRJPBFMlykmMzcrtO791FPYmNQllvD9L5SPFhDdK4nWhUaVP6j
	Y9r3Qzar6pD5wJSfj0TE4spcb0sOpvpUVZpykyJXuLZTXf+mX/jSwPHcS3U0jLMtFWVoPj9t715Be
	trzx3dC98Y+roV/86RysL0k3Z7XLnWt+ERpmySZ3Jf5ObsATzp09Gz3nG2JLwb3mJBfHqsL4wLsfu
	sF3brbSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2viU-0000000BNYH-0NTt;
	Thu, 10 Apr 2025 17:29:30 +0000
Received: from mail-am0eur02on20601.outbound.protection.outlook.com ([2a01:111:f403:2606::601] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2uVc-0000000B8l7-2CIX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 16:12:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJcg2a8a2nf5HC2/6jaaE8H4ReUZgM4RLnV1LCctJd4fepe529pSek8fL7WL+WNxGUJEfD+WfHUrFH1267oplgGatWAT3Utu49n0yBXRJcZ/M5FwwRU0jMHjADH9L1dojXYHw5AKMl8rs4XqjgzDHX0mam0QR1nu8O3plWNxjvBjCkXtEluQ7DU2MiKYqi7wmvwLvljsIXAO82YngxdhjZ886/14c7tTIwqhUpLWltx/yDd1Fn73OiyG+gY8vHHcjbxOKayni2hZ/MZOgcNXo+CEkst76fmzmSpEb4Br4bHimOlsjW0Z3iIUSDP2yG/8IAa/INDq7YZ6GbnRHMTnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMuwhXvBJm7VGun4zxetGlvT1SCykZCS3UNE4Hy6y8g=;
 b=vz3469KXT4ln0XwNOaCk6HmWLHqzWNYJFFQUG4n6oZdrSdIP4Ieo6GmGWRmJx/ghD25n+W7Cu2NE9Ikq38sKze/pKGSSYlCbjEtvwpJl1SaHsMiDhTbWziONVG94Rj37bpmV6hIW4MTOLAyUgha0UrmQLf+6hVL/HXc6L/gkJdYGGTjYEp8S4EciapNeob5rqHP4BDvNWPLariOyulRKWzlp65zX1+rHbWdnCtb3tsM2yiQt0EOLuzjhlqX+TfUe0k+C6DJXmh3LsYFWum0niDUJWX2cE8vJHpixuJPhBHKJ+nYFjo2+u0U/FrD3/TAl8iMZBUXNKjohPEhvnDkaig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMuwhXvBJm7VGun4zxetGlvT1SCykZCS3UNE4Hy6y8g=;
 b=jaHp52R1vGwSX84SUO64OGIVAcqn+73MFyg+KL/DfZEIRjR1O8A8rJeYID2TL3+0ogZRVRYeDjgboUljhvvNqro2xf9LIe2n12sWhk+oH+Bdc8M2HPVcCmcxd1Tpf2VUClwGj29KeTIZ3Ea/e/hV91YYsqA1BAzZTEqCIWyIBTUektxOaTIQSvcB0g6RWRjkdbd8M3tM6wHFelhQJ5dtYlobuMg66Cds6dpXpRq3Cm+pa9jVF2tGmT277PlFkKgV3FfWtUpaaX70JwnndVA3UCr1SPjoVtzglHOUpjcbmf4msGbSVRWS9IbowLSl95EhB35EWIEWXIFyrUrHueFcvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8258.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.38; Thu, 10 Apr
 2025 16:12:04 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 16:12:04 +0000
Date: Thu, 10 Apr 2025 12:11:56 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] arm64: dts: imx8mm-beacon: Configure Ethernet reset
 and IRQ GPIO
Message-ID: <Z/ftzJrTsRRApwej@lizhi-Precision-Tower-5810>
References: <20250410005912.118732-1-aford173@gmail.com>
 <20250410005912.118732-6-aford173@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410005912.118732-6-aford173@gmail.com>
X-ClientProxiedBy: BY5PR16CA0026.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::39) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 2775f8e2-41d3-4cd5-b844-08dd784a6ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|366016|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fGiDxRFK6fK03terU568LhQ85Q1hGsBvfH926cITiPma9SwnzxLOrkhVgYfn?=
 =?us-ascii?Q?NxEz0uqgr7TW1ukCLIhTKXRjUgGCcE0CfxRhD3Owzd5g7KBw38wC6x6ERhvK?=
 =?us-ascii?Q?y2g0h170LeGloiFRsm7tQP4dvNKRpFQU2xtHGCoZ8Vtl63FXFwcFB7Pk3Wm7?=
 =?us-ascii?Q?GhPqc2KgzCUq8Gm7gEyXfQI8k4jW6UlaKTZQa7GF1uTP0iuCPmwd1HmwSrcM?=
 =?us-ascii?Q?Q3eIstJYgefRooM6ABf+e7rC/MMVV1QcI3slvsq24O5md5+Hg8WtIz3LRidg?=
 =?us-ascii?Q?lCnO4zhm61YIRN3/D0B8uXQJfk+WNiqlBmuRqnGym0scvr/jNCXWzL7OQxY+?=
 =?us-ascii?Q?9oHpL7ZR+geuI+IDaWli5r+xx9vLpyef7yKhe3H8mgbrE94URnsshzCYjQMQ?=
 =?us-ascii?Q?VlFqQua+yVbN89UW+k2ngYUh0Q2VzE1zQ/TLtGro2vdr9WXJFT8T3dFEH8zz?=
 =?us-ascii?Q?b42AIb1AqZRoSv057ANbB3b6yCA0JGqaAiKWg/VDg1FbTvIACiMvfyWldBTm?=
 =?us-ascii?Q?LoQ39ZmkB76hb63P0jCohKgorhCgg2uKrl5tZW7pwH8K8KChGWYlK/WtRVtL?=
 =?us-ascii?Q?92TsqaUpVZu6zbJ0DCetweG5SjWC4E5H8l60gJAFbnK5rIpD4Lc84Mt6gb3a?=
 =?us-ascii?Q?NBNEePKbZqDb3IqTVC3DBIM17WriIrZk9QZ3aDmqQsJr9daybQCvHY9pEDJC?=
 =?us-ascii?Q?P/YqxWtgXz7YmKRzIN/vjgyvBi1yr7VwbXPcbYC/AHgOFYygFIi2YVXXvlbJ?=
 =?us-ascii?Q?78FRd4Hi7fxmawbk5o8bLPQ8CUtdwctPNKaPmk5N4BETkDZJFtMcqG5CiJ06?=
 =?us-ascii?Q?a4UrewsDsHXhwv7loWerQsY6XA2At7sAprdTCwuS5XC7ii8xkhtLksrN89mF?=
 =?us-ascii?Q?0xRMmd9O0FEsR0zeVNnyCaU7NEDvRr7Fe3DS+NoyVhv85Ykb5talQDtuLzBp?=
 =?us-ascii?Q?QroF9nq5DRaWtgm3/5ZWRQZOABdbraFYtYFFNIRzUGwycQrMZPh6Wm8mTVJ3?=
 =?us-ascii?Q?CCTANtPPtS8sDfzPVx6WaonvM2v2bBbgXt6EVS9bLb84raaKfvYnwl2SZBXn?=
 =?us-ascii?Q?Ie42h4Z83nYuvTgFFcNIp/O79MXPkzGodaK78vQgaVY0tS7MDXHMxyeiCIyo?=
 =?us-ascii?Q?gKYxRlzZ6UjpXFtZgfKBRkU0bN2wwzAyK51Y8uC9JHh907ablvyMUbof/fPC?=
 =?us-ascii?Q?tjs9gzq1GF3WbeBEZ1InELsnDvgwqlZ1lNHwVLwjWlodxTS5U/dhCPCw7H9I?=
 =?us-ascii?Q?l62lfN3LpjlEh8mQ2bT35vs7WC3oOJMXk/hNcMaKoRZ2/la2F7adWg26e2dr?=
 =?us-ascii?Q?XbPrZUZ3HZklW313P5HLLLIO9kBhqZJ7qinRCnMRsFuN3l8tVqyQKnHpT1f5?=
 =?us-ascii?Q?IXINn+DoM9LJ23EYubuEHr0YgwvgHzQjtbiWxwjVOm7BkMx/hKeH+/wt6P+S?=
 =?us-ascii?Q?V6pkn3+aUTQ4unXKswgAsdKUDf+t8R+aqgsREvWEMdymGe8LG+7cHQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cyz1NuCVDwHNsBi7gtUnxZ6VpjliRDs3mjUo7ozo5bXB/482bPidh3OI+s+R?=
 =?us-ascii?Q?hTJ3KVzXF8yjscVGQ1Vgu50huQOeFfQ98sIjeIPlg2plqHYudGNW3a3HN1Yf?=
 =?us-ascii?Q?yImsZHPpmC9ivfZQRzPVE51vFHG8s3glIH1WmGnznOgp6WQ2lJNQVtM1E/JH?=
 =?us-ascii?Q?UFnIAYQ6F2gprrYegFmX/sA15kS2PRQGiJ4NeXwBy+PqiZjtHayaYK/j8c4p?=
 =?us-ascii?Q?pmPr2k9M/TtM6BS7RRm9fE/cO1in+jB6YFqHrimsI5WgcQepJZy+s6ZTWVlS?=
 =?us-ascii?Q?ITpmTQqzHeTKihDrRYoZngPGiA/AblQ5hQ6ECgJMUcciHv7R2yP2IucqdtWV?=
 =?us-ascii?Q?xC4Cc7cP4Ok4XNuqMJIVyUbmLR6Q8EBduUurDiO13iChVA8leEgc5KzqoVGx?=
 =?us-ascii?Q?zUq6TNwHnslZHsqm+eb1MsxO/qj8LEwc1ehfTGAE3yws6RubIr4FCSN2qEcO?=
 =?us-ascii?Q?Xvpy55v4QiRfs3k7Ke51S26cII3Nxry0mzUAv9VCfnq0nPvBRPFFE9r14c1t?=
 =?us-ascii?Q?RUbnhzbF6vd39ww3x9bqv2dDm8VvEo2Ou7R+AfdQah49JrwiJX4uWLbAM0Ol?=
 =?us-ascii?Q?I/LOa5pOgO5ClcSLA9eH+zKn/BD6w2EuzcPYJHgB9aXvPLkVMTq9Hn+SnHyl?=
 =?us-ascii?Q?zlDlcZF5H2zveiZ0NUx7Q9DYOqtZo8II3WqdhRwstocRvBQe/tYIPEBeLwbe?=
 =?us-ascii?Q?Rjnwho8vQXVzzbozAA5VHQZmNs4n7CNBPGmcgtT7pCXICQG7pkeqSt+Q4Ibz?=
 =?us-ascii?Q?xr7edNg0f8Wn0C1BeslhtvM9LWiYH1rAYu3Oni31Nr4tBo9RxLuxtwcbR3os?=
 =?us-ascii?Q?gXb4Bw/riTPOmzqu8Ob3vneIBglB9uy0I9tjwCF909BMuU02q8UkQYmnTUcc?=
 =?us-ascii?Q?M2QL8q+44+vZsOm7DW2E12pON5nz8rx9AQoHN5xpkKJxnMiy7QKk6b4Ti5TY?=
 =?us-ascii?Q?nzUS2iPUV+TZa3AlOrt18qSegy8VplUo0UP414Xg4MVa6SL5nv1wrsvuZ/wQ?=
 =?us-ascii?Q?BpkPjyyG42FUzYFnc4lRlVqPt3enAG4kRRjykSkxGriDwBCInjwh6KCoRCQb?=
 =?us-ascii?Q?4ddIFeBVixzvrv2nh+gWolviy0U9BqJo1plDEH7NZWoNt8JmIB4qrOMm0BTq?=
 =?us-ascii?Q?hLL5lpOD43rz9cThcKpQ1StaUXhCpCcTvJe223aLiWbHo5XvsPDp8DxcP4ZV?=
 =?us-ascii?Q?UvFPwd4zIJ6HSHWtXvLvnu1DJhokqepu1PdM5ySVFM3Yjh06FsxgJYDjvf6c?=
 =?us-ascii?Q?xE5UW8kNIWxq+MH8O8om6hafVLMS1l5rWc0lmkLMtli06cFsGBxZjAlDIrdc?=
 =?us-ascii?Q?6Rxv9MhYECQpNgVuhpk/Pix1tXlMO5R7YKDmrcxoqc8Yqsc3nwuqeKxyjRbV?=
 =?us-ascii?Q?F56NxbVeUmr7+5gtp5yIhhJgMKiEmFrEaCCuFjk0RgrIn+H2P7dEthdF3kMu?=
 =?us-ascii?Q?9dWu51lU30yYJF/dFkZ6Ur2Isu6gVFiKmemcDpjvVuqLnpXP8GuGD1L9RGsA?=
 =?us-ascii?Q?UQuojHyxDbSPJxCcC1EO9jIsTh03+iclJl1Gu+p6R9PoQB32jsZe9O3taQtX?=
 =?us-ascii?Q?fuqSel99Uwym/ko86zeS3hRvU8ikMJOFldSv5sx4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2775f8e2-41d3-4cd5-b844-08dd784a6ee2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 16:12:04.1249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9iObItTVuhBIWeICwVQKQeXh7D9WHoFDQs7InwXIuwmuvBFGTcmNLvL+ugRyLKNLPZ9t+1vcpR8IBzhVm+gOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8258
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_091208_566168_43A81DEE 
X-CRM114-Status: GOOD (  17.99  )
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

On Wed, Apr 09, 2025 at 07:59:00PM -0500, Adam Ford wrote:
> The ethernet PHY setup assumes the bootloader will pull the PHY out
> of reset,but it's not guaranteed.  The PHY is also currently

Need space after,

> setup to poll, because it does not configure the IRQ. Enable
> both GPIO settings for better optimal ethernet performance.

suggested commit message

arm64: dts: imx8mm-beacon: Configure Ethernet PHY reset and GPIO IRQ

The Ethernet PHY setup currently assumes that the bootloader will take the
PHY out of reset, but this behavior is not guaranteed across all
bootloaders. Add the reset GPIO to ensure the kernel can properly control
the PHY reset line.

Also configure the PHY IRQ GPIO to enable interrupt-driven link status
reporting, instead of relying on polling.

This ensures more reliable Ethernet initialization and improves PHY event
handling.

Frank
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> index 9ba0cb89fa24..ed7a1be4a1a6 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> @@ -78,6 +78,9 @@ mdio {
>  		ethphy0: ethernet-phy@0 {
>  			compatible = "ethernet-phy-ieee802.3-c22";
>  			reg = <0>;
> +			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
> +			interrupt-parent = <&gpio1>;
> +			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
>  		};
>  	};
>  };
> @@ -315,6 +318,7 @@ MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC	0x1f
>  			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC	0x91
>  			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
>  			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
> +			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10             0x146
>  			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22	0x19
>  		>;
>  	};
> --
> 2.48.1
>


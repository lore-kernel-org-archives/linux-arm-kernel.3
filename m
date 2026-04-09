Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5D6EA3C23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 10:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2t7Rh31O/cnJYSHLoy6/znK3rUYDAJ6C6u7KKmwoByY=; b=GZDtvoKDT2ISu0Ek1n9Uu03+AM
	LtwJe9PG7HIr1etjBnszPl1ON/hZXaGiTdGX5Jqj23P9EUcEmGHRawTFCmjfI4U4Ul9AxfLT7yx3P
	iNgj50sn5pAQzuG23isrfYrq9eFmHQqEStPyY0e9qeWsYiI9Spo+fAsfuKY1X/aAB9ERPIPwDl+77
	Xlbmh16l2ghSMSR6eHsqBRiGkLMv8BwRfaF71Mh7pZJeyFlrO4ItFGlB5iE8RzawsugfSGomCQ88Z
	lHC2E45XvvqlBbtL0IGIDJ6D8yS/X78ecwl3Tvpwj/+xMBlqmWDvLq1EPy8SJz/28IwLgM5OSQD4K
	2zhbqYCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAn5Q-0000000ACrs-3GNN;
	Thu, 09 Apr 2026 10:58:12 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAn5N-0000000ACpC-2GTe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 10:58:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SavmfxJyzmHPxZP/sdTphlIieWj2vEvqCVl/GXGP0Xh0mjgzFtuhMz8yzlcoNehT2d0yGfxjV9lPZkEUyrserB84CfgwPRC45QlpKtZBxu69k6HUunGObxq8UFRLJa/PFgL09+OnAWFkV1UcPzMhx4+eOkf9BdfbThyJbyyEsEUkM3GfDkoBG0XDM3ELmtATJDvFG+nc5DCwG1XAukXm57h21bzS0NPFBFR99302ddTVG0pqWKY6J7lE9dqQuIvW2U1eTdXO5Et7Se9kQl3r6qtun28u/a6UjDA87diIzmS+HnydMp6I/NnzEFUqmG1FMZHAEhaqEmachVB3yi08ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2t7Rh31O/cnJYSHLoy6/znK3rUYDAJ6C6u7KKmwoByY=;
 b=ERbLVNwJ7pB18Bdaici0EHxay7CnSpohd5jfLhrbkuKnHm2W/raXoRWCczCR2fG7RnI17hHwmRSb+wA7E9DFZc66RrMAhATE9iXUuZ6z6C6sguo+gs8UaayR7dAx+umwzadHjQl8n9zGdJQo2b7HnvjV21zOK0QR4bWX3+1mmUFeFKuatK85+vJXQLGwPV9nRs04u/Nem1KU3P82kipNXFTOvrvTzNdgwwTBLLT0S02NK3hFPupnNQrrxfDs+Gy7weZJIiMBjmn0oTw+7U6AZef+Vh3a+bGApVk2rkQac0yPpDrUVj+StW/SviPyyOWndaHZ1icBPCP2u4GX19+FAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2t7Rh31O/cnJYSHLoy6/znK3rUYDAJ6C6u7KKmwoByY=;
 b=Z/sIflwrE3q3R4Asab1fm0ZX1LmS6+3WTxgZwwm5WR92V80oAeEAodWOR1zz8R/h5JW3GDM+ktbqf4iX6NG0SvT/QN8XrE9ldH0mPbwRYSuOwoPTNm6CaHuaDjbe7WvKzdv0FpnFstQ+tbO89LRI+9ggW9acnEvHUgcBMJxdOSkFw2qhidoR5XJqNT4IUqfbnNs59FsUARosjTS5mbd0Mqkb5AURf+3oBwezFGl2IkepdCvakJOg3mxxJpXitRZuxZsOE09ebRYQsVIEcljBWCDqnWwQBX0QVEEz3zTh0xLG3wc4dr8+boc6TxEscTL8uySK/ZucL+cUjhzTpEVzGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7918.eurprd04.prod.outlook.com (2603:10a6:102:c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 10:58:03 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 10:58:03 +0000
Date: Thu, 9 Apr 2026 06:57:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ARM: dts: imx6ul: add #io-channel-cells to ADC
Message-ID: <adeGM96R99hgp4Xd@lizhi-Precision-Tower-5810>
References: <20260409101759.4159324-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409101759.4159324-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SA1P222CA0089.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f604917-9601-4974-42de-08de9626df21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|7416014|19092799006|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: LoIx+RcOFvsG/rrZcGZCmmr5FpBs5FrHbYYdS5poUi5wfTj55HSdDNOkKT5UHb4mdCcc+K8ubL81ggjKdJVWG8uhdURKANVfMIAqOZH0/kcPMM72xk+/smLJhOk6p8sVZLtnutsiSdnyyn4wGI/ReNWDQ2PqlrHJj38iUG/q1xUHbtpoZdh7Wy9VAhF4ZrnkKC/D0fu7Tx3O7GF7ExbEqb87cih2MuI2ENKYzH9dfmMR/LW6YM1hSXnuuP4jPW4qBcRIKUtM1yCVsjRhnmj33tYzdL9ugnjcqFRPOapoQxnj0lVG8ZZLif+K/RSp/ZgslAhMejJRb6KEV9kQ6zpYnPFuxpmGxrlCc0Y1thy1PPEtxMF9PNyQ+aZPZAh24H3wgkBRt81oM8Q0HBG48NE2pyDU3ZReZlC8XuUdQ6JlhSRMXbuXJCiHw4VYptcB6mFX7XHbqYtQIQvFQTHmDGfrQiMJJT17aml2y5jDLz7DGZl/Vw0Juvw96Rvh7mr8itpMJ26S4rC0xwg8+U3AedP07fEB0COK2AyfndLB/tSj+T7OJksPNS6pvmGzw9sjuh7J3H+4fx6ywfa/M0etKPiPASj2LmDSqm8D80z8eJm27pyVt3Xomg5T0eTjZy7hsOI8CfEC7cMRvDOjxLEJITINArWg8r77L4LRg24L3MUkcBs91yi0x1a2xVmmnsjsPK7QU7HkzrLhxa5h1UvJTMrvzvcLFZs9WsHAu3HLiWXsx/KH+IHe9TFPeRqxTfOv6zu1F0OHfK/jQKL+2MSSatFIucF6EAkfGlbqjsK85TIu5MM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(7416014)(19092799006)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YkFNgZlauUCTxkQuIGPcsy1NgaQ8C7ifkR+EC4hRD6FuCr5oj2iPnfdN3Lfs?=
 =?us-ascii?Q?+093G0Vfyimn/FAmvVLNfFbvAXVOi2Uf6uRhOfa5Mxuq/3wQpDRDrZ6i4uDz?=
 =?us-ascii?Q?3BWXXbY3sxoCDFkFHSxTJeqMQhXyhzpZuLUZdiK2lqIow4rP/OCKbNTfCYBT?=
 =?us-ascii?Q?i+3mGVo/KgzSc3ZzJGA/EHlaGUAS9Gj9hEVmAwafrEqgR1aEFPfCEqlNPaK8?=
 =?us-ascii?Q?7Fzx6HIqkvZYHFk87xgi322aYt5SK+MvlvkowbUUViEvmbXcbTL+XBz+8vJV?=
 =?us-ascii?Q?4q2TSx0JZJcoPmaE01tJuvK9ujLZI3Fvzagw50sTiwY7rNeLvYjC15uIBh+o?=
 =?us-ascii?Q?1f2CQlu9fXh2BKVsbeV/2HZthDG1WWsP7adxobZmw9bvL8DNByGC11bIKNNr?=
 =?us-ascii?Q?EmkurpvvJrZkH3Aa+DH6CSm45FIBxpCMl0XhL0CxStQQwAMNdFYrsFKlINAU?=
 =?us-ascii?Q?/ReskezwMey+iL3heW1+x0V4lrdGfnw/a3Plna1RcxXLfznKOcgoDRpyTcm3?=
 =?us-ascii?Q?j1oedFrwW276Rcn+fvpeVD2f6LXJ/IfE7UqUm2+ho9rLOGqHTDlkQxboiV9I?=
 =?us-ascii?Q?BKOLDtPza3wN8iNi2M9xlFOrUSPOWfl5G9YKn4mCUGAvuVOKaxHNEHyNgFUX?=
 =?us-ascii?Q?KYuCRKuOtPSwCuKeAA6Pwi3Q7IhR9QoMRWfokBDrN6EKR6Y1ZylSlyzWQkzm?=
 =?us-ascii?Q?RkHhlegyoz1R2L7PlsrohZbzMEy0TpMxaLScH+1Yit+FZ8SlnBl5X8Urkie9?=
 =?us-ascii?Q?87Vb39QlOEy1GH2pa4DpAQ+wkDfT+4YNKasNk7ZtOzPxpGRtxjX1R6i6XByf?=
 =?us-ascii?Q?ppx4bA5atMaJQlOM96hC004N2i0/86mXbRe9u7qaYTSOpUIqZBfy7y79Ecph?=
 =?us-ascii?Q?8ocKsQ34c5RFgBIdcBzChi7WmjmskcOuTA/QACh3hi2eYzakvhqzv9KDq8vE?=
 =?us-ascii?Q?GpwT8cbsLdc1MGAjNOZXa8/Me67FP0AYxIfkPsufRRHXD/0GsWIPN5/MvqYK?=
 =?us-ascii?Q?7PNjGPiGrvW+VPxSJeBm2KIBs9hgtj2AjDAoV0dVHtw2/3B3afzXo2H7A2KT?=
 =?us-ascii?Q?sBExxfD5Rz2ylcOWZ92Z4iQo99UuBuusDNK+AClTP8KcNVIiL1crDAHJmzE/?=
 =?us-ascii?Q?sV/ywjd6jRPJXc54hdsv63UZ3F8SewQpkBVfshCIhRnAErOLaLFOq92kCAtc?=
 =?us-ascii?Q?wH9W/N6vh34XXfu5mnCvpH0B+C7xAA3qknK3inr0embTLJuKD/vsy7SCnP/h?=
 =?us-ascii?Q?EUnttk7QRApihuuDbmybUUCI2kbPwBV+DTWjgF9CwREDbGFMng8b5+8jp0Yt?=
 =?us-ascii?Q?rEPOiLPndW4gez14ZphoBTNf8yYSabWjkVAb7EcEnlSZn+Ai5ja6vmSTvRp0?=
 =?us-ascii?Q?QU4/61Qbiw6EH1+YkVaKLo6Wi9lEPT7OYNGubKwW/09DL+OlJOrzCyca22nn?=
 =?us-ascii?Q?dPzJm8cWM6XeUcB0Y2+Hxbxin1B8zJCioX5yqWb+QF9Q8iZzzUdPnU3ruUru?=
 =?us-ascii?Q?pg3MAc6ljRDJAk/0UT+3+W/LFFI/G4hXMH4e/Hp0kqQEOLX1OdE35mofSTmG?=
 =?us-ascii?Q?cdZYgu3Rx785iNe0xP8LhSFFyPeosVxrciMyLi29jC+BcnIIS8QEG5TM2xBR?=
 =?us-ascii?Q?e+mInSMqVnpCt/LxNSLs3g7xnBp++Yvoh0t5lyW7wwzjzAARcITJwTfSTuvS?=
 =?us-ascii?Q?jexMCLD2CIkJyG55XuuWpwE4K7ElWAUZYnUWD0R+egnkjeRzLdtyLpQcXipl?=
 =?us-ascii?Q?ANo5OgHxiw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f604917-9601-4974-42de-08de9626df21
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 10:58:03.1619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTWgGzyxbX7oLENc/K+ZRQPE+p0UpNbN0eZooS0huTdqATdLkm5D2Tu395CV1JUvix94cH3XtiywpyCZHQBcCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7918
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_035809_601183_2CA93515 
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

On Thu, Apr 09, 2026 at 12:17:57PM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
>
> This commit adds io-channel-cells property to the ADC node. This

Avoid use words "This patch/commit".

Add io-channel-cells property to the ADC node. This is required ...

Frank
> property is required in order for an IIO consumer driver to work.
>
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6ul.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
> index 24541fdf49ceb..d2bfa08b5e767 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
> @@ -951,6 +951,7 @@ adc1: adc@2198000 {
>  				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks IMX6UL_CLK_ADC1>;
>  				clock-names = "adc";
> +				#io-channel-cells = <1>;
>  				fsl,adck-max-frequency = <30000000>, <40000000>,
>  							 <20000000>;
>  				status = "disabled";
> --
> 2.43.0
>


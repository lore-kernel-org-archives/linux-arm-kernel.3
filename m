Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765C7CD8C9C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 16:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWAKa6GB/EYOnsD/KBNuIM3zVbu/DmENfxDTtKQBSLM=; b=d+M7s0umHuPdjF/uJzcDSLzKXM
	bwGy9QupYgqMGOGueu+531B31Qw6mm6UAsqU/xMT0POYDd4EBqNagFurlH/2pPPV9pCRp4aR5TmkU
	pO9OfdWS2TTh9jaF8qOSv2oRKucUTrQdGseKUTWFXG8NP4IO5EkFnuCIxGnXPdvlwYc2RI2uIWKCK
	tmB27WaNi+IuP5e4YHJiyOhVrpU8+kYXPuICXE+x76nu9UCTRMD1lsE+r79EucbPqyK7fYZIk//4V
	tmj8LtyB8psUtAtBmXMt5OmP9vXo69qfPQ3n0Spo4JnLefQ93VNKtgUKuKCn9Rwm6xEj4wgL/+SAx
	dAyOkSJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJaBj-0000000AnhO-396I;
	Thu, 13 Nov 2025 16:28:47 +0000
Received: from mail-northeuropeazon11011066.outbound.protection.outlook.com ([52.101.65.66] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJaBi-0000000Anga-0oaX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 16:28:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XblIkUxL29ACsKTHrkf+NaKRK/iPm8pVD0uANtmpHTqvuttdVl9y6aiE9xyFYhKgUvm3sFQt044J8hnxXSeDEYN8kEoTDq2ZyAwwm4tH6ZRyN3wdgo+BD1mZfQ60uBiJLWPqmtcLmOXTUR3bZvmsr6RODzUj8Shv6pPK1QJQDnEMgA5xaHTutWbEkBU4csOO0WoXzXJzIOzcrSH6trHOY2M5ud6JD5QJJ6N3SajL0ltXgpGzuSSK9kG0W9Cz59pipIlIStNqDZr6FZw1IFfszuLZmkE+ecqBYq21yel0y/a68fWZ/rxPcDSqStSA4sc1nz1uFn5MIXDWQfddkHtLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWAKa6GB/EYOnsD/KBNuIM3zVbu/DmENfxDTtKQBSLM=;
 b=QC0f3wDPOX0Y4wOIZvB0TdkcsamnAudFiKHPXCUMKNzDRmF5r1lV42EShLhruyKfMl6RTAvEUskTD1XqplEsGv7+6cVbwNaoahfX/h7/BeQeYfcaFmexNtsHTPPkFJYaqCqJ8bMU/6ScXF5t0I43VXMET6hmIPMHxYNK1kKiZQOucScDPYwibo/yUmVSepEu+iNKJ4OKRF6VdSxR30dvWYNZRF0EG1EQaDHllIovOdKUzhzsot3KNbIA7RwT4IQciYrZyih9q866yHlTxyH7xHJaGrcxAebGCZ2hMVl3RMpwKDCnLkHSrVzUp+vPQaZrx+3ZhB25RY5Mhc7s5r9wvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWAKa6GB/EYOnsD/KBNuIM3zVbu/DmENfxDTtKQBSLM=;
 b=VITPxZ7qDY4L0SvSsezrHZ/cymjgzLuprmbHttLXZxALW1j/dVjLKrq8aM030nmOF3pidrIHWmAJ/9k7BqeAe7Jh5aaT5ateOUqgk46AAAcQF7b6Qy6lXdXuoFvmIeB5ccNPw/yYDYRBPbleUscc9jQVzbP9YIkYJcnYV9aPu0nQ3yuvR8OXITeLb9KY4OqSpmuEjZP9/dkwTJVa+CIHIlLGvGQw7hhznTNP+plljX61A1mhih1Z5yLwvbh0CExUeEQ3bL+Yr4QszvIXcMelZNVEl2I7sGm7Nvj3Opz681bCmn/CvM3f1BGHs0/13b8pGK6fH2T2KU2UWm1GStRVJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM8PR04MB7762.eurprd04.prod.outlook.com (2603:10a6:20b:241::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 16:28:39 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 16:28:35 +0000
Date: Thu, 13 Nov 2025 11:28:28 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, jun.li@nxp.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8qm-mek: fix mux-controller
 select/enable-gpios polarity
Message-ID: <aRYHLAVjcr4jcpJG@lizhi-Precision-Tower-5810>
References: <20251113111444.888985-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113111444.888985-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: PH8P223CA0025.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM8PR04MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac24369-98fd-45af-97db-08de22d1b164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ig70dKKgyGtDWr0NRlnaHsVkUNZSav2rMlRSDID5IBbwPI6DEbRFiE9ztWzI?=
 =?us-ascii?Q?+IEKnS0ehf8/NE1h87fNHkQ3QwpkpEy4sL5cZ/RHt8SN9SMUEk4VieGcfxbo?=
 =?us-ascii?Q?ryurV+/ku6vCtcbPiuhocX+m2qMatGdTyrHwZsHfxOJZyu7GyvoXpinThu8o?=
 =?us-ascii?Q?IPc6XlhlcDlv/rjt4hJXUCGyNxQSxYhk91qd65vq4yETV1jG3V2fd7p+ista?=
 =?us-ascii?Q?E7QKPxXRloeC2XxgNsTpnjFF36pJFebaaVPzH2irX8aXnV3l+ukZV+nqxij8?=
 =?us-ascii?Q?pJ3Ey7NYZiWnTB+5a0j6AIVEvx11tICI/Dh1b5V8Kj3VTAyvrc74mcnGoyLF?=
 =?us-ascii?Q?eLSf164X1HRnCZwCR8X0waQdpl3TokmP3w+8BMGt29DcYj4U8ESz3QuJfhMz?=
 =?us-ascii?Q?tUjtkH10gsEurnq2WxFkbjUR7vXLNhjYc616NYGWLsbIhcFMQ78RqxIt3jBc?=
 =?us-ascii?Q?2F0xgzy9WVO+m72UwceO2SLswDr9W+PWPIHZCCHJ2cawhRSIM02oCpJYzIox?=
 =?us-ascii?Q?7k4ZvnAMFipTTzC9ooXnj2kaAue3qOggy/EpgWW4dmr3BWiWr0SPVD+TjkvK?=
 =?us-ascii?Q?AjKJ6vOR/y9iqjhcosieBrSQGkZeOh3aSW41bLjNrQ8AjwoNxFoFO37RFW9m?=
 =?us-ascii?Q?BxXKcWl7h9/F66C4HGFmit+2UL/Psg3c+aPodjG0A9rfSJhd759dUypUy4vB?=
 =?us-ascii?Q?LBSvWMg3PU4HtEWe0V/8UNAzXDVp5jZn0xEooagVFvRTWsuVIq0x0HCri1v3?=
 =?us-ascii?Q?g9OaSxVzOYcuJlqd/5hql5uOH/DKzjjFKa24Q84fEwJNUFIXzLoj2ZFKeNZN?=
 =?us-ascii?Q?aXEMlAfU/X3hMamVcHTnLa5Yp8CdJzxLGWXHuQhvWXsgfsUUZVAMYtefkutp?=
 =?us-ascii?Q?DF1kIRUFLfsnyOUaQvrgULOPPXWGs1Xaw/IBwY5C7vr0kHUWkLno7VAab2/V?=
 =?us-ascii?Q?aFnrVhIOLh5ZPu0GhISva3XZetAJWWd3t7sPkU42xBBeXCNgybcP1NUHnxIC?=
 =?us-ascii?Q?Lx21PW+4Y7C9AEnbz6MoAm/iS+GEKcegXjzi7Q9XzFL4qc3jC3XmVZDWe6TU?=
 =?us-ascii?Q?uzmeRYYFlmBicgqYEFQ9H6aZ1Le7ianwT9dpFFQLeY+jtNrMloZ1OLr3nW7b?=
 =?us-ascii?Q?aq3FN2GlwUH2JWoXSPlAzTx5L2OX3HsUTMuMBS3tWFzz4LCVB5TXqBFcHgoj?=
 =?us-ascii?Q?BJt2phWCmO7yGEPfkfKhEUzNSfJtF0/q5l+csPj+7CinxYqFhwWRwCJtSmAE?=
 =?us-ascii?Q?xPDTkicsBqAw2H4gUSVXmGY/tOSMIC8DY+BS7Xev9VYPt8iwyFIb5M4m60D5?=
 =?us-ascii?Q?5CjuMp9Il+CCP72LYlsF5XyA0mH0ZB73iPY8mGL8tgd/pOI5H/rnGOTXrWHa?=
 =?us-ascii?Q?amDU4FQ1DvLmXHx6cNSvZrrqBUME0ajPMgcSMK7LqOz5ZrcNtCYaDpdfHhSx?=
 =?us-ascii?Q?D2xUKuLyR6QmCcB3hFsIcLYy3pKZ5XZKqichlsOsbtaMwauCY5mU4Tre4Dqk?=
 =?us-ascii?Q?4VAiUXJYp7t7t46kQhc1DdTdu0MgDBy8bb4f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?40KpYbxCFW3RLtSMWCaT9sFxq9Lo9DWrBbkVsqsVUVE8fk/VKPnLImKwluwa?=
 =?us-ascii?Q?e3ywl1t/WpuYWU09RsWwJft0lrQOE+CS1ICuuJ/kDD98E/Pz5lUb3wKnoYFw?=
 =?us-ascii?Q?xr/c8krs0XxIi6WW5nQWVDpxVs56h7TolVAmUmfLOMKoItIJEqmvcIXtf2V0?=
 =?us-ascii?Q?sFupwXUnsos/EwWDtfg7a+sYdX20JCP6nVqve8gk8ZHBairUeP576PrgqEr3?=
 =?us-ascii?Q?bMUJgAszyc0aScQvQGVESJ1JJVCqVNRRvKmLAqfW1K9zqZAe/ktH0qXTSZhX?=
 =?us-ascii?Q?bCMJdOg9cGsnTAsXCi9NMqbLBFx81H087ovhxNEzaxFH4gRLiz40FLi5rJBp?=
 =?us-ascii?Q?LtOJG6VdB1Bo7W9CAjDis120z+CQJLq8VVVDIIlYd8s4K5eTxN7h36m1VUrl?=
 =?us-ascii?Q?5AdElM9zFi4YuNZZl8h0PP/AAJkFB3IS8yHdmiI3qDc3oyJScjq62cmLclJG?=
 =?us-ascii?Q?QH0F4FxTgo5PKGddRgDPMKrQz02XiroQzqCYwzXYA15nsp+1Bu2OUqbEQM3Y?=
 =?us-ascii?Q?bMr3qRnqHWrhO2cz3S2I9+z0PEo2PtGff0TM26gYD4xIVLyL3cTe5+kFbPF2?=
 =?us-ascii?Q?cvdfKp2/Vo9q5GZ3SbzWhHPiI3q4dB1++CJAzEwyBprJ9wbQp9s8QxKrQ3qy?=
 =?us-ascii?Q?McWSuwUQYxbaLTumr4RBlkDuwLtDY1amdGu0ien2c6pG8LceZaGaWESeAcV7?=
 =?us-ascii?Q?pPwPQawOMg0a8HrI01c3aPXexHQ+CUz90Ga620QJ1Nu637iTYMg1j84he+/f?=
 =?us-ascii?Q?J+fpjViiwLT83yZINX+uoBmUduCxwLnWLo6+y6JE/guVio2XZTORUJlsJXdm?=
 =?us-ascii?Q?KImlIQpwlPLVZMLyDasaEmrOybGsVNDmhS+ylpiDGPuWpeBQaY5q4M84UjST?=
 =?us-ascii?Q?CPYcKGV69/OFEpGoMyO0ZEyqOKDc/GtFT8hZ0KxcUN34/rim/515ySacvwWS?=
 =?us-ascii?Q?s9fF6aEyTNJBVpxUU29ASl5/+rF4nX7/IDv0tMkBShlkrRZPRxk9/pqbDDdE?=
 =?us-ascii?Q?cMExcvPWQwigoTCYn626yIdtN3RWNfp2mbvd7FZNFWYOBFOe3N5GLhguTGIn?=
 =?us-ascii?Q?7UvmGVqzWRovAM83+ZDt/xRy5mF3YUvZlW6hh6wnD81UczyHlQdWIDEHFOst?=
 =?us-ascii?Q?Bcdev6q4XPK7FeObZuWzvUlE9Sf75IuRREE9O2crMT7r7e+EvCbeOesiSADY?=
 =?us-ascii?Q?A6sd4oQARFherYxWbF7Qi/J+qHLWGXzNU3kQ9PgSlCSm/1v37yu747XtmKV5?=
 =?us-ascii?Q?B0Tvo7sb9yZNQR4KhRS1OO7XnfFki43S+fn1NrWYsFb/cnh8Zn85vUlLt2ha?=
 =?us-ascii?Q?Bv8I1YgBXt2NuAJy6l1htF89PChHUpShPV57LtuEvxULhD5IefUTOBPCcClX?=
 =?us-ascii?Q?t/KXyvg4sHfcA0f5n9QrzssAOaTvb3rZEjnqlCA7h3mhDRAJUZP6xXj4u+Ic?=
 =?us-ascii?Q?egFVlW2h4XnFjpNtfSVGgaDfMbyRxyZXNmzdJWgxxNtmmd1CAEdl+UqiaD9J?=
 =?us-ascii?Q?bqXgNRB4csS5/trP3YTAMKDwlwkmtSwoz0Ti27QlwgsDVUcccvUderKmsXJo?=
 =?us-ascii?Q?2nt0aCNE97cEM1YvJvw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac24369-98fd-45af-97db-08de22d1b164
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:28:35.4581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urKrf3F8rIapTvzWBc79UCQCaX9+ieXJ+utyWMUankJPKze6MWHnwIBNVHkLVpFYSiY31rA7xkrmbcxcjiaT6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7762
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_082846_235098_62844C6D 
X-CRM114-Status: GOOD (  16.60  )
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

On Thu, Nov 13, 2025 at 07:14:44PM +0800, Xu Yang wrote:
> According to the board design, set SEL to high means flipped
> connection (TX2/RX2). And the TCPM will output logical 1 if it needs
> flipped connection. So switch to active high for select-gpios.
> The EN pin on mux chip is low active, so switch to active low for
> enable-gpios too.
>
> Fixes: b237975b2cd5 ("arm64: dts: imx8qm-mek: add usb 3.0 and related type C nodes")
> Cc: stable@vger.kernel.org
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> index 202d5c67ac40..9c0b6b8d6459 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> @@ -217,8 +217,8 @@ mux-controller {
>  		compatible = "nxp,cbdtu02043", "gpio-sbu-mux";
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pinctrl_typec_mux>;
> -		select-gpios = <&lsio_gpio4 6 GPIO_ACTIVE_LOW>;
> -		enable-gpios = <&lsio_gpio4 19 GPIO_ACTIVE_HIGH>;
> +		select-gpios = <&lsio_gpio4 6 GPIO_ACTIVE_HIGH>;
> +		enable-gpios = <&lsio_gpio4 19 GPIO_ACTIVE_LOW>;
>  		orientation-switch;
>
>  		port {
> --
> 2.34.1
>


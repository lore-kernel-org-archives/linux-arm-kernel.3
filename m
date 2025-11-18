Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEFACEDDA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLcXC4MdVlLswVTdAPRJH9/qgUJPH1vC2s9vhopvUAo=; b=ZzXsZi1ealtAqBNFqTvODrmdKB
	Vn33Lov50ngWo/XaZ3wQ7+GculSZN4kfHSkYWpW2C13At1pknd2MRzg8OXstJTs8a0NfoBmo+Sm4o
	x0DRFS5FZIS/Vi8T4ILsIyf/OaCtYukVrZMjBA+snGNDIiv1gL69gji7HUcq+qCwzxLCwgkDnMnWx
	uPObLnbQwMDMT2J0wCuHfX29d91QCGoB0pI5rua1AjZ9OgDAXUC0KXEP7lebXcpXaobhaCN8Sdr4/
	2ZhC8y9uBfD4AL+5n12e5uWnyp+mieXG1v8SkbWNFNQ3cE1RF1Ld88NDwuO2uisFROnd/rBnM9LpY
	etYVFZmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNhO-00000000dKE-1mhy;
	Tue, 18 Nov 2025 15:32:54 +0000
Received: from mail-francecentralazon11013014.outbound.protection.outlook.com ([40.107.162.14] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNhL-00000000dJJ-39Qx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 15:32:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctoTGlPfHW94A/QkweHMhMMyR5OIRfnfOa918bupwYDbYk49LwT0WEVxCgleKK5oNYA8Q8JQMbKYZiXScUILto6nB2tSr+AB9S5oQxM2Mwm9JeONc6HENtx5e9s8glJELkJla/UMeb+D5Fs5H06W7EfHrJZL7NbexD4ajFZSuWZKgMHEYtGevrsiTAF3C7fOeuANJGk2s6/bheG1NF/xD+nBNzgz3qC1QVdyHRT/CChxldBglskAqkHUaFpdQKJsqJSHObRP6BTpsnoeKoyStBga0YQLJRQ0mxIk5YZir/zOh4Qw7pPlGwFXjiccYU35azNtQHJGuAMRRk3Gl8d9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLcXC4MdVlLswVTdAPRJH9/qgUJPH1vC2s9vhopvUAo=;
 b=WAhEwMJ3nkL7QG1WECIyA1lA9oRPzKVcDXuthXB1CUmQhVXP6QfX80Htrre+op4v8gjRByE5BdcdaanYhHdRsSH8hYyESr/qcz342dvR33UIeSTRZg94wW4+IXUO6ExRsOYewHZzfRTKJUi2GVmfBZtKVorjcRf1h7Kl41qvWgsRizNLdidl0Zx4cmdGSo1YYo0dEmBmIQGbzK/ASR1UZQFh7itQ0oJ9IwZm2uuhqJheGmH2pyQj1J6bOBWx/etAaOyj6OtMIjFm+pXtKoY1TDxQRsRjs6/UjcZOj5iR53fAVayuYxeRSky/EVPqlgE70ORwND9puaMt/Jn2KOgmhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLcXC4MdVlLswVTdAPRJH9/qgUJPH1vC2s9vhopvUAo=;
 b=mnrz6ihqoXu3cQJx7Zc2wgTaNvB8MaMHtrWLkjZi+fJnJxu96r4k4eX9P0GXFB8RtAAtFHkXkeENv8A+9FRtW8yZiMRXWq6RjqTK2/EYAd+9nS49flE9n29pGCOJrDLr1AmlJOUbM2Hj6jcjaJwicO7STPUTlFqCFvvO3OmUBSZSaECSmBfKa0j5tvRYL2Q/XOl0XFGwrdp7TFpVUPKky0j+4cZYBx1byR07z+CDZeRgBVWSPXXM02uDBZPBshpxegVZqLvBuGtechDJzQEqWaKS1Wk/yHNzfbLUyW+5Hjttu7pPB5zFNz2unD0jn2qedZyaPftx4n9ifDNap7Oj7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM8PR04MB7890.eurprd04.prod.outlook.com (2603:10a6:20b:24e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 15:32:45 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 15:32:45 +0000
Date: Tue, 18 Nov 2025 10:32:36 -0500
From: Frank Li <Frank.li@nxp.com>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-mek: correct the light sensor
 interrupt type to low level
Message-ID: <aRyRlH+pX8XmLqhN@lizhi-Precision-Tower-5810>
References: <20251118-dts-imx8qm-v1-0-63e226ffe512@nxp.com>
 <20251118-dts-imx8qm-v1-1-63e226ffe512@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-dts-imx8qm-v1-1-63e226ffe512@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0286.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::21) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM8PR04MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5d1955-d7ce-446b-c334-08de26b7b880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TL6wwen8yTcKk4mPPOuvu0ylprlTQewB4qkcXSrL/+3lkpgXX0Gdb6/xRnI7?=
 =?us-ascii?Q?lms5PiAOem6ETPAomnVWr2IxFEhoCVCIyTCzDuiH41vHkt+BJ9FObH9OIyl3?=
 =?us-ascii?Q?imNA5BiHk2Uu9jnQo7O2co6EMspkV1HRp2Auyg/bi8AbEXIbBa3UyNkF42UB?=
 =?us-ascii?Q?H17OjeJ+mqCGz5IoyTCAH/PV734UsPE445esiJQqzP4wpk/EUfchYAUV90fa?=
 =?us-ascii?Q?28cRwafG3UjwDuZYBsqTuUEow32zWmVGaWyQ3+gDGI7t8fFpHxxK+DSnNFAS?=
 =?us-ascii?Q?hMkBAYrZqfM+KCJy/sK+GTuS5wZiANaI4LHr4p1hkTENv2gLFPkS94TnWgaN?=
 =?us-ascii?Q?JfM8eAiLwe8alXVNKIgz1gYB4OQBdp1xCFPBMhTDpqooNuRlb/GYI93HpH5N?=
 =?us-ascii?Q?U1x2gfKx7qZzAlPRkZL2vramkv0DUhBplq8axb0u+T1hL3PFVrCe53+KvOGv?=
 =?us-ascii?Q?+F5BHRpcVRa97XzE0QRiAkyqm6ua96TXCjHJk0TLP3c2d494dqqS8qtBw/Y7?=
 =?us-ascii?Q?NUHAsjuxz86HVV/Ias46duKa+ZY/ZqRgGSHfNfDNCX7dt5UYt2gqsdsiwdCM?=
 =?us-ascii?Q?WSonMMqk13myZqKjWPFcmcd0QXtks85YlX3XPiqkn2y9gQQnXZ/ljtayYer7?=
 =?us-ascii?Q?5WoI79rZ8rhqyY2NRoJySif6HdMxXVgvYvrjP8iTNMbX0LWD3PbUKs0aqSvL?=
 =?us-ascii?Q?yDDw7cS6XTgRtrLSzRf1hfl/cC/i5qj4HIFNjnaYeb9PYZ3Ne9J9N48qRAgV?=
 =?us-ascii?Q?dk05uRU35zCmvtsG+qZTP75tdpSWsgor08PS962cSMRJsp7TSinNTgbJ2nkD?=
 =?us-ascii?Q?9H1aehXzm6Pb+KwWrdhBiWy+Q6sIQN2F0GHCuEgJmmS2t31B5BZtFil/xX7+?=
 =?us-ascii?Q?UmziN/o33D1zvuGlbbh1cEzwl0hcLMVOPlp3HqD2PICjBW8EFxcSm1zLSSnS?=
 =?us-ascii?Q?Q/kQRxld8+NP8MLy0F1BTyrW8LuRthRZR8FfqNrREmLplE8nZV0xdu/xJG7D?=
 =?us-ascii?Q?SrE7q7dmcdKwNJC/8R12HJLywNsRAR5IDY+ngwntVzFe5xcMFKnudzZAS0p7?=
 =?us-ascii?Q?ohkUUXURZniohEXbnq69cb+4R0RKRkW3TCcqeVM1+Ng6jgRbVfazH2tGL2SU?=
 =?us-ascii?Q?eGzGWX9xBNKl91CIaZp150DWjPalNO42AZRnWLTzewOZCYvx8CZ/LC9GI7DV?=
 =?us-ascii?Q?Yq/Iv5LAZTJrgwHR8/FNcuH2Ox7NZAAbaVyF6LH70G1X54CUF9Vj6FmfsjcK?=
 =?us-ascii?Q?5kjiN6b5VLfc6X7q0Ihl1ari4SGjI7SfRTuWv3KdPkJNGyxEOM3ZxHca7MPT?=
 =?us-ascii?Q?D2PeqaogVrWKSFPk9019qttGGs+DXSVgXSrCHmNVexSdKfRyqG5qZcEZf5j5?=
 =?us-ascii?Q?WotMp1RrS+SB5pPzVYQRCnsI2AXVCFBU0omVgctEWd4lyKofcDWm4N1AjHgQ?=
 =?us-ascii?Q?4ltlxsuWrxp3tqz4uxzCbu+sHC7YVKVDOP1zLPdX9gPH22+Dqyk5pi2lvOO0?=
 =?us-ascii?Q?OlJI6PsXWQgu1JcCAZAhE0mkNBgt1axlLelb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vqnJQKLycINgksBjUyn0TCNtJ6eEcfOIPnzp1w6L7vC5vD6JQAVCUgmRzAwq?=
 =?us-ascii?Q?2qcrgQIb/fGTvS14R2twj3BYVIviO5nzG8p1IJFz83VkAX4TSrI3NcymiTRv?=
 =?us-ascii?Q?zfTRr92A9bDieu1fl4iODOOxrfCpKT2GOMOo9QNZq4/BFxmt/o+am7zhpn53?=
 =?us-ascii?Q?GwYIYGkm7vT+hJxbI8Wv/4vXK0g8lDllkPYxsAK9/EqWt153tngzcDi1IBzf?=
 =?us-ascii?Q?Pyusc7U9K6VazYOSCojcqaRHfNHyeEtHCizM1dPsHl3dB3n9QcdcCVR0rwpV?=
 =?us-ascii?Q?sIOk4sXDHjQLbpqzquydjiLzVyP9AZpSPiyikzJ1cY4I6I3YyKNZIPPlUhO1?=
 =?us-ascii?Q?a7W8om1G8gLspwVZwl81tuO4Y8GzVx6Tb7MAcpNT0l0O1mymtBwKFbDx6YUC?=
 =?us-ascii?Q?ESUtuy7LJbgfiSthugxNczWEUlAGFd00ebryT1bdb5H8OKVqeDDjlKOsEMlt?=
 =?us-ascii?Q?T0zke1jF4dU9Lb1pRo65gDIrzbyCZBvBtUe/4Sf8gHYmWBY701sLKypeTmij?=
 =?us-ascii?Q?Nrb8F3IbnA3EMwhCHZgq4yXBTOvUWi1Mc9JsdZNgzI0q+lhLV3ovybe/29kD?=
 =?us-ascii?Q?dz+rKf4lEPyj5gTaxH8q3eNTMQsdv2KT+GrJifqM/kCE7mxWqyGOR6WoT4xC?=
 =?us-ascii?Q?43YV11e+QrmtakFKki7kLp4fMnuI7HyItImLuWiZkGBbJuKYI5hNxwTX7kSl?=
 =?us-ascii?Q?b+MU9cxiEwdrWz24qgtGCBNIOwx2zpZZ5N+HrzyApVFu7PsbQuoNMadanc5d?=
 =?us-ascii?Q?/4sREQHSc0h5q5r3JsH1C9vGKqdy+tsPtdarKPWq97E2sNH7ZOOEwZgsNDIS?=
 =?us-ascii?Q?HuxzX2SBI56VbG2iqXrPPy1QzbKlGfcHh136Xp1JDWChDYX5e0Y8il8MsBQb?=
 =?us-ascii?Q?NDHo1vF+5OhCv3gFYC4auKSMyi1oHnV3u2S3X9NcetXuhaR665rI8dgcoGRH?=
 =?us-ascii?Q?q6/om3u2MobtognJQCKTwLfMtcev3o0XflUeTQw3jkP4HvjVCDpZCoE6DIdZ?=
 =?us-ascii?Q?kYatxNR9ENJMaTQ1UsINJB2jIu3Y2ZSXdYIgZXTfJO4wFxih5w5e2f+aQiEH?=
 =?us-ascii?Q?QtsikCA8cHzCAnSEoegsFtyqogjJU+T8vadZsk0EOT2bKkoZx8SVJJqboicu?=
 =?us-ascii?Q?+8gLv92wX66X2jI1vh4lITni4U+0iXvm96zqhv2ojtuZnlqrZQZpzm1cnF3w?=
 =?us-ascii?Q?hEeFhXo2UvJf3Y9k85CMThiPkQKOMPPD4NGQ6+2Nv98Syzj0rRS11S3rgB75?=
 =?us-ascii?Q?gGD0li53GZvodmCLMo/lgaz01EwtybkFUpMFoEGSeggYnqIV7ZlhrMYvlxPn?=
 =?us-ascii?Q?Z61tfFsSgfJQhF3SIi7ZugX/XOVZvmvTJ5LtmVzUqF9GrhYI+lPo9ZbYO5zD?=
 =?us-ascii?Q?Gwxj///aUDY7YP8drvQhyeeJuUXwOcvobJ8sFJkW55qnpagNRAoe8N7bXI6j?=
 =?us-ascii?Q?uAlJfvFWy7pGfqeJUy94ISxl5FEECb7elCg0PKprG33g4sQvNDWdG6C1n0YD?=
 =?us-ascii?Q?petURAazmYK1NhJs1fNdtayenI2Y8Zrk8HWofuueU8lzeafYXZOwjCtIOeoe?=
 =?us-ascii?Q?ZbZnEIlgtz5vKEB6wdiIu0oiwjW297RnhxaX8aKo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5d1955-d7ce-446b-c334-08de26b7b880
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 15:32:45.1810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2H04w212WNZ38gUBa0RwXykGgs5oSuqTpgEMQz1tkOAC5bFxNYPe51JenLoNul+Mo2Hu1BNCi1Nyh6q2qGNBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7890
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_073251_805467_06070606 
X-CRM114-Status: GOOD (  18.13  )
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

On Tue, Nov 18, 2025 at 04:30:17PM +0800, Haibo Chen wrote:
> light sensor isl29023 share the interrupt with lsm303arg, but these
> two devices use different interrupt type. According to the datasheet
> of these two devides, both support low level trigger type, so correct
> the interrupt type here to avoid the following error log:
>
>   irq: type mismatch, failed to map hwirq-11 for gpio@5d0c0000!
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

fix tag

Frank
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> index 779d9f78fb8196b04c41516963f16ece082360e3..667ba2fea8678215c611dc0ca19e8fbc397f9273 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> @@ -576,7 +576,7 @@ light-sensor@44 {
>  		compatible = "isil,isl29023";
>  		reg = <0x44>;
>  		interrupt-parent = <&lsio_gpio4>;
> -		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
>  	};
>
>  	pressure-sensor@60 {
>
> --
> 2.34.1
>


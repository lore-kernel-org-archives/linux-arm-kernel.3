Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179F7C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 19:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avBCF5swZ5z1kt0slI828dDPpGXhcpAixXaR/XBJRd4=; b=h8mwJjix21ORzVZVTiqZViFJQo
	v3S1PjKg+T0aRQIHuEBnTdWpBYTC/87tN2/Rs5ApBn/8hlmQt9siB4lMIq1XolJlcoPGGoHJrECDK
	pDQeRNOt5OYwGlAS4+d2gYuOiC5eFsEcNUawdouFTnWOZd6ZbGoLzcz+cA1eawKV4lw4o5H8GMCZX
	WkRA7hSODi4NsbJWQuGan9TLXKggjg7PMsiV5Z+qCEFgfJmuFj2TW3SA9t8o9wboFzQMRdwYzPn/c
	npUVQzXNfB6yuBhzIt3a35kiHi+VjHJ/OGdf9FkS7GpKUXOECabax+FCWwCFd1UPdKizLq1FxGM+X
	KqdKyluw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7h0-00000008U0R-3aOL;
	Wed, 16 Jul 2025 19:21:26 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7cs-00000008TgK-0dWY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:17:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcu1dtqiRN0o4HWCby46ahWrlla93AKNDhwKY9hPzeea1Riy7r/puEJrfEuNC6gg6lf2AFuhlTzKxPpeWCKO8P+Zi0V514N9Q27K5wvtDoHDtRcYVkYjJX/Qlp575nc4/j8mTyTFZzmkEkBSXSWdw5EjiAnbzgD0+OKEBQqXsqotB6aihmq2vCYvChRxSYjwfXBm45cLodTsAzjcEyW++H/Fb9RI13F5MbKmk+4j6VsdYy53zNvFO6PoUKHqdTc45FjejwSu6Bv7YhnB+PbOIUjsUl32939NVW+tl8R9HQSR/Fuq/A72/0id0Uur/sOwV3tcJBHQ1BtR4Ovq7aDL5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avBCF5swZ5z1kt0slI828dDPpGXhcpAixXaR/XBJRd4=;
 b=ODhNKZSZaOxbT5p4Y+oOVV8nIqPNl1mSCv32jcH4irkZyfXFvKx5jXkPjfzUevC7+JlyNE62AtobuRmOcEeiiig7fnF9MBOs2JxN4S0gUdaLT4S3N5FTinMw8mL7cGgUBN7/iThXH/ZthDHo6JE+ak+0RB3715O1Ykhxo8kFOm/bs5tMs2xT7WfpeAv8kuyUYbKXLqSN8NI8I+GFslXubqPPpH+xTRx02XNJLRfNV+pxGudY+GZltsgLenYFFT4zJOXpxizGCwrGHGS3cWs3KuPzwo+wZdLwZZ4/NBuZ0+NxMhdusNgvWIhFIMDZmXjLxephxIo/RFHR7tr4TONlbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avBCF5swZ5z1kt0slI828dDPpGXhcpAixXaR/XBJRd4=;
 b=m7CAmUT8CSjhB8o97gDYoo2vUD/wRW9M9MJPjglDyZC8Rd1SfPmZf3bkUf6dPBhq9muIMrrDQuEu+Y+pQ25mRUo1mkXQS4wsgRqJNo+p0IgD/ZPlK0PxXIVy1bgMTR385jNzfu2/gyKPUa8797ooz5mY+qALGVTnh8D2ka+fBFNknRKFiHRITluqrFOlxS4pwTPy5sX5cnwARoQB3b4g4/HVsHI5OuC0attb5M4H8BgFWe36QwuYHsAzc/48XW7z9q/sTQpNfZ7TWB+O5Y01qaebascOsxTFauipC55+yuKCjEVc6hw4AR2DsqZj80bKf8M9A3R0flZQIE8/g1SQQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8564.eurprd04.prod.outlook.com (2603:10a6:20b:423::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Wed, 16 Jul
 2025 19:17:04 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 19:17:04 +0000
Date: Wed, 16 Jul 2025 15:16:59 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: Re: [PATCH 1/3] arm64: dts: imx8mm-evk: support more sample rates
 for wm8524 card
Message-ID: <aHf6q9asHvmw2Zc8@lizhi-Precision-Tower-5810>
References: <20250716061114.2405272-1-shengjiu.wang@nxp.com>
 <20250716061114.2405272-2-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716061114.2405272-2-shengjiu.wang@nxp.com>
X-ClientProxiedBy: AS4P195CA0034.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: 515cab4e-e2c6-4a76-a5c3-08ddc49d5925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|7416014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JZqcz2DLm+azFkh1avd7ZtrZcFtHFaRf+cEUSraj4MpLSw9lCTAOeLMeqQOl?=
 =?us-ascii?Q?osGgYiuaESWZyeBvuobDYVa2GrY78/7gGt4hmbJ+XoY04hTUJsvre8E7db6x?=
 =?us-ascii?Q?Opm67uG6cDaUKvLNwc70I/6NhiuQe1VH+UJg5sdN25kbHYdv/HymKGMKunOg?=
 =?us-ascii?Q?L52uf41slR0oLEUUaCZwpdfb+4r8enEJQcWNzRlw5aD5hMZeMY9HN6BqT0yP?=
 =?us-ascii?Q?QQY2JaWHDfTZt/q0/DKB545UkJF1h35YsmKkQ1suC7pZlJ6fDMrc9gYJGa4w?=
 =?us-ascii?Q?DM3BQXZvYRxj5+yjO7ZqjLWlwtM/1HGq0PwvwxmQRNwd5yJ9BZ0Sjb+DA17r?=
 =?us-ascii?Q?3ByG29suwbQTj9U7YclL/Ab9JD6j3G9Mf6uoG35QOGfuNr+KV8yVUHIUO8x0?=
 =?us-ascii?Q?VggsYyAjjiyvW9gSwGMuevAdTEQZZ6xR8bdqW+Pulo1Zq/w9QmUM5cOCLT+R?=
 =?us-ascii?Q?oKsFXhUbNLDhWfWvdata3ClAyKDN7uvud0PLAvm7/XgFna9pxAzdRl3eN5yu?=
 =?us-ascii?Q?e05EBgp3m6U9/A50m/q2tsIS0ffgg3imc6ZIYMtehDx7YuqxGInr5V0Q4rOV?=
 =?us-ascii?Q?SwiJa++mss6mN4U3JzqJld+uCrZkSCKCMUnq2fY91BHx3wWFo4KTw1/rLwt1?=
 =?us-ascii?Q?t/zv8Djhoi7K/SfHrC6G3dpDPC4jmLmaRC30h3hqkuikaGnMNnKzWZRMGvr0?=
 =?us-ascii?Q?rkh6wkhyenV9LtCtBTyITBOVfOFkZLWdGBeANLy9e4cfY8wbJOUKlSveyULg?=
 =?us-ascii?Q?yZuMC2WDUiNxdrJagw9+88/mobLFXVZHpVHa6ytEUaweZfCW9vky/eW3gum7?=
 =?us-ascii?Q?NsMsuPV5380zDMrv+X7nYD56Jp+MPhk35q2cHFSZovQsT1HoOAAW8FVoyR4C?=
 =?us-ascii?Q?GAZ3qaE9LpZEWkrb/MIA4XGs/kVIE/w7vlqev7V15dJ1dCT5aKHgX0JfqA0+?=
 =?us-ascii?Q?M/EQDa634lm8/cewG6WvgZVFXMIXguQ/UoI5nVFOz2BCScV099/NPTzaYZma?=
 =?us-ascii?Q?Bd07BQOPi4ev5n9dyLhCLHISaO/FSnwautF20vdMfQId8KzuJcD9VJTL4Rcg?=
 =?us-ascii?Q?5Nxc5XHt4WMJ1+sx2mJsExUDQnN03PZ+FEkepaXXjV+/k51oVut4ZOUfM2+x?=
 =?us-ascii?Q?eSNhPmYOKmY4IS+IO0pU44Q9zxbpwdOuzWnTXfUBmYfsojj1YqsMwN3aqs9t?=
 =?us-ascii?Q?9ItasyovtaeIoba33KNBG1W3PwM5rwKvU1V5at6EnzMOW9WRVxqLwxDJEckw?=
 =?us-ascii?Q?2vwAs8nofRaqGtnL4pUW+/JvlbAUaPg8VA82gdTGsMKJia0643dGwTTvPs1v?=
 =?us-ascii?Q?O+vm5VBpfa2Bn/Xgx+UG+rxYEzzXPMoXWGtsBo4kIgC++PQOzVB86AWYKg+x?=
 =?us-ascii?Q?nOrjwIqMJeHmjDkGVGbMnHsKb0ad6cQ0Pvt9SXBQhhmexi3cv0vOL6m4G9am?=
 =?us-ascii?Q?wdzNM0nuvGY3u2DZxPLVY2/jiqyhNiWNRHnm/qv1fXhhXUHkiBXyAA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GTbVzOcCvbwd0konwXbPjYoGrJtuMpaUFFu+Hd+2Sl6qkDoXmdbA2qcbKY6W?=
 =?us-ascii?Q?mJYuzspblrsN/9NF17n5T4lxynFPmB3+q5gWZQ0uZW/l/IhA/E7Jff71HYt0?=
 =?us-ascii?Q?W0oEzMpTmR9ZQGDGGaleYbXwsUnZMwNLyV2mJlkLg90lRWmW7nWoTFVcQYvT?=
 =?us-ascii?Q?+eSdUPJ9rPgssd0n/tNSnoIjKDb1Ef4aoerRI+KZg4iGoXmUIuei4+89HJ+u?=
 =?us-ascii?Q?gnst0yXYz85eQHND9Bs7m6qRNrgyj8jyiFQx4OjuCPi9cy1Z2XF+WO8vwvaU?=
 =?us-ascii?Q?kV8FFSi0ouBZ7B4b82kWFYOgK5/1BJc1lzqZQlzeXSyYqOQR00tWsaMKnjHh?=
 =?us-ascii?Q?FUXWuX87/JaGdJsQMvhpDm/siHpaK6sTsKi3UrcuFUsSLIMEuVHHxbnmORn5?=
 =?us-ascii?Q?deSpa16dbdZJ0vyTH8eub2qKCuCMyYkNo30m2Cnt5aLx9UQjJkMioq2jMmEQ?=
 =?us-ascii?Q?J1RQaE6SseQ9QGSbrAWzkM0XNGKiF+5sj42Ub2O9Apr4vqX6x5NphqcHWNoU?=
 =?us-ascii?Q?duft7YoXWvLaow+Dg+MRU+X1yw028TqRjZAEhOGstF3mgblWQAj2+fSS/1Yz?=
 =?us-ascii?Q?Qfy1MFeC5FW0qeqrba6E6pSQ8r73cNXkfir6RcJ3OnBVOOec6SFZBjX6UvqH?=
 =?us-ascii?Q?6wZwYqIbCXOCy3op+M9DuOloPYc8rFct35M4AYyDfW8M4MryxxNqhED3RvgH?=
 =?us-ascii?Q?nUjn6KKmF9q4l0eLfoOkESDdO/uB5kYMY/jFv4AVG5KGFvYSm2/qj02HfwMi?=
 =?us-ascii?Q?sirgYk+dKPQWxtt8o/MOqMcRBdzuoWBWNs7ldRHKqzNrV8wwRKai6rQSfmHq?=
 =?us-ascii?Q?wYDc8C2n2nSQGs1N6OjGV90mueaNaecE2uXszL/CYuS2//rWOYBO2Je0Z3qe?=
 =?us-ascii?Q?ZZK9CSoeTm9jGMcvw5+pkUfDg1kc4CUmwriHvS+UZ4BsnrNobSbbTvq19hR4?=
 =?us-ascii?Q?0IqRy7qGbDJjoL/8suvHfXvcNDcrpJIaCS8VCnRTXU00sXwvTpOrG6ZI2gLt?=
 =?us-ascii?Q?IyfdSio0BmNKGj1ZwOsMtmJk6F7oDm2KuUkrYnL8FLo+FhfUgiZXLzERauAJ?=
 =?us-ascii?Q?IzqkAxB/KvtAuJDaryaWHZB73A1T0faDp9AFBHiAvvqT03g5SEdf7ks7R1Xg?=
 =?us-ascii?Q?n799eF3FICU9/SQaezzF4PvLKQEtSP/NBNg/U4CoyFS/kkiRGO9CVikqzGqR?=
 =?us-ascii?Q?i9VF/XQNW9gMyUa7ooOFjd9SmoD6jpsXBxsC5Tpw+qck72Gl8M3m6TBcwrMx?=
 =?us-ascii?Q?pQgkBgkCIcOLtcHT8A6Ypyd9EF5zPN5hL30s5lD47G7wTGkhTffasxbprwbK?=
 =?us-ascii?Q?dcDmb2F1XW5axcf55tucB6biN2I2O6vROY8to4HugDrTkK/a5pyCSADr7DMX?=
 =?us-ascii?Q?xQuWfu2b0ynVkKmxyD80CEhJzYhs2sU+loYIcQ4c7UTtTU2NoMr0Q1JuxxLK?=
 =?us-ascii?Q?uB1BhSWwjahsmZqTUGQVnbP8UXJ0APGLC7x+fFwYitez4mOm6xnQJgKXy+TU?=
 =?us-ascii?Q?D9JRE9va2dgVoFBfsr8kusbnw8N2nj7Oq20EM6ilxG2Qs0lgD74LFxskq+Dy?=
 =?us-ascii?Q?NWoKVn2InSyOt88EYTvFq0tybhEC32F1cAF5EQyE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 515cab4e-e2c6-4a76-a5c3-08ddc49d5925
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 19:17:04.4022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oN3swnzuI3gInF46k+6o+PNXT7ZOA27N98/5+qYVlATVj7kACXYrsVKEd8IqV09IwvlgJgJoFqB+a+M0ObbpOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8564
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_121710_195847_1CDD6160 
X-CRM114-Status: GOOD (  18.48  )
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

On Wed, Jul 16, 2025 at 02:11:12PM +0800, Shengjiu Wang wrote:
> The wm8524 codec is connected to the SAI interface. There are two audio
> plls on i.MX8MM, one pll can be the clock source of 44kHz series rates,
> another pll can be clock source of 48kHz series rates.
>
> Add mclk-fs property for the clock ratio, remove 'clocks' property for
> codec that doesn't need to handle clock enablement, add
> 'system-clock-direction-out' for clock is from cpu dai.

Can you provide the reason why need such change?

>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> index 622caaa78eaf..ff7ca2075230 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> @@ -147,6 +147,7 @@ sound-wm8524 {
>  		simple-audio-card,format = "i2s";
>  		simple-audio-card,frame-master = <&cpudai>;
>  		simple-audio-card,bitclock-master = <&cpudai>;
> +		simple-audio-card,mclk-fs = <256>;

what's measn 256? Do you need mention in commit message?

Frank
>  		simple-audio-card,widgets =
>  			"Line", "Left Line Out Jack",
>  			"Line", "Right Line Out Jack";
> @@ -158,11 +159,11 @@ cpudai: simple-audio-card,cpu {
>  			sound-dai = <&sai3>;
>  			dai-tdm-slot-num = <2>;
>  			dai-tdm-slot-width = <32>;
> +			system-clock-direction-out;
>  		};
>
>  		simple-audio-card,codec {
>  			sound-dai = <&wm8524>;
> -			clocks = <&clk IMX8MM_CLK_SAI3_ROOT>;
>  		};
>  	};
>
> @@ -570,9 +571,17 @@ &sai2 {
>  &sai3 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_sai3>;
> -	assigned-clocks = <&clk IMX8MM_CLK_SAI3>;
> -	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
> -	assigned-clock-rates = <24576000>;
> +	assigned-clocks = <&clk IMX8MM_AUDIO_PLL1>,
> +			  <&clk IMX8MM_AUDIO_PLL2>,
> +			  <&clk IMX8MM_CLK_SAI3>;
> +	assigned-clock-parents = <0>, <0>, <&clk IMX8MM_AUDIO_PLL1_OUT>;
> +	assigned-clock-rates = <393216000>, <361267200>, <24576000>;
> +	fsl,sai-mclk-direction-output;
> +	clocks = <&clk IMX8MM_CLK_SAI3_IPG>, <&clk IMX8MM_CLK_DUMMY>,
> +		<&clk IMX8MM_CLK_SAI3_ROOT>, <&clk IMX8MM_CLK_DUMMY>,
> +		<&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_AUDIO_PLL1_OUT>,
> +		<&clk IMX8MM_AUDIO_PLL2_OUT>;
> +	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
>  	status = "okay";
>  };
>
> --
> 2.34.1
>


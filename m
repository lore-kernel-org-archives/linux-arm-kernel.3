Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709B2CFC28D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 16:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JoWFYbe4dq/6Uhg3iS65IFdN9BOwU4bc7oKYk9HlDw=; b=Sy9t22Ju8xtR9HqdErofjZCU9E
	WcLrVC6n9/TMTRucogL8fplgCv2Bu45zRm9yK+azsxQSszwpKFXXNtwhdEw6QL7+K83EkpOBSQ5mG
	XJKRyg46bIEXSEs5Tc2/uKcz2sHyBkZWSTOgyqvhxKsslpC5W72gVbtkwVQAbKiTsznzF8Cx52pzu
	NvXfkE4IGFDqEMMwYaeNHuR0+QMnChVyp9AgaVMfFrqj3EvHJDV8aqv6/7wOfwkJCx89XS8lDGdFp
	Frjy17W7q57gVftHLftDhDhb5VFsEvnoY8N0mPAR5Ew9riAcUvNpIvGusBnYCjbXGrniqfqNVrZba
	i2Fxbe7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTYa-00000008fjX-37xO;
	Fri, 21 Nov 2025 16:00:20 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTYQ-00000008fZj-1x9v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 16:00:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLBOrSYSl5st+7rqAfKJCaoPKbbFJ334Bg1Dydv4Oh26oYTejbDOOoyDrKPHkXq8IpK1i/frbbDy6Ocv5P5mcm+5Jey3daJkdj99QDaHQtzaLmkvQia7p0TFfWGutCZC/j0lwNVjFYwAWgsfzKSqAUtYuggtKfEcEA3A36HeFM3eumMGse/lOAjQCRAbWploPCq92FXYGPj/AGFfIoMD5xLFKqdfg8OFoWhpM1AkctsrpdbZO/cljEoCz92U/vBLK/yMiEmQCkdXvjCKdaFQXvC79ElgnLuD8DZWtvlKontx0MTc92IcF0Ntr8HOoQ6J+ILKGE6rCKVnr67gSzrf+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JoWFYbe4dq/6Uhg3iS65IFdN9BOwU4bc7oKYk9HlDw=;
 b=Aq2i9us/qhEAnKl+X+CuhCn+Y3KFMdgeGBWuHolBQ9ZI7RZ9hiSSCFu5gTaH7k6xBqtazaFZFhV6ZVf3oLU819Qv635t5nvb9f0kdHcFC+/arzOWfOnvKNu6OTOr5plZcEpe0ceglKeZKOhS6pBQDIdGagHRLD6wp0FKCRvt8PIeKr9IWZX5geRH1tlQnS97BBu6c2k20LmZUn0PQMufLaakFAeb7PtOB19ME2JXSQO5Tey9IoQNaLph4H/PLi+dSNbGeGnIwj97Wppoz7ecgX4X94aaHKB4TWn9BH8Sq4XGlXPSnvXZ0TXZmKaO8uLHahMh9CwYr+tKGxPpMjNQuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JoWFYbe4dq/6Uhg3iS65IFdN9BOwU4bc7oKYk9HlDw=;
 b=HrJiX6FwKLrRQi1THfdBsSvIelyjsSP8Nnbg6y6wJvKuwI2WdPlWlzdW7wvv8sJydHBBWvLf5NGTGRt2brkyzJ4yjnTKW/S1HLyGhj+J9MFG7hxrUOEuvHYpEijXqIAOnX9Ur7jSXjvlGATRwO+OYnZxUkWsnnipFeOi1tQaC46H6UJ678vEUknK2QjrrZQ7iNrs+SiFQIi15KEWk5pcferpac8/ELhy15qvXQaCw/KtcgryuBMCBXmo0hzUE/PMBYrNIog9CQ/1fibsoExgk3pOWp108nHqui10Fsqw/QJ4x2+VsqPasNUj74BpQixn+VMV3eaDM+CaJXWICoEsCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU2PR04MB8920.eurprd04.prod.outlook.com (2603:10a6:10:2e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 16:00:05 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 16:00:05 +0000
Date: Fri, 21 Nov 2025 10:59:57 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux@ew.tq-group.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: tqma8xxs: replace 0 with IMX_LPCG_CLK_0
 for lpcg indices
Message-ID: <aSCMfau5GdKbF/3O@lizhi-Precision-Tower-5810>
References: <20251121073142.3367642-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121073142.3367642-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: BY5PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::33) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU2PR04MB8920:EE_
X-MS-Office365-Filtering-Correlation-Id: 47934121-1ce6-4d89-bfc2-08de29170994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|7416014|376014|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i+zKaD1xwTuyL1h5xD9zLrWOROEFmuJnm0pTotztd/ehktAZmh3aWHcC9MyS?=
 =?us-ascii?Q?uhShfvjPacUuUJvqTSzH+/f8UbEj5Tuz0Q/GNtuHCO90ILZXpeodqDMNcOoQ?=
 =?us-ascii?Q?/iGS19p1vz+or/jsqTx1drTz9aYeefG6oLiYKFZUWxV5EdhoFlHYs4QcXJE3?=
 =?us-ascii?Q?DeyjNRWlGOjfhNk/U1JmHLttGZ/9RhGi3IJuWwiin6+Xikxag+NEDSieo1GQ?=
 =?us-ascii?Q?fxc0+znyLF5EZoHA6ThjIQwMQSyDOvIW9Ng0ZG7XiLSxrXDYGjngwGA/s12T?=
 =?us-ascii?Q?uLnJMQ0HOGv+KBKfPMO2VuuqzR/IDiMbbbTza+IfYUltXfwRGjyCEHbtpYxE?=
 =?us-ascii?Q?SDogEXrf8boSG31jQZD/2fGMxbJDlNujzkbXaLmU+Xm1xCzUQNYz6rbw1n+d?=
 =?us-ascii?Q?LLahbs+GjBYz6RYnYnkcWTO12xYDPP/yTyr2J8ioTD38emeBelOsqo5porWy?=
 =?us-ascii?Q?TrTnJrAMx5kFwqsPfnf+DthxnVEE406UlKnMWya4I1BawojjUDlPQvkUZnIH?=
 =?us-ascii?Q?tlKrQ2qrqB9qTv2Ex4NLG1f/SOB5Zs487KWh69l/FU2d6DKet73Q0a6/5I3e?=
 =?us-ascii?Q?IUfWVGWBXVKCTG/m9QQsnAbpt+XRUFPWMAZAJCTVYHVZqt1OM9zFAhMc39Rd?=
 =?us-ascii?Q?lwsbILtz4j+GyFCI3BtoLNPI1l7sGMpn7Xn0JVP+CgTrEe3t6O3liAiF/AsY?=
 =?us-ascii?Q?NZ21tHbctp5SBRNL4v4OmFVxEFaaf4lNiwcz+icZz4tRQb5AsxNhfULDpUt1?=
 =?us-ascii?Q?5njX6w8sYL8apbtL3li9MX9mKT5Tzj1gTVpmkDfomXlOz80RzKBf5mJqXlUv?=
 =?us-ascii?Q?egCJ2RpPCIV5NhOwppmuyv0OTdc4uZz3jOPLgfw3AEtYrOolI+oCnpCFxWjY?=
 =?us-ascii?Q?DyoyQ6JSGL+4Hb0T/RB+K0JUU6eEqhWVV2q1+SrC3wKwd2T6ZrJWW3vXZVZ7?=
 =?us-ascii?Q?IUUsNZ9zNG4EoOYPZaCiPhFew+CqBmMJnO314AY+vkrBbpLTWmzCDWFVsbOd?=
 =?us-ascii?Q?uSDcsphkijhleU/wUEiOv6oVzrWbmk9FoAUO8Bf7O+vwIAaA9ZdffwGKK99x?=
 =?us-ascii?Q?qdHqoUn3tlBqnRJqRsgjgcJ2/H+bsVR9yDHxGNidxX4q1AvGioU1UYkJha+6?=
 =?us-ascii?Q?0Jsk0R66Fyf3C93uTrRmtoKasVGAXUAQmB9oKeEuL9POgH93HaG/Wy7oxuX7?=
 =?us-ascii?Q?I5yFMyLrJ3aSfPqani+agFCv/TITfEPoMPRzBrMKs4IpKG1LJmNfh9KSF9Of?=
 =?us-ascii?Q?Lw7GU5HY8gDq2I+mGTcQvcmfL42us5lGl35Ui5KBs7wvNTHQLKq+8WmdpZ8L?=
 =?us-ascii?Q?C0twSFyPnb6afhzBYk/PMANp6YW0pMDZqqOg7f4ueV/5jlGWzAaIi/U7py6r?=
 =?us-ascii?Q?PGXqz2KxmoGdBjtxG91bzHswhKtaHYZABbA8aCqg3mR3lLwB+rGM8bKiYXgY?=
 =?us-ascii?Q?juGDApCeOzCMMZVIYMTP7MzOVVi7qVBcsde/uCnFGxLRGT6YkLaoVjXGZlMP?=
 =?us-ascii?Q?KM4BGidkhTNggC5Gi6AFqdPbNz7vZ/AfqvH+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vUGOwiXgDsOvhK/ZxMdFoZO+lfuvRLCAjz3OatYGlxQUR3NYJRABDmXrTG4R?=
 =?us-ascii?Q?KrP4mT3xKPC3HA0W6ZR90VdiSfmdad2SfUepCPjaBRMLQlblweF5fckx4PpM?=
 =?us-ascii?Q?a9A9HfQdqi6Sh5hd2wIRVYHwIo3UCtbC0QM0DXoCuRWSJrth0ykSSPXYYroo?=
 =?us-ascii?Q?mpgf18mUPvuRhKVzYHeHWzAhtVkFowN4qV1/iffbEP2ODi18h81CdJwjfO7C?=
 =?us-ascii?Q?RpWJP2A/8bdedIHdzuidHEccNunFwNqv5HdMrcThGuoPjqTNtgG5o/dieKb9?=
 =?us-ascii?Q?1VnKBxOvotVhgyBRTC02CNyCjPc7QwNSdTl0fpgrH29yow0Tb+zduTJ/xZRp?=
 =?us-ascii?Q?QB4AQAN073rpDEaAlUH2wp58TS4wNtVv7Uuz/Tg76j7x9TCk1kY5v1eAAE9y?=
 =?us-ascii?Q?ECaIXtdlbSORYV5KCUrsNSs8HGZ0NuL4euZoasae4DjhOrvwzD5W2Nlutg7k?=
 =?us-ascii?Q?tuguwovZZaF6klIl+hekRcZWE6U+LL7pKR7tEeIv4vB80SaE9XjWgPQuYZaa?=
 =?us-ascii?Q?xQgLp9AtskeAPpjJaYDvHsMT4PI5gkfcEMJz+XzQKHBAR8Elutz1wMHIN1q8?=
 =?us-ascii?Q?BjSdLPoD21GbLv+i83YjSIoFJPz9w4y81XEKD6B0e2zuTd7R0k6ckK0IF39P?=
 =?us-ascii?Q?tbEGgHaze4RCmfM0xnvpPIFser4IPooZq3twFKmktZN5nisCZp6vgXH8e2hA?=
 =?us-ascii?Q?ibkoCRV9lREaRd95kYVFQmafrgrl3MOVm19Jd3n6qv57Zm4+cbGP9Xcszeo8?=
 =?us-ascii?Q?2GW85hf/sIINoC8FfHTtidfwrtB0aGw/SvQGjP24RZWyuagx9yIK65hXwWRK?=
 =?us-ascii?Q?T0fRXFVNS3KpaeNM7ESbsML6bs6lJCbCUApe41swoTkKGYWuzw/7X3xmVhgm?=
 =?us-ascii?Q?vhvAaPOqjEP2nkjIhehVsqjpSeTt1lV4oVnVWZ1Wb5RjId6pKTnAs7MsDFNH?=
 =?us-ascii?Q?UPesAfiAZyldceOMdFJjBBP2xRxqoCSUdFgLU4D/v7JUMXyz7lUFrQTDxuGE?=
 =?us-ascii?Q?QpHRDIf/b/moodwCNpdwC31XAjQ5087dAeKz6ZcC2y//rAUXmWJsiaTxcGeP?=
 =?us-ascii?Q?Q505xckZjeWxxOYXS9AQjUk0+ds6g1Xhp9yr3uN5LBBRuNOdp+LRtsVehMwK?=
 =?us-ascii?Q?YNVkt+pesGe0GnwDVBplpcJTbVq6cNDwiCkZ+nHnOGf6jTY28p6jzl1J8Ilb?=
 =?us-ascii?Q?biQlTxePqIcAnD0h631E6HDXud0oUmS9u1K269GSJfWDiX6u/m8cjocZekzZ?=
 =?us-ascii?Q?g9DQKS7/DpPzR3Q10UGSEnpCWTdDpB4vQKcVc/T0yGi2xeEvKYU9lonMc6m5?=
 =?us-ascii?Q?25O/Bbc1LaTJ+X1W9D07ol6SQz0VgSRHvkHuvh6IxVKxdYKor4jtiGBP438N?=
 =?us-ascii?Q?ubmDeJSIb6/kQjOGOEmgDcTvWaBK9W53vmoSt2e8doAmSb9quRXttdTzDe2V?=
 =?us-ascii?Q?woVlpC07f6jZ9uKYWL2dZ6kiTA3/4gdmRKgFX8Uydel0R+2F/YA81duF5v0v?=
 =?us-ascii?Q?e0oVSGDSumpG5XPvxns3g+joMjFmodoob1E5p2kl0kyHRFyY8a7rzvXcz65N?=
 =?us-ascii?Q?k3OD2joHSjCYIhKz6J4TYwf1iavJwZ4JcO17Qo4P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47934121-1ce6-4d89-bfc2-08de29170994
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 16:00:05.7495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NRigcSKWb6N2YIG3y7sfxMhgeQf3EsC42+B4Fp3B3yqNKSZhnzB0W+RIxjaNyeSsJfK5vW6mFPGYFU7irnd+bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8920
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_080010_514215_D8C0EE74 
X-CRM114-Status: GOOD (  16.83  )
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

On Fri, Nov 21, 2025 at 08:31:40AM +0100, Alexander Stein wrote:
> Replace the 0 with IMX_LPCG_CLK_0 for LPCG clock indices. Although the
> numerical value is identical, the LPCG input is defined as
> IMX_LPCG_CLK_<n>, so using the symbolic constant improves clarity and
> consistency with the LPCG clock naming convention.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/tqma8xxs.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
> index 2d0a329c2fa50..ebf20d5b5df9c 100644
> --- a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
> +++ b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
> @@ -406,7 +406,7 @@ &sai1 {
>  	assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
>  			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
>  			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> -			  <&sai1_lpcg 0>;
> +			  <&sai1_lpcg IMX_LPCG_CLK_0>;
>  	assigned-clock-rates = <786432000>, <49152000>, <12288000>, <49152000>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_sai1>;
> --
> 2.43.0
>


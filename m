Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF847CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukiJqTKTui/2u5uhtQmS63H2uQ0VsJs6NkLwV0ugjYA=; b=fcbehYd/dd9iAy2e/VBtKqbjo8
	SShvi4DNe7nKO+RW7NzzJDrc209U6FzrDI6dEsn+E2oOk1BgS+B2ZCTMBxCPC83/ompdE0BHOy6jX
	TfOkrBC5QCAQk18WXS7JtLnnZ+2mdFAkPzjZZQCOiiYSO22vTyOZzzp9+/gm7tGDOUjNxevIUI4Hx
	H0HpRLHZELQUtT2hue5sN365+VvqLuFj5EmKYf8TedEbrrWtT4gWY/XzrY7Lc8EPrgO4azblPZIDC
	s+JE8ixyKSeI1POVo1R/vlSbv0KhKCkKfZId+bNSqIiYdWMAAoG9obiDPBKtC25W7VxxjirG7PT5L
	3YKMXBTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEej-000000000SU-2SFa;
	Tue, 21 Oct 2025 15:52:13 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEeh-000000000Qu-2mUR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 15:52:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+kF/P179d8RrGMIAnViIN3wSgFXaBEPc2onnnLpWdRAL1GB0OaTrg37C5tYjz+VJhqdy05CvhS0M25WXqj5aSClc/UHzsCTldDga/QcS4+GckAb50sRhS154yVUdwT+bk75OoJgUuWYcCRcJtIUv4nHs+6T43/+fr3ihK8W1wEdXnnvNmiM+Zvhnrm3DMTU7WgpdmimydZbeDDBh/CzCA62fWeJGhBcyPL/ZcyYAc9jgNy7DAquuTI2ZbYDCMuWzXH6Xkgg0DrUwT1KA0xiizCovDlkikEm8vIUMbOM0KUl5qKe5YUD/wCCSavVGSYdkBFUTlsYvl2qepOqzEOBQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukiJqTKTui/2u5uhtQmS63H2uQ0VsJs6NkLwV0ugjYA=;
 b=hlKEzLzduli5LeZJASMyuMZBUCjsrQLXpRQl7qEbmviyXOWbHHO4E5UsQ1E3VjraLBP7ilxpoHEodF1wQFQsmlbwiIEh8VDZ29zdG1Q3A76XO/OPBQa05gxGEE4JGHaLDiMKJZH6h7cmHHyGoUaxu5eAfni7Swy3xLSHAI+lSyvFKaDiu+RNLft3fWlvWo+6TK2X80QnRgtLWoJgK26BlqXXCsS3Z80MMt98ceDYeD8RFYHw+uwcZKC7W+9+osDqa4havtK+1UPmRjb316/Dd0VtKkwEbtPglUJYDKj+IxUWqQbHy15f6DTII7uwjCPxRwUFf97AwXOL8lPczmpAbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukiJqTKTui/2u5uhtQmS63H2uQ0VsJs6NkLwV0ugjYA=;
 b=AWyfM2aoglTAsRjcWypr1EWZy7Wj4EaxARZTXbf5OvbG2YaxiYsKXqKItrimGLzkGkmrekWxLASd3w7vSzTjXnAP2GIm6JFByygjjqK1RwUbjZ1U2ncsC7d2135gHYD0oLqw3bbwLbW/j5TDl1AreLy3ocVZ6DtaGWRMnsMh8r26L8XFJlTxpTgZYa3SVVbl3FufLdTfhcCna7D3dYNTe14h0dwqb4Dtj5X53qamfglmkTfnNt0lYQAUoRZXAXQ+LYxbpd/K5ijqoSgC12xzFekmgXFd9DMXo+9fWjPqRrbOoDezb8Bqf8RQ9yKWs6iyoXllvB7pJqeTczXSg/zYRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DU4PR04MB11385.eurprd04.prod.outlook.com (2603:10a6:10:5d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 15:52:05 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 15:52:05 +0000
Date: Tue, 21 Oct 2025 11:51:56 -0400
From: Frank Li <Frank.li@nxp.com>
To: alice.guo@oss.nxp.com
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alice Guo <alice.guo@nxp.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: imx94: Add OCOTP node
Message-ID: <aPesHPM9tk+f4N4F@lizhi-Precision-Tower-5810>
References: <20251020-imx94-v1-0-0b4b58a57bf9@nxp.com>
 <20251020-imx94-v1-3-0b4b58a57bf9@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-imx94-v1-3-0b4b58a57bf9@nxp.com>
X-ClientProxiedBy: BYAPR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::31) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DU4PR04MB11385:EE_
X-MS-Office365-Filtering-Correlation-Id: 377bf249-49a6-4a00-7d89-08de10b9c89a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dOPqB6EDhUVEDUUup5hfg5tBP6I1f8eHZUQGyNX5LYJdgLVwyxdXbG9ZpB0W?=
 =?us-ascii?Q?lABivvgiK1ZYrylXHi7EnAIShzNxnN5Jw1kRMCvlrpWgJPAwkgdw79Dg3NFE?=
 =?us-ascii?Q?89UZrjrugLZqMdkL2c6cn6NTxZb/tjbQswH5IGZu9j1Q+VG/hdV8cQYfsyag?=
 =?us-ascii?Q?eTVCVCv6+r+gs3jClPw7GcuAj5VFHc07ik5ztx/vX1zTbdnmtrvlQT0jwqhd?=
 =?us-ascii?Q?zfwXMMcmTQ9h6XEY5JkNfOy3EzxhVD0N9ovogfnmapcJXbVOzU34qbhOMQMl?=
 =?us-ascii?Q?VRFathrbUO6OFNotphMk+Vk4Su1rUn29+HDH8ZIkuNoj78eRXBC5mTA1ZsJN?=
 =?us-ascii?Q?po7i6bV+FRNXIptd3i2dkSGY4u/SduRDseNBCdl4DGfVgflFi7Ng0Bcx2OV3?=
 =?us-ascii?Q?HYzPWrcewXnnpYUgc7z+qBFTUZmSiQG9ZP0Cx7saBbj25VzMJRBNVmrR7jvz?=
 =?us-ascii?Q?0OURL8F8K4ssnfY/2fhC/iNdQkM8AqSQoLaFpONFhEHVCr7dw7Tfur0teQYh?=
 =?us-ascii?Q?TNShA3vCXtoCJaRjEQ99vNLOdr27h+q1ROlolX0uLlWTA1vI2vGm1pL+TinL?=
 =?us-ascii?Q?aYsW1CDNiB0OW7uvfnGXsmq9ATpAvy+hMLH2FzJOmjfaYgegik0TvHKNQvzD?=
 =?us-ascii?Q?6tUGV5/n2jwo470MpDRb2hLPo20Gs5qpRegOLXGM/uwt/nS42d6I06FHuC+b?=
 =?us-ascii?Q?k1euodudvXk/ECd/M2YSCXUtucdMhngx8DCllFYUiD6xeUWDmF5Ar8dntgg1?=
 =?us-ascii?Q?Pe9Wfvjyc7pGxtILuRP+gWnx1kJFhdgU4NXkCSgOyjVXXk4q+6JFfI3FT+uO?=
 =?us-ascii?Q?QhvH6NuNcZFK+P1/12FLA5tRWImjEVOVdhYWWnecS63TVb+1fFieTWYVyFJ/?=
 =?us-ascii?Q?gQP3jmu2JIJMRKqtcKp8VvK5mqLBZKQ5G/Diic8/pagZ+mk8pIDUHnDiHjzv?=
 =?us-ascii?Q?puEh1AsFAcGun5fjPy6FFCGWQ+ndM++RcAT9AF+I1VaqBjVB4XAO5qSpkHtW?=
 =?us-ascii?Q?0GVrAvsnupa9WRnx4Q+lRI2rR/DOaP2S+hJgRLFPcYEo0avMKb5KYU0zaRXm?=
 =?us-ascii?Q?pGGHKIWpcsLgj7Pp3zB8hyKxqVdAbvhC/UnaztzK/ao1sidavDAaYgQDEciE?=
 =?us-ascii?Q?tcaHWBi48LLeOFZl5CPBpF32fjlvi2si9YWcJfOPGJx6TKSOFjQ+tNrRuZPe?=
 =?us-ascii?Q?6OpBKlhvqsMiq4OdyJEXPbgLBPwHG6K11shl2M4s8PEoTNDbrDXz9C9PdqNs?=
 =?us-ascii?Q?yX34ZGUtTlzB7IctINlGR4aSUuMgqxf0THNmLeD9gtQ7Rr80ZCzv1wVewfxE?=
 =?us-ascii?Q?A9EL3aW394uSXbyfoas5BcK9P/W8+fmgu2/ItWGWck0EGLI+cpGzZtHiYONk?=
 =?us-ascii?Q?OMSAO10gbcWybzF7crQ8CiNaoCMajCK+2LTxqGaYA3ezZIN60iYkIedZfQh0?=
 =?us-ascii?Q?2+Vjbh+euw/z6xPHEADBKshXTNQPt4gcwWd61PmJ6CyoG4I97idMNpyT4Yy2?=
 =?us-ascii?Q?JCGAbaDjarMKlNBRTzd0hucXckl4fTa/KgoM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jx4e3UVsAqxB0lWPv/TLAfdIbp3mBxlawgY3y0ZZMp4XDU5bAFPpvLSWGwad?=
 =?us-ascii?Q?bApVevSAWgjasTD5oFFlD5IcozviOEAdH0TMO6ndSr7XcxWOKIBUOX/aROAw?=
 =?us-ascii?Q?0vM1q67G62Pd1OuCOAunEVBB54/k8pV8Dmi/lGUqFft42AdTfp/U2SCUaMR5?=
 =?us-ascii?Q?crsKC+snkEas+lGNzRv6/PvHcDNiMfX97RxPV6eovMPcxs+hbKq7cJnEBVVK?=
 =?us-ascii?Q?EDWwxtfCTjjgC1HPJCXY1DqPvqxAP/8FQhICxvv+7Md2Rgk8Ud452KZ0yZOx?=
 =?us-ascii?Q?iDDiQ1mwK+q7jMAzPGJvgEW3eoOxoHEdFlaAAtnJDGnEscn4gs1o0UvNzrQU?=
 =?us-ascii?Q?ia0jB0EO9QsZD80bG+v4UbzZ9jzYstkXZM1G+YVhrZLf06NO7tIT+JkX2bsS?=
 =?us-ascii?Q?xYISre1eNYWgOUE5xQrxr/rdkRhCJFs+c7KuUxYkVI06G/1LI8ubGKf2SiCB?=
 =?us-ascii?Q?Yhc8WEwe9F6rqfnUBpXbACT8UOf0rM6PlMjiSFQUtaIm7n9ylGhicwcEHjiV?=
 =?us-ascii?Q?wCpxDSikAsEipbyjGTG4bmhyGtPU9l7F4aRdNz4E2u/iHSgFfrBU7ZZVaFW7?=
 =?us-ascii?Q?fvOzV6mAmnhMBlF/CpAvpjSt10LxgSq064qVO3ipxKxb+GBo5sFNeWbPZui+?=
 =?us-ascii?Q?mEy4kSGwwhKIRv188krvmQIKYKOgPQFhgutg4KCf0fxL0wd+adIZgXapcfqj?=
 =?us-ascii?Q?1gWZU/Y7KyCD7JCuxkehgZzGSW2CdXI63EjJYHva4Lzw8K1BSlDYapSWdn3w?=
 =?us-ascii?Q?0iJW8u7Gpgt5VOwjbVJcfxYIIibymsd+x4WNH/bs3anPTzahJb5TX/A1JsAs?=
 =?us-ascii?Q?AR86mrMJNQhfzrd8VQt/EjnLqf2ZH7skH9Frr3cQx5o+vfiTbtirgKAFvh4H?=
 =?us-ascii?Q?vVPbB4U7eq7iPzMRa9UTGe7woD2LMtStj8kHQQIF2EidjAvWwTMRV4c7ZGb7?=
 =?us-ascii?Q?sq8iLjK4VpSkdf56asY84s2reI2CeTUq+e3x+zpdDvAfmtiNZL10GBZLN9bs?=
 =?us-ascii?Q?N5Au0H7EVrWVaiQz3KqkVQ+mShD5Kiu/qaF/4+NBHsuVGzRypg7K7vNumHce?=
 =?us-ascii?Q?2fIE8EuS12tsHM1NAl3gw0rT1+AAG2cowp2cmD9PJHcx7J4ihtN3mbg/EZRp?=
 =?us-ascii?Q?l8nGmCaxUOfgHHn+O+Dg2KpPownTMJEMY0r/vdSiJ4zBT8FbUllp+G+As6I6?=
 =?us-ascii?Q?ffCHp3cdwZV69isFiGeUoVZ3pIV5/qHH7dFJ8gLyqW5XqSv6IJJ6BNEGhDjw?=
 =?us-ascii?Q?abI5S0B587WXx5Yz0OVDt71yDR/ydh4xj3IcRHp9PnXarfukDP2G/3VFOhAy?=
 =?us-ascii?Q?2Uc1qlJcRMA4cZ2P5n6+0mut3qiSJMzKJy/ba8xZ6Hqi4d7HoYAstY8e0mYB?=
 =?us-ascii?Q?chnkhW96V7rc06fntAaW+EO411EwxCaODmTO/MzSU4Kn1ustvdYCdbo8PFzm?=
 =?us-ascii?Q?2HhEUdd8KKdxZN5r8rwplcaIBLQP+1G9sNs13+2KXOvEcpiX3OamPapbiYs6?=
 =?us-ascii?Q?eLbnas5E4J2NTBf4cRGJDikzN8+Ic3wZ2BjJb2tWWUvKbjEECZxySnLyRyX8?=
 =?us-ascii?Q?qGVdQLhylRmfaw97ZDoi2pdAO/0C8GbIxqnARn9H?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 377bf249-49a6-4a00-7d89-08de10b9c89a
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 15:52:05.5604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2Vyu7HHKz+3a0U23x5NWhd0iARHSLYCNm6uXNLigju3GeLmPXsdbNq7AIXm7vbVvVstvHN9KUQkdMEAmIQ5Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11385
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_085211_700041_EDAFBA53 
X-CRM114-Status: GOOD (  16.41  )
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

On Mon, Oct 20, 2025 at 06:50:44PM +0800, alice.guo@oss.nxp.com wrote:
> From: Alice Guo <alice.guo@nxp.com>
>
> Add OCOTP node to the i.MX94 device tree. This enables support for
> accessing eFuse on i.MX94 SoCs via the NVMEM subsystem.
>
> Signed-off-by: Alice Guo <alice.guo@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx94.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
> index d4a880496b0e..8728b3aa15a7 100644
> --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -1173,6 +1173,13 @@ a55_irqsteer: interrupt-controller@446a0000 {
>  			};
>  		};
>
> +		ocotp: efuse@47510000 {
> +			compatible = "fsl,imx94-ocotp", "syscon";
> +			reg = <0x0 0x47510000 0x0 0x10000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
>  		aips4: bus@49000000 {
>  			compatible = "fsl,aips-bus", "simple-bus";
>  			reg = <0x0 0x49000000 0x0 0x800000>;
>
> --
> 2.43.0
>


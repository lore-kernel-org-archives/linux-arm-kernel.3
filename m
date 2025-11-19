Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91667CF394D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBIF+2jCSJ7zB7a4oP0CfhSYlvAFPnaVgBxM7h2X2Yg=; b=EexOkEb/AuotzQmzfoxHxZsSlE
	F18K80+aF6E0LWDk4MSGhyproa4n7lmuSXnH97Ld51j4zMSB4Ip2y8B8GrP7XY8zDzVvU5kNeqGky
	qet29pUkEFaeZzGCW/kRe8FoXnN3QToF0eDsPeh804L+1cRL5DCNSVlm99HemJBlPyuFhgBWKfcIc
	Nv0PhrfrarrvdzgmZRapiDjTxq11hR6SDqqVUJqeIY2OSAYlhYOV+LltqVKZKNqHQVWFeH03Uwq5Y
	N92942hHYaJTJZj7smP91dn7vMizji0GKLsWHmgbhwrU33bW3afYNaCCJE+n9CqdQjFmgE4jho61F
	snp5pg1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLktr-00000003frm-29v6;
	Wed, 19 Nov 2025 16:19:19 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLktZ-00000003fXE-0GYP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:19:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ati4RtJ5b1d3fq3r/U4r3jzrKyIL+DwW4iNzZ2l56Qgc1gOCPFbakUSbptpsclhrnZ3zHXjlBHn1X6o4p4+MQNELrxB3ZO7TnqQvAGYlaMfHx84MMOyFqhq1JPXEDMWztDLolFGuw28bT+qFNf9NHW/nIko/RZw1Fxh42BLR/o8yvLapQn+gvaHO4iZxApRUirqURTCxLcooAO7uCIb26Ups5Xlr4FM1iQWTpEhTElC2+oNXJVSFJ7UZEfS5xxuAmEqXfwVGdjBJEk5e00k7ao1jIARVnmiGaETYCfeIH6GSYjtPUmYAEtjdigCzuCsqKOXACsgnAncJPgVJLWdElg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBIF+2jCSJ7zB7a4oP0CfhSYlvAFPnaVgBxM7h2X2Yg=;
 b=sZkhONj9l6GiQVZWm+8NoCr/7vrgF8lOTCs5gG0t/MhkN5EIQmPOb6ZG30Bs4cZw2gKV4iFWtBiYwU3POz0kupdvggr2wrOlAtw0W5bQ/ueJU1oqXta7UtaQuHFDZc9tezPRH+Tuqx/oEgCOFYwtT1QBUjmTATgmGLzQ38GqZ7bl4FRsqgLf2x6l0v3IeiLQB0DBNPk+TvwbUL9YMHIkB0GtZj5OLL4EyVg9N64AinGLTkXiwvYvhuwoJkGDtdbA1WTBAcMVYsgn7cpsu6u/pNEAlzvnsOejxEdE/WM2OdIzvtkt+VRRgSNWuRuoxCE6Ii7nCt0KzfBoCbGz7sXEYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBIF+2jCSJ7zB7a4oP0CfhSYlvAFPnaVgBxM7h2X2Yg=;
 b=kEyZrXv4ArOLghcR8wblSTv4sv/vEMnR4nKe8J8tPLgeXC4f+7aa4+EiwrgJLPwIr8b02nGXa1MY9zaDKRaNm6defv4ZmxhcnIvLPFzMxCj0Gxum6AqfDjqatJ1Gn1UjTGaz+VhjNA3j4jm5rRhxPophXza1tOVHX2zlixVc6GtYUZThjA8E8I7tnbLPcpW3tiAZCi7+B5waMRJ21yTRQqMlul81IHnIfeud4tz2pqK01yQid2Qu1b5bqkgCgLLu1zwvxAUlCHneAurtGCRedDaqG8KixWkhTbQIwzyk51teEG/Iax8oqCBkWgs8EOnXnjN20US3IYS+by5nnRw4pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA4PR04MB7694.eurprd04.prod.outlook.com (2603:10a6:102:e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:18:57 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 16:18:57 +0000
Date: Wed, 19 Nov 2025 11:18:50 -0500
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
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8qm-mek: correct the light sensor
 interrupt type to low level
Message-ID: <aR3t6huxr3wQT547@lizhi-Precision-Tower-5810>
References: <20251119-dts-imx8qm-v2-0-2579434f95cb@nxp.com>
 <20251119-dts-imx8qm-v2-1-2579434f95cb@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-dts-imx8qm-v2-1-2579434f95cb@nxp.com>
X-ClientProxiedBy: PH3PEPF0000409E.namprd05.prod.outlook.com
 (2603:10b6:518:1::4e) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA4PR04MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6201d8-133e-4be2-b31d-08de27875739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Iv+nCXqzSj60jsavYti2t7Hr1Mh3Nozhucr949Nw91wnP4PdwifODF/LLiaP?=
 =?us-ascii?Q?fZ6Uxryc/VdFNGkJxLQnH0S5VC1Uf3wj5+1U9cZH68lol4ndjC4Xrp8qeoyB?=
 =?us-ascii?Q?FnUwrUM6uk3bIrpNAk8J7OSac9AbvVTftAI1+mgp0NAndD6tpmzDidL8S1kJ?=
 =?us-ascii?Q?LsnAA7xGmnjEQjpSCEKth3G0tgBdVBvzo2GsWsJyT7c13j7mqqXMUcZJPBn1?=
 =?us-ascii?Q?19oCeSmppUG6/Y49ltsRjpc5xmI22Zl1DJavbM0syaDi+qaJvEFqXVIEAbG1?=
 =?us-ascii?Q?M+Os8HkvCshRuus40hxPacxnls86qZrEtsVvQG6p3FUmyPthQhvUS/ONxxTz?=
 =?us-ascii?Q?Z4QHP0AijXix8j/3P+oS562mfiIlTS4Rb7C7V+ZYdHMVd8Wxefp7kAfq9g09?=
 =?us-ascii?Q?lgBcgJSEtdWYbSx8LKaoUCKNZI8LyJq1M187OKizOR24j0ymaVVYZzaVMbkk?=
 =?us-ascii?Q?P2biclBInhlH0NFxcvRTZ4o3ox50xGXqybL9cTUyWbvjeXWtT6QLv+Fe6KoQ?=
 =?us-ascii?Q?Fh0Ld+RA9E734KsrCwtu5g/bzUbZ9QIyEpJ4dt8Jk7uoEBmGYn0IkETHO3lx?=
 =?us-ascii?Q?sysaQ0qUJVK3nX2y6fx7mR2nqpoTG3hisDDfnXf2aIinzkNtoa4yzaiUOQzx?=
 =?us-ascii?Q?WGdEdTrlP9YG5GXlM+eGVx3ZlCqudTA3D40TceiqFMOv1IgPK7/Llhq8+Dnn?=
 =?us-ascii?Q?2f0fDb8BJ6euOgAlWEOuFuWXw4xIbgSCbH5aicEE2V/Bh72/L7g8fqXJC5Zb?=
 =?us-ascii?Q?0fgVfl8gEWT4gwyic2/c2no/+CTfb64dVzfEv8AwXkr+EF9vzkpcXSOeCaeN?=
 =?us-ascii?Q?nEGqvN3UxP+uWzIkaOhQ3Xci2JzTdUa+0hu6azaRKEZ+A908A7izgZCb4dZt?=
 =?us-ascii?Q?PuRpZfJGi+SxeqAjfzKd8KMjcBKcLpKVZIpQ3S82elGks6uXMNYa7RK7HXa2?=
 =?us-ascii?Q?SCGNaiilpqjEs7YHomZIk9+nSBvnI6TjA1cTQjqG3m/7CTEddHoUsUOMGaxz?=
 =?us-ascii?Q?b9wEKWktePa6xT+rTEjveCs8szg3h6FDOgCUnSCyQJ2TALamR9awo+76O+ww?=
 =?us-ascii?Q?Pf6RzYMpea+j07G1+CgodpFh00JXSTLLshrr4tHWqlZUqztxuSIABXQaTkfv?=
 =?us-ascii?Q?FA36swekADClgKtJRVb1EZh2978pPgqOHhmxp6Rk54Qy7YOCXB9T0Qo04WL2?=
 =?us-ascii?Q?xPWp61151S/+tk3EPNM2UlgKeRGyJk0rrdLHXUg2g0rnxHb/RqaEemUmZYH3?=
 =?us-ascii?Q?dHsow2sfUDVWNcKjQ5ExjVfgGLHyBFxH+LnQ8V7SH6frdzji8fCsabcx9NV/?=
 =?us-ascii?Q?E8r1RrpyFTGilGZqECWXAlYbftaJtWZEwDhrgLhYGlSfF+x71igsfHRTYj/m?=
 =?us-ascii?Q?0TR04iYYfst0dimDxhEhcGko9p7mj7gwdugkh3zskOlEhKTrF6nyOkjEHKgP?=
 =?us-ascii?Q?GMvsbC2v8IJWe/b+fg//tt2TISzM41qw1CEicGPRCO5qbgMAZuxL/u1IIJ52?=
 =?us-ascii?Q?VzDpWKWt1KmInrs9IjcERQeiib+SK/Oc1ckN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C6hIFUm2Ee5aiHDjHop8JgPkDUqfIfh6+96wELQCrEYCQlm1rK9Kz0M9bGzH?=
 =?us-ascii?Q?PflqqdL92SB8GeNGsmUYyx7xpwKITK15RMAYkgRUJJrPiizviO5O8C9EyGwi?=
 =?us-ascii?Q?XlDJ9d7yzYop+aAhvGNMvzHszNTIT5oFhxnWCmlrAk6JTP7lRVMHS94ZC17k?=
 =?us-ascii?Q?ECJMuCMzNMAFKNRb20Cd1RtJcgteI+eMPjlT0FefUySGhWqthx0ChAJkwsv+?=
 =?us-ascii?Q?/Yc16IHDIJs27GEjqSDwi0lp51Uk22AWPJnP+CYSEA9UeIfcz5T9rDOs2JpS?=
 =?us-ascii?Q?CdvEdG8pOdAExFrQSH5qfboJJJZ0fYAa+oB5N+8DEluaHRdD67L6qvflKRb5?=
 =?us-ascii?Q?ueJPKvb5ZPCZ8wpMrBy/tvYs3ez0na1UnncCIMTaPP/fJxMiOfz6ZFHa8Beo?=
 =?us-ascii?Q?WCh94rTPBeDsEubu9MhDMdYB8mkO8+/2KQ3aZXj67kHQ+pOcvmNnsV+I6fQU?=
 =?us-ascii?Q?snyQx6cbDo8SXzeKSo4n5jrw9SZbwu4OeIBP2pnlcal8ftG/OQg5Wk/nkyW/?=
 =?us-ascii?Q?VhOyMSZWk8e3TS9rS1SqU8fAF0RCZnk+VLVgjHZnjRd/xKZCXUa4yrznSbtP?=
 =?us-ascii?Q?O2HC69SYbAiq4NAdmAdtbE0YLAU8h5KgHAX4xBuOxzDR62APSAA6OJ8Ea7FW?=
 =?us-ascii?Q?jNJIbeQlUlt3nM9K/+KTe6fly8Rv0P0U5a+BZcHdMD8+l1Je6AwMmWjhVCQd?=
 =?us-ascii?Q?s9SRAfz6VovQ6BUKU+7sBeyHeY3TlGQcN55s1B8eXR4sxMUVRS4T+cf7Bmsu?=
 =?us-ascii?Q?CPI8l8YVSzNWTO6h+sySrDYQeNESsV56VnvJHfEj9RDYQCgB6vOQJZ5X7co1?=
 =?us-ascii?Q?x+aLtte7rHSV8wDl/UGKAbWqTMTAzjxw5oxx6CbwI757eKGNE3qDukefwr7B?=
 =?us-ascii?Q?vS5+3w3vb6ZM89NjieIluS/gu122Tlt37V21Uo4S0AC7Hdn/yAgbywyFBC71?=
 =?us-ascii?Q?aX9HY/jzv9QJrcFhWyxBlCT+qEIXJjv+mgBuyVWudGfFWxsfi+f8Qo2wQJJC?=
 =?us-ascii?Q?OxPFPZAzk01pARCRhSuPxMbyyRrzdfY5YLTCZ7qiKYa16pypNwz13E0LxWIK?=
 =?us-ascii?Q?4dpk1glEBLpyyZ7wIk7rbDD2aWLA9ZZTQajaVm4TpQdGkbJNt0TkNAb1qxPM?=
 =?us-ascii?Q?0yfuEVX1jIsQv4l8jv9vUSMStu3It1mOTLioJKS4pSuavvmsSnJP8Tt46Nqj?=
 =?us-ascii?Q?58du5dz3qB6VqIk6ROJwdcK9cVg+O5fe0vY4LE8H9jF+q7fHsj4dmTPJsZOG?=
 =?us-ascii?Q?l2p7FFL73AnEuK4mqarQLN2+mTVSeVal4qHeIsFO3AGGUeuM2MAEOFeknuT8?=
 =?us-ascii?Q?7+pJYdSgifwbTFa8sqi5TewgEWYFw09CXsRhPEt7Jf4+BY8vjhhuvQe20JfZ?=
 =?us-ascii?Q?1r08Erew+kbAPF4363fe1XMbXY9RT3rANiHTO1M/Hzlt8uvu27wMz+GZVu+e?=
 =?us-ascii?Q?jFJQtrffD0jGe3zjA/fiD51FmTH9rq2lsNwg9twBXeHLBFUY19WXLMcJMWhc?=
 =?us-ascii?Q?LOcQK6+Ff1b118X4Kof94UjCvbBVDaEko6LS9uSzDDxb7lnoDBeulRjfJ+1y?=
 =?us-ascii?Q?rRulqcUIUaAxUxYBwc4keAb1jS8/sXv52dsk80mf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6201d8-133e-4be2-b31d-08de27875739
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:18:57.1937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53hUC8AZmb10PfiyUzeT3JNNSOcpat5Z3ebKfm5yKpengKLFTIuU6wuVlI9bWTeTGib9xh0At6T369zK8mg6eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7694
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_081901_118744_665BA169 
X-CRM114-Status: GOOD (  19.22  )
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

On Wed, Nov 19, 2025 at 11:22:39AM +0800, Haibo Chen wrote:
> light sensor isl29023 share the interrupt with lsm303arg, but these
> two devices use different interrupt type. According to the datasheet
> of these two devides, both support low level trigger type, so correct
> the interrupt type here to avoid the following error log:
>
>   irq: type mismatch, failed to map hwirq-11 for gpio@5d0c0000!
>
> Fixes: 9918092cbb0e ("arm64: dts: imx8qm-mek: add i2c0 and children devices")
> Fixes: 1d8a9f043a77 ("arm64: dts: imx8: use defines for interrupts")
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

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


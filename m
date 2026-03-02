Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7910DEA4E3F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 16:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:References:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOZu/yVXWLoqw1sV1tgqrxooFCoTcKadC3Jb0pzte7s=; b=cRpeDBqJaNA3LUvKxyYlW26I8r
	5/SBa+KHR/L3zZdBrTEHAAAg5znQMVfBOdsemVbAZyeTAYf7K8TcZLUAMaD//QDiwvp7eH785SpQV
	ndiJIUgGM9Ej1qkq7BEeiJljt+L0UQ/GNx3SSJNz1fS3p9kA8ouAwL3W2y0swWui1EHtRk1OKm2f7
	F5XVG0seSe1vx86cs5vY5gPZnpAduaTDqOwS++a2V2ngHxhrt6DwItbPSID/8A3Cca/zxrwYkZsRy
	ZssGd6Cqsh4kwVhygD5S6Lvcr/r+wuwoBB2Kl87pXHEcmiUvjY1IAFy1dumDW4ZSohzp9I5FfXs7s
	o+nhr0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6Ld-0000000DWGR-3Db4;
	Mon, 02 Mar 2026 16:42:21 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6LP-0000000DWFA-2QGB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 16:42:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlgCBbjZTMv3PnYYoVQQhcT6a4tKSJKPMDWeNbAXxJjrHwEPi5N8fV1NwTMlg3k/p/9mPCCjutySIzUm0oIes/7kWCNneTmZrBKHgV1V9/ghNrJJDwkpIy3f04HKmo+vBU0C0CTo+pjeYa+taHNdouijlejXQLpbxeG9xEkrxJ9s523oOo7Pe5zY4PN2DZ5JXU5Qm8ekP1IioaNHEGE4ztVmL8bLkCpKx+L3/tqznDgRrMTnkCBJsMr6jxQzfN9DgTbw+1MVw2UIWUYJFNojlSxAVperzrDdl7NayF6Tdy2KnqOKSJhlRrf0GMBFGTv5bjA1yDBEt1BR4nFGjVWpvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOZu/yVXWLoqw1sV1tgqrxooFCoTcKadC3Jb0pzte7s=;
 b=IyAJPZdk1pDp3RHmJnecxA+kZkRGEyaq/9hFodxC6UtrsfTQKBaRU0N+grO0jpvSEubfVEwgBOq2qS2iorA87bR5IfsFnduhVyp1WGZST5I6Om90FRSVYrW8164IeVxj1nm8pAyhuUOcukh4DnivEKovFL+cBSb1ZThFfDHr8nTFhA+4iDW9vJB0JvSz1YDkd2uWqcKUZIwLkwcgCcz9mTHGja5lntD3qsRLdISSsl2pY7fZpVfRbDhQ/WCWYjiSnZA8O55MpNZ+XEFeTqgaUjO0uow/j6zd+aCJZB4QRWK7lp8NPdvJea8+n0bz1Mw7K5NxXHEOOHX26Yr72h0MHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOZu/yVXWLoqw1sV1tgqrxooFCoTcKadC3Jb0pzte7s=;
 b=i3NGiNSVN349fm/zv3Q6euB7XUl1nhaJuC5BkR0QhKnQAmiR1l5zMZyix7oedy3iGj9uUo7YVrxo0xD7BoLf5xiLbrVXPirl6K4Od4bp3pJyEy7vI3U3k+hoAszH3VnhtAfRbCKc3tyjUCyNT6K9wpDl1fLkOQhxhmnYPYSIW9Zr1pqvwnOZF4sASYSj/PBRTLPhWs0Qy+rnj03RtzioSqQi1PTvTIXn5mvGFm3oYAkaGeffz/uu9mFKez1GW566CXX3WseHrr6bveFqa1tIUelM+zrf3n102HINd6P3OIRtRbEckX/P5+5I8WOjkF9Gd94h5I+aVJymwD+LWsM9zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8867.eurprd04.prod.outlook.com (2603:10a6:20b:42e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 16:42:01 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 16:42:00 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@nabladev.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, kernel@dh-electronics.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260209170739.22379-1-marex@nabladev.com>
References: <20260209170739.22379-1-marex@nabladev.com>
Subject: Re: [PATCH] ARM: dts: imx6ull-dhcor: Handle both 1DX and 1YN WiFi
 on i.MX6ULL DHCOR
Message-Id: <177246971688.2091049.7272707396719268452.b4-ty@nxp.com>
Date: Mon, 02 Mar 2026 11:41:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: BY3PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8867:EE_
X-MS-Office365-Filtering-Correlation-Id: fc652ab1-3ddd-40ec-7f8c-08de787aa052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: HcLklNeQuK3eUgM30aVnwwc5/Gpmp4PGDf7ayKk/eHG+p2OypUZOV+RBPJ2jOiZYA86Wqr5ohvp0KqJYDNXxe/F79rUq1JWmE6fcRmxFO/+5HpXfk0tlfSV3mQUgN0z6yFjePBdKVJgeH2CfXEY4recMzafhg5Ut/Nk0NInVVAXqb6KBpZuLb6SKAvau4KExp6HUeXvmyAD7v1jQ7c1YXIOpDMw2pRZgu0MlF6I/BWltn4JtyoqTfaBe/g3AaN1dVhhkqag6HQnCoSK/5/jhirxMu/FN9GT38F2Ld5OACGI+2ZHs1RoPxdM8jFvAYOTKde50ciuQcplsRWhTfjgk7hLhjUDLTMLAGywFkDrjLxDYLX1F6kaNi8WzpB0cY2bsw0824uYEEbzr8dNs+Zr0SVNT8i05mqa30d7xvIEctUL2BJImBI5V0B5eHbKgkd0gEwMXG3ysxiyUZUt75N4yx0z8OVqR4WOlGBEQbL8bsiPHzl7CjNkSuZh9wZwnGFSpw8/E0V7cvzz/lNh+h3ajwshpqv58r+H/2AdJ0Z8T5WkWngwYLZ+7/B8iZSYXnVUq1fBEjfF5Wj2WONCKtkS7lQQC1nQbMI9NfuyE8BWlpbdiyvHR3096us0JDNVPu1xn5gki1/+4K7Z5gO1R94eSEk6VHX4agHo3TEvE8+BFq/EOY888numBtKegkv+QKoJ1IzFXNBv/2eUkDktuCJImq0LKYw+BstZdZjTupPH5jl2gpIueNr6UXbgOGuSrZT+baccbPPA+iDbowJTW6l+NlEvBlCRns27othJvZk6LeMw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blRDSVFCaFpCUmF5L1hVVjI2bHVneVloNk9aK3J2ejdFTWRzc1JMQ1FlZmxx?=
 =?utf-8?B?VWY4MUtaaGoyNE8yUlF5c094Q2VPaldwekh6aDhDSEd0UGpwTWZmK3VJSzc5?=
 =?utf-8?B?SnN6UDhOdm14NXAyR0pnLzZmY1BadjM2SDFYdFJKeThWM2llbW1wNW9XdTJM?=
 =?utf-8?B?dUxVbmsvYkpCQldhY0g2RkpablNhdlB1L2FmUGgxSjY2L3R4NlBqaDZUQXFn?=
 =?utf-8?B?aHVhY2JwY2FhR0l3TnlwRjdYVVNkamEzZkR3SFJ5dEdMODlzVTZHTVpqekd2?=
 =?utf-8?B?d2xOU2xPTXFkemRha3RzcTVaVld6b3orZzEyaG80eFZJVXZsZUV4c0o5TytQ?=
 =?utf-8?B?RmQwTTU5T2ZReXo0dVZiNXd4TzVscncxUzIwUVdJWXE5aHlKb0VuUVdMYjd1?=
 =?utf-8?B?SnBuUDZhUEw1aTRzbHpkb1AwNldic1dwVTJhek1rYkxmcnJ3akQ4SVVYeHpn?=
 =?utf-8?B?TVZ6U2dtV1Y3aW9jalVHdHN2dDBQeHgwRm1zODB0QVkwZTVET0JZVTFwR0ZK?=
 =?utf-8?B?RTBIS2V0Vlg3alc4bjJKVWtONDlrc1htWjhuc2ladU84WWlMWXoxZExTVzVJ?=
 =?utf-8?B?TXhGU25GZFhYYnpRK1d3SlZMZ3gwMEhkUFo3ZU03NjR3Y3dKM2JrTVRPTkNt?=
 =?utf-8?B?dXZCclNBNEMvWFBKamlZWnpUSkUwQUN3cFh4N3ppakwzbW5kUGU3UGE0SE5P?=
 =?utf-8?B?U0oyeDNMTmFUQUtERzNlb25RU01rTXg0Y3VJQVhmR0U5bWdHVitzV1ZSb2pj?=
 =?utf-8?B?Zk1Ja1kvenJTWVlLenl1bTYyMTZQeFVMbFozaTZLRTF4RmptV2ZTM1FFOE5v?=
 =?utf-8?B?MXJTVlBNaHVGRE1WSnlRTjc2aHFEdGxNWk5IMzRrdWF6NS9GRENuV21FTDBS?=
 =?utf-8?B?TG9DZEYyd1VuV1ZDMzZTOE1JdC84K2J1OC9xMThMazZUTWh6VzhQVFNKN1Bh?=
 =?utf-8?B?MitEYi9uTmpadk9USGlObGFLYlZINktuM0xmWHNjcjlIN0VXQlpWU1NZZmVF?=
 =?utf-8?B?SUF3WUt5M0NHVjhnQm5rSWlzOGhmb28xSGhuTDk5SGxrYXBJbTVXZ0I3R2Fj?=
 =?utf-8?B?eG5TdEIvOUswRHZ2Z3kwNXJJQTg5L0VXSytJYThPYUR3UXV4MnFNdUxCcjJ0?=
 =?utf-8?B?RXdnamVxMnlZbEdhZHd3OURvTXJ2SEdKemZCZWNMMEl4Zk9mTnovdVI3RWlu?=
 =?utf-8?B?Zm91eE0vaWM3VXFYU0MxR1cxK2lweFl5QWZTdmVDWmpwV1JLRFFUWDlJaHY1?=
 =?utf-8?B?ajFJTUZTR0FULzFXM2RuQ1AwaTkxcmlrSUo0ZkYzdXBkRk1PT3htNnByS0gw?=
 =?utf-8?B?cWVsVjdUdkFoeE9CaEI5Snk3bkNaQ2NaQWlraTN2ZEluK0VLOUlpT1dWL1lV?=
 =?utf-8?B?SkxQTWlkVWJNRjZNRmpsaVA2SXV3SWsvUWdEd3lFdktxRklLVjkyY2pZcUpq?=
 =?utf-8?B?ZzlwK0crQmx4YWJjZG5zSWo3WTI3ZnRCNS9sRTZrcDhERE9pTGxuL2hlRnly?=
 =?utf-8?B?Qm9DTkxBZW1kWlg4RGpJWFMzVUU1TkxrKzJUcXFqV09GejVHamFxNmJva1Fj?=
 =?utf-8?B?cGVzU1E3d3lidEJ2aHFucDU1UFF5RGdGNlc5MW12QzFJM3VYRStadVB4UUlZ?=
 =?utf-8?B?NDdFNFhsSmNsdWdNeXZpbXZDNmMvWUtCSElFZ2JMUTZxL3BEMUpxbTZQclV0?=
 =?utf-8?B?OUpJRFRtbkxxV0VxdXM3RVRHQ1M3WGhuYnBrUUJDeURndmpMa3FFZ0V3VVMw?=
 =?utf-8?B?MG1Kcm1scytoY1p5QWE0bmpjZFNnNWFNNXZDQ0xMZDZEY3pPMEtMYUVoTHFq?=
 =?utf-8?B?aVhMeHZkWTY0U2N0SUlYYVlVRmlvanFLUVRLY1k4UjNzd3dSSVNnelN5UkZK?=
 =?utf-8?B?dGdGU01tZlluUzlXSk5kL1FRWjZDUFFhQWZqSjQ4cVo3RFVmSmNZVzR0ZjRZ?=
 =?utf-8?B?Q3Y0eWRuZmdoWU05RnpCUkZaQ01MMFMzRzUwdFB3dUl0eXArNGNGaTlJMnNZ?=
 =?utf-8?B?cUlLVHN3a2FONmxGaUNPaWZLNGxzakxHV083SDNBTUhPZUIzeU1VK2loMUlZ?=
 =?utf-8?B?bm50T0F2Sm96dXJYaHBEZHlBWENMekZmY1BXZCtiaWdmdHh3aUIwZlR2MXhs?=
 =?utf-8?B?U280Q09ua3YybHQ1Q0tGQkUrZ29yMUJLVitwWG9CdEFYL1d0VWZORHpxaHc2?=
 =?utf-8?B?UlhDRHovVGhFMW5mK2VhcFVHZXFzV1B0SnA0NEZZak9BNDduNHJ6SlYrcDJa?=
 =?utf-8?B?QURucjNxSVN1aXBiUU51cWNTQms2MmZzOCtvZVhHS0EwRnZ4anVyVnRWTEJh?=
 =?utf-8?B?MFF2R1o4MHVCN0RCdnFseTNQaUdqSHpQTlNmUVlTMEg3aFVFV3gyZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc652ab1-3ddd-40ec-7f8c-08de787aa052
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 16:42:00.7442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2RLsyRCnK7H6g4UWHM1+aJoRSyoiLkY1eGqpIUGuXwAX0udF7HNfLnIESrcnEJ4jSssbH0pd+DCIXd5tF2zgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_084219_794611_E239FB68 
X-CRM114-Status: GOOD (  10.84  )
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


On Mon, 09 Feb 2026 18:07:04 +0100, Marek Vasut wrote:
> The muRata 1DX WiFi/BT chip is mounted on the DHCOM i.MX6ULL. This chip
> has been discontinued and replaced by the muRata 1YN chip. The new chip
> is a drop-in replacement of the old chip. To support both chips for the
> i.MX6ULL DHCOR, drop the more specific compatible string and let the
> driver auto-detect the chip type. Currently, there are no known quirks
> that would apply only to one or the other chip.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: imx6ull-dhcor: Handle both 1DX and 1YN WiFi on i.MX6ULL DHCOR
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6F9E9D402
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 15:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pm6/Nip2q8Pf6DOVNVZq/crSOv6miizcaezBsMPnVSg=; b=S6ga7Du9kTXJqbLc+Qo1nWDp70
	ULJAaMj2P+ivtnHuX1G0RuqlzKSjDgKmVT/YeGU9u+bIs0gPhY9EE4yoZHLfODnYRq8dlKNE0v3tg
	w7lkSw2hqljuafFYEyi2XYG6gDQUWqKKyW2d9Y8zGr/iVy2E2zQIsWLv7EM8YyNZGpRcm//9ZG9Px
	3t117CaEj1fihgVVFDCfEdkucS0VwvrgRf4y3aWh0pCpZ5+0i5Cs0wJImo7OxzBeOB2HWjXwohSVQ
	mG6LpZv7TuxxzmKhU3iarPfsilzYlWKZzD4YmaNd42EGDd43W65P8V8ddMyNnEGLY/1e8eORvEzH5
	AwkibhuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnf7J-00000008hMf-1QyC;
	Wed, 04 Feb 2026 15:48:33 +0000
Received: from mail-northeuropeazon11011012.outbound.protection.outlook.com ([52.101.65.12] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnf7H-00000008hM8-0W39
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 15:48:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PzI28hEcS1KNxIDOxcxcxOyLxzHTe7AN3QJ0yRXpsr67VkfPRbcKLTv3EG4a3gHn/1OZp2PgFW3YOh2wAzG0BLDz89SjYySbw0qomEvX27rqWmj1T4hYTWn6XI56xiUfLhYz3FsgcwuHX5uJNwa16giaT+dtS5cLO8y+9+ZinEq6TZIy0MHLCog2VR+g74oXymRLmTU+8uJRCdExW76rSmw9lpIBnJ8sBR21kJVwZUBa7jrByinE0v2Huu6HfFS7KfXddtiDUusDS/9od+Ypq0lipTrmrNOEQsD7Tt/fYMssHaoHB9s3FzFf8eCM0ltJbcxBmUYGRTERXmizRqVh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pm6/Nip2q8Pf6DOVNVZq/crSOv6miizcaezBsMPnVSg=;
 b=tAnz/gapvKyDQw7dQtZ787xxtBLo4vItcM2DpMMxKEReFSqoTLA8umYdFv0pYUa7QAfo0Dbg0ESobwSh2GipNkzH7Y0PxDkfbnIymcgfX05vYlLTO56Z6Hwl0rkldLaRgECX6tVB6Np0ptBj7Rvb5Ux+9TyUVANVJbGn/MuhP5yjHDEJAxKLeEVgZtpRkNROJxJoYLQU6OZRtVFFIepO1PuYNDSXg6B6EcozOkyrlZPEQ76GqZGBezhwAN/4PEBrcuu065CG3M58epTxYS8Ii/jgytMWjBsUlIkCNqHMrzRg/Z1VdJPAUT8EPp4DexFf3K3PCotkLbszd88hQmgksA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm6/Nip2q8Pf6DOVNVZq/crSOv6miizcaezBsMPnVSg=;
 b=F6+kJ4UG1oRnGygQ/4BVB1oi15qvovMPzNPXcghjswnrUdw/pruS3V9Wbf73AYryl75Esq5fl9Tt+2nRzSbAWoZQdNuPyShtUumc0rNB9Zqz8BbXRQ5/mQEVUEHVZ75dX08XuJmY4/5Ye5e6vj92/CVXGOv+0M0NuiCt5ZaVzcM8qIdwuJvhHMM/xWPkAyS8NhFStsGGvy+29kWIALRDroaclR7xjila5qXhNOA/YYSomztlp1zl/Sn9YfaNEB42QEdek0tyTEKjxFZE2TsEJw2ce9CJsQYScSrisD1zHD9gwRPtAecEqBYYxoomsu6LHeH9wT+s4/v790TEp1+gWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB11521.eurprd04.prod.outlook.com (2603:10a6:150:289::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 15:48:26 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 15:48:25 +0000
Date: Wed, 4 Feb 2026 10:48:18 -0500
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Subject: Re: [PATCH] watchdog: imx7ulp_wdt: Keep WDOG running until A55
 enters WFI on i.MX94
Message-ID: <aYNqQjHzKxxIvIy6@lizhi-Precision-Tower-5810>
References: <20260203-imx94-wdog-v1-1-7deb76dbe350@nxp.com>
 <aYI3ZYYSfI1Gt1RT@lizhi-Precision-Tower-5810>
 <PAXPR04MB8459E30457A6451C622290768898A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459E30457A6451C622290768898A@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-ClientProxiedBy: PH3PEPF000040AD.namprd05.prod.outlook.com
 (2603:10b6:518:1::58) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB11521:EE_
X-MS-Office365-Filtering-Correlation-Id: aa27ecf7-62c5-406e-4f72-08de6404d556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jBmPFE3l0cZvyvviJ4RueOIN22DhTBzsX0wrj2ccHXhaFqcOAtny8w8bAmUw?=
 =?us-ascii?Q?EBeIeSjkBwO7ZfcCpiYm2wINjJbbp8KezpFT/0ofefyOEWlLclZLnd4Jf0Zz?=
 =?us-ascii?Q?aSChxoSqNHRIxOmSwBBQQezJZBHBcxkJtvLxOQrhZm5ltLImJXp2uLMaUBYV?=
 =?us-ascii?Q?qTjsRvEI8J9kYsveIjXcPLn0vO/tOvIQzx3H/TNLhWbPTSAeWTVXpLbS71Dg?=
 =?us-ascii?Q?WZVZYE73or+1e19O2uvN7GceBr79bxVcEmMfDkI9tbPEn1ySxtiFKhspOTiv?=
 =?us-ascii?Q?s198l2GXdM4NVmJzjMBM+D244/mxvU5yjbIu7TX0XmeGMdLx1FrNb0MXcrPl?=
 =?us-ascii?Q?WYHPDkUbtLD169DR63ojtyu71JmwAZwk1UanxfxiIsrjJuxA9L9n1YwjEVTW?=
 =?us-ascii?Q?RNbSD6o35g/rh/FYqbfJn8d+b0nQI/wUojAiXQ5c5VR3ECcvpeWNDYE6OSvi?=
 =?us-ascii?Q?Fuqj9xKz+WDkqguVujBUj5akZruQBtd0uia2KoKtkFzseOyFD0J0pz2QGHm3?=
 =?us-ascii?Q?LzeMRe6v1w83rcLuksQeJnAN2JdyOZoeQ2LL1p0y1y7QN37G6wyP72AetI/R?=
 =?us-ascii?Q?W19iqK6F5UWMvCzhicklRGy99zAd8SoDd9LcKX3v2MoJiI2rX2hVjNzVZX8Q?=
 =?us-ascii?Q?XO+pfwrU1RNezr7/pqU6+Tm2z0CW7b9iUoYyco/yrmqtGvWc1IWbWWQ8an4J?=
 =?us-ascii?Q?5QKruWc8FfgWtvEBBnj5tdhnvuJ3vuRO/Far20IlKOBz1CA8LWQOgYGqTKut?=
 =?us-ascii?Q?5J3PehlyjftyOfwplXpr+5mf6WVNCSlpFsrWx11YVL7B/ZnahRUMMbp16EGY?=
 =?us-ascii?Q?7rZ1WUYpuO4RNPN1SQCtLLZQ1sbEFY/wV6cJyoifHmujY0mLliYbev8jiTrb?=
 =?us-ascii?Q?J6eipW1wA/T/+VkzoBncVCoiHS7/xYDNV69ixIY3zdGX/d/0wJw/eArNNimD?=
 =?us-ascii?Q?B1lD+Vdu5K0v8tPzw661YAwiqofXiC/nTzzfrUPsGsQZfbiJL8aORepxaNCZ?=
 =?us-ascii?Q?kcGT1Jl9Tp2DVmbSGnUdtyVEM107ZFsoi4nmKKo7YOaJgKx3WSKnGRf4TWwp?=
 =?us-ascii?Q?Eahu/26ZbZFjfCpJAx7ZVl/yxrvydzBknlTll159IKHk8k8/x+j8AhTAlnJ4?=
 =?us-ascii?Q?DLwakhhNc74G2v86Ffd+LT/iep86ak8wYV4vjvd5qxDAJO45wLJI7ynxuxRP?=
 =?us-ascii?Q?GHz/pezuNL7zv5HoMpEOqYyz2PmZF98xVkGLiTFJwcxOYiHB+K+ASQED8XrS?=
 =?us-ascii?Q?Oo6atuvNsO4HeK4vm056eH9nKs2VtR1bzDuBAigHDKXjLL/AkPf9/PXWIaws?=
 =?us-ascii?Q?eKGz9QX8lwIw71rdF8NvBcvTn5BYvTVPQRbq8Lzpl8/g1yD6583yIE6VUQZr?=
 =?us-ascii?Q?AsrSNtjqGsDnG3gVlvkTEnM5vkDUvJnUbsbkWn1s3NFJSyr4sC/gpFH/QFil?=
 =?us-ascii?Q?/y86F1n+3nVJjSOA4Mbp99Cnmg/EHvTPEDwLLgPgRnZN66vuSMKiYdZtKA8H?=
 =?us-ascii?Q?6uLz/v0sHxP1BPXRbPXUuSNYeznGKCXrqqeJ94+Oc560UPbnbCba+tfWW8le?=
 =?us-ascii?Q?oKCqELtfTjKJiuCeLVxSA9hVK6C4mtDeCbEyT1bBiWDwK8dJ7KYJeH+J09rI?=
 =?us-ascii?Q?jcEXeQYnIzr5FboGoVvB/nU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vM29FE4zfDTp865BfrMPOnhDrT/F2hbkld7tOdptga2xOhjdIxNX0V6cxH7a?=
 =?us-ascii?Q?nIA/eTPDJs9BwxMYf6e8lv3P+IimcDTZLg2Za9EzFlFCPpJrKkHp4mPtH5/K?=
 =?us-ascii?Q?EIzc7qL30cXq+0FsA2v9ak3TTCwPBjjrQG8qg0exUWdwjGVGRHYd7/0DHy1N?=
 =?us-ascii?Q?dkSJjop8bSbLyqkMbfGZwv6LUY0LmOwc4ceco2ddXaC+uHKQcMvXXM4GFixi?=
 =?us-ascii?Q?Hj6vUBCWZpYb1emwXFSo2n8BIZ4cNM2N8GP36FHGZxf90CjRqqAO3wdS84FY?=
 =?us-ascii?Q?ZqCFRlJiW8jRTIVPW4O2dyjVAqSHW3TGuXrh/jclTH9t1K8ZFKfHKKe8es4v?=
 =?us-ascii?Q?FsJXW7Q3lFlIJBQxcIJ6+1X+7hp0zgv8VmZoPtdna1nxTkBygRxxROqso+eQ?=
 =?us-ascii?Q?B/J2U2mwytjdIt/UE6YQYnnjbAPuXxLi+0gjGqpaxIxgDBNaFfcfvhR2vmNg?=
 =?us-ascii?Q?jZnS7J8sgkr3qi8rU0TqBQBGc8MqbtsiJqnJ8J5+KYZ/o98evydq0Mf4xQq/?=
 =?us-ascii?Q?CqvuvQzpQnIvSeS2meqKa+HBxqWFETEb2AGUpWig4QQqc6mnTzGZtg0wlV/f?=
 =?us-ascii?Q?R9NrHlSu9QrYzVifPDQkDErgCKYwtW3ZrOlo12gcIbObS86P3JT58c2c04CZ?=
 =?us-ascii?Q?n+iNYxLxTFGYF6BfGli+FXXz9dRdsDKLUuvwA90bBKqsq4LM8Qki3GVWM+WK?=
 =?us-ascii?Q?WzkTTxHnoCaHPZHMMjz8UAPG0BzAx/Ojt2txvvpQ27ar7aXZb0bk1CJtsCMg?=
 =?us-ascii?Q?CQg2udOS0XsjDIw+kMp6n5P08gIt492tk1nweQ31B+AQbJoYDCw6hIOS04o4?=
 =?us-ascii?Q?rdRIu1BzRp7vJdNvcm6dlACxAYL3YCYZLItThjVMH43WOyzB0dmx4PA9WgQ/?=
 =?us-ascii?Q?zFU4YxLq5gB+g/g4jN5RQLZowoVmWeOcyY3OZ53Ctx6KsE3WllWtU4eyDiUD?=
 =?us-ascii?Q?1K/8JyBg+kPa+CQX0VDsZzVKI89phCyk5leSeg4C26aSyIcp9fp24CGdLbC9?=
 =?us-ascii?Q?Gq5tzrwhRX9wF7xn/u8QVrEr7vF+OnGPjCYQQNlbNwmoGr+KLhjhkv4uSKvV?=
 =?us-ascii?Q?YTuJJHgEEaAkmRjJFomhm87uKpRsw5Wjm1EIPYjfft1zRIPRhd7RGTzB6CZP?=
 =?us-ascii?Q?vdMhXNyyuj/JqP2Uy98oDqdWPAZGnW7gvuMoEpgCq5hzmi+JfVKDLT7DyoWU?=
 =?us-ascii?Q?KdK8xa0z70d5eIIdYVo1ZLaY2EiFTDFjD5my2meUpsaE3y3ytDiO7Oo79BNP?=
 =?us-ascii?Q?oSVlBA96uCRZXqX02z2PO4lYh9JWy9ZKuNYozcY+Pn1ozaaYFocn/eJJXVo0?=
 =?us-ascii?Q?BllHLezmOTVWvjoPf9hnHqHF9Qku/1tNGoG4bZd0VNsOVnuz8inTMjb50HQy?=
 =?us-ascii?Q?a8Ah2I08BOvRMcEy0fbB2Ay3JABQyEhta7ZawP3uIpT5KLBAjw5yNObDrfVU?=
 =?us-ascii?Q?4tCpIdni0hl0ITjeqZaqgh44Is1b2tNDK/xiqpYw1YWvbwKAlAqRuQWZM+Ql?=
 =?us-ascii?Q?ahPnfNmRRbTVkfMHIJsX264CjLfS2uqZH5M4urutV6tmouk7TAVgpFBOrdXv?=
 =?us-ascii?Q?vyTGybxKl1Y4is57wy/FDlD/Zoa2Zr6f1GLEFrk0hvh4XPXplAFUilOwuDdg?=
 =?us-ascii?Q?tUWIIyNAC/xLP2pVyJ9aFeJYgdvlxcx9EYog0O9a3t6fRfgpcQZSaz1aSvlx?=
 =?us-ascii?Q?v+vYatGiK4GpRA82Ebc54y9nVJg7lcB6dYYY9GcbYvrEO58s?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa27ecf7-62c5-406e-4f72-08de6404d556
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:48:25.7407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VCeCTfBsmgPlfqcjMBhmnEgbd4hfaZPXxD+/L1t1WCt0fRTWlwlF6Sh17xDTuW6a1S9pRXAJgnq86nys1c4xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11521
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_074831_187632_38FCA899 
X-CRM114-Status: GOOD (  31.22  )
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

On Wed, Feb 04, 2026 at 12:35:01AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH] watchdog: imx7ulp_wdt: Keep WDOG running
> > until A55 enters WFI on i.MX94
> >
> > On Tue, Feb 03, 2026 at 04:05:47PM +0800, Peng Fan (OSS) wrote:
> > > From: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
> > >
> > > On i.MX94, watchdog sources clock from bus clock that will be
> > always
> > > on during the lifecycle of Linux. There is a Low Power Clock
> > > Gating(LPCG) between the bus clock and watchdog, but the LPCG is
> > not
> > > exported for software to control, it is hardware automatically
> > > controlled. When
> > > Cortex-A55 executes WFI during suspend flow, the LPCG will
> > > automatically gate off the clock stop watchdog.
> > >
> > > So watchdog could always be alive to protect Linux, until WFI is
> > executed.
> >
> > suppose only after suspend's WFI? suppose CPUIDLE's WFI doesn't
> > affect it?
>
> Only suspend WFI.

Thank you clarify, sugggest rephrase this to avoid confuse. "WFI" is easily
miss leading for CPUIDLE's WFI.

	"until core halt" ?

Frank

>
> Regards
> Peng.
>
> >
> > Frank
> > >
> > > Introduce a new hardware feature flag to indicate CPU low-power-
> > mode
> > > auto clock gating support, and use it to avoid stopping the watchdog
> > > during suspend when LPCG can safely keep it running.
> > >
> > > Add i.MX94-specific watchdog hardware data and DT compatible
> > entry to
> > > enable this behavior.
> > >
> > > Signed-off-by: Ranjani Vaidyanathan
> > <ranjani.vaidyanathan@nxp.com>
> > > [peng.fan@nxp.com: rewrite commit log for clarity]
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/watchdog/imx7ulp_wdt.c | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/watchdog/imx7ulp_wdt.c
> > > b/drivers/watchdog/imx7ulp_wdt.c index
> > >
> > 03479110453ce78a6a89ce8d351ba9ece2f5e2c5..0ae4c0c00138e8985
> > 4f14edca0fd
> > > 5fa84591c2d2 100644
> > > --- a/drivers/watchdog/imx7ulp_wdt.c
> > > +++ b/drivers/watchdog/imx7ulp_wdt.c
> > > @@ -56,6 +56,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog
> > cannot be stopped once started (default="
> > >  struct imx_wdt_hw_feature {
> > >  	bool prescaler_enable;
> > >  	bool post_rcs_wait;
> > > +	bool cpu_lpm_auto_cg;
> > >  	u32 wdog_clock_rate;
> > >  };
> > >
> > > @@ -360,7 +361,8 @@ static int __maybe_unused
> > > imx7ulp_wdt_suspend_noirq(struct device *dev)  {
> > >  	struct imx7ulp_wdt_device *imx7ulp_wdt =
> > dev_get_drvdata(dev);
> > >
> > > -	if (watchdog_active(&imx7ulp_wdt->wdd))
> > > +
> > > +	if (watchdog_active(&imx7ulp_wdt->wdd) &&
> > > +!imx7ulp_wdt->hw->cpu_lpm_auto_cg)
> > >  		imx7ulp_wdt_stop(&imx7ulp_wdt->wdd);
> > >
> > >  	clk_disable_unprepare(imx7ulp_wdt->clk);
> > > @@ -408,10 +410,17 @@ static const struct imx_wdt_hw_feature
> > imx93_wdt_hw = {
> > >  	.wdog_clock_rate = 125,
> > >  };
> > >
> > > +static const struct imx_wdt_hw_feature imx94_wdt_hw = {
> > > +	.prescaler_enable = true,
> > > +	.wdog_clock_rate = 125,
> > > +	.cpu_lpm_auto_cg = true,
> > > +};
> > > +
> > >  static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
> > >  	{ .compatible = "fsl,imx7ulp-wdt", .data = &imx7ulp_wdt_hw, },
> > >  	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx8ulp_wdt_hw, },
> > >  	{ .compatible = "fsl,imx93-wdt", .data = &imx93_wdt_hw, },
> > > +	{ .compatible = "fsl,imx94-wdt", .data = &imx94_wdt_hw, },
> > >  	{ /* sentinel */ }
> > >  };
> > >  MODULE_DEVICE_TABLE(of, imx7ulp_wdt_dt_ids);
> > >
> > > ---
> > > base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
> > > change-id: 20260203-imx94-wdog-1e0aa14d661b
> > >
> > > Best regards,
> > > --
> > > Peng Fan <peng.fan@nxp.com>
> > >


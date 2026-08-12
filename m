Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF93C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 14:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YhTonx+lHTI5d9eQTorWBvSTHqyV1cdtu8irpZmSeX8=; b=Q7Ng/aK6LRIsDRl4tzQwcLJte+
	vvm3fHq82cDI3KKToN4oQV11z1VajZLT+YNCAJ0xTkDC+q4k/mrHX72rwUgAex3oL+qR2Yz1bcExM
	xWRe4zQ5Bl94aC9w6v/HHTIhmdZsldGBv4TQGi122S4vL58Bu4mmHLyipxgWgWbVViwjQro7hOPTR
	HmPNbhLfD58Y5DYrdOD4o40YKTLUWvi7aAEotxYMV5v7w9dUf/nTl2qWJnZx2DEQ9PuFPBXnLaRv+
	VGFzFZrRMPsQIe2546c0dQZfGKpwR3Iu0API8igHBcW4oM2/BXRaCkdQ8Gl3bTBZL/Qx4QkQOZynC
	n4D8lpOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9k8-0000000GMnt-2t2N;
	Wed, 12 Aug 2026 14:15:44 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9k5-0000000GMlD-2LpR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 14:15:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6OifrDyI6mj0uMh63qXs0XjwpaPTNSmPF7ngIZbL+uZ1J2dGDUETw6A8Jlch3sykaG6aVb6qkfaMEaD172TfrM2UXpwIxi/ZMW7dQa9bN5TU8y1iE2+rEfAzynRaO2B8FaSD9NCL0M6Ephi+z6yfJA8L2FidcDSXVQtNwOpgqldb9xbRczluL3w0vbrkHBVGPO9y7R0DUrjYM32aLTKOzlGk/V0GubUpRPv4fIHGPmVSdznpL0NtsrM0a/c2G3xQ47pWLLBS5J0vTyRJzj9DXPORUsmJeqsLJdNimQAgHzjZ0X9dASwOogeAQKCkEUDhO0AvmcF6CCEKJazHu+7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhTonx+lHTI5d9eQTorWBvSTHqyV1cdtu8irpZmSeX8=;
 b=Z4sSTyYuYIFfpUCwzwzdUIPk1SlfsyerBENOJX2A8EUdk6YtnOXu6b/lFGEU+Z1hLismWZpCgPbFpvkikPKwL1sBnKPAhYE1cTVkvQPJJHccIMSbIPG6TnYDnAWrYlXua3P6Gb9HJNrRmTRMmGRZaJ7Vpxtj6mj3Im/hJQpoQbqJ22YFFevb9bv76+JPEX3rlGzJSDjfkPoPyjYdnUWUDpIazlINmc9x1X1jyolYVWcILv4kIV8YwGUK4zE5BnYvnA7IlUZ1yaHMX3LnIFPdopVAihhrEgRNYcHpIjPwnZDh7McSyNwD7gJN7+Yv4xKgZmPRUJClVrBlkK4nl9dyVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhTonx+lHTI5d9eQTorWBvSTHqyV1cdtu8irpZmSeX8=;
 b=kngcB47BzsRFIDzHophpP4pA/pLgW0WY1YV1uOI+AjbfA+IJylxlpIT8iARmdXomEN0jkC96/WicLYcD+VFwJYidV5yM0feRlgFVIS3gBLR42CKFVmW1DvINfPdRaLDIMW8mZqOLlZeOq7cH0mRvRzQl5ptttZ+NslISOuwxfbKQAGtbr4o+4DgW1n4lt4RsE0t6HlrvxfGAVvM0pcOWqLBhauNR/LJQmjh2JYXhITf9A3Bsj7bXhYb3Kxo65pptYXbwC2yoG93gdYLFJ6JZsZJqv1smAAlaEB7C5fdPhOfhZG9cHwudA/2QqL+eomh2SYuUQdL7TuO3NxC6V4dwZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8832.eurprd04.prod.outlook.com (2603:10a6:102:20f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 14:15:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 14:15:33 +0000
Date: Wed, 12 Aug 2026 09:15:24 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: phucduc.bui@gmail.com
Cc: Frank Li <Frank.Li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: mxs-sgtl5000: Drop redundant probe error
 messages
Message-ID: <anx__MnpgHU-mSqr@SMW015318>
References: <20260812101418.37966-1-phucduc.bui@gmail.com>
 <20260812101418.37966-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812101418.37966-4-phucduc.bui@gmail.com>
X-ClientProxiedBy: SA1P222CA0099.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad375aa-0363-4d87-9c90-08def87c2bde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|4143699003|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: rFWX1hmdATH2hXEqu2DwS9ruz3JUfMoG5jvN4TmFOe9uhW6UjMfP7QGQ4grzIkH1RoHsXKwjvv0m394fnvDH7pkKwvTk+P6DbJSbl13VVzL3ysipGQQVV0dqJbuMj1QqCLGZIq7WRzP4UVKOBgufFOwqJlcAlwyQpcwj3dyrdj6mKqWO6gHeJlR9Rybs7+p2VoUlr3w683IwCc6xsBzLPvtVUb6JmtwJAkizhgAihpDT4+whMTJO3KutqYccjcc/HNav0JPkhYWF2LuStmobG3zoQ7eFCp/6qCsYSorpiEg/LgxxqQ3jyy0JVcODD1IAn54yCeCqIj0X3bNzz4Fm7koVzijtRqwvCUYIlvyqWYBeX3KItpwq8lu35fTUTLy4tYm6xPq1zL8ZjdC2HiBVGzwnjZgJva8ZjcjT7CL0QvfwMyF8/FwKwx9yCi2qt4fIyr2YysuqZn2z0MZUAF+pIfkHHzcyWexsW3ISaKYjEBOOXxXheNpwKZt4AN8/Ps05zrPmPTQuY7MrGovVyrezh3zKKJrSRvXk1MUFTMai+GZqQKYgB0AOJwSeaskZQqYw0f6vh914DMO2exAJOjrGxb7AMXtONSdyHHSoWMA30iPSBs5bHOw1gJQRTnL34aYN4GL+7O31aVJxHw//4XA4qyEcgroW6FufoexupKDv2gw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z5t6pPf2egfN/LjDiCM6/7uJHDxRUgd8XTYSxTPushGZVlN60ZlWP9a4lGza?=
 =?us-ascii?Q?exIDK7KSQfDUlb68VPDMtdhLKn7dRIJHLG9crKUs2lCioBe3wYRS1hiF3YmR?=
 =?us-ascii?Q?ljaOpZE1EaCzLa//hYnPAAIXnBpMtP9shlPlTG7s1Uf260SWyk3a5QX68liR?=
 =?us-ascii?Q?LldOISXU8qXPdqJUkFovUHYgOmVgphwaEBrrrpMvUIxyCRzyY4GSDL08q0aC?=
 =?us-ascii?Q?LGq8vsXa7GbKTb6GZqLZiaEE+rdhSba8vOXLpzQ2IE6FhbrKGu3Jnz98RrRo?=
 =?us-ascii?Q?Aonh3c6ev4qNJqs3tFCOP4I/EU+eH2dB90JXzpS0pxGZytuuoWnbLkgzUW8J?=
 =?us-ascii?Q?ITJqDxPNYWzyHDfG5qpkpZX5kN6I8Bi56cGuP1js8wSMLFhBKzH1g3gKsltu?=
 =?us-ascii?Q?k8mIKZSCHP3xyRcChrQUNlPoWocFW80vXeCfo8U2lL0d6QsTP27yc/eSAtqT?=
 =?us-ascii?Q?GRYxP49QPdRu61+l5//Xaeotavkx+dRNtDmmXIfTDVPENGlObEQL06mYmlhg?=
 =?us-ascii?Q?4XMjQKJneDb9Iua98m0RyP4R46JYJqH3wLgW0HdpP7aQNG0R0XR9nz6VsUH0?=
 =?us-ascii?Q?vCN1zAtUyK4ZwCKsM6c1C1RDzxgCvkQi0cntEmcEx8usi55eWpAsUWC7sGtx?=
 =?us-ascii?Q?+RnQvafCRqNeTrvDiw7di4YSdUt3NWm/8AtEdNGdP7NMxj7Un2XtIrzI6BCR?=
 =?us-ascii?Q?mKpIeYoyCKR+SEV5wdVGyis5phE0vRrtq9Q6NjQfKQH+uixGywtDkOfIQCCG?=
 =?us-ascii?Q?Vh/KedkMXNaVLSwcKGugDte8/fXkDEcRTgHC1azZjTglMc9XmZMWtfzEOgTh?=
 =?us-ascii?Q?ta8U3cn4M4U7DDfjVK68tQI/C584tQk6yEqGNWAMZHJypdg2SU5wtjsiCYc8?=
 =?us-ascii?Q?SWH2UFR7msXn4G/pqErSFn+a2cSnHu34swbQ2w7BHX+79sO5Z7++SP4I5ZLS?=
 =?us-ascii?Q?Fz1IsEaIqr406Te60IKR2CehRTuzRUXoh/xwbhbxbadCh3+ZWTemDfznWv+e?=
 =?us-ascii?Q?1EQGzLqucvF7QvpQ6c/QMzfnggV5Vq159f0W+yRMZ2K4LQqFAlmJYur0E7JR?=
 =?us-ascii?Q?kyt539jdjJorm7+syZDWMqCrU0ZIfYXITFPcYKAM2YuJUgsvvSnmEK3roFrO?=
 =?us-ascii?Q?g+s+F/pBXmDOe2cDnt74d2o1KeRHJWRSSBjlw5uPTVvev70vYda3dlWNg68s?=
 =?us-ascii?Q?6bFvdMUpqFW/lW//Xda8tpMaxVkwXlpWKRksqHNusbBu4E5n0Gh8CFAcmQBA?=
 =?us-ascii?Q?vEP/qm+zcPcDxVDYEHw5eCibxXvrk7Yu7NkSNukb0aTZsQQHizOpN6grxvmN?=
 =?us-ascii?Q?yd+zO7MXoiasTTTddCHRakqOuXKqOqyNpDig2bDfbvAK/G84zXA/xZAF0wKA?=
 =?us-ascii?Q?7dMr26LAnCVV0gV+mnl8jfHUYUyvacrKToVxRC4BLr3FLljdt8YKvyDPqQT2?=
 =?us-ascii?Q?d21TPoz5d1/Pp+myoVs4DCANzkWmXpRJ57r7ZzoI88cZS8JsoJlilJ+JnHWN?=
 =?us-ascii?Q?BP3qJmWpaSXzlGQWtduS5x1YZ7DvcoxNLNuReSpCcDm5yrHGsY0XfM/4dXYS?=
 =?us-ascii?Q?y272HUF1bKt1rbFq2vKfmQ2e0jIpf+1SK3L+m+43T/sBIETvsJ8fCAsx+3ed?=
 =?us-ascii?Q?PJpRqIZ/RxILpGeoPCGqOIll8rBOEELLCP7OClSvvK0oe5V0GYFCPiFjpr1b?=
 =?us-ascii?Q?cw8WPW5U5MZHGVGOI7WT02cl7GmZC6OBav20vFk9pAF/jRuBCEVQp8JHdVgo?=
 =?us-ascii?Q?0dsi2I3Jfl34aVh9Ng22nFxRuyvl9T2jpEwsrBKcnE4iNs41bSmD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad375aa-0363-4d87-9c90-08def87c2bde
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 14:15:33.0946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qssPyoDDHDg4jVbADVqzQr2UUDTnRLq9AOi7UtNgHMoAY8cdFByIWJRHylbqepOzst8vI02o/V5Jn8c7iOhhEy7R6k5L3DnO/yt3lbuiUoeniS+qIqPeXW6unru91vnB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8832
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_071541_600108_CE62882A 
X-CRM114-Status: GOOD (  16.56  )
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

On Wed, Aug 12, 2026 at 05:14:18PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Remove the probe error messages to avoid duplicate error reporting,
> since the error is already reported by the called functions.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  sound/soc/mxs/mxs-sgtl5000.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
> index f1c0e612313d..a253a48ca59c 100644
> --- a/sound/soc/mxs/mxs-sgtl5000.c
> +++ b/sound/soc/mxs/mxs-sgtl5000.c
> @@ -155,8 +155,6 @@ static int mxs_sgtl5000_probe(struct platform_device *pdev)
>
>  		ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
>  		if (ret) {
> -			dev_err(&pdev->dev, "failed to parse audio-routing (%d)\n",
> -				ret);
>  			mxs_saif_put_mclk(0);
>  			return ret;
>  		}
> --
> 2.43.0
>
>


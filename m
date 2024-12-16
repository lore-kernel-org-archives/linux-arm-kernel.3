Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2D2E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 16:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRWmIJpDCGIQOJl5PcCyc0L3sewTEyZxE8ZbNKumWGA=; b=geUETZP8Z6lxl7WkNLZeJVc3kx
	7twFgSzh6e+F0Iy0U/3AaSyGSn531QreBTvpgQjMGGrb7Yi0GlAHuoHAgM7CV5Rh4qhkKyBUrBPPM
	uglCxzg2Bzk8ZPx7I3IBvIvY3GOL26+l6bUD7FrjqtrpTGh9JwXSaIkZgI78WYvuxESXwpmFphB1H
	clPzO2WgShF/wQDcHLOt8mdKFsm6IYmtyJin6tjacS02iMMfgarYX+kL3Nb4kR3uvL+lk0nAoXiDT
	Gp74jfE/5YmHV8KjlgM+Le5eWM+hL3QhM2e6Ee7I6QXT6IauVl75q8NZ+p8dt6oOdm2/bYqnrz+ky
	dTBvQS4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNECD-0000000AdnY-1kYN;
	Mon, 16 Dec 2024 16:43:49 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEB5-0000000Ada9-121D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 16:42:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPKR7gKZNs4R/uQr/eWx4TZsQykVsw1E1ZMH0j6AIA2MMx2+TX2hpoSNu22CDGQNqW0xsdyvdIHTwUsvB7dmkGevh6klwzpnvsbShMJwaRS6yekAnYw7PeMNdQROLJ4rUlI6SJcRabGqgMwX4+85lLvcysucSYY4+RxeacZHy1EKDZ2S9PxAMpT7wsGKgC9DX93mhTYCVuW/DLECZ6/6x23s6qQ4hFgX3Nb+PGLuOeOJI5L5OMjWTzGQ9cjv76cBzZSboNrmgadDzcHZSlDTnbkt2q0sMTnTVjwuPqHXkJenelQHEokRbuWxDB6dn1+LhXi36MfsNsHFvzMwdPNcAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRWmIJpDCGIQOJl5PcCyc0L3sewTEyZxE8ZbNKumWGA=;
 b=yuyYKJu6q1/yicnrNbLmxJZQphLEIntLDbqVK6Mql8JY4Tnb0y+BEyz5kuUJuN8qibmfcKtjdND1PQkBRpymTagS0LA0wiLkVBM19fUohFLdzz53LzvLjKGq24LHq0G1jj8fEBmuW3EM8XWsTaKM0GpayUyb+nWBfOhyWw/JMA04z0E9OtdfVqjypGQhNrveL/skQaj6yjBQ5RX2WjZ3jMnfuB5kr+xTZmJL+X5RO8nl3i4+Z7dWuEwWdRWsJ1HTCJSwEWtejcwdBHQuG9zgtN5oC9vtoZUwJ7TOa46OKF/odpzuvmcYKlmxIMkT5Fu6zvFazsoO+69NH4LkWQ8tHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRWmIJpDCGIQOJl5PcCyc0L3sewTEyZxE8ZbNKumWGA=;
 b=jSG0FlTyC6TH8NEPa1zgYjRcw79+rc60YmQ1lZOVaM3aaz4xJJJDmtBYuIuCFVUFLwQPqJ7xpJePkyD73FLNTckyGXQwsVOppJsbj/hyfn39EoTY3Z2UMwetMIV4kykNLV8bjoJMVw/9ZB592MBBWfqkNKKufTL4Le3hk1yA7Arc30JAr+h+dIid6EmGOx/9VLxzfbUBWvVl4YpGnjTkqIamrbmQpUNpyLHGAfqOXkzY2MKoN4sOOwmzmw0ROhDes3naRdO8+JrXNqk+eocmx8/cV5J23Gu9ROWd32wGOd90AeRwaZBMUAYpEjRNWzEzCHS+NkxznuujVf8TIPtMQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7776.eurprd04.prod.outlook.com (2603:10a6:102:c4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 16:42:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8251.008; Mon, 16 Dec 2024
 16:42:36 +0000
Date: Mon, 16 Dec 2024 11:42:27 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: add common binding for NXP
 audio processors
Message-ID: <Z2BYcw6x3zyeBwvE@lizhi-Precision-Tower-5810>
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
 <20241216145039.3074-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216145039.3074-2-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: BY5PR17CA0015.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d64634-fde1-41fb-54cb-08dd1df0a537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s86Nhow/IDt3rTAHnA7pgP21uslS2no1ujyOFoMtwEpq7jWKo0PoUZtR84AF?=
 =?us-ascii?Q?t1Y99VUakFk8Uu8LdjM72EGB5pM7R6lsTA3ldOK+/wdepzkYgKMiacbDxHTF?=
 =?us-ascii?Q?siOXjLICVf1SisIz4j9E8Wkg3y9JOyLeioybtPYm8nUIVar634IZJVyrOEcx?=
 =?us-ascii?Q?QgjS45dy/fZQv7R2OJ955MT50L6mGPcYf+cq/GH0HC0nnif5vRraIyQmi5kc?=
 =?us-ascii?Q?MsSLSGbOilh0t+TlA1BIdpy5h2NsirY6k7/7dEBjlaIoo5PvVppFUi3aQ1xP?=
 =?us-ascii?Q?Fn32sUUaZEMU1zDgs/feLfw+lJJz3FNwy/sUv5ti58NilziFWWP3fSSxebo7?=
 =?us-ascii?Q?R2SjBDb3RMafD0uyqxRdtap2PSI2M1hvU77SpKUYFC/1QBIm9nBhRFAUQ0iZ?=
 =?us-ascii?Q?6lcsu04JgQMqGvO//Bsi+39pG7BhGK+UT1juGS27SdHIpiHujWMvmfPenxqg?=
 =?us-ascii?Q?cDbd9xQJ7XPt/pSBUzhvU9V/rI1fhNsMKg3UOsKixU6w4nC2X55Lp9m+KFrU?=
 =?us-ascii?Q?+Op8SzzNZ/mJzHWsvS9jGR0nAmEMiPfAE+mUIBlgQpLAdTIiB/8LthC0b/uw?=
 =?us-ascii?Q?JiqXUg+cqykGNUJxfA2d/r/vJnAawbwp262hz3NNWLeW/v94cvITNCsMNpNN?=
 =?us-ascii?Q?DgI5qrD4DcoqRh+dj0TOXZoG0vLbiJGsRIyIvRpKNHSJteyyPWyAqngQjRFh?=
 =?us-ascii?Q?gURqb/LBIsexv6bMA9mYQBT2LQhijK6koc5Yl/tsldIhXxVGH/SPLaVeUms4?=
 =?us-ascii?Q?rHthQU0xWMK+yiQAgi83CPDUKota1u0C6gQ/JJ/ZJxrDUinnq1iWE49PbyhL?=
 =?us-ascii?Q?jS/1C/L61o2FU8krcT0Gfe1gTlifR2/sQciAuQf6/+R15QKSuoMWZTQFWxp6?=
 =?us-ascii?Q?zb9FB+pGoxRkYCCISWFVya2zqyfTQ6Z2lQmUNRzKiFBJlIEStQOMVL8Lp/nZ?=
 =?us-ascii?Q?lD1yR/gaKVNUOxe+Ni43hr4FUbjQrmbbKl8YThZbzxw6oqcGLzmZc8mCSpXQ?=
 =?us-ascii?Q?hiftD4Vq3lMv4vzWD61DoNbFaewYkdBxdYoyEm0s3jyjQzT5Og8AxFTtfnM2?=
 =?us-ascii?Q?uumd2iDJ/H0oOzpZYfgxr08GABjA1KmsWp4fmnDEG4v5jVFihSTCN6g+WXcz?=
 =?us-ascii?Q?34K/01fiiLBoXMjeFYK3ZV3AVWOLCYBe8yKljyPCY5u5B0pZAcuSz3ZCdNhC?=
 =?us-ascii?Q?7QrBb+MEci8x1pzg8gknv6QBuhKjeRTMgvxcqIghnB4mTDHaDZgGxgVxjdBp?=
 =?us-ascii?Q?OS+m4EGXgz1lRXpyEQkiYzZawjEgDM6MgWPZ5kytwu+I3KZWezWz7S2mXHS8?=
 =?us-ascii?Q?2FBZ3WYb/XtQLQfO1xNg/vf1Jwt2cRkEeOnnHcAXwjc0AOzrDm8PHGc4vf0K?=
 =?us-ascii?Q?KQ8yyNGP9V5MjQZq4qIPp2jjObeG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pG49nOTnAlxvTHZpTCJQ4NMeTQhvGbnYI/pTFJetevLxQzisSG0lMu6CTesX?=
 =?us-ascii?Q?PewKdvfaOdxCC5wCiDExavRpCCSEjbIAfiU0XLuznX9ALznEhFoKCs4Nx7Uh?=
 =?us-ascii?Q?Z/irM5Nu5AakTvDdVtpblmrkvFlcfIWhgm1qWWcaRUZCkFrsIK91ITwYTlS9?=
 =?us-ascii?Q?f0mv+s3SoPQyDjsZLkE9acyR3R9wgr4f7KiqzPV8Z2M17tUH64vIiWKGzT+N?=
 =?us-ascii?Q?lETQyfhJ1oJvdFNmhLrbxwCj2G+Goq8Mg2OYjIblnAYImF/kpPc6/tSaIj1P?=
 =?us-ascii?Q?mJvxE3GRioOoropFnjDOnoz7bvbp1blmH9PtH5QK5gMOBGMhSk7ZXCCiwSJs?=
 =?us-ascii?Q?XBBXRmefe1aMOpIpnwDzebHbuM0SsQvnnvJm89HmRGeYlYen1d/UHNO6xl1j?=
 =?us-ascii?Q?ncb5n7YhNCQg99mb1d3bF1l02jbvR9ws4Opd0I6w/hSZ9zJIXIaUOk0YA/Dv?=
 =?us-ascii?Q?emyzKCDMXT9UAyC1wgZjDWZqGb7rndjSvc9efd71WYo249YQiuPUp5tjYWVY?=
 =?us-ascii?Q?9LX+Z80dPUOdo9SbMiL7jE/52JtKrJGFb00RwcBokxBP3iTow/gCxzaPkrWt?=
 =?us-ascii?Q?DeOXWFGHxiVDp0r04QlToyLUkvPy67WEtQAfZMBfuakuVlqa2T5pTpxbq9to?=
 =?us-ascii?Q?aId3a9CTsXB9EcXUFI2X91j1obaRFAPlrArNMhVUwB/FV+x8Ar15ENLbwsJq?=
 =?us-ascii?Q?+Zp7kAR9x0hj7ZA4oYihA0CX/B86WOKo4ppqHUAZxzWIXWzo2+VaXwRnvGnh?=
 =?us-ascii?Q?kim5Cwmh4cF1FUHdUFqTe0htfEhMvzusCaxy+wx8Axs2YUlqh+yJYhFVuAAo?=
 =?us-ascii?Q?fP8rfB6Xd3sOgLUuJa9sczLu74BJiGX29aGBt75nI0S7dmOM3Vymu6ZTnrxS?=
 =?us-ascii?Q?i1rANTP/IhJTf3+n9Pw7jKm2CIyfTRzNQXVO6RExOo6AWBlKGKXs+qtXy8C+?=
 =?us-ascii?Q?odzPMhD054w41gOZKTKBGME7pzvOihNKiHeJl73gVx13Jb4ebWek7+p0tGQZ?=
 =?us-ascii?Q?2ch3rIjGnjjItzEot7OS3zqvLWf6iAinK2ygPSWITz5/X+b09DKVaeIVOojO?=
 =?us-ascii?Q?2P2K/wTWHqJ5YVeh/MBhn7qRzsZ8LVyX2KaajHoSFF1AcjDXGwBkoIXnTdku?=
 =?us-ascii?Q?J+WzKfYdOosxHvnebV25nn4CuSEnRRZso3NWfgp2tjruPTTaBTJO16ogpOsP?=
 =?us-ascii?Q?j+DHYiFMgGQNTdvZdYlLWQGwHl4CMQVBe2gWrkwzXgRx87h2lMPg1sxJ/lXU?=
 =?us-ascii?Q?/nHFTNCmbxGnaskUDSabGE5KI10r9tc3dXSa3Pw9o5k3FX8dzycbe/ODX4n3?=
 =?us-ascii?Q?pCDc2vfeLFPUoS2g+yPXjk1AVRCOUo/BaLBa8Tos8zBDFfJbPqZeKR2frDmF?=
 =?us-ascii?Q?j0wqefkwzm02bQp9wusaOvk68U2uYsxTJLX2VjRadcg9lmA26X5v1rg8VGtW?=
 =?us-ascii?Q?wfBOWK6rFrFgDuga3YFLE+qNza5tBIh2I/BzWsZVVfsqwyFs4EXGibp8y3hV?=
 =?us-ascii?Q?rQgUpZJ3e30YNgygczjOPKFiAqRMFxKEQBo+d4JYIKfZz/3BVqQiC//bFQIs?=
 =?us-ascii?Q?xUNF8sgxUT3lQiO0wcvzIk5E14ifdJruvzkswAHW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d64634-fde1-41fb-54cb-08dd1df0a537
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 16:42:35.9380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSOE+POdaZbiIbzWy8U1tDgKpdbpUIdapIhEDch/Hy7rEzbs1uGgns9w3cCvtSaXiMdLjXVT+zvwt1gLEPgwnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_084239_286143_A06B51C4 
X-CRM114-Status: GOOD (  16.54  )
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

On Mon, Dec 16, 2024 at 09:50:35AM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add common binding for NXP audio processors with Sound Open Firmware
> (SOF) support.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../bindings/sound/fsl,sof-cpu.yaml           | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml

You create common file, could you please change existed binding yaml to
use it also?

Frank

>
> diff --git a/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
> new file mode 100644
> index 000000000000..1958afceba75
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,sof-cpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP audio processor common properties
> +
> +maintainers:
> +  - Daniel Baluta <daniel.baluta@nxp.com>
> +
> +properties:
> +  reg:
> +    maxItems: 1
> +
> +  mboxes:
> +    maxItems: 4
> +
> +  mbox-names:
> +    items:
> +      - const: txdb0
> +      - const: txdb1
> +      - const: rxdb0
> +      - const: rxdb1
> +
> +  memory-region:
> +    maxItems: 1
> +
> +required:
> +  - reg
> +  - mboxes
> +  - mbox-names
> +  - memory-region
> +
> +additionalProperties: true
> --
> 2.34.1
>


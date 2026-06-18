Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057F7CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 18:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNIg7V/XUswX1bGnpw3dfzGDuqQh/RHqbxpQDaCpYcA=; b=RZekvgGPJjacwWrb5Q7583p6Lx
	w5lS98roiNb2sXSH5xD13qAlOXaU1zC472zkUXsgffL9msbqVOIQ453+NEsGJ9M6bV1EUsisSRSZP
	Y00c05Myu+awjS43LM9GpgBatFe67PP8yk1o/eVYzw0KH5gfU4kDQGWJUcSgt1I60mvydjt2gv/7S
	BW+33/rjqIdTW7Ae5We8Nm7OkA99O2Olk2LgnYH3Wl9kqHhHFBX9oIJB+G95OUK9BEE5mIPhSUsFy
	TxMZ7k1G/SOj68+A4ypeLk/6IDLybxEDtHv/8+zBDVPsPDfmTYmrG53pKjfDSi7QHN6m3CCAaOZdh
	T3EDfUwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waHfW-00000001hY8-1e43;
	Thu, 18 Jun 2026 18:40:50 +0000
Received: from mail-westeuropeazon11010036.outbound.protection.outlook.com ([52.101.69.36] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waHfT-00000001hXk-3rQb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 18:40:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUqfXvxrzFZBGdUQHJaIoG1dtGcQPaKdr8t3qENJVIGBYPP7cZ26gASyEgDX+GBCTv6t3q21kNxp7ZwG7quQ70AzUTOeB8Muy0JtLtrc9Eh3Ygkmm/g28zuGpUwArheBBVodDuUcaah7DO2iReR72xVuySgmPxmd4nKkxTMWozy1BySXIUkHDMY+fB/WqjuSdVX8/iNFYAgWaY9DpHGqaywzslOtNISCoy0vSLEXrCiSXomCZEFOHr1EURgcxdpQ7+tC1pbx7B89CpzMiugSM8KKNfy0xjzAHz847uF3WNcWBpff34bAdATCAReKU5FKixpAAeWsHwEJv5hnVomTAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNIg7V/XUswX1bGnpw3dfzGDuqQh/RHqbxpQDaCpYcA=;
 b=JcJuEVVICfOeXAARbXlhrKtmcR1ct9sKqSs7E0g8RKnVRs4v5jKAK9RT9+Fx0BdtqehrpIg+sXm94CTpF+XEnAC08/0JcXZK4YTsTIy7Y30kgl8V+4SeoM9/Yw8SjJUZkphJINtIPgbPOpXZltmAdcWQpZMh6OZhDgr97Cs1M4iwCny2gTy0Viq4ESZJfqPLquypsaeIUbaM2sCO2w1TxHnhDeII0gP6Tri7T3okFGshby92/69+kYYoaEahurK1wPzsg27toozOLFy8S8yQ11nK1bWh/k4S3XgVw2gChU2ZQ6W85zdOwkKAMq4NtwtG4M4hNOnyEdyqtS0rgVEjzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNIg7V/XUswX1bGnpw3dfzGDuqQh/RHqbxpQDaCpYcA=;
 b=GAh4ti+3iXeTDIWST+Q8+yN7YzG/rIXyy1JNTgnZn5R4PGlbFfJmMwW0Wta4Q3RdoaQN16ODYDLLDAeGNX4dsrgnEzo4f6UF2XvQtaehvz4nOYa2e0c+S1Bo9fqaszkcx34wjqymqrOKoXu6cjgwtdcG8s2KCdCa6Bl5yI7Riy73ho0rA+Dl1pJRYaV4s9oTFmSa0r7S5kq/BF0Am9k/NlzvvyIa6Da7zH8x+7urtlxCC1mWDWXCY8PfjdQ3WXpulFa9h7jZpp/U8S25mysVXhBeIgATcl//c3ZxFty1Moij7D1ys15Mn/+O029g48SMj6gWcwRS14oSd5V7CrP6xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VE1PR04MB7230.eurprd04.prod.outlook.com (2603:10a6:800:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 18:40:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 18:40:43 +0000
Date: Thu, 18 Jun 2026 13:40:31 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v10 1/4] dt-bindings: clock: imx95-blk-ctl: Use single
 quotes consistently
Message-ID: <ajQ7n7rgVAXzkM-L@SMW015318>
References: <20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com>
 <20260618-csi_formatter-v10-1-f23830312ba5@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-csi_formatter-v10-1-f23830312ba5@oss.nxp.com>
X-ClientProxiedBy: SA0PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:806:130::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VE1PR04MB7230:EE_
X-MS-Office365-Filtering-Correlation-Id: ca69369b-c91b-46cb-eaf9-08decd691a1c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: W2vdXcVm6Idnq2HHF56TVyeEtRvPVGdfKHkWoQ/39FYJzeJeSkUY7JyV6/FkzaMXEelMA9+Qlea6sxDfYrlN5nI6cM8yD1gIeBhh6zTtQujs+FzVThoTxfeiiVFPc8Pqt4Jilr+iAPr1jMlSy1QceegS9OZLdBvpujIJ/7NNxhRbIRzCPhlIiSRbKaU3oIujkqg++772QOdJ6d811xNigMy5H/1bHrgGjDofDRzZH3gg4L4pmdeQ2yh3/JiGcAUb4oCOx2A2NR86ESn8uZtssuEuXnHRjEc3BZPkg7YtRC+n/pTylNRkoyPilorbsviIqj98aF8K0DdfC7hAcm1+fcTTESaHk/FjTmRf/R79trPlXUHz1gHwGBhg6cCqMieiA0LF+Mlt1Pse8u9N0zJ9TiNOY0bpSRMy6pT6Jz0geb32105xljiN+3bDJzi1CTNzXMtgEzR4TS6b8rOhAvdJmejdfkD3ymV9LVqfyDeIPFvYLQTVHvZmGx1sN4rQP/K21YMYdSquhS8Ma8sesaVJAXRg2+/+lKrsTH/Quuu1f04ZqrkFmW3H9K6VfFEbbyqKVHgyh2OHH9i0ZrD8n8sOMt5P7SxDTrtlYjQOWBIpya883C4qA5/oQ0dVhIafLWbYiIdCqR8+H3l0jzzi/yKMESuuW2/QV3kVefAe83ReSMHeTN5ZxnaNZ+DYF1jfu67d
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ox8qeKTz5Wt4rL3OsaalxuJ6T8uhG1D9ra91rfiqwKRGFgSlAkVCDJIb2rgK?=
 =?us-ascii?Q?1q/1j+CIkGPNvOhWfr6HM+Jv8i+St4qHZbXQH8IWgviCD30BdLR+lI6dVE7Y?=
 =?us-ascii?Q?6TGf95V8UFJ5Fy6nFsA3cQPOXVQWpB2EqiDYjm6UWdfgzdsqdhAAdYL8iqsN?=
 =?us-ascii?Q?D2Ay0mc8KP09SU9aln9j10zC2bwh2S7FJn4eBw3bcYB/4Qqg7l9DuFMhi/2O?=
 =?us-ascii?Q?SNKUSe4GeG19gFrpFx1K1d5AQ/TZ4D2Y3myArEZK6aYL6ARe7X7jGAoKIADv?=
 =?us-ascii?Q?/JWTidppQ7cXNy5Fo08znWYioSxAmX/qiqjwOszeE6tBQ10cdCa1MMYFPJWO?=
 =?us-ascii?Q?O+2ZugMSSqVIMv//ffB5RHjEfSusGtiKrn+C2QK6WamqUxbuYm/fuyWroDR/?=
 =?us-ascii?Q?669LcSBY1MlfBVsxgelq6tDkdbTLwItspb9KkB4oQrcdhnNEkEzFwhS0FCr2?=
 =?us-ascii?Q?uLPhDlyheBxA1zzCvwB0bQaeZDaDWcFklBXJigD5xmyQbAIe/DGN+oxm7G28?=
 =?us-ascii?Q?TiNbqlRTGlE+erl8NBqUQIDhBZOfGrIMErp9XbafZ2TjFjS13sbi3EvLGDFv?=
 =?us-ascii?Q?qYLLWdoSuqFSeTAADCR/mDS8EWKS36TPmq8n2dVLRE83WYYfSfFzVmjOLxZ9?=
 =?us-ascii?Q?IT5y0TayRg2tzKAhCJQQzB/47gf+OGY+jQRhaCR3cpWm1QBOtHJa84yYkxbM?=
 =?us-ascii?Q?A7vDN511MC/Mm2iuKJdaYSn9s5M8aeZYKN36TGds9ZF3qJ70l9SsY8sQXR/3?=
 =?us-ascii?Q?s/sMEFsff4EtLCqXsjyz2TnIzf+nietWjfVH3XFcUJTprNnXAf1WRNAWkAwl?=
 =?us-ascii?Q?EyNPsg16iU5u+zqau5g6aO2jJtFkB2hiK+EQI/d1YzzHA6ZzPaz8soGhs/lJ?=
 =?us-ascii?Q?t8/r3wiHZ10T4eVXNZIp25j4cNVFjVxCqo1JOJfKWIBgRVffayGt0WG+ywS7?=
 =?us-ascii?Q?hIZE7vYbkicGG4YNE1+53t7W/NjUIlbYH3/rP6Rhaw8aKrUgyhD7eBFBwFbE?=
 =?us-ascii?Q?LF/ApxWTrcFIiTboj/RNbuPg8NZkvARdwrthQVDZ1JvwBO5Fzvzdp3F2L1ie?=
 =?us-ascii?Q?aTJi5SqqlpEHNeYxeNkA0ChcbhBFlcAtViB/mKQWMNsYv5hpPnJo3LZJ/xyp?=
 =?us-ascii?Q?tVOFdXLY7sQgiLSDXMEBcigInhSEYHApLdIPthJ/Y71ufQDih4Prltw1qcW2?=
 =?us-ascii?Q?PjDbpIxzlyyk34htEhMieYkBEuAk/VONuzzhHsbv2YB8GGYbUN22c9RLgxMR?=
 =?us-ascii?Q?wgFi8BgxY+geaKk02BPM6xDP2g36zOHkom0zSJWj+doegz2/jTfnt4EdeDvj?=
 =?us-ascii?Q?UGM8f4f4u4pyrgLyDy1iArWwIZEiWnn9rPdCYU6W8MG3rX1d6kU7VZKyKMf1?=
 =?us-ascii?Q?WAPftvPxIKaX7dfOqRbRyJavzvIT2sxgzzuV05dVM1fG6mwEVac+KI6gqJ8R?=
 =?us-ascii?Q?SBF8hVNyVowl5uQNWIMvt12h12N13PamTR4Js2MXR38YfubmAYmfP+xPlek6?=
 =?us-ascii?Q?wt+EI31Z/7G53MG7g4a7UFXXx06/1dt6dnIHQci3QTAzPHxY+GTZ5alQ3Fw4?=
 =?us-ascii?Q?HzYDgunpTJ78/j5BJHQLPaanzuRkBczQWXc7jzQj9mlT4y2w2TF7c5DKhoaL?=
 =?us-ascii?Q?XMibFNfJywSl7U7a/JYlikvwdxzDsy6y+oeMHxyFhlLb1aGtnqzVJJGboJ/c?=
 =?us-ascii?Q?hN+wSwCCcd1R9I9yc/mGNJlUcv73tn7tSg+J6TFevrXH/gWj53V/ToDXn2CX?=
 =?us-ascii?Q?8dUfI7ICDO3Np68h6hhSOBEDmlLCYXqXBCc9jgED/iig/DYXn4Hr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca69369b-c91b-46cb-eaf9-08decd691a1c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 18:40:42.9333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eb9PB859O6NuIGULzbeWXk3hVOu1BFMqtKVWokxUnu3Dpv85P9Rx8fY4Ac2c8mC5rII93ZfaRCXhr3a9opCn+Y0D5kHJv32zYAwXzo5WCAAdnY3MQqxbSawlNIYB4gWI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_114047_987843_4393316E 
X-CRM114-Status: GOOD (  17.46  )
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

On Thu, Jun 18, 2026 at 05:41:35PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> Change "clocks" to 'clocks' in the description to match the quote style
> used for property names like '#clock-cells' throughout the file.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v10:
> - New patch to fix inconsistent quote usage (Krzysztof Kozlowski)
> ---
>  Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 27403b4c52d6..534fa219d9f9 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -36,7 +36,7 @@ properties:
>      const: 1
>      description:
>        The clock consumer should specify the desired clock by having the clock
> -      ID in its "clocks" phandle cell. See
> +      ID in its 'clocks' phandle cell. See
>        include/dt-bindings/clock/nxp,imx95-clock.h
>
>  required:
>
> --
> 2.34.1
>
>


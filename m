Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B95CCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 18:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNSwCTSE7ZJmDSnP0F1lFjJxCwM0PTlvzf5gVPH3t6w=; b=Ao0knZRvS7KAdYn0vSLC4NQoJP
	yLPT+HzQiZXGMCgd999N0pjkRL5dg4f4IjJzXdOEE61CTSObL98+caPAsUjmsCfUK5go4hTyJNdrC
	a6D3elk4/aEuyYzskr6InB3QJdNHk+8I90h8gdd44Von8AA8HYtg4Ekl1a0/VxxJIHQfiScTINVrd
	cRzW6Hd9hi4n518WjIOFsGi092zqOpRN8Z2M/Hp1n1+/dNyVBcEOwLqKmq2vTJh4Qn1doJrJgShY/
	VxivFDq5OmdySTTWpGqPOKze5sGT+NiiTFSRHSKp8N+fSbIuzufn8OJEU+SQelGbLaIsIcMM10NJE
	RUOiM0+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrxi-00000007GbX-0jZl;
	Wed, 03 Sep 2025 18:12:02 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnyj-00000006f3y-3o6S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:56:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFzEp1WLbrtZUWbOlDsgN3BpJNStZy2h7rbDp+6+EQknN9vLRYR/reg8lZwdTbhlf8rmkmJFO5d7DNuJxjQcG+0tPy2131ijW+WwlidTeCWxZWexE2DMkGBvC4QpRMG6L2cM9y9281f6hF+/TCh+kOXYBSUdu323b1bjEGAz8KxIi/2wCKCrlppD+1fvtPqV2t+F3RpVgBLEn2Yid0wrzDKUgeOIqLlzJCdE5oFyRHRlY8yp4dZ6C4diyE/zRtBmMJPW4i/BnI4TB4P/Z1+JRbe6J8toDf4FpeN/wZMxUz4/IqofPqbMwRGHvfwV7hSBJgiP0Flc5qHA6JpoO7a9xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNSwCTSE7ZJmDSnP0F1lFjJxCwM0PTlvzf5gVPH3t6w=;
 b=JT/nR//D/wG+3mp5KTZWSc7Gp7y92ZOyIA9eDWpHoNheYOS6Gstx6MGcaf84dmzUk1MCLHwrR4k8kXDC0Dkzd+u9CE5ntEubftdkeOaRGmMHhdycOYmObg1ZAQQBzrEJ3Z/axuxaw3rZfWTWllUyLG+jyTZHFxT2vrOWQxu78tUCV0fbBDaTtl7/pUhNjXgny+4rNgitgQVJ9lWu3BjxmnbI7KveW6KBIX81ZXOG+tGKEDE+a4cNuJ+3h3gAwsNZ6kpvlJARgX6ueXTF471DRcH6cZ45pvAHQDTGiWbkguTliyL0G/D1TSONt63kigQm985ysMRUHDdajsEukc3PIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNSwCTSE7ZJmDSnP0F1lFjJxCwM0PTlvzf5gVPH3t6w=;
 b=TDW52rYPyEapf64KTucpD9Sse2GuRP/um0qwMaY/r8Bgi1teftbboiWesTP2JzijgDvzv7wlwGA2iMXTV408ZzPt/W02O07yD6wOqsSsnz/KHQt1DblZkKP21ZozrfigdB8z17r7zuqYPZvd610dmveJlFZ5JOEV59e+gg6fcC9hY4aozKRgFXx7WG+weTJ8IG6db4MNsN7Mj0CvAEMf0Zh6waNxCdVax1FHBdEvmqOTN06k2LZ/VcTDJDQ3A3fTXCVuSo+v8qy2xbVw/+bGawGnGWrKqXrntmVPYcXydzLJ1HKIn/Bdswl32w9WFnU2ntdij9X9MmxC16RSsRAdwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB10914.eurprd04.prod.outlook.com (2603:10a6:102:480::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Wed, 3 Sep
 2025 13:56:41 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%7]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 13:56:41 +0000
Date: Wed, 3 Sep 2025 09:56:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Robert Chiras <robert.chiras@nxp.com>,
	Zhipeng Wang <zhipeng.wang_1@nxp.com>
Subject: Re: [PATCH v4 0/5] media: imx8qxp: add parallel camera support
Message-ID: <aLhJDXnz9HPGrWcp@lizhi-Precision-Tower-5810>
References: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
 <20250805010822.GC24627@pendragon.ideasonboard.com>
 <aLbcpEZXm5G1Onq7@lizhi-Precision-Tower-5810>
 <20250902123920.GM13448@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902123920.GM13448@pendragon.ideasonboard.com>
X-ClientProxiedBy: BYAPR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::21) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB10914:EE_
X-MS-Office365-Filtering-Correlation-Id: 285dd11f-dd27-476e-0d47-08ddeaf1b569
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MjlVgE1fozt6yuMDBU61NHU2pWshbqQTkHXsthT8xQVv5D5nEyWrUj42uaQX?=
 =?us-ascii?Q?nl+M5TRzv8UvE0UFP/2cIBOCPTmMoYhVj/T1UvLI+r/knXXt4agcVxinVQWV?=
 =?us-ascii?Q?FclB2J3uvNNzSMt8JXW4Ek7HMgXgt34kvds6Xefh5la5otoNB4Sf9yV/TwHw?=
 =?us-ascii?Q?kBrV9qg0OFW2EIglgt+JkLTTn1Rz6y7N57IeID4D3FMvC1YdCp86LMJED1Ky?=
 =?us-ascii?Q?zLmPqae38nKFqoqcIXS5Z0Qyuq/NUBzWP9zrV14hKVcv5xumvciy7e2HX020?=
 =?us-ascii?Q?2qPknN0g7a2WGh1k3ZGTykSvW6yEjilWvRU2M3EGWnALXw5FPNjnP5aCM6ni?=
 =?us-ascii?Q?KH9wea2vqj8vBixjGzVPz8vBQzaldkGGPMJ9B3FhSlZjRkGf4AjQj7d9XHUw?=
 =?us-ascii?Q?hEj98aUFFS8fZKLN0bH+uQExKwZpVIzPi7tCqzWWDzd5JBeCpbYQl0eE4Syp?=
 =?us-ascii?Q?fJ2ijeSp66PY6vD7HQpW7lrxnaBEg8MW6pM7Lq4NWvoiivI6ggnO3QesreaP?=
 =?us-ascii?Q?iKe+7nUpXazxQtp+yapXrDUvwYM/lkOsKFnyZzS5ZIlggZgv1DeIdx2G7Dmy?=
 =?us-ascii?Q?s2QK+uj+Pmd1f+MTk8zD+fs+vAY4GCa76YNqBK7YEB7acTd9ETQ1kclvFtYb?=
 =?us-ascii?Q?mHWdOnvxNmoMOetzu6W8fc0r/oMnO5EI8C1Wv41IkQd+VsyoXP4lq/ZjUnAA?=
 =?us-ascii?Q?6yR0zcKDYqWKsV52of0Mp06JJdxT2SBA1Zj79+cg5FCYdOwxCa2yQ3nV4dJg?=
 =?us-ascii?Q?6r3Orh2norAWPm0Lbh7pzM4KOz2ewMJN2rVx99grFIG9FshSLX1Xq2PphrkT?=
 =?us-ascii?Q?Z5Jv0zTObOI+4450ry5z9T+iUtCg+bpWTdF79CObIXxFrCvwLGtTXOaFuCSy?=
 =?us-ascii?Q?AsVqQJ7hZrXxHSu7YzSCfAkmUZJzsZ0P0CeH5fzFZ6tUdfn1PzNVkAij/DDb?=
 =?us-ascii?Q?vouqnr7/zCn0HV9rGWnSB3vAG03s09PTdY+wtwVla9yEGJbli7x96QBr0J40?=
 =?us-ascii?Q?xqwuG0+x8ujLQbGykUI9C2igUmm3gdYtM6L/Splyq4D7YFSC8k9dwaSv5TvA?=
 =?us-ascii?Q?CcYT6hBBJFcAMqznLJB/xZAoDCAn+JOBPexw0v9g5smJuRObWeUNbleeiIda?=
 =?us-ascii?Q?ZWDp1CgZireeGVF7TDB0Mb+YN6s3ilwDGSzImCNYQRZsUBofImXgVm1pBDeM?=
 =?us-ascii?Q?0j7Y/xkbQFXaxYJ55Mu3ylMgdnIDZCqlZwy1lzacj/Hz1CHAMRJb5M29ANcL?=
 =?us-ascii?Q?xpAhqzZEJ6vuYsVx2Yqn3CCgNVK+9SIMBKqHYx8DApKeNqvp26Pi0Pl8pUkk?=
 =?us-ascii?Q?UrFVW/P06x7VTQmhqzGgbr8345eGYc1y6j/F5eTRVhUzV+MEP6hKEhtNnQze?=
 =?us-ascii?Q?1OPnADQUmddFCiPbF/9wkGlHMUvAJagLD9hJvvVK1gjg7af5jE+dmw0QkPyh?=
 =?us-ascii?Q?rNlw81Gn1xta8fP8/W1jw3q8+emd8N0ESS3xNWJ+cTUCYJ9+CJhbRN/Wdaww?=
 =?us-ascii?Q?w6I/5UO6YK5yYbM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DmRqAn/FdNhSzHQGqaSlnXic32zTRSyG9+BXE5NWg81IM/ryzcXcXkUErbg8?=
 =?us-ascii?Q?brbP7tvuIcJlA/qaDdnjC3BljkwxmM8ESHSNBKcAITS70g/mu7uQtTg6gNO/?=
 =?us-ascii?Q?c8PYRBrKuxbuMuxPw91pLOQVk6YCE7ETmmmzeWyx0t1DQAzZQeUHvQWETrwd?=
 =?us-ascii?Q?/D/TgROZ8xDtqZNBwLqUNw+OESjDnBDWk2QmIz+5q1LnLD93psYWQTo8tmLu?=
 =?us-ascii?Q?1x52+14a5jjD59umomdmP5oamCI7bL9nyTObKnpE6YNxAGfjzfmoclhUdjNr?=
 =?us-ascii?Q?d9Gqz/zieqEUVtL4bO5j5nrvr6KcJJ+5lK2u5hKTR+N+An/AwOgQsy+S99JZ?=
 =?us-ascii?Q?P4ELhqk27VqxXKnTDXjVF63UfNJT+9OPUuC7B5YYCinqMK0HyPLLxm4KoaN2?=
 =?us-ascii?Q?UQE4a2hNJRXftl5L+Iidqmo6WTRn3ys8Ao3J2Vt5Ju6Dudl73bhCzQpvRfxW?=
 =?us-ascii?Q?q4EjUccbjuNagNE+LfFTCL/e7W4qXmZ6LtQHPiGN8R98AljTSKABqfX9qaA5?=
 =?us-ascii?Q?NJ6k7snHH4fjUhv8ETk15TU0/co4G9cvOyuKqwf3z15bBZ++tMC39M/Ve+hx?=
 =?us-ascii?Q?9Lw7Kk/Y2B32dmaGuhgzXy4/IubAf4IVw5IMi+XTIFFkeV5MvOqiJQlwGMfF?=
 =?us-ascii?Q?lYa5U0JzrsZFW8Tt/hSSDl5RiOA5oBClMkO9ji7bqB1zp5jWzCKDpr3GBQLt?=
 =?us-ascii?Q?ZXCYq+1/MlmxfJmSLSfpiCpoCMrVF1Mahk301j6VfhQQg8MNLBTEC/IUucaf?=
 =?us-ascii?Q?Hu1sGdQhykTn/EXQSjNKouw9l4xLVdcN2RsLS0gUcTPeu6cJX7TPFc9JCXpf?=
 =?us-ascii?Q?vDXBDcgnSyT0aQexVfr2RkPjWBqL3mr9YAGaEer/V2SdwRFTRc1RYy6z+Acj?=
 =?us-ascii?Q?U86Y6P9HsZgQ2/hJI0av8Gk19YKeTlPfJjkxUPO9mStbJlUZ9BRPzAavKNKy?=
 =?us-ascii?Q?iiQOX3NPu3iBRhFHvjTEWswdFAUwYFaUFj8D6xG4y/0O+DDDQQzSm9pKpY33?=
 =?us-ascii?Q?caZXRrMBLIwSgLbGQYvacy2JJdoa8+vHxeRSW2drM0wfdutzgZNFPpL7GAtA?=
 =?us-ascii?Q?m84LeOoIcjH/hDaZQqahUoqi43AdqsBq4Rl0Dfx3uHfHF6jC54s21DvuOw5x?=
 =?us-ascii?Q?mpTqPHHpXeE4K+nT7AdeyErR6r6QGJMNTG5OaRX5zvVnis3m1VROPfwled7m?=
 =?us-ascii?Q?onfpdOqsTWOlTg0cIRjAVZ1pXCLLTSIjBJKbyc5aViTU+Kxqq5hAB2cAPBtN?=
 =?us-ascii?Q?Cow5HDiCwQzr3JKP5fEgfYlSVqzz1Z/hrtQJguvaklpfMW6iTrI5d/adK8Ep?=
 =?us-ascii?Q?Qyupzx7CPKTOdjauvw2icPc8BTJQ9LZca3AxPOXKxT33aDpLiEYYppE555u1?=
 =?us-ascii?Q?hXkfS963yB2Mj5rn8ksggD/ouSeCMJ3/HIuRkg+k8ZQp5sloepuIsX8rx7fi?=
 =?us-ascii?Q?zZkCg3uUZyUG8xytSRe/VDwu+D2cmF3YdbPTNfFFZbJIpRJVFRA/2fDFRL3s?=
 =?us-ascii?Q?5Mrgt+9VW3iVNrlhKcHNhacaDTX5K3L7XHq667L8xK/PkqfVagBxFHpXCUbe?=
 =?us-ascii?Q?tZ4x6KK1vedDf0iLsh0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 285dd11f-dd27-476e-0d47-08ddeaf1b569
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 13:56:41.1959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JU/kf0EaeZOY1QW3t+stlt9oauGq/+7VD5LFiIUGuKtjrcn0NKDTUxJqDXsRYhXTMvWYGbazGn2NaCnqqu2wIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10914
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_065649_958224_FB59C8BB 
X-CRM114-Status: GOOD (  33.04  )
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

On Tue, Sep 02, 2025 at 02:39:20PM +0200, Laurent Pinchart wrote:
> Hi Frank,
>
> On Tue, Sep 02, 2025 at 08:01:40AM -0400, Frank Li wrote:
> > On Tue, Aug 05, 2025 at 04:08:22AM +0300, Laurent Pinchart wrote:
> > > Hi Frank,
> > >
> > > Thank you for the patches.
> > >
> > > I've quite busy these days, and I don't believe I will have time to
> > > review this series before coming back from OSS Europe at the beginning
> > > of September. Let's see if anyone on CC could volunteer.
> >
> > Laurent Pincha
> > 	I hope you have good time at OSS.
> >
> > 	Do you have chance to review this patch?
>
> I'm going through my mail backlog, which is really big at the moment.

Understand.

> I'd like someone else to volunteer to review this series. It won't scale
> if I have to review all NXP media patches in my spare time :-/

Yes, but none volunteer review this in passed months. Expecially key
reviewer. I am reviewing i3c patches. but Not familiar v4l system yet. It
need scalable solution. I can help filter some common and simple problem
from beginning.

Frank

>
> > > On Tue, Jul 29, 2025 at 12:06:21PM -0400, Frank Li wrote:
> > > > Add parallel camera support for i.MX8 chips.
> > > >
> > > > The below patch to add new format support to test ov5640 sensor
> > > >    media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
> > > >
> > > > The bindings and driver for parallel CSI
> > > >    dt-bindings: media: add i.MX parallel csi support
> > > >    media: nxp: add V4L2 subdev driver for parallel CSI
> > > >
> > > > DTS part need depend on previous MIPI CSI patches.
> > > >   https://lore.kernel.org/imx/20250522-8qxp_camera-v5-13-d4be869fdb7e@nxp.com/
> > > >
> > > >   arm64: dts: imx8: add parellel csi nodes
> > > >   arm64: dts: imx8qxp-mek: add parallel ov5640 camera support
> > > >
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > > Changes in v4:
> > > > - remove imx93 driver support since have not camera sensor module to do test now.
> > > >   Add it later
> > > > - Add new patch
> > > >   media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
> > > > - See each patche's change log for detail.
> > > > - Link to v3: https://lore.kernel.org/r/20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com
> > > >
> > > > Changes in v3:
> > > > - replace CSI with CPI.
> > > > - detail change see each patch's change logs
> > > > - Link to v2: https://lore.kernel.org/r/20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com
> > > >
> > > > Changes in v2:
> > > > - remove patch media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
> > > >   because pcif controller convert 2x8 to 1x16 to match isi's input
> > > > - rename comaptible string to fsl,imx8qxp-pcif
> > > > - See each patches's change log for detail
> > > > - Link to v1: https://lore.kernel.org/r/20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com
> > > >
> > > > ---
> > > > Alice Yuan (2):
> > > >       dt-bindings: media: add i.MX parallel CPI support
> > > >       media: nxp: add V4L2 subdev driver for camera parallel interface (CPI)
> > > >
> > > > Frank Li (3):
> > > >       media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
> > > >       arm64: dts: imx8: add camera parallel interface (CPI) node
> > > >       arm64: dts: imx8qxp-mek: add parallel ov5640 camera support
> > > >
> > > >  .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 ++++
> > > >  MAINTAINERS                                        |   2 +
> > > >  arch/arm64/boot/dts/freescale/Makefile             |   3 +
> > > >  arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  13 +
> > > >  .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso |  83 +++
> > > >  arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  27 +
> > > >  drivers/media/platform/nxp/Kconfig                 |  11 +
> > > >  drivers/media/platform/nxp/Makefile                |   1 +
> > > >  drivers/media/platform/nxp/imx-parallel-cpi.c      | 728 +++++++++++++++++++++
> > > >  include/media/v4l2-common.h                        |  30 +
> > > >  10 files changed, 1024 insertions(+)
> > > > ---
> > > > base-commit: 37a294c6211bea9deb14bedd2dcce498935cbd4e
> > > > change-id: 20250626-imx8qxp_pcam-d851238343c3
>
> --
> Regards,
>
> Laurent Pinchart


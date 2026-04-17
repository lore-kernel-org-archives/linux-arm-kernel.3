Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D48CF4368A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 11:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWSYppqKgEYdAyJwXpGbYhTyQJYumoPUvOhjcW/Y6is=; b=gdgZkD5uSe/p/gtonJfMQL+SLn
	ActEsJ7dPBJLfeKqNVp3srdGFqFjCafOYRufZ/glkGllVC1B3wxKG3pGhO13llUWItsgvPmENvZ/h
	2xK6qpHlyMI4C+S80IpPnsxqekV08lc70u83DKZZyKtOKxSjS/mwm/wvbRgg0axZ8DKqqNVEizoqb
	4HKX4/aNo5kBIowVfLeIHiCcmsnYc1tRK1Gg78+MEDtKu1jW9gyjf3Iz7yxBot4TYMDjwXVs1dMs7
	EcM1BGTFe0BVmRXf2lCB0cl9Z57tW8Lc3k/lVnPiXaiSzheKu/VmIkOeziAd7Y/7rah1fpiv7I3fs
	LKkw1/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDhAC-00000003y0N-2IPb;
	Fri, 17 Apr 2026 11:15:08 +0000
Received: from mail-northeuropeazon11012028.outbound.protection.outlook.com ([52.101.66.28] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDhAA-00000003xzx-1Ytt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 11:15:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYwhnJ2J4c69CpmN47cVJ8bveAUXVh0bzOcGPWPTwDP0H3utv7bVtyXytSgT/7m6aJEPqXgA7LaQfXS9jqKpS4/gDJmmQ2UpPSpd9Ni7bhdjBnvDF+OtEQPLLo2dg/AnDhASRJi/rfT+tHuEjimn+9W4txjpysa8ckOYRdOgnLGRgvlO4aJRCWLWOj6amWsygf0gjArEu0T2fc3VRPw9u+vIM7GC5jS/BSLxeKCUNiWDGyKfTT3LZD9o1dlixmTMyC2LWb+LbBJtFhCu9jZUBJ9lfd4fpnrzLOUfu+ry3mt5ayyldmx0+ZNgmS7UqowNbmAqA2DR2NYopY3jBX/Bnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWSYppqKgEYdAyJwXpGbYhTyQJYumoPUvOhjcW/Y6is=;
 b=cQN2IQXsJ1DDsWpSWWBZDuvd+p5EdzmBY29AMWCZB3PwGHNgFq/nI8rim29qaBrKfXhogupX/OUyV3t35tzrWx4oNQSwfQf4KKi0VL04Eweja5djXOse8H6pIz3Yy/OygNMjyXtyhR4EyISJOUufaSBspnkmu8xn3pgbneOE/dh8K7UPQ8ziAfOxQJQrnHGxq5qhHAOHBCg/oxz/B8p8zzKMajNG+BTLvZGCBCbCiuuSqhYQS1Zy0lOtFWVsMJIeS+3pGv8Cd3kr3eK4xto9DS3k6sNiREyH+l1zR2qChUrZYTt2ttDcu1SVrBkT5ffb7tgOixcS7SMId2CpfyH5vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWSYppqKgEYdAyJwXpGbYhTyQJYumoPUvOhjcW/Y6is=;
 b=FbxmvzM3waocfzihX3wKx6b0r/0EvQeQ/fqZAPmt/UQtgvi7vrrGklsEMzaY0MQeDLyWb+JkRCcHfnmZ/nRnfO/TtgNsuyXn+vNDIQhez+yGiaql88wRXXMgeBmKHocoXU7gOcqS1vR92K/mF3M1BquHbzSKwnqa7ie3kp6v3YBdn5SLJv9H17XuUUAOhO9kPdbZOcIZNqw+tli1YH6EKaZf27XcQxL17WANsuSAv6+VbUktPlpIAnsHvMYN4zi7DN/mSGNpvd0OEx2dWY2pSbi2AZYE2U/pHVrvwgpXCBZCYnUN+qlSUkN4yH7sb4HlOMItCbg7LFu38Z0Z03gSLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB11560.eurprd04.prod.outlook.com (2603:10a6:10:608::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 11:15:02 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 11:15:01 +0000
Date: Fri, 17 Apr 2026 07:14:54 -0400
From: Frank Li <Frank.li@nxp.com>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, shumingf@realtek.com,
	rander.wang@linux.intel.com, pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] ASoC: soc-core: Add core support for ignoring
 suspend on selected DAPM widgets
Message-ID: <aeIWLvMWKv6OmX4h@lizhi-Precision-Tower-5810>
References: <20260415081942.4183108-1-chancel.liu@nxp.com>
 <20260415081942.4183108-3-chancel.liu@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260415081942.4183108-3-chancel.liu@nxp.com>
X-ClientProxiedBy: SA9PR13CA0166.namprd13.prod.outlook.com
 (2603:10b6:806:28::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB11560:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf4c698-f8e5-4fa9-fa39-08de9c7291b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|52116014|376014|7416014|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: wJ5dJj7Q5UzEkToBhR2Hy4S+BOuJyRJECIInB8lzihRSU8PJ3XRjEd4hpxZn4KDJ+3ZmI9Fgt1dZncKuKdWhDBX9225zG4owmjxTB2i0nfDizF1Ab6ykaGmx/i1IDw+1ffnMUg0qVZuY7KJA7b0NkdolC4MTDlqofPwTOt7FshAN31XOG9WSYIrLzusOm95gFEH2aBVLCtssVtFhUtR4whwkuiFBCMGIrAz03aajKTFyIhWGL0DvP9Jscm/6vVfJ4/YJTaR300wh/cxbp1X8AVAp9pgf6fStmLxTPVzGyVZHkj/qghnV34/ngocKbAZR+FBFjXxHY9dXYBDXJQUqli9sPmaYARp387JDCCpGkdEMGbqa4eQQP0Pyf5sTjjEtXg6iOSOr4Fvj0KGldyMQHzsSYWZCVH9ohjdifsZjLYw+a1qAXSS1Ly1qiV8LpwkWLUiLqpiFvzfxL4+aJKOtRzh5F1uw/duumXuqLLAr2uBnlok4amHYE6n07IM+TxICwsW0LRgvtdsLoIa0HW58NakqElFuHRLSs/WOwJQacWnl2ZndljlMSYUCmip2UtEqbkcrAQZKUUYkyhZ+FSutCssIIvuyrexSV2OhXAFv/rUZzHhju5QN5Nwh4tywLwk06NTxj/vWw054VJCRjBrwLdM+EPdqkrUUSSvIS8pmYQQDI+kGEKq58nSiXNztPEVr2LrZ1iEGfL+F8Pjs2eemG/8i+7xwjTMn4eFa2fkG7N2V3zW75zyCoR5iMTnMY1wEEzOFQcPNz9E+iJcnGCC7myrzYAnKGDUyx4Ol8atMTG0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2tva2dDUUhpVWszY1p6VWo4WUx1UUxkaU16cFRYeERBNXpvWHR6a2JZQUdu?=
 =?utf-8?B?TUdRSHVrN2hRTldvdHl0UmFwWWRGb280VFk4MDhqMG1rbDJLREtVbUhFVnMx?=
 =?utf-8?B?OEVnUTVNbG02NTRiVEpYQnRGeVRIVUFJRCtST3ZOZFNZd3J6UXB0TFhoNGtY?=
 =?utf-8?B?Uk4weS9SWnY2QTN2MTdXYjZQbTZiZWdKc1orUmp2YjZtdUFMcnhRY284ZHMx?=
 =?utf-8?B?cVA2VzduYlJkOGxhYjBOdlhUdm4rR2txYVJSYzNSakpocnlZZGpPZ3YzTFc3?=
 =?utf-8?B?aFFPbkNGVzExM3Q3YndnSlJNR24zejcyNDlsYWt2Y21LRTROSDQxcmRuVFZZ?=
 =?utf-8?B?ZjdLUDc0SHhjb2tES0N6QzlwRXdxOWNHb0N1T3BpRWsyRlFHREZkUkN0MnhL?=
 =?utf-8?B?bm1zNkdFL0VPRVgwWGl2Ykl1RFhnNUJJNmhyazlsc3hSbS9MVkZDblBNRkp2?=
 =?utf-8?B?a0l3Tm95eWFRUk1RQlF5Qzg2UkowYWZFSm5hUmh0U25ZUzFiR1Z1RWV4S25j?=
 =?utf-8?B?MDE1MFlUc3RsMlZtZmtQeGZrZTFVbnZ0VmFMd0ppemhFeHBYZUhlMGNzVEFv?=
 =?utf-8?B?eHcwcW9hQVlhdE9zTFhhMnVoYk56bVEyaTNGckdtVlQ0OXlBYWNWSjdGZ0Zv?=
 =?utf-8?B?VE5FT0MvTFRwTVVlczdrbVJTUFFqRXlyaXFTakoyc3NVUlRsODJhNGpKYWtp?=
 =?utf-8?B?eGV5ZlV4dVJRT1h4dHRQVzZURzBqdVRqWFFLWGQwSkl0bzZQN0JqbzU2amNH?=
 =?utf-8?B?UlBBbE1BbU4wNzJ6TDBtN0thMkVoQzZ1VTdVSEkzR0NNOTd0VlF6VjRCbGJ6?=
 =?utf-8?B?ZnFSVzNJcnQxemVONllCY2t2OUtRMlM4ZGVXV0NrSWd2ZUlxV2NFK2RDUlpG?=
 =?utf-8?B?ZU0xVkI5eVVXeUdIc1ZrQ253bW84REc3NjJueTgrMW5hU3RiL3cxMVRKMHNw?=
 =?utf-8?B?WWxJR3lPUjd1SlpJR3hRaWEva2F0dUs2TmxpTWkvZU9yeFlSYTkrYzludmlJ?=
 =?utf-8?B?NDlVeUc4bjMwZHFkbTFKVmpWVXZLaGlsdU5CNlNMOHJjK3J6b2NybnNUU29Z?=
 =?utf-8?B?SlpiTU1sVllHWXdvK0ptRHdwQXpqMDA1bkRZSms0RGZnbkpES29jOTJaT2kz?=
 =?utf-8?B?b05JVDhXWXRSdWJTRm1UbCtqSEIxZkRMUUNMWEFGaE1sRUZDcmxua2lDL29j?=
 =?utf-8?B?T1F4NjJNRU84cFVyZ2lpR2NYb2YvejMyUWlkak0yMXZ2YjNGbWFEUkdnazdP?=
 =?utf-8?B?eEM0aUc2OUZRRzRzYVgzVEhZVitYTkVuRDRPNDNWZ2c4TVV6S0p2YVZrbkhM?=
 =?utf-8?B?QmlrRUw2TGorZVA4bnFxdGpqR296R1VKZ2FUUC95L1puS0RBMVBnQnZHa28z?=
 =?utf-8?B?L0pVMUY5T0xCOFpkSWFwUFZKUGdXRDgrcVo5Y2Q0YUl5R3MyZmVkaHlUeDEy?=
 =?utf-8?B?WkMwaUc4dG95UVlOQS9xN0FVZ0pOSmRlSVF5Z0xhZWRuakRhTFFrbU1kTEFJ?=
 =?utf-8?B?NDBxeVcwbU8xZkF1Y3hxTmlDZTdxME54YTg4ZDNBazFWVzVNWG5HdW9Nam9m?=
 =?utf-8?B?cldUdStmUW5qTjYvc3k3ZXBwNkd4d2JFdkhTMnUvbEtRMmxYT2JWdUxXSXNO?=
 =?utf-8?B?QmNIN1VGc2hZa25TbW1DY3dHKzhSN254bUZlYlBsNnYzblZOVTR3QTZtaDZ6?=
 =?utf-8?B?U0U4OHRUWStBVExHMkxkSVZPWHJHb2hWa2lTK2NaTENSRm4yZUZ3SWZxMVAy?=
 =?utf-8?B?aUg1dWtWbkNSU1VZZHBqbkZXWTVkb2lNdHRoUkpKejRQTG11RTVJVDhjVkc3?=
 =?utf-8?B?aHhUbUZ2bC90a0NDaWJXcFZkVzV3TXVDWTlmSFUwTHhQdjFlTWZvZW55dUVw?=
 =?utf-8?B?U1dwUjlicHpkSXpjTUtIaG9pb0s4ZFFES2tNOU9QcWxtUUxxeW9mbFR0NG9K?=
 =?utf-8?B?RFlXNk1zd1JNa3ZrVmtpd1R4dVNoTGVhdXBYaGdmakpUSkFEazZlaU9GMTEr?=
 =?utf-8?B?MlJpMDZVTDhGSFhtNGcwQzhvWWkzV3d0RVJHNUphd2xVS0E4aU5yaFE0RWpY?=
 =?utf-8?B?YWdKMElKblV5b2hTYXBCZCtzT01VbzBmcGt2S0VpejlrNGh3VTNMY3c1aFYw?=
 =?utf-8?B?YlFiSWhoemRiVy82dFlld1p2ajBrVnNHMjF3dHlGM3J3WlJDdzc2eXNGV1dF?=
 =?utf-8?B?Rk03NExZSEZjVXhKQ2hBU2tuQy9JNERtTC9nZ1pWYWVySS9GVG82a2lYQ2VW?=
 =?utf-8?B?ZnFSbmtkUmlncG1UbjFyK09vMGppWmF2NU5FcHp3SzhXcjJFek9qVFdEQkI1?=
 =?utf-8?B?NmFCU2NONk81bHMwWlR5MjUya252RGhJNWdhckNnakVGSnBlNnl3QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf4c698-f8e5-4fa9-fa39-08de9c7291b4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 11:15:01.9310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3sgoI2/OC6ej5Bx5hwewJ/UKwUxNbwdBNSShY2S7apXrAcp/NqLSgK24K5TkUsG0rWRMdXWpksxPh4Ew+V8UxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_041506_412026_6BF0CB08 
X-CRM114-Status: GOOD (  16.85  )
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

On Wed, Apr 15, 2026 at 05:19:41PM +0900, Chancel Liu wrote:
> Some audio systems require specific DAPM widgets to remain powered
> during system suspend. Introduce a generic and reusable mechanism in
> the ASoC core to mark selected DAPM widgets as ignore_suspend.
>
> The unified mechanism consists of two parts:
> 1. Parse and store the name list of widgets to ignore suspend in
> struct snd_soc_card
>
> The list of widgets can be provided either by the machine driver or
> parsed from Device Tree. Different machines have different routing and
> power requirements. Each machine can specify its own widgets to ignore
> suspend through DT property. It enables flexible policy without hard
> code. A new helper, snd_soc_of_parse_ignore_suspend_widgets() is added
> for this purpose.
>
> 2. Apply ignore_suspend flags during snd_soc_bind_card()
>
> After all components have been probed and all DAPM widgets have been
> registered, snd_soc_bind_card() performs a unified lookup of the
> configured widget names across all DAPM contexts of the card and marks
> the matching widgets with ignore_suspend = 1.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
...
> @@ -3294,6 +3298,45 @@ int snd_soc_of_parse_aux_devs(struct snd_soc_card *card, const char *propname)
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_of_parse_aux_devs);
>
> +int snd_soc_of_parse_ignore_suspend_widgets(struct snd_soc_card *card,
> +					    const char *propname)

propname is fixed value "ignore-suspend-widgets"，needn't this agument.
you funciton include "ignore_suspend_widgets", suppose only parse property.
ignore_suspend_widgets

Frank


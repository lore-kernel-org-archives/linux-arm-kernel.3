Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9C2D38FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNypAnq0+GB87OfbRexBwzL5NFiW1b42Hk4E5Sujq/k=; b=CkwWttVm3lOL2wezUFmLGP7Ebq
	rdMIogri7ASTUFndqPBCvGMqI1VV3EutfUfxKjMByCehmJVd+MddnFNGDpWBbJRgryA2TvepJ80tl
	41E+1YAvSiXTIoj194e3d2KeHJ3M5iQFp+VAb+oyPZ7w/+BmsIvbOc09NNlVTpkbbIXlUgiJ5sG7r
	iBgEOK85t3olRgB1BRSUIA7ByKlVVf2l9HPvu24SMzkHqvu2AX8Hzcn9CApqgjaKXyigoU5J/gDlZ
	v+yR9vq2qCMYi4aq3OocyKKxu69rVsCgzdo/yUdPIea8LiGtNJo0DzzGYd6P/Y6MjYEH0uirUqe3b
	AW6ooomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4R1-0000000A5Vj-0u5i;
	Wed, 14 Jan 2026 17:13:31 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4Qx-0000000A5Q0-0h6F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:13:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1+SMAIRhWo80B3s/uIGK8NZftZx092i+oWw3quhSimDRXLg+xWZ9VjeYaf+HX1BekCLNpJIgKTZnx32dylyMC7DW6xjRjxWQb5VQSKrcN4E6SfMfpZDAI5S17wzG62Oz4osAMXXDRpaBQrySOhyudjTpC7ZKuyOZna+hmJC/yAB37jbAiXE7yVQP33Ym+AiWs5wu0e6ukCaGLuIZwpca86A7XY047nt2n+qBnYvbwccFcqJSjiNIHQGZQhHJF3VgRzRoS8j1jWgTKAb1NEoJp0CmG65d3LxTq9Z8OHoklksugVJfZWZVybJojsUbass0ZE/T8CqiQtRhzQ2TT715w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNypAnq0+GB87OfbRexBwzL5NFiW1b42Hk4E5Sujq/k=;
 b=zV2P2JWKBSfrKC+zNlauNrq/P/BQ0g+256QlTy5ZkGzO6IV1URZDsUiMRLI1S8L4kk0j/Eba7MCQnAxiP2xzF8sGz03GVFetmvnXS6XYgSyvMhFtrdhvfbmOjayZRmHxo37q5nHB6wiOzGyRY/FNDidAyYE+/TPBYwDiGo0dSKFP+DNCvT6zp96JYXeFeQbS+StRIGbrTk4SgmLYPnsGtvAUfyCbX0mlCwe6Z6UpFIhWzJvLD99xrLJL6yj4USekhxMyFuZwI3f0dX2Q/hgkkl1RVhtXbl84W3DvlG9Yf0b03gXfPQfqDEwZ6jjr5vitFJ7V1LM8ecye3Yd3P9RpTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNypAnq0+GB87OfbRexBwzL5NFiW1b42Hk4E5Sujq/k=;
 b=Is7JOnPCrWVuXvrdMcjZML1gp43ySY2rY3OlXMyZndN4bjfIDZMCkd0JS1JdWfq9FgxwmBqOGY9ib6cXM36aNJ2Oo8T5kfyrz8pKevvp/S3dfOuxnWPKMOTNIxakpA1hoElt1lUxOdKTBRRcGVUciVrwQ3Sj8aKubDteAQaasFRUvV4UUrDa2FLpfpz2J24pmljPwgvpWEwpvt+ZRLEIwqeyuR/EO5l4hQB4kUmZDKE2CCMC/GMcjTWHmYHAnEvD1EmG8qnlCAHFeTL88mlobLeK3AQpzCGdblnX6x9deARSJAHR0EzBZuQKm75B1osDpXvb9kfbFuogBGmuy+xqtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 by VI0PR04MB12155.eurprd04.prod.outlook.com (2603:10a6:800:312::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 17:13:23 +0000
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e]) by AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e%4]) with mapi id 15.20.9499.002; Wed, 14 Jan 2026
 17:13:23 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 14 Jan 2026 12:12:46 -0500
Subject: [PATCH 5/6] dmaengine: Add union and dma_slave_get_config() helper
 for dma_slave_config
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-dma_common_config-v1-5-64feb836ff04@nxp.com>
References: <20260114-dma_common_config-v1-0-64feb836ff04@nxp.com>
In-Reply-To: <20260114-dma_common_config-v1-0-64feb836ff04@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768410779; l=2460;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=/NeTZ4OVBGqK6BvJceFMm1CfELtBdwPcIYa3D28qamU=;
 b=VfehPu3AmV753z4Y0GkyVLYRccjHZP0EsTp1cAo0Ch8E0JbMz1C4FNElrgkIQxEgtLd5TnRRc
 u2qAO6f8BecAc0u1dENef6YHZnVtjO/AanI87VWP1CliarAEaE9qxW+
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8948:EE_|VI0PR04MB12155:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a42cc51-98f6-4436-03a1-08de5390393a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bURlSjVOV0xucUpuUDNkb04zcHRwR2VXZmkzN0NsbW9Lc0V2cUQ2MDh6eDVL?=
 =?utf-8?B?VkVXSS9xb2htcjR1SngxQ3BFVFNVRUxuekJVQm1hd3I0NlpXcVVMejBWeU9a?=
 =?utf-8?B?STN3UysraW5WaHM1MGRGWkVuYWVtVG4raCtCdUl3cFhTRHRyZ0gvZ2M5d09m?=
 =?utf-8?B?aU5YM0dyWi9WQVFlQkxlZW9WRG15eEM3UmRRdzk1NWVyUTFWMmI0eDBRNDlj?=
 =?utf-8?B?NkxmUjRGakZTbU42UlFsOG15cW42cEZXeCtSOVF5SlpXY3JZdnJYTzU3NmR4?=
 =?utf-8?B?MnlXaUFEUEVqOTZocVdnbGJvbFBEbTJyUHNsREM5U2NtR3YyNVUyYXBpSnNL?=
 =?utf-8?B?SSt5ZTIxTG1zanJhU1pleUN4RlhlZmRRK084NlViNVlWb0IvdkM0bjcxbUtl?=
 =?utf-8?B?UDFuTFpLMWszRTBWQ2d4L1hBWHlBRUUyMmtFM0xOZWpXUlVrcVJwVnF5N3FW?=
 =?utf-8?B?VlNjazY2cjZ3c2NTU3RJdTBCQkpobCtZOVlNNFA2SHlLNElSSGZOdFI5TStP?=
 =?utf-8?B?TStLeHgyVkdMVXhKT3d6cmQ0bXdCcnZ3VnJwMjVRVHdYREZMWXF5L0JkWjlQ?=
 =?utf-8?B?UDlTcVIyTEVWbFR1OXd0RSsvYUY5SzNON3czS1dSYnVrc2Zxc0Q5Mm5lZ3Bv?=
 =?utf-8?B?aEFyVG1DQ3A0MDdacTAyWVpTN3haNmprajhpZGhpeXB6bkhPYzlLdnZkTVpB?=
 =?utf-8?B?OG0rME0xNXNOeFY2bzhMOGxXV0h3NTVxQnJ4REdoSW81ajNIanZRY2gyMVhq?=
 =?utf-8?B?ODJvd1ExSk1LS0NQZnhXWGt0Wm8zeDYrZHdBZWhHOW9qYzFOOEpPY1JRaHoz?=
 =?utf-8?B?ZDdNN0pyZ00yRVMraTE3ZE5qUXFLc1dFeUpRMWZCZE5mcG5rY2FMV3F6RXZs?=
 =?utf-8?B?bXVwV3dlWDlWMHo2T0ZGMTR6Qjgyd2EwS25iNnpMbW1FSDd4U05WNG5Sdjli?=
 =?utf-8?B?L2pPVW5NQW96cktLYVA1SDNyWjJ2UTA4NDFaQk02RCtsbXFya3JYTlBJY3ZF?=
 =?utf-8?B?MTBMRVpFcS81Y3ptcGxDTWhxak9PNmdJdng1OEU0RDJ4ZktoMExTdjcrWmlJ?=
 =?utf-8?B?bFRGdHVSWENEVUV1ZDJEUVJZdzF6V2drQWRNWHRLeGhhb3VCMXAzRm5qd0F4?=
 =?utf-8?B?RnRJRERsbVBBeDkwUEtPeWxWYjdDSzZlL2Z5bkh5VmJKUW9BY1R0Wm91YzNy?=
 =?utf-8?B?ZUtYT0E2aGtIS3ZieGM2dERpQkdheVRoWlY5OVVqR0NnNzJjbDVqb0xYb0ls?=
 =?utf-8?B?Wjl4c1l3Z3hjOFkrNUZ4WlcrbVVkbG9JQlZZV2RNdytNTlNYZnJqRUxRYmRy?=
 =?utf-8?B?QzkwR200c1A5WEc0M25yb1VMcFhpbkNhb3hPR25MMXJkOTZGbG9od3ZUOUt1?=
 =?utf-8?B?WGhKWVNEWFhmUzhvdC9jTjhZeStWaXRWN0NsS3ErbmRxVFFrTXY1dUgwY1p6?=
 =?utf-8?B?UGJGQXk2b3NEeWNuOTZkRkhjd3lnRlNqeDJsSTRtUFVOMHluVjd6TkJPRTh3?=
 =?utf-8?B?S25MZXFudEpGY01PbXNIa1IzMzMxTFZvWUp4RHdFcDN3STArdGJrVjk3ZVdw?=
 =?utf-8?B?MkQ0VkF5ZVRjcG9DZ0h1MGw5WlNaLzVpTDNDbWN1Q2xDRkdSUllHRU5TM084?=
 =?utf-8?B?L1NoZmxTOEJ6d3A4aW1oaVNxWjdwdDlHdW82STVxU2Z3ZU9nVG1Ha0hNRGE1?=
 =?utf-8?B?OGEzZEZjYmdDTjNXd0F3UWRKRWNDM0JkaVRzWTdLM3JPbTJGK0tobE1IUEZq?=
 =?utf-8?B?VU5MRzlYVUY3WTZDRGU5NHp0UVBwTURXMld3UzZIbDFGdmFES2thQ0NmdFpI?=
 =?utf-8?B?Y1kwWlJMMHlCVFNaN2RuazRaUzRFWWNlVHAvWWtSOEVwVG9UWElJVkg2bjdt?=
 =?utf-8?B?cHRTaE9OUGVTckMvSmpCcGtaMFB3WjVpSHprUXpud3ZqOEt3cmNxS0xGUkFk?=
 =?utf-8?B?UWNqZE9xVkt6U0gyZUtDOTNpbTR1U2M5S211OW5vcWVJMmQ1bXdROWN5dWZL?=
 =?utf-8?B?Z1BHandBekVBWkUrRkU3b1Z1SzZKZFhxekJaM1p3aVY3RWFHNFVFRVoxNmkw?=
 =?utf-8?B?eEUzSmtpbzRGM0ZDQ1luWXBBdWZxaHFzOVo2c3NwYmJpcWRCbE8wRFFIUVl0?=
 =?utf-8?B?akoxMjlleVZ5QjYvVG1wTkY0WjNFTTVKRjE5aW93V0NKOW0xUDIzaEdHMFh3?=
 =?utf-8?Q?mKp1rp8qXpXbw2s3cLWl3Rg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8948.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cldrdHZoV2loUkUrVC9XUXJtR3FZd1JVM2xtcUV1aEF6U2l1VXBBZys1QWY3?=
 =?utf-8?B?ZjVxb1ZuR2RibmFPTVJMY0lPRWNGZ2RUMmdTRk1zV3BDZHZVSVlPOEtndDR4?=
 =?utf-8?B?MHRvUU5IR1RQY1ExcXpYL0lzUUVGVHN1ZzkrcTFkWVVlT3QwVHhRbkhTaGFh?=
 =?utf-8?B?Q2VIcG5XTW9teVJxZkQydFFiaGdISll2SVRaK2V4SHorelNzSTBSS1RuKy85?=
 =?utf-8?B?VWZzTk94ZVRvSDdWSmRSc2NtMnhBS2RXaUhVTmVGYk0zWEowbXBXa3lmZkl1?=
 =?utf-8?B?SElxU0xOam9iOG9DWDBFSGNPdHBEVXpVUmRmRXZFTTRBZEJaMndMY1lWNTJK?=
 =?utf-8?B?VWsrMS9UQUFvVlFRbm9LcWp1V0R4RU14MjliRnBiMWhLWjVYZmZoSjk5UWRW?=
 =?utf-8?B?U01pWVZKZkc3ZWtUb0Y2bmJybzB6Nm95R1Z1cjdNUHRBQXVMdVNEZkt3L2py?=
 =?utf-8?B?d0I3UXVDZER3MkhrRUROZmhGeUZwbnIyNTQ1ZVl2eUhHRFZGc3BhVjRJYVdB?=
 =?utf-8?B?aDhGTzFEVHRUWGpWWnNCcGgvd3ZLSDNhbVpBdEhIRW1SdlpuVzNKQlB1MDF3?=
 =?utf-8?B?Qm1HMjJ2VXBaVkZyYmx1ajVtOEJTaEpyWksxb0kwVElZVTJRSXBiN0pIZEdy?=
 =?utf-8?B?MXhDeHFRK3U0U2N0ZEt4Q2xHemYydnROWGVIdkhlOVhvQUp1K1FrcnFzd1NP?=
 =?utf-8?B?UTNaSjQyOTJlbDd3Wmx4MlBZcXM2ektzaVE4SThNSFptSzk0UUcrWGNocjBp?=
 =?utf-8?B?ekg5SGJ2YzRncXhDYWtLazlUVkVRY0VLbEM1Rmw2d0ppZG1ZTGVsZUJtd0d4?=
 =?utf-8?B?NnlFU21hVXdqbTVQc2l3b2JGcUd2Z2wwbEFPbnJ1emtqM24zZDZETHpuTTVM?=
 =?utf-8?B?cGhxUHBjTzAzMkRjUURCOWRSRzJZY3ptRGN0dkxJODE5elFLNjFzbFFLNDlo?=
 =?utf-8?B?a3FsSWU1NDl3dGkrck1sNlk4VWlKVXhaZmNKazJaSnQ2NmRKU2dVQjN5OTF3?=
 =?utf-8?B?SVBKTEt1dlByOFMwNEZwQ1N0c0ErRElhbDN0U3NKVURSM0QwSTZOTk1iNDR1?=
 =?utf-8?B?eTBBQjJXRzVlQnR3YkdCcE1iM1JQZzA5Y0UrU2RHa3JvUjM3N3ZDWE9rQ2FK?=
 =?utf-8?B?T3NzOUhSWU5HaDArS2ZlM2R1L2dJMnY0OWxCQUxGLytrblJyTXpKRTM1ZWpK?=
 =?utf-8?B?Y0JUOS94TkNpMGdWVVpLYko5T0RqeFJMS3FKaHFhWlkxR2ViWnVaU0xSbXdi?=
 =?utf-8?B?Vm1tSEJwWUFlWW41Wk0yYU5RZFRGMlMxbzhWUVdyZnMycDFrOEU5d0FNak1M?=
 =?utf-8?B?ZFI1RDdRTzdmb2Zra2xhZEFQZDhwOGZjQXB1TlhObnZIT0tubWlpZi9KYlZ3?=
 =?utf-8?B?YS9XekFTM1NiSEY5b0NQNnNYZHpYVjRWR0dVVmJSVlNlYlJqMjU2aVZVR0Rq?=
 =?utf-8?B?VFErbWpIV0VCR3VXbVMzQlhMaDB4cC9xRzZvMVV5Z2VTKzVOU3dCUktPSys0?=
 =?utf-8?B?NEx4UzFYWDZNNGpDY1pIc3BXNzRaS2toSHd1UDh0WDdFUzdKcmhPb3d0S2FQ?=
 =?utf-8?B?SWtoc2RXRm1JNzQrRStlQ1ljdHF2bnZaWjBpUlk1NEFqNnlhT2pZWnVMUkhO?=
 =?utf-8?B?ek9NWVhPY1hXTDJKVm5jYWx5aTNvNktLMEFQZHJ6WDl6NHUvTmZqL3FXdWNa?=
 =?utf-8?B?YUJ5ZlVqSktta1I1cURZZ0lGdDBSbytHbVp6b2ZMcTBOdDlGdUhpMEFGNEZz?=
 =?utf-8?B?YUpQVk8rUndKOThzMEwvZ0RSTTBwQXFoeXZrdDRwYVI1UzhKSzJ4MUtWYUlU?=
 =?utf-8?B?bm5zR25qdk90VSswSzlwUmIyZDNMa1l4M0kwNTVTYTcwT0tLWlNyK3VGNm5X?=
 =?utf-8?B?V2Z6S3hkQkhQTXpXSHRqY0JUemxlUERaU2FWb0pxWkZGTVNMU01RdG1BVGlm?=
 =?utf-8?B?a0J3QStmajNhZUthTWk3RmdVbVVTTk9jaWkyYjV5T2tQZzNEd0pSSTJvWTNK?=
 =?utf-8?B?UXNuMzJFbkNLeTMzNDBvVUU3aURMbjV1bXo2N054QmJxTlNMVndTYlJPT1ps?=
 =?utf-8?B?T2hjSStEOTI0RXh0MTljU3YvNkhFaEdYNmZ0UUdQbTVzQzJhb0VXMUxKQ2Qz?=
 =?utf-8?B?bjZlcGxZaCttaXZEZDBnYnZ1M1FqVXNuSGtmS3BrRU1UWFBZcTAzdUFTWEFC?=
 =?utf-8?B?OE1xbm1OeEJFNCtPaER6V013V0VjU21SMjVHKytRTFBuRWoreEsrc1hVMWJi?=
 =?utf-8?B?OXdhMkVzY0pWelVNV0U3RCtQL3dnTkE2YXJYaWt1bXE0Z25XWXA3c1pRbkdy?=
 =?utf-8?B?UVU2WjlsR1F4aWN6WExjSm5TSEthbGdweFpTVnloemdSTnc2d3JhUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a42cc51-98f6-4436-03a1-08de5390393a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 17:13:23.5163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mzbn7yKfESfWe1eAlH7y/jt86ebLrMEKjmErd3Zn5c2MI/gV/o4J4r8z6lcBbusG7zYxM4T3Hr2jnSRP+uUbSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_091327_227295_B76693FC 
X-CRM114-Status: GOOD (  13.20  )
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

Previously, src_ and dst_ prefixes were used to distinguish address,
addr_width, maxburst, and port_window_size fields. This required drivers
to add conditional logic based on transfer direction.

Introduce struct dma_slave_cfg to group these fields and add the
dma_slave_get_config() helper to retrieve the source or destination
configuration based on the DMA transfer direction. This reduces
direction-based branching in drivers and improves readability.

Use a union to preserve the old field naming and maintain compatibility.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 include/linux/dmaengine.h | 42 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 362a43c3e36e232b5a65ff78ba0b692c0401e50c..03632bccc7ccb3c0c4a9c78f15865f35a375836a 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -384,21 +384,47 @@ enum dma_slave_buswidth {
  * If not: if it is fixed so that it be sent in static from the platform
  * data, then prefer to do that.
  */
+struct dma_slave_cfg { /* order must be align below dma_slave_config union */
+	phys_addr_t addr;
+	enum dma_slave_buswidth addr_width;
+	u32 maxburst;
+	u32 port_window_size;
+};
+
 struct dma_slave_config {
 	enum dma_transfer_direction direction;
-	phys_addr_t src_addr;
-	phys_addr_t dst_addr;
-	enum dma_slave_buswidth src_addr_width;
-	enum dma_slave_buswidth dst_addr_width;
-	u32 src_maxburst;
-	u32 dst_maxburst;
-	u32 src_port_window_size;
-	u32 dst_port_window_size;
+	union {
+		struct {
+			phys_addr_t src_addr;
+			enum dma_slave_buswidth src_addr_width;
+			u32 src_maxburst;
+			u32 src_port_window_size;
+			phys_addr_t dst_addr;
+			enum dma_slave_buswidth dst_addr_width;
+			u32 dst_maxburst;
+			u32 dst_port_window_size;
+		};
+
+		struct {
+			struct dma_slave_cfg src;
+			struct dma_slave_cfg dst;
+		};
+	};
 	bool device_fc;
 	void *peripheral_config;
 	size_t peripheral_size;
 };
 
+static inline struct dma_slave_cfg *
+dma_slave_get_cfg(struct dma_slave_config *config,
+		  enum dma_transfer_direction dir)
+{
+	if (dir == DMA_MEM_TO_DEV)
+		return &config->dst;
+
+	return &config->src;
+}
+
 /**
  * struct dma_chan - devices supply DMA channels, clients use them
  * @device: ptr to the dma device who supplies this channel, always !%NULL

-- 
2.34.1



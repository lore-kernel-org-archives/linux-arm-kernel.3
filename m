Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4591CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 06:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DE0hYNK8TUpx1xx7JUh6EoUiaMFljKXVHnuT0t6nVjU=; b=dJPRD8tLZDHPu00O73AwQJ2n0n
	IcNdHh0N08tixzp3Q9ZSVmSzIA1b2F0MjGnW7rKWmeNpv3OarkWKmfgv3S0zL1OyNKGti9EoHsEqF
	GtSNT2jF++Gx4TX6hzBtEk9tFPIlhQAUoxqA6DKFAn2aX2Zrg1sgl0U8u1O2J6VQRiKuCW6/eWfbP
	0CTwty9H/q0ch9oHsrw5p08THh0uloyV1gJ6SYSW8KGk4cxdIy1+/tJoPtLFXt8QqYqq6VQ35iVtj
	5OnOyA0enXCGJe1ZOGhEzGNuxl4K5OcQc43TmNXTEBr8lKVXcCB+6pqR7xyTfmCG942P9hKkdfZnF
	qHX4Qvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhKW-00000006jgv-1CQS;
	Mon, 19 Oct 2026 06:58:44 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhKU-00000006jgB-0DcR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 06:58:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVGzolzXJVcmm+iPwYbGxa9UjqUq333NRV5840EO1uyXlJwz0WVHTxMOcXtfEiZaKFEMXG2stvKv3lf0rwYTi0h8H8ivTzbpqqxwhkPYbfOnGneNbofUhBamPJahTVkNvgrKf82Pe+roLLrSeZTc146iKvfqcmJoGrV+d4skDcJ+6DvDMiUNGx8VFiejirzzub0yh7cQ9dGMmqwC1lw10y8TsqUuLR9dhDySyHN63JndJqxfqPNQSYy85oFyb9VPg2HyCHvyyhaIEG0rDHKPVAjmAgU1wdZ9Muj+eNKTDTWqI8DM/3Btuug8Xw1GlonbPBP7FwiWl7cF/PLyPtIo9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DE0hYNK8TUpx1xx7JUh6EoUiaMFljKXVHnuT0t6nVjU=;
 b=S4CCrcErVb20uyCNvR6MmDtqgWlOoaAY2QdxsXHQeIzFhWMii9rzhmqthrGUAWEYxDR5nWhFx+JwLuJcihw/psAy7KAEn3lbUdgDUUFeUeCh177wFAZ+DCUcSsBDgWcfcLBNMlSjSe2/33ibhxqYXHfGPac3HbZbb4tAlAuH7rXoKlnoNx5GRVafZLMaSgRmX/4nV1vxLCsJdDJcVL+/2JoXfzdaDBVWNTMSS7StEt9plXm5+3hX5OvSY94j4g8bPUaVrtItr8uI8HjVvW/KSnVUerKZtz3KiLN5eFg+gUkoUwkdd0wRNUPBdufi6NelQQCzqG1w0ozJqUcCQFEZ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DE0hYNK8TUpx1xx7JUh6EoUiaMFljKXVHnuT0t6nVjU=;
 b=MYz30EeMptcmp71paySAvlsH898IKpBEqb0sfQfTROmgN61m1ld2wcZO1blpWEo1kWWwhO7/iOuqH+BrufpcB2GAtJApYcRmWVVCT4n7kcBDZ8VUB/gve+DZQdDnH2fPWpPWE91TNpJr7BWHMz3UPGsPplOMFdvyaR0Ajr4YgZDOphFn7W9DFkXfMQnFQju05PT5zdvniYpZnlZ+HIF23kzUwTppfMebyCvhiZc6Q4CPnkrMRP5ynsxHSg4TqN16/wero1eoi0XB9qKihglZvHhNy/y6I+U4Y1sarQWcX5pNzyCsxlMZu/FtevP3enPstNd2v7XwEy+dNGMQc0By6Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by GV1PR04MB10196.eurprd04.prod.outlook.com
 (2603:10a6:150:1ad::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 06:58:30 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 06:58:29 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
Date: Mon, 19 Oct 2026 15:58:20 +0900
Subject: [PATCH] ASoC: imx-pcm-rpmsg: Flush pending work in hw_free
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-b4-imx-pcm-rpmsg-concurrent-v1-1-c1fb8c33f4db@nxp.com>
X-B4-Tracking: v=1; b=H4sIAIu/1WoC/x3MSw5AMBAA0KvIrE2ijV9dRSyowSxazRSRiLtrL
 N/mPRBJmCJ02QNCF0fefYLKM7Db6FdCnpNBF7pWhTI4lcjuxmAdSnBxRbt7e4qQP1BVWpvKTGN
 Tt5CGILTw/e/98L4fdMCQrm0AAAA=
X-Change-ID: 20261019-b4-imx-pcm-rpmsg-concurrent-1522959ba768
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: SEWP216CA0040.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b5::12) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|GV1PR04MB10196:EE_
X-MS-Office365-Filtering-Correlation-Id: bcb73c3c-b584-44d2-773f-08df2dae612c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|921020|56012099006|11063799006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: UaO2uvA4oEFHnwFMzfJcvQhTotxByymBP3uPOaUK/eUKA5eLFk5Oev+cI8FfbK7Z7PUycKAiQfBVN2NTN0DNy8dTZcBXaYnWFHw/hW4j82Poh+2k/nCuQTpRxme9zt/egDCzLpt9rxkpcVAIyVyQuAKNrRJusz4uoaQRrPKxM0pj1PI2WBbhSFrINsVwMB11OkkjXHmbqqHnsgr7NvWO5cDKkTp7pJUu/vL5BwrUBcXsfJ3tE2z77mZrWVnTf30gYKLRXkTuJF7VCvS5Fv0I7EVbT133x0x5JO2WPqFbaJi/KIa97q2Z0qlA4FqBekPUm30PL4F0HIPYbRE6jkXKYkUUOlv7CqbvssRqnuG5IsgL2np9ugaPGPKu4TuNnkagaFUmizRMd2cIkdRt2dJ6lKoutI81N3rE1MVw4+8CDP/RVDcrpxSnnGqzFcsc3kSfsn8DslgyiZD/kVmmukW44/UtZwmTbP38bvIPzTSkb2vbND4RBFqo9heydS7cycbiPUJS0ZwZDf6N44BFOofhxUj36tlJD7jjai7Koasz0Fty+Xl3jXEA1Ytw3noSrCKYW0o/u+/cqGJdpX44pa+pmGeYEmqp38ez5jHuXujs6Lo/Z0JPGWXLI0ImXyyTs5PbrKEqsfY5AsaeojHDtbfYGz0GbkEPSoNDUtyx3SJKZwU33cyD88gQjPu3NEOr99RHukRQAlVBuB3OZfUBnphYTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(921020)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3JnUTA5SnNRc2dxQVRQeWVJNUhoYVdOVG00WTRWbzNYdWFLcXk0bEdMbkZz?=
 =?utf-8?B?RC9ZNHJOY002QWMwdllLMjEwQkVoczdXR3BYOWN2NjEzT1NDQ3MzZVM1Umsx?=
 =?utf-8?B?aHJnK256QXgzWFozL2VGeUR6QWxJNTA3WG1WWFpNWG5mRXp1aTFTUURqTVA3?=
 =?utf-8?B?L2pDN3BCRDMxK3Z4amZjSHQwaThmSURlVnZjNlBkSi9sSXdOWnVLdzhpODA3?=
 =?utf-8?B?UWhLaVR5ek5oY2JXNCtPRkNDa21QT0NzMjI4RGJlWVRHSDdBUjVYQkRKRGt2?=
 =?utf-8?B?N3VBK3lyeTh2Wko3bHFGaWYvNkRURVZrZFB5TncyTDZsYUJrdHdZb2NYVkdP?=
 =?utf-8?B?dG5nTmJuUE01UXoxc0VxOUppZWN0c09qZnl5cHVZamtnV1JPZXdRWjl3ZVBm?=
 =?utf-8?B?M0lybkJUOWFVV2IzSkdXYTdHRHoyOTZJdTl3ajZEemV1aDQ5S1pUWHQyMml5?=
 =?utf-8?B?WVlnSks2UkxsNkkvbS9wd1dBUHZVYnVkTFU4V1dGU2FVZ0VkY0xITUt3WWJB?=
 =?utf-8?B?dlppdDJIVVdpdkVuNzYzMTB2VGNxRFpUR1doamFXM1ZMdkt2eGJ6L0pFclFW?=
 =?utf-8?B?QUM0L1JtcEtUbXI2REZiTCt2SlhGVkZDUGRvVkFiL0ZiMjRvZmpYWm1pTlVE?=
 =?utf-8?B?dllyVkczUnUzK2tlWjl1dnRqM3pzNGI2MHNvbjV4RnNITWNxRHA0M2hOeXFG?=
 =?utf-8?B?NnRvMklISkk0RnpzQ0ZaR2xIQWFHZ2pVSFBDbExyVDdSV1g0SVJVczVsZFhk?=
 =?utf-8?B?UVBGNkFQNit5bFFmaHliWWtjTS9xa0dCdHAwU1UwbDduZjNia2VyUlFBU1VF?=
 =?utf-8?B?WnpkdlcyVFNGU3FuUXJxTzVsVFRoQlByOGlXMnN6SWtNQWthU3pIYmtKa2NQ?=
 =?utf-8?B?TjZ1bG9UZXl2OGxoSVBuUkJrakZvbG9MeXBKNzFCa002QVBKZGUvcExVb2hS?=
 =?utf-8?B?L2s4ZU11NWJOaU5OYUN3Y0cxQTI4L0kxOENTVmQ3U1hNeXBpdWJnVnpENy9x?=
 =?utf-8?B?bk1YbjllRjB6WHFFN01sbklPaTdoaStmcndOVlpjakE2MCsrRVk2aXJBR0hV?=
 =?utf-8?B?Z1Z6SHk2TldURjJaUHpmcDk4NTNxRW4yVzlhd3hoN2FkRTkzQVRUUmk5QkJi?=
 =?utf-8?B?Uml2OE9WM0RacVlMd0pvbytxMm0xVG94cXNqODI2czdzSjNZdVZJUUVTbWg4?=
 =?utf-8?B?Rjg2MTFjTmpzSmpuNytITHRkcnRCeVJMZFVVZWxNQlQrb2d2UGcycmVZa0Yr?=
 =?utf-8?B?Si9vak9Fa0hiMis0RmRrTkRKNVpJUEpHZDRTTVBobXhOazRxdHFBeERzV3Bx?=
 =?utf-8?B?ZWZrZ3NRVXdLalBZc0JUYVVCU1RPZHhkNmpkWXBTcysyL1pOeGZEUDh2b2Nu?=
 =?utf-8?B?dXVBNUZzQk1nOXhBQytscHBjTTNNUzc0Vm9tRHpHQkFpRGt5azlodDZYK1h3?=
 =?utf-8?B?bE5VdGNXNm5rTk53ZlRHMVhVdndOUUR2TXdLVjQ5MzBoWmdsQ2ZjVW44SXZW?=
 =?utf-8?B?d1ZobE5IQVduL0lWUlJIQnhLQXQ1RjJSK2o4SFU0SVNuSEJReFhZRkNtVHBB?=
 =?utf-8?B?T1lmQU5yMXoxaUdqcm9GRUdFa0FnL21ydllwSXZwVmRhWHMvRTZuYnk5amFR?=
 =?utf-8?B?SzRBZEdVUzlVOTBwb2JxSjdwSk13dDZBd0ppaGdJYWNJT3k0cldMZm0xSHF6?=
 =?utf-8?B?Ull0N2FjK3NhRnF5a01xUkI3UnRLS2M1aUw3VzNqZ2Rhc1dpR2xBLzltSUwy?=
 =?utf-8?B?MGFkMFBweHhkd2xvT1NDVHZUU25KYkhwVy8vK3ZSZllHVDdCRTdIdjNodVVk?=
 =?utf-8?B?TWxTN3dPYURNSWJ2cDRHNTc4dmsrbWN4S1pIWjhsc25jZkFkZmdsWU4ySEpW?=
 =?utf-8?B?ZjBRWm03blk2SG1xdDE3UlpaTGJEUVJ5QjlMYjVoSzI2b1ZMeHMydmw2QTRl?=
 =?utf-8?B?Qnp6ekE2V3FEaUZBL2xtc00zck8yMzBnRCtYSmJuYnVyWm1USnhTRnBZVmNR?=
 =?utf-8?B?VDFvSHdZWG9kN0Nmc3o5R1dIL1FpT3p5RzZ0S1IvbTkwY3RJRy9EMi9BSVB4?=
 =?utf-8?B?MVJVQ1k0dWR5c3RuSkpzVXRVTFhwcVBaWmdUSVlmWVdrVkxyOE9lY1FpRVpu?=
 =?utf-8?B?aDhzVVQ4dFpZZ05VUlE1QytnbVNBaEtoODUxL29QWWlGdGdHZzk5Y2p3SU1x?=
 =?utf-8?B?QnNDYmpCMTdTNzZHcTBBeWtQb0gya2ZoWnByWmFGZ1RpYWc4cWU4cCtpVjNF?=
 =?utf-8?B?TUd0WEZscm14VUZMeVRHTjMzTHFoV29hQWNOU29JS0gwZFp3enFUS3pNaXRr?=
 =?utf-8?B?NWxWVE9yWmJEamJXdFB0QXhMVFRicGtFRmNVMGlVRklHejJERkU4SmFIakNj?=
 =?utf-8?Q?sX/9a8rXilF5atBsgI0M2ztwAheVP65+nnZTI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb73c3c-b584-44d2-773f-08df2dae612c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 06:58:29.4176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1vFuIZXDH3EqNUdF240NztYfcSCceVnZ17qddrMm1ZmTvVcW/zbsEptOR+YICXnFnaj2kbwBrmRvu3jgsSfFwsMr2zbrs6nuDxWcTpS+g+n876wfe44yeru5bAfVq9ID
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_235842_114521_DA8B6931 
X-CRM114-Status: GOOD (  15.54  )
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

From: Chancel Liu <chancel.liu@nxp.com>

imx_rpmsg_terminate_all() queues the TERMINATE message to the workqueue
and returns, while the DAI hw_free() synchronously gates the audio
clock. The two can then run concurrently, and this concurrent access to
the shared audio clock path can cause a stop failure or even hang the
system.

Flush the workqueue in a new component hw_free(), which runs before the
DAI hw_free(), so TERMINATE is fully handled before the clock is gated.
CLOSE stays the last message.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 85b7c929a28a..6a0174d6c78d 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -178,6 +178,16 @@ static int imx_rpmsg_pcm_hw_params(struct snd_soc_component *component,
 	return 0;
 }
 
+static int imx_rpmsg_pcm_hw_free(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream)
+{
+	struct rpmsg_info *info = dev_get_drvdata(component->dev);
+
+	flush_workqueue(info->rpmsg_wq);
+
+	return 0;
+}
+
 static snd_pcm_uframes_t imx_rpmsg_pcm_pointer(struct snd_soc_component *component,
 					       struct snd_pcm_substream *substream)
 {
@@ -285,9 +295,6 @@ static int imx_rpmsg_pcm_close(struct snd_soc_component *component,
 	struct rpmsg_info *info = dev_get_drvdata(component->dev);
 	struct rpmsg_msg *msg;
 
-	/* Flush work in workqueue to make TX_CLOSE is the last message */
-	flush_workqueue(info->rpmsg_wq);
-
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		msg = &info->msg[TX_CLOSE];
 		msg->s_msg.header.cmd = TX_CLOSE;
@@ -624,6 +631,7 @@ static const struct snd_soc_component_driver imx_rpmsg_soc_component = {
 	.open		= imx_rpmsg_pcm_open,
 	.close		= imx_rpmsg_pcm_close,
 	.hw_params	= imx_rpmsg_pcm_hw_params,
+	.hw_free	= imx_rpmsg_pcm_hw_free,
 	.trigger	= imx_rpmsg_pcm_trigger,
 	.pointer	= imx_rpmsg_pcm_pointer,
 	.ack		= imx_rpmsg_pcm_ack,

---
base-commit: 8d00cfd77ffa64477129969eec8249c8cdadc9c2
change-id: 20261019-b4-imx-pcm-rpmsg-concurrent-1522959ba768

Best regards,
-- 
Chancel Liu <chancel.liu@nxp.com>



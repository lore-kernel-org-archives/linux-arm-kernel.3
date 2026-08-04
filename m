Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0567C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 09:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/oxjEhcd90sIwT8oacfo/mQ+G4Ay48k/aqmt/lOs02A=; b=wnGh1q06A/OrOrLc8VGUIPgIxi
	WrU95LRSCKbbb0aR+oN/9I8P6lgdUpC2aegiOqxwJwDE2fvr/yi+GJZvwxg2pLJIW1hP7kpaOPXfO
	8LKfqYZz7NVkBftw/LbvxxOakvg/4vSZoW3OfCDmkqwsdx2iRu8oF76iRk3Bq0Fq2n72RnSOEqRv1
	GXE018+D5m+KWLo+QuoMQhxhSFpLDAR0xim2L6DeCoMCZkYSYcxtVWLpvZEMQjHiukS3y30FMel9F
	2J06v9AXSu3vqAtnMMgPvHQo3EV1FnPD+kuXTmMTLOEwAI/n/PevZj10QAMzfBupmJo5ABy337GSt
	DJcl5Nkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBsJ-00000001TTR-0YUs;
	Tue, 04 Aug 2026 09:55:55 +0000
Received: from mail-westeuropeazon11011005.outbound.protection.outlook.com ([52.101.70.5] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBsH-00000001TSl-0gk4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 09:55:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPmf1P6qbPgysUQUMHQn8aL2fPUeNORG0HjVJ15HuR/yoQ4ciIz7qydL7PU2Q27c/b/YEOk/aciXRVNJUo6/kBE38nPwvNmXazR4DID0+pNaW80IDayoBkguxM9EH7ZNaN9YaE4/RpMfOo8Yf3k/jf1ypzWV4CHeo9I7deFtUu4Db1CUrE+JneUgXqeRxK4AzVqmw1C+dkVodOn43cqyaRrMax0ZCEBsnRdS8n7nbM7i2ECPnIgCvvfj1MDaH8mXLMOAcCoaC/fYDFbkqUqPsvcwMvoAmAs+wHxNtHSYnUIlkfMfaBbuTKMcou7MmaZ+yX3DAC1K08b5x9ifV9tjJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oxjEhcd90sIwT8oacfo/mQ+G4Ay48k/aqmt/lOs02A=;
 b=CIMq2BNpp1dkA3Dcrxs4T5SsgPIw1zd1gomOmHZ9x4CJNwantIzz3ZkU2tRS1hPfAtCdX+uIuPWWUDLEsZIFJjK7HJBXHS/k0U3OSgf5JfotPvuMjkMUOg4Q17fAv5DwQxON7RDoWUEckpTHK8AG+n9NtySEAZBJsYpbxfIXPirzPMFZ7hmfqwwxUXNrOrVHrX4iIQhdQQHXDDgyx+jwZVtCph1Zp4rlnZzlPyRk0CFgDzxTUem1gi3i82eiRzV+cgcUOD2S+Dv7GhNnlNlIXtlSP0Z1GpIw2ZGT87Jtpp8gEpjT3BgygvqW2R2f+fnLwJGXy4yS/5HRCtFviPhWmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oxjEhcd90sIwT8oacfo/mQ+G4Ay48k/aqmt/lOs02A=;
 b=qzlTiAh23qVz2VAgUpikbXEKuLXMGd6hFjv/weI2NsuKxrwETuoh2Aal52USDX/6BtgDGUZVZuGQZSFS3PP5Ry3sM22qLb/GqSZVxumot6L+ZmngmcXr5Z3MvgzLRIsGuRKaZGcoHI0TLKpKRJn20kzmN760icX4X81mG1DZMEMNqqbjFUs5COdUMSy4d6bDwsFx93VEAR8+0oYFW/Mh29fAfRxL7X23jc/D/3wWFvSif9nDv7qJuCygypHBJfIl+fawUxaXHJRtHnYaRz0fBJCv4j1M37iKtvesR2D5+X8WmbuVmvEgdErL0aJFzpjTjOXubidFeBN4RUvaPMjSVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by DU0PR04MB9465.eurprd04.prod.outlook.com (2603:10a6:10:359::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 09:55:44 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 09:55:44 +0000
From: shengjiu.wang@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: [PATCH v3 0/5] ASoC: fsl_asrc/fsl_easrc: expose per-pair/context DAIs and fix DMA race
Date: Tue,  4 Aug 2026 18:02:13 +0800
Message-Id: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0029.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::16) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|DU0PR04MB9465:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f696ea9-3d05-4f6b-77a4-08def20e8d00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|1800799024|366016|18002099003|11063799006|56012099006|6133799003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: TYyXzRtT8d+zsvr1ELUWXI0ubhfkkBNE7hRBe1Qu95T1VuolKSq1YIiMzDwkbKNAWh+iEbadiL/LYuZoXdqd+XFdM5qeMyx869xYWylTBNCJGQvkC49RFQbVVGoDV7D6scAoLr7keVhC0JcaET+Zuy1arw2OEFr/B2MKuz2Ni/TU/hDMosTyXbnkTvbqtFOHEYgETqYFtCdPFviIdDkjey9vsJm9S8Ag1rmYbgzrU/kKXtKaEaqkJo3rYJCljIpIBGLqZows78aVo2fOT5B/usCpRjiiReqL9m9m0Zb5BijZezPw1bBaIqI3yZ/Gs3YJEUaV7taZFcfwZ+p3vieYipsEmU1NoDAzuGnbtz5MEWhtBadJNIrZvI8BbVpoQKcuKLxi7O9Ys7B7x+khfGYMKUACItI11+V8F2EE7rISOUyCsSGo22Y3qYYeeq1DPy1GhGnbipOPAQ7ZZ6ADcPK9WZVNZYwAmbxtHLHLsekzZZ3Rogauka7PdPistG9lVOgNjupgGNHeO1b7poso4yn3zOxB307MXWGoKIjCnfuZH3DYqkuHn3WLiu7K5fYBWC3yaPLxkfXGLrs3fyEX+uOQ3vW4dUy15K6btoNHr6TbeewqvelSEkwoJkZYWxTi7ZUqurEaUICO+Ur9jutRR7zJu1Ubx9z267K6OJuZfAZrRP2FJGRXsYKIjERQSh9wU7oHrXFX65NLmhhB3wf92xZzPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(1800799024)(366016)(18002099003)(11063799006)(56012099006)(6133799003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tuXJCmw62UzpzsIidqQFkBBLH1tSAz8/2RGNVdmjtj3R6Ude7/Ch792h8PZW?=
 =?us-ascii?Q?190nFD911bdiQWcB8OdakUKjKvtveYfuzWU40lDNHzDD0JwajXESRMICl4iz?=
 =?us-ascii?Q?seL/V5kxBmFvLmWBNusos9kf0XylMi3gm8c7MpuB4M6W633rhw1ozlanOYBH?=
 =?us-ascii?Q?q86+F8MglU3fsoBt6SX2tWX3vIHNo4uku+cJPRptB2tR9EYKxvzDciYOtYRD?=
 =?us-ascii?Q?HGF9WDcShwoE+nb6xoKVyXDgCU+qMK615BlqSFqRZUAPWOkrv3zVf1/XZJWo?=
 =?us-ascii?Q?9zFSx1ULcB0I6lC3c6mj9H3o9ScNDub+TSBqjaX8mT7+VBjMC5u4X6VAm7MG?=
 =?us-ascii?Q?veU1r05caBLecVbGY/OmfD8AFyxixSVeQiLfVrHttd5Lv9Ss7FTjdDSvs7zp?=
 =?us-ascii?Q?9kdnfcx6b4R/fEmACK8IPjUE3SmSztjBfNfbz3vtt9vPUh4eOHEypYg/wIKB?=
 =?us-ascii?Q?rAl/vYh11LkydmUSpSPJZzou2Rn1bxuPvyCO2DcdQT1uElfMpY2x8XYBh0h0?=
 =?us-ascii?Q?u8qb1Lse5mKudeyMxu9SvgopNmnE8sUznl+LrKuM1E1RHXeQ4Sm0mde2Uzvs?=
 =?us-ascii?Q?NzuhqIlIXyuKuxafax0ckBAZVemzh+1+Qcsg4ScOTP0fVUiK6DIdWd2yS4zK?=
 =?us-ascii?Q?ucTfqfu056hKbvTmB/Dg7J73U9x3/i9oZQUqy/4VArtX7R/MT5gePXyS138p?=
 =?us-ascii?Q?4JRcPyPlGiH5FNQ9OY8sPUaEz3IoU771S05lrD+HY8E6wxd8EZwAV/gXI7wq?=
 =?us-ascii?Q?XMcFonb6TkV5skxEcTzdPzALn4Cj9q7b5+y1s3qKBbnStLYXh/KHjktaPSOS?=
 =?us-ascii?Q?JyqYFOBWO7V+y/1NvF5uZq9gTnlnUFyVeFs/eLq7zai5UERRJiXy7jxDMWCJ?=
 =?us-ascii?Q?BICKpQpcp3inqb+Q6qDkOUezgZHFBB+AwMbeueGRr7MD06L+HlWnWf+im0yR?=
 =?us-ascii?Q?x3whMoPKLWsZk9ZUr/cjW6EzwHYJorpL14y5ZiQKJi2yZws8ZXDMWIKfY2vL?=
 =?us-ascii?Q?E2nYGXgh/7BrvcknhyGUFn/lOUcgvjSV9qPeGL8jFrt+8FUcel5gBQ6Xzwkb?=
 =?us-ascii?Q?+wrwDrBD2shPz7JzICAq8ubHMjPf6/mqkV3coLjmqEuzJp9CcRREQxhS2kVB?=
 =?us-ascii?Q?t9S0Y56szVC9AI3B3/6185FxhyVbXtc+Xr6eI2vD/XLklV29mYBMF7UN9USY?=
 =?us-ascii?Q?xo0X0qh37Sg7g+YzICzsLU09CPS/Sc+U9kamwWyKsSh5pMLyhFarNliLzUva?=
 =?us-ascii?Q?XCXH9LQCeNGXcxbDZLpQuEzpwtZ+gnnWSyIclqtiopFAQkxEglUJc/8TiPNP?=
 =?us-ascii?Q?Y5Otyt5qvBUjlFbFnjBNlwKLHIEyxEMntZpGpV4c2jbsYYV0RrXjfjsVWYI/?=
 =?us-ascii?Q?TE99KajRMvkFYMGvJ4GtHyzCnVRPWL2bHNcDu2du6r6T4VJeU7wVcyK2bYU5?=
 =?us-ascii?Q?Y+76ds74CZF0XOIEL7CZilXurl6INToGphPm4nZaCpFqMckViHiyvA7pUqaJ?=
 =?us-ascii?Q?xdoYzM4zhMHNGkdbEmUdLW30y0ujZ09h3dLZtN2QeYjIwXmtsienz1w/ThYO?=
 =?us-ascii?Q?cVBwoS/RP5ay9MjUeKWGPtvPBjdGLYprgK0RSINt/spE+v9dGV6HQgUgWmwv?=
 =?us-ascii?Q?MXROKEwWjvHXZjLlV6L/dYORl8hunIhUfJktQfeiGX/jEqful/sHfqu293xa?=
 =?us-ascii?Q?Iui8GKiiiw99smIJ2glPZkRvBtMCiqAloSdM16UfsYJmyW+es24S8IR9aCrA?=
 =?us-ascii?Q?2wWrfwlZEk1HVbDwKrLg4OWZ/phAmaNyTHYCtLxExLQOmZIgpZJB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f696ea9-3d05-4f6b-77a4-08def20e8d00
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 09:55:44.4514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5TXiRsWGGhFStqBifDQXneqzKR2uhpjolqye+9W7pMtb/rjtNHyXCmPssJTZvjXiptt2TLKRL2oDM07S4PNDAX5cAIzOGCela4VBhT+2jhrExUNh+LgTZYWO7eQCoK3R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9465
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_025553_341271_071EE536 
X-CRM114-Status: GOOD (  12.21  )
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

From: Shengjiu Wang <shengjiu.wang@nxp.com>

This series extends the i.MX ASRC and EASRC drivers to expose one DAI
per hardware conversion pair/context, allowing multiple independent
conversion paths to be active simultaneously.

Patches 1-2 update the DT bindings to add a ports container so each
conversion path can be wired independently in the audio graph.  The old
single port property is kept but marked deprecated.

Patch 3 moves dma_params into struct fsl_asrc_pair so each pair owns its
own copy, and registers it with the cpu DAI using per-direction setters in
fsl_asrc_dma_startup().  This removes the per-DAI probe callbacks from
fsl_asrc.c and fsl_easrc.c, which are no longer needed.

Patches 4-5 expose the individual DAIs: fsl_asrc registers three DAIs
(asrc-0/1/2) and fsl_easrc registers four (easrc-0/1/2/3).  The first
DAI in each driver retains the original generic stream names for
backward compatibility with existing machine drivers.

Changes since v2:
- add ports example to original example case in yaml file as port is
  deprecated 
- remove the label in example.

Changes since v1:
- Patch 3 is new: moves dma_params into struct fsl_asrc_pair (one per pair)
- Per-direction snd_soc_dai_dma_data_set_playback/capture used instead
  of snd_soc_dai_init_dma_data to avoid clearing the other direction
- dma_params_tx/rx removed from struct fsl_asrc; single dma_params per
  pair suffices because each pair is unidirectional
- per-DAI probe callbacks removed (startup now sets dma_data)
- Cover letter and commit messages updated to reflect the above
- DAI names changed: paira/pairb/pairc -> asrc-0/asrc-1/asrc-2,
  ctxa/ctxb/ctxc/ctxd -> easrc-0/easrc-1/easrc-2/easrc-3; use index-based
  naming consistent with port@N in the DT binding
- Stream names changed: ASRCB/ASRCC/ASRCD -> ASRC1/ASRC2/ASRC3; align with
  the index-based DAI names above
- Binding port descriptions updated: pair A/B/C -> conversion path 0/1/2;
  hardware-agnostic wording to match port@N numbering

Shengjiu Wang (5):
  ASoC: dt-bindings: fsl,imx-asrc: update port binding to support
    multiple paths
  ASoC: dt-bindings: fsl,easrc: add ports binding for multiple
    conversion paths
  ASoC: fsl_asrc/fsl_easrc: move DMA params into pair/context struct
  ASoC: fsl_asrc: expose individual DAIs per conversion path
  ASoC: fsl_easrc: expose individual DAIs per conversion path

 .../devicetree/bindings/sound/fsl,easrc.yaml  |  45 +++++++
 .../bindings/sound/fsl,imx-asrc.yaml          |  45 ++++++-
 sound/soc/fsl/fsl_asrc.c                      | 100 +++++++++-----
 sound/soc/fsl/fsl_asrc_common.h               |   7 +-
 sound/soc/fsl/fsl_asrc_dma.c                  |  14 ++
 sound/soc/fsl/fsl_easrc.c                     | 123 +++++++++++++-----
 6 files changed, 263 insertions(+), 71 deletions(-)

-- 
2.34.1



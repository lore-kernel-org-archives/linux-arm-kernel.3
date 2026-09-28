Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28438C98328
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wmpvPy/KMVlRk1nudC1UQv3/P20aamKSDoRln8+W8Og=; b=ba1hScd5jV4o94H0ja/SHTiG/f
	0rNCmTjR82qX15Z/ltpIsPdldS2UgGoSKF5HQu9YfLyUomT/0ceRu59ph+geyu+Ke5heZ/1uzKN1r
	Ub4FaS94F4/aLjyjrZUpMHCV3vZvZWoEpVS8vInd55ZdFBVVeZdpbQQviZt9CzqBnzNt9ZDXksTam
	+RxNRAohXJL7jSckAN9vrVnQ1kvIDRj6Yz634aTiNulkPe31uR01H/FfT5txRudKN3wqf+yi50cNd
	13p9oOL8zhvFWz6xHy91xAc3KEkNxEbGzKPq77y7V5gxhHcdZlOEWEvDRLZv3oDU9XP1t1fmXtQ7B
	uDYjCijg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4WK-0000000HPT5-0ENA;
	Mon, 28 Sep 2026 06:07:24 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4WH-0000000HPSf-2uA9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:07:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNm2vTeV5M6mnoMn6oCHuyHGYQtpzFwYZmUMb73i9JGy0l8bjxfdR7Oq6g/QbacnsGZe0Wvpbcf48NdA8uwDwwQUxYtpBdGMpXsLMYKa0fCBw9QwZFoKReV+vmlMRJ83p/hHkErQ0fPT5LJAaw8glAtSLpS7FQxJUU3qIDTJZYd9uaFEAugdq0uSYKx/lTsEEWjmBRuCZzxSlJKHrrK6b1XYn8lsvT49sfmMEE3+2rG9MjEvTCaxzyYHxlyFnKS54TRywlWb7ufWkPoy98uv1wsHJ+BBE9I8QAZZwZpzO0m9vqmJtyFb8MKS+68Juq7+KcPUzbscsrrdGgPLPVMhVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmpvPy/KMVlRk1nudC1UQv3/P20aamKSDoRln8+W8Og=;
 b=gngYpHQ+9+zGjldQvQ+xw2HH9Jym/nVSKEHokf+0d8h1VpDVFXymfS8KbpVM5PEv/3aooZezpmbOHpyG48ty1LELesjy+WP8jeFAhOvKy6QNPKFXGR1jEjy8Jb9hEa2oMwCIztedy7uZR4iWPcVDDRt5zqkVVfwCSyDql6xsNqbIqyzV237rrkJly+UKLG+hIv7huAkaJRTBorZwAbugaZc83qPX6PBaOzbC2kuCanrEOfB7JcNOaG6AbM6vpM6gPJOdYQGFC/proMDykSS7VONKcfR+7ENp1E40hRe+/D2UswlOa+spo4uPMXVRBzLLMizSpCN4Uexuc3AmturEgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmpvPy/KMVlRk1nudC1UQv3/P20aamKSDoRln8+W8Og=;
 b=QCABsyHqLmwoUthBwUcYNxpHZs3DldsKwULyOXMiZJZS8FmNfRjNQDc5am1SHFn5Xcr9ldb5n36Te9E9vIayKfaT4vDKf6oA8iJG56w24yUojJSUn5ZKYnJ9JkPiF7Ibbjy6+bP3uzwBnWmAgTa1qqJHGpDhZsWdQ7SRdeoF/0KQMpJdC3hpjFZ0EwHQYUsc7O2xi53npds/wri6EgMgfLaYD424bkO7RIPOEz2CVUd3muwVIj2blY5s8pWwK5zXe8HUN0xVYZ0EtpKXQmS046yK1RCiXYnH2t7dvCtCSbf+sftSyYEA40THnPEfRdHxqa2mpTsh3Gz7wgycoTLJzA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by PA1PR04MB10721.eurprd04.prod.outlook.com (2603:10a6:102:489::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 06:07:14 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 06:07:14 +0000
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
Subject: [PATCH v6 0/5] ASoC: fsl_asrc/fsl_easrc: expose per-pair/context DAIs and fix DMA race
Date: Mon, 28 Sep 2026 14:11:44 +0800
Message-Id: <20260928061149.1844121-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::18) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|PA1PR04MB10721:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bab0ec2-47bc-4c37-e52a-08df1d26bdd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016|23010399003|921020|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: ULQiTdDN0rE7onJUQVq4l9/NJce9sPjEeHTwWowYxFfCX90gTiU7AhqsW3siFzjbQx8BugeEWnSXcVX17Eb1vdKpkkT8AErGMuvBRWSTy0B1oEo0x6RZgW7b5YzFMXOENaZeNpGqPcOhcb2KF/D6o/Q9cAHG9jJae6Nruk/yrjCJizn26Hw81Xqj2LvlKeFhK78wDY/VgE5AZoUov+Wpt29I5WV+Ld1OpXNH4D5PtVr4Zi/t/15SedIsT8N0NviPGzWo80z6SJpTCv2wqQruP+NUFt7wTSNiGrwj5mdF2fqygml4uFErgGNMqg9dw4gqEmutpH6wjOBEh8s0aNIxzRBBnIv/pfpMgAAfO5EqXBEN59WP5DMSsqTxOPE0vJ6DmnfcP+t9/MH7dcLVEtt4DUfvzcmuB+OMjS0YC9G8t2OCRZO0xXKvXxZMYziml9lITliXWFjp4kIvAataVbpuqHi+zk8Fgu7zj3cWMnQr6HtgjsgCut7gpWOvs1kl3dCttl4xUXrg2F/EyKE1DLbK79F/12jlsIWSzCTNIQa/+Q9/jFiubJcJFqymDwwxtI7V3Nd8bBqkgCEEO3nXUK7ieTQfxoCSVLzDBSg7gs5r8HyUzRCMbawVin2K9eCVR/ciwre1t0C/SNwZWAE1NLDWxmA8EWDpQ930qgkbO/uZFJOcAMPeqYUJUomMD5SYl1Eis5CHjvAAKp9Eq4OmsvRrMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016)(23010399003)(921020)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O8TEmCuzhs62Xi9L1WcdHgM8msMHQNwLEtDFdx3SoTpLqqOlepQQEl0FrFX2?=
 =?us-ascii?Q?HRtLpcNzU4yPwDd82XwVbuaReMniERujtp3LTb9fVvAQg9wHMl38/jHt4U5N?=
 =?us-ascii?Q?JGu9k9vtXn9SmlJFbsTXujyuKg1xfw6AST+UqC1AT2at0+G9zXwZpf62T4I+?=
 =?us-ascii?Q?sH68qmAUkeZp7EI5S3EX5fhtrS7hoVgSgS2Pg5KYMzDUQOXyotxADXUEPkew?=
 =?us-ascii?Q?2nqicOifPUd37hoIBFvz4vaplZgRQ5Cw+NtZ4F5t7HxpsgWweRyU82R3fsbr?=
 =?us-ascii?Q?gv3OLDNdrYs06BgE+bT6HdIk53JVLxcCpbl71i30EUDdjabX1uq2OZ3tte7f?=
 =?us-ascii?Q?qjdBhAW9uOdS3LWrRlfmTNk/aYLX1CCFrFs3sH+Dtsm3ef4zqKP3hYR/okHO?=
 =?us-ascii?Q?vzoNvLTO+x1Me+c18fs8CS9B6HMvC+RKk/T/J5enogB8UuYd6tKEJuA1E/Kg?=
 =?us-ascii?Q?oILFrZEsSEQetV66gXCCiOwDTus2PeMOUdCeWKpvcTIjVH06RFl9CMHSEiej?=
 =?us-ascii?Q?I5oTvfE9ya7xUHAoG5H5ta9uvtZ2oN0uSvrTlN48pwexQrmFHzACRiINbAn/?=
 =?us-ascii?Q?xis3WSjA+2RWjzoQb1JlaNFEIZEiaY7AY35hJ9ztUTHKm5xbaAaqHKlyx70b?=
 =?us-ascii?Q?2eNpm1YhQ2zNTloXCTQP6cdAVCIkv+ox0qQFZe8vhP6+QBxrrYXArgCAegt9?=
 =?us-ascii?Q?ZEGkWdWLIu9atco7jhTin0L+/z5IqmX/A7t6ajmy8cjjl1FIvdvqnLLJUsIy?=
 =?us-ascii?Q?5aL9BKjIJ0onPeqhpn8njJfEvWowMkj5QT3twLpLwvSW6gl96h1pgSR21LDJ?=
 =?us-ascii?Q?1q6RmHk/sZbz1Q8TqpGRwZToVJjHCc0ayUQFkwsPcjw/tkImYhRj2C67O7Gp?=
 =?us-ascii?Q?3DQRUu4nFK8IuhScgthjw82MjzFXeH17kPn0Xy/C8p2uZLq1nh6zh4PwC5GX?=
 =?us-ascii?Q?ClXEouVj2/xX61UA7UAUh3bV/cv4vzUvfQoLZLDwfS3OspUREFqNVt+vpS7w?=
 =?us-ascii?Q?znDQkgqTS1wmm/jFjm5z15tC8PhiUzzuy7XSwnqNPLSMgdgazaua0XB/j8aR?=
 =?us-ascii?Q?QAdm28f8X9g93rVr+o90oWd2NhrK/Oh+JhzoTxA8h9B5dIftN1q+Tj4kfc3D?=
 =?us-ascii?Q?ytolTbrgdAJdIWnbNc8ICa/RIUaNbjr2do8qNRNqv8z+6IiKMPrDKNpospKM?=
 =?us-ascii?Q?ZIkAHgYCjFaIyUPNKMITPtWA8dQR33lMhrIejMS00oGuA9lxDvK5R1jlEmQj?=
 =?us-ascii?Q?DOwwRFhApWKJmt3+LfY3AiKrckVIVFjByCCLlImJnUL6PiBXPyfx4CSCLxOc?=
 =?us-ascii?Q?VOWUr0izNIfbxtfHez1qb3gEokYe9+jWRA61v1H1mHpw6tbxnTJX3RV82vgG?=
 =?us-ascii?Q?6pxYRLs9k7HpLnevJoEvQLZtPGSqMZeEIm77fULY6Z18BMs2uWfU97+CiFng?=
 =?us-ascii?Q?WeSsvHyEQSBeMX5fKQSrG0Wp98V8JovUeBAgJJRQpuZ5SSDk6PEh0oX+Bqff?=
 =?us-ascii?Q?OPFakJvI5jyYri6iC1D8FZ/usNu18jL8ByU4zci/u5zs9tiubAgh32tsCJw8?=
 =?us-ascii?Q?Bp/rLeYru5/oKbHqVUiyfg/rFJBanMud+Lyxm3smSH0qZzQZpofyua+7ttLf?=
 =?us-ascii?Q?e6mIm1v+xlRuuFSEs3SX5SdIY/jWgATvi6yuFRIizAMFsFe0Gskq8UWpktFU?=
 =?us-ascii?Q?td+pzyL+zPAgcH6n80SZD/bDQ8TorFB9wi+kzE2x6bupJdCiXkAYUkK4C2NG?=
 =?us-ascii?Q?NFaSOi+qpw2R+ADIabVE09mli4L79jbYRbybpNsz41g2iiKaSGTE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bab0ec2-47bc-4c37-e52a-08df1d26bdd6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 06:07:14.6290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hdjQ/V68jKCh51P/jOBWrVgX+SmW5vA0FvzF+ruWjKm8wsde9STbpRzfGFYKXuQxhY3LoBRCZzPk6GAXnrVvLDUBwR/5X8qnnaoXmJk6qnimFrjlJZAhqDrytn3ha23
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_230721_767000_BFC26C18 
X-CRM114-Status: GOOD (  12.65  )
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

Changes since v5:
- rebase to latest master of linux-next
- add review tags

Changes since v4:
- update commit message of Patch 1/5 to add all variants
- add Frank's review tag in Patch 3/5
- add Krzysztof's review tag in Patch 2/5

Changes since v3:
- Update commit message of Patch 1/5 to remove reduntant sentence.
- add Frank's review tag in Patch 2/5

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
 .../bindings/sound/fsl,imx-asrc.yaml          |  43 +++++-
 sound/soc/fsl/fsl_asrc.c                      | 100 +++++++++-----
 sound/soc/fsl/fsl_asrc_common.h               |   7 +-
 sound/soc/fsl/fsl_asrc_dma.c                  |  14 ++
 sound/soc/fsl/fsl_easrc.c                     | 123 +++++++++++++-----
 6 files changed, 262 insertions(+), 70 deletions(-)

-- 
2.34.1



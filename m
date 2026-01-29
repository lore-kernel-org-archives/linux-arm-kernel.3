Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE370D61033
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZabbSEzaplqE2MKkHoCFNC0ItxjLwg1e9xyvYcnAeks=; b=wKhnUk+FGoseLp6vKNjWfKCAKv
	XJWT5dJX4+aiOp5LufwkwcmS8GnrQzuMDa5aw1faDRBlR9sjgEJBR+l5mbXjUdw1GyMBrjl16RYnL
	QFvIY3umYJawRZY172BqVpYP/3H914D+W3ftE89i2fQO3tQyzcK+jumJTNbZcWgdE+6Z8iSH3Em+v
	S+L7L06nwguFrHyjAWcQO1QTb7VOWRHs4y8mWfc1BUgkDNo5PVFoPF5tiy3k86zticGW18VI+vneB
	yrIORyp8es9GOdKjGgE5u+SwaOSOJpU/eyD8CAi1ffSc0SvYh/gKHcpXpS6MPh/msmGmbny34xfVP
	UBKmRwZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVbA-00000000P6W-0eEE;
	Thu, 29 Jan 2026 17:14:28 +0000
Received: from mail-swedencentralazon11013029.outbound.protection.outlook.com ([52.101.83.29] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVb4-00000000P5S-0JqU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:14:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkmcOdDGMEf78clrACcvRSqVZN0bjtoLh8ni1jYVlsBMs+tEY4iQTMLoDutXH6Z5pMOkGe8WV//bgKJCzj0h0VdtvkpZz1L1bh9uyBRjT9JayheAOdhRhzFS/JQVu4rJnpcrKm+bcQyBwhnGSbW9uNMUeEkPEZpL7GEiC1LEsO8PMO9T5gQWKLBHKB32XO+AtsEa18ohizlXwoNJEm7EQsFQTTXyKVzTCoL68w+bN66Ws1wpuhLv6jLstHd6ZhIzliNP8sHuWEjkighIlPSQ9hgR/rCmvK9/LIlMzqYawduzOQWNN0SjEbxfCISESM/Rz3ZZ8G0oFdI6FH3JvnPyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZabbSEzaplqE2MKkHoCFNC0ItxjLwg1e9xyvYcnAeks=;
 b=WwAJjxhfYUOrqZeQ6SB2/tW7p/BOUc14PRRIV53zeA3eU6fcaL7iBT2/9Jei2szd3fEMIc0jfPBV+tq+v38M9uCpEt3ZTk+UTCyHsuple9zpwTPuzhoQmbz9KKq4aUJqtTn2r6SwDlFAZ6/GYagpy2nCRsX6858dEaZnkDHcR6l7ZBPxOroMdGe4JElqckK3V4l3mz/7Hq6MY+yMTH42OJr+9MyLA7DFgp/WbbwoTUozAq3qYgN7lGrdJ5k9LCIR0Qit2hq4hU6r+UR8LSjkB3AMtHmbCeb9yKatsDbYmhxGcDcZZxTrSOMy5n02Ad+YyjzAgD0I35bl64dbsAHaUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZabbSEzaplqE2MKkHoCFNC0ItxjLwg1e9xyvYcnAeks=;
 b=ChoJMf8WJjbk+nmvFOCn0CCwZnX6xwwYuh7Xa4Fg2jjOlhsIyGf6EaYTFnYwHv5a03HEpmavGVM5nTAfbmTnVPRkIjjyIujiGnU++7MQDZXHspunBYle7xY9AUC7chDRcSWsi1TTwwm2/vGfIT8nnseldQ+WokxBT+XdNexTyws/siT8wgdZSm4tqRTmRDnoXXbeblSaFHO+yPjNYvAwrzkFbjmQg3BlthB12cdUfOiPWgG1E4KJThQMKhDiKwwubRadnPgxpi9jxTtSYBFTllIJ6mtoHL16raLQBPtmbtF1U4FNCEZmWD4mxYETfAyXQca0BbPJeeYWpU26LtIA5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB8003.eurprd04.prod.outlook.com (2603:10a6:20b:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 17:14:16 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Thu, 29 Jan 2026
 17:14:16 +0000
Date: Thu, 29 Jan 2026 12:14:06 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
	tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/3] ASoC: fsl_asrc: Add support for i.MX952 platform
Message-ID: <aXuVXruPir7hasdd@lizhi-Precision-Tower-5810>
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-3-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128071853.2602784-3-shengjiu.wang@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0116.namprd05.prod.outlook.com
 (2603:10b6:a03:334::31) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fcdc92a-4dff-4dda-94c0-08de5f59d500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8TWzQfeSk7UMIrYZ5vNTI0EqAPuqNWF/hMh7p0Iw6Uiv0VYRk0npZ/CwRByv?=
 =?us-ascii?Q?d7mXP2SJfnlx9uf38jkiv+qjjfVFRy1deSG+fhhzZJPhradn+skeXTdxqcB7?=
 =?us-ascii?Q?h07IdbUe4qv34kRQFPzDpFmtJ6X11zEu/fbHsBGqMxTC3hDh5IH1pmWGg68y?=
 =?us-ascii?Q?Q6LorIA9FyCZW2J7ayPUDc1kwJKVitz9tzK0vyhYvlb5pHsASbJkA9NFxsq3?=
 =?us-ascii?Q?3gq9hzGyxyhOcmSpAaP5r8HC5lgHafrgYGlWYEnCcKHHqBF9HGiy7vhHLoxZ?=
 =?us-ascii?Q?yxztRMefpq9f+XG9x1Gc9MaDwbDGBa/VrZrTBBjOad4t2b9hC0RIlp9B/dOW?=
 =?us-ascii?Q?c2ImRswAbDKk/mB34Hi50tMZ4/E9hYUcyeY8MivABQY1/jkQ6S/hN5DwLpM6?=
 =?us-ascii?Q?9HrBsYkg/RsaVHCGJ2f+c+ppOrUYFQ3i+kaN7IaO1Zq0z0xugH+6wi5k/OGP?=
 =?us-ascii?Q?UkJmePrCbQdSgtH6RIhsanTnOTqd3LogJpT64MNpL2b1fCSmOmaD2WIAZbsD?=
 =?us-ascii?Q?Q2wuUR+DPbMMYLKDzNHjPR6nD8BQSRAI2D7a84/cftbNzptiBrapqK+ghoC6?=
 =?us-ascii?Q?RTSUPyTLQpmqjOYopdLaSxwk88+uxrf2MBOVfIzepVKyOoUugcqLvleS+FdT?=
 =?us-ascii?Q?Hh2t9o0fMnGvfM3MPn5Mnsfcb9vU4bjZIHiPb76lhPQj4hBjmX3a/ZHVtq5R?=
 =?us-ascii?Q?BEh0JkALsUcWhtEkAvskgFRSFbZBuIuUKzlhmkYkMpgbhPUaAVpTXhjfmD2v?=
 =?us-ascii?Q?lXCaPTJ44pEzBbfb2RPcHmuS0SqNwkjquR8hPvQFbO5KPBlgfUCUX+9oyREC?=
 =?us-ascii?Q?UeIRRaYbZwf3lL3VioIqrx77hm6LUfvZl+DefLTPnR+hMBO/PyN2NjJwkuz8?=
 =?us-ascii?Q?8njkAo+dauddPuGwkRYnCKHnpEZr3oOTQGzT3mFKYAL6sNjqQV0y+9jqDdOP?=
 =?us-ascii?Q?pSn/DV8jWM6APLdq3l+coMnoFc/hRv5u4+1jEB5QNOeMVldtc3GNugibA8z5?=
 =?us-ascii?Q?VuKLR2imRlgrwatFNsfmKKOOz//2NcKSN39ubgPWoIqqlms4cRzVmUJD0Sbq?=
 =?us-ascii?Q?YbVV/MutLaREnL7/7lAWEFP5HVLXJQTT0kzFbqZjG/2IF6TBMHSWd8L+SVYO?=
 =?us-ascii?Q?Kf4EM4I8QsWP/sThBllpBBtp87MZrEI48kfIB/9RbxCi9/LKA7UJM3NhkawP?=
 =?us-ascii?Q?bN0rUshUBu1NUADduuV2BMy/+yWdD5zJVdgqyiED2kRb6MRIpgBFiFRS5dHe?=
 =?us-ascii?Q?Gd7b4Ar8MI6NpGcF82ww6qk4E/PSbEdTZim8OW4XIJROdPp/v8Vloa3tpbpz?=
 =?us-ascii?Q?f2PYZut6G4CvgFah0/DlaNHPZMHbAKGYm6WbU+/peNKcTc2fRUsvdbViylO3?=
 =?us-ascii?Q?49X/ikVxfG/v55h9YACX0VtSNtDe9ZxEnPjj+LJLatmfBcGHKDbifqWKnalY?=
 =?us-ascii?Q?zMioAg6elpmMMDwjZpEWrrNxWBhnOBdCuNjTN7+Xjf105c5dJgk4iHW+eEPo?=
 =?us-ascii?Q?i4x2+FtYHXdrNtiZLr94xihwnvuV1DtPvCx5OwtEWpyOPPNdeVbmvxWUgsLx?=
 =?us-ascii?Q?S5rTC1CbBfbnzFtoYzYzv7ulsd17HWq+5itwL3hEU7IbC2joT58DoVo6YAno?=
 =?us-ascii?Q?GRCzfbqUWPz+se9M/UFu+os=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9OXfErEiSciVnIxppJJiBxlXFgM+knZw8Mo9oHqxzfeGhxWWcry2Mc8vjJUK?=
 =?us-ascii?Q?cbyY/XY2N27e2qcWg84XBC9xpIidEr3UpRTFuy/pgv2JCB/Y54SllT22rEZ9?=
 =?us-ascii?Q?R6tgL1GxtokC6M5fm0OpG41r0MKMvYYlTJv4OyjT21vn1Aq6k4V//x0WyNps?=
 =?us-ascii?Q?dB1U+VNi4/smXaIHPZdhvSW9dYg8Qyzbw6tNSfeiPFmR9rUq8IfPtTkLcyth?=
 =?us-ascii?Q?EB8jbDwgidIH8+tQHb4HBTZijzT9WOMjekUGslyOmeCISMzMH1c4ZzjD2a0j?=
 =?us-ascii?Q?TjGZRD7lWHDu8qz6lGDYe3U1CZArJVbvzvmhFHxwIV8jBXySpW5fXM1TSGoh?=
 =?us-ascii?Q?Hp9EqUAHAf/KXqU1e+ELVAdE18M1WBITXypu54sWWJU28U2LhzMJbMjQxOl+?=
 =?us-ascii?Q?5n0jm78mvV2bQmrGjOBCdUWVCWKHv1uHkb53VtvBnsD7R+02VKVC/0YHCjn4?=
 =?us-ascii?Q?DjXPRfZQC5zU9inXIXI1ZeEmV2JtqYTlsmX5bKJn19aJEMb4NjsOfscyZpeq?=
 =?us-ascii?Q?JkCjwIVDPXMQxd0N++weLSAHy9hWG0tJoN/dXntCzofb40wc4S7Qx4kqpzkN?=
 =?us-ascii?Q?yuz+fCGhdzQbJ+wPhZW0bTO+uIWXExc0YuAVGmyVizoxZVLQ9rXeHHltCFUc?=
 =?us-ascii?Q?0pkUY55UxRs15hAbr042ZopU1hg1k6/B4ddW1K4nJmrn+ysYypbRgEYeP3Hs?=
 =?us-ascii?Q?Puk5KmCLl/8EjEMFqo+FjI8sRMTOmagzEsFgBWk7eidPqqLn1DDTLlHCBVf1?=
 =?us-ascii?Q?ueBplCM8OYxzo32WNhWLdlfOwPSXsC26mZ+vJJOruRhY3ckZvdbw8a0G8ejq?=
 =?us-ascii?Q?5dgo8h1iHGhB2g1zoQggk4MKZVDrSlcHQttrIWLZAwIhQmwJtM2/YLuEy2pa?=
 =?us-ascii?Q?tJy7QDRvH8kHK7BPbqpARJHST/lE8uzZP+paF+u+fCM/ZSvKxCt6ZNAN+GVv?=
 =?us-ascii?Q?pMwWfswzVuW63QlFDYTUeJcAgAwzWIJpesDOL2IB6FMWQeZzoACqRyyA+fOi?=
 =?us-ascii?Q?heS3NFznClnAQ5cyDo6hhH94JZhpbKui88KGIO0chuL1ojsfeknMzZJI8pYN?=
 =?us-ascii?Q?J0pIZrRPk/qsNslVmpwfmPKXy7g6tCPf4Z+8J/wr5H8QuiNor8YR+zMe7443?=
 =?us-ascii?Q?G8rkQKci5piPvJHtR7zgjNw6NPxLt9KdSdHnWULkbKCGTlgj4eLNKus1SKe+?=
 =?us-ascii?Q?eHTxDpewQ14iiHggdnEt887Qc0w5RszTdc+0N5bhvJ1LPwai6mg+GVV9C8PR?=
 =?us-ascii?Q?715cndKfNdhD0MC66sWM9pvGTiXE8LL+DamFEwVSgV9GF0gen6/Mgm1JetBn?=
 =?us-ascii?Q?QQjvyb0+9yhmTPrUOW4Vb14zQ/glyhLOQkTebJ+UXW2DBMh3qckM3PrEz5Gs?=
 =?us-ascii?Q?mAi4ID0CgeN5f/le04B1foKoMUB88+h91gbAVuzEknGanj4R2c0LO2d8fqhd?=
 =?us-ascii?Q?iyYFxKN0AxeV7VxNCTEtzdy0dMy17sogpiIl7Z3hKIVkQOrW6kJoQJsbiV0a?=
 =?us-ascii?Q?+OO/fP4b0GAoDgCg91Tg4Ij2CM1yq61DwsECJ6rFauzkfO5hYF/P213ecPNK?=
 =?us-ascii?Q?yNhEJkTz9rhycR5YsD2r6GrQ3eleGeuxrgpTFDeat5xWh+JnmS2boOSmqTOg?=
 =?us-ascii?Q?U+aVcOa6GJxRs10DdB0BjRj8TkZP3Xi1Lid0WNI15qFM+mVo7Xx+fFHmv2bZ?=
 =?us-ascii?Q?cwgdkqHyTrr9RSUl2QRLWEDsE4i5hQWzjPlG4WgiO3zceWC+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcdc92a-4dff-4dda-94c0-08de5f59d500
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 17:14:16.6572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: boxjiPGWGQhEcOgtoZ+OPD7xsbN+CjD7PPOM59/F0ZZZ24ScJq+Fs1VEpoZPZE0AA8yaXxNWHtp1V+2+q8oNpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_091422_117465_9609C4CA 
X-CRM114-Status: GOOD (  24.08  )
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

On Wed, Jan 28, 2026 at 03:18:52PM +0800, Shengjiu Wang wrote:
> Add a compatible string and clock mapping table to support ASRC on the
> i.MX952 platform.
>
> There is a limitation on i.MX952 that dma request is not cleared at the
> end of conversion with dma slave mode. Which causes sample is dropped
> from the input fifo on the second time if dma is triggered before the
> client device and EDMA may copy wrong data from output fifo as the output
> fifo is not ready in the beginning.
>
> So need to trigger asrc before dma on i.MX952, and add delay to wait
> output data is generated then start the EDMA for output, otherwise the
> m2m function has noise issues.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc.c        | 39 +++++++++++++++++++++++++++++++++
>  sound/soc/fsl/fsl_asrc.h        | 16 ++++++++++++++
>  sound/soc/fsl/fsl_asrc_common.h |  3 +++
>  sound/soc/fsl/fsl_asrc_m2m.c    | 29 +++++++++++++++++-------
>  4 files changed, 79 insertions(+), 8 deletions(-)
>
...
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index f46881f71e43..296e13a16490 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -253,15 +253,28 @@ static int asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_task
>  	reinit_completion(&pair->complete[IN]);
>  	reinit_completion(&pair->complete[OUT]);
>
> -	/* Submit DMA request */
> -	dmaengine_submit(pair->desc[IN]);
> -	dma_async_issue_pending(pair->desc[IN]->chan);
> -	if (out_dma_len > 0) {
> -		dmaengine_submit(pair->desc[OUT]);
> -		dma_async_issue_pending(pair->desc[OUT]->chan);
> -	}
> +	if (asrc->start_before_dma) {
> +		asrc->m2m_start(pair);

Does other Soc also work if ASRC start before DMA enable? Suppose most like
work. Then needn't start_before_dma.

Frank

> +		/* Submit DMA request */
> +		dmaengine_submit(pair->desc[IN]);
> +		dma_async_issue_pending(pair->desc[IN]->chan);
> +		if (out_dma_len > 0) {
> +			if (asrc->m2m_output_ready)
> +				asrc->m2m_output_ready(pair);
> +			dmaengine_submit(pair->desc[OUT]);
> +			dma_async_issue_pending(pair->desc[OUT]->chan);
> +		}
> +	} else {
> +		/* Submit DMA request */
> +		dmaengine_submit(pair->desc[IN]);
> +		dma_async_issue_pending(pair->desc[IN]->chan);
> +		if (out_dma_len > 0) {
> +			dmaengine_submit(pair->desc[OUT]);
> +			dma_async_issue_pending(pair->desc[OUT]->chan);
> +		}
>
> -	asrc->m2m_start(pair);
> +		asrc->m2m_start(pair);
> +	}
>
>  	if (!wait_for_completion_interruptible_timeout(&pair->complete[IN], 10 * HZ)) {
>  		dev_err(dev, "out DMA task timeout\n");
> --
> 2.34.1
>


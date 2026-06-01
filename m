Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E2ACD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 22:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNSHreha00E0q7a3YgiMGWNxhQ+RxE7lv+Mz8X0dzZw=; b=J+6kvG452ArQded5A9pMNxFrCE
	FhCpxsw66yl4V3M8ITTFjQo25Jf+sY0aiHmb04tGpRr/bElulLzguaa5DqF2+LUbDjpDPZGAOJrcF
	8H9QVRTmEcGYj8WgHfoHmoGZBENMHP4fe+xDPy8BNlNMPeR1SoitActNAsKf92p+W8eou5BB79u0s
	+rihDTvs54Zi1a6C7Jstyq/nSaATZ3mdnerGIURcB/sQtqfSV715qHOzcH7ocFaG0k/oAhzl7e78P
	Ysk8pJ+hjxQ7zmp50W+J1twXS2MjMAzCQRdUBkvS0OoJar8T/OMSD5+p0xB33x7q4OfN7sy/9h3Is
	7O8Mw+Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAr8-0000000BvEz-0Cg2;
	Mon, 01 Jun 2026 22:11:34 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAr5-0000000BvEX-3dAu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 22:11:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNhtDuaiKA1/QPT4C5dqzCvwomq8mxqygBB3/gZ5piccQl3UTqH4pO8S9A+CDf3kjv0GdzWRJ6BYi3mz42h9SwVZBuZGHvmXmYotPF0GPQYaNcavDJRrdbtPFU0MOnWkkUK+/Li/4vrAzq1qmzSNTtvbLwSb1H8adAnx+piENkadcoVVMbvAVncdoAa3jzt0ieHOSDmQ0ZW+3SzPbc/Rru3hNOG74S+8C5TDN6tNsDB06x/xu45rXZYDIziIq1HHfedq296LPjh58ZtBccEroxSV2KVaIZDwk8fiLGQCfuXhiS+XaTjnjGijJDNwO7QeDCMlhmN5/4MqFbyGnz51XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNSHreha00E0q7a3YgiMGWNxhQ+RxE7lv+Mz8X0dzZw=;
 b=JRsLsBgxOIL9I3eNUMYhGoh2ZiuwF83X5wNIcwcMFT2faiiUQ8LSHeVdkPKTBkbu2/dL/cqm/QhXB3ZP2INFJ3Zzba9WU+4XdIa+uqJ2ry7U0ssJ5VXev2Vd49iQyZ8Ym9dSnwiVEYhFGqZuhK/UBMVe6UxeZ0pH/4nh17u0p2hCv6d7XLq7sfluMieAR7ea+cH4xfsuDkSBVejasKwWtpgzWU5RKpTZ1IK/QLuCpQpyV5NsbHFgl9nKY+bMKUiSHkjUXjDh3T2iEOZjbxNHV+y0QiwWZew39E++i60b+/v0OQtEe3oMablolrghcxd+0u8yC0UQPHIVRoKg53tJIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNSHreha00E0q7a3YgiMGWNxhQ+RxE7lv+Mz8X0dzZw=;
 b=nvUOzdQwfxR3admB+piHXVAtFZqc5nsSeAummssZ+Zmd7y5TxgfxUjPWJV6etcFIkKjR801UufYUvH4PZRpe1Q6DoJDRnTLCOh4AjqPEMEPDqk2yEgFalyN3mDEBegRmSDleDN0hBAHhXDp+SiNqYQuAvtdaVt3M3fLyKsGPYKQDJ22QMcuarYSIkr6nIREx/5Qp/Ia04Tz4mWlGZt9LXuA/IsYjNh8I4uFKYO8+NChfgJmy+jfTfcPzEtdnV5RnA+0S3mzH6ni721slwThFfkjO2QuB00qo50sErNz9MWd9jcYUXIZfOuLahhMCru4v5DNu5eRyFstdIoN0FvBqGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by OSKPR04MB11416.eurprd04.prod.outlook.com (2603:10a6:e10:9b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 22:11:27 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 22:11:27 +0000
Date: Mon, 1 Jun 2026 18:11:20 -0400
From: Frank Li <Frank.li@nxp.com>
To: Frank.Li@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: tqma8mpql-mba8mpxl: configure sai clock
 in sound card as well
Message-ID: <ah4DiKUIblJBBdFG@lizhi-Precision-Tower-5810>
References: <20260522112247.1046944-1-alexander.stein@ew.tq-group.com>
 <178034369688.425543.4889711119103789584.b4-ty@b4>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178034369688.425543.4889711119103789584.b4-ty@b4>
X-ClientProxiedBy: SA1P222CA0173.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|OSKPR04MB11416:EE_
X-MS-Office365-Filtering-Correlation-Id: ec07d8d2-60a7-4927-7ad5-08dec02ab9be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|52116014|376014|38350700014|4143699003|3023799007|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ikAYWw0F7bcLCXkH08UIleDug8CKbK+e20MhRJFRzh1QX2y5UPlhLXmMsQUW3MDuRdrgdDjiw3WSu6XqtsXwC0zyG0UeUg/YNc7aOG/XixhNR5ARFzh2zPubHg7ZGh+b75ldjuxeFRBlJpNh0LYYMyjN19ghujnXycWpU8PK9LTcfyZgQY8NxRf8H8mgs3AKCSWjqooC4laQsQHnQsuUDAA27QnQx2t6MdjtOJXRj0hMdWa6/dvGxxLiEB+09Dm/0GNNFv9OrKo4lIVIkwNy+twX4p+RoiVykuz/i6t8opkzNtu2yvx/Jpk/f/jz2W9nJR/xlzL4Nl7FvJtNPtwl9WNfol9WjfsRD+jG/gURZ0FlPCzNH+LNxLd+O7OLhQj82L6Di28lLO4hDRXUjVGHt2+sYDDHgFpAQ+1JRMOas1I9Da8MFHgPyg88yrAh9Yt4vKdyYsq6Il/u9MI/xJexCPCzbo4xq3J8GsnvYQvtQ4QeIo3Mtel1IMFEbZC0DfR0WDsZOpPkkwm4opg+iR5DHnWhDdIwoEoAAOrPyzuBAG4GHnv2JjfuurxJTsupv1LYow4AAhDSj0SA/AWK7+V+dbfgyoa2SqRqloB0Z+2mpo6Y4/nrPst28oVqwUQ5lyOb+dGxlBXjgF5pttNHQOYE89pDAIDoOgSYei48q2r8ih3TlwdvUVUhmVo1tIRNc660
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(52116014)(376014)(38350700014)(4143699003)(3023799007)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kwMklmBPHiM1QXGlgNhvJmHFkyRzJu28EKLV2Xqh0t4c7aeBzoB8JJwJC9cu?=
 =?us-ascii?Q?aIdjwkFMmWx6KD4YGGFgJe5/atbRM7GtqK8LLSc+hDEEBMFYyVudrrj9cAJx?=
 =?us-ascii?Q?fI8+keE/iMtENCBOMx8jFt8XXmYgDSp9LcWAcqnFWhYFjVVk4QlbJtZ3a3+C?=
 =?us-ascii?Q?V1XkCGYixAO8Qqwkfh3tOVxMs2GBr/b2KFrUH0ZWplIfkfgH4MuOTacTp51Q?=
 =?us-ascii?Q?cBGVf5BDqeNkyJoaVc1l3vHvgY+LBbwS+Or+yVa8ODr4+Sbkayret0ZC1IDY?=
 =?us-ascii?Q?6MzW2SFrHRA83wSKNMF1cW0PL/LNv4VLvW31cEtu6SDL2CInRzFSivFKgXqC?=
 =?us-ascii?Q?IUoehNksvQtwjzPH8y5B6QE/QrC7TBw9J1KlhfkBaYCG7zia6llZ2ybkGjZm?=
 =?us-ascii?Q?P7lCiCNmaixd72jDq2MLSxOM6RjRwljOF15taws/iSAV0fPomEZzdGmkO4Qc?=
 =?us-ascii?Q?hNKdJX74r8S4rEJjyQ3NBFtkcRBTvAzcWYY4TYbeP13gEK7C/ubwILXZDIX1?=
 =?us-ascii?Q?ad/+gmDvBdrqMHEb1+eTNUETonVALIyN28Hn8K1ooKEwNMAkRVdxq0PSzQnG?=
 =?us-ascii?Q?b52d0Zs2zeUh9VR1fkuszcSlK16lEwKgYjJ5T9Mijbx0EHt8/RhSbPEH5Afe?=
 =?us-ascii?Q?UHmtKwPEaPXMW5vqlPbaecOWewqmjq8BBtENuzG5utenJ9bs06Mf4kayRNVQ?=
 =?us-ascii?Q?UTEWmuQkfLVmjTIYiWq20pS2XH6cTX7amWBFzwPc2GeP0N7gZEPP6ttnoHYu?=
 =?us-ascii?Q?bD0NHyLFwGfGH3RZq1YPhVvTgqdnR6ud4AsNEA8j8lM+J/H9WdzvxAv8F/fk?=
 =?us-ascii?Q?WSb6X5X14ilzNRLaUg4EizVMapr1GlWCZt81ZOd8nZaDNppWTKnSX/TLtgD2?=
 =?us-ascii?Q?fVBST10kEE9qo5eIw9stSwILwfaLi0H1hNvlxFc0f7hyG5dvQi4TraEZRMs3?=
 =?us-ascii?Q?DT0tH+NmFWE7fYjRt7LQZ/T4Ml0gS6Ff9kR0UuhVor9lW43Z2ra1CUZsU2FM?=
 =?us-ascii?Q?EaYZ1r/q+AHMneBLwZwPhzyR/DGnlZ2ZhYzE+iHAfjXPxgwoN7CjghL00qYS?=
 =?us-ascii?Q?Su2APz6h0dI/mq9vm7AK0IqnSmH4p+7EKIENMuuhcSjSPHXxoD8hOOBRw3Eq?=
 =?us-ascii?Q?YyM6XWRc1+Yzl1K/3xED3jk3z98BpE2amxar9h5wevm0uVuZ9YFNuBo8exT1?=
 =?us-ascii?Q?9NXOjMOxCZzPXosyi8TyWc4HeNkKQV2QjCvLVS2KK3UMk9AqH16BGlR6Or6E?=
 =?us-ascii?Q?8J+xbk1B/cp3X7Da+ZivkGRij3HaaK/4yOOISxGxuctB1BltlcXOOg9zXzzV?=
 =?us-ascii?Q?907CMbcX0Ft3cKlNl2hngahRQX/o/tzDzO1dJRSql2HUBCo5H+fLaoswDBJC?=
 =?us-ascii?Q?YBljjEtfuUgmCJUmINNyKyhmIAl2Bt6k5UXG0xGleurSOEnhi3JhJVLmGB0K?=
 =?us-ascii?Q?U++ArINx8aaWbNFo3+54P7uinuqLhn5CiF6njLfC4xITtlb4vHRxqS3h9Y/S?=
 =?us-ascii?Q?QIWuhOV20Dmx54M2spfs1IY4T+U7R/gRVtF0vtMpUksea/OOzme3DggMUJb7?=
 =?us-ascii?Q?fUzwqqowMDNJGE80hexd7KsYG3bXtherF2633Yh4f/RAi8GYF/yjzz2WZOv0?=
 =?us-ascii?Q?pL68weHqJIbuNMzgQ+BFerLtlsL9h8Z5wssCwpaOjHXP7gw4nwhxfcwk/cNh?=
 =?us-ascii?Q?Y/ItU9Jh0sB9BSCoFns5xhHytzWeaFExx+pSNtxfjMxa7HvwhRvQe23/ZFbV?=
 =?us-ascii?Q?/witkBxF0w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec07d8d2-60a7-4927-7ad5-08dec02ab9be
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 22:11:27.2021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nu4Vf5HlqFV1K/kjAzHgJZHypvMFHUkwQlNLgiUhgk7Z1QLlOoZFqWV6NrmmwRBAVNcurEox8QhKa9nCvATRag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11416
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_151131_914878_C7196F53 
X-CRM114-Status: GOOD (  14.84  )
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

On Mon, Jun 01, 2026 at 03:55:06PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
>
> On Fri, 22 May 2026 13:22:46 +0200, Alexander Stein wrote:
> > With deferrable card binding the sound card driver tries to
> > get the mclk configuration before it is setup in sai3 node.
> > Fix this by setting the mclk config for the sound card as well.
>
> Applied, thanks!
>
> [1/1] arm64: dts: tqma8mpql-mba8mpxl: configure sai clock in sound card as well
>       commit: 9abd06007c314cfd065ac13b0f382d624befcf23

I have to drop it because it cause CHECK_DTBS waring

/home/lizhi/source/linux-imx/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: sound (fsl,imx-audio-tlv320aic32x4): Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/fsl-asoc-card.yaml
/home/lizhi/source/linux-imx/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: sound (fsl,imx-audio-tlv320aic32x4): 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
  DTC [C] arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb

Frank

>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>


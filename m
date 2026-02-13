Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734F1EF48C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 04:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7w42lO/mWxDp/BZV+doM4rBKxlvzdjyqDCu633S3Ng=; b=sQFA0bHNml9FyOu78DcRuGoeOF
	AMfP2a5WSWHvPOgtv4Jw5ZNOmebsZb+p5f5qBH1NFRyDHn2haCk/6HBav3AMvo7R2bR1QHOFbMsHM
	ZvgyPtB+56VGfOHcDUh5RnWa4pNOeYsX2EyxgTtql0pMewsaP51j05gHPD6BPin/dLNrGbS5Vnq6W
	xcZxVORHMphVaM4Qyract8ovbbMvB9Xxx1qpv1JoemniwpPYQYEX2mC9Bi/bB+rmI32+JO/TgWghg
	ghhLZjt4hOyEFA53r1vqw/XkHNkWzUTug0MdUpk6ahfa5m/PqjCPEBCTokIlXYGNHHQth0y4gx23T
	XrYE/JGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqkUL-00000002xFW-2WBl;
	Fri, 13 Feb 2026 04:09:05 +0000
Received: from mail-northeuropeazon11012036.outbound.protection.outlook.com ([52.101.66.36] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqkUG-00000002xAk-1C5A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 04:09:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOSxK/aYucKPkNITxozE6WdS07+05nNGq0rPirQIJO/c+6H4BVb9W3Z8WgbmoevoD0sKZGnuqi2PpL1Q1c/o2tHX6sQVZCQwT8pxpuMQeiRl3j4ZEl+OcKj3579w9a9ogfEqC6vfMFyJe2UDM7ZgJt5JOYLPDkIeZUYPbF+DUoxZR+sLzGfaILeTA3b0rZ2EVoj9NFcTvJyy5pl9ZqvPNTy4faPRcjFJQa3/jiSQLH9Qwwd9qRIPLqyF7DPxx13Z+TgvAYHXwCv74ldQ31WQJHiLQG6wBkji/6MdAsgwEc8ZzJ5zkJolTTdyfrtOR/i0+ZJhH4mVPJnZwsCFuIh53w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7w42lO/mWxDp/BZV+doM4rBKxlvzdjyqDCu633S3Ng=;
 b=occECY8l4G8DxXcsYRKP1hPqSd1x0v/xwoJ1SuTdFxuJ8ZYZpeLmM2k7vDFsCpaER9xPHGm2aBkIUGNdHehbyUMOu7d+C7NnwUq+gYzOA4uxOxLq6tywJN/erH3TohQpy6za5mc5JyWcGrklKL+GKEzra+Q4IEsS0E+Hasa2+9Da7AOcvM9ViqJ5H+VETiRaAE9cTPNaXuetVdSizyym3Dk9YXwnMq+LQEFJT+W99J+75/3ZogN+pEBFa8SXB8FEchenXxqudoW1zv4UdTsN87lh0QAzPwbE1eMPUo537BYvc0XaN9pBSBTstZ9Nc+VdM14NaLfNH6An2EWQOwroWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7w42lO/mWxDp/BZV+doM4rBKxlvzdjyqDCu633S3Ng=;
 b=B9aqh/+rhY6A6tXpkuRKkc5Q388QWWl6pWXoyjVdugfF8ys+PCX90pCOtYzrkH+jd69PKbu8WEvkkAIK/826v7XtMGoD4X+MUVVwSHwrfRn7A+t8i9bKDRolefVTiY2ceuR1h1e8qwjoTMiSBGZ38+pCn3u/1Lzua/b81aaygPbUJIm9PbyhwaUbsRvJweh3ZzrgjUwDV6idxK85OvQrAZvURlad/wcZIIu2m1V1lW8/ctbrDXAcEByvLP3irZyNvBDH3ZwVw+ICHqLDupSzuH6W0vOkkWUOSF5svwIC5NR6Sf3/18wcs/ClUDilEmXMbAsyLDIgifR8dse44SRBQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DU4PR04MB11900.eurprd04.prod.outlook.com
 (2603:10a6:10:61a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 04:08:56 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 04:08:56 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	Frank.Li@nxp.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 10/12] arm64: dts: imx8mq: Add Root Port node and PERST property
Date: Fri, 13 Feb 2026 12:08:50 +0800
Message-Id: <20260213040852.3340547-11-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260213040852.3340547-1-sherry.sun@nxp.com>
References: <20260213040852.3340547-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0206.apcprd06.prod.outlook.com
 (2603:1096:4:68::14) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DU4PR04MB11900:EE_
X-MS-Office365-Filtering-Correlation-Id: 086bcf05-1b94-450a-2880-08de6ab59b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AvzDDD3Ykswgz7olsL3gPeEyN7w7PDbTtapgi0xgbtnMb8vAPAVsP3hjC+Fx?=
 =?us-ascii?Q?4+Qqwkib1wxWKTCqg61KuJKybxugGUBoDJ5nBQxN9lH5SqmKnwI17RcXb1RY?=
 =?us-ascii?Q?HcDHGPWji7iqJgKLtNfrcJ/TEQov5RlWJSbGzBgdJ1HkEIIg9nRVc5IhPbgy?=
 =?us-ascii?Q?yAsz2Zy0D5IuN489WHl3y1j11EdEfs4vGWfCuWWkysOU1bErJQiXJf7i/gGU?=
 =?us-ascii?Q?mfi+QY5hAcNUIj/CScEWJfNksDoGshRj8CLGfCgjsAdEtThrts15iGzv/3kC?=
 =?us-ascii?Q?302xVB1WF8jRuxN4mJg/eavQp2xSvptECul1QmQHZUuAsS0KjFEKzlVB53eY?=
 =?us-ascii?Q?rTYtYDtBwUJmzPAKf1FAOkSZIz3kNtuDLmtFZ8kLnpxFYn2kRbXaahYihtRf?=
 =?us-ascii?Q?hze4dWKDoqaIJbfnITl6z6gF015SGZlai+od5ScOp3EjjZ4WnJ9+/Dx1+1f3?=
 =?us-ascii?Q?c0WgN52kALlbehxjFUhPWwvq/grUEk8/q7uEE68FlCNX2htYiORjURtKp2G9?=
 =?us-ascii?Q?QYEhKhQtaopkZanqRgINY1WHt3/wnuTQmcsOoOW2LaOGBPyIQxbes99wU+m/?=
 =?us-ascii?Q?5SECXG51+3o+9Xf32dqt4lehPni2Gg5aO9bL7Dy89ZWqVsFkoXCoKkeTL7hx?=
 =?us-ascii?Q?CAkUb7zrL7EgxCv0cqZyCQAuP5V7qaRt+Vs4xJyuLXo3Aa5CsNJCdg979lQ2?=
 =?us-ascii?Q?h/Abt/uEwvLm5OK96IraGP2FXo1MiNwJrlg9gNuekUCEJVly/kFf8lq9qkz3?=
 =?us-ascii?Q?PWPleTP+TIQ7ZFfvvVnswTN9nKMFxkSB7YHTwpxtl0dIFmrXXJivIlKwqy8S?=
 =?us-ascii?Q?vWYxAPKFgmIL+KmfhEugOynaBIgZk9GkXDYmULoFuFXP79u1xJ//PR0CCMyI?=
 =?us-ascii?Q?8syCkXmvjdSUKAsvLAsOmMOwbrKKA9AzqiQZp7QOm27ShK2kSl9soabZzuj3?=
 =?us-ascii?Q?aiUAsxbf/PNH0qEOUuPWPUz1253tXVz/G6/9XZel5wHb7mxrw1aZamYObL3M?=
 =?us-ascii?Q?oXc38qvaY8RftIPsAsB8DCZH7Vl3cOwnl6RZHGxzgCEj0tGGnlzbywnBqTc1?=
 =?us-ascii?Q?mAl3b9xj7MuII9V0KBtIPu9QKfVnpMAxiNCIkZpEqpZRy4ZHILq+n/5gTbkm?=
 =?us-ascii?Q?GG8IxgRWrpoWnIyGfolqJrvN9QkxnoYcsCtfiJyiwxSGg0Z4OjOj4JbzZcJD?=
 =?us-ascii?Q?5n/eq5DgR0HLx6aQRmqWAIAtP6TVDhBmefyn8Hj7upZfOXT5UfSkEJtNOeTE?=
 =?us-ascii?Q?YqzyYahSkFuuGziRtyWOkd1SvpkA2nMBDsdsmjG6cbVBkLlUm02V0M5nlHJa?=
 =?us-ascii?Q?vxdAzyx0e61Cw+/wIIDI5T5RPNzVujm/mWOcHaN35WlAqj3EStWoLZ4qmii6?=
 =?us-ascii?Q?LVAC7MHFYRdlvO1Df1lEjzm0wcNovanG4xPCmTxDex2WvQ2mbmsoAFznlsQK?=
 =?us-ascii?Q?QCRGWvNNvi6L+Cg2AkptW6w0QunMN59rxhRarXXTSjh4SeBaKnI5uTnSrasB?=
 =?us-ascii?Q?lV917dJ8pbmywIqWaQgRxS3iscgcK0S+mrz5vSF4L7r7UdkNj8AwZ4DOHldh?=
 =?us-ascii?Q?b/QdK/qngpiszlTAyJFHBp8Gs/gkouQfos/v3RaxaFsH55f1EQSks7L0bvdX?=
 =?us-ascii?Q?Ix5lBzYuV/WQfeQIN70UjcGzGfIv/zhbGfnlW/fsmpjb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2QzZ9wvTEHrSuBXyIrHTLibr7ANrJStYJuY66QXVUy8NFhhf7PHTVl37bpD4?=
 =?us-ascii?Q?Y+V466xiYH3RF+vY0OHTTnG11wX+zsHUgZoqbsw6Dul6qTQOkkJUvup80hfd?=
 =?us-ascii?Q?8LoJxpdx7pOrWHfDSFJYY3fCaFikibreX8dscK2bG2qgBoah2Z7IaUJU11Ga?=
 =?us-ascii?Q?87ZzGKTZimC//3fIsNWYXsF2nm48vzSmlQf93+Gb4gtJoipCGScLWqoZ9Xic?=
 =?us-ascii?Q?aR3a+XUzRJtTn7pjHDA6gGVYpH16PK1HxtYAYKS5uJwOfOkaN1iDDO7mmG+e?=
 =?us-ascii?Q?0IZRfiHSvYDOvhUHXIIu/RG0FqkSbK2wf4QSHCM1dwz2rorF6pCzcpQeHsx/?=
 =?us-ascii?Q?5LU7BHShaYgMF2H8ztVcLpSUXy8DOeqiBE+EFNe1++4e3Meph9IwuSgaSlmT?=
 =?us-ascii?Q?y0D+VHsvw97hbdz4fPI6gg+5MiOFNYhKuO3olqLxB25XkwAUfmKi46KzqB8m?=
 =?us-ascii?Q?S09Rs/YeObM8iftHh97QqIlUJDMW3O2oJinKY/WF8pXEADTWMu/kqchr8Ruh?=
 =?us-ascii?Q?m/yJmwB5FSdEa7MtqD2OtBXzOk5P0doowM/rl46URhg7o7x1K8PYPdom2TY6?=
 =?us-ascii?Q?LSXtbt/ESn65OLEvtwjaEt7AbVMEB6Tzcf83CEipBsBjrFSN3SiwxTmNZSXJ?=
 =?us-ascii?Q?oqzAnl9Q6X2oIwCszBnQsHEuSLAI5WTRHtABPyx4BuWi1iLV3+1qTSwXuAm3?=
 =?us-ascii?Q?AxMbq4MWp0j9prezHw0pT3dSqSZN1cUAVw+tGlHBQjKxgt+h6uq9Zik2pBfc?=
 =?us-ascii?Q?edLm7Y++EtxnknUPDvLz1Uqfxw/4LwPYPQjPvZLvtNYyQL/2Rj30FgVJISfk?=
 =?us-ascii?Q?hDbDE950mldf7iC4k+OZGB7oqMCERqtGXJ0A3zDSUi9pNxZ9VX6M1NU7TMzp?=
 =?us-ascii?Q?0tN5ta0tJa/ruUl5EmRd2b5QdxYFVGuZI1sSNDWwk+JVdhJNRC3BZdscsdZ/?=
 =?us-ascii?Q?z+DEO31tKT0oa5zrA2kkOTDEZGES1uVYctxgm1CvGQJEC7gGkcxCwjRDrVIh?=
 =?us-ascii?Q?TNsI/zVZ7nY2KV74w2JvldeGKzOUJLjdh7jMIuv3oRG8QLtqjM5q4LaHlyuV?=
 =?us-ascii?Q?VyjcmotIMUlKBTFeyAyOWL8Yn3LSBKDJHylW5GlHOXeE2u09Nr+DhJMGypia?=
 =?us-ascii?Q?h0qDsRJbHqn32Gbe3RubvJFiiRVlB9B4ln2Ua2VSSTgEGlVt/Iw6vk+0hC3G?=
 =?us-ascii?Q?bwTJ1KJcP/ipsv235hy3SxA/YcJOr8UVoI/SsTzBzWCeZgcKKVGaX+pDCfpE?=
 =?us-ascii?Q?UrK7TN4XuwcvDfTgpTQHv5ZChwIcncFM85UN3VKplTjoUCZXyQhh/jqR49QU?=
 =?us-ascii?Q?fRibKH4YNv+ivWHyOrO6dF4Vc8kYcD5PAZCONLrVZLHR77Iiamwcgathul58?=
 =?us-ascii?Q?nt6I6va5BY1ZMVeyzTgKuDT1YC9w3OHpDANmHn6RZMF2JGUZW+BQW/yzUIxL?=
 =?us-ascii?Q?/EwWjTe8RD790EIA+pv27cEo3FvZJuTExv+ClwCxVFO17X4x6GpXb/SWSkVJ?=
 =?us-ascii?Q?SeajGNDdcu14relwkA9GDjUzHnmT2300oKEcAYj8GgVITfBHRDQSLPOYAL45?=
 =?us-ascii?Q?fgeNOANTnQV22NouQmq+bnawkUGwb0aEuKI4lr05s9b4vPBF7wQWNdPpUuKB?=
 =?us-ascii?Q?kmmKlsVzvDaIlrJrs0qFx9ON4/I9pSz2Y1BwXEg75v2vs92i5rC2NQI1mKEg?=
 =?us-ascii?Q?4jLK4RBi9Ig5m4w5NUeZ7413lTC/nwJWc4vmjwkBnONNQW5UNUj6AqjXAFM+?=
 =?us-ascii?Q?aEQyjCMsHQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086bcf05-1b94-450a-2880-08de6ab59b8f
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 04:08:56.6902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gg7kYY1APt7zOYlwXD6iSMUUfYIsz+bQNOqeAiNSGF+TqHzNykyL45qENh+pwJZMspLh7OXKHgRq5ae6XDHhrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11900
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_200901_439702_9360A3CD 
X-CRM114-Status: GOOD (  10.20  )
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

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 10 +++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi    | 22 ++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index d48f901487d4..e7d87ea81b69 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -369,6 +369,7 @@ mipi_dsi_out: endpoint {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio5 28 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
 		 <&pcie0_refclk>,
@@ -389,9 +390,14 @@ &pcie0_ep {
 	status = "disabled";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&gpio5 28 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie1>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio5 12 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE2_ROOT>,
 		 <&pcie0_refclk>,
@@ -414,6 +420,10 @@ &pcie1_ep {
 	status = "disabled";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&gpio5 12 GPIO_ACTIVE_LOW>;
+};
+
 &pgc_gpu {
 	power-supply = <&sw1a_reg>;
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 607962f807be..de2ba4ee9da6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1768,6 +1768,17 @@ pcie0: pcie@33800000 {
 			assigned-clock-rates = <250000000>, <100000000>,
 			                       <10000000>;
 			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0_ep: pcie-ep@33800000 {
@@ -1846,6 +1857,17 @@ pcie1: pcie@33c00000 {
 			assigned-clock-rates = <250000000>, <100000000>,
 			                       <10000000>;
 			status = "disabled";
+
+			pcie1_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie1_ep: pcie-ep@33c00000 {
-- 
2.37.1



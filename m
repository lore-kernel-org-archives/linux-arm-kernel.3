Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81A2C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIy9gn6o6KCTzioNQ5p+SUs/g9C73sSFU5qqu9QzsP0=; b=oBTnP2RmQ+l2X2eiRQzGUBxU4D
	AatG7QKKYKYMBEMFbNwT4m20gLDJ4sG1Zbl6AHl9AeqNWdAXU6sIKaAYVrG279PxWN4AWtJi8/3hn
	ryE0+PQLdl+Ua74zke05xnirF778N+PvuF2EQ45gfxlI9XWQCTvZlzvenPLYHZE/1ZwCi7BDTotMu
	Xiv9yocerGdPZa26rGrjVBHvmKxYnGDWPyhfGtsdw2kQ94e/EK8J8RxvmyvGi6rYg+e3SfMyvxNKJ
	Px8IyJSl48IKhgI2Pm7DQNnCgmsR0Lw6MtHMAUpmh6AiRIxnDJDWosIgMt5aCd/sBfUwMpfqFrhxx
	jH5yzOvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQTZ-0000000A7RX-0Rer;
	Fri, 07 Feb 2025 15:41:05 +0000
Received: from mail-am6eur05on20615.outbound.protection.outlook.com ([2a01:111:f403:2612::615] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQE3-0000000A3cP-0VUu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 15:25:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnKpUkGUu49cCshAfsZp2qVgJyOP8Djfawhhj2UN6+J24U90uR6p4I4FVoHUqm5v/xtNdhUnqQxOp0y2Djg9pXb3guaDQ+6fQ1hsxxbxkhfs+bE0vC05O2oNa1ygit2uEnQ/qX9P9vYvn8yp8pmBtDKRuJnfJgU04gXcDzzmLYu/9wFeFwo8BCNRuzkcm+27zpSN7FDW379946Zpz9Oy/I2mDiD7Cu+keKkhB06SEMkDPhMB3ppRj2FWneslXBXDdRl3eH95SEXSSsJmgWmy2v2gILzwMvTE1LiWsm2MojN5p5U1DtRV8C7QY1lmxRpbzzrdqxRwnwpUdptEsR3jlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIy9gn6o6KCTzioNQ5p+SUs/g9C73sSFU5qqu9QzsP0=;
 b=ZwQvScRsuwPnfgsEobSjYGQqDUZRU9oyDb+dx8E8JqKBYly7Iec0NCYTThVoJwhRaO2u0qn55C2buhOOwmEjIrlJvNtg6L5SBPFiclM8XN1FvF7XZ7dmbTYuIxjMNx1GsRqPD1HgCCEZIyYmXWTq8jdzOH1CwkQwNG+0GEAC4G53fXWNOaIIDlri3JURBEQneyv4xTT2TB/lHid+0DpALBxPPk2IrlnLKOkWND4Ii0pYu6KD3uj3WKdnl++2Bb1bDxmMP6U4O+wwalpoawoXDLFqYVnVrUJylA5hcQmNmNoAObViKJGdnGVtK66/hCEDdECguVLIJ+Lc+K6KcyBlKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIy9gn6o6KCTzioNQ5p+SUs/g9C73sSFU5qqu9QzsP0=;
 b=nc5ImGSOIe9omK7+918AjZCiF6QWEJoA2XefMgDjTxUDsXuYr5o6Rgk3K9DP3DNPx4nGoYybdd3sBAAx36Rdj8rqwgp3DI8UUWuniBeNyT0yXjRZcArTkfeKGCWeQIc378cbXEnENV+11BNjyCVW9flHnijNFAA8YKvdQTuN+gzmXlN8vw1IJaTOT0AtXdyR828PA1WUPAGnG7wqqUCi+bcp5z6frVPKa0GqISHxw648PQbJv3XWgr4Sih2m4MrhiO26elSJIZA3/nAvP0uvIRjg1o4hDvWbN7DGV8QXfKFU4iE9y9FiyGHookcGEgTnEk6zDbxu9/Rxn5VGFKhyfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 15:25:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 15:25:00 +0000
Date: Fri, 7 Feb 2025 10:24:54 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/10] arm64: dts: imx8mq: Add i.MX8M OCOTP disable
 fuse definitions
Message-ID: <Z6YlxhckC7H32GU6@lizhi-Precision-Tower-5810>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
 <20250207083616.1442887-10-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207083616.1442887-10-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SA1PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a15641-4547-4f82-e3d1-08dd478b9616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j0SPbN8b2K2jx/vRqb3/mwNEGe6QZmKJI4wiJaaV5QoEX4OH0o4VtjEe5H+U?=
 =?us-ascii?Q?BYgfjF2usVOdGHd5mYoz54FlL15Ne7OR/ug15Z6nLYfXT9VGOHn/02+prKhU?=
 =?us-ascii?Q?DTX8DUS/DbINMfmcB6KfNfwm+ZceHHyZo57IAN3IgvWE0Oyru4Kr+MhSweTL?=
 =?us-ascii?Q?SfFvbcSLt6+7lvZqKmgSY7BNO5BBb2d6UzZihBovcgrQpteVZ1nIKN5KNuuV?=
 =?us-ascii?Q?w/Suca5JyL40mjN9jLnlHHtxesoeBGgOjSrB/b9V37MFlChqmyMK3n3RL6ut?=
 =?us-ascii?Q?cqKczsVTFFP38TwlnoiIaFxLnKMdHpFNdCB1UbcuolvGR0P+EX3Fyl1mxcYl?=
 =?us-ascii?Q?woaUuk1OeP3iomhRbV0JNx0fpbvQDyx9fuvBKJWDEX8yJ9H07oHBJn765gdh?=
 =?us-ascii?Q?96mNpWM74IuHSbnmq0ubOLcCX8aqcrT+b8RWkT0s8spUiTNbrWcV+XpQOTvM?=
 =?us-ascii?Q?TS/EPbxGcbK6fnG2SNmRKICEtzbIWoRW4fGiNS2aSWwJxgnRiRcR0QGeYjoD?=
 =?us-ascii?Q?FvEQ2N1A1gH7iKe5WRF4XbUeST/Jmt8kgPYUAJrAqMnTAbJRKRfLAXBWw/Kr?=
 =?us-ascii?Q?3NzQahDczbT0j/d6/HnURX4BTzUS1E5aI1mk47neul3G3XBAnBqeK4BRSr9O?=
 =?us-ascii?Q?QCtuT8Xfgq1UzFoRPnLXn8Obi8wgkDk0uGNKwb9O6RoLDNPmzd6UxGO3vcT7?=
 =?us-ascii?Q?h3haGAGNP3rLf4ScW8X1ZLN3g27icaI2lnolxwmJwO0fMe4Z2ZuHSNF9E9nZ?=
 =?us-ascii?Q?2zUUCj5heWK9BFEvsDiC/kGTRcnzkO633qmYgzfTzC1N/o1KBjNsd+31pWIW?=
 =?us-ascii?Q?DEb17PONHK21NeO8UGysSggTvshCAsRxyFDnAxPULc1zxGUPjgv6tLRxTmg4?=
 =?us-ascii?Q?Mgae86mS+FmOtN0YzQgGRNDVcU7nTHlr5L9/zZAf6KR24RiZa/sVkvoFsbSX?=
 =?us-ascii?Q?BFCRl1rXLKBKK1wwqjKADVoIBneMJNFQ+yjzZSvlPelcpBdBbE2/xukdJ4Nk?=
 =?us-ascii?Q?6syRk1qhmj1MnZuFr2/skyoDt6DBSXELhtxDWVH+MOBpelkgZEqml8Yf+6O9?=
 =?us-ascii?Q?YfsmLu8hTtcsdOU3TQ78gbTLvJOV0QbDChJGc39H/2Bl1Wj0PZTKdvlhM3vK?=
 =?us-ascii?Q?CTPziedFv3sK3qzL0n7XjEdN0d+3IHvyWLOoknjJJI5X/OtQhYPuMCHYtLdX?=
 =?us-ascii?Q?vCxW2ZQ7h900I2QVQEla0RN9GSvtIA2R9TKHxqwMBx4IAZlPW2/mvOuQ+QLT?=
 =?us-ascii?Q?VSas/Il8Z4bLvtTSIQjac6XTIFdRak80KD+fF4Zqqzr9LVqvB/ST/FlXDfur?=
 =?us-ascii?Q?xKXmZ7SJ6kpuSvvPbziDOqo9mByenNl4PSFDJpNZEqGClphFG2Gemh/3MUn0?=
 =?us-ascii?Q?STPTgyJSfDciNVOUL1Coc1OAgkL0ug1E3petGJtfVjZzuHdlKGAgeaiHRO+L?=
 =?us-ascii?Q?iu/TaxlKJyX/KtdwBdJsct7UueDyGkni?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DOUlw6PUixCCqdcSmfsyeNei2Ww0J8/aF0SVpha6DvsdpgE0wYHSKOw1UVZf?=
 =?us-ascii?Q?syZRLtDW9eDrUd9n/0/AuZSg6CC7ZDhKJ4ZDUEsmdg38i0KU2hHu7hkHYinO?=
 =?us-ascii?Q?czsiJO+0A0RNE1M/EKt+bQBdO+hGsi7B9oSzJ5OOVMBdq5CIQ2ETM0F81jBQ?=
 =?us-ascii?Q?cVngZnnqkM45rZxTm2aUo+bsB0y4c5M+KRgmYDQJAvefkFjur1SyeRdgBprk?=
 =?us-ascii?Q?mofOUjerceZRDze1IQC65Wy0WqQ0DygkC5BU+CtGSW/Q3oQ53YVTxUyqa3Nf?=
 =?us-ascii?Q?NsCvoupHWJAfkbX27gYL1PRwoXdvbYBVhPjRB8iv8zfRx/IyGP2xPFaImxm+?=
 =?us-ascii?Q?UqUVe82H6/Uj6xM7r8msdcmoes6lmL3EK+0Wcd9mknSJr4EI6BI1rK01v0jQ?=
 =?us-ascii?Q?f3av9Rv65jyDOZqobQpR6mUUwNhjQeJlJ3Lh1fQGfWS550YQWzzUz0yOMjMS?=
 =?us-ascii?Q?MRjxSckuMMTyv3zyh5SyFdfmd7hnA2SfsdrX02j4nIUnu6OodjBXRUzHh+MB?=
 =?us-ascii?Q?xNL2P0urdGHIF5e8WD5lPWdCDh2PGltye57BxrpTKBW6aVcK3Erv90LaUg9B?=
 =?us-ascii?Q?5uYSfwqIYvT5nQj2U9VFs0EXPlGO2QwNNryMdLyry0v+xh98RTefLQFhnqz6?=
 =?us-ascii?Q?2i2Ol8nluYn3DcFkblWTDYBoP1K8158PPHGbf+XsJ9dUgZ8wP1Ner3VhYpWE?=
 =?us-ascii?Q?CbjolA2FqOTh8bsWlS4ieawR3np2DIWOXD1Xxswr1LA6OADMAxVVGV3VNgIL?=
 =?us-ascii?Q?lRvbY75+rjTpyQKlb1Pe70SSyPojboceXTj6NMor9/8SwMOhpCR0hK6eBD3y?=
 =?us-ascii?Q?+qLmmssnCpxlu8UboIawSBZThbWBym495cVQxx+HlrDeTeTfati+h0rYCXdm?=
 =?us-ascii?Q?MCxixhyYIYuCrpVkwwtqevkf0UZH5Ow/G8UpCUScVZpVykzvx4B/vrj5FmLL?=
 =?us-ascii?Q?IAq1tnlxlpnOdy0QZBQoXM/KAZ4zugN7JEvuo8H/veO3lU+fjfPuEjfUHjgW?=
 =?us-ascii?Q?huLxNZernqGOjZZ4HhlLFRC4Hp5wkrctCNmL3zR0TiCfMKUrcqJwlKiWKgXb?=
 =?us-ascii?Q?tIhwigX1mT4ihFZp8+FthQo7JS0hLkmA94X5xe9IEFinAakEGlERRhNi1tyR?=
 =?us-ascii?Q?iOxwoJEDuAph5BCdhuvc7bwHkMlvb3STeoisl0mQZw7G5fPqocG+cn3U/Bfz?=
 =?us-ascii?Q?nIhHIh0OP01G5n/vuK0XzB8Y4Ut7JhPIB2C+vw2fVUYjV/EeOF3fvjbNu6ok?=
 =?us-ascii?Q?1Hb/Lo7nM+9PnPvmp598RnAeRQOWcRlIoWa4RdTRyWTmRUTnV5e79exxwldR?=
 =?us-ascii?Q?xliHcmDxAEa3VXuzzeN8Ddg0iU6fFx1pIe1AD8+w+OIVJEq7bLhZClhc2hfx?=
 =?us-ascii?Q?BII3ffvTLqHHk8qK9V5/ZBb5IMzsQNYauxV8MC2rlaLsyjU5sf4N14b2aH9K?=
 =?us-ascii?Q?ocxN0gQGz8YbDVbQfG9rjU+0bPP/glw45E4JP6UtqIOVyPgaVmY6AWeRwrFk?=
 =?us-ascii?Q?zYVyunEDXLhwXGxR8PunViIqJ1AZH4Ts+jfq83zGJ87icut1v/cbtpbuys0m?=
 =?us-ascii?Q?M0N+Kvk06ywgosh/Zfpw/1saERPF2/fHxvEyi+oE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a15641-4547-4f82-e3d1-08dd478b9616
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 15:25:00.1935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCpHjMvxbXozoYxxtPt8TUufGg3gfWqkyFn0tqPuolXu5J/8HlR2g9SPiteV3++hlWuOGP5Jy4Dwe0m7nJR4CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_072503_158406_7C47B16B 
X-CRM114-Status: GOOD (  16.46  )
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

On Fri, Feb 07, 2025 at 09:36:14AM +0100, Alexander Stein wrote:
> These definitions define the location of corresponding disable bits
> in OCOTP peripheral.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/imx8mq-ocotp.h | 37 ++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-ocotp.h
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-ocotp.h b/arch/arm64/boot/dts/freescale/imx8mq-ocotp.h
> new file mode 100644
> index 0000000000000..d991d57816264
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-ocotp.h
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (c) 2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Alexander Stein
> + */
> +
> +#ifndef __DTS_IMX8MQ_OCOTP_H
> +#define __DTS_IMX8MQ_OCOTP_H
> +
> +/*
> + * The OCOTP is a tuple of
> + * <fuse_addr fuse_bit_offset>
> + */
> +
> +#define IMX8MQ_OCOTP_M4_DISABLE		20 8
> +#define IMX8MQ_OCOTP_M4_MPU_DISABLE	20 9
> +#define IMX8MQ_OCOTP_M4_FPU_DISABLE	20 10
> +#define IMX8MQ_OCOTP_USB_OTG1_DISABLE	20 11
> +#define IMX8MQ_OCOTP_USB_OTG2_DISABLE	20 12
> +#define IMX8MQ_OCOTP_DOLBY_DISABLE	20 13
> +#define IMX8MQ_OCOTP_VP9_DISABLE	20 18
> +#define IMX8MQ_OCOTP_HEVC_DISABLE	20 19
> +#define IMX8MQ_OCOTP_AVC_DISABLE	20 20
> +#define IMX8MQ_OCOTP_VPU_DISABLE	20 21
> +#define IMX8MQ_OCOTP_PCIE1_DISABLE	20 22
> +#define IMX8MQ_OCOTP_PCIE2_DISABLE	20 23
> +#define IMX8MQ_OCOTP_GPU_DISABLE	20 24
> +#define IMX8MQ_OCOTP_HDMI_DISABLE	20 25
> +#define IMX8MQ_OCOTP_DC_DISABLE		20 26
> +#define IMX8MQ_OCOTP_HDCP_DISABLE	20 27
> +#define IMX8MQ_OCOTP_MIPI_DSI_DISABLE	20 28
> +#define IMX8MQ_OCOTP_ENET_DISABLE	20 29
> +#define IMX8MQ_OCOTP_MIPI_CSI1_DISABLE	20 30
> +#define IMX8MQ_OCOTP_MIPI_CSI2_DISABLE	20 31
> +
> +#endif /* __DTS_IMX8MQ_OCOTP_H */
> --
> 2.34.1
>


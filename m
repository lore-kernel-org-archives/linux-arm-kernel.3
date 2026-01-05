Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADE2CCF2F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 20:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZRmFMBsLthQAgJCOcnfqQF/LtfKE5k6DsXvXfiGuig=; b=UtfkDM0fVFuly3V27DTvZkTqi6
	2TZNbQ83hYyDkRf9bpMdZHpTP+dNiT5d3tooFODnbotw97NrIqHn3zJyXuzqAfrZpqL8SVLSYT1NJ
	UH6//b3mA+Epmy9qoi47pnHJvjEck931cMUmGiPIeT3sfobWWcXkKd4t0plsX8Z8cp1I+Y7FmLyjf
	eT/5DGK3YeZjfkxeiocuSFueLH3oWDXm9v6T7d3hchRGmMrB1RlrhDazDMePvzxDS+eADO98tVzN5
	wVXUK9iRFc09W7oHYcAnH6MYR3DHRrEWFGaNTn1jbw+qp1OJvn+H5C8uRjb0n1v1ULCNumzvkMLfA
	QKvZ8/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqro-0000000C1uv-0ENx;
	Mon, 05 Jan 2026 20:07:52 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqrl-0000000C1uH-2d9C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 20:07:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFPMj1eZRoxX26Fz9M5EXyITpa4pY9GaUajqRDe4dkJc2vlng0qaCGEqLAFNP9ZeZ/2gU1AJ722qT3EgORv9BM4QwRMZzboFaenFEbiNsBIRc2piaCwF682+fDzATvkaykGLTs8f+8NSKhVeAYjjTxESJTOIzRUeg49fkgKdyNtBt9PKAwTChII4lVuJ6NrrIFHrGIIyTNk1cJ3rjaAPwNJJLj0MGiSYgsxg0rNll25Xp2uFNmOvajtLd6qhAxRxV9cMwvgHefPF95NQQ05sHVvm5giEd1z3bZyNNtH7UnajxtQ3HEyYT80XWcIZSYjZMNKAfknjNNhNVl5jCj63sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZRmFMBsLthQAgJCOcnfqQF/LtfKE5k6DsXvXfiGuig=;
 b=iOvNVvwWrsdF8U3qtgQ8+fYobGghtumPW0frPUQaQ7XvfMadrOaAQUoaxB8ZMGB5h84Gh5WEwLz1cNJAbOo8jv1GL+nl8tX0pS5oxX4rIdmZuOZh3xJ9NydQldTeWjwi7s7r5+iiefUMwPwNIocItWPTojc5tCsFGSunNqvJsE/LwkVemDkPofILVgWOYmCRzwZl/yywwr7vKSveFD567Vl3NRScwgq06vhT2jTpOuprzghtpphT+HWkdDVMe02CafiWUnLkLmYi0JR22fwrqbt8ghFycChW8RcKxC1oYPx8UIA40MBf4eXwDPf+/TL5OHsvcUyFpdw+TP745hbQnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZRmFMBsLthQAgJCOcnfqQF/LtfKE5k6DsXvXfiGuig=;
 b=IBL0V3qMX1aYcFDkqPjGHM0JAH7j6N21ZKef/29Cxp7USquYpz+JrSaq/dcQBlZ0Kwqmrk6UJH1xnGgF1NOdmWbvgunfub/xNvl6sIRbGwROAjPWHo9/I/rlxUuDUDiMW76H7xpCOycdM6jH56wPqWHJRQHPDuKwtZRrwZL9mpzGhPBDvs5jVDVvhMRqAYnhmlJ0aej1wtdiQWMEq7lOPa8fM3DY+tkwgoFS30hNL/n2FLJfHVMyeWIyVU6bCzS/m472YvjmyCVj/xUc3Wz+9d9QbyxCOpimA6AQj8kMTnoCjI3F3PpjYQeiTlveqC5Rsu6Zxd51v95Hqm4IeK1vGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB9PR04MB9402.eurprd04.prod.outlook.com (2603:10a6:10:36a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 20:07:45 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 20:07:45 +0000
Date: Mon, 5 Jan 2026 15:07:37 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengfei Li <pengfei.li_1@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ye.li@nxp.com, joy.zou@nxp.com
Subject: Re: [PATCH v7 3/3] arm64: dts: imx91: Add thermal-sensor and
 thermal-zone support
Message-ID: <aVwaCbSbDZ2mI35c@lizhi-Precision-Tower-5810>
References: <20251020-imx91tmu-v7-0-48d7d9f25055@nxp.com>
 <20251020-imx91tmu-v7-3-48d7d9f25055@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-imx91tmu-v7-3-48d7d9f25055@nxp.com>
X-ClientProxiedBy: PH7PR17CA0023.namprd17.prod.outlook.com
 (2603:10b6:510:324::24) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DB9PR04MB9402:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e367e2f-43e8-4859-66b3-08de4c96174b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|366016|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5rLQWIGLXx75ULAQVqlSemW76EBtqV1KOLYTu32WnioA8Uaej+xFJxwwqvhG?=
 =?us-ascii?Q?ho+ilj23EwIIF9vnT2ZbXfLQ3+P9ymU889ony9hui+S0HGeBH1O+Z/5pLfkY?=
 =?us-ascii?Q?98xyi/Fxg+JVuph+D57uqCfS3VlBdetYAYXnhL/i8KX+1eApLuQlxOk2XjVV?=
 =?us-ascii?Q?fZqXA9Enwhj6HkvBOIhCtQuMkIrgERkxVSllGhu8SghVLA6y2e2Y2Lw8Wk2X?=
 =?us-ascii?Q?xraPx3OqIMfd33452dLSAUDli1nmBNem6TihwRJpBpBEZQEGg4wiEUd0o/Z3?=
 =?us-ascii?Q?FZmYgPYooGmzvAtwixOMZQ/jzkO29OdRJRzy0BG/oKJLX+Acdlqs++0i49c4?=
 =?us-ascii?Q?RVfbx5lm901mlahAgMNbyPLDt+6Zkc0EeeQfHptfswT9LlaXN9Lc+e0oUqKI?=
 =?us-ascii?Q?6Z818PdeyGShtyX0QPeJM+GFWpDhG2iVD91e8fFXjZcpP5LXUEGD1ADjKiGs?=
 =?us-ascii?Q?6a8AF5HAIljACwyREP/cujkK6Vr5kE6t4RgcqPhkWOygbXngTk8pZfHYUMSY?=
 =?us-ascii?Q?Q47DUEkodYDE88ups/2kYK0c0U3bukSMgojVA5EBEpN8zgBuZ4z9L0qLnplJ?=
 =?us-ascii?Q?AF4D4MIsK5njy4nhawXWp/5p8kfp0zdQ44V2DEPn3MLvJu7j8DttFeM3zpsr?=
 =?us-ascii?Q?hLEutbc7gOlGqzUPKsy7p9CENdXt6xSNI3kG73ovGM3OXYEWnezmjgvYOFN4?=
 =?us-ascii?Q?gb3mhpral0DPY9LQYgwbSsiQojlJzEvOYU+u3X5fJ2EgJefd6zaYPmar8P41?=
 =?us-ascii?Q?WJ+EBAkrmbN4se4w3TgqM4CKVC67YZnnMSyNeUFjytgrJ4HxazyDell9N/iu?=
 =?us-ascii?Q?eksQhNCScmK8BUm0QfTsWr0qK0PtQN0pYDSdwiF1iE1fovE/8eY5Ti2AHIEd?=
 =?us-ascii?Q?MStuyYLSqTWacR5QHO5++Eg/AGuuE+CEg+6KrJNRrePVvLgFc4sNohBZUZgf?=
 =?us-ascii?Q?KTw+mDSZQuSnwYGnytgDBfIFRgowCzjgrrscO7Nf83ZUugyqAulEuYT3dzjx?=
 =?us-ascii?Q?rc7OAP9He6AESpSefF88S3NVsGl3zzLW0ASIljbFXhbLWmqukdr0LiE8nMBa?=
 =?us-ascii?Q?0K+mXdWtM439PHY31PJB1Jt946CjrjrJMbULHAt9vswEdburpqaDVmzkV9XC?=
 =?us-ascii?Q?Gvh2A2MHrZhTuRBhJ35H37R6CIXAliOKGYg1OWe9ViiyXqBj14liFe9ZGmEy?=
 =?us-ascii?Q?4ijFfWQCHuEIFUWm2QDd+uwATKxiCAn5qBWp29Q268KVX8cREiwjZk+fmaR/?=
 =?us-ascii?Q?0LBfJxjIPamuu9yYgBfoR9sIdr1oEA3oYHfeUUj1IfkYl8obS1nsnV70ZCG/?=
 =?us-ascii?Q?vlEks2uDZwCXVwp/H1WA/YXwe5XdfHEz8YAhYsz8ILGuK8e/82jFDTW19m00?=
 =?us-ascii?Q?aM2NWfle9w6O/XlS2t8pKWmc8Tv9Ed/ArvYje8HDwblC/b2s4AjD1/VDHHk9?=
 =?us-ascii?Q?jrR4o0lboIRBkaracUcDL8duBMOOQCU5vv1VDM5b8YZoLsSoIrSWXufAM0Ha?=
 =?us-ascii?Q?qX1lkV114eC0bn9T+OITadche4bvnzyfL4L3wQkn/3ZAqLYFC/gHOTBBOg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Ddg9WXgLORK/ozsCpSCJcpv4g2DlX8dmgqdGU+p1u++tZYwW5gfAXRuOGjR?=
 =?us-ascii?Q?lSucTsjV2AhWgiq5ytaOrk3kHzdeSO/xA7qw6gpTGg0sznnkxQgXQDZahqrU?=
 =?us-ascii?Q?LNGHQQ/LfDpLFsh4xn3mOMSrYEl6DkFMaM7WDNKr4WbQ/6gt3kaQ+CcQrDl8?=
 =?us-ascii?Q?MvOZv7GYhodU17Lmey/7R4rZibNtcJES3y6F7qqHiiHzEdU0Zo/v52+VPWx3?=
 =?us-ascii?Q?nQOBnJICjqApkJXx3xEd8q7HtR5d436ai2MM5Y3hZPYWVxeK/AxloNrZEf2A?=
 =?us-ascii?Q?mzAAWT9eNh59WPN5TpgwiJDN/ZZ2gji8aBHZjTs7yk/zpLjSZaZMbVjI1WDk?=
 =?us-ascii?Q?qO7ntAIHf5Cp8ATN2jPxmcEioNgzp4obr6MaKnx2YHUQsATEWOv86yBuQs5f?=
 =?us-ascii?Q?9vnnyVBIEkYZgE9I3FvV0ahay6/isLxB0y75pAahr85TpIyyR9CM50lKy2b/?=
 =?us-ascii?Q?bCITnxBqsnVa5qUGXo8v5Ra9gaJKkgRxVtoS2nrzoBoKCt4HlFP3nM2orzYx?=
 =?us-ascii?Q?0En2j87H+1FbiQ9QXSqUDSiy8aP48MAZzktPN5HiSDeYU0DtXwUXvEJ42WAC?=
 =?us-ascii?Q?N+MkZKEaab6QjTegPxgeRQHpRQALCfT3YXUeiitvK1x8Gv18eTvhlrB0CKUH?=
 =?us-ascii?Q?XX/08OxP+KXDCskaG0POPPpu5SRPsJqQ+H+NTTiZ7dQZUXaLwJHTXAj1Ls6k?=
 =?us-ascii?Q?ybk0sZlP6ulVfKtn3lhDy3RLmBB84HWOCdXmTG53Nu0RQCKC4clQ3EOBBHRN?=
 =?us-ascii?Q?k3vE0Oe3ej27NULMUQaQczVrzFPc7qtDTkgf9lLLW6O7wciG/B03cZIR434c?=
 =?us-ascii?Q?/BJ8sQzFwMvMztbDyMk+KOMt3d6irqoiqQXcLTekVgyjVatX3xb7Up7XFqWb?=
 =?us-ascii?Q?nOUQ6yxm4rvBUf3ti8Q8/7jUFLArfvJ+i/6pu9iE4xVYbsJG3kVNG0+htp6r?=
 =?us-ascii?Q?wYbn9TxldPG8+KGvmbcw5oXNUb5kEcI9mKT9acbhZRZKh3s7xXJ3eaK8zCN0?=
 =?us-ascii?Q?N4Exn4DVFQDY0gew9WVtjjJPPZ4pWbITTlAzHi5a0SzEqY9+Qzi5CvEul2PK?=
 =?us-ascii?Q?uccmAZxYXp8JzXeT01CZrAuamV3MR6l/UbGqyLu7JPjonAmHGzszRBXhek8M?=
 =?us-ascii?Q?67ZBF/9wghnBNd/JUgO7wWoyghmRB+W0DkrnDpplEUTE9RScYAEjAhaDbJYH?=
 =?us-ascii?Q?4Wa1JyszKZ8+IXvW/txV5b+gQ88Bj5wIbndvdKuiUqyz6Tj05RXyvh+mEKsa?=
 =?us-ascii?Q?c2tm3SYvBWyFmusp6d5x6JcFRzHJOAOW3/f8FPPId1Ag+eufKM0NGgvIPKn4?=
 =?us-ascii?Q?Hc3KLVCFVe9OLZPu77vKA/h/IS6BrP7s0b80cUQMwNALjU4EuuVevy2jiG3I?=
 =?us-ascii?Q?kHHuY1BFxMTyzTYpyGPsrvH9J2yFDBi6vyI1ORbUR6MgGU8q7h6jtw3taoek?=
 =?us-ascii?Q?BTxxImzHUzlNeDfHInya+4aqpF5+98xMJ3AHKF09W/RI5GqdZ4c9PmFhHm2x?=
 =?us-ascii?Q?Az6px4YGPPLoOB3nq1ZT5d3opWAxLrHT1VrkZlRUHhUWTB0J6q0EBmlbexrf?=
 =?us-ascii?Q?jlLhR6nQDdL2D+0zmVLIwfuW9FhZv+bEy5uuGOG6WEppgVNu2lBAhI9pHN34?=
 =?us-ascii?Q?XCEAd7GhAdY9l8r/kEI4XTT0RvDySWJ7FZffFxuzJ6XFqWh8yBwbO5jxLCTK?=
 =?us-ascii?Q?tGpTb/kMe8pVKWxt0si4u9U4HxiseZXwVght5VJ2GaSEAeJd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e367e2f-43e8-4859-66b3-08de4c96174b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 20:07:45.4172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwE1IQhDeoXzo3ZbSR3RiWqPrC7X73RuzkLbTvyKsgr50BOeJAuoS76zFuOn08sBSHU91uLYdFCzH/N+IannBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9402
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_120749_668136_36A4D0E9 
X-CRM114-Status: GOOD (  16.29  )
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

On Mon, Oct 20, 2025 at 03:00:42PM -0400, Frank Li wrote:
> Add thermal-sensor and thermal-zone support.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Shawn:
	binding already in linux-next.  Alberto's comments is not related
with thermal-sensor part.

Frank

> changes in v7
> - new patch
> ---
>  arch/arm64/boot/dts/freescale/imx91.dtsi | 58 ++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/boot/dts/freescale/imx91.dtsi
> index 4d8300b2a7bca33bd0613db9e79d2fba6b40c052..f075592bfc01f1eb94d2a2bd8eea907cc2aed090 100644
> --- a/arch/arm64/boot/dts/freescale/imx91.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
> @@ -6,6 +6,54 @@
>  #include "imx91-pinfunc.h"
>  #include "imx91_93_common.dtsi"
>
> +/{
> +	thermal-zones {
> +		cpu-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <2000>;
> +			thermal-sensors = <&tmu 0>;
> +
> +			trips {
> +				cpu_alert: cpu-alert {
> +					temperature = <80000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu_crit: cpu-crit {
> +					temperature = <90000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_alert>;
> +					cooling-device =
> +						<&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&aips1 {
> +	tmu: thermal-sensor@44482000 {
> +		compatible = "fsl,imx91-tmu";
> +		reg = <0x44482000 0x1000>;
> +		#thermal-sensor-cells = <0>;
> +		clocks = <&clk IMX93_CLK_TMC_GATE>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "thr1", "thr2", "ready";
> +		nvmem-cells = <&tmu_trim1>, <&tmu_trim2>;
> +		nvmem-cell-names = "trim1", "trim2";
> +	};
> +};
> +
>  &clk {
>  	compatible = "fsl,imx91-ccm";
>  };
> @@ -69,3 +117,13 @@ &media_blk_ctrl {
>  	clock-names = "apb", "axi", "nic", "disp", "cam",
>  		      "lcdif", "isi", "csi";
>  };
> +
> +&ocotp {
> +	tmu_trim1: tmu-trim@a0 {
> +		reg = <0xa0 0x4>;
> +	};
> +
> +	tmu_trim2: tmu-trim@a4 {
> +		reg = <0xa4 0x4>;
> +	};
> +};
>
> --
> 2.34.1
>


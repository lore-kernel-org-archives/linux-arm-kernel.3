Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79179E81BDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 16:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSy17ecEetMlooKrnYNn+HmenFW2PcG3vM8JshOolFo=; b=1yAtfOAtw8JbpEaFL5B6S6ngu5
	7ILDGA1Y3F817gD9Sr0Y3OOjBj4ct55N9A5EGCNFNCQZ2KZyz2+vzUcPFCDdy6rdQ40Q5Xv8rXnrx
	nGzxItlWJ85jFp/pvHcXcfscgdjrznEUkkOpxZT/6/DC6qoT2oIFJg153waJozojvejVfwNx9VjYE
	v2bEIFI6bShmtSjpGiGdXE9Le2B1gYimiQjk7uxOEab/K21V/DESjBMCQ44BvZAvO4Dk9/PX8F+Hl
	SuLDYlrCnn9O5KKAOPVuogMsRVToZqpN4U2PgKaAxTAkvlvTHHrZdAftjSlPT5l4YLRGplf5r1g8s
	V0HaS4Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTzo-0000000Ffzt-03tK;
	Mon, 09 Feb 2026 16:20:21 +0000
Received: from mail-francecentralazon11013034.outbound.protection.outlook.com ([40.107.162.34] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTzl-0000000Ffyf-0xer
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 16:20:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3j6T7N0dhSDhIhnpFI9LkyZJezJ26OdcuRcsgYc4p3Pb3TOZaSh9P7NnufUc17ncwJcCl7tOppzhbcDcPpD2YXVz/sYD/bQt4LyzzCCGcwBOshGeRP0PL1M8n5deUecE1OlwKmgLqk/Wvaf/xkDit9fHER1G8qd/juhALPB/CWiGcYTK/pRj/JUeGcjDXddm5IQth5hKtxw/R9vSFWrYovEnviDJ3S90wZE8ciJqPXU2bWrh+KjxGuBgIa2XlwIkPPokwAmJ7FKzLjcSlG6bJlYetgRxden0kgaODlQwP6eWFUjwAVNIbR60bHslxFyT35gocbBMNAsSL7GeWWtuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSy17ecEetMlooKrnYNn+HmenFW2PcG3vM8JshOolFo=;
 b=qtx1iEw8tU310l4ED6sb4d0vtbwx/2sGtM4f3FTWY15mFBGRMr297NKLsGnVP2i3PCgFFFC7S9qWQMaqJbgQnH+8bsNLmn598MdYUvUVI7/K/ujQ3Z6jtfw+vmfKpGo0lPZLt4Sw8/ObNjLaZKkHcemMh5lWOCMPFJwXjhHkaZPJ91Qj12+tp12PELjfCjJ8WqKL75Cv25EfJk8feD0UnfhYeVllXKpd0pUEo3uL33/R99kDkk8ikgPq7lxCcgNAnefJq46lQ8G2WWhaDQsGF4MvOmegUMkMkxXAKKzzNMu2G26RiXZGerOc+xbBmygSv7hzQgdQ26CM4bt/PJEy3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSy17ecEetMlooKrnYNn+HmenFW2PcG3vM8JshOolFo=;
 b=iexgiT5Q/nD4QFLpv6iK0hR4kov1PXkpwealC5Sl98EltpWu6LRBCOc+Up2x4ugbzyMk6NHiKHb6bikKER3LnbJH770D+mSTSSzB/uWiARLCRAH8XSDQcTu6uw7OfMod3pkVZMa2art3WYqwxWGorFq5/DTmB8N0yJReoVbsEb0Oxr2+DDK6Mt5Dmr1IhS7G4nUu39UbnblVZDMlAU93cCHWkNi2pIrQ0vo46aUCEHzYYNSuW77/EFwQZLAcw43fYFNZFwG69knTE8GWXiQXrtJAUlkLJlrrZjTBnS6i9RdOqaVIJrp0Yk/iflRmjPQY07CLnBVKyyX002c430cw8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB9184.eurprd04.prod.outlook.com (2603:10a6:150:28::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 16:20:09 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Mon, 9 Feb 2026
 16:20:09 +0000
Date: Mon, 9 Feb 2026 11:19:59 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: tqma8mpql-mba8mpxl: Configure
 multiple queues on eqos
Message-ID: <aYoJL_uY1JiCWpQh@lizhi-Precision-Tower-5810>
References: <20260209143555.202042-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209143555.202042-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: BY3PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:217::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB9184:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b7884d-c7a9-44f7-578d-08de67f717dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XjxYpeAv31ZB3RH54jef/ye3b9F8z8KbCnkbgPti2vokgY6dMgrw89vCgKso?=
 =?us-ascii?Q?4kQJvL9lCSRhkkNQCN04GoNAkr3aOQQzv+EUqZX6dSk8pFfpzUkOz9kBS1Ot?=
 =?us-ascii?Q?LuA/nEvLIup2DvwsOqms+vM4i2bAOjHzi1/RJ7VYJv5ODeafF4zSj6PY1oiy?=
 =?us-ascii?Q?QoDUnmEAvYnqNMCnd8NqrUdm9xDziBURKTJYcdEzzGMfVEoNSggdTjOwvtd5?=
 =?us-ascii?Q?j8YzinUhfullMxDdaZUEcX5GZkX67IfzxmdKWqTP/zgWJdPDoN0XsLdTCHFS?=
 =?us-ascii?Q?YY385n3StICz8J59b7Su0XUwCibwNi3XM3b8zcjvujd9yoai1z8f7LLRXNm2?=
 =?us-ascii?Q?i8lsDMETb5CiPxQ41tq7OF50NBQWNWIL+QvKvk5Y0Dgloeyo6iKZT30f0bkU?=
 =?us-ascii?Q?Dgjsn+KMJ4UZ0wHjWTvhlvNqFohc85+3DZ68VXeDpfBDDECuwlXt5zw6L92v?=
 =?us-ascii?Q?qMyYN8ezqmEFnrS8tl5SGoiQ9eF97HvY3C9xsy3tWjrU+4OnPA3bK8W2FKCx?=
 =?us-ascii?Q?Hw2tQnVMUvQLJj6uxPx1YbPDYUoUAuownqleaOElQxNPNjjgKbUftSmiMRu7?=
 =?us-ascii?Q?gDcRxAnvee/KqLU6CzFbJivQiZ8x5ofZ8vj8OY8+HTcTn+79zsTLob5yfEAz?=
 =?us-ascii?Q?OWppsT3rJ7ggU1Zg8bG6B17UL6wsgU/pA8zzm2Vukt9kjwpNUmFD2KbhQzR1?=
 =?us-ascii?Q?ZJsQoDnjPyKdTS6B1uovWgZeNci8fva9YFMtPmVGFiV5knKwqRxYEZ+ZqVJH?=
 =?us-ascii?Q?AVdVj7RVm3dI1tqG96OLxRgRQ89r0/frqDXZJEnMpOIaXagHTATKdjBKtSAq?=
 =?us-ascii?Q?lrZAxfxGdF/kj6V1QLDqEy2xZp+OsKzTBfDTyv030XMhf3t9UNMLxiaVvn/8?=
 =?us-ascii?Q?c4ZzU34SCAw+c/FjmbnF6dqfpM1SEHxWKWqntenOhKBuuiL/yt8T9sOY0NR7?=
 =?us-ascii?Q?vPdVgVCbAC54REZqwT459YYOxVuS9neEQqAy6ppVq2wozLe5HqPwUOQmxbqv?=
 =?us-ascii?Q?fivrr6/X+yDrHOc2jIJaSQCScZ3w9eR36sKunTy4NCOJiY0y5RwqhbD4IdT2?=
 =?us-ascii?Q?I+6+7XA4GCVabY6IgzZEa+gsVZPhhfM1WFt9nvQAa23S3ifpg8/kWc2cTwcb?=
 =?us-ascii?Q?ExlyOOgzMOdgye5HmLLcpOJqkivNVXv3BjFBT2ajcaIzoMXkqBT68SYtRW3p?=
 =?us-ascii?Q?UbsrJ0P8FNWpj1I4JwWiM8a1S6BWTYsjSPaBP24idyGc9SjFVE6qRhVck9Ot?=
 =?us-ascii?Q?c+XmCzOGtOnLSsuei4wH3flLn34/nQt7XFy+n2QRLjBZm8jSpaYCUKDEkCNr?=
 =?us-ascii?Q?KRGW57j4RViJ3PDVMPww2mCGVXEQO1pdmtbHaxgfMpLl/NjHh6hAcZdLN+mE?=
 =?us-ascii?Q?B2EMPULa1fQv25A232zpfR4Cw0NP4egJ7Ag7Z1hocL8CPhF+3oy7h4qbK+sZ?=
 =?us-ascii?Q?ENpXEbdVjzRgxvyAgLPUrohW+ki3EmRLaqU+sjKYPSuoeQF8e/c45XLpFKTV?=
 =?us-ascii?Q?SFoPI6gCA0wiP76SK6Wuybp9t4UkxmFfd8hNi5KUsGCokM0sGN3+BqALRSgT?=
 =?us-ascii?Q?xs0iO6TP1ybtwOANUqdutHyNtyHhTV4ktVms4lIeXRgWGe/Vd2O/thA9n924?=
 =?us-ascii?Q?lGhpTPX0i5WLyqUSWwxsD6A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7no1HLMR7hbHd2NbGSxa0kXvV0GEhNGQ/7t6EHjKtfjE1/VowFNOIZRL7RJe?=
 =?us-ascii?Q?tqIF4QsREWXr2b8cwlZKnoqPcWWTDkigPrUSA23zr1D2xeQbpd3ZhaNFacaK?=
 =?us-ascii?Q?Gs2YwXaFS1g97vxn1uQFn7BNcfbhT98exw3F94Zh8yyhs+3UsTGI5CMwbXD3?=
 =?us-ascii?Q?rzl4/hZaGHJIIiXj1KAB+UYINJb2ubZlfbdQFWOenmEGbhsVqZKLJFDQP4Og?=
 =?us-ascii?Q?SC5C/zv5Ri5NeEJxcT5lxu/0DgHkoXnnjcSilsgJCx2uLg+VOuU0vO3nzXMB?=
 =?us-ascii?Q?bGugseIaHIjXBufgAejqhI0LeuNj6EXYwWsVPN9YMSyJUCrSUemaNRrINEZe?=
 =?us-ascii?Q?2Zb1R5GVK/oGzb94RYu/5oET+nYZbjWz8oFcUHy5+pcLL2KfEV4p7XMFape4?=
 =?us-ascii?Q?MLKzxU3F6K2wxpv2JpTlD6u1K+HQqouDqeRXTjofcezgfIGeEQiaJGL/QeqY?=
 =?us-ascii?Q?VbSmnsU104w2i8hJAmqn5CxbRQ3bZcEdXnLeR/wwWw/mVyd4I2ksbTL/AYLP?=
 =?us-ascii?Q?dcPlCbJW6kXm39eyt5MgLBWOeZudC4AtXS5yN7OKkkiAuoIo8SDzQ2bHxLjr?=
 =?us-ascii?Q?MbqHVqVudcw8GlZp6C8LfzRNaVApkP1h2P9+f8U7rgwGUkAcdc1xUIm7O3oy?=
 =?us-ascii?Q?qSONBjXqcD7+36Yn4uTaCEEwsL4JyScQReICZgZ8xK31PrdoGzQl2/5iztLQ?=
 =?us-ascii?Q?+WnOxXRFCvxdJj+YO2P7uXkOQiT769/Gr6yRFw091AxENe5QDOxftAXmKZAL?=
 =?us-ascii?Q?CDsRfvTqNpLnz/Zi9Rmebnikl2C9PNgLDaUaqr6TaLzZpuh4sjeh0xwY6b9K?=
 =?us-ascii?Q?Pasmm2pQ5KfEetPEmoLIJQK4VoRW7B+aYINHIYVhw79RX+sTmiq1KM6KFXeO?=
 =?us-ascii?Q?ty4Uy+JACZw0K3V3kCRNJjjCT/wqAsrw8xbGVEIVGUr9THCv5XBorDawxIBJ?=
 =?us-ascii?Q?h4sTBpF+zXzEnmj/472pNisxc6hkG5CJU+axbhT+Yz/9NxYnwUQRh+8V/IPQ?=
 =?us-ascii?Q?VL42qHVG3G+ndRk0OfrUhCkQxIycHRLIStPwbGPnJdKv/POiJU+/v/kS0nnL?=
 =?us-ascii?Q?feQpUv3XNBi+bMeKvVJTC9+wf0/sq8AWUVKOEAQhZi8a9GS/DybCx0FNIjqc?=
 =?us-ascii?Q?PjAbTcUqWNfhswXmQMEzmA49ZUnSpSsL7I/tPDY1dTOlo6tP6owjBmIrpvXQ?=
 =?us-ascii?Q?3GrAyK156Qk+tuGwfxaRCYYle/fsUp/0JqyPZYg0Vp9uUnoWGSZmT0dhbgZp?=
 =?us-ascii?Q?z5b1799+r9iZC1owcwhFkC8kx4s5oDK+saPOT3CXLE12/5NCX2odvUMJkXKG?=
 =?us-ascii?Q?CrkNAjQWPK6o2gAIBkpXslJBRRLg++bXi6cN4AEH6oAMgCeCxv4RwEzk53/k?=
 =?us-ascii?Q?sFIW11gVe5xcW6elMz2Nv03VWYhmwAYqgIo3ZjY/q0vMdbWpJ2KNXD0ZYm+4?=
 =?us-ascii?Q?GZpT4FgMjEgbh5diT1LN6nCogCJ+Tx0vXqCQGnre0ZAve4AVn+4/w8pG9hDA?=
 =?us-ascii?Q?asqcubRPr1PUILXeUQqRNCtJHUTGgMbZRr0NoTJe7EBAjVjrc1/WeCZZdYQ0?=
 =?us-ascii?Q?CQwDI59KGU2p2RcGjIlOGz3Zrrgl2N7hygyfjveh+V2Py+MTrNZokkdnkrFw?=
 =?us-ascii?Q?h2Z9DAvum+B+9iS2Jkorr/4Rqjo+woEB1NLo9YO9R0w70tdrwnpWfnBfeL0N?=
 =?us-ascii?Q?7phePrw/9sUcR+abLhTyyoZVD7f+87VEoFdLu965iZpfWrHr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b7884d-c7a9-44f7-578d-08de67f717dc
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 16:20:08.9577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EGw73IBqb6sVuAJqz7FHGSA/AS8egmiy3lD/Wy+R+cWIwVxpxabRhq6Fgpc6jilokW3CEB0fO1Tzza1Xr6HovQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_082017_333009_BBC41513 
X-CRM114-Status: GOOD (  18.11  )
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

On Mon, Feb 09, 2026 at 03:35:52PM +0100, Alexander Stein wrote:
> The MBa8MPxL mainboard has an integrated PHY connected to the EQOS
> ethernet controller which can support up to five queues. Configure
> these queues in the same manor as done on the imx8mp-evk.

Nit: Add empty line between paragraph.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Setting DMA to threas mode is necessary to prevent FIFO overflows, see
> commit 0bc3e333a0c82 ("arm64: dts: imx8mp-evk: configure multiple queues
> on eqos")
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Rebased to correct branch
>
>  .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> index ad49bf85a04d3..890d1e525a489 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> @@ -336,6 +336,9 @@ &eqos {
>  	pinctrl-0 = <&pinctrl_eqos>, <&pinctrl_eqos_phy>;
>  	phy-mode = "rgmii-id";
>  	phy-handle = <&ethphy3>;
> +	snps,force_thresh_dma_mode;
> +	snps,mtl-tx-config = <&mtl_tx_setup>;
> +	snps,mtl-rx-config = <&mtl_rx_setup>;
>  	status = "okay";
>
>  	mdio {
> @@ -359,6 +362,70 @@ ethphy3: ethernet-phy@3 {
>  			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
>  		};
>  	};
> +
> +	mtl_tx_setup: tx-queues-config {
> +		snps,tx-queues-to-use = <5>;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x1>;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x2>;
> +		};
> +
> +		queue2 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x4>;
> +		};
> +
> +		queue3 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x8>;
> +		};
> +
> +		queue4 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0xf0>;
> +		};
> +	};
> +
> +	mtl_rx_setup: rx-queues-config {
> +		snps,rx-queues-to-use = <5>;
> +		snps,rx-sched-sp;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x1>;
> +			snps,map-to-dma-channel = <0>;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x2>;
> +			snps,map-to-dma-channel = <1>;
> +		};
> +
> +		queue2 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x4>;
> +			snps,map-to-dma-channel = <2>;
> +		};
> +
> +		queue3 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x8>;
> +			snps,map-to-dma-channel = <3>;
> +		};
> +
> +		queue4 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0xf0>;
> +			snps,map-to-dma-channel = <4>;
> +		};
> +	};
>  };
>
>  &fec {
> --
> 2.43.0
>


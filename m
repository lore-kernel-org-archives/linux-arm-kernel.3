Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD5BC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 21:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRxYNU1lMNzadRdWkzv7yVp5LSZJ6r1XOa8SX+5w2a0=; b=GX47gfGNt4TphvYlzCciJjIvYj
	11W5q8yoELj+TqlrfgLtqfSlas5G90RxS+p3lHIfIX/sJl9H1I46PH9IYBQNUoOwiT7EFgwKrTtZ1
	s/cRWmen2XLdWfr/UFSJFV0bC9oZOc8/Spx6fPppNJ+v/MrIkvSdyER5uivhUxrJbalN1taoVSgzt
	y1VAAf9FN3CT+tLipRgHDzjzIygKtvlifJv2ekhYw+2xkVmWrL27kVQSu2pMkqniFHzcwKljyC2Wb
	BuAgDWl24dbkA43hjIVToGs+a2NeydG2FZTW5B/CP9aib+eFXN23reRESE77YgDtBKg8Z5V8A9+/U
	tRnNa+mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNHpU-0000000GeQv-47LJ;
	Thu, 05 Jun 2025 21:08:52 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNHgH-0000000Gd7F-0KH6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 20:59:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yyv5IBZylZrmIPZo/jzznd6EsbE0e9D2Yu/OV1E3KvoQOyMeQTg1mMLZK+YmN1M7++B2NOdAlRCe4Jxj/NvGznAHvttTH54J3PDAGZSv/jTmZVNqoH8MwIRpLIvOTXDL7zpyv6/v+y8c4kB2hTWYvKu+A63k/iri4RA4nUrTOEgDfwZbNhLiKmK8yYmYJlS2G+ANLFyH/YVPUD35rnzg62mcB0hk2XqXgXfMjEZuHm7jnQO0QhvHYJEZ18CiLTWijHkf7qVjm+cSkDC+dXdYbtqfe1L/u92pGhBJP1FmyLt+uWa462J4/eH4KNtWYgWSPASImQMCdcQ6cv/HnntOng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRxYNU1lMNzadRdWkzv7yVp5LSZJ6r1XOa8SX+5w2a0=;
 b=B7N8yd5MbDntxZKxizKPJ/OybIQwxRu81Gukg9z1Jkpj1Uk5E7ytNA8JvSPtBPjoRS06s8Q0NTT5IitHN3ts9B2/u+/z1H1RYgF1aODWzK3tb1KfS4Kz/98/QGR0FygL1Q7bH2bdR6vIKQk81YqilCzzrKzeu8sr6y40ttP9qJi/nIWBma6tH1aVFBRg1KiU64O0CLoVXteQjtHi6AZk20bRQxGptADHthgsky1LrK0oWkyMUZOyLlLRsHb9uNIZ91RsW47dEIyRJFfiTYff8R35CVc7+tf2qre8Pd93BtM9tK9x6EfC35J0hOZ/oblgrfomD35MW8NfBuhCPvmO/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRxYNU1lMNzadRdWkzv7yVp5LSZJ6r1XOa8SX+5w2a0=;
 b=nlbDXJfCvClFpk6gzz2oS5kBOnYCQ6pOsgad5FjGtx/zrAKAlSzRyzIduNJivsFGUUw34A+TZbsp4J8PiLRk6SmrAgVIruDgz9H+KdVsXg1b6PC3GEKaBsZ7oLxQdHh2ci5nCuRba/+H/RwQYoo6mXrNYoUVqZJfjJ2tfeGEmulIpccXVD0dbrwAF4iK1j8McRrU3re6EASSvb9DH4RkRyK8Ou5Yha8265tigT6a60Vwopmlw5xGY2IOcb7urPLjj6YD8OmMHPO5u1JcFZOU2mGwrQwBZSD6B6IY3LuUwrfzFzIFsalQH2h5ko3QE2/rbLCl0OUdN5ofbMGpB9aSUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9697.eurprd04.prod.outlook.com (2603:10a6:20b:480::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 20:59:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Thu, 5 Jun 2025
 20:59:16 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 4/6] arm64: dts: imx93-11x11-evk: disable all realtek ethernet phy CLKOUT
Date: Thu,  5 Jun 2025 16:58:51 -0400
Message-Id: <20250605205853.1334131-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605205853.1334131-1-Frank.Li@nxp.com>
References: <20250605205853.1334131-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040A3.namprd05.prod.outlook.com
 (2603:10b6:518:1::57) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9697:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ac399f-d34e-4408-bf12-08dda473d4e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fwMwgVUrGJUETvuPd+S+Yshs48nfrddlXEb07nYFHCPSSBumQqQazCN3RX3z?=
 =?us-ascii?Q?TU5lvCA/6HnBoyj+OEG4Z6xoNv9Jo/WSaNGkp4WtiOZGPRRU8J8k99CwAoky?=
 =?us-ascii?Q?w7T3es9uOUwMNKSU8gw/J6MTY63ZbRiDorlecaIf7QF+zoqN1PgDKsbX4HIT?=
 =?us-ascii?Q?Mq7g5VbgcmckGYfXnnbTqh4oitx3rdgj2XwkQxAF3q+SI9Y7c/RZ7Kd+kGrH?=
 =?us-ascii?Q?EVYpHRqOFAjbrt8YYYuSxCda29LAQrsg4/NUeZ3oYsNdFkGim/1ufcohofEt?=
 =?us-ascii?Q?LWH1ZvjKnm1WNd/WFtKj5CFPQSKGV4Bai820yqInTL8Wag9JxbC0B0vD62L9?=
 =?us-ascii?Q?idSr8qTYGVs+NoZVy/zX1w+yHka8OVZ8j8a6+nNfIOlf2DkY2gdQSGatQYDr?=
 =?us-ascii?Q?eJa4kUUrsrO/rpJveF4tFr7VFSglB8t8uDdHZfZScroUx1CC9TWIXAVkzpuW?=
 =?us-ascii?Q?PUd3RDc2/kuIw38Z1EhiJkbMCEmG/O0bMGo2RmRR5jrqwme5PYRM++Lqvf5M?=
 =?us-ascii?Q?nhDO1E8JZ737Pb+XBvjtjMVtsCCD30voN/qmgCzL3aYjPgOCfEzptzToQRbc?=
 =?us-ascii?Q?2bx38Rh/qA+FhmUtsXYrL5TkiybaF5rcSKPhzi5UV12mO85kSjcU1q+hKz0g?=
 =?us-ascii?Q?9hqdWj52FZQ0aJZqKTTypqEpJpW7igxjpa5bXanlFW+W7gRGiLnwW7lp2oem?=
 =?us-ascii?Q?bE2COwriFRAqsxdqQFe79HGIleUWuIYIOu1pfoSUMV7YK25+wHt9SbkijbXS?=
 =?us-ascii?Q?mYAJoDNuY/hNGD5Y6T8muzvDe29WJdnjDdtb9b6d+viIVpvW3U+eRG0fHOSz?=
 =?us-ascii?Q?0TFS7F/Xv3KwqNFwy6th5XkrBIB2y7CRwt7e8Z8uIBA0wOfv9zyrfObdJAbT?=
 =?us-ascii?Q?1+x36nSm2WhBADpuscRGoV7KyNuin4/Bz4GKV/u2dVnYyaiIWh//ERQjW9iJ?=
 =?us-ascii?Q?QyKCD9CaB3U28SiMe6wOPDt7USiet+ORIJgJwjd4ED0o9gDpOr6Bfb/pu03f?=
 =?us-ascii?Q?eOGi0OLhWVydRaIQgHXg6y24YIXnNxpMGxA3zEOg6h5ieiAq5vsaHvfjSfbl?=
 =?us-ascii?Q?+0BN9Rn0dVE42+JsgUa1gIPip10ZDyZn8RxV/SY0OC6vZ4UShz1KUxkfns4w?=
 =?us-ascii?Q?US5mZFulB7uo5UgEWA064S9gCH+XqRV600cJ0BMtYxG+4+CKg//EW22d2X9L?=
 =?us-ascii?Q?8+H8Sw7QP50Bwjj32HHhZNOu75xCBUso1TrQI1Uvp0Ix8FiBwf+8j9FfT9+/?=
 =?us-ascii?Q?3xS9MnqXK0CqRm+07OVqX/uw9NPhfRduURu4wA+SgboVlar3ZoXFV57EY1ox?=
 =?us-ascii?Q?Dbnocn8p1Tv3N2kyAba/BGYFHI/RxKP1B+EvXjqzwEKb44Co7VBtQedKEa0X?=
 =?us-ascii?Q?HVdE/xwcQNx9wTD5b3OXqpypna2H9M4uMY/D6mkQzjwE9Q8yDqVez9ElUaNR?=
 =?us-ascii?Q?nFWB/GsC0jjzvAYGlmOQnS/XiRa9vtgTRNYNm3sFaff3xB8IIYbUjWwOEKgN?=
 =?us-ascii?Q?vjO52MSCOt+fA+k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?is5TglCeRG1Y4BWEW32yhUhv4kbUZtITb06cP8kdLF04OTxLrQ0zudkoNjix?=
 =?us-ascii?Q?471O3ep4imLWnW8MhGJpx5RO4z2Mtxat/5oLY2mzDMI6oEfnoR0OnpyBXjBx?=
 =?us-ascii?Q?DZWLB3TebsBs1c0fiU5OwXrFvk4O9lQX8CBDwkNNMm51soHJNJnQodjzdynn?=
 =?us-ascii?Q?oX4ppDtFI/Wvet34YtsDjzjAf2vcLeO2FnZX1JoT1f2deReUKd8reM3FBOfx?=
 =?us-ascii?Q?ayPQZF26Arrv/QWcA+CFOvco3057jV1LjwsPl8ExmsYAtLnynr0WjG84yrCD?=
 =?us-ascii?Q?37jveLNHHXe+MMSJYgtatKymCfXQgfdnvoscDwIgicpktJqED//c6Bsst37Y?=
 =?us-ascii?Q?hOG7IIgck03wFqLjFLW68I64EQGgVKgx1D+Cd7wKYMY9ADVMopinywkE7SBY?=
 =?us-ascii?Q?0NBMMSefah3UHxDpqXC6K2P1WzBZJnhCtmx1qVERQv6LIVrCjko9hqzEQchH?=
 =?us-ascii?Q?rTYFBZ8bvQj0OZopfX3K/Pd1S30XBB4F6jcx5x7zgp39gwJYOcp31LFDHtgX?=
 =?us-ascii?Q?t+cG9ZSDK6SrCkWVrKG2a77B7iQMNqoIquv7hd3cigYrwK1ciFbuaT1N9S93?=
 =?us-ascii?Q?9+4+PI7QeLg7ZdOLvgU6/3+tbnabJBpvTBxbolwaeV4g+1jxvFx2vbCCXMRg?=
 =?us-ascii?Q?QzBmuYWKxtdrxUUtwUCkreI0kgeoZHvczHQMdblo1rEiPFZMY7t3XXgpmh1k?=
 =?us-ascii?Q?Evr8uP/EhVob0tbLaKGlNZ+EikKL99H/OIRqP0kwCIy9XO+ZcPInmH+udFsH?=
 =?us-ascii?Q?9QNKnwWjO4e5rg7e0In8P+3SZsrg/lvX9lEsdFhkk7rbNg1gxEZvQsUJmWmS?=
 =?us-ascii?Q?SipHktLZAuNG1wxXMMaGXSo4Ezv0JtBS0r/nm1v0ARbL9otmxTXxHXKoyNa9?=
 =?us-ascii?Q?sA7gwhjEALLbnWXYjyBjZmiSrHRqb/KsO1tb32fC8AofMCbo/qp5+ajfX9M3?=
 =?us-ascii?Q?FwhnbS2soHiPp3ONd9dHfJaQaKMWLuMu4GFPeoHhcXuWShoNRoUZ995m29LX?=
 =?us-ascii?Q?nlpAKTKEZVgZa6gBzVkhWDvfIog/Not87/RuH7j1icpiNTqUognCFrSePh5I?=
 =?us-ascii?Q?tWTxG8J+ucGCkqpDS9glI6obgowDtEGPvHqjl9QOazSB+T178jw0BE/wlEYT?=
 =?us-ascii?Q?wLw3pg6b5G2g9Dw4GN2y+6FLJrhdrgei4Dr6aEflAcTkvjEZKMl/ILJilKFz?=
 =?us-ascii?Q?ChQwOluC4sR0fhhIVLQXGN3Zw0lARQQloQHl8Vpq5zPwWAEJPWBL7BC0hnlP?=
 =?us-ascii?Q?z8CR0sMb489DeeIUIH5Ndoyvl41KwlmeVIZF+Y7SE/fMgGt5bV7R0TzOvjZc?=
 =?us-ascii?Q?MFid93eXbM1tiwXbLxZD5reGcTVdG3vrVf+52iN2vGueGGB+rI1zz+zwOiL2?=
 =?us-ascii?Q?pN2XUfLF7w+5v32uIr2lWCPqTc7qS/5i96oqEVZE3Ir56qC/n3FMzJRXc1XA?=
 =?us-ascii?Q?eb1wXgp1nSmO86wZd5YyIlad6MSOB7fgolgFO/+pRu+cdZDew1F2twUu/cLB?=
 =?us-ascii?Q?MRIZa0cQ2KUUPPFN5qck+bpTv19Kf45mDS24JJYKNDqGVQlTDeHBzi9ePRCI?=
 =?us-ascii?Q?VldTvz27uNBYE971YSN0lIUqAhyfLJGpbSzz49e8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ac399f-d34e-4408-bf12-08dda473d4e4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 20:59:15.9837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slru87h4lmbjy9Q6hYG3e4Ty8ResQWylO0NdG8DNlRIL43z9Km39NB6wuCfLdgUjE2LF3+CNI6znLIHfg1jrJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9697
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_135921_125751_70448349 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

From: Clark Wang <xiaoning.wang@nxp.com>

The realtek phy CLKOUT signal is not used. Disable it to save power.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 295eb8d90f03f..8688fcb382c06 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -251,6 +251,7 @@ ethphy1: ethernet-phy@1 {
 			reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
+			realtek,clkout-disable;
 		};
 	};
 };
@@ -275,6 +276,7 @@ ethphy2: ethernet-phy@2 {
 			reset-gpios = <&pcal6524 16 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
+			realtek,clkout-disable;
 		};
 	};
 };
-- 
2.34.1



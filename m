Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4223CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 08:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGfTVWJ1dXHION4wsSZzwA3/vG9zZf1wSECAHBt5oqQ=; b=WDS/kReJV5/H50iQIU0xsyEe9/
	qjEDpoSU349rJ7CsPAIktizd/gS2uKrQPJaMDv+gA74BW0erAlz0ozZmdgwtryFpu3K+QAuAR3OxL
	j1W/EEUJvu6EHtFa2IPt0vgPWI9vT2RA5prQNKTnG4rE2QQplouu60wH3AVnCFbxd7gmAJp6iQTUd
	BmJbJgMFluAFDhMxd99a0odXHBatoNw1jPcW5/+5gGeFlqzA3hqLZHNEfifmTfzSpsLteFGwZ0X0u
	i4XZXmUNBQ30V8qVvr9D7wd0PagJVwnvjZs+B3GYhscbZa3Xk4oMI7beSbbNQkpUnEBJmGfBFKlFn
	1Rtyv46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMOa-0000000G3M7-3Hxt;
	Tue, 02 Sep 2025 08:29:40 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLyh-0000000Fu4n-0O5X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 08:02:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGS1tuMgizrQT2S2Bg7JvWQ2bnNiICApCIg30Zqfq9yxY+HMvX4vmp01oOfgXu7dpwLqMvqOpKZaf3qXAXPZf680RaI4gsC5IM70HKfKVOO26ZRvUSi0L0UaHJI8yxtAm0LXaAChVJ4EmYESjMw4coD45ErTHfC9fdDxiJJNPzvweTdBznOdve9K8sP4bOLRr01ItAw81Pa1msQTLYPbNiALLHTPB/xhi4I0vQ2qS/MAKraenZwdxElxdoVtD+7VFWlCnkiGj5iIjn5CsmJOTue3Q5NYRuI9wJIHP8FQ4PQcP2zFfTtE2/6j7KL8MQwEF+JctMTJ8BHd3nBNW6Co4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGfTVWJ1dXHION4wsSZzwA3/vG9zZf1wSECAHBt5oqQ=;
 b=feayzPfDOJ7/MfIa6M4im0wrE1XA/A9h6CQoEtvhZBEan9fhngtWNcA7SLVferAa8SeMw+fgqNrU7QZB5Jphv1JL2r3eMGTevU+7TUsPDyi6ylr4oYqWP+wzTO6ylusBTItAAE6cfQ34p1BlyyezBnlvW6P7mXwZolYbQBE4GJCqGxPp4/cCF/71Ka9wgWr65zXiRR5+1mzLBrl/4ECTJEI/UQJw35zwIZHzkhGgu+Z73rHG6bXWCse/EVLZP4qvjesZBpXVMETaZVIxUqX1UMrBJnrDKDOYdksGZAVDD8sf/phEGmUDc3bu1cp6Mn4KiT8WiR3+xC/TS4K5+ZnVUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGfTVWJ1dXHION4wsSZzwA3/vG9zZf1wSECAHBt5oqQ=;
 b=g7C97dbIPDa8LmfE9yD9WjQW79CoFqbNETWzdvp6hwwV8wizpJCF3ZZuBcJxwtjaBoppP1eEy533dGJQAkFSrXwXk7jvk5FzgAsr2h4Lhb+qBSoKTdGUCtPUJzAke+HtVUNWv6mLJbyxs9b7+6QcKJ63Rb1c0aCEN7cia4QTbnD+FKJec6E7zBwPqVDByA5i7lGQzr2PFylGsjGk+FULK6m7y6Wj+vq5HoXqMYtzgTsGhuf9oVucA6p2JpmQtY/ieXsqouBe4cqg/kfX5vt8m49xUvDQyPuvnhr6IZ6jeDue5yfCtJOCFmc2awIKJUN1u6Kv0uzY76qTKx21wWlilg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by DB9PR04MB8265.eurprd04.prod.outlook.com (2603:10a6:10:24f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.14; Tue, 2 Sep
 2025 08:02:42 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%4]) with mapi id 15.20.9094.015; Tue, 2 Sep 2025
 08:02:42 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	jingoohan1@gmail.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v5 2/6] PCI: dwc: Don't poll L2 if QUIRK_NOL2POLL_IN_PM is existing in suspend
Date: Tue,  2 Sep 2025 16:01:47 +0800
Message-Id: <20250902080151.3748965-3-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250902080151.3748965-1-hongxing.zhu@nxp.com>
References: <20250902080151.3748965-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0087.apcprd03.prod.outlook.com
 (2603:1096:4:7c::15) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|DB9PR04MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: 747bf5a3-aa84-4bee-9272-08dde9f717e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z5+prJpIXTCnwMYYI3eo1tGLjJtBcVE7tS3v41cxbZfZDDBC0pytPCOEviv0?=
 =?us-ascii?Q?pY1CRqd+0CTd9P8oxOUyFHbzPTSzzBao6QFtl/tV/1HuNNyYP/3rRsTRvmht?=
 =?us-ascii?Q?1dsEtJE46a/1m2ApN1skREzEB8V9027M/aJ/IvDVWTOOpO3PvA/bWO287Tkx?=
 =?us-ascii?Q?VDhnCRnIa6cl8FqRB0v1ZeFzyIj3rpXkh8eugbrJb2PP4oN0SYUUiMYgHjER?=
 =?us-ascii?Q?rSWHwqygI5h2l+9k/e72Fxfv9ba4OcvH/2ChL+COvV98eAN9pxKb46LlvYZJ?=
 =?us-ascii?Q?/wq12VLAjuWZisdUV8oBbGvVy8J7rjwl6AjPJfxrF45QckAZr/3Ub8t3HBzZ?=
 =?us-ascii?Q?BUnoPAhfMGAxWVvV1sbyKmKL1FUcE06hBXegPkj/pwNAm/NbgVGqOe4ZZujr?=
 =?us-ascii?Q?o/ijPCNfFvFStlKV5w8LjD5obuRaDeVfy92O97c3KTA6SSrHLQnECAF0UD2A?=
 =?us-ascii?Q?jMkCLOt6dBnr2umliEB+H5hrYwGlCLMg015+a0uwrXMqBjKgJxpf3M/tqQzy?=
 =?us-ascii?Q?1PBgsH2WKoiFkBDocI36+YPxS5xd+LiW78oCjPljPASb2tzgPRp3+vhdowuy?=
 =?us-ascii?Q?EtOM1m+sL1B5+WvFOEJxhPY0QdirfOKWAeQ9pjRmsyIfCk1HfjRh8za0BlfQ?=
 =?us-ascii?Q?BB+ZqAFuZg8U1o5AMb+xtNyMwRTDHHui736y0gnlycIA1SUH1vNwAI0qMg+A?=
 =?us-ascii?Q?ysHdEg6mcoroSOO3YrK0tjQV0fd6ZUzn1c4iWbR3tb2dIXu1UJoW8IdQLtZ0?=
 =?us-ascii?Q?1Q3aq6H1OLE9tmNPRwbJyGIYUH+vjE7k5aLw1dVe1N0lneYUkyXQ8uPvIv2+?=
 =?us-ascii?Q?hiyr29pDL4DB7Rhr4WG4PeetoM4k2MGDtyZTWffBqBgP5YaeFCbqlgE8EXHs?=
 =?us-ascii?Q?L84ViOqXOBYlOqf03pi6PaX8rKYwPY7VQ5TIgIIK4qPleDmgG7PkU7LvVqJL?=
 =?us-ascii?Q?Q1ails7nelaxIuJ97Yutd35EjBfdAs4MJatEb8aFgc153h39+Zhs6uEC1EC1?=
 =?us-ascii?Q?5ahNrv2mxab5VRbNYGYuxXCzQmWGpjLk008XLzzzPHIncyunx9ofFeOAVpIY?=
 =?us-ascii?Q?XauGkSQWIVdr96r9q34SI+Ul+2mY6xvNq5sIlhFEnpJxUFPf0XWhU7aAxK3m?=
 =?us-ascii?Q?nojHZxpE2jGEL3UBTyabmuqHwgWWugiAC2SQfHUIxe4IXo75agIhlCJsVxaq?=
 =?us-ascii?Q?KE+jmUSk58IV2dr3Wx9H5PAxxxEJQ5IbJTObUGnNTGf6ZeLVxmExqm+nPUNs?=
 =?us-ascii?Q?/yEYXKdRN8/0yp/eri2aJgtovpWdcUogvlOTpTm3DyP2dU0WhEIJbmvlx6yt?=
 =?us-ascii?Q?ZLb7wKoiGvxwYeIU3jN5LPAH+74S9t0ccaMnFcSvfC3psEDzRwzF/UhfIds6?=
 =?us-ascii?Q?k1M8YaAsWbNLL6KUimsO3uh8lDGLOncbfHdXiv6KETlpyB50Vq82nWffZe/6?=
 =?us-ascii?Q?HnRhAxphb/wDlb5ha0Et1PVEeLQ+0cSi+XxS/bh+0ZK+lpoRRCK4Hb0Ug4Hh?=
 =?us-ascii?Q?Eq6krYvglCms84o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FKK0597vDEHlAFYfQysM0vTDW+Uk72v/vXNK0IpVR55wSgJ581RMkNNfMW7L?=
 =?us-ascii?Q?TCTxf5Ie4O7agF9gwAhYj1YsmTbOMaa1wyud2jI2QaOnuOXPqxwDN/qVEGrr?=
 =?us-ascii?Q?zmDXKyjZlWOAWSfrpg3jaFA2Gixu2wXRL6o8+W640VD04gSb9fEMWZdpReBL?=
 =?us-ascii?Q?1KtFtFzvdlUFFUgBLAhnDOMPC2k96+qW6bhuHOtMgfPlnaqW+6GhitV7RfLE?=
 =?us-ascii?Q?GPJd6R6e9qrPnk1tKFZOusUUYpHyaF5Q3bJyKK7GF5cHz/kp/EbX3iTP88BC?=
 =?us-ascii?Q?2gnYQPZIjSWD8gwMwIVj4M0vydEWiB+arnyydUsgC6YHQiWBhJQrSv78bsm8?=
 =?us-ascii?Q?YZVH5/sxFGWkXUsOiZGN5lS1+DsybttI2NXYe7hE6ZtwWbbG1ybeymilQgji?=
 =?us-ascii?Q?veP8X+Va24MldagPi3PKYxZuQbjSnW4zb4m0C11gPpdASRvMH3nNLLIirBi+?=
 =?us-ascii?Q?4juzgAh6fA83PO1i7rSnn98NmTtkoM8Go/A3mz/+GPO4/r6ZQrj6M5XHVLcg?=
 =?us-ascii?Q?g/E/nLlGdY9QqrILis6BW6yq/wR8MVmR7AjLLnuv9O+yp8RRiVmLRnX6sT5w?=
 =?us-ascii?Q?vEffjTQ0nnHO94CJk1Vlo5nRQj5tCD/L+9wMaMW9c9Hefnq2xR3U3xPLqiuV?=
 =?us-ascii?Q?gjHXFXtFyrT1ywYTIV/pBICAOHdU/kbyENfJEw+/cEvYpCBx3NLTBAn3B9Gr?=
 =?us-ascii?Q?dLkYdJp8PSPl0Xuh6y5NPwzIe8pbcma/fknm+w2JVa4xBXYcXqd88Q88l6Kf?=
 =?us-ascii?Q?CCHj1C1Ywn0mehnY1PWciDdWoZrAzXdm51DbkGIIW7BVLerabHFn2gT+xvu/?=
 =?us-ascii?Q?o2yG0pxAOkzyomsXCn+ucebkKCRvX40GxBplq02qtsyLvLadPld67ppjuJen?=
 =?us-ascii?Q?c/DJBr9zNEaRcRAWS0ObzPMuUxhpcOJI1Nlv7Uu52jOh56Nra88UExe4oEX7?=
 =?us-ascii?Q?2lhzcjEUm5kdqxgiKYZvO2n+8XVE8HJ/R1keCiho3/m2gFYqqHujmkCS+yZR?=
 =?us-ascii?Q?dtuBA4OLmCb545sEvn/0Po8/O4DBhNhsuAKa30a02T8r6ivQqXkdYA+YW2Bx?=
 =?us-ascii?Q?/Xz71J6XjBJ0EQxlccml3TLCGvFiwudRprVa6lVhOzg9BaTun5VwBIMqf7+4?=
 =?us-ascii?Q?JS3TCfMyjkHUjd/PVtMZpXwjMU+IwAl/YohI/4ESm5wHaLNwKaC+5vYJDU16?=
 =?us-ascii?Q?eaQGZ+N9HaSKFRJPOTxW+2E6yll+4zisJ+4iXEypYw7CGsSChP1vlvKG9fI6?=
 =?us-ascii?Q?35Gq0BFwp1qpyq6RuRa3lipgxAvElO8nuN/H33efeVJ6yIOCjFH7V4ioh3Xr?=
 =?us-ascii?Q?uLAL4Go4m73dCLXpV7+LsT7d8tp37AwgMhcaZG6oxZrOV9e71VKMY6rzerAS?=
 =?us-ascii?Q?IXKEt9dGQojk23kdiukhUGzASYQhMFUEvjy72oiRBf8jiQZVjLaFLGVzdSzy?=
 =?us-ascii?Q?7SnFCTCTUfW7aAjieXptEIq73QtUqnXxrOkEz7EnOZJh41dkMCSxXJKUX3u6?=
 =?us-ascii?Q?3LPXuK9qYfgTf6fymoBv0CaTTNrHIbM23FyM2tFMEFmoKBelI6zUpXLDWaqA?=
 =?us-ascii?Q?WxFfJhtIx9wXXzZHEWBoGULBVJWncolBsPV5Y2iy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 747bf5a3-aa84-4bee-9272-08dde9f717e6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 08:02:42.7237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRfN15RW96nyqWSHaEejruVDd3OtyW2RS9HBTFiBsRMdOHFqOGz1/YDyYKQWSdnT8HlZ/kE98XDUbvIIcLYa2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8265
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_010255_137617_36629A56 
X-CRM114-Status: GOOD (  17.24  )
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

Refer to PCIe r6.0, sec 5.2, fig 5-1 Link Power Management State Flow
Diagram. Both L0 and L2/L3 Ready can be transferred to LDn directly.

It's harmless to let dw_pcie_suspend_noirq() proceed suspend after the
PME_Turn_Off is sent out, whatever the LTSSM state is in L2 or L3 after
a recommended 10ms max wait refer to PCIe r6.0, sec 5.3.3.2.1 PME
Synchronization.

The LTSSM states are inaccessible on i.MX6QP and i.MX7D after the
PME_Turn_Off is sent out.

To support this case, don't poll L2 state and apply a simple delay of
PCIE_PME_TO_L2_TIMEOUT_US(10ms) if the QUIRK_NOL2POLL_IN_PM flag is set
in suspend.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 .../pci/controller/dwc/pcie-designware-host.c | 34 +++++++++++++------
 drivers/pci/controller/dwc/pcie-designware.h  |  4 +++
 2 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 9d46d1f0334b..57a1ba08c427 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1016,15 +1016,29 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 			return ret;
 	}
 
-	ret = read_poll_timeout(dw_pcie_get_ltssm, val,
-				val == DW_PCIE_LTSSM_L2_IDLE ||
-				val <= DW_PCIE_LTSSM_DETECT_WAIT,
-				PCIE_PME_TO_L2_TIMEOUT_US/10,
-				PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
-	if (ret) {
-		/* Only log message when LTSSM isn't in DETECT or POLL */
-		dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
-		return ret;
+	if (dwc_quirk(pci, QUIRK_NOL2POLL_IN_PM)) {
+		/*
+		 * Add the QUIRK_NOL2_POLL_IN_PM case to avoid the read hang,
+		 * when LTSSM is not powered in L2/L3/LDn properly.
+		 *
+		 * Refer to PCIe r6.0, sec 5.2, fig 5-1 Link Power Management
+		 * State Flow Diagram. Both L0 and L2/L3 Ready can be
+		 * transferred to LDn directly. On the LTSSM states poll broken
+		 * platforms, add a max 10ms delay refer to PCIe r6.0,
+		 * sec 5.3.3.2.1 PME Synchronization.
+		 */
+		mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
+	} else {
+		ret = read_poll_timeout(dw_pcie_get_ltssm, val,
+					val == DW_PCIE_LTSSM_L2_IDLE ||
+					val <= DW_PCIE_LTSSM_DETECT_WAIT,
+					PCIE_PME_TO_L2_TIMEOUT_US/10,
+					PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
+		if (ret) {
+			/* Only log message when LTSSM isn't in DETECT or POLL */
+			dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
+			return ret;
+		}
 	}
 
 	/*
@@ -1040,7 +1054,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 
 	pci->suspended = true;
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(dw_pcie_suspend_noirq);
 
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 00f52d472dcd..4e5bf6cb6ce8 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -295,6 +295,9 @@
 /* Default eDMA LLP memory size */
 #define DMA_LLP_MEM_SIZE		PAGE_SIZE
 
+#define QUIRK_NOL2POLL_IN_PM		BIT(0)
+#define dwc_quirk(pci, val)		(pci->quirk_flag & val)
+
 struct dw_pcie;
 struct dw_pcie_rp;
 struct dw_pcie_ep;
@@ -504,6 +507,7 @@ struct dw_pcie {
 	const struct dw_pcie_ops *ops;
 	u32			version;
 	u32			type;
+	u32			quirk_flag;
 	unsigned long		caps;
 	int			num_lanes;
 	int			max_link_speed;
-- 
2.37.1



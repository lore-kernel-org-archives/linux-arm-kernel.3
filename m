Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E35CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 08:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvna23U5EPjbSGxv65hfsAGbVVnJHNLpBOLlF7ASCpE=; b=G4rXL+tHXsW8xZiOiH82SEoDKv
	XPJ0hTI6j0IZN/s4zbzVa8cvu42iN6hiET3dj8e9bLEKUMosE44Zc0rnlL/nJbonyLW17bJL6WLd+
	Jfxt4bjODbkgpJ5DqXfPpdjY0AnASsKqJA2yfCQ3m1ydHCrazLpEh3EBZBPOGJjg3j28TivA3QykL
	+8d+QW8WECvR433lSkMRXGg3OR1kHjrdoJhCMbnoyzkX8aIIi+1Sdbz5v3Y1u9xmLz5YlGFQc4+26
	oISdxVrNAJ27l657Ofg1E0upoX3f1oaNxkidtPeB65QuUG0kG4TSOVO1EKocs9LM3DTTprvsU7zOK
	X75vwo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMLu-0000000G2cC-3osz;
	Tue, 02 Sep 2025 08:26:54 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLyf-0000000Fu4n-1hbL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 08:02:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iI4cF9eP0xw/JhWNVbfDGBbY7RAxOpSUZWju00ms0dja9OWtGfcMvOmNpKzHJFnY/7XPZNW1Ok2MSbxK+d8QBjbldVQaXNYAORu+tKblZ60j7UgEbLEBnYKubmmQAyNLn+auuECpAN5Xo/SPlBVAGb9yvJpmauVbx2URICwWdAVn/h/oXNbIX9rnI4f4MZ20NQJLjeUanw5RpM4l2twuSD5WEcasIJp+M39J+r30c9VgXAr5e8oARkRtIyJT56GaDNxD4RxDzazZxQJVnmOQs4sGNOiKxYp6jj9gInrePwWZPvLTDxpsoTczuuGpldMbVft15L5ZloIQZSoSeKd5yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvna23U5EPjbSGxv65hfsAGbVVnJHNLpBOLlF7ASCpE=;
 b=vbRWoZsgKDSeK7E4D9GolUYVw47kuXdY2NIp3ABeHoXDuuwKLH6yzXqPcXLGbl5CN/6hykDdHiN3KMlXyI6FHyZqF/cxH/XzOGl1YYmQo32g2fIgT/lIbhN414ftp5+f1lXpSlNxhajW6dsTC3nreLKyfxFKNmaMIMIR2EerakcZdVM3LUYCigmXdm66yQI23+XazB3o+XDzXboAYvHWsaLNZDDeQdWxrYhjrPZq2ELzQWe5XPZT+kjN56yCZxdzNroKbqahwyH1f8rdPfqJ9rXi2l2MWpqS9AVHk24Bn9DSBmdANWDTIK0wLStfzPcW1bQMCwgNZrZQ2IfETDwRwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvna23U5EPjbSGxv65hfsAGbVVnJHNLpBOLlF7ASCpE=;
 b=ejP6wgHtvwRkR/8Siv9ICnAMmL82wXu1yP0aTyFrP9ftTveWJHcgI2EcXzoGnTC6QZ7f4rDExXuW1hSfxFjc2zC/zUNCZwIfMOmHsc2SM35zzQRJyY1i+6yHP781JoIayTRRiKJCyIu/UZizafwEQ5pS0YR8FaJBl8FSKYGJ0b+9vPSrEmMV2sl4vZwgWy+MBJQuQlLro8H58OGr4ZMZrxGuMLc2xm8436NqRHysgE3gE+X51sgbVriHJWkWKhJqCEi+QRM1QFBe2hmyIzXkzmJ/BBK4DsGOfPW/akSJiC+mPVESlGVt6w0+2E+rYeGmf64L+BW4CsCLzQ2cAxmxgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by DB9PR04MB8265.eurprd04.prod.outlook.com (2603:10a6:10:24f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.14; Tue, 2 Sep
 2025 08:02:37 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%4]) with mapi id 15.20.9094.015; Tue, 2 Sep 2025
 08:02:37 +0000
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
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v5 1/6] PCI: dwc: Remove the L1SS check before putting the link into L2
Date: Tue,  2 Sep 2025 16:01:46 +0800
Message-Id: <20250902080151.3748965-2-hongxing.zhu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f4e2e413-2634-452d-2deb-08dde9f7147b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cGodmlZ8J4LvsGBWTiGlCM2U/wh3HcXoyp9io5sEJu3QeAeNrsOI3H/8xOm5?=
 =?us-ascii?Q?QD8BreiAZCyoSAjl3r3xZp5a0mhC5O4d2qxr7JRaXy/9eUIjM+jre5wAoQl2?=
 =?us-ascii?Q?77ECHSugnLwWq4SXlSVzj2gONYaPf/31DGsWqWig+qD5bMxXvrMfRaotI6L4?=
 =?us-ascii?Q?V8lHrqpDS7F5/qgv3xhfz+OIRoB1xrmEdiCGMH/XUflzq+2e6BcjQ6GGcRjq?=
 =?us-ascii?Q?P7+aa/3ASI2E8EZcxL3Qm3LVlOR0t2UMf07LKn9rVm3NCkJq16pe5EP1Vxtg?=
 =?us-ascii?Q?CevKJrE4FYc/X+9Am7lk1DJLSMc8xOBEL9WM2h95FEJmGelUyqSQQqgfGB9p?=
 =?us-ascii?Q?3R0yKxrq13gsc+gABzAthEGhAxOBEYwuaCNwFktjRlYWxd3Sh4IuxkjolqTH?=
 =?us-ascii?Q?7Bch9ip9M59fItbUqtNbZ8QcEJbliJJB8O5I5rSe7WRBXB73I/cr81/1tZxY?=
 =?us-ascii?Q?2a6+QJU+C2/vZNqQ/wjiNi0jh398U4IndYzufgF7tk71T1QVfPL7IWy3hKfI?=
 =?us-ascii?Q?AscqJYb6aUWAbza2IcnC/z2iI0L+d21zM7cJIcF6NqU1C92UGnNbrl5vkVBd?=
 =?us-ascii?Q?SW9hZwnnOrkRMy8uzVXReBPO4HQUXBuH57uTtpcnB9GvfCwQvWY2abz6RqSP?=
 =?us-ascii?Q?mliEcWQkL66sBEbuwQ95c3gC8vh0CLw8ikbhJjJQGWCNsNHeW9IrMhP7th50?=
 =?us-ascii?Q?Lma/4O0r3HksF8dFuKw1uqdv9mihJg6x8mdHtIKqDvlvuKQ9/eEA51s24xFE?=
 =?us-ascii?Q?YxbqOYTfKMZ9seq59NN2lrpUfSc+Ol0pzRH2tzK+a1+Ww5qXvumH3AskYa5T?=
 =?us-ascii?Q?9uipSPvqq/4vdsSNhz0wm1LdtNnkG2XRTCNTvCxz9C37cJ0nK5XWjK7jem+U?=
 =?us-ascii?Q?P5ULP5vO+RTFpgO21PrrOgGeF+SmIthB26T5HBb39CnNyZsIZnzrTI5SBHkk?=
 =?us-ascii?Q?2x7QYeJ/9zqpXUU4NARm4wlbT/1LZ8tjTnHi6M3y1dO2eaprYxR/pYZ+qZhT?=
 =?us-ascii?Q?wb0+l/FMlvCP4DWtn6p+4g9x+uNQuNeBmdzkfZVbPy9JYfrJkb5irVN48CVO?=
 =?us-ascii?Q?g8eFGdP9SO3gZDjtgEuInzH04NX5YLkWOAc0Pi3Blj5GUOJGqZ7B/RkZtW3O?=
 =?us-ascii?Q?uJVSY18g65WEXpd2Y/bmHO/f0zwojuUluwNPKH1KQiISeo24M6Z+WDHEjovh?=
 =?us-ascii?Q?83WI0PfEJdgs2bO1zONmnKC34xJJWRmpAueUnd5Vm3wjlACRMSNZgP89edfc?=
 =?us-ascii?Q?cv50PVOGNGFzAbazj9T4eU4OMWMp5bAWaa1Q1mXLi9jIogaiU+VNFeNxVX7O?=
 =?us-ascii?Q?ZFfSRN2QTbeUCi2TvTJ+Vwis83OFiP2qMTJTSpwrNrVjlOIca1iZpJZ2kd/H?=
 =?us-ascii?Q?2TWnedTRvxEXoWmg8VcPHVWfTADK5/50cDKJv/vbIgWigbuJoy3+oNxQLEAc?=
 =?us-ascii?Q?03rhRqUdnUUy8HZwCcDbRlgHNFZkW/jMDcN2CXNExwHxb/6aj497HQCWQbnd?=
 =?us-ascii?Q?qkeBuX2OHyP77jc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T9GZs8iz0PFTYN9YbonwcT95FeZuqXYzEbZhmwYYL5uKVXvigBnSxdZw8p1z?=
 =?us-ascii?Q?F3K2ntES88WhPtN5U0RYttXFALAjAUC383VNQXTVliayW1KmXf1FJrRl3iT+?=
 =?us-ascii?Q?0EsT0SFyzuM4MpdpQPeVck9bRQKqzCPUFJcENxgFz9vBPZkXpIEO0no2HUfC?=
 =?us-ascii?Q?YT/CWNE2dfxyVja0BUDDnRJdp0nBXwmZUEv9XOuxLRA2V0xhCAhQqY4AVZts?=
 =?us-ascii?Q?LpYx0UNOzSOuB9q6K/r2YoqT15+R+JYdys/VYH7P+l9FwrwAa89QNB60gJzm?=
 =?us-ascii?Q?PNBJBtlTaGICBA3IKumh8l5OuexzHDcyqKMEBahoj6LJi9P6bICgLtgzslCI?=
 =?us-ascii?Q?EmzCk6vFNKGWbHOXzUq9kyqIScvhsUjNLDEOEcZs5yIAzK+qtBm8afI3SO4k?=
 =?us-ascii?Q?RPqzNkp8SGk4z/6SKc2v6WkJFLlV+8h7k4nInsBVN/AZGBaw3yl0dJ7oqMhO?=
 =?us-ascii?Q?R0oiyRt/8p/EP04e8OHnc0taBm8OE3LtXIvqEcV7vWkvPklXU8SVh4O4qkFN?=
 =?us-ascii?Q?I5EfEe0a4rLfqIro0JiTIti6+Xd5tJ0TBRjhfhAPPPYPl6P85xjGc5bV2rJp?=
 =?us-ascii?Q?u/ZoeVEik2VfnwqxUlFJYY8SLr5ODSL5arky0BtG64yX3BKCcEuTg+p7aPe9?=
 =?us-ascii?Q?9P7gVjADdR4DorcdyWxiXeFhSQC4/XbQ3GMIUxArtA2Fg8ssVTLohSfjrcXB?=
 =?us-ascii?Q?bVAtZpk1jKwKHqNBZ76+2u7PJoSmZSefc/l7uXydIvW9tZlhCL1enhnzxYNU?=
 =?us-ascii?Q?dqw4NoU8wYkK2dM46babnvTZhP59BQGeLZu9TiQWsPyCbur7N+C7XabE9tKj?=
 =?us-ascii?Q?wT7wVNFU6VhWGiYlsP8OM7ITfWh24q3iEnpxFtUHEhk3o2t8UKb9xQGhZ1Sa?=
 =?us-ascii?Q?eY2j6GMLdIcpqXdnZ7D5GQ+rMowaISHYNvmh5FQEP7GJV408vdSI55bHafKF?=
 =?us-ascii?Q?wkxd4zqaOF/7EEaSqCt2jcv/lVJdBKrl1Wh4s8iNRwh6AHAayEdPdWQQMRXy?=
 =?us-ascii?Q?heT9xgeh2CO+geWFjywrUeddTeBbBuvn/5IFND80wEwxHZDdjiQUeMIjdDo0?=
 =?us-ascii?Q?47pZkImF0sl6N5rDxjpupboLdyPeZR/5Kcc1lXzOhnuN+DV0AsyoSrrlt1CJ?=
 =?us-ascii?Q?Pkcicc2bNP6ZxTIZV1idJHB43e3jzG39g2uGe+vk6tUaAAx2Q9ppZ0FYjUmx?=
 =?us-ascii?Q?dvvtoZd5BNCIUV0msq8iioSHj69jSka8U5S4yHO7K/EhM4kJmDNCOTQ3EFPU?=
 =?us-ascii?Q?7lVZBztIUJXyUFQEJq0tBdDywSfDTIOebec74L330rcbikmS7HydXWILr1cD?=
 =?us-ascii?Q?gnp5Bpl4B1umjBNy9KfHAWumQw+Gy8LaT9WbeWhHL06OTy6lVyLQsJSgG0sD?=
 =?us-ascii?Q?WyoDpD0DzqdE8nEr5lKFFAg8M0eP6JPZgF4Ep+6NVnuLD9O4YptFDejgrmql?=
 =?us-ascii?Q?QfmM6mpdgayzNsX0y+2INwIAxyCEx7cj/IMPNzgQTskDGs5nXMR2sd9gpnP8?=
 =?us-ascii?Q?ciYig4veKABa1rafMWPeG1WiRxKN4vjxfRQcCadLCZf/46BC4BbQKYSD6WbS?=
 =?us-ascii?Q?tb69WrT399L2CVNUX2MXs+KGuT6r3PoT5Da1DOx1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e2e413-2634-452d-2deb-08dde9f7147b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 08:02:37.0139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VbK4BYqM5gCiUArBQ0GvMfVaNdWjVe0aeRA5j2AqGLmrODFy5pofYiXWP5GzyrTwkyeCFWVRBGy/A40ehh5j5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8265
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_010253_451465_DB58FE46 
X-CRM114-Status: GOOD (  12.11  )
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

Since this L1SS check is just an encapsulation problem, and the ASPM
shouldn't leak out here. Remove the L1SS check during L2 entry.

Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume functionality")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 952f8594b501..9d46d1f0334b 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1005,17 +1005,9 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
 
 int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 {
-	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	u32 val;
 	int ret;
 
-	/*
-	 * If L1SS is supported, then do not put the link into L2 as some
-	 * devices such as NVMe expect low resume latency.
-	 */
-	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
-		return 0;
-
 	if (pci->pp.ops->pme_turn_off) {
 		pci->pp.ops->pme_turn_off(&pci->pp);
 	} else {
-- 
2.37.1



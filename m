Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B6EFCC9A8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 01:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9C9h4MaM6U4ejOE4OnIjFLn0cMxJMNUbcO92RILeog=; b=psD6cmNiftqB638/MmR0Xp2qSM
	y53GajGEvNNinWFxlaR92SW6geElD53GXSaoXAtTERmJBJ4HY7ECbcIsfAf8o0GTGq4QDDHd0cHTd
	wnVwdO1wG3m93IbPOXAlcglUntPSGkK3yzwDjQ1pYZwLRhHxHcg4HmXNomecldjfGa7dpSiT6ZqZ2
	0kiqwIOw1XdxXXCfusq556QL15i63swyKAcXyJm2nCvOG7QjOH3gS+J+8dAX/zJ6fx5ie5h88q9cH
	GDHUzvIvyfN9pbKE2s7D8L1XlqXZACFyx/R7Y2u7ECxLe25Z0IUHadVURcz2ug3MxEuVj7bpkPdU5
	xLkfyDDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmHq-00000008W07-1hUy;
	Tue, 10 Mar 2026 01:53:30 +0000
Received: from mail-francesouthazon11011019.outbound.protection.outlook.com ([40.107.130.19] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmHo-00000008VxP-0Kpk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 01:53:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBrRhFgeLvUu4yCqi25f5iwCso9MkYt0xLVbEczcTocmJoarjPOYbn7BEC7R3zqsWGFSTVvGCt1ae1qlZoHIRqFN9/cdTMCrnOBM31CEWuI12N7tHJk5vxmIJtuvbMquV+V+voTJMyXfoFAwcN8sPR07qOPYwgxvyKTR7imMRfTOuuDjuInO4188XgA4lRTEGlTOItT534iBnBzv1lGMjyzhdczj/6Re27QHqdfZErK7egIzYNZWlNsAluDMhQhwRHv2E0jhrYoqLy8qLklgXzjMW1dvm3wcNqzaPmYbrG9KqoohPdM3nSgqpCHGA6hwC/NlCfqZ0Vx4XAad+Nsstg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9C9h4MaM6U4ejOE4OnIjFLn0cMxJMNUbcO92RILeog=;
 b=EAcjlCDsZxcHWChT//m/H575wwhMYAaE2SHDpYGFMQFg7J8KfbYBxrSMLUX6YIKFW95qJdklULzfMSdG/Yl5sAWKdkmY0gnPl/nwpiKHIYFq2/n+WxK3EXSexb4ym6pxqzg9XLUwgRSl7Pe1ZpEgsxQJKN9UfFfKNbyvUMLdEi7ca2zTnFdhJCknYfF3GZe2ruhA6oguKPQjTWkr7aikR/MWyXEAZJvoLomizTtXuacprU4F9l/dxWNJaXwo1bh5pAStI6qBpp0u8tIJzE5UHeEVwUNgPQdcIeqMDdVYUl7gDgs8683VpH6zxJjZVtvJwWjBDg5irK8agjN6aTQSwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9C9h4MaM6U4ejOE4OnIjFLn0cMxJMNUbcO92RILeog=;
 b=a84j20RQpcrRqcUKXjR+NLX1uB82h0xJ+HqvL5LeBJGgYFwc720q4FF18EFcwVvfG3L9zdS4n+QM+UrcFzV4Hervu7QJbYy1bXFUkl/fzFZqHyBztqPVjORu/rbt7CXRQNcUmylkhTXNZ1L391vHycfM3m0zKkvjcqXhD0p2G46bVNimMTY2zNxXJk1ArkeWtEOwzm8DigRkDY6yNBUnAFavst6C4g6WEdh6KcFJdCDaqYdBxBEibhV/9anoFAw+IL32V8IzCZOjVuEX4Xroi7A0UrQN0RR9h58JCrm1XU7r6LxwOT8SQa/wYRZm8ZhwIKvSFuhFoGow/j6zuAiK2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM9PR04MB8889.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 01:53:25 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9678.017; Tue, 10 Mar 2026
 01:53:25 +0000
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
Subject: [PATCH V7 03/13] PCI: dwc: Parse Root Port nodes in dw_pcie_host_init()
Date: Tue, 10 Mar 2026 09:54:16 +0800
Message-Id: <20260310015426.365675-4-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260310015426.365675-1-sherry.sun@nxp.com>
References: <20260310015426.365675-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:54::20) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM9PR04MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c300729-3b3d-4310-e87b-08de7e47d12e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 0GtEX2x12J6Ng8AhguO6Pm1Q9vp0dX+fU+e5VNP9NNAllzgy2ndCqXntZxYTMmRUIoyXQ+9jmPzqqa3lMphW3YFrKsJfAot9mJU/IXhdtcKupHwlz9226r6a4FvzSqSws5vmLpqj7re1hWHVKVLX9Fj3VvyTiY9mgxkzdyXiARlgy8QVVpFyeLdf3rPcxbnjHKv0nC3u9H8bhKB526UMZ77INpZsho/+vrGsk6rI3aqLvwxAqTbvCcJl4/1JxJjN1ZZdPuDOBsdM+OKRPkUzDw017gL4JpmP6ohCKthoCVGX8xq3QwpSO+1A1BmHDuQ94uoJKt4UCv/39wAIovQP6QZ7m9JICbLlYv0CfxNyTDUaHHEV4G7rScungzJO32JUcCM4sZeA620WXV22JASqyntBXjfqGTBFyaFYypLd4CKw+fDXKwbBJ6/kuZYg92B54R5J9hdT/X2AnQV0a/DbCKpZtBQe5h1D0bENWmzry4VAUOSlU1VOCvJ2Afp2NFe0W9G2sa0LsaZ17U8YitMOUo7mktQflfkuUsfvC8efKkghUkGhgrRqYUvJATXn45GTQjKaCRybmS1dCVbWJeTI/zLu6kaFDPbhUv9lakWkTjYOG15dutdIdhs0zUCPDT8PKEky83ILbASrC0n8AM5tiTm8OSPR7z1S7MD2MVwJvIpd94RtpIKN+AgVFFdqybGtmg6eFVfQ6SYlLV8OeqpgNq6Qg8HYSgD1RO3XwpawoKMxKJJIvibmu2ZbPQiPeYzz+r/7KW5bwE+WDhuGaoRdOoEEPoXJ/3YD03uLCJugvNqcL4QzGZsqvPIMz83kHwA7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zg4JunNsZMa6wLBn9YoiAj74ObybS4xLZzQBCcisYqh+OhaqOmVwRFX/69/y?=
 =?us-ascii?Q?AK7tW52mp5hhb8M6jLZVrGAVGvqUA3eVGQznYQ2xKx/KOoxezYLrTeZU1K+t?=
 =?us-ascii?Q?1R3bIJfOdcBdfnRwVx5tWwnMjmfm0w59pD3L4dXO0rz/aNNg7GPMgYRVIXls?=
 =?us-ascii?Q?t0WZU8Fg47hKSALlQkSnd1R5G1FRlgqysHQTpttsMSETDsXMmYQaaDRKwHVN?=
 =?us-ascii?Q?1u4292jEsEmFKwg6n1odBkewLQgmEALV0QKrCbl8P9EDQ1VWrEEM/SnWBcSY?=
 =?us-ascii?Q?eA491+xkEEu2XDGZip1mbrISDStAtWLybOkF9e8u3rhMrNaIfaZR9whzVFuq?=
 =?us-ascii?Q?GE3f5cmhyFvxLqnGbi4oaTFtKahVyR0sIZi+y3hFSQyIqqESW9nnEkvq7qpp?=
 =?us-ascii?Q?C9p4OrOXG6zBXJDn+PQHYoPLe1ljoR5sTH8UOHCVnpGch4LsqO36jzSqHEpn?=
 =?us-ascii?Q?/IxzdLQgCUn1C/sg+RUonprqLQ23pv4njvF+moyad9XnX7W6savDqyB0Sjlf?=
 =?us-ascii?Q?jXviDNZmKXsNKO9J3L7wOzNhEtjPX7KHwiKn/cRgykc6Ka7+6jpK5TVsTf5j?=
 =?us-ascii?Q?yzeyfGiODGFfdbYk//NmZrJr9HR2MztrYxmyILiOC9f+OYKKW9jziIxvdmbk?=
 =?us-ascii?Q?+DdJVa/9xHglGlOCtJW8ZKhsLN3+nAiA/gEfmYymxAdyEoxe8ubbgLicvZYL?=
 =?us-ascii?Q?TQlaznXbQkWqmNES8xiVH31rzwxQqrKQ6ZxQzS4clpezIyQkFaw4bVf+jsAc?=
 =?us-ascii?Q?eyrQZ1ck6ZYsccpqqrDmLT6Nl7P2pkrs3Ss6M456xAAjUi13Hqyly4xWJF0O?=
 =?us-ascii?Q?lEgGjXG0vDR61NehtZmb31lJwAf2G0LQqwWjr+bL9c5l3jIbazvNKMDdHgIT?=
 =?us-ascii?Q?RvKUpR9NSDLwvFPkaN6r9Fzge3FIDRLSkxA9DLQdfg4NihKFQZQtgo3liP3S?=
 =?us-ascii?Q?xOtZyMY+lO2HYj921gUN8r81TgZph/l2SMCAwBC4anV9QvIcrsl0qFPQiejr?=
 =?us-ascii?Q?IYa/I7IA9sC/Gh/SwAV2yqErQz9BwHOLw+xWg1rklwAR57D7Wu3t+1DEKf2K?=
 =?us-ascii?Q?HIMBh/tgR8Cdw4Z6BhQQt+UtR6VF0p6K2d9j+nSe9BjAk5ncwy8zqobHHmp6?=
 =?us-ascii?Q?CCpfREY0K84BNW7TPer8M9lyOr8lXj1B99lrJpL3b4cDy2Ay7S3Ba5t/2uF2?=
 =?us-ascii?Q?RdNkNa5wHMF16LkM5VPOo9SzzzGNCf9llh2FGnkypuUi340goaGmN4YffsaW?=
 =?us-ascii?Q?EUM+3aD4vu0nQn2+XkvE1emOEFYCtVXU/i/WJZaBt+lAmUc/b7ijkKJ3OLQe?=
 =?us-ascii?Q?KS14GZjQ2a9m8wfpNZt1e4mdSmMJmGzmk9BbxPt6U3sxriP/zkYkoB7kWUDw?=
 =?us-ascii?Q?wPdwreGbR1TOZwUZgiZXLOssMxVrDW8zptN0jNP+QIfLxgLb2fJp0vSoPMPG?=
 =?us-ascii?Q?1GVkbVMxluQ0sf7kgr7ocaQsl7iKosuMiKA+GxJfH4kVFVl641sRxc+ROr9k?=
 =?us-ascii?Q?1hTNdtR/PCIDi6VrxZyxaT28F4K4E41jldgkL1GPrFTomJqBCQXJOv+em+0X?=
 =?us-ascii?Q?/9fX/k0Gx2fscCTfqtOsLNmehL/NHQV0C/WVEzK8z/wfacn2u5FdQ1fzRBq1?=
 =?us-ascii?Q?n4AyreHgAlj/BWWol9OgBRleGUDfUZUILlL7UNTqhKtwFrbvFkmqYFolBZnt?=
 =?us-ascii?Q?UkCmAd8Q2FQQWUF5G9n1yZxpigfIQM2U55t3ix5EuKI/8WCkjJuzMZF4Lmt3?=
 =?us-ascii?Q?wo6DiwMXng=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c300729-3b3d-4310-e87b-08de7e47d12e
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 01:53:25.1143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iz1wY8Eek8TlhJHFE+1L0qukThhwb0lw+IMKXAjQMgxh04VBO+S1JyIep8Vl7ppO9ubNqMFg3lnCGgtFI0DyWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8889
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_185328_120763_175A1604 
X-CRM114-Status: GOOD (  11.29  )
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

Add support for parsing Root Port child nodes in dw_pcie_host_init()
using pci_host_common_parse_ports(). This allows DWC-based drivers to
specify Root Port properties (like reset GPIOs) in individual Root Port
nodes rather than in the host bridge node.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index ba183fc3e77c..c9c06b82ad6b 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 
 #include "../../pci.h"
+#include "../pci-host-common.h"
 #include "pcie-designware.h"
 
 static struct pci_ops dw_pcie_ops;
@@ -581,6 +582,13 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 
 	pp->bridge = bridge;
 
+	/* Parse Root Port nodes if present */
+	ret = pci_host_common_parse_ports(dev, bridge);
+	if (ret && ret != -ENOENT) {
+		dev_err(dev, "Failed to parse Root Port nodes: %d\n", ret);
+		return ret;
+	}
+
 	ret = dw_pcie_host_get_resources(pp);
 	if (ret)
 		return ret;
-- 
2.37.1



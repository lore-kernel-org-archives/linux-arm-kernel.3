Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364A6F4BB9C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OT7OcF8SEYzDwXh42Lqsyv5PQhNwGohdUxeIa+Btvb0=; b=odpvR/7kx4O0hWeZWACAfk1SSC
	SzxRtvezWwUDMH27RB8FXbub8PUPtYkIjkmarJ98EStGkUq00BiUt+pvttVsJrNEa+pO4n20cMD4H
	fm137z1Qn9wrsytQOYxkExUKQm2M0eUGo0whRJTsBBRa/SkOKlJ5Lv+/qdeWMtrVN6t8rK+kfEvxa
	J31xt4VaUPPb3vwjI437fqr3Vgot2yQEPed2THpYyFfZQFq5rHrctGaQ3ekP+T6eyBG/F7W3Hf+t8
	/FUG9MAM+g4AKk7TTHErReknupcifD97Gg71/nyu5NZf7ZY/dFf2g9EXH+inNUHFQZ46S4GccUDCR
	GNAZW6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCXN-00000003qeT-1e5z;
	Wed, 25 Feb 2026 10:54:37 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCXL-00000003qdF-2ZMe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:54:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbdJ7y6JUnzhrVeVYy3Li7bVZGZK5GsM92u2qxhaB67L9PjaGXyC1wpbXPsOd0lEFpHgzwPrPvAi1WMVxXDFvXOAZF9UZiI78qiZi24zhRXV8VqSsLf5204/H7ncpe8l0KzRmDOumuq5vT9/Q2NxdkOEpiiidpK4v1F/AKT0wYjBplVGi1GXG7zTkmeT/SoJ8VLgabSlld+miHwYODdTZG893k0s+LVC8Ui6yEClRfjRRVPh5nApaIj9oIrh82eQ2mMzqs0Rthny5RKz6b3xWaOEtv0pTglB5kvppPYywEsB7tWdgKR699EEhZdJIT97U1Oo75mdVPAPz4SA2PT6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OT7OcF8SEYzDwXh42Lqsyv5PQhNwGohdUxeIa+Btvb0=;
 b=kK8kTmzpQ2d3O8K/DZ8/wNbbOPkcyk+0ojTKkVm59ZMH83rNh7Hzr33ZnQMh4sU5w+CcRTZtT/aD5wKTBUlofcG+jN35GzxcvGkza+uM5CuKZCn8ymzIVkI0yQpZwqaNHr6n8XOqSB+yUrfE46Tc+FZExRvO0ypDgZqXjMIfe5BVV4lOJ80tnXaDMCdw6aA1hDp72hqI8nddiyaB5PohJp6spo4A16vl9vnB7DtalqEsK5uPAdfTE7zjjgBi56RgiWixePpSu7VoSxn2Ai1T07bQ5t+TvEZFr2s8JH7m18oSfpiNsSuSMo33egOoVtbk/INqORifZ0Oy7PgP2NA5+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OT7OcF8SEYzDwXh42Lqsyv5PQhNwGohdUxeIa+Btvb0=;
 b=KvCdufzh0mjdx6IN0lhnYyfsvWiaEF/1TsGtwsvxfozD6lxskzkaELfciLfNEHArEjrtczDzviKa/C4bUsSL5IFnKFh7y9DY2PDkB16o7esATSAhOVY5BZWpEqSwl9PkbMFm+IJ/evECQQvRFltmoqdQtsXFaLoalozb1eO1kU95ozXbnQLKy8NXYvwyDiKLEXIp2Bh7WawBzgSd71HG3/YrFDShZtSItivYVOlfTvNvXqaFYCr6G/oiiyuJfL7o2A92ytJFXHzGQDnaN0gky4wGLGhTtx2yoX3H5sfmugRLiJdF7CmvFGOeie32NbnNvc1YwP1GjbEHxmsfK8SDLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM9PR04MB7668.eurprd04.prod.outlook.com
 (2603:10a6:20b:2dd::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 10:54:31 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 10:54:31 +0000
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
Subject: [PATCH V6 03/12] PCI: dwc: Parse Root Port nodes in dw_pcie_host_init()
Date: Wed, 25 Feb 2026 18:55:14 +0800
Message-Id: <20260225105523.748775-4-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260225105523.748775-1-sherry.sun@nxp.com>
References: <20260225105523.748775-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0104.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::12) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM9PR04MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 66dc09b0-d79c-4001-cccc-08de745c412f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: PU1P/iXb45Do/TiNVXPZIzjReKlc5LebDmkPiIJ/Zl5AYNaGtgEaDUETu8U+KLIPwhnuiwloU18TwaMGeDgw0MjwZht57VNW8BpBxDBbatszuZPWTLvoz/82b/hnRbM0zTu0JQNilRe1t79spJYCpmKnOVs3m6FuEm28oxoMl+YZ/IyWocZV3oci1BjipkE+9squ34QAPXVC8wkLVd/JGbp3nTHt0wCY6lRv7gdSk6eisU7z3xb0hTYCRHz4pVbWQuw8nlHE+QmCmZHrYkMl/aFc4fS4TySd8k9pqlQmIR52h+UTtocKqub9b3fXmC91KqJ9zlkwJ9VUykLhK4lKvqEhdxgk9Ib4DFspqZjlI1NRyenxVs919SIB/aLrCNw8LeMKxuOb/9Nw6bb+YgMcDzekLGLLr8UxUJySw6KSegLoOL6fYhi6It07DoTdbJVlb4yn0y5DVOBrLgHCPRhGIm6GI05GTRlz3fEgHGyjyY/bDGb6CpSy0QFRJmSW6D/kkJ98ID+BlhFQW5teRMBBz9GHwbfdFat7Uqu7OKyOA7jHO0rqLHPVitZxaD1OVABkLl9hw0bzn+nDDZ5qHda5tZqmM6XeLobC9HVzGfPgn4v5mcm1kf3dPFiixoaxihCONp70xhhNDG4MO4j5QAoHJxLzQ9tCCZ3bAzKYpKM3Q61gtyjeNzoS0c6HOHriM0O1WJjImDq4mFZP89HqVtD/Qa+9/XWPwSWZTpmTR8qnCNJf62u8zDjdpLHByVKgK/vw9KsRXkX//x8cT3Qu/twoTWK7UDlyL7onelBp5N0uVM3LTW73lRS3MB+zXZN3KhAm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y1ocAtGwP0HgTIDZhHxSnAbZZXTqIGXBuD0JVrQ3Z1yz68+6/en2kAL/Lxxn?=
 =?us-ascii?Q?hOH7qabhIacp/oyg/Vit/Xx6QdxzGA81n9gT4aGma8PmelE+2+g6konZKZxy?=
 =?us-ascii?Q?QofQltuwF+IBxyLbSA+RDPc2a2GrczERv/84Eday9zbrXVy4X1OJczQmE8a5?=
 =?us-ascii?Q?z8VuYIq1qEHUlOGvJ9FyXLNHklcekX75odtnmI5Fz6eOB2Zr1A3YnE/QDGwl?=
 =?us-ascii?Q?3fSHcE4EdEzZIILkW3UsqT17e4yej4LcibGfe0bX8VAmDGzBO0aFBH6dwB0C?=
 =?us-ascii?Q?Sj4/6JYStN9cb8udQbtsS4sOwV27FEKevW5IELCJUvIPInjgPk8qk9Aw/bjU?=
 =?us-ascii?Q?4F0MsrcUX7U2X0jgmz+36hr2nbOlCe6EekvK6THQitpoaT2oqcGREp5bwFW4?=
 =?us-ascii?Q?o5ns9pR36VhiXQf4oBNDgU/QyOPzsR9olikEjzb2H4lV6Gq4tP5diiJ+PdMI?=
 =?us-ascii?Q?RYTjP5RumXfeDRwzNeocdRlK2Jv/uQkMmogThVUNfxkYdGXTIvtBzqsO+Pkw?=
 =?us-ascii?Q?ycJc/Wghi627DvTWYdH8w1ruXahLXeGNIjX5vtN5S5mVHwZQ0zIN8aOC28BA?=
 =?us-ascii?Q?QPTs4R+xjzkb8kb+oSg7jSP8L1J3bWGx+uqh9wRrmFbiSU70fvfbiG7O5GgN?=
 =?us-ascii?Q?mut1mixEUzkcQojtb9qwDBvyj0Fj8ynyUOnw5FN7kefmFm+gaZ9OfJV4kDFu?=
 =?us-ascii?Q?WtDR8QWGEVEWnKMZRpai3QHn0EQbeI1wDU70bxbe91VhQ4yuevJJhUGcjWy0?=
 =?us-ascii?Q?MevN6M9kNAjw9Jn4GJbOKUZfULw3Z+4D0z1j0XuyinVSfvPxpPVqUBjGf1JC?=
 =?us-ascii?Q?WhfID6sGl0mWJ/W6uSjHkWsFPdH+CvfRiZPNgcc7onzsLhuAdUvwaD+vD0Zw?=
 =?us-ascii?Q?ukcKbnNdvuvrfX3NMwfWSsPfuMtCg7s6OCSk5ZL7eS3KxI7kQ6yJa6X1/paR?=
 =?us-ascii?Q?8/lxFs6AoLQAKxQX3kmtfh+q9m07fF2cobTHIvWo4FbF7xy/X9fYz3K64wyG?=
 =?us-ascii?Q?2AWzfbTp9Me+QOCax5Cr0UKj4aunC+R/O/avUGUjtlZUO2AOoeybofL4YSWh?=
 =?us-ascii?Q?IQK9ePJdwbkklFzyW3TGPk1PSk1aoQ0Nw3W/Xv8bafvis2m9PFbHEfpgSKJp?=
 =?us-ascii?Q?h1dTuli/+Qkvm79fn+WX3+/rWAAI6OcW8QKZ9OWzPQVWHjIAGXB1roqbrBSN?=
 =?us-ascii?Q?0aivQ5oxvvWuEPQijtRDCmHV/APL14wwFtt3MXnfijUTZkkF68RVr9q1Zc4e?=
 =?us-ascii?Q?JOP6Q3xzaNuXbyW17Yh3bRjaa37nbn1MYNqNCZiOn7zv43kCRP9AZZhqQVM9?=
 =?us-ascii?Q?2rWqlkOP+MIeG40BzXgilobyBW0l38Zck0dgkUQSuN6PZnmm5qyiN9U/hRWI?=
 =?us-ascii?Q?w5b5Bml7DBEhtjqavQasuhlbZSimHlxTs1jQnEnbXaLxUoqxf3okMkp2nOSC?=
 =?us-ascii?Q?N8V/1Gxsq0RvjDM8ICLAiEoxXorxiqQ+/eiCqv750+0VwRDSXKAdM57ERw0k?=
 =?us-ascii?Q?TtZmU2XBuj6l9Z0os3ARsuNeY08wffOYKKZX0lB+DW4vrmkezmSQZ56x2Ilm?=
 =?us-ascii?Q?kyP3WrevL9kfxw8Q9+0h1ZJQ9UrUqXzTpF0EVSF9Kk5sAoImWkqPonJwweB3?=
 =?us-ascii?Q?NoIDOYHCFbS5zn76MhATNaao014lMTY5V+iQMhQaK786Yb2hHFIJy+y9O8Mh?=
 =?us-ascii?Q?7A9C7PYe0qLhfBf+jK6tlZyH4Rh7wG0pppaT98jp9tjxsjffzRZQL2UCMXIS?=
 =?us-ascii?Q?3DK6FMSw+A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66dc09b0-d79c-4001-cccc-08de745c412f
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 10:54:31.3703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uh8ANDWNYmr0oZT7qiieEXDEX8TQVPWexxiH2j5GvB9qSaujWgqNImV9f3ZlBQ2H5CgO+sL7XpfjEuYahfOA+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7668
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_025435_651178_D38EC4D6 
X-CRM114-Status: GOOD (  11.26  )
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
index 6ae6189e9b8a..6ceb146e9a04 100644
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



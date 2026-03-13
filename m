Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65016106FD68
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 02:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IcBE26oRN13Z1koAZGrMF0Xa6Z3GKMCnfUAz5eLY/4=; b=VK1DibA+Gh4ARqCr31UoNRWEkK
	e/ak7DHAOTr+dRU4SYwbSqqERM5bW7WgjweWhsrNLXuhDx5/n0KevJOSucELYLEXbZqmaV0UfBU1P
	7gyLsRnX5lL7j0KC6DE7hrBcZ8gCmf9WOvUggz5/2CLSVDj8jwsjiok4fiFtsQKBO4ltY1wC1AKlz
	WHjOpPnDGaz1k7k3TWBRcSSwYkDdIfuSk36ynY74FvSAP11Tgy4x1GQAzrL5pALRsizijbFppFWZq
	fRd9p2D3HnZ7w1Fp3LFpiTdcNepd8Hpy41nfKOe69wQPRfAfxBbF5nVjIcsxA2OHwQ8IcEQMxEHpd
	eY9xyOnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0rwj-0000000G9xz-3kLc;
	Fri, 13 Mar 2026 02:08:13 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0rwg-0000000G9ue-1ka2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 02:08:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OigBxRMnP/k7p2F1F/qHYB1zlKO26a9+vwD8uB7bS42NOou/eANUigOB/hVQbZIgokoCs7HjOaZTiPBl3XTQv7FGrhek/0GpJV0VaFrt+wT8XV2nmsihiv+naCne7MwJzR9ltHCxtKROvitS59Cgds/Qm7OjspBrbjHPZI1h9QiwFxliqA8W2Ejk3/iv2K2lz7c2RALHZZXWyAhegWddapUfDpPfnIoqPwRRavyyj9a97BLPrBWAoH9e4Wa7lUg6Vhus2b36BK6s6E6zUA7+wJFVPq3PeAlq3D5b9LPthoqNAoQtWjdUQGK86+AYmLXI8E7BU9QNsMHIaXIc7q4JRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IcBE26oRN13Z1koAZGrMF0Xa6Z3GKMCnfUAz5eLY/4=;
 b=cRVcOBWIdLy24JWd0jllos5qsQIgKjbcPJFSydk4CuXtjGEe4l8dEDSZhmhrnGKh29NXLlIfuPAMqxiCd/OL8xZ/y2ygM26sP/vaoW4VJdBJlq09sLnLPEBw50aXa7FDX5TP3LMU5qJ7X29bWu/KPDJaYnGAcDNNo4Ru0a/GG5YSKcvat5Y1D9kSmsm7zqTcnce0xYabC58iZ7EenUQRrQsei6Uf2y8QtDjz6aU7L+mwIs810VRbi/Sqo909+uN/Xa3WqptETFun+j0A1tqu1RH9eAsLFEI4EL54EPqXzigU/+Np61QtQFKUooTADvlvwwEqtbzcNekLGTbVUxFbXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IcBE26oRN13Z1koAZGrMF0Xa6Z3GKMCnfUAz5eLY/4=;
 b=ONffsD8kInBbAqP6QYHnge/o2ADUEhJPXPxu0EgsbqltLUGoLAru5W5yyzlyec9ICTONdowJ25oFoAYTMPaWJfV1BpfeTtwMikecNGf1lZ8idNhuu6fggFJ5Sp5xO5HkTqoFtk35Zigy3lDXnTUS6qaCFmW3/St0lN6kF3rQuqCsrh//+5d+9VnYjd5BDZacALoib8iTKknhrP/MgbZP70KoC7BgDRY+SUjwGlhS5E6QthjLhLCQc2C32XItP8i2aMdBPFtOQUFJ3884ummA5QlTnbgZTpG3suKds0bmvprhCtQCjxJE43QZZPpu9DLPwn7c3KTq+sNDnq2UDXQk8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DB8PR04MB6844.eurprd04.prod.outlook.com
 (2603:10a6:10:112::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 02:07:50 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 02:08:03 +0000
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
Subject: [PATCH V8 03/13] PCI: dwc: Parse Root Port nodes in dw_pcie_host_init()
Date: Fri, 13 Mar 2026 10:08:13 +0800
Message-Id: <20260313020823.1592389-4-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260313020823.1592389-1-sherry.sun@nxp.com>
References: <20260313020823.1592389-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:3:17::32) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DB8PR04MB6844:EE_
X-MS-Office365-Filtering-Correlation-Id: f3920665-b602-4b29-be60-08de80a55bf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|19092799006|52116014|376014|921020|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: tfnYYhgPwRSILuEHdQejsrDpEvmQk00qfkDc2n3vf7h4+xnFa/gPXE9qEQUCfqTNUSfq8kl4Ln2aL55dZLbmkPOURqWHqenHs1+ikyCo9TWSyKV1ZcFwV2kjsEnhdxExGkITOTgc8eDsG3rLlFpNGLXZfTeFrJDszYc/OmZl1OY5My1rXJNEVIq0Phr/AThgn8auU/PfU8wMZwy30XKMk17FHU5/YsCpOZDE8/e1+ZFU8BgRXeAfr0qexQ9ZGBZBCHM0QG6RJQmTxJcMD+5ixYTmGIu5GsaJQEzOtCjWrM2dSbf/sTS9oSMtBrPUEqPsbYc4rZHX5Tv1caUbwth8q3+82iCmaDNsuK2akbfmqtTtAyN2iFNThv9kXJmW9V8MVbRa3THN+nrC4P/I3tohY5KRS9kOeul43hpHnNogO3O1RSKtFjdciT+usJmQIe/SUTX08WIp6yi2BsEZ2Xr+vcFmVT57iWbJlq0AQfukEjmg7DLbYP8RcstFj01dBJLdY2BNHPHhtRd3LS9EGN4U8FYjli6quGtdj7Pig5c0IcznNjF9pugplR152G2CXiUQACLjN68vZ11uDfCHxsosTn+GaDdmblTJjz0unw2ocpjJ/jKKLo3gcTdlqEWgx6ylxDjaafqug3FxKZoIeJBbiuNIVqWOmfFT1rN63+g/0cAfVJOfyqQrvIVmd3s120xLx+2k66qloqQPikPsrrDc9D88XpP5ONOyOBGM9JfTRiY3ujgzgEwgu11KCTQHOinZHkFnZw3IYaSCsagNH0nK3DYRbFxnDsTsVS57tLc5+2z7VxbDfdPpHdX1+r2mDyug
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(19092799006)(52116014)(376014)(921020)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J/lk+gmi0YMOiuLrBrJvDkkDA2tkVYpOJGcEWqbD93dz40QsVtvPr+jV6eQu?=
 =?us-ascii?Q?rWNjeg7LXrL9Ah2v+D6tNyUf84fZ/DUg3/AVgY1a/eEXYzHiSb1DHr+kAAbG?=
 =?us-ascii?Q?UKJc6ybF54jo24Tbmb8Ltl4ZBzyrrg+Zf1yH9WY/E06vECLuj803tOqZvtee?=
 =?us-ascii?Q?5vQCD5PFOfgVVTS8y8UfSJy+46i85+EOmc7emrX0k3QFyBB4uvIYafAR3pGV?=
 =?us-ascii?Q?wUvFrqV3cAeKQmEpLgKWrUc5P9256uffUYN0LMkF+V5jXRTDYq/+UDX4FYez?=
 =?us-ascii?Q?ttw4GHdQn7cqIVAOX5uByzCVNVdDa3ADgk58JimVSssRHWOk5Qu5r9zRhxn0?=
 =?us-ascii?Q?SQXMnMvevGgKPBS4Lqsz/9AGqM61owRxZoXxGeu0z/Q4eQyAWeSbcRa59C/Z?=
 =?us-ascii?Q?xs/O7YuIlq8DbQNXr55jkk7BHaTYtM8eaojPPXljvOvEQLmxupHjwFgWIv/M?=
 =?us-ascii?Q?zPsAtRpSUgfTqneOT9Cau1py7eKccky4i4pu85IKbubWfls8/E9Zc/6wne7v?=
 =?us-ascii?Q?nXDDvrHhxChnecrKJj/+GUnUPdwNmAzYjwjCsz9T1GgPUDtxqP1zakpRSzz8?=
 =?us-ascii?Q?WzOO73zWbE0WYStKlDo2KyLSEeNLQ4QPp3J1JSOzIsTo/d4pUZ+JazVI8VdE?=
 =?us-ascii?Q?ZLx7ThbvmLrowK6itSIUoFiuju5yRJ7dxKrBxkNSv6oAvtbQqyTy9HNeB9s3?=
 =?us-ascii?Q?/2YWhjJNOJhx2+GmzhscvokElI9IdIZLQrxazwDO32nH4ujAg4EBQAYMGpfz?=
 =?us-ascii?Q?xka629MjCp4WLBUR/ZDin7GW0HFF8te2WPBg8utmaABBjK3tevHEwyk8vFIh?=
 =?us-ascii?Q?QRQXt43Fg+L/R4Y529EzSIt1eTdvvdyGmRYp3tLkApyRzkHhL9nYO08Q+ygB?=
 =?us-ascii?Q?8YfOReOjSEscxmH+n9aYwopVFU/TNB4FgtSjZYxegT41pmrcPh7RQmRER2jd?=
 =?us-ascii?Q?/TvrLmAk+XEGSXKS88GRbetSQz57SsU2f2yl+2t4KIcz9eUmiGV6qfV3qIWX?=
 =?us-ascii?Q?KBuy5h3+3nFKaWY2eUgmv5DoXnOIBkgVFTgW2fgdA/J4eWtvHik6TvwkIjbA?=
 =?us-ascii?Q?TVQgsVdX/EKXCkuquXKQrzbjEq0QRCCuC+ankaLfyBaw72MzP+FypyW0O+Og?=
 =?us-ascii?Q?0tZzPFcr8zJBxTDnY3JABhjHJrwRSJYcAOC/nJuB9lWiyyP+KH4FQDyOUP3h?=
 =?us-ascii?Q?7D8OyBrOkl1Y917kpbfOhVkC5eRxAImkKLc4HMT3pT3ob2XZODpuweYxpnRF?=
 =?us-ascii?Q?0/fEy7rTMQd9wjJfYVDdBObu2fXWy52o4gBGFXUxWRV/nSOnvbo+ZBHNWnhd?=
 =?us-ascii?Q?P2iaGDVlE1N5z/GZB7XEX3pJWWx0ZbdkO5BFzY6bHW2caBM1UnqYoWShwMnH?=
 =?us-ascii?Q?8OPEvCRZER9kOB39dGoGmpJKafnd8BTvvNgmllG5y4kTQewaQDadRGqjSWfI?=
 =?us-ascii?Q?Etb/TYygwkc2+I2BKfZXNcxk5kt8ychWJ3o5dDs98O7CGtE2IAsg47IHOPfy?=
 =?us-ascii?Q?s+5gTgS6xGdkdch2tp6FGTSpDiVp9JfRauXbNVCaVycp2/7jF4ZutMmbeBXU?=
 =?us-ascii?Q?c49XO7sCTKg3SbNLxOAmpE9YHC8dAqIpXRHRm0LwEmmV/4x8FTO5XGEaoggm?=
 =?us-ascii?Q?o9fva+SyUiQeReqxdfO5QpzKro6+9QNQkvMEQRQleJCbGH7cbXKeZYOQvVPY?=
 =?us-ascii?Q?cTjyyy46QsvZIGrFzStrmhRq3AZIPQDDcNuzn6KVaEk2IWCTcRoiZ0J/jAwE?=
 =?us-ascii?Q?fSElnn+oFg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3920665-b602-4b29-be60-08de80a55bf8
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 02:08:03.6903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QEjq9Be2IImdXda2CijGgnyqWfbRa+7wVKwu3O+583hIKWe/YmsgJcDsWe2ON8LPT0p6JLfShmBcF8eXiRMtlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6844
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_190810_991242_9AC445BC 
X-CRM114-Status: GOOD (  10.87  )
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
index a74339982c24..9608f9fcd1b3 100644
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



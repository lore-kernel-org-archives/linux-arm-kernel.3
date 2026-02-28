Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1FCFEE4C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 07:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D/aYgbsoUR4XNDbHeLuKdktx2rZD2uUhaYoSxA8M2Jc=; b=jgskiQecYhAWpUpG5emi1Un+UT
	RtPovW3KcKU/FuluLGwlbgeMdLOO77UhVRKhm1BPx5w/fflsyJcxTPYEc+dfHcgPsdYSSmcx4iUX6
	5gPeiTcIgzRz9cWuGNQbfWLJCLXSogpwDpjkj0bHLth1yVdlQiqYOJ12VM2bPXfymMURAFUqB9HLd
	coRT2/BzIvpHiwUMnnccf8+Tzb3hTTNBS6Wvb1ro7AB7+GtIHn1UJG5abBYuzyFfIvh/D0GbJVtVY
	SfaJ3KMwgKdY1mJBVzljymCVF/6Uf9JhkvIaPBJLXJEG9WD/Ji2Ni0eDGAdIjmbcNY+A8HxsBgJGc
	+/ZI8PgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwElJ-00000009cFW-08Dn;
	Sat, 28 Feb 2026 07:29:17 +0000
Received: from mail-francecentralazon11013018.outbound.protection.outlook.com ([40.107.162.18] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwElG-00000009cF1-1kZm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 07:29:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVh9BsGXNU+XZA8YjgnbewJJHKVWtmF8F42peoqLQYd/cDrT7j8DdVId8lonuwbsU7dIdowqHXwrNo8zxa7Qt1MCq4ndbJvyi6iWAKRbuZqigAGpyc+YR511RVhgWAs0H1mpBiCU35VobbpUhuXWFnTeC79l3Qdfb96NsZkA8EoUSxYRDi9NMkEnDgHz8m43KuBS0AHmZq4eaPdmboaZVz+nBPH8U9fJ2BVijev39BX5erLo93NIDgiP2nQJIVIY9YY9PR2od+7kwPJbH7sxk+0bOdcWTAqnRHTjLCN5QlhLgzd5dzFcW2DjBhWT/IlvqyJ+TZD2/Ppposl54VMZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/aYgbsoUR4XNDbHeLuKdktx2rZD2uUhaYoSxA8M2Jc=;
 b=OPUYYotdbselz23xSrlQ2zAjoD6brnKxhbpIjQfZDXH3RLEraR1ATWJWL4nHakye3McFginCe95u0nDaUxWTqaaTM1PR4Q7RuuYANjscWwfGsoYk83rwOnsTNwGZZJ4XGyRJ4+9mDXyKxmkJPY2SjqUWciYNxwM338iNhxlyvNandx125oMde8I81o+2sJ1SB+VVWdPuBgs8bFNZkIyOBOT/4HqISf7V6/3mCdF7wL7PlnuvBo03tZQt3BU9Gs5pLGVhYqPTRJLh/W5KbtuE5KehPYzWIJBS85wcIy9nqPVXziwx+UguFeAnMpt0Uq8f3GvhP8UV1/hOeJQXfw1x6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/aYgbsoUR4XNDbHeLuKdktx2rZD2uUhaYoSxA8M2Jc=;
 b=dP3kkwJOaLoaFmuk5kose3Lr0kHx2mEBo4+OxBmaQGPYSqzcbpTU41gDYuf/ZV5bmrRTMGku9M1e54l/SVXPrE/R1VQ2szP6E9me50voZEOB/ftzmGPUwas6tb0yaR7+0MB2jby2l0owTZUNZCYUKEnnNJ+NMa+0lyQ5iRN5x+Nh8IqdJv+Y93530TBdLjOMrCK2TauPhg/cKFpuIu2P2yf0Stwq3z0KoQ2Fk5+vkRa6zHjJKfTTZt8p1Sz1zXVeKP1VN9Lvan9ll0vli2GlI5E82cXi2By/r0P9Iu9FTZ6dyE76t3dDOeDXVil5bGey/SPYF7Y+bBtCYRs2gtLj1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by GV4PR04MB11971.eurprd04.prod.outlook.com (2603:10a6:150:2ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Sat, 28 Feb
 2026 07:29:08 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 07:29:08 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1] PCI: imx6: Fix IMX6SX_GPR12_PCIE_TEST_POWERDOWN handling
Date: Sat, 28 Feb 2026 15:30:10 +0800
Message-Id: <20260228073010.1554804-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:3:18::33) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|GV4PR04MB11971:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e4d6aa-c1aa-453e-28b7-08de769b0f5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: xs4VXbzXOR3++YbQBIOVPvCGj1BAljDUlfwuBr5PeF7OCURLxlVywZs3yNGAoWY4JhhjVK/3xMHX1cawsMClUiyoAIhow+jmeiuWnNrsnCD6SUgCsHpKbziOatVKaTvwXRnYiPuLsGaBdgp5qVOgONyRpy9H+3W4UIw1KP7uwdvHuzdBt7TI2v54yoB8bj2deWDlCcQRtEWssLr2LebYREQoTvQO/BbKEhYALGpaVZMmKvg8skZzq14TlJdnuXjGL7aQptZh9qkqQMf4nrTE68d7xsA5NyjIlnyrs1cejSMDvlP2l2ePDpVZdYOzEN/aa6cneZox3O8ygnTgB3gmar3P1FMxsphwyYkUbbhp3cc3zf8CkpuPQ+YOAIvBraaOWZ5D0Du1qc+b5sy/eWORgmamYKn5KAjU6DnCrUfn0ldt4wLxD6IFefuS8NhPRkGUlNGu3VlwoL1MesMdB7pZSYSsnexXu2vVYE7QC1P+S+bjNSVk4wu6NWFQUf4UOO37ArkPhfVpMJ4ROKgNZL30btTy8iNhTgvNDCnua+eZ76RI2kJmmOJtXYygoJ63f69qALP6kFqOAoUDkITWxNd6Zk1VuApzEO2XUe/wZc1P1xqIS/9ahrLQRzdxEeGmdz9fouje6xiqoAgIeGSvf+FKWuOrlBLR5wPzFMtdJUH9tyVd780dfdu9xvmhn9ii4m46UTgipG2Z+Sr4DLfbmdZI1Yx/SDuyPaUXzEHg2ylcw101YgmwpzhScbMrzc/KQf4GgtWcE/SFyBmsYHEUU8JNSUw/JcANZIHR4e5syCtnCjbtpqxByroaE9yfFMcTRNOF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?clHwaEAsbspYObmRPdd7ZkCWMqGKbAPnuYIuu2LGIW2arS7DHHJSw+cBjmDb?=
 =?us-ascii?Q?MLFreXzkYUieCUJLwNup9q4e4e7Qy4ni0dnb6YjJc9btZXhkKNMw+w/KzImZ?=
 =?us-ascii?Q?4pTkxRUVcbU3I1+T5iTcdCEmkeUQrvpCNtXm0umdqvXxapr1kpXmMrw3W1VD?=
 =?us-ascii?Q?0IU9+/Z68W140OXseTkHuBt7i3t8VvLPeegBFVIVn+pm1wSpg8afdVFApgdb?=
 =?us-ascii?Q?MRiCoJycX2+1tY7ytUmXlR0enPtNuZ0q+PA39WTfAWpIKE8sm/YmjaKRrsCM?=
 =?us-ascii?Q?6m1Fs+aigRGmQia+E6jDopeTa9OFK7nlEaPea2uttffT/yMt+JGAxxTEYHGz?=
 =?us-ascii?Q?STTC9fCpM+OLrUxe+Vz+OogcBVrnrzvpAFkwVOIkesYdnUeH+Tiu7sc318vB?=
 =?us-ascii?Q?qolVZzSwieZ7y9sISKRd9aOPjOKjkJEly9LZIPyx8tdc5iKRw+5duksFyRtl?=
 =?us-ascii?Q?tbkFnnsUjYFwkvqWRCbmNgdMS4ee4+D78fshBICC59ffS7Mwvz2FY+ZMSidu?=
 =?us-ascii?Q?cGRSyJLS4op/odb/cJD2qVMCrmAEr6RpBeeXN0n9SBAalANiuKuFz0d4VMw8?=
 =?us-ascii?Q?YCOCcTTdDMQtdEBvKZpt/ukU+uRgfE12nt05vKkpHeRXH2gxwyOquuqsaPGW?=
 =?us-ascii?Q?f59SGRnLzLAvaECb7KgmftNjW/CRpNd8Vpz6Oxy2E5ON/BqGS2CxBX4udB5l?=
 =?us-ascii?Q?LnF4XK1YP2VELUrhNcxLq/ag4XxBUxS1+mEDAY2Si/Tl1A12ExlZaDvBAsTV?=
 =?us-ascii?Q?z0bkgG1c/JiiWzkm9mdzm5Z5ux6KJAm52pFmW73MmnSOl//V6SYPhYpApuFz?=
 =?us-ascii?Q?CHSWwGOG7xdDRegWu3T+mP3amRdugkofXnGjl1SgyFkbDQNPUEFeWjtuH02k?=
 =?us-ascii?Q?v+xg00q00RGmaf8HH6HRxovrf3s68fhuEZilvOMAqk5PMRUw8n+RhNyNc4Rv?=
 =?us-ascii?Q?lWuREJ9ZGsQSXADDD/wGlClEFU9xLeOxTl+4r60qViZZScAQQzTigMZ2CS24?=
 =?us-ascii?Q?MlFqDhsP9+L0BVNLGwlvMZ9NIqOGMFB8BDq6fWbHzF27Sm4FwNL6ilWcTT2u?=
 =?us-ascii?Q?9iG7I78280u4e5ZcZpSTU2eGPrRmsCc1PX5v5/HhbXX5h/8DsYXIKJZkB8A6?=
 =?us-ascii?Q?jH2Sz7Dw7pBFGhs17ZM3lz3vPtMXmtxRWUbSVqhS+FSy+91XvOO1j62uzTtl?=
 =?us-ascii?Q?loXtQiz470WBWki5me4dwXAdVcGcROXMPjLUwzs4ANXDUJRoIc0RhH4JjitA?=
 =?us-ascii?Q?gYZVn9qlLygUiJCPgYYNtrojYm1IxJ3Gvbrbsqye4DA8QPKVS2cBVRILcO/F?=
 =?us-ascii?Q?QhLdsiFjLp1Z0W5j+iWGc8Gq78iCRptpcsTS23A2xlFJPyoGOcfXGZam/rKw?=
 =?us-ascii?Q?N9bPnwGuUE3sngfKr2FnT0kEvZdX/clpfGV3mgvYj465eBf0Az2pO+ocF5i/?=
 =?us-ascii?Q?E3I3TBsCKp5SyEpEh6U0iAhaJgcA10vZt1pceRGhg+GAJh6VJxGibpBgXtFd?=
 =?us-ascii?Q?SBXMXb82eCGl1PcFzyTjD3U54KRgB7njfDf/5EZxUylbCE5HU8BRaS+BQ4cQ?=
 =?us-ascii?Q?+mzeQNUfwkR19y27rLNygKrApUf9WYG3Y6Z/2g0GhwkSITM06+d0vvmdLqkl?=
 =?us-ascii?Q?xNqMIIK/+rhuS51wkuyZ92mMoOWRtsaO38/aLUlGI0k9OZ4E2z5RLiaRId9m?=
 =?us-ascii?Q?y3a1RJJBZlp0zBzhEFIsLSj49maXzP5YeLoItKCmqzwXTu8SK5s/EbbnjzMC?=
 =?us-ascii?Q?NwFEMTwsbw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e4d6aa-c1aa-453e-28b7-08de769b0f5e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 07:29:08.6151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJr7i3NPEhG/4e0r0alrETcxm31yfEvvJe56zmZLC+XPl14vPDWi6KisliMdAb/54BPpFJa+T5ad/giNRCuBpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11971
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_232914_685980_619E2ED3 
X-CRM114-Status: GOOD (  11.49  )
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

The IMX6SX_GPR12_PCIE_TEST_POWERDOWN bit does not control the PCIe
reference clock on i.MX6SX. Instead, it is part of i.MX6SX PCIe core
reset sequence.

Move the IMX6SX_GPR12_PCIE_TEST_POWERDOWN assertion/deassertion into
the core reset functions to properly reflect its purpose. Remove the
.enable_ref_clk callback for i.MX6SX since it was incorrectly
manipulating this bit.

Fixes: e3c06cd063d6 ("PCI: imx6: Add initial imx6sx support")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index a5b8d0b71677..2d01c21b5570 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -663,14 +663,6 @@ static int imx_pcie_attach_pd(struct device *dev)
 	return 0;
 }
 
-static int imx6sx_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
-{
-	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
-			   IMX6SX_GPR12_PCIE_TEST_POWERDOWN,
-			   enable ? 0 : IMX6SX_GPR12_PCIE_TEST_POWERDOWN);
-	return 0;
-}
-
 static int imx6q_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
 {
 	if (enable) {
@@ -784,6 +776,9 @@ static int imx6sx_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
 	if (assert)
 		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
 				IMX6SX_GPR12_PCIE_TEST_POWERDOWN);
+	else
+		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
+				  IMX6SX_GPR12_PCIE_TEST_POWERDOWN);
 
 	/* Force PCIe PHY reset */
 	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR5, IMX6SX_GPR5_PCIE_BTNRST_RESET,
@@ -1883,7 +1878,6 @@ static const struct imx_pcie_drvdata drvdata[] = {
 		.mode_off[0] = IOMUXC_GPR12,
 		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
 		.init_phy = imx6sx_pcie_init_phy,
-		.enable_ref_clk = imx6sx_pcie_enable_ref_clk,
 		.core_reset = imx6sx_pcie_core_reset,
 		.ops = &imx_pcie_host_ops,
 	},
-- 
2.37.1



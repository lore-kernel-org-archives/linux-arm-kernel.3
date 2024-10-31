Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9966E68958
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 08:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4dbuamOPX2gdANO1GjTEOYffHw4Dwbo03rVE2EdQWo=; b=2KGPce0cNFtoGsFf5gDhv/YAnD
	cRJnsiFIPBpHk8BzVn30vDMw7O6A9eg5rn8H+NLErKiwnQzjcT3K4igtdl4IdbG7Jx3lson5spFU0
	g0D2XFLYURWKZpzgZlpa5yqSj5hFL3vBW9IwCE0PEcHJnJdThokcK7ycjMgJ9Is95HEX1629xOCh/
	RDPMSXatFtr3VNg849YHf6hwyXqSE/arrqWcMEKngFbDXd2Z80ixhXLfSXpD/KSoT3jf/aYlAWVIe
	SOKH2Tx5eVdZ0DRI0/6KSu+rugSnYdYAq30rH6sQj7udzmv3Gz64F4OMm51Z8TW+9yubheueAqENT
	Y0gxS8uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6QC5-00000002tLP-0Lfu;
	Thu, 31 Oct 2024 08:06:13 +0000
Received: from mail-db5eur02on2062a.outbound.protection.outlook.com ([2a01:111:f403:2608::62a] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Q3y-00000002rzX-1dMl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 07:57:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNO/OZZz3YTWhe6e2D3OLTZefZVI0mZgN/VSFe6fxxSfEMmSIT4EjaiKJMppXUOSUKOx2QA2cFrPXj6dEWJFmpHrCKawo8oOdS1jNGx562KlS1KNAtPP7jTMAF5iH8hQnMbkNKcoqfZRQMHhPI2Iq710OC8ViieS4SVON9yHTPrY21wap0Qae0PWdFFARsdcOeFU9jafISGRw1QLaN50eTJ5U0E5k8SBAmyy5Gp99LY0NGa+cdP9BuyfF7nyHSD973QYmlKb5JnfFiLteZ9coqAwIaNvCcv6tsuZRv18OZ1pHHXPviUw46Tf706GCDxgm8KUI7JYm9aShj4j/bnbEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4dbuamOPX2gdANO1GjTEOYffHw4Dwbo03rVE2EdQWo=;
 b=Ay+0/VnTFSYU83GP4eA1N3YedCOIaeR778AT7NdnuyrAEcAt2zGhUDbTKnKj3Pr2HRe9JW4RAaiiilL6Y/dMKoKwb9aHhfO/LJ/ggB61MD1PUpQQsu7OyHbae4/X+kMNlhWvqcwzzDajxHpbA7SeWbnk+1mQODfXbpSyzc26bac09mntyJHEBOjAr6orwCP2qNQmcPMmaRQCmC/pdHm9e7wKrfKwFqX6Nnu1vsgAYpeAXIjIQo15mjkINvYa0Z+w9Q25XfvREmDoXh7L9FHGF5liyrh5N9z53lyH4uTvH3rf79xk6TBIf8dkI+xehgmsTnCKGMaM3TAjFi9eFGQmcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4dbuamOPX2gdANO1GjTEOYffHw4Dwbo03rVE2EdQWo=;
 b=Bee0TbN+UhODqmYgAJ8FtQo9zrltlFOtvoEsX3itj8Tpgs0+aQ+SB55NVeKteLrl421ZDaqIVs1+FaBPdhz1dFPxxRN5UeOlXy75sahAHMXiloce+GChCG4s7o48k26okV/kIN/9lM57up7hdEHEpQJrjjYjiNIWJwSnc6r3ON/d9ZyVXBwLkylzsmgo3HXufZYTB8l7HTLvjo85V+NsbrtvjpnRbL1m+td3sJQX9g4DBJuZSy0iq0s5jZGLwESJV2C7kAoCUqkl6jFx+UO+b4cnBC2nDXFdz/l1cynnXj0pXCJZTZyXahOUmahMJRlplVcNWjBBoGZE7y0HH73nJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by DB9PR04MB8139.eurprd04.prod.outlook.com (2603:10a6:10:248::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 07:57:47 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%6]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 07:57:47 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: l.stach@pengutronix.de,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v5 09/10] PCI: imx6: Add i.MX8MQ i.MX8Q and i.MX95 PCIe PM support
Date: Thu, 31 Oct 2024 16:06:54 +0800
Message-Id: <20241031080655.3879139-10-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241031080655.3879139-1-hongxing.zhu@nxp.com>
References: <20241031080655.3879139-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0184.apcprd04.prod.outlook.com
 (2603:1096:4:14::22) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|DB9PR04MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc0c5b4-0548-4ec9-af55-08dcf981b56d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0eSbVJUJT/QKkuI5ywkOVp2ILnTTPOGVOtUkKVTfAROrGoLliPNHWf9Heug1?=
 =?us-ascii?Q?VlxmJksTrib/fY66qIRc9WiIIraxbaUXkj3IJiIjb5fCoa7ELz/Wh7HIjwAb?=
 =?us-ascii?Q?mlGfUv64k1OXeJ9JYFEcOANaNVH2uXsDDWsLmhk4cAcp/WUOTI35Y9dN0clZ?=
 =?us-ascii?Q?i2qIulFEJIJV6DCApwQvNixMomKMDUmjJbjTmZmkWHXPvIw+X0kuXjQnoAoX?=
 =?us-ascii?Q?H1W0aL2U6Xx0de/C7iH6at8y3KpHkO+/9I4bRmu2PpmSoYzhgr5sVOV4kT8B?=
 =?us-ascii?Q?x/mFO8MfSJZFciynqTAInYAMF0wmWnVOjhqpSBPsyE6izURhoq1PDZCKttMi?=
 =?us-ascii?Q?Pa2mQcY1mU+U3qCm3Jc5IpdYPuD1Rt5LAhD0oJIQpsfwaW1lA1AQHrxN8TRk?=
 =?us-ascii?Q?RKJ4idYRJ8qRn06KicqhMnv0jMWls4cfJ5j5fzZ8e1BITj057MzJojK0vwoQ?=
 =?us-ascii?Q?8TxVtoWnc3Gbvv+ZXnhk0iU/5b+7pkn/z+V2VzrGcQJjR5H8ixp+foQxKk3e?=
 =?us-ascii?Q?7ADFbYhI8VcFezHdROGHqV7H8MKPdrmQLwnm7zu7ejzIsTv1EeAaKaRLUuuq?=
 =?us-ascii?Q?wVw97LRcqtY5GYR7ON9eA3LNbxRLg0ybDZabr/mqeWDiiApWFrVzrNYXZnQs?=
 =?us-ascii?Q?+F4fBTkwejjS0uuI1XokOFgC58ATT2bhs2BpWQIyOE8INjoRV4MeHPBiqQQY?=
 =?us-ascii?Q?NlIUN5/L/xI1Yhz6FocXxOnXRIlIpPIqF8aFeIf65ep44ZuXmdLqMqCIIbK6?=
 =?us-ascii?Q?qBb7ikNMJHkHU4supG7EyXIdyNjjHeaqLRbCryIIKFbA5H80Q3ZCSP5WPgTl?=
 =?us-ascii?Q?vmf4rKtTftCxcKM8Vjr+W9o9Z3Y5dGKGfdL7Wi10Jf/bZ9Gh3T4f4RQFVTa4?=
 =?us-ascii?Q?X1kCdrWqjwb7NWozdYmux2epUXdLT3rXGkdGH2VB7UE72eAX+NyJfy69icMw?=
 =?us-ascii?Q?E4sO4IIlM2cP2958S0t7GyCCu2USLdoMapuMm3thNER7qCi9xmutQK/ASUPP?=
 =?us-ascii?Q?ntUkHl2LZo0OVBp/ftON13oJTylTCrb997louPe4ph4AMecHQIz9mHXoUljI?=
 =?us-ascii?Q?8MSr4d/Bvs4NlvR+CR8qmt6r+QOM6zPVgYR2diARUFrY/iv7kirQedDmU9Xe?=
 =?us-ascii?Q?HyH1WyCE0RpsgFCgfGVv2SFxVLcmCJAYSnmxXwwR3eErFrJjVygj/rAwPCZW?=
 =?us-ascii?Q?Pn6NEdbjOC+Rkm1sBSrEWBI2o0t1FHFLt7Mvc7rVqkmDyy/BS53XiMkV5o5S?=
 =?us-ascii?Q?9mbR9lfTVZlbsOPKzev9XzuYhPVN8zNnZ8GoqyPw9MCt1BHMR+Q226tBcTsD?=
 =?us-ascii?Q?/W5tWwGhNE4pIfiqhY6TRw7mrCf8nw1b2TbqQ2p1jzeFLYFaf3h1gXdsbQPg?=
 =?us-ascii?Q?TEJq957R6ELWwYuDZTSvbLpT9Uqs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YpE05U9vaaetzbqDC9NG7I4I3iB7SH6x2DT5Q32uS7zbMsGIfVugj2xr5A50?=
 =?us-ascii?Q?Nh6YZkakAgkMoZR747kOd5U9qJmx/wCJX7AW8K69AokWp18unJ8NetajXe7v?=
 =?us-ascii?Q?JAt5ePZKrJJP2Kw94OhTB8vKAfQz1WZUO1kCw+6A/6v8cA89D7Rw0HsZ8yTC?=
 =?us-ascii?Q?1a21SKFu4EJJs4r8y4x+muL1huy0BbfTdsICVU0DRgCy7ZAhVOPciSXqeRiS?=
 =?us-ascii?Q?Q0tCVjb6zfycfuIikWfLFeeDSBo3BNZrMcC11Ap4ZjYjsCaO691JxDt6SM9q?=
 =?us-ascii?Q?FdcJNj68ifqupSVOAgDTfWfPDvK1RFfFwhJxHdXDFC0lSLqQTERfYSGDT3ug?=
 =?us-ascii?Q?bV/Hf7SGnPUM+7hm/zOoZoO6mWiMstSJcyG1k+U214ss82yeiaQubZruN4L8?=
 =?us-ascii?Q?ds4rDkGucioIhaxKz6nERmgTAKW9CNzYem3jKqOBSgpgUhy5Nf1UQWdz8Uwa?=
 =?us-ascii?Q?t42EsWIAwTGLTVN7OSIbDiFFygaEr4CPEe0QTqrl8+P6SCsDe5eFJcWWSAlT?=
 =?us-ascii?Q?ibkFBk+fiSiWfeN0TfJ73ACwoIXYtVcdUjp92zYAep9fWci+jMYWyzewJkTo?=
 =?us-ascii?Q?AB1nOcJljmqQXUqVnhygsLOzgQFhQunNF3fDSoeqYYRIuYvd6LL26gNlBwNg?=
 =?us-ascii?Q?C1ejLss4rP7pHCOXxwG4y237O7dqGdYjQb/L25/hMCxGkuHElKfY4tBjXxke?=
 =?us-ascii?Q?OQ5Hx+SnVCVn25sJNL8WmSRS85Bj3NOras+KoKacUyj36wCcpPpLC5ZjNDJJ?=
 =?us-ascii?Q?h8y2fhEQQwOnA1JuzPZlmuicXQ2L9yHcuQZa0nyiJu3KRyEQHRvAJRuT3Sgl?=
 =?us-ascii?Q?WElmXsAuZzUSHftAaoqL9YsxSMNEFfsYjISuJw5CeVTKEmwPO1U2nAy49b2H?=
 =?us-ascii?Q?W1t5GsUq7cSaA3Ne0UNJ5qFITFZ9iMxV2wAaQKUVCTDuc+QqqkSrP+YWF4IU?=
 =?us-ascii?Q?pS79bzXJ7M/rK1JkBheECzU+XR25X5GeDTXpQIa5f0NiXT5pWs3oSZ8+Iybg?=
 =?us-ascii?Q?eJt9Q7GdTgSoCBPdY3miFhmz3axGsrFSZDSwFIkiJCh1HA8o9w0aUIpY4szm?=
 =?us-ascii?Q?R4HLC9cHZ5MJIxwGuPytsyhHmQ65xZOgdbUrZxqGtQU5p+GraALvuZPA8fQp?=
 =?us-ascii?Q?aNYyAI5MOD9JHTS3wod4u7jaoAydxs0ejDv7RIuqKHkaul5MdeOtX4AW7nUk?=
 =?us-ascii?Q?L+9jH4O7jaCevzC9T4AL73mWe2xXKL0NQLVFu6N2Ay3nekpP6ETX1cRFXmgN?=
 =?us-ascii?Q?Ewac7Ps7W59czN4qp4773ebucoocjCeQ7z81dKQ2B5NwUFlIuh1+p2z6nV6k?=
 =?us-ascii?Q?oSukRBx3S39PKFEqXqtZ8ZjbNU+VxKU3H+jCLjJxBewyoveaC/cvt2JfWRWE?=
 =?us-ascii?Q?nJDUM2pLF9bLH0DjieQOIanMvTXKwRsuRrisliJMYR9YTr8SUHhChYmIsQ58?=
 =?us-ascii?Q?V2rAutP1FkSBlV4pACTg7LS/vTODiirGlG+zQ7JlVbSqjZd3OQoBRKiY6zML?=
 =?us-ascii?Q?TsaE4HmEYcAVmh1hRiVdI79kVjmr4eySVy7usmUOEW+WU1G3PtbQwpCVkgxe?=
 =?us-ascii?Q?8pvhcRfDA3PxRI/mKu+dVJeSV9yBUjUAb63Tz2vz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc0c5b4-0548-4ec9-af55-08dcf981b56d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 07:57:47.1461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfKhCrzAMzZsbW0m57dDECVEkF4kH1BJvD3xuPLNAjy7k/j0+fQ+Ie6MtYM4LnBN1i40cxHDNQ5mm8DR2tiYOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_005750_456483_07117BFF 
X-CRM114-Status: GOOD (  10.15  )
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

Add iMX8MQ i.MX8Q and i.MX95 PCIe suspend/resume support.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 410a31e5f82a..f662fbb45626 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1502,7 +1502,8 @@ static const struct imx_pcie_drvdata drvdata[] = {
 	[IMX8MQ] = {
 		.variant = IMX8MQ,
 		.flags = IMX_PCIE_FLAG_HAS_APP_RESET |
-			 IMX_PCIE_FLAG_HAS_PHY_RESET,
+			 IMX_PCIE_FLAG_HAS_PHY_RESET |
+			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
 		.gpr = "fsl,imx8mq-iomuxc-gpr",
 		.clk_names = imx8mq_clks,
 		.clks_cnt = ARRAY_SIZE(imx8mq_clks),
@@ -1540,14 +1541,16 @@ static const struct imx_pcie_drvdata drvdata[] = {
 	[IMX8Q] = {
 		.variant = IMX8Q,
 		.flags = IMX_PCIE_FLAG_HAS_PHYDRV |
-			 IMX_PCIE_FLAG_CPU_ADDR_FIXUP,
+			 IMX_PCIE_FLAG_CPU_ADDR_FIXUP |
+			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
 		.clk_names = imx8q_clks,
 		.clks_cnt = ARRAY_SIZE(imx8q_clks),
 	},
 	[IMX95] = {
 		.variant = IMX95,
 		.flags = IMX_PCIE_FLAG_HAS_SERDES |
-			 IMX_PCIE_FLAG_CLOCKS_OPTIONAL,
+			 IMX_PCIE_FLAG_CLOCKS_OPTIONAL |
+			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
 		.clk_names = imx95_clks,
 		.clks_cnt = ARRAY_SIZE(imx95_clks),
 		.ltssm_off = IMX95_PE0_GEN_CTRL_3,
-- 
2.37.1



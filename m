Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AD0F513E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 02:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UajVEZZpitPse/bc43gtuICu94H5EDjF4K8WCv7Hhp0=; b=2uA4mWMWQhD/Cj4Ha8g0oXdlsL
	DOl5MtqsAJb3TEg2QPU8H79qh9AjzKyEQvDnYNQBAGSIyMjraD9IfSUDiMuM6ARfIlTEpANkX9wb1
	O3PZ1Yq3+p91NxZU0b80dwIak7WjQJ5HaqE5hysn8zlBOohpkXnPYvOekwjQ8hGI0VoLKL8M2HtB8
	8HGzxVceb6U3NM4OEgEoQmbNQCROWI8JFDvRg7jquTNJ4LfwddVJ5RyTyVt8cJRYFYOqTU1pI9Cak
	x8uy6m62LSUyUBvWz5MbwohIoIQb/SN7x0eWLBbS1Bt5qSSJG/JR5zHASP3xVOp/JmUPZV37MpWCF
	vvpUHFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyKfQ-00000002rj8-1Hd6;
	Fri, 06 Mar 2026 02:11:52 +0000
Received: from mail-francesouthazon11011055.outbound.protection.outlook.com ([40.107.130.55] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyKfN-00000002riN-0yun
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 02:11:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbQE8aoEk6/VoaJvb7jR9xIxSsooqSNHn+kvnwsVpNavLy//iKjoroq2wjPdojYuc2aAyKjAkYtF2nIY3zA+8D7IaY6/jtgOA8ZxHLfMf9AhxOk0pi+HCj7MT2dlpEKBw1rRfIaJ0dKo+x3ElLvL9jD2V7jCxiJp1kx14yZ3xw/cYmzM41BY/xEueql50CjfX+zVEgKXXlwKSjC4ekKS6glU3NNsBs5nrMol9BoLAkecmmNXiHzZ4dvP0klCnqZlDIPtkdyrXvNwKo5YNiudRYvc8uqCL+Sitalq9wINTLrhy+m+tiJEDyop0j7kvvYs8siLutgqqW6FsehbA9pd8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UajVEZZpitPse/bc43gtuICu94H5EDjF4K8WCv7Hhp0=;
 b=OezsuMWbsb6AyxMVEDEfdTugYA0CreP1h6OB4chnoY1izjrrGSZGOxPplgUypEMmI0rM+Svmez37z28bErBuWVGPazmOBuGaOcEuYxksOnhCfMRCfPb55oI/v/bAILDPlLc/OSQSl3wZjWl6DFVGZLYPHpkF0QmAzhNPmp4JlI0Y0uXzJ5q8MM+m9fy7kblr1yzsJ5GKz5MAxA/4OY9JfZcXxEAzvsjujwelSLNSEfEKIsQpAYWoY+d0u5kSoaKP4Hmn2kOMNjMGQOYnyO70f+dsRXIMouzXqTQrbzKJleHj2/Uwh471N+9eTSGFl0CSnkzErrdMrMi9y0nG4T1o4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UajVEZZpitPse/bc43gtuICu94H5EDjF4K8WCv7Hhp0=;
 b=XQ+mTIf29dpw648VT9ZlRJ1wrByZ7x+8eiGMvdsUNljJmQM3K7WVGPxBoypeNzRPcBL9J012kK2/XnWBGX0bRDVq6AXsDB7QU5sCQpdM9zDs7JaNVpuaGmTt/KDcF0rzPZ0PcowdJSXNczqKlLYwN/bYKnXeXwnJ3Xb6guTpzpcIH12O9iyzeQyz3KuGPkmVJYFwzy3khyZsWQZXW+jce66RQdnBqgS7BNgM+ryQrbNxS0ao4ASCCAqqf78zeSkrmFoSJOS3xZuQ7aV07NPen9uq88yHaw+3Zxi5lsdhsZ78dVVJ/0r00nmGk6ufgaSSy3lIBIjYJhDjkHgX5rwIYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GVXPR04MB11629.eurprd04.prod.outlook.com
 (2603:10a6:150:2c1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 02:11:42 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 02:11:42 +0000
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
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] PCI: imx6: Change imx_pcie_deassert_core_reset() to return void
Date: Fri,  6 Mar 2026 10:12:47 +0800
Message-Id: <20260306021247.991976-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|GVXPR04MB11629:EE_
X-MS-Office365-Filtering-Correlation-Id: 671d3573-cad7-484a-7d9d-08de7b25b574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: gioukGFqOnj5ulzGYbzv3xgi2zIGhWYdPjUr240THmE+8mwubEwNdLr41DL3AdMbHAlyvzbIZPECatVNxWqlKTBwtoR7TKkrY2Dkl0DjLqH7X6WmHu0qBiUhWJLV872CR/eXIPyxxb/peayyhCkGWcAFAKrclRDSNU0RFTTRUJP6k02E1cBlQE2fU+6bW37R8JlAvvs1PQNm9CbmM/MxSP2v54Hh3+oG2kqMW1ik90LIXf1xQAPF3pe7NT/XFWmfH4jG+CvY9L2JCOg/Fz5/XuFSjsf1NPIhNS9bS2a++YtjwSAo6Gm7Yp7aQLraEl3ytzG265EDT8n4I3i9eo0KjsGQlm1gQEAj3idkUDiwpgAnRhH5ZZWHAvT1iORjzxwEPGOl/Da/zzqaupa83c2IKR1a/LkmiwDQVpf8V2b9ht8cXBAXq4VCs4T0jsVFd55BepP6v1mn0oAXhkNePBUfrVbvfKNXAJxXSSXB0CFGOibcT61BTN7ETcO2NZTOr1qiQzTmWZ09NXUHT3pUZQjp0i2Tre8o6SdU+YeW7ZNqKKba7klLsEWgjBlHr37IVNdftGL+vC54RJ+rApR/CP74rCm7vJOzqCpcdeq5QYqTCOMYgMTVia8hpirutIeov0k+R8DngFGGuzrkN67O0kJ3MpyIdIQtmbgq4uPasvcsz4a4xfJPPsN72Qhba+7fVFLq/R9Xgu0ZNpPc3ZajR5VQVznewoLKVZAIz0KtKzh9GiLRqb2GZ7BjUMSJdhRuItdi/S3yHz5GGWMrbZRmRQ33UVLvNgltYUCcrJzYl5byd3BMOxU1Tbcw1Mp1lANZvQpp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kgJcBIA+WMbubyHkHhSnwQwzcTYXZ3manKuXcXuiYKsOS+dQ5uYlrvffLXoo?=
 =?us-ascii?Q?6K2FTYYvCscGNAaCn33cyE2WgVs2BKfBVXPiLGGL+5iFN2v5VL8nYR10qmc/?=
 =?us-ascii?Q?7incy2WKvNAQpcFXmPSIsN+oWUjxjdS/qe9BniaPZ3mVuKOXp40p65YrEc9q?=
 =?us-ascii?Q?bfbdJ6UaI2NcSUtyCZRWgJH77Nhsc4iIj9L6ERbMb/ZISdDc2XKxTOR0h8S5?=
 =?us-ascii?Q?ybA5Vp4OuPBxVyBA+8SCV2mvf5rElmvujR9koDZrkpA7XRLcEIZZiL45khUv?=
 =?us-ascii?Q?N7CSW1p3bofUMppHmg/PICwgv20f/BfSAsCyqn0M2LpoyTAIMoK0M3983obP?=
 =?us-ascii?Q?7kEwxMDHYfvrbhqh/sjnhMLgZuYxx0UDk5kpS4vf2Js1G1xkBCdoApLm+r4M?=
 =?us-ascii?Q?PCB99jwGLRncoPy/Cd2LmvnFMm5jFp8OgmB9eYQscyMu5jYoKmBCDAP3m/sN?=
 =?us-ascii?Q?wwnlfX8OfV5Pa13sKJ5S85AaBCg3hjFoUgU1KMkmolaxsibg+9s6/h0SkWVI?=
 =?us-ascii?Q?/l5FuKLLiavXpfGDJ4ByCm/xb/M2BPUDE3Glf5vh/GRb/3FMzUUjIkfhwW8a?=
 =?us-ascii?Q?DmQm8msSvho5qkr8qdx+5Skng3QnUkmyHdYrv0xxYrdfVgY5ARXC7ibHt7oS?=
 =?us-ascii?Q?bruLOfdV+R+YA867X7KxrU3/sZbWsIRQuFMx+sjj8+hYu3pAZBtabIDQSqaw?=
 =?us-ascii?Q?F/uXryUBGaK45ihEEZJdQUvenLI2diKA9QJJWXOgp/6WsaDgFEwWgvctrIFV?=
 =?us-ascii?Q?HTYjsDHqUDHcpVEI2IFfGoUb8AIUije8cBdcdKZjEsjRBWlxBm5e9htisbUe?=
 =?us-ascii?Q?63iUIL4DUQfX7bhv/a+tSY9+SVCrGNr5BaUIfPzlw8uK8H8MOZo7ddHJNSIJ?=
 =?us-ascii?Q?CZ61B5BrkGgxkdqbIxKiOY4CIrwmWm5aZBuHo1FTCUFxZbGiIPR61kfT0NFg?=
 =?us-ascii?Q?LqVWbGe+X1d3roX3G0LwcDqGtwB+FVOPDS0hNkVM43YWPDqTQ6JNCPU+M4tU?=
 =?us-ascii?Q?Zis4QZilFEVRlIdJANVgu3zWLNyEMV4SHlH9+2UUL/rAiIWtr/TphDGfwirf?=
 =?us-ascii?Q?gymDMKlbBB/WX6lagC+aLWMToiJyrEqGUIczFhNm2KPxZIwZOLd52MQJluZb?=
 =?us-ascii?Q?TTiHlStGpQBdg/E/1lhOoVdAwBHo8aqEZapDfJVhFQ4o2Gp3TXLCV6BTy/oZ?=
 =?us-ascii?Q?koniwmTl+VYfE1JSMPLvCfUsoHYwL4/VZ9CMTT8tQOtiFd6fyf7AMwVsm2Uy?=
 =?us-ascii?Q?uZjBiJfK+DJgbOVwm/+cE+wJ5DBATpyF3X1LiE0gpP5cgyVTQqXtEmvDNDIb?=
 =?us-ascii?Q?zI9T8a7uriT7m5WAHolvXrhcc/aUWpK+yLzRLRVFTR6AVjL6kHzopRYnJTv1?=
 =?us-ascii?Q?SM7sx6OD9aApy7AC8I/fwF3Jiop4dd/t1AkX5o69vo9pS7+gYgF0OQTE4UKc?=
 =?us-ascii?Q?zhCyNq4q206CSyKnwwj8STra+7xLM+bYBd73eJopc7JoUehq5YGUdoQ3RXls?=
 =?us-ascii?Q?rwabe7Zp/81f8x9hMrpqkCi701xefzFBKfvBBtROURj2U879JC7/JwXZwa0T?=
 =?us-ascii?Q?NZxdFETWhpdnJ/7mqW5f58Wns3shEspZ0QFTdSExZFSp9DFju9dL5mdzs8jm?=
 =?us-ascii?Q?lNYzGDcr6/ZmlmpJrypq9BxSOhJgIoqIqeBWyVenc8z1qrBfz8CFFQ9bsfmk?=
 =?us-ascii?Q?KO5ijEyffVJ7600gFMBp9OWjahi9QCjvkxOlbF1U6vb7Q8tm/t4pqgSkiCZZ?=
 =?us-ascii?Q?j31ezNwR6Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 671d3573-cad7-484a-7d9d-08de7b25b574
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 02:11:42.3823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxLwoCwjr5jZBNpo3FslBdPhblyrhseVVi/gR8uGhXrF0IAz0GJh/InxNaFUh7EJKmg1IwKISof1HoOhRVGQeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_181149_300751_7BE45436 
X-CRM114-Status: GOOD (  14.25  )
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

The function imx_pcie_deassert_core_reset() always returns 0 and the
return value is not used meaningfully by its callers.

Change the return type from int to void to simplify the code and
remove unnecessary error handling paths. No functional change intended.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in V2:
1. Remove the Fixes tag.
2. Add Reviewed-by tag.
---
 drivers/pci/controller/dwc/pci-imx6.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 81a7093494c8..ba6e7c7ee625 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -906,7 +906,7 @@ static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
 	gpiod_set_value_cansleep(imx_pcie->reset_gpiod, 1);
 }
 
-static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
+static void imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
 {
 	reset_control_deassert(imx_pcie->pciephy_reset);
 
@@ -920,8 +920,6 @@ static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
 		/* Wait for 100ms after PERST# deassertion (PCIe r5.0, 6.6.1) */
 		msleep(100);
 	}
-
-	return 0;
 }
 
 static int imx_pcie_wait_for_speed_change(struct imx_pcie *imx_pcie)
@@ -1292,11 +1290,7 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 	/* Make sure that PCIe LTSSM is cleared */
 	imx_pcie_ltssm_disable(dev);
 
-	ret = imx_pcie_deassert_core_reset(imx_pcie);
-	if (ret < 0) {
-		dev_err(dev, "pcie deassert core reset failed: %d\n", ret);
-		goto err_phy_off;
-	}
+	imx_pcie_deassert_core_reset(imx_pcie);
 
 	if (imx_pcie->drvdata->wait_pll_lock) {
 		ret = imx_pcie->drvdata->wait_pll_lock(imx_pcie);
@@ -1613,9 +1607,7 @@ static int imx_pcie_resume_noirq(struct device *dev)
 		ret = imx_pcie->drvdata->enable_ref_clk(imx_pcie, true);
 		if (ret)
 			return ret;
-		ret = imx_pcie_deassert_core_reset(imx_pcie);
-		if (ret)
-			return ret;
+		imx_pcie_deassert_core_reset(imx_pcie);
 
 		/*
 		 * Using PCIE_TEST_PD seems to disable MSI and powers down the
-- 
2.37.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380C1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9Mm5/XRftq4U9jdpL23R1AS3Rh6H1omF+6iL6UlRQQ=; b=V6JdsJE3s87kAHnwvuEItMivsP
	uiAPRP8v+dlwzvohib5vBUXKQR9iM7eWVS5qlS7QAt0ZdcfteSoka5w7Pqt38zgLjpxP97gSxubbY
	qJ4vhtgKVntq6i+PeI5L/EKrps0KrSsHcsAF5RPVoFoQivbK5SgLDUQqLJwWdrllNSbUGDZfFfkTA
	epoQeK1vwQUzqy3nrxgjfcw+/GR+LI9P3+1NYLB1fOheJzQCK1avzkQBfBByhKWkIa/hCFxoaZqKq
	sqo/bnV5G5khc3sjdseThxvxv5h+gRPS9N/+QD70HULusaefjUYgLXnsbb0ZwqnqJsetBxSbw16uN
	JGNf2Qsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whllW-00000001uKJ-3djg;
	Thu, 09 Jul 2026 10:13:58 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whllU-00000001uIM-1qcA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 10:13:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWJoJx98UreqYGQB5qqel22zMMj4OsJ+6xJ7nInKutLWMNbBSyQLCeUmDjM4j/ZtRVrxOPMppId7WUMzcesPldJbPLq9Bvi1V2bde/EY0Fc7Sg0OcLykvX0sgWMyEV6/j8IO50MdcyLfZZM4vrj1Ni6nTaRHmCv07dBgfQNcBuhDTFBY+TsOTer3Cu2/8MHsPHaw9tY0Jz9diW8dpvJni3jXXm88R3ZGgzT+hliebIC29Xb14qiGnk8aEytu5Ix7ZtABUBUFYSZHCV3uLRQTXGafR36Do5NldsbZSYQuvAW7hc7C0utgODgO0N+unZO8EIk8Uix9EWZrzM6tutUshA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9Mm5/XRftq4U9jdpL23R1AS3Rh6H1omF+6iL6UlRQQ=;
 b=ldEncwDB8GqtICx6M0qO3xuOy8waGYoSmDyhnGlqQotLdYKyObi3O3q3yd/wHItn+0IosiOQ/XKrz3QIg9vXgyytiJWTUDdw+jGccC6DXZB9GGHvv31iWmuF9CMUrNFdGYDzOVoq/x0XB4U5dwCHOOoHtyDk7GQaX2/WJcMfl17LIy13bHDVzAZ/7sEE0QR5Vk3IMprgqL7aucsve+qeK/Rcj1BGJy5RXwf1SK9oX9iAqcsHo26eEbyCFk5s23UYYNtM050FPwKwjiXC8qyE909WAPbdqgud9BjdJ/V65Poe9DGwGtF7vp3q6W9JdAmaGT6K3v2TxvOAUskPlVP2GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9Mm5/XRftq4U9jdpL23R1AS3Rh6H1omF+6iL6UlRQQ=;
 b=Hj22imbOd2L3C2b4PyXy7+1DCIy+PjBGyz+uduKf/TAJ03sCCsJw9GHbPriAtuPLPGwqszaJeePQ9/VPv3bUBhietD/mFGD3FVKrLfwFNFhjv2qs/TOepbXdfbMp/4Uc153MABVSkRyo494dPy8aqqoMOJ9gxEpYZlg4Uqp3j8oz5cBb5/gjlGrrLke/Z8uJI3pv9GISycR127Uzl5mTLaqPrJIV2agTABezgE3zyKAmOba/Q0UbHGJfxGQvbH4cS2s7P8dVHwWmAaj+WCBFto6uVQ62Cqgo3/rY/WiKq8PDnejC7QNKq6lLdAa2LGmWKPhFz8rQkHoZxMv16lWdSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by AS5PR04MB9854.eurprd04.prod.outlook.com (2603:10a6:20b:673::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 10:13:49 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 10:13:49 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	amitkumar.karwar@nxp.com,
	neeraj.sanjaykale@nxp.com,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	brgl@kernel.org
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	sherry.sun@nxp.com
Subject: [PATCH V5 2/4] PCI: imx6: Add skip_pwrctrl_off flag support
Date: Thu,  9 Jul 2026 18:15:53 +0800
Message-ID: <20260709101555.3034853-3-sherry.sun@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260709101555.3034853-1-sherry.sun@oss.nxp.com>
References: <20260709101555.3034853-1-sherry.sun@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR03CA0013.apcprd03.prod.outlook.com
 (2603:1096:4:297::19) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|AS5PR04MB9854:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e38c674-c79a-4c5e-14f8-08dedda2c47e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|19092799006|23010399003|56012099006|11063799006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: J5IjBMJZan0yIjipQ8bJm9hzyt507dflTFcpPOeJ/Bxsj9Vg4+3qc/0chrhBNXr3eSC/bZM05waOjzCJIF6Q9bC1yxqTQ2tgK8WBReUqOEezfdVqb+N4XFkREvLTuFAzxAXEpeYvdPKpzHmX8x3nawCgsdZz3B+W17Jibs6qh/ES4vkUtJVCYkp3C77JCHrgsWeUQaxTnJL8wM3fKXLFwaCd5s1p1PGgRPJHUBob1iTR5l6ozRbfba29reRRmdm28hIS87jjCtwIDTy4EgTzPS4qZMPg/dK6IXUSJcioRnJfCRbgnLhXCMiMZRxq0OVM9MVeUrGuQKBsJU1p3Ik5CPiSDjudJbR1t4G5QRXdeSOZRrKzfI3ZyV68aMxCWVFXr+4mrT6b6cj4HWnzhiFmoYiZa8s70JNTLnB/0xmhE/x4MqURYv76ItpMG8Oh9GKSpN1Cpx2mfmIMWh2fp8Cfd/Tt1FQoKwbZAd5as0l72tdyKKqr3O0pSe80jnW4lrkjHJLecVBLDXbZ+3WjAPTz0VeNmOTaSneovmBU8Iq2PkGB45kyC0p8JFKfwocmvEJnas53bdUR24/r+15rZyUZvn3fJWDU9Mg0Q4JLcXmGMvz0+z/v5KKgG7AhpxexT5z192IDPSQpf8Ypl4cX8yAjVU6idLVJALWKrQ5nPM5D4HJaNOqEDHyqS3yvcHC/as5bFanEM+/4s5+pkCCUQw+6wA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(19092799006)(23010399003)(56012099006)(11063799006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CQ5Qt8LK7+cFAwEpBBylCQcFMk6ey4P3bCDfFaTZ6Us0zDlWtl5+cj2B9ihW?=
 =?us-ascii?Q?yI3rA4pJuqQUndw774k8DwzyAUIgn6EMe2eYzTRaGwH6vpdXN0trpKY52iwl?=
 =?us-ascii?Q?oA2FRGpiNs3wSh1+6sctriAcpABLdYWDi9OsAUxwklbCwqyuhYextWu/09sj?=
 =?us-ascii?Q?lJPogCNyJNJv/HEtmFkArPOU25/xu4xNBs3C0HllWTu9UGlz248xA5/lfZ8r?=
 =?us-ascii?Q?M7jdxznMUTNb1groBJAh4aeNnIMrczHXMy9YWgYOQ8q0vkSpBg71Y5ZOVPZt?=
 =?us-ascii?Q?sQBAQURDlBeDpOIHAPDkMPp1+LE0m2S6FmMbZj2V+iRR0VyygULNdpHszGY4?=
 =?us-ascii?Q?uvCYYF7kMMg5uu2C/qolmg0Uw7tWJor1HX8Fu5bRU0f2J+rB+TCQZWmdqss2?=
 =?us-ascii?Q?lcCy3vmh869iBxIm9nmNdqEc9PE92b83yZEcedYNEQP0tSbHRMSh1Bx6J6r1?=
 =?us-ascii?Q?HJ8WBz4l/C41uwrRHy1ti92MKkWRaap2xY2qTXsYrhLM/aEBOJeWO6uhUW5u?=
 =?us-ascii?Q?UjAPuQ/XPqXSIDAo6Xn98WGo+bY1kf4lqgfez0ZV+i4aQb3utuUIFuBSEBlV?=
 =?us-ascii?Q?GhDf2alzAF137YzrH1nu7ypNR1DDcnEAQzMVA4m/yW9oAtOjgzTrzfczVTJl?=
 =?us-ascii?Q?jHgcv8ZcKwEUPcDdzc8j8Nxq5vpAaeInx0feaGxncwSFDwgX6OyaSu041AXd?=
 =?us-ascii?Q?Q03lLW/VQBcX/jxJwQnZ3xkyyDASbrjJ3jYtTAamUHinxkpw0b8vTmFsnK21?=
 =?us-ascii?Q?Pvk63uCnsYD/Te8UoOGgdS+07crSR43SjfzV97fNRuMyR75uC2RPGIKWBI6M?=
 =?us-ascii?Q?PV0bX2YqHPyJZ9JhtS4/rfVppxLk9t4LpufSlGtW3KVY67uwSUYCvIeSul7Z?=
 =?us-ascii?Q?YgyaOw0JbcBRXXS1JTT9KQd2LkxyaiTdA/NXq5oGiIrs9CdOLdkGiUwjYs4P?=
 =?us-ascii?Q?/ct8LcHTSlb9Tl9cghCWO4p6kXgcKdpQsXhj/6EM78gL+JlnJEqj5+Q4vZLj?=
 =?us-ascii?Q?ATEpmy/NaOpRsOeEccMnhTC1pre2YMylCafzcNouqvc5jy8Qro8lCHGcIhEK?=
 =?us-ascii?Q?xEnhTqUmNszGZIFmDMEQ5An3NR5hCvKU2Ch5QVNI/EcFn7ba/UAKaxHCuTv2?=
 =?us-ascii?Q?gwepMVEFIs9DijC2frlsXFXT3WDqqhexnqUwR259mOW3tfeU939zKD6B5dOL?=
 =?us-ascii?Q?6VeS9LsUZsfjlAoROG4v9noS4aQb2FHGt3QdxDr44TIA5GiZfpprG7a0lmIp?=
 =?us-ascii?Q?K4jQwEj+IX8fXF75bxv/ctNm+FFhO/N1S/xu/4Q4jqWdoaAu0xoR3IM+qpQs?=
 =?us-ascii?Q?EVYPmfacBiV6vMohwpfX2UFA0h0Gb1ycXansuo59+FssXZp9kF/dS/AhXyzg?=
 =?us-ascii?Q?WCqWp2ZAVuPDShAx9M6/Oqy8TsM3ESrqJtl2TwktXZykXWMocL1psO3sZgp/?=
 =?us-ascii?Q?bkMFUNLBfKU7Ei92CKKalQd8IK4l4JmoGCFqJlMEfRvE5xDCbh8p+G9iYs+a?=
 =?us-ascii?Q?jSW7EWDBRk6sYikXZ7Hm2KVDrR+894ByBSBB26BgAs+eXkmeLBRAJ1ZkNHZA?=
 =?us-ascii?Q?CgPEEFfPKAhXq20/t8FqyCQLoT9yKh8wrfZ67htAstDOXTFiqnTTHHzuDm6i?=
 =?us-ascii?Q?cIgd3T+nutOUuh28Al++taPLL16GAQO8cil8gGHD7r0+8JxbPCgcymUQbkv5?=
 =?us-ascii?Q?SmqkTUdYaEFHNvqvMA3ldj/bLRjPPr/ofovvYt8T+cVbwaVcjQHbFF4Oqtp5?=
 =?us-ascii?Q?hy99JP5iraVRIticOPWQlzQxOVCPnTQyJVcaKOYiWfn0c83lFtLz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e38c674-c79a-4c5e-14f8-08dedda2c47e
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 10:13:49.2209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfgUrWbnrv1uTklXapOCecZtuE0gekdWglno5s+8JZEDhzgvnI5fx2Dgx/1U8JLZcYqIQEMbR/7TOfHKK+mA9DqeNbzXvgo5qh9prsquq4j37S0llj6GYxUlwJne4/we
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9854
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_031356_774158_13F4FEC7 
X-CRM114-Status: GOOD (  11.84  )
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

From: Sherry Sun <sherry.sun@nxp.com>

Use dw_pcie_rp::skip_pwrctrl_off to avoid powering off devices during
suspend to preserve wakeup capability of the devices and also not to
power on the devices in the init path.

This allows controller power-off to be skipped when some devices (e.g.
M.2 Key E cards without auxiliary power) need to support PCIe L2 link
state and wake-up mechanisms.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 92f8e4a299e8..afcf3b6bf3cd 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1382,10 +1382,12 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 		}
 	}
 
-	ret = pci_pwrctrl_power_on_devices(dev);
-	if (ret) {
-		dev_err(dev, "failed to power on pwrctrl devices\n");
-		goto err_reg_disable;
+	if (!pp->skip_pwrctrl_off) {
+		ret = pci_pwrctrl_power_on_devices(dev);
+		if (ret) {
+			dev_err(dev, "failed to power on pwrctrl devices\n");
+			goto err_reg_disable;
+		}
 	}
 
 	ret = imx_pcie_clk_enable(imx_pcie);
@@ -1454,7 +1456,8 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 err_clk_disable:
 	imx_pcie_clk_disable(imx_pcie);
 err_pwrctrl_power_off:
-	pci_pwrctrl_power_off_devices(dev);
+	if (!pp->skip_pwrctrl_off)
+		pci_pwrctrl_power_off_devices(dev);
 err_reg_disable:
 	if (imx_pcie->vpcie)
 		regulator_disable(imx_pcie->vpcie);
@@ -1473,7 +1476,8 @@ static void imx_pcie_host_exit(struct dw_pcie_rp *pp)
 	}
 	imx_pcie_clk_disable(imx_pcie);
 
-	pci_pwrctrl_power_off_devices(pci->dev);
+	if (!pci->pp.skip_pwrctrl_off)
+		pci_pwrctrl_power_off_devices(pci->dev);
 	if (imx_pcie->vpcie)
 		regulator_disable(imx_pcie->vpcie);
 }
-- 
2.50.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AFDE68944
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 08:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkWozaYB6c4gmku3Xai3zp9D5hIcsNaCS/eKBvHqTEM=; b=XoB3/JNTzp/9vE08ljk6ha79P2
	pwmg8yBwgNXy8DS+2rZhxy4V68tyzNMVavJ74JLf19XMsh4POZKeyD5vPPIz31QkzposMnjMw5yry
	QwkSf6QUSbb9bMRZTuzKSk1f/gQa502E+6XX577tTX6jYD0Gj6COyCum5xeFdy1gZKdZHbn27QBOv
	cy1MjOg7saMIaiUPvky22Ia+mTgsc6hZ6feTLsQT9L98GKRKNeUHGy9wehfLaIBTyjn0ytfAC4dnA
	PeqAxoo7GWAVcaTns5NJUmmQ0gv07mf97il4e1SgigjthHQeZ77MCjIJIr28IEgS2Bgzokatq2da0
	ijspCZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Q88-00000002sxV-39ct;
	Thu, 31 Oct 2024 08:02:08 +0000
Received: from mail-am0eur02on20612.outbound.protection.outlook.com ([2a01:111:f403:2606::612] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Q3K-00000002rmh-0YHS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 07:57:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yy2A2Epom73rVMPrjmYQxSX/9hU/Rg+oyhuu0h2WsM6iGcj5VdubKho512SKCp2490kXI7z4rC/V4qGJffsZ6ehZH9mhv6FOhLA2S0BSZDNJftr/sXPTIx1uaNnd9aWj86CzzvX6t14oAwWu7nuw+9gqFEZVTaUxvPuXDQqFSXjqYi07yWha77+ErhVRIEBKvvsLon42EJ1X6sNjNi3lDwioC2ij7Y7nVcHGhmyvHb+ayzvyU5/eD2me8pe/UtSXdPteF1tGPq7b8adBSNjjxug369bWrMFDfNIRF+7imfHvQU2njciyY4Fx/zauLm7pPWthuQHM1GBMuBc1eWfMMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkWozaYB6c4gmku3Xai3zp9D5hIcsNaCS/eKBvHqTEM=;
 b=BUkZvmBCAe22K+OpbTEWSx1e9RwGzG//UwBVEC62A2IcW82S4QARDZx9fM5DaU6gTh/pSgkUvLPHfPJlW/S6LI5ocaUDL9Bl0apHggdiis+bidSytRSshgbUqAxExuMGmO3UEbMJFUpN554prsPJyIIsmLhSglGYBU//HCLrJnRt1b+fl9sc1nh3sl/N1t5G1avfpJWAYvdJb+tpZw2VRxPYKzzf03KPAoz/8L7jp9XG4ajQzB61rJ0pN7Be9oU6oqWX//hRqjC2cIXaYxcZJM2xtNrdK42BQZng2ngJVJetXc3D4ccK+D+X5bH4qSn5uNVRk31Plvrbgk7+zwgaYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkWozaYB6c4gmku3Xai3zp9D5hIcsNaCS/eKBvHqTEM=;
 b=bQnFVW3f6h+tO33EIIIqunYI48MP2RorkbMjUQIOPKJ2vxdJVD68KheN9drY/fNW/RcDOv0UtM3HHgPNq0twDsp+FYKYrHp6F8ZgyLD9qhlS/mVrBhDJzaN0XNOQCS2nGHORJ7ZLqVGy9ysr+5Q+zW/OupcB8VwWm4+uwVY+x5/HGM3XkSrWhl1pwTpMFCJo6A5YitLkLGiBUSQ2jBE85cCgY9AY10bkFGobZxgelsQMZknCTmS14ylVF7z6ZBRMvboKzHC2oO++MuaEMyzX/j3OP3sEFAVOmMRZzYXR8aJvtGvyP8giOftBeRSqHBM1/fSFKsPr8xcGxu0LvkSIcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by DB9PR04MB8139.eurprd04.prod.outlook.com (2603:10a6:10:248::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 07:57:06 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%6]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 07:57:06 +0000
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
Subject: [PATCH v5 02/10] PCI: imx6: Add ref clock for i.MX95 PCIe
Date: Thu, 31 Oct 2024 16:06:47 +0800
Message-Id: <20241031080655.3879139-3-hongxing.zhu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: b2fd7a23-eb07-4190-c2d0-08dcf9819cf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?csOaY+bnHa6WFnDqv/vQpszWPoWLgknzh4BWdK212QPq0rtWK7JGuDEIcDkS?=
 =?us-ascii?Q?d+tNA7mMKckvmo7Rxrmr94zn3/qWLqSruBoylx71yMITpdZifRvE56T1gicr?=
 =?us-ascii?Q?0jKGryNEG8Tt8UsDaf4aF9jXgYnO5VWQQO135zgvKXeTPVkgmoSx/2raBlbi?=
 =?us-ascii?Q?lqzTghl1Q33G5vBcsAownSLpe1pYVD3ZydNE15y27COTUdtED9dnCcfF3Cry?=
 =?us-ascii?Q?MYb0A4njiDGFZh46a8qhFAykOMwHtGb3HHU9XFJxWri+yOxzhmdum/Zwa7cV?=
 =?us-ascii?Q?NaL5vFVRoNRk7ymOFMGWn54RJS7wTPek9XLwRRdaoI9hym8xHSoyZ2+ySX/s?=
 =?us-ascii?Q?UIRXXhkdy7IYUAMJN4h4zOEFHofVTYKJd2KlWLhRo1wCaqb92FVhXgRCUypO?=
 =?us-ascii?Q?niB8N2mQisqtZ5NKas46CsB44sR6TjM6Mo8d2i20kp0aDtRyd6IRdQfE/6TQ?=
 =?us-ascii?Q?hDpH1bm3Emyy1Jsf+iLjhbXuueB9DlEdDq5uYJcH8k/o+X0XDLZHXrTtUtzt?=
 =?us-ascii?Q?RQPFlp+KFkK+NIKvKSMM9D7P3loheJ+gthpqou0m48u7n+nUAgJ+lQh4hp5C?=
 =?us-ascii?Q?xYStk4NFoUg7QNR9vVD97PhgYY7+1YstgglE7OFvGmcdTYI6kpub5v+ZU7SN?=
 =?us-ascii?Q?RwFOnOIJ6S14WYA39dhIHnoQXuwSquOIZYNUu7ejgoa/COjp4d8KcSuRp77k?=
 =?us-ascii?Q?IbxqXlXQZsX3n+yrA7eNlSC2YpQ6eeyqmY+XCBIu/vpGIxDgYDI5utNwaLpl?=
 =?us-ascii?Q?/N7r7dIP0pP3TJW2sJ10NKjByaewD9DwSMl0jW9/CyGJw8Xvr2vC5LwUOq0D?=
 =?us-ascii?Q?nEJTymFIxnsjrl8BNUBt6XMpsjceQcNCrqCgMOfVfg0KB4TTYf7bQfBOJkYW?=
 =?us-ascii?Q?qxUFuoBBgvE87xs6+nAg+bv4PZyMJ+8bsPvgb3EnUhJNgHORpwz/tlYaMjT3?=
 =?us-ascii?Q?geLkXMLvRgSEc7NbAMVwyoD1PT32Pq/Ywn3jA0dPnlzp4RQOOIJsUvzPsX4s?=
 =?us-ascii?Q?0McQExuW+6OPUhC/AY3NnqhisebAGwUV6ecDWsnm/71fG7FEMiENL+xeXEmp?=
 =?us-ascii?Q?ytckEeXip8F71tfXGRhOEmo1+hFJiAcyFHn9lF8OJRZ/6yBu+qxT5pQWp410?=
 =?us-ascii?Q?vpOJfr6i/vRTzzMp9PKST0z6NbXznKVx7NgvnQabfcK2NQw8s2Y2C57Uguxm?=
 =?us-ascii?Q?4xktP67KDhFbYq8WZFFj+TSegCba08levLeXoOAiepqTwIm6kvbRZ9mvu1MI?=
 =?us-ascii?Q?AK98YSQr1dKS1ApFdBxnchpp0gJ+yEuIkj26nIih0D4Du3tYgeerSc54JsYS?=
 =?us-ascii?Q?Qk5oT14sRYLk++Qn9gqc3adRxGcBk3DpmGc/0FIPsN8ASUdpEhcdcGwL9ONT?=
 =?us-ascii?Q?3VRt3FIHFqUpirN7c1dJ0J2nI+2k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gubltHupomvLCQc9jZ5v7iL2McudcAkTu07T7dx7MGNgOG72XJaAAK7zcDfI?=
 =?us-ascii?Q?+oQTQqztJtS5cdxZPQtoh2JJZ1ldrAH4vGJfZjtEkl4ZqN90/q1KWbgOPy57?=
 =?us-ascii?Q?4VYLUKP9w6bQajXatKXdCQ3Vg1jeKVP0YI7hwlrg60liBqoxc7st713huXM4?=
 =?us-ascii?Q?EsG+DEuvwfPW5L3tQW5TJpwTJkec8TpGWaoU84hLj3YY5V4c3fv5SxSskYjz?=
 =?us-ascii?Q?vKxhCytrVUPQAnnBA2Th750mMkp5MdCyVPCuRNCGrmTvXLNHDe1rzA1svwnB?=
 =?us-ascii?Q?/NR8ntjYZR2sgCWQMMMP27Ular1veYCobqIz9Mg8IN7PaeOMaZE9z6pCSYs0?=
 =?us-ascii?Q?m1wtxIpmI7HHGHG3CtO1rnFWGoWKGe1b3e17s8vZnFz5xj2DPIm3zHvyLGLw?=
 =?us-ascii?Q?r1GM+WG6lR8nGHjL7vYf86PPH9bsVHuGjkS3XxzUxn9/M2LS8GxR/76bPrEM?=
 =?us-ascii?Q?8TOkaCZTUJMP9f7AWNXUjhsN6tPT0UZErRvwIleQ2nBYX49htST3B7SnUvkN?=
 =?us-ascii?Q?8eN19Ni9Ak0qSst6aGWsHdtYITljFCGV0dgbNC6u/iaBjB72uYCpqikrwLQO?=
 =?us-ascii?Q?y0acBNcZew0TIRsry+jqR8g4K5B/BFXmITVMLdbdVRq4jnlo+wEZ7TkDsOHu?=
 =?us-ascii?Q?w4WN9dtUton3ITGeuOUVbmnMrEBQPz0rjlaXiKcSIp3DZY0Prk1tPy2/8OIL?=
 =?us-ascii?Q?9PRryysMnxGbvpt2USLf/S6cdsw5GLljuC7r1tE0NJHAlYJQfl+eyKb1EokK?=
 =?us-ascii?Q?EYU4DuyMKI/cta0fvQ4H8eEfiGaDKa+wW9Y7k7D7tW/FcL4cDsN76qiJ2BLQ?=
 =?us-ascii?Q?MZW0+8Iwf80k8VopaHhYFhmQtmbBMDDAK3B/UDIPFQvRQQk9Wca9ovVr8Iz4?=
 =?us-ascii?Q?I7EYFacMv0nX5Vq4UFE+8og9PiVa/iwoRgK/oNhEnqOQcacWJH1XVRFgxXS3?=
 =?us-ascii?Q?yviFJH1pZFaKyeVwVer6QXor6JMHx5VjRZrQoSly0eWb17QHLLmkUL07v9Df?=
 =?us-ascii?Q?CmOMG/0za+/N3m9izIbfiFx3PiKOGSTm3nrYkomo5AP7uQPh27+fzJzY9SoZ?=
 =?us-ascii?Q?unCzBuJwNummH31rZuSnW0ndvXY9M8iavuM3GaDUj/vwLZcly2iLxFP5Ezsu?=
 =?us-ascii?Q?LGcm+xrNHm3pLo+JM827igc+LubacItdjHEz776/iO71PJlYoL4ErYWsSp/G?=
 =?us-ascii?Q?XRcnFOFXoSsE7ju1bHE1CijHf2/EhJ2zJ6E4id1XRtGgKp/28aT7hum7BcDh?=
 =?us-ascii?Q?RlP/SaNTJXyPJlA6MMVe8CUDN7jbByR/8e3hwu70SJOJo8wHOpCEl7iwCP4R?=
 =?us-ascii?Q?ikusvd9kTsza0OkJ+QdrYjbOBupaciOExTa4/49P6lnGNEvRjREsZ2v8zxtN?=
 =?us-ascii?Q?AelqCPxMwRgBbJ1Wi25DJqcoyKRUpUoNXFaImbox5dT1ecds6sp89eSgYHx7?=
 =?us-ascii?Q?exsUEBH7rC/ruyNKI8NTor77jw2yOjLw0nfuledJQH0LvnC7227clNPIDNYH?=
 =?us-ascii?Q?T76lkNdnKrUw53mqVGUnE9WnznNBEPFqAtxdGY7eqmTEtGlHhbgv8czPPkUf?=
 =?us-ascii?Q?riF2Y215kE4bY/ZTPFg+Weooi7Nta16g4sRJvXnF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2fd7a23-eb07-4190-c2d0-08dcf9819cf8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 07:57:06.2352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzMD5tupll80yODrMMz9F4aSzBiIfc877Jv2qOSYatXFi/9sv80cnJoCAZmnJMVbrE53qdkqvrwDhcCTym0SFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_005710_199515_C376DEB3 
X-CRM114-Status: GOOD (  12.78  )
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

Add "ref" clock to enable reference clock. To avoid the DT
compatibility, i.MX95 REF clock might be optional. Replace the
devm_clk_bulk_get() by devm_clk_bulk_get_optional() to fetch
i.MX95 PCIe clocks in driver.

If use external clock, ref clock should point to external reference.

If use internal clock, CREF_EN in LAST_TO_REG controls reference output,
which implement in drivers/clk/imx/clk-imx95-blk-ctl.c.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 808d1f105417..73cb69ba8933 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -82,6 +82,7 @@ enum imx_pcie_variants {
 #define IMX_PCIE_FLAG_HAS_SERDES		BIT(6)
 #define IMX_PCIE_FLAG_SUPPORT_64BIT		BIT(7)
 #define IMX_PCIE_FLAG_CPU_ADDR_FIXUP		BIT(8)
+#define IMX_PCIE_FLAG_CLOCKS_OPTIONAL		BIT(9)
 
 #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
 
@@ -1330,7 +1331,12 @@ static int imx_pcie_probe(struct platform_device *pdev)
 		imx_pcie->clks[i].id = imx_pcie->drvdata->clk_names[i];
 
 	/* Fetch clocks */
-	ret = devm_clk_bulk_get(dev, imx_pcie->drvdata->clks_cnt, imx_pcie->clks);
+	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_CLOCKS_OPTIONAL))
+		ret = devm_clk_bulk_get_optional(dev, imx_pcie->drvdata->clks_cnt,
+						 imx_pcie->clks);
+	else
+		ret = devm_clk_bulk_get(dev, imx_pcie->drvdata->clks_cnt,
+					imx_pcie->clks);
 	if (ret)
 		return ret;
 
@@ -1480,6 +1486,8 @@ static const char * const imx8mm_clks[] = {"pcie_bus", "pcie", "pcie_aux"};
 static const char * const imx8mq_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_aux"};
 static const char * const imx6sx_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_inbound_axi"};
 static const char * const imx8q_clks[] = {"mstr", "slv", "dbi"};
+static const char * const imx95_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_aux", "ref"};
+static const char * const imx95_ext_osc_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_aux"};
 
 static const struct imx_pcie_drvdata drvdata[] = {
 	[IMX6Q] = {
@@ -1592,9 +1600,10 @@ static const struct imx_pcie_drvdata drvdata[] = {
 	},
 	[IMX95] = {
 		.variant = IMX95,
-		.flags = IMX_PCIE_FLAG_HAS_SERDES,
-		.clk_names = imx8mq_clks,
-		.clks_cnt = ARRAY_SIZE(imx8mq_clks),
+		.flags = IMX_PCIE_FLAG_HAS_SERDES |
+			 IMX_PCIE_FLAG_CLOCKS_OPTIONAL,
+		.clk_names = imx95_clks,
+		.clks_cnt = ARRAY_SIZE(imx95_clks),
 		.ltssm_off = IMX95_PE0_GEN_CTRL_3,
 		.ltssm_mask = IMX95_PCIE_LTSSM_EN,
 		.mode_off[0]  = IMX95_PE0_GEN_CTRL_1,
-- 
2.37.1



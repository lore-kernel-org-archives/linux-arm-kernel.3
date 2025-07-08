Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF4FC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 09:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+r/LTsQC5I7Hg9lxnfVVhgRrLArbTXs9Mwe+SPItiCE=; b=UcW6EoxMZhYJGEyBLIHiISs87D
	JFxOOq6mSgiWbCVvsMtfUfj+dHTzGUB0mSvfsCThkOuSkv8vwLlooczInJ+kf/6BfhqelRXiI7zm/
	h60Q/zIjOR1aids829h/dPK2WZu1l4BQ3L3rtffMz3XRi+UvcmMBPLo++XEG+I8sEm1xH1eIfYMex
	4uOMLYAjpgQ/ZEeZ3OF1JffQEM9rGCZkzwM3YAB/iz8Rubk2KvNoE9YYCJhgWfjpWcy38aSAtUStv
	OULuaaGhsGzKe+djNZ/hYS1iP4OoKldMDyjXkvqzJjs2kozB0Rqsm22HLfxh1VJOKJtopKQLyodvS
	2I0dGo2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ51u-00000004xyu-0agA;
	Tue, 08 Jul 2025 09:54:26 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4NW-00000004rgn-0yZG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 09:12:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/HT5bsblCHUScXIgHQuRNcYgoftkDyoir9iObhgvO30H0fXP+bHVt95Nk2Ad8RBMbE2rB3QHmn+wH7whSH6lQZ2uQDP5516E/Sapbp2oLB+nTBCYd4ftCyN3j97SEnpjBUZaZzlGPgYjL3se/f4gGuTvCK6WAj3IB/YEX3S26aq6/0DoyCmu/nzSi5pD9uuDgAl0EPIpby+dYzgItqyAzledv0JhaoiIvBtHN0y6eSXnFF96CDG/2HyLsPekH6lCcFxBDZaRvpBeymioJUO8/AxVlYBH7L2a6aLKr8hZ1d+0oyaP7Jck172q5hyLe+q25sl8ZW+PEXl6lJvrEKx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+r/LTsQC5I7Hg9lxnfVVhgRrLArbTXs9Mwe+SPItiCE=;
 b=YJnoCBvUqRT85ZDv5+BrR1bJP15DN7xXvMP+qCpEGr0vKvGiJNY4PhrXeqsZsIIxUDWH4Zli0MHYDq0Ase+eJ8gzZieSLbkn91L+k0izyXXr9CieolYBinOSmkvfDQ1wJMWA4rzpmNMe/A5FFukkcPj7HsM1MgMzcxhDmu+BCju0wUoeWmNNV9yYRTiLFAM/fZ9RXFylhIa94gNyRASdY0PKlNOl6Xm97fIKjz5hk1I2ArjfGwRbuRTG0m3cBc8vLAeF+gonAQGaxHAOHW7KTGhqeaYbAX0kyTFo1HHJIIrlSt8+NmTVLRjyhdqAFIKOzwW10/6LRpVXQbwHE5Shpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+r/LTsQC5I7Hg9lxnfVVhgRrLArbTXs9Mwe+SPItiCE=;
 b=kbUlbztaCTD0nW14k96PdUnlRL/rOeAvpwzC6zwsnVVm/nsKyddDximAYDE+/AE78QfhN71MK+dQahd887ZQTEIQevJXoG2T5P92vO2QWF4rfezgztSTMffjThp5CCkoapMJy+X2ynGFLrPk/sa6oH1zkGcSGfQ5Y87M+uVbef4TQ+7EPNpOiMr4LPCqO0LUj/bxlmlgP8zL3Y5/ogjzF8rsbNnigrWn/UXQD+ufc0cjWV26rFRBK5COjUJwXrlaaY/NYdFbKF5qwHPAqcH2v34R+cPkBOipjPdCkcOd/7IY0Lo05aDBZ6VfILkphkKynruyQIBXUyj85D3gT9syzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by DUZPR04MB9984.eurprd04.prod.outlook.com (2603:10a6:10:4dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Tue, 8 Jul
 2025 09:12:38 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%4]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 09:12:38 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
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
	stable@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 1/2] PCI: imx6: Correct the epc_features of IMX8MQ_EP
Date: Tue,  8 Jul 2025 17:10:02 +0800
Message-Id: <20250708091003.2582846-2-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250708091003.2582846-1-hongxing.zhu@nxp.com>
References: <20250708091003.2582846-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXP287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::16) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|DUZPR04MB9984:EE_
X-MS-Office365-Filtering-Correlation-Id: 374ad758-679a-48d5-a463-08ddbdff95ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|19092799006|1800799024|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yEQZNxrftcVvpubk9cpioXdecxIpyUKCmQviBd6/Zswq3Wq8UJWRL2SyAGLD?=
 =?us-ascii?Q?gBlmb0ABu00gTP4/1UOfeCx/uG4MJ7jZNnHWbzFdEgHTYpcWTk/gbjPj5ioJ?=
 =?us-ascii?Q?kdnijRW9RwkcCoT6ZSOC++F81ILxWojZkRqJDOkfaFSFoiznPNY4GhFnufQl?=
 =?us-ascii?Q?ijhB5VZ8zg/F7cHl1cJk5g5Ximt5Cdz72kWIZWNfOfNZRPLe6iV3BQNISrI5?=
 =?us-ascii?Q?OV1p9QYkKG2nRnPtYhyE2xkYHQVB5BiZZd5c3+6jKF8Yv9/7e3zzN813inbC?=
 =?us-ascii?Q?RpXpi6mPoCkSJNFT+shdOp0O2kl4lAGW3a7FMBqToAeGNvuzciiHTStTBUyJ?=
 =?us-ascii?Q?rX0IQbkK87GjbPoiqO2kshxRP9QxzEZv4DUsB7kNkVuqvSdN0WBAZVstEc21?=
 =?us-ascii?Q?sQBVErqwlgGtOwnjf6FJxyH38Pvz2W2gL8BFQIhIBITOknet3tCh7r1UnJ/F?=
 =?us-ascii?Q?zkdkT5RqifXwNpVUZmrPo1DCfCLisx/ckC044CzAN+bEb9dEpYNaQmYvSMb1?=
 =?us-ascii?Q?a4sMS3ribaNyBySOgxojfitiLo42yrQKXFQ1QQ1vRSWq6TdSeu6nq8Oxpiqs?=
 =?us-ascii?Q?NVINI5W1xdVFp2a6fEKQ/3QxPEFnBeKEroJkPFbvonV9iXoWtXfVstvLbB+F?=
 =?us-ascii?Q?zPsS5ae2rZrEeQRIU41izB/F0lanh3ku0ZxvvQpaLCiNk1dR6oqoJtxH5NX3?=
 =?us-ascii?Q?8e1Ingc22bLA1ezn77qRQ1M+T0LNlKyhI+U2XkSAyPYscknMm+hLfY6/9aZR?=
 =?us-ascii?Q?B91nh+7qplNjzvaGAT7JeS1Hy51ezGqU4LdiXXivqV5xD16KLUk+YFPCogqz?=
 =?us-ascii?Q?MLjb1Z/dQrcrTX/qAhWXPZhj0yaosjtzPPNjEddSOPZgIrdpQQXV08N1LWUn?=
 =?us-ascii?Q?3fHJZtiKAm6ilnXWsn3hdCqcjC50p9f+EXbdk5/L6LU2g6QGa4ZCOvCmx4Ex?=
 =?us-ascii?Q?+JZujeJ1d9CRH9qca5kG450Rh5c2hDp/EqeHHhsM4j7FQKbvRaSZcFsC7OwU?=
 =?us-ascii?Q?qfFq+h4Ab2+VSy30j/kcl3L89/+RUfCjmv8tipF+xcKkYbcOjGSZEdwbSsZC?=
 =?us-ascii?Q?THfO1jgY2zerOuxZSX4sepEn4rbWvrtrcKt3ZLFjReIUMarxGz0NroJA1THm?=
 =?us-ascii?Q?8XQbuJa2sNo/sr89iPCR975Lh99Uh76JLkBAUcjWjj0Y+Hdz8MC8/sjR7SxO?=
 =?us-ascii?Q?cvgf7WSrNeiNHikD5s1XI5fuhv6M5PDWhwopl27mmtd64xbl5FjXdHwb2JHJ?=
 =?us-ascii?Q?zq7ztivgeHw2ADh8iR2ny9xSYBnOSrW9i4W9hvHwB2wHcv5AgC61eIOt0a70?=
 =?us-ascii?Q?6PwaandJz0+GjIzWLk7Q974fNTt+h1SQE4NrIVEld9ja2kpSyBbB0X8JP4Xc?=
 =?us-ascii?Q?FH1PAWXRPzLSq6DWU2sTdJjvHa6K/E75RSaEmYLJWNvCbBxXPw/4C2ZklJJD?=
 =?us-ascii?Q?ciWRZzevnzKKdmncU+F92Kd4wTlOr1Rd7c0240USSEz3a5hff5uESGZDOuSu?=
 =?us-ascii?Q?DNtQJp4ZyAclqTk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(19092799006)(1800799024)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LeiRnejvXp8Hm4aX1Q8UK00Bf8Y4C4hgbBRJs2dFdzEZC00HrNYEEL69fC54?=
 =?us-ascii?Q?jk6lNi9AHo+h9iODc9lDQPjM1Z0ZTuEHTSdhtujY7c7+o4/hbxvga/DfK1ZL?=
 =?us-ascii?Q?vWKbDEaCZv6ow3LQjUfxLn6cXU65158Coj2k4OBGiHl4QNeNyB70NmAXyKrN?=
 =?us-ascii?Q?QGmGRTUGT4Twv2Rptznnes7YlcRqEIPTdFUYVM/GaRu45Q6XKMOpmwAhWd4A?=
 =?us-ascii?Q?Bn+4o48CH34+sQ5wsaG6HWxBOB7629XLU6JPzbraZFvvAw75Eo1r/U2ciJsG?=
 =?us-ascii?Q?oKeVdsmKDrcMMZLkYhLmYRRLivw/kxg2MI+Mv8mlGOztxH8GI+uxExv+XpyD?=
 =?us-ascii?Q?obcYoqElV0eKVjQGgB7kJHSkF20QGAay358n6HmcruNetFAYAvggTmhki/gL?=
 =?us-ascii?Q?BTICzbmPo9+S3iQSCW//pHa4MD25ERGjAVtWrUdxwSmvdLcsqfJd8zt9C2ks?=
 =?us-ascii?Q?rIgQW+yGr2h5zkCMyDVIp/iQoOqVzM2jCiUiW+eL1GsZTfF6zHbohBLWMeTU?=
 =?us-ascii?Q?t81g4f+J+Vro2ZkNEQxPpoojqcKl5IMLrqaXw+hrsSdMykmt0Q9nA40F8cMA?=
 =?us-ascii?Q?k6W9pFMNzLhxeyLZfIgkhB6CqgfhsEU03PMk5HEVo3SxlGsSW1dSfkmw7CLT?=
 =?us-ascii?Q?awtM8YlL2/Ptrhmc04KdqnNb4Mhm9H17DgkYjy1/f3tOm8CDODwmwWsRNFLm?=
 =?us-ascii?Q?TqXdUAEUDjIx2ZzWyz4LkGn7NwHYsuZYZ7JylUE6eShO4pVqC/lkvWMVOocI?=
 =?us-ascii?Q?X9ZQoaRgP+gri0eWv9Vs2EqSyuTPBJoLvjr2MFXKUOTsya4M4+/MvxXQOs9e?=
 =?us-ascii?Q?3b5Lu6uHNcn9IQ2RZRRdNnukFkAsl2pIzR0KO0+j7JqF7BBiD5rmOEUZeIWt?=
 =?us-ascii?Q?6WQB9BhWwSivDas0C0lUGzYS7pwK91FMP1LkGZadpWxZqQEyU6Ku/lDVy03F?=
 =?us-ascii?Q?otVg4i1MCIyl3Tgh57WzB47ZDIfZBdCpbve9ftHRstdeqle+uMohATfQm5Aw?=
 =?us-ascii?Q?XPnbn6nvNtV1ck5IT/PuxbzpIOOIP2QxO5YGpRp2qVnq1LNaGVy+cROPqnFG?=
 =?us-ascii?Q?sWCjg3pKjgnxHdEcM4EP2rt4B6MdxfP0NyJQMsxNFIlY7r0p2mJ9IrtkTCwe?=
 =?us-ascii?Q?MbQhPR+3DGcbesgHbXoxd7Rjs7rMUtXcOr/AkFKIUuUCCG8jp6hKfP2Mwl73?=
 =?us-ascii?Q?ROuXUVID0GG5sk1/T7lhTI7yx8d0OQ5Rw4MmZdRnMxGhocPaOrCxnHSEZIfy?=
 =?us-ascii?Q?VLFYxU1GpZNdsMXXBEtFQSxMyQn19y7VthvW7tRmhCVoj+ZzZzyNrEVr0Edh?=
 =?us-ascii?Q?x2FtingDjGLI3cl6dhPbyOnK7xGh7hcDhpKRueZPM0cXc1WAVrBPqSYOb+5k?=
 =?us-ascii?Q?ZBdXMj9gwiYY9k1H20KQTBgvqL/znIAi77jBfSsTayvK4XubuiFoFYPB2A/A?=
 =?us-ascii?Q?07fJR9Ge+kaD1pjjzAnY8gnp8M8+XFzIDg42IjKRwiYajpLFqZ77Fat0zVyA?=
 =?us-ascii?Q?MPFCFxe/cCjaVfMxxg7wJL/3GaHfKj/BTu0LiYCCpbr4CHboPp6/9bPlgbZH?=
 =?us-ascii?Q?M6uqtgD9ReqzvleASdiO+AahCKj1efCveXZLuQ3e?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 374ad758-679a-48d5-a463-08ddbdff95ca
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 09:12:38.7079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLF2eCnT/FKhj7Ape2qTVu4eq45N92wag5fAb4D1ocDSv+DRSwFFP/21potj9E8cWv+Y8Pvm458DB2F/xFWZ1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_021242_272521_CA0E0608 
X-CRM114-Status: GOOD (  11.62  )
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

IMX8MQ_EP has three 64-bit BAR0/2/4 capable and programmable BARs. For
IMX8MQ_EP, use imx8q_pcie_epc_features (64-bit BARs 0, 2, 4) instead
of imx8m_pcie_epc_features (64-bit BARs 0, 2).

Fixes: 75c2f26da03f ("PCI: imx6: Add i.MX PCIe EP mode support")
Cc: stable@vger.kernel.org
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 5a38cfaf989b..7d15bcb7c107 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1912,7 +1912,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
 		.mode_off[1] = IOMUXC_GPR12,
 		.mode_mask[1] = IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE,
-		.epc_features = &imx8m_pcie_epc_features,
+		.epc_features = &imx8q_pcie_epc_features,
 		.init_phy = imx8mq_pcie_init_phy,
 		.enable_ref_clk = imx8mm_pcie_enable_ref_clk,
 	},
-- 
2.37.1



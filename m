Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDE3C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 06:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7B/lfEN7rPO1S+G39kNESf1k2qmqyvyn4LZaV7YqVBI=; b=bFdnQLtFrLjWQOAjpo5SU9WAVt
	+f158xOqYaj9Zi0jRzUX92ATD+xSOtd4dBmeP6CsWlqvmvlJFlsyn9p6OAhVImLHN+fxvYnKe6YWu
	WtK9Nl8DNcxZwLGzV4xKCbzqWghmQoi73vmtFQGHBQeXzeapDkIs0NyJ+3JbRjVNl7smimL4x0p2g
	4oxqUbDISEXw91OTYA9vRbXsE4RzH/8d1iMT1/Y9Wwgy/+kG4q04BeYCJegi320X4gQ3QMpB+tt9u
	oVrtHPz1HpeEY4RT9noZIVSdOWBNK95cgblTnIuFZ1SRASkyZrrS766NnUKFq9zFyXCOlMo5I2BlM
	hTDeAa9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4wAn-00000008Odg-20HZ;
	Wed, 16 Apr 2025 06:23:01 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4vxt-00000008Mpf-4BmX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 06:09:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITlIAqkT31jTp2xSHPtYzI7tHe7aXirDE7cWx4hR5OPdNs+P7TJMu82tuuWckuUWmzh+Mp8cPLWE7g3hqEW335Ix2r2JClPeDO46fbPMWbzoCGS5+MMT7cp3AN7/VPsSw2v4Z7E00qzm+OPRczpQLEabuoqaYqvm3PEToFwhRzJ3N10P5guxr1jHuPmQqvJ8ieu/0qrdsFSmVOiZHqsvYFtW9+5u1dD3jr1jwqTVZ14fQLYodnq4EyvHMrZq1Nns77b71FwrmpMw4ornZnMm4BikTwPCa0NylLiqU8Qr1/nMORveqaWphrtNqOmjGNRpxQAl/JeEOHepnOBMVk0Lnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7B/lfEN7rPO1S+G39kNESf1k2qmqyvyn4LZaV7YqVBI=;
 b=mkxnnMEfeit3q7ZZIknfmgnO23BaMTTN63xjpmaBplVJtlwx1hBfcZip0DxOVp+a1+Ecy9OCr1JyJ/fGdNaE4uBoHb4AZY5/3BSJnqbdXeIM5iIIrBM0ayixyA3n7709e6462beqq/RDrgvwzKK2No2jDxvsbOCoUk1nO349pbwKprsxV/WRe0a1YE/cSdmm4n7ovSQv9zvb+po8RtRAs/vWYs/h7SFKeMvv7Xm59dNTxpy5kVXDYCNSqcMiD1BAw27D6hWTLY4mI2jsH/mfQNN2DtR7+KirlxBHDoxXIvE81M+x23pfdTNM2ZwDSKEM7JRVCzyHR4Oyj+1HuYF0QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7B/lfEN7rPO1S+G39kNESf1k2qmqyvyn4LZaV7YqVBI=;
 b=bVutPT6kYtDTmiUi9VzO5ukOUsjQAIAVbz+9MPkDkBrhvgN7bOAWLL7ahVTiT4jnTvfpTG+WORH4mS0/wtwNrUq/519xCO6seTVVCq4FlahuQktL+sR2yWM6tugY+CHkACxTuSd/9RcVD94yuPHlP0HoAY+WWC/tdCdEdsn7IWxJK4CX3rgii6NLqYrVSevwH/R1qwI/SuU2sppVH2nuBG7lt2GmXzD1AHDzHdEWNceKDoWRQDvCfkdUoAxeuoXzBd6dz7Lq45LCYiObkWbNs/V18Z3ZdF2WFO80A/RvSTWYQu67AXQqfPaWO8cQa8wrt7yx+BOBWOIZeYRxkl7N9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by VI1PR04MB6992.eurprd04.prod.outlook.com (2603:10a6:803:139::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 16 Apr
 2025 06:09:40 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%4]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 06:09:40 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
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
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v6 6/7] PCI: imx6: Add PLL clock lock check for i.MX95 PCIe
Date: Wed, 16 Apr 2025 14:06:47 +0800
Message-Id: <20250416060648.3628972-7-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250416060648.3628972-1-hongxing.zhu@nxp.com>
References: <20250416060648.3628972-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|VI1PR04MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a88959-9f86-4436-291f-08dd7cad45cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?En0ShXMS4ZswMFDczj7swvjx5JMPgqXD0bBRQ+LE0FEXC8CmPoZo1ZXNZYJg?=
 =?us-ascii?Q?qkgsYzkx0O+b2j1eCfvNLupMqn3yiX96YKIhfZduxEnzsnlUi2DYjgWWP7Fk?=
 =?us-ascii?Q?ZGKOix61iGrOuIi0N0GN0DmhuppKDcgjKY2ID6BSJXKHSkEC1G3kSNFWC4rA?=
 =?us-ascii?Q?ZqrvS+ZaQRZWnx950P3AET5eT+ZDoKk6VCIEbbJWq/1lVuOMJ0Z6Ohr2gTG7?=
 =?us-ascii?Q?X2qgnmQDL6cVQVtWDACq3eJVtOAqTNVX+335vMipi4Iroh9hXTWAJ2DHd7Rm?=
 =?us-ascii?Q?cC2WDH5c0FKroHiajOUaXLw6lRSjYF6528qCxVSNOkef7ukQCyFBrDXPSHmw?=
 =?us-ascii?Q?WrhAhU472khtGEEQ5sFsBja4p8LMy9p2amPve6Nf0OwJbxFBEn5mrLof07WL?=
 =?us-ascii?Q?fFMcYxqwn3ZFDOqfcHkEPRE2ghDjt0XrEpTTZy8chVbc59p7xJBp9tqNeroj?=
 =?us-ascii?Q?RzOc1aMhY/oOBHMPKRqxb9SYY1pS0selylRd/2ghmVs0SkBh/WMxMrayTMiV?=
 =?us-ascii?Q?tqkGoI2dVMbbJ+rcB5gWMjJO9DC9gWZm4p70KWlgB28HatMj6Yfc73mdVkvo?=
 =?us-ascii?Q?ttLTroOKtXxCHUHAXYogB6tyhwItgUVcLlM8weZJDW4O2k3AXv0dQeVf/+uq?=
 =?us-ascii?Q?nIrFS3BnPSv6IROoLw7ZbQV/Q/FWBDFCE4AQBq/4zYLfKBGLeYOCF3c8GDZG?=
 =?us-ascii?Q?6CFWneWaaiObXzMIPLvMPIVCrRxBaxnVidrN7IgmGmQ5NR8I3FsRmx1O75X8?=
 =?us-ascii?Q?RLNL2GDMBx4EpAYRCQ0UySZ/H4fyGBjtZWZlBrmyLDhcDslcGiPlu0eJzmPJ?=
 =?us-ascii?Q?+JtkuQz1rGBON9KcBFvG3Ybu24KAMvjpe0a5MPb2k2OzOXQHW/vSjyJ7/xcD?=
 =?us-ascii?Q?i0Yxsq2q7gHyexAxgcYx0pgPxdQqZkLMXUqZDqQMWu+fiDQAXaFvIyDRLtPN?=
 =?us-ascii?Q?6NMCoHZOMoREiv8rX8+3kG3bbUEztrwBCBBfYlCWIHEUavradUVSz9SjK32D?=
 =?us-ascii?Q?pfVBJnqElnSet0pBnAk4U1P8U+OVcOX3dZnIKYlP1dSRB6APc4Z/2JZZGsLJ?=
 =?us-ascii?Q?joT9sO8/U72NmjhgzUO1oHw51emBsRPvZBE3vf5XwDEqLTe4iXxi5rKGDG5T?=
 =?us-ascii?Q?OxBcbtoQN79JmdQ46ND5sHF3XZoWpuDlMU2mTLZlygZvlsqpFCgyGoXGDsVQ?=
 =?us-ascii?Q?wGj8mzrq0bv3gKnebI7Mz7CvSvCAMO7Em9xMqAMrGDTPQ8Z9obsoFL176pgy?=
 =?us-ascii?Q?YKQk60/5OSmqKr/7XHk8MUBlSZQkIradxblQdRVmhWUYTNtgIsZUSv3Ktw92?=
 =?us-ascii?Q?+3yG0cn/NwNa9ZQbteU5jDV7gnkUZhjQaa1+asWnVxivxP1QwI+PInzsekMT?=
 =?us-ascii?Q?UVF89AaSkOz2TFdX73mR7hs2u4baaqxeVUTNuq0DryIWWbPhX2c4PjqaXluM?=
 =?us-ascii?Q?Xew82D4hvqiYCGeYJbAiuXQbHTkPKtCK8YShj0oW3gJkGr4p8DVwlk/OU+Vu?=
 =?us-ascii?Q?9wmKAO8zzJf7Td0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zbz00ICCQCg2AinBPq60k8nR43VhIzkkWjsFqnMIAxcLLkITxIMX5DUYO5rn?=
 =?us-ascii?Q?sgc9kfuMcA+pogIxmrmjzJqUuGSmPqYvQOFUfFhutN0NAOgiCEXV1KiZ/xbN?=
 =?us-ascii?Q?d0bzWNQ5Gfzpd8Co1lbKV10ymSUsHxj7Ht4muh6hsEmTlfGDyT7rSd9QhXWm?=
 =?us-ascii?Q?EAlxXWfjsNcg4+f2lsjd1Kg85PY8htdS9A87RwXgdMi6DcYnnEsZLFV7spr4?=
 =?us-ascii?Q?KTEL+L6rzTTb7NAM70w8cxa7xyTwQ8SZYonMAOPuHGCYj9QPoZAtdKibXphl?=
 =?us-ascii?Q?aaRLu1YOZwHcrI12Haw8wFcRtzZgsQD4viVV4EW4PXudSFuGhkpDJdtOeu7A?=
 =?us-ascii?Q?dKXWRCBulRtfpL5exobJ/+axdfWMZf0oOl4i+Cp6RJrGGCGPsOWLqwROf/GQ?=
 =?us-ascii?Q?WZWIbZKgBFRYplQPpDf3e87Jwgad9O92q2ph3euIYN97wClYPeHkVX/7gL/D?=
 =?us-ascii?Q?ei5H5n8DwbQt/uwZIWclQlQma8686timzTE3rX8kpWEikVL16l7zmYDkHTJi?=
 =?us-ascii?Q?2E6mtbTeZIdoQLF6qLTPprRwU3ZaU58SdWV7I+atdeVktfu+PSRl80/MQ/uJ?=
 =?us-ascii?Q?KV3XyC8yOBqSyzdEYNRDvLLyj/bhJ6YUspRMEiOQHjGbR4CYRY7HeVbSsvDM?=
 =?us-ascii?Q?S9h4vfTH/H9qWXE9O0eBjjolphRLDrY/Tb/ZOu2MFDZXrCKXHnZ6VbjdgFkS?=
 =?us-ascii?Q?JGwN36JNxODxI7ibmmxsr2y/6Q/9G9N7FA5phS7OOROV2/NPf/oFjsdYmWMd?=
 =?us-ascii?Q?9lBqF3lxw5VpUZUzhbb/3d8mbBESb3oBgoXVg1PpNx6APr5URokbpLGjyzGl?=
 =?us-ascii?Q?1jWxIH8tbZH2uC0f6MGCgN6TKxRgZilWl0PjXLhrjQHjGnsw3yj/P5gP67Ck?=
 =?us-ascii?Q?RqjMECngVBaPXvLQj/M3S0vCo3ay+7veEaSik1yblfSt44QerNv0X0ibCon5?=
 =?us-ascii?Q?BsXpRzlo9sZAh5C58v+xRly18QwbffY8o2jgR2hy1edIdFoJHHFEDTg9rPfv?=
 =?us-ascii?Q?6wHvwOGYtGIWBloilyeaNJnZjI9JfpWiRnfGbN1fveRrdgckJNTloHJfpTfm?=
 =?us-ascii?Q?2xbmyq+TkR1wOTZu5GlJ8iehlSLaW2BoPSD6ga5dHM5i3wcpwcF3x5QTdtzh?=
 =?us-ascii?Q?JTEf8j/ygw6GgAMGSvEYzqERGf9JQs/r0dujo4KVKkuQPuziRM1dy1f0d+B6?=
 =?us-ascii?Q?L2lku28Zz0QE/5nI3Eg3zaJoaYG92wQRD6sAmuuDES+zT0PZDgU5Y5mwb6Ir?=
 =?us-ascii?Q?jnBVdGXPd8JAmluLmLgx8i3fIQcJ3C1x1A8I0XnMRHIfWSYBP0SiUkmdTTuA?=
 =?us-ascii?Q?R4dUgrPpDslbEem6wUppxjU3290ZyRITL9kPADdRUbnPPB1HwkOjV5cFDh8U?=
 =?us-ascii?Q?ULOhFABd56cDlE7IAteh2g6xhPLLkI5wVx0aqkUb51ffFsHw0hsnTCpLC7lx?=
 =?us-ascii?Q?kV1ggbYs7il4JFbOMlLyrkAKgf/dmAgDwGwB93CVhA7MWi1f/Cw8zzbqJ5WJ?=
 =?us-ascii?Q?KasDTiPftzh6/8i9PLhCiXmF9p2li607hH6h1RTm4GaEOaXLTw5CGm8Wf38c?=
 =?us-ascii?Q?hpYHQjlc1MfOUEMbiia3wWbwQCxDPRwCqH5jN6Ae?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a88959-9f86-4436-291f-08dd7cad45cf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 06:09:40.0706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9g28FaRr0Hhj/ScSrMU7at3+1pgBddg/H2XniCPaK0+ru1Zy260WZWJftcKxyorBz9peTeGYiWqJVj/Px+Fe7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6992
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_230942_036723_74385386 
X-CRM114-Status: GOOD (  14.16  )
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

Add PLL clock lock check for i.MX95 PCIe.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 7dcc9d88740d..4cff66794990 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -45,6 +45,9 @@
 #define IMX95_PCIE_PHY_GEN_CTRL			0x0
 #define IMX95_PCIE_REF_USE_PAD			BIT(17)
 
+#define IMX95_PCIE_PHY_MPLLA_CTRL		0x10
+#define IMX95_PCIE_PHY_MPLL_STATE		BIT(30)
+
 #define IMX95_PCIE_SS_RW_REG_0			0xf0
 #define IMX95_PCIE_REF_CLKEN			BIT(23)
 #define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
@@ -132,6 +135,7 @@ struct imx_pcie_drvdata {
 	int (*init_phy)(struct imx_pcie *pcie);
 	int (*enable_ref_clk)(struct imx_pcie *pcie, bool enable);
 	int (*core_reset)(struct imx_pcie *pcie, bool assert);
+	int (*wait_pll_lock)(struct imx_pcie *pcie);
 	const struct dw_pcie_host_ops *ops;
 };
 
@@ -479,6 +483,23 @@ static void imx7d_pcie_wait_for_phy_pll_lock(struct imx_pcie *imx_pcie)
 		dev_err(dev, "PCIe PLL lock timeout\n");
 }
 
+static int imx95_pcie_wait_for_phy_pll_lock(struct imx_pcie *imx_pcie)
+{
+	u32 val;
+	struct device *dev = imx_pcie->pci->dev;
+
+	if (regmap_read_poll_timeout(imx_pcie->iomuxc_gpr,
+				     IMX95_PCIE_PHY_MPLLA_CTRL, val,
+				     val & IMX95_PCIE_PHY_MPLL_STATE,
+				     PHY_PLL_LOCK_WAIT_USLEEP_MAX,
+				     PHY_PLL_LOCK_WAIT_TIMEOUT)) {
+		dev_err(dev, "PCIe PLL lock timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 static int imx_setup_phy_mpll(struct imx_pcie *imx_pcie)
 {
 	unsigned long phy_rate = 0;
@@ -1225,6 +1246,12 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 		goto err_phy_off;
 	}
 
+	if (imx_pcie->drvdata->wait_pll_lock) {
+		ret = imx_pcie->drvdata->wait_pll_lock(imx_pcie);
+		if (ret < 0)
+			goto err_phy_off;
+	}
+
 	imx_setup_phy_mpll(imx_pcie);
 
 	return 0;
@@ -1826,6 +1853,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 		.mode_mask[0] = IMX95_PCIE_DEVICE_TYPE,
 		.core_reset = imx95_pcie_core_reset,
 		.init_phy = imx95_pcie_init_phy,
+		.wait_pll_lock = imx95_pcie_wait_for_phy_pll_lock,
 	},
 	[IMX8MQ_EP] = {
 		.variant = IMX8MQ_EP,
@@ -1880,6 +1908,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 		.mode_mask[0] = IMX95_PCIE_DEVICE_TYPE,
 		.init_phy = imx95_pcie_init_phy,
 		.core_reset = imx95_pcie_core_reset,
+		.wait_pll_lock = imx95_pcie_wait_for_phy_pll_lock,
 		.epc_features = &imx95_pcie_epc_features,
 		.mode = DW_PCIE_EP_TYPE,
 	},
-- 
2.37.1



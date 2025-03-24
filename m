Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28855C36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 06:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7u/8aeTnOHrKyPorXG6aIfsLmL3nz+vi3LNguUR7wtM=; b=atfUUDCMuROLiQrzsx81Gvxkaz
	j4xshQ+HU3PuwibF8UBVzE8y57piBV8+JT5RW4PkD/yd5Z1e0Pw6oHf8a0foGW4QsKTE1iR5ADIku
	NPQHX8Unsa1JPY9zhtJDPYc/OWiDavJSYCd3aoJgzjM2ag7CKPS7n9aMdqTDTmHRwNndOtbsylHba
	w5zHIbRa1RSbqHE9aq0neSH1uiMdN+UPhAevyQHludp/p4qE3RCvJbNTsYOZ++PRbap0AAcWYpZ6E
	MD2lYlt+GZdAbqML5iLg5qam8JxgQmE/QXZ2nh/WGbKVNqVrOUJUAxYKDZ/PVseZNZEw0T88nojU4
	IRZx9tcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbWG-00000002M8U-0DWt;
	Mon, 24 Mar 2025 06:42:44 +0000
Received: from mail-vi1eur05on20628.outbound.protection.outlook.com ([2a01:111:f403:2613::628] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbLe-00000002KTh-1gLL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 06:31:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXyBTvY/l+XwNn/DqQliBsV1TyTCSh8I/L56gB4ZV3dDjBlGwdkitc+uSaQyVPWjSiKCYKWmKFkmCFI8ND6OtTXCiQW1knawr295HlodCS+aHftRe9DDiiDaccCkWdE/ucXvewBppdNvUBCQDctYvxn6bzVFvlQngskSZpZOwVyVW8A7HZ0Ec90frCwdM/38fy+j0SKMljI2gtqffiWs5TLAT9ZLRjuK9neh+90ic88OXrJR9d9SOGjPn0k9RIgEgfvcMh4nn/37NGwswzuWgtEzkWDjgRbap4CtqLXUBG36G9GpiY+U6JTO8WCFf6wewcEuZE1XjW2Xb9HDWbwzZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7u/8aeTnOHrKyPorXG6aIfsLmL3nz+vi3LNguUR7wtM=;
 b=reJrs41DKaLdkzeCTLXudwAiMcR3gaWiGVPktaZo4D6+PM1vjZfijMi7GGd0gqPUhi5+W6eDrAmB8w297/0caR3zcGnzvVdoIInN7prUQqabRuOfvrLBdW1EUe67MWaV7ZarZlmeRBfJP2DLuvm5oPEowOtZ5x21bDA55PVHvWJWFbLsdVdKbO7mAufj9BHFggTnoUif+xZoSMo0gLZWtv2pYIxtRuBeai6CC+6L2DUYPvbjNB1ANdhFBoWhBsf/HW7StCUErWXuOS+Ce6YaAbC2w/u4UaQbe4r4Vr7gFckuSKzqlDlovAawUMz4KA4LGMKGWTy0YOp1zb+N41KSHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7u/8aeTnOHrKyPorXG6aIfsLmL3nz+vi3LNguUR7wtM=;
 b=a3CiFbmtjivZOeT5zXNdMxP94LcsEpEuz6pcnQ734TCgPTdUqg8cWMCWWe+SbviCfdqYu/vyJAhEKP52T1YmSR1GUoUfpKLlMvpiDESD5tX21XYxiiUE8eEXAPgrJNwKUI2p9KP/jMiuN4YWZRtCpk/gDUI3CLxTss/4FusQDyXK2QjLuqV9s46ptQZFQ3FOLeRiyS5zwWjehypP2uX1Qv46Mjo3zdage2abn950x6ngNdpnCVH5k1YiBhOaeikucGu54q8vxBrW8CXte5jL458Feq9dwKf21QATs6zAQ21ywCZ224a82ZD/VOfRQnEjqyCGKIRbuF0oe2w2vmXtmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by DBAPR04MB7366.eurprd04.prod.outlook.com (2603:10a6:10:1a0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 06:31:40 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 06:31:40 +0000
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
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1 1/5] PCI: imx6: Start link directly when workaround is not required
Date: Mon, 24 Mar 2025 14:26:43 +0800
Message-Id: <20250324062647.1891896-2-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250324062647.1891896-1-hongxing.zhu@nxp.com>
References: <20250324062647.1891896-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::7) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|DBAPR04MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: eb8dccc4-fc1e-4761-1c81-08dd6a9d8917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|366016|1800799024|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C1E6jQ2OPKrgWx4Uu/8Jg2j2auOOolasLOs5rFDLjI381oCuLZcENycLGt4P?=
 =?us-ascii?Q?Z6In4G9mbM85j95SRJvrvpB9xrXuwpADrJAnsvpDgHHu8mpfbz+bSzp2pBju?=
 =?us-ascii?Q?LmKx+7vGDm07wBHAJhSqSxYxo5PF4ZJqBJfyQqQSe4BAWk1yxiNTT5hP3ym+?=
 =?us-ascii?Q?6ZAJG6evSJef19zPdeuPEsuFTFxCki839/ynxu6KCjxLjLFu715GAKVAbDhH?=
 =?us-ascii?Q?UiJ43rxy2liuuDDhfhDZJraR5K4+KWJ9kt2zp0/R7R6+DK/zLbjBBFvN/iLx?=
 =?us-ascii?Q?RruwRaPYn0euPGKL3vTTsgx1zfJ5M4MCyp8ME8SW+HyQJ9+MkdOMMD2mx92C?=
 =?us-ascii?Q?XCSPHJm/rj4+n2t/vWFAS5aGdJLfA4dAQCjipe0Qvp84UPOw0FzHhF3dEA23?=
 =?us-ascii?Q?TA8s11aAZ3M7tDArKLslHoyVPIBzeMWdg9jUThMQgcoLKatLPot1OvS2eoFy?=
 =?us-ascii?Q?c7e4AivTi6g1Rpp/go6j60CiBRuvHBVr75UN6SebPyzp56rAEFBk9p0Ifrkz?=
 =?us-ascii?Q?+EDRQ+9FjeDqdkstdgom5ORQ5LDWl2fJ4jAHvEnbnj073VeVzM5s/uCO8jpI?=
 =?us-ascii?Q?UAh/+UCreswJnYzpgsI77tId96CTpbaMJpNDkmTBBnwSe2yCnIbgJLnr/a8x?=
 =?us-ascii?Q?0CF+xF+g2Sgz5m2HPAyP2jJzJywlt89MlxI69qu7SVq+15BBy7CeVqiXX4je?=
 =?us-ascii?Q?bdENdqHJBhyWIeX1KXSuT28309xvd6UbHzEMlGw7pNulcRvnw65eOHatgmzN?=
 =?us-ascii?Q?f8NTN4jRUG/DaIqvv/UDXY0ahANee6Shed9Y19PdJMF2CVox4xk4NSLKtaDu?=
 =?us-ascii?Q?O5DdO3f1xAjbHqUNSdp0ISBQ25N1ktRWSmV1fzctOzM5CrUd2fu8bMFsTm4A?=
 =?us-ascii?Q?mUd8fVaDhqGBGDPS+IAKcP8SwYwYTePGyDr4+bqybsNzpi5bywPSpgKPZ8uj?=
 =?us-ascii?Q?JBW23in2pbAX7j6s6biD8aD71Tx342cKMerXxNPiyh6/jArDx5ShkBYZllRl?=
 =?us-ascii?Q?4BhL3afns1/zgYUtVO7h9qhj9zE17BZt8HhkBQ27dvz0qYJ1UO6KFvZAC3ap?=
 =?us-ascii?Q?xOimS0mmqYFKJwDjm8sVp/dyTQpAvejRM7rmsBZr/bAf87RXH42t84X0UXnb?=
 =?us-ascii?Q?OVWrrtKcCnHLXq1Bg8QV8fhxrohpXhyfgREGihWt5lKCoFdQTJxzW8SJZLSU?=
 =?us-ascii?Q?KwmHeO9KU7GsDPt4YPzByJeA+wQRU/w2cDgXEsllz2K1izI0GR4T7+766rN+?=
 =?us-ascii?Q?kgtCkr9jJri4XKwQQK9W0IUwHbVvSoKNA0Bn7QQnyOhoMh3xMRRvgbi0Hi8K?=
 =?us-ascii?Q?BAMn6k/djH0FXQWSkEBXkIKBbU9Uc8XTRA1flkR8BVMSmszNDembalM3Zal6?=
 =?us-ascii?Q?pNykY5f5WFrwvjsANEPt4an/17/Yr06Dp2C4DhZrrZ2MdxvxPud7ltPN0YAr?=
 =?us-ascii?Q?Fcdjc28I7rz5S08RB2r9rA2yit67WPQ5gxGrhSizinNwJYzGIqftHg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(1800799024)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B0cAzdMV2QQPn6zgzqiRQFYnXClWObnO7EUeUeyUqeizn12PFEpjilkxUFIa?=
 =?us-ascii?Q?OrXeszgTPDMO4nZrbjT62uzCORWQgNTE0RmRhXmNY2JfFtYpiuZxfMQyZyDh?=
 =?us-ascii?Q?aP6pI65kr/4+41V0E6YP4VDQsnNm/0t6ewYpGYcLSizg7ysT0rST0cfJxZCg?=
 =?us-ascii?Q?o5Szin4YpZFtwWV8ZZLxbxBzjEa1eJjLTYwlvvvTj1JCIgph9CsefK/wkqkU?=
 =?us-ascii?Q?ayk4QSxj7oJhpD5mmNgYg/EeQgyfBhsL/kcymdNfxe/+iPVaxGxAM+oz4kuq?=
 =?us-ascii?Q?5mnzfcDjzpBb6d1loMwmdfQUEiSnz/OVzClf1yS3diKZfzh2aZDRuOpkR63Q?=
 =?us-ascii?Q?vuIgEQmEqoXK/D6gDKcW7xVvhyt8zc6vRSWM7+nxGbnrbDhYHBTfofFW/hRf?=
 =?us-ascii?Q?e60/l8gg4RIGrNQdCRLV+pSJ8+Jvr6lKaRuJrUwzXC9F9I0tuTx3z82FOV99?=
 =?us-ascii?Q?OSk24JP/lQ4OJsKprYCs8Ic3bPFGl7uMhzt9Bj94UcQYJ7pH3Ke/bPxezHOR?=
 =?us-ascii?Q?YeE9GjRxQBtvK5KYvy8mCG6ZO7tNkHgz9zm51K8NiCzvEtO6fcqmmwTplsMe?=
 =?us-ascii?Q?hXluMFKS2YfmTi8o4Otfodc+FK1zSonhQTQWn2SUP5uUNLFW7n/Wo2INlw8k?=
 =?us-ascii?Q?VpP3T8wCOF6sm28iFK9t/1MuVCtIlO4RQPERvumuoX4NiyILvtTdlCc8nTiJ?=
 =?us-ascii?Q?ZoBd3423fdsw6N7sYxkLQvAk/2ou/NEyL2rN6CtYs5S3FkOgiA9ldfy0B5tl?=
 =?us-ascii?Q?5jsWtMF1UPo14gCLNevk/lMNFlITtt3G1/xYjHCE6EL58E7Cz5vhzGhTnAsd?=
 =?us-ascii?Q?cT67rAL4DpzU6MXP4bltzELeUKvfjrz6D61yT+UFMsohMBqXhUU41QHKNlli?=
 =?us-ascii?Q?ie1DepclzJMHuC8lPX9hV5aluQQVt+SKjpvhe94wmTWR3r22nPeiIioNybhL?=
 =?us-ascii?Q?ydNHcrp5nc1ss8X3CARrEupVhPRxWfy4CQKk0qsQ2D0+Ldiib9GbH28N8bDV?=
 =?us-ascii?Q?x6knTUpjk2DMPywXpVzAiXzwRhIyRBFKU4OWOwFVp+Dfv920JDW7vcxAczPA?=
 =?us-ascii?Q?cBEg16Bnl9weAXCuC29GZ+dRcSIj5ihhDfw3w+BaRDKPUF7GMUJkusM3jALA?=
 =?us-ascii?Q?Oh6DqdHIK4aQq09ZyITtdxX2o2QSTyVtz6qJ3Np0piRHnpsvJGVSRSLkbykQ?=
 =?us-ascii?Q?kubqeRpiuRKBxoETxnDpJ2ZTFSMYukOc1pUaOJXNq+vEztwLiFOAsxVVutNW?=
 =?us-ascii?Q?wdUt52bIiojYNFD/h+GJBwMCGs/3DDauTyDzdkYr82+0HEfcIbhKWeSTLId4?=
 =?us-ascii?Q?gk3+e8rkhoqXng2sUqapC6wAEFHiQyxDPxzPUhmGnubWfsGISXHUfC8KmZb+?=
 =?us-ascii?Q?5kkMsbb88wDRO48/onQqxuiKvmeUWdZmiaWjRxjKk7Vx+NuK5xuilrdboWiN?=
 =?us-ascii?Q?rk3f8gHtBXZ8fPBJ2MoVljaV4wKCiUEvV+hf3Yu9Frej10/ckS215PK8C8J9?=
 =?us-ascii?Q?lCBEAT5FNQzy82fSbaKhBv0XLrja3hDgsammXGYg17JBvPtQDe6ggLE7WoGM?=
 =?us-ascii?Q?khIIuI5aZb0GRXhPesT1pr/VSOpqCbxMO8Co463u?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8dccc4-fc1e-4761-1c81-08dd6a9d8917
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 06:31:40.0937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OnV3baPRo7URDZfzj/YJBUF/oZvhy66/wgY0+gPWd3V3qat0tocnybOmjLJ/GuPqHvzbXNuSMaIpo6ivXQfEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7366
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_233146_450680_C4E93534 
X-CRM114-Status: GOOD (  19.71  )
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

The current link setup procedure is more like one workaround to detect
the device behind PCIe switches on some i.MX6 platforms.

To describe more accurately, change the flag name from
IMX_PCIE_FLAG_IMX_SPEED_CHANGE to IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND.

Then, start PCIe link directly when this flag is not set on i.MX7 or
later paltforms to simple and speed up link training.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 34 +++++++++++----------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index c1f7904e3600..aa5c3f235995 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -91,7 +91,7 @@ enum imx_pcie_variants {
 };
 
 #define IMX_PCIE_FLAG_IMX_PHY			BIT(0)
-#define IMX_PCIE_FLAG_IMX_SPEED_CHANGE		BIT(1)
+#define IMX_PCIE_FLAG_SPEED_CHANGE_WORDAROUND	BIT(1)
 #define IMX_PCIE_FLAG_SUPPORTS_SUSPEND		BIT(2)
 #define IMX_PCIE_FLAG_HAS_PHYDRV		BIT(3)
 #define IMX_PCIE_FLAG_HAS_APP_RESET		BIT(4)
@@ -860,6 +860,12 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
 	u32 tmp;
 	int ret;
 
+	if (!(imx_pcie->drvdata->flags &
+	    IMX_PCIE_FLAG_SPEED_CHANGE_WORDAROUND)) {
+		imx_pcie_ltssm_enable(dev);
+		return 0;
+	}
+
 	/*
 	 * Force Gen1 operation when starting the link.  In case the link is
 	 * started in Gen2 mode, there is a possibility the devices on the
@@ -896,22 +902,10 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
 		dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, tmp);
 		dw_pcie_dbi_ro_wr_dis(pci);
 
-		if (imx_pcie->drvdata->flags &
-		    IMX_PCIE_FLAG_IMX_SPEED_CHANGE) {
-
-			/*
-			 * On i.MX7, DIRECT_SPEED_CHANGE behaves differently
-			 * from i.MX6 family when no link speed transition
-			 * occurs and we go Gen1 -> yep, Gen1. The difference
-			 * is that, in such case, it will not be cleared by HW
-			 * which will cause the following code to report false
-			 * failure.
-			 */
-			ret = imx_pcie_wait_for_speed_change(imx_pcie);
-			if (ret) {
-				dev_err(dev, "Failed to bring link up!\n");
-				goto err_reset_phy;
-			}
+		ret = imx_pcie_wait_for_speed_change(imx_pcie);
+		if (ret) {
+			dev_err(dev, "Failed to bring link up!\n");
+			goto err_reset_phy;
 		}
 
 		/* Make sure link training is finished as well! */
@@ -1665,7 +1659,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 	[IMX6Q] = {
 		.variant = IMX6Q,
 		.flags = IMX_PCIE_FLAG_IMX_PHY |
-			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE |
+			 IMX_PCIE_FLAG_SPEED_CHANGE_WORDAROUND |
 			 IMX_PCIE_FLAG_BROKEN_SUSPEND |
 			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
 		.dbi_length = 0x200,
@@ -1681,7 +1675,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 	[IMX6SX] = {
 		.variant = IMX6SX,
 		.flags = IMX_PCIE_FLAG_IMX_PHY |
-			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE |
+			 IMX_PCIE_FLAG_SPEED_CHANGE_WORDAROUND |
 			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
 		.gpr = "fsl,imx6q-iomuxc-gpr",
 		.ltssm_off = IOMUXC_GPR12,
@@ -1696,7 +1690,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 	[IMX6QP] = {
 		.variant = IMX6QP,
 		.flags = IMX_PCIE_FLAG_IMX_PHY |
-			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE |
+			 IMX_PCIE_FLAG_SPEED_CHANGE_WORDAROUND |
 			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
 		.dbi_length = 0x200,
 		.gpr = "fsl,imx6q-iomuxc-gpr",
-- 
2.37.1



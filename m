Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17256FB5EA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 03:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yT6rnTN5DnTHH0WEcvU4TorZrIeaCLZvL+q0jaG9af4=; b=z8673ADSnINLAjdetRAl4OKoK+
	zAcp7acCajJP5cRFoC5Wn0oUvVKw38R4ITJiyEF7fI/dBgRJduEml68qbiRKBlNX60usXxpLEJwZP
	HhVau9RGo6zkQvOfXUUHubMQQe6Fkmo8rpprqUX7EJ3War89HSiX3S7j6k26oCs4qM2hKsexTQvPq
	ScBB1BYDf9fZGECYj8BfqJgBKsLYShI6GZ+jmgRFFcQimc8oMJW/W9VVldB0swM1TiFlF/5ZPicj9
	FnP3RETFPV9Y+ZnIcCMKzTxJsuwdS5rWLnzxdrNEXYCxmZyixdYGHyd5w0g1H0AYDNee7AweYXzIq
	xbuMo75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2KiO-00000005HAQ-0X4f;
	Tue, 17 Mar 2026 03:03:28 +0000
Received: from mail-francesouthazon11011043.outbound.protection.outlook.com ([40.107.130.43] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2KiL-00000005HA5-3GFt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 03:03:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIglm+FdLqIeonh8kYlHtwiTRDM5037P5I94pGbcMNV95H6qZu/mB4yYftK7AgbtyaKeCdLpXjeneYXOJgwEorHBqpyA4V18w3sWf3FhX/tMdP3PvtP+Y8Q8OPvYi0/qasArRlTb4yFfgRKc5eLLEyQKNtJGuY2ZBs/f9tgby3sECAGV/SXHQjyuBxMYruJW8NrSdVA3zmnSjdUz1H7EmGlEPoeAPZG0sPGwS0AtMc6laBKs/mpx/0YIKua6fXZbah77viaHNg5wWRLn1X1dP30Wb+UNKlu1raMxIqQ5UEYKOBF1we0QCUTlpFOXtX76Sf+ZcsVGriSfNdtt+1EzjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yT6rnTN5DnTHH0WEcvU4TorZrIeaCLZvL+q0jaG9af4=;
 b=E0axzCD6+238jVQGrUdnGqQdx8zq8PliYJ/s89eBf7JHzaPHgM/lqzzGbCR3phNFHv8bfdwfgGRB7VNLLLh8RuEot0geOVWlEr4GbfkgFtmKEzGlnanSZzNDytjTCgC6ymXrM+sFKS6mnx++VK9/Zy2TgGfm8CwOkWf5v7Bi9Qtu0h+Bht7AKme5V7uy6VzOCo4yNTleMCvlUxoOjgXrluirfMecDAxPsAu136lwUxu581k9k+eFEaaCLAVSE3N/+htbo7WzgU4lVaA2RIxcQ8XsLGH92MAcdmYFLLqt/Unh4PFeZJ93DHGSoy7iE9F34jceFZ782FILDaswF6gdPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yT6rnTN5DnTHH0WEcvU4TorZrIeaCLZvL+q0jaG9af4=;
 b=V+xxBVZ2ceHkLj09CQy5LcKXZIx6iedjpHhQ6lSBsVV4s9dgrt/gvIZy67hwiZL6jaiRQ/JDbi/BC7Iv3dt2c+x2DtbdXai0qY3iprXMWpS7V/D/UM4lyTpNgp1o6RBkVQWs3IPD05kv4cKk2P7BQtgdLVMq9hy+BJA9+muJEnQbqYleA0a+IFFuGQ6P69GkWJ4CfqOGUYoVPfevInPvj3/6oNgEMcYXtqAUE5ENsTBoRdypwAEwoX9vWJrPTdAW1wtzhpQssaxORXdSrdJK6y0Ov1dlExgzChDFbbQE8XrIyvxC5Alasd3hGFaiZPIlg5uTNqXA0yJkIgAT+DPzhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GVXPR04MB9757.eurprd04.prod.outlook.com
 (2603:10a6:150:115::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 03:03:14 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9700.021; Tue, 17 Mar 2026
 03:03:18 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	hongxing.zhu@nxp.com
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx95-15x15-evk: remove regulator-always-on for reg_m2_pwr
Date: Tue, 17 Mar 2026 11:04:18 +0800
Message-Id: <20260317030418.441824-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|GVXPR04MB9757:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ada159c-a90e-4a43-8ebd-08de83d1bd44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|19092799006|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: A+JLSRzsRlApm8XWd606O1XeEVzXkJjXnmeAT1jJVI4Fdcl1jhMQ9BqkO3655QXQFwF2cNeq/Yso62u++1MKFAy//VIpQAl8zoH3TFbFxch27IfrSBw3GBbkbZJtDHxnCfVUxtZT0hsVHmAULoUA8eDTe4h/GwfWv/2iwd10hV0aru0U0niuhw/zVO5pXlQkYc9TzxV0SxtEiS/OA5j3Fnz23yyzqhGQZpp0QVlvG7Sx0cCw4ZSvTg/9N1VCuOMihEMSr53iiDnIu3HJcQgkCO0Utu7DOPQpFZNQ8dHh0rVB1NeCOAc5kg+cw4rmke1JaI5rpdLMMhYZjiKE68xjzsY63FgcAw3mZZDtRgBnmF+1yQocOF5Gbnj1VPdbuKIcaD0GSMhrC80erYUntRPTy9jHbcx1QsK2dlIosavQNGkzBMZZvZuODsHCqD4xQKbrFY/fCVRPUxGXLGU5mvHvtn1cXQ0ZJ1m66tFR6swD/YyFURotasYIbjL1fFkK48UGbrQYQa/NzHX8+Jvr9pM8DuhmOB2JRD5EMxFOEnovcd1HOWKKJCcwcenz6VHP4UOjuCmIY00mJPtHHgQfPHRbT3EI0mHz1IsCaGBbdqS8dfik6yAIsVsYz73Asj6QqzwebEMmQlqsOJQdmjt3CqV9qp7Zc+/JeSdrjBp0SnvakTFfpSiO7Plq+/rUX9psS7+fs3+Umrnkhi0l4gldq/OfR5EHG4wkh2pUvBF6dxyuSiUrBENisYagA1+HXmHqXQsH9BaXUTT6liIwjX+d+FcLq4rJjQkLIlQszW24GkEv1OY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zaiqPoh+bU3PgU3lY3pYiTHAdXgjSeJwSVxu50sQCO4clVkBH67oGl75cHwA?=
 =?us-ascii?Q?HnLzWCLyFqhdoEAtt7oft6mb8g2Ek4CH/4fDKbe7xuAhJ5AJh0OzgAdcl5Zo?=
 =?us-ascii?Q?yjiXyBeF74cUPRE3uaCY2BIP1KqhWbOhO5zQAZfCKZoDEWKmg0dpJ/BNN8zN?=
 =?us-ascii?Q?8GZuZOkKVkXj3eZJlIrqSeHNslxc2vqNtBYprIfMTvH5L/TfHFBvPPWPDXt4?=
 =?us-ascii?Q?fwGuCC9I56mWopWvlNYiuku10YZXpGI656KAMdCwaTSSXZtvzt9zaOcJ/TsD?=
 =?us-ascii?Q?FGyYDfDdL3RNxbNbeLUG35FIICBbMsy7xBRcA0llrlYb5GsUZmP8mVGNM+FB?=
 =?us-ascii?Q?SXaSqNbKFJIsgZut9dgY7wEcTTpdfPHLxB9qmZ4BltPL3yRYo90pWjCdRswc?=
 =?us-ascii?Q?mtRlsEEouL0oufTX3cqxgqGNNP1ETd7BttfkGMh3rv3d319kWZHUw8DKNVrw?=
 =?us-ascii?Q?fjGl3u7i0m3+4Kj4msNVuyyRb60GZx90tuqCulr4s/eg1TLQxdfZDVwZyoKe?=
 =?us-ascii?Q?wjdJv3ENR10HBqCzvWIpSt9IEzEhckcnk30XX8Z79MwooJUSgN4pkponh+l3?=
 =?us-ascii?Q?hLMHwfIvaHXmj9fofA9sCQDRJ4L7pDNTii6nEtCiVYtPNmp3/nxNixEio8AN?=
 =?us-ascii?Q?CgS25xINoI/lN+OtvUOkAGeQ3KTL6dLWcfFPyv3Iqd3Nk8FnZ/M3vx2Lmz0F?=
 =?us-ascii?Q?hgc5JekPcx/FwxKeOOkWDVarJbHtHsrkfIdB5bpMVjzcuru7uUx3BpTUBvE5?=
 =?us-ascii?Q?IuTPCuUs1s20y2KXXnN+/JFPFBchrHDM0V4I4R5de5x2AGGQ5KfVuzNnNCfD?=
 =?us-ascii?Q?6cdj10b7GwQvemba07VxU4C/7chUUIUSHmVkUKpprnOJb05s21GFISrJMOGn?=
 =?us-ascii?Q?/CNE1/9+0sMeHC0ebshMb0pyvSDudIAFu40U6lP/qtqZDm6duwBO+N9hDHHy?=
 =?us-ascii?Q?+adkfwQ2pqTE1KfshTCMDesxb9/pSKkFxJNOz1/0+lshfQigCmGW/AhakxeL?=
 =?us-ascii?Q?LwUKY/+CGcRM02cfZdM9YG0ElW2CeEkvCtMTNDjaPDZwRnMySdcmUM5OHr3f?=
 =?us-ascii?Q?X/UbZJYue3/GrWJPO9jjYaAEYKYAZoUGDBfRsQUwXyndniBqBz20ZG1TkhPk?=
 =?us-ascii?Q?78wt5PZLZg0s7kmSEOXijGksJBoRN+dC2mnXAqWxH6RC4AXW2ab+v2DS0Mu1?=
 =?us-ascii?Q?9HJfzA8n6WilESX79JwU67+nwOktQ1k01TLLiqQ4JEBeBSjPPgymrY3Wp3NY?=
 =?us-ascii?Q?x2GDryBYZNV395na2MNVHc89XBHD9JbiEk99IbWumUumL9dL911NTa/9PS8n?=
 =?us-ascii?Q?uXDL0Naq8NYQS5CUnRT/CawpKTK9XEyEFPOACHhMzJek4vj0ckibh9BguIWC?=
 =?us-ascii?Q?KEoFobvGBQbtiDOYc/1tM/Eg7e0oysDJz6n5Rkm6gRtBwi+S6hOLLX7abk8p?=
 =?us-ascii?Q?TJRGT4+JU5gc02G/T4zf6MMnFsuBlBb3txLvDXfAIxWnmTvoIKxSc5Kd6L+x?=
 =?us-ascii?Q?ncQHX88EmT5Nc25byq8+gvPV73oAnQwtaGL3ClcHJO1I0EHWeXnMIxAAgL9v?=
 =?us-ascii?Q?9lz7UlQUqIkYcIlixsr5jPZihyKPOScPt/TgId+IUFJZnT0wUI41cxTvxdhB?=
 =?us-ascii?Q?/05bTLxQI1Kq85sZ/GaPsGts80CjjgiXHDTosXe5OfH2qwLT4bFW5zjxIbXl?=
 =?us-ascii?Q?OTmGpRAjr7OJfOLpktoJNFE4rvnBrgvUwfHE8z+AD+zEqJnlxQrCBY+7MHpM?=
 =?us-ascii?Q?QhKL6RU3zQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ada159c-a90e-4a43-8ebd-08de83d1bd44
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 03:03:18.0611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: USF1ZTk7TBWfurHAPQ0SfVfhbSU01XrzplvwSjoarg3Xg030278eTQtCzcDxiCdDuVIa1w2ylBZLn5q2e7BrYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9757
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_200325_827646_70B00795 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

Now we use vpcie3v3aux-supply to keep 3.3Vaux supply enabled for the
entire PCIe controller lifecycle, no need regulator-always-on property.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index d4184fb8b28c..7eb12e7d5014 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -116,7 +116,6 @@ flexcan2_phy: can-phy {
 
 	reg_m2_pwr: regulator-m2-pwr {
 		compatible = "regulator-fixed";
-		regulator-always-on;
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
 		regulator-name = "M.2-power";
-- 
2.37.1



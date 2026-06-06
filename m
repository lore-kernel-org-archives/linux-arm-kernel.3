Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA1BCD8C8F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 02:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwx3SsW5XXXJS3P+97HKeelH/SS4xsMtaWYYAJYZswc=; b=XdBvPTvzR+MpcBs1F0qSGIKdIm
	SS5n4HKZX8rt9W1my6RCcPNfca3ZUpTDzTlWZZcFmMrEasQxFlVJGKZYVMVKLdrqbopcZl/XPBv46
	kvRtnTxTKqoPMePBVAIjHsIqRZ5Hwv4MXGDexe7OWnAYRfARW8PO2oJk4joctEujO8VpN4a79hnp7
	y4klbyjxdr2cJnrPhpludPWuzDKTNSDPKG6kQHoidskTjo1MjRI7eirACkprMmMuajdaAl9FkSEOa
	Sm0VPZMQr18qZeSRqKlDjbRhon8ZFGiP5gVGfh3idKQNZfA8XwxhHSVchXQtrPfHi7t/1mEocnHeE
	tf1waLLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgOe-00000001NDI-0kk9;
	Sat, 06 Jun 2026 02:04:24 +0000
Received: from mail-francesouthazon11021117.outbound.protection.outlook.com ([40.107.130.117] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgOa-00000001Mxz-0CwU;
	Sat, 06 Jun 2026 02:04:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Db3+ZpBFF8SHPVnxpDP7+SXuVBbttJrPPGwb9plPFPp2axNYPX95UpXFOhXRve90Ts2RaHM8XX3e4JEkbZ4I6fqoYVkpr96WQxT5rIskBnmwdGPqWe3Xuy684GDNfhVKF7bcOdIeTQNRaX3gz+TAoMw/pRzvuhaAmvy8LfJLHehL5pmop9AqC4YYcQCAiUU2HL/jpFzhyIRUzYHazDDKn3P3YClsHGsQ6CV0ctM+z/sTCtEfO1JEEsWdqFoUqNU4egGpYd9zBD7aqbDzT+amdOA6rFfWb2CIqphMwCONXyD5R+ZuJVhggZIBlnWYNTywU3jhdUo/ONWppJZKsSLTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwx3SsW5XXXJS3P+97HKeelH/SS4xsMtaWYYAJYZswc=;
 b=ohmLkXSi1IrNqjWW4A0yQ3ildKXfVlTy3YJ3HFsxWpPNEhW3XwiDYhMPhtBMDdv5X8jy7lkUiPGaFbYj177cM0N5O0GtQx76n5AXnHZaIL6J3dEfZYS57qOE8duAJbrR/SxAD3XFsYnvrYjG3HnqD9AnZugGgQCzcZYBiifyXqtnUAc5xdiNgmwvrZ4yFMdB5sZd03ugRv/PUF2Zz6tGDYxfRQJyJlqq+drqP19jQdeyCrzLJw2e2eP2eun5xru+qQ/ZLsGFOpYDoqF/T5/UNIS/y2lUNrXoiTJrAXvlGeYRGwDvgB9+k2fQWMVL1vizgypGbY8x1ospnqY8jsDgkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwx3SsW5XXXJS3P+97HKeelH/SS4xsMtaWYYAJYZswc=;
 b=nVAqP9cF6c15BtpHtnjFr10CPZMkl2WCNnnW3yKODkTu1ZMoLywZaWz6sOETeXKXyRR0hRH+b/WGCWf7502jUnsH68BtYbd+0kjE+C6T9d5s7KVh2UTG/iVftWosY07l/pfr0rQ5uqhw72eBoRquhJUmeHJpNbtuDs0hkVIHnhldxPsBREz9bD4qyJ+OypzAAXl7a2p0BRwkA4AJjCGmhyfALTjswC12Jx8JGX0vZVIdsXAX9v82x6/bFh9qFWvH/rztLfkqVaAdYHMPk9QqvObnen6KCn7FdJdYAHwWOdDUeWV7iPPtU3Xhob3xPMyLcinoAop8m0DMtPK4mpqKHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DU0PR08MB9558.eurprd08.prod.outlook.com (2603:10a6:10:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 02:04:12 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.006; Sat, 6 Jun 2026
 02:04:12 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 10/11] pinctrl: airoha: an7583: fix phy1_led1 pin function
Date: Sat,  6 Jun 2026 05:03:41 +0300
Message-ID: <20260606020342.1256509-11-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|DU0PR08MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b334f65-f30c-4ca4-b315-08dec36fe74b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|11063799006|56012099006|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: I9C8+cbA1+gOMhR7LrQAOoWcufqxZoGgnwTUDcllwXp83eaNbFNaqC1nHi7GhQpMzSf7/sXQXiSPn/TTKMsThVApE+gx161Q7UOksO0e1PA11XBPbrcx3ZBoi0OZ7ZUFmmAOO9O5ISct+NBsPNzutC/cGYLTqUGY04u3uZFIjUUsDK48lz6lL7bYzaFcH0FXauGDE+tx8F8xQHNwVEWVc3I8+9/a7DsIR5zRYqbbb0vTQnMtopBzzqDGjvWCmS6vxsBwxiTHgauLo9Otxm79wyJG5ZoKxzS5AOAX73robneUs5UpHd1Xyi3XR1N7N6lkMlyw5CJtcQ6zmlmsN5derIOTe8zPG5Ps5nfmRt/jJiom0Wwg7yvisz16ge0abZdxJ0ODZA+HCru2e85UWHDvMDR4oFe7BR/XUozGLdyF3+N3dFviQGRAwM2A3age19oywCq9e3E6xp4QZ8x5Oofc1wQXStvhJz8igEYSP4L1VkUp3oz1upKWjPh+kPmi3kqQMm+Y7ibV4Ay/Mb0DG7woIWqBfXaYPZ9vuMny9AhrgmavhKf7qGrA4WcvhjuhjLYx2HE9xgaYI0z79LiBBMVtGFUYrtuplwNoeo+vxviWDjsYbX4Siu0TrfZ6D1Llj6w0JFffvhbPXRA372qGSA1Ix66Bjiv2HlzuA4KhDl3yNAx3O+Qgl3SB1FcHx2EfM70eO9/hYjkKuZDTK2TnsWAMdf//sJuDcCEdLuRyUayCinPI9QbxPBD03eOIn11C2nnhoeSu1ONo6OpEGX0aGdtjSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gxpSEXYWmBtdq4u2pfw5jTLQLxSnLbTqT5K+fZ1VXF255gQ6EYq4YhabtSYW?=
 =?us-ascii?Q?6ezrLtYh5pcrpHEFMQoyzRw9WrqkE8iJP9h3qHeINYm0ULckpoAl/US9h6PU?=
 =?us-ascii?Q?N6a+UwtOCO46BbiJNX66mH5Byr9NZN3eydhg5ReEE0DO7PKN+PuS2jAvyiG5?=
 =?us-ascii?Q?9iVE9ASAxRjCXQPWBUR9lSoyW3/3wKGE89CLs56U0jdRPHz5rwPlieqGXVyQ?=
 =?us-ascii?Q?CAOWlWqznd0Sf9OM5g3a0IjpusP154eTfS+fM3Sm9lQqQwiiPtk8Lqm6PtBG?=
 =?us-ascii?Q?0WdmuJ2ILTUv7RqRc9uJD6sUPfjWAvrSw7kkRqcYffaOTYQ3DAwP4W0qwdhM?=
 =?us-ascii?Q?op2LyT8pxb40fyTKBtk7T/lUuyuoXH4PZpyl2l4whG84Qro+nmd74d3KkzMT?=
 =?us-ascii?Q?C/oHPgjAF5YYACl7W5IkevlJfWIjhhqxxDUgaOmwdHTzFVIMo9Gh5ZVPg5Sw?=
 =?us-ascii?Q?+fpYukFft8/R4e/iWel4gESXKm7cbfXNtFax4uxjeJWaefO8A/kESk4ArV+N?=
 =?us-ascii?Q?comqsnpSyCyLNhdgPpMz/1BuO7kHsWeqWJTVbSBV24DqMm3W9TjOmE4nkkpf?=
 =?us-ascii?Q?c7HhCnKvPPNBYTbIgwsIbGQA7TNhHEFvzDu/bnctE5NWL64vEtEqIpKLBXkO?=
 =?us-ascii?Q?3XUWiYH7hjqa3HZXT9vU1FqawztQuM8uGnkRy+1ddjwLiHoOj7ryr/i0sKcS?=
 =?us-ascii?Q?mG+1ArNzkLMs3w8cDbKpo6Z3AvUGorIh1kNGN79B++GFIDyqe+tYY4miUNk6?=
 =?us-ascii?Q?+Ug501Ros1Bg4urH29ZG8R+GZ7F53juW1TSqyczc2/4mDBnweORyjS8QSHuy?=
 =?us-ascii?Q?ydDpWGc8VzYvW1MDa9KGu8TDdMHSbiwD9nlrM/bh5shOFDAy5+JCKR83XD2G?=
 =?us-ascii?Q?SDukm+Jdv2JWJ+ILCbGl1AOuIctUi2Voqdsg4qJFLOcXEegTNzB/ZzBbm2eI?=
 =?us-ascii?Q?977Dk6kGTMB2pJRtXazlmz51kJggvFcQzu6bUnG+F3awE9rzZYVoURtHSKiO?=
 =?us-ascii?Q?MGSaup7GXos0rOLRIwm3x55d3PF+DI2ApsST8uxGdiiddO5DMfWBEW8XJtkf?=
 =?us-ascii?Q?Bpus+FgoAlrVcHD6LDywopKDllxV4INeU61vWphUJETpao3vV7xB1KCuiuf4?=
 =?us-ascii?Q?oKhhpdhOUmr8f6/izCfn2itu4ImpyteKpDg/WoA1LcmEtBbsN2agaAYhpd4I?=
 =?us-ascii?Q?uZW5y3+TrefTV7qQvj5NMPRIbKYNd7BzIZXSnSK1CEAjVPH+zUImYyUKgXeF?=
 =?us-ascii?Q?eIn8RVs92F+8+8Dhmz9VDf4JInXwM+apEeN8D/YR1QYf9pwgUZA34t9SzHRz?=
 =?us-ascii?Q?zWzW76UXs3hEpi5qF9l5K5GbCeaoOGFLtVxt5MgqhMulU+wRZDXPBBzv6iUQ?=
 =?us-ascii?Q?p5RAWSXEE7Su9hsXkkHeoeT5gha/GOE6hQJYNcq5QEd01oeGko6CZmyUQ79k?=
 =?us-ascii?Q?Tv8K9kMynQzKk/HxOpJZlpKRmYXp68YRSSWRAUGLspqS0p+ZERZcL3B6wWiC?=
 =?us-ascii?Q?ZexSw2kr1HkEQCJKW90xV384qwbRubbM+mc5pMCk1HwGe8Nl2vmkiah6jsPn?=
 =?us-ascii?Q?zsXtI8f5Ab+5nD0u97hfyiosOe7WPi5RXayQbWpqu8liiPpRJia9qe7eZYWH?=
 =?us-ascii?Q?i6/3aLmt9RWJECRtcUME9Qnjc/k1NI2w4Ax18P3BJsUBznSbVKhwbl/cjhyj?=
 =?us-ascii?Q?FW6byYl7fRcEjD6whN2UMuHprnqnIQiyW3oVugM4eFIA7DXesXff0Ki6ZPSd?=
 =?us-ascii?Q?g1Pid427RuyHTJQt8kV3a96jHp3JuAs=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b334f65-f30c-4ca4-b315-08dec36fe74b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 02:04:12.3783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypMiV4zL570avr/EZs+Ohme3GSox3n5wWg3hY27GENnno+gL8XwBSxNKOrtU1MmRcj/umiaN9sJSFuMU8fwJNNQKzAX3HgCcygzg/ikESIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_190420_090830_10870B92 
X-CRM114-Status: GOOD (  10.48  )
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

phy1_led1 pin function wrongly refers to gpio1 instead of gpio11.
Fix it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index e66b608c4803..b73ab60d0065 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1754,7 +1754,7 @@ static const struct airoha_pinctrl_func_group an7583_phy1_led1_func_group[] = {
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
 	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio1", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
-- 
2.53.0



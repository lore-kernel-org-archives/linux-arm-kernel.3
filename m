Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D641C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 09:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aF/po2uWP1zndEMFb9dodo89Y3APF+ETHMsaG3RT6SY=; b=YNN6yRCKP4eJK9KYfcor+OiAnx
	wvzOW+pLInuImquFzc4Zx8bCYqqfEM/INqGvp3xqkLYTKJ2d216qQ5gVtRgzOI5bg/rZyPTQy4Esd
	qxXvlLbi17hk2EDxbXIKVpLjqsP6TOEQWdo8M6z/slgNkRfPxR/fnYjMEAY0bkuB2Law3DQ41YqEd
	VYJHNmC8Pyy76ICiyXCbBeQeQCpvFMt/sln2Q5KDaWBmtQtY0lmUVJUvEuChb/UStZk1xcG827Clt
	Y5AK32x+PMKgiy0VKLMpydX6zqJHO5ta+05kr3yl/0zFf21oHubNO9iUXZ8GVfp27xzQsVy4XSSTs
	pCZdlqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6Qn-00000003xgV-3WVn;
	Mon, 16 Jun 2025 09:47:09 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5gt-00000003rf4-39MY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 08:59:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWkQl/CT6EKKFwggtPmbrJv7DCbT0ntJfiViQiUHNhrGzUGUSnqep+/RPr62P8j8LV2FaanMhAg/TJh65Q0liQM6w0RQNT7GcWc7+NO5VvkU3krWIx14csVoWBjBKGI9Ql8HnRP9TW9VcqXR4T758Vls4/sNR4NL+trKfHXIja4epjKWvlMOPvCftCdObBpAsbdDbGkuxF9wXtWWkMd2vl1mcSVAUUg9i2paK/XVpqmJJQgEU3zTyBen0yLK4vL3uUuihWBv2eYEULFYqdLny20gFGGT90w2yit84va7RU7yU7PSwyZrUZt2k/2HPIxNnAsVeZmITdLLM7Lo49OVWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aF/po2uWP1zndEMFb9dodo89Y3APF+ETHMsaG3RT6SY=;
 b=wPRFVAdU1+ub1LYQZ4vLp306guilUB0H5frZ/t8h52/5J1A2dk/l5o/0AWPkNc0Ymiq05EtZKGMo1jLJtnMim9ANUmBMzjb254YpSGxau/7DdcihSh0LeyKNPpWeu+9iu7Eb8/IZrC0IXLpcuY+JnprzSHDJnB9r9vyr7tfOIg2IOWgXoRv0xmF2ODebyqew78+DCdS2BVL/fcO55hWfXnsgvSEGMVGhI0nxjzb3974DVazpyvsB7PgsSu2v+FwHCi8ftH/Bo+055MtuDES6GotxaXuHJ5Y+jdPzcGTR/vYlVJR7Jrr2Gt0Z79Qo9hzUSd6P5RjRrHGjLJ9aT37d9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aF/po2uWP1zndEMFb9dodo89Y3APF+ETHMsaG3RT6SY=;
 b=i6vRMVDDV7Ja0w152DHQbVN1CbxDKCfeQNYUeRXNLzhPpfL8whzwaI5TjScXVXvJMyLKRNy6Rx2mnQDAeThOS3buJRwq6rTa5hdUjmK3Cu25uMz3l0P6EKprKRp/qtNXDc8b0LP8mbyKXeJdfE2Dtic0L6SDLtgwfRmnkNW/lGb0p7ZB4SsYIF0mUXOWaXEEVdBjq/6fnR3m1jFq8HIQQaqiEZ6Y7ItLjPIeV5F2qfmt5HegpbMhGAdT7o3Kqxw1REzzMtkUCEJtqeIqCgCom1La7ZM7nnPQfal9QQlFV5ahIQ/uabNPA+brkYNSPJO0kUACI05IGv9HT2CjWI49uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by PA4PR04MB7712.eurprd04.prod.outlook.com (2603:10a6:102:ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 08:59:40 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 08:59:40 +0000
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
	Tim Harvey <tharvey@gateworks.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 1/2] PCI: imx6: Remove apps_reset toggle in _core_reset functions
Date: Mon, 16 Jun 2025 16:57:41 +0800
Message-Id: <20250616085742.2684742-2-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250616085742.2684742-1-hongxing.zhu@nxp.com>
References: <20250616085742.2684742-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:195::21) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|PA4PR04MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ebe3bd5-a0b7-4f7c-e405-08ddacb42105
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?897Xg5sO0Lv7jWkX2j3rnUtpWCDfvLie1RCegRU5Xkm70AT7mMCIyTp0qyRo?=
 =?us-ascii?Q?JkYjGuTV2oV94olKLkkCKPMvl6fyohsH99/rutXMwYp1y1A0x/9B5haqziOa?=
 =?us-ascii?Q?sS8D1eNMJxlSUr42xXlm0yC4VMMSmYgqwMrJdUMSXNMUyk8ooZF0kah0kg9j?=
 =?us-ascii?Q?wqjgSzhDUxIakLYEXqA6vMIU5nUaE20HSTKjllm38NCFE9uUkNPsBkCmNDiA?=
 =?us-ascii?Q?+IDeaC3ZB4e2kVWQPT90Gcerg8VukiWTkwbBVYVMFf1pf/YTs60Qjl/UQgLQ?=
 =?us-ascii?Q?8pitQHavnReSwdR0MTbzV0HBI92fctxUhIDL346uN7qUtfCX9Bm/0K12/pcJ?=
 =?us-ascii?Q?GgSzXb19aBnztTLVr/ZRjnN5JW9UZZ9q3fJvIvgF1zm9pFkT9ciMy0j5RoaG?=
 =?us-ascii?Q?ESrMgTm04/1XsI51uBygWyGAzJeS3uwywxnrxzNrYx2+ZuoWPUEeA4ri77FO?=
 =?us-ascii?Q?hHwnAszBAPEVC4i7G2xoiulb/oousnVw42pa9wFZmHVM/s6oylBH1L48veux?=
 =?us-ascii?Q?VZejYwocCXMyQIs960drNU1evWXOPRhGSq+x6McOsaeSAGyujRlIFMLg5zyZ?=
 =?us-ascii?Q?gyHmVsa31PCsh6hbJOA7WN16SmG/7LqYVV1BWXWdzUMF/d0pfWEErvHUYYTD?=
 =?us-ascii?Q?1QfzAHkbN81j85XOk37dJZqRwrQS/NqweRNZ7fpKhSd5gma3rMxmcG0mjDwv?=
 =?us-ascii?Q?BX8p3OuJwYGDLO431R2kmrKQ33j+bNfuVrmA/6pMMpiC7IjCfhFOxRkbt5jW?=
 =?us-ascii?Q?94FceLeqGlz/b4ZoqU9uCbpIJlDg19rR+T+EzpyYqYF1JsPcut86v9IE4IdF?=
 =?us-ascii?Q?p5MdLtJt+sZpkAIX+QKvvThDhBsUdH/3e0ZAgVWuIGQXcZUavOnq0HnJ18YT?=
 =?us-ascii?Q?NQPMYPFShXZzqVWMe9VGCgSxzHRk6d3PY5+oWsRbc/j7AOaEKeie3Zffod6b?=
 =?us-ascii?Q?GrxfMlwJ8V4wwhDhIV8k2pFDMCisJqw9rqFqkYSm2Tuiu83jtonCwsJ4wOsg?=
 =?us-ascii?Q?cgvOlvAvkt8R1Z8YK0iigc8cWf98rYpP2K1I9DlPMSx8NKHaooM2XpbDx13a?=
 =?us-ascii?Q?mS3ADqlkN2OY1FT7bloiBvky6ZZeV+R0GwIkcRXsfYCNe3xQOIVNchy1y4Yo?=
 =?us-ascii?Q?Vqc0EqFpI7xX3HZJIkdJOcw/flrdj05rt3v9ESCaK/e9/WQFKzNpSzZEPyyn?=
 =?us-ascii?Q?IGYWGdcVHZzTGGSicfsBFS4pCe3LHVWWZVebJ3srPJBFj3NoFwryRqHWpyG9?=
 =?us-ascii?Q?4ikYhk+inzbP4/xSiSpQs24Gaan5Ef5f0oJQBJCzhVbE5XJcnHbcbmXt1ck5?=
 =?us-ascii?Q?MBzsqJSTT9gVeuPZz72Glh1gmIuGfjvM8iKyt7qDNo003EHEYujqEKTNNDm7?=
 =?us-ascii?Q?hL0PvciL0UYDCHxazdjHORwmMm/VeTomysgJ42/W32QAqDWF72K/e9/yniVe?=
 =?us-ascii?Q?iHKt3eL1JlvDPWaint9aRuvTzIrlkD8Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?48sSjpKcoe3j6oYgaw9SNVcIOQoEMBAx267TkZBrEybrl4FFBtTOURHKYmWB?=
 =?us-ascii?Q?H1xrQliurytVjwQtQR9lTAPDYyEVzp4dRhGqpIFGHCJf9ZENtLjC1UoLphhy?=
 =?us-ascii?Q?RseiUJmbQBho0vfa0dT3lf+7G3EGPlgxu/RK18aS8Y3lrPnJdcj9p7DL3KIu?=
 =?us-ascii?Q?9abl5i7WOVsj9Pw5q+te6pJD0k77wwTCX8VP9xUOTsUp+diER31BgCXSTND4?=
 =?us-ascii?Q?/B7qrejEEYVMXEwdJ/kEGDcbwJdfQkbqiWSFGmDhe0ziKhzoMFcCFy1FnkAS?=
 =?us-ascii?Q?j4b0MJO7Z6CVGlyPfU+47hH7CD1f132bO6Im40SqbrwrUu8K4SjFeigycCCx?=
 =?us-ascii?Q?GHE6a3kgU6YAtQnojb1uHD5XBTttcql45s8Rba6tvzWQpy05lTcPTHvm7flt?=
 =?us-ascii?Q?7VuIsgvodaMvVf739jQ2DziQc4y6d2zsbtcNCJ3Iun4ov+9YHu0QPBMf93wW?=
 =?us-ascii?Q?sbmRsErLRzNLlkmXBGl78tYOZA2KnO5eFQZ0JGJ+jefGNy6SIGCj7bPNAIdr?=
 =?us-ascii?Q?ADMjSrQNvZ33npNiNykBS39BZyemwRv1lzl8VdFIfnAL66su0wgkay4T+1mr?=
 =?us-ascii?Q?KArhauoNuq5yyjglVHLzUerLu8meQLr13A3PylP/WsMC7bfdBTPZh37dafyp?=
 =?us-ascii?Q?htHMVtI4cdFlZx4/wLQ7HTiZ5N9DLI6Okvyic/ZlFiMCG0fTWcLxR+W3jmPn?=
 =?us-ascii?Q?Ab+MX/2VGvldEbbHvSQH9BaGeQs+7zaftO/okZQgKHSOgMv8VAKQKlTahF5s?=
 =?us-ascii?Q?OBWJy8MPG0/aalr9/taWwtKndXS5h/sg5X3NKT+YDNDubJA7iO3xR25RQS0p?=
 =?us-ascii?Q?umWyO0NdxEVwgViS/1Xoh8bSTEO7gvyyaZNoUTi+gYcDAnNUEjGBANUuxQin?=
 =?us-ascii?Q?T3QFNAGmVTA0iAY5qO+BKJq9V1K259hMDJG0JdiKeSye9g2kN5aK5aPDVoNG?=
 =?us-ascii?Q?AQ76s4Ee1MfykIoT20CODwNeqzGwzWLHmzP/vN7xt59FIEC1gAoPHHAj31rf?=
 =?us-ascii?Q?WEa6GwNeaEEej+teIZpkS1k6y7hIpLQWbKBU10UXvYhZLE+iO7EqnB+bgUOo?=
 =?us-ascii?Q?sF+me/KWDCIOL0+u5Qox+0Tor3Wh1iX/MdvHTUgQKpRYDVcMgF9iy3RIwJey?=
 =?us-ascii?Q?eWbfQtw+ADSpUJCGRY+/0suOm4x1Fn+oaPZmoXCtPje4F95X0ATJIdTV+txL?=
 =?us-ascii?Q?dleLVfTyI+5tzN6ngu8X2ltr3gYkaRi/juOLSnOUO51LzCYSqXRoCM0M8Tp8?=
 =?us-ascii?Q?fl2DOnlKXsbL5TeeMxZ2zICWdxF82TnIV1wW25Hw1hAPZuTanpnDoRVCzJfM?=
 =?us-ascii?Q?dhsNztKqnq6UbVlHWcMbDWGPZabR5EocKBkIKXwR6dnQa9vGVY0imL4VNtUu?=
 =?us-ascii?Q?Tk/hgyQjkLfcS1ORY8x6h6yjF/EvIXTEQwTVGK7c5JkTWyl9vPSvFsAouxcX?=
 =?us-ascii?Q?RMvwB2dA+5bh91Hcf87XUcaAS0tOw6df9Lh0WhcWPX0uuVh4o91vSyZcTP4z?=
 =?us-ascii?Q?hZ45vaBDkrcdGDr4HWP/mNOKPbJUZnK7NCzZyRkEq9le0ZIqbv1KEVv+PTEg?=
 =?us-ascii?Q?GWPVQkVgJyF42Wbge0+CZLN4/WIiX+gyco9wfjS2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ebe3bd5-a0b7-4f7c-e405-08ddacb42105
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 08:59:40.8255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JjhSdWg5WnWceIbUcpgysmkCkRxfCfs15ixZqNmYeDKPq6l7Wozt6N2wx8NHz9Esg7iA1Jxl3aJiX/epYQGj3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_015943_806632_7016DCB4 
X-CRM114-Status: GOOD (  11.69  )
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

apps_reset is LTSSM_EN on i.MX7, i.MX8MQ, i.MX8MM and i.MX8MP platforms.
Since the assertion/de-assertion of apps_reset(LTSSM_EN bit) had been
wrappered in imx_pcie_ltssm_enable() and imx_pcie_ltssm_disable();

Remove apps_reset toggle in imx_pcie_assert_core_reset() and
imx_pcie_deassert_core_reset() functions. Use imx_pcie_ltssm_enable()
and imx_pcie_ltssm_disable() to configure apps_reset directly.

Fix fail to enumerate reliably PI7C9X2G608GP (hotplug) at i.MX8MM, which
reported By Tim.

Reported-by: Tim Harvey <tharvey@gateworks.com>
Closes: https://lore.kernel.org/all/CAJ+vNU3ohR2YKTwC4xoYrc1z-neDoH2TTZcMHDy+poj9=jSy+w@mail.gmail.com/
Fixes: ef61c7d8d032 ("PCI: imx6: Deassert apps_reset in imx_pcie_deassert_core_reset()")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 9754cc6e09b9..f5f2ac638f4b 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -860,7 +860,6 @@ static int imx95_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
 static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
 {
 	reset_control_assert(imx_pcie->pciephy_reset);
-	reset_control_assert(imx_pcie->apps_reset);
 
 	if (imx_pcie->drvdata->core_reset)
 		imx_pcie->drvdata->core_reset(imx_pcie, true);
@@ -872,7 +871,6 @@ static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
 static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
 {
 	reset_control_deassert(imx_pcie->pciephy_reset);
-	reset_control_deassert(imx_pcie->apps_reset);
 
 	if (imx_pcie->drvdata->core_reset)
 		imx_pcie->drvdata->core_reset(imx_pcie, false);
@@ -1247,6 +1245,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 		}
 	}
 
+	/* Make sure that PCIe LTSSM is cleared */
+	imx_pcie_ltssm_disable(dev);
+
 	ret = imx_pcie_deassert_core_reset(imx_pcie);
 	if (ret < 0) {
 		dev_err(dev, "pcie deassert core reset failed: %d\n", ret);
-- 
2.37.1



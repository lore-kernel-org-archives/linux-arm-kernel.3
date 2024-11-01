Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEA6E674AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 07:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5njFyKgXawlgZLv2mhYLuB2PUmPlGHQEDpoQ7jGDOPw=; b=yIpZH1TYexO4yn5PGBlTL3klie
	t3mi4kDwCKURNc8mGOZHW0TXhwAID1UocvtsuSZOzwQs3gozYfYycbmKleL6UxVbNYB9ue2scLkEn
	ZVP9dpSjK0IObsdpRyq4IpAhKiXLU1twrO33TqDltpGCQDx0AHlS+g527fwly9e2AMPSIDiPl6p6M
	ywndy+NzvlSQcdWpV3hQJRrEprb52lLpfaoUWdUkvJllto4ncaFVXk4yu9HinxefVjeqkLk1EfEm/
	uSF+Pq/56tMDsfPtBs6+KA+ADexB88B9m1EfpuVpREZUvwXIHpjdlP1jdTNWg3WbBMRDm8cB/uDzi
	TDj9EBUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6lgX-000000062eL-0Tfc;
	Fri, 01 Nov 2024 07:03:05 +0000
Received: from mail-vi1eur05on20616.outbound.protection.outlook.com ([2a01:111:f403:2613::616] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6la8-000000061X3-0Pci
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 06:56:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJKxvpx+YO8mV0xZqMQIXB2gcHbE8hZpOOYYjRWS2un/bFjul3da1vQk6F5+HG1LBtVn2lQ/K26jNEb/yZ+JvlaleoxMFR3HEyNq58OTGpbr78fmLKRklN6pYUAncweNBsMUIN0fi5MM4WVnjWbyT/SlkyPM1P92ooD544ia5q90w4lMfzJHJe9QqYKEK+zqkJIdOEnefw0YVKUn8BUvgT1xuMxR2wEyBr/Y6AkQeM2Rxm4YN69nMvfHJSqx3yOai57VYTbfwTya5Rq48TNZ7DBK0SGM5pVpiT/oDI1mZU+ccqAZKPXqZj1sGo6DthdMjkpeRgpz1r2Ui7Et9IiRrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5njFyKgXawlgZLv2mhYLuB2PUmPlGHQEDpoQ7jGDOPw=;
 b=j0TYpWOeRHBXZdtK2gQqriNRec6J9NEahKYDYa7/ZYerx/m5h8YfnUAGwpVIDPIh+9EAQPwOwz0ExAXlzfbL6H+rbFpLojrVBTuQSoa1/YJUCUy7M8Hh7TZ19TIYAIhm/gPMpusjzhz0eyqup/uYdilzGUUVOwmBO5rQIXk3GYyH5nhhGMd3DzXeaDB4ZVz1JTZ8J03AeEcaG6VFyzWRfuWnOO8R0VYdQgvQxpNctRisow/+1MJlFBuCj13PjLYaEMj4K5TsEO26zLidwUz5G7sUSeGKrfendpT9M64LG5TyIiTYF0e30HzjdKOhvC8GZnT92GliC4C0f4qgmIicwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5njFyKgXawlgZLv2mhYLuB2PUmPlGHQEDpoQ7jGDOPw=;
 b=SpQAJ0exLOfMEYkL3M5KqHa2CNOhYwyYuuhRA2OKUIzTf0zJRjGhHMBsH1r3cOs+mjh4i+xKrEwPPOVzXMziH7/IkQ/HMd8U5+yZoyDnbE+l/tLCDHNBMAIz6iWGP7XFYUg6qKyxv/GoSbyfYd3zcq0qN0QWzd1/1bx5UAhjpoD9YoWXz9bB2iXeESJ0dHzBq1256yXcJtPpXxNrQWZBzYoso28mxCVqi1iSsCX+DjDTq57Nwk/knCFiTOrcfUv50vMCsyg3iTNVAKttCJdUs5dD2JzmmJE1d2PctaCQi+olasJ5Fnw+YbFJhqt6dpo3Tmo2HONf2hhW5cFroRK7Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by PAXPR04MB8573.eurprd04.prod.outlook.com (2603:10a6:102:214::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 06:56:26 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%6]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 06:56:26 +0000
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
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v6 03/10] PCI: imx6: Fetch dbi2 and iATU base addesses from DT
Date: Fri,  1 Nov 2024 15:06:03 +0800
Message-Id: <20241101070610.1267391-4-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|PAXPR04MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ad2b65-6f72-4681-ba05-08dcfa424dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CC0kYrHaq+g9susmKdrWdiNahqDpBTZdR1n6J68JEd45nUs3IyxMNldl/lIz?=
 =?us-ascii?Q?1VhfWEXH1Yu3MrTu9b/UFri7LWpzwkzpG7K7AElf6ZI/tAb93KOwiadwNq0u?=
 =?us-ascii?Q?tDXxLIXwJAy+dT6j0I8wqXQkz7ohePQ+870I9n8D/gQqqhy3Bw8Xm3bzS5q/?=
 =?us-ascii?Q?Bbgeo/wmFQM4ayuaI27S2DWXqIy19rPP0Z5ITVh2sdr0F8xUSPNvi1IJ0/+9?=
 =?us-ascii?Q?+3HI2a7EJwe3z06w95XDilGGgRfIX9AbM/J5rlRRUEOWbXA4JY/49L1hEoQv?=
 =?us-ascii?Q?dE4i7nT+leNnLhKFqXZ+qF/3QBkUMCtTJOJa0lqqSpHEpmZY007Ub76pxfM2?=
 =?us-ascii?Q?xTVL+Bt77BkBzqRGg/emFE6kSH2adhQSqE9Un3pYKGX4650BFsGbCSCcUjSB?=
 =?us-ascii?Q?lIKmh/RJ48VUXYGXgXceaZMTlovICjhYehY3bnR2huL2r2YNP7QfDk/84Um/?=
 =?us-ascii?Q?p3OeFAHG/965GOu8+w0iLlNz6woN2iozXAH37CsaXm96TbaQOxIti+b44RBU?=
 =?us-ascii?Q?DLROea9eVfD9GY3/uiELM9CSzGTBvHWpZHZt54eBbJK6puVCtHXHNWeDsHRP?=
 =?us-ascii?Q?Dx4km+GJymGWy1WO51xV76mrtz1E1IbIRBxulaf+COBxDmIDtiArqRbOfzTx?=
 =?us-ascii?Q?FOjAsj1o8HPejEXOVMBxxh6Hx3nLleavNbq4UbG64hjlI+M9EyQ3e4S0W1dk?=
 =?us-ascii?Q?adE0V6PkCA+5YhzcTsNpHn1HK2n6sFQCst4lWvjUm0y1j7VETCI/bVUNRrrG?=
 =?us-ascii?Q?NoZFjEXzsvEH4/c0NaFjl3UryKb84sdpBLI1DfiOlkKDKVcB9vrSEmWtBG6n?=
 =?us-ascii?Q?XBh3vjbtE3U1P511gL0C48zARMAh/XXfprXgrlRjvgGIWmndeuBG5pnLUNW6?=
 =?us-ascii?Q?UIc6rOIyN5JtjCCjxQuHPAE+3il5vC+XoC7z1dcwkaUaTn+AmeB8TY24jT01?=
 =?us-ascii?Q?4isSuY7Y975PGs7h9uxzeF2FxNu8Z0WhyQBF0u+BMYCnwPiP+8RC0PEEJZY7?=
 =?us-ascii?Q?numzwKGjMvPzhLTbXwBZmMDfu5+9hMczqQzUq769MqYIZC8dUZxV2iZpiCuu?=
 =?us-ascii?Q?tj8UrfDruyh4uShyKJPYibhwW4lCGykGSzQdqCQXGy2YH+Qu7QEEovTvu852?=
 =?us-ascii?Q?5Q18mZm7CFv/gBE51L8JlsDQxd/hmEjFimx1SOH1Twgu304L+P6LmdOSzCC2?=
 =?us-ascii?Q?5ZCLmbYWweyKLthzhcssOfQ13Ah7RaKe4lj/SXAPZRYGoOVRFYKoZ+pH10GI?=
 =?us-ascii?Q?isuOZMs3RN3S+wBYMDaC11VmY2F8TMboTs7Lv0lGjxMfw6KdyKnKunSLn3td?=
 =?us-ascii?Q?k3ViiXgj/biFhtAlQMQqibCSxZ2ShIQyRVtP+4gF6R2rrVtUW/IJG3Mtyww5?=
 =?us-ascii?Q?JDFufsf6aoVwjA938QNf/qxr0foh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KY/pAURqtkAbHyU8/6/QX67wCBHyCsNCiPkOjKQh+ovUEVW+Sk7NKHzdRsLS?=
 =?us-ascii?Q?6J7e808f+gIyEAOOOeJwLGbbyUToRqv4KTKLpbz7hGj4GrP3WCGd3gO5vv56?=
 =?us-ascii?Q?7a0zxJdNNO25wiM2JeGg1KavNMY3Hhla2NwzYYz6MVXu8hKPun4KnFCzYg3G?=
 =?us-ascii?Q?gN98ljiV8JcvN1Gr7M0hkujPg2QjdWXCS3CTgs85rJ4y5cCPT9TevYvuUrwl?=
 =?us-ascii?Q?v267iGRcQ6Bb5rBNyeueS8TzTfLht39mMXmqby4KozHkzmYCrkQonordH1X7?=
 =?us-ascii?Q?WEHe4Qj38KHKUAsqVbSRn70/CJEdNSlrou/goTTz4NO49W1ohjOtsiKmw24G?=
 =?us-ascii?Q?lJjiXO83/aqX5eYcU4rD8f9BSf+gEEBskO0ad7/3UvOlO45DbOUWuD3EjrfA?=
 =?us-ascii?Q?ncLRDdEpYS0we53ugm13RA3p+msHzpigFXkHo7Axfa+2FKY02J75yut+fykP?=
 =?us-ascii?Q?huNk6tYaDlTDIUpT6uIFVcjxPDsip96uXiZsPrYypEqtw7iRuhqKJ7lz+SY9?=
 =?us-ascii?Q?FLzLry3iMMMGDydilsqd8sTPffwlJdlbco4lNV2kVvR8A55TtFwucOA1ECQr?=
 =?us-ascii?Q?iBdKurgpeUAWxVS0UJdpqW+z6ChRXekIkwk7kDXS4E906r08i+QIxCPcEJ4U?=
 =?us-ascii?Q?r4Rm/Ow/su50IDYcaLQOsHKvtrgRB3hhRWbnrvv/IpvoqQVDN9E2DomlWo9G?=
 =?us-ascii?Q?Lnqmmw5+Vg2c9xPRRPBoDramzs8JNcXopsYlbAOC0liBy6HqHL88c0Ogj162?=
 =?us-ascii?Q?LnK2ciBeu7XNF5abq5m5P++tQHNsCpZWaR7wr3W9nq+vE02inMS7jb3pjJhs?=
 =?us-ascii?Q?1ggnr6CRZMPB1GCY31YBeGSnl/WNkMBcvucS+m4C3ZmN/cRjuNgoodu/RPY/?=
 =?us-ascii?Q?4uobX6PgctxvOVe77Zcu/59lhNVkqWz/eqidlZVCD8gbK3REA7CYGfHrym1u?=
 =?us-ascii?Q?qE9w3brQCr/CFPcuf0gqky+jp2894kyjpp4SWk/NYBspXbB+KUV7g5hC/d0r?=
 =?us-ascii?Q?aKHLh7iaTtyv8cfpJN8VOWNOkdYUOXh1hUH4hymAKMwlBDqWWaepO34FZBNV?=
 =?us-ascii?Q?7luvMo+vGfVcMw1hODzYBAR+OISgW1YfJocn82PQQcNITvyxm0ObEaPn5ZVQ?=
 =?us-ascii?Q?sl0lneL48Y6M9GpjPidODxfn4dhR77JUo20zyRPPqZ1fIlWWj9ihjr3EAo3q?=
 =?us-ascii?Q?kCkkpg1r8msqa+rSzMfTZqAgwfbXZw5KdsYNwc3/aEd6jJ6Ii9Eef9rRrx+0?=
 =?us-ascii?Q?LUQCe0d8pbsnAZAd1OEqjhPR+UutovlfuggRERMTtA0Fw53k1fxKBf1kKk0i?=
 =?us-ascii?Q?ENRRZrLbRmjdXS9Ds2zb67eCDQWOLDlcKVEoFN29uGjnwq6W1MiXP9YXwR8B?=
 =?us-ascii?Q?Cbifm3Aprgoikj4muXfdpPXGlCVZAyZ86jybFGX6HZhgPDQf3P2AscfBN+um?=
 =?us-ascii?Q?sbjy5uuY+w89F4i9wzxjuyO54l66y0phjC+JJnin/WfdgzsFSXyDRgbzZRM8?=
 =?us-ascii?Q?ooP1K9wNxpHkXB5r42G66ZlZGZo291pZC63AeWBeqRy6jsI7gfHXPow3dieW?=
 =?us-ascii?Q?0tTb3xN8B4Fu5cUhdChgct+dzR48QL0pDpvNx/Vv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ad2b65-6f72-4681-ba05-08dcfa424dea
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 06:56:26.3916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDz2Z6AMQzqQ7V9HOAdaxAZuc0NKu8F2PhNxz+3x/uP4e9sWdwDLyTrSxTXqY7H/MO5RdMUpaypB70yKBkKppw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8573
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_235628_189151_0B0514DD 
X-CRM114-Status: GOOD (  11.90  )
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

Since dbi2 and atu regs are added for i.MX8M PCIes. Fetch the dbi2 and
iATU base addresses from DT directly, and remove the useless codes.

Upsteam dts's have not enabled EP function. So no function broken for
old upsteam's dtb.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index bc8567677a67..462decd1d589 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1115,7 +1115,6 @@ static int imx_add_pcie_ep(struct imx_pcie *imx_pcie,
 			   struct platform_device *pdev)
 {
 	int ret;
-	unsigned int pcie_dbi2_offset;
 	struct dw_pcie_ep *ep;
 	struct dw_pcie *pci = imx_pcie->pci;
 	struct dw_pcie_rp *pp = &pci->pp;
@@ -1125,25 +1124,6 @@ static int imx_add_pcie_ep(struct imx_pcie *imx_pcie,
 	ep = &pci->ep;
 	ep->ops = &pcie_ep_ops;
 
-	switch (imx_pcie->drvdata->variant) {
-	case IMX8MQ_EP:
-	case IMX8MM_EP:
-	case IMX8MP_EP:
-		pcie_dbi2_offset = SZ_1M;
-		break;
-	default:
-		pcie_dbi2_offset = SZ_4K;
-		break;
-	}
-
-	pci->dbi_base2 = pci->dbi_base + pcie_dbi2_offset;
-
-	/*
-	 * FIXME: Ideally, dbi2 base address should come from DT. But since only IMX95 is defining
-	 * "dbi2" in DT, "dbi_base2" is set to NULL here for that platform alone so that the DWC
-	 * core code can fetch that from DT. But once all platform DTs were fixed, this and the
-	 * above "dbi_base2" setting should be removed.
-	 */
 	if (device_property_match_string(dev, "reg-names", "dbi2") >= 0)
 		pci->dbi_base2 = NULL;
 
-- 
2.37.1



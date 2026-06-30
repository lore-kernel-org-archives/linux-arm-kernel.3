Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13C6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRQhr7XE+LfuRm7NmaLPURqGRM+hh092xA6kFQQIHUw=; b=y1py7djrMCXLYKMBwS4NXJ2BtJ
	f0/EHlImdGvIRKUtr7Eh9TNe5HHKFOnBnhAWnWQpryj5krFYjCxf3SaTmjUyx+Em4S4/6250IT++C
	Une3/GVCtQmnhXFBo+YLIJg+tgT6JADkp5GOuK0n+cJBMxWIj/p2LgjAzpqzIg5DmHyInjVDn4F+M
	wyP9DXKKbyepKcTOWXcHKbOTDKpb9p/gY6BYCD7A9EfmtZTYlh40G9iaXdzfqBfxhzug1T/fIUBzN
	2Udz5DE9ePeNKinXvTj1cnAWcqt/XieQLhgIuj/x/bUJlABe5hk7YKCA1GWlUEyWuU6dWv5OxDziD
	SHTS4yBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVmO-0000000GfGk-3bsz;
	Tue, 30 Jun 2026 10:33:24 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVmM-0000000GfFv-1bKm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:33:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGCTY0OiPdbhN6v/HwSzFKQu3cmV6gSZZ4PIWuLjbR+vqhNn+zY3jZYsnV9Md1+4atMWhwIEtcP56c4GbBMq2aiTrga0lxgPSYIxr//GdA+g/1xsP0+DYyGQzzNgC5+isQgCxhWZwqTyjTCKdISy1j6sGBX3jmki1Ac8cGbaHlcpWUKNzlABhkVGENqKatULbu6V0PLQEotSP7Lq1GlfUVWpVYXCxHSvS+ONNy15HF7j2WYtYPLuMTdIsSJRfNuorqtIL0B1A7OWOnCIe7bRB1evNBoKQV8gBnb+E/1x1l/CJno1wmFWPKU9R5GSJ20ovAINQ1daYRqb+Dl7FAwA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRQhr7XE+LfuRm7NmaLPURqGRM+hh092xA6kFQQIHUw=;
 b=EPwzmc7bQtl4Pmr8JO1VI3KejIr1fHrTyg/Vqln9HUQaQvsilfoawKBI5ltCjnApXwQc9rE2w2LfBspb3uGwHit/xI2TgH8GyyAli39ghg0zBIEHvVL9WEer55//YDoX8WlYYJyyUxn5hjvfNezcardEXrXRS/pSIxQwu2yS3J4+P5m6UfqcT3cx09kFaOdcLMu46mX4pBDARaABKxMTeX/qd+VbQd1DAvnbe8C86z1CtCSBhWwH+AihLKXE5HDmx0BVD+GQDvSYPI+Khws6C9JTHDpQqarwsq/MNUD2i2J5AnRN5RH6cfzhty4JQIDePLLncrr9RzgOZ41jABQ3yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRQhr7XE+LfuRm7NmaLPURqGRM+hh092xA6kFQQIHUw=;
 b=IndR46igkTdlahqHyIaoKe51DcM/3pVVbln2tfa3+eWXTDjekQMCczBIH0V3jy8yyXd3alTfM+dT3Fyz9vH5KuecNA7fkvzHz2k4gRWTWBma2CXY0bfWd0fK9LN1qYx4wdQOYDacsN8Powrw9M5CB4WbMBas4jMp9xE6ZgJl4tQhrwzVBmoHrqLUHPJh1ujqYqTy4sML+tDwV8Rga9c6eM0Ug2lRbjeldNJ8kOFaprXYkgnsmRwv+z7PFakwxYC5gWdGvFh1FkvBVpFQklqUWMx5r4WxW270FUuX2H5IOy/0dZnzHRUzCt6Ml8BEteFJ/MRTng87+b/X8E2L2tvMCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 30 Jun
 2026 10:33:17 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 10:33:16 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH v3 2/4] arm64: dts: imx8mp-evk: add usb3_phy1 tuning properties
Date: Tue, 30 Jun 2026 18:36:27 +0800
Message-Id: <20260630103629.76604-2-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630103629.76604-1-xu.yang_2@oss.nxp.com>
References: <20260630103629.76604-1-xu.yang_2@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::8) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PAXPR04MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e10f936-006f-44bd-302b-08ded692fee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|23010399003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: TTzdkNJ/+hKvSTUq1sNPgD9yn213mrWL7ZmIC9CdgUMSLwZnj6u98gPuTpMl1XWUz1XIyrDhRD/n0Vi3gX3OqJAQBfWcsR8vDvAF1naC5bVIgHmr867N/bLG0T0rPtX9nXTMWA7kj2DoV4ZHJWZyyjgmxCptK4igLo7t5Udc9ZK8plcIuVyqfMydVUiXSJV8h4s+15Z9ZsczFRIPBrbPv3tamrRqj9i1fwXtErlvC0s/DJXjo0bqDsofbqQF4VtLrXajEwaQHNwwYMA30zcrunoHDvLyDoM3rHgYJxGAqmED85u0Lip2k23DOL6a/yOBdlPBwXU/xhK0DdUNyntGs4Bm1ISzoERv1/U8Y0j7CG6IeEtVcsWevqApVfO3ecozQGKKrJin4o8B/vzVcjasJqcDiKvg1s+NYuiEStG8NGUASltgfEo91Hf+30iuYTO4za/qWd0Y2SO4PdckXdmAL2HqRYtV51QrgvqLOBeDLQjPHqQP6jXYBnSWDKsM+/45ho5Imgmt2ATa4nKZ6lpNUsEJWG/tNEIcc2Na3PKOwWYqtlFgBGMEjso9a1GtqbwM23vB8EMjKXL9iiGRK0cicWnz0RNbG61l/rZWTV+nkj1caIMyBO5wCFdkRlDSHSMsPzpqBG7Q/s2A98bmMv+KhTsujJiGgUNNSyFaFCuk9JY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1o3/dIHtsRTFOVoPY8bBX3wO+WMQRC6CcYwjJR2/3N+ESsG5xqV8BSpupe4I?=
 =?us-ascii?Q?07eCTiNCCqghed1OVhXzj06tVeFDwfUfdYakXErKLnKQVHKgECddn0wqjRaj?=
 =?us-ascii?Q?iKOtI1XlN5/2Zq0U9WecpDxoj2q6BglqtQs3uW41/YhKUQCUcd6Z7fye9NAw?=
 =?us-ascii?Q?s26CjuyA1KDfvAOwLmXU1SHJ+6pMfpDVBc2xgpErCNJu+xolJHsZfe4yHWlr?=
 =?us-ascii?Q?DwEgAIkZQ5esCDFpJ9PHo75oMLWjLxHWgHTrdir03zonKGDsKE5iroYm00de?=
 =?us-ascii?Q?UbFa3UPtpUL6ScWBklonUO7vyyDLXTudJfi4NkZdaLRRAzn+lo/1cxPOf0Br?=
 =?us-ascii?Q?uuQWwkZoTBRXAk+/DYNa1YwMF6khq0Mk3HRspBMILDv9YRiCeE0DY3jR/pGP?=
 =?us-ascii?Q?vTFrPeaWeMW4xYsD/fZWrkcWtFeaBtgY5LjF8fgPIsI77vbNHv28dm/QSDOw?=
 =?us-ascii?Q?/AYFDJJUOHgHhSyO7iZzNPhrsTECEi3M6Rdo7fVkFUMgaM7sj9aXm+PfqM+D?=
 =?us-ascii?Q?h9aSth/HdrGabCfPxcWM+UoteggIYo7r1EmNus/SaeKXtbDFUp6VhitHiEZw?=
 =?us-ascii?Q?d0b8smrwXTwmIJ4FUxO+FyxgbyhQmC+VKe3bBeh4qyBDaBTC6JgAr/GoBJi4?=
 =?us-ascii?Q?7Ik24yQZwKd+PmsFAKW8Hn6Cpofs/lut5jYur3uW5y6sDU7D3EtshoQeVyqR?=
 =?us-ascii?Q?B83hbjOXz5ahdZRbQrdFj/2eI6igDXHFINFPv6Uj2cYmkWQ8xZFIC/mHTbPR?=
 =?us-ascii?Q?EFMKufBZifERadXxczlY1wwFpnjSzp9/coUM9sV5MEdfvhBPwRS7krMyCe+p?=
 =?us-ascii?Q?j4Vh24JTrYJr+IBRoXB4RKfOCTOB1aAqop7UwFcXpVse58CAagZKHe/MLafY?=
 =?us-ascii?Q?JDkNZJB+7zNb2vmcGFgr9kvnuXsnmK+q7cgNsvk8/FmlKl2fbPrD9/ipBU97?=
 =?us-ascii?Q?1WGkFrMVI5nHKvZVwYo3jiSopDJC5ur3WFPIciUF8HdhlkfvkFVFG8s2Xq3M?=
 =?us-ascii?Q?eb2s0QonYAvu5B+dO7S131Yl5Dm/qPvfL5FAARc4HdtbVwbuUh/wadc2JCoW?=
 =?us-ascii?Q?TRoBM+j+/BTzGu5b/XVVp8sIpS46yJDc39layqycUJFoOUJeSjOZH1ojRNBP?=
 =?us-ascii?Q?4aE64PVcUiyod64II4PPtpVqPsTDB4XESkc1LcPndQbP08yjdxmjw+XvkB3U?=
 =?us-ascii?Q?p1IGubyxyr3tdgrwgWlOWF0w/ZKTOTzabWt1Cl7+orXi4lApvAZ/k5OxdePz?=
 =?us-ascii?Q?MMmsxiHSADWB/yyw9TWjxdcytEPIOEIuEft5m2EZvnPN+eboKgeRYKgE3xeh?=
 =?us-ascii?Q?DpEyvGodjU8WNVYqmlzSu+PNIrQVWF1g+4xt1E+bC2N88R4x9jWmM2GkSP9Z?=
 =?us-ascii?Q?nh8STn+SuURr7EZ491vkIhU+iApBj1+Epljn8B6IQ3vU7SYxB5ioLI5kjwzP?=
 =?us-ascii?Q?FW3jkJ76UnDIBtRK327j2EBW3U5G9rmWUkZuuMnCp7kkKqi1UeSN07qAslq7?=
 =?us-ascii?Q?bxjFkiCH2JJVJSX1lbjn/cflh/U8YzmekhwK/7rgmZLDQs41wSTP0HhR8EIU?=
 =?us-ascii?Q?e9PEdcybT5fdniG4WZSPV8pKnHLeYd8/2+08y/d2UBqh882N8j+D70XD4G1i?=
 =?us-ascii?Q?mM2sTOyEUunrx3VGShqb8MruVxerrMNxNKITrupCs2i1JjurvWAOi/gVUc+h?=
 =?us-ascii?Q?wpsDP7LsXguJpQ7pfEc7j1FSH1uTiB99aexrPWVf/C3mL9jZH1NLPnRjbFCm?=
 =?us-ascii?Q?/p3FWXVz5UE+OntgaRAC0iqTVhlyrbTU+FU1Myj2d/z4EaYUzWoa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e10f936-006f-44bd-302b-08ded692fee6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 10:33:16.6622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDSFZiCk/vl5EcWAuZ+GrvQjGwEnHQr/6l/8N9No9NnhksAxTd4Fhxb9nV6rSppK5fB0/vuq62zKgf0Cc+8RXOziGAQMF4Cr2t35aJMJuLAv4D1eUy8WyY81SMI2nYvN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_033322_427944_88128799 
X-CRM114-Status: GOOD (  10.10  )
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

From: Xu Yang <xu.yang_2@nxp.com>

Add some tuning properties for usb3_phy1 to improve signal.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - no changes
Changes in v2:
 - new patch
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index c8f2ba5426ea..8f9b9a1b1686 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -914,6 +914,8 @@ usb3_data_hs: endpoint {
 };
 
 &usb3_phy1 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vref-tune-percent = <116>;
 	status = "okay";
 };
 
-- 
2.34.1



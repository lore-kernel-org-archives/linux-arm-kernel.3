Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26538CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 07:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eg5yZllPpN5fFEYV+ightTUOCImGS17VocglaHaXulc=; b=U48BfZrGLeb0Q2P6Vm7o25fUNx
	PLqnMjQkzrNW6HJN3MLv1uEK9bpkoJ4pILIl867w1gaYvhlgGzLJcvmrfv8y/jzsbVUEAOUrtmCY3
	ifBxg1oEUmXiP6/s1BsjqhFox5GTymS3LxeefRgl83Nr/Qf0qrk/lYtwklWAPCTL8SnmuI2IeOPUa
	01f/4sTP8Y18aCv4mBVBh3niGvPPlRRWMB4MSujc3X2rnukAjZkVU8qRecJzQkJACJdZ9tKHBzv+L
	r6Rd/FGaMynAB616mIRWmQY3h/qvLJrKOUneHgDByUCx7M93ZpT5z2aZEa+sjjs/eg4mZCh6JNDOf
	O+lTWIOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVH6-000000021is-3IeY;
	Fri, 19 Sep 2025 07:11:20 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVH5-000000021iJ-04mp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 07:11:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4tfSbGNzxlr7OxEvIO/tJ1TSbz0JtTq3tGfPtLl/KubbsRgvqpO6YK6kBloNoNiFDWK05e8EMgMZLOUP9VXfTuKqkOAW5jyM4Wt2jNevtqNqaOZcK3T3oeHcz5s3CHuOb90hh1FrOC2MGF6oK1oz0VkJSu3+vULD55ybuWYhPtoF5J/Yf3WVZe46IH52HcAQxEpe8/NTcg6BRKZytl/pYVUeuM3ajQBQYGOC+mLNscGBfxIVBZ14jcbc0QDnOKlVaekx7q24wCrTKmJma+ZHXruiJEVcVThSnCbkVqqS2pOFyJTM2Sg6WhOyvUvLkWtjOf3r4R3u4Ci91df2RrARg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eg5yZllPpN5fFEYV+ightTUOCImGS17VocglaHaXulc=;
 b=Jx+VA+Ffh/QIUDeGV6HjkLk1eIVJfRVYBbTqT+ow6EmH0VRtJCt3W9CZ/Fe0ExJl7ZPTeWz8HHpxYrxWCZqstDnsxfVtyC+XhuTrAvlNUR1JBdQ+EG3CDLb2Scjw/hzT8pMI0CohZn5JKkTMx3Nq76ICf/1wRc7rXUW0JYHkUygpVkh2wTCt8P9SqFmlZAv8/ByV4VDlIGQGGkjZp/sdYbBHcD+6EVrhDU15mkDgEHHBQLjev3yLAa+XkVfjfZuUPky8PgHxRmrOVvfb3WZQa6W8u+EE3a/eh+aPyjohghkaLUI0IZY/W3DZusGzl/tSjoAE2Zod2X/ubCyu9gTwWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eg5yZllPpN5fFEYV+ightTUOCImGS17VocglaHaXulc=;
 b=HHybXNBku4CQ+/7a0UZlfqxyCfZ9C7DbYtvfS1srb5MJgPvgpmZGxJqxac/LGjMHsxUt+kYC7ROcjBZVTnz8NAiy4dPdDMedGReN9JERA4qtwLK5HBqUquf+FCCrc0gzKBXhGWPEbJYxl82nO8CCR+HfLD0lYaGQRMY1ek99G5LWhA4EXzKMNScSCH8JsAVpeNIV8JFC4LFGxLCnyJFVHSVncl2pb2DwUlBttIociYlmH08fxmtU4M5MGRS1UBRLq0Pc/2xGb9NsLT92a7tS8HVgN4HY78AFk3hY5fRxSXeG2iVlYjH4tNGxFrZUyvEyA5Q1QTrL3ArusNW2lhvifg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA4PR04MB7998.eurprd04.prod.outlook.com (2603:10a6:102:c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 07:11:09 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 07:11:09 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.chen@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peng.fan@nxp.com,
	jun.li@nxp.com
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: usb: usbmisc-imx: add fsl,imx94-usbmisc compatible
Date: Fri, 19 Sep 2025 15:11:10 +0800
Message-Id: <20250919071111.2558628-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA4PR04MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: ab228c66-87d4-4a3b-c5f5-08ddf74bb563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|7416014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zNMLIAV2Kptf7Pz1ucFVfRa6fVJOCkVXR5XXcsOdjtkl/bXXsm9ZHKLKxgu+?=
 =?us-ascii?Q?R0PV2TvMd7r0JdDwcTi51WciDi0U2MwPCu86ksqJ2Ni581Flifeo8nik4UWq?=
 =?us-ascii?Q?z9VYRi+Z/eBl+zZfd6BwdXMM+EcaKneQet9205UjhYWNUsFz2zyQm/UoCLBo?=
 =?us-ascii?Q?tjqewhe8Kf4FzEBr9Edug8qlTmAdFNA7RYI5Jcwd1Q7eFKNnWf3FhT6hd5En?=
 =?us-ascii?Q?pbu98JwkMgO+SFngX4Kua60YhoeW8jX5UQNlkDdiovZ8JbXIGSuOieMYWDsA?=
 =?us-ascii?Q?Yf2RtYPGmCFyK55M8yP3n5gKN34Wc3Mf3+Bwvyl2HYWsu1HXXxgRmS/3ZwsW?=
 =?us-ascii?Q?9XI9oW/sp0uw/26W90QtJ7nmbDVunhPhxbCkJZlrd2ZcfqVzJQmDI4U/7bDU?=
 =?us-ascii?Q?cnW3ebXKLUsHttnAjvnpBYotNK50hgeoCBHavM72jTWt7wpzTaHF8U8mjRfu?=
 =?us-ascii?Q?WVmpvI0oN9G+hBmcIYDMb8EPw5awH70P+GRWQX6sgGeHB3/xGVma6jAGUYAM?=
 =?us-ascii?Q?d8lUrLFFeAaeQL38IQW1iJnzj0+2pwHGMlHmhT1AtfqlJnABf6YpUiLYhXgu?=
 =?us-ascii?Q?kEYJNjtMR3+uNfJpSAL8ZjG3s0iCFMmJpHpBUaCR4mLqg8FBuTpI4zEP+sEO?=
 =?us-ascii?Q?wIHvkAYxyHe6xoknr5ZJ538YB2qHaQfFcZ6QEY0t5Jaa0b7Wyv0uTluff+bm?=
 =?us-ascii?Q?eH+ZxCxz0DczAhnWaBhm/py0nEaVe5iahe6QZjyS2nmQMgT+1ECmvXZeBuE4?=
 =?us-ascii?Q?PncmFhNlOQZnnkrAnA+kNBHwzYOeFQiJ/qmmnfTSDDjSBgBf1p1O6bK+Hhc3?=
 =?us-ascii?Q?Uw5BkJgTqhjdzakRCDjgsMOefQ+r2zW+3ZbEhgQLhCDS3499tseFZSXnoqOO?=
 =?us-ascii?Q?f7M9+XnzGUzde2CJlr43FWWuH4ai0RvDr1sQqgSWAuw7RYdQ76S5TSo2s8xn?=
 =?us-ascii?Q?JSWjTpU0B5cznotVpQAkPs1IRHI/kUaBRcFFv87vMxfARZ6fFy+F8Z44OExQ?=
 =?us-ascii?Q?cs4Y4oqz8ktyNQ9v9TVF38kl/Swx3zdkH3r2VXg6KKVyiJEAwxzgDNbrlEz5?=
 =?us-ascii?Q?GN/MKZH3wyPxrxXKGBfDhoch8pXGE9fMhgLYMB5gq83MPMN0d5U7dyEmWgsN?=
 =?us-ascii?Q?rVm+rMjSrScJ2lCcuuego7vC8VaTAMI1gthmiLie5RX/Xt7GmhSiJ12rORvJ?=
 =?us-ascii?Q?9bRB/MvnFPM4IznpLcaTGyMGQmLX/4DBkOA8vNBpZXuYpV7g7YLLnVoeOigx?=
 =?us-ascii?Q?6qF7Ca/0FqCOJekKxwG4MD48WuTtgT6tUZ7xh+f70A+afsPVe3+/ofLjAw38?=
 =?us-ascii?Q?3aPWvD5zEqvjV7YaZqWE2ehjFyNXByxr/uMpS1bfnQzOe0Z1U5k2UKEademu?=
 =?us-ascii?Q?oAFlO8s6bgc3pNtmZtlMz3NNA7iV4ZmX0KYOwA7sApZLeTa9OrcX7X1DUYV5?=
 =?us-ascii?Q?ENMAHYRiRcxk2+qnB6DPPJeD/evkHfflq4VfQrnaWY6YiEx/mIbO1RSaovz1?=
 =?us-ascii?Q?AWYNV4qXv/wCVIE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(7416014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d1Ts5h1B4pq7qySFGWpYhmzd7VPH9hhTIyfN/p2ZonvOm+IbipI79UmI40vV?=
 =?us-ascii?Q?nE3kE8TsmjavSy78QkY+hZXMwL4yT6VBJTmlFcGCKQdPVqecWIW3R3nOG1Hu?=
 =?us-ascii?Q?I2Y9VAsLW8BmTDIkQU9AKOMzfybWH47xpXXqAIjO7sFhX+jKqNLcJVeqpYWx?=
 =?us-ascii?Q?C5Ywjq3pzhIfWHtT6OMQV2lrsekcw2ubR4pwgUwfcbODCyw9xX6+I49+6PjZ?=
 =?us-ascii?Q?dMhQlzAZXHnHpZNm8KmP85MygNYcUSRsE7roNt2JRnxOwlKlHsdpUxArth8i?=
 =?us-ascii?Q?COBD5BsnRctX3YahOs4IbG8uRSl8WiVjfP+07huP0nhZjomQ3ZqF3e3MluWc?=
 =?us-ascii?Q?+p1o9F4lXhkEFd8iJMD6tbZDIVs2CpezodbTqjSrrOhIeqooJip+rtyTFAYU?=
 =?us-ascii?Q?3DFbpaVehnU0dYF0FukEbv83v+tHIabRSyqky4xm9qxqdUoS6lcmRUGbMIZf?=
 =?us-ascii?Q?JA7iIi5EIBe3VB73VR9+H9IW8dq3FAV/aIld14p2f5eEySOEZ6ktc4yjFrGT?=
 =?us-ascii?Q?yqzRO9qYY1utZiUW/URCek07xLhFeDs4NoQ8LiuHTDJ00WloAtxqN+1tW6qJ?=
 =?us-ascii?Q?ZyUFNVSetjNmKG1g4vsDkWT53nDP8+7zTf2oizl05OVEnMMdSqpfpCsJGVjN?=
 =?us-ascii?Q?umXgTstGZfw+/YWzjnsX60lidMw9sd7CnSVMa5AcHQTL1PHQpPLmoZL3WHSw?=
 =?us-ascii?Q?paRh4EP61MxjizlubQ73XkND14zUCCbplPhwax5aECvjuwtEx4LxyqV1kSyK?=
 =?us-ascii?Q?1sR40edDyW246YFhri3xlJT7onM3J3u2pHH3v3LSac6ZsYh72Bg6S6M1CKZ0?=
 =?us-ascii?Q?peRDsoNbeFCvOjRy34zt6G5S1R0KEprcJueFvAmcVYKtNpSmed5UNtImXizm?=
 =?us-ascii?Q?wRtSR/pbj1mE3DrEFIUy4Hmey7IQ9cefAhtp/yQjIerNVApJXQ6z3XCbv3eF?=
 =?us-ascii?Q?5ilk2f8j7xyOBYyoW2pMu1ZgQkOZ1gRppdmTHHA5RhoB3TDPynrglXhmtErd?=
 =?us-ascii?Q?6QauqK5R38o2CPm86NNHxPFso23tQBxEYuBK92TmpdpS7Be+qdBiZC0ZBXGy?=
 =?us-ascii?Q?hJ9LZMr8KUQixunCqG7eUGPU/89F/p1pL1/MluMAd+A1DLE6W+RQ1W3G4srj?=
 =?us-ascii?Q?xmcaZiv+QnTxSoxhCGMGQ7EYMjxI/x5NYThEURiJYuUPgl5OjZqj2/yfrlf0?=
 =?us-ascii?Q?33T0KzQ2CJ9jZbVwByeXMVsGZn4Zh2rxPEuJADRf2ZBaHuwJIQKAFSGtUPHz?=
 =?us-ascii?Q?9kR6C/+q4mQxytTcCAv83Y4jcTa8MRCUq+lPqZ0TIAA8wZwmJhL6zT8efmJF?=
 =?us-ascii?Q?hD8ccAzxpFRau6D7gJxTOUk2dRGdP9ZcbP8rgM+Z1jEusCXrx92c/UyKKYBS?=
 =?us-ascii?Q?2kfy/K5EPW8xjh2j7SK+CVzK73ZAt3xLwR7ntJga3jT2WyiPo2i/LD39UF1l?=
 =?us-ascii?Q?mbbwDDuITuKBFXiVsDewvh8rH0KyfdxIkB+GhA+ZEBKsyd96cypkI3p8PWi5?=
 =?us-ascii?Q?F80xVbXEc4RPu3EF2tr7pveW5RhVuhQlbPafw3jJXBrUz+C04P4+wwzrJ4yE?=
 =?us-ascii?Q?yGDPub2VGJKat17JyGKHu8ppBdzeeop7cr8cZCRy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab228c66-87d4-4a3b-c5f5-08ddf74bb563
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 07:11:09.7809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2drVZJWCKIMxssBnRS/pyi5SfvxN8HEVlHIRiI/6iR5dLyrZxvCsFmUQ0yazs8nqA820IHKJ3p9U5YgYZYcpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7998
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_001119_058933_065EF27D 
X-CRM114-Status: UNSURE (   8.85  )
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

Add "fsl,imx94-usbmisc" compatible.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
index ca677d1a8274..d06efe4dbb3b 100644
--- a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
@@ -36,6 +36,7 @@ properties:
               - fsl,imx8mm-usbmisc
               - fsl,imx8mn-usbmisc
               - fsl,imx8ulp-usbmisc
+              - fsl,imx94-usbmisc
               - fsl,imx95-usbmisc
           - const: fsl,imx7d-usbmisc
           - const: fsl,imx6q-usbmisc
-- 
2.34.1



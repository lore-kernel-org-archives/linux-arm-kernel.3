Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E6BD78775
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 13:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2Nheuyov1UJxN2l+RxmCg7ItFrMZFIywhc1Cdm+BNc=; b=IUFiNzGhIjnv2Khn89cyBOHH2q
	3fC3pGZ27FL1Kev6SvVKLPjTF/g/dwi27ClV9ud5AJO198864rNvcYYQMNsE4BQsqctFcDBQsvIAE
	drO9vnPHJYbCclvC5qd3/GvI2UE53uyRI700ylPd07JF9MpUHlstzimneOmnid9ADXyles8/06N2n
	rQtdHMi9neDG8WlRkL0L5bUO61S2OHRo3w1YbX4KCcCJc3StPnGfi+xGT60XILYOTnVQxqAyFSzOo
	n4VuxlohIHBhelNmir9yD//KCPSpXCkWvg9PV2ecs4PxPRmCt9zfyxIUNob3HRokaXui0GJBbrpZn
	JIfZnyoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWaeS-0000000AM91-0N8b;
	Fri, 19 Dec 2025 13:36:12 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWaeL-0000000AM70-12pR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 13:36:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPOEAgdZ0XLg8BR/SBV1g6G+F4afInXbvbz6Fi3mWkuj7ialZfYYAooGqMJ1tjcDk0y/IQUfXkGK2t8ReI9NkkijpxYKjJPuZejug96HEQ/GKwTR5Zlcnvg4Iqf+hhln7Ha8UJ5x8fxNhZm7Q125FZJmkiqhp2ZUvIRL/THa1mGC9jIEtU6VsR637weBuYWXTTuWE6TavNCvwxzmKkJ9sDsXuqFyBSRwP0minrrjJstdxIN13hhOj3k4UPkSIH5rjeXcNYvrU7YTUWLOqUQCffpskYgsza78TjiCtLbccHm2DDZ0xbNGokTGFvdaauW6Y7slMohW1w1n5n+/sabFjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2Nheuyov1UJxN2l+RxmCg7ItFrMZFIywhc1Cdm+BNc=;
 b=RHOGZXZqgk1l2HAgE+ilem5NUo1+zvco/u4lt4WlPGcy7EBvaMyMTm/LkedVljdCiFh4QcgRxR8eudEExb7zeK2kN+QqGjt5w6GY0HrDaMRgMkSHPCOKfqh4XBy3H+CE6QfOotd3IAQ3YfGbzgXno1WnVCGGLLp3e8dyT3nOvvuRNkXsRXfEspiF9L1HzC2bkn6yneoL5QpWMsTOIZexfMqtRfm4j0K6I6KfUD16gjmScGtXyFnFaIEzJzqR0eiJ66cd1G6GXLGA03X4sBu1c951qtpWbbPgDvDZ7RcsZWid4zaVcWjSTw7JB9H0ofzrFofbboJLyOJPyEoWCGTukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS7PR01CA0233.jpnprd01.prod.outlook.com (2603:1096:604:25d::11)
 by OSQPR06MB7132.apcprd06.prod.outlook.com (2603:1096:604:296::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 13:35:56 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:604:25d:cafe::10) by OS7PR01CA0233.outlook.office365.com
 (2603:1096:604:25d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 13:35:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 13:35:54 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E5FED4143A8D;
	Fri, 19 Dec 2025 21:35:53 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: cix: add OrangePi 6 Plus board
Date: Fri, 19 Dec 2025 21:35:52 +0800
Message-ID: <20251219133553.1440970-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251219133553.1440970-1-gary.yang@cixtech.com>
References: <20251219133553.1440970-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|OSQPR06MB7132:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3538658a-a413-48ff-97b1-08de3f038959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NzcGxCUyTC2HdIfoNBTYe24BgkTCFS6XjDGlMZ38DIXM5rOuwVaD6aIZFgrt?=
 =?us-ascii?Q?aow2K/0wqhqx/XDgzkRn9qVn9FNVVS55TGMk2FwNR2dQt2SmUIw3qqsCHo/G?=
 =?us-ascii?Q?V3o08Y8wEYNXv7THRLBl73HSjpVsgd1mosTl1QXOeNNsfsRWowL2uBkoa7Yi?=
 =?us-ascii?Q?v9E6Kh8YHMBkr492bo9IJVYJD2EgUY7Jrvrp43wxV3mSRHFl++wZoHDL9+zm?=
 =?us-ascii?Q?i1PC78qmyqEGclYRSIEiilXx+qxwk2EXMcw8DDwMdAtvzeatDU6Mhpv1bBwY?=
 =?us-ascii?Q?og2DUTUtW2Bmw18NK7ZaCsFs5GzXPg8iwXWlWXexX20oxql8M7601QRvwJh8?=
 =?us-ascii?Q?G/AbfJMO7fk0vw+uL1RkwYRCdblo8r8N8GEKQ9EEJ7jwcEMJAVMzPlgtVZFy?=
 =?us-ascii?Q?7G5mFU3EX8QCv/k4miiPcwfnKX5XDPjz2s9CqFwTI6Ekve+8eCYO95CCbuYh?=
 =?us-ascii?Q?fzdnVuorGA01C3VqploVh28L9y6bYEAkGK3K5AUi/xBzie1WDO8A/jXEgAep?=
 =?us-ascii?Q?pmdo2mOWxsMeCJ1xoD1mE2PoGMShdtD94Kxu74kBT0L6jUZQ80aBmisK9xXt?=
 =?us-ascii?Q?szd8+Lj+Dxk0m/hd1YuA/FgrkG0Edx8EZaaCXDohYDk6JR4tY2yr8eW3/NqD?=
 =?us-ascii?Q?v2W7bvuZRl1/kuEs1SLbVXrbLt1tjo9G+E18Y1KFZiLBkY71pRxLjKjRjscH?=
 =?us-ascii?Q?Us+ZBf5sbHEUSGeCmmC0jVBb9sYzRWpyuwNwlS4veGxrgYTbJlOaF+oJscVJ?=
 =?us-ascii?Q?dcIcbBZuHuF40YlY1kkJALZ68sgjF+oxd8U70Uf1IFbYZK9lyqt4sWtIiRZU?=
 =?us-ascii?Q?9pShOS3uDa02F/ZyFGxwaIM5e2430fAKhTk9RwAP6PhAzSdwdE/KSPJItnav?=
 =?us-ascii?Q?MYMhXiReXmxWMpofd5RTbRqRJtooVopEga8GwOq+vLqgR4gxAHO80ybUVXX4?=
 =?us-ascii?Q?z584HSPuzUzncrPhMQ36WOMyYwA2vTSwcDuOup8+pVSRhki1xgzGcapkaLgf?=
 =?us-ascii?Q?xcKrACg2GaSR011lhQ2bTVMVRlkwILhhZ2dDEOALy45d1iV9KEsSuYYdNw9R?=
 =?us-ascii?Q?GoHhA8juA62AJsHvWOFMpTIsQowLREd3RQPSCiSp102VKSoTDiy5f2PEdBBj?=
 =?us-ascii?Q?68S4v47sWLC8ih2wUQgFqGnwOx31YNtbhDINgpp7dkVqAZfo3OwfaAWNy8De?=
 =?us-ascii?Q?spmxHqmmk/rvlPwIwn1IS5LjZnaTSzrHaGasL/Nh/RlEmxWYCvc34zc2HlQL?=
 =?us-ascii?Q?HOSrp1GeBsEDjCOm/eAqHNBhQfHylHI/pullixVlRorePUZUxULkVm06/HWp?=
 =?us-ascii?Q?3MUdSX6GiwBnYjtZXRqOmzcLablfUjMATQKuu449sGBld09NpK4VKXSVfCyQ?=
 =?us-ascii?Q?1BrkJ0ID6NxCXbUrX5pLrNhMPQ3Ymeptf4+CVllQTGl/lVWi52tFFLw1dr4F?=
 =?us-ascii?Q?bUtEloLsBBytXkLUYpG1TBm63Opone4BSTRQt/fWGCio2V11fNisiXltuAJm?=
 =?us-ascii?Q?ostjqcFCr6lGBhE1x+TvuWknbqzbwEk6OGhgS0Rpce1D+ZCTTONe2f/Frg8h?=
 =?us-ascii?Q?9jR3r6GJmk7WGMV8PrI=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 13:35:54.9674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3538658a-a413-48ff-97b1-08de3f038959
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_053605_287929_F46CAC95 
X-CRM114-Status: UNSURE (   8.80  )
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

OrangePi 6 Plus adopts CIX CD8180/CD8160 SoC,
built-in 12-core 64-bit processor + NPU processor,
integrated graphics processor, equipped with 16GB/32GB/64GB
LPDDR5, and provides two M.2 KEY-M interfaces 2280 for NVMe SSD,
as well as SPI FLASH and TF slots to meet the needs of fast
read/write and high-capacity storage;

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 Documentation/devicetree/bindings/arm/cix.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cix.yaml b/Documentation/devicetree/bindings/arm/cix.yaml
index 114dab4bc4d2..e2cc0bb8b908 100644
--- a/Documentation/devicetree/bindings/arm/cix.yaml
+++ b/Documentation/devicetree/bindings/arm/cix.yaml
@@ -18,7 +18,9 @@ properties:
 
       - description: Radxa Orion O6
         items:
-          - const: radxa,orion-o6
+          - enum:
+              - radxa,orion-o6
+              - xunlong,orangepi-6-plus
           - const: cix,sky1
 
 additionalProperties: true
-- 
2.49.0



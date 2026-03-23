Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9594EC01D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 11:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vV532aEbVbKjSBZ8fOcIUS5jUDl3wqrJOvveGpsT9Do=; b=IFbC6qEKWs/o06r/tBtx0g2mAH
	UkAX+ZMbhBCFd8HEhxsS/uWbb6fwW77Cl/j0/p2W1wMkXp6wdCRY+1Hv6DwyA7icC/+jz+aywvGXS
	OpglXycKK/EJYGBbJ9zf+hz4yA7OHHN5ssuD8KOI3k9WjFzbjuJQk/rlKmkntnKtaKBnnJOsH1D8d
	ym8ngM1ZhPm5Df0IWPB/jxqnP88OH++7tVkQSAfXocTSVxtuHxMM4cFPGk6zxefbONTD1+WsrszEb
	x/MIWoZTNddlrzDqm72DbAzAjseWPLaZxtOgeNQ3bgOlVmw1RcMdBoCPQ3M8DaRfOKp0mBhYhlI4A
	qOv98v5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dls-0000000GeAJ-3UVf;
	Mon, 23 Mar 2026 11:48:36 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dlq-0000000Ge99-1o3t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 11:48:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2B69WFQlf46Mgk+wju5E1kFLBpSaOoZX+WHmO/C6bvinZZ7FAaVlYpjAe/QHAjBFV/V+GR3nY57x1fKDG4bs700GwIxlXx4YzleAWkUpOgpHxOXnIpQwFf03ZeljM7azqGXjTDA3nLh/BqZSTFfThHVoYWwwOz1pDwQG8FGVxqsrLvY2StZrxkLDaq29mtiSJBzC4/3rnn5RNJ6bUpN5/+4f/f7vcEWMELJUOEmiIquM5Bojt+rVuRn4Yf5ruihvdZ5HXFBqB+gaB5AhcvgerDOZvodXKJQSi8EuXAVcHAATCWkj/Tnlv5sp2quE7xxGnzFs73DrXcUkpIsSzUPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vV532aEbVbKjSBZ8fOcIUS5jUDl3wqrJOvveGpsT9Do=;
 b=Kn0anWcCxBBPDlr3QrW/vJUd97/wvLx91+czif+3ZIuSzX/ssOsMwk+9SWArP+bWQDNpAK+O61VKQfZi2QGmb/9NA5LX/bWRf4P0ZLshDW1tP9zCXF5ruzJw6Kh2lQyxWkigD+5YjbRjcnV9KuuqAE10QU0PYo1frP8mG2sJ2e/acj/7/BCBiXVy57mw1+yzxao9+a5oyS7PSFXKPCljJZJts2LWDD9FRfTRBmNn39tC80D86/9BqBLA67qAEFDAIw0wBCS594LuzucoVnOly5FP+muB3XwB7eRk4dOKm0kA48EOePtxjPBunsMiviSmEqMmSWOtS11LFtlXGKwOHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4P286CA0134.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:37f::6)
 by TY2PPF7E205D1F6.apcprd06.prod.outlook.com (2603:1096:408::799) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Mon, 23 Mar
 2026 11:48:25 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:405:37f:cafe::ab) by TY4P286CA0134.outlook.office365.com
 (2603:1096:405:37f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 11:48:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 11:48:25 +0000
Received: from guoo-System-Product-Name.. (unknown [172.20.64.188])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 397204126F88;
	Mon, 23 Mar 2026 19:48:23 +0800 (CST)
From: Jun Guo <jun.guo@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	robin.murphy@arm.com,
	Frank.Li@kernel.org
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	Jun Guo <jun.guo@cixtech.com>
Subject: [PATCH v4 1/3] dt-bindings: dma: arm-dma350: document generic and combined IRQ topologies
Date: Mon, 23 Mar 2026 19:48:20 +0800
Message-Id: <20260323114822.1925869-2-jun.guo@cixtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323114822.1925869-1-jun.guo@cixtech.com>
References: <20260323114822.1925869-1-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|TY2PPF7E205D1F6:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 158d76f5-c817-4f4d-6a3b-08de88d217ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|82310400026|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: +4vQmSNEUsJpwjQkVw/da556zt7xu3bAylvwb9SV4ch34XKXATKkPudvLmJf0agaK+F4YlvIEXdDnBCRTTmBmG28O/gBDAzz4D+MieUNRNdK6OfcFi2m0Zcz3oeQwBp6Q/AbAAMzFCVof06bxjZBVmW8zrThSu6gMT9AN+QOoiwIi+xCxdiQlp8sV+uQrKOmAdUnnqU1EUzRztR5NYemEZGnp2CdrNCHuizEG5H+IAtPs62uUt4OpXfsN1NR4cIjC8C5qKKTbd+LZJ8NPZgpk8W1pYv7jGhu/9Xs8xwjNtyonbgFapqwifyejgqS6tutOg7C7xfFNYUYEee8mhJwBYIT226LuKxjGco7KflDEguw6musNUtOtAQRkLQhbd1gzh4Wdk3hThYlMrwCGFCMBenLVkxNehNiFYCO8y2PTLCCb3WxMSBifYOHKTxV1cNkc0NyJujpPcT/qZmx2t7AOsoEV/xAM31BFhuL8eI5eLM7oy4c/s6ivci/TSGKqmRHBlshqbDG98cORHV27WRYeYYyT73GyvYKMvRn8fg+JRZUnLwHfObEB5M4yQ4FmJ4K8rxtoisti727QrtZFRvZiqVIM5n5/bKRVjpUV27Fdp22eBYBsWMtYM2PV6G/YN5gPx8U9+0F4qUionS56kSSJlQlxlQMXmXvfqA2OVClvhbm6vfEVfPQn4I0ipfyQXqwlKmc0g72jJ3PvrnK13oV5OHr1xMAR7xUr32femJ5y4dT++ZUGBesmsI+8GtdwAFw/PRR2ZBr9s4zt4KHwAfRtUep2/oJ1nVtOQv88WqbSUTcFEdSXnOX1UW9SuYmyFbH
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lzsl7ugjDZ293ozU2gm8WHR7aXgNip/RKR47Ep489oFvv6IkiAe6f2+JI1fwJ14bmXqX9qOIA5f6ZeedpJmj/ZGLdINz2ocmvzp0e7NOukjWfzE/pgUoxzNEEf3aFjewsk3Q02GxFag6GsfD2btN1dzde/uWbwPhEpXPGysjUes25aTamIrPP19iE68C1+AqY3lll8jPPmucSDHxrnDpyCqeZomMtNNscjQMuQNUFAsqSAohn5za9KEeEA8lUmj4m7ipwwz/Rq3Nd5sKDmNKhdfD7gJw7bJM0KdPXfyz4bS5f7qen8H2KUOhYupkK89ZdAqaShdfA9E4jeqP/tsUp94bP9BwTwdshcXWgdmyf15Tie0iMj1nmLFInLJcrJ8eH7aFKTGfP0LiJMlSsrjRlcwkmt06d8Gnevho/khSItEOVzUQpPXcxm7CcxgkL6eb
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:48:25.2284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 158d76f5-c817-4f4d-6a3b-08de88d217ac
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF7E205D1F6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_044834_489558_261D3084 
X-CRM114-Status: UNSURE (   8.81  )
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

Update the DMA-350 DT binding to match the current driver behavior.

Allow both:
- "arm,dma-350" as the generic compatible, and
- "cix,sky1-dma-350", "arm,dma-350" for SoC-specific fallback usage.

Also document interrupt topology variants supported by hardware
integration:
- one combined interrupt for all channels, or
- one interrupt per channel (up to 8 channels).

Assisted-by: Cursor: GPT-5.3-Codex
Signed-off-by: Jun Guo <jun.guo@cixtech.com>
---
 .../devicetree/bindings/dma/arm,dma-350.yaml  | 34 +++++++++++++------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
index 429f682f15d8..47091614d1b4 100644
--- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
+++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
@@ -14,7 +14,14 @@ allOf:
 
 properties:
   compatible:
-    const: arm,dma-350
+    description:
+      Use "arm,dma-350" for generic integration. A SoC-specific
+      compatible may be listed first, followed by "arm,dma-350".
+    oneOf:
+      - const: arm,dma-350
+      - items:
+          - const: cix,sky1-dma-350
+          - const: arm,dma-350
 
   reg:
     items:
@@ -22,15 +29,22 @@ properties:
 
   interrupts:
     minItems: 1
-    items:
-      - description: Channel 0 interrupt
-      - description: Channel 1 interrupt
-      - description: Channel 2 interrupt
-      - description: Channel 3 interrupt
-      - description: Channel 4 interrupt
-      - description: Channel 5 interrupt
-      - description: Channel 6 interrupt
-      - description: Channel 7 interrupt
+    maxItems: 8
+    description:
+      Either one interrupt per channel (8 interrupts), or one
+      combined interrupt for all channels.
+    oneOf:
+      - items:
+          - description: Channel 0 interrupt
+          - description: Channel 1 interrupt
+          - description: Channel 2 interrupt
+          - description: Channel 3 interrupt
+          - description: Channel 4 interrupt
+          - description: Channel 5 interrupt
+          - description: Channel 6 interrupt
+          - description: Channel 7 interrupt
+      - items:
+          - description: Combined interrupt shared by all channels
 
   "#dma-cells":
     const: 1
-- 
2.34.1



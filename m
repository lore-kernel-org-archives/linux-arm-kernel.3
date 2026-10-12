Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42ED2CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 08:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIlMjABXgiilk3WWOEXcrB2Go1BqjTrVY9FMELs0DsI=; b=SP+tcbTs1oMzjg3P2lt48SZzHs
	TXyf4baxmek/dXlyMd533prEeVMXTgR51xuJetut1VQn8jcATwob4xSaPcUsiC6QM9MsjExT4JrZK
	Hx3Imz3ra1J2/tq0bUw6G0Q+hUDBeGZOu7SaML+szlGc3IKVwZSZD6pTmn6GBIOYuPMTGcOmKu15U
	1U1Yn8po7lVtZQBZVCtW2CMjL4J/2vLYhKt07KbFs4sE7XOieL0DjYq/+xYJrCwL9OEKqXh4CBkPW
	0/jwpZLs0ppsKEJclcukVQMArXQx/mqSYjSB4DTcJM8gO4/yIXw+NzMkJb1U32WTPZAODLcCVbWHb
	Ks7gt4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBbp-00000009xoi-0W9I;
	Mon, 12 Oct 2026 08:42:13 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBbm-00000009xmP-2fCN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 08:42:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ay9+cZW5tqkX235EaxcADeZNA5q41PEqLws6/6cSvxf7lPW5aPo9o4ETRBib+E1+5cgxwJ7zW6GGoDSw1xgVOUn1fUxbFvprUVQfw2j4fbiUrVyUNdD1r4DmTt36yFe4Nxrxx7BGHs8/9VGjgMhZKXStkdTNpWaUdeOLUzitb4zZSJYVzIZcFAv1cUXw6dl4GYHZaXRuKqOEm0bvb6DqPFk/b9X/PTHvzyPL+GUQXgzTZeTMsCaqyr2GiDz6h7lkgBuvWWLgSs/YhVXC90xiG1IYR/9cUotkL0pxK2Svy6pgp20KcNg7urMPvsbe0n1lrKic9qMcKd4F6HVDYFXByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIlMjABXgiilk3WWOEXcrB2Go1BqjTrVY9FMELs0DsI=;
 b=oWAPCjQAGd9DgRKUtTyUjkmVBSlv0zKRDcrvksLJYaUyN0EsBNGJR14qMg3mwsxXrE9UBYT1mjH0A8cDq2HBf5dt212gHFYGfey/uDDtYxm1l56PKGtFlEz9bp0GFIm5aMJ1putAZ2nR5+DQuoM9k93UqEPzNZ/JDQ/QEGi3ocwAuDmgmrv+9GwEVDf4CuS3DlsSi1bg0I2uFiZqPULZK1YduX0W8U1jDCzRg4Eriz7OEUrrH4hAjoialKVG/iEi9JVhnU7p8uTo/HXalaIesUxA55JR8t6KvDG/XRYP1CpEOmREX09xYTRld4kmvQJvl5YnexFUGg6BXLuPQahqZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0146.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:31b::11)
 by JH0PR06MB7149.apcprd06.prod.outlook.com (2603:1096:990:8f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 08:42:00 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:400:31b:cafe::90) by TYCP286CA0146.outlook.office365.com
 (2603:1096:400:31b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon,
 12 Oct 2026 08:41:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 08:41:58 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C841C427E3B0;
	Mon, 12 Oct 2026 16:41:57 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v3 4/6] dt-bindings: dma: arm,dma-350: Document the CIX Sky1 integration
Date: Mon, 12 Oct 2026 16:41:53 +0800
Message-ID: <20261012084155.2547480-5-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
References: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|JH0PR06MB7149:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ef6750a1-f012-4c42-ceca-08df283cae04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|82310400026|36860700016|56012099006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: kSOtRhjqT4h8Ofoh2HdyJetbxUF/V4K5O34JeHHrf3TktMZtuhRV8pVd+e4U40HSmycSI1KRk14eJkIFvZ3u8RKjXNUG9CmwkXcDvEdOBJmKtp//h705H9ElSAtm0i9SKV3jQPRSPinwRoaLmVXrHFjhHEfGiZicrUrkivomdQJBPqRe9THb3U8v7VvfvEMjg4YMS5FtHHMGvAiRy/EFMKlKEw0XVqni11fPCiOXb4WWn1OsDer+DzVZnxCtME/dW/dP0HQVXqycds8uRzrhqcTM8Xf/gMxCD8D/fEMUlglYp6ZqAwERBxgUykvcFW5VGafS4HuMtd0axfXm3IHDJ0MC1SwkoV5aWQm8mZKwJ7pI5mWjeF3ObiFXDy5LqvvjaI4iQ+qcnwslQuRYk3Z2k9akKK4hsbIKmTfT27PodT894qkR3ix9wC2cZsoQ3WiLq/bXUz9logh6dwnNc2rF2uq+U8f/hgyRns3nw6LIh9hoiucn15zpV8gn2EzY31bEce4VXH2FRS+Hmk4MRkkrEiaXmB+eRXLgc5gWOoZPBKfTpaM9IxcpXZnkmLLfmtwl1tUrjkvEF3+W2k28YyxyAJ+5ZEVf7f1eyeXASgtPlAjWlI/etctjfDefKgHy0J628KvFpocJzpMbx5MxlZ8qgIVEULV4sPwy3CvYKdH9NZmAYn5zTz6OcfkT5Xu0viw/Pp1mo84K8WzM3gTpLTRPEw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(82310400026)(36860700016)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NaWz9WPe+wCLfN9fPEWUfa4oHwmI4a9GjWdirrgmbR1BxY7KFEbqEBDCq0unu7C+dszBZREyG7FuwWFwPVn8q9lLWLP2cnntvD0rncvoWLByU5HFJjEGqmF1IH1jEg642jzLkWib/UdrRFTZYPSZE4gwYqdaTKun9COg92s4mNTkSR/A+gliSPBuJQ3h20oZt/QazAmb5e0BBDd5kQ6kT0W9ALXQ+uebwh2G3bavyb8ZRUrmZHk2+IiHn1wlSujqYLbsqvVBCe665njiK/I98s/eJW7SVz3a5yOSY6SdD5s/GiCW+lMtaBfeHVHwt4Zrtpt0OKkKlYoYmfW+svQRiQAH+ahWu+RRa8k/3fgxBO2peXVwtcDcFNlnvrTO95KwcEu9LvWWaTuorf2fIq8PWW8Zm5PvlTQ9fbQi3g93D1MucYqgEOcz9009bwuaAS01
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:41:58.9970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6750a1-f012-4c42-ceca-08df283cae04
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_014210_673369_B2EEE266 
X-CRM114-Status: GOOD (  11.82  )
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

The CIX Sky1 DMA-350 integration is the same device with SoC glue around
it, so it is described by the arm,dma-350 node itself with an additional
"cix,sky1-dma350" compatible rather than by a separate wrapper node.

Extend the binding with the CIX compatible and the resources the
integration needs: a clock, which the CIX variant requires, an optional
reset, and an optional reserved memory region used when the controller
cannot reach all of system memory.

v2 -> v3:
- Drop the cix,irq-router property and its conditional: the Sky1
  interrupt gate it described is set up by the boot firmware and is not
  configured by Linux, so no property describes it.
- The CIX compatible now requires a clock.

Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 .../devicetree/bindings/dma/arm,dma-350.yaml  | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
index 429f682f15d8..4e0f9ffb0039 100644
--- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
+++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
@@ -11,10 +11,22 @@ maintainers:
 
 allOf:
   - $ref: dma-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: cix,sky1-dma350
+    then:
+      required:
+        - clocks
 
 properties:
   compatible:
-    const: arm,dma-350
+    oneOf:
+      - const: arm,dma-350
+      - items:
+          - const: cix,sky1-dma350
+          - const: arm,dma-350
 
   reg:
     items:
@@ -36,6 +48,18 @@ properties:
     const: 1
     description: The cell is the trigger input number
 
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+    description:
+      Reserved memory region used for DMA allocations when the controller
+      cannot reach all of system memory.
+
 required:
   - compatible
   - reg
-- 
2.54.0



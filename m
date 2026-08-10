Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA4EC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 10:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgo++gapbyKAN7efsozfVy6LXp+Nson+cUklixs29fk=; b=hDGsNS1g5JUgd5+6fxPSglI7VV
	G13LUmPF4CZRffedNw7q7iGbCAf3Tgy3wikVubG37o2jxRsbnEhSN9L3LPZQWEQKuM0z1EMoRk1pu
	aPtenu8f9rzkQM8IqnAXenTrn5RODJnUGJiLebtSljs9zmPPMKegObV+kX1+whVv8WATTGBfV8PJL
	kZAkFEy99uKh488zA9OvMbDOkzR4hchZOBxPZMOIWU+YSvEkjKLTluCgvjAQ5BOGnNOrGwlal1neq
	SPXuxn5XPqUvZUEC0zrUvPAXWrmPZbvtpYhV+JUXnffROPt+IzRvfPWUFthIpEyIo1yfeNiOze9Vb
	ROYGvO9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMyZ-0000000BSqz-41bJ;
	Mon, 10 Aug 2026 10:11:23 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMyU-0000000BSnm-06S6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 10:11:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YANa15ZCNrsyd51R79k9srcHtZBLhsHq2bkUN1FzsDKrgeNu1jxYFdNUVf4uSTitZYWzhYhHo/rsmdcsi9Hkwer+U6tNT1FJBV03LdjHaZPZC2pKn8jmcltCPWnlAf3JpeERfdAEjsalfmHHobHNuE8itjWeaAT3L3QOhpixC9TpoLfylBtikuPZF1Nx+WzhR/PBBesnHZKs5Hv4ta6bjos2JF8GS2cPl+OxkOMO8judFk7V/nbjzmdwt6CDWRWBfMzLJobIwRSf77Dh6iOoCIGTJJgIHrKxBpfDqD3F8RIH0Kt1kqGAVjcUWXSraqgt0WRLYlhYFDM1zbLCSrp1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgo++gapbyKAN7efsozfVy6LXp+Nson+cUklixs29fk=;
 b=TPSxC8B7OvD/cIS3ZS7lygTYtXm1IkWqS+lEiHWfYjsRW5PckvF44Po3dd7K/NN3E/8KFJp6Cg2gEbP6DhVctedHY6FnfkMq0AnVSS61R1w3SqgeA8rInIIWS04wXqFVhNz5i2ylgBPxRUeOdOws7g4Hb27tzaiuxyOAD0d4Z69l/Hh5+pGXzWQfSsLsM/N43bUamQC4Vu0V2FSQk95tBDcMc4vj/wIoRgi8RttQ6IfWPaxF2YZFVRxIbXvMzFt9NQd9jNDgPNGlrlq+M7mTgu1Tv+6UTYEYx5hvJvMkXk7GTH0Cem3Oq46ZU6+/7ipGfJLXE27KWuA0KrnT3DphcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgo++gapbyKAN7efsozfVy6LXp+Nson+cUklixs29fk=;
 b=2orqBGsjakeVWf2j8/nwllNjCIyAJ0mjtr0z7cCt5VaLXZqJdy72BWrMpacQJbRPikjYZbUIkI/O/o19uDsa1KbNyBeuVq++PBpwVzJeWB0/N7d41SqoQkhAoXcJ8ylSCi/h3XNBMu/Lj/VJU9XgZvGC3qreEpsYROIsgcpBZIs=
Received: from CH0PR13CA0012.namprd13.prod.outlook.com (2603:10b6:610:b1::17)
 by PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 10:11:05 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::10) by CH0PR13CA0012.outlook.office365.com
 (2603:10b6:610:b1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Mon,
 10 Aug 2026 10:11:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 10:11:04 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 05:10:58 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 05:05:12 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 10 Aug 2026 05:05:09 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<rafael@kernel.org>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <nagendra.golla@amd.com>
Subject: [PATCH V3 4/6] dt-bindings: dma: xlnx,zynqmp-dma: Add Versal Net compatible support
Date: Mon, 10 Aug 2026 15:34:50 +0530
Message-ID: <20260810100452.426320-5-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260810100452.426320-1-nagendra.golla@amd.com>
References: <20260810100452.426320-1-nagendra.golla@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 502ae4ec-cbda-40ad-b644-08def6c7b04d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|82310400026|36860700016|6133799003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0dHlVpkfPJ1zOVlH7pX/mIG/erhcU/Ta4a37ycheAj0ZCGkjvPypItRM8r8hmc37RF5538nVX++4JLtsmqefdwByRPE2moRGfp3kAXsEfQ4/JYer1AMCkS/2OMvzRddbhIuWu8FQpPfJlYooYAJHdlLdHh37yLl3ef92pDftly7KqzWwEnsbdnf0fdm4xoh+vQODMao0xgYnk+CwZicTYQvz9CvCV8gUDeo9xC2vUSGn6zkfWPsYG30IgtkLCYmya23Ik1lrtDRqE9JPELnPhC9EU1l9fWJOAeaX24jvni+LyJVCMacC6nUCqpKjhnMer7AM/2LcV6Gi774yQb9/QQhpFHoTsgc/NsiCsQXbjAVUvy1rTcC2nTZ0YodadiwVd6AGH3UfHzQzP3GxeeurPLVlnslJqoXXSxU2CPIEZPclMNWob24yXgcoxFbbyMsdBdwV+NfxS6gvLu04RzLbab7iD5qxImH61sXx8Ai1yJImDEA1uZ4TXp1+dbUNa/cG32W6upLVV2uUuVMoJnrulTDWR95SvijhtU8K3c0YZDydZIQMu5cUUVuJ82VWhEyCi3DddW/6jEq3HWXz3/bH0mIyNwwQ2wReLlLPv+Nsv992WsISPCT0p8hrh0jhugtob/NTylSYLOgRaSj+osdjq/F6/H23n0iVkXHc7YTGe1cKFcQTyJPsdP5VKWZDL3wfiQC0+cvPCvnejxtJgRi7oQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(82310400026)(36860700016)(6133799003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wMLsOZcRKI0oZC6UgCykitxh2P7EzCtA+MUK/CwfVA82CXcux0atLmlo5i8Y8YpzpwuPLTeFgEOsLL34ENRTaYOmyFwDftwZa3r6InwzngkytUa+rhPf6DRChBdFGUclgoPQWdPO3/M/cGARpE3hXMjJFG955sZN/EJI8BWbf020udUc9rOnRbl+F9xRLTO28ObmgzHjGTaS+17S6zOuL/pMBgcYCtkjf2LyHtfQFUS9TeiObsLUCXaq6JIibAsRXLG+N0oYaNXSfvMGVDgIdnR4j6vUdj7jXjoFFppGtAH1uPnXiWSoiXNRI7C+aRftr2CYxzDMQ2D7aHriMGfSLUBuZCw4IwSu2yTKptv5/XD+miwyY9CiCt7GhQp1y+CXhrssHe42BtvvdOX/BW/NAZapgF0p2ATgWvaTI0H7Z0zePnhmtLJMVXkXhu2rOj6d
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 10:11:04.9677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 502ae4ec-cbda-40ad-b644-08def6c7b04d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_031118_082392_5DDD9543 
X-CRM114-Status: GOOD (  13.38  )
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

From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>

Introduce a new compatible string amd,versal-net-dma-1.0 for
Versal Net ZDMA.The new compatible requires xlnx,zynqmp-dma-1.0 as a
fallback.

Add a reset property to describe the per-channel reset line exposed
on Versal Gen2 and Versal Net. Mark the resets property as required
for both Versal Gen2 and Versal Net, and not applicable for other
platforms.

Note that making resets required for Versal Gen2 results in an ABI
break but this is unavoidable. When DMA is used by two software components
back to back (e.g., firmware before Linux boot), DMA functionality fails
due to configuration differences or the DMA being left in a bad state by
the previous user. The channel can only be cleanly re-configured after
a DMA channel reset,making it essential.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Co-developed-by: Golla Nagendra <nagendra.golla@amd.com>
Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
Changes in V3:
- Use allOf:if:then: to restrict the resets property per-compatible,
  making it required for amd,versal2-dma-1.0 and amd,versal-net-dma-1.0
  and explicitly setting resets: false for all other platforms
- Add amd,versal-net-dma-1.0 compatible string with xlnx,zynqmp-dma-1.0
  as fallback
- Switch compatible from enum to oneOf to accommodate the new multi-item
  entry for Versal Net
- Add ABI break justification
---
 .../dma/xilinx/xlnx,zynqmp-dma-1.0.yaml       | 25 ++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
index 2da86037ad79..87c65aef5c7d 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
+++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
@@ -18,15 +18,31 @@ maintainers:
 
 allOf:
   - $ref: ../dma-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amd,versal2-dma-1.0
+              - amd,versal-net-dma-1.0
+    then:
+      required:
+        - resets
+    else:
+      properties:
+        resets: false
 
 properties:
   "#dma-cells":
     const: 1
 
   compatible:
-    enum:
-      - amd,versal2-dma-1.0
-      - xlnx,zynqmp-dma-1.0
+    oneOf:
+      - const: amd,versal2-dma-1.0
+      - const: xlnx,zynqmp-dma-1.0
+      - items:
+          - const: amd,versal-net-dma-1.0
+          - const: xlnx,zynqmp-dma-1.0
 
   reg:
     description: memory map for gdma/adma module access
@@ -59,6 +75,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   dma-coherent: true
 
 required:
-- 
2.43.7



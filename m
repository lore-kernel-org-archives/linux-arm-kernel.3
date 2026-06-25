Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF986CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 16:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AvWrzenWitRXdBn/A6pWW8+BLrHtzKUzNX3DY23N3TA=; b=SRkvimrJk9tQ6/F3JD7HYC4tT6
	9cbR6A9K609A/4AlX8ria4PYbLTrFAZOzuPgoQHPDET73FaZWfa16K1Kd3lnD3XozVGufetIdiuOW
	cUJqFlc5BenLR5++tewqnMewOxeIVu7LM2flSEmCcc4+TH1VAwaAh+vUubRutHyGg0eTQqEpXQMhD
	r1UF90gW4+0i6cxDuso2niSoij2hwOLRAXH/xUoj8lEN7ZrIWw1cu3Vs39MdWlWZyAN6qbCvLQVTu
	N9mJAgpodGg1RWs5cl0/gqsDT5z9CPk1GHYzn2DnQNryhB3NlJqP6ymnF3NhbHuLZ2VaTnJ0FgbK5
	5rDXqrhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmf7-00000009SKg-42sD;
	Thu, 25 Jun 2026 16:10:45 +0000
Received: from mail-eastusazon11011019.outbound.protection.outlook.com ([52.101.52.19] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmf4-00000009SKI-23at
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 16:10:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xq4aYZG0d/yjmwxVEaIPw00zwzLm4FIsEU0Si+wj6nkVtK4CS1NtMaGDS9SRuNGsryS23977aIv5epbDJVVnX1QyR6MmMTtq+hRykCg2H6utyPKhNQMKo1wUtlAimHNbJ+iL0xvymY2u/s6QBbwDooII16rOVPCmfiUm9vaFg2KMPhu1spVVRnDy6tjDh3yrE5G/YCPpsSvMufFDbYBaeRt3A9ylDNqt4yzuyrEvaZqXXpEBcsfWoaWExtpL11s9Mg7PTyol0Im52mFxRMMkN3Su9CilObfooMrZyP41db12HPOpGazwCqo9opzMe1/357IGeFxb3Dqxg/UYp+HXOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvWrzenWitRXdBn/A6pWW8+BLrHtzKUzNX3DY23N3TA=;
 b=PVuI8q6woKA7CDGVCNdLjAgh/5pApOkWDDb5UKb+k0IWONlXXJVp52fIF/vHWh5N5sk5YdJrKrimEVX/TEzdWnAAplCoFbykd41OEBVy3G5nn2qlRmf/YKtMVNbP1xIdE8cKaom/CzyVKYLBpd9wokMjBac9Rj5EonfZC+d0iL1+XPO8ElgBQC/8VNCB6ICWm8VZYx/aSYwDG39ItrcZrl89jCmcoYJLicr0o49mN3EQXnTqXXs4OMyPuIJudmB1tt1pNwAYoPahr9KC1mKXjAkKs3Y1Cj1bTc+2xxds8t3FcwaEw6FzbuJHVEsZdoIv+C9qE258bbd9nyu950QYsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvWrzenWitRXdBn/A6pWW8+BLrHtzKUzNX3DY23N3TA=;
 b=XUsReO7q6cnxdrXiLgTFVWKtbpfmpSWPRHpV5aFKsgr/CT6iAl0TSK0Y+FOg68ZBUgJfyzvkt+HV5q8BSwwX9k0TYhsNFhJ4o99turcMpmyxPUEwI6xPStXQua0H/2SGjNGS2ySQ7rdOkCYkT3emwitP4VgdhHPKTFrkDabqtno=
Received: from SJ0PR05CA0073.namprd05.prod.outlook.com (2603:10b6:a03:332::18)
 by SN7PR12MB6689.namprd12.prod.outlook.com (2603:10b6:806:273::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 16:10:26 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:332:cafe::39) by SJ0PR05CA0073.outlook.office365.com
 (2603:10b6:a03:332::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.5 via Frontend Transport; Thu, 25
 Jun 2026 16:10:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 16:10:20 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 25 Jun
 2026 11:10:19 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 25 Jun
 2026 09:10:19 -0700
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 25 Jun 2026 11:10:16 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<radhey.shyam.pandey@amd.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] dt-bindings: dma: xlnx,axi-dma: Restore xlnx,flush-fsync as u32
Date: Thu, 25 Jun 2026 21:40:16 +0530
Message-ID: <20260625161016.1249570-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|SN7PR12MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d21fed-fa47-454f-67c1-08ded2d44132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|3023799007|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: t57jEPGVwgU6foGe1ES2kH6z2N+gcq335ImD+AZCzQpbpMdOa6zUS8yb6A1uc+EfCJ9z6DQ1yj+l38s/Mm/U18WBhjnjJnyZp5oQZHcWne7ZhFYggmpEF/uAoBCQw89fMiBIB6MGi8tNyNNtsr0douJLw5vajME8yS/xwlgnrdZHEbeJ3veG8oqMPTWnJ76iLvE94cgJfCKunzktSBpD19/72v/WpeAisrGC5dJtZRAM6WOnMNbFXPAj/HQ9yUhtU0dGEBG5s/xU1RJ9ee991SGign3eHGKz+yS4+PgWaMdx2MsojahTHrdbQ2q93YaX2OB5hMgkBntzTAnS5jRMq8ieCbCJxqYOLSFJ9xM/gjWSJuMd0BUQ1kWoeT6NvPgduUtArsCB39HOKcU39CxKmigajSgXmk4FiFBvr3u5ldGDSTHWXf99VffWr+NdKA6S1mDVUmhUrspPxu852ZfRYDv8YH9vDDdZ9dL1St6CeP/7cUGzSGdcPjqPPM+VivaHtH2WA1IMmo/b9ftkm23EqA+MAXv2AT5zzEWlxRYV+bjmx8V+u2G7/cyzrkRO9JrjOO+mlbsDIZq3yu92Q8zDQGK4p2vurb+fDfGoWjrKww+s+1gVxTf915WicdoRApRdx5TS4IvyebvqgRSuGxaL0H7NHmRE7LNNvOvLNxh3Kk5QwwRcnbh7IIEbG1llJwmGQS+i4INH4fFBrvOS0skpxQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(3023799007)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Gk8KoFgDeJnpXY41aem68Brp9jAXwM3pW5jxIKjVqrgTZRYr3rLIDDvE7HmOrbhPp8h3lQ3BcJKB5kulMjKBGJwfLj9DfQTIEUpvrEvHjZFPpjOsFpI8rDmmJW4FLHTqojmxVMlwdniVU4Ng0vPzZoEDG82JNqqA/NNcT2ckBcCxZKorMs7FDPLT2wXyqskyA0WtWGPL48ix7yGZjlKDKhfuBAWf1/L8KY6JZCuhRGeo/i1/BNFxzAFYDJ2kXbKIWFmuosWIC5/3bE5bpOH6o8+rAM8U5Ck1izND6Qyevs2aHsF3BBgRPaqLILEGmgpdt1cg/kC+QyBsRmk8IrfXtul2LTjViHzyZwUOC3f5XBVHjDYpYMuN/IDIbek4VBAgHl2oA04jGd5JwxOMKNdz+UezJBVBzTzCoUhLRYr0ZBowPGG9S3UZpV/47+ShHe1h
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 16:10:20.1242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d21fed-fa47-454f-67c1-08ded2d44132
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6689
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_091042_692165_145E0377 
X-CRM114-Status: GOOD (  10.04  )
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

The DT schema conversion incorrectly changed xlnx,flush-fsync from a u32
property to a boolean. The original binding documented values 1, 2, and 3
to select which VDMA channel(s) flush on frame sync.
Restore the uint32 type with the documented enum values and fix the
example accordingly.

Fixes: 2d5c2952b972 ("dt-bindings: dma: xlnx,axi-dma: Convert to DT schema")
Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---

 Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml
index 340ae9e91cb0..95b951eea1b7 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml
@@ -81,8 +81,13 @@ properties:
     description: Should be the number of framebuffers as configured in h/w.
 
   xlnx,flush-fsync:
-    type: boolean
-    description: Tells which channel to Flush on Frame sync.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3]
+    description:
+      Tells which channel to flush on frame sync.
+      1 - flush both channels
+      2 - flush mm2s channel
+      3 - flush s2mm channel
 
   xlnx,sg-length-width:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -251,7 +256,7 @@ examples:
                       "m_axi_s2mm_aclk", "m_axis_mm2s_aclk",
                       "s_axis_s2mm_aclk";
         xlnx,num-fstores = <8>;
-        xlnx,flush-fsync;
+        xlnx,flush-fsync = <1>;
         xlnx,addrwidth = <32>;
 
         dma-channel-mm2s {
-- 
2.43.0


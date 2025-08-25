Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CA9CA0FEE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YwhmL64Q6lPp+P31bt9nWjyMbbrED/MStefl+PmbAP4=; b=JrvT0wHRa+jmXEsgSgDIGKmSSw
	/htkfsR70ELMAo1yoWn8mR9vyl5+DcsMjpz9OBkjBIAaE4zqbf6A738DmQt6CxFz0WP9aDSM5K83q
	62aoWUubmWrh/fgw9soJLu9/iPGtXgNcS+PYUmHxUh9gnG7FQL7F4xCMPAWXsV/9XC7NtXEekY5J3
	weoFxL7dU5BSQHA5m+mZk85iggPXgE73edxP8HolQuru3lT26ef2NZZjkAQ5EbYGI1T2CQMQ5/Z7X
	N+V7Vo7eXShKQmddZlRacyfLrD5cLWIHjIJ6l/O6eZx1uut/E7apdEF6kRjnxVvMhhwxAwKjuCA2Z
	kyKj0SPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYfb-00000008MCl-1vkq;
	Mon, 25 Aug 2025 14:59:39 +0000
Received: from mail-co1nam11on2060b.outbound.protection.outlook.com ([2a01:111:f403:2416::60b] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWsF-000000082fx-46d7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 13:04:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQl8GgYVPbuAfWF54+L0A/A2JwgdstTmDZcAhq1YDTYmgOCfbjkL3ASThiQT7L7jg+3sROomNGt4/R7gS43HK836beQuewT/QfbNV5ZVNI8dV5Phqq0HHaA1WMBnGCd6N5lsz7c2NuQKDATfXp1kD9U7tKk8ii+n8SLAAMXNhJdnEi2+qVa6CaTz0BpfV0nTZrJAUTd3ieFfLrRAEiTkSuGfZ3yQTXhoyaTAXrK+OvqvbVnGjuWhvPILAsVeUHsV1TFiu2iTl4xjdbcwowtSsbpPdbz+lh96gVAvlJcEWi0p61sdYq+ZYC2eWTtChH3/fJ4QOOc6Aq4p52za0x1rPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YwhmL64Q6lPp+P31bt9nWjyMbbrED/MStefl+PmbAP4=;
 b=XnJe6bdG+b7ffhJZFmZHVHzin9SPsgPHXBy/uNsAwoO3SS5GCUBBZzchiZHMAZXkdqq9CT7MIBX1MHpvsGVv0QaRxZw0SrvAIxSpjDSQ5kGtXiYLzd4SJ4zjGiXSRU54VM0sKTuGIkh/9t5E43BfADM1PxEzsP1OEbPHMBEI9miEaWglwM2D/nXUmBQDOrzNSetbKyIJck4wGnOm4hkTNSG7g1TVj0wmFBINMNGStVbp6kwIf+prCGnqqg4ZJbGgiSQaz1j/bNXeTNWGe8WqZBCQpvhEExpSltBXs9ZlEj+31579WZqPnXn2bgyEUs800FYXt+e96kNmvUBkKwC7lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwhmL64Q6lPp+P31bt9nWjyMbbrED/MStefl+PmbAP4=;
 b=f+lXA6ARDZczD2f4w/Ulq1OCIOAiND3vUqYDIi0YDOJ1eZzpqjNFtPqa2RFyJNkfz0VnvEwehtPp+kXcfnARZnmwWlYX6BpZmHX09RXQEyyvE318ynqErEgwUfa7wHa6w+wkrcw56SXnlRnd1oPYARlu8u54XcXUk7UEVTNNGhM=
Received: from SN7P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::19)
 by LV8PR12MB9714.namprd12.prod.outlook.com (2603:10b6:408:2a0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 13:04:30 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:124:cafe::aa) by SN7P222CA0006.outlook.office365.com
 (2603:10b6:806:124::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.20 via Frontend Transport; Mon,
 25 Aug 2025 13:04:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Mon, 25 Aug 2025 13:04:29 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 08:04:28 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 25 Aug
 2025 06:04:27 -0700
Received: from xhdharinik40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Aug 2025 08:04:24 -0500
From: Abin Joseph <abin.joseph@amd.com>
To: <vkoul@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <radhey.shyam.pandey@amd.com>
CC: <git@amd.com>, <abin.joseph@amd.com>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND] dt-bindings: dmaengine: xilinx_dma: Remove DMA client properties
Date: Mon, 25 Aug 2025 18:34:23 +0530
Message-ID: <20250825130423.5739-1-abin.joseph@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|LV8PR12MB9714:EE_
X-MS-Office365-Filtering-Correlation-Id: e790a286-8051-4c7e-b006-08dde3d7ed35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xyTZG2ZiL/Zc6xsP74aL6yyj9WK0jB4m15tQ3l+/c2ld3ZMBmBnuqvxoFZVy?=
 =?us-ascii?Q?kkTwp8V5QUtCzxDW0+cnH2aPWUvIc7lO7ML5cOhPadwblv6wq/4dvjGOfUlm?=
 =?us-ascii?Q?8L9MoklQUKM+rqslwMwcIwLb9l32d0B9ZdNLONY0MJyHy/t0KGDOvDzmIcp4?=
 =?us-ascii?Q?FM4iwjHN+yYMR1c08oJAiHypjRAsf+0PEIw8unwhEes4s5fmj4GkpHxBMGcZ?=
 =?us-ascii?Q?0QZqgDeuH/WfUZVqGeWQ0kUhlOuP80BvVVnEynU8pkZ15K5ff5Q/FtKmmDxE?=
 =?us-ascii?Q?mmBYEVF08r9TF51/MwmLP1r0x08DDnioRLp2vSgKcAo+ZXAXJu+/nyoY0N9Y?=
 =?us-ascii?Q?KxBHzDZ7jSYc97Nrfe8zMihkprPFEC4SDKTUF2Y+Gbj3IlwnZ7ZaeCHUQB5i?=
 =?us-ascii?Q?IOINkKCHAvtgkj6rw/wLF6VGUoMrTdENUZdDxh4Hp8C/IJfYuxiv0ASqh9fp?=
 =?us-ascii?Q?kTSMCyx3XVdGgO8TSjuIhWMJtW9oS7lblkcmMVAbQsy7JZj25XBK6KacDsNZ?=
 =?us-ascii?Q?aP2jMjwxvqRrOa1GawtBWQi+IBBw6P8vXyAQjrp2FqKUEPaBTIOgXuSQ/Gdw?=
 =?us-ascii?Q?XP5x0EFM7vdcWKo6Dgu7FWMa5Ytwzcg0MjWFGQJ2YwoA9KM80imCivgVE06Q?=
 =?us-ascii?Q?qwZJohVIsxrwOuWwaMx3Fe87QQxxsG4JIn4hB9O0cjmwgx7V+pbGharHkq62?=
 =?us-ascii?Q?/KFkZO1qAV4stcaISQxUx56dgoW1R9YcezMhs2OtiBX3oG5LpisKLWvYlhRK?=
 =?us-ascii?Q?zd1dLNHxrar73UMBmb6rlsTq0hkRuuzCsdf3sRFvrfVPLyOdDTTmweeI4Heo?=
 =?us-ascii?Q?ZQl97T6H9XXT7AD/IsNtGPMFns7lbGi3qliZynumHPS0o0cUeYKt68m6wN3K?=
 =?us-ascii?Q?crOUmO0w9+Jap/JOZhOQ0o7lHu+P/yp6r7MRzT0ayiqQe+fSnUxTyCUF98Eb?=
 =?us-ascii?Q?dHbD/xwt6D1TzXNCRJjtUw7nb3ctKvxrAkwujx0lI+JvKToyDN8VtdNoicZR?=
 =?us-ascii?Q?h5EycgqV7PXBnyfuPaHYjUK8uTPgJTGgMdpTVltTnt/P/BUIonsPSeKYiEdS?=
 =?us-ascii?Q?HqMIh/5bmdyAWFDTw7r8uxDiBiGDjt4eozDLrlLAVREdpNEbAzBVPU1pCPx8?=
 =?us-ascii?Q?pnNoDOveXDJO4yRwmbj/wOJvKE8nh2vc5SIwclBOuh3OHY1EWkelZC7v3il1?=
 =?us-ascii?Q?SwOtDGUJrSp/gTxnWVG/T/55sooMFqAgGl1uT+aP4wew7eyFfv5SqwLJNwjs?=
 =?us-ascii?Q?iBW8eeBLbu9IobauqpNiGh/1TaEdXDn8/NXAKs+1Xd9s8f5Ld5/mZQjqVdC5?=
 =?us-ascii?Q?XFWo2lFm9IUfu69Tix4ahAgg1glNYaVboFsfa50rXsMseYvIBbMGe8FLrRxV?=
 =?us-ascii?Q?PPIrM8tvrOmCjVOqeB9e85pfWHgmH0YkFE+alXjDEAK1PYzP/wZoqJ2+JQ2f?=
 =?us-ascii?Q?fO2FCfp9sQoQm91os59gpoaFDmz3exGHLPwIpVw73JH9zGyVMmiOsqeJQRgC?=
 =?us-ascii?Q?wtWM84dKNQAa6xFiLBNrPZ6hVO8WDW3BRe9c?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 13:04:29.2949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e790a286-8051-4c7e-b006-08dde3d7ed35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9714
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_060436_017470_85B4FE78 
X-CRM114-Status: GOOD (  10.21  )
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

Remove DMA client section mentioned in the dt-bindings as it is
not required to document client bindings in dmaengine bindings.

Signed-off-by: Abin Joseph <abin.joseph@amd.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Abin Joseph <abin.joseph@amd.com>
---
 .../bindings/dma/xilinx/xilinx_dma.txt        | 23 -------------------
 1 file changed, 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
index 590d1948f202..b567107270cb 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
+++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
@@ -109,26 +109,3 @@ axi_vdma_0: axivdma@40030000 {
 		xlnx,datawidth = <0x40>;
 	} ;
 } ;
-
-
-* DMA client
-
-Required properties:
-- dmas: a list of <[Video DMA device phandle] [Channel ID]> pairs,
-	where Channel ID is '0' for write/tx and '1' for read/rx
-	channel. For MCMDA, MM2S channel(write/tx) ID start from
-	'0' and is in [0-15] range. S2MM channel(read/rx) ID start
-	from '16' and is in [16-31] range. These channels ID are
-	fixed irrespective of IP configuration.
-
-- dma-names: a list of DMA channel names, one per "dmas" entry
-
-Example:
-++++++++
-
-vdmatest_0: vdmatest@0 {
-	compatible ="xlnx,axi-vdma-test-1.00.a";
-	dmas = <&axi_vdma_0 0
-		&axi_vdma_0 1>;
-	dma-names = "vdma0", "vdma1";
-} ;
-- 
2.17.1



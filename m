Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4ABC44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gol9/XjPsuWC33Y3ZFspoQDpaFNdCRi6rrIQM7LoDsU=; b=BFLTWSkDBi9zfHBLBviJKvfqKv
	nVrVhOsqm5r1vSKxF795HNOvCTsbJr3uOKJ4JFPZHEEpCJkrHopCLY4eeZDrUGwcwRwAttqVad6bC
	55tk97D3C5n4FtDqFfw1qcp19f0F1hZPeyc4KXEf3TFVQ92tW/4vQsy/llR3cdcUnafH2XNWhhnvs
	cLqJ9221fXSgGgVI8yQXAdxtcAjWVzT73g1fa3muo7p5syfCqo8xkNrIY9JoDcn2FWrTDKfe1nuEs
	PNukiKnVA1dzkcdU78dsGOHq9pBJtHzY2NCmTmTaGXSL92xQUKIyP9OCB7iOMH4NYUg8zeOH9+Bj/
	SbYtI6Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmi0-0000000265r-38g5;
	Thu, 09 Jul 2026 11:14:24 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmhx-0000000263W-0VoJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:14:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkJvkwWxgf4yPugVGkZrqqzeXg31clRnDMnamNaB5monAQEljQAzLA4EsPAiKynFpK8Q8j85jKzQdsbmpHZTi/xSMjvnd0oDH5MJibxfv5hylra5DB8Tdqex0/xvGoavcDSwx7T7gs1gq0z1wS7u5MbQ1voMoy0J25o1Z2A50MMjJ9g+oRODN4yNdjZ9PM6j9M0d0ju2d7KbIS7BIhGKGLOe9HAMM/cztasymCeRQD6Tl0zTKmr1TN2ejLEF2IpwCh7zbWuMiiIpUO+Y8dAPTUqii/BRulbS0N6d+ZF+KKYC+36RKPBUoPK9rJeaGn0Nl4+hGFWpBCw437ZKwUwiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gol9/XjPsuWC33Y3ZFspoQDpaFNdCRi6rrIQM7LoDsU=;
 b=yBoFtc+AN3+HPnD7uS5jP0YAiu+3tSrjv9dsfqQJlJbTS9EiFxRgk6hk/AGKry/Dcf4RRjQmwt6NwegskGVJj/9sXc80SX//T6q06N5disg462ktf98FFPioyR62+thgGEWqBiBU0l72U/xDeZi+X00L4qffwnQY5kOqVl8FLgo3YEU3XXpt5/1hlLuYJG2WZKsCfz2PYM47H0NRj+kDG6mznfpVpyTR3ievbAhoQnDzJgqK1eKoqFCB5cZUWwcgCo/cbJ90cojke9xWb9wyzs6PFTHXpvIExqIon1SDvSsh5dACH/Zhaz8PEQwAQKX2EM9t4nPy4j3NLBaFnn7iag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gol9/XjPsuWC33Y3ZFspoQDpaFNdCRi6rrIQM7LoDsU=;
 b=mWVNe+H1iOqfc2edslgvSWQNTPOj1TBVIivS+ZpnjVM/EQx4t7e2KmB+aRrGjPdntEp5fvYkKfgucT/9c+YpMb7+7DcBaVpJ81YinRVL3RX/DmvHu17v2aGk/6dxNakCAbPjIRbNGMIDxUxIzVvHD8tqBJdsRCn3XdhJZuxV4Y8=
Received: from SJ0P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::21)
 by BL1PR12MB5708.namprd12.prod.outlook.com (2603:10b6:208:387::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 11:14:13 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:41b:cafe::5a) by SJ0P220CA0023.outlook.office365.com
 (2603:10b6:a03:41b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 11:14:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 11:14:13 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 06:14:10 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 06:14:07 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 1/8] dt-bindings: clock: clocking-wizard: Add static-config mode support
Date: Thu, 9 Jul 2026 16:43:56 +0530
Message-ID: <20260709111403.1579159-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
References: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|BL1PR12MB5708:EE_
X-MS-Office365-Filtering-Correlation-Id: 85952434-c922-4c94-8d05-08deddab352e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|5023799004|11063799006|3023799007|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8z1PF2rrPvMSwn/lOXp2OsTLcTloziDGcx46bilAlUfpkQgn75uMPRRbjRp6Ntfgo8dEZqXaWT9j26KOEijmhye6Pd5RBYnVhI74E6E/3p6Xi13etNkA9hIUy+/6udou+3JdRelqY1WBkuRvjM2JedUmcBh0m0rZ3bN0R0J6HO9ERL2b/DL4Xti0Chw2u3NAMP3D3ZG8Zlqr+o/p82gB4xy6/RNWRAIHr7wbaecovNPMKCFHrQH8qakMfxJJp4SyY0L2jf3e5GslfAPbvcq6w7UNAOwz4EHxHy2LgOweScXrQn1xehwStdsdI7uVxQ45SJ2OQdptW08/YA5VDu6Qj9fD22Gzf4G6bz9lAIPZ/0Q2XzvNrrD72NTzIdeWbNOomVui7ulsA2lSG9rAZYTjXQqLyg5GPtDLomeMOdROR0NeksGCBwoJOe+zYUpzEerAjhBxxFQKEu4dOm88jauQ7d04sDBeDArfwRl8tw2bbockld13ZjO2g+0qMG/soghsXb1Gx1+Pxm3WQwhLYpGC8l6bKhQk93NxtjRW8TSKs/5yVI2RgoqcUuVXBJEX0kePELW1VK6YATWQA959UazasBe8Yt+joUoT3lc7G9O7Fqqqqss27BwojduTnykCW4fFfTzdonsoRajk20s8YoFKhBCzF7bvqwzHLudspjMB3ose3LNHjglXR/LLrHLTrZyX67drJQ4dLu5R+V0ad36htA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(5023799004)(11063799006)(3023799007)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: l2O4+MVHBPChw1kugVGzeDBuSbMq5yQCww5Klh+bdFvKp4q4FYQ9fxh2ig6y0eLFufwZ1fVMxg2D//ED5t2IjEWQifjzK6CjZLioBM9P8uWHpEb/I6dGId32ExnUoBCpKqriNc4eYcDfinh52mXpfv/IcRo23JB7pFUKFsKOI/l3aWKhVMtsw6+ygyE1hPp0wvmmSJ95Db516MgPtbiLTFEKKWw2BHts0tktVv9cCF+wYzog+ke0L8TJ2NVt9Jt2XOJvxCKwgR0asoAk6Nb3je22zBOCY8V4vHrZFEA9xi07SPEBe529pz6UxMmZu469nDJ/MxU7z8WTVdjGUJy9FGEG4qPvIvYPxzdoFuaxjtS69Zk6TJwCOZW+67mGmHPul9/Doyl+IY8KWuxYJuZgzW+22ktvoNBPBOxjv0qJ0TsaBhK67kmLXkuSPK9Bcb4e
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 11:14:13.3568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85952434-c922-4c94-8d05-08deddab352e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5708
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_041421_211462_4BA4AE1A 
X-CRM114-Status: GOOD (  14.38  )
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

Static-config MMCM/PLL ratios are fixed at IP build time, so the kernel
cannot read per-output multiply/divide from registers and needs DT pairs
to register fixed-factor clocks. Also add the tuples by pair in example.

In static-config mode the IP exposes only fixed-factor clock outputs and
has no runtime-programmable registers, so reg is not required.
Make reg optional for static-config

In static-config mode the AXI bus interface is unused, so s_axi_aclk
is not required. Allow clocks/clock-names to have only one entry
(clk_in1) when xlnx,static-config is present and enforce two entries
otherwise. Update the static-config example accordingly.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
Merged the similar patches
Allow check for current dt even if it is unused.

 .../bindings/clock/xlnx,clocking-wizard.yaml  | 53 +++++++++++++++++--
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
index b497c28e8094..865927b9f1be 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -29,11 +29,13 @@ properties:
     const: 1
 
   clocks:
+    minItems: 1
     items:
       - description: clock input
       - description: axi clock
 
   clock-names:
+    minItems: 1
     items:
       - const: clk_in1
       - const: s_axi_aclk
@@ -57,27 +59,68 @@ properties:
     description:
       Number of outputs.
 
+  xlnx,clk-mul-div:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description:
+      Fixed MMCM/PLL multiply/divide ratios, one (multiplier, divisor)
+      pair per clock output relative to clk_in1. The number of entries
+      must equal xlnx,nr-outputs.
+    minItems: 1
+    maxItems: 8
+    items:
+      items:
+        - description: multiplier
+          minimum: 1
+        - description: divisor
+          minimum: 1
+
 required:
   - compatible
-  - reg
   - "#clock-cells"
   - clocks
   - clock-names
   - xlnx,speed-grade
   - xlnx,nr-outputs
 
+allOf:
+  - if:
+      required:
+        - xlnx,static-config
+    then:
+      required:
+        - xlnx,clk-mul-div
+    else:
+      required:
+        - reg
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
 additionalProperties: false
 
 examples:
   - |
-    clock-controller@b0000000  {
+    clock-controller@b0000000 {
         compatible = "xlnx,clocking-wizard";
         reg = <0xb0000000 0x10000>;
         #clock-cells = <1>;
-        xlnx,static-config;
+        clocks = <&clkc 15>, <&clkc 18>;
+        clock-names = "clk_in1", "s_axi_aclk";
+        xlnx,nr-outputs = <6>;
         xlnx,speed-grade = <1>;
+    };
+
+  - |
+    clock-controller {
+        compatible = "xlnx,clocking-wizard";
+        #clock-cells = <1>;
+        clocks = <&clkc 15>;
+        clock-names = "clk_in1";
         xlnx,nr-outputs = <6>;
-        clock-names = "clk_in1", "s_axi_aclk";
-        clocks = <&clkc 15>, <&clkc 15>;
+        xlnx,speed-grade = <1>;
+        xlnx,static-config;
+        xlnx,clk-mul-div = <12 1>, <10 2>, <8 1>, <6 1>, <4 2>, <2 1>;
     };
 ...
-- 
2.34.1



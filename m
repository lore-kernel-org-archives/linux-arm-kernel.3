Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B44CD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 17:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZ1ly6JNLAet6lPuKDyphipBsC3x4Hfva5P+WBERwr4=; b=qKQWeliE3GOsA66oFazf41+bTE
	sQnohnzNP5RjPikTKFCsYWWsPPeD2lAZUNckF28rghqsjE6evwWY2sns2wE49VUGXrgqSToGghBh+
	psz/lLVlU71EDaiLdGYOoGcyEy6AhNJxPp3UZ5VG0pDE+pGqXgl3OtJTEqdCZxwJIQc8iK1QeIxfT
	qeUhGTQOw0GFGVTOcjjSZ+MR+BlcPTJbtieWzvaKze7wQy9sMrftaqVFWa5exeIrXNMXH2UwK185m
	L1XsLlOmP+wXQfMoyvrD9TlVRqFiMuN5xOm/Y/p+mzZfwkYWjWfDC90WGGdzGqOPMjuP84rFpbLY5
	jij36PcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8m5-00000003yKs-2AoQ;
	Wed, 29 Apr 2026 17:32:37 +0000
Received: from mail-northcentralusazon11012046.outbound.protection.outlook.com ([40.107.200.46] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8m3-00000003yK6-2V1A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 17:32:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZQzPt9478LYgV3+QWUi3VR1JuOPXAL+5zIu5c8D0Y2GZmVDPZkx+AabRz7y+91kxD8Uhz8NG/AJY+pk8nhkq5jjQINhuiA0gSK+rPOs4T3gN/ari0oBO9jsRmnadq9RniVENISnbTj8LK5twv6Ux+qJrHwkVQugDyPqJlORsg8OJVeE00BHEwWEcDVb/9VYwCXsDejNayHI/RLd1MBcOPBRl1xKD2fKIuvwVGhEo7I9GcZJBCS7/tprhMQugM19kf9yBZzYkEpdbCSB+ka+HHSpwrAX1p/n9oZgOirwPaNllbV2se80zONiMR2YzCbtGSv6C1/jTJxHhjCKKxd5Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZ1ly6JNLAet6lPuKDyphipBsC3x4Hfva5P+WBERwr4=;
 b=qrv9dSXv5IcPdoPfVUmljrI0+L7A74QSlwlaz3pNSAlqfVW8jVj1hyGfWkuIUbKDd6T0MvahBb7dZYozKUcpNdZf7FYbP6yjXOAONaoO2JXkXuuNe6dF9M1+lTV3L8KntjFmGq5Jjh0Zq8CrxxNTtSr657I9nUiy3kV94CpqC4hs524k/uJ3p4/UdBXVkJpLtVGhRg1GuglxV2wlUgqRxWn0fR9hynH+t9JlorH4uaOY/g1GH+HCLpqrZO8w5BbLz8zbhPmQaFZh9OQZi+GdLlYjwB/Hb4td7SLOSSoCYfno3ORn5aXnG2OO6h7eOS6M3iWezC+Tu5M16ttFgPZ4Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZ1ly6JNLAet6lPuKDyphipBsC3x4Hfva5P+WBERwr4=;
 b=LDs7XLmBVlLUpD0R5nhha2zBRKtqeUahNnEbddFXb0ON0OSuHvwzIcOCmlg0R+wcSpAd3NQK2+NikochMTfdrAjRwM6vOYwd7uiG17ZKeVcfNfu18a4h6LeJvjQV+XmOA/2E9RUEFZHKJak3oxPEtrmRubo5aW1fT3nMeS15LxQ=
Received: from SJ0PR05CA0068.namprd05.prod.outlook.com (2603:10b6:a03:332::13)
 by PH7PR12MB6883.namprd12.prod.outlook.com (2603:10b6:510:1b9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 17:32:28 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:332:cafe::c3) by SJ0PR05CA0068.outlook.office365.com
 (2603:10b6:a03:332::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Wed,
 29 Apr 2026 17:32:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 17:32:27 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Apr
 2026 12:31:50 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Apr
 2026 10:31:13 -0700
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Apr 2026 12:31:10 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <Thinh.Nguyen@synopsys.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v3 1/4] dt-bindings: usb: dwc3-xilinx: Add MMI USB support on Versal Gen2 platform
Date: Wed, 29 Apr 2026 23:00:47 +0530
Message-ID: <20260429173050.1772377-2-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429173050.1772377-1-radhey.shyam.pandey@amd.com>
References: <20260429173050.1772377-1-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|PH7PR12MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 25126778-b837-44bb-071f-08dea61548d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: P/EmZ+GdVXRL+PfL3P/EkWan5i6pVFJa2eVgUWyU6L/9zlR+1KLq1qaILa+Tw3mAQpOz6RL/edfP9kLGWE9oRNvA/DcWIiTXd+ukDLU0m7G9DVIcZ9A6bDGsqP3jh4iwpw9xGFLdpi3PB2d2Wzl+D+ZBgAU6CS5oLmUz58I2/j9k6bG7wCLSiNl9c1ZyKXm6qFfsjGlSe4pkupMBKigwsM0Qzv/KcWw2duz6kCMIk0eXPv6rFdK69xEb4CUPoRxlKN0j9jMVx87zoEciG7ncKPBVEZqLyCuQQ/Fiy4KEqorHI+fRmvSyEWCY1wRQTPTacBkNFcb2gzaZbV0yFCdfdCjINDf2Dy7Jk68MJXBw8F2f8rgOciNMaukDTVfiGcyWoVOAoRuI4u4mzUbGvLL5uymsGQ/uKWeqVnV3jXJesdLu9oLPsQhbRurVrf+Xs5lYeNj0fnwj6IvaEa7EWrzJ2AK1pNCsFzjpm8OPa5BKE6MX+yrLjW9sdsds+p/Gv5lIBPwKlM2LuWFGiMGmGBeNFAgrhZJD6Og5niSw8UsYS2BOLbPZzwLO4m6w3f7Ot8wlBkjjlt3NdhDfzq7ILezmVUZPfyXwUPMwgovD91ByDfu0bmVhn4iSgg8gc+FwJDYWglQhWgJ+1mCgu5YE1+c5pclzmnfgWlFi05tnAtyT9AU8BkFhcS7xWb8/koriH2k+uuZdAKYrnpn9YlGX/bphv6oAeIQq6A3JoGgij0rOulXe+pG3sdDqIDgKEBqNr5+XyZwu8zmxGaWoeDyKoF2QFg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 86oyPuW//RaUiVtZUWQoPjuNLzCF8onscBlMPDuZC5BxxG9D/iamvTqb0NoAfUiJLtkvnkC2Zomfi78keJl45pmvHBvO1GHL4oRfM2vqTuyOJbMM/zegzNfifNO6dpN1gv1HVEWRPxT6lcP9x7rm28GZzE2hS3MDJmXHsMRThmIYs3n53LuBZFHPFUSeAjkKPLzC1hOXC8bXLKCEcaeUCW4sznqVc3J+s+E6C301G6ghNDgGyiwbSqMkkP5o70BYmlgSkWJUVKXuFk62KDf2wgBquJ316Dojh4rZ3LE7Ib/evZw9X7wgsnt6CihYjI1Wkh/NXR7T53zI3cMapedpSyIDsqvoWM9btYxvB9HzYYaZrhe495ZIz1HQgar5EVMusmL4Dhg9IHwluIuMe5DILKf5ktmkqSM9xoxiq8mZb3Z1GZ95UHfBBq97tsT33lOk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:32:27.8984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25126778-b837-44bb-071f-08dea61548d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6883
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_103235_642615_0497DE47 
X-CRM114-Status: GOOD (  15.85  )
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

The Versal Gen2 platform includes two distinct USB controllers. The
versal2-dwc3 device represents a standalone USB 2.0 controller, while
versal2-mmi-dwc3 represents the Multimedia Integrated (MMI) USB 3.2
Gen 2x1 Dual-Role (DRD) controller. The MMI controller natively supports
USB 3.2 host and device operation over type-c, operating in a Gen2x1
configuration with a maximum data rate of 10 Gbps per direction.

Introduce a new compatibility string in <vendor>,<soc>-<subsystem>-<ip>
format to uniquely distinguish the MMI USB controller. The USB wrapper
registers reside in the MMI UDH system-level control registers (SLCR)
block, so instead of a dedicated reg property, add xlnx,usb-syscon
phandle with four cells specifying register offsets for USB2 PHY, USB3
PHY, USB DRD, and USB power configuration within the SLCR.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v3:
- Modify commit description to explain that there are two different
  USB controllers and difference between versal2-dwc3 and
  versal2-mmi-dwc3. Suggested by Krzysztof.

Changes for v2:
- Add blank line after compatible as suggested by Krzysztof.
- Retain the mmi suffix in the compatible string, as this USB 3.2 Gen2
  IP from Synopsys is part of the dedicated Multimedia Interface. The
  Versal Gen2 platform also includes a separate USB 2.0 controller,
  and the mmi suffix uniquely distinguishes between the two USB
  controllers. MMI is an independent subsystem particularly targeted for
  deployment in Multi-Media related applications. The MMI block include
  following submodules: UDH: USB3.2 Gen 2x1 Dual Role Device, DisplayPort
  Transmit Controller, Security Module (ESM) for DisplayPort and HDMI
  Controllers, DP AUX-I2C PHY.
- For MMI USB define parent address space i.e UDH block.
- Fix inconsistent MHz spacing to use SI convention with spaces.
- Move description before $ref and items in xlnx,usb-syscon property.
- Restore original zynqmp-dwc3 example, add new versal2-mmi-dwc3 example.
- Use 'usb' node name (without unit address) for versal2 example since
  it has no reg property.
- Use 1/1 address/size configuration in versal2 example, use lowercase
  hex in syscon offsets.
---
 .../devicetree/bindings/usb/dwc3-xilinx.yaml  | 70 ++++++++++++++++++-
 1 file changed, 67 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
index d6823ef5f9a7..5e31b961aff7 100644
--- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
@@ -15,6 +15,8 @@ properties:
       - enum:
           - xlnx,zynqmp-dwc3
           - xlnx,versal-dwc3
+          - xlnx,versal2-mmi-dwc3
+
   reg:
     maxItems: 1
 
@@ -37,8 +39,9 @@ properties:
       A list of phandle and clock-specifier pairs for the clocks
       listed in clock-names.
     items:
-      - description: Master/Core clock, has to be >= 125 MHz
-          for SS operation and >= 60MHz for HS operation.
+      - description: Master/Core clock, has to be >= 156.25 MHz in SSP
+          mode, >= 125 MHz for SS operation and >= 60 MHz for HS
+          operation.
       - description: Clock source to core during PHY power down.
 
   clock-names:
@@ -79,6 +82,20 @@ properties:
     description: GPIO used for the reset ulpi-phy
     maxItems: 1
 
+  xlnx,usb-syscon:
+    description:
+      Phandle to the MMI UDH system-level control register (SLCR) syscon
+      node, with four cells specifying the register offsets for USB2 PHY,
+      USB3 PHY, USB DRD, and USB power configuration respectively.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to MMI UDH SLCR syscon node
+          - description: USB2 PHY register offset within SLCR
+          - description: USB3 PHY register offset within SLCR
+          - description: USB DRD register offset within SLCR
+          - description: USB power register offset within SLCR
+
 # Required child node:
 
 patternProperties:
@@ -87,7 +104,6 @@ patternProperties:
 
 required:
   - compatible
-  - reg
   - "#address-cells"
   - "#size-cells"
   - ranges
@@ -104,6 +120,7 @@ allOf:
           contains:
             enum:
               - xlnx,versal-dwc3
+              - xlnx,versal2-mmi-dwc3
     then:
       properties:
         resets:
@@ -117,6 +134,26 @@ allOf:
         reset-names:
           minItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - xlnx,zynqmp-dwc3
+              - xlnx,versal-dwc3
+    then:
+      required:
+        - reg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: xlnx,versal2-mmi-dwc3
+    then:
+      required:
+        - xlnx,usb-syscon
+
 additionalProperties: false
 
 examples:
@@ -156,3 +193,30 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/power/xlnx-zynqmp-power.h>
+    #include <dt-bindings/reset/xlnx-zynqmp-resets.h>
+    #include <dt-bindings/phy/phy.h>
+    usb {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "xlnx,versal2-mmi-dwc3";
+        clocks = <&zynqmp_clk 32>, <&zynqmp_clk 34>;
+        clock-names = "bus_clk", "ref_clk";
+        power-domains = <&zynqmp_firmware PD_USB_0>;
+        resets = <&zynqmp_reset ZYNQMP_RESET_USB1_CORERESET>;
+        reset-names = "usb_crst";
+        phys = <&psgtr 2 PHY_TYPE_USB3 0 2>;
+        phy-names = "usb3-phy";
+        xlnx,usb-syscon = <&udh_slcr 0x005c 0x0070 0x00c4 0x00f8>;
+        ranges;
+
+        usb@fe200000 {
+            compatible = "snps,dwc3";
+            reg = <0xfe200000 0x40000>;
+            interrupt-names = "host", "otg";
+            interrupts = <0 65 4>, <0 69 4>;
+            dr_mode = "host";
+            dma-coherent;
+        };
+    };
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DDA1061B1D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 19:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIe3YeRpKPz7xGobM3LJTVOQYxBT7tQR2DBNsHDoPiQ=; b=jZs7jWHVIrClkwcMGfVGtRD1Ck
	Z3iFmVfcpfNJUMvKJMTYdfVJUkMioGDcqntiuGeJy05BclavAOM0OdQzxIvM/PawLj40NAFiQgYY/
	sMugrgGAJg89SX/f6KMbJvfDKcUY2K+n3N6JlImZQDixpetYze6hCR5rsu9eQ1ReG2q6BdUf02H4O
	PbjsyOSMLghTPW3KAi0yrjBFDcT/WMQsFoeB13KkMIaMRienQuCOSnUm5AUBH0WOEEL760ZICWs1K
	mNn3SKZpPN4JtIZZfW2oMQIY9K1ITWP/xDfrkohY9BXfdO0zbVEuqVPsyIDNAyQfhzqMtsCKpcBNr
	yNnbF64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Htj-0000000BlNa-3d56;
	Mon, 30 Mar 2026 19:03:39 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Htf-0000000BlLP-1iGs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 19:03:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdG2XZ5P/TWWBVyN7MTGp6SCscycrD1k5OAHc11aJynBkS5uuUHdFu3w2bnBGgWUw0ry5l31VeBtVchqPSrPwHVWcFKyQQjLzN5d31xIz5Gcyvult25dGdSfsdUNV9cR4rQUUyvM95tJUSiNuCRusZ+4BOUlFGNGYCPo1/o1bL8fOnC+kbNZ64Kr9qNc6TOFjPTqQtnV2B/iXbXlC7+VU3NHQTmsZKAgIifqAKR6ays7S+ziI0IsCq86wjJmFPCo63AZiW4jgp+J7nx10Csu81u4Eww9qNZj3RU34bJZQL3Kgb80kRxjmTqNCN+Bl/j1Zt7lIorRvWahk7HCPqOFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIe3YeRpKPz7xGobM3LJTVOQYxBT7tQR2DBNsHDoPiQ=;
 b=H9Y6mniJ8+vXj8XBjbrz1uQY1T8FqRkUdfv5opBJXEO3OXBRe8iSpypZBl/jitrcM3/5ijNZ6t2o6++9E6BW9Lpii0fbFsNa1updwUFlE00kw2ITQ7ounFh0BEcjIMX1OMZ++/3kTGNiDXZyas7kMsq97nvu+zcu0howT5P7y1z4OJCVF8HJdeER16PIvNcMwV1t8U3QfuZw6xurqW5wOyvTCH1ROoqQeNGOrIeBJa4aUCJF9sN3LXOS8qi8Zaxhp3JQETFS3pu61jz5lywzwuyxQP3vfoSqzeRLh6HXY9O/zT4TcbBYUxGZwh9CZCcYVVthnjiH4iAQ7PN8zdmMBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIe3YeRpKPz7xGobM3LJTVOQYxBT7tQR2DBNsHDoPiQ=;
 b=ZnzBQu+JB4rgvb1cQ8QkEisJFooOrRbha67NwR2FIrtbXyfcfpI4R3wIvolQzJe+gDWMUdMzbMRktfkQlQnKWaVUgn392LQRck79KTKaMNbzVkMYUgXbvNACk2aMN/odm8nFJnQWzZFdxq5IoSgccEJ83v3z0+b4SRpVj4bfXwc=
Received: from SJ0PR03CA0065.namprd03.prod.outlook.com (2603:10b6:a03:331::10)
 by PH7PR12MB6884.namprd12.prod.outlook.com (2603:10b6:510:1ba::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 19:03:22 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::50) by SJ0PR03CA0065.outlook.office365.com
 (2603:10b6:a03:331::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 19:03:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 19:03:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 30 Mar
 2026 14:03:21 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 14:03:19 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 14:03:16 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <Thinh.Nguyen@synopsys.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 1/4] dt-bindings: usb: dwc3-xilinx: Add MMI USB support on Versal Gen2 platform
Date: Tue, 31 Mar 2026 00:33:01 +0530
Message-ID: <20260330190304.1841593-2-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
References: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: radhey.shyam.pandey@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|PH7PR12MB6884:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e1ae28e-3e3c-4cb3-1fa3-08de8e8f03c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|7416014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: QE+hGPu5wHov/XqgiyPMNP5Sn/I6/vxPcf/+5EEC6NtMpC0RjnIPU9nVR1MgsxY5QKxoPjtIFEVrVVEhlufMHRV9GtrJYesA72KhiQnWjj5r773ybNCKuNfMNsKT0hNaSZewmHrKLBWS8qHQw7UacqJyL7ow5DuwOSUaqdQ+WxOGu6+h3Q+0B6Y3INXZdXNSaFIAuRhl//jP7A8WvSKv0F/dLYUx8wVGLaqVCzI4D4PZH2zwd5AhRhh1XHdo+ct9XlOk0TxtxZoM1yeCFHRCDi6nwfrVTeH+AEPm7P6Vt0scN7SKaVVvjI5Dw5GwPKZu2f/qveEVaqH2Uz9kRWx3ApNopM0uORWZWjcVDQvrhw8CiAkQK2ZNFmLnUFzDoq/nyubiQakDdaVTF8STXQl0qaEOYxs9lkvH4MVhSm3J/vbF5/78HIaZP8XNlN2oJz0WzepdkPZhYq004AGgPMqNTNjaCgA5AyYCUMYWsfKAb3f5pVMvSFae1OejcAbAgedzW8c90FdEUMvTahrn40WHgEpaF44/3iKEi52uoT+BbXp2yidpW/W3A5BtfvSiWTGibyWyN6UdMFSwDjBN9HjnGEwzZSmGM6pMzj1Vwh4whiNt9p9S3arxigrJuDAjcyUBUux4DX9Ul9e1tNLKigeOlmrlpffOOw855wTVur+ri9H8K1M9EEoDRbEbn8guiXgX4YeXlYd3MLY/fM5Jug+bUZgZfw2SQOJDA6Wn+hdikFysA8T3bF69DFCgBa/1tkxSC2A+ntZw5Arpl6O+J+CpjA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(7416014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HNic2G6Z86+/8jLXdNCgnh+9j5mht3l6WzwCnDhO5BiNYRd8VM0Em4ClZKhYn5PntYtvNoaPqqwr9NTv/wl+2YMr8g0jMLE2xUaMPX1ILVZfhG46AXNhKiWcqD47UhBPh3PB273mJAEBbrb5SZHz04XkINDiB+ibGGVMdS2FSO/nX+ZzSDAcj5JD1g+DLQFI1nshR+nPh1QsiMOMv2e4jcDw62WVgemq6OJVF+tlAzpvtsOpWxZNMT+jRpqZynRaBTdD/IFyUrOiMTcwqkSvBz90klNk2Krmd71SnOQCnzpLhBkdSuLRFM3j4Qa8tODLSHBFRZbom1L1iRcxh1w+MPBi5SeLocDZzk1JRtlQLyUkhYA+7XKExUFQWSSelV1lReLDxTrejU0w4N0sn0u1SihW6dQRZvcJ123Yv+e6fnXlBG98jJLcosdRHkKGlpbf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 19:03:22.6993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e1ae28e-3e3c-4cb3-1fa3-08de8e8f03c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6884
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_120335_451849_D447CAEC 
X-CRM114-Status: GOOD (  14.85  )
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

Versal Gen2 platform multimedia integrated (MMI) module has a USB3.2 Gen
2x1 Dual Role Device IP. Introduce a new compatibility string to support
it. The USB wrapper registers reside in the MMI UDH system-level control
registers (SLCR) block, so instead of a dedicated reg property, add
xlnx,usb-syscon phandle with four cells specifying register offsets for
USB2 PHY, USB3 PHY, USB DRD, and USB power configuration within the SLCR.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
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



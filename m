Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931B0C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 03:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfn/Ay1qGcf7rQPwfItppb9gcNkFGHdIZJsqYKBHw6c=; b=lFI3JhzP/luJZCt4wZT+ZJKdNx
	f97ReTFt+QtVHEKvnr10gV3VXpRF3I9y7TlpBRWIWBvd8Nrh0JOzAOhgqaSoVryyvQCy5EpGq2DxA
	8aYKLA2/QUubaCo+Kvo9a104/G7CGjDoKJsi4rwVx/ELIskGhgdCCLDWBNc43Ba0JVDmAGSBDPIAz
	PCw0vrGMfL4my0fG202gK88l4VwWZ4TQueFiWrQPNHLDiw5AL0/mpfq2Js4IquRJ5XDK+4x2IHSAC
	ssf4vleRhoO0c8LnBAWMFmZAUgVQJS0oVitOD4qosFNEdZ2V5Y1QxYGmTA1t2tpIgguii9d/r/Yxq
	8/dNvx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33V0-00000004cGJ-3yH1;
	Sun, 06 Sep 2026 03:24:54 +0000
Received: from mail-japanwestazon11022143.outbound.protection.outlook.com ([40.107.75.143] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33Uw-00000004cCc-0Eol
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 03:24:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SR+dVh0MgDLwBniz8Ff5W3L36Fo0qHBxRwXIkndMLX24T+JCZJCljQsY+qevFtxPQIAYK4U+5rhaJuGNGM/lLqcX7bYxAAxx/XhrIDBSPRy2ElKL1EQgoXc2ktCI6ri6QUX3/OD1OBX3BXjNDkKmvLIcvdxvqDbU39IjcQPIvTC809SnMo/8XeiHin+vuzVzgEM1m7B2tEamiY51gM9d7qFRCiHA7OgWSP1djPSPXDdiFKcoXNE5uV1eVQ0k2pmRfE62MEdQGKT8VWFKRZEPM1N5y9Ai34K4gJU2SDfg0CVKiKXm363juKJLaHoX5YjFix+eFeNA0e5IKCrXpcQi7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfn/Ay1qGcf7rQPwfItppb9gcNkFGHdIZJsqYKBHw6c=;
 b=OIsO2C5Kwue5kZ5puApbRgX7AgBYVgaf5MVVuBo4NBBwwkfmARwQmwpB+ol5mSDt1dIv9cXNygCdywIm4IU6+2b3tcjUgy1LbQ3gE1aja7E2JGBpzPus1DfMdCExj4Bq/d9WMsEFQHt2wuNIw+Fjc7S83u1oQLh7wHLw3S9ikKuQF49KNQwQ2q8uHRzSbdQjI6af+Wyt2RDa5Ss/l+8AS0XoyGQvC8gbc6Gt6zSYwoJbTk/xm0YwYh4EqsMXY/uK20A4k7PjK3d+h64jl5sVWc455e3I4eAN+5E800KuNUgLdg9lcPeYCXgCaFk1ArwW0tFAeXMjD6ZS1Vt6n5+JtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI3PR02CA0007.apcprd02.prod.outlook.com (2603:1096:4:295::9) by
 OSNPR06MB8931.apcprd06.prod.outlook.com (2603:1096:604:49f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sun, 6 Sep
 2026 03:24:46 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:4:295:cafe::a6) by SI3PR02CA0007.outlook.office365.com
 (2603:1096:4:295::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Sun, 6
 Sep 2026 03:24:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sun, 6 Sep 2026 03:24:44 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 35D3B409210E;
	Sun,  6 Sep 2026 11:24:42 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	pawell@cadence.com,
	rogerq@kernel.org
Subject: [PATCH v4 2/4] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Date: Sun,  6 Sep 2026 11:24:38 +0800
Message-ID: <20260906032440.470788-3-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906032440.470788-1-hongliang.yang@cixtech.com>
References: <20260906032440.470788-1-hongliang.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|OSNPR06MB8931:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 75d74609-008a-4874-4eb1-08df0bc665a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|82310400026|36860700016|6133799003|22082099003|18002099003|3023799007|10067099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info: daUzj37TjIAT9eg2lX5VE0XymgDScAhbJIe2rFcDyuvw38lrgetXM5wB97kFGGcpjb0c1Zegq3A4aaAVL/fR/ryABLA5ezLadkf0q5pDeofTMS3QbfbDSvIYw+KhxS8emI8+IElsYwzqPRpRTscmSDYgsWodMyTdcB90gPyTuYs68NEMH2tk1+aYgFmb+X8M/5AzXYe81grXQPdGApzDuILvcC2ZFSnqdIPmpsldVV4ussTtdBrlVuYs6PcLdyypk9Q3UAd4GqZnUpfoz79rcKNoaBYZbDbM3qsS33fed/pwWcHftuB+T3qa9bLOL81TRXulwqo9srI4uXIG0EKbNQgJU/deUnnSUC9l/TWi5R3XtqkroM9e/Iksp605C1EHerp8D+0xXVfByg4yI0C6ycIkY1HnYCJKBm1kfW1PaKS9Y0OIYErqzR6q2uszuwSFg5WhMsq7sjzdp8kiFFgHIQXPcXbMOoU6dkNXXMJ9iRT9xdUjbVrhR1v3qemiFtNofvBLguE7YIWGGyerHasNtI4sJT+mIGnnLRex5agoZPCyAsbHxYABZXxfynNxrAbA3Vn0pKA5XJ0vkBx8Tq9KfSvqZHKudPOWLFEDkwf+z/B5d9EC+1LhbsCjiyAtvEqqsPuBemgoOUeQWu/RaLGNc2ZsiFgn4RTAoOb+N4r2h1eFHZmTP0XVrRutzVHx/uzd
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(82310400026)(36860700016)(6133799003)(22082099003)(18002099003)(3023799007)(10067099003)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: D58iEIIS9QpBVzqBvi812t7uAocGnY8aMk5mQU7nGCARNC8kegeHYDYWB3sgWax67RR5+5/n2QRXOb8UH9Yrbwd2UbNiqjZKvKMREjNdttGO+fBRMgaNsw6DIgqvQT8raHoLCKw07ErbtbwnQVniUaIUfwvUjTILWmPHKunnk7MSda47SCuepqijmLXZVcKem5YbdZCSg5DfDBKEeaBK/2FUsSXD9F6aAIgFfwZiFlWGHzMT3z3mNZ/WExDx4vqatZoBgkmnCPCJKcBPOwNg+TMc3y8aLKedI+U5n5sW9r4dBTTJ2d4SydeQSb3JXMvGe5Hs7Sco1LO2HL4aAfI4OP2V/ASDDONWibLZZTMOyf/wSp44tOqjAdf1l3i6tzv8/8VUQQ19brmDYuDWCqx0xenun4i1KYKVIgJ6SNlLi1bVOFK63ccAnabjLHfK4Kj0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 03:24:44.1047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d74609-008a-4874-4eb1-08df0bc665a1
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8931
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_202450_206103_FFE526A2 
X-CRM114-Status: GOOD (  15.18  )
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

Add device tree binding for the CIX Sky1 Cadence USBSSP controller
glue layer. The integration adds glue registers and mode strap
controls in the Sky1 S5 system controller. The CIX glue node wraps
a Cadence USBSSP core as a child node.

The per-controller RCSU control and status registers live in a shared
RCSU region described by the cix,sky1-usbss-rcsu binding and are
referenced through the cix,usb-rcsu phandle.

The per-controller RCSU registers are accessed through a syscon regmap
referenced by the cix,usb-rcsu phandle.
Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
---
 .../bindings/usb/cix,sky1-usbssp.yaml         | 144 ++++++++++++++++++
 MAINTAINERS                                   |   3 +
 2 files changed, 147 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml

diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
new file mode 100644
index 000000000000..8e66dea50fa7
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/cix,sky1-usbssp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX Sky1 Cadence USBSSP Controller
+
+maintainers:
+  - Hongliang Yang <hongliang.yang@cixtech.com>
+
+description:
+  The CIX Sky1 USBSSP controller is based on the Cadence USBSSP DRD
+  controller. The integration adds glue registers and mode strap controls
+  in the Sky1 S5 system controller. The CIX glue node wraps a Cadence
+  USBSSP core as a child node. The per-controller RCSU control/status
+  registers live in a shared RCSU region and are accessed through the
+  cix,usb-rcsu phandle.
+
+properties:
+  compatible:
+    const: cix,sky1-usbssp
+
+  cix,usb-rcsu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      A phandle to the USBSSP RCSU system controller region (see
+      cix,sky1-usbss-rcsu.yaml) followed by two cells: the offset of
+      the AXI property configuration register and the offset of the
+      controller status register, both relative to the RCSU region.
+    items:
+      items:
+        - description: phandle to the USBSSP RCSU syscon node
+        - description: offset of the AXI property configuration register
+        - description: offset of the controller status register
+
+  clocks:
+    items:
+      - description: Start-of-frame clock
+      - description: AXI bus clock
+      - description: Low-power mode clock
+      - description: APB register interface clock
+
+  clock-names:
+    items:
+      - const: sof
+      - const: axi
+      - const: lpm
+      - const: apb
+
+  resets:
+    items:
+      - description: APB register reset
+      - description: Controller reset
+
+  reset-names:
+    items:
+      - const: apb
+      - const: core
+
+  cix,usb-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the Sky1 S5 system controller used to program USB mode
+      strap controls.
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+patternProperties:
+  "^usb@[0-9a-f]+$":
+    $ref: cdns,usb3.yaml#
+
+required:
+  - compatible
+  - cix,usb-rcsu
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - cix,usb-syscon
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        rcsu: syscon@91c0300 {
+            compatible = "cix,sky1-usbss-rcsu", "syscon";
+            reg = <0x00 0x091c0300 0x00 0x200>;
+        };
+
+        usb-4 {
+            compatible = "cix,sky1-usbssp";
+            ranges;
+            #address-cells = <2>;
+
+            clocks = <&scmi_clk CLK_TREE_USB3A_H0_CLK_SOF>,
+                     <&scmi_clk CLK_TREE_USB3A_0_AXI_GATE>,
+                     <&scmi_clk CLK_TREE_USB3A_H0_CLK_LPM>,
+                     <&scmi_clk CLK_TREE_USB3A_0_APB_GATE>;
+            clock-names = "sof", "axi", "lpm", "apb";
+            resets = <&src SKY1_USBC_SS2_PRST_N>,
+                     <&src SKY1_USBC_SS2_RST_N>;
+            reset-names = "apb", "core";
+            #size-cells = <2>;
+            cix,usb-syscon = <&src>;
+            cix,usb-rcsu = <&rcsu 0x14 0x100>;
+
+            usb@91d0000 {
+                compatible = "cdns,usb3";
+                reg = <0x00 0x91d0000 0x00 0x4000>,
+                      <0x00 0x91d8000 0x00 0x8000>,
+                      <0x00 0x91d4000 0x00 0x4000>;
+                reg-names = "otg", "xhci", "dev";
+                dr_mode = "otg";
+
+                interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+                             <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
+                             <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+                             <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-names = "host", "peripheral", "otg", "wakeup";
+                maximum-speed = "super-speed-plus";
+
+                phys = <&usb3_phy4_0>, <&usb2_phy6>;
+                phy-names = "cdns3,usb3-phy", "cdns3,usb2-phy";
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 1408b89607ff..8899a010fece 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2775,9 +2775,12 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git
 F:	Documentation/devicetree/bindings/arm/cix.yaml
 F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
+F:	Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
 F:	Documentation/devicetree/bindings/usb/cix,sky1-usbss-rcsu.yaml
+F:	Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
 F:	arch/arm64/boot/dts/cix/
 F:	drivers/mailbox/cix-mailbox.c
+F:	drivers/phy/cix/
 K:	\bcix\b
 
 ARM/CLKDEV SUPPORT
-- 
2.54.0



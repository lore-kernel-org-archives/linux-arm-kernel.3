Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CA1CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 07:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehfiuk//1JrsyruokWTj4WAzfPbmII+v964/at++0u8=; b=bOMEzs4r1cgRTJbP7F2ChRC2GA
	7NnsshG7Hx3wWtJFnrPDwF+8wYMBmiNc9aadepuVgg2rZWcZW2vwqqHNQvtKbJ8rv6mRi8BPyBHIZ
	Z52vr8WHDZ+E1w8dvlYE3RGdXkLRwNWJlpMbDoBojvjOhbaZa1jVub89i/qTM9mVtW7n2b9UW0Bjo
	2CmTSLin2qOhMeTpLXbJbZrUVhv4AapAGtvzdATroVnc8pddC59JxeGH4U7rs23aeudJanaWLUoV5
	i6V6oNOe84DHYg/0hNs+TCwHt12h9jUTG/bT5P88eKvoQGxZm0jMz2w1gJnFjERzdcejfnYp6qCyQ
	9y2nK9Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6Q0-0000000G0bg-2QPH;
	Tue, 21 Oct 2025 07:04:28 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6Pu-0000000G0XM-0RIe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 07:04:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBvXukHEiZGpIpvXQ59EIj8TowPDO4RcCfPokzr9fS+M4oU03JV1r+sWEeW3bm+agbsAURFB38yQd8M6a9jbudpDSbU2pm6wRjB0JbqgVc5UsT1Ji7FjiTpGomoavSCl40khMVKegv/yXNdw8i2Xs+WIOjcLJj2kCGOnJfm28DNOZ1u+3rDyu6SyaihsYIqmA0Kw5Gop/eG3sKwaEFuJtuLISms7DVH+AMY1pr7FXk5slvyhqkwGqw8QuMrj59dgwkI/OvZsoM4IePa69qqJqO7yGphRpiytjW5KAhy4MmYJ+Qe79ioku+3/059g9z/XYAfDNUWx7oX0u6u+Fi63eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehfiuk//1JrsyruokWTj4WAzfPbmII+v964/at++0u8=;
 b=bW3tUzZ4qH+SEwEHFzFUCOrCfCteNxPKDnU8arN+PDwzhEC31Pd/sYI/4O7g+FP1wMChqRs16I8D7PdKXn6ZkvznRQ2n/h+y7vcOL2HAC1Anjg2wxnio09P+3yiJ0gLYvs7lv8EXshsgl06Gi42DYP03IG2Ft6tz++hJIto9/6YvKLMgQZdcA+cf1GXrQShfjoJ2+ZsZp0oHABGQWIPSMqv+Tm4oqUxDkkE0sl+8RLhjDfKgQK0bXI0nbTlX/qI1KXqXuQEQBYshCpElLLGmsgUCAyNbkuegdvARZUA6J9h9bDmhzD1bTZbvxB3muVGrdtyngleLHjCpF3PKTgNcLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG3P274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::30) by
 PUZPR06MB6128.apcprd06.prod.outlook.com (2603:1096:301:116::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 07:04:13 +0000
Received: from SG1PEPF000082E2.apcprd02.prod.outlook.com
 (2603:1096:4:be:cafe::2c) by SG3P274CA0018.outlook.office365.com
 (2603:1096:4:be::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Tue,
 21 Oct 2025 07:04:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E2.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Tue, 21 Oct 2025 07:04:11 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 057594143A8D;
	Tue, 21 Oct 2025 15:04:11 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v5 1/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Date: Tue, 21 Oct 2025 15:04:08 +0800
Message-ID: <20251021070410.3585997-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251021070410.3585997-1-gary.yang@cixtech.com>
References: <20251021070410.3585997-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E2:EE_|PUZPR06MB6128:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: faec0787-a14c-47bc-d75e-08de10700a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1+mO1y4ZEJ/DL6TgrgfD9xmC6CLgzmspJkzHgmuoy3gQZW9nPwOieEzt6X9d?=
 =?us-ascii?Q?khEPehZ5qXCL1zuniyi6Tt7YIuB9Uhpx1Y3yOfiLOubCcNUSFwN2dLsf9Xvt?=
 =?us-ascii?Q?J307Z/rtp12AzLRsnQL6OhMgQwbv0B46X2t7969/5KFuPG+q4fchFk/pDFYC?=
 =?us-ascii?Q?h2E5tYGsFaBcRJOku3vLcii+N/T3g6OHfmzCoTnCp4z9CWoV7fbZgypqU/p8?=
 =?us-ascii?Q?FFC3ULYYyNi7D1IhYffFh2Da/NQXGWcDLf3/1+MXYKfuF7yAI5Lc5f0uiXYw?=
 =?us-ascii?Q?/7o+V5tzL6/iClCoeghwx5IrgZZDvem+hRNOMmoVzsMqyv/BvibIEfqEZon+?=
 =?us-ascii?Q?sM0IpHQ+xugKnlKGUILsGCkdQ/H+2uv8PKeWCTMK1mBfUNdN3/2Po807EdS5?=
 =?us-ascii?Q?VaKmgVsxXPdGMmnpURs9YYgTUemkHtXvgW/NOw6NhuUSuFsGPId2f+Grj9z0?=
 =?us-ascii?Q?K9937Ola4gdUHyGc10yz2VWSZITKSuc+VJauzhfUVfm3CpBT05M2hcLCC3iD?=
 =?us-ascii?Q?O/KkFQDyvv2DfIO2hxVY9Ma4MBumx42r7A8pw5xvdaWuF0t9Z8PaNVw5AoqP?=
 =?us-ascii?Q?tKeNT6aHFcMXD0AIyIblrYP+3CwkkwoUUrzzCeamsqnqW/J6lfr3EBrDSP5u?=
 =?us-ascii?Q?mvwKC05cEnIT3RKHoeCmkerGPmDzfWRtRvKhVQCSw6oWkMYlnLAm1JpQGRLk?=
 =?us-ascii?Q?Shhs1PP6wNmfVvX9On6YLNXMjkebPGeeRx5rpFU2VuxUb2VbFss/pD1kb8FM?=
 =?us-ascii?Q?4bFb47B1Tta92Gj9nOFrQiK6BwDBbshaRnSNdonUBRTNYHDPNEWzXxPiIWrG?=
 =?us-ascii?Q?Ta6/BEilpHC8AB4uIRO3amZCVAo66o255Magmtd7Eoi3nw9DabsaeRwQYugu?=
 =?us-ascii?Q?u7aHM/z+A7rVyI2OpPh3ghE2xjCFF6hMax8yQET+w8Y4M+4fhTPKnFWLe0M8?=
 =?us-ascii?Q?TIbxtr1SdZ/9AT4/DpD4uUiBgxUZZgiY06Hu/D/wSIkHGbAXR5ez+Ix3VR3U?=
 =?us-ascii?Q?CkjMyiFwGdEoHlspOHl9KUV2IiHsrXwLBCvxrAI3Q0VBMtP4bt0hvX4H99wT?=
 =?us-ascii?Q?6A0rxTfVLOhpC8EyWzgW7sz4TZsQbnsUDC//U7LwDGQclyJ+eg+lFRtzexVQ?=
 =?us-ascii?Q?RJ8pUOPgYZzI6hjkME5K67OIUjUn9HcUyGDhfxtVCSGEs1kTsDXUdp2gjx5N?=
 =?us-ascii?Q?o4MU8/2oCOGJ8+oCiSjGlbdmGqmQo+CW6QX5fFKZp9Xi6H8b9sDFkwWly8H+?=
 =?us-ascii?Q?ozlP8Bc+rif/zdN5iaX/07cKgHih7itZShoM0eJ1ZPwmvRYz6PMh/HymYnFE?=
 =?us-ascii?Q?ZYaMkq9TXkjvn6HDcj8W9JXjB5lUK3RjG15NvZxFlS4lysDK2B1RAPXskbNN?=
 =?us-ascii?Q?rQEhSGD3AbRESbLNag2D9qjzNUQ2Y7v7+OG3kSN/I92BrDGZVVTRKodYxd7Y?=
 =?us-ascii?Q?RWthsEpHIarUklFfrFyo8SxL5772VS2dUsiiZZ4PkhfggNEkkuCeHKVwgFLq?=
 =?us-ascii?Q?P4tNoAdg09ihoI7ZctTPiiUxYHHFrP4Q6tKy?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 07:04:11.9833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faec0787-a14c-47bc-d75e-08de10700a16
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_000422_152566_7540AE47 
X-CRM114-Status: GOOD (  14.54  )
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

The pin-controller is used to control the Soc pins.
There are two pin-controllers on Cix Sky1 platform.
One is used under S0 state, the other is used under
S0 and S5 state.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 .../bindings/pinctrl/cix,sky1-pinctrl.yaml    | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
new file mode 100644
index 000000000000..36977b0d745b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/cix,sky1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cix Sky1 Soc Pin Controller
+
+maintainers:
+  - Gary Yang <gary.yang@cixtech.com>
+
+description:
+  The pin-controller is used to control Soc pins. There are two pin-controllers
+  on Cix Sky1 platform. one is used under S0 state, the other one is used under
+  S0 and S5 state.
+
+properties:
+  compatible:
+    enum:
+      - cix,sky1-pinctrl
+      - cix,sky1-pinctrl-s5
+
+  reg:
+    items:
+      - description: gpio base
+
+patternProperties:
+  '-cfg$':
+    type: object
+    additionalProperties: false
+
+    description:
+      A pinctrl node should contain at least one subnode representing the
+      pinctrl groups available on the machine.
+
+    patternProperties:
+      'pins$':
+        type: object
+        additionalProperties: false
+
+        description:
+          Each subnode will list the pins it needs, and how they should
+          be configured, with regard to muxer configuration, bias pull,
+          and drive strength.
+
+        allOf:
+          - $ref: pincfg-node.yaml#
+          - $ref: pinmux-node.yaml#
+
+        properties:
+          pinmux:
+            description:
+              Values are constructed from pin number and mux setting, pin
+              number is left shifted by 8 bits, then ORed with mux setting
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          drive-strength:
+            description:
+              typical current when output high level.
+            enum: [ 2, 3, 5, 6, 8, 9, 11, 12, 13, 14, 17, 18, 20, 21, 23,
+                    24 ]
+
+
+        required:
+          - pinmux
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #define CIX_PAD_GPIO012_FUNC_GPIO012 (11 << 8 | 0x0)
+    pinctrl@4170000 {
+        compatible = "cix,sky1-pinctrl";
+        reg = <0x4170000 0x1000>;
+
+        wifi_vbat_gpio: wifi-vbat-gpio-cfg {
+            pins {
+                pinmux = <CIX_PAD_GPIO012_FUNC_GPIO012>;
+                bias-pull-up;
+                drive-strength = <8>;
+           };
+        };
+    };
-- 
2.49.0



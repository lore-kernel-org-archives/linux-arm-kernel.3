Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094B0CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 01:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oHNWVnA2E94eGeo3y1KXtFxo1uXvSlkj6wz+EdZVn4=; b=svYzTSIyfrBLCpUSZkN4dCYa0A
	l7F1Q/08nMBgrsVlczEtokOqyv9EzIKVknbY0haT6Manvih043x5+Wi6/RBr2OMo5mZhRUrHGaLkj
	och3kCSdVwjV/CqJvEPktmK9Uf/6IXHDjzFBDWbxii0zifFzSfHDBWvWX0AKvvCKI+9xIepyQCHJN
	jRsbHQ3ympt7bfYBh4+LOBKUo4JPgDjgppr5HnaGcVtMXCnx45HdRxtF6D3t4d5nv1nhWu4IeSxmi
	gFQDX7l8j9fp9y/YZwPcnnmDrjdxnc5PUrCjQ7z5ziTUlu8rReaL/gj/cGMd+op9DXXDMY6lSKPeM
	LBadZ35A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UI6-0000000Evvq-2jLJ;
	Tue, 14 Oct 2025 01:57:30 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UI0-0000000Evq2-323f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 01:57:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8bn5pX/x1K9DgYfwP0xFG1XpLrjSbFQmEEUgVDrFfIAfJDrgOX95vVISBP7At8ZwD9AdLAuio8aTPZJFJWr2cT1rv4QyInQEsj+CRzr+Md21ug5zPA5oUljbn2vsVF+LS17BTivc5e4dF4rD3I4vs3A0bKg4BYbODLNHxlE8lfUjGM3qAgKrgtvIBHEFuV7xrvCZq/VmomOPyhVDbmQEMTc66H5grRBI4Na1ey9ZPMuzHD8KFV9T/JiKeOvnK7eVlcKjkp5VGgQ3Xc4hfpWS48TeVZfbcXG9pqtOOXhYmBLJgtqsGsmemZPM+YkFmQi2EkiziDKyBUTixsytG8ncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oHNWVnA2E94eGeo3y1KXtFxo1uXvSlkj6wz+EdZVn4=;
 b=PpXYY7pmdklkrQi8YgLaf8PtOuF5FRg8vUSY/Wh1pvD6qJUTdF1fJbkjvBw4wypXfEz2RCtg7xY/hNSnf2M/OvNBGX5q4RIi6yOdHuJpw0WDGgI/rK630gb8NC9fayqmCczb+Q2rDH00RlU/O8FaxxjWUxuDVwaIF4RdXzyc1chbXKYBQ3QVYb3Ne9HYbjTzt6VsuscO0yfkMwNPauen9hCkvfGWzlXdajA9Do84fIvKkoDYVx4yOuORwoCQrJ/0tAdKkbL9KsZfVwYEc1xAzu65HH5r0s3tZ3tIy45Jo56AB2uGxFSfgUztdlarzxzddNESzxKDZkLPQYZ/iHmNvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG3P274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::30) by
 SEYPR06MB6278.apcprd06.prod.outlook.com (2603:1096:101:143::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.12; Tue, 14 Oct 2025 01:57:13 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:be:cafe::3b) by SG3P274CA0018.outlook.office365.com
 (2603:1096:4:be::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Tue,
 14 Oct 2025 01:57:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 01:57:12 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5A5AD41C016B;
	Tue, 14 Oct 2025 09:57:12 +0800 (CST)
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
Subject: [PATCH v3 1/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Date: Tue, 14 Oct 2025 09:57:10 +0800
Message-ID: <20251014015712.2922237-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014015712.2922237-1-gary.yang@cixtech.com>
References: <20251014015712.2922237-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|SEYPR06MB6278:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9eb54d46-e60b-4c9e-1a65-08de0ac4fe6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o3qDuRNHP8KLRCin6e3fs4l8uz+TommetGV5hC+tMz/cVoQaFKFMFds1tVKG?=
 =?us-ascii?Q?USKjhzVDuecXt0DmywIS1vZz84b4Wjo8z1Bi+K1AuZ1P+trv6pYGYg8LcIar?=
 =?us-ascii?Q?XqmQxEKjlQvyffOyL36D7jgi6o+wo7qgqByvo8vyaGC4hWeeWFABOKHNYVYu?=
 =?us-ascii?Q?gjcyH16qfWPjTNcGQxajA1m0gPL+rWUAqmU4ZMrkY9GYtpteVR9HotB8ore2?=
 =?us-ascii?Q?0TPEsNwPb2sEM1lVVVRoDPZWG1464fGRJD/HzhODZut4r6RtJH7gQhCC/xO3?=
 =?us-ascii?Q?3nRHsh5pqWIo7Howek4BFEERWG/EHIttOT0YyBg1OueD6170hL5cSsZ4vxqt?=
 =?us-ascii?Q?tg3gpxDBWOoFUaLBJO1zFO4nNe+RtLgWHln8DmgCGN6H/kmbkIDH8zhrjbDt?=
 =?us-ascii?Q?hgAkYwWXg9Unc8y3jyLjbAJUNwSEbz/qKB9SbQ/pdvTAvVvSKedVieuY/qiF?=
 =?us-ascii?Q?AGkgMNCuy2pztDoooTx/Z9euIRg2To9Y92Ws7mtWM4poAnBcVJ6KiBSlyH77?=
 =?us-ascii?Q?u2kNrzE+GFU2xOg77p0w6ZtgG3GDqv/8JJri6RRML/+BGI7yWO+bukjN8LZx?=
 =?us-ascii?Q?q+lvQgH/8jGFBTTuHF5cHBzqVUtYlJ68w17nRloxNKy/TC5OOkqFuD2La+su?=
 =?us-ascii?Q?HXLmtcX9Odos0ITQv6sRmsCezs4TP7RMMHJIRhpN9ZLXOOf1U09JijdcWLuO?=
 =?us-ascii?Q?+Ul5cFeY4IWcz8PijsjPxonC5VA/YSWCKrNeib5Hy9d7v4chZ1YqMY4ZAXEe?=
 =?us-ascii?Q?1COOqpNJdVYguwtpaOoOTKmc1v4tULzlXA/2R78Fkw6c3AqoXILVsrrM6g1m?=
 =?us-ascii?Q?s28jfrEQy5YWNCTBwn5exg07O6d36lQac+AStOirF3xDpT60HYX2rMHvwr0F?=
 =?us-ascii?Q?AX4+DogF9WevVU56Gm3onKtI3jl7KK6gUvdVDOoW6z8OUa5w2ccubhceGNHl?=
 =?us-ascii?Q?3HnU5r4q3+LJ2rhGGPkbGy76S2wef3oCgPvF8VL2kASo/yNKtfhAs17x6vwp?=
 =?us-ascii?Q?mwUw+B94mUFR8CBHkynFteuCsRyZ/4uAd5Pgn43eZdLFSbIrAO9rn2F7M1cC?=
 =?us-ascii?Q?/Q/rP9VepTZRihpiOtIeUqjVGR3WjE1utjHbxmd4UatbsauTUOYKYRRqWXAG?=
 =?us-ascii?Q?KtjCuh1MLVokE8UHsMbtFZqWn7WtJGjzWLHTANjXdEm23SBaij7QGt845Mbp?=
 =?us-ascii?Q?ZiF05qXqFde39zIGhQu/atuSvmVZP7tIRneUH8LjxLFIvrDzA5GDfuw1VqQc?=
 =?us-ascii?Q?ORlOjasZq9m7D5ZbZf/AAU3ES/quOU1d4rh/Git3kw0o6z0PgvOlBcwlQBBZ?=
 =?us-ascii?Q?BpFbgY2S/t94ahg0wWol4tBwKj5rlSo1WxEqFai2FcchwLpcMatkt1X7NQV0?=
 =?us-ascii?Q?M5zKmP8Hf4C2//9cv6Bbzy+2aMiZAVFZLv+5VZ/2zQUHZqiTBT/0YyxrKMT/?=
 =?us-ascii?Q?IWTNNjRxcsXNdTbvTOfx0Em1j+rKmJzajOJNRrvaH1U0ZhFJSDU+u9abAM6W?=
 =?us-ascii?Q?/7SyvHs8IaxOopuYRMTiIzPUzWH8G8i6W9+D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 01:57:12.9677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb54d46-e60b-4c9e-1a65-08de0ac4fe6a
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6278
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_185724_760547_A1CC3784 
X-CRM114-Status: GOOD (  14.26  )
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
 .../bindings/pinctrl/cix,sky1-pinctrl.yaml    | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
new file mode 100644
index 000000000000..6c83eb47f974
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/cix,sky1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cix Sky1 Pin Controller
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
+      - cix,sky1-iomuxc
+      - cix,sky1-iomuxc-s5
+
+  reg:
+    items:
+      - description: gpio base
+
+required:
+  - compatible
+  - reg
+
+# Client device subnode's properties
+patternProperties:
+  'pins$':
+    type: object
+    additionalProperties: false
+    patternProperties:
+      '(^pins|pins?$)':
+        type: object
+        additionalProperties: false
+        description:
+          A pinctrl node should contain at least one subnodes representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, and drive strength.
+
+        properties:
+          pinmux:
+            description:
+              Values are constructed from pin number and mux setting and are
+              defined as macros in arch/arm64/boot/dts/cix/sky1-pinfunc.h directly.
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          drive-strength:
+            description:
+              Can support 15 levels, from DS_LEVEL1 to DS_LEVEL15.
+              defined as macros in arch/arm64/boot/dts/cix/sky1-pinfunc.h.
+
+        required:
+          - pinmux
+
+additionalProperties: false
+
+examples:
+  # Pinmux controller node
+  - |
+    #define CIX_PAD_GPIO012_FUNC_GPIO012 (11 << 8 | 0x0)
+    #define DS_LEVEL4 (4)
+    iomuxc: pinctrl@4170000 {
+        compatible = "cix,sky1-iomuxc";
+        reg = <0x4170000 0x1000>;
+
+        wifi_vbat_gpio: wifi-vbat-gpio-pins {
+            pins {
+                pinmux = <CIX_PAD_GPIO012_FUNC_GPIO012>;
+                bias-pull-up;
+                drive-strength = <DS_LEVEL4>;
+           };
+        };
+    };
-- 
2.49.0



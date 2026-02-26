Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF1AFC5922
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YpT8lCKbPssC4CKbfQp21d42km8p0Z/sscdsNWw8Vc=; b=brz4OT7tDj8Ay0tRUQjx0I9+XC
	a+1tVViF1ySidAiBu3OdoPMJncrJangSvR5sLeSYNv8NxV1Yfj6BgYACFhWAD+4Y/NNb1tYPPVCPk
	iEcl4i+XD4QKpf6L5edr9s/VIuFr+BvquiPR6guKwUUvfqseplAe2BJ4wgz0p7RYGPw3z9j1wVIY3
	rw8+fUqAcqfuHP6IQDooNquUm6kxF3shY1QGXbovFxn8gEAx1pis8om41SHQnB2Hj3VHzfcXjcHqE
	q3Zx5CukxLBO9F8rracVWwb1XRdGaDeKUqcYhC0RxPg58N/zvKvRBHAHnXkH4T0Yp08zcrFZmKSc0
	D0FESsxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYeD-00000005uva-2kCj;
	Thu, 26 Feb 2026 10:31:09 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYe6-00000005usG-3el0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 10:31:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grsgI/H7cPhX4iFE9HnE4fmHDpZsFmn10YEs7ORRmG1y/DQUHNjbwjkOpft1Erjw+Q3QgHnR3ip7jpgP9c2hpOk/9gis/B1ezc11s+wjIioRGM1J9mNOszBaqFFogZHnNfUSXNV2csuOeRLmfLiImWjfC24l7CKCdlL5IyNZOqaqSgnm55HdgX6PMyIH+iHeG47WK4rMAq7hq/tsUh02wkdVr13r/6XXy8FcsPVIGCefG5Fa5udl3Dh0JYLsjZ/spnIDy8ZIuvGP3sGKEBWO9orFHHBP0rnNMID8dW4ZJuYuCEV3UJbRtUNwo82RS+ZdI/rb6bYC46Dq5gmH6wAIoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YpT8lCKbPssC4CKbfQp21d42km8p0Z/sscdsNWw8Vc=;
 b=SpfwwH9u+gzzIuEQyDfhf/lVFLxstjTLvh039rBXTurAwbbaOqRPhcOBd7Gv+acNFrNi6S5xTQpdek3RAoqjQ+4EkxIwBANV2a/WJrG2Nvmxshzzxu0pYnKJlLb4qDMpc58dg69/4IqHhr8ho90xmRB3w8kcQSkRPl0ZTW1IdYGS6mdB45vQkPtGNJAdZV7GWa7FQLDlg0iXCTfyY78I3IjPUwk9IZWRGhqRTfANF7QpCod2kGW8puYThc+xNxTSi97q0hHnPj36i9hBYbnGQbl1reyZcVaR2GvltcVUt50ebGmzAjvgGq53M15xPK2Y37uYwQwV7HjlhQ0nnPbE3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YpT8lCKbPssC4CKbfQp21d42km8p0Z/sscdsNWw8Vc=;
 b=aoIdZ6ha1Q/3yeVAsNDkkII6HNQ4SXv4c7V+fYZOv0YpkfU5c60fY2pKPTBECMCI1Nvu9ScgUmYdfBadncbCyC8qsQyodrJOVtw68mRBTYyrsbYguswutUNAZg8o+7hEVytoKtTJC/7x0mgCKkajS6dkZPWRvxc6DC4hPlcKisz2WJCiOCsd1KNEBvBifzQHc8syjPWb+eqq4LV3AXuqVnwaunKkMv8q78Dx0nOd+2Qr1+YEuL9O63IlJEgV1EoREGyC2mRqKwm9+C/rTDibD0cMmksegruxHXB8vvJqdHIQYctzgl2as2GmBdX84AoVmHcV4RUVmOvFusQXzgqzMA==
Received: from AS4P250CA0025.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::15)
 by PRAPR10MB5204.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:299::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 10:30:54 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::98) by AS4P250CA0025.outlook.office365.com
 (2603:10a6:20b:5e3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 10:30:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:30:54 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:33:01 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:30:53 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:18 +0100
Subject: [PATCH v6 03/12] dt-bindings: bus: document the stm32 debug bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260226-debug_bus-v6-3-5d794697798d@foss.st.com>
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
In-Reply-To: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan
	<leo.yan@linux.dev>, =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>, Linus Walleij <linusw@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <cristian.marussi@arm.com>,
	<jens.wiklander@linaro.org>, <etienne.carriere@foss.st.com>, Sudeep Holla
	<sudeep.holla@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9B:EE_|PRAPR10MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e8a6208-3d37-4aaf-4159-08de75221f0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013|921020|13003099007;
X-Microsoft-Antispam-Message-Info: TTS9YKd8hlT0rB5RuxcAditS6xJswtUNUikHzjaDSm0xns/uJfdx693WBbsu83buNJery+/Gr22UKRDDCX4ZI0q2714KxafpHiPTbPLDjqz+y6g8jHcPDHYrapVKXZF9OeBiuTrG5J6I8nymsgPE9tknOJUhzFiYtcoa4045r2wbO2dc/H771kCosHUzgssAfI5vqbkhcLrxv0j+RfVX4IG6o0l8wVS39h3guF0JFvfMPk+mhXm3jd7AtqBsiiSlrDjIFnM9Vk3Hu9SwfoWzupgqrGdn9lVXZhG6LZ2dK/E04MFiXyoQroi0v7YHVZkZ8v/PtkyTYIkcYhqO3RZqzZ4M3ER0J1PMwhRuVQ/68YsYEU1lZsrc7MynspJTYtggK3bkOa4v2NdGdcxuHweKhmibfxed3Arna8HCuqvNknSsAxwmZbE5D53kwEwGtNVDqVubgQWlL1C4A8Ax29cLIsN4xyksqKY9lb/Pa/KO86YEYxxk28wUyq9kvLXPgpe9ULN9qqkpUvRGYTa7YTvmyAB8OZ8/iojmwNjx7uT6sI4+ksLl6WB8DYkJL2Cl3DdzrJHNXqwe4Fs1LPFCdwSLssmItPyA0p9a7dOwGNpyTViTPc3FfrhvEC86uWZYrcwq3nhZ+Bn9/XnmSCLQjZgwsdlfR9652Cslt5K9udWJ9pnO02KgT3HKIepx1ptngkMtuBBpCCdvJcchRIjqiJDMFRCqOJTguX3vnhlsN2fWFcymYBXMpZEVK292qMBpf2ipWPuZhDtiD8NUMWtG8DkADQvjSzuUWHqJfFSMe22+croD3OKSXK//EGBf5bZPJL1B
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013)(921020)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uST5a7nDkEnTEb7LadsfPU1FssS45Z0jCnMPeBG/ZrDrTu/Ze0TqLHI0aF+JPAnsHJp7JU2ShATdiZ4XBIVAQMcqH/bPrvLzBTgXuAJUw86ra04OWDxoHVDXWCXpeF1sHLNyf4PlXLU8/1PTQ8XPtYNyjaQCYwPKZEhiWNcj47sJeZiS4Y564Vd4x1q0lRZJrwoqk0BwIsm4G61OcQ4VxErbEqJ6KqSotwPm3OVJVnfeM+N5oQ8zYX4FClnhZuDBfywzvfvidUmz5YqaRNgtYU8nedNawt5DzE/RtoGp2dxx3qfGvbshBc9WX2dSK3CvcAMal4vxBMbBx23KOnvf9/7HgmEU+tiCDvUhImZRXgE2i8H2j6pAKeP/VQ7BZ+apAQfYImJX8jFiOBJ7vB0oc2IR71/A4Aec2IQJdNO66Gr3rNvFFeD6q234U9SYqfnA
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:30:54.2653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8a6208-3d37-4aaf-4159-08de75221f0e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_023102_916453_DB7BA813 
X-CRM114-Status: GOOD (  10.12  )
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

Document the stm32 debug bus. The debug bus is responsible for
checking the debug sub-system accessibility before probing any related
drivers.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
new file mode 100644
index 000000000000..6c74433efbe3
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/st,stm32mp131-dbg-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 Coresight bus
+
+maintainers:
+  - Gatien Chevallier <gatien.chevallier@foss.st.com>
+
+description:
+  The STM32 debug bus is in charge of checking the debug configuration
+  of the platform before probing the peripheral drivers that rely on the debug
+  domain.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - st,stm32mp131-dbg-bus
+          - st,stm32mp151-dbg-bus
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges:
+    minItems: 1
+    maxItems: 2
+
+  "#access-controller-cells":
+    const: 1
+    description:
+      Contains the debug profile necessary to access the peripheral.
+
+patternProperties:
+  "@[0-9a-f]+$":
+    description: Debug related peripherals
+    type: object
+
+    additionalProperties: true
+
+    required:
+      - access-controllers
+
+required:
+  - "#access-controller-cells"
+  - "#address-cells"
+  - "#size-cells"
+  - compatible
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+
+    dbg_bus: bus@50080000 {
+      compatible = "st,stm32mp131-dbg-bus";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      #access-controller-cells = <1>;
+      ranges = <0x50080000 0x50080000 0x3f80000>;
+
+      cti@50094000 {
+        compatible = "arm,coresight-cti", "arm,primecell";
+        reg = <0x50094000 0x1000>;
+        clocks = <&rcc CK_DBG>;
+        clock-names = "apb_pclk";
+        access-controllers = <&dbg_bus 0>;
+      };
+    };

-- 
2.43.0



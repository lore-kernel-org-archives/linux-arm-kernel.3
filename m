Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D6EC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 07:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bbn5Q3XSuNaGGEOu1W5P3SYFc2Dd2MiUKvE+QwaI/c=; b=zr4+6yilJ1Cd3qSg0Pobs7C7AC
	yOW1VZWZi9mDUyGo/n638rTC0Esh/r+Ccy1dTS6rX5xXSf0XEkZ50m90sG5ORVzcik1jYTv6oDSDd
	U4OZv/cLnLqAjQomFr4YM7V8j40R15/3aCsuXRPTGknB/pIiPXP8qlTPjpRibVMzVp+Mks7GPrlns
	5eAdAuoUuPoSlF3zPM1rEuvRdEEuILJiGLtG6QvdUWmgJnoW9wdKq03CvKnVX6hEWeY8TAxt3UQDN
	iv/YLoY9YAeIrWSBfCfP4sy73XxwtZuhag9wAntdPMJ3hKEDX7ObAjVgvOfpdvFXuxs92B3s83oba
	T5UnDOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5GL-0000000EyAW-1Mwb;
	Thu, 05 Jun 2025 07:43:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN4CF-0000000Erl1-2QsL
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Jun 2025 06:35:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8bbn5Q3XSuNaGGEOu1W5P3SYFc2Dd2MiUKvE+QwaI/c=; b=b68EQR+dTBx8A311yh8Zbp/BL4
	LCM1i+SDSl3Er4no7AZNjznGDR6eSt9TTT1H5FHohluQ5VqN/Kl4xJDDXQSDZGcaLZmBsk7kN9KtM
	rQneiTdD3xO+mDlZXeHFwcsoGePd5uQri0ALVVCNCzT7bxEl7Jo+yoZgQN8/tcy4E6oyRoDhcs+t8
	xco7zKKHLrLqbRKyFTLsuSCUJFa37AZQrDSCsm3ChOidVDjTTIO+GZ5dZ5WB3V8/I2BzzMVgi9kLx
	WwbouiO9BseG1FGie3b0GVol7LH2QJcU9Rlxnd2c5XOo5nIvDMOxjf09jMQgCSWcnlqb5jdrpaqi/
	OvX+rTFA==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN4CB-0000000158K-2oRw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 06:35:26 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5556ZFPm1031508;
	Thu, 5 Jun 2025 01:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749105315;
	bh=8bbn5Q3XSuNaGGEOu1W5P3SYFc2Dd2MiUKvE+QwaI/c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=T2LNqz+hLs0EGw+wDrULIgS6CMdi2rxI7/A2VLKwYiDf6UwA0OXak9hrs18YTHL2R
	 ObelECI/VRXx8+6VUTsW+rnzznTdSZxzW/fVwWxMAZrLXgJCV4lazSy1bQzr2oGaFJ
	 tW6OoED8Awi4BmwrBwnLAKqYYrM5oBT61vHuZRFU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5556ZFXi948576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 5 Jun 2025 01:35:15 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Jun 2025 01:35:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Jun 2025 01:35:14 -0500
Received: from a0497641-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5556Z7VZ3168702;
	Thu, 5 Jun 2025 01:35:11 -0500
From: Neha Malcom Francis <n-francis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <n-francis@ti.com>
Subject: [PATCH v4 1/2] dt-bindings: soc: ti: bist: Add BIST for K3 devices
Date: Thu, 5 Jun 2025 12:05:05 +0530
Message-ID: <20250605063506.2005637-2-n-francis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605063506.2005637-1-n-francis@ti.com>
References: <20250605063506.2005637-1-n-francis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_073524_045595_5A89ACAE 
X-CRM114-Status: GOOD (  11.80  )
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

Document the binding for TI K3 BIST (Built-In Self Test) block.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
---
No change since v3

 .../bindings/soc/ti/ti,j784s4-bist.yaml       | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml
new file mode 100644
index 000000000000..a73691cf5624
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/ti/ti,j784s4-bist.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 BIST
+
+maintainers:
+  - Neha Malcom Francis <n-francis@ti.com>
+
+allOf:
+  - $ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
+
+description:
+  The BIST (Built-In Self Test) module is an IP block present in K3 devices
+  that support triggering of BIST tests, both PBIST (Memory BIST) and LBIST
+  (Logic BIST) on a core. Both tests are destructive in nature. At boot, BIST
+  is executed by hardware for the MCU domain automatically as part of HW POST.
+
+properties:
+  compatible:
+    const: ti,j784s4-bist
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: ctrl_mmr
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - ti,sci-dev-id
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        safety-selftest@33c0000 {
+            compatible = "ti,j784s4-bist";
+            reg = <0x00 0x033c0000 0x00 0x400>,
+                  <0x00 0x0010c1a0 0x00 0x01c>;
+            reg-names = "cfg", "ctrl_mmr";
+            clocks = <&k3_clks 237 7>;
+            power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>;
+            ti,sci-dev-id = <234>;
+        };
+    };
-- 
2.34.1



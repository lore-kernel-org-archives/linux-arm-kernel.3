Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4800BD69113
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 14:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DEqsPZvCDv6fZXTIc5Sjc+0RGxvXQb4IPrR1wEGEkGg=; b=qrWrVd60L0bJd2w+/nPC4ol8nT
	VJoDLjFKazpWqwdFHYITWPAwCzOnjkRsyjYQOE5L54DHEsQgza6+pnn+c4jYqLOjeGauEH07IQp8t
	BNm5ChKcF783JNm/hjm9lit1+yKH/n77kL15XaCc0ljm/9xWSAf2dv7b+MnXyftXI88ETPm1CtLes
	zrUoTkNL9BplwiP0plkZv101URtKhpw1m6S4RHmXPYCQWJi/vsksqdcHmWEA2xwjqTeq6/EBIZZ49
	TGXYg9Uu0uxj+GTPunMmdubppTvSbhiMX9v6L9t9kAZvtZYfk+SBryM74XZuPqE9RXMYyieMKrJZy
	oujPdGSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfE4-0000000Fiod-0EFU;
	Thu, 28 Nov 2024 14:10:36 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfCA-0000000FiTs-2hXL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 14:08:40 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4ASE8Y2Y1171260
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Nov 2024 08:08:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732802914;
	bh=DEqsPZvCDv6fZXTIc5Sjc+0RGxvXQb4IPrR1wEGEkGg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Mma1VoFvfoyiQ7mc3d7kDS/wHTAJMVOs698qQ5Pvk/rMDvaYLSWWJUWwsqHiQNPhZ
	 g4hEYmUsL/O2oXjDQGkt0z7sn/4QdS2jvUHfVhqWB/XqDIATzMAo+7y9Cu8s3hcqOJ
	 xeeADVIvOcGPVxXFW+yC88bV5jkxv2iF9jOINKoE=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4ASE8YhD013206
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 Nov 2024 08:08:34 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 28
 Nov 2024 08:08:33 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 28 Nov 2024 08:08:33 -0600
Received: from a0497641-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ASE8Qce019782;
	Thu, 28 Nov 2024 08:08:30 -0600
From: Neha Malcom Francis <n-francis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <n-francis@ti.com>
Subject: [PATCH 1/2] dt-bindings: misc: bist: Add BIST dt-binding for TI K3 devices
Date: Thu, 28 Nov 2024 19:38:24 +0530
Message-ID: <20241128140825.263216-2-n-francis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128140825.263216-1-n-francis@ti.com>
References: <20241128140825.263216-1-n-francis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_060838_772905_4BDF05EA 
X-CRM114-Status: GOOD (  13.21  )
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

Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
---
 .../bindings/misc/ti,j784s4-bist.yaml         | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/ti,j784s4-bist.yaml

diff --git a/Documentation/devicetree/bindings/misc/ti,j784s4-bist.yaml b/Documentation/devicetree/bindings/misc/ti,j784s4-bist.yaml
new file mode 100644
index 000000000000..bd1b42734b3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/ti,j784s4-bist.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/ti,j784s4-bist.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 BIST
+
+maintainers:
+  - Neha Malcom Francis <n-francis@ti.com>
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
+    minItems: 2
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
+  ti,bist-instance:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      the BIST instance in the SoC represented as an integer
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - ti,bist-instance
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        bist@33c0000 {
+            compatible = "ti,j784s4-bist";
+            reg = <0x00 0x033c0000 0x00 0x400>,
+            <0x00 0x0010c1a0 0x00 0x01c>;
+            reg-names = "cfg", "ctrl_mmr";
+            clocks = <&k3_clks 237 7>;
+            power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>;
+            ti,bist-instance = <14>;
+        };
+    };
-- 
2.34.1



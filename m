Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4654CC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 07:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZ5UskzI6u+j764fulD/A8JzZ9JEBLMMoopJxA4HhdA=; b=1QhPnyyi5YxTmHoiAtEcq/9w4T
	BgqvmEsUX1Ox4mdCtZVx6WXGkslWJkYFXlR3MWAQT9hArFIDIzklwmNM7G9ah3ilvIoSxDAXkxCxo
	xGq/X7GSeICfMr+m5N0nMvLjw90b/b73aJtXHbG9mdiLHXn0yhjQ8fI+r79jM+L0mWhD28doMtCX/
	bRxSTsBb/3g1tPHNLekQpaX0wwulcFzFhqhTCInQHD7Lk+jU6eohL7rOIsNdjXpAlVNJRI47l9nzo
	vsSxzvMXOsS5H6P2GykNW4fnHHUQRD0vizMVRQ6tlS9Git1Nwwk5RUtCHtJWRVfsOikGV1rt427Ks
	8qouyKkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6Xb-0000000EJzH-2eHx;
	Wed, 14 May 2025 07:28:35 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6QQ-0000000EHmj-0HPk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 07:21:11 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54E7L4Ja2554545;
	Wed, 14 May 2025 02:21:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747207264;
	bh=sZ5UskzI6u+j764fulD/A8JzZ9JEBLMMoopJxA4HhdA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jdAHnaAK7N8PiSsGph5AaH1cL6twz5oh0TyrroP3xToGIvpheG29g2FWkgqmkTBTQ
	 W6pgxm4PsjcBIHVufW73tIVh3Dawi3N729YA2MD7McVgHIRppDYzS09K/0yhvzyzHJ
	 IgGSUZzSWzctHY3EEJhRgtOQ/XzO/0KioJEqSZ0Y=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54E7L4Yn3101513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 14 May 2025 02:21:04 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 May 2025 02:21:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 May 2025 02:21:04 -0500
Received: from a0497641-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54E7Kuea082928;
	Wed, 14 May 2025 02:21:01 -0500
From: Neha Malcom Francis <n-francis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <n-francis@ti.com>
Subject: [PATCH v3 1/2] dt-bindings: soc: ti: bist: Add BIST for K3 devices
Date: Wed, 14 May 2025 12:50:55 +0530
Message-ID: <20250514072056.639346-2-n-francis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514072056.639346-1-n-francis@ti.com>
References: <20250514072056.639346-1-n-francis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_002110_289400_6BDACC85 
X-CRM114-Status: GOOD (  13.72  )
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
Changes since v2:
- move from redefining ti,bist-under-test to using existing ti,sci-dev-id

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



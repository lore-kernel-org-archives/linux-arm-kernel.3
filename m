Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CABCEFCD80
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDk3y7kpS2VdUf8xuIK/B77qzlAoXAb+CIJ/uBVDXFw=; b=nOkmJ/Ope9VRgbEAD+F8wPuxhN
	lbdEXu2gHtoBayeWTs/ImWNrXOaIGv3ykX4KvAjycw9afHJM6mGF8XDrfvQ/dKyfnt2fkfUT3wL3W
	/0+o/cfhkAqQ47A7Fba7JMKeFVCgIkm2OPRptEhVNVP94ffxIQbEd4XsE0ZImMzeeJem26ZO8T3Hp
	IkSXuDK7VdCL1vpbZorXMamBaaE3dQz8y69keINECWndRLdLYcQDW+Z11zdThmy6umR5PdNPjEAip
	WRxGkQ+wr/Y6iZlK+eG+WnmSSO9TkEgcp+XsFWZTChwO7CoXmt2dP9F3X6zrxdkKXeU5R64sprG/3
	wa/4dg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXY0-000000073Sg-3Go0;
	Mon, 09 Mar 2026 10:09:12 +0000
Received: from mta-65-227.siemens.flowmailer.net ([185.136.65.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXXr-000000073OH-0zq1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 10:09:07 +0000
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026030910085896507e8496000207f5
        for <linux-arm-kernel@lists.infradead.org>;
        Mon, 09 Mar 2026 11:08:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=iDk3y7kpS2VdUf8xuIK/B77qzlAoXAb+CIJ/uBVDXFw=;
 b=U8Icu+/QHOmg/jikK5z/4pYUjTMTs6tH2HJLQIqG4wnaeMwMKVnlts+XFJr090CzX33IQW
 ueGYUS7esEDvvBoXKT2GMi//o9tPgx6YO+VWTPyNBoJcPC/63FNBaYnIM0XNt/pjlvAs/wt3
 Ip1ic2/kGawfyA58hCkdDxmWc8vieo+9dMo1m/d4v3spHyAic09mZoE4fHRVV7kEP9l7nl4T
 nUOWxETyTRVpklwREgvj/2S7q83H2NlfzhVBFHIMZfrxCSvD8BFSDQIv5zUdj83w1OXZLMER
 KYbpfm95h7tdpFD3ABuHbWR5c6UyIQqTJ9M70rEid+fe2R9d3ZcFoRlg==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Davis <afd@ti.com>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Abraham I <kishon@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: soc/reset: ti: add binding for k3 platforms reset module
Date: Mon,  9 Mar 2026 11:07:53 +0100
Message-ID: <20260309100800.1134701-2-alexander.sverdlin@siemens.com>
In-Reply-To: <20260309100800.1134701-1-alexander.sverdlin@siemens.com>
References: <20260309100800.1134701-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_030904_767983_48415A66 
X-CRM114-Status: GOOD (  13.27  )
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

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Add DT binding for Texas Instruments K3 Multicore SoC platforms reset
module present on AM64x and newer members of the K3 family and consists of
the RST_CTRL, RST_STAT, RST_SRC and RST_MAGIC_WORD registers.

The planned usage is to provide reset reason information.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 .../bindings/reset/ti,am64-rst.yaml           | 39 +++++++++++++++++++
 .../soc/ti/ti,j721e-system-controller.yaml    | 11 ++++++
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/ti,am64-rst.yaml

diff --git a/Documentation/devicetree/bindings/reset/ti,am64-rst.yaml b/Documentation/devicetree/bindings/reset/ti,am64-rst.yaml
new file mode 100644
index 0000000000000..5a17cee9c6528
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/ti,am64-rst.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/ti,am64-rst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 Multicore SoC platforms reset module
+
+maintainers:
+  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
+
+description: |
+  Texas Instruments (ARM64) K3 Multicore SoC platforms reset module is present
+  on AM64x and newer members of the K3 family and consists of the RST_CTRL,
+  RST_STAT, RST_SRC and RST_MAGIC_WORD registers.
+
+properties:
+  $nodename:
+    pattern: "^rst@[0-9a-f]+$"
+
+  compatible:
+    items:
+      - const: ti,am64-rst
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    rst@43018170 {
+        compatible = "ti,am64-rst";
+        reg = <0x43018170 0x10>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index f3bd0be3b279f..a2071a1668f96 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -86,6 +86,12 @@ patternProperties:
     description:
       This is the DSS OLDI CTRL region.
 
+  "^rst@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/reset/ti,am64-rst.yaml#
+    description:
+      The node corresponding to SoC reset module.
+
 required:
   - compatible
   - reg
@@ -133,5 +139,10 @@ examples:
             compatible = "ti,j784s4-pcie-ctrl", "syscon";
             reg = <0x4070 0x4>;
         };
+
+        rst@18170 {
+            compatible = "ti,am64-rst";
+            reg = <0x18170 0x10>;
+        };
     };
 ...
-- 
2.52.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4143FE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 11:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hN2ejgxwTopXoTdMXO2eZ6jbTHvD1vhZ5VFskldaUqg=; b=3wqDq50PIZ0a1w4xqdPucs0Gjx
	QWkcE9C/m9oqg5ea3J6csq6CGeGzhDm7JPFdfoBoFWaRrsTiHc7k4J6VEK2lVaUmuFEifZMI2OikG
	y/SL789Qu6knFlQSkLKucTX4vfZHrGefmMu9FsKEvWMV+dMB4cxt6THK4XN8NVJTQ6qjdIYNvCVEn
	KRjad7jzdFJOF/NwDua6jRTZ1o68rs+NhtVYslyGXpnHdiOHNSYfzmp/msKUQZ35sIcD+DapZJ3y5
	REhvk+tcF6QI1IfAY37U6aiiUydBXEU6QPk7pOAH2A/Goa3K6l7iqKH/d9n/7bauUIMsdYcOLwN4e
	iDDrsb1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKzT-0000000Eikc-1p2K;
	Wed, 11 Dec 2024 11:34:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKvN-0000000Ehnb-2GGe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 11:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733916637; x=1765452637;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=iPOrmQo40/Y6+1KGTiFI9GGLEnsZAFtFPdeZ4AoSdPk=;
  b=w0083qfkdsmZT2MGSriA/eaJANxhbwNSkl3F3z3aE/GKSkTsoP2kz9It
   8aUjlTYNwRhbsHKWVM28KxivKFZg0cWozzNuWglleHJVHj2NrX/vhA752
   7LjlZczGTmo78qWifPkpNbMo1a1epvrBtQ5f+mfWQdWJVTtDSduF+AGUb
   Q1e1b4ffcVTwHP8T6A47Oe8Xbl0p/6HCpNfU+OkQrrKHKhH2/ob63K8dK
   MlzTg+ZwqpuaxrFN/EtrpnmGuyRW66eY+ZZ93OgH+2bDBauEUPpIjV+BX
   xyiq9I6WjYifNxh3F5jeezXQUZL07TsLJPt/ck8GoSJi4ltEMgJRrCv5o
   g==;
X-CSE-ConnectionGUID: z6mtNcPgQSWb4wbULwIckA==
X-CSE-MsgGUID: PZhcstPRSaC5msD+A2iNsg==
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="35084913"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Dec 2024 04:30:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 11 Dec 2024 04:30:03 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 11 Dec 2024 04:29:59 -0700
From: Charan Pedumuru <charan.pedumuru@microchip.com>
Date: Wed, 11 Dec 2024 16:59:22 +0530
Subject: [PATCH] dt-bindings: mfd: atmel,at91sam9260: Convert to json
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241211-matrix-v1-1-5ef0104a3af4@microchip.com>
X-B4-Tracking: v=1; b=H4sIAJF3WWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0MD3dzEkqLMCl1jAwMjQzNzs7QkszQloOKCotS0zAqwQdGxtbUAbCM
 x6VgAAAA=
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Charan Pedumuru
	<charan.pedumuru@microchip.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_033037_662026_C109EB05 
X-CRM114-Status: GOOD (  12.61  )
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

Convert old text based binding to json schema.
Changes during conversion:
Add a fallback for all compatibles as the IP core is compatible
with `syscon`.

Signed-off-by: Charan Pedumuru <charan.pedumuru@microchip.com>
---
 .../bindings/mfd/atmel,at91sam9260-matrix.yaml     | 54 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/atmel-matrix.txt       | 26 -----------
 2 files changed, 54 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-matrix.yaml b/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-matrix.yaml
new file mode 100644
index 000000000000..0e827882823f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-matrix.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/atmel,at91sam9260-matrix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip AT91 Bus Matrix
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+
+description:
+  The Bus Matrix (MATRIX) implements a multi-layer AHB, based on the
+  AHB-Lite protocol, that enables parallel access paths between multiple
+  masters and slaves in a system, thus increasing the overall bandwidth.
+
+properties:
+  compatible:
+    anyOf:
+      - items:
+          - enum:
+              - atmel,at91sam9260-matrix
+              - atmel,at91sam9261-matrix
+              - atmel,at91sam9263-matrix
+              - atmel,at91sam9rl-matrix
+              - atmel,at91sam9g45-matrix
+              - atmel,at91sam9n12-matrix
+              - atmel,at91sam9x5-matrix
+              - atmel,sama5d3-matrix
+          - const: syscon
+      - items:
+          - const: microchip,sam9x60-matrix
+          - const: atmel,at91sam9x5-matrix
+          - const: syscon
+      - items:
+          - const: microchip,sam9x7-matrix
+          - const: atmel,at91sam9x5-matrix
+          - const: syscon
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
+    matrix@ffffec00 {
+        compatible = "atmel,sama5d3-matrix", "syscon";
+        reg = <0xffffec00 0x200>;
+    };
diff --git a/Documentation/devicetree/bindings/mfd/atmel-matrix.txt b/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
deleted file mode 100644
index 6e5f83614e83..000000000000
--- a/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-* Device tree bindings for Atmel Bus Matrix
-
-The Bus Matrix registers are used to configure Atmel SoCs internal bus
-behavior (master/slave priorities, undefined burst length type, ...)
-
-Required properties:
-- compatible:		Should be one of the following
-			"atmel,at91sam9260-matrix", "syscon"
-			"atmel,at91sam9261-matrix", "syscon"
-			"atmel,at91sam9263-matrix", "syscon"
-			"atmel,at91sam9rl-matrix", "syscon"
-			"atmel,at91sam9g45-matrix", "syscon"
-			"atmel,at91sam9n12-matrix", "syscon"
-			"atmel,at91sam9x5-matrix", "syscon"
-			"atmel,sama5d3-matrix", "syscon"
-			"microchip,sam9x60-matrix", "syscon"
-			"microchip,sam9x7-matrix", "atmel,at91sam9x5-matrix", "syscon"
-- reg:			Contains offset/length value of the Bus Matrix
-			memory region.
-
-Example:
-
-matrix: matrix@ffffec00 {
-	compatible = "atmel,sama5d3-matrix", "syscon";
-	reg = <0xffffec00 0x200>;
-};

---
base-commit: 1b2ab8149928c1cea2d7eca30cd35bb7fe014053
change-id: 20241210-matrix-30021676fb6f

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@microchip.com>



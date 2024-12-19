Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BDFE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 05:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l19owm37vrWhE2A7+0xnE4b78Cf00LYyc5vxRMMRKJE=; b=VD551NrtCaeScevOeo5PzympLH
	FQP1nW8+FZLtsN//G3KGfncQRUktEgVlrlyG2LtLUvNCpWpUGOZu+N2S4jP0P4ApLTI79DeLlkBEe
	ODnpOo/jMgAx9fEVwsT0dL9TjmAtxE1Le3IRFF/mFBr+aTkb7XxfmVekqoMjLsA51TZICaYKO9Tx6
	glp8apea3F4wpa4lwGJXkGy/NDQdgu+Zn+jzhjDlf78BBg/udjlOz3z865Oj6g4ppuek34BmJvPEz
	7RQGU4wZqw8xvro9rMRkJbmKcZXnxVq/L4VhOKV0oQ474HBwxu5WhrD88CZnsoCNgDFhcONPTu3/W
	cgAjPfgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO9L1-00000000tRG-1SOa;
	Thu, 19 Dec 2024 05:44:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO9Ju-00000000tIC-12iZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 05:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734587014; x=1766123014;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=HtvxuCvfR1+WAuH51wmAgJepZtVKamVQJfF0Nl56tY0=;
  b=ysZ/R4DaVV4L5AZBIO91hl+FEpuN5+q0lxRboxv3crE3iw6gi9byot90
   jgI2wrgsI+FaHmVPHpiwbVeRTlR4eOpq6Ld81sgNzrY/DQUUtWozCqZSO
   m54XO74P9uHbx2acry0fet6pSOqlN+1VUXkMO+uA2owZ3YvoQ+B+D2oN+
   zM9rAfaZPb/tSWfyzCdfrN1yX19qp8vTgrrP4fz3QPzYSKwyyG/EaakB1
   1nJsdLocYG8tkM2GVdtVhcOFcY1z2p2uhZw4+hLY9bQVNBQGPVXTo71v0
   TKc1GEZ/7qX81kO3mh6L/QmvhdBda6hyRbIwZeOycBpgyYLI7Yrki6Os2
   w==;
X-CSE-ConnectionGUID: hU4v6kOuSsqVI5vwQceH6A==
X-CSE-MsgGUID: bZlwIm3LQBKFdgmbK5AFLw==
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; 
   d="scan'208";a="266956083"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Dec 2024 22:43:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 18 Dec 2024 22:43:31 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 18 Dec 2024 22:43:26 -0700
From: Charan Pedumuru <charan.pedumuru@microchip.com>
Date: Thu, 19 Dec 2024 11:12:50 +0530
Subject: [PATCH] dt-bindings: mfd: atmel: Convert to json schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241219-gpbr-v1-1-e19a562ebf81@microchip.com>
X-B4-Tracking: v=1; b=H4sIAFmyY2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0ND3fSCpCJdI5PEZAMLI+PklFRTJaDSgqLUtMwKsDHRsbW1AGrrreB
 WAAAA
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Charan Pedumuru
	<charan.pedumuru@microchip.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_214334_371268_2C789FAD 
X-CRM114-Status: GOOD (  13.76  )
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
The text binding is misleading, add a fallback `atmel,at91sam9260-gpbr`
for both `microchip,sam9x60-gpbr` and `microchip,sam9x7-gpbr` which is
missing in old binding and `microchip,sam9x60-gpbr` is not a fallback
for `microchip,sam9x7-gpbr`.

Signed-off-by: Charan Pedumuru <charan.pedumuru@microchip.com>
---
 .../bindings/mfd/atmel,at91sam9260-gpbr.yaml       | 44 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/atmel-gpbr.txt         | 18 ---------
 2 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-gpbr.yaml b/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-gpbr.yaml
new file mode 100644
index 000000000000..f805545aa62a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-gpbr.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/atmel,at91sam9260-gpbr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip AT91 General Purpose Backup Registers
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+
+description:
+  The system controller embeds 256 bits of General Purpose Backup
+  registers organized as 8 32-bit registers.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - atmel,at91sam9260-gpbr
+          - const: syscon
+      - items:
+          - enum:
+              - microchip,sam9x60-gpbr
+              - microchip,sam9x7-gpbr
+          - const: atmel,at91sam9260-gpbr
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
+    syscon@fffffd50 {
+        compatible = "atmel,at91sam9260-gpbr", "syscon";
+        reg = <0xfffffd50 0x10>;
+    };
diff --git a/Documentation/devicetree/bindings/mfd/atmel-gpbr.txt b/Documentation/devicetree/bindings/mfd/atmel-gpbr.txt
deleted file mode 100644
index 3c989d1760a2..000000000000
--- a/Documentation/devicetree/bindings/mfd/atmel-gpbr.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-* Device tree bindings for Atmel GPBR (General Purpose Backup Registers)
-
-The GPBR are a set of battery-backed registers.
-
-Required properties:
-- compatible:		Should be one of the following:
-			"atmel,at91sam9260-gpbr", "syscon"
-			"microchip,sam9x60-gpbr", "syscon"
-			"microchip,sam9x7-gpbr", "microchip,sam9x60-gpbr", "syscon"
-- reg:			contains offset/length value of the GPBR memory
-			region.
-
-Example:
-
-gpbr: gpbr@fffffd50 {
-	compatible = "atmel,at91sam9260-gpbr", "syscon";
-	reg = <0xfffffd50 0x10>;
-};

---
base-commit: 91e71d606356e50f238d7a87aacdee4abc427f07
change-id: 20241211-gpbr-24ac0823cde5

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@microchip.com>



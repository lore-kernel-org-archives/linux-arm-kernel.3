Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF35C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 21:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJ1fXhF1lmeGt4zctYDYSgfIAdSnf1/fbfQDHIqPsOM=; b=IlEf2q++hfjfMSKS63Qg0MBQrf
	Fnr2j1mggm4oGPt0ZMVWb8vcIgNHpZ7JMQiuCVsVlHKWM2tpKsudbXnlBOmgVtWwH2NZiLqNXYpQV
	ivxSu/ljQvpAJB+WzRJHdhZea2vxeOfQz5ti1E2jxQ1E9vhYwHvjB6lnDc15epqi4cVT7YG3dxYNM
	0/CBUvp1nJIEUxljuSd6W8B5gLppOuYWKWPgegu+WoFU6r83OoKvChab1Cm6ElgtD14fhWHnmh9AC
	z6LW/NsqP0MpPXT/1afRhZZPhhV5G1I4wl1TyEE+gm+rUViwEPdvM7uSIhAze/49jpnwS+h2IWymi
	7/b1Gdmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Roy-00000003eVz-39Ki;
	Mon, 14 Apr 2025 21:58:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4RZ3-00000003afD-2sGS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 21:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1744666921; x=1776202921;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VCaMKVR89ookuZONPoMM9YW1f2EPtej4NWNimSc/EFo=;
  b=At9DhPKbyoGND5FXT0m7oRxeJ2n3HZGCDxkRV+e2X2tk8I/RTz0eXhRr
   EQ17rcDDWrZhQLNQMayktFBCdgsHZBRlZGIL7I8is2+pzub1l99niIMDS
   6Fulig/MC2WA2YJhSuSM2lMkk68bXPX50Vl8PnFD/voq/raqbY5qPGhOd
   /F5GxiduxwNqwU4pjzM0RIqNEpcQIuGVeBBL1A+axN9yjaOn5VoAcR36X
   2htLqItOS0jA+MFQ8Awafch4DOxY9FFCV5xaGR4k+K1fQq1QuaWZ5H/Yh
   uMHzsU4ngO36DJhcV4b2JFVljdtkmnB/HBVCLw+R2Qi2WH3eM0im+tgnn
   A==;
X-CSE-ConnectionGUID: jf75aQsXSneWELgtntpGWQ==
X-CSE-MsgGUID: D0dtunMcRnuRprEgLd2nHQ==
X-IronPort-AV: E=Sophos;i="6.15,212,1739862000"; 
   d="scan'208";a="40006675"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Apr 2025 14:41:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 14 Apr 2025 14:41:05 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 14 Apr 2025 14:41:05 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>, <sre@kernel.org>,
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 07/11] dt-bindings: mfd: syscon: atmel,sama5d2-secumod: convert to yaml
Date: Mon, 14 Apr 2025 14:41:24 -0700
Message-ID: <a999a719a652ec834f1176d69a3e9b207cbd63e6.1744666011.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744666011.git.Ryan.Wanner@microchip.com>
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_144201_793977_279F8B5F 
X-CRM114-Status: GOOD (  13.89  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Convert Microchip AT91 secumod to YAML format.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/arm/atmel,sama5d2-secumod.yaml   | 48 +++++++++++++++++++
 .../devicetree/bindings/arm/atmel-sysregs.txt | 25 ----------
 2 files changed, 48 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml

diff --git a/Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml b/Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml
new file mode 100644
index 000000000000..b1f766e333d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/atmel,sama5d2-secumod.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip AT91 Security Module (SECUMOD)
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+
+description:
+  The Security Module also offers the PIOBU pins which can be used as GPIO pins.
+  Note that they maintain their voltage during Backup/Self-refresh.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: atmel,sama5d2-secumod
+          - const: syscon
+      - items:
+          - enum:
+              - microchip,sama7g5-secumod
+          - const: atmel,sama5d2-secumod
+          - const: syscon
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    security-module@fc040000 {
+      compatible = "atmel,sama5d2-secumod", "syscon";
+      reg = <0xfc040000 0x100>;
+      gpio-controller;
+      #gpio-cells = <2>;
+    };
diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
index d3821f651e72..5ce54f9befe6 100644
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
@@ -46,28 +46,3 @@ Examples:
 		reg = <0xffffe800 0x200>;
 	};
 
-Security Module (SECUMOD)
-
-The Security Module macrocell provides all necessary secure functions to avoid
-voltage, temperature, frequency and mechanical attacks on the chip. It also
-embeds secure memories that can be scrambled.
-
-The Security Module also offers the PIOBU pins which can be used as GPIO pins.
-Note that they maintain their voltage during Backup/Self-refresh.
-
-required properties:
-- compatible: Should be "atmel,<chip>-secumod", "syscon".
-  <chip> can be "sama5d2".
-- reg: Should contain registers location and length
-- gpio-controller:	Marks the port as GPIO controller.
-- #gpio-cells:		There are 2. The pin number is the
-			first, the second represents additional
-			parameters such as GPIO_ACTIVE_HIGH/LOW.
-
-
-	secumod@fc040000 {
-		compatible = "atmel,sama5d2-secumod", "syscon";
-		reg = <0xfc040000 0x100>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-- 
2.43.0



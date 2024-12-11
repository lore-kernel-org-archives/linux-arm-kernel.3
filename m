Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E90E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 09:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fo7miwzOn84/5iqFPr0FEMjnc6Ri40rOmPqPlDZnbx0=; b=uY1+t6vMQFzZ+feixLGlvtjtgR
	3QYfS5NiiXPEfHnW/43Ij/+JtLdIcJwRQB6PcXZDYk1xtzTe206WW3wTkiOntI9c0lb0cG9cENgkl
	+bOShy1krDi0Oo5M375ccI/xJfaG5FYyR0+L0H19pXwzefKHIoUK3FQVMVOrzB7OSDlwBumR8W97y
	Cd0kc8HsNjEtOvlz81VU5OoKuvKEohrwsQ7NUPoIF2HciRdmw9wP/uZTR0Zwd2A/xRsn2B7rSbd/f
	VjwdVGMViCT1RsruYQ5YU9dO9dvEcfLf0T8RlV87/wkx1puDRe324zBWVCpWIdezpaOA+tSWO6QAE
	dTvKJJhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJOW-0000000EUjS-31GK;
	Wed, 11 Dec 2024 09:52:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJNR-0000000EUTw-3Vyh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 09:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733910689; x=1765446689;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=LzAaQ9/f27z5r4Rw3P4o4STEAG4bFLrOUEoWElzrSCg=;
  b=ib+TlcGOjLI7mORwOVYXUJWZ4wQL6jyfj1djmrLvoGxBEq/yB7tr7XN7
   poOtvelR8YuslhExkZ8Rio9z84CbVub+Ywxc15ZnlTH3CQ2bWlIQHwhYk
   SUFDpoSFV+KNf+3JDg4xwktAHb7yP6wzeD8FrszL+FVuObbL88fzd3447
   B2B+omjcn43NvZiUuiGm1cKf8XXF5sPmHDtSrKEBUmRwYWA72D6wx1D9T
   WXothGI326arI/4MwzpL2oPfCtb33wxXCzmEnS/k/Fxwz4V1en801K9KR
   iIH16VrGP9IeScAjbj09qosUHuQ+/YB59t7qaCp7Iwr/NT4B9cUyvXT+v
   Q==;
X-CSE-ConnectionGUID: GnpFG6FJQ6OCytt/AW6k6A==
X-CSE-MsgGUID: Tmq7ep6yT3ejLSoZb9pFJg==
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="39091181"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Dec 2024 02:51:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 11 Dec 2024 02:51:00 -0700
Received: from che-dk-mpulab01.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 11 Dec 2024 02:50:56 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 11 Dec 2024 15:16:15 +0530
Subject: [PATCH v2] ASoC: dt-bindings: sound: atmel-at91sam9g20ek: convert
 to json-schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241211-sound-atmel-at91sam9g20ek-v2-1-86a0e31e6af9@microchip.com>
X-B4-Tracking: v=1; b=H4sIAGZfWWcC/x2MwQqDMBAFf0X23ECy6iH+SukhNU+7VGPJWhHEf
 zd4GZjDzEGKLFDqqoMyNlFZUhF+VNR/QhphJBYnttw4dtbo8k/RhHXGVOidhtmPbPE1bwsfgaa
 t655K/8sYZL/fz9d5XovhgeRrAAAA
X-Change-ID: 20241210-sound-atmel-at91sam9g20ek-b0e9dee4533c
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrei Simion
	<andrei.simion@microchip.com>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Balakrishnan Sambath <balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_015129_897247_4F3556AC 
X-CRM114-Status: GOOD (  13.95  )
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

Convert atmel-at91sam9g20ek-wm8731-audio DT binding to yaml
based json-schema.Change file name to match json-scheme naming.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
Changes in v2:
- Add missing CODEC pin options to 'atmel,audio-routing' items.
- Drop 'minItems' from 'atmel,audio-routing' since enum defines valid connections.
- Add subsystem tag to subject.
- Add blank line between properties and fix typo.
- Add audio complex description.
- Link to v1: https://lore.kernel.org/lkml/20240214-at91sam9g20ek-wm8731-yaml-v1-1-33333e17383b@microchip.com
---
 .../bindings/sound/atmel,at91sam9g20ek-wm8731.yaml | 70 ++++++++++++++++++++++
 .../sound/atmel-at91sam9g20ek-wm8731-audio.txt     | 26 --------
 2 files changed, 70 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/atmel,at91sam9g20ek-wm8731.yaml b/Documentation/devicetree/bindings/sound/atmel,at91sam9g20ek-wm8731.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7f6334c96e0b753f83a1714a34514f101c2639c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/atmel,at91sam9g20ek-wm8731.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/atmel,at91sam9g20ek-wm8731.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel at91sam9g20ek wm8731 audio complex
+
+maintainers:
+  - Balakrishnan Sambath <balakrishnan.s@microchip.com>
+
+description:
+  The audio complex configuration for Atmel at91sam9g20ek with WM8731 audio codec.
+
+properties:
+  compatible:
+    const: atmel,at91sam9g20ek-wm8731-audio
+
+  atmel,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The user-visible name of this sound complex.
+
+  atmel,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: A list of the connections between audio components.
+    items:
+      enum:
+        # Board Connectors
+        - Ext Spk
+        - Int Mic
+
+        # CODEC Pins
+        - LOUT
+        - ROUT
+        - LHPOUT
+        - RHPOUT
+        - LLINEIN
+        - RLINEIN
+        - MICIN
+
+  atmel,ssc-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the SSC controller.
+
+  atmel,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of WM8731 audio codec.
+
+required:
+  - compatible
+  - atmel,model
+  - atmel,audio-routing
+  - atmel,ssc-controller
+  - atmel,audio-codec
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "atmel,at91sam9g20ek-wm8731-audio";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_pck0_as_mck>;
+        atmel,model = "wm8731 @ AT91SAMG20EK";
+        atmel,audio-routing =
+            "Ext Spk", "LHPOUT",
+            "Int MIC", "MICIN";
+        atmel,ssc-controller = <&ssc0>;
+        atmel,audio-codec = <&wm8731>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/atmel-at91sam9g20ek-wm8731-audio.txt b/Documentation/devicetree/bindings/sound/atmel-at91sam9g20ek-wm8731-audio.txt
deleted file mode 100644
index 9c5a9947b64d454a892e1e4148ff06be7c33d6cd..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/sound/atmel-at91sam9g20ek-wm8731-audio.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-* Atmel at91sam9g20ek wm8731 audio complex
-
-Required properties:
-  - compatible: "atmel,at91sam9g20ek-wm8731-audio"
-  - atmel,model: The user-visible name of this sound complex.
-  - atmel,audio-routing: A list of the connections between audio components.
-  - atmel,ssc-controller: The phandle of the SSC controller
-  - atmel,audio-codec: The phandle of the WM8731 audio codec
-Optional properties:
-  - pinctrl-names, pinctrl-0: Please refer to pinctrl-bindings.txt
-
-Example:
-sound {
-	compatible = "atmel,at91sam9g20ek-wm8731-audio";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_pck0_as_mck>;
-
-	atmel,model = "wm8731 @ AT91SAMG20EK";
-
-	atmel,audio-routing =
-		"Ext Spk", "LHPOUT",
-		"Int MIC", "MICIN";
-
-	atmel,ssc-controller = <&ssc0>;
-	atmel,audio-codec = <&wm8731>;
-};

---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241210-sound-atmel-at91sam9g20ek-b0e9dee4533c

Best regards,
-- 
Balakrishnan Sambath <balakrishnan.s@microchip.com>



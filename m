Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BACFCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 05:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SmY3471HweDt7C0JbHesY0+I32AoN6OAjy1ZuD0tCcY=; b=gnSINlp4wetOUMqG4nWZQSSWaY
	LVU08x42YJwk8bGTgL6EUL5BW5v1OqRCLbfNqqD7SKMbBhan4oC4yE+TsZCvlTJKxD0UXZg3rKTSZ
	wUMcTav+swRJtJK+9uvA+cTEN3xuyTYAkuyMO5BxmjudipLpUjoSY37BMfJsIdQC9h+4l2NwN5FWH
	RQCmPKY2EdoScKmEl4U6mzP+X55X7gQW0qrybz0CcXlHhayFC79orW2GWCreVtwGADmwTrDjvtydP
	nrSHtNkKTh99n54XIj31SHeattCHgGNUt6IrEy8ddeEI3EcsehIQ1tr3DixzsL6ijxUamLWUKp7EN
	SUm+6tNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTCFG-00000008SqR-3A6R;
	Sat, 30 May 2026 05:28:26 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTCFD-00000008Sq4-357p
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 05:28:25 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2bf02708e8fso18435365ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 22:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780118902; x=1780723702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SmY3471HweDt7C0JbHesY0+I32AoN6OAjy1ZuD0tCcY=;
        b=TMpBHlzLE+HNWRYpj2fOq0oItBNfOGDeysXz4v2eORyyHaRnH2ibctXt6G1jWEejQP
         c2GHdN2t7WIxT0bp2k8yiiXQyN6pHpv5V8UDL/o9VXmWMLLxU6LQ6wUDIjQN4gXQZIT1
         Kh9q5aER4DV4DXLmn6A1qXMrdKF+3bJHZxTdO1tYObhJCeDHqhjlXiwHPvOqg/Upj9oo
         j9AFbY9t06m+JmjSYjfau9ktDtGT0DoPeviDwa236j01sY0rDQoSKjTnwAd77PBDyLVg
         bUAr2Np6MMwwnmUguf+jSg+bIP/HvrG5cxQ03twd9EAIRM+fMkiUB//cjuuuWEt2cx07
         Vi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780118902; x=1780723702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmY3471HweDt7C0JbHesY0+I32AoN6OAjy1ZuD0tCcY=;
        b=s4ya+U4IWze6V1gsj5RcPjUIwdOY0OlpbeGjLVHwVPZ7jxxfNZGPu/I0t7p6joRv3N
         DLnLP+DBlcBP6zsASJsVTJug5nncbXca4ezdxRSTaJNLjwxOeOjn7nZ3s93EqLrnPtZK
         fKWgJpZS6QjUJq2FVMK98Z7xiIFMoa1xRoguN+Tj5Nqlts5gNfUmlni32YH9Jira2KMD
         H2qNcKHjjkZS5mMcUWro6QGRr6cT6j60M7Pra6+YVe1PS4LIa8fmjoLsT7XDOPFQr28h
         MxSpHJJcpyZwUAQHflHHP1iPA0zvnAUBFnf2hB3/jhuK4FMOTpxYys3yr/3JYWsjb02O
         P49Q==
X-Forwarded-Encrypted: i=1; AFNElJ9KOKFTE0knp96Na0hnrtPdxDdGeC8SRWMcsw5x600LrWp8DH5Rur76Je1EPneUEIn6ENdAyCsAOuLmkfN+8oSZ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywul4foR7CevaKFgb4ECJX3rQYn6sOMIytSCHUazqgRD36GCxUH
	56TgB6/fE90quc6mlQVEW5o+lSxZwwmZn3QFoT7fpq+tBoEnfXnJdACH
X-Gm-Gg: Acq92OFpMgAEKrM6abEa21eNZQzHUweB9DAOQFEkCFuoDl7ZKRaQBMw1yUQaUJhwMjE
	B5WP1hqTcjcbQCez4ZlwAbDJRvlRyj3oBMdxnQn0OZx75b3R++0lesDsCicB7+B534jqgJr3Pfj
	2G96ER92W4TK5wFKcdFIaS5xaHN+mfM9GMbUxZgBMhZSMBIJ6B7vAYCTpct9uKkxVGt0JebQPxJ
	pwyOtQX4L2gAoAWRZfOBihNtKU9/7YhrzFbdtwVWGZOWBxaGKvdI30ZkDOg7MP8FyRsFA1XInqD
	mmlGHzCTGoIOYfxcBShhwo6a2OgKwIOKcwSezza7tt6qCIjOlMnxhA8lDEADfbPhCBb06z4aRsY
	OCaChNfntbpTXbBlW0+tBSYwUnK8CUsegfloWmeXCgmfwN7/I+aRmIFTHtCq0EpzGWjldwP8Gow
	X6qBpyPcm3nieG2co2YK2mEsqv9WPSvJD1ZYWhAguFHN36rDuTXHHBkYGUBq9mhu50lISwxKvKm
	nYkpWutK8UVLDM=
X-Received: by 2002:a17:903:390d:b0:2bc:f202:54d7 with SMTP id d9443c01a7336-2bf3689d80emr35457005ad.38.1780118902331;
        Fri, 29 May 2026 22:28:22 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd6edsm47386275ad.18.2026.05.29.22.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 22:28:21 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: claudiu.beznea@tuxon.dev,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH v3] ASoC: dt-bindings: sound: atmel_ac97c: Convert to DT schema
Date: Sat, 30 May 2026 05:28:12 +0000
Message-ID: <20260530052812.115994-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_222823_795819_A0B5EB7F 
X-CRM114-Status: GOOD (  18.35  )
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

Convert the Atmel AC97 controller binding from text
format to YAML schema.

The binding constraints were updated during conversion to align with
actual driver behavior:
- Added previously undocumented 'clocks' and 'clock-names' properties.
  These are made required, as the driver unconditionally requests them.
- Removed 'ac97-gpios' from the required list, as the driver
  treats the reset pin as optional, and requiring it breaks existing
  .dtsi validation.
- Fixed the ac97-gpios array in the example to use standard
  comma-separated formatting.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
Changes in v3:
- Updated the commit message to include the reasoning behind the property changes, 
  addressing Sashiko bot feedback.
Changes in v2:
- Added undocumented 'clocks' and 'clock-names' properties which are
  unconditionally required by the driver.
- Removed 'ac97-gpios' from the required list, as the driver treats
  it as optional, fixing validation for existing dtsi files.

 .../sound/atmel,at91sam9263-ac97c.yaml        | 70 +++++++++++++++++++
 .../devicetree/bindings/sound/atmel_ac97c.txt | 20 ------
 2 files changed, 70 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel_ac97c.txt

diff --git a/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml b/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml
new file mode 100644
index 000000000000..5f4ebe81bf90
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/atmel,at91sam9263-ac97c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel AC97 Controller
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: atmel,at91sam9263-ac97c
+
+  reg:
+    maxItems: 1
+    description: Address and length of the register set for the device.
+
+  interrupts:
+    maxItems: 1
+    description: Should contain the AC97 interrupt.
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: ac97_clk
+
+  ac97-gpios:
+    minItems: 3
+    maxItems: 4
+    description: |
+      AC97 link GPIOs- sync, sdata_out, reset, and optional sdata_in.
+      The driver primarily uses the reset pin.
+
+  pinctrl-0: true
+
+  pinctrl-names:
+    const: default
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/clock/at91.h>
+
+    sound@fffa0000 {
+        compatible = "atmel,at91sam9263-ac97c";
+        reg = <0xfffa0000 0x4000>;
+        interrupts = <18 IRQ_TYPE_LEVEL_HIGH 5>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
+        clock-names = "ac97_clk";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_ac97>;
+        ac97-gpios = <&pioB 0 0>, <&pioB 2 0>, <&pioC 29 GPIO_ACTIVE_LOW>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/atmel_ac97c.txt b/Documentation/devicetree/bindings/sound/atmel_ac97c.txt
deleted file mode 100644
index b151bd902ce3..000000000000
--- a/Documentation/devicetree/bindings/sound/atmel_ac97c.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* Atmel AC97 controller
-
-Required properties:
-  - compatible: "atmel,at91sam9263-ac97c"
-  - reg: Address and length of the register set for the device
-  - interrupts: Should contain AC97 interrupt
-  - ac97-gpios: Please refer to soc-ac97link.txt, only ac97-reset is used
-Optional properties:
-  - pinctrl-names, pinctrl-0: Please refer to pinctrl-bindings.txt
-
-Example:
-sound@fffa0000 {
-       compatible = "atmel,at91sam9263-ac97c";
-       pinctrl-names = "default";
-       pinctrl-0 = <&pinctrl_ac97>;
-       reg = <0xfffa0000 0x4000>;
-       interrupts = <18 IRQ_TYPE_LEVEL_HIGH 5>;
-
-       ac97-gpios = <&pioB 0 0 &pioB 2 0 &pioC 29 GPIO_ACTIVE_LOW>;
-};
-- 
2.43.0



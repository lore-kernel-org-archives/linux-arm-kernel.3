Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF8ECD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 18:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3/1bzDCKOLQOTkCi7bZI1uE7iLJxfhIL315WQnRlRww=; b=JFZ1QBF3Ksr1XUgzYvIVtHf7Q2
	msquOzG3fRs3171ANb8dBdFZE0qIH1zjhZ8Ups6a3j394ds3hsun16lCAnjZyeXazsYvJnA7+XXx7
	EWYf8yTXGM1CLUIUdCuhgZCEydFSz/QG6IJbQyZbgbOrq5E/xQ3+zzqPEQ+kaNy1j2bz22nZRtBW1
	w9oYmsSxcfsZwk4XyVisFj1EuhjErYW7av+W5eo3qMQuNnL9XUqB4TmwqiJGUko/2gNJHsFvM2p0E
	7Fn1lTopO0LFb2bwPDJYN99NNXrNP5Lrhs0fo5a+9UEZ02F532cxkX5vgNe1TEYcJG0JU2pUYWlBx
	fdEZUleg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRDe6-0000000FQg2-1Ve5;
	Sun, 24 May 2026 18:33:54 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRDe2-0000000FQfZ-3B6O
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 18:33:52 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-836ebdeb969so4046084b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 11:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779647629; x=1780252429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3/1bzDCKOLQOTkCi7bZI1uE7iLJxfhIL315WQnRlRww=;
        b=Uoy+DC7n+YY0dgg9n1jPiCmSQ/TE62YOEjbHOyuYc0woJ/ORgfyp/zP/aucO7hzPav
         44X0hlpPRgfQZOCy0VbSbGZcFovUZa4c9Pj5zzWi4W36p9L6Z4afkavKkGZAvx+t/8cT
         P+UipJ/H+wmml2pGa+950i1pIVH5Eu0fpVOeZnTOfuNtAzHcqq2T2MUNZyTHXdBzhWGg
         gdClHIG8oO0/mP6kBRpAc9h/GbbhmeJU3RoI0SCH1P/y3WfJGV1Tzed/J7l1d7NUt2sx
         SJ+hIoTkJLRjLBtyAjZeoY5eKwj9Ba9FkL5PCtg2Az3TP99axARXs2s8Ra5jsVgLSEw2
         M8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779647629; x=1780252429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/1bzDCKOLQOTkCi7bZI1uE7iLJxfhIL315WQnRlRww=;
        b=LtbQsj3SoOIlRHEakvBmUiy5GksZW8RF2iZzPY/IYE9Om/uYgqrA/eHQlsZFLPo3Ra
         BnGFz7nLeuZLFWW6OPQXjAXiyYws6YnEfFJStWIJYfMOBSJPWdBLJhlI4VLdEajVLfqY
         yIFautlA2ha9uaZIpegZxy421aNFqkegB2V9FcGpAxp2WDiEOABmc1l/2RJWgyMjsW+U
         62oohhUN1jdrcyp1wGVlIt9VHHUkvDRmP7lvB/C5f1n8oqmA2K7LxYwB3OmwP+McFdr2
         SP+vxQZSh5HoAhr7mBmDxhvWtGHNWxIVNQK32NxKtW4T4a01HnaRFtF6jj2810rkCk0q
         mMtA==
X-Forwarded-Encrypted: i=1; AFNElJ9mCsxxZw65osMPkRjf7H3rWIfkmx2GyOOsXA3HaReNvF22MECZUuAjSLQ3kDxtMNEMRZ6jJMesx/rdRt0oWh/P@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn69arwiJfOHrF9yAIfi8RhvbVPso0AWYPbnCbvhlnMUnHutkq
	0GRjY1Bylhl8Z2HR6+rSl02LYW2JC2cMJouJfthrsv94sufybZktsKb3
X-Gm-Gg: Acq92OH1TTo4PcN2kFq6e8aNm9zriJDyM5jhu1goG1QgY6i6GgE2nTHXYGZTNFOKN/d
	JCdIOYyumhDh0fhihluaPjb9glOMMOKStuj9WxfZrr3RbxFpjww1VOFaBy05IkJyp30VCV1MBLc
	65lp9yuGJ/q6K0vCCcspl7UPbtlJJN0xYJBO7XqFSnWibHlYOAFPVO2XrCQc1rVf6ufbVHqLSJb
	DrCaB7sDMz7I/x9E1siLHSjHRBGPpei+uyo1PlV27oRuKhS0XHDzjlQeD5Brm6bTjGkk8hE8LY/
	hC8WjmRgwFztAeD/Z3iHPXOyOmxhraAhDcLsXbvR4J7Sl26pL/e2r6Dx6KYSyUEymuw2flKXK0h
	ihyXv//AKW2TM6pItt+7m6R456LDYjtAnMxYzQfEfHCD3iHHD2hBTca3UEkwwJ1mvfoJnvIgVnr
	VpJ7qHosMQp19FNOH9dbXVpbY6JrbvJwjQYcVO1AqpNKGy+RdANPCfRX4gkewWHpTzYtCHKYMQA
	IYLBA==
X-Received: by 2002:a05:6a00:2d8c:b0:838:9e25:f128 with SMTP id d2e1a72fcca58-8415f32f29dmr10904478b3a.26.1779647629021;
        Sun, 24 May 2026 11:33:49 -0700 (PDT)
Received: from Ubuntu.. ([49.37.169.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ffee25sm7339648b3a.58.2026.05.24.11.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 11:33:47 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: claudiu.beznea@tuxon.dev,
	andrei.simion@microchip.com,
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
Subject: [PATCH] ASoC: dt-bindings: sound: atmel_ac97c: Convert to DT schema
Date: Sun, 24 May 2026 18:33:37 +0000
Message-ID: <20260524183337.111657-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_113350_809129_BF7449A9 
X-CRM114-Status: GOOD (  14.88  )
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

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 .../sound/atmel,at91sam9263-ac97c.yaml        | 60 +++++++++++++++++++
 .../devicetree/bindings/sound/atmel_ac97c.txt | 20 -------
 2 files changed, 60 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel_ac97c.txt

diff --git a/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml b/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml
new file mode 100644
index 000000000000..870532927164
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml
@@ -0,0 +1,60 @@
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
+  - ac97-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    sound@fffa0000 {
+        compatible = "atmel,at91sam9263-ac97c";
+        reg = <0xfffa0000 0x4000>;
+        interrupts = <18 IRQ_TYPE_LEVEL_HIGH 5>;
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



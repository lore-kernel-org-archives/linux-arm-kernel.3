Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B69ECD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 19:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ETDhX6hQeHZ88Twc2vJV86bPqeNnna3Es2w6c/Lk7tM=; b=xe5Aj0ASyJjlt50bgkV7ylnrpS
	RZ6RH9ob769Ak8Y+mjFTdr5cA3rNwq+zdfxOMU+HxfI1rGft6Z5t3OYtKfcvTp5+rUyEb7dXXLv7M
	uTZbNNAEKQL2pGLXxVtLb6+UgInGIEvFY1WyCzmGzHozo3gaaBn/jFq8mtUxnP/bh5FSCcnZUBBo+
	hPftThDMjkmoJORJLiAdJHfGsBoBX9AouFI0/m4UoCTv/WUkhtvZKjiPkFVNPllB3OwH4IRhpr10i
	hAcpHqqknG5iaxPcMHAj3YSZZ2sCbckSbontnjhXbMlCPS41rjjI9gdQk0I70alchvVINXniGYWDr
	xH3Oa3RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wREt8-0000000FXLT-2b83;
	Sun, 24 May 2026 19:53:30 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wREt6-0000000FXL0-2rz5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 19:53:30 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-367c26471f5so5721849a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 12:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779652408; x=1780257208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ETDhX6hQeHZ88Twc2vJV86bPqeNnna3Es2w6c/Lk7tM=;
        b=WG+lb38+NtCYppe+Q5WHmrDo0RovMqh9ItIDEgRza1/dLBeDYi6cOg9trYEpPPDWY2
         6g4BG4RH7sBsQ+ROaJXui1u4zUzDtfM8FZC/PFCnEFQV/NGseHWdujZ8vajzfyw69S6S
         k5uP5OAsLy5bhVskKEv6Aor7bFqQhY+d7Fpmlhdwp4SK9KDbtottPbolQtAf6saQ801w
         YkhBa7pPI3hH0HuPSN7DEQ6OESnQ4rPNS+29qqm8MigAttj3CCgpDSzqS05zbJOE9VQo
         tcl7hcJj5YYJUPsK9oeYC1mZWn5y14ypQsrbrMSX9KWgSQPAtgOOuDkXhXY+Rnc6PbDZ
         5Gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652408; x=1780257208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETDhX6hQeHZ88Twc2vJV86bPqeNnna3Es2w6c/Lk7tM=;
        b=KkJAD4S4cyJQGd1Xub/9JX4tKte/XgixKEe6JwP1SIwM40EN6OwVwALFY1ms2GQJoK
         P4/AxAvoEW+E0mxuGwSrp0Y5yoTrHQ8DllzYB+6gc71CbVjY9wSBGpVsrbSjvoVyIKOM
         1fNccWZ9hKKYGOND4P22Y5slUMEA1AojXfzuvMhbV3z44sirzJSH/+oka7Bebtkp8SHN
         ZuM7aqNgyqxoqMsxUZKnXvE5ikOa+EgXsOPZLRroBAoNcSY29UC8vR2RbqR7rn2lgkdl
         1XAe0VrLBWl3tmwBNsehFq+6LEg9s99IRdeYqal+TXU3fEhQyHg6w6ldzBdzoEDtzvBh
         5E4w==
X-Forwarded-Encrypted: i=1; AFNElJ8aiO3xpRB7Y1KVIypDJPYPaa62kCCn868u443oCGpomJJoDDy2roF5w85UF/OZEbVOENB4WZZjhbmvqyG3wOiI@lists.infradead.org
X-Gm-Message-State: AOJu0YyXHM+r8O/upqb2KyS9YEX8O3rbvRg3oLSGenkrKotGsWckV9dp
	hn12xYiGSRhdsbNH8ODBpY33I1857i9eLAJOWqkn5yYBLgrwt+S2nfmZ
X-Gm-Gg: Acq92OGieCtxP7sMrFa+/pIh1zKft4y9T/gpqSDI1xBPS4Du3A5YoCQVeRLYunz5zW4
	Sz1JcfNHbwo4Ic7mwGl4qDqsbQecLN7vyDDHu3sbnn2zS0WshuyWxg+8yvGo3g+Hh4++K3lRvwv
	8f1MTCZ5SH78JIFCbH0YFT6SrrurTY0psKei/qng+ryKpHU8Tscfb6N8Dw+/ktq0ZyndwRN/mVs
	WQmlr9CARqZH/t0h4LRAUbfzYCSjEep5I0gB2IVl9Sc1CgSRBfC9eKuYI3dmGyTk1dyezcC0Rip
	j1QddOrP3s477ftEf4/x30LgqHMrdrX4SvK8PrVRgLN17JG+XMvCIvhMU9AVG4XlNtuNBeVHBC1
	LQgQiCErimCm7MisHbiymPhAlqHjVYKIJ1QbDCIZw/y2hEbF4p8br+u0scm+TgP7re/2qAVKiUV
	K1IVCamDZy35kGrRtcv3S3E7+PJtGFtDJlR+/IZ8ritS4ZUKfmYEPWw0mrvFvTAnLKKtA3CWIxn
	3jTdw==
X-Received: by 2002:a17:90b:2585:b0:366:3ac:f730 with SMTP id 98e67ed59e1d1-36a6788e0abmr10580647a91.25.1779652407646;
        Sun, 24 May 2026 12:53:27 -0700 (PDT)
Received: from Ubuntu.. ([49.37.169.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6d86daddsm3584575a91.11.2026.05.24.12.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:53:27 -0700 (PDT)
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
Subject: [PATCH v2] ASoC: dt-bindings: sound: atmel_ac97c: Convert to DT schema
Date: Sun, 24 May 2026 19:53:18 +0000
Message-ID: <20260524195318.112398-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_125328_734723_09DAD75E 
X-CRM114-Status: GOOD (  16.28  )
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



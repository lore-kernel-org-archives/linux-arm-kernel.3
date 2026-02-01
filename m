Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B760E7C718
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 11:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zq91DbVOttbOokKYAPkn2YF5dlqfbHUG1A6X83/uDqk=; b=ROFZjrQcUNJmY1sjA8NGnlYtMc
	bWqbtOf8KaCLTs17Zi9tbE8zfV/jJ0i37C76jPyjMmJhiaaYy0jy9anu0JGOnt+WBlyGPidTrxYz/
	FZwC9DcmexydC6N6qaf0dU+81dRm9bl6TgSnPkjk461AKrUOVdDhxOi6S0bN616Y4147og+HpwPFm
	sBT7vHH2/qll7Unq8rXe9iKqHJzwhgzazh7x8dN10nYFJltLxoQbRiHLUfpiuzOGM2wMFANSbkUnS
	tlX1lZ7Rxn1vlVu+2Z6USrZ7KZJFOIBQrqgUaH/l8RPyf5KCL6fpTpmbk5TJbPjDaBfg2T/SlSfkp
	KYnVMmzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmVjK-00000003TA7-3afB;
	Sun, 01 Feb 2026 11:35:02 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmVjI-00000003T8z-2hXV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Feb 2026 11:35:01 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-823210d1d8eso1779506b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Feb 2026 03:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769945700; x=1770550500; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zq91DbVOttbOokKYAPkn2YF5dlqfbHUG1A6X83/uDqk=;
        b=aXiiFKFgmXpezi9UFsJgypnYJ1iQDymBHeeogVze25iRR+MaAfR3KA9M/rrp9AO+dO
         sdS2PLRFPrDMB5NU4ZqYLMxQNR1DBgOB4TxwOiLQPcBLFi3LLvgRwI8mSBO+gVMIZnPV
         wYdIlyZuXn4l887zJ98/Mc+My7pg2qB1DCeE/Mz5VTiseXUzysnHkOWh1jQF3gnQs8BS
         3aF0thJxVu2UWaBuq2G0a4ZSUTfTnEpKdecxed4kFLLKMaIjEZymZqHoWedwREPuLYhg
         ATCC0Md7Psgp6F8LE4thRjDztT7JcoIG+oMdMOFEj2hvPOEJVjK8UqPFt0c3tJxUNI0+
         0HBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769945700; x=1770550500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zq91DbVOttbOokKYAPkn2YF5dlqfbHUG1A6X83/uDqk=;
        b=uitrNtqptYGWcuE0Ber+n1EtTJ52EYaKYf/sOkhMWw//lhVOzPqSsv3qv5MqlkVxuQ
         rKVQCiL8lKaS+1vkkWXrDLt/HDgPGwEam7hmHdrmYzr9T1iPiLH+RgbIYCe0blOaM4FH
         6JkPOPlXkk8UBe61Ya8IqBCgmrH4iSFb968If/R9aF8O3SAsRmMzDPjI9TL7Ykg2Or+h
         xdKZ8M7mG2FeobPY+EJawLC71S5q9uI2+X50lzt5Hq+r3d0uo9tBccfcIO8bpwIuNZv9
         i7KGSOX5OCTfQE4Iai6W/wMh9VQTrJkuCKQeABSEPp9i2LkpnAGBBCiVQiFOrI5atrbd
         betw==
X-Forwarded-Encrypted: i=1; AJvYcCUEhnqiUDxpYDkoKafMZfha526kiHaay3PTzuOA1OschW2nTJZHkiaZOOqVzwnLFMZ8eP9EBCnt1PVIScOB2JOw@lists.infradead.org
X-Gm-Message-State: AOJu0YwMuB0e0Fv8WQ6cHG7W4iYMWHid+Nc8PFMauLy5REjtoGxMpZ35
	YpWQQy9evuY1mCeAcYBTHguN19dClf0hM6EeBQdEFICZgdqKP3q8aPb3
X-Gm-Gg: AZuq6aLcQNke5NhU6AC7ygGiHofIC/g1D852WDYNL97xoQdk0IWYdfcEuRfGYbjgsmf
	nwoVX8/jqeoPnGMkhMKc1BJEbcVhoYDLfsDJKxKk5yvAdX3PDm91GpEB3yV9litzzDfKdkZO6vJ
	etvcG1x7SfCxPKhxGLZi4Gx3r7znFpku0Y9kSoeiKkKH+4UJx0jKihNHH6JU28fgL9ODDOQRP+w
	KYQDPdPTBLlryTaGuQ8MK+vciYGpKpJzGmp7FCFH6RJ93YF2sE9nGL4wQQ0ZiYHOfP2hWjm9L7w
	+UHFfhtvxiF6UM+ewlpkfhW+EidhuHoRC+1h5TzkQliZ83SkWEyH36VvpcLWr+OYNDcZ1G1EjZH
	wxo2ZiWLytMu51ZJU5IGZZAKG6f3Hg6s7IODLFAyv/HrIjxW7FScSnQJ/x2f9jOveCw33m6ovYD
	ZOBOMN3TgduEaryLszKupjAAORgo+ZmzgKaw==
X-Received: by 2002:a05:6a00:4b46:b0:821:70e7:b10a with SMTP id d2e1a72fcca58-823aa40d7e9mr9801911b3a.8.1769945699636;
        Sun, 01 Feb 2026 03:34:59 -0800 (PST)
Received: from Black-Pearl.localdomain ([115.99.252.105])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82379c24083sm12994728b3a.55.2026.02.01.03.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 03:34:59 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sun, 01 Feb 2026 11:34:20 +0000
Subject: [PATCH 1/4] dt-bindings: usb: atmel,at91rm9200-ohci: convert to DT
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-atmel-usb-v1-1-d1a3e93003f1@gmail.com>
References: <20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com>
In-Reply-To: <20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_033500_701737_07204480 
X-CRM114-Status: GOOD (  14.54  )
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

Convert Atmel AT91RM9200 / AT91SAM9 style OHCI USB Host
Controller binding to DT schema.
Changes during conversion:
- Include "usb-ohci" as a fallback compatible to allow at91 OHCI
  driver matching.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../bindings/usb/atmel,at91rm9200-ohci.yaml        | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/atmel,at91rm9200-ohci.yaml b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-ohci.yaml
new file mode 100644
index 000000000000..f04de6d553d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-ohci.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/atmel,at91rm9200-ohci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel AT91RM9200 / AT91SAM9 style OHCI USB Host Controller
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+description:
+  The Atmel AT91RM9200 / AT91SAM9 OHCI USB Host Controller implements a
+  USB 1.1 Open Host Controller Interface (OHCI) compliant host interface.
+  It provides low-speed and full-speed USB host functionality and is
+  integrated into Atmel AT91RM9200 and AT91SAM9 family SoCs.
+
+allOf:
+  - $ref: /schemas/usb/usb.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: atmel,at91rm9200-ohci
+          - const: usb-ohci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: ohci_clk
+      - const: hclk
+      - const: uhpck
+
+  num-ports:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of downstream ports supported by this OHCI controller
+    minimum: 1
+    maximum: 15
+
+  atmel,vbus-gpio:
+    description: GPIO used to control or sense the USB VBUS power.
+    minItems: 1
+    maxItems: 3
+
+  atmel,oc-gpio:
+    description: GPIO used to signal USB overcurrent condition.
+    minItems: 1
+    maxItems: 3
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
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    usb@500000 {
+        compatible = "atmel,at91rm9200-ohci", "usb-ohci";
+        reg = <0x500000 0x100000>;
+        interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&uhphs_clk>, <&uhphs_clk>, <&uhpck>;
+        clock-names = "ohci_clk", "hclk", "uhpck";
+        atmel,vbus-gpio = <&pioA 18 GPIO_ACTIVE_HIGH>;
+        atmel,oc-gpio   = <&pioB 10 GPIO_ACTIVE_LOW>;
+        num-ports = <2>;
+    };
+...

-- 
2.52.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E66E6F086
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 20:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOr56XFFvJYItbaYZCF01MB/OVR35Ya4WEl16UdXyiE=; b=MJ8rxt0TNFHPQR2bMrPC3MHjRL
	j2zfOvcEFiYOyNEduzYxX0jT+j7Df2xhp4I4gAEHgsDPDu80aa1veQF9FkP9G/eOZMHrHBXoZI0LL
	thqu3c/oPSBDGLcuHEecvsz84AsrHmQyPNlEu9IE1e3kwy48D3fQFncOdistbiluzCgxKydANJaxa
	MmZh1q7zCwTIPn0ZQ1p2/aApJ1wKJgvVt7nnB1WeMqr3BZaOJ+kMmtvj+znHvDGmuP4Ehy1yRT4/Y
	LFzRKliW0ehstMC2bWgCHgmnTGf2ycfkkHUnbWmLg1V3k3Qa45mO6KUH57BxvNDjEzb5ttfKQ7Rc0
	W9BGt9+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8rQ-0000000G2bX-0CCy;
	Tue, 23 Dec 2025 20:20:00 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8rN-0000000G2aw-2fXf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 20:19:58 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso7426758b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 12:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521197; x=1767125997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOr56XFFvJYItbaYZCF01MB/OVR35Ya4WEl16UdXyiE=;
        b=PmEeUGJ+zUUkzJOCFXr72HQu8hZr9gWaUxiCQi0c3DaNeqKfP+CLbvT5zilNVIl5+J
         QOwDDPE0G6hP4XL5/TNmr+Aogpb6nOgtPuWhg70FN8ssr1FXDOdwQmA+Rwm3pvqhvJNh
         9lVcruRiBHpbUIOQnBIku2/dm1CbxdiEM58yrvUpbpVVsYcaW4zA6qQmeyhqsJL0A/8q
         pibdHlrL4xnknZFCrmLRXjvUM3IDNOqAX4YCY0advX4y29P/payS1w31viL0PaTI+0Js
         h5RyY1+CwF6mmBv/ggHplnNAC3tZrnh87kGbrN4kTv6Pt/+4ham4YVzKLbCkP6h19bpn
         cpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521197; x=1767125997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XOr56XFFvJYItbaYZCF01MB/OVR35Ya4WEl16UdXyiE=;
        b=fKQzOOt5QQRO744WZP3S2ExVjV0tdaZFNiMwDE2XKuVFXNS7mEadHoLL6dKAKXe+U7
         f7iKBjJay2YQOlvTb2kd56H5WOGN20BF99xIZZvj6V+8lzbiXiEXAl2IU5Lsr8+VTQlK
         CEvSCpmk6OZi5mAWCEYlwMqILUin4zR8KEibUoXjoTTuNC6MoX+/wHKo5asE8Ie/GVd3
         xlnGBhLIlWPzq8lQNUftDZS8xhm5E/jpN1x3WiMfVKG3Db71q0YGcTgS1Fs5PRbqEIu2
         29/zwskeQ2W+TSZlNZJY5qKJV4fvi9ncxGExNeDBy0BGr3L4Y2ZJvmqgkFq83zgrpESC
         UWCw==
X-Forwarded-Encrypted: i=1; AJvYcCUuez4kZOfGSC+yFP+3QdvH6l1VLjRUNJ0x3ABONXdOF+djlKlC0FVF/Llx8DZ/WYMqUkcDZVlKEWxFLtEBPV/S@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2fhaoVJXW/PTxv+4BNvTl2SGEfDzL91H9U7fGnWDvwOW9X6j8
	AI4f/HEpSO+TgdpIS4fzAXOdEY8k6eHSf9lnm4cQ0PxTLyxT97aUPu2df8cjVnEwAqQ=
X-Gm-Gg: AY/fxX7cIjbm15zMZjRMjWke6i67T299OuhrKh5Tl2yKVZsXNqHRQVL8h61SAOtqxxn
	gSUtnwAf0lLV3UFHzCT8edZwRyUHyw3e8gPSvCG8yYD2FTrIynK+RSFXIaX/utz5naKV0wavVNn
	2llBEOlJUd7NUxiJ6WgY0Tvt3kR5v9B1ei5lJIg/VJUBGGDoJy4Ni/GfMiq7oYLIgsRDArARbWF
	fFCY51sVI6l/sSEY8FUBcyWtu7kQmfplDeeIjzIWt3n3c0GAkNpO1KfsPFvBOLjlKJTrfaVg5Qx
	dLnMiHk7OWvgMyBDs5WMtCYztSkN15gverwVJ9UP9axRf58lKYoaA3phcRp0LLNYgS4RG7OWGNw
	bPqchLwVKdv1fPIQ3yv63jixZ7pxdy2c7n1fkhfJsy5Odrkl6KfdYZtWTyPKLmU0R7q7726C7C3
	DbOPioQuAfgsrYnBNxpIJgvnoDJr1EsFQyTG7OStWZ4go0z2cBh8sei4/k35hBtlpbPrBxNsTrU
	cb5PQmG
X-Google-Smtp-Source: AGHT+IEPFyQyinZIGZrAoM6IvYr08l7wEvqvRLZX8wkQv3+jdTfbwpmbaxqGPLI1nIRPqBYzainggQ==
X-Received: by 2002:a05:6a20:430f:b0:350:8066:6ebd with SMTP id adf61e73a8af0-376a81dcc63mr16097918637.13.1766521196919;
        Tue, 23 Dec 2025 12:19:56 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:19:56 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 02/15] dt-bindings: usb: Add Microchip LAN969x support
Date: Tue, 23 Dec 2025 21:16:13 +0100
Message-ID: <20251223201921.1332786-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_121957_672527_F8029189 
X-CRM114-Status: GOOD (  12.18  )
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

Microchip LAN969x has DWC3 compatible controller, though limited to 2.0(HS)
speed, so document it.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Fix example indentation

 .../bindings/usb/microchip,lan9691-dwc3.yaml  | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml b/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
new file mode 100644
index 000000000000..6b49ef0a6bdd
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/microchip,lan9691-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip LAN969x SuperSpeed DWC3 USB SoC controller
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - microchip,lan9691-dwc3
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - microchip,lan9691-dwc3
+      - const: snps,dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Gated USB DRD clock
+      - description: Controller reference clock
+
+  clock-names:
+    items:
+      - const: bus_early
+      - const: ref
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+allOf:
+  - $ref: snps,dwc3.yaml#
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/microchip,lan9691.h>
+
+    usb@300000 {
+        compatible = "microchip,lan9691-dwc3", "snps,dwc3";
+        reg = <0x300000 0x80000>;
+        interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks GCK_GATE_USB_DRD>,
+                 <&clks GCK_ID_USB_REFCLK>;
+        clock-names = "bus_early", "ref";
+    };
-- 
2.52.0



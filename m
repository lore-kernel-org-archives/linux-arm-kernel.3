Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DE3E7C718
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 11:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uo8u5FaJGPF86RZ/ycn10HpgRIqDDK6kBOV/6qMYc8c=; b=EJrpGSje2+7I0eT13JM7SHLiIb
	jhATU9TAFb9c1fTIFcifNlRc038CNTHuuSJ8Cs8iT+1wA5T2rV7xec9XJsK3RoSfdsaSj0blMdOj6
	aIqhILiN1q5rNfy/3r5njUJZK8qtnlxQUi9GJxliikQ5lN+qI0I+EDXQPPWCOJsTkzDwiCi6pOifv
	VE1SNRCcQr9JkE5fQiWxg9vGGJFt+3UW2cJkwP5h9NW1a03jQPwBAcxA3RzzrWHv48Ew3OS7gqfni
	qaOuvN6Xz0/usDiszTxB3vXZu+MCgGhvNjLqq/hd2fgFT82D3DtRykaQsy0pR1t4qmgO2UpE6a3f5
	aspuzTtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmVjQ-00000003TCM-0f3B;
	Sun, 01 Feb 2026 11:35:08 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmVjN-00000003TAo-1k5o
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Feb 2026 11:35:06 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-823c56765fdso547445b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Feb 2026 03:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769945704; x=1770550504; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uo8u5FaJGPF86RZ/ycn10HpgRIqDDK6kBOV/6qMYc8c=;
        b=CiVQ3uuDbMF1E7mnv5pLH2mKsEQKOxZEJWwz3VbIQd2WlR/uixUOxhmMzPQJcWD+Xm
         K7mH6q2pU7r/9EKi/S7NxjJAJ99T6fHkWE4ma1ESu28+HRb3ggMz4rqNw48XpQXu+p5P
         UGIodAUiEEvxqylYtuRvvr8fG1agt/xW5YPg76neOnCBbZxIBW9dK4V4tHzHhSr2bBEm
         9M/kIHU6GgMnd4/Y3jucn+yCHhcpqc+yxnExh8Mti23p2dApThrXaZt3ouUMH57/YXaO
         OpJ0ELa5nDz0NrV/7icX5Fulo0IfgPEwjbpydVaNRabJKhvPpaeBZ85PR2YaA29psg/w
         BAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769945704; x=1770550504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uo8u5FaJGPF86RZ/ycn10HpgRIqDDK6kBOV/6qMYc8c=;
        b=L/srsX5QubjXkgWAXqUY3ydPl7E2oCnVCdSh9We9eWNeM45J9Twuu32lQbIKRiU+7s
         sQFhWoww8mNxG5TvHkuP9PBFKuqa6rts90qYD+qOinPp8esGgrDOg7ZuMfLbjuTa4mZ5
         c6AT35OG71R08N+jJ3tovDdscP5iSgJtKNIlG0nRLmgX8lNjBuq5vrx0lKSyZqvcwOTk
         sLkzv3k73zLI0HBs3A33GEwcnZNgQOuoIbHTmnjNZfbLkDMrzwLvGrOm9688quHH8Aky
         Zk726JDWvBslRyk2oi3kTr36IHix8mLk0HwVQg5Hp6CH7FfYcZbh+x0CWldJKo+SrKVl
         KVsg==
X-Forwarded-Encrypted: i=1; AJvYcCWw6w9Tcp+wienQzRXhRds+DQa3QFcDscz8+gYVmSAG0RALJoSXw59g5/KyLr2tt1rCtAqlwXHa1VdZRXcvc+KP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+bPOaVnjMmNpf+A31BQBJHiZ6pwzD/oHZoDpb0+IGrcHZE2Hw
	s8tE+w2ei6sYeGhm//8HD/Seq4ukQKiOmmRarJzkULu6NJSLZQB9nAlCyCzSDQ==
X-Gm-Gg: AZuq6aLgjRIcdReHBFxGfEGkLOOswHQNn0qGJ0wt7oADdoPT4c5rkuQc8TttDGo72tw
	gaCEKRWjHP2iSSj5R90v3V1We24AdlXKFSPSQlaeQW0kHuUVfbon4yDbEHIGXBPNXbNo/aTNyqU
	c/9wtXJ3e9Vb0DOSrvbRPAVgezpa3BTeEiKsSX70Cfyk35yAxRjIhZHwqEpVJLDWP0sOSl98TFO
	8d82vqexnHG0gww68OdyInNE8VqjXHbiPG9cvlKYi088RQhpDDtClDGXGNLBKgNHk9OkwgzXt46
	574bTcDpv4izHMo1fJ6pmL/AR66P2fTCGD+8l++wSV8RqSRnjzwVUi11pN7l9iBF8TXY5u6Oi2y
	bgnv9okH1dNiPcvHdXY5qdDbIAaXStZwFtx5Hk0VXIyZP2fCd9+wgBxvAjSbzRMjOex1lzYgVFK
	7moh1YpQI/oSGSQYP7hin1yUaiGReAvS3hoQ==
X-Received: by 2002:a05:6a00:ac03:b0:7ff:f0c2:816e with SMTP id d2e1a72fcca58-823aa6ea4e5mr8829654b3a.28.1769945704450;
        Sun, 01 Feb 2026 03:35:04 -0800 (PST)
Received: from Black-Pearl.localdomain ([115.99.252.105])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82379c24083sm12994728b3a.55.2026.02.01.03.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 03:35:03 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sun, 01 Feb 2026 11:34:21 +0000
Subject: [PATCH 2/4] dt-bindings: usb: atmel,at91sam9g45-ehci: convert to
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-atmel-usb-v1-2-d1a3e93003f1@gmail.com>
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
X-CRM114-CacheID: sfid-20260201_033505_537740_28A2804E 
X-CRM114-Status: GOOD (  14.65  )
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

Convert Atmel AT91SAM9G45 EHCI USB Host Controller
binding to DT schema.
Changes during conversion:
- Include "usb-ehci" as a fallback compatible to allow atmel EHCI
  driver matching.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../bindings/usb/atmel,at91sam9g45-ehci.yaml       | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/atmel,at91sam9g45-ehci.yaml b/Documentation/devicetree/bindings/usb/atmel,at91sam9g45-ehci.yaml
new file mode 100644
index 000000000000..d7b8d110656c
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/atmel,at91sam9g45-ehci.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/atmel,at91sam9g45-ehci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel AT91SAM9G45 EHCI USB Host Controller
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+description:
+  The Atmel AT91SAM9G45 EHCI controller is a high-speed USB 2.0 host
+  controller compliant with the EHCI specification. It provides USB host
+  functionality when operating in host mode and requires a peripheral clock
+  and a UTMI clock for operation. The controller may support multiple USB
+  ports, with the PHY interface type selectable via the phy_type property.
+
+allOf:
+  - $ref: /schemas/usb/usb.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: atmel,at91sam9g45-ehci
+          - const: usb-ehci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: ehci_clk
+      - const: usb_clk
+
+  phy_type:
+    enum:
+      - utmi
+      - hsic
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
+    usb@500000 {
+        compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
+        reg = <0x00500000 0x100000>;
+        interrupts = <41 IRQ_TYPE_LEVEL_HIGH 2>;
+        clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_PERIPHERAL 41>;
+        clock-names = "usb_clk", "ehci_clk";
+        phy_type = "hsic";
+    };
+...

-- 
2.52.0



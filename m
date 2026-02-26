Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3549FD8FD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 16:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DhZk4iWlSuUnzj11NOqHHhy/raWDALC0iIdSjjMA3w=; b=5AusPbZYOJcRl8PD8ReD9bD+OV
	Eur+lKoGxmnYzCcwLJjaDUeETHFQNr998GP6zoUUV97QIAsyLRO2Q2nLv0H+wb82dhJk/OL+tSgHF
	rYxrsLfeUkMAvN8Jpqde+y3duT9oSvQolJyFdNi2raWGe1GrDU5/1J4E1Gk/oDLa++VB13wuL/sn5
	jR6HUw1/DyhlmJitA0UyPfhYU9V6Q74v/O7Cww7/5eZ5u83/B8GPjrEO6NdxMM3nLeF+EbL+NYSFA
	mdriBbiMfRleKGejAueyUUhYh9oeraiv1B9+fjmXoww+gWZsK7mysueyCMHdQ5I6YAUm8K03LMAlV
	5bQo/RDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdzt-00000006hdb-27Gt;
	Thu, 26 Feb 2026 16:13:53 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdzr-00000006hcw-2par
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 16:13:52 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2adae92249eso11142875ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 08:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772122431; x=1772727231; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7DhZk4iWlSuUnzj11NOqHHhy/raWDALC0iIdSjjMA3w=;
        b=RRlsrCuZ27+5u7O+oI+N8EPlFxOKPFoH+rirVKV5npJP9JXyrMt3bSyWKGMqFv2jhT
         q1z3MOf2XnOWCoK/B9OO8vvGoSzdfnkMyt/Zu5ZOn/Y+zAE2camMir8iIH1B0N3KE771
         IZrxdN5vzjm5lrN+OqfOYlaX846t33a2UfCjMiwS+rZ10HAyQxQGWpNtbcb2PEtWOw/e
         ELvwDeVk7QmYcb9lH91rMPRoW/pM1jSVWJO8nZyyNWtJ01fupvxIW9WB2GpEjYMkVxW/
         TrfyBBaErvXAtsqeGG+1Mg7GZT+nsxyun5Y5scsRlvUmmiZ+maHOwxfsl2VOPAVhODQv
         zp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772122431; x=1772727231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7DhZk4iWlSuUnzj11NOqHHhy/raWDALC0iIdSjjMA3w=;
        b=am1JRsq9Nq0RIq3FLyHpxIXemaBjt3fNuHA9k/Ngx7MWbd5UXMoB91kLOhU2iKXZz3
         0bUlRus3xZFVvGt1EW1iuX3HzuDMPeSjBDPtOf4Z7OiE4rHHXyfupSRAEOGgUYLcVR+5
         9l+7sZlTvACUf9Rst+EdJXNJHrc/v+Hx2bWY7PCQ6pxuXxHCPD1Jnc3iUZ002ePN0R5B
         /culM9WF592IQLyzld8LK4tXHtuV25sohIrqPcVwu6rO1uONS8V+1ZZHmyskf26tR6A5
         x33yiKDXshcyJl+MepUryhVv+Vy0FsjA2UsVcH2Oro2j1g9cEtSfkp1ZxDCYGS/WZrz/
         M8PA==
X-Forwarded-Encrypted: i=1; AJvYcCVn9j09unIlCEK5mq7yXbKwuhQjfORC+jwAjFhVTt3BtjR+vHJOXxhX4d+GwnOnUt7jcIzO5GwFYh+fFGWPbu0e@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+t9vav9zFduUW2axiNd9ImfK64CC27nHtMJ7jxA06R5bMGFzj
	V9CZBx8njpWXCykmu076FRhrmTOygKKARlZg/OQKmJ318/0Ld67EEvaq
X-Gm-Gg: ATEYQzyhI7vD1KGHYTZXBytc7UmhXkEUeD62xfmLsMvfDUKGU1X5tEY4vZ/iQFJobCq
	4SGbjJ1TAI0iOWRPArK/iLmEXG2hBXjVabGFW/EiqULUfrG14HpEReW8CJZ1FiCXB0L4iW7xFTw
	flNOyaDEO/uUMFC5YbdXcbRWrlMH5kpGP8VEHFL1wZ3FCmlS3MTdMozhxOhMWqtNtKxrSr3VvkM
	qfE6GCVvxabMhNLYXkYOCN8yGNn72pzexe05DLtpczjx+kDJaTtScc8D+ME25wJHK1XHkUAg/KH
	y5anDCB9Kp65spk7cC4JmsFlsDxmeiAwhHQUIIkGeHLgnIUIEjE+AITpmu5o4Rvvz377RVTjcAQ
	/9YUFEZH4edSgnsDFJObKqiphzcY8QwoYb1iSI0DwBf8dulJRPj8nbTE2OwBR4N6Xr5zQ33mcld
	U1BObWKa85GiRtr6Myeag4p2t3+/nSf5hw7HAv58TBRkBksw==
X-Received: by 2002:a17:903:2ece:b0:2aa:e075:c914 with SMTP id d9443c01a7336-2ad7441b03amr215547465ad.15.1772122431009;
        Thu, 26 Feb 2026 08:13:51 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.183.54.8])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2adfb6a0432sm44384595ad.52.2026.02.26.08.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:13:50 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Thu, 26 Feb 2026 16:13:34 +0000
Subject: [PATCH v3 2/5] dt-bindings: arm: atmel,at91sam9260-pit: convert to
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-arm-microchip-v3-2-0bda15abd922@gmail.com>
References: <20260226-arm-microchip-v3-0-0bda15abd922@gmail.com>
In-Reply-To: <20260226-arm-microchip-v3-0-0bda15abd922@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_081351_723331_1ED5B40D 
X-CRM114-Status: GOOD (  15.54  )
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

Convert Atmel Periodic interval timer (PIT) binding to YAML format.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../bindings/arm/atmel,at91sam9260-pit.yaml        | 49 ++++++++++++++++++++++
 .../devicetree/bindings/arm/atmel-sysregs.txt      |  6 ---
 2 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel,at91sam9260-pit.yaml b/Documentation/devicetree/bindings/arm/atmel,at91sam9260-pit.yaml
new file mode 100644
index 000000000000..d1bdc4a4f9e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/atmel,at91sam9260-pit.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/atmel,at91sam9260-pit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel AT91SAM9260 Periodic Interval Timer (PIT)
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
+
+description:
+  The Periodic Interval Timer (PIT) is part of the System Controller of
+  various Microchip 32-bit ARM-based SoCs (formerly Atmel AT91 series).
+  It is a simple down-counter timer used mainly as the kernel tick source.
+  The PIT is clocked from the slow clock and shares a single IRQ line with
+  other System Controller peripherals.
+
+properties:
+  compatible:
+    const: atmel,at91sam9260-pit
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    timer@fffffd30 {
+        compatible = "atmel,at91sam9260-pit";
+        reg = <0xfffffd30 0x10>;
+        interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk32k>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
index 4ee18112586d..70059f66f2b4 100644
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
@@ -1,11 +1,5 @@
 Atmel system registers
 
-PIT Timer required properties:
-- compatible: Should be "atmel,at91sam9260-pit"
-- reg: Should contain registers location and length
-- interrupts: Should contain interrupt for the PIT which is the IRQ line
-  shared across all System Controller members.
-
 PIT64B Timer required properties:
 - compatible: Should be "microchip,sam9x60-pit64b" or
 			"microchip,sam9x7-pit64b", "microchip,sam9x60-pit64b"

-- 
2.43.0



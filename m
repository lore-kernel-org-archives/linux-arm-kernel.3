Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823CDF3C986
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEkY17WKmEZ1jpJye7hkjNkT/qCVa5K542FVmlWtk1I=; b=pCmIgICGOPsSY10yVN1WsjIYBA
	RVzD3NODpkRGYA+94P8NoS6Dp+LGFATQ+OI96X6qP5hHgly/5F/YGtTJ1MjfHZT1o2PCGC+ktbynZ
	bzGt/Zz2D+URjQayVfcdqTiRq6uJISsYhEP4sJ8R5AetMI+PY7vmgmDRqABwNvyV9BSNkn0+g8UwY
	XcQtH+K4490ZOjzfkb8SzRqw5KDJU9Gig+fc7kNI0vzLSIpW5XWC8euJydpvBd5/pXlWF8gBGeFo3
	H04boinNDdI+ysIA8QVCU/aJWl/j74Y/BO8OZXswPUP1lnjPGSkikZs7CVIbYnc9Kn7AYeN76rJqU
	Bz3/9Z0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutgr-00000002GH3-1nwq;
	Tue, 24 Feb 2026 14:47:09 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutgp-00000002GGA-2ddh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 14:47:08 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-82491fbf02cso3116650b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 06:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771944427; x=1772549227; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aEkY17WKmEZ1jpJye7hkjNkT/qCVa5K542FVmlWtk1I=;
        b=ILHp80OdNnK1SoELOgq7H2rF8Xxb+We4eH62bhLIqmEGZW1/Vpe90qJ1Usu6DQmYwn
         yGwgsiBK2z3EJwVFy4fKl10D2jD2s2LcUbBUyH0zTQriHslQFyCsYEJwYfKfhxmQ84Dv
         9+XA8knzp+KJ/xqXOY62XaStSqYNmLETeCHgWxYWiEA2tBQSFtBjvKQMLqlahNlEYIsz
         /XVhU2HbI69afsM786TFy+ANIiLlH8GjELztC0niAbwMD/FZErGgzuxyL2GFsoKRykg0
         QI+y+QypikDbdPjiLv9W4U3mGdX2jOb9J+mku2+YE93opevgrrC8lCW9OKhGFC1UCOup
         EE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944427; x=1772549227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aEkY17WKmEZ1jpJye7hkjNkT/qCVa5K542FVmlWtk1I=;
        b=hNVTP1WrC16k9t2UiBg0dJLvQVfD6my9hPBvDqHuYy2Olx+YBnVJsYwVhvKbMJshvp
         eq3IT1FVoZspjtdwJuw7p0qajxqnEmJ6s5Asd8+Gko1bmaqcH+gy/JhUo9Q6XVqFP0Fu
         mYJ05bZocdIxyvKpZayBKCuSmxy5857AQ4P2I8dLJtuZBdQAVB9QqphSvEQcJE9A5Sie
         qVzLCYLd0I0+57wz/yNlxfiv+eyOqhXValasRqZ623PXjT3cToceANMOiU68vvBvgt/h
         cMskWuAfvPca51aAOF5nE/bISK9rWDiUTY2ECIXfBcx1gkuHQcOsBGym6lvgWZiYI2Sb
         mvPA==
X-Forwarded-Encrypted: i=1; AJvYcCV3K1UiBCDrYxHoIz1IswUgVJtHSZm20u0pOyE5V+h6EG+Oui1Y0PWvOZa359LlB8iJFgrFWAQSCs9asxdBwTlw@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0VblR4s06DN2BYeqbCfCl6Uz5Oo/XQ1RS9Xf4E38FvRGfWP1K
	xKCtUY2E81669jcl3F8sSar18I5qwuBTISz8XRL/seXwG4m0/6ar0tZK
X-Gm-Gg: ATEYQzwpYZesiRFC2BKJOdZKpzalll7qIpc0en/yAoY4PQmmNEfYOmlhSuH/el46CEf
	UaQV4KGnIuD9f+z3Bm48ZdzI8w5fQhd2bgC7XVOaKfGi7as0WUyrmjGu4AiBXK9WMLcJ39AdZ/5
	Gp2I7rlMCyv44ZsnmbgM27YAAFYPiInjiGze+wyCmckiJHW2gAV8J+1ee0zWnP6jFhP4Pqs5wp2
	o7PNEFxpTygWU+2re3wBuif/1QGC4X2l+uPCC6GYJ2J0s0QJeHtDLE1qo4u3lQmC7Lx5h3OkXHj
	mt6rijWR64tMOxDYoO1gWumGZmDa3iBzA59pAMzEYSdD0RhPwh3a8vsZBDE4Twv3OhmQtuhfFT1
	pBPnDFX4YXA3jm/zoErCbgK1TrUgPYzCsEYR4YLbnjWjEcANWKu46GQf3DJ03aB6a4dEfNQUOp7
	+bMg0NxnFv68WBpK0f6RQ4Ff1bUj+Oxml68blmJ+V72JwCFpgp
X-Received: by 2002:a05:6a00:2987:b0:823:1491:da10 with SMTP id d2e1a72fcca58-826da8b3a1emr10351191b3a.12.1771944426704;
        Tue, 24 Feb 2026 06:47:06 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.168.64.105])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-826dd64367bsm11149895b3a.4.2026.02.24.06.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:47:06 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Tue, 24 Feb 2026 14:46:47 +0000
Subject: [PATCH v2 2/5] dt-bindings: arm: atmel,at91sam9260-pit: convert to
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-arm-microchip-v2-2-8bedacd2cdcb@gmail.com>
References: <20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com>
In-Reply-To: <20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu@tuxon.dev>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_064707_675182_90AD69A0 
X-CRM114-Status: GOOD (  13.09  )
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
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel,at91sam9260-pit.yaml b/Documentation/devicetree/bindings/arm/atmel,at91sam9260-pit.yaml
new file mode 100644
index 000000000000..dbb5fd843a9b
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
+  - Claudiu Beznea <claudiu@tuxon.dev>
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

-- 
2.43.0



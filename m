Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D826FC9ED3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 09:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFLYMx/eMQ8fDIUE754jWtNcFJvcsDGeyQ8yrn2Ek8U=; b=eKYfR86eIwfLan+7fz9bnfQVlH
	LO06A4BjJhLg8aUaYR3WerSSJT22IPQwHbYYg9FNbuFStZwmAa9LO4RrBbsI0Q4LBV+rqD8Lsjja1
	NZ47Qgd2IUu916bN3y3BsMjgNK45g4FqnXB+LDZTSF+E/ulqrRlXNHd2BT65c2mCRUhjTzu6vHS8k
	reZS/LXQBk7hbspWrqnVFTS/vPqasI0/mZGaMvF9vlsXBLVQ96cItIEQ1Uzm53vCw8lMgkgzX615R
	+B4LHunSx4m6CPZpdB40iglBHONfoqzX2nG4HIVsGovAKgRrWx74lMehKuGZtOzzkJkJaf+rt097M
	jG3plLdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vynmC-000000052L4-272T;
	Sat, 07 Mar 2026 09:16:51 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vynm9-000000052Iy-1yrq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 09:16:46 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ae8177446fso10728375ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 01:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772875004; x=1773479804; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFLYMx/eMQ8fDIUE754jWtNcFJvcsDGeyQ8yrn2Ek8U=;
        b=hlOeOj/2FTdig2S6TMvKAy3gcEk0Og9Toj9D4jjIEaI4gqom/zVmCoaQBxd2BftWg5
         uJyaKXXK3o2PHFIPewfYuQEAmEF+uhT3BiofDox7/zyafGODb1ZH9r2GWQGR9FFFM5rc
         82YzGDdWIBtusItBw+3BEKztzH7qrVThk3SmkLrOUw9xlB8CXnxQOiSDHgkUmyise4Ac
         8hSZktXJlP6ckwkxV9Rq+A7MuzgRGhGbF+vroYarOc+dCvbWWHAyILEZ6hNFbU1ETHFB
         ohBZwSEr9r59QtJXLQVo+SzDxGx6jvo19enYGitBqmWovLz2Dm3ZTV25+L+gf7E0hxZp
         mH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772875004; x=1773479804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hFLYMx/eMQ8fDIUE754jWtNcFJvcsDGeyQ8yrn2Ek8U=;
        b=NxjLhbQZKzJvlyXqUrwH5OhFf9e5XBvuH/Be1jHRGilX3Fmf6J5KMGkjKcmnb8Cyfh
         jk3J7PoKxBeXuFOcFK/hwKpOY/Z8h2CYcxw2rbXiJ1jzZZQzdloU5vkqa0jXVP4DdbPh
         SrNO3cJ4Yz5SDWbaGY8h65nBitT9310xM00Lt1MsnNuwkXzdGD/hX5hLIVSSqhWVrvmz
         dQWa3jQmxMzHMYACB9zaAx4HS6I4maxXTs8Xts9EQzMLOfDH7p90D8B4jyfs5ycAqe82
         vHobpL+c0NmojV1bPS6DvSIf9fAw9d7tCMqm2K2t4uXSldj5nz3FNcN+lMz4EK334D8m
         NmXg==
X-Forwarded-Encrypted: i=1; AJvYcCXq+kroQjLdbF1iSRGif+I/2EhXdZWq8NfCwpDHUZ0I/02dFCQJcu6kTtNVQ2DwLP7lF6k2yRyW586UJSk1mYpb@lists.infradead.org
X-Gm-Message-State: AOJu0YxEn1W0hWlSIlTGGphbWCaO3BgUQmsoDwZk7JBdNblC4Hcw3LHr
	+9P8SF/+zsULfSiiC9Je/AWkiJSAM66lqwrxfUNbtJ+ZlHU81HyHCNyw
X-Gm-Gg: ATEYQzwsvi/Pc+lwPSKXMg/bLVP3M6INeVBphYHZOzmo2Rtm/1y+1xdDy7bSt4jHIBl
	/ySbrK/qRix0T2sRIosubE364kZM9QbEopr9Wn3Jo8LTuBdWO/DqGp8l0lOKQ1pJkpmziV2ZntA
	0eNRiQ5tAqVq5vk/EF26Dpcr6i9RRhuYzphIxbg6rbiSYnM2tN2dNTYdwHUkW6bLao2pdVl6jJK
	LC4Fum80omA/PMJFSACv7I4UQUkC4yu7brycnPCAwJUcVcQ8kuSYhmCUk8Gw8+bkYCY5WZOAfww
	h7KwhRYkso8YyE2/p/YFwjWsElQ6CujcDIwIPs5Jg5jylcl6k0zI/iVhbjqIbWQLj6DJiG0+0BN
	Vrg9Q/2lgEElQY2CtTY0xJOsac9YNwQPmdH4JbUXqU3RsmEDVUOIfNVwPVSHk+UUfMkIyEK9uv/
	mS59wIo/+J3mMgKpGtB6B3p0opF6y70cfZU9b7+yLdwDw=
X-Received: by 2002:a17:902:ce82:b0:2aa:ea8e:f118 with SMTP id d9443c01a7336-2ae8241ddf9mr59199385ad.3.1772875004376;
        Sat, 07 Mar 2026 01:16:44 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.215.222])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ae83f74e4fsm45569385ad.58.2026.03.07.01.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 01:16:43 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sat, 07 Mar 2026 09:16:21 +0000
Subject: [PATCH v3 4/5] dt-bindings: usb: atmel,at91rm9200-udc: convert to
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-atmel-usb-v3-4-3dc48fe772be@gmail.com>
References: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
In-Reply-To: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
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
X-CRM114-CacheID: sfid-20260307_011645_558997_EA87D887 
X-CRM114-Status: GOOD (  14.40  )
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

Convert Atmel AT91 USB Device Controller (UDC) binding to DT schema.
Changes during conversion:
- Include "atmel,pullup-gpio" and "atmel,matrix" in the properties since
  they are required by existing in-tree DTS definitions.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../bindings/usb/atmel,at91rm9200-udc.yaml         | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
new file mode 100644
index 000000000000..6961cd5d5d89
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/atmel,at91rm9200-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel AT91 USB Device Controller (UDC)
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+description:
+  The Atmel AT91 USB Device Controller provides USB gadget (device-mode)
+  functionality on AT91 SoCs. It requires a peripheral clock and an AHB
+  clock for operation and may optionally control VBUS power through a GPIO.
+
+properties:
+  compatible:
+    enum:
+      - atmel,at91rm9200-udc
+      - atmel,at91sam9260-udc
+      - atmel,at91sam9261-udc
+      - atmel,at91sam9263-udc
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
+      - const: pclk
+      - const: hclk
+
+  atmel,vbus-gpio:
+    description: GPIO used to enable or control VBUS power for the USB bus.
+    maxItems: 1
+
+  atmel,matrix:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Atmel bus matrix controller.
+
+  atmel,pullup-gpio:
+    description:
+      GPIO controlling the USB D+ pull-up resistor used to signal device
+      connection to the host.
+    maxItems: 1
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
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/gpio/gpio.h>
+    gadget@fffa4000 {
+        compatible = "atmel,at91rm9200-udc";
+        reg = <0xfffa4000 0x4000>;
+        interrupts = <11 IRQ_TYPE_LEVEL_HIGH 2>;
+        clocks = <&udc_clk>, <&udpck>;
+        clock-names = "pclk", "hclk";
+        atmel,vbus-gpio = <&pioC 5 GPIO_ACTIVE_HIGH>;
+    };
+...

-- 
2.53.0



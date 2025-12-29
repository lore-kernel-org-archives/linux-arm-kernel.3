Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7DCE92FD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 18:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11UWr6vQeMvr9imUXUNdMnB+gxpMnYAq1afoJQH8nw8=; b=rNjQvank45wHVglODSXgWGUx9q
	ZC72bnY4XkGft1+r+ddWJBxBAphRwY6j1byRCoZiEc1QhJO6X2FhfIVKmGj1ZU1QsISLYXmf2AJZi
	5ulA8i8WWJmqnWVcA54y3u6DhRj3WvG8J1iZm/vDs83/8JZQzQsaXbRlUpHHb1TtESNPlX8O5Mb0u
	Sju/MLrLXTGD+mHG2Kkpj8vN5CczCo3l7kcNmjpA9Ouxco03XZb/jjZWwQ0EJ9pj+/pN54oL9u3G7
	7US5aO240KwdwWeLlQg8KGixijt59abyNgk5UUfBgmK5Mbc4IyEnYbH4KFTmTxxKUiQmxaZMjEMdw
	D3jMenqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAH-00000003xTR-1HEc;
	Mon, 29 Dec 2025 18:40:21 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAD-00000003xRz-0F74
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 18:40:18 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so92999395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 10:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033615; x=1767638415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11UWr6vQeMvr9imUXUNdMnB+gxpMnYAq1afoJQH8nw8=;
        b=zmH+gRILmRQi1MprV7ROnILXKLr9OjChsqmhRYXC2IlMHc95Q3jVmVMGMtpoM4e1+L
         531kB1bQ0VA9Lwt4wR52M1bvajYfmuzXwDTYs6xF+45yGfrUV+p2qFv2NYtWFquvL1l1
         c/P189qNBP6AMhb+ePaqhAKLu9Aux858ca2d0aYKpkh83J65tolpGCWIlMGBB0BwhAg2
         EBK1Kkca25eE6k1DIkRwcRHk7+IGZ1JRQjlmuYRw1BSed5F+E6fUcxqp6fRuectvRkUa
         RZg+T1rBxvRnMqMv6iuyL8Dbczfo2xHGPsA13npHcZHBI257P+3CT3ylEkKqjOJSxt2D
         vmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033615; x=1767638415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=11UWr6vQeMvr9imUXUNdMnB+gxpMnYAq1afoJQH8nw8=;
        b=Yqvm4rs1R76QsYHtIUB+oADjNi0OMuDOGMkxtbA8lDW8tuOFuY3hu3iDVd31Kzujtt
         cxKatRyOA2wjZ4f/sdyLqUcXYEqt4o1phLIy1tkh6Y2/B9pKb3E1bIxOGEuSOwxxjkSF
         9nZ5UNmslZu2FFDKARdZj4iTMV34qVfnMVWdjjVo5yPiqSG/ENAZAjlF5PrE1yie+iDo
         BuMyHKjLvcDfrMxZZx/sJ9VKEHTLsmntVCj7BRpZQKbe1XikD5SaMJ0ef3IeKYV0K/1F
         Qjz4cBObAlpj5iwr1nvLuJqJjRe9QTLUrR74A6knJf3kJY7Lr0ZhxeDQ9uRloQDtQRG8
         kHaA==
X-Forwarded-Encrypted: i=1; AJvYcCVw1Pu2YUQZlsyg7eFRkQxwKHzvncA7IK7Yw8Fz4ShVdKRKzNv2RdHXBfz4Cu23aboghfR5QBx2Epn2rLlugbL/@lists.infradead.org
X-Gm-Message-State: AOJu0YwMSQ1LA+SKUwkJ1HbRpWTXDbDvs1gJMmNIJLfsxipNVftSBuLP
	QuN1aYrW6yyCuRnrMzl6SrXWgOJ+GSGZC1+dtq6ZZcHZaL2jZ77WNiUFU9Q4UlAisUs=
X-Gm-Gg: AY/fxX6YklBxN9T6VAjCHiKqWpwwTB5pBNynghPDTp34jzA7nXZmNnb/EEeal9rVlGG
	L2WuQ/gY85T4vV6rD2iDIAhw5x6qEhBeeLSfd99ho00G3vKVX2Popgn8pgpueX1H4L1pdj9LdYv
	qlSo5y1sewuctt6txj/sXlOwWiarpV3L4FkQWTSlVKilAz0cddGBP7k1xiMauj9hGRHJGtZWK3R
	oYJEzZxFqkdXgl6uxOvndsuFXyazUEaXz1gIBcage+ZG7fF1TxuAlECn6YdGQ1XF/VX7LWlfvOc
	0T+Ivo4WKoya1xTLeoyZ+035VHU6FZCWjXtQivd0jCgUv2875Of9C+TkoQPLu028pIOrUIdHFVD
	qZSGXMReOrUPvRnq4+L6c+HT3vUR+ZaWwNo08WlcmyMzIDHC/SwhsoQgjD0wf76glCIQX5MO1IN
	WK2Z25J5RXOQR+bP05V/LVOyvXan3Fy8T0yLqYSU8rUhykQGJV3CBfwcmJJh4a2N+VBjitjAhps
	OZO8u/HF7LOInYo3JecXhoMzbrrbFZLJnomPnQ=
X-Google-Smtp-Source: AGHT+IHLaRW54exoV7d2gj+gL+Rt0y3shCu9zPoBut21wi+sGprCRHwNncaVYYsnvBzR7kb1R2Xvfw==
X-Received: by 2002:a05:600c:1f84:b0:479:3a87:2093 with SMTP id 5b1f17b1804b1-47d338a6109mr230056155e9.37.1767033615044;
        Mon, 29 Dec 2025 10:40:15 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:14 -0800 (PST)
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
	linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 01/15] dt-bindings: usb: Add Microchip LAN969x support
Date: Mon, 29 Dec 2025 19:37:42 +0100
Message-ID: <20251229184004.571837-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_104017_110125_B5B71365 
X-CRM114-Status: GOOD (  12.12  )
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

 .../bindings/usb/microchip,lan9691-dwc3.yaml  | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml b/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
new file mode 100644
index 000000000000..08113eac74b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
@@ -0,0 +1,66 @@
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
+
+    usb@300000 {
+        compatible = "microchip,lan9691-dwc3", "snps,dwc3";
+        reg = <0x300000 0x80000>;
+        interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 12>, <&clks 11>;
+        clock-names = "bus_early", "ref";
+    };
-- 
2.52.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17067FD8FD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 16:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98cDGFKI0ittGN9WTwtDxfJA6FpPSB/XcdXQA2mPpIs=; b=y7QdwfvCo4p0he9voWsWHDuz3A
	hLTZPpcBOeG9ZNtOZQl6qOaQO+S2y7Osfx1Kf9qD26Rqea32ygmnHxn0+Fq6fPotH38hmLUX+faFg
	zUFsEGsevRcUZIMKWDIGQ2xJArU/vc5vkt3pD6Skcf5yEbVuOV3H5lRlvvlCvUoabkkQRsSWxD51Q
	FjQlTm8RCpQ7nsyxZMaeCP8upLkV+z+jIDFrBRYu6T3nXCNLek9hVZH6ViDdyTvDOk/wIb0CsN6R1
	+BlixZ1c7zNZB0hWCUD4XWOCWnNeEBMJ4QoCQTybqs/z8eYI09PNbJNsBmdeQoEHup92aaiZ24AH5
	2Ho8X8Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vve09-00000006hml-04Z4;
	Thu, 26 Feb 2026 16:14:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vve05-00000006hkO-2PAw
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 16:14:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=98cDGFKI0ittGN9WTwtDxfJA6FpPSB/XcdXQA2mPpIs=; b=V63Krjo7iVKXzlwIxFb6cxUAEd
	WSZnBn4vnXv0CEtwy4ehBeoCoovB1uDPmByhARnbyf7ybM9l5Ne773+JHvBidKuE74znuM5BDHyZ9
	PBldIFpD31tmTz/J/bkYtN+guaYZ5Wj/W//emUvRpizLdlAUhluH+RZGJywVYTj/JT9i9fDosuoNS
	6OJYpAJ+OiGvrEvPPv3vdXSxcsgOq7funrFMn/0HRPPPXvWeVGGKb7DDjsHLFvsadAySIsXv5BavK
	MbNl7KHlztXLQkf6YPfhcm33J8pMM6JG+JILeHdCG+kHf32C1UTcl2yaN1FKI56dwIG1jfwdf/1yn
	m5UZw0HA==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vve02-0000000BRgE-0mnA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 16:14:04 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2aaf9191da3so6171715ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 08:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772122440; x=1772727240; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98cDGFKI0ittGN9WTwtDxfJA6FpPSB/XcdXQA2mPpIs=;
        b=GFT9ugOE3u1u/YeXBzIaPOZO+pBPUFqtVjeQCqVyBE3k65ge6h9B2SAc9hjP19CnZ8
         SL6U3JPcOEar+HGy2NDHsbTIaLEIWPvuVeTgWPjHLXMZvJLtun0Cuq1eHf46mSrMI8zK
         nSTCTGW+bHBQ8r1njresTM8BwmwElVwqen1SxRgxDv6FB/ZAJysIz4HpSKSmWiHqicUu
         NdrYr+8CbdMeQOZ1kv9yNvSiWDQ4A+bXmrgw9w3gk3zd5s9LfRk6L6vZMiDT6kMNoELQ
         Rf9+/eA3oJJnVe4JSb6xtCGS7iwto/u3ThJsZTJI8NuRVe//XdOaz3tPbRo3h2xGMUxR
         a+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772122440; x=1772727240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=98cDGFKI0ittGN9WTwtDxfJA6FpPSB/XcdXQA2mPpIs=;
        b=i0Rk2Ol/CCiZlgjGs/mO3IuwznIn8UlxgSBgM1FZVN8bDFVPf/JpwUCZ1QqG0GagYJ
         vgsWHDoP6fylWIi3sT+jW5zKVTK63jzpU55PvP1lt2dGvJ7rauyFL000zls3UVME68TJ
         Ub5o/rlX6+/TmDekaS7C/hK0SsKNXPnDHCouHJoWQZ/ag6AwLH1+YmFRWlHU/aJt3uto
         QoDNR0h3CFm5XE41bfRSROPOgrpBUs0TK0SZih29pJkf4aB7kbXjzDJk6DilrO3yTuDV
         IJk4fLRk6ZNeujywSXnf7vPrN/2UmxqsPsSb2QEffzcHoT2K+gRJRgzXDtVZMQgsqnVV
         QwVA==
X-Forwarded-Encrypted: i=1; AJvYcCWVZNlN7+lAoh/u5kahDUj+d7yKD1VXbYJMlkntjGDAYkWlAMUpxrKA9djcsVbiYPx+/nmYojJ3vF7xYWqzk2KN@lists.infradead.org
X-Gm-Message-State: AOJu0YwD/PfejsI2YZeuRqKFESs8YQEbNvxd/3dUJCDGPVosU4do2GIQ
	avR0SVMhheDOHlTZ5hd3RMEjaGZvBKnJR8CKmwAGCba8k03bpvEOZCzf
X-Gm-Gg: ATEYQzxl1CczI8Fou+iypRrq2CW8aHsH/T5UAz/9ysXtNcFqzWfeivD6GUQpLiFjpE2
	YS6n4CR0to5i7sMqCPHBXxp4ATPgAicc2sCJapWKrT2xpq5AOfJw/bij/8uXzIzH+1ZJnx6bmqs
	S0mlgitc7x0rcs/+bNnYe9oBLK2eReraDWnQDKP3ngIatPQxjVQUzHQK1jtotLTTAPL2FrC/vKT
	zmgvRHifPo8xz1Qtz+JLR91eSO2bM9fSrD05dSPAUqbjmwXuEYXy6oaUm4Sjo0X8/PpmV6Vhjnh
	CLeVhDmOcPdGWw31wZwSjDkQ0kRlWrE2ZiMgatZsy7CLm+ltTr01F7pfmzm/duum0lzcjvYsPKH
	depjeSysNcDMbYptK8MwveoGmD9WEi9bcD7lByagtA+0XBf2vAEucqu0dBSRY+QXInFZmow2jAH
	KwpX2D00n30w4UUE/TUfR32mYBvo4JjPnYXZMejeV4VjDb1Q==
X-Received: by 2002:a17:902:e74e:b0:2a9:602c:159 with SMTP id d9443c01a7336-2ae0327267fmr27260525ad.19.1772122439955;
        Thu, 26 Feb 2026 08:13:59 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.183.54.8])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2adfb6a0432sm44384595ad.52.2026.02.26.08.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:13:59 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Thu, 26 Feb 2026 16:13:36 +0000
Subject: [PATCH v3 4/5] dt-bindings: arm: atmel,at91rm9200-st: convert to
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-arm-microchip-v3-4-0bda15abd922@gmail.com>
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
X-CRM114-CacheID: sfid-20260226_161402_339046_84B690AD 
X-CRM114-Status: GOOD (  15.88  )
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

Convert System Timer binding to YAML format.
Changes during conversion:
- Add "#address-cells" and "#size-cells" to the properties and required as
  watchdog is defined as a child node to the timer parent node.
- Define watchdog as a pattern property along with unit address in
  examples.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../bindings/arm/atmel,at91rm9200-st.yaml          | 69 ++++++++++++++++++++++
 .../devicetree/bindings/arm/atmel-sysregs.txt      |  9 ---
 2 files changed, 69 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml
new file mode 100644
index 000000000000..3f6a934a2a69
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/atmel,at91rm9200-st.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel System Timer
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
+
+description:
+  The System Timer (ST) module in AT91RM9200 provides periodic tick and
+  alarm capabilities. It is exposed as a simple multi-function device
+  (simple-mfd + syscon) because it shares its register space and interrupt
+  with other System Controller blocks.
+
+properties:
+  compatible:
+    items:
+      - const: atmel,at91rm9200-st
+      - const: syscon
+      - const: simple-mfd
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^watchdog@[0-9a-f]+$":
+    $ref: /schemas/watchdog/atmel,at91rm9200-wdt.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    timer@fffffd00 {
+        compatible = "atmel,at91rm9200-st", "syscon", "simple-mfd";
+        reg = <0xfffffd00 0x100>;
+        interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
+        clocks = <&slow_xtal>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        watchdog@fffffd40 {
+            compatible = "atmel,at91rm9200-wdt";
+            reg = <0xfffffd40 0x40>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
index d0561f7f465c..14642384bc87 100644
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
@@ -1,14 +1,5 @@
 Atmel system registers
 
-System Timer (ST) required properties:
-- compatible: Should be "atmel,at91rm9200-st", "syscon", "simple-mfd"
-- reg: Should contain registers location and length
-- interrupts: Should contain interrupt for the ST which is the IRQ line
-  shared across all System Controller members.
-- clocks: phandle to input clock.
-Its subnodes can be:
-- watchdog: compatible should be "atmel,at91rm9200-wdt"
-
 RAMC SDRAM/DDR Controller required properties:
 - compatible: Should be "atmel,at91rm9200-sdramc", "syscon" or
 			"atmel,at91sam9260-sdramc" or

-- 
2.43.0



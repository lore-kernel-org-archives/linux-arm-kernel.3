Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7546AE9A020
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 17:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIf2W/UVc68aR6lzv7jLUHhKkekhiH4laPerHLqaDAk=; b=QJmLBbdaiS6rC1cT9rBIzSbCOX
	YnG+fDJgwHb8DjiyX1YyXDRvYrn+Au7Nroln/5yumZak7LhCHttyqLdukn18hUmc5VR9HmNtxxVCN
	cBjCk8TSKFRzO876Vgiuwr/YmQwXw7S+OyzwJGgmRe/kC9B+5jDvoXLjU0+PdggXyVwo/OD0Q0xYS
	hJFgE8xLk7LiBzZrvDeP6lfuoRv5hO4yuRFFiS6s7JktNEgUhma9bgQ7x1XmlL+zByApHYtb2spfX
	esPjVFgZYA4+HihsCqW1Mbuo9i16Ss3PE8HjSVPlwB6N6Wbk1MJ1sdTBn1cfHwlNWyYHkZvAJ0nBi
	bwYENmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOoh-00000008eYy-1eLd;
	Tue, 17 Feb 2026 17:24:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOoe-00000008eXK-0zX3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 17:24:54 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2aae4816912so30977655ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771349091; x=1771953891; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIf2W/UVc68aR6lzv7jLUHhKkekhiH4laPerHLqaDAk=;
        b=ctiGkeHql3Da/dOFpKUeRgElRMKsNJG8WnMjMK1FlXp6OIqGMLmzgBGqQfoC1L3pgS
         eUZ18cP2GkXaoCmCf4taRqW4f7K31xMeTcDxcP2EbxoLTEZtv8Ch7zUt8mEafzSxjC+d
         DANF/T4z6Y8OeZxPxhlX/qUXl/qqOtliXYKsZATto9+txnfTAwxL/fJw4mSf/jQ65u62
         diDcceEbol7Mc4ZpvKi2WutLQXghqwYCkTLUEaIqSzR0Yut16x2rLACbT0+KeIyAdfwz
         5Oo8HBaj5tmvOh0lnS9akOg0n8J010vU+Ns3Hf12uQ7F0wsgDH90gkKQSTK0ivnx0k0A
         QENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771349091; x=1771953891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oIf2W/UVc68aR6lzv7jLUHhKkekhiH4laPerHLqaDAk=;
        b=vtIRRf5e9QpuF8svFrTg1vpNRfCPg3hTTPFgxI4+qGJi0hW9aSwJ5JYdnhvUwjXVa8
         df6Vz58uQgNC7y9HGsah0E/sZXMWyzM7HhW5rMa5hqV+UrftynUKAI4Sm4//lxQ41jjY
         wwY8tWTNyUZbXHs6LNg57y1AvV5aK3KjdkY08CPyCh2N5T7mmUARC17aYl5LDYW2ltsQ
         AXS//2ki+jOgv16Pf79t0xy7xFK9kglZ1IHKsaI0J3vqqzyCCaMmojdRtL12DkOVqMZF
         89otPCP2nsStaMVoaXAj1/S+GZzJ5fs0jR6fbEEaJCrQEDcgjuKGEqI62etPJec5Hqqt
         /4YA==
X-Forwarded-Encrypted: i=1; AJvYcCUi+uhvfmK5cvBDp1Rler7g4/HlcU3RZjR1LzlRztJmU12CIl5TOH5L7mXgG1RVNlMRwl/kbpvc79eBKY8NHnsM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5A8az8OjAz9gSdGUjO/f5+UgysSmRZ8pWCTeIgFDZUaUAHxY+
	Nt8gmLYnMQauUwAl7inbwaaGzVcFIWfTCT0JmcBwVw7SoqTNEIQAXJGI
X-Gm-Gg: AZuq6aLUMLQl2+19TqPI7nIY+WHE8DvMk8PFYHV4vtovbjatusx42cEueNjUm7l6jSX
	AoftuUdcRjTWw5GaBpLVh+wXOhtI+e8YNZkrAopj9BgzICG+rT7BvCtuH6Ma6/InrMInZLqcvGR
	cpZPxC7fwc98IxH87jtLPu7XcZDUd5u1G2jPJsdgcOqe/KJAWRqRFvoCpGLDtfptN1uE9hcV8fl
	dYTqrG/atEl/sMV6WgIgEihoqrWQT1CXguTRiMrpwHk2IzWmUTz3FhIg8cc4CPCUgmcmVhdojdN
	xnXjfaKZxYZ4SuyJNAuF0tMDmpByIpsiHTjFOSNVmQer6/bxhnIhg3jNey0HJNQ9lnk9rIbh22R
	clOUjYkGGPsSsbTQSdB+SmJ9qv5SRIpEmmZhmrtW4SsN7AvfDZEr7JVxRpPjlRdBvMvx5ZyvSFp
	v0ju/+A45R8rYb1hnYgAe+XMmWSVD8cXJMCWN21Cx7/CofKP7M
X-Received: by 2002:a17:902:db0d:b0:2aa:e21e:bfc0 with SMTP id d9443c01a7336-2ad1754fcf7mr120165095ad.47.1771349091328;
        Tue, 17 Feb 2026 09:24:51 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([223.181.109.65])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ad1a7145cbsm146880305ad.30.2026.02.17.09.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 09:24:50 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Tue, 17 Feb 2026 17:24:23 +0000
Subject: [PATCH 5/5] dt-bindings: arm: atmel,at91rm9200-sdramc: convert to
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-arm-microchip-v1-5-ae5d907e10e3@gmail.com>
References: <20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com>
In-Reply-To: <20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_092453_584491_3952EF4D 
X-CRM114-Status: GOOD (  16.23  )
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

Convert RAMC SDRAM/DDR controller binding to YAML format.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../bindings/arm/atmel,at91rm9200-sdramc.yaml      | 67 ++++++++++++++++++++++
 .../devicetree/bindings/arm/atmel-sysregs.txt      | 48 ----------------
 2 files changed, 67 insertions(+), 48 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml
new file mode 100644
index 000000000000..76cd8f73331c
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/atmel,at91rm9200-sdramc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip (Atmel) SDRAM / DDR Controller (RAMC / DDRAMC / UDDRC)
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Claudiu Beznea <claudiu.beznea@microchip.com>
+
+description:
+  The SDRAM/DDR Controller (often called RAMC or DDRAMC) in various
+  Atmel/Microchip ARM9 and Cortex-A5/A7 SoCs  manages external
+  SDRAM / DDR memory. It is typically exposed as a syscon node for
+  register access from other drivers (e.g. for initialization or mode
+  configuration). No interrupts or clocks are usually required in the
+  binding.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: atmel,at91rm9200-sdramc
+          - const: syscon
+      - items:
+          - const: microchip,sama7d65-uddrc
+          - const: microchip,sama7g5-uddrc
+      - items:
+          enum:
+            - atmel,at91sam9260-sdramc
+            - atmel,at91sam9g45-ddramc
+            - atmel,sama5d3-ddramc
+            - microchip,sam9x60-ddramc
+            - microchip,sam9x7-ddramc
+            - microchip,sama7g5-uddrc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: ddrck
+      - const: mpddr
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/at91.h>
+    ramc@ffffe400 {
+        compatible = "atmel,at91sam9g45-ddramc";
+        reg = <0xffffe400 0x200>;
+        clocks = <&pmc PMC_TYPE_SYSTEM 2>;
+        clock-names = "ddrck";
+    };
+...
diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
deleted file mode 100644
index 5ce54f9befe6..000000000000
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-Atmel system registers
-
-Chipid required properties:
-- compatible: Should be "atmel,sama5d2-chipid" or "microchip,sama7g5-chipid"
-			"microchip,sama7d65-chipid"
-- reg : Should contain registers location and length
-
-PIT Timer required properties:
-- compatible: Should be "atmel,at91sam9260-pit"
-- reg: Should contain registers location and length
-- interrupts: Should contain interrupt for the PIT which is the IRQ line
-  shared across all System Controller members.
-
-PIT64B Timer required properties:
-- compatible: Should be "microchip,sam9x60-pit64b" or
-			"microchip,sam9x7-pit64b", "microchip,sam9x60-pit64b"
-			"microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b"
-- reg: Should contain registers location and length
-- interrupts: Should contain interrupt for PIT64B timer
-- clocks: Should contain the available clock sources for PIT64B timer.
-
-System Timer (ST) required properties:
-- compatible: Should be "atmel,at91rm9200-st", "syscon", "simple-mfd"
-- reg: Should contain registers location and length
-- interrupts: Should contain interrupt for the ST which is the IRQ line
-  shared across all System Controller members.
-- clocks: phandle to input clock.
-Its subnodes can be:
-- watchdog: compatible should be "atmel,at91rm9200-wdt"
-
-RAMC SDRAM/DDR Controller required properties:
-- compatible: Should be "atmel,at91rm9200-sdramc", "syscon" or
-			"atmel,at91sam9260-sdramc" or
-			"atmel,at91sam9g45-ddramc" or
-			"atmel,sama5d3-ddramc" or
-			"microchip,sam9x60-ddramc" or
-			"microchip,sama7g5-uddrc" or
-			"microchip,sama7d65-uddrc", "microchip,sama7g5-uddrc" or
-			"microchip,sam9x7-ddramc", "atmel,sama5d3-ddramc".
-- reg: Should contain registers location and length
-
-Examples:
-
-	ramc0: ramc@ffffe800 {
-		compatible = "atmel,at91sam9g45-ddramc";
-		reg = <0xffffe800 0x200>;
-	};
-

-- 
2.43.0



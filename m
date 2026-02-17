Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A353E9A020
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 17:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wltfpER1EX3NZ0J7DGYiBhlkNSq+usE1Anaap9AMNVc=; b=CPnWDYMzCmhqKCL+QRhzUEKqF9
	uSVa5XBIxftW4aFnchi3c/7ALHbu6v3AbUqjdkxm10K9/qekw7RJ0FFSLKnq3RJOVBzyMsJgr0TY8
	lTtPbCjNSiByXz4psaaG+uoWbBbF3+fcyN94C2ki6BQE24lxoJNDdxWj4YDAHfx0lZKeqeb6AEU+n
	3ZQU8zJgiz+nIkkBP0w/VvuSvVknortLomu9AEFmlj6yOvGwnUAW6jstDBZ15Ti4xa/6z+f5I9NP8
	cl2+4mGTMOlq2d/mmfSLRFA0JMiAebORhh41olm1kM0DfpLraNwaN3EtIIW3kMjVQqnTBS0FyEJwA
	FljfvkrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOoc-00000008eWS-0Plr;
	Tue, 17 Feb 2026 17:24:50 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOoZ-00000008eUv-3vG6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 17:24:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a8fba3f769so19801365ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771349087; x=1771953887; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wltfpER1EX3NZ0J7DGYiBhlkNSq+usE1Anaap9AMNVc=;
        b=NvWBGTpHT90AMZo/Y3EWwOMIiPrvKhYx1vSMu8Bbhsvs2JruBHhu5KxhkZyPlUSH0N
         coPfhQ2lvHLyAa2GbIDdJtesg8vk6iLjfPlVMj/Kyo3KIGfRqaBVapwcz0aUVnuV/Teh
         xNEvWhu5qtxX3TQiWFwz6c3Gj+IF2pvE9dEqi0ncZ0RMyoTiAwH3x8tjlU8vuu0AtYps
         mrtzRPexjYoh6njdthUcoFWyidI9+oL7uYRTv+uDjCMl7Uy7isNCIbyFt2xudW1Zne/M
         8c8KfLOZ+usaeY4vx0Ct25NPhYbVDcJOWgFnaCfKN2ndgudgSOXIP8ZR3o3K1VPBVxzr
         nGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771349087; x=1771953887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wltfpER1EX3NZ0J7DGYiBhlkNSq+usE1Anaap9AMNVc=;
        b=ZLSGQI9NRxlHa7fAcVXBKtoy9b+5xlhyvnHktnVRZ6HKI+D6LJ+lq0iEe/ED6dX6xM
         UrhL8p33OoDh4JaUH5LZ6sNhgEZkL24FvHQdZWl7OF2fOhbeBadusFq3vv/nosbXa/wn
         PHCgGrO+acV0aW/9TM9sgtBB85tQY4C43B3bnHUI5MKxMlWHxKkjgFge2u6TZXZ27i1l
         6Vqxp7XEClCQZknsaLIVOrrPRr9XpLcUaupPBpDvv40udQMOgZ0s7djK+U4JP31YEYjB
         4VS6z1QtVEhyJ8vRVkfUNxtyK9/HW2Sn5ba30nT4SBFlKMyuPvrXRpB39+E9yU5rDbBV
         Ta/w==
X-Forwarded-Encrypted: i=1; AJvYcCU2mUrQ0L5PerWKOoODFirf5GvfUYQ+iDbsVzCaNTMfjPVBxowlGLO2k+X27b09lBAueIVcuiYyUVt7DYJVqeGn@lists.infradead.org
X-Gm-Message-State: AOJu0YwKbj2cgy75+TAXCNKvXPqVuW2/UfJnl4qoCnSHksuo/yC+LjAB
	/Ef7hlooTVicfQS/abQnB/tjq/vD8RDGbw9d+Uvj5B5yro8r52GAtZtI
X-Gm-Gg: AZuq6aJFTwFMUae4BrxA8ew/4JpkMRAUUkJSqjn+c5dE/745WTZ49bxuT/HJxeLygCD
	7czAPBJUQrwBw7mDn3RIhJ8hMoSJ2fKx80XR0RslqugqW1IGp1SyO99DU5Jbjs7s1IRzSibKmjN
	N9DuI8XktXo8Hz3vDxysB1sx2FJdIrnUEE/751LV55acB1a3OIM7i0ZMc/QT9TOlLgsdPYFFIqg
	YeAWehyzp42MZgUsKCJZNrcPAAEKpFSXhjD/FwhFrWhRDiMFP1vTiIdrjj96BVLEGbnpYqp1J6r
	mH5yMG8OQ+qC3ZtX7DNxAGegbGPUAoGbZKCbb6+nIwq+wxrn/2xPWi0xLG2mYTAHqjm8Ls7fF1O
	cmnAPp9gpju3ZED6xrC/z/Qi61rDM9VUF0nO4Rura8A75G61WHXxLHVIurT5JuLOLYB53/WF4rt
	8LbWajVfuy351shjOU5ZXv/KwpP8G2S/VVgSjliGBJ3G7VireN
X-Received: by 2002:a17:903:1b43:b0:2aa:de7e:efae with SMTP id d9443c01a7336-2ab5061ea4bmr150303725ad.53.1771349086846;
        Tue, 17 Feb 2026 09:24:46 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([223.181.109.65])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ad1a7145cbsm146880305ad.30.2026.02.17.09.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 09:24:46 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Tue, 17 Feb 2026 17:24:22 +0000
Subject: [PATCH 4/5] dt-bindings: arm: atmel,at91rm9200-st: convert to DT
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-arm-microchip-v1-4-ae5d907e10e3@gmail.com>
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
X-CRM114-CacheID: sfid-20260217_092447_992316_D3469358 
X-CRM114-Status: GOOD (  12.99  )
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

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../bindings/arm/atmel,at91rm9200-st.yaml          | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml
new file mode 100644
index 000000000000..ac6e2c71969e
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml
@@ -0,0 +1,65 @@
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
+  - Claudiu Beznea <claudiu.beznea@microchip.com>
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
+  watchdog:
+    type: object
+    description: Watchdog timer subnode.
+    properties:
+      compatible:
+        const: atmel,at91rm9200-wdt
+    required:
+      - compatible
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
+
+        watchdog {
+                compatible = "atmel,at91rm9200-wdt";
+        };
+    };
+...

-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C787C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 12:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfWmFS5ER401fuRy1i+KSp84qUrDXaJMiV7A2WK6mME=; b=BC10xDomp4DFJypt/J8XwgWfOG
	hKUu/Jp7gU2XbY8p6iSrUNCYJDWeY/Wyurdwb7t3ndC1g8J2Wl6KaYVx0v7k7x/2ITnUZilHNATTL
	nPHkV1WLE15d+LnsVRWkNfOQyp4hi3r8qVrrts9f3DfrhAIYdfHm9y3d+Yos57MUPcrJai7WRpEXd
	Jlhse6NfaQcS4CRBkGoCMrFECSVp/bvHPNlrhoZgc+k4MA3RmgXcLwdWdgDCQWXrM8e+c7l3gQhr8
	PlpIHCMpV49O8aigI2BPYMJMWGxTPh7RH8yN9IrUzJQrLMNAEniknbWl4l+q7aciurx7/c0e8iMV8
	HAebQV5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul58W-00000005aTH-2bIB;
	Sun, 10 Aug 2025 12:26:52 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul53X-00000005a2q-0o7D
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 12:21:44 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6152faff57eso5601217a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Aug 2025 05:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754828502; x=1755433302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfWmFS5ER401fuRy1i+KSp84qUrDXaJMiV7A2WK6mME=;
        b=QTcl5w5+8W36KMVzHPVehIp0QgCm0VsyJs+blUrqVPVL/ae4IlpRVkwbCKE2egGg9w
         Le5UlpWtssQ5uJJruULEEtdQHOmbd7+sFgNW/D4bvJW0PhIRaHsK/ICg4VWSZ8GVbqsA
         HeW5cFsrguaGQwqyjjk+i6SLZXSDjgZ6drDg/gUPpeXJjL54YWn7xb8Kfc+kcy1Cr27m
         xwNYL4LotTplxPGDGkMphUx86GUeWXeYaKPmulF3q5cwMaQwC48AplrJOJPDPlX4Mv22
         E60XaVZ2YWrQ7QikzTADF9ve0ZDt7G8GLFArRubAuxiDFvnpZBy4uFR0ATeORv04C/8i
         iIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754828502; x=1755433302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfWmFS5ER401fuRy1i+KSp84qUrDXaJMiV7A2WK6mME=;
        b=DywfUnHlDE1KsyKPLbZCnGPMh8p1LrsWdPelgLgJMLaf4Qkf2DFyXYlw6nrvZQmqB3
         rw/m1pDJX3OdNKB/quoFWyNR3AuSzvcFNM4grlWx2si1wEhgJnw2HMSrdWXG4h/nZyQX
         4iP0+XduviNHZ+5FfoZcSy8cL2280auwkfWUvba1yoU6HSTf3Ao0NBIcg5FyvG8ndZWF
         v2AvhbCcfneYi4x2bEoaZQ8/CTBbZNP/MZHln9UlmaqNIujx0GrPY3W96jMd0rX98Suh
         oxWNXx6JPYO8uZcIH5AA/7GuGK1DQwKJRmyvFmnKbsea/EBplBLSXc2tO2HqTPtTpA2g
         eIgg==
X-Forwarded-Encrypted: i=1; AJvYcCUUlt7Y66dHoPd17MpXJfIUZN3yQuOsTkiWZrCYIm0+4bwRykct8E//l1nSwLan1FZyH6QCfANXagIFvAyEIfQY@lists.infradead.org
X-Gm-Message-State: AOJu0YzOokOfwkcflYHWkIIXxKuB0kWmpi6DzeXjdD/9Q65TYQZjm122
	T+moSF6WxDF4nGQ//SoXshglk+KlEGjcNIYUdrnCR7POLuY41fH++nHyBEy3kfQcfF8=
X-Gm-Gg: ASbGncv1+s8eS+jHoMYW61F3NlI79jx8M+PGUmTwA9tB3xRuqx81yrp/8VMwh7tmYqS
	3fJ2gnRAjgf77r+LNmSzDMlHoxKc6MnKefxFk6hfw41j3Zr261slKQCfFmKL57dBYJgj4WLRYqi
	34DmI+GVS61r6tNnuAfrMthGLuCFWp1BgKDFCKxYOBltAIj7tgjss2E6/z0/pc8+vqu/S5L0cRW
	ZPcpit6Sr2HryeR3kOUYk38xpAr/NK8AuSrXpkqGlv1w7Q0YpDiBk5E3FTLL0k1FEzOfKLfO9AW
	dasKIdzzJ04gUUpR6tUApHYbtGZ6jMK4bsTEwpTzvM5/w8+ME0s4fvKoXkgP2bpmW60QzfabKvH
	9eYLFWKZd7CBlvrch2oqsDw04cXpIh/ZYprJkgW5YQNaZ98ywr8aM
X-Google-Smtp-Source: AGHT+IH2BxpYN+/o9cgRtTlYf8Owzh1LVUE4C25JyBYtNyqSEZQBYiszthjxHQH7Zc1QUqUs0PMx2A==
X-Received: by 2002:a05:6402:2808:b0:615:539b:7acf with SMTP id 4fb4d7f45d1cf-617e2b70974mr7908566a12.2.1754828501614;
        Sun, 10 Aug 2025 05:21:41 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a86758fcsm16611897a12.0.2025.08.10.05.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 05:21:40 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	niklas.soderlund@ragnatech.se,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 1/4] dt-bindings: thermal: r9a08g045-tsu: Document the TSU unit
Date: Sun, 10 Aug 2025 15:21:22 +0300
Message-ID: <20250810122125.792966-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_052143_232385_F0594663 
X-CRM114-Status: GOOD (  14.62  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC includes a Thermal Sensor Unit (TSU) block designed
to measure the junction temperature. The temperature is measured using
the RZ/G3S ADC, with a dedicated ADC channel directly connected to the TSU.
Add documentation for it.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 .../thermal/renesas,r9a08g045-tsu.yaml        | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml

diff --git a/Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml b/Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml
new file mode 100644
index 000000000000..573e2b9d3752
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/renesas,r9a08g045-tsu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3S Thermal Sensor Unit
+
+description:
+  The thermal sensor unit (TSU) measures the temperature(Tj) inside
+  the LSI.
+
+maintainers:
+  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
+
+$ref: thermal-sensor.yaml#
+
+properties:
+  compatible:
+    const: renesas,r9a08g045-tsu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: TSU module clock
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: TSU module reset
+
+  io-channels:
+    items:
+      - description: ADC channel which reports the TSU temperature
+
+  io-channel-names:
+    items:
+      - const: tsu
+
+  "#thermal-sensor-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - resets
+  - io-channels
+  - io-channel-names
+  - '#thermal-sensor-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a08g045-cpg.h>
+
+    tsu: thermal@10059000 {
+        compatible = "renesas,r9a08g045-tsu";
+        reg = <0x10059000 0x1000>;
+        clocks = <&cpg CPG_MOD R9A08G045_TSU_PCLK>;
+        resets = <&cpg R9A08G045_TSU_PRESETN>;
+        power-domains = <&cpg>;
+        #thermal-sensor-cells = <0>;
+        io-channels = <&adc 8>;
+        io-channel-names = "tsu";
+    };
+
+    thermal-zones {
+        cpu-thermal {
+            polling-delay-passive = <250>;
+            polling-delay = <1000>;
+            thermal-sensors = <&tsu>;
+
+            trips {
+                sensor_crit: sensor-crit {
+                    temperature = <125000>;
+                    hysteresis = <1000>;
+                    type = "critical";
+                };
+                target: trip-point {
+                    temperature = <100000>;
+                    hysteresis = <1000>;
+                    type = "passive";
+                };
+            };
+        };
+    };
-- 
2.43.0



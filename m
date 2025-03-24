Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D966C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 14:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UNHK0UkXslOXK9Cojg+TA3Q9iNaUiBxGFRZEPfafnE=; b=0UFDnsFH4wmh0zJ7fzqI5Jznmh
	Y2swh3oHWHu3zE503Y/fba2aszzdZuehdCaZhqHiSTLJyV2eMLzbIPsPbV9qlc2ja/d6RS6SViIr+
	MKUA60lD1NvxbbT47GbPoOMKFi4Z4UWViow4yn0DAYD8RGBLnx3xD07UZuoHAB7i9PYMil9yJDbdi
	M7axMMPRb+L9CuSgHROZRcxTjb5EG7MmcCP/B1kp/sEz3Lh2sFaIFpefkoCwJEhE8Y7HI8tzD2OMO
	yEAVfSgxPx+BxYBqxZApi8eE94f45Yi8O25HmLTzOdZk6CG1NrGAVx0WQ8UaASoKA0Lk8MM2a5kOI
	37foPEaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twiM6-00000003Kcl-35X9;
	Mon, 24 Mar 2025 14:00:42 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twiIi-00000003K5n-1buc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 13:57:13 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cf680d351so32179335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 06:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1742824631; x=1743429431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UNHK0UkXslOXK9Cojg+TA3Q9iNaUiBxGFRZEPfafnE=;
        b=nQZ/xN+4ZireRda/GMIjV117yiL0jGppqOJDKfVFBOddTu4GaR1LXr6dn0ZvzwPk1u
         k3MQyJq6oMy2V5QIiWzpiIQ8NYJvCKEgPsXezUK0jutv6a/1u72Wm+sYkNWacfY4Fw28
         SzzSAom4Xx/xiftxb9OeDn8KUDT+e0XYx+1tBrHap+nrzypEy2DbYFaeZjop2iQmh0Qi
         FvhVTvigRBSUAFqjznFJE9cmDb0y69tVTh50KMi6pGSpyS+jkAV/gg7X7sBDFQ92DXGG
         Xl4d2WMOH3/F7f2mXb0frSXcu5S2SNslCaDes8QPvnB59TSZzy7L+oZhquqd90Pfv5fp
         uoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742824631; x=1743429431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UNHK0UkXslOXK9Cojg+TA3Q9iNaUiBxGFRZEPfafnE=;
        b=QQ+tGHGoLffCUiV67CpZaysbM2KrX+9cE8bHoySi1jdErG0K1JjMQyxPwNX/IIOc4u
         s3Md0N61tssdEhiL6HGUhgD8EKF84OurqEfiTex0RSH/OvPlbR+425qs7Obqca10J1IQ
         IEQHMIRDCrubke/kQMjgEqxRq11bNx+RodLZLNza03H1BDdCJi0yO6Eg1DHwTEGP17d2
         yeIhgcFW/vbFH36XrgZmyz9G5+d1MO6oEDRG2Rct0vKhuOgAivA/NLrjYKzJhNcmZ7TQ
         MipD4WsOc0IShvf/6d2/wNdp+Z5BtokcOEpVh0BTj5FcZo4juJf0jzfaLftcoxy5ehkl
         VY1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEWo4f4r8u+tpc13GCyzCM5h47nHipIGd3VXTdNDSduDLegDdO404YLPABleA4GZD/MXPaGHiIDRKDPvcSOX/q@lists.infradead.org
X-Gm-Message-State: AOJu0Yx630n50xOg/pd9VStS8HLEuoDqq4A3louA04UGqm/+VJGgNLot
	Mlj8Ank6ht9OGUyYLJjrLRvRwQPTy7CBCuNoSa/oynM7fGfPOs9Q4IQhG5e/cKY=
X-Gm-Gg: ASbGnctX6WU+jP1ShZK8KqZpNHoopvzSGbnlJGx5Mx8WQgaoRkwiw2jdYiT4c421Uu+
	6Ojs9gUwehpFeulNGj5yyZb4GeZtIGFberk0oMe7/q5Pvvb4xA1FBi9TznKvhU+riTPcZRZyLeg
	3ziLJZCy+cPVq/F09pczen/jaKc/MoHUa12/SdV1a6MaeOjdXv+Csg8x+BfkZCGehMTA4HRIYOe
	9CgQ20EgF5G3vJcbVSSc6AEolyFPQpFr0aX4D3cvi/2258tokFfzU/ZR0l9JKc02ITMhRn6IJAV
	yDBQkrOsww+yr9lfz1BS7qNi+QuiZE4fMlcpmJSvqdsziswkwm/nLKXDl3ScOB3ejcsNuK/etA=
	=
X-Google-Smtp-Source: AGHT+IF+aQ0FEvkhnRt3sxgn6g1Ze8bSrdmghjRhLESAenZp4cAyrmpvI0c8iq1nlVx+oM3A7YzpMg==
X-Received: by 2002:a05:600c:cc:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-43d4915e6bemr141532175e9.3.1742824630850;
        Mon, 24 Mar 2025 06:57:10 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbcfaasm120146525e9.35.2025.03.24.06.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:57:10 -0700 (PDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 1/4] dt-bindings: thermal: r9a08g045-tsu: Document the TSU unit
Date: Mon, 24 Mar 2025 15:56:58 +0200
Message-ID: <20250324135701.179827-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_065712_424312_1A1FAD03 
X-CRM114-Status: GOOD (  14.69  )
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



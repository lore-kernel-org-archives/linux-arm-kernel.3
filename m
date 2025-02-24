Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EEFC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 17:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=420c+7A1+4JbduZFaI1FEUdQhJT2kTAJKMnNgK/61Ek=; b=j5vSQrSbG1XtKv/Z+hz8TfwBIs
	3cjOLmnyyzZSyKJd5ZkTqrQ5qxeIF3MyqCeN7Snm+Iccv0ka/fpcCIyjgGG/QfkCA29w/g4m+zzYo
	qAOi64yf2XawjutFL/NnJv2MIodKeVOKhZXdJRYEdITmKfAj9zssTnSWol4aGxT5NLO7iuJcPk6QU
	VWXUJIxyQ8DtiGZ6k8Pt5GStZMV1kW+KWNTVQI5CvOQb4nodIW72pU/UJVdhMX3LeRTKPDlcyjZcC
	9UOwS/YRFnzgPfwo3CNwT52v9mmM3ryMVP/e/ljATeT0tDjIyet70ws3YZfIxbXDcv2+AM5RRIy/B
	Mtz6EftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcMH-0000000Ee8e-3TA9;
	Mon, 24 Feb 2025 17:35:09 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcJF-0000000EdUS-0OIp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 17:32:02 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5deb1266031so8557808a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 09:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740418319; x=1741023119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=420c+7A1+4JbduZFaI1FEUdQhJT2kTAJKMnNgK/61Ek=;
        b=UCqfqGdO0JpGX6CX26+rg0+EReQKA3wciKkc3fZUIBDWMQ//oSmcWUx22xmz4VjdD+
         P2dAYr8hsG61JdlmOrMVBBxNrpCHOE+VVB4l6q7MgU1doWDjGMvPfyDdYPdAz9wzPVxP
         +P9Ov7ZIi/VFWLv8YHw92YK6ZJ6FhxWR+CfZ8TGf8VkNa/di7BhZgdDu1jqS7dUJ58iu
         /wg7wRAjKHZuXPpyjyrt9/VHmWj9E9Tu1nGOoYDqRrQrs92s7deXNLV7ZGpBATZlsf3x
         wD9utN2l8QGldDq0yPnImV1RG8Xq5+uflrWn6sDQT6bGSmlR0fLkI4jy9HSmiitpEhez
         5vHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740418319; x=1741023119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=420c+7A1+4JbduZFaI1FEUdQhJT2kTAJKMnNgK/61Ek=;
        b=tNwLU+gV7NNowN8WF9sbyrguWtLc39vwF6X96/YphMQiQDB8OA9C5KFWpgpCu2CXP3
         FDSM3q7AH8wqKN7N4heM8jVaBa7DqXn9PzG9af8c2C79IzRIVkRcqtsHOLy1LFKGiMbK
         /yGnmh2v8EsPkW02mPJ6KGwuUZFV7bemCCaHN0TrMrXi8euQQcHK799cAY3YQRoBzaC8
         fmODpwjZMe78/A1b0q6bQS/tTTZon3celi2hbCHpS+sWdU/V/yOx/NGUjfIOKQ7OC3K4
         yrX8DIcy1S/2ZvY/3Kb675nweaSq1XY5ubXHmeE8ogMPLgMoMzvMLChp0ZXBle5bZEBm
         BODg==
X-Forwarded-Encrypted: i=1; AJvYcCXMfyWDW1lz8/yftI1FIQgn3mb1JoA5mZVFYymJOEqapy5NEC+vdmaBfpI2KwpZJdtsuoAIrqYRC78jq1xjvuGE@lists.infradead.org
X-Gm-Message-State: AOJu0YwiLyXSWjbKCIEiYaks1y6JlBpIuUQPnxZGH9SqFB6FvIbsAeYL
	XcrvI1sJVFTCG8v/Bxht3kxhj2ax70eJqQg0XMqRUy2kTAjap7qyqIm3tCrWcvA=
X-Gm-Gg: ASbGnctgF3b8/rKwIAliqMKeTAsoaenPQg9TIDKYnmMVYFEI+RK9ZqXqh+S0K719kdV
	2ISzd8DHgbUI/cotcyN7/jSroxQFrDyg7fyKWy+JqGqKXyDvADdgfXWuUc9uxxzjTAmbtbErLQS
	va450MGXTbRzg4Jx98F/0lCekizwxHB+DkIBDpW9EVTmGW+w2U9qL1LQPDLwbToCkRdAVNhlIdx
	xXySe6KDkBL1fNrE1Hh5GoQ2PNgSiYYxZ0N7+nlfIm9OYzWytmuu5WZAvcHFOR8b/2icm+BqmKh
	OvjvMjHSLc07OcfFn9NHI9iFitWVmjPKRhF1idvA/tdfj1OOnKrlU84=
X-Google-Smtp-Source: AGHT+IGZl4Iy4uZOUjM9U9IVmRSlfdQAcLT3D1dKp6aQmp4d42Kr2CFruUdsHT4wSp4NM1fW9G7V4Q==
X-Received: by 2002:a05:6402:50c8:b0:5e0:9607:2669 with SMTP id 4fb4d7f45d1cf-5e0b71070a2mr14757051a12.17.1740418319292;
        Mon, 24 Feb 2025 09:31:59 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a7fsm18674357a12.58.2025.02.24.09.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 09:31:58 -0800 (PST)
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
Subject: [PATCH v2 1/4] dt-bindings: thermal: r9a08g045-tsu: Document the TSU unit
Date: Mon, 24 Feb 2025 19:31:41 +0200
Message-ID: <20250224173144.1952801-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224173144.1952801-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250224173144.1952801-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_093201_144950_A0FB222A 
X-CRM114-Status: GOOD (  14.58  )
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



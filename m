Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3918BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 16:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evyYwVG9jAAn2LfhNe4V0lOQ6hGXTx/eRi/lhEE4KRI=; b=JNWEHnuOyZiwVXk7bo6CEwx9p9
	PhuYo2hNd2V9Tcmi97aZ1wDy1C6rron45JzAse/8nXi1+b3+s2NAIilPD/CJ6WR91DVVCfaPP9hhZ
	yW7nxCMHjRa68tvJR9NFqQ3RUj6IP3nUf3WDv9TLAqrosooxvDqIZhSmtw/d2An/9wwR8fyygP7Rw
	C+odJPQU9ToY3qx8VZDinsayzIIzdxkx6ntZ2w2lWqGCoobeMDaiAUOWjUV6ZXKsZRriGCMV35pIE
	Q0usnosVCVrBJ8g8gvkeRcJBzd7C81VltbLfwZi4djpJqVOZtZu35El+fsqxjgLrjK4yPytjYZRuW
	8xdqbulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTklf-0000000DScv-2dTk;
	Fri, 03 Jan 2025 16:43:23 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkh2-0000000DRtH-042V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 16:38:37 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aaeef97ff02so1407336866b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 08:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735922314; x=1736527114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evyYwVG9jAAn2LfhNe4V0lOQ6hGXTx/eRi/lhEE4KRI=;
        b=llyJAj1FBKzjmqvrInAOal6o9xfGsgeXP+/+3ggAfXIN1OGUJvekVzjFAB7pZ0yxlG
         pqyyzjd9YNR0SdRM/nQblSNBTzkeLFUbVljcsry4eiqXnRdWJmohsfrXeBp80UAURcJU
         +TZawBchRctbTNWeI6GdXerGXV951maxIjM7sPMC41xrHDI0RY8AUVEH9Ll6Z6cUy1kk
         uRts9Qjij1XyILQLYPSL6f8i6cSFmQnDFw6fJ91wf9qkckEStUNKB7F5+maU6pO/X+aw
         +RVGSSYUWGEBWvlkrtTvLbtgJINK97jZdeUH9puFNhr0HPtFUmvPPLSAu+BFi+6B0OTp
         m8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735922314; x=1736527114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evyYwVG9jAAn2LfhNe4V0lOQ6hGXTx/eRi/lhEE4KRI=;
        b=CcIBRTKlDCHnqqD5PAiKqGyNi4dwQXkw4fcX5Om2KkeXuXiTCaV6Tup2FcgMUGA7zo
         KHhdMBucxaIt7dS4xxiTSqAZkQJcDtj+sJRgX1hsD2GRVfTw85gEuU5z8tefOK2pKodV
         SiEj2991STIpy4eu4/pKxEgezBlfzJo/VyKzLsanxrqaGWQ3Fori/I9FToolEk2gTEcU
         Y50C6AFMgzzkuRUPosXp+onTT5h+uI4kKeY71wB8I8506RhYyS7ImddybXeTME4aGMbn
         /R5dmm6uE602RGxciFoLyA5MAo84FtRCA16MqAbYlM0APfTl2ocWmjWt4omJLR7uYJ5/
         I3oA==
X-Forwarded-Encrypted: i=1; AJvYcCUpVlHoQuzMMTa90bc3QM/NfGyoHziWRB0QXFczlq0mBm+NA3R0herHlKtUCGyHeEiwDpAZ28ki4ssQbRQQgjyd@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdh/YmYB8WtsghWNtkwR1gMGmq93qPQ+zPPzE+urwcbknlrAE0
	JhrnAF9qaRHrxkHU6q73PRD7EJCOlW8D4Bp0StED6Gz0RfC2zWJFFCNt6Rb9eYU=
X-Gm-Gg: ASbGncvrh11mP97J/UlfE5O6WWhCGQpxNAFV2SIXwPxhCm8hj8KCo9Ir8DTSPRKGN8Y
	hIgtnYq0mHKhJZq8WYrtS+lYxOKAtVY+ji8/kTOYPGzkUDNBl7nJlDl9ZG6yXsXiAzfJSaBoP8Y
	ALTY/qlXFEgIdjdS7SO0xOK3+aIUBaVngoufBou3crU//L+0eGPT9xtWn1LYbEEI46nuOZRS5MX
	FqhZo6Qf0zvOl5QMNtlGfcOxyvEkLEVa3KIHCV/h893E4nscKJrODWfiwqbjbK3Lb/yfl8pVeyc
	u8HJkhQKQYY=
X-Google-Smtp-Source: AGHT+IGZziQN526Qz2cC4SM+sDiCIJGAjK04HVz8g4TFUK5HQL4oXUkqdbEpUHeE3KBwEfQsCEVxQA==
X-Received: by 2002:a17:907:1c85:b0:aa6:29dc:11b with SMTP id a640c23a62f3a-aac3342c7f4mr4934010766b.16.1735922313975;
        Fri, 03 Jan 2025 08:38:33 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm1932984066b.65.2025.01.03.08.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 08:38:33 -0800 (PST)
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
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 3/6] dt-bindings: thermal: r9a08g045-tsu: Document the TSU unit
Date: Fri,  3 Jan 2025 18:38:02 +0200
Message-ID: <20250103163805.1775705-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_083836_062258_58028131 
X-CRM114-Status: GOOD (  14.14  )
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
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



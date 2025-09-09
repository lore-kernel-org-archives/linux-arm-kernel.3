Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59B9CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hrS+gNEMWDxV0mKXtkhOcJ6h8ajN29VXW/74N9mIiM=; b=FAk/vW3WZZYl7ALYvfrjbnNRKo
	cfERCNWh1+m9xg+nY72iOpFocz6mlZa+f7dkIZSCMck+Afnh3RS31ZfWXwLupxiYh+V3OMdYxNRWs
	T/Ya1VZbRoI71fsm1HrCZ+Kv6KIy9JYzTXwme/aHlHOG3PAIYLEiwDeZSWUiCqTcYajrO26qAnmB7
	fOXm6VDu6W7hfh6YP5j0bRSzjHodepziwU4whb5WUO2iqaAOwedAE3Vtzf6bnJIyMTVkpxG35zQnf
	cySExnk/vUE5bak8awzNQHR6zvP90W2Ogvn1xjPZL728/tR4YX531Xl9F067uUM/t+yqB5kJ2+zqj
	zRZwIwmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0UF-00000008Cbl-1pDy;
	Tue, 09 Sep 2025 15:42:28 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvL6-00000006Hl3-2Et2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45deccb2c1eso6109545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412759; x=1758017559; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hrS+gNEMWDxV0mKXtkhOcJ6h8ajN29VXW/74N9mIiM=;
        b=mygdWvEB2rBzlih5sCxmcpZ9OapZk5FpBPvEhrpaiUEFl3oClQuQ+pbNNcK8/r/RtD
         PfbiuBI48/BgWmFW/OOnWVbuiahFH5bO1dYUvogT9AT4TmWKERNCmHhrWuktFRVgmaAZ
         GzGszGrFHWg6We+s6kiRkpuns7ixmA3zaEaQEmstojc07G3DvdhtQjAwtYFGivr/wIpJ
         RA6XAy6LNMevd7+L4qpcwWoblKWa9N4sil0UZFwW4McA0hYt4E1uT1lppOvfYK2+rcQ2
         Qg+CRY/MnS5R5/esR/ytMr6GCJH16V9QJrb8pMYe3HRvR7SqTdf9kFQwOQs5euZqHz4S
         qj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412759; x=1758017559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hrS+gNEMWDxV0mKXtkhOcJ6h8ajN29VXW/74N9mIiM=;
        b=Nj2ayuR4BeQ//KRFKMvINfoT5IBirntCa+yr8JmJ2uzpapBTwqyweV/9pXQIpUyE3g
         r6efN2EaUS2CGZQJfrF+MdnleHWKSGU4Vgo1GNnJTNabxXoYtBtLd9LHCNf2OkJlDrZ7
         N7j/kodVVZY4dvEh3uhKrcS2kJuvJ+jo6lCYPF0oWSBQ7GnrtjK8mGnLO2XFDrhbAQhs
         kwBmbaU7F9iKTQwDUDcdCYcgv82yioEXYhmG7aWnNwfLgDUTgUDvLdy34RdIk77j+Cnp
         zhYAzwimkalAg19oxOWY0T6nz85PhNi/Zd8vzW1lYY+35DKpK0j0ztpLTn+gCrK3zfqD
         EIpA==
X-Forwarded-Encrypted: i=1; AJvYcCUwJuT/hSOYjVbugLffFHFafBYN7U1ZFr6GYk8P6O7t6bzX5pRqUkvpbmHszvNjp3sC7uzxVWZwisSk4WStsoOR@lists.infradead.org
X-Gm-Message-State: AOJu0YwuL9UFS5ekGA4HvwMWAU2Sap6ajsawNwlchH9XopSNbi53WVtV
	W99TNGg0WMNlSCvXsZcrID6EZyvnZi0okuUFOLqKOvjzGMN8lJJtG8Wu
X-Gm-Gg: ASbGncupP4/nXl8sTH3yy3RNekE35Nwp1XnvJFPceVYwtH/7LSXylA4LyTCuOOJkOit
	5QjlvTYSWfZ2TvA5sMcCG/zjDfyGhHZdP155vlPjpGZL2qgUZqXcAAfRBxM3hZS/kn2a8fsXQFR
	XiCfd6iOd9bCCdO0JsAHSTcWXgX219Wl+1FAxz18kXoFOgXMkeRAwsv2DAjh14HUcXzTMYCIeI7
	wwuqnSvG3u3j3j/LMmBTtQoOYQQHy9a6rgMeTklRhGioQocAEDAh4z3fxEp8kceRF4CF2qeRXbW
	4RLg2X6nd2Aj7f/fWOA/reZE1TVyEvo6yR49KQ43+6+TGLi4kr3FJ64+MFc4N9wVxY1/yeRseMJ
	GIL7S51iNExSpwFgatBWrJz9wvIT6QcsicIfw6+IwgnZEAdSO3EDFNA18xpIyYJ3VDxb+CsE6pM
	PtblJEEJlaQwLrLZD5vY02atQVaQ==
X-Google-Smtp-Source: AGHT+IF6kdfD0zGsjMmnAtNgzzWv37+IjLvZ504xPGjikiuj3U4fWnzlKF5W2UHoTYqJemkuMoORFg==
X-Received: by 2002:a05:600c:4ecd:b0:45d:d5fb:1858 with SMTP id 5b1f17b1804b1-45dddee8e80mr91947355e9.21.1757412758646;
        Tue, 09 Sep 2025 03:12:38 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75223ea47sm1973272f8f.46.2025.09.09.03.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:37 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:19 +0200
Subject: [PATCH v6 12/20] dt-bindings: perf: stm32: introduce DDRPERFM
 dt-bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-b4-ddrperfm-upstream-v6-12-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_031240_698119_CDE95279 
X-CRM114-Status: GOOD (  13.08  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

DDRPERFM is the DDR Performance Monitor embedded in STM32MPU SoC.
It allows to monitor DDR events that come from the DDR Controller
such as read or write events.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 .../devicetree/bindings/perf/st,stm32-ddr-pmu.yaml | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml b/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml
new file mode 100644
index 000000000000..1d97861e3d44
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+maintainers:
+  - Clément Le Goffic <legoffic.clement@gmail.com>
+
+title: STMicroelectronics STM32 DDR Performance Monitor (DDRPERFM)
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: st,stm32mp131-ddr-pmu
+      - items:
+          - enum:
+              - st,stm32mp151-ddr-pmu
+          - const: st,stm32mp131-ddr-pmu
+      - items:
+          - const: st,stm32mp251-ddr-pmu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
+  memory-channel:
+    description:
+      The memory channel this DDRPERFM is attached to.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mp131-ddr-pmu
+    then:
+      required:
+        - clocks
+        - resets
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mp251-ddr-pmu
+    then:
+      required:
+        - access-controllers
+        - memory-channel
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+
+    perf@5a007000 {
+        compatible = "st,stm32mp151-ddr-pmu", "st,stm32mp131-ddr-pmu";
+        reg = <0x5a007000 0x400>;
+        clocks = <&rcc DDRPERFM>;
+        resets = <&rcc DDRPERFM_R>;
+    };
+
+  - |
+    ddr_channel: sdram-channel-0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "jedec,ddr4-channel";
+        io-width = <16>;
+    };
+
+    perf@48041000 {
+      compatible = "st,stm32mp251-ddr-pmu";
+      reg = <0x48041000 0x400>;
+      access-controllers = <&rcc 104>;
+      memory-channel = <&ddr_channel>;
+    };

-- 
2.43.0



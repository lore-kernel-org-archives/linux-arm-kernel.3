Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A30C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYle3ok/ZHpbCa/gvJJfuJ/kdU7yLL+dRoi+qfcwl8E=; b=1j4V675hGOx1avzI31dq6gCC4U
	TpfI3Jo7TTSWlR6CErvSGg7Z6F+Pv1g8wwUSZ/h804RP2T2IuiKwjizRistn0UvmKvqY2jCIhpGHG
	+lh3y2D1qtnAg8TtpLwdArqaPnbeDyR1CmtkRKkzaSR5vU2je/E7x9yECno1/uhGdcURCcHkXh9No
	wSX+rVgIW1N0hS1nPHmy0PsiTLIKX+3iYR1izVUF5l8/OS8l9Foq5XOVBxW7h5XSe4BDDzCe2e0+4
	vjchsviaFtWiNiEf61i2H5AhW0ALtXuOqgliNvs2fw5CdW2M4zhXDVHcauXw8fXHZ+jvM6ivetgL7
	FadqOKMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9DB-00000001BD5-1mgR;
	Tue, 04 Aug 2026 07:05:17 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9D8-00000001BBS-1923
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:05:15 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso4024819a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 00:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785827113; x=1786431913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYle3ok/ZHpbCa/gvJJfuJ/kdU7yLL+dRoi+qfcwl8E=;
        b=M4ZKTuDj5cq+nU9MK4o5cwIcqTTg2dtkmYL5jS4bjwZsONA/prHI+fWywaw9CHDRox
         PPAxNnZyzyIemPBqhmudEzIIMt2ztYTDf6JMN/P/OiXNEaEnYuj8CCr1wr1fcOW2ga+v
         E27zkCjUf7JsyDmlEoKnq36pBcjQ+1H4/3eZSezwj+As+vFgkVNGkAHgtZHW8PL6JT3E
         uVJoSTsnjfQj6dcC9llMcvyzCeVumuWWiD0HdmsXzFNjkwHERwlx/a3KTUlqfZ+V6Xt5
         ttXk/L3/L6Tf61c5wf1TpDsWJQ9aK1SRgWijU/dYGVGQ8HJT6UDAz6MkOdJeC3u4VlTz
         p6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827113; x=1786431913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYle3ok/ZHpbCa/gvJJfuJ/kdU7yLL+dRoi+qfcwl8E=;
        b=kE5M+o9B6CZFPqalYvZGAsL0SltzdiQjTU3Hpgi/JPaw1SCJp/SEE+haFeQbD4nU/o
         SSwGlTn63t5eYUK3AHS2Ee6rblJobrXZkt0uUFAIfWX9z04/jfp6XGI+uRfr06xHZJ5A
         PgkScr8xe1Q1699ItYXTBNkqEPRyihaDyGJx/IYPF8tHC93x7eN0JpFUdMAzisWUlkZ5
         Fyg8GujxZw5HLf76tQ1n9v+KbDRdf6/ysDBZ86w1tmlIiatVwtZd4ex9n/xVieTWR3bp
         gBq+aBqjKQSutsTMxziu9htFWIR5/x6onuEgjMGqAMNwVpx2PHEI5q2/dUW3IsIsZNHN
         bWjA==
X-Forwarded-Encrypted: i=1; AHgh+RobHPLDxK8LmD3V32bh3zJOKfY19nZ9S3riuArQ3MbCpu+z6QOfWGmFnO5we165q8CB1xXDzt9rgRJQQd7SNACE@lists.infradead.org
X-Gm-Message-State: AOJu0YzhbeWEpLiilWhsTzQNnLaflPorISo9X3GxcprVdoPfTlLV5uUW
	Ju1vb5ZoY51kzwimij9sAGTZU5OAoO/bjjhuptwMjETh+qBHDBNoAvmX
X-Gm-Gg: AR+sD117fe1JbuPeQShkmlFG6LAsnVWGFCDdaGggWx+355MLOiDIEjUk7fyeeULeafv
	JXIM4cn4ItVElKkiB3nbsNxtbVAxLKo3h2f+rR8Mqj/i/V6zc4qwY8VI6m295O9sAxfHYIdmWm3
	nAPzcLvLSuWB+oO54Yc9bBipEp1qsTv0B5nbnDcQsOQ/7j4qhCkbaVnDIxXjVn2UDnyDbNVjBu5
	dHooetho0G/8Nd4AQbkAHMw7KnDyipqeEwm2Opm42jVe+1dXzA9y56gtFpTW4osOyfb1ankRD6n
	6mu613ZWrYnNf33JoCNdYd99G3ByBsosJjw8hqltH/i9u+S/AuVVF3PKNbkrIB+CxN1heYrdRkO
	FN3LnXNGEUQd5J0bC6RXeweZbrjeI9mdMlQBYJo+1AKuO5wtCbkLeo5hFzAMygG4+nuZ1ZSHQng
	GwexQBD+jQITEGK8wxE9fJhdfY+vfYcc/LQpqDXFJxH804Z4ze3tsV94HsIpnShuH6i7+N+EvT9
	Pfoe1bU+JtBDf/V+dAzHlH+k2SdvKsHeqnMzZNuoAT0c54=
X-Received: by 2002:a17:90b:5403:b0:381:792d:f993 with SMTP id 98e67ed59e1d1-38fbc4835fcmr12263384a91.17.1785827113305;
        Tue, 04 Aug 2026 00:05:13 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febfd8ff8sm859815a91.4.2026.08.04.00.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:05:12 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: watchdog: Add MA35D1 Watchdog
Date: Tue,  4 Aug 2026 15:03:49 +0800
Message-Id: <20260804070351.1846165-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804070351.1846165-1-zychennvt@gmail.com>
References: <20260804070351.1846165-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_000514_315059_9864A6AF 
X-CRM114-Status: GOOD (  13.69  )
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

Add device tree binding documentation for the watchdog timer (WDT)
controller found on Nuvoton MA35D1 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../bindings/watchdog/nuvoton,ma35d1-wdt.yaml | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml
new file mode 100644
index 000000000000..aced7d77a7d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/nuvoton,ma35d1-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Watchdog Timer
+
+maintainers:
+  - Zi-Yu Chen <zychennvt@gmail.com>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-wdt
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
+  wakeup-source: true
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        wdt1: watchdog@40440000 {
+          compatible = "nuvoton,ma35d1-wdt";
+          reg = <0x0 0x40440000 0x0 0x100>;
+          interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+          clocks = <&clk WDT1_GATE>;
+        };
+    };
+...
-- 
2.34.1



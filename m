Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC35AD5CC96
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4QBNlB+d2PHxk6dWy4yzXj/lD/DoVJIDKguatDDGb4=; b=vAXm4GP6Qve5+SjJAQ5YTr9LFL
	6+gY+3hzrLTemE/tq5t/NtAporkb563fAOWCnL2dcre7Fg/9oxhiFWk+PKc46L3AL2KeeKyJfDN+n
	C/0n5AvkAmlwlNNfh1gGzpAA0BPemiZzYxjnKXQreolk4GoQYpGKMycRo0LCz8xhCflgruSQekXXa
	ADJefqQyfmsHqaX9fyzuHBXaOKnh2F7MUee5dfvA2ySnwjAIMIDpAmL4CGFnBSeZd6sFyg94SbsSl
	L2W7YajEVaIs6/yITWdC1dVoHE/xNs331glnuEDo/S/bFcUdjwFgl+z51ET4KwK/QCoBWdsHPR4la
	+G8A6nsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66n2-000000007PO-3NjZ;
	Wed, 30 Oct 2024 11:23:04 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66SP-000000003gV-35XB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:01:47 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-431481433bdso62047935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 04:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730286104; x=1730890904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4QBNlB+d2PHxk6dWy4yzXj/lD/DoVJIDKguatDDGb4=;
        b=JsCBn2rrhK8QV/48at/9AnnuxCjskVdzqvO08e09CoNV4oLKAOL/V3PCsxZnD1PIUi
         su+ZrbWGPNtKX/HGgY177nR5cWJmtEC+dYpbJkZZ/XcugNpVhr8zebILjfv+L/8XoWTp
         Ipi60sKvYaqGQ51TI+s7dEBy4MlKAN+NKTmHwf4CwxzSnI/W+AdKBF3WVKnM1k5whX9E
         T7SBVQ2xKty6FxzdUSW3nCm2NZQ7nPenRpxUN1MjYdS7wgfgLFXLNVjSZakqb4fyMQA0
         8j+xya1GbxbhWR2sHRr8mbuYKggK2qAvyS4Bld5oN9gyjrVjgj1WJ9FOs5mLnDxk1bE9
         lKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286104; x=1730890904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4QBNlB+d2PHxk6dWy4yzXj/lD/DoVJIDKguatDDGb4=;
        b=Uz3QJyRlEXN42ynEQ83aXvRJq+wYs+aVH2M+13rk/1gHNDmBjnBtuOs6IluMY7/wwD
         RFAPbUBYCbSyfT5LAcrgj3fAqLiemVGjHOPVw00kD8O4SYoqlr313hZX193118/LsxPJ
         B3rRWl/EW1O+s8XdJQBZS1K/SlzezApBh6d8Xt1DO7VfvJfCb6URxBVdq2oDeUq5+rQi
         gTj3N2D4FkreZaXBOLN63rLcdPv+XTrjhYViJ8dzu+vfLTLtrKcUeR+1fsGMZdUSRoMk
         cTZ75FbkufJJXgjjwaCmxyR4uIRlxyCbXqj4RZqq3WBlF/G9TvW1L1cEREoIUd5EoKO/
         RNjA==
X-Forwarded-Encrypted: i=1; AJvYcCVDAQHTKkM2Pfpj7ADW4LchvkG4U9RRZTM7ylkINuliU6Sgyvbdmb4HBEQmkZPKs4a1MZYrw9peYTqq6z/IGo2i@lists.infradead.org
X-Gm-Message-State: AOJu0YzwWMqqoFf0WqAhpCX7z357Yvihr206U/UWKkPmpb9N3Crfknfs
	br7749n4Qf9TlsDrrMgux2qYb4R69ItG/Wuhcjq9y7BrBpq0woBNQODFAf12VNY=
X-Google-Smtp-Source: AGHT+IH0M773hGU4oya6J/fuA+HUQZaFJdAlea6vN77xZ1FRNiRTnlZxHceEr+4/h6lEyss2Uuvwjw==
X-Received: by 2002:a05:600c:1ca6:b0:431:52da:9d67 with SMTP id 5b1f17b1804b1-4319ac7435bmr135949865e9.3.1730286103671;
        Wed, 30 Oct 2024 04:01:43 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99edebsm17956935e9.45.2024.10.30.04.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:01:43 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 04/10] dt-bindings: rtc: renesas,rzg3s-rtc: Document the Renesas RTCA-3 IP
Date: Wed, 30 Oct 2024 13:01:14 +0200
Message-Id: <20241030110120.332802-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_040145_808107_C23DEC04 
X-CRM114-Status: GOOD (  19.18  )
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

Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.
The RTC IP available on Renesas RZ/V2H is almost identical with the
one found on Renesas RZ/G3S (it misses the time capture functionality
which is not yet implemented on proposed driver). For this, added also a
generic compatible that will be used at the moment as fallback for both
RZ/G3S and RZ/V2H.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- added back the #include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
  in example section to fix the build error
- kept the Rb tag from Rob; Rob, please let me know if you consider it
  otherwise

Changes in v4:
- collected tags
- dropped the assigned-clocks, assigned-clock-parents properties from the
  example, along with r9a08g045-vbattb.h inclusion; these were moved
  to the VBATTB example as it fits better in there since these are
  related to the VBATTB but not to the RTC;

  Rob, I haven't dropped your Rb tag for this; please let me know if you
  consider it otherwise.

Changes in v3:
- added RTC bus clock, reset and power-domain; it has been detected
  by reverse engineering that RTC and VBATTB clock, reset and power
  domain are shared; HW manual doesn't mention it
- updated example with these and with assigned-clock properties
  needed to configure the VBATTCLK MUX with proper parent
- updated example section with dt-bindings/clock/r9a08g045-cpg.h
  and dt-bindings/clock/r9a08g045-vbattb.h includes
- for all these, dropped Conor's Rb tag

Changes in v2:
- updated patch description and title
- included reference to rtc.yaml
- updated compatible list with a generic compatible as explained in
  patch description; with this the node in examples section has also been
  updated
- used items to describe interrupts, interrupt-names, clock, clock-names
- updated title section

 .../bindings/rtc/renesas,rz-rtca3.yaml        | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
new file mode 100644
index 000000000000..e70eeb66aa64
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/renesas,rz-rtca3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RTCA-3 Real Time Clock
+
+maintainers:
+  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a08g045-rtca3 # RZ/G3S
+      - const: renesas,rz-rtca3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Alarm interrupt
+      - description: Periodic interrupt
+      - description: Carry interrupt
+
+  interrupt-names:
+    items:
+      - const: alarm
+      - const: period
+      - const: carry
+
+  clocks:
+    items:
+      - description: RTC bus clock
+      - description: RTC counter clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: counter
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: VBATTB module reset
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a08g045-cpg.h>
+    #include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc@1004ec00 {
+        compatible = "renesas,r9a08g045-rtca3", "renesas,rz-rtca3";
+        reg = <0x1004ec00 0x400>;
+        interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "alarm", "period", "carry";
+        clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattclk VBATTB_VBATTCLK>;
+        clock-names = "bus", "counter";
+        power-domains = <&cpg>;
+        resets = <&cpg R9A08G045_VBAT_BRESETN>;
+    };
-- 
2.39.2



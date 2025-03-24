Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B891C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 10:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3RzGV1RpQts5giBdaR6NJZIGRMhOnCTfW5GoZwlJYO8=; b=z+IVSHKA8TOmkNnxiV2EcABnnG
	otCvae9s/OIwXF8fUGijdwzwlP9XlG9Yuf/OMOntTL065C30kXamkIitryNy4iUkGnp4eYEYa5V5I
	sqr4ysgqFAZXAWFpi+lDQ6LdBs2CJ9aE8XgBBej3iNKpes9amKkPkVikbFsq1DTRsY11LCfBDo1eK
	dSZgnThThSKrQ8VIS/ivKPO+ondW3HMV2sW27TtPWtX20D1P9G1DZep02DqASrsupjLES5LDSvFwM
	YIHCJAXGH1TXPToAa7tlstyVfU+F9eZWlTuGNPs/017JQS9XIJXpp53JhblazDZgdr9Sv10PaffV7
	v8QoKw/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twedL-00000002mEs-0pn5;
	Mon, 24 Mar 2025 10:02:15 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tweba-00000002ls7-1tNR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 10:00:27 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso3142234f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 03:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742810425; x=1743415225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3RzGV1RpQts5giBdaR6NJZIGRMhOnCTfW5GoZwlJYO8=;
        b=m8TnDgGBpgmdPf4K4GvgWXZuXcDCfDhxkdyplCeY5SRGIvAXeHGr65OEwl3oEpJel6
         EC832j8kYS0w53IVL3IKGw6hdTjTyxBj76j+CxI0HmvkrIi0I8SYibfIysVmR4nbmEsr
         EQfa/RtUzvzGji+pbNI6kkmNdC2azOutH7TLkrrXs3rHzXEjjXcVe+FEty8vpH2BvLJ4
         5BwxZVWuJgDsVN8C3hJ477I6j+FzVj52LVTZBy2Y3T+gS27pYJsday/dksj78sQVKcQr
         eFUFF0LX8SexdajGITn6Cu13RZhCapLHISSoJWCW2xwdplXDJlXDP6w+5w1/E0OF8lyx
         wqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742810425; x=1743415225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3RzGV1RpQts5giBdaR6NJZIGRMhOnCTfW5GoZwlJYO8=;
        b=oKq64QWGZXqno/M7adxYXBt7J3DPqXwo2/0oZbsztTwZne10BMSwaHq9JaRctWp6QT
         nPNKCYY4NfLLqgbB+izT0rp9WvrChn6eB9L+mpm6e6q9bYMNvzSc67CKHjLu3VVh+olD
         728WuNwLDWUnikFiNiWRDiY6m1IyIm62Bx5wT2fGenCZadj4TZFMEFsa/Tp5xv7/EXLU
         hcHCNLkKwV1BYjCb+J1tAPG/3h4JV0NkaXaciRDKjv/FHe+4dFkDeKxtEtBBKUPbvOcx
         oITobYhz6rLhefDJ3FYIRD7bs6/5XwjE/u4GMTxe7JC5TDho9pIYNlagS8R4by5BdYRX
         /p+w==
X-Forwarded-Encrypted: i=1; AJvYcCXPWUOpJbtOkqBYXm5lwrUODShYLrNBtORPN68s6rvgFXBc8y3rjXvS08HdAaOKYvqJVdGcDAfrlWKmTSjGX/UD@lists.infradead.org
X-Gm-Message-State: AOJu0YzPZi3RiUqLRhjo2ZCrfv0f6+HMX37Mt/aVGAY455rvn4RGFmZB
	mARQm1eauQ2v5P4ucdqaVrsiNDUZe09urbrY/KVp+y4+C+scTNIYR5rmw7FsaUc=
X-Gm-Gg: ASbGncvJZesuI1v5+P1Il0gf2U0f8+/nPiwhWHd0S4g0uXtGiAe35zsGEoDojawSF9o
	1LgPY1AdKO7FcXex4eWu0cdPT8mKjJYNLriiL/5xfrX6lmgd5a7nLDJBSU7eNlXw0o016C8r9/q
	iPlva0UX4E1jN8jEVmSOfItlt0rzXeX8zZ56a6OqCvqaNKlZn5+37T255U9DxpQSa1XQ4oLejXR
	2m84RIMyINrqdoayNf092vL6Vtc53Z82aQx82cd1AONW1HbzhSAps6k7Sk9B1VIiai9KfH1djGp
	5yoRh7oa+f3R24eZdCQnYoHbh0F6cw1u+IyJ2NsmGGSq3mcWulVoZoYEpdY+/Ag9RRKLOwY=
X-Google-Smtp-Source: AGHT+IGVC5Cc2BTYBbFdNtgjSgvA47GAhTFPvWufLC91XobhDpo2M7uGRnbnSjRmU2ARwM+unXFsow==
X-Received: by 2002:a5d:47af:0:b0:391:21e2:ec3b with SMTP id ffacd0b85a97d-3997f8f743dmr9193072f8f.3.1742810424883;
        Mon, 24 Mar 2025 03:00:24 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995611sm10625933f8f.15.2025.03.24.03.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:00:24 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Thomas Fossati <thomas.fossati@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
Subject: [PATCH 1/2] dt-bindings: NXP System Timer Module
Date: Mon, 24 Mar 2025 11:00:05 +0100
Message-ID: <20250324100008.346009-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_030026_495912_E481E8B6 
X-CRM114-Status: GOOD (  13.29  )
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

Add the System Timer Module description found on the NXP s32 platform
and the compatible for the s32g2 variant.

Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../bindings/timer/nxp,stm-timer.yaml         | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
new file mode 100644
index 000000000000..41093892c617
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/nxp,stm-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP System Timer Module (STM)
+
+maintainers:
+  - Daniel Lezcano <daniel.lezcano@kernel.org>
+
+description: |
+  The System Timer Module supports commonly required system and
+  application software timing functions. STM includes a 32-bit
+  count-up timer and four 32-bit compare channels with a separate
+  interrupt source for each channel. The timer is driven by the STM
+  module clock divided by an 8-bit prescale value.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nxp,s32g2-stm
+      - items:
+          - const: nxp,s32g2-stm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: System Timer Module clock
+
+  clock-names:
+    items:
+      - const: stm
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    stm@4011c000 {
+        compatible = "nxp,s32g2-stm";
+        reg = <0x4011c000 0x3000>;
+        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 0x3b>;
+        clock-names = "stm";
+    };
-- 
2.43.0



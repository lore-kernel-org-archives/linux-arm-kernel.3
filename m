Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7C9FC0345
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQd9HkoufNSOLhuozcm6yh3/OjVqgZubRjD9rpq9iNY=; b=0qdNOZYA4Bbz6PczXVE6Xnk2+I
	ouGlIcTUMPG0ckUFVQcQPh/KmNwSHaYRshL9Nw9TS1T8jc2RO0mcUZxMv08C/1sgz2u38v6+zqQri
	+phk2+DLB1MEsWQeCPmLGDIuHNTE0435lHSyyWqwg6+mNL5j5dI/0zx0/vI74a+/4XyUo+zNwQqfS
	Fdf1nx5HSB/zWyTCQB/OtxZLwWxRRM0UIcuBIhN7bbbXhUvmuEufHmw8Qsv2m/YYYJWDsn8j8E6O2
	wbDseBuMWBbnBEfQz3eBZuJZHCN1e0uUZ0F7ZPJ9vwz26xWw5PQ7SPvFDy2eQOBuSbyb8Sux6ZDxV
	62Z9ZIGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvtT-0000000BsXv-1ech;
	Thu, 23 Apr 2026 15:23:07 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvtN-0000000BsTo-3dCG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 15:23:03 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-483487335c2so66965275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776957780; x=1777562580; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eQd9HkoufNSOLhuozcm6yh3/OjVqgZubRjD9rpq9iNY=;
        b=KzT6TW5ZWj8d4/yLWStRMGcD3exd69AAtnP3UKmNnl9rv46mc+t21m7AkEtLXpnH8U
         nEDc7FhOUCimvQmjTN12YyhTNSMizbXEzD+wZJNuQklDqNFpdxqE806Y3Voo68OUd0D4
         w/SKQsEudn1VhfEBcVjqSrDn59GCSPam9+By5H3swpxQqVjUV9bcLlp2ctnKkb/6E5hJ
         qvkWsz42bYO07LyVz1Ez+IHW3Ie4M3TeyHRDs4MQsjtbC88qR6C02z32g1nhYlynrZU7
         dvbtsro087jVUwgxdknJWw5Yx15/U418kEOQmZCGf65SpwDj09JkGLo2Stuqu/+C9m4y
         /n7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957780; x=1777562580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eQd9HkoufNSOLhuozcm6yh3/OjVqgZubRjD9rpq9iNY=;
        b=lsvfQZYNk/J06K2K27jBoLyAUQ5w5potGcbIM9hTGeHW4N0PyX8zm3xitjX2uY6PmH
         vm0HEM11UfoKCbWzRVV8yA5ZrOd2hL93byAvmy3bUmMGCHHT/1GcRj8VyA2EKPR4++Si
         WpddJoSXrw1wApw35+zE+RbDL9+slZzPGyU4fl89vySLuWo7FMoDothm5YI+H2z+e/Ee
         KJOMns1p2t89C7Ey0r2edRgSCOfsjcS6B9QngjCzrwU7cmhB8NJOwI60t1VjkbRXliAi
         AeEvq8ASkFDLw6n+2Xl5IvAgo+s5tfrx1KWMZR00WESn6Dsh2DheA1VmL7z0eW5SNG7D
         MwtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wzlMMIqu8I9g13tzgF5dvn8/Objksu8FUv/t78zboqxGP1kyTWcLDzN0Tfw07v9PEFxq56OtiN4fcRsTAse2S@lists.infradead.org
X-Gm-Message-State: AOJu0YwCIF0lc+q0DAvK6InQnnzQYZ2nbMPCr1I/S9qVwkL7XFpZs04f
	D1f2QaH3GwcfG6FlePo1Le26JFtSqCQMgirLiljJRFO63CckMiD8O7CinxuGQY0WMH8=
X-Gm-Gg: AeBDiesROyGCtaKhS7UgXZDIgLD3XbBaEUeRW9l5AJpzqsSXMnODXjW5NaJ9ZeHxXlH
	GVc7gy6xC8OCHOcM6nD6fHaVoPgCplFVdq5G3t4aoHfRC9nfbhXpT0qXetKLBPjBSpdPdlrLDUi
	G+AdPaUUVsrRgenQVyxsCWZNyBQkykQFAZoN/vawtZRWgqrAOIM1Qze367qXo8m/OkslhNtYHIq
	1tkDk+rw5ecwEoM28Fa+EeimUQn4gqgrQtwFssgX3dzcws+qyx+KmR/KV9OAlB9zUzgAW07zkk7
	cuUw0O7yUd3sdzN+Z+88/HxHvZDi6j2y7KBzg2x4owMNK+Srw7JVewuU370FHgSKRqVYGNnmECz
	w125Y73la/c68X3WKz4wWrR4/xqnss3af+6w9bdowwRhPoZOukVd50fbS8yy4IZOSKmMb2BcbmA
	Vk8dyXOe4ukD49DPQmKSgdV1a0uQgormQGHfaxJKlVnR+xOwVGa4TwkoVnbxT8dQWS2rx4BWVOW
	GuTfXyHsropgRGGBA==
X-Received: by 2002:a05:600c:4f8c:b0:48a:58ae:993b with SMTP id 5b1f17b1804b1-48a58ae9faemr164398395e9.16.1776957779732;
        Thu, 23 Apr 2026 08:22:59 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm90550755e9.23.2026.04.23.08.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:22:59 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 15:22:49 +0000
Subject: [PATCH v4 01/11] dt-bindings: thermal: Add Google GS101 TMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-tmu-v4-1-8b59f8548634@linaro.org>
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776957778; l=3371;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=DUqmD7ypzAi56hF5Rjwm27fjn6fmPFxHtwOu1/9raE8=;
 b=UhqzoM8PdUosgQawfVF9WiuGetFtR1EtE1aMLLS4ZQ4GarNM/s0p3imCIaP1Jdt1/LJEbxtQW
 MfMJ8SzgeYkAtmV3J0vYms9+qiOl5uPDZyy2+Zqhf2Qyfd8zS2aTut+
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_082301_944675_A3EEB3F1 
X-CRM114-Status: GOOD (  14.57  )
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

Document the Thermal Management Unit (TMU) found on the Google GS101 SoC.

The GS101 TMU utilizes a hybrid control model shared between the
Application Processor (AP) and the ACPM (Alive Clock and Power Manager)
firmware. This hybrid ACPM TMU architecture is also present on other
Samsung Exynos SoCs (e.g., AutoV920, Exynos850).

While the TMU is a standard memory-mapped IP block, on this platform
the AP's direct register access is restricted to the interrupt pending
(INTPEND) registers for event identification. High-level functional
tasks, such as sensor initialization, threshold programming, and
temperature reads, are delegated to the ACPM firmware.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/thermal/google,gs101-tmu-top.yaml     | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
new file mode 100644
index 000000000000..d0eb2393d581
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/google,gs101-tmu-top.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos ACPM Thermal Management Unit (TMU)
+
+maintainers:
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
+
+description:
+  The Samsung Exynos ACPM TMU is a thermal sensor block found on Exynos
+  based platforms (such as Google GS101 and Exynos850). It supports
+  both direct register-level access and firmware-mediated management
+  via the ACPM (Alive Clock and Power Manager) firmware.
+
+  On these platforms, the hardware is managed in a hybrid fashion. The
+  Application Processor (AP) maintains direct memory-mapped access
+  exclusively to the interrupt pending registers to identify thermal
+  events. All other functional aspects - including sensor
+  initialization, threshold configuration, and temperature acquisition
+  - are handled by the ACPM firmware. The AP coordinates these
+  operations through the ACPM IPC protocol.
+
+properties:
+  compatible:
+    const: google,gs101-tmu-top
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB peripheral clock (PCLK) for TMU register access.
+
+  interrupts:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+  samsung,acpm-ipc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the ACPM IPC node.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - "#thermal-sensor-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/google,gs101.h>
+
+    thermal-sensor@100a0000 {
+        compatible = "google,gs101-tmu-top";
+        reg = <0x100a0000 0x800>;
+        clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
+        interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
+        #thermal-sensor-cells = <1>;
+        samsung,acpm-ipc = <&acpm_ipc>;
+    };

-- 
2.54.0.545.g6539524ca2-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B7BCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UJRcwfUx7m4tQO0H7dzGL7l03jX+wNFvSSTwQ2iw18=; b=EdgwFCsLyMVlT9PjRXzQuCfxII
	tczmK96U3BPT1xRJ6yQFFcTxaVUKgSAVtYcE3WgikhL48PGHosB0IeLma9e7lUpW1SQnpWxFunVdp
	g+BA62VyB8HKlyVOS9cGCmgMD99C1jd8nekMjoD+jAc3IUzhLFmMlhfhNDVR3yN7jI5AkvrV0vdc5
	ymVWtwRWjQEtV9/nRyXqqpzL934D569qsA27UXnNVdRYYc/6TdiRcBjovD7rg1wm5AE5Xh/m5oWRw
	+8L94TtUH5dx+gBLMXKL7afv0KiRlQrkEuny5TYLQ/gPnKkBr9hwRtsqhsr8c97r4CQg9EZ6nvpSl
	NflnmQtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSU4-0000000DW6r-11Ai;
	Tue, 02 Jun 2026 17:00:56 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSU2-0000000DW5O-0J2q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:00:55 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so6779257f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 10:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780419652; x=1781024452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UJRcwfUx7m4tQO0H7dzGL7l03jX+wNFvSSTwQ2iw18=;
        b=hD4teb27GbKzAqA6J8Oh9aVDVeHjopi0Czm39rRSoBN+tPG2x+OjOuVDwPC9xlN/Lk
         W25WV3JX4ScsR2oJysbl9d6ce3sPrJr6Oh0KwFzDc4GaN8uTGRBGdf5eVA4smeQiK+Yv
         loej9cna+uRyJ+FMvspTVmofEZhfkYL+SO6vYOXYFHIqyNA1ro6Y1sCd6tNyQKcYSw5U
         m6QmpTqN85h0zkvZWYK3bTb4CLv8euKaByv8hhLvJVR1njMnZciKr9nZJSoyY7YCIJ0F
         9ZL5ZbvuGl5YtZgObriIG5D6WMmpNEVwQX6TccKL6KlW3ck0/uvZYQF1rGxSaPGPtBAl
         8Z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780419652; x=1781024452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0UJRcwfUx7m4tQO0H7dzGL7l03jX+wNFvSSTwQ2iw18=;
        b=ihPoLyE2FnOJYgM1d3C+L/MiBK34WejiuoPrkVzKDYK5IhDkOZ9u746Tz4GfTsaBum
         fRQyz8F1t2iHvvT0AU7JJN8hx2NvOJOrwN8u+hUQCoszKj3RMOxOkYO2miwhDjO8je5a
         n+F0Zi/NldxiQwRAd5FGj5aTwiYn4cl8tLWdahAmb4yrgVZpLkovEoFCe9zRyeC9FT9a
         kg4p4IyicO4YEA4mOad+HdIwGfSpG+xWyzzCPtr+9TjTgOyFWcS7nHRXFeGIYIKz77os
         kim/kljDQ38ZepXrjjcqVOhWYe7pFLbAoRTrzSkwQvS/C0XoWZBR50FAZnwIecwCeJPN
         y0iw==
X-Forwarded-Encrypted: i=1; AFNElJ9sY6fJh7eBoNNDQTneiCnRBhPwYzVS2dL6sv66NoweLBlg74pK7zW0SHJUr+XHzbF1z2d/YF8wdC2vLECo6P98@lists.infradead.org
X-Gm-Message-State: AOJu0Yww+8r+gifEKC+a5BdChEX9mU8QuHpmYNWtAKngjoQ7N2awNmRG
	mLpKnaFXyOfbaR1lKE9SDeFOAM+kuqniUWH6urJbvdJAFCmnfaIOu2tJATMazce4OiY=
X-Gm-Gg: Acq92OFI3swei8/UZWoqF/b8IRNHufJeclHMNDjzGDSB/M+Ltum57nMby3V/xiWhYtF
	JIb5XAmi4V44d4l2P2R+rLkOolu5mkHJzp4uUxI0GFLYEvQguCRPe5hPmMkYVwGPBawSFK0XZYG
	i81GtO/iBjlgu3yunT4XoSyH97ApX5xJMaFxdSjxLRFHmm3xXE1CYt2PV3QFhh/cQ00eJtfvH7Y
	jaxlBiSmtedHPCqvjdgGMRHzYGkjwdjayJ//bTFFajUfG7VYe4Vd87OypMMzuMCj/X44ROvMRXE
	J/Oj2zHwaQx9tXd/gIvHH6VWL3420rVN5jNI/aAyAWQLe9xXQu2maYa15CaEz0wcplFth/K6hMK
	HLnOJvYLLfXiy2aKcwDj+h9UPEbtkbxq736NI6pgfJPD4u7kWef32SL/8zmMEwFXQXJzqLIGOMW
	ZTxkuo1P69qE+NJFW4K0915YO62/N1C9Sg1mgECyfnPOepKtMG+1OjH0WoCOsb9uo3s/Eq+94m7
	K1JUkYxznKN8Yw=
X-Received: by 2002:a5d:51c6:0:b0:45e:93b2:37bb with SMTP id ffacd0b85a97d-4601f4ea1a5mr208717f8f.6.1780419652096;
        Tue, 02 Jun 2026 10:00:52 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f360bd6sm541156f8f.36.2026.06.02.10.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 10:00:51 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 02 Jun 2026 17:00:47 +0000
Subject: [PATCH v7 1/5] dt-bindings: thermal: Add Google GS101 TMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-acpm-tmu-v7-1-8047dd54b0e9@linaro.org>
References: <20260602-acpm-tmu-v7-0-8047dd54b0e9@linaro.org>
In-Reply-To: <20260602-acpm-tmu-v7-0-8047dd54b0e9@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780419650; l=3395;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=2NgviHNZdxpicEM9rd/dWgHY01rnKmCVPlo7M+lrE2E=;
 b=fD6jATngc9u3E3ols1PmAttEJTrcCe8gC9fW9moXNR1OvAfins8hGD/WQRDyS6sJ0LSvCIReP
 IvQf1p31+B/DjI6lJVup2Qf5ydjcO0jdeRoqPTRob7Mhz/fSXkAa3wM
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_100054_147060_1BE1EF46 
X-CRM114-Status: GOOD (  14.87  )
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
 .../bindings/thermal/google,gs101-tmu-top.yaml     | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
new file mode 100644
index 000000000000..75560ebca48d
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
@@ -0,0 +1,69 @@
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
+  - samsung,acpm-ipc
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
2.54.0.1013.g208068f2d8-goog



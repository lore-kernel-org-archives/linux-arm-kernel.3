Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979B0CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 11:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8X0F5bMpj7Hkv7PmV60JbdJxUXi1oD+oGZuG7k+zKY=; b=pvjOWZblyctake80AFerdRkZVw
	BJOzvq9y6l3UQ8CULteO3k6AP99Vk5oRNts1T1ji0TXqVZxbCzQ3ht8mOKQ34Yspm+qkOcOoSexeW
	4/mkWQcpvS1fCiW8ciI3UvlyIK88ILoxa4ZUH3v/taVApXZws3CLPXLv0wyziYCbGXgGADXM2A3H2
	IruqafOOf97NEvP2UUtTBFMnRLypBWLEZpG2iukTwlxbSrYTazQBrm1nIdkap3xpgYAEt5SsQjj9Y
	rOADWFtYOnTbeFueXGYCG0McNSWlY6FAHVlCsI+rOCHM7ZR1OJICaRm4Vefm53LYRk2LnZHSU32Zn
	G5DDVIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZ2I-00000005fMl-38Wb;
	Thu, 28 May 2026 11:36:26 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZ2F-00000005fKn-3axW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 11:36:25 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso86869925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 04:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779968181; x=1780572981; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8X0F5bMpj7Hkv7PmV60JbdJxUXi1oD+oGZuG7k+zKY=;
        b=vWQ0DGiswNqRoZEkLlltgjO7KqNTOMWYhOwePkpFDh6eiRYJs16iPbtyKkbENkonR4
         E1oNTh1J3L5NpRlxWceFCzO76c90PPYpQkkJ3fDiZxlSm5YZiv8xXTlNQGhL7aezTLdT
         1Xj8bUaYuEMMHAXEEYlBXE813nWd9mx8GqsfcZpcegkRDXAD0qPTGu7Q1WuRIcvmJL9G
         GLy/Q2/shMigmOkcPV+fuP4OpBEkOAWjCTUOyXkYhZEq6UhD5YuDwApoQ9iI5xwF4S5K
         KXUp0nSjLK27kijLvhUj/CiQp5YMv8NwZ/+lbRLQzDIEGYFMD4zKIZNuRbLQ5NqXwdiz
         3rUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779968181; x=1780572981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+8X0F5bMpj7Hkv7PmV60JbdJxUXi1oD+oGZuG7k+zKY=;
        b=TR5xbJO/T9iaSbLkhteO2PVimv+YXkozZf4XDsMGmUGY0SQdaKOky/5PG9Qr+7QLgz
         JYwpSCa9oDQ8nPZiqzypWzTcQi6PnGU0gUS+fm5KRVL6ZKUnsSnOhmorYVvlN6n5jhJk
         lrVEke9Ycyxyw9gTK7e6BXlP1O/gaHb5a9kdq8rxc5TPGuKw8qM0ZlFsJe6BFV8sOJHY
         sgEaHnmC7h488OKZBDh1Lh+OvODWEyV0/VLIpOFC8+W3MmCRfadY22fngDEmDUiIl3kr
         0q9vTypSSc5hgyloNFWNgBC6Cm0ruUM7pH7Dlh4ZWsGdxanoZI/L4NKjTYzEUfxyIJ/Y
         QeJw==
X-Forwarded-Encrypted: i=1; AFNElJ9Yi81tLhCvns5VK6QWAzYKFnevOTb162puvks3frvU7/BQzTZchebEDeH3bIlsKmEzde51v0k9rJRGssB3zQW2@lists.infradead.org
X-Gm-Message-State: AOJu0YyijBPbOWQEqKiXr3mTUks+KnWNAx73y80igjWzFjanNRJ/zNb1
	vBZUp0ToItYQYSYhzpzpWaXC/aLP8pnUVRIxY04yeiJEsp+gzU8xVQvVCEe3hojyZBI=
X-Gm-Gg: Acq92OF++8qsCMd0nlALk9fzZeDaG0aN66kWp1QgKAI31055tka7yliFOgQzPtp+d6D
	ZSJch70ezyjS3fMh2wV3D9/DEcAmAwG5qQatJDO3DIgVr6UUO75Z/9bOAHJgiKCyhsFa/TaLUtz
	iKtQ+58vN6eF3WNDU7rEpqNDCf+PMUsGhUNQj6LYXV2RBTcV4MBZqTQbD2p8I6RYRND2SDvlegz
	ilzw9DZM9n0YmUv8X4VIjRj7j09N7zIeeF656mp14Re7ZheSfrez8SeYXtqoPBvaG7Q7zdmp8g8
	8NvesY3HtkrOz6mKDLa4SHZ9kYXfxs6dpEozar63hAFYvf6cafFb2fSsMvOb5CvcV/6JFGTUCMa
	Sa3A5Zp4BnU4kgnhClz5UXn2BjB767Qz8w9aBOwNFnGTT2ADC9dRnLxhR9xJQRu2j1pqfbapRfj
	c1ShlqjSLdWt1u3AQmi65X24/oAjf5U31vUzIkJ0mjBDDTqGwqH2I9kL9VSqytc2S4qOUfSWips
	zVr0MN/RcRtd1MXoQ==
X-Received: by 2002:a05:600c:45c9:b0:490:5cb3:e94a with SMTP id 5b1f17b1804b1-4905cb3eb81mr310813075e9.2.1779968181393;
        Thu, 28 May 2026 04:36:21 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a902bfsm60385715e9.12.2026.05.28.04.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 04:36:21 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 28 May 2026 11:36:14 +0000
Subject: [PATCH v6 1/5] dt-bindings: thermal: Add Google GS101 TMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-acpm-tmu-v6-1-b4d7ce57594b@linaro.org>
References: <20260528-acpm-tmu-v6-0-b4d7ce57594b@linaro.org>
In-Reply-To: <20260528-acpm-tmu-v6-0-b4d7ce57594b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779968180; l=3394;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=YiVpGFmnk6c+4tCGKYqMcU8qmH5daodRYRGzWhkV0LI=;
 b=KtZZyG3wFMX+r73Y0exw3WifuUFyiDSfnquCr3zbzt8yf/d1DHw1KK3E58IWx64pXNkgFEDQX
 NMbQp4qP6EUCyGu1lg/K1lswYaAFwiDzq2ttHrLzeJ2KBMkuaBie3CW
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_043623_928081_443F59D1 
X-CRM114-Status: GOOD (  14.89  )
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
2.54.0.794.g4f17f83d09-goog



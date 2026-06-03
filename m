Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C77CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UJRcwfUx7m4tQO0H7dzGL7l03jX+wNFvSSTwQ2iw18=; b=En5BYvyVK3h9SDOjFHII6h5tM8
	ajxEsqSt/HGbeNfUM6/5utjJlQzXc4IWY5mGc/N4hPZApBppjL7uD/7BLGYsHK1DvWWYxy8zeeSKo
	I+Aw13MxK/Z6ygIAzAJcvbzlPFaZf1QTB9q5fHA6LHKn5Rc8a9EWVRNAwfC8LsZvubwatdh6ZyXyn
	0dgNvyx/R3PK0pLeqKagQdK4n9bAQxyfG6zx/dAuV6fsMisXWxgBHs3mlVx4U2HpjxA431hNbZzEi
	yyJ1HBxbP5qKlv4nRvNFwxP3ksIR27w9RpXOtCv4NkCAbGNCK6DzgkNABF3Z2mOc6PBCuw8iVzQ04
	vHfJjvJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlCq-0000000F6Tv-1MYZ;
	Wed, 03 Jun 2026 13:00:24 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlCn-0000000F6S8-1fCr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:00:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490b09e4cccso17378325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780491619; x=1781096419; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UJRcwfUx7m4tQO0H7dzGL7l03jX+wNFvSSTwQ2iw18=;
        b=u8kJc7JXqwEByqTRFKAvsuL4SXP5sZOJAZgCyBBnrTgW4CqLhxO7yUO3yA8jOkQuQV
         88YiFVy3iL9qJ1t6LvLVlmTwEuVjcQ4n/URd1LBKIUk/2P/3qGXQLYCVFZwCSLth1QGF
         FO5qQ27PiGT90cOr9Edd+u5xPtTDgfKvMbhz8sqQGU8fKyhmz3ys6cxP7rwRR8wRivMU
         yv3u3uZGfHe+WYV4HhDFH6TOSj1N7GHtIkgknWoIg+Cfyvx5yxoIZ+gUk7ARVyIf73L8
         Ga4DmvOnrb3GMFeyn2mTYLZOAJcx81CK0Jgs8vzfd7Ly7Oo6myNRqkL6mrcg5djqo5Ox
         WkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491619; x=1781096419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0UJRcwfUx7m4tQO0H7dzGL7l03jX+wNFvSSTwQ2iw18=;
        b=jve9dfmlSINSnBwzuzY3bvVj8I+Ls8utAmuQQQ/fk0PgrFiu3SKMIWMHZABgaBnkrm
         ClGATQkHZ+KnHrI0YLYrK+IYPHTc4n0skbR9RcNif4QKnxpm2CJtBSKawwQND8aerJAi
         hkHS2EU3OJmYHN0ciiY0dEQvJY1E/jY4JYzAJWtF4sliGP4v95hmWI1lkQb+1zNp2vmk
         rwwRsoQSdMTBbChp9R2f+89PxHdvcZ3IOmph+mdJnk4dY7TLenolfbEF/BU7yCIa/Osn
         kJLLJrhIvWiSqrJ5GVb7Sln9pKQgXv1gAhd4G0xkzWqUz876CB9xwtkUifDK0ogRtynY
         WE5g==
X-Forwarded-Encrypted: i=1; AFNElJ9gQvzuywoLQf6jTe5xh/QYDu6uFTRfXyNbK2x9YRmYb6fgabPReCm3ejCzPwl9ieJcrZ7ZJQjhpqkeAoQPCyXD@lists.infradead.org
X-Gm-Message-State: AOJu0YxG5Nfr0hJ13jguYEM+20ZPnRAKo0OHE7ZfyexXmk5XzkJXTLz0
	KYTBA75XmNKLjZbhk9ljb6s1xpb0p+GVXTv2RQ5SAnNoejK2HV5FKf6FpAu9GxdlaNc=
X-Gm-Gg: Acq92OEVPP68sgpErEo4J5VKkT1g0Dmvnua+JZYpClZ52ANKUAvY00nqkvfPAK//8ee
	GyieUBCNZFnzKWfJZZvd4SEHC/ut776MyXehJKNgb3yTSf39KrjF+FvdDY13Eq5ujx3Y7Jl/9W0
	ZPBe8DGKkscvKkkiw03TABvHNgEHF5WHA6fQl51yW6HmnAdW5NOQjr1v/iFai8D6LQHkAUQPsIR
	DAUZsRfFBkvEkyyALqDYLrxfGYFAxOuaoZzBFqZZwM2bh/lGakBKHxEVGHcW8iy0MnLsf39iN0e
	Zttw0wg0vW5V4Sm6tA/t3FLBdB5pDiDYSjUyAo0s7hIDzPns971Lus0j/yg6fDDidON5iL+R92w
	kJbvbr1S3GupkaEoQaF+vXVZyj8k8cJ3JArOU5lATCOFKNpwIp5B5RYigH+E5ipQ610TJNKUL/h
	W9AWvi9CXgLfS+HCQRRkVHehWz3RGCCbaf8wMfuCMuHtavoFYNQWgDa1SNvul0EL4sBrfIAnGSU
	e32bkvbPiHiAJs=
X-Received: by 2002:a05:600c:314d:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-490b5ead1b7mr52139485e9.8.1780491619214;
        Wed, 03 Jun 2026 06:00:19 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e88fdesm149179045e9.14.2026.06.03.06.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:00:18 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Jun 2026 13:00:16 +0000
Subject: [PATCH v8 1/5] dt-bindings: thermal: Add Google GS101 TMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-acpm-tmu-v8-1-0f1810a356e6@linaro.org>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780491617; l=3395;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=2NgviHNZdxpicEM9rd/dWgHY01rnKmCVPlo7M+lrE2E=;
 b=iPBfwCGJRkej/sxT+TtxA4HdlGWcPjWO694Z6qcPCKaUvKC1gLbqJWYHQRCMrbAH+I6HE7L1Q
 N4obNagGADtCS7KOAAHw3xE0kMuWt1vS+m5IVmg4jZfk1fneqUkTrV/
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_060021_470164_7C190D04 
X-CRM114-Status: GOOD (  14.91  )
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



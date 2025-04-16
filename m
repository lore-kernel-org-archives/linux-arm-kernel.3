Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D63C369C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hz3xMnjSXc8Vbo6UN6ksVtAm9/A6drzyntoCMibD+UY=; b=G2FX2c1jgZjWetcDxfOUH6Jaty
	Fj3C4fA6PFnEjhgjgWUIljo98CHE+KW7MhisrVnZI9rMUFjGfT04sxvsTZSNTYdoU6Y22IsKWGUWE
	KNn17ZEctMLZ8loJ/N++0NzEzzQ+VEvZNlUIe6yJEuPvHU7Zd/Mlk1fyhgkvYNt3eTPqAt4dMZ/Am
	FbB2FPVtVkAIxfpSIbd5g713P/cejyyjlR5PNnVyzobdDsVQrL0aeABcFUgt+A9N2I7Zo9lF8spME
	ZkHdhWOpVIz5TjUqNIzsxI04F5WV6h4bWNwLbfhSnHgCNUxijKxDYuOxb3wzY0uZ+YhHSwJGpxIQt
	DkTBwBWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502P-0000000984Q-1ilf;
	Wed, 16 Apr 2025 10:30:37 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4y22-00000008nUJ-02W4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:22:07 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5499c5d9691so6929070e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791724; x=1745396524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hz3xMnjSXc8Vbo6UN6ksVtAm9/A6drzyntoCMibD+UY=;
        b=UcSc/KZnqNE4asxb1jITv/7O0jwf32ocELlFvdnhuOX0ezYkXW2nO7GJ7xRpRzOJmv
         acZRuFWbDhJ7Ws0XMzRAL/3OfGbKZOPF9czqk3Yj1yzh1ALar4efozCo/5bTfxhJcrHp
         ZdRc9/dBAqD/AraSyxakVKX+79bfxGA583mBcKzqzeMVtkaXCKIV+fX0f9ThuV9/k1ey
         zjUEPmCoCC0gMiMxPFWJdlmRRd/wDvP1iVWarZjmuHRju0dDyP0Hu74kgW6Ie/IFIrj+
         Bg45DXPsiyHJTFdLeIteoXJ4mE333mtMXKlk4i/5+GHQ3VNZejYw9rpYY4Z1Hlgh2yqP
         O6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791724; x=1745396524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hz3xMnjSXc8Vbo6UN6ksVtAm9/A6drzyntoCMibD+UY=;
        b=Ld/CK/ndvyy0vP6LFDwwb5wzFmKOZ0EOnp+YX5fODg32OZTiLuv2hxuas2kgtaI3BT
         H5ndkimRuY63CjeLMYjxUNON5Wt5FfW7hjvc3PJNx3x4UbgiJH+/97hOLi9D21uhCNZw
         Yis9n8ljjyeiv0IH6I8gYacj8oRAgiAaL0bETAVCCT0nZQoc2pl1PPBVrRjyZ7km9v6Y
         4kLtTrMkr+wMY6OvhBT9LedeP5i4JtVsGqLRiamIfwtdN2npBPY6Ax26zY2LlFnLX0RJ
         F80RFL9UBwu6flOhuL3E1sOCNDEeKRPJhTqAswYBvXMoejb5XvcsP1oDUc9r7XyPdQaz
         aTTQ==
X-Gm-Message-State: AOJu0Yw1l2t+ueWidZFuw3YyjYYB6ss/U9uYToJMopE3oSKSq1r5dK0H
	GiyLovq/iZNGfs+LXlPMVtTDFmDv5HoAUpSv8fLi/FtmR9UJjB52
X-Gm-Gg: ASbGncvQbJGdXAhbi1cI23C4hzKvkYDMq2yXXoEar5yTM4DEDMi2wAyiNUD6C8s6tBu
	k1V0tOAO1xajDcqr8SHrp1dOWJmlIauI48HBH+ynyzZMzbU6vU7IlnHnm96pWcGadpmF3kcdgE8
	9wJdlHSqsV94nGLIQ4CsEavGtSHV6pfJvIZ8tkdW8ZHd1i+NWdwxpM1opuLEZUHFvQatFWrl15a
	/pz34oPSy+5DQDw+uC9SZ/NWgKrEdosA7gPerVaFnudCKoq8EDVCKTXIVVdVeptOZvnHZ3wC+zM
	uJYX90WGexK2bypGo4Jy2oOLNc52AHJCWXKsNKyd1oPNiul5kZQ8
X-Google-Smtp-Source: AGHT+IEuJuLfFCt+9GyN1idWy06ZmoWNGkSGMSxNf750gdW+sq3Ker5OqE2naLWKfRaLvI2raaZoxQ==
X-Received: by 2002:a05:6512:1041:b0:54c:a49:d3e4 with SMTP id 2adb3069b0e04-54d64a7b65cmr279874e87.9.1744791723651;
        Wed, 16 Apr 2025 01:22:03 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:03 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:28 +0400
Subject: [PATCH 03/13] dt-bindings: mmc: vt8500-sdmmc: Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-3-f9af689cdfc2@gmail.com>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
In-Reply-To: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=3702;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=GDEv30ykcwNrp+ITbOwo9y2a8t6U4fArDqmF8aS5Xdk=;
 b=GCpdFEkoTHE9ybEwUmMP3zyIuVwotvOJHUhwhdPuS+K23AdgM+TEtrCEsV9kNiqMrLEc7Go9c
 pPuHSamLO18BrZxR9rp9FI8e2Nx/MOHbD9zNhPB3twsFUREVO16jeWc
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_012206_053267_45353686 
X-CRM114-Status: GOOD (  16.39  )
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

Rewrite the textual description for the WonderMedia SDMMC controller
as YAML schema, and switch the filename to follow the compatible
string.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../devicetree/bindings/mmc/vt8500-sdmmc.txt       | 23 --------
 .../devicetree/bindings/mmc/wm,wm8505-sdhc.yaml    | 61 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 62 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt b/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt
deleted file mode 100644
index d7fb6abb3eb8c87e698ca4f30270c949878f3cbf..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-* Wondermedia WM8505/WM8650 SD/MMC Host Controller
-
-This file documents differences between the core properties described
-by mmc.txt and the properties used by the wmt-sdmmc driver.
-
-Required properties:
-- compatible: Should be "wm,wm8505-sdhc".
-- interrupts: Two interrupts are required - regular irq and dma irq.
-
-Optional properties:
-- sdon-inverted: SD_ON bit is inverted on the controller
-
-Examples:
-
-sdhc@d800a000 {
-	compatible = "wm,wm8505-sdhc";
-	reg = <0xd800a000 0x1000>;
-	interrupts = <20 21>;
-	clocks = <&sdhc>;
-	bus-width = <4>;
-	sdon-inverted;
-};
-
diff --git a/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml b/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a7d962bc13c7ff70b50448201b0416efc7f787af
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/wm,wm8505-sdhc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WonderMedia SOC SoC SDHCI Controller
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+allOf:
+  - $ref: mmc-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: wm,wm8505-sdhc
+      - items:
+          - const: wm,wm8650-sdhc
+          - const: wm,wm8505-sdhc
+      - items:
+          - const: wm,wm8750-sdhc
+          - const: wm,wm8505-sdhc
+      - items:
+          - const: wm,wm8850-sdhc
+          - const: wm,wm8505-sdhc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: SDMMC controller interrupt
+      - description: SDMMC controller DMA interrupt
+
+  sdon-inverted:
+    type: boolean
+    description: SD_ON bit is inverted on the controller
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
+    mmc@d800a000 {
+        compatible = "wm,wm8505-sdhc";
+        reg = <0xd800a000 0x1000>;
+        interrupts = <20>, <21>;
+        clocks = <&sdhc>;
+        bus-width = <4>;
+        sdon-inverted;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2444282096e03b301ed0e3209b4de7a114709764..f106850b9d3d349d82953b672588b967a37ea27b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3429,6 +3429,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
+F:	Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

-- 
2.49.0



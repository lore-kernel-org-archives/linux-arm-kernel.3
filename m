Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD07C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 08:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhETkR8BTNErY7rf9frMZHrNNt0dwrD/s7H9/3Vpz5E=; b=1bBLErl22AdVW54S9dpJAFZrSJ
	J54+CfuNFvyewmUVH4GppMEKHBSZjQB7+hYj+N9E7MpDAudk3EDh2uEtz+ccxAVowUVOh9V6MRVWN
	HgiTpJ9g0phTg8p7EK/pCO/Zl1IafdZbcAveir+QxFkVTBsMq25ixyHw5eoSnsYTDG3mBNyn7YY3b
	I4/Mba1vEvR1G5TgIU151P//0Kxcbuyi/cEfSsTehvEePa9KlqOnjvxvMXqoSn5ch9LiRx3R6Y+XE
	jnUImtE+OCsVVx8gJMfWjPjj+BMdZnCT7oeMWwN4zKURaSe+wX24inFWwicLqEezTkyJ3GVCXGwso
	aM1Lc0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIRR-0000000C8sj-07pB;
	Mon, 26 Jan 2026 08:59:25 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIRL-0000000C8r8-1pzY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 08:59:20 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c636487ccaeso870703a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 00:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769417958; x=1770022758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhETkR8BTNErY7rf9frMZHrNNt0dwrD/s7H9/3Vpz5E=;
        b=YS8FvG4AHXUruSXka/To1YLBXoSUWWPDWOqah35r4TMZIEXBBVZ779ZFEDRLuAm6tH
         CxxfXH0tC9qNIm0KPM0bMOe1AT3+yRsob7MbEvkK8ebBoqae8R6owO5/TeWmrupA46Kz
         qHMTWlj0gVAK+DSorewCrelhTjz6yGSlrcCFDLpeRa+Pm+XsjTQ/S0RFlWHZsIJQ+WCc
         J4iklUXbzD3hq9xdRZ61BrFX9YUowd62aZcfjRlK3sbsXgX5eXxpTuzivp9YA5p1A8Ph
         nNtEx0ol776TRb+M51XNjPLHP4bY45vKOThxlIjYJyVj4lVAyw4wqm2G7hn5iiCVuyPB
         qL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769417958; x=1770022758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xhETkR8BTNErY7rf9frMZHrNNt0dwrD/s7H9/3Vpz5E=;
        b=lCd0MxC5/xjM7Wy69EDXK+Uc7P5uaPWgbao9XZ4vGDJCX+6yFU+ZQ9oTugYp6ZSrZA
         WZY/IY3JDLdvnKVZaEfXCkvrwuSLWmAoG8DNl786GL4jlXjz2VpkZUrFGNzwMxUMfmwk
         VRGHxBmRLp69GgaG4+fhkJDBkUd0pI5YA7xw6ef/nIrxtBCmRiZxj44DAJxF3VlKDK+V
         tDovhNqlW1N1KBGQijIVUcvUwhjQp3jEdfGI6wmmvzii+eI5OFt1kgalfsfnBlIIITFn
         ihc5mfU87kUQychN4cSDPxA16Rut+SQp1mT/M1WqvBcnvO6gcuQKQh1vkgKFjKnQtbiH
         O04g==
X-Forwarded-Encrypted: i=1; AJvYcCX3EsSxP1yTEW+JbQ60O3bLnKi6czV0r5XEyPmKr0PL07sGJMApnl2Q2dsvkuvbJmspcuiecoxuULUT3rR4iYgD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+RYH6603gNPvwpuMdqslaC6nV573Ot6yk717sGP36VaBEsCPB
	92SUllNHWgISjtOVPNgKn4Q0fDRo4QDpmM4IOPPyeAtfOYMWaW+MlYGr
X-Gm-Gg: AZuq6aLEgXqs/HziGBVB7sRp5rP4gmSofOfuXfus5QhdfRijp2kJOWyl8oOxFXY6Aoc
	xiFbO18+4YjoOO1iRlSwWEiHsZDppEbZbc8rN5ZsHc2JvL1Lbl9cHlnDB4CMXyMTup6L2wVUu1c
	vd94VIfihI5dexxQYX0hGZ+zqlRbwdUVxTmEifdZpXMfa9EK7VIrFNPpDIwy0aWOLMBI/Uh0vxw
	Xw0NuSvozc5d0C5MWYjduAUpAWqvDOt9p6S4TPL896NgBTs1luBkKdUzR+5iUsgmMVjth1aQaQT
	JFJGLDlRhU04TosDAkaHKlTw10badkKrZohQZjcKJw/9hY/9guY3zEN4j4f9R6VWO/VvpH8UR09
	E1Id2DlbaKEjqR6e6/6wiSwYQI9esqXc16LjX6OWzPDma8HJs46oEI73kYqyyHTUPphf+8+634r
	ilfPPRFAdxv56CUl++dDundUuWHoUO1eCzzm/12Rd+t/Fungui0zZtmoXOojsdYfy0vTfv1pPk
X-Received: by 2002:a17:90b:2cc6:b0:352:e3d1:8d69 with SMTP id 98e67ed59e1d1-353c40b9e8bmr2572049a91.1.1769417958446;
        Mon, 26 Jan 2026 00:59:18 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536dc3e0ecsm8251798a91.10.2026.01.26.00.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 00:59:18 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	a0987203069@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: display: nuvoton: add MA35D1 DCU binding
Date: Mon, 26 Jan 2026 16:57:25 +0800
Message-ID: <20260126085727.2568958-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126085727.2568958-1-a0987203069@gmail.com>
References: <20260126085727.2568958-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_005919_481055_B4E02C35 
X-CRM114-Status: GOOD (  13.17  )
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

Add Device Tree binding documentation for the Display Control
Unit (DCU) found in Nuvoton MA35D1 SoCs.

The DCU is a DPI-based display controller supporting RGB output
with optional external bridges or panels.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/display/nuvoton,ma35d1-dcu.yaml  | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml

diff --git a/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml b/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
new file mode 100644
index 000000000000..e3b79b5b7dbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/nuvoton,ma35d1-dcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Display Controller Unit (DCU)
+
+maintainers:
+  - Joey Lu <a0987203069@gmail.com>
+
+description:
+  The Nuvoton MA35D1 Display Controller Unit (DCU) supports multiple
+  layers of composition, blending, and output to parallel RGB (DPI)
+  interfaces.
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-dcu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: DCU Gate clock for register access
+      - description: DCU Pixel clock for display timing
+
+  clock-names:
+    items:
+      - const: dcu_gate
+      - const: dcup_div
+
+  resets:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Video output port
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    display@40260000 {
+        compatible = "nuvoton,ma35d1-drm";
+        reg = <0x40260000 0x2000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk DCU_GATE>, <&clk DCUP_DIV>;
+        clock-names = "dcu_gate", "dcup_div";
+        resets = <&sys MA35D1_RESET_DISP>;
+
+        port {
+            dpi_out: endpoint {
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
-- 
2.43.0



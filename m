Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6604C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 15:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RB1PP1x3fa02Q8papa7Q4qbO9lj9DsfbybLuQtv7HIQ=; b=ew7tNBY0Awc0Df/z1ln6/wUI9s
	z9Pfq0fTnvRmDsYxwV/6pJqXO2NXKpROl8w7fnjmYxY648UdsHVnTm2FbvtwhwDfC53RJX8qyI6Bw
	EL41lP8SAGeZfMqeEHvhuNFO1GQhekkL+gmLZDiV/kAS9bXV5CWrXcnxRzJhlomxwH5DGofhrB0D4
	oMrh49O9G4plq+/JN94j0HzeGOGkWqG3THhP6zvi5NJNrxCOthLqdxo1XGONmRs9shaaU6/b3+yVq
	1pS/qe7aSqM2KvAsNGyyVqWJ2HmvKAGlrXH5zPYExEsfFbNQCT3gbNuCdHilab4cmrFGmaCx0xKL2
	j6iClUyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdvO-00000003mak-3gJ2;
	Tue, 01 Apr 2025 15:53:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdoF-00000003kuL-0LTu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 15:45:52 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43690d4605dso39620925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 08:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522349; x=1744127149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RB1PP1x3fa02Q8papa7Q4qbO9lj9DsfbybLuQtv7HIQ=;
        b=K15MuzqvdtEGHQaG49DzVAGPNd5lSLko0JY9HtQA0IbhMSwkQzb1BSYYAKKHrAjh0q
         v8PFv8EXw3iNly8JTJlGuOjgH+NjFXUdHO3zvOxwpr88PWG6v5Dyh4+JZZYlSgHu38+x
         IvX8P//FVcbV1eyO1Z516Qf+I2nkJ1EpyXSwG8trTbuGBeFWRQXQ/FnrO0EulVQbpC/M
         CKDS4hyY3JoCltrkN98MaQbob0/6tWhpETMraHlBHrDha9CzC6Al9htYyb1MC7FXj9oo
         HNxrV6Umm7ge22TyTzXg0VmqSnKhabVbixg3f85VmPY4GeokOekA6qknR5URkk5rwFDp
         7Vuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522349; x=1744127149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RB1PP1x3fa02Q8papa7Q4qbO9lj9DsfbybLuQtv7HIQ=;
        b=Qy8QUNeijzOwkjYz7VDf3xsFYV25ut3PqyoMRgXJtSIdR6TFATukhP/5yIM64OWCuw
         OUDgFdHfCPaG34RY5ahmgJ8ydrmtZmR9ikL4JVIin5H66npFUNynabgVlZERTslkKGq2
         O0w6wXuatjYVARvyiW4SyiAF+FXiZZSMhmg8fS9yLAfL6Wn5CNzyPQQZ7s37JvEurS3U
         o30wE+Ptnfs8rYiy61kMZxIYFDdqoowZ9VO6fF9LTkI7QyM8DLzIeX2r47RcGuL12CQl
         f3QX9O6kRiaP66VL8FhQOXPs5IcZ0hLhrh7ahGxCHtmLgOag4ZbcyTue6qB8AeLg0jSR
         RLHw==
X-Forwarded-Encrypted: i=1; AJvYcCWmCmcBiWFKxgOyzqYvgdLmJ06CSyZJtD+UMB8ed3TCswTapwrI6PNyGnNoTgcbpWZV7ex0zG5C98fqR80zPj9V@lists.infradead.org
X-Gm-Message-State: AOJu0YyGVCJr5ot3HWS1IrJMwiXDyn1AIhf6IIMEOlo6D084LYgquqZI
	9sqGKzXxTt1+xDPiwYgkUBl892pcmnw/wbEo3W3UATVq5M0ns/cu
X-Gm-Gg: ASbGncsv5meDSVfrb4P8fmFj7YZ4TrrXyIBYEEdOKlrENhsYjSv5wdouQphK7VsPUqT
	x4fj4MIInYx0zmdaI/zjAnwof7Afdp4FCWilaqa0JKSdLAGCC6hTVJACU0usvvLpywyg4LSb2AJ
	mzgmi250Lo1D8Jhm/lVb6l8Polcdlv9VCSKsLCK6J/NnNdB72P01lEaT2Vg1aLjbEv1ogL3aBmg
	Z+qKm4sqWw6YjnCwLLZyaxZ87zc5afJYjJEc2ookwlU+GZwEFH8FYp4P+zfV/KQX63Qa4wyDzPH
	RhY+CALFHRlcucBiH6zbrI1MNOgODKKWFO3bWBYoSgQ0LLAbdYeNiG0miOKNBDEQ62ZLpPGFMt5
	CaMrv5VI=
X-Google-Smtp-Source: AGHT+IEwP1LRFyekKJgsxs9B8k784Op1Fz73VSFZYv3B3/zly1RjzrL3LrijYBHY+f5sPUhyA6ADAg==
X-Received: by 2002:a05:6000:420d:b0:391:2ab1:d4b8 with SMTP id ffacd0b85a97d-39c120c7d4cmr10416753f8f.1.1743522349145;
        Tue, 01 Apr 2025 08:45:49 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:48 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/6] dt-bindings: bus: add documentation for the IMX AIPSTZ bridge
Date: Tue,  1 Apr 2025 11:43:59 -0400
Message-Id: <20250401154404.45932-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_084551_122563_565CBB1D 
X-CRM114-Status: GOOD (  17.21  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add documentation for IMX AIPSTZ bridge.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 include/dt-bindings/bus/imx-aipstz.h          |  25 +++++
 2 files changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 include/dt-bindings/bus/imx-aipstz.h

diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
new file mode 100644
index 000000000000..13b7fb39d6ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Secure AHB to IP Slave bus (AIPSTZ) bridge
+
+description:
+  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters issuing
+  transactions to IP Slave peripherals. Additionally, this module offers access
+  control configurations meant to restrict which peripherals a master can
+  access.
+
+maintainers:
+  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8mp-aipstz
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  "#access-controller-cells":
+    const: 3
+    description:
+      The first cell consists of the consumer type (master or peripheral).
+      The second cell consists of the consumer ID.
+      The third cell consists of the configuration value.
+
+  ranges: true
+
+# borrowed from simple-bus.yaml, no additional requirements for children
+patternProperties:
+  "@(0|[1-9a-f][0-9a-f]*)$":
+    type: object
+    additionalProperties: true
+    properties:
+      reg:
+        items:
+          minItems: 2
+          maxItems: 4
+        minItems: 1
+        maxItems: 1024
+      ranges:
+        oneOf:
+          - items:
+              minItems: 3
+              maxItems: 7
+            minItems: 1
+            maxItems: 1024
+          - $ref: /schemas/types.yaml#/definitions/flag
+    anyOf:
+      - required:
+          - reg
+      - required:
+          - ranges
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - "#access-controller-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus@30df0000 {
+        compatible = "fsl,imx8mp-aipstz";
+        reg = <0x30df0000 0x10000>;
+        power-domains = <&pgc_audio>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        #access-controller-cells = <3>;
+        ranges = <0x30c00000 0x30c00000 0x400000>;
+
+        dma-controller@30e00000 {
+            compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
+            reg = <0x30e00000 0x10000>;
+            #dma-cells = <3>;
+            clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
+                     <&clk IMX8MP_CLK_AUDIO_ROOT>;
+            clock-names = "ipg", "ahb";
+            interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+            fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
+        };
+    };
diff --git a/include/dt-bindings/bus/imx-aipstz.h b/include/dt-bindings/bus/imx-aipstz.h
new file mode 100644
index 000000000000..b81b4654e00f
--- /dev/null
+++ b/include/dt-bindings/bus/imx-aipstz.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef _DT_BINDINGS_BUS_IMX_AIPSTZ_H
+#define _DT_BINDINGS_BUS_IMX_AIPSTZ_H
+
+/* consumer type - master or peripheral */
+#define IMX_AIPSTZ_MASTER 0x0
+#define IMX_AIPSTZ_PERIPH 0x1
+
+/* master configuration options */
+#define IMX_AIPSTZ_MPL 0x1
+#define IMX_AIPSTZ_MTW 0x2
+#define IMX_AIPSTZ_MTR 0x4
+#define IMX_AIPSTZ_MBW 0x8
+
+/* peripheral configuration options */
+#define IMX_AIPSTZ_TP 0x1
+#define IMX_AIPSTZ_WP 0x2
+#define IMX_AIPSTZ_SP 0x4
+#define IMX_AIPSTZ_BW 0x8
+
+#endif /* _DT_BINDINGS_BUS_IMX_AIPSTZ_H */
-- 
2.34.1



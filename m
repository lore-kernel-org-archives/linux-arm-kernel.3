Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A2FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xX68KJbJESDlbPv3DAVN3pAKIAf/xvWJN3LoAooAL8U=; b=n+1gFBOOwYe4eXvF1BG2Nu2AMK
	Jre5PNh+UzX83MdvYN7cYyiqOfrHhNDzKN4ZpJrSXO1FYuuA107NuSXfEMnQr/6FzYd4YmWXGHKt+
	ycUYIfjo/VbKBNQcML/i5NDc7YCTF1vDZO15m00kBUR+hTYykm2WJ7oTPPuyYBCr40hnUnEkes8OS
	7a15hYbIojEK6AVbMxrOv4AxegAu3KqahRlV0sn4lwIx0f9hq58uKUWO7DvD9hBeyAekvtHRqmX8X
	T/2K0mX9aYTc+aPJYJ+QHICDTlc5aRCOEbnhxgHmP9b8UUUGG85cLeJkx99ffdTde4OUR9LXPZINd
	7zBoNSRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kKE-00000006cBD-2DOm;
	Tue, 15 Apr 2025 17:43:58 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jy3-00000006Xnd-3Hlf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:21:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso45489055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 10:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737662; x=1745342462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xX68KJbJESDlbPv3DAVN3pAKIAf/xvWJN3LoAooAL8U=;
        b=nV4YHJJB3T5iTDOBY1Oi5TdZeWFyiD/lQACxF9y3lbfLy2ohh2smqlhNuGmzEZEaV4
         OO+kbxWUBedoXsWEb98cwOVb93O47xdoy/2fUmYf5faw+3vpgPUJ6cUdS4XPD+qfRuzj
         hF67H5Ob8/V4D+QVVc8B3f5vS6H+G5KxlVgjldGi7ZpvCnfBshA7yxxtlrhayF+DQK1w
         vjiFoDJsgtcyvahPaxxsVIsSeMdoX8e+K1EoHtkgOxBn0bgKwp34qeBbNkpuRDOPThhF
         u8gHaLyhZ5kZ2oeQga3Oy6Sw9pg/SY1zz0uhDhz9Wx/v44UNWEVDAS7ytd/HTj4IUdzJ
         pV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737662; x=1745342462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xX68KJbJESDlbPv3DAVN3pAKIAf/xvWJN3LoAooAL8U=;
        b=nKz6d2ZIJUdun5zFumHuEyh62PYJg+U8KEneLSjvfCykYnWA1+67e662Bz/YEoo1/c
         gUXcSiXN+g9QAwd4MoA0cTegrrYyfql6DRTFFHw4fIgCl5ys6GvtJk6SlznCcfWzntM/
         faqEGAbSOQicGQC47SE2QZ8VBRSDYzyXYDwIl0aeL/hthvV/zRB6sgnVx9Fl4lUa0Mvu
         Y9J4rQ2jKAHCsUJ32oIVMa4ARnX8WwjrEb7im4JgHRV/zc8YgucTIYnP8CwgdXPDy3t+
         1oMj46OUvBuZVB2ZT5KuAbg3tNMl6uLcegWAJlPaS9rto5A9jDmzt583kY9h3X5+dzUf
         dKNA==
X-Forwarded-Encrypted: i=1; AJvYcCXW4hr/2l7Wbba6ye5uDSFefxZlIYj2FxySlOuBwEEjyeV/DqU/x+mxa5GCd1WQPQ8bdVhD6uRuilHduNguFVV0@lists.infradead.org
X-Gm-Message-State: AOJu0YyzoBYBH244Jnz7ExsvMfRlflSwDVwMn0rPiN/OJGosWuJXLdda
	qX39bBzmU6nJXRbt65DKIlslsx9eLHwgVGXZSOhIaGPriSwr621b
X-Gm-Gg: ASbGncv7kFGpdZeeAWcrIzvo8I/sdeDXtSBPl+B/Cb2TD9Qwv9+NY9Ooakimrz5BmbV
	SHPVyzFFtxVSk5xy/2eyDwpaARnlsv+1bg+ymGpWTAp3LLWSm6NIpAW7Bc02Zr4fX5t7Y7Q2fEy
	bp2p6a+rP3DnDlFP6k8TYB+TKMCC5qHGVMGr6wBYtGXOUa0NQpkmYu/KSPMIl7U8N6snsKuFPtb
	vejTSS1TWInjxVuoCD/JhTYNufG67CW9YTjRhJuarBuNLo0D+82wddmAfxghH9J9ducrqNOC05B
	ROqT7X6SznrYuCKBq19NP6+pa7G/27LXUlwwHOJ/F3Qr2RS8BT7raOI38APXM2ChgL66nIBPwUr
	/Dkw=
X-Google-Smtp-Source: AGHT+IGexATWs9xYEDx7R0R1qXjf6CfWHffvaeNqe3O3HPpjBxVxTLS162TjpjaZJdg9rRYGMFbrsA==
X-Received: by 2002:a05:6000:18ac:b0:397:8ef9:9963 with SMTP id ffacd0b85a97d-39ee2769360mr251985f8f.55.1744737661880;
        Tue, 15 Apr 2025 10:21:01 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:21:01 -0700 (PDT)
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
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/6] dt-bindings: bus: document the IMX AIPSTZ bridge
Date: Tue, 15 Apr 2025 13:19:14 -0400
Message-Id: <20250415171919.5623-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_102103_829611_8595E878 
X-CRM114-Status: GOOD (  14.24  )
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml

diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
new file mode 100644
index 000000000000..993293ebc4d3
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
+      First cell - consumer ID
+      Second cell - consumer type (master or peripheral)
+      Third cell - configuration value
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
+        ranges = <0x30c00000 0x30c00000 0x400000>;
+        power-domains = <&pgc_audio>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        #access-controller-cells = <3>;
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
-- 
2.34.1



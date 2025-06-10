Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF9EC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 19:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xX68KJbJESDlbPv3DAVN3pAKIAf/xvWJN3LoAooAL8U=; b=zLOJKwXVsWtPkOgwz8qyKJZJwb
	sziaNCnc+3lXV5fmKZborXvkoLMHo5tqNJbw5Xs58/jpNVZTlv52EnEDnRjVh8g1YmHkYe6vzAMGh
	G4Nvm0lnyO640SWKLlKUZZ94tlpKFCQZGXLPo5bQln3JtSUdrSYLS46CLnE5n7UyvctLLr85vuEEm
	Vj5E2tP7XPum4Hc1np4epDvfAAcZWio0CLzXgQBo0VwchVl4w5P/qHMi0ZRJz11LZRFOX+t6rTU5c
	h1x2fkaSkPVZViFBOrPZ9mmzWIHjEbVFn2A0OwdK8RQjnhRTbS7af0Ff9tPgqpvFbRUqR2nnkzrwz
	ZnivPPJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4jx-00000007vgu-3o6f;
	Tue, 10 Jun 2025 19:34:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Qe-00000007P1I-2dXY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:02:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4531e146a24so6769865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 09:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571343; x=1750176143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xX68KJbJESDlbPv3DAVN3pAKIAf/xvWJN3LoAooAL8U=;
        b=LLtHSHwIag+mJjjSfRF7KUpKCcPanV9ZD2T6W6xf8icfuISbY/IGAYB6vCg8DyN2oP
         2SJt+mR1G044lUbUv2MpYNiBuRHiswLqtisFB+7OKa8FlXbWLnckmt53p9twDfFcTnZL
         nwinAl0qUjtX7P++CmnOjWjd+Y3bcZvDQXJb8KSm/c0kzb/DkfvdwcznRQtnkwARFhLI
         3kCo3xoIh3BQehtdzIN6FXT30FxHRFYpL4x/7bHNMNJnNBAbTn5gNka6rWYv9L6BbjNV
         owN5WkcLe6ZTZgtqsjO7WTRV4kLRCwfEnv4kka9NVOzumLna+9vW3+XSvRzrCgk6cbYw
         s07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571343; x=1750176143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xX68KJbJESDlbPv3DAVN3pAKIAf/xvWJN3LoAooAL8U=;
        b=cq+g6JaG5scttg0bjchdVqsih6edMZNnS8GRVtdhRvKdNuBwz8ZFzk+jMUVFyiVnIY
         fuRn54hb4bOKZKnBBUwMHlz8gse2kFwlHxD1zA+1hrCCLk7QEB/IjcP7TpuJavPo9Mlt
         +5EfgTLV1vGUxaLYWs1M5Ps1drn9I9J8ETufF6KiekBfeTn+mGw9i2erHfxHjzntezyb
         DbJ0tkj3qjWBbhGAfrXcj3THJlBhoz6zw2/BuRSm71U1uMKeCQ1GHXgRqQ47ionYVWtt
         aG9BMCT/4Edx31wN902iYaUKVLNDIuW64zxk4xbiMM1KEbwIdHjbxw3NmLWVTvOAIQgB
         RaKg==
X-Forwarded-Encrypted: i=1; AJvYcCWv8P8RHha124oV2b3s8JfUwFCijb0RvTXEYtamfzdW2OGxzgz3T00P5Y1qfFmDHat2/XlQLDv85/nJMHT22/Om@lists.infradead.org
X-Gm-Message-State: AOJu0YznJDeIM7lhGd9R5VtfcwQWAce0TPEWhAL4o14rs5Wg17ReMqxD
	NRrqBkGERzspSYVicPbtQFr9ezhknUlKJPIX5hCUpMhFtbMcEMIAbyH1
X-Gm-Gg: ASbGncurwuUt0SzDJU5FrmQmy7TTGchBgBDqqY6FF1ItJaaaQLtaF64r+Hq0AcwsLRh
	ldELDn9WaBhs8fTwXdDNSVhHL/KmnQES0cn2x8tDwjiL/ndAJmdBbUUikT/b+6kCwi/yc3QLHbv
	OPlx6CicieeIEyO7TPWAGMqqun4T6/6mQfaI+Qwqx6m0oo0kwLCHIffZwRC28juKQI9SZ9wIIC+
	99c18gzvBp1QqCpiMGPLlVISFP4Zdu18xkyELPaYX0I9CwOk2tiSaq+n74ofK3Z25c+bswjAFkE
	OfhRP9cVztV9Zea8MYB+s3KfQ/92wZYRAtzV0uCmtMLkpvkeu3lIv8UJ4kuxukr+42frcoKedE2
	ys0Rd+SbNs804B//9ViWIxnI=
X-Google-Smtp-Source: AGHT+IGIQmwoh/m9ZyExLKzTeQknfvMb3DhvDjf5fzdmS0IWnKQl4ojPR0BwLRuRbj4bK9JzjZBEpA==
X-Received: by 2002:a05:600c:8b72:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-4531de00a15mr33799315e9.13.1749571342603;
        Tue, 10 Jun 2025 09:02:22 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:22 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/6] dt-bindings: bus: document the IMX AIPSTZ bridge
Date: Tue, 10 Jun 2025 12:01:47 -0400
Message-Id: <20250610160152.1113930-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_090224_667163_80A1689F 
X-CRM114-Status: GOOD (  14.15  )
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA90C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 16:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MydIHs3qFCXYHM7b0s9l0s9CjimN0OE0vCb1xP0k2Sk=; b=LvsZuqVCB8OjAlrSGACLvj8psD
	v88PFHSdFhftPH+unekOmF9BuRd0INwaAp9ISDRzx0dI3H8zT8wZKPYd+TrF/Wn4dvJ8JHYGrqXIo
	3C/yrIWUC65J6v8K/LhSee6J1w95rvPFWgKv/+dWWo1SvNPExcq9I9XtoyiWSH3RbLrxRrWeu9LuL
	OP9prwuzlXTXTWk+AhsqRD3zs7mlvr3fRmOMjS4lMt8wOaubgjvP9B7fF1+PKflpqBQQPvs2Aqofu
	VnQkag7NHLZAQnFyjqVWSL5O4NDNaBHxRD0EJJAZr59sTZGe/ou1D0eNAPqWk6ZUwhcsOp3cuGg1O
	EQkvOR0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twkmS-00000003fYS-2CQB;
	Mon, 24 Mar 2025 16:36:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkgm-00000003eRz-2zgN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 16:30:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso40069645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 09:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742833811; x=1743438611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MydIHs3qFCXYHM7b0s9l0s9CjimN0OE0vCb1xP0k2Sk=;
        b=Q27gj2MHQISjWANRme6rA4kir7UidI3qw/CfWavWJJxSpEFnx732Vqc1P5tDwDJxb4
         4GEP2p+jTlsoLpvLecPD/PuXYOuoRBXpG5RuJ5n/rgETi9QV2jzj+JX8itp4zKYoWfjq
         R7Oc2F69VEkTPU4+6IAMW6afunOCxlRSlW0BBF/kUkdtzAzlcFChfDwK1ugOHbLS8+g6
         u5oNUq+SctCI4IGokjEMAIz+FJbqmg8HfQb4ldyq+jDPJ8674dZvHYMwvJ9DiKKj55yv
         vYKF/vALH6T+lKkCLXo16zSV5lFO7dX/omcxGZ8ugiH0AWsCc+82DikqjMtU1K4cHwMY
         bV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742833811; x=1743438611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MydIHs3qFCXYHM7b0s9l0s9CjimN0OE0vCb1xP0k2Sk=;
        b=dVu+Ja+qCCsby/3La+JGLNQzhKz9ZHEGNWBEnJCVDpR2U//75LrKF7h1TRYEkbqIrS
         evjvxtdvbZJFXbGqVWssTufhqj5/AfqC4O5lJDiWLqm9D5N0ml7HjOuu31ziTMWfrfrR
         X76/LJuwBErBkaZYsZCfg3SK01g1FT1RaSz1eROdATdBY1i2HzpXArOoJfeObNma5UCK
         iVLpLSJ+XHMiG6/b2zax0FFvVYbFjQprjYglOTZ6iy1RIeWPHeeVA/TQ/XJkVQ4glgzF
         mI1aWx/B1zukqRkKijt/TFSsqeLFVK+hExtgwUDxgzTstvBUy0pxBwTzjVbf2VemszI4
         4ubA==
X-Forwarded-Encrypted: i=1; AJvYcCWNuTerlxFtULCXzi8TRSM70CR80AIXfHxPQmx5u4UGinZWPQeUAXSvLmjLTnRez+dDG4sG+mCMxsUz9ENDSchR@lists.infradead.org
X-Gm-Message-State: AOJu0YxMC28nDr6jIAMtPekme+9C0L2aFKJ8TtFL+EDaWWxZM+F8lm9Y
	UmtldO8VPMvbfWCrb+cTtO4XuI+IYgUOn6YcEHTkbvFnm0L+8Azq
X-Gm-Gg: ASbGnctJj1CFjvBWrP30oHxex46n/kD4YrH8bOQF53XoE721QsC7R50na4IrLkiJnNY
	25fa3rHhA2QiraaN8qPcAxq7wf/EkYbfFJTKu7UpKsSIB+3kLlZB5N5d3KT3e1wOSSLvSOv/bDn
	4TXU29a7bLlizgK+pTgfOxDzrndX2UWzRM5AqqvXJEaBj2FqK3CNG8jNrJ6Bi9O+5y6GK9JNgt+
	xv3aTvOiMd0I/hmumuyTZN7SNPX1f8e9/SXRDctEk7qGoFW7jU+dKZVQxuOc5DM1dXMcgbNxdGk
	vsyOJ3+HWVtI1bT0rch8p/pTPMpn10qnCk5DXq9y2taIsKIrwL0Jrr70EASxsoXmU+qPFseXpCW
	h0ehI2S4=
X-Google-Smtp-Source: AGHT+IGxi6nV2n7varj0qhe6d2tnIqqhV16RoNl0Qc8fSY/LOPv+JoBGfDdaLR/jA9RX2SzmSWv2Dg==
X-Received: by 2002:a05:600c:5849:b0:43c:f81d:f with SMTP id 5b1f17b1804b1-43d52a2068emr83255765e9.8.1742833810655;
        Mon, 24 Mar 2025 09:30:10 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdb0669sm124106765e9.34.2025.03.24.09.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:30:10 -0700 (PDT)
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
Subject: [PATCH v3 1/5] dt-bindings: bus: add documentation for the IMX AIPSTZ bridge
Date: Mon, 24 Mar 2025 12:25:52 -0400
Message-Id: <20250324162556.30972-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
References: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_093012_770213_07F8B42B 
X-CRM114-Status: GOOD (  15.27  )
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
 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml

diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
new file mode 100644
index 000000000000..c0427dfcdaca
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Secure AHB to IP Slave bus (AIPSTZ) bridge
+
+description:
+  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters
+  issuing transactions to IP Slave peripherals. Additionally, this module
+  offers access control configurations meant to restrict which peripherals
+  a master can access.
+
+maintainers:
+  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8mp-aipstz
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: bus
+      - const: ac
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
+    const: 0
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
+  - reg-names
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
+    bus@30c00000 {
+        compatible = "fsl,imx8mp-aipstz";
+        reg = <0x30c00000 0x400000>, <0x30df0000 0x10000>;
+        reg-names = "bus", "ac";
+        power-domains = <&pgc_audio>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        #access-controller-cells = <0>;
+        ranges;
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



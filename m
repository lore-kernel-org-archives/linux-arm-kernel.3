Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C61C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 17:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AATmeIywhPXpmS9/RGfjUbh+83T1nTe0P9ZqfpWyPjs=; b=eNaIVDjfehS/9WlCQBn4W1jiPx
	Pp7PPz78YS9sWe1Dl7fK3qhmzdkgjpx/m35BBfgOeDtx3WHk8N+0c5igHrLem4ryEq1vnSkvgLldW
	C/Yz2Zzcq8VASd6nxtwWsD6FtXLM766DhHXSSJpALwy8uRbVncAB+o0Hmgnl18T322kRrTXKp8lrI
	s7Mo0ajLIhE7Gr2AGt8NgylQp1or2e9s+jy0WLPy5cUew2IrpgWw5sy1pjoQNTagftrTFxKCD0nzC
	cAfxsbBL4sjYohWyZufE4uHAkxWanH/Yk7WjyWbuGSc1EVWF9YbdXZzzouQHvRBQ1r/anktTiyXjp
	9q1lf0qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMm4-000000016If-3u4M;
	Tue, 04 Feb 2025 17:31:48 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMjS-000000015tr-3ce4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 17:29:07 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5dccc90a52eso1310766a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 09:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738690145; x=1739294945; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AATmeIywhPXpmS9/RGfjUbh+83T1nTe0P9ZqfpWyPjs=;
        b=Brq9rIPLoO6I2jo5ONIv7XiH0qGhksx8giU/PCFtHt06xdFh1zphrmFE+Yddzf3Kr7
         m19sHXIzn9ERBNJVhbM1zzU/vnqLugGfBSUinUy1QWiJk71zHMZEGYdKwoZ6+JM6TaI8
         nsorPf0v/pu3YJLpHGRvclG3zj1LlO85I98oyBtJvYSxDoXu+mXrPSfZRBRYj0W02oOa
         CzPFCbHJR6CIzBY0MwH63W09y40f4SahUzkVTcgR8Q4ixJSA/g2W3BC4IenoymJja0QN
         AIIT1WfCkNM2cN4zb+zpnY5p6I3hQ5OGqu3eQr1IA8pbqTMLnmUgizIzh77DDASWNV8x
         DlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690145; x=1739294945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AATmeIywhPXpmS9/RGfjUbh+83T1nTe0P9ZqfpWyPjs=;
        b=s64myb91NUPCYWrPgumF7L1y9KuI5hzih9zVqYl/VCEQEXHhB9OUCl0gUSAeSlPPca
         81+CXqidxE9ChUJnSalwU34mkZ7HFnO0mVhGDRkYqiAj+XNxOv6WqAAKqGzrHq44UKZX
         jk/ALW+tebfmeSXmDmrSVrFkkIGaHfxRQuitopkUNiB+vWQHHzIb4Jvj1z2yxvAWKrZL
         6e6F8acBX7rjVo/7Cs5dH+iXw/QO/3XyMIFC9mpFq8rk0L/V3XF+LGkUavRGOjpNa1V8
         ikz4H6jaoOCt8qfyWezNncFV1eOipqJYBcKMy8p/gWR5kV69YUGVu0iL3u7CjGnTS/cS
         nX2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBNWlLxZIRFYyOb3nCeWkh75E+QSU/nPC3NND80bnzqIlhSakHd61oQ3c6uYCG0EwU8tIM1TIBBBSI6X7HcqbO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9SohpOMjyGvvxPzSjmpoS/Tk1dRQ/zkG9495RF/Ap7FPWb0w4
	BR00fkJhB+EsajaIV6RD/lzm3uwO5635WXngWiLqnLQnYKSq6EkF
X-Gm-Gg: ASbGncvbZHkhtFqO7fcHM5FtBf0DEgaP+yEc4eZ6EzR2CqDVM22mRehWqKCh8MHrib4
	8+4GqCCZF2joqDcrqlhb5a0hWCrPvSekGnzsMYOQ3f/NqnEc8MJ9qdKQJR6iLTI0CrvlO9es5r7
	h+H75//JrGHg0A9uf6MuTSJTbACHLRg3tsIyFc5Frn8kJeqeMn7UbaboV58oSaW7KPjHADusjvm
	rGO9WFGQ7DQDzVmgUQKQ63WTXiRtZ+MDitpYKQpMSjgv6wJGfEl8IyugEoOyiIXjNp/D6qNl2kl
	OS8EeY/6esZYx63pSoCsTUy+wGj2ddlO1CrSvVmd3d+6B3ROFmVz+YztPxrMHn21vN4=
X-Google-Smtp-Source: AGHT+IGrzVxahP7DJr8b9Lq1TbMOwGVsIuh1CHgdVq3igCl7cQiGRsBdPj1QOc6BEt4QbwZNmPprjw==
X-Received: by 2002:a05:6402:3585:b0:5dc:cc90:a384 with SMTP id 4fb4d7f45d1cf-5dccc90a699mr2303236a12.22.1738690144629;
        Tue, 04 Feb 2025 09:29:04 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd3156ec7sm664981a12.67.2025.02.04.09.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:29:04 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/4] dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
Date: Tue,  4 Feb 2025 19:28:00 +0200
Message-ID: <20250204172803.3425496-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_092906_905707_B20F12D6 
X-CRM114-Status: GOOD (  21.34  )
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

Add new constants for choosing the additional USIv1 configuration modes
in device tree. Those are further used in the USI driver to figure out
which value to write into SW_CONF register. Modify the current USI IP-core
bindings to include information about USIv1 and a compatible for
exynos8895.

In the original bindings commit, protocol mode definitions were named
with the version of the supported USI (in this case, V2) with the idea of
leaving enough room in the future for other versions of this block. This,
however, is not how the modes should be modelled. The modes are not
version specific and you should not be able to tell USI which version of
a mode to use - that has to be handled in the driver - thus encoding this
information in the binding is meaningless. Only one constant per mode is
needed, so while we're at it, add new constants with the prefix USI_MODE
and mark the old ones as depracated.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soc/samsung/exynos-usi.yaml      | 99 ++++++++++++-------
 include/dt-bindings/soc/samsung,exynos-usi.h  | 17 +++-
 2 files changed, 79 insertions(+), 37 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 5b046932f..f711e23c0 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -11,11 +11,21 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 description: |
-  USI IP-core provides selectable serial protocol (UART, SPI or High-Speed I2C).
-  USI shares almost all internal circuits within each protocol, so only one
-  protocol can be chosen at a time. USI is modeled as a node with zero or more
-  child nodes, each representing a serial sub-node device. The mode setting
-  selects which particular function will be used.
+  The USI IP-core provides configurable support for serial protocols, enabling
+  different serial communication modes depending on the version.
+
+  In USIv1, configurations are available to enable either one or two protocols
+  simultaneously in select combinations - High-Speed I2C0, High-Speed
+  I2C1, SPI, UART, High-Speed I2C0 and I2C1 or both High-Speed
+  I2C1 and UART.
+
+  In USIv2, only one protocol can be active at a time, either UART, SPI, or
+  High-Speed I2C.
+
+  The USI core shares internal circuits across protocols, meaning only the
+  selected configuration is active at any given time. USI is modeled as a node
+  with zero or more child nodes, each representing a serial sub-node device. The
+  mode setting selects which particular function will be used.
 
 properties:
   $nodename:
@@ -31,6 +41,7 @@ properties:
           - const: samsung,exynos850-usi
       - enum:
           - samsung,exynos850-usi
+          - samsung,exynos8895-usi
 
   reg:
     maxItems: 1
@@ -64,7 +75,7 @@ properties:
 
   samsung,mode:
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3]
+    enum: [0, 1, 2, 3, 4, 5, 6]
     description:
       Selects USI function (which serial protocol to use). Refer to
       <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
@@ -101,37 +112,59 @@ required:
   - samsung,sysreg
   - samsung,mode
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - samsung,exynos850-usi
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos850-usi
+
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        clocks:
+          items:
+            - description: Bus (APB) clock
+            - description: Operating clock for UART/SPI/I2C protocol
+
+        clock-names:
+          maxItems: 2
+
+        samsung,mode:
+          enum: [0, 1, 2, 3]
+
+      required:
+        - reg
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos8895-usi
 
-then:
-  properties:
-    reg:
-      maxItems: 1
+    then:
+      properties:
+        reg: false
 
-    clocks:
-      items:
-        - description: Bus (APB) clock
-        - description: Operating clock for UART/SPI/I2C protocol
+        clocks:
+          items:
+            - description: Bus (APB) clock
+            - description: Operating clock for UART/SPI protocol
 
-    clock-names:
-      maxItems: 2
+        clock-names:
+          maxItems: 2
 
-  required:
-    - reg
-    - clocks
-    - clock-names
+        samsung,clkreq-on: false
 
-else:
-  properties:
-    reg: false
-    clocks: false
-    clock-names: false
-    samsung,clkreq-on: false
+      required:
+        - clocks
+        - clock-names
 
 additionalProperties: false
 
@@ -144,7 +177,7 @@ examples:
         compatible = "samsung,exynos850-usi";
         reg = <0x138200c0 0x20>;
         samsung,sysreg = <&sysreg_peri 0x1010>;
-        samsung,mode = <USI_V2_UART>;
+        samsung,mode = <USI_MODE_UART>;
         samsung,clkreq-on; /* needed for UART mode */
         #address-cells = <1>;
         #size-cells = <1>;
diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
index a01af169d..b46de214d 100644
--- a/include/dt-bindings/soc/samsung,exynos-usi.h
+++ b/include/dt-bindings/soc/samsung,exynos-usi.h
@@ -9,9 +9,18 @@
 #ifndef __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
 #define __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
 
-#define USI_V2_NONE		0
-#define USI_V2_UART		1
-#define USI_V2_SPI		2
-#define USI_V2_I2C		3
+#define USI_MODE_NONE		0
+#define USI_MODE_UART		1
+#define USI_MODE_SPI		2
+#define USI_MODE_I2C		3
+#define USI_MODE_I2C1		4
+#define USI_MODE_I2C0_1		5
+#define USI_MODE_UART_I2C1	6
+
+/* Deprecated */
+#define USI_V2_NONE		USI_MODE_NONE
+#define USI_V2_UART		USI_MODE_UART
+#define USI_V2_SPI		USI_MODE_SPI
+#define USI_V2_I2C		USI_MODE_I2C
 
 #endif /* __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H */
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75C3E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 09:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AATmeIywhPXpmS9/RGfjUbh+83T1nTe0P9ZqfpWyPjs=; b=4ryBMrkeP9VaBE/Qh3oCwz8DgO
	Ng1tfWbE6bW0PQmE/2K+bvcuO+neJBS3GSUk/xL0FJjafxdBczlrapl7JU3+oUQI2O5DwkhowYv6M
	awgqQi+gxZjXmNOlhu05siP2zrPVtynv+PvHBZSAzRBNdmsjBufWE40x8GMgwuJUc1K8Oh/0XWugz
	NBY7qADPCwiVQFAW9ooHL5jDnNQdEzwijkTPzBNmtA2KteqJZlr/Vrwf9QdvvoopDPTdk5YiJN+wC
	ziq1+f2zlspvLXNFjqorlt4THjP7iiaFf6N6OhXpmLD3enRqScrjvGsy+jmH1x3GOzMc1lKxwKjaG
	aAUevdPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoUr-0000000BGpN-4B8D;
	Thu, 09 Jan 2025 09:06:34 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoSS-0000000BGIs-0cdW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 09:04:05 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so330061f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 01:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736413441; x=1737018241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AATmeIywhPXpmS9/RGfjUbh+83T1nTe0P9ZqfpWyPjs=;
        b=kkRE4AyF9PyUd6s4zR9+h+FD73TRTH0452h0oXzFS3ca5P6khs8kYp6txtOJVyfBTZ
         ndIW0wV+PfzQxGT4OSe95EDo8xe+6t/zoRouRiwMnFF2OBre06Q49oaCXKB41yDRK0GL
         cQuw8FdUDHRYtekD9y1+AdoDSKw0RaHmMnAOwGKEjLhF9K2TGbYCz3jR+AogQZGk0CRB
         xnmrimERiAi+v0kY4l7o/BaqEHMyxMaQCztImlNCEpKUaJUdTYOyFsEgBKxJK9r0IlPc
         U6ujf/mjbqVG8ITfx3sGf4Opoo312owuVGzFdq2dtWutays5iidtSS+FcZnHfU5rehJu
         irsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413441; x=1737018241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AATmeIywhPXpmS9/RGfjUbh+83T1nTe0P9ZqfpWyPjs=;
        b=vez7LqNKkfx7AVHHEVEElcmoKw27K4jWYT1QKEW7XCDBTjBvQLOjn3e/G0B0RzCJwb
         AVu/UpbqaYu0dB22QZHH1Py60mHkgVcWaTiqdD/K2I/pLjMyjaYT9UriEsVd2L6MYm9j
         tnyutMcYVLBmh+SmvvwjXRrfuAokDuRZsfbSc1G49rCf6LubeprHRWXsmFsKHGagdM2O
         FhG0zdK/jwKFjGyxvRBjQNQbyJqG+/r8ORBOPYQhoTZlbdjfehtmfnYbXot0W1nyG2HK
         eBZo9xTAdUEGt8xnXXy1oMqByvAgH5+0+3hbu0zjyRajqAQ9d84FYYZzDPCgwCN7QGwZ
         hSiA==
X-Forwarded-Encrypted: i=1; AJvYcCVer31awUg0erzbU/gS/yiwamTMZXTKLsotiQFP11qJ26iAAGCSdPz/3vKn3ZaQuY0ysMTJ5fk16UDP6TgnTo3n@lists.infradead.org
X-Gm-Message-State: AOJu0YzItkoRNcT1MdqGRah27DWCOVIz4FgvmPYToCPK9Y+ux7GNFTRt
	yQ1A+q+gUVuwMgR/l2g8vYwLOng+a5PhH46qHggMa5Y1QYTUsqpEiycUbg==
X-Gm-Gg: ASbGncuvvEgzZG+ZfIts8O2Ccdl9c6gkFm2ulD2+3wG2Xk8CmBOEeqYb22w4r4CZ178
	x0VkrMEs7ve89iKjMBLQuMfzKz1U0UaFMNTjy/zSLgcmcp82D+1pCzJyf2wWoK/h3BeaOPJ21aG
	S2JQbWr7gWvF16iREM8Kb/bMZ1bViACw0NWpaV21wJHfF3mhRW1SsNbopa/qhBF6ScK04KuARsn
	3HkLh0EvFszgRhOdPmnlAyqvANOltti52yPx9+juq/Y8LOGJ5SHeU3HF+bCGsgpzWBsrIgk+65V
	gvAjTQ/utQhrYGpHMys=
X-Google-Smtp-Source: AGHT+IGFcxivxoUtzo1x5HYX/6VWt8bW7xU3madFDp/wdFgOZ+AOfuU+UH/x3Sf7sd06GFipOX9rPQ==
X-Received: by 2002:a05:6000:1f88:b0:38a:615c:8223 with SMTP id ffacd0b85a97d-38a872f69c7mr5075223f8f.10.1736413440930;
        Thu, 09 Jan 2025 01:04:00 -0800 (PST)
Received: from ivaylo-T580.. (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80b2sm1196692f8f.80.2025.01.09.01.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 01:04:00 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
Date: Thu,  9 Jan 2025 11:03:22 +0200
Message-ID: <20250109090325.595475-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_010404_202245_C2886635 
X-CRM114-Status: GOOD (  20.63  )
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



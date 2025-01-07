Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04552E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8l0lOskXYvZhwje4aevchT16Y0VLUST6xZHj4lRq9c=; b=FSa/ZUg2pQDD3ahxMmxgZkGeZ3
	sjsG3IiKNdluoIg34nKM2ZshY6i3kVorgfKXvcluxnsQKVpXcYNMNoJzX+hF5sMs6qoA4BJwdm1tN
	sjqipF8uqyCaA5raI1Iu/7BlrTi96L9EBc9mfUiq9U0hbYzkbwj27PboX3UffxD4rMbY7KFNBbq7U
	GxB0I/1nW8g5+eBrCo2kZOq0M4nauF2evzCUyf/4D+Tvf7gHu/qGsCsnICFmQC9Du7OXQNkymsI/5
	1X5xOyygLg6BLYB8kSArdoG0oDygKddAT+s/0LoRbTCDW0AS01PiUWh9CVJ4Je7DlCWzd7fEUJLbi
	QsF9wDpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV84z-00000004dGM-3qPl;
	Tue, 07 Jan 2025 11:49:01 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7ro-00000004a2H-2O5l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:35:26 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d3f28a4fccso24471415a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 03:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736249723; x=1736854523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8l0lOskXYvZhwje4aevchT16Y0VLUST6xZHj4lRq9c=;
        b=O9fxSpBmOUOVVxwV0zgujo4CBPmK/aFsAADeBs6M2bdAQRYBzAVL1WIWvLmI1kdxyR
         y48VbmNbym9ifwGGGB/2F10Ep2Gm/bBWXtVCFGCKQZ3OF+6vHCWVtP83epWiQdeadnyC
         eVR52X/Do4x8kVhk4V/mJHEhmRUdvKI4kQwqSwITd2HzSp+N+/tlDsNXTCNBozgaJtWG
         WAGqaa3GMi8RmHe25Y0su4vwwAZsrVHZDUwR0FBjt+u1JXckO5X+v9iPdutsr/SvFY0d
         fgoOLM3uMs7ZRWCSiOZmhf4UJWW2V8xz4gyI2Q9U36VI6MbI8XJ9SWVoFXrQbfDGBlf+
         waiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249723; x=1736854523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8l0lOskXYvZhwje4aevchT16Y0VLUST6xZHj4lRq9c=;
        b=UdMpzaW0Lrp8sD9Gm4VYUbk4+jeOSIoXtmPDfxAPNPl3z2at6nxnBkWUUzoNkEM5PO
         No/nZSav8WX5nnDZCl46wutSkBy26iDAa317ouBLryQmBLBiHZDE7x69ka6u2TUVRf9c
         5AB+cQ8nnKU2+BvhNirPqRXWdP9pLPIVBASmshWRFHk66YKcWzH0YHc8CtsidV3N8m8M
         1cCtlD1B0rknoFvPD2tig5dJ6OxyV3dp3l3vTL6tjcOMkgQiOgzroR5CWG2yWk6Pr82H
         q+Ln5hirupo3KGiAKAoOSSEVkLS1pT+36rQBF0CzEUQ/0yctbM11ffDYKTXOedVNMdMf
         zSag==
X-Forwarded-Encrypted: i=1; AJvYcCUNlE1xqPgjcE167l8L0iz8YxSAFay924kniFI53Hl+04xb7744eBJPgJg3YwNLnJ/LPqwLgzyeVwtSBsCz7ret@lists.infradead.org
X-Gm-Message-State: AOJu0YwTdwHd64TTb6afhGbCWKI8/9cLgrzEJ0CTbZWzqEAOlt2Nqhn6
	BYOzJ85ybSNy8+6gYpbCecdLsclM4qBeVfgxdw7uRbrGdp/BJZI2
X-Gm-Gg: ASbGnctJ4yXfaqFiNVOzdRqyaTO3ku8Wx2BWWaNHahXiXwffR5SqkfDlwh/fCdGDmZd
	K/Zqd6hYYcgb3NSRvwiwMAveZMDFjAWPmsByXclU4dT7VwDtO2EGXVi1qK02ZxbDd39dRHoqwQ1
	X97Ss3vnB6xWAlHafNEuIwu9rIWE2epfAgT+tV8MAQa3K1pxp5Yp2CqEAYlofOh/OANu8c1sVZL
	k5QyGesiuU/pDoaybjBXDi8VF7dmuibwQYyIdZCu/Dj5c8LxKTwXWTNzao/gSIFo2DkrGSjot6q
	8V6Tk0pFs0KIbbMfmDk=
X-Google-Smtp-Source: AGHT+IEQNVJXbjqos32/nr9HWQMe4iYnDroXJnubL8R3OqgmfEPFZNOLrL9ZLnrbyQqCbOVCn9nbdQ==
X-Received: by 2002:a05:6402:26c3:b0:5d6:37e9:8a93 with SMTP id 4fb4d7f45d1cf-5d81dd5e95amr54322382a12.2.1736249722832;
        Tue, 07 Jan 2025 03:35:22 -0800 (PST)
Received: from ivaylo-T580.. (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f23bsm24881055a12.32.2025.01.07.03.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:35:22 -0800 (PST)
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
Subject: [PATCH v4 1/3] dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
Date: Tue,  7 Jan 2025 13:35:10 +0200
Message-ID: <20250107113512.525001-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107113512.525001-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250107113512.525001-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_033524_608167_BCCF7D6B 
X-CRM114-Status: GOOD (  21.17  )
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



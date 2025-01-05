Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23258E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 16:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qmVtOSWHhzGJr0Y+kskR/DrB7xFafm0zcJLu2D6JbQ=; b=26YI3v868xs7H5E2YXCsiHMaz2
	ga/BwGJy3M/AmP+FI9gSGh4tlpWkeLx+Lj30ni3hg1n7zP20J/EMy/KDCh8b8MMYNP7AOXtQ3ym0T
	7EXo112+ooaFqMeazThPeEUplhEkfPt8qkWzMZ5KAJDsHaOGmfFBrnc/zktTulxoDYq2Gda3bmkTc
	H/mGmRZq9eHzDanwp036s0U//6Rs1F7jO1FEXfjpfpzd+nswyuao3CNsUyOnqHdItEcW20J3J4kE8
	OS0qfaSOl1zKc/YBwZXDGaPu5TT5mpfqBIGq/Vh8m3zqUq1o489z6FuM6u+HuOZp+E7H7ovQQcrlp
	HkULhEdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUT9z-0000000H2r6-0GAU;
	Sun, 05 Jan 2025 16:07:27 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUT6Y-0000000H2H9-1lBt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 16:03:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43634b570c1so97511465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 08:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736093033; x=1736697833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qmVtOSWHhzGJr0Y+kskR/DrB7xFafm0zcJLu2D6JbQ=;
        b=MFsQUt9mAMjjljbV0dqBnyKdH1vbnFfrkHG8KxMDLa8FHKqdMq1h2fPi0jXA53j+wF
         Xeuk8JmQyO13Xk4Sl6/6yaR/vwD5D5dvf6WtxqN+Zez+1kff3n4L/vTE6xJk0bDpMlt0
         WDqssYRRHd4TV10NXkOGP+1JJ6NrFwQBc1d78PGJgBjjnwiJvhgO74639nqqS5TwLzTh
         YvnaUGN5tw8qJmWoCD/iotAdJacd9Mhg0H9OEPiqy/GP1rSIaijfSoEXxw+fCicbD+Lp
         o3exHqJafUU8HaT8I9/2Lr9DsWUkQUQe+sHW9tsT7qtBDaV12SwN0GoojZzLHA3TzQzh
         W55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736093033; x=1736697833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qmVtOSWHhzGJr0Y+kskR/DrB7xFafm0zcJLu2D6JbQ=;
        b=Yb1mUM/Ho0qtWC4FinXMFVS3cQ6F+egGv3hbbKgnDOIbyG6NvWJHARlDhtQOZ6FKNO
         Mibe6lbLwXGc+vKM5crihwlOwOAIV/kdM7vQRF17+WwV18lpUWoXNypyq2sgF9vawUtP
         AmasXynoXoMdYd9n5qpXplEEFkzSkAi73dl532txy8pkdlWwtk5lXi0dtERuTT+GH/mi
         1JLk1GPacEZfn984dxIRmholE57by5+rHBd+ZMg7UinSafxfZaJo6YALPwj4LehfIliu
         DBm4/GTKFu/OLPiTe6815R3IXPVs4gnqocW0n5mkvF8LCKGSzsOoNesNt9rpQnLv4EuO
         /kuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsjdCtbbd4X7eNYxHpDOiDB9u3DXXj47eLKs7uHeOEcUTJS0yCDDdwmCihl3ple6gk/bu/YyeFewXpGlHKymkb@lists.infradead.org
X-Gm-Message-State: AOJu0YzN5V/45hP6Qda4+nDc+oIAxbG0Z8nTI5cU7Pe5yud7o7XF37bs
	zFleUiiKrbYN5cWmNDIww3qYBQ7IfOrZrDZ3ySe7bDOf4LPr6W4a
X-Gm-Gg: ASbGncsKRrwAE/mt2UZsYa2p6N3+ovjSE8t+0y1WGomfZst3ADOIVmpZ9vtkIFKPX4c
	j65Q6mstg2TqJJmDlv5zvV82eDHsGanOz76hylmA3o71qFsdEje0rbV8480uPdY24wmOA3eobQR
	9mc9U8F+jYx4fmbPsYZ87+3XPlwaK8rP4LUtCPaFKsPj5kB3WfJqFuB0+Vhb45+IK1/DNDqRsb0
	FIwgrkef7eY7d/n1p0FW3q6LgSerMyp5NJK/jXjbtrtpo3FHfdILTnxJWjof70y0BccHRQ=
X-Google-Smtp-Source: AGHT+IFnesuVVc1Uo46pHvm1AMDioiW9JV4G2NuilRchcYuXNT+MCnGq1an3lKmkDQATX33mCMAZIQ==
X-Received: by 2002:a05:600c:198c:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-43668b5e045mr422215915e9.24.1736093032346;
        Sun, 05 Jan 2025 08:03:52 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm46031925f8f.44.2025.01.05.08.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 08:03:51 -0800 (PST)
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
Subject: [PATCH v3 2/4] dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
Date: Sun,  5 Jan 2025 18:03:44 +0200
Message-ID: <20250105160346.418829-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_080354_459190_C51D6CF3 
X-CRM114-Status: GOOD (  15.94  )
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

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/soc/samsung/exynos-usi.yaml      | 107 ++++++++++++------
 include/dt-bindings/soc/samsung,exynos-usi.h  |   3 +
 2 files changed, 74 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index cc92a06a3..d6c39c3e3 100644
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
@@ -64,7 +74,7 @@ properties:
 
   samsung,mode:
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3]
+    enum: [0, 1, 2, 3, 4, 5, 6]
     description:
       Selects USI function (which serial protocol to use). Refer to
       <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
@@ -101,37 +111,62 @@ required:
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
+              - google,gs101-usi
+              - samsung,exynos850-usi
+              - samsung,exynosautov9-usi
+              - samsung,exynosautov920-usi
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
+
+    then:
+      properties:
+        reg: false
+
+        clocks:
+          items:
+            - description: Bus (APB) clock
+            - description: Operating clock for UART/SPI protocol
+
+        clock-names:
+          maxItems: 2
+
+        samsung,clkreq-on: false
 
-then:
-  properties:
-    reg:
-      maxItems: 1
-
-    clocks:
-      items:
-        - description: Bus (APB) clock
-        - description: Operating clock for UART/SPI/I2C protocol
-
-    clock-names:
-      maxItems: 2
-
-  required:
-    - reg
-    - clocks
-    - clock-names
-
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
 
diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
index b7c1406f3..aab28176c 100644
--- a/include/dt-bindings/soc/samsung,exynos-usi.h
+++ b/include/dt-bindings/soc/samsung,exynos-usi.h
@@ -13,5 +13,8 @@
 #define USI_MODE_UART		1
 #define USI_MODE_SPI		2
 #define USI_MODE_I2C		3
+#define USI_MODE_I2C1		4
+#define USI_MODE_I2C0_1		5
+#define USI_MODE_UART_I2C1	6
 
 #endif /* __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H */
-- 
2.43.0



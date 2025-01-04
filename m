Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0934BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 16:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfGLfZYLKNWeiwn293mIzstgMi7rArSmekfdXqxMqP8=; b=VKXJ9vpxgdBHq6S0t9t3Jx5S2p
	S+KNQe5OzhfGCImlPyTeh/bKTZjlNYuEyc+gv7qkMyeF/rvYq5MiKYKvd8aBoeuTWpJYZhllH2d+H
	rqW8tHFWEx1e9cCO8eVTMPoGEI3LyJDBpz6JBxZk4ItfayxggOrQaXReyvpVoG6vXWJUDlBAuPzXY
	ZhKg5LxIK3C5W6EFWUWZTYFahhSU9BV79upzUZp0sWW4mX9qzZL7r7bI2CgMfB6lIqA8pUNJQQMrP
	TBlfNHFVeIE+3qzTkjAZrmVGKKme5VJBUmRhUAtwJ7m0oSxn7zlYLMEqXkfd7TnHyvdMLvYxZzWRw
	3dVFD6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU753-0000000FHD8-1uAX;
	Sat, 04 Jan 2025 16:32:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU71f-0000000FGqO-2c5e
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 16:29:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43623f0c574so89566485e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 08:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736008162; x=1736612962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfGLfZYLKNWeiwn293mIzstgMi7rArSmekfdXqxMqP8=;
        b=HoPhaqz1ACA45BAPdVz9ORPRyE8L8SL2kzby79TmdlCSFwhW93WcMBvrf4wagdD6QE
         gE1qRh2NWULR5nqNtgLg9yENjEehbusDKRsTwq8Pg71C0Ui4XDKhhJMDys2ZtDBwfsgY
         kNbNyYNsN/oK/juQO4vgMmK5Bae28KrOmaSdLhwYGQ5GAyRHKmV+f/DKpBhHyiXiK9bc
         5PfFWM0b5aKL61HspwKGj7Urlz+9inTkkMDKZJ29BaWy4o7dIugE0NtLjh7l8qimVrBU
         22ywfZJcbgre9dHZ9js//kWxOa4PtihPWGIN2iGbjwoIoYHKBDwzcm1VJdwA5f0sFztA
         pWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736008162; x=1736612962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfGLfZYLKNWeiwn293mIzstgMi7rArSmekfdXqxMqP8=;
        b=ALdEREhIc0xGwmGv6vtCcdsffYI7o3mkbC4yF71DvI2uaB/kyr+BubgDr0B7ChShGF
         OJb3dXwLKbpHq/qrCHxVles/LunlbZzzpUaLXNJVVjbPAoWkwFICqSrDeuOyGwsImqbP
         Qt0FEDhYgHxciZ4eo+XZsk7HYy9jSt1eq+aK+s9uAS7tuv64pV9q0hkIllLBHkabvN51
         WmG21b4f/4NnSRMLmb9bv7d0EA5nq1kndprMxR28MbF/7Q9UZBnm0cx9GUircay+9ZVQ
         feMxbonGivKFcJMCEHvKTpts2Ry4yKT8PnIuUuZw6zfVx9WVEExgAj4/ZtKspb7T5Yj3
         33MA==
X-Forwarded-Encrypted: i=1; AJvYcCUD9YPUc65KZbp4KImAqXX4KPnI0w4lCC1gSPdouaF7ETm8TT8Ceue+ReoRmhPPcvxM3FSnnbrVDS3XxjB2e4zx@lists.infradead.org
X-Gm-Message-State: AOJu0YxaqA4Lydahj4qa5XoNAGPhPt4Fe+KFMH0jY32jDL2D1e10DpvH
	vXBg0gKlYF8dzw7d23e3djqlmxmUmcre4pPouYZxYzaGOqSKKaxy49SjNQ==
X-Gm-Gg: ASbGncsTeXzw9uo7cK5IvYm+t9g5yrzkqGJh4ZzI7ZpB1AONv/3PDeXtqPaL/WWkDDD
	2/CR7FpGhNb3oadtb1o+W6SVjrhFDXSTbjPtDdZNIdbJMMD2VJk4hA3o12VNzsy362OBqZc5thi
	Y3wW5K4ivp2rjau62mYm9oXuvrHzML1vTYqQHeKYOYKMyGysw69DffnxBJsLMmLiEwbq4NuPfb5
	q5By2nTZT1yh3/e/DX9ThEWdQiwXskX3BPU/1Iv231jAr5tPsHf7SYQHryrPRsYX3Aaj88=
X-Google-Smtp-Source: AGHT+IH07GBjjt9BqWjOYTGsRV1i6VjGwkhH7oHXvw9cMBRKIIt1LWtpsbwakdr5+eFk7uWUpTXDmQ==
X-Received: by 2002:a05:600c:4f94:b0:434:f953:efb with SMTP id 5b1f17b1804b1-43668b785d2mr394969645e9.32.1736008161587;
        Sat, 04 Jan 2025 08:29:21 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4fcsm522807895e9.29.2025.01.04.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 08:29:20 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
Date: Sat,  4 Jan 2025 18:29:14 +0200
Message-ID: <20250104162915.332005-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_082923_661108_4FA21742 
X-CRM114-Status: GOOD (  16.21  )
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

Add constants for choosing USIv1 configuration mode in device tree.
Those are further used in the USI driver to figure out which value to
write into SW_CONF register. Modify the current USI IP-core
bindings to include information about USIv1 and a compatible for
exynos8895.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/soc/samsung/exynos-usi.yaml      | 55 +++++++++++++++----
 include/dt-bindings/soc/samsung,exynos-usi.h  |  7 +++
 2 files changed, 50 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 5b046932f..6e32daa45 100644
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
@@ -64,7 +75,6 @@ properties:
 
   samsung,mode:
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3]
     description:
       Selects USI function (which serial protocol to use). Refer to
       <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
@@ -101,18 +111,42 @@ required:
   - samsung,sysreg
   - samsung,mode
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos850-usi
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        samsung,mode:
+          enum: [0, 1, 2, 3]
+
+      required:
+        - reg
+
+    else:
+      properties:
+        reg: false
+        samsung,clkreq-on: false
+
+        samsung,mode:
+          enum: [4, 5, 6, 7, 8, 9, 10]
+
 if:
   properties:
     compatible:
       contains:
         enum:
           - samsung,exynos850-usi
+          - samsung,exynos8895-usi
 
 then:
   properties:
-    reg:
-      maxItems: 1
-
     clocks:
       items:
         - description: Bus (APB) clock
@@ -122,16 +156,13 @@ then:
       maxItems: 2
 
   required:
-    - reg
     - clocks
     - clock-names
 
 else:
   properties:
-    reg: false
     clocks: false
     clock-names: false
-    samsung,clkreq-on: false
 
 additionalProperties: false
 
diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
index a01af169d..4c077c9a8 100644
--- a/include/dt-bindings/soc/samsung,exynos-usi.h
+++ b/include/dt-bindings/soc/samsung,exynos-usi.h
@@ -13,5 +13,12 @@
 #define USI_V2_UART		1
 #define USI_V2_SPI		2
 #define USI_V2_I2C		3
+#define USI_V1_NONE		4
+#define USI_V1_I2C0		5
+#define USI_V1_I2C1		6
+#define USI_V1_I2C0_1		7
+#define USI_V1_SPI		8
+#define USI_V1_UART		9
+#define USI_V1_UART_I2C1	10
 
 #endif /* __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H */
-- 
2.43.0



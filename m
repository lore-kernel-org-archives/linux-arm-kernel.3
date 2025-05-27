Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA14C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 22:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdmzyr4RLGil5tA/deRxcfecM4FmkUNEyzf9KUSi9uI=; b=oyohHPyoAZRusGQ5kti0nFdZ6o
	p0ROZaxV/cwH2EMFvYpjq3pcuvD+H1AwPpV9qnvLG0VxgrAQPNdpNFp8Ma3f6vj0G2jBWO8TiWpkb
	nnDQAi396fFGan2BaHb9WqVwkuCnFUweWNQ/fO01FxHA4OYVDEMG6Hnfag+TZm7CWjZY4xnmkoy72
	KluJ+X9SESKgFmYcpjM1Z/88VlHqIiYB1c8iKBDAW3JiFdd08iWSGIX5KMX02MguMirFpiLjTtV0C
	CelwRU+qB6oI5Vq13jg0zzAIZqOmDLpidzRl6gmFXaYSmIT8kLwzC/eFK99WM66mJk+0jsM1kdHBm
	xgO9mrYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK2sA-0000000Bj6O-38KB;
	Tue, 27 May 2025 22:34:14 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK2fd-0000000Bh5g-35uA;
	Tue, 27 May 2025 22:21:19 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a37d24e607so1659962f8f.1;
        Tue, 27 May 2025 15:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748384476; x=1748989276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdmzyr4RLGil5tA/deRxcfecM4FmkUNEyzf9KUSi9uI=;
        b=GQrAoyI1LcclssrIZcLoN6qpiMJWXl2uPngjvwk0dfWfN0hE+bglumKM/g9ojfmggy
         pBjm1IPVsFBsMCW/9TbTvR8sphvA5Ph3f2Ij+rE5kcPXo2jUXmaYW2IysqIgRWEn4rKU
         dqmqiRfdSsxjs/uVuRsaAhL1F4waT98rrDh/w3SxIigpi04tqQY7l3shQh1vqsYGzaNb
         Ot+gi5CUu23dJ7veWv7atD2NESKxCCo2QxZ0QX01Qbf7RQJ07A/IrUJ9AFc8MdAzz0JO
         3WoRrzbb5+RcICZu0HvVO0a3MS4oa48UCO6q13o2Hg7SEkU1Abh3X/Pc08Di8VxQ/jgh
         aOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748384476; x=1748989276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdmzyr4RLGil5tA/deRxcfecM4FmkUNEyzf9KUSi9uI=;
        b=X6ZgTRMPA5N1HZW6GEV/ORbfM7+9GQu0KBqdmODXcK4QGLl1rIN2eMbTq2UrKi1Vi6
         5oTTncdNMOWC8iPKROemSDfrVbFW9bBX63RR97hfOyYljDl8pIAIiMeRdCQGDhi4GRk6
         +uDMewqb8HroKPnWWOAyRI7TAmLHO9ptz6MR8GDo0hz9l8W/eSqZVvs2EJDRSpjZG+5+
         kiXR86IjoDtXQNs/ueBEzOq05qDFWkGH2XjHlTp4s2BSD6gJsbYmf/mxjOQsn4z/bgi1
         vATASenOQq54Ab+7P0jxz1/8RZxNSsg2nhxh4N0BPk+WCeTbWqbVONMuSl853lDF8iNA
         +7JA==
X-Forwarded-Encrypted: i=1; AJvYcCUjbHuyWfnGk1EUMW0yyTZeb+gN2t0A1EdfQCTE9JeISBB0UMl66TPIcq6NJimfGPTZey405cgzDDW63xWTFHws@lists.infradead.org, AJvYcCVMLgRkTW9Lt/HMZJw3IhKanTiJIvFFCB64IEp9sg9tFQh0TD9mejvAoQZQvdZNevRRy5bCqTEb05+6qiN2yEc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4XTjhUmyKzTfhiHoXo4Gy8pdF0Ljx1avkYIEnihIjOvttfFX/
	dQPE8l0JEE/V2XFDp27GbKw+sioYxrIm18ECeUMv7Wdvc8MR5vQuQZ9K
X-Gm-Gg: ASbGncvqnm1BHitlvRQAj5IdTaFHwtB5jPzrh6P6qxv9HKoqIdWOLUKmcUBOI1uAroj
	ZXdudwz681KiM1t7ZuNe8XKtnlWF7Hkm0z/fbUiJSiiG//7fn6F8aXbItZ7I7inTBdL82PARW2G
	vM5cwrHpHn61HoBZ7txVOx/y8VgBYqW3aO47FLxP8SqZVGV6sEQHzovBGQ7ILRb2ePU/d1by5E+
	BtIbUceakwXk4ifr2VztyoALoJjk8ll9CDQng5Z6mY4WUxYO730rRABtzxf0SFocQHgevYmVBOm
	NyeFsBW2gJpneGfG9L8dNXEXscndRKzHLQdaM6bbKO27wsEphvTQe6znosT6Rrs4XoJ8VGfNoUk
	LAngDW2EaYXVN7w4RJwJa
X-Google-Smtp-Source: AGHT+IHPFsfBZ7jep4HTPgB4xS2TrPI+GxC/0lSGwTIJL7shKIL3DXkoTKTKoqJselW/W7mVGW6RgA==
X-Received: by 2002:a05:6000:2406:b0:3a4:e1e1:7779 with SMTP id ffacd0b85a97d-3a4e1e17966mr3329816f8f.32.1748384475767;
        Tue, 27 May 2025 15:21:15 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4e8bc377asm233366f8f.72.2025.05.27.15.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 15:21:14 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 5/6] dt-bindings: pinctrl: airoha: Document AN7583 Pin Controller
Date: Wed, 28 May 2025 00:20:37 +0200
Message-ID: <20250527222040.32000-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250527222040.32000-1-ansuelsmth@gmail.com>
References: <20250527222040.32000-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_152117_778897_0B9C6A29 
X-CRM114-Status: GOOD (  10.99  )
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

Document Airoha AN7583 Pin Controller based on Airoha EN7581 with some
minor difference on some function group.

Make the PHY LEDs, pcie_reset and PCM SPI function dependent of the
compatible and define the different group for AN7583.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../pinctrl/airoha,en7581-pinctrl.yaml        | 297 ++++++++++++------
 1 file changed, 207 insertions(+), 90 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index 21fd4f1ba78b..38511ad2f9e6 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -4,17 +4,19 @@
 $id: http://devicetree.org/schemas/pinctrl/airoha,en7581-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Airoha EN7581 Pin Controller
+title: Airoha EN7581/AN7583 Pin Controller
 
 maintainers:
   - Lorenzo Bianconi <lorenzo@kernel.org>
 
 description:
-  The Airoha's EN7581 Pin controller is used to control SoC pins.
+  The Airoha's EN7581/AN7583 Pin controller is used to control SoC pins.
 
 properties:
   compatible:
-    const: airoha,en7581-pinctrl
+    enum:
+      - airoha,en7581-pinctrl
+      - airoha,an7583-pinctrl
 
   interrupts:
     maxItems: 1
@@ -32,9 +34,6 @@ properties:
   '#interrupt-cells':
     const: 2
 
-allOf:
-  - $ref: pinctrl.yaml#
-
 required:
   - compatible
   - interrupts
@@ -151,18 +150,6 @@ patternProperties:
                   items:
                     enum: [spi_quad, spi_cs1]
                   maxItems: 2
-          - if:
-              properties:
-                function:
-                  const: pcm_spi
-            then:
-              properties:
-                groups:
-                  items:
-                    enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
-                           pcm_spi_cs2_p156, pcm_spi_cs2_p128, pcm_spi_cs3,
-                           pcm_spi_cs4]
-                  maxItems: 7
           - if:
               properties:
                 function:
@@ -187,14 +174,6 @@ patternProperties:
               properties:
                 groups:
                   enum: [pnand]
-          - if:
-              properties:
-                function:
-                  const: pcie_reset
-            then:
-              properties:
-                groups:
-                  enum: [pcie_reset0, pcie_reset1, pcie_reset2]
           - if:
               properties:
                 function:
@@ -209,70 +188,6 @@ patternProperties:
                          gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
                          gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
                          gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
-          - if:
-              properties:
-                function:
-                  const: phy1_led0
-            then:
-              properties:
-                groups:
-                  enum: [gpio33, gpio34, gpio35, gpio42]
-          - if:
-              properties:
-                function:
-                  const: phy2_led0
-            then:
-              properties:
-                groups:
-                  enum: [gpio33, gpio34, gpio35, gpio42]
-          - if:
-              properties:
-                function:
-                  const: phy3_led0
-            then:
-              properties:
-                groups:
-                  enum: [gpio33, gpio34, gpio35, gpio42]
-          - if:
-              properties:
-                function:
-                  const: phy4_led0
-            then:
-              properties:
-                groups:
-                  enum: [gpio33, gpio34, gpio35, gpio42]
-          - if:
-              properties:
-                function:
-                  const: phy1_led1
-            then:
-              properties:
-                groups:
-                  enum: [gpio43, gpio44, gpio45, gpio46]
-          - if:
-              properties:
-                function:
-                  const: phy2_led1
-            then:
-              properties:
-                groups:
-                  enum: [gpio43, gpio44, gpio45, gpio46]
-          - if:
-              properties:
-                function:
-                  const: phy3_led1
-            then:
-              properties:
-                groups:
-                  enum: [gpio43, gpio44, gpio45, gpio46]
-          - if:
-              properties:
-                function:
-                  const: phy4_led1
-            then:
-              properties:
-                groups:
-                  enum: [gpio43, gpio44, gpio45, gpio46]
 
         additionalProperties: false
 
@@ -331,6 +246,208 @@ patternProperties:
 
 additionalProperties: false
 
+allOf:
+  - $ref: pinctrl.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: airoha,en7581-pinctrl
+    then:
+      patternProperties:
+        '-pins$':
+          type: object
+
+          patternProperties:
+            '^mux(-|$)':
+              type: object
+
+              allOf:
+                - if:
+                    properties:
+                      function:
+                        const: pcm_spi
+                  then:
+                    properties:
+                      groups:
+                        items:
+                          enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
+                                 pcm_spi_cs2_p156, pcm_spi_cs2_p128, pcm_spi_cs3,
+                                 pcm_spi_cs4]
+                        maxItems: 7
+                - if:
+                    properties:
+                      function:
+                        const: pcie_reset
+                  then:
+                    properties:
+                      groups:
+                        enum: [pcie_reset0, pcie_reset1, pcie_reset2]
+                - if:
+                    properties:
+                      function:
+                        const: phy1_led0
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio33, gpio34, gpio35, gpio42]
+                - if:
+                    properties:
+                      function:
+                        const: phy2_led0
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio33, gpio34, gpio35, gpio42]
+                - if:
+                    properties:
+                      function:
+                        const: phy3_led0
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio33, gpio34, gpio35, gpio42]
+                - if:
+                    properties:
+                      function:
+                        const: phy4_led0
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio33, gpio34, gpio35, gpio42]
+                - if:
+                    properties:
+                      function:
+                        const: phy1_led1
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio43, gpio44, gpio45, gpio46]
+                - if:
+                    properties:
+                      function:
+                        const: phy2_led1
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio43, gpio44, gpio45, gpio46]
+                - if:
+                    properties:
+                      function:
+                        const: phy3_led1
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio43, gpio44, gpio45, gpio46]
+                - if:
+                    properties:
+                      function:
+                        const: phy4_led1
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio43, gpio44, gpio45, gpio46]
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: airoha,an7583-pinctrl
+    then:
+      patternProperties:
+        '-pins$':
+          type: object
+
+          patternProperties:
+            '^mux(-|$)':
+              type: object
+
+              allOf:
+                - if:
+                    properties:
+                      function:
+                        const: pcm_spi
+                  then:
+                    properties:
+                      groups:
+                        items:
+                          enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
+                                 pcm_spi_cs2, pcm_spi_cs3, pcm_spi_cs4]
+                        maxItems: 7
+                - if:
+                    properties:
+                      function:
+                        const: pcie_reset
+                  then:
+                    properties:
+                      groups:
+                        enum: [pcie_reset0, pcie_reset1]
+                - if:
+                    properties:
+                      function:
+                        const: phy1_led0
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio1, gpio2, gpio3, gpio4]
+                - if:
+                    properties:
+                      function:
+                        const: phy2_led0
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio1, gpio2, gpio3, gpio4]
+                - if:
+                    properties:
+                      function:
+                        const: phy3_led0
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio1, gpio2, gpio3, gpio4]
+                - if:
+                    properties:
+                      function:
+                        const: phy4_led0
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio1, gpio2, gpio3, gpio4]
+                - if:
+                    properties:
+                      function:
+                        const: phy1_led1
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio8, gpio9, gpio10, gpio11]
+                - if:
+                    properties:
+                      function:
+                        const: phy2_led1
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio8, gpio9, gpio10, gpio11]
+                - if:
+                    properties:
+                      function:
+                        const: phy3_led1
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio8, gpio9, gpio10, gpio11]
+                - if:
+                    properties:
+                      function:
+                        const: phy4_led1
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio8, gpio9, gpio10, gpio11]
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.48.1



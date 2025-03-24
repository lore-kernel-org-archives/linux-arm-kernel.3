Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DE9C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 13:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DhkKbL6Pj56pOT19f4sCe0HKXFmoTLO1O69IhcGdyYM=; b=lSjqPbb1A4NM0fcv+CxiLP8Rkd
	fhO36o9acS/fDe3Cbkal7At2y9uq0vgIm8k0BO8obw6DIvJ+JbSQXOMh5mzJqiB7O5bxXRcFzuxm7
	AyQKNIrXWbKJici0paAo7VlK5SXlr9erb5vTNQ7kqrvI9ndgvnu6s4BYlqgcHKAw5Gwwh4Fxyt5sT
	Nl9tN7iBr99vWJK1lBWfEYcs4XcCWWnTzaaKTmanhrV2zFVQKdcwXQXjx3snmWuywPZRxUiH92NV3
	a1v0ORa4OleRS7665hub2Mq2lHJQB2jT+Oy0QIN48UhX/WLfY5wJPim/7z60F4G67LTOUHi/DM5UG
	TcTVw/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhWA-00000003CQR-1URg;
	Mon, 24 Mar 2025 13:07:02 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twhIs-000000036SK-0eud
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 12:53:19 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39ab85402c9so122727f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 05:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742820797; x=1743425597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DhkKbL6Pj56pOT19f4sCe0HKXFmoTLO1O69IhcGdyYM=;
        b=V9RWySokFayo/h2DuchA0uPCG65l0fYSGvtjzZE2iqyew9o9rnY2ANYGr/EelaJd3D
         kKwCBwWJDTj9eRd8kuwnxBf+4AmBoM4DJu85XT25YiIjNvR6gKkiuGInTW6vDF69KM3B
         jDs/+sZwvIxcxsoR8EQrgsboTmbLAEF22edYrTavua1zBj6Zgfpmvw8UD5ZJ1PbLla8Q
         AGqa5q3SaUgFwR+isBKBNywF2pucbEM63Un+dFX78aGFfCo0OO/z8TbO8B5l/kUsqo3x
         55adAJLOc3ev/x9x08Hkpg95JQXpOXurCPbr+AEj0GeTfWK0s7VhJCpTzljoLPYb5yl/
         +QJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820797; x=1743425597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhkKbL6Pj56pOT19f4sCe0HKXFmoTLO1O69IhcGdyYM=;
        b=GU8kO0rNQhfwxgNL0ko+ynrNOd8CfoDHsZoXLhZ2QHOSC3K56ygLi2Ca/IYCyX2bRA
         QzEuxW/7+4el+IJTqsN6qJQtOto9bk6rVVT8A9rgoVzPevNnEIGVe2aTDytlvPgzVWim
         4d3gBiztoXFuDKQY9b8oer2+cYOzZjpU+TsQ7veInPb8BLp6zSoKse8yRpo5iPMQYiyc
         w3iGzUrvUrH/JT9722y5b8xT2GLVOUD2MEhKRg2xWPPUWydaAQa2STw619shMwMtq3Es
         YD8CAsZYiz2HswG2MZDyKgTe0kqeVVjXWZGpAFxJ8tZRaUc3ZYJMTj0Uj6/FN55LngxV
         VixQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhWoI9Dk2aqldV2nrVs2D2D36/dbvNCrtBOdBwQ/mrnmxro10vMI36n0YTnyd7G/Eaiu1kv/BybVnTioJ9jtba@lists.infradead.org
X-Gm-Message-State: AOJu0YzIA/PYZfSnzVO0yoE3h8F7OFxt/YsaxJAI4F2zHOV1MPzzYqVE
	0ne2Chhc6QjB3O4KECR/44f1C8Luzv0DgAeLUWwXzA2Bflog2o1/Cr0YN8AIOxQ=
X-Gm-Gg: ASbGncuXRX4i5tHo/5izkDLKUiR613IydM+xzglFCs/EYTKDzEgZbKLpMH71hbaP1pM
	g3GYIKgqIk5x/YLNclix0iVqEIEsAUMhUmvvhLI/dI8iUYKwmDP4es4xlXblvxYImbJKRT/uEDj
	01MhHmAXldJEO40M4QB2Tm5mp0u0e1BW4Df22Es94B8C5AHjyTjG7q6p0LNGvXwK3eXNjeJeavH
	34Z/DaASc3znvZfWYpNxOAxAbKmb15p1+aZhRFOymWPW9EssXSJskDdqT2oVUVIidTSAa/zxXgl
	i0JbqRh+RVJgYGZ0uhJPH7vwqIxGmjAjV3JTk1qUoTLZgJP3tjoLtHJbsIZc3/BjMKNs
X-Google-Smtp-Source: AGHT+IELSRnS6+jDcoXD4ACf2eotZaDufAhTgDfQtnO8l4nSz1FNdFEmD6wP6RQaXMoBJDuTs30T2A==
X-Received: by 2002:a05:6000:1842:b0:391:2f03:4cb9 with SMTP id ffacd0b85a97d-3997f8f9c98mr4498820f8f.1.1742820796672;
        Mon, 24 Mar 2025 05:53:16 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9efd61sm11017167f8f.91.2025.03.24.05.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:53:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Anshul Dalal <anshulusr@gmail.com>,
	Ramona Gradinariu <ramona.gradinariu@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Robert Budai <robert.budai@analog.com>,
	Petre Rodan <petre.rodan@subdimension.ro>,
	Andreas Klinger <ak@it-klinger.de>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: iio: Correct indentation and style in DTS example
Date: Mon, 24 Mar 2025 13:53:12 +0100
Message-ID: <20250324125313.82226-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_055318_197729_DACE7C1B 
X-CRM114-Status: GOOD (  11.40  )
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

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/iio/adc/st,stm32-adc.yaml        | 102 +++++++++---------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
index ef9dcc365eab..17bb60e18a1c 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
@@ -498,7 +498,7 @@ patternProperties:
 examples:
   - |
     // Example 1: with stm32f429, ADC1, single-ended channel 8
-      adc123: adc@40012000 {
+    adc123: adc@40012000 {
         compatible = "st,stm32f4-adc-core";
         reg = <0x40012000 0x400>;
         interrupts = <18>;
@@ -512,28 +512,28 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         adc@0 {
-          compatible = "st,stm32f4-adc";
-          #io-channel-cells = <1>;
-          reg = <0x0>;
-          clocks = <&rcc 0 168>;
-          interrupt-parent = <&adc123>;
-          interrupts = <0>;
-          st,adc-channels = <8>;
-          dmas = <&dma2 0 0 0x400 0x0>;
-          dma-names = "rx";
-          assigned-resolution-bits = <8>;
+            compatible = "st,stm32f4-adc";
+            #io-channel-cells = <1>;
+            reg = <0x0>;
+            clocks = <&rcc 0 168>;
+            interrupt-parent = <&adc123>;
+            interrupts = <0>;
+            st,adc-channels = <8>;
+            dmas = <&dma2 0 0 0x400 0x0>;
+            dma-names = "rx";
+            assigned-resolution-bits = <8>;
         };
         // ...
         // other adc child nodes follow...
-      };
+    };
 
   - |
     // Example 2: with stm32mp157c to setup ADC1 with:
     // - channels 0 & 1 as single-ended
     // - channels 2 & 3 as differential (with resp. 6 & 7 negative inputs)
-      #include <dt-bindings/interrupt-controller/arm-gic.h>
-      #include <dt-bindings/clock/stm32mp1-clks.h>
-      adc12: adc@48003000 {
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    adc12: adc@48003000 {
         compatible = "st,stm32mp1-adc-core";
         reg = <0x48003000 0x400>;
         interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
@@ -550,27 +550,27 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         adc@0 {
-          compatible = "st,stm32mp1-adc";
-          #io-channel-cells = <1>;
-          reg = <0x0>;
-          interrupt-parent = <&adc12>;
-          interrupts = <0>;
-          st,adc-channels = <0 1>;
-          st,adc-diff-channels = <2 6>, <3 7>;
-          st,min-sample-time-nsecs = <5000>;
-          dmas = <&dmamux1 9 0x400 0x05>;
-          dma-names = "rx";
+            compatible = "st,stm32mp1-adc";
+            #io-channel-cells = <1>;
+            reg = <0x0>;
+            interrupt-parent = <&adc12>;
+            interrupts = <0>;
+            st,adc-channels = <0 1>;
+            st,adc-diff-channels = <2 6>, <3 7>;
+            st,min-sample-time-nsecs = <5000>;
+            dmas = <&dmamux1 9 0x400 0x05>;
+            dma-names = "rx";
         };
         // ...
         // other adc child node follow...
-      };
+    };
 
   - |
     // Example 3: with stm32mp157c to setup ADC2 with:
     // - internal channels 13, 14, 15.
-      #include <dt-bindings/interrupt-controller/arm-gic.h>
-      #include <dt-bindings/clock/stm32mp1-clks.h>
-      adc122: adc@48003000 {
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    adc122: adc@48003000 {
         compatible = "st,stm32mp1-adc-core";
         reg = <0x48003000 0x400>;
         interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
@@ -587,28 +587,28 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         adc@100 {
-          compatible = "st,stm32mp1-adc";
-          #io-channel-cells = <1>;
-          reg = <0x100>;
-          interrupts = <1>;
-          #address-cells = <1>;
-          #size-cells = <0>;
-          channel@13 {
-            reg = <13>;
-            label = "vrefint";
-            st,min-sample-time-ns = <9000>;
-          };
-          channel@14 {
-            reg = <14>;
-            label = "vddcore";
-            st,min-sample-time-ns = <9000>;
-          };
-          channel@15 {
-            reg = <15>;
-            label = "vbat";
-            st,min-sample-time-ns = <9000>;
-          };
+            compatible = "st,stm32mp1-adc";
+            #io-channel-cells = <1>;
+            reg = <0x100>;
+            interrupts = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            channel@13 {
+                reg = <13>;
+                label = "vrefint";
+                st,min-sample-time-ns = <9000>;
+            };
+            channel@14 {
+                reg = <14>;
+                label = "vddcore";
+                st,min-sample-time-ns = <9000>;
+            };
+            channel@15 {
+                reg = <15>;
+                label = "vbat";
+                st,min-sample-time-ns = <9000>;
+            };
         };
-      };
+    };
 
 ...
-- 
2.43.0



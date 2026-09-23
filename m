Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BB3C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 04:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUGLxOvF7mywRs9buCfM5BiPX8wZpsZsunHJCACFyEg=; b=KY1CwtuMLiZ5CNClCao7bh9aiC
	x3up7Wx5bH8D6cBTLFUw6OWxSJFG2QgWlODPqwAsRi5PFNdBR4DiVss6TLI0FnpPoEX72k2Dxdd6k
	/3aaNn13CTbw2wb7cm6cu8CKOA+EBH8L6MkDhHN9WY87rgNEYRyEWRqEjA47pJyMzzfVXLjHXE0ui
	xEf2C2aIIPsfdIWeo/Mj51o0jO3AzqpBQdEfs9Pokg7/dczGxSyQi3tugJnhbb3f6ex5lxYH0LCXb
	+Gab31qGkcS768dI6ndDm0MQkGedIvY7K2XjvdvVY1Cn8sQb+T+OmftylvHxWJDHeAenBY3t/Q+Vk
	7kxqlWmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ESV-000000076Q1-2glK;
	Wed, 23 Sep 2026 04:19:51 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ESQ-000000076P6-3RX7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 04:19:48 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-398c066106cso317567a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 21:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790137186; x=1790741986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUGLxOvF7mywRs9buCfM5BiPX8wZpsZsunHJCACFyEg=;
        b=r9MC/OpXVvDMZOGhx7ujhOa9HH7AhQ4kFe2gVRXvjR9GvQHWyBxiQOTiVXZaTOyqzO
         0KGhtZ5juw0UyJ1cmrHJkzl81PksEjRP4aNCGCxHmzsIfray927SKykeY2MZZVEJaI0l
         CGbLqKFPUx61dUubxpqGoqXAsxllqPkHtiSTAJyVwxMH5YZb0An0Iz7krGptSEmS4n3P
         0hdqpEAq+QdZXeDm3ZlU2LT84e61xyaY22A1ddCOkbDZ+IyKYCaKfESggU+H9lIirz2a
         k6r218yf7hfZ0ftTnAhsdWNV3sS5xQkETegRQGipv634fYUBTQF7Y/Vpyl7B5MZ1oIoj
         S7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790137186; x=1790741986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UUGLxOvF7mywRs9buCfM5BiPX8wZpsZsunHJCACFyEg=;
        b=1m+NgxdGcGbIpexozeScQ4o85z7DuxuwKOAVA7cRZk7HIvObsEfZEN0w20EodO/lnp
         vhqAvSkSRZUwvTPA/wzvIbIhMwE4FTMYEefghsexT7DmHWwhWwlB4jnRSgmgRh8R2GGn
         9KWxyctbr5gIyLLbSWJj2+ISf6OkNBar/auslmLTlk+JZdI48WCXDMR9sTe2S2CxA7rB
         ZHl2+tR0t7totKaGmHBQzlOtAhYZTPZgPmEOr/F1iuJWha+eq+rrZGWfKNdWwHykB6xb
         7uhRv0Bbp/FOMaDUIpaso4HMLzTHzVxVY9h0SbQWxj/h6ElXsjZgpzgG17mSTuKBCUid
         Y9xQ==
X-Gm-Message-State: AFuF++mH43drarqZOEUgonVq9oeeQ7VsXzxYjP2+YSqS4+105/n/AqvQ
	Gf31xRC6yBZfQXr7/5HIFAMkfV+oxrKNBqgqPEVBsipGGEvU0JzLVVpT
X-Gm-Gg: AYBFou3fExIodssocZ9H8PsycLOvfeJPHNnPxLiGFw76YOCStd2SzO82sJO4oNvYmlW
	7BCk/vp9slmzudHJOKd00mA5dK8aEdAklbkOMyP+7etUygAhU7lT1rYHn9UmnBU6SKSAceILNew
	1p07v8hs2oLlsJQnMNkUCyktOOBiMe/Q3F94eVWh5I3k6030q1KKBmdZJNAxTwEdaWm+T1bCeNL
	Eh07R2PGbtE6WV4UP8ukpMXMW4V4Pvqex1sB1qvb5jO5+doxs/kI7kp6yPGT7pZ2iORvU6FzP5B
	TSfxnM2Cg/AFLqtdmxs/W7HEn2Hc+EqYBo/OIbc48Fhj2iSQruKeJjETPDf3z0n7pHUFslImKHo
	0uWuBoJjjypuF0khV1jhWBm3YAcsJK4/zwwKtARWYYkad/BD59lvUlwsgGgp6Hb0S4DJe9bSmRa
	EE2fEIkS73r1XZe98DSLettofCP+2kmNN0YJTe9jfKHVVHw+8Aqr3fA4fJ2jRdUE45UIK4l+lcu
	0nJiN0H0M9SPRV6+Pk3AfOPNwKeUzfNM3uo/NivbZ6iPFTfzp2/X045v0rr
X-Received: by 2002:a17:90b:4d0f:b0:39e:6a81:c922 with SMTP id 98e67ed59e1d1-3a07e641099mr1375383a91.21.1790137186121;
        Tue, 22 Sep 2026 21:19:46 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddae723sm2510243a91.5.2026.09.22.21.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:19:45 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH 1/2] dt-bindings: spi: nuvoton,ma35d1-spi: Add Nuvoton MA35D1 SPI controller
Date: Wed, 23 Sep 2026 12:19:25 +0800
Message-Id: <20260923041926.425551-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260923041926.425551-1-cwweng.linux@gmail.com>
References: <20260923041926.425551-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_211946_915142_D7828375 
X-CRM114-Status: GOOD (  13.59  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add a Devicetree binding for the SPI controller found in the
Nuvoton MA35D1 SoC.

The controller provides two native chip-select outputs and supports
additional GPIO chip selects through the generic SPI controller
binding.

Describe the controller register region, clock, reset, and optional
interrupt resources.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/spi/nuvoton,ma35d1-spi.yaml      | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-spi.yaml

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-spi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-spi.yaml
new file mode 100644
index 000000000000..4e1afbdb195d
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-spi.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/nuvoton,ma35d1-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 SPI Controller
+
+description: |
+  The Nuvoton MA35D1 SPI controller supports host and target operation and
+  provides two native chip-select outputs. GPIO chip selects are supported
+  through the generic SPI controller binding.
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-spi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  num-cs:
+    minimum: 1
+    maximum: 2
+    default: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        spi@40600000 {
+            compatible = "nuvoton,ma35d1-spi";
+            reg = <0x0 0x40600000 0x0 0x10000>;
+            interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk SPI0_GATE>;
+            resets = <&sys MA35D1_RESET_SPI0>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
+...
-- 
2.25.1



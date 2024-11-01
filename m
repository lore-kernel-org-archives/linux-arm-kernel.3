Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FDAE6F084
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 19:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWdN0A9vaQGUQ/rqxL0/90amxoE+3Tz3AB4zBu+Rmtc=; b=SJOyMCXwvdH09BW8AVmsgeNN4e
	zl4ArO35IpK25I0n99YZbWMoZqDJHx+smdWRXr13jkMG34bgFt74eO9xGnosmYjux41I10OZLeCz5
	UjthsMuJU/JUuiv2sDzTZvfhaa8SFwxWqZLlQInqTcu/7tKSSGwOqsrJyZ7jMiLdD0ZknzC6IY+5a
	Crd/xtcBgb63bJDy0Q/4lOTIspfqGaFpevfhng8+64cq5kqasUcKz85GPqDP2kyvH+yJBtjidnWkF
	r1zELkFFz9ZlU3k2Dqg+TyEB9Uz+KGtfOsXq8Y3zKOadWfL7ijmOtutXq4ClK1R/euIQYtxHY1xHh
	VZBpmo0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xJz-000000087fz-02ip;
	Fri, 01 Nov 2024 19:28:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xIH-000000087H5-1j5k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 19:26:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C3EF65C5A4A;
	Fri,  1 Nov 2024 19:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4FED1C4CED5;
	Fri,  1 Nov 2024 19:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730489208;
	bh=2+61SXeXGIVwV2Py0mMH4Lf6SswQfF2F/Q38nkoG8tk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GnphfbFdWjKqXyeoQ0fXrKGyXutOeBtasholt8bTjaEBbuXFjUMFr2ApVGt2v8ufz
	 t0xrn4NsqAGSUmF3pSuTkjrB2SOaaWm9Q6jCnbwgJpJyA+88bYaqrrJwF6Wu3mfns2
	 B2N++Ge3Nmwv94i5v9gONluT4BIhnOzhnfUeMr9IMyPF9jQQux1cYY+IVS0NCz3ICI
	 yfbgXHoptYIbEOeTzAJNd/5/bcaFVHjzenf3AkViFWH5sDP33Iz7T01McEZgiJNO/s
	 zKY0wOV0rARKJMNsPeKSgIj1t29vSzHkgYD1d864zE6Vd6qHTZunXCEv5LwyWw8jP5
	 uRG/3or9veVzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B892E6F086;
	Fri,  1 Nov 2024 19:26:48 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Fri, 01 Nov 2024 20:26:12 +0100
Subject: [PATCH v3 1/3] dt-bindings: spi: apple,spi: Add binding for Apple
 SPI controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-asahi-spi-v3-1-3b411c5fb8e5@jannau.net>
References: <20241101-asahi-spi-v3-0-3b411c5fb8e5@jannau.net>
In-Reply-To: <20241101-asahi-spi-v3-0-3b411c5fb8e5@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=TsW7zwdUd7DpJxv+e2Rjl4FSQ1yenKbJUaCwJVIeRgk=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhnRV7bK+lzuPJp1PrtvwrTfuwVU/Tst+lvM/3UsuNsusv
 6V83Ci+o5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwETEJjAyXNXsm612RTNCOJb/
 zPaqfaz8i/d4aIdeFQxVOyhc8/5oMcN/37Z3KYcFUvfsufS9JszvVmSJTfflF2eWh8zL8lz4oW8
 /EwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_122649_577909_37CF37E9 
X-CRM114-Status: GOOD (  12.16  )
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
Reply-To: j@jannau.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

The Apple SPI controller is present in SoCs such as the M1 (t8103) and
M1 Pro/Max (t600x). This controller uses one IRQ and one clock, and
doesn't need any special properties, so the binding is trivial.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 .../devicetree/bindings/spi/apple,spi.yaml         | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/apple,spi.yaml b/Documentation/devicetree/bindings/spi/apple,spi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8b4f974faa23bcf9a1ea0a0eb52ad17ca196b341
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/apple,spi.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/apple,spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple ARM SoC SPI controller
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+maintainers:
+  - Hector Martin <marcan@marcan.st>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t8103-spi
+          - apple,t8112-spi
+          - apple,t6000-spi
+      - const: apple,spi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/apple-aic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      spi: spi@39b104000 {
+        compatible = "apple,t6000-spi", "apple,spi";
+        reg = <0x3 0x9b104000 0x0 0x4000>;
+        interrupt-parent = <&aic>;
+        interrupts = <AIC_IRQ 0 1107 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&clk>;
+      };
+    };

-- 
2.47.0




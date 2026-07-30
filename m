Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3518C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sga4MOmTV9FTSsd/3VxLp/kpppIQyfNmPszDEaYxk0=; b=TUKKLHOH1PZ7S44ZATEKd7VHb6
	qPGUlKxuLgX+saTHjwm2+HdgBZVzn3AfWvW9OQkqi3GQzfTeZ6XtEwYrhciOsg/ueSuaHh9Ck5/pw
	w536yAmOpQqh0hc/qqWoFK+KhFQWfl8hcIb9rBB9UFkkCxZ76l0p7LBOXTEiXaUvkZot1CMMyxToR
	QpRW5/Hb+FFtPXEsliIpRBtkjvkWGX/toBY4IBEovOC4/t/jUZTqr4+qxFNpszBDufCKCOG/7SaS2
	I7kyuMQOhoYtFEFubzOEFYEDNZeGyHjENsvmMB30kY0KfknIx/pp+gxhCDwu2ytpUmhCC3kKZdM4/
	JHjcI8rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWUW-0000000BFOu-0vjU;
	Thu, 30 Jul 2026 19:32:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWUV-0000000BFOY-3YnS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Jul 2026 19:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8sga4MOmTV9FTSsd/3VxLp/kpppIQyfNmPszDEaYxk0=; b=Me4GUAS83CBKoT+/nwRneRizj7
	jLpZXT28fecGJNu9lKkOXO4XnGtwEtkvor4qbplxY52gASf80L1e9sLgmDpe5CPwuUj14yaGrlpxg
	/e4N1DZutdawpa88HeVc+v0k0qWvjDKISA6LnVVVBqgAyc7rpYWCIlZDYi9P0up9sVFjRBXrMAuh5
	SPEIVmkY1JRR2s8fTeSY6gkEqMFqO67BN8mAeZcMBlFI4HJwiXVwmP8BJLJxDau7adXkUPM65kkeZ
	8D/w5R44OYzc3DvhubvjN6UtjADyWpOvGjbqohr1t/wgiwfN0hrUoDE7Yaq8z3wp2wWi5XIGqTqb2
	OxC2H/6w==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wpWUS-00000006wHe-2u4Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:32:26 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A637641B81;
	Thu, 30 Jul 2026 21:32:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYaESqNX0ObY; Thu, 30 Jul 2026 21:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785439922; bh=8RNNJicbOxkofsbn69rExkYA+ETIbn8fNyoaONjKg8o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=j2pCtOu9ZNhE+tGuNUgE0fzLmJB9Src1nUoVnmUBvzSdc5sVEm1IjDFQRJTcpT+c4
	 WV71tXPMXXyQu1xcShnug+yJgmlpRfOCR3UE0Kse9ER0WH/xDU7GT44nEAxwECmPV/
	 ZVnN1/N9sRz+kyys+2ny2E7gUoHJgH6mSnJGpvnIL9+tDWSgZNHnCPUXco+WYYA/kJ
	 QZsu2EHtUbI/DYHTiLfAwjKfo3T77pWUncpghtNRmix5iNAhJjTkL9Luy9nG5lNV8F
	 pRi5N21OobKK/8XFCFjYpM/oehCG8S2xacnIrOqXb2v+Mb6KJUfKV6U5tyvllI/wH0
	 KpoDSLMnlxZ+Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 31 Jul 2026 01:01:29 +0530
Subject: [PATCH v2 1/3] dt-bindings: iio: proximity: add Sharp GP2AP070S
 proximity sensor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-gp2ap070s-v2-1-1bdfee07d5ea@disroot.org>
References: <20260731-gp2ap070s-v2-0-1bdfee07d5ea@disroot.org>
In-Reply-To: <20260731-gp2ap070s-v2-0-1bdfee07d5ea@disroot.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_203224_900105_43BA0AEF 
X-CRM114-Status: GOOD (  11.71  )
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

The GP2AP070S is a proximity sensor designed and manufactured by Sharp
Corporation. Unlike the other GP2AP* schemas, this is strictly a
proximity sensor and NOT an ambient light sensor.

For power supplies, it expects two voltage supplies, one for core and
other for driving the infrared LED which is used to measure proximity
distance.

This chip has been used in production mobile devices such as the Samsung
Galaxy J6.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/iio/proximity/sharp,gp2ap070s.yaml    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/proximity/sharp,gp2ap070s.yaml b/Documentation/devicetree/bindings/iio/proximity/sharp,gp2ap070s.yaml
new file mode 100644
index 000000000000..bcae68303b3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/sharp,gp2ap070s.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/proximity/sharp,gp2ap070s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp GP2AP070S Proximity sensor
+
+maintainers:
+  - Kaustabh Chakraborty <kauschluss@disroot.org>
+
+allOf:
+  - $ref: ../common.yaml#
+
+properties:
+  compatible:
+    const: sharp,gp2ap070s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vdd-supply:
+    description: Voltage supply for the internal circuitry
+
+  vled-supply:
+    description: Voltage supply for the IR LED
+
+  proximity-near-level: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      proximity@39 {
+        compatible = "sharp,gp2ap070s";
+        reg = <0x39>;
+        interrupt-parent = <&gpio>;
+        interrupts = <1 IRQ_TYPE_EDGE_BOTH>;
+        vdd-supply = <&vdd_supply>;
+        vled-supply = <&vled_supply>;
+        proximity-near-level = <500>;
+      };
+    };
+
+...

-- 
2.54.0



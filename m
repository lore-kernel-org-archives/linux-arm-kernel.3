Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9D3D29FB3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kv2hVHm7LLZgDM4u5Pi87d/if2PauVm8V5/VtrFyYZo=; b=JRP9cRBK7WM9G1sZ4l1YUKb+eP
	0LzQDHWG2CRPD/CsIDQWlOwKTXFwRrK0N7KUGeaXDHFuYkyyQRNWqg+3chl6IpFUGiVhU2bwqxc1e
	3XL671QEtDJuNate1aMUGw6irCCED0G/jUO7WmdCibkwEJwI/8Z/Bc1QIqNIXFf7mxnINptjemaCf
	U6sROF+hMd1hHwUc4aLHMq/Bjr7N8fymSVsCLMebtQ4eaabGpKf7LxcreLLaNo6dSJe0OnguOuxtc
	JAPgKFiv/0jiSD+axK5ksP8Sgqct+aSMNpnwdmTgPRytOayeorWXs2CDOIzOZ6ovQZKvQQPh8DoSy
	b+8s8x7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8atz-00000002BxO-0lO5;
	Wed, 06 Nov 2024 07:56:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ary-00000002BSW-0QtR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 07:54:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C68D05C069C;
	Wed,  6 Nov 2024 07:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D32E1C4CED3;
	Wed,  6 Nov 2024 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730879664;
	bh=4CxI9hvqy+T0MQp7ejsVaS+wjhKMAoO93q+j3nHoUH0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W0+vbyNtK0fmXOzDVhfAGCF0Ic+GhcetALnCsK/b1vlS/Qcio+fYGqhglIvRu12GU
	 +YEVjIQHpvNor3WRoqavLw+qTuSBhWZRjWeBV6tTj/mFSA2lVr5Ord743Bvg4CUwoR
	 gBpz9t5NA+DBRm4c/aiaduiNYJQtlbdk/ZjCfVfomKUpFZiewM899gW05TLhP2gi8K
	 1JKM6AeVfXEBnIxbhvk+RxcyHu7f6MBjTpV/1euFyAopJ2/amZLQbTnwi9vOVnNP2r
	 i46qC/KPB+8C6SGhRYZz/N5pqHDrG9dXUzMQ2MnADVgViD1ucVvElu5e6Wr4otvefw
	 u+3zLywlzkqTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD6CD29FB3;
	Wed,  6 Nov 2024 07:54:24 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Wed, 06 Nov 2024 08:54:00 +0100
Subject: [PATCH v5 1/3] spi: dt-bindings: apple,spi: Add binding for Apple
 SPI controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-asahi-spi-v5-1-e81a4f3a8e19@jannau.net>
References: <20241106-asahi-spi-v5-0-e81a4f3a8e19@jannau.net>
In-Reply-To: <20241106-asahi-spi-v5-0-e81a4f3a8e19@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>, 
 Nick Chan <towinchenmi@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2217; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=O9OlA0s3DQ4s9BDbe1rexPnrtmgzE8wHs1clsQ1vxYw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhnRthfVLjea1h21MsuPzsJYXPcTB//xyaH9ikdqMJc6zZ
 f7tPfyxo5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwEQCWhj+yvp692/VeRPIIDP5
 L7OVWARfz9bksjPC7rOYCu/630lYzvCLaZJ279Fp2ornv6uZKT/9Em/0VPaDdsMNzuUMSqtLGCO
 ZAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_235426_377572_D7B65026 
X-CRM114-Status: GOOD (  12.46  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Nick Chan <towinchenmi@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 .../devicetree/bindings/spi/apple,spi.yaml         | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/apple,spi.yaml b/Documentation/devicetree/bindings/spi/apple,spi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7bef605a296353a62252282af4ba45a71b20b7b6
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
+      spi@39b104000 {
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




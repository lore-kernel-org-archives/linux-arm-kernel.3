Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E73C606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hZiLSXqs;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fWH/9YQK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vVRN7WkiE3t1C9Cy29wA4wdbqE5m1RqnHkizzxaNbNc=; b=hZiLSXqsEQ1cpt
	inhVsPMpF1neZ1Gr//NxX58z7upXjL0VdW7mU/RQU6c1C201rgh0v4P/7RryzhD2L6MwTqqqfCbvA
	DhzRez87GrjJN6s9Y/t93YtYGCaTKX4SbWJ35CLQ16ZbPQ3GqsIyQNKdE5AAHxV03I9Zz4FucSO18
	MTuh2S0lvR+kIy3vFj7I6e0dOChBZ9lVFEAtc2qg+eND2vhZ1D7YW6rvakeUmku9jExEymeZlcCP6
	CnFZJy5BSqHDyz1dNEdjY9omJvZonMjlpP8hfYEBInAS1lNeps2nSlLRxcEmF/QmdpkaONMD54Ivp
	UbfRhl5crA4WAy3078Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdpD-0000000EyEe-1sue;
	Sun, 01 Nov 2026 22:14:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdpC-0000000EyES-29h5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 22:14:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 486CF4229D;
	Sun,  1 Nov 2026 22:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B51A1F00919;
	Sun,  1 Nov 2026 22:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571290;
	bh=vVRN7WkiE3t1C9Cy29wA4wdbqE5m1RqnHkizzxaNbNc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fWH/9YQKh4UAf8iCZOoLLGonECfuH/KWclkzI8SxSfq1jLlr+arXH4ItINRDRHYHm
	 Rlo2mv/N++BNh7yoMc1Nw8U039kvS03cFkNnMXpPxrufxf+sQIz0ZhzUhPJPD+eZ2y
	 6rTZ8k1QkRJeKglMo7+rfwT0Pt3Azf7XbzaA6EqzYv7D6Mcz80wDgJjCSRhJJmyvOR
	 BSjacTt3ZvDeKfEhLf1JpCHxU9pkieJiKRNRzceJhGZGLp8VAEyAz3zYxGYBreC5ZP
	 /DDiP7xx3wryp5zWuxiu2o9r4fApdc5GuNbO3c6/qUHFDJJLMQpT9ZzzDLhPNQ7wHs
	 rXCoWx6OgqRjw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 01 Nov 2026 23:14:34 +0100
Subject: [PATCH v2 1/7] dt-bindings: mfd: Describe the BCM6846 PMC complex
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-xg6846b-bcmbca-xrdp-reset-v2-1-455fe9eed5ee@kernel.org>
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-hwmon@vger.kernel.org
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The third generation Power Management Controller (PMC3) has
different subdevices.

Identify the parent with the BCM6846-specific "brcm,bcm6846-pmc"
compatible.

Describe the complex as a simple-mfd with a PMB bus child owning its
register resource. Include the PMB clock and reset controllers and
PVTMON, with its acquisition clock and reset resources.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml  | 82 ++++++++++++++++++++++
 MAINTAINERS                                        |  4 ++
 2 files changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
new file mode 100644
index 000000000000..78aef68bc318
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,bcm6846-pmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6846 Power Management Controller
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description:
+  The third generation Power Management Controller (PMC3) contains several
+  register banks. This binding describes the Processor Monitor Bus (PMB)
+  interface within Procmon. The PMB child owns its register bank. The parent
+  provides address translation and does not own a register bank.
+
+properties:
+  compatible:
+    items:
+      - const: brcm,bcm6846-pmc
+      - const: simple-mfd
+
+  ranges:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  '^bus@[0-9a-f]+$':
+    $ref: /schemas/soc/bcm/brcm,bcm6846-pmb.yaml#
+    description: PMB configuration, keyhole and address mapping registers
+
+required:
+  - compatible
+  - ranges
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/brcm,bcm6846-pmb.h>
+    #include <dt-bindings/reset/brcm,bcm6846-pmb.h>
+
+    system-controller@ffb00000 {
+        /* Broadcom BCM6846 Power Management Controller complex */
+        compatible = "brcm,bcm6846-pmc", "simple-mfd";
+        ranges = <0x0 0xffb00000 0x21000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        /* Called PMB Processor Monitor Bus in vendor tree */
+        bus@20100 {
+            compatible = "brcm,bcm6846-pmb";
+            reg = <0x20100 0x200>;
+
+            pmb_clk: clock-controller {
+                compatible = "brcm,bcm6846-pmb-clock";
+                clocks = <&osc50m>;
+                clock-names = "ref";
+                #clock-cells = <1>;
+            };
+
+            pmb_reset: reset-controller {
+                compatible = "brcm,bcm6846-pmb-reset";
+                #reset-cells = <1>;
+            };
+
+            hwmon {
+                compatible = "brcm,bcm6846-pmb-pvtmon";
+                clocks = <&pmb_clk BCM6846_CLK_PVTMON>;
+                resets = <&pmb_reset BCM6846_RESET_PVTMON>;
+                #thermal-sensor-cells = <0>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..eb4b3b631e82 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5444,6 +5444,10 @@ N:	bcm[9]?6856
 N:	bcm[9]?6858
 N:	bcm[9]?6878
 
+BROADCOM BCMBCA PMC3 PMB DRIVER
+M:	Linus Walleij <linusw@kernel.org>
+F:	Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
+
 BROADCOM BDC DRIVER
 M:	Justin Chen <justin.chen@broadcom.com>
 M:	Al Cooper <alcooperx@gmail.com>

-- 
2.56.0



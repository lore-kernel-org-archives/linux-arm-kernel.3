Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF27CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 21:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5IKUFr98nJYokFrRb/IYtXrfMxhIGEdAyUKF+961f+c=; b=fZxfvyfbzYvyXvT0Nf6qPX9HBm
	PhhryVIpsmyiBFseJRULZlEXOneHraUjcBkYsMETYWYBSv+wvYpzKqnIKbfehBF5pJL9vNMlhAd8s
	0Q8FAy9KKzRH7eh4yAG6bwOqN2eS6x5uQSFjdarDWk0kBSDagouYwAGhEse5y6xogRPC9L1pILAJ+
	0UzEsBkjam1fMJ7N83i30NTmEwZ14ODsNH8+8oYC+TmihiQgli5F3B1YNfo5CsS6f76HUgnTPECam
	aaooFtNo3603BTzVrI0wYCXAeAuy+qMU1aZ78ecAUbcw7uUCI1gLBV6buResIda2w5gN68U1qVvmX
	2h2Iq76g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulwPZ-0000000C2kB-1YzA;
	Tue, 12 Aug 2025 21:20:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvh3-0000000BxnG-0w3c;
	Tue, 12 Aug 2025 20:34:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C8EF600AA;
	Tue, 12 Aug 2025 20:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFFCC4CEF4;
	Tue, 12 Aug 2025 20:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755030839;
	bh=rzrbO5xcK/Wu8K8pRlisGVRhj7ITITPQ2YAOSrXQ0Hc=;
	h=From:To:Cc:Subject:Date:From;
	b=UTUw039HaDFC5GMa5FZMvSy8rNq7IVpDg2j1hK9nszqq1zwk6lAS8G0W9wnDz1AOn
	 M+a+XAXAcg7fvVWyuVXo8EGb9udEGYpSM9u93/A9dDXBmR75kCBlWpO2sL+W7Rwo+Y
	 +rtJ/gvB2Z3eYuU48L9/4hsbIgpyFHSb761ma/PYWnYW3Q+YivS1ZCYiTUzQQ+eSaw
	 AkWXv1p3WOxgpcfdVTb93cftkDI9i8omUSBAX65U2eO6RGsoQHdZv9kKe2KHI1LaYR
	 OVZ97qu9UGbS8qO4Wh5c9wzcGly5nEx2yubLGjGJUxIk770NFgDs99DsFUMJVKNkuW
	 WoPyoOJ2TRb1g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: Convert brcm,bcm2835-i2s to DT schema
Date: Tue, 12 Aug 2025 15:33:55 -0500
Message-ID: <20250812203356.735234-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Convert the Broadcom BCM2835 I2S/PCM binding to DT schema format. It's a
straightforward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/brcm,bcm2835-i2s.txt       | 24 ---------
 .../bindings/sound/brcm,bcm2835-i2s.yaml      | 51 +++++++++++++++++++
 2 files changed, 51 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/brcm,bcm2835-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/brcm,bcm2835-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/brcm,bcm2835-i2s.txt b/Documentation/devicetree/bindings/sound/brcm,bcm2835-i2s.txt
deleted file mode 100644
index 7bb0362828ec..000000000000
--- a/Documentation/devicetree/bindings/sound/brcm,bcm2835-i2s.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-* Broadcom BCM2835 SoC I2S/PCM module
-
-Required properties:
-- compatible: "brcm,bcm2835-i2s"
-- reg: Should contain PCM registers location and length.
-- clocks: the (PCM) clock to use
-- dmas: List of DMA controller phandle and DMA request line ordered pairs.
-- dma-names: Identifier string for each DMA request line in the dmas property.
-  These strings correspond 1:1 with the ordered pairs in dmas.
-
-  One of the DMA channels will be responsible for transmission (should be
-  named "tx") and one for reception (should be named "rx").
-
-Example:
-
-bcm2835_i2s: i2s@7e203000 {
-	compatible = "brcm,bcm2835-i2s";
-	reg = <0x7e203000 0x24>;
-	clocks = <&clocks BCM2835_CLOCK_PCM>;
-
-	dmas = <&dma 2>,
-	       <&dma 3>;
-	dma-names = "tx", "rx";
-};
diff --git a/Documentation/devicetree/bindings/sound/brcm,bcm2835-i2s.yaml b/Documentation/devicetree/bindings/sound/brcm,bcm2835-i2s.yaml
new file mode 100644
index 000000000000..f3cfe92684d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/brcm,bcm2835-i2s.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/brcm,bcm2835-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2835 SoC I2S/PCM module
+
+maintainers:
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+
+properties:
+  compatible:
+    const: brcm,bcm2835-i2s
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: Transmission DMA controller phandle and request line.
+      - description: Reception DMA controller phandle and request line.
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - dmas
+  - dma-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/bcm2835.h>
+
+    i2s@7e203000 {
+        compatible = "brcm,bcm2835-i2s";
+        reg = <0x7e203000 0x24>;
+        clocks = <&clocks BCM2835_CLOCK_PCM>;
+        dmas = <&dma 2>, <&dma 3>;
+        dma-names = "tx", "rx";
+    };
-- 
2.47.2



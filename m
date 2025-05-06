Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60445C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+mJcogAVas3iQKVSjpBc1cHOybxNj+jjcffdmlSZW7Y=; b=Er0h/YQia/Ec+zIA5HeTVJ+S+N
	0EniPan9lEy5sXs0sx0KGIMBTeKVDY+2vJfarXQht+TpRTyX1PIL0ZqzYJUlVf8ZQQPubWrlgEdSq
	PwbYsgh4x/WXi3N4jOiuP5OGUuooqlX0yNs7yCFkNwVbUcVKffGxr2b6icps9D233cvWOraB9Ryah
	lx4cji/KdjnS9HpSMm4ZX8Ly1bJNBnUwzQKlTW2ha4TKtvFkvw34CPhsgmlqrB0kCHlWcwj7qgbXH
	Nr/OnIDsuaeRJst7CS8lzOG/IbtZac1SvMaFT923UaGoBuN/dY4V0hrZ/nlVQGOzWg+MXLFUsLa8W
	tA5Nroiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUcY-0000000Dy0C-2Tku;
	Wed, 07 May 2025 02:34:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQLM-0000000DUyO-2DvR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 22:00:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A855061136;
	Tue,  6 May 2025 22:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3C5C4CEE4;
	Tue,  6 May 2025 22:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746568851;
	bh=eM85/T2zv3JvHnzRMBYb0t05nCijCfpQv0/4QmBfOpU=;
	h=From:To:Cc:Subject:Date:From;
	b=H86Y0XIFCJqx57Bxaf6FZO4W92RJ0izJRVnhHyT5uvDBvdSLEDr+nfd35Kyf93bjo
	 rjuPsBvItXlxr7yc5mseXmLONJMxDkGAIQGdVI4J8q7JVmaZXmoX5P89zkode8sLdh
	 UMADIAARzm3tECBIGV4AhBmC/IBQBKQXJHNtte67QQ6mjOinWzE1ohPp7BUNZjqC8k
	 q//wvYcdk6i5Sa2aYSoJBd2aje+8GSu8PR0fDDNKEzJGlTslv1GasDV9Ob1jI3ga/G
	 QZT2FKQLgB3YkKORFvalxSc1tk5HAOB0ajroDeFAzNdjgsp0HbS9msc/d41KTbPF8P
	 g5zdyKYGGeEwA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: serial: Convert nxp,lpc3220-hsuart to DT schema
Date: Tue,  6 May 2025 17:00:47 -0500
Message-ID: <20250506220048.2546915-1-robh@kernel.org>
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

Convert the NXP LPC3220 HS UART binding to DT schema. It is a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/serial/nxp,lpc3220-hsuart.yaml   | 39 +++++++++++++++++++
 .../bindings/serial/nxp-lpc32xx-hsuart.txt    | 14 -------
 2 files changed, 39 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/nxp,lpc3220-hsuart.yaml
 delete mode 100644 Documentation/devicetree/bindings/serial/nxp-lpc32xx-hsuart.txt

diff --git a/Documentation/devicetree/bindings/serial/nxp,lpc3220-hsuart.yaml b/Documentation/devicetree/bindings/serial/nxp,lpc3220-hsuart.yaml
new file mode 100644
index 000000000000..ffa2ea59f256
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/nxp,lpc3220-hsuart.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/nxp,lpc3220-hsuart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32xx SoC High Speed UART
+
+maintainers:
+  - Vladimir Zapolskiy <vz@mleia.com>
+  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+
+allOf:
+  - $ref: /schemas/serial/serial.yaml#
+
+properties:
+  compatible:
+    const: nxp,lpc3220-hsuart
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial@40014000 {
+        compatible = "nxp,lpc3220-hsuart";
+        reg = <0x40014000 0x1000>;
+        interrupts = <26 0>;
+    };
diff --git a/Documentation/devicetree/bindings/serial/nxp-lpc32xx-hsuart.txt b/Documentation/devicetree/bindings/serial/nxp-lpc32xx-hsuart.txt
deleted file mode 100644
index 0d439dfc1aa5..000000000000
--- a/Documentation/devicetree/bindings/serial/nxp-lpc32xx-hsuart.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-* NXP LPC32xx SoC High Speed UART
-
-Required properties:
-- compatible: Should be "nxp,lpc3220-hsuart"
-- reg: Should contain registers location and length
-- interrupts: Should contain interrupt
-
-Example:
-
-	uart1: serial@40014000 {
-		compatible = "nxp,lpc3220-hsuart";
-		reg = <0x40014000 0x1000>;
-		interrupts = <26 0>;
-	};
-- 
2.47.2



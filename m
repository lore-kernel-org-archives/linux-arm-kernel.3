Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9C9CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 12:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZpV1XOqKSNkT06onAmwaP2WVQoMQo3PVn3G4ZwPYNfI=; b=nQvKnzoPs0SabS/InkRsQOF/sq
	awkZzcabBrRJgAbX9S0r0hw9p+xttwoS6wjDBe08HQRUINNrImMpEVWdK6hxIyOyB6wbkU3Q3eSD0
	PitQZbZfhsP3A4M+GrE+VVmik071y04zvN3GttdV3P5SK7HcmciLwo2910ljYuSpJlue5H6JqrCBO
	0STJkQlOzj4eKRUqqRE5XtLovEE+v93eRdW1Wos7v9jkS+fKd/DyGhbyztLwqVN3FW7+1qscuDKGu
	euEsd/GsycbBq2ItldJA5HXqVfKYZvCV8uYdH3w5e52EL11NDdG+In9Ov2nMBdQ4RJvbmg/RFRh67
	nSECaLpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpqn-0000000HNOe-0KOA;
	Wed, 17 Jun 2026 12:58:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpqm-0000000HNNl-1q7B;
	Wed, 17 Jun 2026 12:58:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 35A604433D;
	Wed, 17 Jun 2026 12:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DA9DC2BCB8;
	Wed, 17 Jun 2026 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781701116;
	bh=0eWG87bF+UQiigmHsijMuQgSNzNUYROVEuHX76zakPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Pq6F4yWIHXs4ffd0bpZasJeo3ljg9xFO6mqdc3QgMr1Tnnvl1WuMp+HEo1fHatJ1y
	 qW18SOrs6E9XfKxrAuQ5kjPuhEuS6bfV4efWQ5sjuVsRjvaWrl8r9NR/GmuGJJt0W3
	 T7ja3FdRvwsJ32CPaMXbLfezYtoFJqyimaBFADD90+/xJA9mgNq/fEaZJ68uDI8Qfu
	 FAZrA5Byf+1AHWo7IKp29JjUUFCbFXWI8um67Hvx30XbWQ8lr4YIe2lQXCo9pPeq4/
	 N091ctDo0VQNix6BVcKGlkeOY2Dy127IN1FkpFFZqYI4zCkfCWGDd0w/xjNu97f1FG
	 taYc21sSW1Lvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3840CD98F0;
	Wed, 17 Jun 2026 12:58:35 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Wed, 17 Jun 2026 14:58:28 +0200
Subject: [PATCH v4 1/3] dt-bindings: net: add Realtek RTL8125 PCIe Ethernet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rk3588-dts-rtl-eth-describe-dt-alias-v4-1-2bd38922d129@pardini.net>
References: <20260617-rk3588-dts-rtl-eth-describe-dt-alias-v4-0-2bd38922d129@pardini.net>
In-Reply-To: <20260617-rk3588-dts-rtl-eth-describe-dt-alias-v4-0-2bd38922d129@pardini.net>
To: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2427;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=H/nj8b3jgAzNWmVGGkZNntiD7Pr7SSJBU8YukvNeE5Y=;
 b=owGbwMvMwMFoHWf/eN7xty8ZT6slMWQZzfypb7GI17p1rhTr/VK3bKk7fwpjlPsbC5eXLd7++
 /Hlc46nOhn9WRgYORgsxRRZ1kgo83xb/+rUHY+OyTCDWJlApkiLNDAAAQsDX25iXqmRjpGeqbah
 nqGRjoGOMQMXpwBM9QND9v+ZPEwSkeJ9Z/hF9IyW+sjEV+RFGiy5LR9R+SXPsOFC8yaO2wHPC3i
 mb+yvcWv+1DVjUl/Ii4pFOxt4LgdYVvSdFln36eH0ANvjJqFzPtTWvQ+zMp50ObHZoJu9Y0W5yt
 7+P+2OIXP45mSs++Zkuf//47BfPKfiEw793CxmvCMw9x3b25v5fS4zuhazh4hXvwg4VBnhUc5kU
 xoiefu938Mtn6/156Um6FlF3+wtO890K/P+Mf/Ym6lRwZcSBMsE4+9sdYpbxC3j/qHG1jyoopT9
 yvbz/IYaV4ziLd4ekr2tfeeJ1f0TR+d8k34WaFit/IZT6piZ0ZwFJ7Pe3T1iLh5eE3HZw39y+JI
 m9jnRAA==
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
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
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ricardo Pardini <ricardo@pardini.net>

Add a binding for fixed/soldered Realtek RTL8125 PCIe Ethernet
controller.

The "pciVVVV,DDDD" compatibles are the Open Firmware PCI Bus Binding
spelling, auto-derived from PCI-SIG vendor/device IDs, but they still
need a binding when used in a board DT - analogous to "usbVVVV,PPPP"
compatibles documented in their own bindings (e.g. microchip,lan95xx)
so board DTs attaching properties (fixed MAC, nvmem cell, ...) to
these PCI function nodes can be validated.

Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 .../devicetree/bindings/net/realtek,rtl8125.yaml   | 43 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/realtek,rtl8125.yaml b/Documentation/devicetree/bindings/net/realtek,rtl8125.yaml
new file mode 100644
index 0000000000000..eee13fbc1e6a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/realtek,rtl8125.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/realtek,rtl8125.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTL8125 2.5 Gigabit PCIe Ethernet Controller
+
+maintainers:
+  - Heiner Kallweit <hkallweit1@gmail.com>
+
+description:
+  The Realtek RTL8125 is a 2.5GBASE-T Ethernet controller with a PCIe host
+  interface.
+
+allOf:
+  - $ref: ethernet-controller.yaml#
+
+properties:
+  compatible:
+    const: pci10ec,8125
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pcie {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        ethernet@0,0 {
+            compatible = "pci10ec,8125";
+            reg = <0x10000 0 0 0 0>;
+            local-mac-address = [00 00 00 00 00 00];
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c8d4b913f26c1..e5fbd82946aec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -134,6 +134,7 @@ M:	Heiner Kallweit <hkallweit1@gmail.com>
 M:	nic_swsd@realtek.com
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/realtek,rtl8125.yaml
 F:	drivers/net/ethernet/realtek/r8169*
 
 8250/16?50 (AND CLONE UARTS) SERIAL DRIVER

-- 
2.54.0




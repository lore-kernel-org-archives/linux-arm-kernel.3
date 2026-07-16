Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A8BC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Cbd7RpSigAze/UtmT1+z+tOpgI5gcPixymoRHCvScg=; b=zMZLbXW4dj/s/Unryzd1JnrdmM
	CLarWeNsbKrDuJ7bDHxaSFIsJnBw59D+qDCQeAnEZkkKyG69s4i4WEjMFj0gcqwI2bhX6z2oaRDVd
	aUE693wRulvZcGEp76eOyxdtyAyLc4h7NI1EJuDWwY7uQryqXwr/NFJyIFOf1LFox5VSZ0j6/fq4d
	kLWtX/okz31V67BHVi55v64DNWvSjBtJnKi4C9wXR9ew0+tDKojkwgprmzyOAgRX2sjaG0tlt4iTf
	FdXJW5BGbLPlEIs0py9mdcE0je7fQ3ffKGhKpLQH3Rsc1bPQu91mLFTgMdILYYsxtJoV6Q710Nhdu
	uOBuufLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTkO-00000000e4s-3P5X;
	Thu, 16 Jul 2026 21:36:00 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTkK-00000000e1C-0lez
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:35:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493e4ccccc2so44446795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 14:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784237754; x=1784842554; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Cbd7RpSigAze/UtmT1+z+tOpgI5gcPixymoRHCvScg=;
        b=pIyMCoHu3ADEsXFJDzvanofKZNoysMyM2y9+ckKByq5cVeIlO4VHbWw6fYN1s8Wyoz
         pEYnw1Zo1K9b9Q1YUYuARZjssZ/c3a+BJ0aOtbnD8DCN6Qvs7ZNe/HEpZfer5u2bU4HY
         eQbHQ6O4OuOKVpuO+dqgrHcFJQrLxmaW8TXbUhADv1qhxNMV0cBIceJJl8iN9qJlUpZU
         B2UdzNVL2dy3FdxOlc7Qprg2F7k6CAnrjBQ2mWRdp8andY5lns+GF31O/Sx0mQi0X0Ie
         u5eGHNeBXa3KNS+z0E5Fnl7/3SuDJ33qzqa76YKlG2C/vrbiKsmy4a2QbFBsQH+ow4KM
         2fqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784237754; x=1784842554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Cbd7RpSigAze/UtmT1+z+tOpgI5gcPixymoRHCvScg=;
        b=QXJvSlnpaHdj129mF/fZ/ca3pKnRCZ/swJ2Pjh5K+mUuWqSu+PU5kzDDK6eTFE4oZo
         L4JnLbkJwvo5uRhhNo/4VUycNSqLL0rqLiLPeP+moBBLkHUG5LTN9oxsRtf0gvdG9/Hv
         fZ7p/Sr0AsGjLxNPlpRMPS5/8rNhUdZ5Zpjg+HhjPG/SHPoUpJ8rjIRemuS+T0JJkMQU
         5YYq6l/G3QgLuQNXhafOFjSBf1bV0qREmjcgm1EvMiUH1bCQZ1qoMh/qbNhYl+0oMfsz
         IDanLHZIOAfJJQ2GTtSSzBQy7rcf5Q9R5ZPXjoQMoLL8gO10EgNOhsw8PhHHk9n+na1m
         tQ+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp+6cVDy0kx9t7XQ0QfoUM1OYcc+cAfR0URyy97boJ8Qf6Q2FkhRYq4j1TPVER72TX55x/afDOdWSPzPmvpPmQ6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhmc2QKuz4ZpZblTZ8ht5eO2meBM0Wgy8fsh0Y28+oonzPaBoG
	J5rqTHCJjJ8jPJBaWjkuY+kPLyDqv29khW+0YFMZS16laRRpOqFjUiKl
X-Gm-Gg: AfdE7ckPAP5oH+hPj9zBPCrCaNNVTAGUt1we7o41S+R/bAQuE60OP1LeoewTOyqFHr/
	iGjd/OtONK8U9/MaVWDcO20Htm8Ro+GdH4xMrv18MuRPbgt0oGKNRvf0CY8ffi/tLoPMw1JJ424
	n3IxgvIovn2+HqG/+ZGc7eVscotc7dWGDDbKNF3shrui/+FSpjm2CVjRJQteWt30bb44r24A71j
	n2/Maa90Bqw/Qdbz30j5cmb3wWZLTZppJKqRbFnaqRHbuMLdouvvuy24AgtdLaIJF+gJDRwHvli
	zLp72JI+c+KdstjhaztOOIlMCpv6vFsYNjY85g4vbzDIWLrNdYiMML1uEK7tGECbWC0rRaiz5Ur
	2oLOoa4SQxiL2eKGQ/qgnMgJpHEd9yJBWoYYnr36qv3iF/hNRNtXx6Gdeo7/+rUp9jL85gobK6t
	68NaEULgha2DEj
X-Received: by 2002:a05:600c:6217:b0:492:4363:e7d6 with SMTP id 5b1f17b1804b1-49538cc1510mr144373665e9.37.1784237754220;
        Thu, 16 Jul 2026 14:35:54 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f09sm27517548f8f.26.2026.07.16.14.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:35:53 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 17 Jul 2026 00:35:37 +0300
Subject: [PATCH v7 01/13] dt-bindings: phy: Add zx297520v3 USB phy
 documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260717-zx29clk-v7-1-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
In-Reply-To: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5153;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=MWgeMQguSvX0yNa9AkilnGzLi/Gpu4RxxeyumH/X22g=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqWU6xcWZOmOXtOLohhzgy+hM6oOkxf17Sa7bRM
 oer1RlHKaCJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCallOsRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKD6w/+MJmxYIyepRX+FyR6Y2BS1xstCgAxbVa
 V2LfZHa60uXTnOQjweIZny/aZvtk9oG1fmQcB29kMUwDm50sZITCqWBMWRL2E+xjVH9r55CG47a
 csbwc6VvJWAohr4URm4L+nTQarehBpqczIbo+wh0HVKczceIp7areXGL/5/eYHfNCCExjcxzvyr
 84/h3Bq82p+gHYpmtOTWvezhrV5LXVS6nG0+y0wJBOs1xLcUJj5YiQjr6PnzVDswSIYVz4gP3N3
 bOwg8Nk2+pd+Uxjdw7+AbIiR8BaaFwwRcvQx1zr/3TdU2aCn5cNzoAFd64ZjJrIW3jHrlJBRfpA
 Om0s+tWSwC2XMqxF5epTfzM5P7uo2yC2QxbCG2GmDa5kek03rFQVL36ALPJX500QQthmvGttASu
 GqOG7LEUA52ljXfs8kLRU3QL1pde2ZN4QP6kyFl4yT9+8KlF22hGWc4BV0Byk82CY9nnteMzj5Y
 NehEK9+olrStownN5eU1Y/XRUOBdsr5yjaiUlnGfB2w93dUe7GNJdPDm427SQ62gAQ2p0P2Wv3t
 dUOpqRXXJTdKaL//MCZ3rw+QPL5AegBy9YyKISXQGBoUjg50L2aH7pdLNS15x1c43zbNmwDKhYh
 oOTzG68KamAIZoheKX+RVCRcs+Xm8gO3gwdge8ZC5xHGJOIc27to=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_143556_262739_F79B48FA 
X-CRM114-Status: GOOD (  21.75  )
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

This binding will be used as a subnode of topcrm, which will be added in
the next patch.

Why is this a child node and not #phy-cells added to topcrm itself,
like clocks and resets as writing-bindings.rst suggests? Because
of_phy_provider_register checks if the of_node the PHY provider is added
to belongs to the device or is a child of the device, so I can't put the
PHY driver into an MFD (or AUX) child without its own node.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

How do I handle examples? It would be identical to the example in
topcrm. The example needs the reset defines from the next patch in
either case.
---
 .../bindings/phy/zte,zx297520v3-usb-phy.yaml       | 96 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +
 include/dt-bindings/phy/phy-zte-zx297520v3-usb.h   | 12 +++
 3 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml b/Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
new file mode 100644
index 000000000000..8bad9365d5cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/zte,zx297520v3-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 USB and HSIC PHY
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  This PHY is found on zx297520v3 boards. It has no configurability on its own,
+  but it does require a correct reset and wait sequence to initialize. It can
+  provide interrupt notification when USB is connected and disconnected.
+
+  The phy is a component of the board's topcrm controller. The hardware needs to
+  be declared as a child node of the zte,zx297520v3-topcrm node.
+
+  The register space and IRQs always account for two PHYs: One USB 2.0 OTG phy
+  and a HSIC PHY. Not all boards have both. If one is missing, the corresponding
+  ready flag will never be set.
+
+  The "include/dt-bindings/phy/phy-zte-zx297520v3-usb.h" header contains the
+  definition for the PHY indices.
+
+properties:
+  compatible:
+    const: zte,zx297520v3-usb-phy
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: IRQ reporting USB connection
+      - description: IRQ reporting USB disconnection
+      - description: IRQ reporting HSIC connection
+      - description: IRQ reporting HSIC disconnection
+
+  interrupt-names:
+    items:
+      - const: usb-up
+      - const: usb-down
+      - const: hsic-up
+      - const: hsic-down
+
+  resets:
+    items:
+      - description: USB phy reset
+      - description: HSIC phy reset
+
+  reset-names:
+    items:
+      - const: usb
+      - const: hsic
+
+  "#phy-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - resets
+  - reset-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy-zte-zx297520v3-usb.h>
+
+    topcrm: clock-controller {
+        compatible = "zte,zx297520v3-topcrm", "syscon";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #reset-cells = <1>;
+
+        usb-phy@84 {
+          compatible = "zte,zx297520v3-usb-phy";
+          reg = <0x84>;
+          interrupts = <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
+            <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
+            <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
+            <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
+          interrupt-names = "usb-up", "usb-down", "hsic-up", "hsic-down";
+          resets = <&topcrm 18>,
+            <&topcrm 20>;
+          reset-names = "usb", "hsic";
+          #phy-cells = <1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8729cea57c3d..cb50c2e3b4ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3878,8 +3878,10 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	include/dt-bindings/phy/phy-zte-zx297520v3-usb.h
 
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
diff --git a/include/dt-bindings/phy/phy-zte-zx297520v3-usb.h b/include/dt-bindings/phy/phy-zte-zx297520v3-usb.h
new file mode 100644
index 000000000000..8a0a3ccbdd63
--- /dev/null
+++ b/include/dt-bindings/phy/phy-zte-zx297520v3-usb.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger.
+ */
+
+#ifndef __DT_BINDINGS_PHY_USB_ZX297520V3_H
+#define __DT_BINDINGS_PHY_USB_ZX297520V3_H
+
+#define ZX297520V3_USB_PHY	0
+#define ZX297520V3_HSIC_PHY	1
+
+#endif /* __DT_BINDINGS_PHY_USB_ZX297520V3_H */

-- 
2.54.0



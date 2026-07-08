Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3296EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H89YxPz+LDcG3sLulupfETRoJ4vkpxtSzZRwMnjcQcA=; b=jt1qXoJoV3iEPzYhw31plaBM8p
	onxFzMqquW5ruvHo3zHULXCz1NOgf4zpXGhN3GtKoHIXtbQwdj/slgrqnSYP194gPvENM5YDcoTFJ
	cR86L5Jqy7NqLNIgAOmiTPYU6kS/+aEnifD23szI0BjbrAmlZUKbZfEq7rZSfC1qaOOJtxbTBFx0R
	UIWq7qRiudFny+gXXyp0gINWMMu9fRKnbpC+1vFT2DySxGAJRODWjWjy1N41e15VT9nOyx9gHEmbR
	LDqU7n5kVBKt5i+5Wp/VtiBFauThjvN97ml9NcP5ROPQDpT1bGZAii4T/0vfTb+7KVxD6A7wDJXpD
	W+g2s67w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPdc-0000000Guss-0GCc;
	Wed, 08 Jul 2026 10:36:20 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPdZ-0000000GurA-2Yi1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:36:18 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cacd69a9c0so6252565ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 03:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783506977; x=1784111777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H89YxPz+LDcG3sLulupfETRoJ4vkpxtSzZRwMnjcQcA=;
        b=cQXdWUJfovL13jezJZKL36VOOXoJaTDhwNhQSVZbTl0qF2o2IjXOLY3yYVmtK2NbVQ
         I9FWiVX/NcDK/D0C+2JQqy4svdx893qwnJRRdIxcEIFhbrTtfX/cymmFhn3ZDddKyOTi
         +TLnqmrD1CCx9IqYngJ2oAT2hSN6rVNqFEQ5eFD2g+Y2Pdypmc1PwaVVTo/ej6Zj+jnZ
         S1q6bZRFOlMxckB8aEnRp+DhI+UL+hT1e/crxIzqiYaGwG6FzaAcKZQGlRc8My8ZhYPv
         wYyLylZKyThDqfiZY9LsNZPgqGea/Ff3fFz80sZTm4MPdluvtFecYW0HJRp/HxlhvTEG
         KqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506977; x=1784111777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H89YxPz+LDcG3sLulupfETRoJ4vkpxtSzZRwMnjcQcA=;
        b=BgVT7+fByJFOPCR8kKJjKILo2rLTk0+dksazafJ3bD2mG17MG6hlwRKgv2fCmtflD4
         kiCtFEdSHRDL2/+8EjqDq71949qwZ0KOvFSTw7Dwk7YMMG2pORQ3uDYI2/6P5mOeEdEV
         3wmYDldrnU+qpMvCcJN7A9lYWUJ719cXqBjTfcLzLRACbf+oYubkgM+Xl7ijZbRVuQc8
         fXJLaSiVXOd6SgMdL9DTAwvHoOTiZkoQnhv+DE6v9bLlSVnJTP8CIVyBaYH9NZUWIFCL
         27R2vnf2RIWdfzXRmRKzVpvchhYZNuCvWer+CdNbUX2e/5nADsYZ3BhZsMYGVQgDbApR
         Gf3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpsgp1aEKEgkwzWO8w7GWDmoAhwwcecyd/afKTxBzy94S8hDKySizWYwZhb5lO136KxwHPt8DinWEKgpG3zZdxA@lists.infradead.org
X-Gm-Message-State: AOJu0YxAdy0rifr6v1oDaUzcQLkzjxTeg5FmvHLMJFlA4q/WaHfpvt6P
	F5qrpXn6B9/QtBo26JRgDPyqP0rMJ/1CfGEzbhMxahQ+i6UXRmWW1D1/
X-Gm-Gg: AfdE7cnyDQ7a4YIQiuFbh86ApSfvdHJ7SqPRuJB66cVpgqJSFWfhdzsES9X5mTdQYeX
	YCz8ZPueAp9qXOy4R4LY93UhF/R1vB8+8/C4SL7tNU0e0wF4XbwjLpNf48tXLeniiwl0mRI5qWn
	2wyYWYfXOiJsHzj4cwo6f/W0je2T+i786+j/pKQM7j1rnnQup0qwGRdthiDgXZ9xFyVP/W6UxKa
	pnTEIJr9cKlpVCsHhcowLxwXSDneq6RGEO9504ms4SEc0+IqINfZ37iLP5rwBTAKspZL6e0Ytll
	PXV6KXdXnwIvmHSzx72lmefIs+W6Mwag6Dc0L6/APp0MIsllSFFaAOLuxYgsSLdDnHYJnfNB+NQ
	8IBehsD6qx5r8hT72Rsi8KOR0qDpdrbXmAwp6cdFJkQwhYoE62NJY+yShMPxRwtr3bXp35Hj2KP
	MbH7fe8n19nkcDL7vlDHtyFcEHHE0jFR6bZ5Lckg6L+cqpCrRRxlLe8KOnQtu7hN4N8906jrmz5
	A==
X-Received: by 2002:a17:902:dacf:b0:2c9:e9c7:2b59 with SMTP id d9443c01a7336-2ccea42e1famr18928175ad.35.1783506976495;
        Wed, 08 Jul 2026 03:36:16 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9a3sm25987525ad.13.2026.07.08.03.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:36:16 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and OTG
Date: Wed,  8 Jul 2026 18:36:04 +0800
Message-ID: <20260708103606.1462960-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708103606.1462960-1-a0987203069@gmail.com>
References: <20260708103606.1462960-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_033617_658334_53FEFC76 
X-CRM114-Status: GOOD (  17.37  )
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

The MA35D1 exposes two USB PHY ports (PHY0 and PHY1) managed by the
same hardware block (USBPMISCR register in the system-management syscon).
PHY0 is shared between the DWC2 gadget controller and EHCI0/OHCI0
through an automatic hardware mux that follows the USB ID pin; PHY1 is
dedicated to EHCI1/OHCI1.  Because both ports share the same register
topology a single binding and driver should cover both.

Changing '#phy-cells' from const: 0 to enum: [0, 1] lets consumers name
the port they need while preserving backward compatibility: boards already
using '#phy-cells = <0>' continue to validate and function unchanged.

The two new optional properties:
  - nuvoton,rcalcode: the resistor calibration trim code is determined at
    board design time to match the PCB trace impedance.
  - nuvoton,oc-active-high: the over-current detect polarity depends on
    the choice of VBUS power switch.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml | 45 +++++++++++++++++--
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
index fff858c909a0..191d1b2272ec 100644
--- a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
@@ -8,6 +8,18 @@ title: Nuvoton MA35D1 USB2 phy
 
 maintainers:
   - Hui-Ping Chen <hpchen0nvt@gmail.com>
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  USB 2.0 PHY for the Nuvoton MA35D1 SoC. The PHY node is a standalone
+  platform device that accesses the USB PHY control registers inside the
+  system-management syscon block via the nuvoton,sys phandle.
+
+  PHY0 is the OTG port whose signals are routed to either the DWC2 gadget
+  controller or the EHCI0/OHCI0 host controller by a hardware mux that
+  follows the USB ID pin automatically.
+
+  PHY1 is a dedicated host-only port used by EHCI1/OHCI1.
 
 properties:
   compatible:
@@ -15,7 +27,12 @@ properties:
       - nuvoton,ma35d1-usb2-phy
 
   "#phy-cells":
-    const: 0
+    enum: [0, 1]
+    description:
+      When 0, the node exposes PHY0 only and consumers reference it
+      with no cell argument. When 1, the single cell selects the port,
+      with 0 for the OTG port (USB0, shared with DWC2 gadget controller)
+      and 1 for the host-only port (USB1).
 
   clocks:
     maxItems: 1
@@ -23,7 +40,29 @@ properties:
   nuvoton,sys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-      phandle to syscon for checking the PHY clock status.
+      Phandle to the system-management syscon node providing access to the
+      USB PHY control registers.
+
+  nuvoton,rcalcode:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    items:
+      minimum: 0
+      maximum: 15
+    description:
+      Resistor calibration trim codes for PHY0 and PHY1 respectively.
+      Each 4-bit value is written to the RCALCODE field in USBPMISCR and
+      adjusts the PHY's internal termination resistance. Both entries must
+      be supplied when this property is present; when absent the hardware
+      reset default is used for each port.
+
+  nuvoton,oc-active-high:
+    type: boolean
+    description:
+      When present, the over-current detect input from the VBUS power switch
+      is treated as active-high. The default (property absent) is active-low.
+      This setting is shared by both USB host ports.
 
 required:
   - compatible
@@ -39,7 +78,7 @@ examples:
 
     usb_phy: usb-phy {
         compatible = "nuvoton,ma35d1-usb2-phy";
-        clocks = <&clk USBD_GATE>;
+        clocks = <&clk HUSBH0_GATE>;
         nuvoton,sys = <&sys>;
         #phy-cells = <0>;
     };
-- 
2.43.0



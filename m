Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD08BCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 10:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=du3ehlF1Uyll9z9fTITCQGImnBetFueZCw24wEt4ZU8=; b=ugae6RWwPmuMEQXKbvoQuoIi6M
	7WLWTdoAIC2wB2eVgVi+oPu21C2iPNj6tXRB955lvqmyOPKFnlSEC/Rhyz+um5yuVM00tPLTUARqV
	fD3P5/w1GmnFHi3uyhXb0haZ4H2zrIqSbi5QhuwE2WWGaRFlZg4htqloy9eWbuPGhkYPRWoMzQzo4
	aciALmu7u+F5YQRHBwowH2ISy0xsCUpyesQZXSYAHjlt7J4+up21hXu/82B5Wfc51Hz93q67sLUUp
	7pwxdZniGGJikeT4LcFfitVhhPc9IM81F+2KcKUA9ZAyFem5KD1dkqbId3dziJNau4OCp5rIv+oSX
	tm+draXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV53x-0000000GYB1-2y7c;
	Thu, 04 Jun 2026 10:12:33 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV53v-0000000GY9u-45ym
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 10:12:33 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-36baec934b6so984482a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 03:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780567951; x=1781172751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=du3ehlF1Uyll9z9fTITCQGImnBetFueZCw24wEt4ZU8=;
        b=PGFFknxRKh2OagMUfzMM5xCd8HO/Rij4IOe5eXPL9Sf3ej1osuOCUl8AOy4p6erlB1
         3cU5LnilgCmk4w/yrjFtPQ345QCjtyvhsJqavS83SXGYiWu12rTs0K2cKaRlp9Q0+gAf
         5O/3QJ2kiiiJc5VXi+CQ/LVq7XiGe2ykNaHt8Vx+Cctod6B+gBleAzOqjKD16A4wtH6m
         1+PpSlO5WIDpN4tb/pklfk8wWFxsJdRdIDCZlOshAJKg/RG4yi7hAdSBTnADNRPur9M7
         mlKxkR1azneRJ3Zd9lpTiehkp9wL2HbdvO522BQEj+dznq/EyxzMRATk1y/zBthpej2u
         AWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567951; x=1781172751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=du3ehlF1Uyll9z9fTITCQGImnBetFueZCw24wEt4ZU8=;
        b=BkALGVwAZEPSofYFF7LEnwNIm5kxzvnpVVKIDUvr+woUuUN60VdK+/2hYxFtJ8Fgjf
         baIzvX/va05hd7S1RCaU3Vs/bli6viO5uuZRuIMHeF5K25ENyWOJrx5fvsYQOyzSLdNn
         SAAN0g79LRkPnvKGrLYg75D0M2rWKiISo1bYnRXEJYOtOyhHGzcW/7Qa4sk1jlEBWfi1
         qKCb/ZcWqlp2RwV/yVkDvjpNj0tnQR5sba0/YFDJAnsYPK4RVazhZPHh1rKydoogpHew
         OyXO0Rc8HWst0fTq1cnP1AsiwKgGIc530Le4KVNH4dG8glbCJGjnfsXK/9mzvhTcqs2g
         Lm+w==
X-Forwarded-Encrypted: i=1; AFNElJ9uehLk4czuM6ILulByK0gQjAPpJfGB7graJmeWL++zeHNmb0+GA/aJuhGlYQ45vF3EZAsYhHZePmDH22O/p2HI@lists.infradead.org
X-Gm-Message-State: AOJu0YzSgK4Dexa5LmuY9w7iSG96IL1r6r7ouFKuoeRa2E1wutGHfkyQ
	RHrInLl/wYC7M6EWoGUFqQVc4iRlIaJF6DBr8adFeBShAEK9z55L7Xw0
X-Gm-Gg: Acq92OGUfKvxx27QX7tjHxvdkCP/1E60wNbSQLJu4D/8xVgZ3d3AQz56t3xUIOb9TWs
	f4bOhOm3PzTrUQgEOUcQQQrgOuefR7QnVNyQX3/Cgsfnc337UfRflCVIQFjHyA8U2t0ToGuXxgm
	Lyn3nMKPBrAiLdBUHSb2E2aVKtrpP847G7YoMub5pczQlaor4OoWMGZ6o6apExZiRi/htvWwO+G
	URbHUNFOf2h14D7zlEfF/kt7OXwoFg0UKw4x7lzZMOIO4BXf0OE6BY9o3vkBfr9HUSvz3rPWnz/
	4z2ag+F4a5zhJ8pWOn2keArtbIgCKK1hUWSKE0bP3UZcLO6YoFFLNv48DTLU+kljAz0WTkkAg3H
	mDg9+AwD96cn2pnnEk1MPSyQ9SYB/FycRDGomeFzfs4jR0BZmMDuz+752wbMOHUaqcCg9Km1Xgv
	vgbzoRSSC8eRCOLgIdYjoaowtupn63nzccU4NgXvPivv/x38tm22IOz58L1bzkTXy3E1MsMsCIf
	Fl39q8vysKIqA8eX/rSfxc=
X-Received: by 2002:a17:90b:2c8c:b0:368:65d1:893 with SMTP id 98e67ed59e1d1-36f75f9c22bmr2777074a91.5.1780567951044;
        Thu, 04 Jun 2026 03:12:31 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a29cd6sm2483385a91.11.2026.06.04.03.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 03:12:30 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 1/2] dt-bindings: phy: nuvoton: Add MA35D1 USB2 OTG PHY  binding
Date: Thu,  4 Jun 2026 18:12:19 +0800
Message-ID: <20260604101220.1092822-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604101220.1092822-1-a0987203069@gmail.com>
References: <20260604101220.1092822-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_031232_020237_EA079EE9 
X-CRM114-Status: GOOD (  17.08  )
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

Add device tree binding documentation for the Nuvoton MA35D1 USB 2.0
OTG PHY driver (nuvoton,ma35d1-usb2-phy-otg).

PHY index 0 (USB0) is an OTG port whose signals are routed by a hardware
mux to either the DWC2 device controller or the EHCI0/OHCI0 host
controllers depending on the USB ID pin state.  PHY index 1 (USB1) is a
dedicated host-only port.

Optional properties allow board-specific resistor calibration trim
(nuvoton,rcalcode) and over-current detect polarity configuration
(nuvoton,oc-active-high).

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../phy/nuvoton,ma35d1-usb2-phy-otg.yaml      | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy-otg.yaml

diff --git a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy-otg.yaml b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy-otg.yaml
new file mode 100644
index 000000000000..19f074565cc6
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy-otg.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/nuvoton,ma35d1-usb2-phy-otg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 USB 2.0 host PHY
+
+maintainers:
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  USB 2.0 PHY driver for the Nuvoton MA35D1 SoC, used by the EHCI and
+  OHCI host controllers.
+
+  USB0 (PHY index 0) is an OTG port whose physical signals are routed to
+  either the DWC2 device controller or the EHCI0/OHCI0 host controller by
+  a hardware mux that follows the USB ID pin.
+
+  USB1 (PHY index 1) is a dedicated host port with no OTG capability.
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-usb2-phy-otg
+
+  clocks:
+    maxItems: 1
+
+  nuvoton,sys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the system management syscon.
+          - description: PHY instance index.
+            enum:
+              - 0   # USB0, OTG port (shared with DWC2 gadget controller)
+              - 1   # USB1, host-only port
+    description:
+      A phandle to the syscon node covering the SYS register block, with
+      one argument selecting the PHY instance. Index 0 selects the OTG
+      port PHY (USB0) and index 1 selects the host-only PHY (USB1).
+
+  "#phy-cells":
+    const: 0
+
+  nuvoton,rcalcode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    description:
+      Resistor calibration trim code written to the RCALCODE field in
+      USBPMISCR. The 4-bit value adjusts the PHY's internal termination
+      resistance. When absent the hardware reset default is used.
+
+  nuvoton,oc-active-high:
+    type: boolean
+    description:
+      When present, the over-current detect input from the VBUS power
+      switch is treated as active-high. The default (property absent) is
+      active-low. This setting is shared by both USB host ports.
+
+required:
+  - compatible
+  - clocks
+  - nuvoton,sys
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    usb_hphy0: usb-host-phy {
+        compatible = "nuvoton,ma35d1-usb2-phy-otg";
+        clocks = <&clk HUSBH0_GATE>;
+        nuvoton,sys = <&sys 0>;
+        #phy-cells = <0>;
+    };
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EADCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 02:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hg7nZM6fsd6Xr+ewyTepiGiAfne1TUcKmrwNgtdGTJs=; b=zh1usbnyAwjyZeNooPNgxYLfBy
	skjVpTrkeQlTHrbf7zq/1omkp8540NV/SHS1cV2rSnWQlYhDHZYiPYzfplFo+fClkIJonhmfU9kip
	UCbaVX6SSKaCKxBGIOjNJcEjCFc7P3bFNB71J7HKu8L3yzFq4L2jHf2ff/oNP31LfZHhA7J4I3ww7
	1d9W6cuomUnp3cFPn13vMGxdhZn1WC2EKXNy/ZCQtGoRo4OpmCS1sTaMTfMI8rvQAeKBOh9qkip+S
	fEmjG1mtzoXNfH3Lk4XFbY4Rx1bVze9ih9cpXj18pS4A7gJCRXJku9RjRx3mwKNUOJ+PQ4OTpvUuy
	KfBrBECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wca0q-00000008Zqg-1g9L;
	Thu, 25 Jun 2026 02:40:20 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wca0j-00000008Zms-1ajS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 02:40:14 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c7ebfbf2d4so8349375ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 19:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782355212; x=1782960012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hg7nZM6fsd6Xr+ewyTepiGiAfne1TUcKmrwNgtdGTJs=;
        b=k3EILS5i/64dGipJI0txWZiaNITW1rZXq+TOSSa4mncMcUEGqRXtQ8UuQ16fDlBlja
         zON4GnlXf2Ds/JWP19niESysXGLLA0BNRqFLCW127mXl6q2INeUUcfM+QJixDE5COoG+
         Fz/wcqOLlykO1isEc6uN8HJcIdnJ/wmzmDSOPnSA/ON/HDQbAJluherwaew+V+oHE/+i
         4bpJBx0ut5DAt5S2glYqAfH3joX/x6tljgqgy9T9y/wQydvHewQc3T/1tsYbE9LKexcv
         1uGBobWSWgRXW7I7LQsOVcVy6Vc4dnY7H2JhcChe8iL+ZUjozTLd0muUB4uI1w3cKfUW
         3fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782355212; x=1782960012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hg7nZM6fsd6Xr+ewyTepiGiAfne1TUcKmrwNgtdGTJs=;
        b=eq4IjAha1z/DGm+E2ljAc3LlscKTZMbA3nYyLrvqRYMTaiLY+J5PDdOLDXs9lwA+jP
         uSnVkuzbEgswY5d272f74LIThvfnp19CW84Tm+m8ppkDjxq+BxFXVwGjXRxHishtFot2
         eBP9QPpDSY9rpbtHCc/43DDpT2CBRH8bIkI6lXp7ojOJeoWEnfF/22wJitdRfWdtPGd4
         ydCxs9SIuuCjfSohhvy+AKV4xb50wjZb/1N53xv0ZuA4UqzZBsqqldWVGwUYZDyHqQ94
         G2PWRe/CHgS5MSbl80pBe4zb8kktQBp5TfnaHjH+KZ2QkM+ROL+9e/fthNCXSiZKw+zU
         eF5w==
X-Forwarded-Encrypted: i=1; AHgh+RokT0bnOF2idVvWM3iffCHdBVJ/a4jeKEGvPouJRI50qtb+CjJtU11/76LR+d/6uzZLmSrCaK9aylP0XE1KlGKd@lists.infradead.org
X-Gm-Message-State: AOJu0YwQBee3M6txE7D4gFtJDVzqIfzAtWYBWFjEXz5+36vjrrSbws13
	c88FMs+7Yxz4jgiNivaWWpFY29mjvzdqABCvefVXeLR1+1vvUTprSbJp
X-Gm-Gg: AfdE7cn+BY72509ONfzfKmAlc4G2nzGOeMrkcpgDSJdPMO6UjoK2R6Z7HAdV2ZuHRwX
	oLEtJ+Lwiy+hop08/TTCzNAQWn9zJLViLtSRPHMKV+Y7LIkhWnpi+K3xT0Ic/YTJ+hOxM1zcBUz
	LEzaZDthInf5cG1ksXNuauJkvk/uWGw5sPq3QXCGK7pkY+j8DxpAlgcbMlWkFISm8Z7XWi4rBV1
	jKx48TRYz+TeQfDsMGSi6uuV6UR83Rq7gEKcGmr/iTvlLt1lDrofv5P6iV/4ccQ2VVgxtChgkVN
	Aw1iYgY+qtSclv3tvJCbMdN4huo6wrpYN9ei24i3/NbDmcQy86lVZCQDNKkhFIfUbmlNBPn2J9t
	LILB6MdUuSCpuzCd9cNfryPEgP1oGFnKWc0CLjUPZX6a3pdTZAEAb+oIf7f9Krg3HDIpnXHAH9F
	QPEL0f1YDv6ihKK7ijrv5Tq7CgEW6XvyQ0c4iElks8PCO8hfiWQhG4LueyWtn6VeC3xO3MQSv+P
	g==
X-Received: by 2002:a17:902:f60c:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2c7fc9e00b8mr7166655ad.29.1782355212044;
        Wed, 24 Jun 2026 19:40:12 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64dc839sm8538545ad.68.2026.06.24.19.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 19:40:11 -0700 (PDT)
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
Subject: [PATCH v2 2/4] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port OTG support
Date: Thu, 25 Jun 2026 10:39:56 +0800
Message-ID: <20260625023958.569299-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625023958.569299-1-a0987203069@gmail.com>
References: <20260625023958.569299-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_194013_433913_431C28E7 
X-CRM114-Status: GOOD (  17.22  )
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

The MA35D1 has two USB PHY ports managed by the same hardware block:

  - PHY0 (index 0): OTG port shared between the DWC2 gadget controller
    and EHCI0/OHCI0 host controllers.  A hardware mux follows the USB
    ID pin automatically.

  - PHY1 (index 1): dedicated host-only port for EHCI1/OHCI1.

Extend the existing binding to cover both ports:

  - The PHY node is now a child of the system-management syscon node
    with a reg property.  The nuvoton,sys phandle and clocks properties
    are removed; the driver derives the regmap from its parent, and
    clock gating is owned by each individual USB controller.

  - #phy-cells changes from 0 to 1: the cell selects the PHY port.

  - Two optional board-tuning properties are added: nuvoton,rcalcode
    for per-port resistor trim and nuvoton,oc-active-high for
    over-current polarity.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml | 62 ++++++++++++++-----
 1 file changed, 48 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
index fff858c909a0..a20d03c80932 100644
--- a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
@@ -8,38 +8,72 @@ title: Nuvoton MA35D1 USB2 phy
 
 maintainers:
   - Hui-Ping Chen <hpchen0nvt@gmail.com>
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  USB 2.0 PHY for the Nuvoton MA35D1 SoC. The PHY node is a child of the
+  system-management syscon node and covers both PHY ports.
+
+  PHY0 (index 0) is the OTG port whose signals are routed to either the DWC2
+  gadget controller or the EHCI0/OHCI0 host controller by a hardware mux that
+  follows the USB ID pin automatically.
+
+  PHY1 (index 1) is a dedicated host-only port used by EHCI1/OHCI1.
 
 properties:
   compatible:
     enum:
       - nuvoton,ma35d1-usb2-phy
 
+  reg:
+    maxItems: 1
+
   "#phy-cells":
-    const: 0
+    const: 1
+    description:
+      The single cell selects the PHY port. 0 selects the OTG port (USB0,
+      shared with DWC2 gadget controller) and 1 selects the host-only port
+      (USB1).
 
-  clocks:
-    maxItems: 1
+  nuvoton,rcalcode:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 2
+    items:
+      minimum: 0
+      maximum: 15
+    description:
+      Resistor calibration trim codes for PHY0 and PHY1 respectively.
+      Each 4-bit value is written to the RCALCODE field in USBPMISCR and
+      adjusts the PHY's internal termination resistance. Both entries are
+      optional; when absent the hardware reset default is used.
 
-  nuvoton,sys:
-    $ref: /schemas/types.yaml#/definitions/phandle
+  nuvoton,oc-active-high:
+    type: boolean
     description:
-      phandle to syscon for checking the PHY clock status.
+      When present, the over-current detect input from the VBUS power switch
+      is treated as active-high. The default (property absent) is active-low.
+      This setting is shared by both USB host ports.
 
 required:
   - compatible
+  - reg
   - "#phy-cells"
-  - clocks
-  - nuvoton,sys
 
 additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    system-management@40460000 {
+        compatible = "nuvoton,ma35d1-reset", "syscon", "simple-mfd";
+        reg = <0x40460000 0x200>;
+        #reset-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <1>;
 
-    usb_phy: usb-phy {
-        compatible = "nuvoton,ma35d1-usb2-phy";
-        clocks = <&clk USBD_GATE>;
-        nuvoton,sys = <&sys>;
-        #phy-cells = <0>;
+        usb-phy@60 {
+            compatible = "nuvoton,ma35d1-usb2-phy";
+            reg = <0x60 0x14>;
+            #phy-cells = <1>;
+        };
     };
-- 
2.43.0



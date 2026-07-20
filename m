Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD114C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVUZrYg+XX3ftKTmbZ6y3GjBx4YY/KKIzTtukvscq4w=; b=G5U2OXsUb0+TcCBNN3PfbEP/vB
	CKsg2aLzuNJD/UTdXzTZGlImBkjV9yUqAqs7Z6x3gzBWXzTWmzV1Otls9uQUg3MJ6gFj7MKoOHZtj
	bTiwr1sRWhZHmI06kXZuNX6jnPhEj8ybmdrXsDRoIA00v3/0deNNQbIg9dTnHCZ/vQBFjF/EbifWn
	cjM+fYvuqXi58wDto7ZX02pc+iRBKzUNAk4erdmhdYgVdh1mCtZoxGKtMYiTXfY1XoE2PdlzES0K4
	zSoHrpzaAYT9vjcoZ8IJeY9LBCtpmu4z13SDaqsVN4xAKIctIBST1mfQFLiw2CMj09f/11ABasXcu
	y/XWgzOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wll8w-00000006TZD-1mMb;
	Mon, 20 Jul 2026 10:22:38 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wll8r-00000006TWY-37r1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 10:22:35 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso6050213a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 03:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784542953; x=1785147753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVUZrYg+XX3ftKTmbZ6y3GjBx4YY/KKIzTtukvscq4w=;
        b=CA8xvDHca0Ze5KIgYw3ZLpXEL3wQXqyi/0ej3dKdgo+IkYZGFzCfPSlkOiJhMBtUWs
         DvzgI19c8GHxEkYv7v5IZESjMpKl4HV48lLqH+bfN0pRG7cyKumK2Kis7dFBEFY8sfLE
         kIl1S66d9Jy3Hi8sH66kFwXTDLxnSfMRui2xoWQFMLoVwvyfCicgX/0D4ReN9UIB1ZZ+
         QjPMOA6gNZsm0IAfYOkfEQ75L1YOogyJY+B33+m/DXgmB36qxGhCCK8Zj8hSbqupsbVx
         vQiAg8eIkqHgZt1oOP2AIuv6eFcN8RqLv1EguGX8KpwxkvjBPhejbioAQ5UTZGbKmX/o
         hLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542953; x=1785147753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVUZrYg+XX3ftKTmbZ6y3GjBx4YY/KKIzTtukvscq4w=;
        b=HuvHYEhXRSn/DaB6Af2YsPNmj63oXbUKjQYbGcOxNnOvF2oNVHC6QKe2Lw6BglmeMr
         sLQqhcY1G3hFKYtsVHwiduv9jrQYPqD7Jkg8ACJZOBgxP5yR2zkJ9Do1LhPN4oHzI11E
         kInyRrzwa/G+BfXkOATbHAwhMN83Got6i6daV/OKpqQcRIQIcr1RwD4R+63iJHFHwcWF
         Hot63ChxW1QXFL0FkcWjFpN4YZ4RZ0Epd2bkLKytLS6v4BR8rEDsqMnLiLhsTVB+wwMP
         3OhPtYW19r7oIda0YMPDRB7zpzE+mODQ0S0jw5mGG76hHtQ8g2AVaAMo6dA+Aj2DR8wC
         UvtA==
X-Forwarded-Encrypted: i=1; AHgh+RrmiI7+zQml2jzgRx6x/lG/Lk1g8moK+H4M48tYH1koVewuuMF3UJu8bnb1OCsJgm0fE9ZzfSfpAmtDml3tmxfo@lists.infradead.org
X-Gm-Message-State: AOJu0YzXJO0nJHyfY9xWl+DpiTeYt/1GwezlzekCn4B9gzMu+UxBpruC
	DDFAeEUrRj45rq6olC+4KMY6tHotR6sT7iityByFOH8WQUQ1bCIVKnFR
X-Gm-Gg: AfdE7ck5lLOwzRGQnop8ZXF7rn6oBqIXpphDn6lDb5reL/Bmmzg1CU2pk8GIbjrpwzb
	sD//BN2xXo94H2XQDLbbXPLKaYVK/U7uV/kgI46pzTQVrPPSoznIKGTzqonVtiMzLZLuFK/BsbH
	1DY4RJL3bZlwiZI8jdXCubkz5fdCFn1wHpu8aG16IcVn0uonnedcxEgyMZEvhh6tzHM0jxJyqos
	hJH9L7hzrlPM4GCEqIHovr4Dz7mpUsTH3bvPPngO2Bu5pt15leUZ3JB24oYsgjOi1AG/ND8dd3l
	BUS7klllMWeOCE68k5nxVEzmEfVDxR7cwPJhOoiq5lNP5lbIrL5rf+Z7Zo+qXpcTpmkJmY7+ymo
	CnlcGvgxmbuV7e1XDxzEJaLtxzXQ67JNsUDT+/qF57T1xhsQ7Tz/QCpOT6q/YHkgC7j/mNqe1PI
	Nu/AZRjJZiz+5wxNJPV7NmKbWcOC76WnN+Zdg+r25/koI0m7bWbpj6n9Uqm48FJj0=
X-Received: by 2002:a17:90a:dfcf:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-38e4b422aaamr13448276a91.3.1784542952701;
        Mon, 20 Jul 2026 03:22:32 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b20df7esm5616125a91.13.2026.07.20.03.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:22:32 -0700 (PDT)
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
	Joey Lu <a0987203069@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and OTG
Date: Mon, 20 Jul 2026 18:22:20 +0800
Message-ID: <20260720102222.251179-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720102222.251179-1-a0987203069@gmail.com>
References: <20260720102222.251179-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_032233_796173_A58A848D 
X-CRM114-Status: GOOD (  16.40  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
index fff858c909a0..1bd22dd0e5fc 100644
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
@@ -42,4 +81,5 @@ examples:
         clocks = <&clk USBD_GATE>;
         nuvoton,sys = <&sys>;
         #phy-cells = <0>;
+        nuvoton,rcalcode = <7 7>;
     };
-- 
2.43.0



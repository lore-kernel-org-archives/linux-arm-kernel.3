Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE34ACD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 05:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GD68h9MMT+UECQIssPO5nRF88/8ApCFVC30JnkmQtnQ=; b=vvSuPcvOsM1I2k+0wg7T4jd3VD
	0ZZ+ThwByPO7vGii4ojmR+C1X8gtK5o9knbSENhJQXrh6/2zAJxXfqCunjCcZYTw9fyXwP5RujQsD
	ZFEnqmQ+oDa7RVab2ZSf5xqb2+LeYrU4cYIBd3CGSMEQQcNYfUJjUGerz0M0mK3GFp6aUIvTEcfxI
	e5hsMuVM6CoqlBLipGR5/ISQhmgUA2ghNv4Oa6hgsbpYT9cA6nMpiVNbbOVqXXJlu71rC94+I6yp4
	60RZ5kQxTcJK9vSBDpwNmilyHhMFZ/qzRzA6f260ZoNtcQwwDPWykL6E7nXbVKt7ifLwbVzHE8Glq
	BIIsnLeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0CN-0000000De0D-2MeD;
	Mon, 15 Jun 2026 05:49:27 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0CI-0000000Ddxs-3zGV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 05:49:24 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-304e83724bfso4052616eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 22:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781502562; x=1782107362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GD68h9MMT+UECQIssPO5nRF88/8ApCFVC30JnkmQtnQ=;
        b=E//S5njm0YghORglA6RlCzl87QMc7e4vYzfWCquSmKWbJKZtdKp7Mx+IR8tylNzAea
         /iM4fZ36U1y3sHIAXFAl6eKX2dyk3NodtyH7fQZYTwJNeB11NEa0CGHLjRKQQuQjcvzZ
         sHrKYiP5OaheCx6HCtQuSR59Wp41419tsQwcY8ZoHS6yvk91598dU9kI+DwkzFOKncBP
         3L6hustCWPsFwmATKEWBkgpWtJ+rW6sy51hOvuYG8lgtFRdaPHmeaEPOqy/YA16qx0Cn
         sG5lwWst5yyfqvCjHhd2iPzII7YWBdWaWv+6YPQ/LpijDyV/h+tH/4Hn+40e9RPDWJNN
         zk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781502562; x=1782107362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GD68h9MMT+UECQIssPO5nRF88/8ApCFVC30JnkmQtnQ=;
        b=MjnUGScNeAV+LdyGMH8JdQwoAyH5x4m8XxP/evb1xVKAm8QZfQGmivkXiO+4fR3sqe
         LWU0G6mtqusvRRkNEFv7UmI6kR+RqWT0IITse3DTpmX61ISwTtsqWX1Wxzf5b9RsbiEN
         2kUElZLtOYrMklNyKC0LiNzWNu4AbLJqVyacpwYNOJoOFH71rJxcjybNknXzlbWr9xUN
         BmVC4pnyXwTaDzuixRIefVorlquNsPJGM+78UFdRtGUrFCUYcQ9r1AWKxpFI/GDxGck+
         iB7uPmqc42eQoO2tQuMSGyUkDfmlR8R9F4qm6R2M6gQFebqtXDe3Vs7xRv0BqGjVWkCy
         O7BA==
X-Forwarded-Encrypted: i=1; AFNElJ85hY6O+Qytct6XbiFGWtIQxoTv02Q0y35UCu/VoVdFE67uS6hfZi/9pPMy8BYt9gbU2lKW0H0C5BVMVpB+mnTj@lists.infradead.org
X-Gm-Message-State: AOJu0YzvNB4JFQv10H+LSwxBbsX2I4BMVg7kRJyOh0P2yC3UsZTNqhym
	sAH8QXVO8b8GAL7uXcxBbXCORPeSEWwd4tA5QHpVbdcmfjyu28C+QlFr
X-Gm-Gg: Acq92OFTrLk5oKyxcgKjm2PZcoZoJP2nBVCgUHEuohG0RKdHlKze4yOSVR+JQTLThHi
	//trhqKmCRJdxv4lRlWiep4zAYhnX78CFdQPEG/5RoWXL9dTPvVfDp4GpWMOcmWcf8E2s7JwhgP
	IJ0OcCa8AumD8C4Exd0XK4Elnp54Oup85gJiSYGBuGmyY538XTtgilA22eoVLe+Q80/KFQp8eU1
	6sSAWy95f1hcwWriyahWWUklrKo4uPMPqWbyUITXLXgysLlXMPXsKkmRmi/7m728mhfCWZg39xh
	avaGwHLv+KGz/zakPKVD4fzc7j+iLlhiFeCsTlRk3cyCxNinQqTxBgV4sco076Qc8ya9ic6rHgy
	2HyT8r6XnXrQHfQW1otA9w4mM8iykIIBbS2dWBvczGK+YBwHer4amGfOAML3OnsOri4I6vqd/rV
	XluvmScPjCcat96pfI/xyWLoiALFn5Lg2G0Z2/BGIdoDog4Pxrf0RrrqNk53vMA68+WQteyVqFk
	rcCoGMo5o0V
X-Received: by 2002:a05:693c:2293:b0:303:f26f:df30 with SMTP id 5a478bee46e88-30820094315mr7031697eec.23.1781502561888;
        Sun, 14 Jun 2026 22:49:21 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ddaf69asm14295300eec.0.2026.06.14.22.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 22:49:21 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port OTG support
Date: Mon, 15 Jun 2026 13:49:09 +0800
Message-ID: <20260615054911.48821-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615054911.48821-1-a0987203069@gmail.com>
References: <20260615054911.48821-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_224922_992284_2F3D7A72 
X-CRM114-Status: GOOD (  16.50  )
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
    with a reg property.  The nuvoton,sys phandle and clocks
    properties are removed; the driver derives the regmap from its
    parent, and clock gating is owned by each individual USB controller.

  - #phy-cells changes from 0 to 1: the cell selects the PHY port.

  - Two optional board-tuning properties are added: nuvoton,rcalcode
    for per-port resistor trim and nuvoton,oc-active-high for
    over-current polarity.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml | 62 ++++++++++++++-----
 1 file changed, 48 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
index fff858c909a0..dde045aff44e 100644
--- a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
@@ -8,38 +8,72 @@ title: Nuvoton MA35D1 USB2 phy
 
 maintainers:
   - Hui-Ping Chen <hpchen0nvt@gmail.com>
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  USB 2.0 PHY for the Nuvoton MA35D1 SoC.  The PHY node is a child of the
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
+      Resistor calibration trim codes for PHY0 and, optionally, PHY1.
+      Each value is written to the RCALCODE field in USBPMISCR for the
+      corresponding PHY. The 4-bit value adjusts the PHY's internal
+      termination resistance. When absent the hardware reset default is used.
 
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
+        reg = <0x0 0x40460000 0x0 0x200>;
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



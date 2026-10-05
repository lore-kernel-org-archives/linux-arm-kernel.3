Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64758CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jvg2zQzFo45CneV/j/IiL4jEY6i2n1nGDduqF0/0xg=; b=FDVcawboSoBSP0IOcojekzvic/
	gQOqryYtpph08mdwaa4GyYwAJwkYnmZdjnehNpfLgzWIFPU79ZSjIM7s2ZHc4zJa9IzrqEHPgZEaE
	gWj/c0CvWYiQD1VcrsDbv3UiEa6qQiz3DI4Xvwi64gwXvM6JODL5CuCAsjhkANYhtqAsPyM3cStLB
	FO03I8felXU548OnUUKlxgjQZVqezRrYAnptJDk2dDl7Eh9g/vPNX8wE4vOy6WtNiZInu9GYou+j2
	w4eSHTKxZ4F2qwy099JS+jXK5sFFyS2mw+Y2COeYK7JnuQDo2NwrUuZ2UH4fcQWbo90yFmzsxfmYv
	WXPCknuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgMM-0000000GFO8-15GA;
	Mon, 05 Oct 2026 10:55:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgML-0000000GFN2-0ktD
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 05 Oct 2026 10:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6jvg2zQzFo45CneV/j/IiL4jEY6i2n1nGDduqF0/0xg=; b=YMPQN+6LbFLLEs0bpoq62NRETk
	Ywyxr8JEUNgxuPIkJ4R8R3cKeeIiWGjkUNL503+vBqVNT5qDST7cWiOUD4phAWougZqKK7MGNTUAt
	HVk9v5T/8RLGTtVKAjCHisUMShqQ3lY/DlORSIAX++aqCt4BTpykQ6BAwoODYmXtaRzsxUsXb8Kbs
	xoQW3PxDwuCu8NqG4rxEOwgpfuwSKoeM6FrLOhamdSG/e7/iPpl84mQTR5Z7f5Mor3iiFygmqWtSI
	x/T0dmqXEQfcvzR8bt2O9j3xaAfDICxuFRN194H4VeXJiicpNmYilfTAr630h2N64AEOO7s92Bl8T
	BDNOx6Yg==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgMH-00000001SZX-3bAE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 10:55:52 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a174a3dc9dso3467025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 03:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791197748; x=1791802548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jvg2zQzFo45CneV/j/IiL4jEY6i2n1nGDduqF0/0xg=;
        b=J/G4k5lktb16FSptHORCeEzz+Jn1ER59cXLxdF8EnmEnM4V2Z4yWA8TjY39uxCxp5p
         VHXVL8/O1l0p/8HH1+MpWgbtMQNRv2XCITyH1gSMkCZ/aLqN0UuITz3sHuUt2tLeLkiI
         xbplVYTke/X1GE13gvt1b63d60aG53Z4crmCVi4nykDpp4Ys7Jw+1m2zFXyw+Ig0OOyl
         eFHE0wTP+nVJ09I8+1TeIW1f+0W/MN2kUZmIIqCg9nuPAWAjj/kZeq3ssm25bAhnCz3B
         yubi+qYKfSn4UwqM0wy5SRmPL9tnUTLX88N9h+DsjZ15WbudajphcwTsvB+PB0pavBc/
         qJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791197748; x=1791802548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jvg2zQzFo45CneV/j/IiL4jEY6i2n1nGDduqF0/0xg=;
        b=DHHpzn+xBBE8Awc1PSoV5q7VqtwgneHytQwcO+5RRYX/wnoS6Nvqf3ctlLKP9efvwe
         LcIWiv/XR7Z8RNkB8ScHw/tBEq6coXkeGwnXLUFZmKNEa+RhTwZkguIdOKx5HrIAD2hO
         CEhXhdLwJTYT2yMjA0QZYzXggRUh6lsQ7FYk3WDQyE3nqHmKKcBznC+FuIN1KH+8dvu6
         rzdVnVhIWNEZsv6iwWxNwRYqDRHyb+ZQ00agcO9rS4jSEJTL8Wz0Ia0su8lZouVAhKSZ
         igMKhkSC/j1OVunVyhH3XHvHpR9oddgT29Sr8wL88B5SNEXtYHFA9/1DyqR124pTJaV6
         wbWA==
X-Forwarded-Encrypted: i=1; AKwUvByBZNiAczh3cHQFQD/2SvVZDRDC4Aas6ODxGIuClkOoFeF3SyJ5k858h6D+/PDtUMFz7uJ23d5C2+JQfi+sYp9V@lists.infradead.org
X-Gm-Message-State: AFuF++mICpHOeM3pkDzjHKXrClOBGf6nRNrUH0jduEa01ePBgAzXqcyv
	NsycjT7uko1M+Uru8ky1yN8419WJ9ON0L8jn4IutmDmGjr0laoMc1mBH
X-Gm-Gg: AYBFou0EAmlL9y+DY8GlMipyLs8wdMaPeG4EsetLuqsmPpbF9bZx58ppF/grbFa0l7e
	31nBjzzB3haSMMYlVMU+suf3p7/FJb2tKwCB2r2hOoLnZkbZM8ZUtStyIa6qtKQUx5D2Z9ZBcuQ
	i48jbGUbKkmEbkaxBQlXHvAEmdT5kzrzb8n7D2bfuwsex5giwPiW6i5chQLGZo+dFJDBSwwf07R
	weCXz8Lnbvc70JnBuYr0vpPC0DTn9U9yAlFL0Pbea/7H8QPj/0ccttl67hmWirwcXkZrN6tTEol
	br2MmLTykZYD+glOH32LsGDCcV+XeadpbQc3SYGfKOyqiaSyXQTDnE5+ZCyuCw9uki/J+yQaAEp
	DYcffItTwkRTpTvd1p0/e7UEEaBI37EqNMkvFD2yR0FWK1HQBhO3Qv+9PQ3/Eu/MxFbjI/prN1y
	JDUvV+JYVWDLQmyJHkrVbA2JrrptLGJl52gb263xY9MDoOu4qOWAKDlg/7nae0CMcpa8KLMX2Wk
	51d+DBmm0/bg9N/HCXI2M+4t/t/BRVroYvq1VnUMtdrbfBSmCOJPEZ0VYHfVnk=
X-Received: by 2002:a05:600c:19d0:b0:49e:8191:e5cb with SMTP id 5b1f17b1804b1-4a02756f0c3mr166346825e9.5.1791197747443;
        Mon, 05 Oct 2026 03:55:47 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a030326132sm270319635e9.0.2026.10.05.03.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:55:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v13 1/3] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Mon,  5 Oct 2026 12:55:30 +0200
Message-ID: <20261005105535.2472-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005105535.2472-1-ansuelsmth@gmail.com>
References: <20261005105535.2472-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_115549_933254_667177F7 
X-CRM114-Status: GOOD (  17.78  )
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

Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the relevant USB port.

To correctly calibrate, the USB 2.0 port require correct value in
"airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
selecting one of the 4 monitor clock for calibration (internal clock not
exposed to the system) but each port have only one of the 4 actually
connected in HW hence the correct value needs to be specified in DT
based on board and the physical port. Normally it's monitor clock 1 for
USB1 and monitor clock 2 for USB2.

To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
property is required with the phandle pointing to the correct Serdes port
provided by the SCU node. Providing the phys property is optional if USB
3.0 is not used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 62 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..f42e3d49a61f
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
+
+  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the relevant USB port.
+
+properties:
+  compatible:
+    const: airoha,an7581-usb-phy
+
+  reg:
+    maxItems: 1
+
+  airoha,usb2-monitor-clk-sel:
+    description: Describe what oscillator across the available 4
+      should be selected for USB 2.0 Slew Rate calibration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+  phys:
+    items:
+      - description: phandle to Serdes PHY. Optional if USB 3.0 is not used.
+
+  '#phy-cells':
+    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+      as defined in dt-bindings/phy/phy.h.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - airoha,usb2-monitor-clk-sel
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/airoha,scu-ssr.h>
+
+    phy@1fac0000 {
+        compatible = "airoha,an7581-usb-phy";
+        reg = <0x1fac0000 0x10000>;
+
+        airoha,usb2-monitor-clk-sel = <1>;
+        phys = <&scu AIROHA_SCU_SERDES_USB1>;
+
+        #phy-cells = <1>;
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 0570815ee980..d8cf9722f76e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -776,6 +776,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
 F:	drivers/spi/spi-airoha-snfi.c
 
+AIROHA USB PHY DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
+
 AIRSPY MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
-- 
2.55.0



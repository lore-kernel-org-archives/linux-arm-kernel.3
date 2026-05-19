Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3D3CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 22:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lV7W1ei2FqWvKC5DxEE00R5KzZQXh+DIYHlxBEzj0kw=; b=XLMx6giSCp17sAWGt/nuZPbbfK
	xnOvh48zJ5mgWHKkd06P5sBfbRs+cWRKk/BA0s9WTi46cI7rt85l9bBlFnFN5wdiXIGZC3DuHGnvi
	PoJIa1ebAq0jeGeu+oVDbXpi2TjbdcEB7/KRl3S6sX4JNFU3ni/Wbi+EsaGmoO6ArOxa2a7nRxFug
	ecWE7EvrrJUZBw1k2VCVbVkytdweWrSZkTyVmIQlIJmqwhLHIcDjb6wovhMh1emrkMgU1Br9Hphhs
	GmsyXZBXaQhxU9MA0ikycnwAFn/b8ris5oWgh6nQ8bjdn63bzD4sEUAkZaoLaCC/HI6DYmPS3550d
	i2WLpPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPScD-00000002uJd-0zqf;
	Tue, 19 May 2026 22:08:41 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSc4-00000002uDY-1ikp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 22:08:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso41184055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 15:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779228511; x=1779833311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lV7W1ei2FqWvKC5DxEE00R5KzZQXh+DIYHlxBEzj0kw=;
        b=GMXLD8tsCLP30uufi+CaqQMBKoQtlRdDOtvkW5ZBryPxnXuB6O8nUXA4oev7lKUSBB
         LJRs8qP1zmbM+YkqlsSV7JcN5eIPHEu5ZMfRd6mEK0Y1HiqAPJf+q9JpQavVOYlXnOhw
         NLLEgR6wsyfTwnFnpkFyUigfwOpPSyb7wHGDjIvwF9RGgfjXZPdVFXWP+/Y9iwhVyiER
         FwtWZLnAfKCfWqL+CHdL9DmXd6Bpzw3iWMPtMLkZUDw6LntEpG/j5caSwd15gLR15dg0
         qG9FHPHNxU8PmADMIwPbrCjZXVWIawyUk+fFT6FPp1phJoifbpMEjGCDgyUwuoCA+lbq
         wvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779228511; x=1779833311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lV7W1ei2FqWvKC5DxEE00R5KzZQXh+DIYHlxBEzj0kw=;
        b=H0zVsTEpsQ4kGxYzrllklSaCZd4PhoPTgXCq1xDNZJ4IHMp3pJ3z61CDLXCwKn0Sr4
         OlmuNTOv3MAQQrxYw0PemZNVvxVv5EZJVgqOzllGEAXHMDTK4HDcMU8lyyHYXdKlRNXw
         u2HjWiq+NiDveC6H8+F6xK85/NICjrnpzabuOePYVP5hAiVod9vOY/Mn8G4uPYHrK3iy
         s9YaMpMAcgRZho44ldZuaKtvXX9b9CXYak36PCs7Cv7o6k8opYT1XToNIZxpVtZM1Y2u
         pGXY5mtwsctmOEICPrIvWBl0a7vaEy5VxxmG4qsroxl70H3MXoZc2HKux2wlbboaroCr
         RL2g==
X-Forwarded-Encrypted: i=1; AFNElJ90Bl2F9ShQBHU3g13/F9Ak8Yq8iWVH800kxBVaKKDUOa3Ig5R8OfNFW+SePl4heU0ew7W0LPpPC5c1nJxTnyJ/@lists.infradead.org
X-Gm-Message-State: AOJu0YzKmkmCstyvbBkn15I4Vfe5Zws/o/SDy/p1nCX1tNdfc3ZHE6JL
	+9ldpw6nBQ/yeKr2UHn0gscTLbAPhzFmmF/pUkvV44RY4+gAvqTbay5/
X-Gm-Gg: Acq92OGLwKrIUIRW1dY5v8847RbZ6J2Qx/SU4ZPlrlhrJ6ZdTcBM7LX/ObDarV2oaNS
	FjtHZaV5F13/5TZ8sRbLSW3x3Aawi0pjhMXag6tEaWCQd7GvzrzARndNmhhJDGZxw9zc5nRrKpt
	GRKFl79CJn7XlJA0qHIz9LWynjqc63o4Zrzi752Q4/6ylpEUS3DtDfO0Rx4W3k9n6aynJAsRbv1
	KWixVIvAHtIQEbmliQWphGUH/766OvxKo4jK5BoV9yYaJhbjOJtS7SY7/mJHeK27q4lSRhihOg3
	1SRGLvwOrdCK24XdoQrexZHGMSFvpEfxo79fNkJ3gjZRaX6FMq4+yi6JFfiWT0qfxDCCVdrrePR
	DonBw9oeffppla7dZ4lsACodVWNpZIoCLZ2oUl3IkcjptbnvJE70olIqPqeUA2SM57YG6bV+o6s
	tcO7BdCAvQwZ4xUruyCRQjYAX9e1Lrf1ljGERFI0I/hIj7jd+VBD/RskbWJBMyXMlMFfmQI9s=
X-Received: by 2002:a05:600c:4851:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48feea99dc7mr173268915e9.7.1779228510595;
        Tue, 19 May 2026 15:08:30 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm118304005e9.19.2026.05.19.15.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:08:29 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 3/6] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Wed, 20 May 2026 00:08:08 +0200
Message-ID: <20260519220813.28468-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519220813.28468-1-ansuelsmth@gmail.com>
References: <20260519220813.28468-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_150832_498209_225DA0E5 
X-CRM114-Status: GOOD (  20.33  )
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
provided by the SCU node.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 62 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..f561cf2a8103
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
+      - description: phandle to Serdes PHY
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
index 21c0ef0b9ce5..932044785a39 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -771,6 +771,12 @@ S:	Maintained
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
2.53.0



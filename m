Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C9AC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 18:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mb7TOOIuiwseKoR6/vRO7kfdbaChj9w+25XESDqQWTA=; b=OgrbDVM2mtKM4mt4fsTVcRF2Iq
	fVLamQNURaMojbMBvWaeMAbZnjw8mVQXZyZ3/aHaUWqmQQ1xZSQPCLfKTDKogaF+17UevFxeVJhvw
	GcPzlPX5R+fhQr2CWzpuTkmUGNc+JJlrpMdLe5Y1g3kVzjDPIfvmW0dtF0wVEVBJIT+UORaSFCFRD
	HjOmqZT67H3591raN9fWuCYXaGHeK46RZ7YaPrlovIA+Ko5LMA5DM8K1Ily/f2v47RDUI9giHhNwm
	xOgI69xFkjy6iyx7YMM2j+CfVY//2uRvL4A8UjIbuOhxBCVv7XA+oXc3vGxATuj8sf/B7rk4O1WIC
	yYSptw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKu2-0000000H5RI-0HuE;
	Fri, 24 Jul 2026 18:45:46 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKtt-0000000H5MN-2bU1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 18:45:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso5420955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 11:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784918736; x=1785523536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mb7TOOIuiwseKoR6/vRO7kfdbaChj9w+25XESDqQWTA=;
        b=Txt6NrKN4xB5gsw/zNpGIzNV+drd5aPPSGfWt2jqzoKits00hr3/bE0vGo/AdRRxug
         X5JPmfuuksxVobRjhyzg3phSh9C417HS1r8JIovhRDDlAX98nSzGlgjlvmOFNpkV6rgt
         uTX0kx22YAL6mgnmh3ou3Cf9xO0FmcChG17u8c98PP77glO3AtCkx3nOFKrQDesRYF9E
         vs4/xRKYUErhwp0V9ZVofVQvsSmVvunkIgYjkpAKhuTPAYHiNBwqoGNiQ4MLd/7BJGvE
         GaYtzK4GjvnT5ZNOhqspC4Z5FcmqlKXoa1JpSUn/Y7cRmFxOS1jyqpBCMMrJ99A7dELo
         OP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918736; x=1785523536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mb7TOOIuiwseKoR6/vRO7kfdbaChj9w+25XESDqQWTA=;
        b=G1brv+WxUkUJ16IkvjJzOF2wXD4w19WpW9eUAw2YaIv2j/c0vczt+pySIldmjpVI4u
         RtVtMzYpXS6zpoNYtKuQLwaUNNZy7O4+LY/sgRBWGziG3vMqGgWxcA5TnelYoNRm9e/j
         ntYqGQZNasCpgTCrGBPHuWFXWr7RDQaap35fYk4PnxsxB4jPBu4UJOTFXDiPQbueMqnS
         X8bPAD0SO9EVlhX7vRD73j9u8odqNzJWVT3xO3YcHNYfzH5112wTfXT8NJ4mqvHfBouG
         n4mvdLrEEhAdlf84QH5vvoib4xr3RRN1uRk1O/bQcpkcR3LRu3CYt0FXcmiJidy4DTR3
         7jww==
X-Forwarded-Encrypted: i=1; AHgh+RqLhQHVdaxpT8XRmGgbqTkyYBClbDlehH/soZINlcwKhtuajNrosDq5B1lSGiaVZ77WxrYwIiCbeJ++jC2WQtfU@lists.infradead.org
X-Gm-Message-State: AOJu0YzvoarRuOslZrb7bzp67futnVCJ/sF+5IbmJ0PcsHo5gAGzwKeE
	dFBxjzpwZCKx28mN/bkSLPsdPg09UoIHNW5RlXC7g6H+1oOAxX7APnTQ
X-Gm-Gg: AR+sD13yf7kl987/48wxaRNLrWmK2AkRW6qexrFYcc22Jgds/vRRZAloxtqPebsSRtz
	Bbblf0oGtSHUQ/ri/V8mIlmkOHaVZhUkmNxWsZql4HIuJR7Jv+csfL6zCcNkv28WF61x1NNzwi9
	TKSXLwhDINcRz2Z8o+vktDp4kKkM9QybvXnDso/N1IlAKtH6f7IjGOmCR/c0J/DOmrJjJazkAU0
	hHh0zRQPq5rDrZlPVE7T4qqILj7UHCtWqD+i3jMUV13TU8RFQeX15JmJemRrf+d6UbdhOyGMzu7
	sSyxPt4BBurVgFr8cloi96neIW2YOoYjSHbx+w4TJ7axnF6am0HEKEVNPe3/TIyJUVVjpRoPDqt
	wDfKELSr0Rei6xhcWw5QqnqiFD90RThUFS9tOPDovY2cewXuJaSad7Gn3orKHf/6psdFRaHR2um
	S+3wwPxbzUdYIS73+/LwNGtSl9hHSdKeJK9m88+Ug/6VeOUYAru7PnBETEFHJdMrvImyq44t1FK
	bY=
X-Received: by 2002:a05:600c:4f87:b0:493:df5d:6ca6 with SMTP id 5b1f17b1804b1-49573cd8a8emr108469545e9.25.1784918735024;
        Fri, 24 Jul 2026 11:45:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496b4858e85sm11278335e9.1.2026.07.24.11.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:45:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v11 1/3] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Fri, 24 Jul 2026 20:45:20 +0200
Message-ID: <20260724184523.193661-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724184523.193661-1-ansuelsmth@gmail.com>
References: <20260724184523.193661-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_114537_696589_E38BE883 
X-CRM114-Status: GOOD (  19.35  )
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
index 1705eb823dd0..05e90c3f7fe0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -777,6 +777,12 @@ S:	Maintained
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



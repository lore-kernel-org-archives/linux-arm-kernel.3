Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305B5CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIXM1te+ieHNM+6xW1gwzAdkuvYjOEEfP1FJY4/MyNs=; b=dB41v4ALis4oZdfPHUb2wMeb1Y
	59r8A6cTL/y+i9OnWDJ92O5OvSBxBuTDi6uQwDYKmqY9gPL24L7Zc9FAuOPURJ9vbkWQ7ubbj1Kva
	5HFWP9hBcY/XS9bIDLz2C9ktsragqqziYMiF6Evld4tHHd1fm/cVnY6j6zmEH+BuUIljqGlEzLAyq
	pRtB2QrJMBWBiauRRqknvcbyMxAxWpv8WSOJLzFUDTnBJyLmolM27xq93UGbtN5aRS0sI04BB8EiO
	n+AWsqjllJwsTkML+/rRU0Z1/Itpm80E60AzszzkdtRTBeREwtfva3PyWMdbyWOasH9BlyIdyI5VU
	3rhokdFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5SJ-00000008LGp-0naf;
	Thu, 21 May 2026 15:37:03 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5SF-00000008LDV-39jw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:37:01 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49040362e4aso885275e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779377818; x=1779982618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rIXM1te+ieHNM+6xW1gwzAdkuvYjOEEfP1FJY4/MyNs=;
        b=gPG732Cj5XOTGkQKmRYXAeFB9XRXKW8gVzf3CXkb0nvx+jVVJUu4Bt/QsmQ0cJuUJo
         h1ghoMADop66VMIrFbZ4aVOCCyPNrmFmFsEsn69LZbuqc0MttPwuVp0+t3vSHlF+Zt9r
         ilzudMlelfZovIFbdTBPSiKVqd4BsRdcoVmRK5Es/7lfiEqumxVu6Z7JUUpojG5Gzmgt
         cRqmPNB8YnDF3ALse1FyPVbAKhg94p3MknuO9sy5hclrkojf5QhV9sMDGz1Ek7r+Zto5
         5lk0dLHSahR8uMohR/WuhgbRsY0xNvQHI9UbxqkO8T2aVFTabQQ/ZfQEs6LG9fZRR10k
         mgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377818; x=1779982618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rIXM1te+ieHNM+6xW1gwzAdkuvYjOEEfP1FJY4/MyNs=;
        b=lst/afBvefsoNw0wXVydGBbWAUyudYeT2Mql3rW2ygbVQJzIr27U3nzXsbkrBJAlOO
         QjYprtZVzzb5TCOrRddAaKQgSkcMCFTvGkqCAqO+8qbBNDRzp4FmRS2C/2VDcz2DYLD3
         kl9bAnekAUAPYVxMdaUjunHX7dKkCX2uJM7HloYAq9uMaGQ0fQgqEPe3Azx9szXrtw79
         EqDRotS7+F9+w/2f/lmaTn/05JGSKHlo6lpqu53yJgMtFJr/ExCMpOqIkgq6Kg0FW45S
         kb+1x7r3P65nEk955tWxYT4MWu/fUzf/XpaPmwYUdh9mwvzay2qAlT71DSICp/uKszhU
         vJ0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/u21gvhK8IVmLS++FAGzqjHCA84FJGyyrTY0+/EMOStA7DdXU31eVttJFrlexPkZTEJgJSz77ASr2GACYkMVD9@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt1TBKLILU80c8jOmj65DHxKM0CzDOBF0xe540o8NOMKOfNPKr
	LsDWqXGXmT4tdy7YqWm/hPRGB63HZ6qcrysmNAZ1cvFhlw8/IFxk0zdc
X-Gm-Gg: Acq92OFOM88tdIToajWXf5OUmnNDsj+2XwMblA0/yv3HOXeSEhztddkem2uCxSJQfjb
	y1fjaN73bNPjHdCUZkERERhInI1v/6sPJQiZEbLtNswllKfPo/2FFzIvmfoNJpg2p8MJT1d9baX
	317oIwkghfg5Y9TjKQ3gqMfNiNzXQiuTlEi4PWboxfcfsd3/IXjnhoPLSIZG/+KZ40MOjTJvQ3Z
	mMIXk4rse6OvLh3TeWo8b5xBbx6yBk2L6B3AorFyk0vVW4gvGeIiQaNnEcTM4w0f34k4exgEf+b
	wGc/1EMJGbZxn/MG4ZhYKlngGVrSbRDYjw7fIQ5xtoUku++c41SS8neX85uNUaKQpXgWPGJrxPa
	sl9Yz5B/dp53euhL/NkHfnDw9RVktFsRGHxbN/JSnnHQ7sGVdqT8CT8RnV2KTilk8rejfhmZiSa
	mx5224ESl+XwGcYmRfjxTWOI/dL8s3VGmVWKrGZKYrG2ktyf3kMojYaWLql+4i8UQ=
X-Received: by 2002:a05:600c:1f8d:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-49036041cbdmr49662045e9.9.1779377817541;
        Thu, 21 May 2026 08:36:57 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49033d9edcbsm79159825e9.13.2026.05.21.08.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:36:56 -0700 (PDT)
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
Subject: [PATCH v9 2/5] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Thu, 21 May 2026 17:35:53 +0200
Message-ID: <20260521153645.7028-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521153645.7028-1-ansuelsmth@gmail.com>
References: <20260521153645.7028-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_083659_815986_D1145C05 
X-CRM114-Status: GOOD (  19.91  )
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



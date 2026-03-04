Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538BFEDEBFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 00:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h38h80KHifUI84SS+z6wlkgcplrzkREaoXBLQFpmips=; b=VyemBUrFY3T9zEoqCLUfCwrFPB
	XD/gR2Yvm8d5JLXKhd0WphUlYby1vLZJ4UPJhgWxDBel4gJnJyHz4UKmgPTnnNQEhZtkHv8ireELP
	deRNK65TdXcyhsyLat0a697l7k9rJh4rLPlKrs3Y60dP/3UWXzpvXZrngVb5PQo7fuNWmKhDLgt+9
	tiB2Ybal1cBBIAEeEMP3BibypKYdCn/rry8+otsMwH6Kwxw6RIgfBC+h80p9D3tQYUFLDlxPitT/T
	DnEcIndDM1aPuv+pYx8PgescFntfQZqF8hjeMxRn4tYJyU8VeUSqrrxnne+Qnb5TFM6Woa3X2It2s
	hfVo7tYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaa0-0000000GCTc-21Pj;
	Wed, 04 Mar 2026 00:59:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaZx-0000000GCPQ-0qau
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 00:59:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48378136adcso37466175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 16:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772585947; x=1773190747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h38h80KHifUI84SS+z6wlkgcplrzkREaoXBLQFpmips=;
        b=AeoUOuEs7BBqMPveRJ9Dj20TDWqXc6rxJf7KeUv34qsgJzYBt5O8OSG14P4Fd606g1
         vE4GvcJFQvrro94N6ZUt8vOjtPjZzqL/qHI/JtJI19HPpp4W7eVq3zI9ZTM4JF6NnvGo
         qtUsh9Y6ARpD3dzDoJnrn3r3wRvKOSSJkB7+/5mABX/+YgJarf4odh0iPBB0dakLqaav
         s/9EhVt7abaJB3rxUZa2cUElfaEeZu6h8cWuBp88uDnWTbVTw3f0V+Mo4EXoie2sPdrV
         giV9ss7nbxyH5KKUnLg7SpZGlckTPMD9unPBy8gR2wLJ+GKKRTQ6Jbd3fHFkiMtGWJck
         nJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772585947; x=1773190747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h38h80KHifUI84SS+z6wlkgcplrzkREaoXBLQFpmips=;
        b=pMteh/ghBmgZ3ZGNuz23kcoL+J0uRJ20lUA91PCnp6RcSO9YjMe17lPB8raMZnP3Uw
         1Uks0lJlK3NMBhhS0OyPSkPKcwNKVOGeMOSyD3A3TYjoycCLXtMyuGEARq2xWD0kWdca
         146MkBFEZr4eWsVqM1TVfjU+xsQQWdeVBPkxNQwS8bf8iF4Nj3d+FVQ+zrFd6C3Xap/N
         4JkK9WF7fxCRGaUlso8nc6fghfZP58SZGpJ7jvBgzDDqH5vwOqPLKdg/9+Pzo9wKTtj8
         6/y3kSfmU/zoweLhfwwMGWq1rLVxDa3lWgE6ln/Jhnhiw/yVRAI+SS0vUeaunk1p2QGV
         j2Rg==
X-Forwarded-Encrypted: i=1; AJvYcCW1cmw680lyXuC6RClHvNjDv3uvwfoqJ9AyDPrFEuqDuqBj6vk0kAuO+7K30qf39NhkDfuVJWuofEiEouqwPIMw@lists.infradead.org
X-Gm-Message-State: AOJu0YyF/puxdHOEAEVuRyajybRld4BPwz3OC9go9BfbjDbphzu619V1
	OAJFZxImBroRRJS8lRbuoAErNXvHHR+3WFhhNf4hiPqCPbSCYSgp/0x1
X-Gm-Gg: ATEYQzyP/CKRh5vz/OakTGE/A1ULdI7u6L6a0gUNOlT6jE/ZM99uRl8pgesnJPRW85f
	FhIDICkGPHF0DXSYY9IHEDGXOSSLmFYf2H0kColKeV829i9276z7Y01VK4LnD/vQQrIuoQhZGxH
	r3Os7IjRz5PlduZo1CBsl7BfAejOIp45gZtfgmqcF88BIiadJ0cqoGk/naMzQKouCnBqr1x9EIS
	NI1DkJgMGRMvdXR5wIIr76Nfkst0USELyZgVzrYZxG+kTxdneDaNS4q+MpmKoqI2EDbfzGp32vC
	l19ee9aqOVRgbwBtKuxtoDcynZXuvANve6rQplOwb/XDaQyj77zBaz+6TscivMM8VdmxUKqKEk/
	68APBhwKCXA3RTCAXHHfXtf7jpcwiZxdn3thSmRELII0pghR9vUo/8d6OwlRi0Z69838eba6OY7
	sx/3fIy7sjcnn27/b2zXCHzAsb/NViCMKp67Pap7tzvAaAUbOJjxl9Cb8=
X-Received: by 2002:a05:600c:4e51:b0:483:7783:5373 with SMTP id 5b1f17b1804b1-4851988ce8fmr3051295e9.23.1772585947161;
        Tue, 03 Mar 2026 16:59:07 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4851880724esm26927575e9.9.2026.03.03.16.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 16:59:06 -0800 (PST)
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
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 2/4] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Wed,  4 Mar 2026 01:58:34 +0100
Message-ID: <20260304005843.2680-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304005843.2680-1-ansuelsmth@gmail.com>
References: <20260304005843.2680-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_165909_269883_264504C4 
X-CRM114-Status: GOOD (  20.46  )
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

To correctly setup the Serdes mode attached to the USB 3.0 mode, the
"airoha,usb3-serdes" property is required. This can be either
AIROHA_SCU_SERDES_USB1 or AIROHA_SCU_SERDES_USB2 and is used to identify
what modes support the PHY and what register to use to setup the
requested mode.

The first USB port on the SoC can be both used for USB 3.0 operation or
Ethernet (HSGMII).
The second USB port on the SoC can be both used for USB 3.0 operation or
for an additional PCIe line.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 71 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..ec467fb7f971
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
@@ -0,0 +1,71 @@
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
+  The first USB port on the SoC can be both used for USB 3.0 operation or
+  Ethernet (HSGMII).
+  The second USB port on the SoC can be both used for USB 3.0 operation or
+  for an additional PCIe line.
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
+  airoha,usb3-serdes:
+    description: Describe what Serdes line is attached to the USB 3.0 port.
+      Can be either AIROHA_SCU_SERDES_USB1 or AIROHA_SCU_SERDES_USB2 as
+      defined in dt-bindings/soc/airoha,scu-ssr.h
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
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
+  - airoha,usb3-serdes
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
+        airoha,usb3-serdes = <AIROHA_SCU_SERDES_USB1>;
+
+        #phy-cells = <1>;
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 364f0bec8748..d75f59118a9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -779,6 +779,12 @@ S:	Maintained
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
2.51.0



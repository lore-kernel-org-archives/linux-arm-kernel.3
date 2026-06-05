Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008C8CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 01:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZIGHz/o3y+3ogj7r6nfssUl4myckUIIzkFFbrT9qoc=; b=IQ/SXbcjjCV994hgVsR3H3SgOC
	uzB5e5PGOu7oPAYa4e+pvq+P9NL9nshAVzAijln86qnK8zDOuj2Rp2XqgiO6KUDEz7pK3enMTEda4
	mAGAXo5T/T4Hp6jxDg73dFSxkYd/2JnbeSqdYeQ6dgMHhcKQnqGCIF/EZEKbPixsF8IEyhmh975Ez
	9+DEfV2kPS9Lfuy3SBsu5/QCX3bai0h2IUDvrGye4F/XfjN0KneOJLiMtSvfQzxy1BAFOqN1TXGrk
	GcJKCaUwidqwFn/3Ut/DNsW98PyXHuiSAAFVzCLhFB7JL4hiUtLKFCj3PgY722DwRBaPWPLJNkjr8
	RpmRBtKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIvx-0000000HU5w-3Upa;
	Fri, 05 Jun 2026 01:01:13 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIvk-0000000HTsi-2fLk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 01:01:08 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-4863a7dac63so743911b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 18:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621260; x=1781226060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZIGHz/o3y+3ogj7r6nfssUl4myckUIIzkFFbrT9qoc=;
        b=bjVV8IxkMwk6ozac9+gvEiHFurhPd2g1M1+4Jokgv8lK+veaVq+2q3w3SWSP0MBRZV
         f1MXuK8/K79S4xxAeeUfCSGRsiw3tEGvKBqpXD64dBOKIRdX9fiz6E6ORxNiMedvJ6g/
         fB+k17SqyLywObltKNaI6qxHtAoHaImn6VUBNz35r0pZF7Jukku4/O1MiZD3xfC/VK1r
         jhHIj4LQYhend0bLG68Y+yMSX9eIIn9ckCBktZ0Xm8DgO6wF6XOVRdTKmqEnMYifHkCg
         Roc7mNDti9kuEIskZRpvsmZYpotPRnNYzPB0PypCqowzx1rPXFZTJ7xvwDtJshdHoyLL
         5jeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621260; x=1781226060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ZIGHz/o3y+3ogj7r6nfssUl4myckUIIzkFFbrT9qoc=;
        b=fsLOeci+AghMaul/P+EOXqh3fLFEdhWA8+XKvfJyeoxEj3Z8BIe2R1tWlML93Adsjd
         dgPP6r22fBN24tPffvQDEkZpAwGsTUd9jtMbqVgnf0L22zxMQ+dNPypOhTu0s1Ynqkqk
         l0kmOZyst9ELnn84dDAEtdeTIStATEkXAM+E1P/RnrqrHK8jn1ekB99XjAZPGN+JHbat
         mP2DECs4WmGy8CuWr7j6ohhDneXLHT6upaZiAjRhCpkILlNbysBIGg3QaOL3WtZzXzk2
         CJPc/ziExOSh+1VQrMEF+v1E63wyH3A+yzdMLnj0OyQ9vZfY+QT/FWXKGwSST5lPT+e1
         urcA==
X-Forwarded-Encrypted: i=1; AFNElJ/tn+3xyuyhQkDCtTnOchd7GKqIVSqsufFEbxwk1jGXXE19e9ZRiMJiNR524at9TxEQtf2oLIqM+Iy/4jJTj4tk@lists.infradead.org
X-Gm-Message-State: AOJu0YwVR0evOuxSmQgq5DSN0Xcbje6M/yS+falTioXFMcpK4IyIfAGJ
	ar2L2YL1rg7aS7fYVhm5+Qayk3JCea6+6h4RbJsf9YNEzbpJe37/RLkcI7NXxrkwGQo=
X-Gm-Gg: Acq92OGUtmmPAxNdTUhiZc40xu+JwrU8MHfjXN3GQJRMX56Hl+Z7jDVWrdOH0h0E1d3
	BucF03U2x8ooiGn9SQsSoTv3V+ytdm1YV0PPUIWtul5WeCFBOyPVdLw3l3h28/MFqssuz98ngQa
	RKEtGYwsnp5vSDS4r3xcHYpWrbZHDXCl2YBOpn6FIs131h6UWiaj02VDdWZcvPAsa+O33eSjZUX
	ZqdfDDp0HbSPWXPugvs2z9W0nlHk7bbD54GbizGs8ckZYLl5+pYG+ANzxVH+n2j62ex9zRzOEfJ
	XwvRLDB/G5d4HdAYHDUID2iesO+t2wSm6bF9NRC/Vlta743j5H8z4ajCo4IIE1l5yFklx4yntU8
	fSJOkKG2wnnCyp1mv1bBWCq9FhC+tG+zHGOdArmRz2oAgcuvFLlU/si/9kDXC5d2RB9xuqttNS6
	l6X3Ia95253Jh99QKHXk3Cs6oIuVF92rAIAAKbMw==
X-Received: by 2002:a05:6808:11cb:b0:467:de0e:feb6 with SMTP id 5614622812f47-4868dc583f1mr883548b6e.11.1780621259486;
        Thu, 04 Jun 2026 18:00:59 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:59 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 10/14] dt-bindings: net: toshiba,tc9654-dwmac: add TC9564 Ethernet bridge
Date: Thu,  4 Jun 2026 20:00:17 -0500
Message-ID: <20260605010022.968612-11-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_180102_735501_A7D12C26 
X-CRM114-Status: GOOD (  19.02  )
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

From: Daniel Thompson <daniel@riscstar.com>

Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
bridges.

The TC9564 contains a PCIe switch with one upstream and three downstream
PCIe ports.  The third PCIe downstream port has an attached embedded PCIe
endpoint, and that endpoint implements two PCIe functions.  Each internal
PCIe function has a Synopsys XGMAC Ethernet interface capable of 10 Gbps
operation.

The TC9564 also implements an embedded GPIO controller, which exposes
10 lines externally.  Some platforms use these GPIO lines, so this
GPIO controller is managed by a separate driver.  Other embedded
peripherals (like a microcontroller, SRAM, and UART) are currently
unused.

The GPIO controller is managed by registers accessed via MMIO on an
internal PCIe function's registers.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/net/toshiba,tc9564-dwmac.yaml    | 120 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
new file mode 100644
index 0000000000000..6e7a63dfcf86a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/toshiba,tc9564-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC956x Ethernet-AVB/TSN Controller
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description: |
+  The Toshiba TC9564 (and more generally, TC956x) incorporates a PCIe
+  gen 3 switch with one upstream and three downstream ports.  The first
+  two downstream ports are exposed externally, while the third is used
+  by an internal PCIe endpoint.  The PCIe endpoint implements two PCIe
+  functions, and attached to each of these is a 10 Gbps capable Synopsys
+  Ethernet controller.
+
+  The TC956x additionally implements other internal IP blocks, and in
+  particular it implements a GPIO controller.  Ten of the 35 GPIO lines
+  implemented are exposed externally and are usable by the platform.
+  It is platform-dependent whether the GPIO function must be exposed,
+  and if it is, PCIe function 0 supplies it.
+
+              ----------------------------------
+              |              Host              |
+              ------+...+----------+........+---
+                    |i2c|          |  PCIe  |
+    ----------------+...+----------+........+------
+    | TC956x        |I2C|          |upstream|     |
+    |               -----        --+--------+---  |
+    |  -----  ------  -------    | PCIe switch |  |
+    |  |SPI|  |GPIO|  |reset|    |             |  |
+    |  -----  ------  |clock|    | DS3 DS2 DS1 |  |
+    |                 -------    ---++--++--++--  |
+    |  -----  ------     downstream//    \\  \\   |  downstream
+    |  |MCU|  |SRAM|    /==========/      \\  \===== PCIe port 1
+    |  -----  ------   //PCIe port 3       \\     |
+    |                  ||                   \======= downstream
+    |  ----+-----------++-----------+----         |  PCIe port 2
+    |  | M | internal PCIe endpoint | M |         |
+    |  | S |------------------------| S |  ------ |
+    |  | I |   PCIe   |  |   PCIe   | I |  |UART| |
+    |  | G |function 0|  |function 1| G |  ------ |
+    |  | E |----++----|  |----++----| E |         |
+    |  | N |  eMAC 0  |  |  eMAC 1  | N |         |
+    --------+.......+------+.....+-----------------
+            |USXGMII|      |SGMII|
+          --+.......+--  --+.....+--
+          |  ARQ113C  |  | QEP8121 |
+          |    PHY    |  |   PHY   |
+          -------------  -----------
+
+properties:
+  compatible:
+    enum:
+      - pci1179,0220 # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
+
+  gpio:
+    type: object
+    description: Embedded GPIO controller
+    $ref: /schemas/gpio/gpio.yaml#
+
+  ethernet:
+    type: object
+    description: XGMAC Ethernet controller
+    $ref: /schemas/net/ethernet-controller.yaml#
+    properties:
+      mdio:
+        $ref: snps,dwmac.yaml#/properties/mdio
+    required:
+      - mdio
+
+required:
+  - compatible
+
+allOf:
+  - $ref: /schemas/pci/pci-device.yaml#
+  - $ref: /schemas/pci/pci-bus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pcie {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        pci@0,0 {
+            compatible = "pci1179,0220";
+            reg = <0x50000 0x0 0x0 0x0 0x0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            device_type = "pci";
+            ranges;
+
+            gpio {
+                  gpio-controller;
+                  #gpio-cells = <2>;
+            };
+
+            ethernet {
+                phy-mode = "10gbase-r";
+                phy-handle = <&tc9564_emac0_phy>;
+
+                mdio {
+                  compatible = "snps,dwmac-mdio";
+                  #address-cells = <1>;
+                  #size-cells = <0>;
+
+                  tc9564_emac0_phy: ethernet-phy@1c {
+                      compatible = "ethernet-phy-id311c.1c12";
+                      reg = <0x1c>;
+                  };
+              };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2aa6ea012c848..f976c9fa9d9c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27052,6 +27052,12 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA TC956X/QUALCOMM QPS615 DWMAC ETHERNET DRIVER
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
+
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.51.0



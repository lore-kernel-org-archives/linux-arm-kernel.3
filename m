Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889D5D33990
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNEc7Ab11J7D2bwXEyWPM+PpwLENCKqu46gw0+Cu+lU=; b=hUuNG6m3O24oKlAcu186D9fJg5
	5AGQmg4umSny/r5wAHCJsfDP9Xf9KrFa/tI4bG9SUPqPB2jVMp4++Hd1s7lm4PugATq69+MWVCgJg
	qt6gqd2G+jbIelhx4AlTek2zJc8OBvx+7PXPsVf3bBbLEYGKwwagHqduy7K0uCvLqW2hykFJp1Tpt
	3O8xK/6pbbZJrB71L8gDdJZlZyfGsKcO/R/4ur0COgtIz/8aV7QbG8SFaq90p1Vgk7zsFuzLbS/Gq
	gLkVL//9lsQw2Dh+P+Adv3LF7d6KYUiSiD7kuuGiWq/uciJ6Q/OtT2s4d4ybmpWTFKCzJDBcVjc7L
	u88I2Z+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Qq9-0000000B8kc-09Lz;
	Mon, 28 Oct 2024 14:35:29 +0000
Received: from mail-ed1-f65.google.com ([209.85.208.65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QOw-0000000B2ic-00fA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:07:24 +0000
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-5cb74434bc5so5625349a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 07:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730124439; x=1730729239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNEc7Ab11J7D2bwXEyWPM+PpwLENCKqu46gw0+Cu+lU=;
        b=ITzEeEM2bh0M9jNDNPbBGAustdm22nUrp2X1eh7lj/V5250PvF/UBQMPJQwpZrOD4a
         ROOO/jf6nH5i2VSMEpVoeIRu41crnRcX80e5L7WRF0i0dOhq0FZwgjLRQ8vkS3cIBbBL
         /vZkPrhv8tAkxfOo5RyZqh6Y3dWGJkURa277/Zf7aqPT/p/OotH9b5NVpp5PUfh8Rt2q
         ldUu2R9IW2gyaMDVbOL9GPmogRGUurCmJzf1gJht/2UYEM7W7DsEZ4xL+tSP3ylQni7N
         NUsJL7Pr6yIR8YuOAX2P2q1zxd5rXVVinYWT+frvZezjHy8kKyi5WJxzKFUZIDNaQCKM
         mqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124439; x=1730729239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNEc7Ab11J7D2bwXEyWPM+PpwLENCKqu46gw0+Cu+lU=;
        b=r0oBIG/7Gel7x4HUqv8ispO31rzAHi6FvM6McLRCgXd/RNXToTzJGHYU9n7gx9cCAk
         m/aduaNpLzfls+BVZGxscShp8u4Wn0mOjmDC1QV23ScFsFV9OuxIXtEayDvNVmBaxH+n
         ZMlVclN9cJpno+FCNz8H2Wrj2xuiK47s+Vcm8+E5VYvB0W8X24mYutRX0nL557ntqpbV
         b/+DxFVqShUzReaRMAH/MNIejudcWuBMYsIdiw92zkw5+Lz9PwnoUHGZqeMxoIIhRk2z
         TDtFY+H0TNP7/v/RVNw9LUZECK3ZBBYuYvl/49xYHKj1tDllx80Uw9IUzeXRT7rlfB8B
         fJ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnJ0obV93iu40OAwO4ciNHZDemRR1Qm1Vu1EM4N2eYbfHtuHhy+v3oXepP5syO7CukAdL7yZA22nhDwRq9PXHs@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2bsuaQn0ShL5hipZ1SVdiWvrZIQYKZa2c68XY8jnFx4NwvUnX
	w0U2FYJ+4aCWVKAiQzz+FHNNWQWy9SC8bbHHA9Zjzad8lOUELw8b8hRhrHWtrzo=
X-Google-Smtp-Source: AGHT+IGLRlQTVhRPQemiDdTWqan8eXJlYIgmzJ3VjDMdLX43CD2E2sNJ5FgkqwMaVS/d3Bu6+8CK3Q==
X-Received: by 2002:a17:907:3da1:b0:a99:4e35:9a25 with SMTP id a640c23a62f3a-a9de61a17a1mr698709666b.44.1730124439054;
        Mon, 28 Oct 2024 07:07:19 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a08b29asm383846066b.225.2024.10.28.07.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:07:18 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v3 04/12] dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
Date: Mon, 28 Oct 2024 15:07:21 +0100
Message-ID: <768d2307342e1054c58324a9d51957456dc82cbf.1730123575.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1730123575.git.andrea.porta@suse.com>
References: <cover.1730123575.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_070722_104323_A01F81AF 
X-CRM114-Status: GOOD (  17.04  )
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

The RP1 is a MFD that exposes its peripherals through PCI BARs. This
schema is intended as minimal support for the clock generator and
gpio controller peripherals which are accessible through BAR1.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../devicetree/bindings/misc/pci1de4,1.yaml   | 80 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml

diff --git a/Documentation/devicetree/bindings/misc/pci1de4,1.yaml b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
new file mode 100644
index 000000000000..d66b2fc130d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/pci1de4,1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi RP1 MFD PCI device
+
+maintainers:
+  - Andrea della Porta <andrea.porta@suse.com>
+
+description:
+  The RaspberryPi RP1 is a PCI multi function device containing
+  peripherals ranging from Ethernet to USB controller, I2C, SPI
+  and others.
+  The peripherals are accessed by addressing the PCI BAR1 region.
+
+allOf:
+  - $ref: /schemas/pci/pci-ep-bus.yaml
+
+properties:
+  compatible:
+    additionalItems: true
+    maxItems: 3
+    items:
+      - const: pci1de4,1
+
+  '#interrupt-cells':
+    const: 2
+    description:
+      Specifies respectively the interrupt number and flags as defined
+      in include/dt-bindings/interrupt-controller/irq.h.
+
+  interrupt-controller: true
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - '#interrupt-cells'
+  - interrupt-controller
+  - pci-ep-bus@1
+
+examples:
+  - |
+    pci {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        rp1@0,0 {
+            compatible = "pci1de4,1";
+            ranges = <0x01 0x00 0x00000000
+                      0x82010000 0x00 0x00
+                      0x00 0x400000>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            pci_ep_bus: pci-ep-bus@1 {
+                compatible = "simple-bus";
+                ranges = <0xc0 0x40000000
+                          0x01 0x00 0x00000000
+                          0x00 0x00400000>;
+                dma-ranges = <0x10 0x00000000
+                              0x43000000 0x10 0x00000000
+                              0x10 0x00000000>;
+                #address-cells = <2>;
+                #size-cells = <2>;
+
+                rp1_clocks: clocks@c040018000 {
+                    compatible = "raspberrypi,rp1-clocks";
+                    reg = <0xc0 0x40018000 0x0 0x10038>;
+                    #clock-cells = <1>;
+                    clocks = <&clk_rp1_xosc>;
+                    clock-names =  "xosc";
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ccf123b805c8..2aea5a6166bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19384,6 +19384,7 @@ RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 F:	include/dt-bindings/clock/rp1.h
-- 
2.35.3



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9083E66894
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 10:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0h/dJNmLaJkRXln6GWtNUJKLiMzuYHl099QEc2GHa+E=; b=WqA7hNboQ6Buvx0P191s/YZQlx
	qhKP1fTQOyrTherKkL9uRTMkwJkicMu0yQ5wayd4ojcw+c2s3+ZKUwpa9bh736fvHtKlVug03LnRW
	vOYcATUOIMMUAmC/2gZS6BJn71yNGnbHLsZqM2UHWeaH1G9AujK41m2CVHzEqZ6w2PP7KBSU5J8gg
	+m8pXdjdn5C6ngvAIF9gtAjhr/ejZFDB9CfVB3Rcfz/mq3nffTXUy14WTfFc3lH2jVGmGb8PzVKyq
	xm0cCqzTxvXNWQboiJNshQTHn+4Bz7d9pjczid2DmyVmwNuTSK4EBOx6Os5jMnb/cAcgbPdhYumFL
	+gPwC8Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFAIC-00000005ehX-3BYj;
	Sun, 24 Nov 2024 10:56:40 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFAD7-00000005dWJ-3Uhd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 10:51:27 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so577257666b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 02:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732445484; x=1733050284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0h/dJNmLaJkRXln6GWtNUJKLiMzuYHl099QEc2GHa+E=;
        b=Z11Cr6UJmI1hZUsYUGJy5Jd1o85LDXrM+uJ6o7BECYv6Qb7fgBiDHNy1LADRZfi8yB
         IFoziLYwSxBXYNM+Yne2+G4tCfZ+9DXWNa0cI2H8pl7TvpQ2GFDjFE5S1dyVb0oujGXO
         dq6COAkEMNEU31KtQYFx5i3rpa0T56JOCpLdxPaMylYRGCkaY6Ib8qb6iWDbMxKHbjF8
         gFWTnQl6x48p1uxTCKg1ngb3g+g43MtXofARuiJzCIbR8QLCf0rmUOom7jV4T7yQiv3r
         YZ/5rO0rklz6gzg4MbVQy4f5+7MxKC0riWSlxUBpCeub2MMPhU7e8mrpte+lfIj/UoCJ
         JDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732445484; x=1733050284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0h/dJNmLaJkRXln6GWtNUJKLiMzuYHl099QEc2GHa+E=;
        b=LqH/PHjYwohHNWlO1v9hDgzspaCLDafAwgnJgN+IMhR0wPwbYIuHXpZAHLe6pVn6M4
         g7h7A9QRWfkXuqVacJ8VPnKVJ+VMb4Swq21I4ObnjURWoy7UsJd3mCKff9s/R+38Zw4Q
         D2kRyy7S0f1cmtYhyRr1j9fcJtuwlA5lziOUpsABK6nbdaHoPxB3RWycMFEy6D9kvago
         WUI5zuT2gqg6cK8jSVBQ3qfEXo1j4ye1EJhXKtqgrsQT26XHC+6TvFlSsoGL7qrQQJuy
         wmgzZiMEIS3M2QVenJiU0foWAkYL8S39/7By1Y6RsdvOZJPTB8BZeL7ni7Kt+Ft+0/67
         Zfow==
X-Forwarded-Encrypted: i=1; AJvYcCUXL9PkPrhyElUElqffEkt99gLDAHoobM2j4YqJhFKKZe8Lkmyb6Bw47C7Fv+bhKSxghSqwPw647X3n7vRvltdW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5MBLW5J0ZXeELvs0CzKbBojwzYPP0ozFNcXHogHhDje7BKSH5
	jGSMxBVUF+YUNCLEQiFUIvBfsrs3D75kVi7a3aXLl9UwR3yBozVTPwhVtePfd/M=
X-Gm-Gg: ASbGnctVDdyrKaOwDBnrELHsA9AQGbaah2HpT4jnQu3AAYsNkt0QWGib993MZVnSrgK
	lPYGWK1RL7QOmmM7V2kxRFIIim689qjWWCD1FItXjsCDUqilxsM2TPKLPBdrcFZx4I7VwjL70lq
	KDpl6h99BU5EsjoZoCPsKRqW9t+QbDaaURpCi02JXu8JTgRSMrN4pAAFEKcLSErjaBbEUQZS0fp
	I2Sa2SnG3i+dYBkKSc1oqxxWqXHu0ju+9ctvv9F5rky2xioL76/OstW8pyW5vf9Hw/hS3KeLtWd
	Tg8jGF1dts6vqLGq+S0D
X-Google-Smtp-Source: AGHT+IFCpVvo0hkBe9gao8DgUns3PDPSWgbR0TGeCkcxYWD2ZwTIRxp0fywsn/nQF4Dz7vC2x1KBAA==
X-Received: by 2002:a17:907:7848:b0:aa5:35a6:8da8 with SMTP id a640c23a62f3a-aa535a693ebmr408145566b.12.1732445484047;
        Sun, 24 Nov 2024 02:51:24 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54423e8e9sm85491966b.77.2024.11.24.02.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:51:23 -0800 (PST)
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
Subject: [PATCH v4 04/10] dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
Date: Sun, 24 Nov 2024 11:51:41 +0100
Message-ID: <ebb21da5cb41391421b364815705be8b4c415f8a.1732444746.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1732444746.git.andrea.porta@suse.com>
References: <cover.1732444746.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_025125_881559_D661AABC 
X-CRM114-Status: GOOD (  16.51  )
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
 .../devicetree/bindings/misc/pci1de4,1.yaml   | 74 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml

diff --git a/Documentation/devicetree/bindings/misc/pci1de4,1.yaml b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
new file mode 100644
index 000000000000..304d6b3d9e83
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
@@ -0,0 +1,74 @@
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
+            ranges = <0x01 0x00 0x00000000  0x82010000 0x00 0x00  0x00 0x400000>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            pci_ep_bus: pci-ep-bus@1 {
+                compatible = "simple-bus";
+                ranges = <0xc0 0x40000000  0x01 0x00 0x00000000  0x00 0x00400000>;
+                dma-ranges = <0x10 0x00000000  0x43000000 0x10 0x00000000  0x10 0x00000000>;
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



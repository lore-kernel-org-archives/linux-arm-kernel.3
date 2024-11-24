Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4A0E66894
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 10:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLWrJEtQWYU6sIqTXuJPR1rYvX74a8T1Gz+AvMzyXx8=; b=l0G8EkHrg0L8fQr/KOum8jFPVa
	hfE/y+oKLvYSbL8HYajUm/F55vCqjo1FYwfK4QfFZGnBUMLtFkUpyUyOKOxUo7XpQcdin5P++1v8m
	r+Zo2MD3mDmMhUSAlp6u1dnZqI5l38ABEe2zZaCoykJ9woAQE3Vz1SngUShsuaM7JIYg0+mdS/aiB
	YAi74WwqdIAfuRa8inBT+jL297LStYstE3ebZ9oGFyVWDdT0VplObwDpXDJCVyypUWHrqLdZf2GDi
	Z9Qf0qYWI5bg1hbpemifFDTJoATaa4Ig77rdcGFRXjt9/68TZlcS41bf9m93frUTHOVl5WXGrqxY7
	PDaQTodg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFAHI-00000005ebN-01Te;
	Sun, 24 Nov 2024 10:55:44 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFAD6-00000005dVR-0I4m
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 10:51:25 +0000
Received: by mail-ed1-x544.google.com with SMTP id 4fb4d7f45d1cf-5cffb4ff85eso4864200a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 02:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732445483; x=1733050283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BLWrJEtQWYU6sIqTXuJPR1rYvX74a8T1Gz+AvMzyXx8=;
        b=P3RclCZ9FAQOs9b44lhp+98dzTebkfKiFCddpeeWVhzi4shYSKZC2/cO9m2WJ9ZZoL
         Jy4Tbbazvdv7wQiCfMobJxj4rQbqPklDryV8wb+ukPn3EZcbYUjtpOM75ooaHOjuQIYm
         CgnunLdJWoq/P1AEcFOMa6MyIrpTyCX3027jEYdK9Pr4A+cSYVH72TxrYF5WBS+qatrE
         lLqzSxwceIhE8TM/P4XiSJHyQ0bRI95tlP2QJURB4qLh3xuEU61OcVBLVo54zezctQsE
         KytJWGumRktdW81m/ZF7T+AK1z/k+Gq+Gr9FKPPMfj8wJ+PrbqepvaAPwbBIDBy/I+T4
         m5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732445483; x=1733050283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLWrJEtQWYU6sIqTXuJPR1rYvX74a8T1Gz+AvMzyXx8=;
        b=hlNqbXEdyy05c2QEnijvNOE3I8SpUBx88qOoiBUysTrdc5SoSRIucc1j28dMD5q4tA
         dzNK5lj/vKiN4Z/RxqgMDKN9rGTLUqcLYw9UOAthzAP83T/jifzpwnWf7POcbfG/82Mu
         jyxx+wRkaPxg2AjqCa6i/7z9C/54oRUXrs2Wo2fk82/lNopkltK237gBu7aYALi1JVo5
         15CscJs13j/q5FLM5oizbqdmKTT7LtfzcZ0Xz+81neMzwe4nsXsyQu0o0+TR7F9fU29z
         iukuk0Fpk1IbU0zJ6dJp4MIJ+0SBJ7ooOxxnF7HXrc+YrCT+A5puvDDcGdAbKhhTTQf0
         sC4g==
X-Forwarded-Encrypted: i=1; AJvYcCVQwQeswoV2CT8x4Ai6Ci2WTUjMFTLoJLYZahyC4tDymnwC+YhpLUs5AB5RsEs0WcoAQX79KZZZN9Y8bme+RDHI@lists.infradead.org
X-Gm-Message-State: AOJu0YxBYSuzB7zPXK9rTWgQnv8UIzgKQmm71sm6w40TYR6SoS/K0zS8
	XF5jl06rEpM6H9lzawHmoGb8bV4Smayx4ttDMhLraZnbE5Srlq64Svl7PiSlEz4DlTJxfJx4bqS
	eWubnTg==
X-Gm-Gg: ASbGncswiYKrxNNLZi2ZN5H5y2p8mos+z63OZ31uoU9u7VF5EHDXYg3GxSfa4ARKfgr
	BZ9b2kevZxdd13JYkUVsVJRKCn0JsFF4XOnSL/ZtgSggjYM0WPCyejT4PnTrmiqRTVCjiubp0SB
	/qFUBTh1FnT/WIVPZlZXSKSQgFWuvHUIDu6sftP0zn/4KyNee0/5INRwDR5m2vBkaEp403X/1MX
	XBZuu3GsKQPVTE7CO66y8MnuDwalV3qXpU110ddgVbhcQbF/KR/1n361Fsf0wt80BNLfML7oi23
	B2jsoOoWrWh5PO7SyZPa
X-Google-Smtp-Source: AGHT+IF4JCfJCHDj53U5kUX+yj6V0dQb3HAizgGoKIijou+8AljCrGAAKu5WC62xyaqw54638HdB5w==
X-Received: by 2002:a05:6402:4309:b0:5cf:ce86:60a8 with SMTP id 4fb4d7f45d1cf-5d020694058mr6611062a12.23.1732445482660;
        Sun, 24 Nov 2024 02:51:22 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa544df327bsm79696466b.19.2024.11.24.02.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:51:22 -0800 (PST)
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
Subject: [PATCH v4 03/10] dt-bindings: pci: Add common schema for devices accessible through PCI BARs
Date: Sun, 24 Nov 2024 11:51:40 +0100
Message-ID: <dbbda55c7cbb14d3f5b269981a946f07b44ff835.1732444746.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1732444746.git.andrea.porta@suse.com>
References: <cover.1732444746.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_025124_131930_2C539930 
X-CRM114-Status: GOOD (  19.88  )
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

Common YAML schema for devices that exports internal peripherals through
PCI BARs. The BARs are exposed as simple-buses through which the
peripherals can be accessed.

This is not intended to be used as a standalone binding, but should be
included by device specific bindings.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../devicetree/bindings/pci/pci-ep-bus.yaml   | 58 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/pci-ep-bus.yaml

diff --git a/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
new file mode 100644
index 000000000000..33479a5b40c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/pci-ep-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Properties for PCI MFD EP with Peripherals Addressable from BARs
+
+maintainers:
+  - Andrea della Porta  <andrea.porta@suse.com>
+
+description:
+  Define a generic node representing a PCI endpoint which contains several sub-
+  peripherals. The peripherals can be accessed through one or more BARs.
+  This common schema is intended to be referenced from device tree bindings, and
+  does not represent a device tree binding by itself.
+
+properties:
+  '#address-cells':
+    const: 3
+
+  '#size-cells':
+    const: 2
+
+  ranges:
+    minItems: 1
+    maxItems: 6
+    items:
+      maxItems: 8
+      additionalItems: true
+      items:
+        - maximum: 5  # The BAR number
+        - const: 0
+        - const: 0
+
+patternProperties:
+  '^pci-ep-bus@[0-5]$':
+    type: object
+    description:
+      One node for each BAR used by peripherals contained in the PCI endpoint.
+      Each node represent a bus on which peripherals are connected.
+      This allows for some segmentation, e.g. one peripheral is accessible
+      through BAR0 and another through BAR1, and you don't want the two
+      peripherals to be able to act on the other BAR. Alternatively, when
+      different peripherals need to share BARs, you can define only one node
+      and use 'ranges' property to map all the used BARs.
+
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: simple-bus
+
+    required:
+      - compatible
+
+additionalProperties: true
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index c55d12550246..ccf123b805c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19384,6 +19384,7 @@ RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 F:	include/dt-bindings/clock/rp1.h
 F:	include/dt-bindings/misc/rp1.h
-- 
2.35.3



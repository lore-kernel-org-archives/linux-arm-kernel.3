Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A38D3398C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SI9eKYh0F26+LR3GPe1sodJ7zzCtCgj8qtPEzcqglJE=; b=whoCVzWW6QBCiM14QmqUUmReES
	qP4qSt7IbC+T1eqVH4Jlt0txr0JuUbGQDXJNS3vg8culVRSGUMuuQ4cTWsSANzMU5rjtX5xKXcSae
	KPa4LQbVXRPnN46MLvgfRbm93jjDMjJKUuXtdlu/AvQ/ZyClpC6DTj0z6JYvJSVHJBIAxojnWyt++
	FdrmB1U8jXBCkpQwdy5Tu295MgXamBckYROkLj8p7n0+4lcDSSgI+ICkd9zRw0PhaZ2PpjWMEFKgb
	fXz+he3FCQ9RVnZjooZclpmeNk2GHE+ldtgC2ScN+3l+b74IVPjyr68bUmcpoRQDf9/Bs71RAxNyX
	g7UkwMOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QoZ-0000000B8Sz-3qpH;
	Mon, 28 Oct 2024 14:33:51 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QOt-0000000B2hO-213n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:07:24 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-5c937b5169cso6743295a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 07:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730124438; x=1730729238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SI9eKYh0F26+LR3GPe1sodJ7zzCtCgj8qtPEzcqglJE=;
        b=F3NiwTRpWJ5TgajY2SmjBHQNLlxGFyuXbFNd8QQ4mgWzvteurGSQrjY0uwViRVcgXl
         zojPbeB2MoHV4fOYYipdJZIjtecMb+DOhnySL3vUgsWUO84yFNvEyhonaRrbDcFHH85Q
         Zo+lxTNW9JgSclHALeEAKV5ivvMefIFaUBCAh5YDgfW1YMqj6xwcdoOdbjShBdSV7VT7
         7/PEbY3X1hjqB/enZ4bEk5bYMJ9kL6jlkN1b2ZO1XDH7fEIeobZ5Sht9Jwl78fBVNLrT
         fL3Y/0OljQmP0IMouqB6JEKHi+3S8R6dfXyVPNB33rIXNJ0rh96x2zwRIhPap8pRexB7
         AihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124438; x=1730729238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SI9eKYh0F26+LR3GPe1sodJ7zzCtCgj8qtPEzcqglJE=;
        b=qFCme4JSl1e+izTOxizEz3J4D74ZMBagvb6tUhVli3b+iaHAHcPxv1FEAXSl97gpPd
         WhDTknzAQCmfRzgM9d7lCT3DFdQUIJ9YjF5nce60kjA1eXPea7u7tjpO8pUpbS56upag
         u+QFhpdJullYDfNBNP3nWUte606xlYz2GPHj34QHxoJP45iCRj6wR/RAIW6Sa7DdmAgj
         b+SQcRvXg49FYUywCbNM8aK+20ns26vrhuQcT/aF8ThuotmsExohFcGXYttYXTrez5xJ
         JPfrl/pkbVpG1SN/9dqndHB9Sq+TWRk93Ge/KP7JtUxMEbYyNPqF4mTTMjyt8SQG3qXK
         umzg==
X-Forwarded-Encrypted: i=1; AJvYcCXUT2VKFDkCBcGjwmktIC3JiXUNW4UwK2/B81fBcl+QnGRrGSU8uENF6n6HoHoUlFzm7+Y8qIlNWL6B3k4N3UxL@lists.infradead.org
X-Gm-Message-State: AOJu0YxIfawuFJL7VvlmWzQcnRFel5Q42MZH7WIhf12Ewf866bti+dEs
	z+Q87aWfEV/8Do6lBH7ZgCXxQNHPAAX/ZZ1WW78g1kHqJUODZiASZE74Qm6Rhf4=
X-Google-Smtp-Source: AGHT+IF5qNRgzKfi4MHhOJRZ8tqZIPrE0osHzwKattDyJF+pEfAMuUnEueh0yzfRuzZGt6IlIDK4Xg==
X-Received: by 2002:a05:6402:1ed2:b0:5c8:df99:a6ec with SMTP id 4fb4d7f45d1cf-5cbbf20f089mr7633425a12.14.1730124438052;
        Mon, 28 Oct 2024 07:07:18 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb631a24dsm3186275a12.74.2024.10.28.07.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:07:17 -0700 (PDT)
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
Subject: [PATCH v3 03/12] dt-bindings: pci: Add common schema for devices accessible through PCI BARs
Date: Mon, 28 Oct 2024 15:07:20 +0100
Message-ID: <2948fdf8ccf8d83f59814d0b2a85ce8dac938764.1730123575.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1730123575.git.andrea.porta@suse.com>
References: <cover.1730123575.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_070719_682853_C2104D0C 
X-CRM114-Status: GOOD (  20.23  )
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
index 000000000000..e532621f226b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/pci-ep-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Properties for PCI MFD Endpoints with Peripherals Addressable from BARs
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



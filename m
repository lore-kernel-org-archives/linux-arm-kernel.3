Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2714FC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 15:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VK0RSe0ldjtHClEHoqi5wXPziNZcvh2YDnOa/fSuvqM=; b=D3+11q/+H+cCJyoxmE95jJLvsd
	wYt7z4Wqwlrg0hWcIaeFc1WhgYTU4RJW743S+VOK4V+H85VWCX4D9oBn0XaFIHY6ADkhj+84DFjOa
	fiHxYecdzWeSwIAERdBSMAZmqnKVMGsGu0Zjgyl1gZhQOEm0CLo7MKtzEbNUK0jo2o8lx/MWZmZ/1
	FZFsB5Dfq3jiVP7NxUYb5WscAR0UZw8HRkgAzBgNWHle87wMcwCfBZahs2FJ/8T0tcTUDg92uZeIs
	1KOHGwLfoR9yVxX8uPflRXJX1bl/k6rhcXRjYN5+aOlHsbNkInuEE6b7mpX+EapJ7jlRhk/Qi5uwS
	BuyTmGCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMaW-00000005gt6-2BBS;
	Mon, 13 Jan 2025 15:42:48 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLsd-00000005Vr0-1wYp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 14:57:29 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-5d41848901bso1183343a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 06:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736780246; x=1737385046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VK0RSe0ldjtHClEHoqi5wXPziNZcvh2YDnOa/fSuvqM=;
        b=W4ihprYN6/61amAt8BfmFuXWo9qd+zhYyrBGQhmCz2Gn0y/cZFwclKwByUZf5eZ+kW
         zUBxRFgYrgmnqyuYSQTymHI7LQl/RbjazUYOr4M7rbnQ3Fvn5xLTFrFBXvuCScrnFKzW
         Er60J7Hx4cJd/HrgQIglD4cQMjDbkpiBmC/IEAG56P6uIt8R/5qYo5WmkpNUG61eogwg
         szR+DzMGzktnxm5lj6eWe2MAi0oJiqMsB15d1wQHwcfEWOIxAQDxbKxqRePgftAYmoJj
         NBrpBWTnWzVKTUyYqKtc1AJ2yBVRG2zUF/seNsQ/jFLbLdxJEyhX086KrZhTJtarE6hj
         DZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780246; x=1737385046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VK0RSe0ldjtHClEHoqi5wXPziNZcvh2YDnOa/fSuvqM=;
        b=eQnGLbx6bBdnCai4mQKNw45ZQfc+wI70SA17BKIq6VglV6z93JxrlPSj5ToVtvTfoO
         eNCN4I3w86yxObe44+pqDXdyVdpMgN52ZU/8TaPxuujn6wVhfrMMQq/VBiH0yO2X+bAY
         EBxSwbCkNrJ0lODj6FK0iJeTJdxrWKN7MOzs3NhTxkYIQGnD6WhrPTqW4RsOxsGltW2n
         +xdEL4EC/C0hzt8RXh8ji2gABSRoPk1fpELXs1QrWUdIc8RBH+CayT2nxgVyC9Z0hG5K
         sULO04e+5oTnTc3JoEA9RtHxugd9rtNMXQm62rYZqxbR2UmqbOazNletv5sAQ23Emadi
         yELQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVRmeZY+JdEiXoro/xqE6eKswntQbju+BaxTNgd0Un6Zad6TS8oUjy0nWsHbTUGombJokcRJXnp2msr+IJe/K2@lists.infradead.org
X-Gm-Message-State: AOJu0YwrBLE/1WWEreUKUAXJgNLxXzhoXxJmgmeerrH7MS32bQtPh8Cy
	5Yf+r09wVvy9hBOGeheKiJiTvMi75/5XQJSY/YnJEj7Kn16X1Pj6eFtO0YLrSms=
X-Gm-Gg: ASbGncuGn3lEJmTZTKcxpmXgZ+Spf0gySCIZEBJ2u8cBh82LUkD+J8/Z0F6/MH3MsWV
	x9+IOpvm68jdqaaR+xAQX/0iYc/pnwdZSmG76lyHSOMbKtRvGL4tpYbFQ3FeqodVtJTUHaLZh9S
	aTVOWIzfviAPjnvs3kWcQ3C2OWDops5VUwe0xAwxEDLJ6s3YvIlCpktMHpMTCoAGU2kDNoYCIpd
	9jOzRe0g/ORKMBL+8+XWVLU0QuNz/su3wHI4H9Z/K3WMPMh5ioFhK9QfEDyRjaugjpi4Fre3nby
	e07Uea8D09lFOu8TuwFJVAalxl0=
X-Google-Smtp-Source: AGHT+IFe6wqfMpYd/sg7qDfaYNOJsN6JxiXCoEz9GuSlottMuQRBLVNKGO+AkEcqEE65UuRk+0LkNw==
X-Received: by 2002:a05:6402:3483:b0:5d0:d06b:cdc4 with SMTP id 4fb4d7f45d1cf-5d98a50fa60mr14110801a12.15.1736780246102;
        Mon, 13 Jan 2025 06:57:26 -0800 (PST)
Received: from localhost (host-87-14-236-197.retail.telecomitalia.it. [87.14.236.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c3b5sm5056878a12.12.2025.01.13.06.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:57:25 -0800 (PST)
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
Subject: [PATCH v6 03/10] dt-bindings: pci: Add common schema for devices accessible through PCI BARs
Date: Mon, 13 Jan 2025 15:58:02 +0100
Message-ID: <c687b606c5ae6a4397dbf12c874c690da5e4b344.1736776658.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1736776658.git.andrea.porta@suse.com>
References: <cover.1736776658.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_065727_544742_CBF4AA0D 
X-CRM114-Status: GOOD (  19.99  )
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
index a547e863807c..ceed86755da4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19578,6 +19578,7 @@ RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 F:	include/dt-bindings/clock/rp1.h
 F:	include/dt-bindings/misc/rp1.h
-- 
2.35.3



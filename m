Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5C7C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 21:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsdeUn09NQu1XAwKNFzWW9JkORXiQHI3/S6RPw7u+/c=; b=xTafPGbnDOisg+ARC7/hFpgvZp
	DAa0qEs+Lnw1XPYnb2N1Uz47QO8qbKAHFUTkyy1sP+Y72L6tAd7BSMliuhjWeRCfBbiw8Jy1vr7O8
	xBNqsL49LDyJdoUdwftXjO0w9FkLqqW699wApQBvOUFFQeGBfvw4qZ6fkhO8u15ZrmKrvTNJ6SKAS
	wjQtp61jppFQX+xm/bcW1QCzUZaon8Yi5D1wnsqfoXTZ+f1MikiBQoGpddtSqCCiR5PLIK5k/m0Iz
	f7qNsxPo+bWL00y6LNnkact39OQuVFTFxeAXIH0OJpppPEKU66PiM+shZEazh0CPqssNDRqiqzrkE
	5pobTTtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgW2L-0000000BGHG-1uAr;
	Fri, 07 Feb 2025 21:37:21 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVwE-0000000BDMQ-0SgC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 21:31:03 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-aa68b513abcso472769666b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 13:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738963860; x=1739568660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsdeUn09NQu1XAwKNFzWW9JkORXiQHI3/S6RPw7u+/c=;
        b=f9Ap/ADchc8zMebo4rk6zwmYuG7QNEdl5MQO9BH+1gwcdyjMpkESTverPoH8/AXQOr
         Gr5fGWucBqs0S7ida/JKtWN7D8nvHtt9VpFhHiWNfQoZ3JTEy5XzuY77cV+52vu9R1dS
         hIRu7mU9WZXwwDXgJ+Q63m+Sea8C4JNj7tS/BkcdqbY6pL0XIb7QeZU4tvld21VUIsau
         /NXEm/59u3vijVIc1v/V3eGBhGi5GjSe5oM0jqA/3HiiyhJCGeZuL8KU+8eygR4hlrQ4
         4nW7cnXPp9crXZbgjsXuS691ypMoAXuUY/vsMj+naty6m9ZTd4D2m3OESPCJqHlcAi/6
         ZPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963860; x=1739568660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsdeUn09NQu1XAwKNFzWW9JkORXiQHI3/S6RPw7u+/c=;
        b=qJFTc/IGeD9g9MPJXGeKOQYjOvTtI97j35Moq30/BxkhLaDv5W8APoia422Oywtha/
         tpcd+OinZyaawHh82RW/DymJZ2CWcKhwLebGB0b6+ujhkmqcAVKWW0Msltp0VKx0I5Pd
         l26T5WQN5WuWOMmM3u341pjqH75pV75b72jU7vlK2ImOyeTXaCatbfZ8TlKGi8VCHSg+
         CcWL66p9ukDjxeKf/cUutfKOMv+S6QwDMIdIndm21VhqZjG/opmrcHElUrRYbH7ea6r3
         nY8PAB3OAPNKuxHdwA8gyAEQNqr+U5kEYzbQu9aCrVjAc2wQcrsDEVZ5Fe3/dI1pEx4F
         aGSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTKF+b7vRNhUcXtxDdWUivJHtKr1pvXsn+irCNzEN4Q3Br3HyBPJ2cS6legoYIJSIi6eNzLdem/A/kdVzFYBQb@lists.infradead.org
X-Gm-Message-State: AOJu0YxMyjNjlPBQZ6sEy8Z9bV8HF4vU8q99283iUkztlypM6qJhPw7i
	MxlP8eXlBO6CVIycf3/M4sTaxiX8zMvWCr7NwQKIjD4G77DVT7ClqwDIqgYxMq0=
X-Gm-Gg: ASbGncvvfNQdyROO8GxntAYuGgAHy1eH6Ctve7ZPPAOT5YkEv+Jym6duvf1LGFsJu7L
	kxlOt8hgpSBj7nFHe1WupHmpdrRuA4bLWCBuV1FCpByrxJki2Z2dYTxaR4w6p1+GIQnTUCd3juY
	o118UmnIG15QfDYp1kf+4r4qoGLVadXXRR4rwkaElYNaFCnSzrFQbzkYfW4xqwYuCj/udSf+6Nf
	Q/IHqvMLm9+pYUuz7fs41vh7Sx36iDhYkh2IabnUtkORcbu2mZZ5sYK6ygmb26/HZU8dtaA1rEA
	mRUf2CRNqt0USgsTGJKmBr4/cmjSBj3isYzaACtGHrzpoFvq+e3gPgcTYJY=
X-Google-Smtp-Source: AGHT+IGMX5NVZzU8MUKeI0fjcjMv6fPf4JZi6tiL/AaJTBGa/B1TUhbWJvYJKAyCpuBEQJ9WjWWDMw==
X-Received: by 2002:a17:906:ef0b:b0:ab2:d8e7:682c with SMTP id a640c23a62f3a-ab789c630c2mr614943366b.38.1738963860387;
        Fri, 07 Feb 2025 13:31:00 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab79668f32esm69327666b.176.2025.02.07.13.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:31:00 -0800 (PST)
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
Subject: [PATCH v7 03/11] dt-bindings: pci: Add common schema for devices accessible through PCI BARs
Date: Fri,  7 Feb 2025 22:31:43 +0100
Message-ID: <c0acc51a7210fb30cae7b26f4ad1f0449beed95e.1738963156.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1738963156.git.andrea.porta@suse.com>
References: <cover.1738963156.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133102_151218_DD6AA387 
X-CRM114-Status: GOOD (  19.98  )
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
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
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
index d45c88955072..af2e4652bf3b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19752,6 +19752,7 @@ RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 F:	include/dt-bindings/clock/rp1.h
 F:	include/dt-bindings/misc/rp1.h
-- 
2.35.3



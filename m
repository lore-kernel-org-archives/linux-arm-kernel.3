Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10760C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4+2NUQXL7dLOg2OQ30WAPn8JqJfl7rhQlqfAESD2hk=; b=WM/2lM756F15IenE7TDHKZ1CsS
	ERKF4QwNl6oOPf3nEAH3yv5qCaAOhH8+JQQYqy3nK3LpYT//WEB7LXtxYOU67twCkUm74gZTZcpBn
	Hpr3knXY+fnH30aXl+rD1/dLsk3d1Y5rXuppooGfwAvd57XWcO/4NbFqf+PZtytgLaBR6csWlMH61
	gtZU+sqC1gIl3cc3pNkKlSv4w3sjpvfOFzqzgzgnCxEbSUN7HqwIYkiXbVWc9GwgUj88kY6loEVPi
	rKrUkkdTXm2WyDtj9qu+/CRs2Vy2GLq7VTAUOxGirZFzwv2RxY1UAkUYaLqVOfk8YGr12dLrFWvN8
	8arm5q1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1Yy-0000000AFQk-2bxp;
	Wed, 19 Mar 2025 22:07:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1K1-0000000ACRq-1ggM
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Mar 2025 21:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=c4+2NUQXL7dLOg2OQ30WAPn8JqJfl7rhQlqfAESD2hk=; b=CSUrwdRzN0x4ybEEtzWDqA+krd
	ImmFSDbGFDv2myrAJbEOCDQDH/ufk2ugbkCNdI6MiTRGB3nx9V43IFEv6I00mQd42/oZ9xZ1aNOq1
	I5DHolku+Q7dKoxa4rYPmeMFkSuIlZDxQKTt1RIEm9c5yZgjst0zBhYjls6uWJg1WlXRdX9E1dybE
	6xupLUJFPMGqqHwZUrYPrCzWkEnyTYeGN2kTq3YKsJUnbffB3QQZ7/axt9QwXFX99whqlRagcJVUS
	PIqh3WxGxaWxL0ipxN7VRtNOJFf/BQxHIBMBis4ZlQPMzpr0ko8eePJmSQ7KXDtAzTnbtCKHm8zMX
	ou+ch1Jw==;
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1Jx-000000041Et-3BEZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 21:51:32 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so235435a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 14:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742421087; x=1743025887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4+2NUQXL7dLOg2OQ30WAPn8JqJfl7rhQlqfAESD2hk=;
        b=Md70nlXKl9j6IArl+jc6iBDGpmc6cWT4eKVImGNtWw0sI4lQ8AcmkNCGsNAzfJmpfk
         uphhllmgqiE1fRO25tverR9bM0sTgXJkGqa+LKJtMp1JGwu9OFNTkI8cj0YKHtThJfyR
         ExAH2Y941gD8EBxBlTQ57cca4o0nmqwjHKl0bufIszBeSjlHETWa1QNV3kpj50vh12PH
         wp+vx12J5mGZhxESDaHM7YD8fX6rEIsv8IgvLpMtdmmM85P8vTo9FzgS3/9aS7adJv6q
         3dbncm5AMhKdl2OGwgPjFLToRkG+y2xzoXAfamPv4vaIXGD6KxDu3lvHvJkj1Xw3PerR
         gddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421087; x=1743025887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4+2NUQXL7dLOg2OQ30WAPn8JqJfl7rhQlqfAESD2hk=;
        b=Ix8EcTx+/fjhBzVHCGkLSqStwsBm8/6rnGGK6StyUJG1k9KPN5cyvWnlaeTVBjgVuH
         /1vZVQqElMukTqM5eNwP1HuqdU+7TJcGj4tUOxUHzC8ichGmoyhDxHNK/XWf8I0tw4f6
         Q3pWU88WRrW529eSxbVRTveHip5uLicz5as3Mg1kFfQZxhM3EFh/kAeloXe9WY4hgU5p
         53P+oYBZwGHXHLHI2kUdrFj4GAJruA1TGx3hl04hMx5Xj00jtFoyZ/+WjOex67KkWIOx
         K6YHywkMoBWiok0uYKYgh1kcPqUyBFcZpKY1ngG6OsklvabXNipvLSk+X+xE96ozBLly
         OG2A==
X-Forwarded-Encrypted: i=1; AJvYcCWrDtMMdSyIJhlhu2jDMFwhmTwbDn6/yCJa8ksYSbDTEy2AP9PNpIbx67tkKJSFgOHUyq3jb1bVKRNeGkK6YqIw@lists.infradead.org
X-Gm-Message-State: AOJu0YwShghREfgwr1x6CcZEv0EQv8AgTrUD7R3dpVSxBb6nWH8OBdtQ
	D3aCbIp1o0iGbRoO4kkeFtZ1mC5qEDe21FBDqjwxDWRdlj2l+AbAvU6KBlSG32c=
X-Gm-Gg: ASbGnctwxx/GHYLC1ATuvaIJp9zd4DNLJ4S3Rz/BAGbMFrhw3s8QUOw78sC/swAEmwE
	GqmE9mKdBGZGBa1cOBCH8KD15Q192qrYLHDLW5IgFO9RsB+T5P7mrXTAVr8D1ZmxZUW3XbTEkiK
	3r02zkKFac4BUfrMTAXTgltxG5Az0Xdg3DbQF03TfLFPCJ7qTUKqwLvDz4ppYbSMXPRv5hTguzo
	Cn7zLaGpWRZHuVnGrXgWbdzv7kjvviIo7wY2HRcbHQDrHLERJJWTzi2w4B1LBLR/dQePRAe7lI3
	eH2Y+7o4Zg525AlKFoKowVgEUxEcEa0stTFru4tBbfTP/kvq/PK+6xGnWJkHCSk+Sjj44I38eYb
	uHB+LtgMbxg==
X-Google-Smtp-Source: AGHT+IECByxBqyw0La28yzoSSkVXFaROTbSXGqLjaas9yMmdWpYo/OIW+kPPZ5laN9UoChAX7VneJQ==
X-Received: by 2002:a05:6402:524a:b0:5dc:6e27:e6e8 with SMTP id 4fb4d7f45d1cf-5eb80f8a1e0mr3956840a12.24.1742421087214;
        Wed, 19 Mar 2025 14:51:27 -0700 (PDT)
Received: from localhost (host-87-4-238-14.retail.telecomitalia.it. [87.4.238.14])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81692e691sm9444602a12.5.2025.03.19.14.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:51:26 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: [PATCH v8 03/13] dt-bindings: pci: Add common schema for devices accessible through PCI BARs
Date: Wed, 19 Mar 2025 22:52:24 +0100
Message-ID: <096ab7addb39e498e28ac2526c07157cc9327c42.1742418429.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1742418429.git.andrea.porta@suse.com>
References: <cover.1742418429.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_215130_169574_2324DF7F 
X-CRM114-Status: GOOD (  18.37  )
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
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/pci-ep-bus.yaml

diff --git a/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
new file mode 100644
index 000000000000..78129712da87
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
+  - A. della Porta  <andrea.porta@suse.com>
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
-- 
2.35.3



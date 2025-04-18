Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8987CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 13:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZUUEBM3tYUb/t6AkwMd62lhApOXYl97kh+AIMbiifmg=; b=cwrXPXSG5fOplExFBqVxTu+QWG
	D0daNKdd8G28SMABms/CEmlNiMhajngR0PzA5e+W5CzJncr7P2P+3uX7+lO5ELsHogUHYIRsMX1/T
	AvoTR8NSmMSErLubtmWXDZSqJT9UxX5yJmu+PAaRZFTey3Si0msGVxGxaXIF8Y12fFw4iiAQymZCE
	TvCpNxztBNBPxNY5gUyWrKnTV9CkS5zxzJGU3+7xOdlraj02pooYtmWuvYted9qWbFoOnYEUPbJdT
	4o/8b9Oy1802/m/dVcLXA4SF6EL9QP4feYvk7tgRsyBQXfvljuenL7dI7Oq/BG5Rn5YVnjmikml/q
	UPvqRIeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5mFo-0000000GKeK-2oqs;
	Fri, 18 Apr 2025 13:59:40 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5mDr-0000000GKHZ-401D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 13:57:41 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39129fc51f8so1824949f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 06:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744984658; x=1745589458; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUUEBM3tYUb/t6AkwMd62lhApOXYl97kh+AIMbiifmg=;
        b=QIgdjICXstq2jGaVLfhw9cme8FsFkRPa30KJogqSAKrzsUhevzw/G8UrMoXwTG9GKT
         sfG+Ysd/6TN6kvVgCGfVyxEP5BFgKk+phyU05+D3NCDxzDPr2Tkx/4J6rVyXrjtJcUGJ
         cVs7qWPRzZ6/OI3AvhP+s9ORF7fwl0eEjr2zLK5BchVH+xzHQudxFfdHyhctrxfa/LUd
         rXi0AYALcUSHdQccW4ZC0zJDY4LIK2RxZBzHC6GbulFQPzEFwaOS4xWotSuqLK4XcJWc
         fgiCf3tZyTo23PXxO2+ZK01Mh3X3GQlpzyed+l4irCUKpo8GxTA5dVh5W3uTHKgxgV7/
         tnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744984658; x=1745589458;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUUEBM3tYUb/t6AkwMd62lhApOXYl97kh+AIMbiifmg=;
        b=gYloAU6hTZ9oFUKK5HlY2yLFopup6svfTuwRQo8n94/2VLG1gpjR8XH+iBZPrJ5B4G
         0kAQk0QJDub+coDhippxfoteXh1rPZTD99R8NJ1RRLb5VJXg8Qb5UsoG14VnM2HIbows
         DwxFmphJS3V3Yq7LVZpMEbs9mHotV1aogqLMVLWOPXBUysXIBtXHXB55z2zeT905HASO
         O3IBa8Ln9X7hOuO5C/eDOQ+P9Zm//+80ukn0DYwvchdyK6MTcuOKGkqDu7ZkhS7Fpf28
         cKIw3/fya1yluJsIx9xNao2O1nuwxJDp+7bL/CjfXRh2V408UJuDr0+Z3+TMgUTwcmVE
         jKeg==
X-Forwarded-Encrypted: i=1; AJvYcCUKcmneeGVOsTu9svnSN/3KqHNmDaCcWuPT4Qp1nh/ztCnyO+WHqPm07Ptem4wFgcv8wRKdNLTBJVZLFJAXz5V3@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvkj/2etFhAS2j7EXI6XSc0/dLSQLaomjMsCx45Gb1hbnVw7jI
	mVZAvO/9TfYQYt0oIPmiGAj0lNFD6CZSR+yJ9ODALd4wnx9RJBBy
X-Gm-Gg: ASbGncvSBN5QE8Rb9qtX1ZjB0F6oTsRfSWSGYjq8mL3pI9ruytmNndgihGR6UadW106
	yrW0v4LOhrqpL+q1LuAWmp3d99xbPsGn1QSCGUigKlc+lKdFvA1HY6Yke3ammmhNi5HsQzslz9o
	pjsLb25uvfV/yiXvOhyafvbWbLA3X7oeBrZtnxTHusafdAqclyMZ/l9dfWHukw/atHPcbbrCJiK
	TWr1Ix8+dbHJ4E0SbJCglUOfDep/0IshDCwNoUwcpcoPzI8oeXLy9RvzzMrjxRJibn+Y5Gk24rs
	M9DjQM26oDxgC43fmnpkfX0yBOz51zZXKwodqupxzbniKPF3Jy9C
X-Google-Smtp-Source: AGHT+IHGw4uQbywJb5vE8Eiogx+8whJZ0txrLQuGF1Ig4JvfkEMUcOo9p/AQGsffVLl8DH3+8WKBng==
X-Received: by 2002:a05:6000:40cf:b0:391:1923:5a91 with SMTP id ffacd0b85a97d-39efbb1a366mr2018094f8f.55.1744984658009;
        Fri, 18 Apr 2025 06:57:38 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332b2sm2884691f8f.30.2025.04.18.06.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:57:37 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 18 Apr 2025 17:57:25 +0400
Subject: [PATCH v2] dt-bindings: interrupt-controller: via,vt8500-intc:
 Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-via_intc_binding-v2-1-b649ce737f71@gmail.com>
X-B4-Tracking: v=1; b=H4sIAERaAmgC/x3MSwqAMAxF0a1IxhY0+N+KSLEa9U2itCKCuHeLw
 zO496EgHhKoSx7yciFg1whOE5q2UVcxmKOJMy6zIm/MhdFCz8k66AxdTS2tc9xUXNQ5xezwsuD
 +l/3wvh8xRwrIYgAAAA==
X-Change-ID: 20250418-via_intc_binding-7e9bb2862471
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744984663; l=5333;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=ajVr3yuI4k7/Pim7AdIiw4kKFIHaClFo40nc4H6fqBk=;
 b=EnlSEOAw4wpYdueqn4gI8kfDgR4AfCA1yks+ccgbdmVGF1i1d2KcpNBD046D0P46Cs5p0BYZD
 5+Aej3TIm2jD1+sQhWVEjuDdTdZFMZz8pRr0G1GfSL9p4zXwpKzLtCM
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_065740_000403_F7AA6B73 
X-CRM114-Status: GOOD (  18.98  )
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

Rewrite the textual description for the VIA/WonderMedia interrupt
controller as YAML schema.

The original textual version did not contain information about the
usage of 'interrupts' to describe the connection of a chained
controller to its parent, add it here. A chained controller can
trigger up to 8 different interrupts (IRQ0~7) on its parent.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Split the series from v1 into separate bindings patches so as not to
spam all the subsystems with unrelated changes, per Rob's suggestion

Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-2-f9af689cdfc2@gmail.com/
---
 .../interrupt-controller/via,vt8500-intc.txt       | 16 -----
 .../interrupt-controller/via,vt8500-intc.yaml      | 76 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 77 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt
deleted file mode 100644
index 0a4ce1051b0252bbbdeef3288b90e9913d3f16f0..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-VIA/Wondermedia VT8500 Interrupt Controller
------------------------------------------------------
-
-Required properties:
-- compatible : "via,vt8500-intc"
-- reg : Should contain 1 register ranges(address and length)
-- #interrupt-cells : should be <1>
-
-Example:
-
-	intc: interrupt-controller@d8140000 {
-		compatible = "via,vt8500-intc";
-		interrupt-controller;
-		reg = <0xd8140000 0x10000>;
-		#interrupt-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bc14c74bf7d57d6da75135cbb4ae27ed59c6b9e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/via,vt8500-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA and WonderMedia SoCs Interrupt Controller
+
+description:
+  This is the interrupt controller used in single-core ARM SoCs made by
+  VIA and WonderMedia (up to and including WM8950). Each block handles
+  up to 64 interrupt sources (level or edge triggered) and can generate
+  up to 8 interrupts to its parent when used in a chained configuration.
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: via,vt8500-intc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description:
+          Interrupt number raised by the IRQ0 output of this controller
+          Only used if this controller is chained
+      - description:
+          Interrupt number raised by the IRQ1 output of this controller
+          Only used if this controller is chained
+      - description:
+          Interrupt number raised by the IRQ2 output of this controller
+          Only used if this controller is chained
+      - description:
+          Interrupt number raised by the IRQ3 output of this controller
+          Only used if this controller is chained
+      - description:
+          Interrupt number raised by the IRQ4 output of this controller
+          Only used if this controller is chained
+      - description:
+          Interrupt number raised by the IRQ5 output of this controller
+          Only used if this controller is chained
+      - description:
+          Interrupt number raised by the IRQ6 output of this controller
+          Only used if this controller is chained
+      - description:
+          Interrupt number raised by the IRQ7 output of this controller
+          Only used if this controller is chained
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@d8140000 {
+        compatible = "via,vt8500-intc";
+        interrupt-controller;
+        reg = <0xd8140000 0x10000>;
+        #interrupt-cells = <1>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b82704950184bd71623ff41fc4df31e4c7fe87..d3d8e31e547e8775272911df156d6574ae7acdac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3428,6 +3428,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250418-via_intc_binding-7e9bb2862471

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>



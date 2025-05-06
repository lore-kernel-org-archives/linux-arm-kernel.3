Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11813C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UXv90NJmJZRERtBytNCfPjU778hNLPiLy80HmbPYFyI=; b=iYgbsKoSusqXdrP+eNS9mKV0Z3
	1Y+I6VhTGQdkVs4UhMhg7PSICoVdH5lVhI+UkOCGSvXzOpWN/o1nVWiXgYuW/epILvp4vSs1xDP4y
	9rh/f6KTRVw1uTBYsIaLVSnykcNd9GC2xO3F8iRWDaP2gEPUK0um0dF7c2xN18j4MuNYNZKT9rtvA
	b7l8S+BrsayAB373GT4XonhmTqwkrDaIh779srXbsLQfGYM7e6bpt3iYVnXsrHdaXt/bx+nJhWHiT
	1RqtGOaL+i0gbK8XXYUKvxTYd8Nu8liRKVLrkvqyL8MzniFv+kjSWYBLZAuqtN682CwhkgkCDEUl3
	pgnhHAWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHq8-0000000BzHz-2QGP;
	Tue, 06 May 2025 12:56:04 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFh0-0000000Bavm-3E8J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:38:32 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22e09f57ed4so51176465ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 03:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746527910; x=1747132710; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UXv90NJmJZRERtBytNCfPjU778hNLPiLy80HmbPYFyI=;
        b=c8uRAw/QhA8GBz7MATbpN1jMl5MbJc3r6viejaBbtz+sEtvEy6qmy78vLiZFFd0XLc
         ymKmZtc8HfIOnk848P8oeVVfHix/LNw4hHepGdDX0NauL2Gp1DxA5xkdbcSAbX21MNgP
         SzyDTETDBburWt7EzAyLRRO3A+bBraWjZ3g8gOSsvaCDAWTc+36Op1HpSUy0RUCFk9ba
         eBPS2LlKtRHM9/rKFSPaYFakLBZP/f2/mnm5lVwcIPf7K8ppxKcsdVevGMm4mrqeQkvy
         apBuSWngbLwsum0xJ0vqeiftNR4DkX6AJ+FaXYNVlZw7TvxnpfVeSPetFkl4ayvQG90y
         X3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746527910; x=1747132710;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXv90NJmJZRERtBytNCfPjU778hNLPiLy80HmbPYFyI=;
        b=kb35sV+gooGBGwHAN+zDl/s2OCPxcXyg5t2LwbBmP3+50AeGVhHg2NJ44mMK3V2CIM
         28cm2Beb37V2OOr297+LhYQdJ44oi0/iVHper1lb49d6HUCWvBLpeU4MWnor6/RmpWMz
         9b56f0zLJXH+zzRc/187osjGl9xg55wdsmlydfeTkSVBWyhBrz20pLhzq+EaCzLO+AjR
         crlO7LYEAbgcOtWZO49D1RwOhx0P+cSTUCZwHHso+/wjIlqah6mQVDg3msf1rwvcbRhJ
         V/r5J9ahokB1+nsl1N/Y9gxj1iVZXVpDB87vyLR0DGKCSuwc7oRgyghK3r+rsvkZ3bPv
         SQLw==
X-Gm-Message-State: AOJu0YxUnZxDxBwhFGlIC8Ubh3EmyOorRyUD8RgJ6feIGwZ0cefjmT8+
	nZ1PkV+WtnqMX37bUWHOsLFBkUM9PNuuI6IaGsOnqX+7Wdb9uf99
X-Gm-Gg: ASbGnculWmCQXAPxyS6RXPzFgkP1XuHfaBEow3bO//ZywVu1DpSb6kplKhubSsF8v6o
	1az1U/sssC6AzjPisDIdlOA3rIqdedomvGoKBjHFQciIqkOjv2mzQe4vd9+uLsHHXS9uxVZY6zr
	d67XBk5TyLtDQBunFSXp7BUKdtTjQRF+M9qFR5TagJHSZnz5iAyyci6IaEJsDPkw9mImWYXqTDq
	DXzW0keoQp1f48l+2kE6K54aO05oNVfo7asD/10ogmIt8x9tP9gxDYfWK/RwoGazR+71ODAwrIl
	y+RUlnIvhngF6oenRR72ugGJlWuU9k56N5rhmPyA/svSwvT+f3hJ
X-Google-Smtp-Source: AGHT+IEQb8VRTFER+5/KPQ67cIaHptMVjdm37TypNQglY+WRH7pzbxrcVJBPZHwUMTsKykPATosOdg==
X-Received: by 2002:a17:902:f60d:b0:225:abd2:5e5a with SMTP id d9443c01a7336-22e32776c1fmr35820535ad.4.1746527909820;
        Tue, 06 May 2025 03:38:29 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15232797sm70470525ad.240.2025.05.06.03.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:38:29 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 06 May 2025 14:38:15 +0400
Subject: [PATCH v3] dt-bindings: i2c: i2c-wmt: Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-vt8500-i2c-binding-v3-1-401c3e090a88@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJbmGWgC/32NQQ6CMBBFr0Jm7ZhxSgO68h6GBbQFJpFiWtJoS
 O9u5QAu30v++ztEF8RFuFU7BJckyuoLqFMFZu795FBsYWBiTbUiTFuriVDY4CDeip9QD+raDLo
 h1TZQhq/gRnkf0UdXeJa4reFzfCT+2b+5xHhBMiOzJcO25vu09PI8m3WBLuf8BXYdvIm0AAAA
X-Change-ID: 20250430-vt8500-i2c-binding-5b397b570387
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746527901; l=4312;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=DsRp18KqLHynQ7ek2b6vxlNhlQdmZWpAkRJL4Ln5cTE=;
 b=xVr23GBL4GVFKc7GqRfXepQhft1RJL9XZ2qsOs5diF9sQjU19v77z45H5YgmdOSFGLwEjZ/vZ
 EHC0zP/wNwTC+PzpHvEaFTp+KlfApn+6fLvPlZthelotjuprMlVMzEY
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_033830_812641_2D5D5990 
X-CRM114-Status: GOOD (  17.91  )
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

Rewrite the textual description for the WonderMedia I2C controller
as YAML schema, and switch the filename to follow the compatible
string.

The controller only supports two bus speeds (100kHz and 400kHz)
so restrict clock-frequency values accordingly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v3:
- Re-added the part updating MAINTAINERS by Andi's request
- Link to v2: https://lore.kernel.org/r/20250430-vt8500-i2c-binding-v2-1-0cf22d0c2d42@gmail.com

Changes in v2:
- Added Krzysztof's review tag (thanks Krzysztof)
- Dropped the update to MAINTAINERS for now to reduce merge conflicts
  across different trees
- Split out the i2c binding separately from the big series affecting
  multiple subsystems unnecessarily (thanks Rob)
- Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-1-f9af689cdfc2@gmail.com/
---
 Documentation/devicetree/bindings/i2c/i2c-wmt.txt  | 24 -----------
 .../devicetree/bindings/i2c/wm,wm8505-i2c.yaml     | 47 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +-
 3 files changed, 48 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-wmt.txt b/Documentation/devicetree/bindings/i2c/i2c-wmt.txt
deleted file mode 100644
index 94a425eaa6c78bc9e3136ae7055b51635baf16ca..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-* Wondermedia I2C Controller
-
-Required properties :
-
- - compatible : should be "wm,wm8505-i2c"
- - reg : Offset and length of the register set for the device
- - interrupts : <IRQ> where IRQ is the interrupt number
- - clocks : phandle to the I2C clock source
-
-Optional properties :
-
- - clock-frequency : desired I2C bus clock frequency in Hz.
-	Valid values are 100000 and 400000.
-	Default to 100000 if not specified, or invalid value.
-
-Example :
-
-	i2c_0: i2c@d8280000 {
-		compatible = "wm,wm8505-i2c";
-		reg = <0xd8280000 0x1000>;
-		interrupts = <19>;
-		clocks = <&clki2c0>;
-		clock-frequency = <400000>;
-	};
diff --git a/Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml b/Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e498ce47b885203fcfe233b946f987abdac6784a
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/wm,wm8505-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C Controller on WonderMedia WM8505 and related SoCs
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: wm,wm8505-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    enum: [100000, 400000]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c_0: i2c@d8280000 {
+        compatible = "wm,wm8505-i2c";
+        reg = <0xd8280000 0x1000>;
+        interrupts = <19>;
+        clocks = <&clki2c0>;
+        clock-frequency = <400000>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 16037aaa770fc35efb45fc26555afaa5102e2640..4d18afdaf12bf6a5956793814f8db39b34074a12 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3464,7 +3464,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
-F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
 F:	arch/arm/boot/dts/vt8500/

---
base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
change-id: 20250430-vt8500-i2c-binding-5b397b570387

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>



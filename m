Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E022CD4846
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 03:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uLRtpcQHtK0F1OIYFcfZ8eOOu6S/PxCXSiUviagPQbc=; b=dq6fOqzOeCi3WwQEFN64LPueWN
	NPHGO2m2OeIVRiO+GSTjHyyHaESFBTgjVlafazaTb4hli0rVUw9j5q+4lAW4UJXJMGzMzixJ7F8GO
	t7JBvTpDVSy3egix6PDoZmiJ94euBJnaXGBaVebXQpOtt1/6vQdjTTzDBdkkPlNtK0yUBgskX3HnV
	ndjws2ZOIlWpDE+H9P9h9+VEVH90CoK02aTuB7WZI4EOQL4jCtne5Cg6OyPxk8869IbGH20gSk2kE
	pvsjBPIFflXm6DpnphfkDcp3mhgs1dm+XIMVnWAj3FZyPbCrjQIMY0M24yOdL6jwCMt+5y3rEN6sY
	obnayVPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdMc-0000000FK54-1xT9;
	Tue, 12 May 2026 03:00:54 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdMZ-0000000FK4Q-2Pvi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 03:00:53 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2baca4df358so30615155ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778554851; x=1779159651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uLRtpcQHtK0F1OIYFcfZ8eOOu6S/PxCXSiUviagPQbc=;
        b=ElOCxKmE6Hb8BrKLRO2ROJZImfWcZPRHUPDAqg3hjDASVm/Y+DIva4VyfagrGdk824
         xVW7VLQUqbTLIhqWUmn3SRZ+SrwfetgeFuWU3L6fOp5yBGEoAArjwzcQAyoaBJV6pT7Y
         7TwwUq+QOGaF0bxmTui+0udFJYJNhNbonuLJ/d2cPNKe7Ks6NNylgg4MuVvKxCBH/XEF
         RSymswcInE8qG6bKXMYzqNvHYSve1hKbcuMJOXMaZ8YPFbM8HhZaXJaEAOqjVhGlWyCN
         UAoP7Z9KirbQp0hi7/6aaZPs0PVvVnp6W7jz039eCh/lWWOAZxqabJ9PB0MpDeoVkZ2b
         Mrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778554851; x=1779159651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLRtpcQHtK0F1OIYFcfZ8eOOu6S/PxCXSiUviagPQbc=;
        b=kg74fzE1Qg53q/IaHGR7HKALkBd+RcDsEuRxN8oCoN39p3iymF0wfWKNoNUgWyWiO0
         8tX6rQVvEtZmB3DHBnEpCHH+JZw+5lH+e6WjLZMw8ZaScRvTBB/9IG9+8ytKOpxs0ND4
         jnXSY27o2UkhLxPxu9Qk3M9hwwpg47jFtJvv0PoU5oDBA9F/v1wuz3O/rzrgSqNUBA7m
         GQGZ+kw3WLA/mxP01qcQTV+ee5+NIStYSTghIOa1fIZ61WZA+mydAzI27fi8JGLZkUBg
         hRiRKVQ9Yknqe+b4FcgspP6X7FoMoT/NvF/mwqLkHfHmJUNxzSxcAGjpIyw2+QfkbX7y
         lUnA==
X-Forwarded-Encrypted: i=1; AFNElJ+Pm1clqEnnmyziERicrefvntBEZyrbTbg3GLfOEuaLh3YkAN53L+iu7odhO5FUW4asNfsmcBnkqR2Ajj45JUEq@lists.infradead.org
X-Gm-Message-State: AOJu0YyIOloJlCCWgAAsXGpPorOhUstJ/KC7r3rfDqSa9HRAizwrlQOS
	Ro2jtTnRMJJ7moZNTth5v+Sshxx+ZJoak6zJZkWSKEbjNbLZ1ZZFPmkc
X-Gm-Gg: Acq92OGnqEFA7djnj+dwFDtgNZ3DbIilRhxjnTbgjDyQbzAXbliH7+tOCDLd1Fp/rwo
	9U92Kdi0Y/Lr4qM9jxiG2Yfluaed9Jb1JGF7yr6ThP0OYU1QglVDOHPaq85o6R6YMUoWhR83rlU
	Rp18Dd/II3n6R+lKfZmb10P/z2zZnX7EBaKl1D1iN/vg9LTPP1NKAijhLmyddePKJDzISJreJfC
	b0r7RXoberwL0LGP+r+rcbX2ai9RxP4DhfM9wk5d2KzHVj3wuF34XAy3lJKVvaLK1anL8U5dh1L
	A77KyB2TxfWF8fr5Apv3HLUnGv57H+pXAD79Z9c9t/kq9ahBs0G1sM5OxDvpfgkqInsklTLUVrV
	KN670Ax7BbkK5zNsAlv/ivcECU4mnnBte0dNnSRRNeejR97zc97hZaYyHIAnRD+kDlCyRaiy66J
	9ik5lp7WPu6h3SuwUpHr7OL8WmG00Hf1RBFMXrg82yOOUBodsPW/PeKco8VONZf9lznqcu5yZW
X-Received: by 2002:a17:903:2ac5:b0:2b2:5597:bad4 with SMTP id d9443c01a7336-2bd012ad28dmr13565195ad.30.1778554850610;
        Mon, 11 May 2026 20:00:50 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35eb3sm119851355ad.41.2026.05.11.20.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 20:00:50 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	brgl@kernel.org
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3] dt-bindings: i2c: convert davinci i2c to dt-schema
Date: Tue, 12 May 2026 08:30:32 +0530
Message-ID: <20260512030032.5006-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_200051_624871_4D8EFE43 
X-CRM114-Status: GOOD (  22.32  )
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

Convert the Texas Instruments DaVinci and Keystone I2C controller
bindings from legacy text format to modern dt-schema (YAML).

During the conversion, the `interrupts` property was made required
to match the strict requirement in the driver probe function. The
custom `ti,has-pfunc` and `power-domains` properties were also
properly defined to match SoC-specific hardware features.

Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605120133.lQ1F3qlY-lkp@intel.com/
---
Changes in v3:
- Fixed a typo in the author's email address within the YAML maintainers block.

Changes in v2:
- Updated MAINTAINERS file to point to the new ti,davinci-i2c.yaml file instead of the deleted .txt file.

 .../devicetree/bindings/i2c/i2c-davinci.txt   | 43 -------------
 .../bindings/i2c/ti,davinci-i2c.yaml          | 62 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 63 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-davinci.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-davinci.txt b/Documentation/devicetree/bindings/i2c/i2c-davinci.txt
deleted file mode 100644
index 6590501c53d4..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-davinci.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-* Texas Instruments Davinci/Keystone I2C
-
-This file provides information, what the device node for the
-davinci/keystone i2c interface contains.
-
-Required properties:
-- compatible: "ti,davinci-i2c" or "ti,keystone-i2c";
-- reg : Offset and length of the register set for the device
-- clocks: I2C functional clock phandle.
-	  For 66AK2G this property should be set per binding,
-	  Documentation/devicetree/bindings/clock/ti,sci-clk.yaml
-
-SoC-specific Required Properties:
-
-The following are mandatory properties for Keystone 2 66AK2G SoCs only:
-
-- power-domains:	Should contain a phandle to a PM domain provider node
-			and an args specifier containing the I2C device id
-			value. This property is as per the binding,
-			Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml
-
-Recommended properties :
-- interrupts : standard interrupt property.
-- clock-frequency : desired I2C bus clock frequency in Hz.
-- ti,has-pfunc: boolean; if defined, it indicates that SoC supports PFUNC
-	registers. PFUNC registers allow to switch I2C pins to function as
-	GPIOs, so they can be toggled manually.
-
-Example (enbw_cmc board):
-	i2c@1c22000 {
-		compatible = "ti,davinci-i2c";
-		reg = <0x22000 0x1000>;
-		clock-frequency = <100000>;
-		interrupts = <15>;
-		interrupt-parent = <&intc>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		dtt@48 {
-			compatible = "national,lm75";
-			reg = <0x48>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml b/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml
new file mode 100644
index 000000000000..e8064bd1fcf7
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/ti,davinci-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DaVinci/Keystone I2C
+
+maintainers:
+  - Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,davinci-i2c
+      - ti,keystone-i2c
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
+  power-domains:
+    maxItems: 1
+
+  ti,has-pfunc:
+    description:
+      Indicates that the SoC supports PFUNC registers, allowing I2C pins 
+      to function as GPIOs for manual toggling.
+    type: boolean
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
+    i2c@1c22000 {
+        compatible = "ti,davinci-i2c";
+        reg = <0x01c22000 0x1000>;
+        clocks = <&i2c_clk>;
+        clock-frequency = <100000>;
+        interrupts = <15>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@48 {
+            compatible = "national,lm75";
+            reg = <0x48>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index bc3bcc641663..50a11a8d71a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26396,7 +26396,7 @@ M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
-F:	Documentation/devicetree/bindings/i2c/i2c-davinci.txt
+F:	Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml
 F:	arch/arm/boot/dts/ti/davinci/
 F:	arch/arm/mach-davinci/
 F:	drivers/i2c/busses/i2c-davinci.c
-- 
2.43.0



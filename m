Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03730C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 18:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scx0Qdehm+JoDmYbuGUcU99Hdy043v059tiOWEC5ibo=; b=y+Vf5tQOiFUuGYsHUKQiCRtK5T
	oeOF8zmOFBYeYgu1DJEBG3tnFwsQu5qHFuxnvHv6KZOejAKvltQEaYezxin+2oTg0h3phClohDPDe
	ly/BlYgdBi63ymBNZL9sKzv4yQN7dkVeCrurYCJdXyoJ2XmfmqkawEC2iO4/V+14hpcl3g0S5TOeN
	sb0KCP6qQqOkeFkH6vO6mWn22p9WKMTmv6tSWf+ZgIQJEPqLKbSQr+QTHd0SBl9Ggb/Marn8YPTi3
	mBK9E0B5v5OjLx0/kOX9GmTmICXYUcbwOkOqS+F9rO3JpooZpkVjCfx4ZM+LdZxBgM/+sLAhFLHxu
	7txa8UWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvJW0-00000004601-2PIL;
	Sat, 15 Aug 2026 18:53:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvJVx-000000045yr-3eRD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 18:53:55 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2d027b7c8easo4663415ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 11:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786820033; x=1787424833; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scx0Qdehm+JoDmYbuGUcU99Hdy043v059tiOWEC5ibo=;
        b=oy3dkFKrMvCpsRouelcGuG8Ov+p/UqmMMaFw4VX+NisZLuO5ZBD5QHgQVJRq0azVN4
         7B/ah8TE+Zd0gl89oWY5lqWFB8FY40kaSped0Z3ejxv+mSmKHQ05dQPho4zjIb/3IjIj
         ucgtXAlfRuqFqoAlX896bUgPf4ssixoiL/EImAksINXhJ4p7hFzyx2FWguR3S2FHvzSQ
         QQPXA7CnjA/GQGqDq6Wc6k9T6InPnBJJkhBMgGiYAKuOKC2ppNfqEna0CEzmgUY1AIwN
         H6ZwAV42GuVm/H7/UEg7qMBd6JvoVjXyyPcN1KuaamxtA5ObucZOYVWLl8sVOBukzYUz
         Su0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786820033; x=1787424833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scx0Qdehm+JoDmYbuGUcU99Hdy043v059tiOWEC5ibo=;
        b=KZ4bIuoUca3+iD+Dv3R3VOxX1u3nSMolevjiwNiu2awjzzBXmsDb2PX6ntnnarwmPq
         10gSTNKK5kPScNeqkncukSH2x8OnM14heIYHiYFWSAobuisx2Wm/U4vEsr/pSmwuICam
         NakRAWklxZDv4L9x0oYkJvIBbMloxCHJscbUiBSltnRwog5jgqZz1ehOp5HexBEnKDP8
         via+nEsTYRWylVTjyyinGFuIz+Foh4+WClq6TqIuHzViPLoRrerd+HbHuzBXSpls+AAq
         1j1ygUfCFB2cE2yuxZ/LJEzKB7Nk9FYmrf+JGU8YFSHA6kr4UtjxgIm1ytkeMVwwe7Tw
         UvXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3dO3usatZp7LXzPTaE8faXhQ+s3IE36VsrH5V2ft/QHFULH4EvaJ3iZjCUKk2xQQIGyAaMO4wTAN7PIFplZ0g@lists.infradead.org
X-Gm-Message-State: AOJu0YyLg2QPsCGTxGNiSnLnnoniWjEJ/9YMxBxztSeV8VHmhgl35ASl
	9fX+F3ELs08WbjUFYvhjKYqkBiyUCLjyHqSKbApV00UF4M7hMJON9P5O
X-Gm-Gg: AR+sD12mbFSteSDI6EaRSsS1VXPk/K+UFqROeBdNBLNwiaqz/FRjLxDzSW3Rpsx66Ec
	BpjVfa4JcGJb4tZs9wRQXbffMkQF+Fe9Q9fqDSkAoEjsf2wgaK9fP0/CLY6VbzRTyPsezdIz+wg
	cLpcEYds7Bw8paknp/1ZNAUV1vWDMKBSqD9Sqvi4x9ZhNjTjvfhDG3Ff/EkKnujdyfG68xt5J6E
	pM2RUqoYTaF14kydHvZoMSfWBTv5ddpDeqqaUfs6yCyk0Jk0P9nB9KGJS/CrEgvHGmUSLmLnIGg
	tXNJKzLN3AtyTCBQbAkL5U7UqrJgHDRD0GD3/uTM6h1mwQ6GplGwq3vYfamS/wcFrYVQbASGVGw
	0G4FqJSTt/8xDKNtkijOgkSmsEsBMZXOwggmLm+FbEeen4NtApPLIt9sd3QUGxWqC90RcWxlBO3
	awA0t7kgJKFHoVspUhJ0jNFr3z8OgZaTJCAUF5QFm7PtNGYR14V0hIvtB3OI58G3zMrI5J/A4T
X-Received: by 2002:a17:903:1b2b:b0:2ca:de3:15eb with SMTP id d9443c01a7336-2d3b0739429mr113633465ad.0.1786820033065;
        Sat, 15 Aug 2026 11:53:53 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:505d:7e1:7f19:edf4:38f3:dccf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e5cdfsm19289125eec.12.2026.08.15.11.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 11:53:52 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 16 Aug 2026 00:23:00 +0530
Subject: [PATCH v2 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-ti-keystone-devctrl-v2-2-5ab1e13c15c1@gmail.com>
References: <20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com>
In-Reply-To: <20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786819992; l=4318;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=TsN72N+hkJvAQl8CkzfNLqHYseFH06ElrzzP5rsMKyw=;
 b=uRDyzbTCz1K4RRIHatznqaz/5k5+xEFzai99gT93Mq+Cp0RJx/rmAguaVj44/UvC4HPJH6ZdE
 GazBrxm4IOmDlc1kGO5wAAksx7T9oivA7w+dnDpNtcpJ93ud+lzg5GJ
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_115354_094121_1840C4C0 
X-CRM114-Status: GOOD (  15.97  )
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

Convert the Texas Instruments Keystone Device State Control binding from
legacy text format to DT schema.

During the conversion, the following updates were made:
- Add "simple-mfd" to compatibles matching existing dts usage.
- Add required bus properties #address-cells, #size-cells, and ranges
  which were missing in text binding.
- Document child nodes gpio, interrupt-controller, and reset-controller.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Note: Running dt_binding_check on patch will yield a warning for
'ti,keystone-reset' in the example block. The YAML conversion patch for
that child node is already in progress here:
https://lore.kernel.org/linux-devicetree/20260813-ti-keystone-reset-v1-1-189389503324@gmail.com/
---
 .../bindings/mfd/ti,keystone-devctrl.yaml          | 84 ++++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
 2 files changed, 84 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
new file mode 100644
index 000000000000..dd73b62357ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,keystone-devctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments Keystone Device State Control
+
+maintainers:
+  - Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
+
+description:
+  The Keystone II devices have a set of registers that are used to control the
+  status of its peripherals. This node is intended to allow access to this
+  functionality.
+
+properties:
+  compatible:
+    items:
+      - const: ti,keystone-devctrl
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    type: object
+    description: Keystone DSP GPIO controller
+
+  "^interrupt-controller@[0-9a-f]+$":
+    type: object
+    description: Keystone DSP to ARM interrupt controller
+
+  "^reset-controller@[0-9a-f]+$":
+    type: object
+    description: Keystone reset controller
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    device-state-control@2620000 {
+        compatible = "ti,keystone-devctrl", "syscon", "simple-mfd";
+        reg = <0x02620000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x02620000 0x1000>;
+
+        interrupt-controller@2a0 {
+            compatible = "ti,keystone-irq";
+            reg = <0x2a0 0x4>;
+            interrupts = <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
+            interrupt-controller;
+            #interrupt-cells = <1>;
+            ti,syscon-dev = <&devctrl 0x2a0>;
+        };
+
+        reset-controller@328 {
+            compatible = "ti,keystone-reset";
+            reg = <0x328 0x10>;
+            ti,syscon-pll = <&pllctrl 0xe4>;
+            ti,syscon-dev = <&devctrl 0x328>;
+            ti,wdt-list = <0>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt b/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt
deleted file mode 100644
index 71a1f5963936..000000000000
--- a/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-* Device tree bindings for Texas Instruments keystone device state control
-
-The Keystone II devices have a set of registers that are used to control
-the status of its peripherals. This node is intended to allow access to
-this functionality.
-
-Required properties:
-
-- compatible:		"ti,keystone-devctrl", "syscon"
-
-- reg:			contains offset/length value for device state control
-			registers space.
-
-Example:
-
-devctrl: device-state-control@02620000 {
-	compatible = "ti,keystone-devctrl", "syscon";
-	reg = <0x02620000 0x1000>;
-};

-- 
2.55.0



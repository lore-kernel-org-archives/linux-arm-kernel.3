Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E160C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 23:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shThNVvHvcCvkYDrxu1ymT+FnDuu2k7qfXr77Zt+pxI=; b=pPoGkNikHDhOIayw9tBJV/ilBo
	BgEhIPYSzDnf1zrFLS1CLqtWk5NUpJBOQ8TJoMDltA1RfvOc9UOokeExNfTJKRPQe+uYczNdDVIN4
	5Ktqs4u00ij6Cp0Q8OJhCdUf06nNkbelJiu1hSQL5Je99ntWkSY5rEMg3Jw2LiK9MBOqClmr5tsVe
	3Pqr5al4VFHFoCntFLQNszW82ZKOs+HfOl21OS8voRnkUbF47mMbcsFOg0XarcUFzkTOctnOkMYYU
	2m8iYTk+x6hMaCZ7o+0dvtSd6MDlaT/cWFStk64CFnCH/ETI+9VYOVUeZz2ajX95u+J19XxlgzQoN
	zUKnmiJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BaW-0000000Ag7t-2HoF;
	Mon, 31 Aug 2026 23:38:52 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BaR-0000000Ag67-2ldy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 23:38:48 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c9d290216d0so645588a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 16:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219527; x=1788824327; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shThNVvHvcCvkYDrxu1ymT+FnDuu2k7qfXr77Zt+pxI=;
        b=GhnA7hI9hIQHG2iy3ltc4DR8gXbjPnIhRhhwFWg9WhLmhJs/IUWmFBjKW0ahfppUxQ
         q5+boKi9/rUqE/MCqNkIwTv2xpw6ayfgc1UyXo5l43W91vr/NRi02SS9oT/L9byjdmVL
         ZlNvTy9c1NB3/rhXrBumFWaSeNOR+Xw1zp2RDZByFqARusrnpqudRjcca5Q/zHZVp9q0
         LEFalj8JGv0RpqIl9Uy8GX/282UrYHvfiUz0HmuWdB4D74l8RU9cjIErRL+AVSepPQUb
         lD/vjlT0khH5aiuIvTfpdQjrs+tIs1daaW+gMi+Rob0l9zt73YxzU1m0p5blxorNvZtY
         wZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219527; x=1788824327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shThNVvHvcCvkYDrxu1ymT+FnDuu2k7qfXr77Zt+pxI=;
        b=CXEZgCfcWHANMpnSD1Sp226rNEbDVK5DsVKQX85Acv9iY85Lhprfu7M3k0ZS5FHMEJ
         1PpnnxH7qk7G0QeoSM0XQhSqmbqRaKIhGh1TQlMjsK8/e7Ypyh1J3461D6R4wTJCDvVO
         Ae75j4zDqSthMYsoz9QUD0y9rkX320VVZ7syT5J+9LikX19C30XhSRoeQU57SsIqKjBC
         YqwzMNjkUgqTE0Q8EuD37pdsxfbesmCqrgpQBYoZRlD0dJHrqq5T5xVUhP2UhXG/BHnb
         f1cy5nPWzKkLBjIFGSb/v1AD5s77bkSGskcBs88eBGuHH0N4zy3YjKddmdmlIf6/s+/Q
         EVpg==
X-Forwarded-Encrypted: i=1; AKwUvBwAosSHg6p4EJBfuZEADrUUb/VSpp3mbzS2mzLaLEcyFDawXlCmYHVQqnVsPpzcTSJpd6MePCcLbkeiE6c0vkdH@lists.infradead.org
X-Gm-Message-State: AFuF++lmgsGhqtCNSfwsf/T4t8JXG70kijIWM24xJqSfSMoEyxarQlqZ
	t1BhxVbM5jg+cVR8+R6vrgso7uEEhtt9RWJYRvIcUGPEihmAh+BPdtVF
X-Gm-Gg: AYBFou1Cu3VWwO1uOHUdkkexQpqVZRoW+aWVMQdNHwJyHJc2LaB4STiJ0pqvuXBHvQk
	r72znH4my3VY4F1n+pxvNhWagyHM22YF7HtR2NB6E2UaAicLDDQONefafCr+vTH7tPk3KSC1jY1
	07qE9eH1LDFdxYoKzjflkBQJClp2JmVF+JPj7Y0EuAEKqbik2qWf0bMpTlqAaTqU5IJ3sWaU0R4
	JgOZEHxFaNBU4JzYChPjR9/jkqeU3TNT36pr3G5F2YXFahSrRdXMS6iHIy24ihkpuy6eDucVF3X
	+kaO/LjbpSBjnDUU12obv5gntuHSuihFbPkb37E8z1YC0ZT8R9zMkDnQALYVu4njbxO+W5hZI4M
	4HSYMTzZzF9WSBZc2mt/F0/+6u2pPeci83BcMTQnwrm0VkpP/WqcUuHV5yrFNmZ9xCeAN8SWx9u
	1l7+MYJ/LvGvd7mzRo2m5Y2lgNP1fxxC7WB5bICrB1efpquZ0LziVXio4KCmIQHWdPrPG6M/AZ/
	4EC61K8sQ==
X-Received: by 2002:a17:90b:17cd:b0:390:af7c:fe5e with SMTP id 98e67ed59e1d1-398bab29b39mr14687470a91.2.1788219526679;
        Mon, 31 Aug 2026 16:38:46 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990c40d0c9sm2143682a91.7.2026.08.31.16.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:38:46 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 01 Sep 2026 05:08:13 +0530
Subject: [PATCH v4 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ti-keystone-devctrl-v4-2-2922f2a44792@gmail.com>
References: <20260901-ti-keystone-devctrl-v4-0-2922f2a44792@gmail.com>
In-Reply-To: <20260901-ti-keystone-devctrl-v4-0-2922f2a44792@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788219500; l=4141;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=8CDwIcw9Cwa7xa/xb0sjU9AEZPy8+v5Rr1k2WHBl6B8=;
 b=RtlS7lipVVDU7Yzpx9NBd0BOlUuy+8xcgvjciTvzjXfiuS1dupEJC1duo8n5rtoNPopwOZ/sS
 DgTXTYQZVE6Aj+gvomsw9VBPHnR99qUXpaDoybfoXdf845nyA0Maj+g
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_163847_716865_ED4F52B3 
X-CRM114-Status: GOOD (  15.53  )
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
 .../bindings/mfd/ti,keystone-devctrl.yaml          | 90 ++++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
 2 files changed, 90 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
new file mode 100644
index 000000000000..564dfc8a731f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
@@ -0,0 +1,90 @@
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
+    required:
+      - compatible
+
+  "^interrupt-controller@[0-9a-f]+$":
+    type: object
+    description: Keystone DSP to ARM interrupt controller
+    required:
+      - compatible
+
+  "^reset-controller@[0-9a-f]+$":
+    type: object
+    description: Keystone reset controller
+    required:
+      - compatible
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



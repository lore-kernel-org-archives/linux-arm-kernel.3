Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27773C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 14:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8fnpAA71PpA4geiQW/S84jidbVYovY7D0FubXhURV0=; b=HQyksXEL3KVQsrw8C2S6GYYSUP
	ESbsO+Jpe3J1S5hrQzD+qT8UudcsyjLJIqj0VS7TPUKveMwnLVlQejZZyDcvUTvtCLCDghTyh+zBz
	u7cdsk8yUrXK3C3YZMjWRPQ/DfkFmF4QXuEqeCGb2SDLStu+HwSkQTbq1XZNdu6eHNycCWzFLImb8
	oWc2u9TXMWRAhjdNr5uGabY8keDfJqXgfUKb5hmtG92C6iCf/VYbDnEO5TLBCA4HvHMVAUwi4EGyS
	Z0W8ZXj6d2yAnwuM+/f2EoFfmKLe5VBpwjCkHGQSvuyXWPlECSBPFYhAFirqlfsWzxO1dGJJrfEZJ
	4MD/gSMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13HR-00000009fop-2mzh;
	Mon, 31 Aug 2026 14:46:37 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13HI-00000009flT-33Im
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 14:46:30 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-398a29be161so388542a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 07:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788187588; x=1788792388; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8fnpAA71PpA4geiQW/S84jidbVYovY7D0FubXhURV0=;
        b=Pkm5iPE9Jf8Th7iujc58BXmX1W8nCW+lQlvGcWU0vRsDPGiW0SpoYbOTpCPT1QLse7
         8Oc6aqqUR34Yi6vUA2wFMNd4m0zu9pJOkNxkN1PIAws1BHNxW2yiDq6t2jRfH3B2xTVm
         ee2kplvk36IUGi7U5unp9GE+c6zkR+Uf6O3nmrqmebiV/ihNyyOhdV4gqfHSTA46L5nU
         RRz9QFpsTZk90BV2izw9K6GJJwWiBWIZ6w3OrbwxZ3dln9lzuIpZHCHCZstJz5dCT04Q
         6lg8jXH3hD6X99nT9v4rjVs7TyqtYd1zaxJI+rn72nrtvwwZtwSeC8EvYTuV+FyanPNe
         ci8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788187588; x=1788792388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8fnpAA71PpA4geiQW/S84jidbVYovY7D0FubXhURV0=;
        b=Hsdy5QtooW4igp1aQRLNUWaEd7nbsDVL3erCwQYU4XiM/7C4r+AEjBwh2lpUMX8Utf
         3nhryGTy2H4isVVyx+BJY8DVPj5G/Na9Dk40e/KvLFk6juiyChshhzXo1s043jc+8cE+
         +Yzn4qscAxwZUEd6U6I3cRUVXMy73/IqwzQ5gKq91sUL1qwtxsicC0qRHrgh2sEXGccd
         cQhFNDtoebsTkL1j8jhSClcIIouSRfEGl+vCcFJYICcnIoq8Z23GgL1EF0jmhJxojXKu
         LN4xKb8B7FmG6uzsm21Rn2mhIRchE+t4gTW+0Rw8YqfFWR9slrefAjE7d/AqYVJwnShc
         A7pg==
X-Forwarded-Encrypted: i=1; AKwUvBzdx6OHOmfY7hZZ0k637H5zol+jC/3Ts2UBwktuHgi6+UoUnklfu+WQKSrrm8Q45uzYcXBPW7E/ISWSYlUBh94I@lists.infradead.org
X-Gm-Message-State: AFuF++ltoQZXG1PNuTcmoT5hznU0xm3OXjHP3M2V2VdsvczUVNirgl/o
	DvtCj30jkgcdMIdAvH9RPocDlM6oEh+sHMo1IfXQs0N6Yu+NY1PqPP3O
X-Gm-Gg: AYBFou2TYlEiRBtHvcTLLtXYLqsBNi8n+lhGuIl6B/jMeeiV+hfGmo6F+Y2DVkgJyR5
	sgoZUxlMhAqcMVf23K6hFCayVThymiE/6slkL2Jryi6E6mctaCCtpbiMhn6chpSSnJa6OZlD85W
	3uk3V94WEWABzvv7qS82HSWRMnoyDeNcuFM46IOAQ2C5VkC19O2ZdiRr2Vq08KDnuxmgWqyD4P3
	MNbOJefFM8WqkMhk9Jz1CAOY0e2WSwLpb4Omaz6afQG16Ioyv707X15P7IDN/gY84jjqVel9Mjw
	iguguxvdhCNQFUgX9Azk38rrYkSLXEAvCi1wIo5C5m/KkgE+6ph/afHUkFPX/5q3zgA44LCHE3t
	pQlWNh6H1F9NBteAO9o7rF3YUBXr1LRyPrmS2BA0aHWUVVVmP4o/Wpqhjpiy1taacF/Jy4LDXvl
	Y9qDtbx4z6uNv1WL/8Eqr6I1bvOmToIXxdQ0S60yOumi8hPLO9HtKmUNWHpKo/Z0Vl0lvvWbo=
X-Received: by 2002:a17:90a:ec85:b0:398:bad2:c0f with SMTP id 98e67ed59e1d1-398bad20e7bmr12372505a91.5.1788187587501;
        Mon, 31 Aug 2026 07:46:27 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5009:b339:5edc:6eb2:1ff7:f053])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm43217279c88.0.2026.08.31.07.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:46:26 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 31 Aug 2026 20:15:35 +0530
Subject: [PATCH v3 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ti-keystone-devctrl-v3-2-0614fceba0f1@gmail.com>
References: <20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com>
In-Reply-To: <20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788187552; l=4030;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=3wtKqciQeOHcSakXZnMHLLISP+Cf8Obt+lYhptG6Gfw=;
 b=v4RdH5dbhuk9pP0rKYU9cicQ5Fllo/lac5Te5KW3tVVt/p0onHxeydqFkXSfhebx8aILFsc/Y
 ZB4HqXMtPa3AkHP7BDPKIX467EW/bn1Q+iBNPz1UA3+Sl7VtCWLo2+q
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_074628_783212_6D2465C5 
X-CRM114-Status: GOOD (  15.38  )
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A5ED4336A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 14:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F75piWahFu3xEvjEvyJygjFoe6Wvi89gUM0KanR4MpI=; b=1AX3vJEXy/W9KNWkGH5fWbpMCt
	Q8MA4DhS2nJ5IG6v8A9yV9N2eCSA3+nw202cLSV+IPlKOy4nAO8JYXjO/KPTuDHBK4ee1ocCtDmsx
	FTCPBSbM1tjAY3cjjemtVkkthwm9iklLPBB511XmPxOVMENU0qeBoTWfFkKGfsUddWvRI7of++ZrS
	fnwipVlykROTe8o6OfHqqwWuLzUkibZGyy8zGbUVuGjEnM6hxa/tD0z4ZGqJuzHrfwwOmKy5NOuo/
	zK/tmfynk8G780nPuMpR+1eSweQ2bBm+gVCCOm3l4hFiPIVMvf1VI1ynKDR2mOg53p0nunaVwaMjd
	mp4GSaow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t93eJ-00000007Ip0-10cL;
	Thu, 07 Nov 2024 14:38:15 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t93aq-00000007IDq-0LvL;
	Thu, 07 Nov 2024 14:34:41 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5cf04f75e1aso917804a12.1;
        Thu, 07 Nov 2024 06:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730990078; x=1731594878; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F75piWahFu3xEvjEvyJygjFoe6Wvi89gUM0KanR4MpI=;
        b=is3AdlldNsIOuBySgT0PhTP11ON5LF13hALkxAUimreD3JYrrdqPWxX7y5ty0PBnKz
         DHzBLA6NihGwoaj/b42VMBYiKfPeiMxxRyDXvdp/PJ3uzXbM4w6AJQqqhUe9qJUfX4MI
         0YQBgzQceq9vxczsskTVQgDyRremzhL2qJP+2DUQAMslYAvOkmlWETpfxtHd5yL59NJu
         nB33adwncdCuEqduSMjcGORdruJBEaGOxFUDhnFXWOpXt/i2ij5+xTGu2lBZai0xdQpp
         bfsxEGWmk7IvDfM2ODXU5BYozAVQt0IkgqVs6gsasIzM6X2hrh2x7sdgnwUhvX6Fcmgf
         tGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730990078; x=1731594878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F75piWahFu3xEvjEvyJygjFoe6Wvi89gUM0KanR4MpI=;
        b=FCcrV8BCQr6VZ9QKQVBx/GtDYa9okPfAftsUPbDZNMIwB+TKvvmZFkxy1/uQc2lg2F
         b7lzHTZUPg+3Ayp2BZ9H3g/AAbKY61InM3cTdMkqn6WGy4RZ7lE+0ElCxaZUGGWgh8U8
         OyvXlUyRw6e64t6lEcsfTI0WDmqSl+5pAXU4YV4cRyQHYtFZ+pqGC1utHvI0/9KkUU1S
         cXhUjsBt91mh8JM3tmwxIO9dEWQodSBRuk+0Qf4b1crEmuJa16rzMSziTkOe/HPLtSlM
         d8OakUy6Lz4a60VL6BAHiKkNh4PahJ68zY83LSgTJ1yZypD0Nip/CsJ9HPQvvHyBuc/q
         X6Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVlEI+Avari5o1gTCNHy92BmQUHba/PX0GXkwc14cIHIBATZsU+FGTCtsw7zZlOuaFT/mm776WZmXyfkU8N@lists.infradead.org, AJvYcCX0vWoCLZ7W9QAdG/SFtZMpkWFfejz2vCJJbpNxISiCst8MpVeHJh5d075YW1BGN9eNHyC+xtankjGMumoZgFnihA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCZSRSQ9fgOfHL5hjDL8fA/Nzh7KLoxyHSIN0pX0IVi3m3dXrO
	F4vXSCkhEvvHY9LfNXSjC9nC0KouM2tBipeeT9DwhJxxdpMBOMys
X-Google-Smtp-Source: AGHT+IGd4G0KS5uDfvxPoW9U4SNRhx7uhG/Wy5chDr4KEWTlLa8sOsBZ4tHb3V9I4IDAQQJgFfqRmg==
X-Received: by 2002:a05:6402:50cc:b0:5cb:7780:f1f6 with SMTP id 4fb4d7f45d1cf-5cbbf94ebeamr31344872a12.33.1730990077700;
        Thu, 07 Nov 2024 06:34:37 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03bb7fcasm880381a12.52.2024.11.07.06.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 06:34:37 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] dt-bindings: clock: actions,owl-cmu: convert to YAML
Date: Thu,  7 Nov 2024 16:34:31 +0200
Message-ID: <20241107143431.728669-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_063440_149846_A08604E5 
X-CRM114-Status: GOOD (  19.17  )
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

Convert the Actions Semi Owl CMU bindings to DT schema.

Changes during conversion:
 - Since all Actions Semi Owl SoCs utilize the internal low frequency
   oscillator as a parent for some clocks, require it.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
v3: list the headers in the description
v3: match properties: order with required:
v3: add clocks as a required property
v3: drop unused example node label
v3: use the preferred four-space indentation for dts example

v2: drop address and size cells from example
---
 .../bindings/clock/actions,owl-cmu.txt        | 52 ----------------
 .../bindings/clock/actions,owl-cmu.yaml       | 60 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 61 insertions(+), 53 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
 create mode 100644 Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml

diff --git a/Documentation/devicetree/bindings/clock/actions,owl-cmu.txt b/Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
deleted file mode 100644
index d19885b7c..000000000
--- a/Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-* Actions Semi Owl Clock Management Unit (CMU)
-
-The Actions Semi Owl Clock Management Unit generates and supplies clock
-to various controllers within the SoC. The clock binding described here is
-applicable to S900, S700 and S500 SoC's.
-
-Required Properties:
-
-- compatible: should be one of the following,
-	"actions,s900-cmu"
-	"actions,s700-cmu"
-	"actions,s500-cmu"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- clocks: Reference to the parent clocks ("hosc", "losc")
-- #clock-cells: should be 1.
-- #reset-cells: should be 1.
-
-Each clock is assigned an identifier, and client nodes can use this identifier
-to specify the clock which they consume.
-
-All available clocks are defined as preprocessor macros in corresponding
-dt-bindings/clock/actions,s900-cmu.h or actions,s700-cmu.h or
-actions,s500-cmu.h header and can be used in device tree sources.
-
-External clocks:
-
-The hosc clock used as input for the plls is generated outside the SoC. It is
-expected that it is defined using standard clock bindings as "hosc".
-
-Actions Semi S900 CMU also requires one more clock:
- - "losc" - internal low frequency oscillator
-
-Example: Clock Management Unit node:
-
-        cmu: clock-controller@e0160000 {
-                compatible = "actions,s900-cmu";
-                reg = <0x0 0xe0160000 0x0 0x1000>;
-                clocks = <&hosc>, <&losc>;
-                #clock-cells = <1>;
-                #reset-cells = <1>;
-        };
-
-Example: UART controller node that consumes clock generated by the clock
-management unit:
-
-        uart: serial@e012a000 {
-                compatible = "actions,s900-uart", "actions,owl-uart";
-                reg = <0x0 0xe012a000 0x0 0x2000>;
-                interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
-                clocks = <&cmu CLK_UART5>;
-        };
diff --git a/Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml b/Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml
new file mode 100644
index 000000000..1717099b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/actions,owl-cmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Actions Semi Owl Clock Management Unit (CMU)
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description: |
+  The Actions Semi Owl Clock Management Unit generates and supplies clock
+  to various controllers within the SoC.
+
+  See also::
+    include/dt-bindings/clock/actions,s500-cmu.h
+    include/dt-bindings/clock/actions,s700-cmu.h
+    include/dt-bindings/clock/actions,s900-cmu.h
+
+properties:
+  compatible:
+    enum:
+      - actions,s500-cmu
+      - actions,s700-cmu
+      - actions,s900-cmu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Host oscillator source
+      - description: Internal low frequency oscillator source
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@e0160000 {
+        compatible = "actions,s900-cmu";
+        reg = <0xe0160000 0x1000>;
+        clocks = <&hosc>, <&losc>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 420d06d37..652c9822a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2016,7 +2016,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-actions@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/actions.yaml
-F:	Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
+F:	Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml
 F:	Documentation/devicetree/bindings/dma/owl-dma.yaml
 F:	Documentation/devicetree/bindings/i2c/i2c-owl.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
-- 
2.43.0



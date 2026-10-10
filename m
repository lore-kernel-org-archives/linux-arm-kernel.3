Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975F5CA9EC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okZqjkUX6jwAmxhXromeBQSC/ImnHAAnu9CdaScVrV8=; b=qd3lwzAfz7eKI+DPjCOmBRiBiz
	VKiIVJG2YvFFBIcz+mb9dudMzb3+beAmxI6MgtfK/IABjYE72ykOGttfL8Y2P2762b1GgSq2nOblM
	TG8HkCfJfqIbGKAAG+xjVP6llU3rLi2tnkihfIoy4gcsI40UnL7ldAU0oFJv6ESj4uNvDCLBwlBsS
	3GshNuCrTjZJiUnss1qBoTqmLaphQTZGwZ1LmpMywiE5Xq/l0+M/KcwmMvU6xdAdxUP28usmgrBF7
	x4bhRmhcJLM8vwfL4hIGioXtexX+rlEjtqQieswn1IkhJwRbBUEERUbDvJjlQ4LytEQNjaLlV9SVa
	LK6VamkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWh1-000000083P5-346K;
	Sat, 10 Oct 2026 13:00:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgq-000000083G1-3ikx
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 10 Oct 2026 13:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=okZqjkUX6jwAmxhXromeBQSC/ImnHAAnu9CdaScVrV8=; b=UvwYvTl6065BySFGu4vvuzaWA9
	9Wf1xIhF7pgRak3JTk3fItCCEFA15bFW4iY8NcgI9lgpYrSLoBw42GQDyTywOBWXQX25xvA4TrOl+
	OQYNtA1bxGLVnWy9sL/TlyhLotJvIapxZ5+Hei5LyEgfJH9sIhS83pfPkkid4XC/6RCScqF+AbKZD
	s68/18tGHOWmy8gm5M1ijYH2v8F8Np3VLJmQT+oR2FkF+bQ4PW0+BOWbkvIdMW+M1G4Z/bAFFTKRl
	/g9OgxVP7e74nStmAl9iyJYBNYvUM9qBz7J7d103LNqco/THfWC1nj9kKGXWYxofIt9M/kBaaGdnk
	WiNsIhlA==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFWgn-0000000C6on-3qS4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so3562345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637235; x=1792242035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okZqjkUX6jwAmxhXromeBQSC/ImnHAAnu9CdaScVrV8=;
        b=F3CmHOOl+2EDHoFu5z4pmK5gCB96VhVVs4dQqjPo7z52Rzjl5WXjvY5Pnubu/7zpyz
         woGrKBDJhmgKr50EmyE7latVcGqeUg8xP0VKckobORlt9+wpGADUUv+dB1wAPP/Ji40Z
         tDIoSnqLJ3w1QMuHbVqtmTTiouhroBw1qvkVO7Vb8BVgzc9L+A+GX167S4a4ES4vz28K
         ACejvmA2/k96LZvXT0plDowmri5E+nn+bNCMhf6WPuABRPSsXASqc5WxO/HFhHcq1R2s
         7345pW2XTU/ZLJnGK7ip/hD+7Jp+75d91ttgVHUQYuBS839FsYLmIoyXXbxa+FFQi9jF
         rU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637235; x=1792242035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=okZqjkUX6jwAmxhXromeBQSC/ImnHAAnu9CdaScVrV8=;
        b=cEmNXov2+d7w3ya2GN6pp0NnL+iuG6rbLkXxGuZswo6qyN9SeUq/UWK6UaPXnd7uCg
         7niQqzi3rNFCS5cAvBUEaksjwiqA/wCHgk7Jns/13Rsm4A4zrp9uQFtrf0bzndObT5t8
         Rom5cBV25eipO1bR4qnj+rL2ra+/IYU2qDEr3/kN4/LWWGPggHJh6X2ym9oiTObJ1npD
         QrXTt4Z6+bQyE7yLaBzpIPaTWzALHSnM2nnMLR8+VbS7vgls4igwUY3kLxe7rEFWYBq3
         ZeJ0vATUxEcusLnoUKxpe/vNAYla8Iz7/pu8hu+8Pcjy94aXQp6YVKqcO7rjWHTZW14E
         TBsw==
X-Gm-Message-State: AFq9FYKX/8kdusra1F4LQqF1m+BpE8JMxMX2iQw5VHjqrA9ESMOZ9Jvs
	jTPfs47zLdM66xahNf3s5lgAuSmueKhjLxIdfIN5jZDNqvK2DPeZePBi0Pi2n/d/naNmtA==
X-Gm-Gg: AYBFou2oXtBXDOcwOMPkq33WyZCRWYiQ8eiVEZ81s81fasb7rrE0PdP00DG2VfNm3JM
	nx6JaKM2BwwmJAEfrb6b3lgWAbZMIB+IcsEARRizJQL2MYhZFIYsOFQUXnHU7UB1l53sjb4lvlS
	vrgzVcVzz8ittTZzznljfse5I6k9f+ceBDIqn1E7otwl3anrDzygOICmb944Xc5oOTJga82HPUA
	1BJM5tjTq0nXmVV7I3NNyZsLfhk4a56pf+QbslKEDdd7ei2r35MZcluEpGqz9KOeJeq9Is7+V9x
	P1zre1JU0okUEyBHeWhPjfji1z+72f3nGiUJ3kC30ZHLKHsv5qeg1vLFwNWA5ST0T6YRjU3i6yd
	L9MUwZ/MsbRAaf8FT0gHy944yaU2OuNyXezIdMs84caYEbbWU8By7wfWLekvLO1Opqi/Wkh+ylb
	t0M/Vmb/HvPGjUGwLGkBi3wr0Fca5JG8isM0QYbtQayh+Qyjx/Bymilv7nZmVaRF/z46u/j/zW+
	Iy1IgtZdG5Xb/8jtnEyCfpwF+kFiR7y6v4F4RMxofGLAb7pDtg3gOq0yRVoFoT8ZShjuBd3xIZ2
	ASJ7JDwZQM4OJ11cALlVE3pgyFUcPN/oq4z7Vm/EEafWBZc3Zccf4uW73rJfVA==
X-Received: by 2002:a05:600c:8b82:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a18e4b887amr89143345e9.27.1791637235528;
        Sat, 10 Oct 2026 06:00:35 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:34 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 06/24] dt-bindings: clock: Add ZTE ZX279128S CRM clocks and resets
Date: Sat, 10 Oct 2026 13:59:44 +0100
Message-ID: <20261010130024.177503-7-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_140037_999078_82F0B3E1 
X-CRM114-Status: GOOD (  17.50  )
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

Describe the top CRM and the two low-speed peripheral clock domains,
including the confirmed USB reset bits. Uncertain clock-source rates are
called out in the cover letter.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/clock/zte,zx279128s-crm.yaml     | 141 ++++++++++++++++++
 include/dt-bindings/clock/zte,zx279128s-crm.h |  55 +++++++
 2 files changed, 196 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx279128s-crm.yaml
 create mode 100644 include/dt-bindings/clock/zte,zx279128s-crm.h

diff --git a/Documentation/devicetree/bindings/clock/zte,zx279128s-crm.yaml b/Documentation/devicetree/bindings/clock/zte,zx279128s-crm.yaml
new file mode 100644
index 0000000000..2964c0fd6b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx279128s-crm.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx279128s-crm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s clock and reset modules
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description: |
+  The top clock and reset module (CRM) of the ZTE zx279128s holds the PLLs and
+  the clocks of the CPUs, the buses and the bus interfaces of the peripheral
+  groups. Each of the two groups of low speed peripherals (LSP) has a clock
+  and reset/power module (CRPM) of its own, fed by the top CRM.
+
+  The top CRM also holds reset bits of several peripherals; it is a reset
+  controller too.
+
+  The clock and reset indices are in
+  include/dt-bindings/clock/zte,zx279128s-crm.h.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: zte,zx279128s-topcrm
+          - const: syscon
+      - enum:
+          - zte,zx279128s-lsp0crpm
+          - zte,zx279128s-lsp1crpm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: zte,zx279128s-topcrm
+    then:
+      properties:
+        clocks:
+          items:
+            - description: 25 MHz crystal
+        clock-names:
+          items:
+            - const: osc
+      required:
+        - '#reset-cells'
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: zte,zx279128s-lsp0crpm
+    then:
+      properties:
+        '#reset-cells': false
+        clocks:
+          items:
+            - description: register (APB) clock of the group
+            - description: 25 MHz work clock
+            - description: 32.768 kHz work clock
+            - description: 100 MHz work clock
+        clock-names:
+          items:
+            - const: pclk
+            - const: wclk25m
+            - const: wclk32k
+            - const: wclk100m
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: zte,zx279128s-lsp1crpm
+    then:
+      properties:
+        '#reset-cells': false
+        clocks:
+          items:
+            - description: register (APB) clock of the group
+            - description: AXI clock of the group
+            - description: 25 MHz work clock
+            - description: 49.152 MHz work clock
+            - description: 100 MHz work clock
+        clock-names:
+          items:
+            - const: pclk
+            - const: aclk
+            - const: wclk25m
+            - const: wclk49m
+            - const: wclk100m
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+
+    topcrm: clock-controller@94000000 {
+        compatible = "zte,zx279128s-topcrm", "syscon";
+        reg = <0x94000000 0x1000>;
+        clocks = <&osc>;
+        clock-names = "osc";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+    clock-controller@94400000 {
+        compatible = "zte,zx279128s-lsp0crpm";
+        reg = <0x94400000 0x1000>;
+        clocks = <&topcrm ZX279128S_TOP_LSP0_PCLK>,
+                 <&topcrm ZX279128S_TOP_LSP0_25M>,
+                 <&topcrm ZX279128S_TOP_LSP0_32K>,
+                 <&topcrm ZX279128S_TOP_LSP0_100M>;
+        clock-names = "pclk", "wclk25m", "wclk32k", "wclk100m";
+        #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/zte,zx279128s-crm.h b/include/dt-bindings/clock/zte,zx279128s-crm.h
new file mode 100644
index 0000000000..41fb041c8e
--- /dev/null
+++ b/include/dt-bindings/clock/zte,zx279128s-crm.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ZTE_ZX279128S_CRM_H
+#define _DT_BINDINGS_CLOCK_ZTE_ZX279128S_CRM_H
+
+/* Top CRM */
+#define ZX279128S_TOP_PLL_A9		0
+#define ZX279128S_TOP_PLL_LSP		1
+#define ZX279128S_TOP_CPU		2
+#define ZX279128S_TOP_A9_PERIPH		3
+#define ZX279128S_TOP_MATRIX_ACLK	4
+#define ZX279128S_TOP_MATRIX_HCLK	5
+#define ZX279128S_TOP_MATRIX_PCLK	6
+#define ZX279128S_TOP_LSP0_PCLK		7
+#define ZX279128S_TOP_LSP0_25M		8
+#define ZX279128S_TOP_LSP0_32K		9
+#define ZX279128S_TOP_LSP0_100M		10
+#define ZX279128S_TOP_LSP1_PCLK		11
+#define ZX279128S_TOP_LSP1_ACLK		12
+#define ZX279128S_TOP_LSP1_25M		13
+#define ZX279128S_TOP_LSP1_49M		14
+#define ZX279128S_TOP_LSP1_100M		15
+#define ZX279128S_TOP_IRAM_ACLK		16
+#define ZX279128S_TOP_IROM_ACLK		17
+#define ZX279128S_TOP_SYS_CTRL_PCLK	18
+#define ZX279128S_TOP_USB_ACLK		19
+#define ZX279128S_TOP_USB_SUSPEND	20
+#define ZX279128S_TOP_USB_REF		21
+
+/*
+ * Top CRM resets: (register offset / 4) * 32 + bit. The USB 3.0 controller
+ * has four in register 0x4c; what each one resets isn't known.
+ */
+#define ZX279128S_TOP_RST_USB_B9	617
+#define ZX279128S_TOP_RST_USB_B10	618
+#define ZX279128S_TOP_RST_USB_B11	619
+#define ZX279128S_TOP_RST_USB_B14	622
+
+/* Low speed peripherals 0 */
+#define ZX279128S_LSP0_UART0_WCLK	0
+#define ZX279128S_LSP0_UART0_PCLK	1
+#define ZX279128S_LSP0_UART1_WCLK	2
+#define ZX279128S_LSP0_UART1_PCLK	3
+#define ZX279128S_LSP0_SPI_WCLK		4
+#define ZX279128S_LSP0_SPI_PCLK		5
+#define ZX279128S_LSP0_GPIO_PCLK	6
+
+/* Low speed peripherals 1 */
+#define ZX279128S_LSP1_MDIO_WCLK	0
+#define ZX279128S_LSP1_MDIO_PCLK	1
+
+#endif
-- 
2.55.0



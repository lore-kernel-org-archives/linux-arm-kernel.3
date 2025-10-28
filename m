Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE028CCF9F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbvGbVwl52TdB+OgPfgTRON2WTUF59VmQ2p/7Q6AAz8=; b=cxUikW7K+y9Ylj1QnWi3pHMHey
	wJPUvapEH3E3OXu8ZQd5GCuAs70TRP9y/pTKPvmzm6/Dos/7ZOc2ry934OYSS1H1+RT4mkiynt8tL
	FGJJ7X60oVeTG53wtabqEv3xPmakvLhVywupz0i8QTiz6mxRHyGniDapDnl01iPSJLc8mAQ6D8G+2
	8ISJS8mrW1feKH0ECk78IyO8wWv/T/TmtTOgvlQ1blMRyM9IR1D9btZN953UN9dmhz/UtBBWBqSp1
	BCSNrmz85+IXsfu968agil4sK96jog/QVxXpWJUH31AKJwMB+SB6HozHF7VYhM4EZ3K75LgUQVzVP
	otbUvE1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgNk-0000000Fg9I-0dyq;
	Tue, 28 Oct 2025 09:52:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgNY-0000000Ffzo-2bMH;
	Tue, 28 Oct 2025 09:52:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9817248BCC;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7131CC116B1;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761645155;
	bh=h7V3+pw89fOc1KwUoKduNUn4vFERB1dIg8cLMp0/MLA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YJy+McYXqYiclT463Y1om9YHJSw6R61QsjQmgdn2I/bz0okA3FaFccx2HsoMHsW9h
	 rmJ2Y9ml69m/La18OHUztSnkp5jITddCCkvoNji/qQPbkZ6j+TNHFiHeutPh+imMUt
	 wP22GR1lNAukwI8eoaflRF13O+F39jgYEGIk71E983w59n1VdJw+s7t2G1C9wOqWpw
	 /iMSoBZITb5shseLlmrsSL0Ga5Mg4ZkbNY3CKxY/66fwAcgtE6G5DQoqbqYmsT2CfS
	 ywSeVh+vDt9g06tLutdXgDj4KPZYpWJlJXSyVCC8t8p6hi+t9Ie3FId5vEGzx2G3jQ
	 JjMmnB2BMUVYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B00CCD1BF;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 28 Oct 2025 17:52:28 +0800
Subject: [PATCH v4 2/8] dt-bindings: clock: Add Amlogic A5 PLL clock
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-a5-clk-v4-2-e62ca0aae243@amlogic.com>
References: <20251028-a5-clk-v4-0-e62ca0aae243@amlogic.com>
In-Reply-To: <20251028-a5-clk-v4-0-e62ca0aae243@amlogic.com>
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761645153; l=3248;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=l0xvEX2cvQ+4zU5eZkaCNHE8ezIcqmOYLzKXuhlEW6M=;
 b=91zNtvK1BEUSWrPSu1SawezPdLv8vB+ZPLGQ5NrIcuYcbt2a6VgXjJPaRaYhaxvtqGUy2ZfTa
 gEj1NukbYzHD+y9Ju3ACwVo7YHqSxGRqv2SKXmyEwhGj/LqAMpK14hx
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_025237_937968_DC0659D8 
X-CRM114-Status: GOOD (  10.78  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add the PLL clock controller dt-bindings for the Amlogic A5 SoC
family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/clock/amlogic,a5-pll-clkc.yaml        | 63 ++++++++++++++++++++++
 include/dt-bindings/clock/amlogic,a5-pll-clkc.h    | 24 +++++++++
 2 files changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a5-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a5-pll-clkc.yaml
new file mode 100644
index 000000000000..d74570a90926
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,a5-pll-clkc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,a5-pll-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic A5 series PLL Clock Controller
+
+maintainers:
+  - Chuan Liu <chuan.liu@amlogic.com>
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+
+properties:
+  compatible:
+    const: amlogic,a5-pll-clkc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: input oscillator
+      - description: input fix pll dco
+      - description: input fix pll
+
+  clock-names:
+    items:
+      - const: xtal
+      - const: fix_dco
+      - const: fix
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/amlogic,a5-scmi-clkc.h>
+    apb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@8000 {
+            compatible = "amlogic,a5-pll-clkc";
+            reg = <0x0 0x8000 0x0 0x1a4>;
+            clocks = <&xtal>,
+                     <&scmi_clk CLKID_FIXED_PLL_DCO>,
+                     <&scmi_clk CLKID_FIXED_PLL>;
+            clock-names = "xtal",
+                          "fix_dco",
+                          "fix";
+            #clock-cells = <1>;
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,a5-pll-clkc.h b/include/dt-bindings/clock/amlogic,a5-pll-clkc.h
new file mode 100644
index 000000000000..a74c448a8d8a
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,a5-pll-clkc.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Chuan Liu <chuan.liu@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_A5_PLL_CLKC_H
+#define _DT_BINDINGS_CLOCK_AMLOGIC_A5_PLL_CLKC_H
+
+#define CLKID_MPLL_PREDIV			0
+#define CLKID_MPLL0_DIV				1
+#define CLKID_MPLL0				2
+#define CLKID_MPLL1_DIV				3
+#define CLKID_MPLL1				4
+#define CLKID_MPLL2_DIV				5
+#define CLKID_MPLL2				6
+#define CLKID_MPLL3_DIV				7
+#define CLKID_MPLL3				8
+#define CLKID_GP0_PLL_DCO			9
+#define CLKID_GP0_PLL				10
+#define CLKID_HIFI_PLL_DCO			11
+#define CLKID_HIFI_PLL				12
+
+#endif  /* _DT_BINDINGS_CLOCK_AMLOGIC_A5_PLL_CLKC_H */

-- 
2.42.0




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A669AC98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wH2Srjp6f0lUrhziOVxnEld1W9GBJurx25pR0jmeLW4=; b=gBeWbvyIfkAjTWc6VaOOFiK25l
	AFhcjgpY1KRZSRq9KtJ1al3cqoUArMOY6ncWTq8m43OPgmtpHs2YvjaTzfrOZmPacyL8/6J9v/gL5
	t7FLSDMfbgwpIAuCNhpS9D5PU6pI2NGQ2FSBihsQaZJpnPKwE/ShoV6IS5+t2DkTkKOT92ijIQMyj
	JHPaQUy/8WmnfZbLud/Wj7z+Z0bjyMFLQFSICuzYcV9JLaAsuFFUkVbMqDGQydU6w1nyOQAvZBDpT
	/507L9+fM4fBRxfMFRc8ijsA1PdcMMz8nkCxuTsiV6m22x+vo8b5kNZxDRqqdqWWD+BzLPtS7SA28
	rEM3R5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Riz-00000009C7S-1rXS;
	Wed, 23 Sep 2026 18:29:45 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ril-00000009C0D-3IDz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:29:33 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49d097b4939so6970855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188170; x=1790792970; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wH2Srjp6f0lUrhziOVxnEld1W9GBJurx25pR0jmeLW4=;
        b=mxbddYzuyyGjKjDzrfORpEyAB4Vm01qVl9azsacFnYz9b3PFMVPZ4AfU9ByQeL9l++
         0evRKxv3Ktp868vaq+78F0EDEBk+C2Vg6kqMcWtLgxwi+Ce/WIJbV8MYzVWvA7P4cNxT
         K7pCY+Tk665LdqS3iIJIvwUvku+Ay/UFZty7ehLrP0AshK8TNzogtKa3WveZmOprP3wR
         C+wQnyED/rjC3YL6a+lLNVTJuiYUNjTKzPuB+tvGr1ndR7cE9OTsFR5Khyx/wrkYkuh/
         41/tntQ8cFFulF4P2xZ4ilQE3SZasLZ6WQa0/qm4bIPfOheXNmYj7t5xL64z6UIsGrjs
         0xSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188170; x=1790792970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wH2Srjp6f0lUrhziOVxnEld1W9GBJurx25pR0jmeLW4=;
        b=GblSbOpzq7n0WthnN5WQGFslSkIBKGR+gKzoHxtlh5vJSQDIadlZ19NS6x0M6A0MZl
         +Wt00rvsMiuGPqBDMWTQsEPA/E3h6iEv9CdxDFXrE7PV/BM2SAR2mH/lHXS9hBb6RzK4
         99jdYYzHT0z1b51Ufsl6auYXPU5gD8b8xk0N2dsx2HXym1rtWzcCWw98Sn6ocFMMbnIc
         P+/O1bLzMzlFR5ziEjB2AJTjAqrR1g3KaxOrLqh8tOkAkPQDgJ5cr642GcnNb4qiN9w+
         tYWuAw0cY+Dyc/s9B1kzXWCvNeKWWGu6FhgGSUqmivSltCPCRgsIABSPTCm0r0bA93Oi
         lAEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwx5w7jvjXkw15hDU8Xr5F1QiKH3v0j4383rn7spRo6SRWdGD2RkyYXFexNRfc9lC93j3g6k/LJELaV9eHuekyX@lists.infradead.org
X-Gm-Message-State: AFuF++kcPg32rEpCAxJ0zYFFaCVJEfTz69er0ZYmh2GvtJk9xgzIuwbC
	cqqaGxHunWfAvT6JLHWas77AdC3X2QsP+UgeZxoqstbW/8u22cGQm25u
X-Gm-Gg: AYBFou1UWwS5bu9wVafYaLtczwFl8YXtQNqUZLuZawuUJqlYPSUQfGlRLTasjC6E+tE
	n4jSQ3NSHXBIr+7aq7Ff/ihHoEbBM2YU0QIg2Zzoy11dhpUvOgRoef5k/FsgAuKR1TQnInZQSIM
	ededpJdzfFp+DQTlz46GlHMyDXp36TMwcN6Itu7vUmmj+mNR1nCtcbQfGmUUVK9qKK4VzQB30RN
	HWZwSCtxf2qzf2WqKq09HoXbIM5gDSrQZZZsLg1PJYbaqHiSegsM9LS/ZyuxS+uGfhp4X9+OA4y
	fG2p+p2PXkPLKqDwCEXUkAAW5WEIO1R2JygDIOoqdH1P5ZFQRWTLA4l0DJcK6yRu/gYi1wkOd3B
	PV74jNRkWbvEkFD93BHF+ybzxjGF5o/wHQRWFVV//czbDHTmDYBBlza/tQ4PUFMCV+fQJk1dlNV
	EafUxIk+TzsVlKuBlHjp7LSF5hmslhmXAINv4Oo20589D9VNr05SDbvMSjdzW10gLmf9oiu2Zez
	ZFGj7t6S+AQ2Jg=
X-Received: by 2002:a05:600c:6986:b0:49c:fa21:e73c with SMTP id 5b1f17b1804b1-49fe66f147bmr977335e9.18.1790188170160;
        Wed, 23 Sep 2026 11:29:30 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd3d5csm4711835e9.14.2026.09.23.11.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:29:29 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 23 Sep 2026 21:28:49 +0300
Subject: [PATCH v12 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP clock
 and reset controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260923-zx29clk-v12-3-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
In-Reply-To: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8565;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=ZZeixT33K508YXS7awOOMQnGZZ8sVeeN1ZslFQ+5hXQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqtBpt3g/FTyHawhOwr1II9qnlMn7mmWrk96SNk
 EZ2bA2g+ViJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarQabRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLmPRAAjrdQfibg2736vBt7GzhvYZ/39YhoTlz
 fMPjhadLVsx2+c96wQ9hykMEoTrlNY9iofyLPfgT8uKpWMkOiYziEYU5huUIrhRDRQzHPTN6Ra7
 ZqDy+cutIilEdlQtx/pttQw+PRTINQwd+TwG+hDPz1P4ZNxxFZBqSVMUd+k4mTJGssvNaOizuU2
 IfE/Ogdq3h7i9JEBalaNlrOD8dyD2PGgws8MxaqkZa+WLqeYBmSSlKx4eIPe8B3nVrWeOSkrtGg
 1Z2SBgDa0sfQBPjt6rAJCFwl1EMY5IJL7dFC0vG1X6DtFZnYJycvA2A5auCTgMGvW6Yf/wyu7BS
 h9yqJ2Jo4CnOD43THLe2plCj9J6qQHlGK+JwuvqHNMX1iJ5PUMYucuev6FOej0FX4BYMUK6zYXv
 vFQegVqOLrbGrV0TjNvTUmS0WViLjRjbEPIpgqAwNCbmg7uX1fziiUJ5vxqYwt6W6RMiRAcPgZd
 LDSRnDQZ9dW39JWtwut+cjWhut8q0mz/aZx7FuCluvw3EHCIZUJABbU6KXAlntYT/qZWj+Wi3Hg
 vAbusgX1xYyZ1VuflFDL6dyLRAdaJ8RuSG8sJV7qPMJfArO7Gzshp1z8kA5XZ0UGyMhzoIE0icu
 iFKRrRKqn+HaFUb9LpyPt1CAQQYgQADxgyHrHUvAYJZz4Tg/u7Zo=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_112932_626431_6B8BBFB8 
X-CRM114-Status: GOOD (  18.96  )
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

The clock controller of the zx297520v3 Low Speed Peripherals is
relatively clean. One register per device with gates, muxes and resets
and for some devices a divider. There are even bits in the matrix
controller to control propagation of clock lines down to LSP.

The clocks are sorted by register address and I am convinced that the
device list is complete. There are, however, a few more registers that
are likely extra dividers for TDM and I2S devices.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Patch changelog:

v11, v12: unchanged

v10:
Fix order of clock-cells and reset-cells in the example to satisfy
dt-check-style --strict.

v8:

*) Start clock indices at 0
*) A minor grammar fix in the second paragraph of the binding prose

v5:
Rename from lspclk to lspcrm
Remove matrixcrm from example

v4: Order properties compatible->reg->clocks->clock->names->#cells
---
 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      | 101 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  37 ++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |  19 ++++
 4 files changed, 158 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
new file mode 100644
index 000000000000..b0a176ffda12
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-lspcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC LSP clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  This clock and reset controller controls low speed peripherals on the board.
+  This is a relatively isolated subsystem containing UART, I2C, I2S and SPI
+  devices. The controller is responsible for bringing the devices out of reset
+  and enabling their clocks as needed.
+
+  The controller receives its clock signals from the matrix controller, and
+  these signals need to be declared as clock inputs.
+
+  All available clocks are defined as preprocessor macros in the
+  "include/dt-bindings/clock/zte,zx297520v3-clk.h" header. Resets are defined in
+  the "include/dt-bindings/reset/zte,zx297520v3-reset.h" header.
+
+properties:
+  compatible:
+    const: zte,zx297520v3-lspcrm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main PLL divided by 5 output from matrixcrm (124.8 MHz)
+      - description: Main PLL divided by 4 output from matrixcrm (156 MHz)
+      - description: Main PLL divided by 6 output from matrixcrm (104 MHz)
+      - description: Main PLL divided by 8 output from matrixcrm (78 MHz)
+      - description: Main PLL divided by 12 output from matrixcrm (52 MHz)
+      - description: Main oscillator output from matrixcrm (26 MHz)
+      - description: Timer oscillator output from matrixcrm (32 kHz)
+      - description: LSP pclk output from matrixcrm (26 MHz)
+      - description: TDM wclk mux output from matrixcrm
+      - description: DPLL divided by 4 output from matrixcrm (122.88 MHz)
+
+  clock-names:
+    items:
+      - const: mpll-d5
+      - const: mpll-d4
+      - const: mpll-d6
+      - const: mpll-d8
+      - const: mpll-d12
+      - const: osc26m
+      - const: osc32k
+      - const: pclk
+      - const: tdm-wclk
+      - const: dpll-d4
+
+  resets:
+    maxItems: 1
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
+  - clock-names
+  - resets
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
+
+    clock-controller@1400000 {
+        compatible = "zte,zx297520v3-lspcrm";
+        reg = <0x01400000 0x100>;
+        #clock-cells = <1>;
+        clocks = <&matrixcrm ZX297520V3_LSP_MPLL_D5_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D4_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D6_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D8_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D12_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_OSC26M_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_OSC32K_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_PCLK>,
+                 <&matrixcrm ZX297520V3_LSP_TDM_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_DPLL_D4_WCLK>;
+        clock-names = "mpll-d5", "mpll-d4", "mpll-d6", "mpll-d8", "mpll-d12",
+                      "osc26m", "osc32k", "pclk", "tdm-wclk", "dpll-d4";
+        #reset-cells = <1>;
+        resets = <&matrixcrm ZX297520V3_LSP_RESET>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5f367b5126c2..06dbf9305518 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3922,6 +3922,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index d98bc38635b0..a63283d5df5c 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -114,4 +114,41 @@
 #define ZX297520V3_LTE_MODEM_WCLK		42
 #define ZX297520V3_LTE_MODEM_PCLK		43
 
+#define ZX297520V3_TIMER_L1_WCLK		0
+#define ZX297520V3_TIMER_L1_PCLK		1
+#define ZX297520V3_WDT_L2_WCLK			2
+#define ZX297520V3_WDT_L2_PCLK			3
+#define ZX297520V3_WDT_L3_WCLK			4
+#define ZX297520V3_WDT_L3_PCLK			5
+#define ZX297520V3_PWM_WCLK			6
+#define ZX297520V3_PWM_PCLK			7
+#define ZX297520V3_I2S0_WCLK			8
+#define ZX297520V3_I2S0_PCLK			9
+#define ZX297520V3_I2S1_WCLK			10
+#define ZX297520V3_I2S1_PCLK			11
+#define ZX297520V3_QSPI_WCLK			12
+#define ZX297520V3_QSPI_PCLK			13
+#define ZX297520V3_UART1_WCLK			14
+#define ZX297520V3_UART1_PCLK			15
+#define ZX297520V3_I2C1_WCLK			16
+#define ZX297520V3_I2C1_PCLK			17
+#define ZX297520V3_SPI0_WCLK			18
+#define ZX297520V3_SPI0_PCLK			19
+#define ZX297520V3_TIMER_LB_WCLK		20
+#define ZX297520V3_TIMER_LB_PCLK		21
+#define ZX297520V3_TIMER_LC_WCLK		22
+#define ZX297520V3_TIMER_LC_PCLK		23
+#define ZX297520V3_UART2_WCLK			24
+#define ZX297520V3_UART2_PCLK			25
+#define ZX297520V3_WDT_LE_WCLK			26
+#define ZX297520V3_WDT_LE_PCLK			27
+#define ZX297520V3_TIMER_LF_WCLK		28
+#define ZX297520V3_TIMER_LF_PCLK		29
+#define ZX297520V3_SPI1_WCLK			30
+#define ZX297520V3_SPI1_PCLK			31
+#define ZX297520V3_TIMER_L11_WCLK		32
+#define ZX297520V3_TIMER_L11_PCLK		33
+#define ZX297520V3_TDM_WCLK			34
+#define ZX297520V3_TDM_PCLK			35
+
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
index 54e5b24f859a..b21d5901a7b9 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -40,4 +40,23 @@
 #define ZX297520V3_VOU_RESET			10
 #define ZX297520V3_LSP_RESET			11
 
+#define ZX297520V3_TIMER_L1_RESET		0
+#define ZX297520V3_WDT_L2_RESET			1
+#define ZX297520V3_WDT_L3_RESET			2
+#define ZX297520V3_PWM_RESET			3
+#define ZX297520V3_I2S0_RESET			4
+#define ZX297520V3_I2S1_RESET			5
+#define ZX297520V3_QSPI_RESET			6
+#define ZX297520V3_UART1_RESET			7
+#define ZX297520V3_I2C1_RESET			8
+#define ZX297520V3_SPI0_RESET			9
+#define ZX297520V3_TIMER_LB_RESET		10
+#define ZX297520V3_TIMER_LC_RESET		11
+#define ZX297520V3_UART2_RESET			12
+#define ZX297520V3_WDT_LE_RESET			13
+#define ZX297520V3_TIMER_LF_RESET		14
+#define ZX297520V3_SPI1_RESET			15
+#define ZX297520V3_TIMER_L11_RESET		16
+#define ZX297520V3_TDM_RESET			17
+
 #endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.55.0



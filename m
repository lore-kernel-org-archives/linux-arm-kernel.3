Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70756C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 20:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wH2Srjp6f0lUrhziOVxnEld1W9GBJurx25pR0jmeLW4=; b=1PrMtpNfk2Oh5waG2Y3md5lD2G
	WiRmFFIRQrlXavvdLu80qBW4eaaB42UCWXSBrZVxQSN9fsqGy7i8TSN7l06wEdcd20F17e/zwuQNZ
	9SU06CdWi4SOYSDsv/abCiSHPOL7WJswi5m09fCT+Fev7m30142QdDul9NrqmMN2b/ON5M3sf/sEn
	vYg/o4P30UzzEzsuDcn0VFZjYb89MiO9JE3/IGT/mvPLA7v9epk1KtlvMp/dVULeHJFcVCJ6Oc16d
	3+lbLB1/m9iCdlsTGz3+uhCj2MQ/1/J1l8qzLnrD3Z6IpspOiuyDBXM9JImbg+2VyyWF2+8vhtEh9
	7y3hcxBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAvGE-0000000GnQD-3PE4;
	Sun, 27 Sep 2026 20:14:10 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAvGA-0000000GnNt-2ejO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 20:14:08 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4887f690df6so1586901f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 13:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540045; x=1791144845; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wH2Srjp6f0lUrhziOVxnEld1W9GBJurx25pR0jmeLW4=;
        b=L3ktzPyXvDp4dVj8uQ3D2kQ75DiAyy5okflsULohE7YCuIF/m37K1Bye6SEWWDeQM4
         hEoQSOyLivueMW/QApXG6eP5bCCok6OdBUh8bn7LUiOEz/kgE1JGBhChBb7EQsrPnXnP
         RPW08eaG9gjOK1oZvab/lwaYZwU1c1m2S2ePKaCuo8duEIfba/Xe30jHvfg+iOyPCOfd
         jWwYYsQ0TfI0aaqQWPvb5TBnCRdsSU2samv56plwbXYQRGPBX9b4JPy/hBZ5Dnc3EgxM
         9RDChimfBkArB05vJ5WuDbItRY8tY5orXqJqVedqRnVADtdknbxyAPCq8yuuqpba/yTx
         oVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540045; x=1791144845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wH2Srjp6f0lUrhziOVxnEld1W9GBJurx25pR0jmeLW4=;
        b=VA1mIu+utDm9aXLUphpI57R3Rowm6kM2nyrOVvyax7/clMv7CtgVWINlYpeJ4e/mDc
         T9dvqyVBWEeAYdIZPcDAgpT2ei0voeCPkr5JO3I0M3tNZS3+HUy/dsW91QK6Opr4NxNe
         7czBeFeioS8BeIRcqxd788t+6NqTXTrauE5k/cQu9dtCRJhNzfPRy87Um6XmSWfmf7wt
         mde64grMs13VxXHK0zzjy6hBJU3iV4ApY8iJE8+CA7dkxxquVBRt+KpjT2RoyotU2Nwq
         TbK2s2Devwc3qecD0GZxxcQiqfOiTo+G6EX4e7fZGffXgYFBrtN0htpELEBfP2RhONlM
         RRGw==
X-Forwarded-Encrypted: i=1; AKwUvBzp2TwIczt+GZEScFeO66uiPkAQkDTYJD2Mfmu/ZEvW4o789hVu93DcsV+0x6P4M9Bl3iF2NvQS2ODVL0x1kA3L@lists.infradead.org
X-Gm-Message-State: AFq9FYLOwt1qBGwpwq0UUlJMxKrpbk7LcsZegiQ72psyOBAk8f6Vv6nM
	zCv2UZ7bIVkBPZsYcmErWO15+qmZa8m2nP+pKYOab6SJTdjgA6EJZYMs
X-Gm-Gg: AYBFou2oPSZN2aTmtZ9B2ekE7SsVJpN3bVI1q6RBfXG9EwWZ71o8KdrCKT9jhCf5fYq
	NiZJ4Y925pbYwxq8ARFqgnsI93aqgLliCstwskHRhORd0bLGwNaLu/IFpRlyKEd7+GofUt9ilGC
	SvaoMWlTNlNhquR+F5wFiuJ+CPj+/1rYaOOs/WpoWAaX8MprZff/O0UNp+C+h6SkWpHWTOGevqJ
	uMhnodUWyKYiIfw8p/EdlXnHQnVUL43FUcvxfhdWm+fTI9wu9HfNvS/pYo3wl+JUO23f/G4BMfz
	q8mZQ7FnaG0TbtOCex80s+QPs0q3lGfFIMFgVbMAaeMHWQx7hUTeaK9RbO0dc90jEYJkHnXWAV2
	rGMj/o1zotqi4GU+Yn11JmPEpEAurV+jygjGY6X6PYyJSLWAbnVvFMJFxg+ub5Zlyoj7EzT2LIY
	iBzgkqXy3cv8YKbLElXrSxdVEWLCYAZ51rBaNCfLbPIHwg+EdMpnTjnwn3Sv5dlYrf1aR2Au5ap
	Y2wvy4z
X-Received: by 2002:a5d:5f85:0:b0:488:7fc7:dffc with SMTP id ffacd0b85a97d-4887fc7e08cmr15202866f8f.37.1790540044710;
        Sun, 27 Sep 2026 13:14:04 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.96.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm21781514f8f.13.2026.09.27.13.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:14:04 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 27 Sep 2026 23:13:31 +0300
Subject: [PATCH v13 03/13] dt-bindings: clk: zte: Add zx297520v3 LSP clock
 and reset controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260927-zx29clk-v13-3-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
In-Reply-To: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
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
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBquXj0K8mUgU2bzwvm2T/RYD5FiNOdgNSnkX6RY
 zLZRgeCl/SJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarl49BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLrfBAAhSWuZVPlcLvMFtuK41yduFLCRQtYszS
 KqbLZfyWXdxDVUeVO+bnrlH1VHW7DXu/paWi8sIaidLr5nWxLlV4THXq+G+/XGN5/XVh/JBg/FK
 J59KVfzWOLPGDoGdNeChYiGxuuCQ/1ZQ6UlGCS/TDoImrWuhE6qUckydKCxp5/M8ibZhRUtr9im
 EmQIGiYXuayKSQAelLIhVKNcdDxYujKYJFBX7TilwSYBqpgu7dBbuhi0G7Fp4o/y3WZTL3MNTyY
 GnIrOj861fvz+cdUX7YYbsSKVpTul+gW2Y77iY4RliUWbLdfQsFhzSNeVrvLjPkaM8XSFZ1gw3P
 TaPw3DD7q7jq5YNqY2IRIWmmLUjvIT8phHEBJOkIKxXvtWiP0NqRRGsnGyciTD6AeITtSgNUgJ2
 MhgheMK4SGZdA02k62xWyA44McS4M8sjWdZlvObWz9Qswdn2Q/n3EIzJYUkb6bd2nUmBxJOproj
 4RgZ2gpIJwi5tG/tTn9yNQ9+6wa53eRqDpQ+ogU47Odl0wuA+i88w2q2Wb82wf9xvrOS4cRZT0s
 70olM5cbOwix8t2X18uW9hpU+Eu72QH+0BDKE3EqpxWq3uttO6kR6R4oid1kT+HGWM0no5YQXJ5
 3nOcNTQ+gLYPy9f5R8EnK28+VtRzQXIt1RKeiTYSgMhi4YkLOveg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_131406_728925_7C8FAB37 
X-CRM114-Status: GOOD (  18.93  )
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



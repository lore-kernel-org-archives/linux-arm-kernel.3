Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158F9C98311
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKSldiQEBlwJnvqQz2vVn70jFvR3OoUtgQ0Un18+RCA=; b=pV0yIwBd0EMuQQ1c6pJNIS9RsA
	/rlmwyqO5foZ0iDWwwAcD4hIjEXoPhiBXftUK2ayU6seeXtK4CTLw+jrqiK7FCadvDBpuHWgCtKJj
	lBD1qA+LYEi8cbvzdOiZmf5zlVsDflFJMIkg6i0w0Ef1SEz5XMXLY4ZWRx8cRx7fgZQXa3+MHrXah
	zmU3HiaH3VwU5S+10U977m9L5p5a+befM6JWpVTReAnCf5PUwNS4T7gp5S05NepaWATqsEt5o6GHz
	W/SgdLfRTIGOyJ27Nxb0OHtLdP5u0JnzLc+K9Crz/MRWsP/mlrV/rnFMGMCcscVVDCyiYzjGSyA+Y
	fPsviaRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rii-00000009ByP-1BV3;
	Wed, 23 Sep 2026 18:29:28 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rif-00000009Bwf-0fL2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:29:26 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ccff31419so10723475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188163; x=1790792963; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKSldiQEBlwJnvqQz2vVn70jFvR3OoUtgQ0Un18+RCA=;
        b=ev3S1+ZAAwqwJ52of+WKB4JZVpSiwcz/cjoVKpExx7iqO9bWbB9g/gTggDmhCKsE9r
         n9faioWBzNoW6xQLwCImiezCscE2q8p6+AwKFPKJE8qI9w3xnJqBj0b0XjBQh1DUqH3A
         Ap2W7r0ZDP+YARHjSxIHrDhIMEDvEvQ3261RhzwUH1XBov22v9F0nhGcDe9WsMXtyHLN
         voQRQFSt3+dxtHL9LHKtDRlj190tzAdGplpePAJfNoiipT2yNxgox4ssg3HOLt6fyAP+
         /Wi9y23OHbFI1nWRMGKl6idgZOQO+SxCGJCRwTUniTGHT7KUk6ZniuD0V86VkT7eqHDV
         y7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188163; x=1790792963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKSldiQEBlwJnvqQz2vVn70jFvR3OoUtgQ0Un18+RCA=;
        b=bbbnAImBQ34z7FIK79zRIXnDH2jsYXRbVdnNOsSnmW6o4OiZNkr+joPHgiCb9sdc4J
         V3Y9CQnNR0a3uWanU2TRrUAgaqR8WFXQidwNDiLblB5hmhRzG65Rqt4MaOIKNeHv7bhY
         x49uDEUwO7kT0VvCTlCsD4HsAu2308HdDwK+r8PZ6aEH/Ox3whmYUBYXzGmGHFP1RGxO
         3urG7fjSQjE+ma0Z7KSYoZXFBCMVK5KjnKJfx5oWT6Pe16HzEjACF9C2GBJEyXJMhPPp
         hwS8Bdy0KtnMROsvbw5kXvVPwNE9yYJJzpVBYN++v7QIvCvxxgNt/b/PLOMSdOFcxoxm
         d7/g==
X-Forwarded-Encrypted: i=1; AKwUvBzdhwFMFWwp8nynpKyrjF1MaCKE+dECqNsfrT9WdIfTY/NAg/fumWBgd8qTARu+OUfcHpYaSttgHhZOC1F9bD/3@lists.infradead.org
X-Gm-Message-State: AFuF++ltOPggcM86vWX4tGDv8Nnnxvi8mBmX5m0cv94+q2NzuxVIlg8i
	4tZtYA4T0N8Pb1tQJ1h0k7UhNGBwTlP5DFG0Tw0GA/d8qmLK+R+4zfGp
X-Gm-Gg: AYBFou2iOURviAMB0rY9nnVyEZnaoMmHjx96wufn3YLldFyz31Ru7Fjmq9iOC3BTcls
	X9bMk7+cp6xbLEoYnqSysEK1bl6p6HV5cT6ABd1L5JwfGJ2MV59z+yeDFzD1jfQqEV3l8dY4zsR
	eTYihrZ7T1MK8qTQ8xE08jcX0UbxZYxqTsIKii3uysQDjthSwv3p6bix1X6M+KqQ0YTKdVJXBdP
	LRkmKpHA5fSets5FVjeHNh1b8myG/5QLF47hBalmVs9ANkt1zOZoL8T5Q8T8V1GVlOaZtxh/xxu
	SPc7eChlA5uiFCgcr+bX3QrBASk8BdYofCN1vHXtEWCtcc9GTb38u1d6cZqyaEiZB/nPGXFWFJq
	FauP7QOzkCj39Bt22LoQG/KAh2YoD/iOf+/mqRk7JQhF+1jcpfBEAdxYgWgIsNXPyxUjgaQ5C/D
	HCoZG5LKCiONlFQKIKatRQhHWGvBtRwMagRdhaiyVjs71EkvqgTGbs6+CPttsIdeuL/IUO2oTEA
	teFWN0MGp685MA=
X-Received: by 2002:a05:600c:4ec8:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49fe66c8ae5mr1330245e9.5.1790188163387;
        Wed, 23 Sep 2026 11:29:23 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd3d5csm4711835e9.14.2026.09.23.11.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:29:22 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 23 Sep 2026 21:28:48 +0300
Subject: [PATCH v12 02/12] dt-bindings: clk: zte: Add zx297520v3 matrix
 clock and reset controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260923-zx29clk-v12-2-9c243796b6d2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11434;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=mKcZ4scbGoTb/33r6+9Uqpzsal/IheOYBXSrIfc+f+Y=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqtBptpZIiXq4dyehEgcn0lnzqx9cN3LGqrk9tD
 Rk17nURklqJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarQabRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLaew//bv3agaCC9FnZYA/w++/2IS4IHCVYmvp
 +9tZaUKTX9Dc0v9ihv5Fc/5ufF14dC5W0Cmt9neWjYEkMca7Bdfdj9EWk5Up4e88+52UrPnYY9i
 iMvUN+MmP02ZOAgr83xyfxKPV8nqhDPtVr0SwkhiyzTcYf/w00iXOc83w+C3cSZkQPLo00F26uC
 g7VIiDXEYmm2z1LNlfXimGR6W4FJOEDl/x2oxEcAhGL66OOaVPNZmIPx55A2KmAhXMy9z3UVPIf
 XsZMaAtwn9P9t3NcSPXwal/ilV/rDMJrkXRWOOhW/AX5abSvP+FBDdP4rLR9N4eTNCixU5KbM6/
 s6dRy/dQ2++GVftKjnhvdwQrysSkkJ15zqr0FONS9n9doO1PnPw1mjhPPh8QlC7fEZnW769tbSb
 v41IQlVi/folVuDYu8iZO5JfUEdrgW64e4UUOe2fIlJl4LY+rTO92+YK8zaJKinKBt/sqxCWgnm
 9EDAVyeliLHjiSTcE1XZgGMi7MZ78lTyhwWggtiWj2d8on6zSqnov7DOs+2NBy8zkK80NegDZYx
 BIrgBIdgaXIaoyj+ldm4C9jO68eHn1i33cRRJQryndCTquA9RslC4c1Ag6m0uLbAgVUVoBMjlHG
 T4sWcCEqyRvjlL0MXEMRukBsC7fwoiKbnEuKeiXLiMrwynRlAE/Q=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_112925_501826_389EB3D5 
X-CRM114-Status: GOOD (  31.70  )
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

This controller contains clocks and resets for high speed devices on the
zx297520v3 board and hardware spinlocks that I expect will be necessary
to communicate correctly with the LTE DSP firmware blob.

I don't know much about the hwlocks yet other than that they exist, so
there is no header yet adding meaning to their indices. Presumably that
meaning doesn't exist in hardware and is de facto defined by ZTE's
firmware blobs running on the rprocs.

The zte-zx297520v3-crm driver will instantiate separate MFD children for
clocks and resets, which are handled by separate clock and reset
drivers.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

v11->v12: Add RFFE clock. It belongs to the SSC device (ZTE's name, not
mine) and together they are used to set up radio hardware.

Also add LTE_MODEM clocks: I defined them in the driver in version 10
already but forgot to export them. (No, I don't know what this LTE_MODEM
device does. The LTE modem firmware uses it. I found that the pclk gates
mmio address  space 0xf8000000-0xf8300000 and 0xfc000000-0xfc220000 and
that this area is only accessible to M0 and ZSP.

v9->v10:
Add ZSP PCLK and ZSP bus reset. I don't know the exact difference
between the ZSP reset in topcrm+0x13c and the one in matrixcrm+0x3c.
Core state vs axi connection is my best guess. Both need to be
deasserted for the ZSP to work.

Fix order of clock-cells in example code.

v8->v9:
*) The SDIO controllers and GMAC depend on topcrm's ahb clock for
register access / dma operation. Add the input to the binding.

v7->v8:
*) Start clock indices at 0
*) Fix indentation

*) Add a prose note about discovered registers that allow writing
CNTVAL. I am not exposing them in any way because for now I see no need
to use this functionality. It is possible that the counter resets to 0
during standby, which means someone needs to fix it up using those
registers.

Nevertheless, no syscon yet for these reasons: I have no idea how CNTVAL
behaves during standby. It might be just fine. Standby very likely needs
firmware handling running on the Cortex M0, which can restore CNTVAL if
necessary. If Linux needs to do it, it can probably be done by the clock
or MFD parent driver. Given what I've learned so far I'd rather add
syscon later than put it in place without a clear user.

Details of how to manipulate CNTVAL will be in the matrix clk driver.

*) A non-change in the binding text, but worth mentioning: Register
0x118 contains gates that gate off matrix-synthesized PLL fixed
dividers. They reinforce the understanding of the top->matrix interface
and the adequacy of the bindings.

v6->v7:

*) Moved it back to clock/

*) Remove syscon compatible again. I looked into remaining unknown
registers and I am convinced that there is no odd misc register left
that can't be exposed as a proper subsystem provider.

The controls in 0x100 that ZTE's DRAM reading code exercises are auto
clock gating controls and the actual mailbox is in a different
controller.

Unknown registers in 0x120-0x12c are a frequency voting mechanism for
the AXI bus clock. The driver will participate in that voting rather
than set the frequency via 0x0. If need be it could be exposed
as #interconnect-cells, but it won't necessitate "syscon".

*) Reduce the number of input clocks to match register controls in
topclk's input control that affect matrix and LSP.

*) Add DDR mux and gates. Not to change them, but to make sure CCF knows
about which PLL is feeding the sysmem memory

Changes
v5->v6:
Add syscon compatible - Conor suggested this after v4 and I forgot it in v5.

v4->v5:
Move binding to soc/zte
Remove topclk from the example
Add #hwlock-cells for hw spinlock registers
Add more clocks I stumbled into: sram0 and another LTE related device

v3->v4:
Split matrixclk into its own controller again because syscon/regmap
deals poorly with device nodes that have more than one memory region. As
a consequence I am passing all PLL outputs generated on Topclk down to
Matrixclk.
---
 .../bindings/clock/zte,zx297520v3-matrixcrm.yaml   | 98 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 45 ++++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   | 13 +++
 4 files changed, 157 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
new file mode 100644
index 000000000000..5e9506db7365
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-matrixcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC matrix clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  This controller contains clock and reset controls for high speed devices on
+  the zx297520v3 board: The CPU, RAM, SDIO and Ethernet clocks and resets are
+  found here. This controller requires PLL-generated clocks from Topcrm as well
+  as the fixed 26 MHz and 32 kHz oscillators found on this board.
+
+  This controller also contains hardware mutex registers for synchronization
+  with different processors on this board.
+
+  An additional curiosity are registers that allow setting (but not reading) the
+  ARM architected timer's CNTVAL. This is not exposed in the binding because
+  there shouldn't be a need to access it.
+
+  All available clocks are defined as preprocessor macros in the
+  "include/dt-bindings/clock/zte,zx297520v3-clk.h" header. Resets are defined in
+  the "include/dt-bindings/reset/zte,zx297520v3-reset.h" header.
+
+properties:
+  compatible:
+    const: zte,zx297520v3-matrixcrm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 26 MHz external oscillator
+      - description: 32 kHz external oscillator
+      - description: AHB clock from topcrm
+      - description: Main PLL output from topcrm (usually 624 MHz)
+      - description: Main PLL subdivision factor 5
+      - description: Dpll output from topcrm (usually 491.52 MHz)
+      - description: Gpll output from topcrm (usually 200 MHz)
+      - description: Gpll subdivision factor 2
+      - description: osc26m work clock from topcrm
+
+  clock-names:
+    items:
+      - const: osc26m
+      - const: osc32k
+      - const: ahb
+      - const: mpll
+      - const: mpll-d5
+      - const: dpll
+      - const: gpll
+      - const: gpll-d2
+      - const: wclk-osc26m
+
+  "#clock-cells":
+    const: 1
+
+  "#hwlock-cells":
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
+  - "#clock-cells"
+  - "#hwlock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
+
+    clock-controller@1306000 {
+        compatible = "zte,zx297520v3-matrixcrm";
+        reg = <0x01306000 0x400>;
+        #clock-cells = <1>;
+        clocks = <&osc26m>, <&osc32k>, <&topcrm ZX297520V3_AHB_PCLK>,
+                 <&topcrm ZX297520V3_MPLL>, <&topcrm ZX297520V3_MPLL_D5>,
+                 <&topcrm ZX297520V3_DPLL>, <&topcrm ZX297520V3_GPLL>,
+                 <&topcrm ZX297520V3_GPLL_D2>,
+                 <&topcrm ZX297520V3_GATED_OSC26M>;
+        clock-names = "osc26m", "osc32k", "ahb", "mpll", "mpll-d5", "dpll",
+                      "gpll", "gpll-d2", "wclk-osc26m";
+        #hwlock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 43fd556e155b..5f367b5126c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3922,6 +3922,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index 1bc9267e4d62..d98bc38635b0 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -69,4 +69,49 @@
 #define ZX297520V3_GSM_156M			60
 #define ZX297520V3_ABB_WCLK			61
 
+#define ZX297520V3_SYS_TIMER_WCLK		0
+#define ZX297520V3_CPU_WCLK			1
+#define ZX297520V3_CPU_PCLK			2
+#define ZX297520V3_ZSP_WCLK			3
+#define ZX297520V3_ZSP_PCLK			4
+#define ZX297520V3_DDR_CTRL_PCLK		5
+#define ZX297520V3_DDR_CTRL_WCLK		6
+#define ZX297520V3_EDCP_WCLK			7
+#define ZX297520V3_EDCP_PCLK			8
+#define ZX297520V3_SD0_WCLK			9
+#define ZX297520V3_SD0_PCLK			10
+#define ZX297520V3_SD0_CDET			11
+#define ZX297520V3_SD1_WCLK			12
+#define ZX297520V3_SD1_PCLK			13
+#define ZX297520V3_SD1_CDET			14
+#define ZX297520V3_NAND_WCLK			15
+#define ZX297520V3_NAND_PCLK			16
+#define ZX297520V3_DMA_PCLK			17
+#define ZX297520V3_MBOX_PCLK			18
+#define ZX297520V3_PDCFG_WCLK			19
+#define ZX297520V3_PDCFG_PCLK			20
+#define ZX297520V3_RFFE_WCLK			21
+#define ZX297520V3_SSC_WCLK			22
+#define ZX297520V3_SSC_PCLK			23
+#define ZX297520V3_AXI_WCLK			24
+#define ZX297520V3_GMAC_WCLK			25
+#define ZX297520V3_GMAC_PCLK			26
+#define ZX297520V3_GMAC_AHB			27
+#define ZX297520V3_VOU_WCLK			28
+#define ZX297520V3_VOU_PCLK			29
+#define ZX297520V3_LSP_MPLL_D5_WCLK		30
+#define ZX297520V3_LSP_MPLL_D4_WCLK		31
+#define ZX297520V3_LSP_MPLL_D6_WCLK		32
+#define ZX297520V3_LSP_MPLL_D8_WCLK		33
+#define ZX297520V3_LSP_MPLL_D12_WCLK		34
+#define ZX297520V3_LSP_OSC26M_WCLK		35
+#define ZX297520V3_LSP_OSC32K_WCLK		36
+#define ZX297520V3_LSP_PCLK			37
+#define ZX297520V3_LSP_TDM_WCLK			38
+#define ZX297520V3_LSP_DPLL_D4_WCLK		39
+#define ZX297520V3_SRAM0_PCLK			40
+#define ZX297520V3_GSM_CFG_PCLK			41
+#define ZX297520V3_LTE_MODEM_WCLK		42
+#define ZX297520V3_LTE_MODEM_PCLK		43
+
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
index 4a0eaec0e981..54e5b24f859a 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -27,4 +27,17 @@
 #define ZX297520V3_USB_RESET			18
 #define ZX297520V3_HSIC_RESET			19
 
+#define ZX297520V3_CPU_RESET			0
+#define ZX297520V3_ZSP_BUS_RESET		1
+#define ZX297520V3_DDR_CTRL_RESET		2
+#define ZX297520V3_EDCP_RESET			3
+#define ZX297520V3_SD0_RESET			4
+#define ZX297520V3_SD1_RESET			5
+#define ZX297520V3_NAND_RESET			6
+#define ZX297520V3_PDCFG_RESET			7
+#define ZX297520V3_SSC_RESET			8
+#define ZX297520V3_GMAC_RESET			9
+#define ZX297520V3_VOU_RESET			10
+#define ZX297520V3_LSP_RESET			11
+
 #endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.55.0



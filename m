Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7F9C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 21:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acDm8bRgR8KPzf+K9bAQdb9mwDVo0dBEIic+0zlczzA=; b=l1T1D8929vooBwa0c1m9ZqQgeR
	MI5p0Hmy1OdZuW3plApXBujMOf1OeS61coO0+n6S/1/USgDCVcXsLgoaa7uNeVNq2JZuKsAwtTHdz
	yp6N1rkpJ6Ne25JVeMD3d8GKaf0ig1vATTH1Z0b04URhpfJafbglw4r+bhCJDZSwMiC4C8NvSlhzz
	wBtAcQ/jUzxqe93y5nN6dMjHyDa/qiWawSbl6+zq+611QKqmmnLQC5w+tZHiBoGUl39w6+xgRF5qQ
	IrxGNGnToz9+/mv4vxjO3Citmtq9EkZVtuWl/5oS5wHqoBT8sd5Nq0WeJ1BvXVyvG1wfHJgs46ABF
	sRvnCadA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtB4s-0000000Ak10-2d3q;
	Sun, 09 Aug 2026 21:29:06 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtB4p-0000000Ajyl-3uz8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 21:29:05 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-480001972b8so411118f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 14:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786310942; x=1786915742; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acDm8bRgR8KPzf+K9bAQdb9mwDVo0dBEIic+0zlczzA=;
        b=fID/++Qw8+qaUUKslCnqHYZzvxFldcOjg7sHX+ZCD1bmIlwBhA9Wy6SNfsx2EQOVGW
         XI0o07+KETunWRlcnOp6y9cz2ovwSkvBLsa5z01/hXNytrdFzDNZkdNj/YJ0MI6u6AnO
         89MWmkVCUnnpfGfovuAGmyAPTP2W4EQ/CY9jc9ZHrwbbdkgqcWl1aN1xFtt+WPQpytaW
         ejHr4yo97wYvPAXTL/oGFyiyQNJvtwmlj+lpIkTDx9hwa1+TsU5vESENrzRZDN1AZhlD
         mJyfuwtukOY01Wq2JIxuoPjKnMxbCrnY8FPZYhqeECDd0mewF3WG32tvi4UeTQhm78NY
         gWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310942; x=1786915742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acDm8bRgR8KPzf+K9bAQdb9mwDVo0dBEIic+0zlczzA=;
        b=jz4/GsmZUSyUqFyG7Yeq4IVttNDMsehOf7yex81xhLDFEtApw9fOfRTaaMJFCO7ucQ
         gkJSd6b3SKZpGz9tRKCwxCBf48nJuh4h3lUunIewM0oYZyqqTG+zGnVB9lp4PPWGWzOd
         OjizHHKGnr/IJHdKrQhUhNQpLKQpIxzfys1GJxcAGovbQYCSNKrcGuCmjNNCIeCEOFiS
         kDL7/YahA1S/wR14XpMcKfZoTnEPayrBmqfR83WrpHekmLidhqfrIgdDjiGuqXtuwlxS
         jbpV6sFGW1tUswqIW8uXKP0bvWEsDch507wfT2ESf0UhOSqVFKAABNkqFckYuF++sL2T
         tdCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrP7i6FBUIqKPMxyeMZjnEjmVO4YBR0YfkO45f2kRZffRPKEMnWmQ/zPl+3I/KDjrwKKVHdmXIL4DVni/Lr51EN@lists.infradead.org
X-Gm-Message-State: AOJu0YzW8eR0URJptBZTT01bBf6T2+5lGoLeCgPLRl/9EMP2B3YLG5jG
	vus0/6PwPk4AU66aRgtVrxM+RtcbpWb2ymd2E6Ws24e0sc5ASlundivt
X-Gm-Gg: AR+sD12RZPUKfoo7DoOoPHqhMQgbarY7veuTQWN5HfFCzKBvKVu3hFw74jn1Nao0sZK
	SWTsuQ9FpgS2KfX8F6EBZKAmcUltUtK1WHhoUMTYbmYlGOPscv1SCMFKYCN1tRhFfuVop2HLVVE
	sgUuNsEjsZWpMdHVWoODOoEgVqtkRiucUKQC/2hBKk7U7x6s1WD1cqYevdR8PR5ZvlmIsT+bwn6
	KlCiIpL5T07pqwRB3QhiGNtxe4Br0HwOjLVHFBoO+oGcuBpqF8+b5lexRYvqb8IYC3MqgJAJ2mh
	+AOyhqW3Fl1MJf0mZBaQx/yVsTOtPcDJ+b4IMlagEc0i4RzuQb0AVSNT7nAak7LDlKa8bTL8Xu+
	qH8N9TV1RGgt3g/+y61DmQp5RbJUeWS3f17T9uMgQ6c8IZt+ufPzPeacTC2Qep47szJK1m+li/u
	T04vxR4TJMK7BB+mwdzkUx+uLeUHB56coG+AX8lS9xl+XiFZB2hJet98ygUuDad6morZOSx9Tb+
	VusGo6BIQ==
X-Received: by 2002:a05:6000:29db:b0:47f:e797:41c8 with SMTP id ffacd0b85a97d-47fec4e8f84mr44755800f8f.4.1786310941931;
        Sun, 09 Aug 2026 14:29:01 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm28987451f8f.18.2026.08.09.14.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:29:00 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 10 Aug 2026 00:28:21 +0300
Subject: [PATCH v10 02/12] dt-bindings: clk: zte: Add zx297520v3 matrix
 clock and reset controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260810-zx29clk-v10-2-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
In-Reply-To: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10841;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=DM1hAVZYJq9k76Uu7Eujy1xt8tFcNCoVKCiI84UGQmc=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqePEOhPutG4kT66u/yfdhDES/DBEjHA5myfnF2
 oQ2l0b9SPOJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCanjxDhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJqiQ//UY9pqvw2o6FnDFej6lpUzRFuyLLXD2/
 rcMiPRGIRx5yLtMEICY+MvUIPIH4+NkhL6VK87defohMDyzkodiRZtAQUVjnvrbgwHXvbDUf+OA
 zWCOkzq9TA8VRYinP6WtCQ5qAyxFiR6XSU379EwduNQoMkmTCD8JNIcxk/E/a0O7O/QCknhWoPc
 iRIfRlJhXr/qr7ArYVl8Pa4qg9DsMJCY3ryDMTn4HIrvWijwOWj2xzylOeH975Y7Av1Uc3U81so
 GU85wboPI/DuTCDQbcQnvvPfc67PrdbHeKONhX+0iSCzJVESXufP5mOrNrluls7OYqvyJQCnAkl
 pPZL3QnWqTBEwylCCIZgxzIOnqC0IwAdScadYhkKUGidFSCvjfTyDWYrX5DgQievhK1dsFXah5n
 LB1RFLa4gDUotwMe0LkdjwgEUxDNUiXgxKXzq+8lmZ1IqOHfamKysXOTWDKKJJcicv/C2anNcFA
 G2qQ6PyPbm4v4rXdJiFpZuTxiqAOaGyBZvwC2UPiNnnJOO08iGM0zoIqbOJOVjknXYkVl/hD/R5
 /J3ISgeexzcVqJCgstkFwNUF5OXtV+duB3EIJg2pw5KrWfx1fwex72S/cUeYhx5nUtJ+TQQiCMA
 Jm8jp/5qkJQkCoaSi2VVTKY5VFYuq5DRHZ+28vmnUjw1wNE5rK14=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_142904_030509_1D878407 
X-CRM114-Status: GOOD (  30.79  )
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
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 42 ++++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   | 13 +++
 4 files changed, 154 insertions(+)

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
index d8be58f32901..4b852dbcde74 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3904,6 +3904,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index 3aed94ccc26f..a5e5d5f17c87 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -63,4 +63,46 @@
 #define ZX297520V3_HSIC_WCLK			54
 #define ZX297520V3_HSIC_PCLK			55
 
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
+#define ZX297520V3_SSC_WCLK			21
+#define ZX297520V3_SSC_PCLK			22
+#define ZX297520V3_AXI_WCLK			23
+#define ZX297520V3_GMAC_WCLK			24
+#define ZX297520V3_GMAC_PCLK			25
+#define ZX297520V3_GMAC_AHB			26
+#define ZX297520V3_VOU_WCLK			27
+#define ZX297520V3_VOU_PCLK			28
+#define ZX297520V3_LSP_MPLL_D5_WCLK		29
+#define ZX297520V3_LSP_MPLL_D4_WCLK		30
+#define ZX297520V3_LSP_MPLL_D6_WCLK		31
+#define ZX297520V3_LSP_MPLL_D8_WCLK		32
+#define ZX297520V3_LSP_MPLL_D12_WCLK		33
+#define ZX297520V3_LSP_OSC26M_WCLK		34
+#define ZX297520V3_LSP_OSC32K_WCLK		35
+#define ZX297520V3_LSP_PCLK			36
+#define ZX297520V3_LSP_TDM_WCLK			37
+#define ZX297520V3_LSP_DPLL_D4_WCLK		38
+#define ZX297520V3_SRAM0_PCLK			39
+#define ZX297520V3_GSM_CFG_PCLK			40
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
2.54.0



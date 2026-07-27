Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FD4C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 18:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VX6nWC1wuEufJBrXu3pDOZQGxBJekZKOfI95BxKyKd8=; b=OxQBicGrGE8PndsvhGi5Q6z496
	HHYWE97HdN3OehhXc1TpbtSFxNwHRXd5IHn/5hESF4gakM9l1qvc2w+g7JfNWmGzLh7Dsavy7DVdg
	Y6mm8pog+dJUH6ztk8ataru2T92ceulcnlzrCRilqGGF0L6ooSEu+/urs4uAki8L2EPjnvK9cqEci
	N9BVgwYvckVoD/nEmUigdKs8q7tRsmC6ufQdol2zfSJQylCpgO+ns3vk/gLT6hc9dwfUcKI2kXMNe
	dx4nDhEW0yxuspd3ZFWpoc6xXAUiQEcyeFjlfp03ZEKWqU9pe2qZwGNS7kWN440ypbKRQ+axTq4Px
	Gsxvq8Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ12-00000003dZl-0Kmu;
	Mon, 27 Jul 2026 18:25:28 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ0t-00000003dU5-38ee
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 18:25:22 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47f904e80eeso2460794f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 11:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785176717; x=1785781517; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VX6nWC1wuEufJBrXu3pDOZQGxBJekZKOfI95BxKyKd8=;
        b=F42tIhPO+v6T5R/XchFcnHYH7NRdG4u4wx9B3ib5OSsazOmFJftlpQg56joBUZWW+v
         B1ZpD8/7fY6Wf6so73FH22UrMg7DvnIqx5yU5oNw+7Ec8kuGno8QyNWs9MDQPrISaEZm
         7uFJsCzflBsefIPkBtttkrtul/RtYVA5w1KpInO/v4ZW/uWl+KEJRuF9OKuQG0HVC9MU
         HlN9GGMWAB64JpjYGcnZOjOU248UP+jZMhGA2OYtpxOA4lI+dmBzSgwa43OHgyx3VUYA
         rZhFRX0bY4ZT2NKeV7hbBpUExaj9cl5f883lQcd19ttKuyBf72sy+YgIPad5KpaoFrIC
         vYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176717; x=1785781517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VX6nWC1wuEufJBrXu3pDOZQGxBJekZKOfI95BxKyKd8=;
        b=nBDPcJjeEGLi+98Aded+kOJjIl14qNYtVEHo0/yWBK0r+JbCcKHSQJzGjA8+VyQA4H
         DSvqi+y35SnnVrJ51X+4Ne8MfIBnQhygc6TKV/8c+dLlypDDAq+ofqkaGobokPRB0in+
         EYduqVCdXQ02v7g9nWy4rdm5y6oxv6pn59iDXgtAjM2uH3+gGSrr/MyGTBWL63jQU0uJ
         EHcov3C5DhriF1sHbVfLJNwZtnMc3MDPtawTG2YpgTgIZAUvyD98K1WH0ESwOudvmhon
         P6X79aSlg0Az9u7DpJAJWI0YgD09WcdiHgHn8bo1JCbQbo69b1DlurHjiGBVtkmg3Igg
         KTKg==
X-Forwarded-Encrypted: i=1; AHgh+Rqc/fOhlG/Ud3JEo1bz3N737NjN8kr+bJkgRWNLop8FVg4F0Zz/B40P7EJowULv48CN59mhL6Tx1C5ygXjFJtNO@lists.infradead.org
X-Gm-Message-State: AOJu0YyA9JVjB4Z2YsZ8tOgIGqErqU6qyRsxflugMv8ikUglkRwuIsHN
	ZLnlWhgw6UH5OLINUEykxzCyUUWKKDGo48b1YNG3WCruLMEqlL0adXlY
X-Gm-Gg: AR+sD10d4OnJRGG44QQnLkoZu1M6LTg80xIPHdlrNa0HJZI9mYEqraxf7Pfa4lFqMoh
	PcVDcaJiqgElnk1ehBcbw068FuUKCiKiV5aEtQZZL3sblFIfxUBWwOrUahPvcgH2TPBgk/WC4+v
	Nw+7dJypbdeTq+4oR6HP+/n0I6VPHqDh8NsLHSAqxqVhgWIVh0k5D9mVRwhczMNC1MCXCPMyp9m
	Ue35JA1zCgjtkWpiW77xyvnaHB9XbNYyPasK2BWImwXGaXfaemxz5h0mTWLNwckvskUiDsb47X1
	wkBdhDzPhJX50lVD58uetPP9erJIFHps9A+lOgFb+EnGjwwSzee2xg5IfaChkORVEZYyMJZddPb
	qXX1O3tF2SAlOr+bdeNgkpgEGi17RJdi4QqECXFqH5ajhBi5yrRITLVO1I2jgOuJj0iTEBtPNvM
	PG4+8le/TO3Zbz
X-Received: by 2002:a05:6000:2085:b0:47d:eee8:ec40 with SMTP id ffacd0b85a97d-47fafa71ad6mr282587f8f.38.1785176716587;
        Mon, 27 Jul 2026 11:25:16 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm50689288f8f.18.2026.07.27.11.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:25:16 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 27 Jul 2026 21:24:17 +0300
Subject: [PATCH v8 02/12] dt-bindings: clk: zte: Add zx297520v3 matrix
 clock and reset controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-zx29clk-v8-2-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
In-Reply-To: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
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
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10162;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=ffC60u8hIPOmt0qi87H1YYiy/vgKwD1XVNY3q65mPKo=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqZ6J6fgllgvIS5kdlgumbT6u1jjVMEtwHptFAo
 K277V+pq4iJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCameiehsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiI5VA/+LSYOfOlmqLLDCXJ2AzNEEdfljAX/Ttt
 hZriRvCGgNEmPuPiN8Rq2ZAHzq3BcGiubY7PrT4MoF6QY5IM8WppO+7qM+lRGl2O7Px4+MIU0gl
 A2UR+tcf+3UIkOI+OVM8tYS/0kyKbP1fNgxMEH7jRg/LJZfqzrnwUrx2HylgEwzufp40SshSHCi
 ZKd6tY+vZGqp+6XsFyZFYT6w9BlafODg+MVLOq7NTVLd9Ixj0VeulWwW/PVbc4PR+eKcx3hzmWt
 Nti+kHCgCG3q3Si6HZXZljfOGXna3ydtqUBnva5nEKzJnvI/pbPfrGK2hTtfexgg149pw6REdT7
 LOorC8aCxfSvid+ys3xCHL5/1aG6A5OR2l9bbJ6huz5xJg6NtyjhN4E/MohoOQ4F6HRu3M+3R0n
 p4enS7SCOVVwB+WMIBKxvhIzzpyONlNbbqXe5JU2p4PwFmz7VhTOevwqMFb8+AfIQ4TddpOnGAg
 r1rwN1jtgggXIzTXy6OouqOF7hgVPHQf7iN346y7NPZ4ANVFczuifW0srPvREeh9OBliSHzbcin
 Pgv83r+SZnKCLwgkWP5+d+tE0YW5S4VUkC1kE/tkavg8vfOE5GLtFsYtYfhFSUmzlEimwtpRpjD
 ZgRMnadSCUSDjw0m96y6+e2XAR+dXdnbXCXwPEazBhUvF3unsD14=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_112520_055780_9735466D 
X-CRM114-Status: GOOD (  29.21  )
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

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

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
 .../bindings/clock/zte,zx297520v3-matrixcrm.yaml   | 96 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 41 +++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   | 12 +++
 4 files changed, 150 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
new file mode 100644
index 000000000000..d96f9f374447
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
@@ -0,0 +1,96 @@
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
+        clocks = <&osc26m>, <&osc32k>,
+                 <&topcrm ZX297520V3_MPLL>, <&topcrm ZX297520V3_MPLL_D5>,
+                 <&topcrm ZX297520V3_DPLL>, <&topcrm ZX297520V3_GPLL>,
+                 <&topcrm ZX297520V3_GPLL_D2>,
+                 <&topcrm ZX297520V3_GATED_OSC26M>;
+        clock-names = "osc26m", "osc32k", "mpll", "mpll-d5", "dpll", "gpll",
+                      "gpll-d2", "wclk-osc26m";
+        #clock-cells = <1>;
+        #hwlock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 36619a9ff8fc..dc2972ade70f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3878,6 +3878,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index 3aed94ccc26f..a8477e9b2a14 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -63,4 +63,45 @@
 #define ZX297520V3_HSIC_WCLK			54
 #define ZX297520V3_HSIC_PCLK			55
 
+#define ZX297520V3_SYS_TIMER_WCLK		0
+#define ZX297520V3_CPU_WCLK			1
+#define ZX297520V3_CPU_PCLK			2
+#define ZX297520V3_ZSP_WCLK			3
+#define ZX297520V3_DDR_CTRL_PCLK		4
+#define ZX297520V3_DDR_CTRL_WCLK		5
+#define ZX297520V3_EDCP_WCLK			6
+#define ZX297520V3_EDCP_PCLK			7
+#define ZX297520V3_SD0_WCLK			8
+#define ZX297520V3_SD0_PCLK			9
+#define ZX297520V3_SD0_CDET			10
+#define ZX297520V3_SD1_WCLK			11
+#define ZX297520V3_SD1_PCLK			12
+#define ZX297520V3_SD1_CDET			13
+#define ZX297520V3_NAND_WCLK			14
+#define ZX297520V3_NAND_PCLK			15
+#define ZX297520V3_DMA_PCLK			16
+#define ZX297520V3_MBOX_PCLK			17
+#define ZX297520V3_PDCFG_WCLK			18
+#define ZX297520V3_PDCFG_PCLK			19
+#define ZX297520V3_SSC_WCLK			20
+#define ZX297520V3_SSC_PCLK			21
+#define ZX297520V3_AXI_WCLK			22
+#define ZX297520V3_GMAC_WCLK			23
+#define ZX297520V3_GMAC_PCLK			24
+#define ZX297520V3_GMAC_AHB			25
+#define ZX297520V3_VOU_WCLK			26
+#define ZX297520V3_VOU_PCLK			27
+#define ZX297520V3_LSP_MPLL_D5_WCLK		28
+#define ZX297520V3_LSP_MPLL_D4_WCLK		29
+#define ZX297520V3_LSP_MPLL_D6_WCLK		30
+#define ZX297520V3_LSP_MPLL_D8_WCLK		31
+#define ZX297520V3_LSP_MPLL_D12_WCLK		32
+#define ZX297520V3_LSP_OSC26M_WCLK		33
+#define ZX297520V3_LSP_OSC32K_WCLK		34
+#define ZX297520V3_LSP_PCLK			35
+#define ZX297520V3_LSP_TDM_WCLK			36
+#define ZX297520V3_LSP_DPLL_D4_WCLK		37
+#define ZX297520V3_SRAM0_PCLK			38
+#define ZX297520V3_GSM_CFG_PCLK			39
+
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
index 43db72bb59de..4682d4a599c6 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -29,4 +29,16 @@
 #define ZX297520V3_HSIC_PHY_RESET		20
 #define ZX297520V3_HSIC_RESET			21
 
+#define ZX297520V3_CPU_RESET			0
+#define ZX297520V3_DDR_CTRL_RESET		1
+#define ZX297520V3_EDCP_RESET			2
+#define ZX297520V3_SD0_RESET			3
+#define ZX297520V3_SD1_RESET			4
+#define ZX297520V3_NAND_RESET			5
+#define ZX297520V3_PDCFG_RESET			6
+#define ZX297520V3_SSC_RESET			7
+#define ZX297520V3_GMAC_RESET			8
+#define ZX297520V3_VOU_RESET			9
+#define ZX297520V3_LSP_RESET			10
+
 #endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.54.0



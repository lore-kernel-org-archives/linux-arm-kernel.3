Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12C1C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 20:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTzARpAQ1FqRSZRcOjFrojuzS0OziBZa0kjKlGuymNY=; b=d42Iuvf0KnC26g1sV7N9QnPCDQ
	54GFPk/aDwQ6VXswqQFbAwhCDFiwXeQWBnyH7oGfbyV/12KKnyeM7G1LC0s1/GV1EkYc6tfJ/D2l2
	5RZ6eTrQfd17WTVrJRITo9SafhuYZ5gpi4XJgQfPZ3z4U9gL8u2z0ecQqWJ9yFZ39o7Y98TjQSKEI
	1tsX86w+qwX0OMmNGUUIG/yKv8/rZlm/poLWUkBnByIFHF9f34szsnPkfHcKiS8vrSATQLbRwfOR/
	DxBsK/+mfDyalFU+YnweibW21j+wf4mF3Lq1KRdEDm8kkMmepvqc+3IAHbdZdDwZa6EbX2PEDOeax
	q34yhbzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqct1-0000000G1S6-0vQh;
	Sun, 02 Aug 2026 20:34:19 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqcsx-0000000G1Po-1XqO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 20:34:17 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so14427515e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 13:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702853; x=1786307653; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTzARpAQ1FqRSZRcOjFrojuzS0OziBZa0kjKlGuymNY=;
        b=n7cuyhG/VQGWasekqz5RmHF1VTljr5E61wxPuGm7unzFOIZ6+nihEQeGRq8GG/zYOk
         a9e+4mseDyqgk51e+1Y8+i0ry7pybm7p5Nc5ght3h0nvnc+bryZ/jgUnfnBgfpqMfQOn
         MMQHwKhhzmdgNWlXjoNp82mkBoawbtEQ7xCaQ0OnPdGHKu4Q1J7q9D5raZHli/L4Ys/D
         rYXWhPHEOAZ8r/hnKqt8JWJiMo3zBx+DdVPnVKeoblxvciUPY7VvB4xm/WA9BTTzORbN
         vfKsNGEilRt28rJbCzSwCgkGwepLA56FeckgJoGcvjECpTuRTmB7i6dy4FQtBiw1hewc
         dbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702853; x=1786307653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zTzARpAQ1FqRSZRcOjFrojuzS0OziBZa0kjKlGuymNY=;
        b=bYlz9PYy6YUTDL/2BmvAvcqGvZv1K6hTC4S+gUM+8L/NRqbDOQtWCrJZ5WSpF5y0bP
         yZIS4eV5QPZvRzS3hdlmqG2XyGje411as4G37aPV1Nu57AKdErKHCJm986rIdhLmGeHv
         8UnrjtbpIKAR1NewRoNCWdG0BzYHjW15QAyfbrNet9fTg/ULaVt1vPoBnVTVqycp+3Sq
         OsedAejDjpgCDYBT6woLHVuzJJGpQc7ZMgq9v7nBDe7ia3MFWmX5UzD3gacFEIgd5pqL
         /G4XAqG/BUV+pTY9PXfe3dhNlOcspc23C9z1veyFHUZCXcEAyiGXBwjb35lCR7EndXLb
         Uz/g==
X-Forwarded-Encrypted: i=1; AHgh+RqK4sLmzmnPjFJrArDbcTCxBi6f3SQ4V/Lp7Lu+p3hecrDDrTZN7WzPf+JDxYIn9ynGsKURRFwbLaaQTLgNGEE0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4uSqvsAza0NMDhvdNYgBmVM0fjYV2c12MN8GiWpqJqVKYazMb
	0FxRmwW5U3sFxRYs9T1JLL9nTXIxnSKy5xbG35kZC3AzvQwFEsdB2QCAunFVii2mUMM=
X-Gm-Gg: AR+sD11H0msOPDj+SZpO6LNRNk0qWIgQBfsydyHUz/Un1w0OsbnLvIc2BE5ti0GI7Zt
	i7K5b6qOdGv3uVvmBZfFVNzwgt4Cn0I6IqQYDlYi6scj3NnkCBjXQnb05L1RvhraLKMz68UVE9y
	+41tvsyJZW2TZXZIHY/s3iXyyM3enRqycgvxA9RS1eGTw9AxB6/FVglXkP0m7pA5wRXqG4aMq9Z
	mVaPmDhexERsUv6GYAogIDKFXo5ZpIn10d5lugdpAUVkCCyUlgX8Ptfip9b9ZOPFE+CPDVxQpG0
	3AXLcPU+G4vl8jiglRedHCINsWQb7mTxiTjjN/W+J/5XM6dphVS6ZKYyaHnXIDc9ysDsVUiEB1S
	hTLhhyXpW0MFIUDJdDfd6gwBH7BjF+ph7U93bkOxZ4iqd73EbCahEC9SffyREpLZk0lyL6mUdt/
	g9EilDoH1ghzX1BtOp7KRsynmgKkqAu+acQy9B/jaW5GoY6YZBjR0Ry2DWnYaFDYSfqQIdSEJD
X-Received: by 2002:a05:600c:3b1f:b0:495:64c6:84e9 with SMTP id 5b1f17b1804b1-4980c5e0e47mr137576315e9.0.1785702853071;
        Sun, 02 Aug 2026 13:34:13 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807bb45ebsm118499905e9.4.2026.08.02.13.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:34:12 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 02 Aug 2026 23:33:34 +0300
Subject: [PATCH v9 02/12] dt-bindings: clk: zte: Add zx297520v3 matrix
 clock and reset controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-zx29clk-v9-2-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
In-Reply-To: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10475;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=teIthTUZUUG27g6rTGA+Gnp1H6xnG5Y2mXlLPS6PaqE=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqb6myeRhCvp2m/eQhdoPkAuo//XXbiyrj1eN2K
 gQTzkw3Sk+JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCam+pshsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKyBA/7BNffsgTp4U9tzGEFqjt39ml+DVHG1sb
 CKoOaulIyXtOrNcTNAPgqfm403IfLR7v5EhNynZj9vJGRpl65Y0wMCDZ48zyYVfWFENenVa5vyX
 Wz/rNI6YpSJB8QXKU98OLikUG8zgGXDCi0jAj3W9CCVDF304w0lSm0rj5uKNZ9C7oxy8bt/7W5N
 PSx88zKl82iEQhVshAN9QDclYIj+QTJBZ6ymi0nm5U6bxSodVyKjOEoYt9UjO12GNu5bFIxYqOc
 ZDssh27/cUesG7KBrYMjo1kvaygEpkIQXc35y/I9Kam2BJ6jUR0lzHSWL8bxNY7l+aaD0Esk6cv
 BMibbJN7y7z5OAvyNubr/nswM0Nnj6a544pmkt+to6pLr5Y9FgH7FWSdVnMdwPM4ncP4KdRVcLy
 9T/s447eNkBLT5qM/k/y/k9cZqdMPJ3xRsHaR+5Lq7s/HxAyceRq+4TsmuRhAgokqpH+OXcxEel
 cBquuIPJWWcrvqO94Hh7305AN9gG+98Wv6mjPWDRMdjWE/vsbynJVlTarBnwvLhS7Tlcwd4hzn0
 YKdzCoTnRDSwv32nqMic7ULpI6YB84+qREh+kFHbkqiV/7nriFntoT1pCPCFaKddeAX98RR8WsG
 +lyX6v+H3ax7TTe1hW2mWMjf7VLxYkPOx/pvhetIXSj1ljQP4L5M=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_133415_467218_9A8AD164 
X-CRM114-Status: GOOD (  28.46  )
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
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 41 +++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   | 12 +++
 4 files changed, 152 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
new file mode 100644
index 000000000000..bb7df02c8a0f
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
+        clocks = <&osc26m>, <&osc32k>, <&topcrm ZX297520V3_AHB_PCLK>,
+                 <&topcrm ZX297520V3_MPLL>, <&topcrm ZX297520V3_MPLL_D5>,
+                 <&topcrm ZX297520V3_DPLL>, <&topcrm ZX297520V3_GPLL>,
+                 <&topcrm ZX297520V3_GPLL_D2>,
+                 <&topcrm ZX297520V3_GATED_OSC26M>;
+        clock-names = "osc26m", "osc32k", "ahb", "mpll", "mpll-d5", "dpll",
+                      "gpll", "gpll-d2", "wclk-osc26m";
+        #clock-cells = <1>;
+        #hwlock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d53c0a2c7d9b..9a919e60254a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3910,6 +3910,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
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
index f60aaccf0f4d..d79fa601afa6 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -27,4 +27,16 @@
 #define ZX297520V3_USB_RESET			18
 #define ZX297520V3_HSIC_RESET			19
 
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



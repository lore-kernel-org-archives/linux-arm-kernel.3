Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFF5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 20:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0JDDV6Q39+7/wpdWHr3nJow0Ls3mDNcHtuzy023QQw=; b=E129wgK8dqcW/NMUWSwsrg7MZk
	Mdv7TGeDCwGhdtHXkQ6JiNV4x90gJwLFESZnbwdGqv8sTh/Lc7d7B6RoSQhWXOkgSMcvoiEJ5YWJx
	Xr9sw5ERFf7sPsvzYKscNTG1hYNTb/xuEU8yU48p+OBKAAAJCnqxGzwF8U4Jd8XR5uOx7hBNGtezn
	SYv8QaVWoTLEsJDObiDtRNV1vpI/S3SJZrcFSF+O3A7ip1H7iNalkQlWqJ5L5nEs8ewVnG+FsR013
	c2a86afblJ791llxZM2ka51GmU6V58UbugfPAIDXz2NHy0SHBcQM47kvN7SBBIG6XGcgUNjPVQ1yr
	efnNMvJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfO1Y-00000005RWD-3YXH;
	Thu, 02 Jul 2026 20:28:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfO1W-00000005RUM-1lmV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 20:28:39 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so15844745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 13:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024116; x=1783628916; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0JDDV6Q39+7/wpdWHr3nJow0Ls3mDNcHtuzy023QQw=;
        b=iCNq3Xqa5uKH3YTxcT/45ijCIvBHrWLqkMLcnkx0rA/rbWHvkYYtr1hFHQFeoSMWyX
         BeSJdLa0dEXZOCNgbZilAqhf7lefh0l18yUWd5lmbsj4eeXALHfOamZwSVB8hzl3pIYd
         JF1UUlM0jWqg/L7U11fSw6dIwQ929uenEtUu4aqWewFOhNbX/f2mAyY8QqaOic6F69Yx
         hrVNXuusRmnts9WBLmTqGR5UB1+HubP2uQ7PHt2ERBUm75UGpfQrlQ76JIPHw2uJxNIs
         6RJD4sC7+BQVbyrBTS91Dol0NBBoUB6qWVYW9hyRIhHmIs9RwgOXj0T6Ga8/3oJKCs8b
         6vVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024116; x=1783628916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H0JDDV6Q39+7/wpdWHr3nJow0Ls3mDNcHtuzy023QQw=;
        b=dBzemU9eZ/gyTQkMIqfnPyVqLMakU32oVRXvvfQKOuJyAMUuflx0zB4khyWKX/7/Va
         yhKy+mlHKT714ysjuQ5Jc32YRx3QlVs4PK0/hdNNCxS5Q0oG2pKaH0sHaoaiOxWdP2Y0
         IA19Ty2FQvnXpy0/2wQu0fDy1IJ9BirC86EAO57J5uR0L1adB3a3mEBeK41XbaqB/Miw
         GpcJ1j6rctMHHOOT2xpeHzuU4Qxw6ez0d5R8bw/o/ZZ/sOF3QhQYebIsRuBphRTQER69
         FjXY39NJM7Le1nsP5bRPXa8WyFUOWrx9GXbD2i4B4BQyh8lR36PVx6btswSu6133av+P
         xZ8A==
X-Forwarded-Encrypted: i=1; AFNElJ9NwSkKDnw7NFL99LECAFFHO8py0ArHG8KUC5K97kRtcB8zwvfKtcuq8wJJzonbbSBoWDfHQEw15c4gfeSRYZjy@lists.infradead.org
X-Gm-Message-State: AOJu0YxQu0XBCjnyzEZ6Qe6wsiPGV4Xw9tTNuN449jBohydFVSWqWrAd
	frACorTDdKC4zouVZp4IcHe2EQ4u1/qLHO0WEpF/+uslGaPp8AZlomGP
X-Gm-Gg: AfdE7clIW/DTzuyAX28g8e7HAhZCrVVyBYlCQLs/woY6f5FdaNykY3uDhra800BE9MB
	KCe0X9lruD1oGN+0NWgmpf7sHU/I8Jw+LmK08eSraLb550kKDtYIQovxwIy9ypk98WScD63E3Cu
	gTyp4JbaRcgmyHUMVpMzLyyXsatVLHBWaO9BiJvYtf625dHlWqp3qD9ylLNRF7+OxVe6BEXtoE/
	Vqy65lNbChlcoeNAeYiGjwmzTA4q+hgqQmZSCyTTbYB1dUE8dEO9fLFJYwzccgmyhaJy9X5vsCi
	MgbHXD046UQeXZna+mpVo+evGbmmf2SLbelRaAip4du6bOMe3/L11MzY3QbbJYKSK51/XpTyAD3
	6Vp4xgPi7Pl+U8CV9EO/AZ0d3kmdFhPtA9zqCwCsKnruQBKUMaArzSODMeMdv+w/IcaZwXWWFHH
	WuNxrvd7iTQvVsKHQ9OKexvbE=
X-Received: by 2002:a05:600d:8654:10b0:493:bdcb:9292 with SMTP id 5b1f17b1804b1-493c3cd48f9mr76957195e9.6.1783024116488;
        Thu, 02 Jul 2026 13:28:36 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:28:35 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 02 Jul 2026 23:27:57 +0300
Subject: [PATCH v6 02/12] dt-bindings: soc: zte: Add zx297520v3 matrix
 clock and reset bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-zx29clk-v6-2-377b704f80c4@gmail.com>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
In-Reply-To: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10954;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=kh99N3ZASfit1Slqc9aNo8AxP+Bs6Pn+/htrYGed7g0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqRsnpRIiAuS/945qJ83DiWC+hVNDhK1cJXdT4/
 f/GjdNjntyJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakbJ6RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiL4qQ//ViGYoYfanPdKHG5SN4WAiesNjxNZr6Y
 2KmbwfM/+GatztuATVhbGCvqRleLq4J6Bv+Hy3PXGX2rjsuz88WdUN8jM/90/uFtM2XBXBfDVUX
 Usf6a8C0LamFKVYUrhh9z4H/ZOpOYVQ/cBx+fo1CDYkQdq6zAJgY9qgXXDeD7vqPx/NudOuCMSk
 o6ecp+y7ETVJgNV7papPra1XyKDxIWpRAVYYW1REua8vYvZCHwnDiCzmWczKEAmwlno43tGPwUD
 qgY7NKCNIx29dpeIMvMxiHQfFc32OgE2ZT/UsYyo2eax1DZd5tO73YSWJjBKF1Xdu+YDl9Wc139
 YWe2gqnL4/C5x4i9V1v+gDQTSfa+cc7l43zYlXFmK9yzTKhBQSQ86b0xOHS2A7Afo4wdCoZFgD4
 KpzRksTZOR8kTMGyFp0NbKjfS0eJWMRJWyD8vNIRpaHgMoO1Fetyx2rNRn0fjE3740RFz4yZoy9
 tINkTfdNb/TOa4itJkWKn6AB5ZYMsjrMyrwK/tQzrLp3qDVvJ7nrUV0/oFCThSuw29r2m8Dvn4M
 AjbeiDKYy+18X7MOd05gi4olFpO6GM2/NCViDZYhhAVG9rmTUBqJJrk5t9go5O0N3TWwd4U0QPn
 VxAxQzvB4xLXVG96+sCWsw1hksU9Z3frCeCXhSO85Wy5tHlevgGw=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_132838_561214_62E86502 
X-CRM114-Status: GOOD (  16.54  )
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

A simple MFD driver will instantiate independent clock, reset and hwlock
drivers.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

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
 .../bindings/soc/zte/zte,zx297520v3-matrixcrm.yaml | 178 +++++++++++++++++++++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  37 +++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |  10 ++
 3 files changed, 225 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-matrixcrm.yaml b/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-matrixcrm.yaml
new file mode 100644
index 000000000000..90224ee35703
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-matrixcrm.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/zte/zte,zx297520v3-matrixcrm.yaml#
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
+  as the fixed 26 MHz and 32 KHz oscillators found on this board.
+
+  This controller also contains hardware mutex registers for synchronization
+  with different processors on this board.
+
+  All available clocks are defined as preprocessor macros in the
+  'dt-bindings/clock/zte,zx297520v3-clk.h' header. Resets are defined in the
+  'dt-bindings/reset/zte,zx297520v3-reset.h' header.
+
+properties:
+  compatible:
+    items:
+      - const: zte,zx297520v3-matrixcrm
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 26 MHz external oscillator
+      - description: 32 KHz external oscillator
+      - description: Main PLL output from topcrm (usually 624 MHz)
+      - description: Main PLL subdivision factor 2
+      - description: Main PLL subdivision factor 3
+      - description: Main PLL subdivision factor 4
+      - description: Main PLL subdivision factor 5
+      - description: Main PLL subdivision factor 6
+      - description: Main PLL subdivision factor 8
+      - description: Main PLL subdivision factor 12
+      - description: Main PLL subdivision factor 16
+      - description: Main PLL subdivision factor 26
+      - description: Upll output from topcrm (Usually 480 MHz)
+      - description: Upll subdivision factor 2
+      - description: Upll subdivision factor 3
+      - description: Upll subdivision factor 4
+      - description: Upll subdivision factor 5
+      - description: Upll subdivision factor 6
+      - description: Upll subdivision factor 8
+      - description: Upll subdivision factor 12
+      - description: Upll subdivision factor 16
+      - description: Dpll output from topcrm (usually 492.88 MHz)
+      - description: Dpll subdivision factor 2
+      - description: Dpll subdivision factor 3
+      - description: Dpll subdivision factor 4
+      - description: Dpll subdivision factor 5
+      - description: Dpll subdivision factor 6
+      - description: Dpll subdivision factor 8
+      - description: Dpll subdivision factor 12
+      - description: Dpll subdivision factor 16
+      - description: Gpll output from topcrm (usually 200 MHz)
+      - description: Gpll subdivision factor 2
+      - description: Gpll subdivision factor 3
+      - description: Gpll subdivision factor 4
+      - description: Gpll subdivision factor 5
+      - description: Gpll subdivision factor 6
+      - description: Gpll subdivision factor 8
+      - description: Gpll subdivision factor 12
+      - description: Gpll subdivision factor 16
+
+  clock-names:
+    items:
+      - const: osc26m
+      - const: osc32k
+      - const: mpll
+      - const: mpll_d2
+      - const: mpll_d3
+      - const: mpll_d4
+      - const: mpll_d5
+      - const: mpll_d6
+      - const: mpll_d8
+      - const: mpll_d12
+      - const: mpll_d16
+      - const: mpll_d26
+      - const: upll
+      - const: upll_d2
+      - const: upll_d3
+      - const: upll_d4
+      - const: upll_d5
+      - const: upll_d6
+      - const: upll_d8
+      - const: upll_d12
+      - const: upll_d16
+      - const: dpll
+      - const: dpll_d2
+      - const: dpll_d3
+      - const: dpll_d4
+      - const: dpll_d5
+      - const: dpll_d6
+      - const: dpll_d8
+      - const: dpll_d12
+      - const: dpll_d16
+      - const: gpll
+      - const: gpll_d2
+      - const: gpll_d3
+      - const: gpll_d4
+      - const: gpll_d5
+      - const: gpll_d6
+      - const: gpll_d8
+      - const: gpll_d12
+      - const: gpll_d16
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
+  - '#clock-cells'
+  - "#hwlock-cells"
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
+
+    clock-controller@1306000 {
+        compatible = "zte,zx297520v3-matrixcrm", "syscon";
+        reg = <0x01306000 0x400>;
+        clocks = <&osc26m>, <&osc32k>,
+                 <&topcrm ZX297520V3_MPLL>, <&topcrm ZX297520V3_MPLL_D2>,
+                 <&topcrm ZX297520V3_MPLL_D3>, <&topcrm ZX297520V3_MPLL_D4>,
+                 <&topcrm ZX297520V3_MPLL_D5>, <&topcrm ZX297520V3_MPLL_D6>,
+                 <&topcrm ZX297520V3_MPLL_D8>, <&topcrm ZX297520V3_MPLL_D12>,
+                 <&topcrm ZX297520V3_MPLL_D16>, <&topcrm ZX297520V3_MPLL_D26>,
+                 <&topcrm ZX297520V3_UPLL>, <&topcrm ZX297520V3_UPLL_D2>,
+                 <&topcrm ZX297520V3_UPLL_D3>, <&topcrm ZX297520V3_UPLL_D4>,
+                 <&topcrm ZX297520V3_UPLL_D5>, <&topcrm ZX297520V3_UPLL_D6>,
+                 <&topcrm ZX297520V3_UPLL_D8>, <&topcrm ZX297520V3_UPLL_D12>,
+                 <&topcrm ZX297520V3_UPLL_D16>,
+                 <&topcrm ZX297520V3_DPLL>, <&topcrm ZX297520V3_DPLL_D2>,
+                 <&topcrm ZX297520V3_DPLL_D3>, <&topcrm ZX297520V3_DPLL_D4>,
+                 <&topcrm ZX297520V3_DPLL_D5>, <&topcrm ZX297520V3_DPLL_D6>,
+                 <&topcrm ZX297520V3_DPLL_D8>, <&topcrm ZX297520V3_DPLL_D12>,
+                 <&topcrm ZX297520V3_DPLL_D16>,
+                 <&topcrm ZX297520V3_GPLL>, <&topcrm ZX297520V3_GPLL_D2>,
+                 <&topcrm ZX297520V3_GPLL_D3>, <&topcrm ZX297520V3_GPLL_D4>,
+                 <&topcrm ZX297520V3_GPLL_D5>, <&topcrm ZX297520V3_GPLL_D6>,
+                 <&topcrm ZX297520V3_GPLL_D8>, <&topcrm ZX297520V3_GPLL_D12>,
+                 <&topcrm ZX297520V3_GPLL_D16>;
+        clock-names = "osc26m", "osc32k", "mpll", "mpll_d2", "mpll_d3",
+                      "mpll_d4", "mpll_d5", "mpll_d6", "mpll_d8", "mpll_d12",
+                      "mpll_d16", "mpll_d26", "upll", "upll_d2", "upll_d3",
+                      "upll_d4", "upll_d5", "upll_d6", "upll_d8", "upll_d12",
+                      "upll_d16", "dpll", "dpll_d2", "dpll_d3", "dpll_d4",
+                      "dpll_d5", "dpll_d6", "dpll_d8", "dpll_d12", "dpll_d16",
+                      "gpll", "gpll_d2", "gpll_d3", "gpll_d4", "gpll_d5",
+                      "gpll_d6", "gpll_d8", "gpll_d12", "gpll_d16";
+        #clock-cells = <1>;
+        #hwlock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index de1c08b6a5a9..8a6aa456a708 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -94,4 +94,41 @@
 #define ZX297520V3_HSIC_WCLK			86
 #define ZX297520V3_HSIC_PCLK			87
 
+#define ZX297520V3_CPU_WCLK			1
+#define ZX297520V3_CPU_PCLK			2
+#define ZX297520V3_ZSP_WCLK			3
+#define ZX297520V3_EDCP_WCLK			4
+#define ZX297520V3_EDCP_PCLK			5
+#define ZX297520V3_SD0_WCLK			6
+#define ZX297520V3_SD0_PCLK			7
+#define ZX297520V3_SD0_CDET			8
+#define ZX297520V3_SD1_WCLK			9
+#define ZX297520V3_SD1_PCLK			10
+#define ZX297520V3_SD1_CDET			11
+#define ZX297520V3_NAND_WCLK			12
+#define ZX297520V3_NAND_PCLK			13
+#define ZX297520V3_DMA_PCLK			14
+#define ZX297520V3_MBOX_PCLK			15
+#define ZX297520V3_PDCFG_WCLK			16
+#define ZX297520V3_PDCFG_PCLK			17
+#define ZX297520V3_SSC_WCLK			18
+#define ZX297520V3_SSC_PCLK			19
+#define ZX297520V3_GMAC_WCLK			20
+#define ZX297520V3_GMAC_PCLK			21
+#define ZX297520V3_GMAC_AHB			22
+#define ZX297520V3_VOU_WCLK			23
+#define ZX297520V3_VOU_PCLK			24
+#define ZX297520V3_LSP_MPLL_D5_WCLK		25
+#define ZX297520V3_LSP_MPLL_D4_WCLK		26
+#define ZX297520V3_LSP_MPLL_D6_WCLK		27
+#define ZX297520V3_LSP_MPLL_D8_WCLK		28
+#define ZX297520V3_LSP_MPLL_D12_WCLK		29
+#define ZX297520V3_LSP_OSC26M_WCLK		30
+#define ZX297520V3_LSP_OSC32K_WCLK		31
+#define ZX297520V3_LSP_PCLK			32
+#define ZX297520V3_LSP_TDM_WCLK			33
+#define ZX297520V3_LSP_DPLL_D4_WCLK		34
+#define ZX297520V3_SRAM0_PCLK			35
+#define ZX297520V3_GSM_CFG_PCLK			36
+
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
index 43db72bb59de..81ffc8bc34c5 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -29,4 +29,14 @@
 #define ZX297520V3_HSIC_PHY_RESET		20
 #define ZX297520V3_HSIC_RESET			21
 
+#define ZX297520V3_CPU_RESET			0
+#define ZX297520V3_EDCP_RESET			1
+#define ZX297520V3_SD0_RESET			2
+#define ZX297520V3_SD1_RESET			3
+#define ZX297520V3_NAND_RESET			4
+#define ZX297520V3_PDCFG_RESET			5
+#define ZX297520V3_SSC_RESET			6
+#define ZX297520V3_GMAC_RESET			7
+#define ZX297520V3_VOU_RESET			8
+
 #endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.54.0



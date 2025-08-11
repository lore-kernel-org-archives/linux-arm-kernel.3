Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92C8CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 16:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1opvmD5Gf0O7HnczCsyP5v9V35Vbg6CWzWpnJdyIB0=; b=OfbXvZD/9SMmYnsr349WVfbbT3
	s01GMk1s5O9RXOT22GwuOHHO3Q60osKASxanJRIhBTaQ8kH+O3LTAkq18QIWPaAkImZa9ApqwccBU
	NgkfxCaZIqN5CNDzznalGlEgOr4p7ldzDlbvuvpEEcptZ1f3cnDHxk86wuZQsPiJRV8zgqZJ92EGe
	bD6pGGH4r9Ayzb0tFXetZF4CjMx3zLqSpMtCFywA/PmGW0rsQ6bogEapK9K76192s3rrn6Qz3pYjl
	31XO+8bG6YRCu+6RwnfVZuz6YP3ksv/eR6ibGiiF0KyrnDKUKF+FT6oqEOot8b31E8ujbyurUIU44
	AiSOSolQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulVnt-00000008Tna-3nDE;
	Mon, 11 Aug 2025 16:55:21 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTlu-000000084ye-18Wn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 14:45:11 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-af96fba3b37so832347566b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 07:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754923509; x=1755528309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1opvmD5Gf0O7HnczCsyP5v9V35Vbg6CWzWpnJdyIB0=;
        b=S15kgiCsDfwX8NL6nfIebUC3HIPAwyQ32zSUk3HqB6kS9zox3RfDS4ULtB/TZrMTve
         ZC3t4lorcicDbOD9SgnOKwHvPU6E8/UeTMP1JVZ5i04H42ld8KgbumY4xyhfbDkS6fnp
         3DkfMuV+2E+ZZh32Gtjx4Zda29HkAYG9fjW6el6TMkoXYTSVEVJTGAjmQMv+VUQMDVep
         UhFk+62A0dCaClEWyt6VDa09v5Fx5nut1mF7E/galpuiyEXdZuK56jmo7PS1CnD3WXrD
         elSkZva1McsKuut972HpgnNK7bbMzjcF0WtLzCRlOqgogYg5lRTFlCVFME3IKSp9F4mm
         +WgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754923509; x=1755528309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1opvmD5Gf0O7HnczCsyP5v9V35Vbg6CWzWpnJdyIB0=;
        b=srceCxgWT8ZnxyAoSHUBco/MKD2YJskiLznnjfU5Isj4P/fA1X9BOmfZKcQianDdqN
         RkfbLXZxgxOnBrykyXhLtgvUjdFzRPbnDdDsV78OQ3Ms7Up2MN5WTf5ptNyYdYWTfJay
         ITPV6bD102X4NN+wcqQCCdtMnFOKuJ1grfZhba1B++f3/xFfAdbyL+1aNlgS8GE51kXl
         xHy27nU/KBffEurrFEntqWkyqL9XuHdnrmkovEYGdabk5skX4ttN8NgNQ6s3ORjRMusC
         Eb660loNFg6N2AsJCbo6EFBAUPaOuzDgtP6AuxdVf1B37XF85qO2fnLl5CNKFslbwa4o
         w9Sw==
X-Forwarded-Encrypted: i=1; AJvYcCURV8OErh6wm2p4enwQtz9eYGYfr8K+40/PA9H+AFQwbHpgmZpO8xqOhHw2kmkzuhEkl2FxHMKCqt7fmyMoAbhe@lists.infradead.org
X-Gm-Message-State: AOJu0YzeULwTBWFaEhrUuRc48kNtK62FsWhjy5Qi1IaQYBfe9YGbsnyD
	si2/owqucV7FSQgtkTD2yR/8uFN7D9fqwV69oDtFrayZTznX9Uyvu3kIo61IgNvpCJQ=
X-Gm-Gg: ASbGnct3QSVRXghyw686kRkSJ9uJW85XDDj656X5KbpOPqo9fVkQQ01dguogVv3/xES
	j3jLQMnt71qlMawNtZZNuowaIoJ1gTq6QL5pVijiWZBmnJWJHNhccn7hmkY47LrNQAwTu8mUzAr
	EIdkJo9K9FDudvOZ4rmxNY7ZWBnxGzN8Syag5ky8pM4bRY7gfXoIiWJ1GmFnzh69w6MjvywinSM
	mf33Wjn0ycPB7FtH7QDwXnvQE5KMpzuWTa9kjjDyPfjmvzprgttGkyqv221lMoFJvTnKC/2pTfX
	FsvM/UUlRpOf0Y/Y6NbKBkJ4Lri/JkGkl9USJNRiHGxLylGVmxb10vmVUL6GXhbCSvUAcm2kKix
	oQdmywKz9KYKyPoHQKVvsJgCmrVDccd6EU2HKFYCbS7dRWAHRz2/zm+d5G2F0vj55Hw==
X-Google-Smtp-Source: AGHT+IGnbODAKC0QhobAqDzUSNdh1Q7avIaZAEjyMZjxOFUSbgZxhg+kWhsqIK/Yr8CBAFklngPMcQ==
X-Received: by 2002:a17:907:3e1b:b0:af9:709f:970b with SMTP id a640c23a62f3a-af9c64b14bcmr1205314066b.46.1754923508614;
        Mon, 11 Aug 2025 07:45:08 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c157sm2040464466b.100.2025.08.11.07.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 07:45:07 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Broadcom STB pin controller
Date: Mon, 11 Aug 2025 16:46:51 +0200
Message-ID: <6fdbaf2bd0b72badbb5384e43b97bebcda4cc2f0.1754922935.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1754922935.git.andrea.porta@suse.com>
References: <cover.1754922935.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_074510_319092_5FF5EBCD 
X-CRM114-Status: GOOD (  15.92  )
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

From: "Ivan T. Ivanov" <iivanov@suse.de>

The STB pin controller represents a family whose silicon instances
are found e.g. on BCM2712 SoC.

In particular, on RaspberryPi 5, there are two separate instantiations
of the same IP block which differ in the number of pins that are
associated and the pinmux functions for each of those pins. The
-aon- variant stands for 'Always On'.

Depending on the revision of the BCM2712 (CO or D0), the pin
controller instance has slight differences in the register layout.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
new file mode 100644
index 000000000000..28d66336aa2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm2712c0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom STB family pin controller
+
+maintainers:
+  - Ivan T. Ivanov <iivanov@suse.de>
+  - A. della Porta <andrea.porta@suse.com>
+
+description:
+  Broadcom's STB family of memory-mapped pin controllers.
+  This includes the pin controllers inside the BCM2712 SoC which
+  are instances of the STB family and has two silicon variants,
+  C0 and D0, which differs slightly in terms of registers layout.
+  The -aon- (Always On) variant is the same IP block but differs
+  in the number of pins that are associated and the pinmux functions
+  for each of those pins.
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2712c0-pinctrl
+      - brcm,bcm2712c0-aon-pinctrl
+      - brcm,bcm2712d0-pinctrl
+      - brcm,bcm2712d0-aon-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-state$':
+    oneOf:
+      - $ref: '#/$defs/brcmstb-pinctrl-state'
+      - patternProperties:
+          '-pins$':
+            $ref: '#/$defs/brcmstb-pinctrl-state'
+        additionalProperties: false
+
+$defs:
+  brcmstb-pinctrl-state:
+    allOf:
+      - $ref: pincfg-node.yaml#
+      - $ref: pinmux-node.yaml#
+
+    description:
+      Pin controller client devices use pin configuration subnodes (children
+      and grandchildren) for desired pin configuration.
+      Client device subnodes use below standard properties.
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode (either this or "groups" must be specified).
+        items:
+          pattern: '^((aon_)?s?gpio[0-6]?[0-9])|(emmc_(clk|cmd|dat[0-7]|ds))$'
+
+      function:
+        enum: [ gpio, alt1, alt2, alt3, alt4, alt5, alt6, alt7, alt8,
+                aon_cpu_standbyb, aon_fp_4sec_resetb, aon_gpclk, aon_pwm,
+                arm_jtag, aud_fs_clk0, avs_pmu_bsc, bsc_m0, bsc_m1, bsc_m2,
+                bsc_m3, clk_observe, ctl_hdmi_5v, enet0, enet0_mii, enet0_rgmii,
+                ext_sc_clk, fl0, fl1, gpclk0, gpclk1, gpclk2, hdmi_tx0_auto_i2c,
+                hdmi_tx0_bsc, hdmi_tx1_auto_i2c, hdmi_tx1_bsc, i2s_in, i2s_out,
+                ir_in, mtsif, mtsif_alt, mtsif_alt1, pdm, pkt, pm_led_out, sc0,
+                sd0, sd2, sd_card_a, sd_card_b, sd_card_c, sd_card_d, sd_card_e,
+                sd_card_f, sd_card_g, spdif_out, spi_m, spi_s, sr_edm_sense, te0,
+                te1, tsio, uart0, uart1, uart2, usb_pwr, usb_vbus, uui, vc_i2c0,
+                vc_i2c3, vc_i2c4, vc_i2c5, vc_i2csl, vc_pcm, vc_pwm0, vc_pwm1,
+                vc_spi0, vc_spi3, vc_spi4, vc_spi5, vc_uart0, vc_uart2, vc_uart3,
+                vc_uart4 ]
+
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+      bias-disable: true
+      bias-pull-down: true
+      bias-pull-up: true
+
+    required:
+      - pins
+
+    if:
+      properties:
+        pins:
+          not:
+            contains:
+              pattern: "^emmc_(clk|cmd|dat[0-7]|ds)$"
+    then:
+      required:
+        - function
+    else:
+      properties:
+        function: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    brcm_pinctrl: pinctrl@7d504100 {
+        compatible = "brcm,bcm2712c0-pinctrl";
+        reg = <0x7d504100 0x30>;
+
+        bt-shutdown-default-state {
+           function = "gpio";
+           pins = "gpio29";
+        };
+
+        uarta-default-state {
+            rts-tx-pins {
+                function = "uart0";
+                pins = "gpio24", "gpio26";
+                bias-disable;
+            };
+
+            cts-rx-pins {
+                function = "uart0";
+                pins = "gpio25", "gpio27";
+                bias-pull-up;
+            };
+        };
+    };
-- 
2.35.3



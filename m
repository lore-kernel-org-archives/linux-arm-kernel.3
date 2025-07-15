Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740B2C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Rz/CvVx0suUCLwJLQjKC4luh7DN8eMsyJIC67bj00g=; b=MejQw2fDzBHuAoz2UlOc3Cbqzx
	UGFQuQlB3R2+QZtISXvBxHXBUpOh5Loy9fDywD3Kf6JY5FzdI7x0XX/mYGP2nSQ2dmxxDSSy6B712
	j3EH2JXuTgXaDNS+seJkkw2nZnO1J8uPIlsMBAIHzKC4xwq93S41IbTXpfzlsiM5CycSd32hQAxcA
	abkaJ+Lco89c+febPTy2rPJG72hCoF/buZnEKBUbpgpIpZq12ICUx/F7Ulw3gLvoqKxefuqOF3jFQ
	CImKuxgTTVipTCXJUcTyu5tKyahkKzWj3DhOX15LIvDUryDaduMfpeBbdDOI+Kh+s2XcsaXBy4cyk
	SdL67AKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublCC-000000062bW-1d1W;
	Tue, 15 Jul 2025 19:20:08 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubkPm-00000005u7v-1YBo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 18:30:07 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so1003938366b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 11:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752604205; x=1753209005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Rz/CvVx0suUCLwJLQjKC4luh7DN8eMsyJIC67bj00g=;
        b=Thr3tIhNxFElak/RCHISoK98AgGs2o2i1nqlhQH1SPP6Bz+VMSQ1U/+F4JyUTnPsM3
         6ollJ2NNParu5XtaFuWjqEhczhpVAkFaDKKDy842gyJChbOkh2qP07qVT0lzj1AmkQ5D
         FjERusvZ7ocbw5KvTHTtSgHgOwUbUkMbtbiWFisTCPivnTBNlsjheHSTQ48YsV9GE1sE
         uYdifm2vcfOCEcA1D97S6yDFcqWcieRYsu671znj8vNuKEGlJXM/+6pinUsv7InmbXR6
         eZB2jyj0ycLu5o2NflZc7f7PsYlFzA5UXtqlkPYzUdO1ul/Zd6AdcckJuiccnxEbjhmK
         hltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604205; x=1753209005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Rz/CvVx0suUCLwJLQjKC4luh7DN8eMsyJIC67bj00g=;
        b=cJSYATnbVR1dA1CLcnUOd2urXi1cWVkJvhhpQ16riZD4ehTBYHBsyc8nPuwLJkUCXL
         i4f1YBbvQ4VNHCU4t+E8q2EqZ+FOIPhWG5mi2UiebsJljrYlVY/ma0NA09Epqd9yoX2e
         u6c9o6R1z+FB4wvgn+qOgz++NzHfZzBdVx5MtiP4tC13GV4TSeuUutuH+UoFUYfVJx33
         twlhzHle/wUkdaPO2Sr6A9McTRmzsyBzv0AT4iV7e6gPEl6KViYTG+inO5dlgGDfKWNm
         1PvKUAW1lJZze29+09MEOcfif/O6isV+3a39HnOEZOtUoLOjewVxwgiAMA7BYgvroFtl
         WcDw==
X-Forwarded-Encrypted: i=1; AJvYcCX9xeIT6O2j/4oNji2c1/JGuO5qUbSqo27DokeIO4om7EAPs+ZQgGdgQXb1T/B7TPRwSm8cAHPdje83/pU8Tyyn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2zY5grczNp11OHGd3aIsXAwvzwyrV9NTx9k6a0P8WsLOBCQjj
	NvKIHDNvA1W0c/oTeg36xc4m+cMgv0B4/PN0DDU1McyCy2dUZFoHgatQpqY1iaU5LFc=
X-Gm-Gg: ASbGncubdMXkNdilK0frKeO5RXUYIRbDhCfX+LaEZKMCl1zrlaExgtQujl407psTynJ
	suI6MCsNo5J23x897OZtGcxXaGBsU3kDZOGk6Oy4JglHoHdnEx8rQPmrYU8BGtn3IDNaf8gq5mA
	CPuAU+m9BxCC5/A10PSXeZMuSdm2lGmXMWXpptyiCYL0zcl6XzhhK8AvAMLo98q+u6f3Ji587Bs
	wltJIfeETDEG1TcvcQANBIpCdm/QkRJVhWzI1CfoixRPXdP6+knGHe7JFfuIVYvE7WQpYq17TPB
	zK6u5KXOtVazHE18X0BsDO6mJ/vdMhU3GVwPgP9x10EooacwOQ7My4VYnv/vmesnjHkVmpyxfCX
	vsMyuCZV6QmWlJ8sKnAdFWK/erxL2QAObeest+OWRR6kf/WOVvaPS5V8qqvORY69bYPsx
X-Google-Smtp-Source: AGHT+IF8ZBRa+AsJx7J92AOAyQE64jiGuu5X5WepNm19TkULb1JDRA5w4ABacxi9u/62Q4LV5Rd0bA==
X-Received: by 2002:a17:906:7308:b0:ae0:67b4:991d with SMTP id a640c23a62f3a-ae9c9b1fccbmr48071666b.35.1752604204645;
        Tue, 15 Jul 2025 11:30:04 -0700 (PDT)
Received: from localhost (host-79-47-155-191.retail.telecomitalia.it. [79.47.155.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e826651csm1043690566b.101.2025.07.15.11.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:30:04 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
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
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 1/7] dt-bindings: pinctrl: Add support for Broadcom STB pin controller
Date: Tue, 15 Jul 2025 20:31:38 +0200
Message-ID: <97c650c9967c0c3381c383dfe68bbe6966912604.1752584387.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1752584387.git.andrea.porta@suse.com>
References: <cover.1752584387.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_113006_425438_CA5844DA 
X-CRM114-Status: GOOD (  15.97  )
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
This patch is based on linux-next/master

 .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
new file mode 100644
index 000000000000..467a9362dbf8
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,brcmstb-pinctrl.yaml#
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
+      - function
+      - pins
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



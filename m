Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C3CC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBz+6uZRhAuIyPnfIHCkIx6hrzv/9myk5UkNLISEK7M=; b=nk3lyXAh3qKKSf2WvO8M9psaq8
	kpaQiFLb06cwBUpj2DV8A50k7tMTfpDVA6fZX4WFgTIXOEAJ/ky2VMx8v9EUDfnlmxt53VEn8YnRk
	pRlV82hGAjIAU8sQz6Hyy7nE9c6tlHnH5SNbfR6RTt90FTT4aXB1yc8zJBKqz7JnRL/m+8fOMtpaf
	fK5JtGoUtl1usmJMBNwFS+V8+MRa7Ohiq/Yv9/66w3598Ll3ziMWYYoq48W//zwsDE+UdIvFQV7I3
	7S5+bbYXjaIdsEZTB38ZfJ2vveVb1VHTbugpu97QpjQW/Y04nW/EBdrBJrZ8wviG2f22U9NBsmm9a
	KTLpFSlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgNd-00000002SN6-3B5I;
	Thu, 28 Aug 2025 17:25:45 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urc0m-00000001bk2-1OlD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 12:45:53 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-afcb73394b4so129245466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756385151; x=1756989951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBz+6uZRhAuIyPnfIHCkIx6hrzv/9myk5UkNLISEK7M=;
        b=OImafQdX0PRpv/n72/9BCX42eUFHPwN2EyhKhXpkgqFPm00yqWU+HwoZdo0nLDWIiQ
         8lLpLs41tkhEOZwkRf1osP9gokAJ4pTN4EXhXnLROlE1J43ogmUKtH4ySabPRDcmmJ5Y
         3toLckprO6sMBqyr5GTn0dSwQBycqBXlgHUGJPXnYPdsXM0LSoohREk0dICIMLs9LnJd
         OrgHdE1ko2sm+y3FX06ggBum8iyvZR/AxKdkDD8K4tchbX1vF9g88WHIM7Ow1XZzkjRI
         d93BfbVX4JDIVPKLa5KCeYjosCY5u4n9fm3F6Y1T5YAyLZ5i9LzcqciqyNlglnQgFCzX
         nChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756385151; x=1756989951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBz+6uZRhAuIyPnfIHCkIx6hrzv/9myk5UkNLISEK7M=;
        b=PhZ4STWkOxkdixYaHBFzav3aHwKn8jH/cwGachHJ5FF6rxeARotaC4DZoZ+krAkYlQ
         AAo49MiLBiVF0YaVTnwD3AzimatD+9LqxYDFoqxnWAMtADidFju9xoefSk0SualYtnPW
         9HBKDIg53gBFo48tpyY2w6Wv716jgUDn95j9kOwsqYnsZu8WENJkmzQFFIXFF5fwL9Ga
         kXAJ7HGQN/tNB1+Ce7AujQuWoqrhmI+NpDQvGU0/hTRtdMtVOLz5cyqfbaxWV79ZG3b0
         shviar9icUcLa337nL1T53uoxNY3snXam5kAAXPxyrWnmrcESk0XiT2mB2WT8Rs4vpJb
         qemQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1sF6jBohVkO/UWnKLBCxzmWvwCkTJo2E5XoIoFloRJ3hhe9Z15SWdBm9aI9ILSwsACB93F12+67VyyvZdYWnd@lists.infradead.org
X-Gm-Message-State: AOJu0YxK2sffCk5qCPMtHFnHqQTSCTXqwoAQzLmOqmWuSNf+gUZzMHpV
	l8kurz/+b6j8adzZ+clKuT3ruDxjA9CesEdsg4h1uxU9lGZGruAxbiB9gsYBT+jc6xo=
X-Gm-Gg: ASbGnct40WlhypHURTg/64eTPPj9lFyjAJLDN0bu8pI5m33iLM+ooAfTHmEWa2vUQHZ
	fMk+lo61Sov4uGWYG2GF7FIp0fn+BziNYnIjMr7DBIeNAtMFQiA39lKMXIA4rabbTJCG2uk57gW
	C5MTUxSwIzXd/QXXvzMgoPBiCGEPdIHdJ5o6dXwDsP5Qu92rK3j/8lJ2+ocg31mDzvUOBggUusX
	GYyQSuGdp2pspTR0bA0MCSUG9+4lLlPvwj+a+/pHbXwqglMEWT/1yrbMyHdNDJEHwPwUIzV7L+h
	s9HryS2Q+UpRFmZUmrbtryR0EfvAK9l15YuljfiQKMRzAptpJXizcHRuRUbEIo2/ntO23SvYJxg
	uj/tCcJnm9MhmFgkXgtUq/HcYXTF354Zg1Yd5K0kxqlTJi8dx1hmWYqjSst30md+mlAYf8poGae
	dEsO6/RIiaXbz8T0m5jCjbxhXQW9g=
X-Google-Smtp-Source: AGHT+IGPdnslhHtWwDXi8CWf0WUgTci6zKmKHxIJAPlEjB/fI84WomFtAqz/+4k3SGbnuYIM9OOe/w==
X-Received: by 2002:a17:907:3d91:b0:afe:8bee:fdb9 with SMTP id a640c23a62f3a-afe8beefe3dmr1180328466b.28.1756385150607;
        Thu, 28 Aug 2025 05:45:50 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afedaa774d1sm186721966b.89.2025.08.28.05.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:45:50 -0700 (PDT)
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
Subject: [PATCH v4 1/3] dt-bindings: pinctrl: Add support for Broadcom STB pin controller
Date: Thu, 28 Aug 2025 14:47:38 +0200
Message-ID: <7ed0f2779829f4e63b69d8cf5cedda9f849996bc.1756372805.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756372805.git.andrea.porta@suse.com>
References: <cover.1756372805.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_054552_373479_A0F8BB5D 
X-CRM114-Status: GOOD (  16.09  )
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
 .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
new file mode 100644
index 000000000000..1e5d5234ee8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
@@ -0,0 +1,137 @@
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
+description: >
+  Broadcom's STB family of memory-mapped pin controllers.
+
+  This includes the pin controllers inside the BCM2712 SoC which
+  are instances of the STB family and has two silicon variants,
+  C0 and D0, which differs slightly in terms of registers layout.
+
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
+    description: >
+      Pin controller client devices use pin configuration subnodes (children
+      and grandchildren) for desired pin configuration.
+
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
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
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



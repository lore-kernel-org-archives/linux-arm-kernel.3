Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A9ECA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H1WTmhyLHKhOqWu61NpTR/qh7tvb+QfQ7sfdNN6kkjI=; b=tZs4bLxxrvu1d7LbtvsWLIF7vQ
	0E65GjHnzaSiL1w2hdgWiBn7b/iuecPQ+q3n+63P+CbVf2EaPitF2hpglI2FOPLRDQcBQw0foCRTc
	NxZ7LgOOpcaOoZby9CvvakG3wQL+syOf+cbQ+oQvW+RiXnBiynKpr9Yk+sBJl/WI1jHgwVn+uq/DM
	1AlgOmBkIxVzwurMQ956kohNN0hCrh38XrMm7VowE1PNL/IPzdqdsWYPRdsjtQtRhD0fZbfdG3IOD
	Kh2e4CvFYVBcQ5CY3oc3Ad8sZFhr+/Dt3PsuSUhEYrRfApok7Vsn/SWQDNUAVemsBgwLkuX0FTNBO
	mcCr0agA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE7Z-000000010Xd-0VpP;
	Mon, 28 Sep 2026 16:22:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE7R-000000010UT-0DfW;
	Mon, 28 Sep 2026 16:22:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9454C406DF;
	Mon, 28 Sep 2026 16:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF7381F000FF;
	Mon, 28 Sep 2026 16:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790612539;
	bh=H1WTmhyLHKhOqWu61NpTR/qh7tvb+QfQ7sfdNN6kkjI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Xj+KoD+IfywWzjwLaCyyNCG1EpffnGlD5ybfFCqt6bjTkBupcVGdWGXmAuI1fhXM3
	 NuQO85NvvdPuOW6r6UCJy50+27loUOBhKIxKH0eXI8UGPjjpVGr6Xz/FFu0TMtFeTY
	 kfonwOYrgRIezYbHpS8JVbQs/+sjVENmk3t1U8jJHKILpIWngJlyBplNR8parKzR1B
	 f9TOl5ytSYo6bdOtvowpevGh4GawshPX5oAnHD7ai8Wn3u1ezEr7piWqxlHBOUbmr7
	 6OQaN5DBydJrrYb/+cBOdsWY76ZAL+LmmMV2R+Ze3T5QWkio7VECidwO25RW1w/WOp
	 dbWTFYNAzopjg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 28 Sep 2026 18:22:01 +0200
Subject: [PATCH 1/6] dt-bindings: display: Add panel-mipi-dsi-bpf generic
 panel binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-drm-mipi-dsi-panel-ebpf-v1-1-5244926aace4@kernel.org>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
In-Reply-To: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Albert Esteve <aesteve@redhat.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Maxime Ripard <mripard@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6464; i=mripard@kernel.org;
 h=from:subject:message-id; bh=pDWOGFyWouNEZF+awmHlMPjXiLztfhV7MDBC8hfwm9s=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm7phgynmh8rHeV/dbtWULc6sKvNtVMj85q8DX3e7nMo
 rM7UP1Zx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjItDLGOrXdlkKPRfss7MMv
 H5JPDeeeISB3aZFYVM9D518sa2v324ZMnVa5VPRvtsEbg8CkHZEvGeu9F76fZrxRZzGz7rslT4M
 s5Gf9/d/zf2st258F+/gkJ98/8N5zmVKX7JdLkTyyifJW+7wA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Most MIPI-DSI panel drivers follow an identical pattern: acquire
regulators and GPIOs, perform a reset pulse with specific timing,
send a vendor-supplied sequence of DSI commands, then enable the
display. The only truly panel-specific part is the init sequence
and power-on/off timing.

The panel-mipi-dsi-bpf driver replaces per-panel kernel modules
with a single generic driver whose panel-specific behavior is
provided by BPF programs loaded from userspace at runtime,
following the HID-BPF model. This enables new panel support
without kernel patches.

Panel DT nodes use a two-entry compatible with the panel-specific
string first and "panel-mipi-dsi-bpf" as fallback. The generic
driver matches on the fallback, while the first compatible is used
to identify which BPF program to load.

Six normalized optional regulator supplies cover ~95% of existing
MIPI-DSI panels: vcc (IC core), iovcc (I/O interface), avdd/avee
(positive/negative analog), and elvdd/elvss (OLED EL driver).

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 .../bindings/display/panel/panel-mipi-dsi-bpf.yaml | 184 +++++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bpf.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bpf.yaml
new file mode 100644
index 000000000000..9a20a21cf70e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bpf.yaml
@@ -0,0 +1,184 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-mipi-dsi-bpf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic MIPI-DSI panel with BPF init sequences
+
+maintainers:
+  - Maxime Ripard <mripard@kernel.org>
+
+description: |
+  A generic MIPI-DSI panel driver where the panel-specific power sequencing
+  and DSI init commands are provided by BPF programs.
+
+  Panel DT nodes use a fallback compatible so the generic driver matches on
+  "panel-mipi-dsi-bpf" while the first compatible identifies the specific
+  panel for BPF program matching.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - description: Panel-specific compatible string
+      - const: panel-mipi-dsi-bpf
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  backlight: true
+  enable-gpios: true
+  height-mm: true
+  port: true
+  reset-gpios: true
+  rotation: true
+  width-mm: true
+
+  vcc-supply:
+    description: IC core supply, typically 2.8-3.3V (charge pump input)
+
+  iovcc-supply:
+    description: I/O interface supply, typically 1.8V (MIPI logic level)
+
+  avdd-supply:
+    description: Positive analog supply for source/gate driver, typically +5V
+
+  avee-supply:
+    description: Negative analog supply for source/gate driver, typically -5V
+
+  elvdd-supply:
+    description: OLED EL positive supply
+
+  elvss-supply:
+    description: OLED EL negative supply
+
+  dsi-lanes:
+    description: Number of DSI data lanes
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3, 4]
+    default: 4
+
+  mode-video:
+    type: boolean
+    description: Use DSI video mode (as opposed to command mode)
+
+  mode-video-burst:
+    type: boolean
+    description: Use DSI video burst mode
+
+  mode-lpm:
+    type: boolean
+    description: Use low-power mode for DSI commands
+
+  mode-no-eot:
+    type: boolean
+    description: Disable end-of-transmission packet
+
+  clock-non-continuous:
+    type: boolean
+    description: DSI clock is non-continuous
+
+  hs-rate:
+    description: Maximum lane frequency for high speed mode in hertz
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  lp-rate:
+    description: Maximum lane frequency for low power mode in hertz
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  panel-timing: true
+
+required:
+  - compatible
+  - reg
+  - panel-timing
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "elida,kd35t133", "panel-mipi-dsi-bpf";
+            reg = <0>;
+            backlight = <&backlight>;
+            vcc-supply = <&vcc3v3_lcd>;
+            iovcc-supply = <&vcc_1v8>;
+            reset-gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
+            dsi-lanes = <1>;
+            mode-video;
+            mode-video-burst;
+            mode-lpm;
+
+            width-mm = <42>;
+            height-mm = <82>;
+
+            panel-timing {
+                clock-frequency = <17000000>;
+                hactive = <320>;
+                vactive = <480>;
+                hfront-porch = <20>;
+                hsync-len = <4>;
+                hback-porch = <20>;
+                vfront-porch = <2>;
+                vsync-len = <1>;
+                vback-porch = <2>;
+            };
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+  - |
+    /* OLED panel using avdd/avee and elvdd/elvss supplies */
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "boe,bf060y8m-aj0", "panel-mipi-dsi-bpf";
+            reg = <0>;
+            vcc-supply = <&vreg_l14a>;
+            iovcc-supply = <&vreg_l12a>;
+            elvdd-supply = <&vreg_oled_pos>;
+            elvss-supply = <&vreg_oled_neg>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+            dsi-lanes = <4>;
+            mode-video;
+
+            panel-timing {
+                clock-frequency = <157000000>;
+                hactive = <1080>;
+                vactive = <2160>;
+                hfront-porch = <36>;
+                hsync-len = <4>;
+                hback-porch = <36>;
+                vfront-porch = <4>;
+                vsync-len = <4>;
+                vback-porch = <4>;
+            };
+
+            port {
+                oled_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.55.0



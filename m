Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BF3C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 15:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Mxqj7tI8Fq+5vvJ/cnDsgviJwR6FDko/OxHdwE/BjE=; b=jxX0Hx9Pttrr3b0dS9sYOFwWzu
	LUyHsnamMWTpiOupqiidwOSztbwfT6JHOFzaUSWmrgYvFx/3beLf73QdgjehtMgB3ZWkixDfrW9v6
	BUsH+aQE1Lt0ui/qDQT4GFRnVzvVee9F6C1b4p7ELlz2E81hjkGsD22ClAgrVr4hYgtrsjrFUmi/7
	zCMtp2BPk7PAFXGWvZ0DRc+Od2gJZH+9KUsVnfbk2lxn3PEOjHflAygJPPM71s5D6eL+M+xH274db
	RHI+JsferIeZ+0ZHlPj7XqzefJkBgNIMa/YytRmEJHSNzPlG8AL3W5gULQXwLlOplKANhCtSk/nS7
	hrN5ERhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLz7-00000005XdG-3272;
	Mon, 13 Jan 2025 15:04:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLoA-00000005U8f-3HZw;
	Mon, 13 Jan 2025 14:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736779969;
	bh=0JC99QuFWhgSwoUEWq8123uBQ/QxY29IUAiZXjoEuRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E94CEW2zexg/S/gCEifJfyGqOtcfQioFZ+YdNTUwsmVfZL/kMmIlaoa6K03XGiy7X
	 eEt4b9m0qr0+uL77b/EOt6rDyPl0yahfEgIzJpd0CG6IjrR+hAZFIiVCpNE8OQtvTk
	 uSTnZLWUV0Fb6hlTq0Z7o2MdSivs1IQZxT9a9cMHNA3dTJawxRCHkkn3j+KUbdfO37
	 EnSPQH+/zdub41qsogcLkvTHh05reD7OI2ZMCjkBP8rTCC6+Q+oxJXBOkMVIzpxxZE
	 Tv7mMQdlNCt3QiHUv/KAtSXjJctakdZsVuTOZAGNfJh45oOGde7+g0FEw3RxuoKpSz
	 jQxszSYCXrR/w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2447017E0FA6;
	Mon, 13 Jan 2025 15:52:48 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v5 08/34] dt-bindings: display: mediatek: Add binding for MT8195 HDMI-TX v2
Date: Mon, 13 Jan 2025 15:52:06 +0100
Message-ID: <20250113145232.227674-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_065250_963553_0C079803 
X-CRM114-Status: GOOD (  13.80  )
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

Add a binding for the HDMI TX v2 Encoder found in MediaTek MT8195
and MT8188 SoCs.

This fully supports the HDMI Specification 2.0b, hence it provides
support for 3D-HDMI, Polarity inversion, up to 16 bits Deep Color,
color spaces including RGB444, YCBCR420/422/444 (ITU601/ITU709) and
xvYCC, with output resolutions up to 3840x2160p@60Hz.

Moreover, it also supports HDCP 1.4 and 2.3, Variable Refresh Rate
(VRR) and Consumer Electronics Control (CEC).

This IP also includes support for HDMI Audio, including IEC60958
and IEC61937 SPDIF, 8-channel PCM, DSD, and other lossless audio
according to HDMI 2.0.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/mediatek,mt8195-hdmi.yaml        | 151 ++++++++++++++++++
 1 file changed, 151 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
new file mode 100644
index 000000000000..00528fd8755b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek HDMI-TX v2 Encoder
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+  - CK Hu <ck.hu@mediatek.com>
+
+description:
+  The MediaTek HDMI-TX v2 encoder can generate HDMI format data based on
+  the HDMI Specification 2.0b.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8188-hdmi-tx
+      - mediatek,mt8195-hdmi-tx
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: HDMI Peripheral Bus (APB) clock
+      - description: HDCP and HDMI_TOP clock
+      - description: HDCP and HDMI_TOP reference clock
+      - description: VPP HDMI Split clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: hdcp
+      - const: hdcp24m
+      - const: hdmi-split
+
+  i2c:
+    type: object
+    $ref: /schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
+    unevaluatedProperties: false
+    description: HDMI DDC I2C controller
+
+  phys:
+    maxItems: 1
+    description: PHY providing clocking TMDS and pixel to controller
+
+  phy-names:
+    items:
+      - const: hdmi
+
+  power-domains:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port, usually connected to the output port of a DPI
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port that must be connected either to the input port of
+          a HDMI connector node containing a ddc-i2c-bus, or to the input
+          port of an attached bridge chip, such as a SlimPort transmitter.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - phys
+  - phy-names
+  - ports
+
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8195-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        hdmi@1c300000 {
+            compatible = "mediatek,mt8195-hdmi-tx";
+            reg = <0 0x1c300000 0 0x1000>;
+            clocks = <&topckgen CLK_TOP_HDMI_APB>,
+                     <&topckgen CLK_TOP_HDCP>,
+                     <&topckgen CLK_TOP_HDCP_24M>,
+                     <&vppsys1 CLK_VPP1_VPP_SPLIT_HDMI>;
+            clock-names = "bus", "hdcp", "hdcp24m", "hdmi-split";
+            interrupts = <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH 0>;
+            phys = <&hdmi_phy>;
+            phy-names = "hdmi";
+            power-domains = <&spm MT8195_POWER_DOMAIN_HDMI_TX>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&hdmi_pins>;
+            #sound-dai-cells = <1>;
+
+            hdmitx_ddc: i2c {
+                compatible = "mediatek,mt8195-hdmi-ddc";
+                clocks = <&clk26m>;
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    hdmi_in: endpoint {
+                        remote-endpoint = <&dpi1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    hdmi_out: endpoint {
+                        remote-endpoint = <&hdmi_connector_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.47.0



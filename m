Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B4EC28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 13:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EmVWGVqGAI4TJUrJeI78GsI2NoWqQfInVXjGf3G+b4I=; b=lgXeLrYOLcXG1Lotm8SlB4LarU
	+N9ia9+0/Bv9UkELWsdaA6/PBqoi1N1U26yESWUw3I3j78pe+83U2SPZsowFcvysaCkc5ShRvYYNV
	XaufiTL9fxqP+3zJUPVlYJHWHZsy6OCkNERHXNg/XICnqauqNlH+s5JEvIgN2vtv5LaiL/wU84Ly1
	Alc4XwZj0hzyoeW3PPajgwnd4WhtQLjBl45+Tsc5QcATsHJ9JWjc0iIehnbU0eyQZ8Kj+BH8xERwW
	DwtlqDdqs/nEEP5XkJ2pERLnrL3prl6ifimfR3SmSD1+GBOoz3iOd1Opto/YjnW19V2nvEAnlffOm
	sVMdHqBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXOx-0000000EGLe-0M34;
	Fri, 07 Mar 2025 13:06:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqX8i-0000000EDqy-1PEh;
	Fri, 07 Mar 2025 12:49:21 +0000
X-UUID: 93ec8a6afb5211efa1e849db4cc18d44-20250307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EmVWGVqGAI4TJUrJeI78GsI2NoWqQfInVXjGf3G+b4I=;
	b=dxTsgkpSKvefllj9izOFuDNCb+INt1pwVEugG2lOhorqAPdhRZN0zzGENcB68Hz36WjXeTUzShHbQ63ktcR/eKHM0F6u7P1SUk19J0BcIKuRmSoB4hH2xSXpKqZqQnGLhe3Mo3UpbM49TcQn89fzz6MdA5AyO2G2hgMrUEPGONA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:906d525d-1116-441f-a096-01afc871c1cd,IP:0,UR
	L:25,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:624927ce-23b9-4c94-add0-e827a7999e28,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1|
	19,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 93ec8a6afb5211efa1e849db4cc18d44-20250307
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1943136985; Fri, 07 Mar 2025 05:49:15 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 20:49:12 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 20:49:12 +0800
From: Darren.Ye <darren.ye@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>, Darren Ye
	<darren.ye@mediatek.com>
Subject: [PATCH 12/14] dt-bindings: mediatek: mt8196: add audio AFE document
Date: Fri, 7 Mar 2025 20:47:38 +0800
Message-ID: <20250307124841.23777-13-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307124841.23777-1-darren.ye@mediatek.com>
References: <20250307124841.23777-1-darren.ye@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_044920_383034_BEDAD069 
X-CRM114-Status: GOOD (  14.20  )
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

From: Darren Ye <darren.ye@mediatek.com>

Add mt8196 audio AFE document.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 .../bindings/sound/mediatek,mt8196-afe.yaml   | 259 ++++++++++++++++++
 1 file changed, 259 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
new file mode 100644
index 000000000000..59f8fdf3167c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
@@ -0,0 +1,259 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8196-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Audio Front End PCM controller for MT8196
+
+maintainers:
+  - Darren Ye <darren.ye@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8196-afe-pcm
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: audio hopping clock
+      - description: audio f26m clock
+      - description: audio ul0 adc clock
+      - description: audio ul0 adc hires clock
+      - description: audio ul1 adc clock
+      - description: audio ul1 adc hires clock
+      - description: audio apll1 clock
+      - description: audio apll2 clock
+      - description: audio apll tuner1 clock
+      - description: audio apll tuner2 clock
+      - description: vlp mux audio int
+      - description: vlp mux aud engen1
+      - description: vlp mux aud engen2
+      - description: vlp mux audio h
+      - description: vlp clock 26m
+      - description: ck mainpll d4 d4
+      - description: ck mux aud 1
+      - description: ck apll1
+      - description: ck mux aud 2
+      - description: ck apll2
+      - description: ck apll1 d4
+      - description: ck apll2 d4
+      - description: ck i2sin0 m sel
+      - description: ck i2sin1 m sel
+      - description: ck fmi2s m sel
+      - description: ck tdmout m sel
+      - description: ck apll12 div i2sin0
+      - description: ck apll12 div i2sin1
+      - description: ck apll12 div fmi2s
+      - description: ck apll12 div tdmout m
+      - description: ck apll12 div tdmout b
+      - description: ck adsp sel
+      - description: ck clock 26m
+
+  clock-names:
+    items:
+      - const: aud_hopping_clk
+      - const: aud_f26m_clk
+      - const: aud_ul0_adc_clk
+      - const: aud_ul0_adc_hires_clk
+      - const: aud_ul1_adc_clk
+      - const: aud_ul1_adc_hires_clk
+      - const: aud_apll1_clk
+      - const: aud_apll2_clk
+      - const: aud_apll_tuner1_clk
+      - const: aud_apll_tuner2_clk
+      - const: vlp_mux_audio_int
+      - const: vlp_mux_aud_eng1
+      - const: vlp_mux_aud_eng2
+      - const: vlp_mux_audio_h
+      - const: vlp_clk26m_clk
+      - const: ck_mainpll_d4_d4
+      - const: ck_mux_aud_1
+      - const: ck_apll1_ck
+      - const: ck_mux_aud_2
+      - const: ck_apll2_ck
+      - const: ck_apll1_d4
+      - const: ck_apll2_d4
+      - const: ck_i2sin0_m_sel
+      - const: ck_i2sin1_m_sel
+      - const: ck_fmi2s_m_sel
+      - const: ck_tdmout_m_sel
+      - const: ck_apll12_div_i2sin0
+      - const: ck_apll12_div_i2sin1
+      - const: ck_apll12_div_fmi2s
+      - const: ck_apll12_div_tdmout_m
+      - const: ck_apll12_div_tdmout_b
+      - const: ck_adsp_sel
+      - const: ck_clk26m_clk
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  cksys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the cksys clock controller.
+
+  vlpcksys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the vlpcksys clock controller.
+
+  memory-region:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the reserved memory region for AFE DMA.
+
+  pinctrl-names:
+    items:
+      - const: default
+
+  pinctrl-0:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the pin control group for default state.
+
+  mediatek,etdm-out-ch:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of ETDM output channels.
+    enum: [2]
+
+  mediatek,etdm-in-ch:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of ETDM input channels.
+    enum: [2]
+
+  mediatek,etdm-out-sync:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: ETDM output synchronization.
+    enum: [0, 1]
+
+  mediatek,etdm-in-sync:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: ETDM input synchronization.
+    enum: [0, 1]
+
+  mediatek,etdm-ip-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: ETDM IP mode.
+    enum: [0, 1]
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - cksys
+  - vlpcksys
+  - memory-region
+  - pinctrl-names
+  - pinctrl-0
+  - mediatek,etdm-out-ch
+  - mediatek,etdm-in-ch
+  - mediatek,etdm-out-sync
+  - mediatek,etdm-in-sync
+  - mediatek,etdm-ip-mode
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8196-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8196-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        afe: mt8196-afe-pcm@1a110000 {
+            compatible = "mediatek,mt8196-afe-pcm";
+            reg = <0 0x1a110000 0 0x9000>;
+            interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
+            cksys = <&cksys_clk>;
+            vlpcksys = <&vlp_cksys_clk>;
+            power-domains = <&scpsys MT8196_POWER_DOMAIN_AUDIO>;
+            memory-region = <&afe_dma_mem_reserved>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&aud_pins_default>;
+            /* Only for ETDM in/out 4 */
+            mediatek,etdm-out-ch = <2>;
+            mediatek,etdm-in-ch = <2>;
+            mediatek,etdm-out-sync = <0>;
+            mediatek,etdm-in-sync = <1>;
+            mediatek,etdm-ip-mode = <0>;
+            clocks = <&afe_clk CLK_AFE_AUDIO_HOPPING_AFE>,
+                     <&afe_clk CLK_AFE_AUDIO_F26M_AFE>,
+                     <&afe_clk CLK_AFE_UL0_ADC_AFE>,
+                     <&afe_clk CLK_AFE_UL0_ADC_HIRES_AFE>,
+                     <&afe_clk CLK_AFE_UL1_ADC_AFE>,
+                     <&afe_clk CLK_AFE_UL1_ADC_HIRES_AFE>,
+                     <&afe_clk CLK_AFE_APLL1_AFE>,
+                     <&afe_clk CLK_AFE_APLL2_AFE>,
+                     <&afe_clk CLK_AFE_APLL_TUNER1_AFE>,
+                     <&afe_clk CLK_AFE_APLL_TUNER2_AFE>,
+                     <&vlp_cksys_clk CLK_VLP_CK_AUD_INTBUS_SEL>,
+                     <&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN1_SEL>,
+                     <&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN2_SEL>,
+                     <&vlp_cksys_clk CLK_VLP_CK_AUDIO_H_SEL>,
+                     <&vlp_cksys_clk CLK_VLP_CK_CLKSQ>,
+                     <&cksys_clk CLK_CK_MAINPLL_D4_D4>,
+                     <&cksys_clk CLK_CK_AUD_1_SEL>,
+                     <&cksys_clk CLK_CK_APLL1>,
+                     <&cksys_clk CLK_CK_AUD_2_SEL>,
+                     <&cksys_clk CLK_CK_APLL2>,
+                     <&cksys_clk CLK_CK_APLL1_D4>,
+                     <&cksys_clk CLK_CK_APLL2_D4>,
+                     <&cksys_clk CLK_CK_APLL_I2SIN0_MCK_SEL>,
+                     <&cksys_clk CLK_CK_APLL_I2SIN1_MCK_SEL>,
+                     <&cksys_clk CLK_CK_APLL_FMI2S_MCK_SEL>,
+                     <&cksys_clk CLK_CK_APLL_TDMOUT_MCK_SEL>,
+                     <&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN0>,
+                     <&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN1>,
+                     <&cksys_clk CLK_CK_APLL12_CK_DIV_FMI2S>,
+                     <&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_M>,
+                     <&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_B>,
+                     <&cksys_clk CLK_CK_ADSP_SEL>,
+                     <&cksys_clk CLK_CK_TCK_26M_MX9>;
+            clock-names = "aud_hopping_clk",
+                          "aud_f26m_clk",
+                          "aud_ul0_adc_clk",
+                          "aud_ul0_adc_hires_clk",
+                          "aud_ul1_adc_clk",
+                          "aud_ul1_adc_hires_clk",
+                          "aud_apll1_clk",
+                          "aud_apll2_clk",
+                          "aud_apll_tuner1_clk",
+                          "aud_apll_tuner2_clk",
+                          "vlp_mux_audio_int",
+                          "vlp_mux_aud_eng1",
+                          "vlp_mux_aud_eng2",
+                          "vlp_mux_audio_h",
+                          "vlp_clk26m_clk",
+                          "ck_mainpll_d4_d4",
+                          "ck_mux_aud_1",
+                          "ck_apll1_ck",
+                          "ck_mux_aud_2",
+                          "ck_apll2_ck",
+                          "ck_apll1_d4",
+                          "ck_apll2_d4",
+                          "ck_i2sin0_m_sel",
+                          "ck_i2sin1_m_sel",
+                          "ck_fmi2s_m_sel",
+                          "ck_tdmout_m_sel",
+                          "ck_apll12_div_i2sin0",
+                          "ck_apll12_div_i2sin1",
+                          "ck_apll12_div_fmi2s",
+                          "ck_apll12_div_tdmout_m",
+                          "ck_apll12_div_tdmout_b",
+                          "ck_adsp_sel",
+                          "ck_clk26m_clk";
+        };
+    };
-- 
2.45.2



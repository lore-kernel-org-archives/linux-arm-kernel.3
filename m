Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEB5CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 07:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6ZPfV662h1Ig8uyTNsRNsx0POH1j8eh3iLkxjXARr0=; b=yYfVTaKoPW+qeMb20Y7Vd/xUrI
	N0iOKHjrF8Je+Lu1v6dAFexXYRn2ZzUbX7oYUt3nvGjbd1WFPR0lBwtkxoy/GUmpGR0mQWLG4mm1N
	lyGlIuafVJfqJDs3hJEZj79+4mIRje8zCQMBmXUBDP5n28ceJJYXS6zmA7He3B1pmsP/xKSZXpKdn
	GN8Srd9QMZisnCN03GAoCkb45/M682BdoARwaK2D0oRTNjl9oA4bTxtvWYcWhPDQpdlyWetucYL7b
	i6+iYZf7E4pa0ItzKfQ9QjNc+YGGybJof0M7N3YdsWoSn/CFm6OUvmx6fI1yCTCK+nv76JGWLdIhS
	4ykas4+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEjde-00000005Xye-2uO4;
	Fri, 31 Oct 2025 07:33:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEjd0-00000005XYT-1tYD;
	Fri, 31 Oct 2025 07:32:58 +0000
X-UUID: cec4e76ab62b11f09f706fa2197c6ceb-20251031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=v6ZPfV662h1Ig8uyTNsRNsx0POH1j8eh3iLkxjXARr0=;
	b=qhtz+4CA5YQHhzG8xveoXfJm6OhX5bT+dhgXgJprMPcs+flOuaH7vOXcpJaHqVMZB9QZMJuUVm2OBhtYIu3G29fKpttHEaPWa7PS3iowPjYcs2SxlKhJwzy+QVbWyy7P8/UhyWfhgHrChccoqlDhG/TbTXuWWS5R0O+Bgj+e/CM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:7b1e8294-c2be-426f-816b-bcfc46dc3e5d,IP:0,UR
	L:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-META: VersionHash:a9d874c,CLOUDID:f516fbdf-3890-4bb9-a90e-2a6a4ecf6c66,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:11|97|99|83|106|1,File:130,RT:0,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cec4e76ab62b11f09f706fa2197c6ceb-20251031
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 955760625; Fri, 31 Oct 2025 00:32:51 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 31 Oct 2025 15:32:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 31 Oct 2025 15:32:47 +0800
From: Cyril Chao <Cyril.Chao@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Cyril Chao <cyril.chao@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Cyril Chao
	<Cyril.Chao@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 07/10] ASoC: dt-bindings: mediatek,mt8189-afe-pcm: add audio afe document
Date: Fri, 31 Oct 2025 15:32:01 +0800
Message-ID: <20251031073216.8662-8-Cyril.Chao@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251031073216.8662-1-Cyril.Chao@mediatek.com>
References: <20251031073216.8662-1-Cyril.Chao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_003254_855130_F4CF2E2C 
X-CRM114-Status: GOOD (  13.11  )
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

Add mt8189 audio afe document.

Signed-off-by: Cyril Chao <Cyril.Chao@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../sound/mediatek,mt8189-afe-pcm.yaml        | 178 ++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8189-afe-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8189-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8189-afe-pcm.yaml
new file mode 100644
index 000000000000..9c9f21652af9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8189-afe-pcm.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8189-afe-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Audio Front End PCM controller for MT8189
+
+maintainers:
+  - Darren Ye <darren.ye@mediatek.com>
+  - Cyril Chao <cyril.chao@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8189-afe-pcm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+  mediatek,apmixedsys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: To set up the apll12 tuner
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: mux for audio intbus
+      - description: mux for audio engen1
+      - description: mux for audio engen2
+      - description: mux for audio h
+      - description: audio apll1 clock
+      - description: audio apll2 clock
+      - description: audio apll1 divide4
+      - description: audio apll2 divide4
+      - description: audio apll12 divide for i2sin0
+      - description: audio apll12 divide for i2sin1
+      - description: audio apll12 divide for i2sout0
+      - description: audio apll12 divide for i2sout1
+      - description: audio apll12 divide for fmi2s
+      - description: audio apll12 divide for tdmout mck
+      - description: audio apll12 divide for tdmout bck
+      - description: mux for audio apll1
+      - description: mux for audio apll2
+      - description: mux for i2sin0 mck
+      - description: mux for i2sin1 mck
+      - description: mux for i2sout0 mck
+      - description: mux for i2sout1 mck
+      - description: mux for fmi2s mck
+      - description: mux for tdmout mck
+      - description: 26m clock
+      - description: audio slv clock
+      - description: audio mst clock
+      - description: audio intbus clock
+
+  clock-names:
+    items:
+      - const: top_aud_intbus
+      - const: top_aud_eng1
+      - const: top_aud_eng2
+      - const: top_aud_h
+      - const: apll1
+      - const: apll2
+      - const: apll1_d4
+      - const: apll2_d4
+      - const: apll12_div_i2sin0
+      - const: apll12_div_i2sin1
+      - const: apll12_div_i2sout0
+      - const: apll12_div_i2sout1
+      - const: apll12_div_fmi2s
+      - const: apll12_div_tdmout_m
+      - const: apll12_div_tdmout_b
+      - const: top_apll1
+      - const: top_apll2
+      - const: top_i2sin0
+      - const: top_i2sin1
+      - const: top_i2sout0
+      - const: top_i2sout1
+      - const: top_fmi2s
+      - const: top_dptx
+      - const: clk26m
+      - const: aud_slv_ck_peri
+      - const: aud_mst_ck_peri
+      - const: aud_intbus_ck_peri
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - memory-region
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        afe@11050000 {
+            compatible = "mediatek,mt8189-afe-pcm";
+            reg = <0 0x11050000 0 0x10000>;
+            interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH 0>;
+            memory-region = <&afe_dma_mem_reserved>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&aud_pins_default>;
+            power-domains = <&scpsys 1>; //MT8189_POWER_DOMAIN_AUDIO
+            clocks = <&topckgen_clk 23>, //CLK_TOP_AUD_INTBUS_SEL
+                     <&topckgen_clk 39>, //CLK_TOP_AUD_ENGEN1_SEL
+                     <&topckgen_clk 40>, //CLK_TOP_AUD_ENGEN2_SEL
+                     <&topckgen_clk 49>, //CLK_TOP_AUDIO_H_SEL
+                     <&topckgen_clk 146>, //CLK_TOP_APLL1
+                     <&topckgen_clk 151>, //CLK_TOP_APLL2
+                     <&topckgen_clk 148>, //CLK_TOP_APLL1_D4
+                     <&topckgen_clk 153>, //CLK_TOP_APLL2_D4
+                     <&topckgen_clk 93>, //CLK_TOP_APLL12_CK_DIV_I2SIN0
+                     <&topckgen_clk 94>, //CLK_TOP_APLL12_CK_DIV_I2SIN1
+                     <&topckgen_clk 95>, //CLK_TOP_APLL12_CK_DIV_I2SOUT0
+                     <&topckgen_clk 96>, //CLK_TOP_APLL12_CK_DIV_I2SOUT1
+                     <&topckgen_clk 97>, //CLK_TOP_APLL12_CK_DIV_FMI2S
+                     <&topckgen_clk 98>, //CLK_TOP_APLL12_CK_DIV_TDMOUT_M
+                     <&topckgen_clk 99>, //CLK_TOP_APLL12_CK_DIV_TDMOUT_B
+                     <&topckgen_clk 44>, //CLK_TOP_AUD_1_SEL
+                     <&topckgen_clk 45>, //CLK_TOP_AUD_2_SEL
+                     <&topckgen_clk 78>, //CLK_TOP_APLL_I2SIN0_MCK_SEL
+                     <&topckgen_clk 79>, //CLK_TOP_APLL_I2SIN1_MCK_SEL
+                     <&topckgen_clk 84>, //CLK_TOP_APLL_I2SOUT0_MCK_SEL
+                     <&topckgen_clk 85>, //CLK_TOP_APLL_I2SOUT1_MCK_SEL
+                     <&topckgen_clk 90>, //CLK_TOP_APLL_FMI2S_MCK_SEL
+                     <&topckgen_clk 91>, //CLK_TOP_APLL_TDMOUT_MCK_SEL
+                     <&topckgen_clk 191>, //CLK_TOP_TCK_26M_MX9
+                     <&pericfg_ao_clk 77>, //CLK_PERAO_AUDIO0
+                     <&pericfg_ao_clk 78>, //CLK_PERAO_AUDIO1
+                     <&pericfg_ao_clk 79>; //CLK_PERAO_AUDIO2
+            clock-names = "top_aud_intbus",
+                          "top_aud_eng1",
+                          "top_aud_eng2",
+                          "top_aud_h",
+                          "apll1",
+                          "apll2",
+                          "apll1_d4",
+                          "apll2_d4",
+                          "apll12_div_i2sin0",
+                          "apll12_div_i2sin1",
+                          "apll12_div_i2sout0",
+                          "apll12_div_i2sout1",
+                          "apll12_div_fmi2s",
+                          "apll12_div_tdmout_m",
+                          "apll12_div_tdmout_b",
+                          "top_apll1",
+                          "top_apll2",
+                          "top_i2sin0",
+                          "top_i2sin1",
+                          "top_i2sout0",
+                          "top_i2sout1",
+                          "top_fmi2s",
+                          "top_dptx",
+                          "clk26m",
+                          "aud_slv_ck_peri",
+                          "aud_mst_ck_peri",
+                          "aud_intbus_ck_peri";
+        };
+    };
+
+...
-- 
2.45.2



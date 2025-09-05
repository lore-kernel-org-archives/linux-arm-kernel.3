Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61490CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 08:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1lTIiC+bxI0XnkjjK8plxMry5gKXvhGr2F5j29IY0A=; b=PUNKyHmjbukXLCYDy0zs25RG/q
	Hiqo3yvyA0sT1YcM2kc+PVvt2fcUI8Z8u5IUux/5NrHSdgta/VvXzc0Y9HOhS7FYtyDzhsqDFxGsp
	Fip8XoCw0xYPIfMKstcV9DjpwPwcA8jlzefluc+84pKWlYlNVyqHqoj8Hb3QoBr2aoMul47dpQV+E
	Z4vkZ2Wx2ilsdYV0KTp2xdCP78qdn/0JcXFGKuPBycf99CYxge8FoUe2+C1ykgsFq4m4B5yQiiNBu
	GF/lmcInu81DwY5x7E/OWF0Wae5fkfIhJ4SOjZ54Bv0d1gvJ5jY+sfu4X5iz/HHpA0marvXkFMT27
	ADrRCWSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRyt-00000000QfW-1PKt;
	Fri, 05 Sep 2025 08:39:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQhf-0000000HXzW-2BUZ;
	Fri, 05 Sep 2025 07:17:48 +0000
X-UUID: 6a5934048a2811f09f706fa2197c6ceb-20250905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=v1lTIiC+bxI0XnkjjK8plxMry5gKXvhGr2F5j29IY0A=;
	b=a33hJDUx/2Cnrj2emf8eMpzcOJIQgabzJ59ujqvi7jYJgmAhopHE8IvakybaC6bG07YmescwTtfVQ9BVSARC7wTy2UxmQm+NhDVoYF3bHxdSdR/A82csRNs3234KSkITWQa998EU90o0iSHjtlVP1mc3YBcNHkRHGfBgFI7HWb4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:b30b9be1-5737-488c-910b-4f9b8c2eab53,IP:0,UR
	L:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-META: VersionHash:f1326cf,CLOUDID:32313b6c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:11|97|99|83|106|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6a5934048a2811f09f706fa2197c6ceb-20250905
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1619758699; Fri, 05 Sep 2025 00:17:43 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 5 Sep 2025 15:17:37 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 5 Sep 2025 15:17:37 +0800
From: Cyril Chao <Cyril.Chao@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Darren Ye
	<darren.ye@mediatek.com>, Cyril Chao <cyril.chao@mediatek.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Cyril Chao
	<Cyril.Chao@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 07/10] ASoC: dt-bindings: mediatek,mt8189-afe-pcm: add audio afe document
Date: Fri, 5 Sep 2025 15:15:52 +0800
Message-ID: <20250905071659.25805-8-Cyril.Chao@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250905071659.25805-1-Cyril.Chao@mediatek.com>
References: <20250905071659.25805-1-Cyril.Chao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_001747_562821_4FC20087 
X-CRM114-Status: GOOD (  12.64  )
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
 .../sound/mediatek,mt8189-afe-pcm.yaml        | 162 ++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8189-afe-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8189-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8189-afe-pcm.yaml
new file mode 100644
index 000000000000..cdc76da5bdc5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8189-afe-pcm.yaml
@@ -0,0 +1,162 @@
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
+      - description: audio apll12 divide for fmi2s
+      - description: audio apll12 divide for tdmout mck
+      - description: audio apll12 divide for tdmout bck
+      - description: mux for audio apll1
+      - description: mux for audio apll2
+      - description: mux for i2sin0 mck
+      - description: mux for i2sin1 mck
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
+      - const: apll12_div_fmi2s
+      - const: apll12_div_tdmout_m
+      - const: apll12_div_tdmout_b
+      - const: top_apll1
+      - const: top_apll2
+      - const: top_i2sin0
+      - const: top_i2sin1
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
+                     <&topckgen_clk 97>, //CLK_TOP_APLL12_CK_DIV_FMI2S
+                     <&topckgen_clk 98>, //CLK_TOP_APLL12_CK_DIV_TDMOUT_M
+                     <&topckgen_clk 99>, //CLK_TOP_APLL12_CK_DIV_TDMOUT_B
+                     <&topckgen_clk 44>, //CLK_TOP_AUD_1_SEL
+                     <&topckgen_clk 45>, //CLK_TOP_AUD_2_SEL
+                     <&topckgen_clk 78>, //CLK_TOP_APLL_I2SIN0_MCK_SEL
+                     <&topckgen_clk 79>, //CLK_TOP_APLL_I2SIN1_MCK_SEL
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
+                          "apll12_div_fmi2s",
+                          "apll12_div_tdmout_m",
+                          "apll12_div_tdmout_b",
+                          "top_apll1",
+                          "top_apll2",
+                          "top_i2sin0",
+                          "top_i2sin1",
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



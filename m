Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B44C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 03:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dc8FTTmQUPssSR+0L7w8BIPfBM922jSVMcz1txzmmtc=; b=crYJ1GIkX7AiO1pWeo9edpUj0Z
	TYDtlWWKeWssuiYXIX/DkVnGdMf2dDIihCkauPuAkV022RLfXlGdLTr4yQslJ9bp4pde6S6ntgsEp
	yA9foXpkunp8Zpuj0N0nAn7zyis5sQxDWGh2k+RiiImp5LjWfVQ7v/YdQWYcolzhLvMtBPJmaOmAN
	FbVaAwdwz7SoRD/TCInQgBEy9kRW504FCrpgWqE7n1Q7gTyLclnbyoe/5o6T9oPzpUNgOk8Etg4K4
	f7IRDkl8GYqa1LvHFqUNdJaQwSodaZYFJ8bBwJEaHcdFIsKsocVTsIl1LFYTfQGazSKVYhgdoChrt
	Lfy8UvUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv6VQ-0000000Ayc6-31R2;
	Thu, 20 Mar 2025 03:23:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv6QZ-0000000AyAl-2nO4;
	Thu, 20 Mar 2025 03:18:40 +0000
X-UUID: 02bf57e2053a11f0a1e849db4cc18d44-20250319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Dc8FTTmQUPssSR+0L7w8BIPfBM922jSVMcz1txzmmtc=;
	b=e+XDd+qZ8hEBvIarcPnYfcv7+1c7wvcEOHLLV3HxUatZ23U9cgIySy32qtTIjneTe47ZcP/W+Hfhckf4xgqzam3a4TBH/ShcoPgMvrGchXUncQ/XHxh9wXTFaU5e01bc8dxrtKZ66xYAaXEJL0x/3HK22v7IOm9rTdFzGpYUncY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:5a4b6b24-9811-434f-9b09-d46ae64b714f,IP:0,UR
	L:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:aed8c741-b9d5-4efb-8cbd-6eb0b75d20c2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 02bf57e2053a11f0a1e849db4cc18d44-20250319
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <hailong.fan@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1628212086; Wed, 19 Mar 2025 20:18:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 20 Mar 2025 11:18:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 20 Mar 2025 11:18:31 +0800
From: hailong.fan <hailong.fan@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard
 Liao <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<sound-open-firmware@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<Jjian.Zhou@mediatek.com>, <Xiangzhi.Tang@mediatek.com>, hailong.fan
	<hailong.fan@mediatek.com>
Subject: [PATCH 2/2] dt-bindings: dsp: mediatek: add mt8196 dsp document
Date: Thu, 20 Mar 2025 11:17:25 +0800
Message-ID: <20250320031753.13669-3-hailong.fan@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250320031753.13669-1-hailong.fan@mediatek.com>
References: <20250320031753.13669-1-hailong.fan@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_201839_707586_10AC00A4 
X-CRM114-Status: GOOD (  14.66  )
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

This patch adds mt8196 dsp document. The dsp is used for Sound Open
Firmware driver node. It includes registers,  clocks, memory regions,
and mailbox for dsp.

Signed-off-by: hailong.fan <hailong.fan@mediatek.com>
---
 .../bindings/dsp/mediatek,mt8196-dsp.yaml     | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml

diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml
new file mode 100644
index 000000000000..62bcd97bd0f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dsp/mediatek,mt8196-dsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek mt8196 DSP core
+
+maintainers:
+  - Hailong Fan <hailong.fan@mediatek.com>
+
+description: |
+  Some boards from mt8196 contain a DSP core used for
+  advanced pre- and post- audio processing.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-dsp
+
+  reg:
+    items:
+      - description: Address and size of the DSP Cfg registers
+      - description: Address and size of the DSP SRAM
+      - description: Address and size of the DSP secure registers
+      - description: Address and size of the DSP bus registers
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: sram
+      - const: sec
+      - const: bus
+
+  clocks:
+    items:
+      - description: mux for dsp clock
+      - description: 26M clock
+      - description: ADSP PLL clock
+
+  clock-names:
+    items:
+      - const: adsp_sel
+      - const: clk26m
+      - const: adsppll
+
+  power-domains:
+    maxItems: 1
+
+  mboxes:
+    items:
+      - description: mailbox for receiving audio DSP requests.
+      - description: mailbox for transmitting requests to audio DSP.
+
+  mbox-names:
+    items:
+      - const: rx
+      - const: tx
+
+  memory-region:
+    items:
+      - description: dma buffer between host and DSP.
+      - description: DSP system memory.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - power-domains
+  - mbox-names
+  - mboxes
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8196-clk.h>
+    #include <dt-bindings/power/mt8196-power.h>
+    adsp: adsp@1a000000 {
+        compatible = "mediatek,mt8196-dsp";
+        reg = <0x1a000000 0x5000>,
+              <0x1a210000 0x80000>,
+              <0x1a345000 0x300>,
+              <0x1a00f000 0x1000>;
+        reg-names = "cfg", "sram", "sec", "bus";
+        power-domains = <&scpsys MT8196_POWER_DOMAIN_ADSP_TOP_DORMANT>;
+        clocks = <&cksys_clk CLK_CK_ADSP_SEL>,
+                 <&cksys_clk CLK_CK_TCK_26M_MX9>,
+                 <&cksys_clk CLK_CK_ADSPPLL>;
+        clock-names = "adsp_sel",
+                      "clk26m",
+                      "adsppll";
+        mbox-names = "rx", "tx";
+        mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
+    };
-- 
2.45.2



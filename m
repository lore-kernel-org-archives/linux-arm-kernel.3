Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0F3CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uznzB13p4amR3AHMGxiS0rK/8bL739hCWyhx0iAq2QA=; b=0zPuis0vrQ7nu+Ut/+45AOWoax
	NiKCD0i7LBbob2eUh0G9of+PYFhnywFc0RG7O/0o5VbpVlcxsBM+ubGjjmLLXljlU+A4bkbWhNRKM
	8tojFNQTnxFL6s8BKRJs4adEzm54pej2ZeypGQ1lEt170lomiQGXz+DR9oSNKIseIj32XgKAmniRg
	foTE1kd5xQP1TJws8cmXHk9APrp2SCW7v11W2DEhaYorsGlSj0M+qhmoypTRDgYYWz0Bb9Dfc/G37
	rXCRZIrpSSmQO+YYKC0+PSeqP93ZaIB9clkB5uIm0Kz6Svpo7I1YCAojnNjUFy2MsPNS6U/q5uoCv
	CBFRRqLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymzV-0000000AXmn-0HuZ;
	Wed, 17 Sep 2025 07:54:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymzS-0000000AXlD-2P3X;
	Wed, 17 Sep 2025 07:54:12 +0000
X-UUID: 7b418e84939b11f09f706fa2197c6ceb-20250917
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uznzB13p4amR3AHMGxiS0rK/8bL739hCWyhx0iAq2QA=;
	b=n33H4OIAdIJeGke968BUbIcrlttTdjyvJS0YRjgsSBUWKNC1HT8j/FeuImn22wis9L1Rz8YGZZH0ZB8tzZ5DeEN0ncOYJQge9EPG69BQWYY5i4xkvZr82EtGb8cKNKcb5HgmdHTuSCYtdumTsn5YPuSvpLXLrNnD491h2Jgf1rA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:2c5f9104-a336-4215-a6a9-3f3274f70a70,IP:0,UR
	L:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-META: VersionHash:1ca6b93,CLOUDID:8a9f69a9-24df-464e-9c88-e53ab7cf7153,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836,TC:-5,Content:0|15|50,
	EDM:-3,IP:nil,URL:97|99|83|106|11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7b418e84939b11f09f706fa2197c6ceb-20250917
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <hailong.fan@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 986628078; Wed, 17 Sep 2025 00:54:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 17 Sep 2025 15:54:00 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 17 Sep 2025 15:53:59 +0800
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
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hailong Fan
	<hailong.fan@mediatek.com>
Subject: [PATCH v3 1/2] dt-bindings: dsp: mediatek: add mt8196 dsp document
Date: Wed, 17 Sep 2025 15:53:05 +0800
Message-ID: <20250917075336.5985-2-hailong.fan@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250917075336.5985-1-hailong.fan@mediatek.com>
References: <20250917075336.5985-1-hailong.fan@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_005410_633063_1971C796 
X-CRM114-Status: GOOD (  15.21  )
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

From: Hailong Fan <hailong.fan@mediatek.com>

Add device tree binding documentation for the MediaTek
MT8196 DSP. The DSP is used by the Sound Open Firmware
driver node and includes registers, clocks, memory regions,
and a mailbox for DSP communication.

Signed-off-by: Hailong Fan <hailong.fan@mediatek.com>
---
 .../bindings/dsp/mediatek,mt8196-dsp.yaml     | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml

diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml
new file mode 100644
index 000000000000..af0f9d71200f
--- /dev/null
+++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dsp/mediatek,mt8196-dsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek mt8196 DSP core
+
+maintainers:
+  - Hailong Fan <hailong.fan@mediatek.com>
+
+description: |
+  The MediaTek mt8196 SoC contains a DSP core used for advanced pre-
+  and post-audio processing. This DSP is typically used by the Sound
+  Open Firmware (SOF) driver and requires registers, clocks, memory
+  regions, and a mailbox for communication.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-dsp
+
+  reg:
+    items:
+      - description: DSP configuration registers
+      - description: DSP SRAM
+      - description: DSP secure registers
+      - description: DSP bus registers
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
+      - description: mux for audio dsp clock
+      - description: audio dsp 26M clock source
+      - description: audio dsp PLL clock source
+
+  clock-names:
+    items:
+      - const: audiodsp
+      - const: sys_clk
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
+  - mboxes
+  - mbox-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8196-clk.h>
+    #include <dt-bindings/power/mt8196-power.h>
+    adsp@1a000000 {
+        compatible = "mediatek,mt8196-dsp";
+        reg = <0x1a000000 0x5000>,
+              <0x1a210000 0x80000>,
+              <0x1a345000 0x300>,
+              <0x1a00f000 0x1000>;
+        reg-names = "cfg", "sram", "sec", "bus";
+        clocks = <&cksys_clk CLK_CK_ADSP_SEL>,
+                 <&cksys_clk CLK_CK_TCK_26M_MX9>,
+                 <&cksys_clk CLK_CK_ADSPPLL>;
+        clock-names = "audiodsp",
+                      "sys_clk",
+                      "adsppll";
+        power-domains = <&scpsys MT8196_POWER_DOMAIN_ADSP_TOP_DORMANT>;
+        mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
+        mbox-names = "rx", "tx";
+    };
-- 
2.45.2



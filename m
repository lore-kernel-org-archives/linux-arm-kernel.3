Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735A7CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/LnUjycYKhLdST3uiQvKDxrDNE1WnmNJQyIxHDuaAM=; b=BaiZ0aPm6JQHAI1Nuquc2xpwKR
	1wNoxfRdDtMNPqIpVk9ffNxr3j4NpEYNrKnfzlg7OgRbYnJ1O2950iGhEatne0VxuU1ccfsl9V1ms
	geLT0GuQh/423Ut3O1qr+TeFxa+5K5KZqQ69nt8tJVoJ5XWrg6UX78RDOEBlkQxlH2xsMDf679UnE
	CLVRP47YIYTd2HEltXbpWMDQDt6DJRjjvhoQOF8lqvrOCZmT6ft7SElzFrHq0xihGmxR2NyA5tA5m
	HsCelAtzGJUGn9vUFWxXTmWlNtFwNqT+2QsKkSWcOEe1wTnP7pAvl7pIJK8vqutOvqeQjfJa3nOZS
	5hbXQtWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlsF-000000018YA-3vFk;
	Sun, 14 Sep 2025 12:30:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlsD-000000018Wl-3SDY;
	Sun, 14 Sep 2025 12:30:31 +0000
X-UUID: 961584d6916611f09f706fa2197c6ceb-20250914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=o/LnUjycYKhLdST3uiQvKDxrDNE1WnmNJQyIxHDuaAM=;
	b=Z6ZBCvan1VUccTFaCV/87G2BY2/N8qKt+Y3uHObGy85QbtGJ98LqSwZ5oHbN1TA0VvPUiP8QipwDZsowdTkCyicLJAIJuLDfJR8gajbMsOGDjeDIT7KXqJGemv3FEaHjEN4eYaOjy0PscRoNDKE55cilBYrFCOu1q6UBSn1HAt4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:8e1f9ed4-e3f1-4c0a-b98a-9c284b94af61,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:1ca6b93,CLOUDID:2f0c4ca9-24df-464e-9c88-e53ab7cf7153,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:11|97|99|83|106|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 961584d6916611f09f706fa2197c6ceb-20250914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1542845987; Sun, 14 Sep 2025 05:30:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 14 Sep 2025 20:30:18 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 14 Sep 2025 20:30:17 +0800
From: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiangzhi Tang
	<Xiangzhi.Tang@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Jjian Zhou <Jjian.Zhou@mediatek.com>,
	Hailong Fan <Hailong.Fan@mediatek.com>, Xiangzhi Tang
	<xiangzhi.tang@mediatek.com>
Subject: [PATCH v2 1/4] dt-bindings: remoteproc: Add VCP support for mt8196
Date: Sun, 14 Sep 2025 20:29:24 +0800
Message-ID: <20250914122943.10412-2-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250914122943.10412-1-xiangzhi.tang@mediatek.com>
References: <20250914122943.10412-1-xiangzhi.tang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_053029_874144_8ED33548 
X-CRM114-Status: GOOD (  14.48  )
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

Add the new binding document for MediaTek Video Companion
Processor(VCP) on MediaTek mt8196.

Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
---
 .../remoteproc/mediatek,mt8196-vcp.yaml       | 165 ++++++++++++++++++
 1 file changed, 165 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml b/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
new file mode 100644
index 000000000000..71a55943843b
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
@@ -0,0 +1,165 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/mediatek,mt8196-vcp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Video Companion Processor (VCP)
+
+maintainers:
+  - Xiangzhi Tang <Xiangzhi.Tang@mediatek.com>
+
+description:
+  The MediaTek VCP enables the SoC control the MediaTek Video Companion Risc-V coprocessor.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8196-vcp
+
+  reg:
+    items:
+      - description: sram base
+      - description: cfg group IO
+      - description: cfg core group IO
+      - description: cfg sec group IO
+      - description: vcp rdy group IO
+
+  reg-names:
+    items:
+      - const: sram
+      - const: cfg
+      - const: cfg_core
+      - const: cfg_sec
+      - const: vcp_vlp_ao_rsvd7
+
+  interrupts:
+    maxItems: 1
+
+  mboxes:
+    maxItems: 5
+
+  mbox-names:
+    maxItems: 5
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    description:
+      Using MediaTek iommu to apply larb ports for Multimedia Memory
+      Management Unit and address translation
+      Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+patternProperties:
+  "^vcp@[a-f0-9]+$":
+    type: object
+    description:
+      The MediaTek VCP integrated to SoC might be a multi-core version.
+      The other cores are represented as child nodes of the boot core.
+      There are some integration differences for the IP like the usage of
+      address translator for translating SoC bus addresses into address
+      space for the processor.
+
+      The SRAM are shared by all cores, each VCP core only using a piece
+      SRAM memory. The power of SRAM should be enabled before booting VCP cores.
+      The size of SRAM are varied on differnt SoCs.
+
+      The VCP cores has differences on different SoCs to support for
+      Hart.
+
+    properties:
+      compatible:
+        enum:
+          - mediatek,vcp-core
+
+      reg:
+        description: The base address and size of SRAM.
+        maxItems: 1
+
+      reg-names:
+        const: sram
+
+      mtk,vcp-core-twohart:
+        enum: [0, 1]
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      mtk,vcp-sram-offset:
+        description:
+          Allocated SRAM memory for each VCP core used.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+    required:
+      - compatible
+      - reg
+      - reg-names
+      - mtk,vcp-core-twohart
+      - mtk,vcp-sram-offset
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - mboxes
+  - mbox-names
+  - power-domains
+  - iommus
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8196-power.h>
+
+    vcp: vcp@31800000 {
+        compatible = "mediatek,mt8196-vcp";
+        reg = <0x31800000 0x60000>,
+              <0x31a04000 0xa000>,
+              <0x31bd0000 0x1000>,
+              <0x31a70020 0x100>,
+              <0x1c00091c 0x4>;
+        reg-names = "sram",
+                    "cfg",
+                    "cfg_core",
+                    "cfg_sec",
+                    "vcp_vlp_ao_rsvd7";
+
+        interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>;
+
+        mboxes = <&vcp_mailbox0>,
+                 <&vcp_mailbox1>,
+                 <&vcp_mailbox2>,
+                 <&vcp_mailbox3>,
+                 <&vcp_mailbox4>;
+        mbox-names = "mbox0", "mbox1", "mbox2", "mbox3", "mbox4";
+
+        power-domains = <&scpsys MT8196_POWER_DOMAIN_MM_PROC_DORMANT>;
+        iommus = <&mm_smmu 160>;
+        memory-region = <&vcp_resv_mem>;
+
+        vcp@0 {
+            compatible = "mediatek,vcp-core";
+            reg = <0x0 0x31000>;
+            reg-names = "sram";
+            mtk,vcp-core-twohart = <1>;
+            mtk,vcp-sram-offset = <0x0>;
+        };
+
+        vcp@31000 {
+            compatible = "mediatek,vcp-core";
+            reg = <0x31000 0x60000>;
+            reg-names = "sram";
+            mtk,vcp-core-twohart = <0>;
+            mtk,vcp-sram-offset = <0x31000>;
+        };
+    };
-- 
2.46.0



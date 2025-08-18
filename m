Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E52CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XE/Wsu/+2JfTzmMtwqnxXK18dYzx6PrNiqIfUIe6Nqc=; b=axU1rLLFvISrIdVejq9jyKUCzP
	ak7VKJT/O8gtIpRe0F3LW+smIlpF1p0i4tr+jpv2eKHmSNEd//QVXAkHosuVpUM6StuvlXr6/N8Qh
	WshJAboFXWeVvPl8UDxQV7ZfV4vlccbZeBmQrYKY5Hs23Z7cYk7FDaiePHHX05Kt0oyIQHU7ToxM5
	kg35ZyCNm3VfAHFAS0rVrK8XkV60/WYrUEJlLv478lEN8tmQclDlMyjj0rwUmFy3LiXXIOfadAR8Q
	HoQCJS6VH4HKins3IJ9r0xkUu/ReANUTABmMQ1sUSOcIt/md05CrBcxSYiEgP0X8Mh0gcbzPTfsKm
	8mgH51Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo07m-00000007bch-3Pk4;
	Mon, 18 Aug 2025 13:42:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unyVG-00000007HNY-0u40;
	Mon, 18 Aug 2025 11:58:19 +0000
X-UUID: 97d579307c2a11f09f706fa2197c6ceb-20250818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XE/Wsu/+2JfTzmMtwqnxXK18dYzx6PrNiqIfUIe6Nqc=;
	b=eLfUmPEBVp/yWnvZgKlf054fltaad0spMbTWgvDgshsVWsEi3k5/4x8QJEEbDqvYH+OWGKdfyPz5jjG3drBOW0Glu3gvZe9ILGnx8+LDN70Y5nOYNF7dEjtNfyEB7ABSkaMX8+Q8FApUdhY/eIfDd1/k44fSS2rRWfGomJtu6ik=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:b4e079c1-7697-4275-abe7-d7d741d79823,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:f1326cf,CLOUDID:58fc566d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:11|97|99|83|106|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 97d579307c2a11f09f706fa2197c6ceb-20250818
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1493219594; Mon, 18 Aug 2025 04:58:02 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 18 Aug 2025 19:57:59 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 18 Aug 2025 19:57:59 +0800
From: irving.ch.lin <irving-ch.lin@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Richard Cochran <richardcochran@gmail.com>
CC: Qiqi Wang <qiqi.wang@mediatek.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, <netdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <irving-ch.lin@mediatek.com>
Subject: [PATCH 2/6] dt-bindings: power: mediatek: Add new MT8189 power
Date: Mon, 18 Aug 2025 19:57:30 +0800
Message-ID: <20250818115754.1067154-3-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250818115754.1067154-1-irving-ch.lin@mediatek.com>
References: <20250818115754.1067154-1-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_045818_265391_61604950 
X-CRM114-Status: GOOD (  15.67  )
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

From: Irving-ch Lin <irving-ch.lin@mediatek.com>

Add the new binding documentation for power controller
on MediaTek MT8189.

Signed-off-by: Irving-ch Lin <irving-ch.lin@mediatek.com>
---
 .../mediatek,mt8189-power-controller.yaml     | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/mediatek,mt8189-power-controller.yaml

diff --git a/Documentation/devicetree/bindings/power/mediatek,mt8189-power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,mt8189-power-controller.yaml
new file mode 100644
index 000000000000..1bf8f94858c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/mediatek,mt8189-power-controller.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/mediatek,mt8189-power-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Power Domains Controller for MT8189
+
+maintainers:
+  - Qiqi Wang <qiqi.wang@mediatek.com>
+
+description: |
+  MediaTek processors include support for multiple power domains which can be
+  powered up/down by software based on different application scenes to save power.
+
+  IP cores belonging to a power domain should contain a 'power-domains'
+  property that is a phandle for SCPSYS node representing the domain.
+
+properties:
+  $nodename:
+    pattern: '^power-controller(@[0-9a-f]+)?$'
+
+  compatible:
+    enum:
+      - mediatek,mt8189-scpsys
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    description: physical base address and size of the power-controller's register area.
+
+  infra-infracfg-ao-reg-bus:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the device containing the infracfg register range.
+
+  emicfg-ao-mem:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the device containing the emicfg register range.
+
+  vlpcfg-reg-bus:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the device containing the vlpcfg (very low power config) register range.
+
+  clocks:
+    description: |
+      A number of phandles to clocks that need to be enabled during domain
+      power-up sequencing.
+
+  clock-names:
+    description: |
+      List of names of clocks, in order to match the power-up sequencing
+      for each power domain we need to group the clocks by name. BASIC
+      clocks need to be enabled before enabling the corresponding power
+      domain, and should not have a '-' in their name (i.e mm, mfg, venc).
+      SUSBYS clocks need to be enabled before releasing the bus protection,
+      and should contain a '-' in their name (i.e mm-0, isp-0, cam-0).
+
+      In order to follow properly the power-up sequencing, the clocks must
+      be specified by order, adding first the BASIC clocks followed by the
+      SUSBSYS clocks.
+
+  domain-supply:
+    description: domain regulator supply.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8189-clk.h>
+    #include <dt-bindings/power/mt8189-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        scpsys: power-controller@1c001000 {
+            compatible = "mediatek,mt8189-scpsys";
+            reg = <0 0x1c001000 0 0x1000>;
+            #power-domain-cells = <1>;
+            infra-infracfg-ao-reg-bus = <&infracfg_ao_clk>;
+            emicfg-ao-mem = <&emicfg_ao_mem_clk>;
+            vlpcfg-reg-bus = <&vlpcfg_reg_bus_clk>;
+            clocks = /* MFG */
+                <&topckgen_clk CLK_TOP_MFG_REF_SEL>,
+                <&apmixedsys_clk CLK_APMIXED_MFGPLL>;
+            clock-names = "mfg", "mfg_top";
+            mfg0-supply = <&mt6359_vproc1_buck_reg>;
+            mfg1-supply = <&mt6359_vsram_proc1_ldo_reg>;
+        };
+    };
-- 
2.45.2



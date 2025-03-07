Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AE7C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 04:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qumIpB+kVpG6gvbiFFQaY5Jw4ejkYJF4eb7SNbkp7Us=; b=XeNoZTAFS/u1YPdKSp++FQV07b
	HCgdDwqer9jD9yATJM5o/ttV9nwaHoC3jYWRdx/Ap6zV/pilPjYM7sStJmayAxQDAUyeHw+zuAFvJ
	Njl6NKGLqYVGEmR4fqJRwoWXBhgw2Pl/4vsk7EUJEM7EjYnCLY8m6ChfM4HBNNNALRoDfprsDXrll
	R00DCteFU5BaOFY1xArqDoRQZ9HS/iUQnx6fsBTe4mARVTBFd/wi7dV2hxGq3CmWhFsS4kQCnWSfc
	7KKOrb8n7XkYxYScOGb3iNtKPs0AKpNBQIYKJeyy+ThHJIARj8gLALOC8xDh2haHIa4UKdgpb9z6d
	4qMMM4kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqPVK-0000000D8n8-2fAS;
	Fri, 07 Mar 2025 04:40:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOeA-0000000D282-2XFM;
	Fri, 07 Mar 2025 03:45:15 +0000
X-UUID: 915001acfb0611ef83f2a1c9db70dae0-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qumIpB+kVpG6gvbiFFQaY5Jw4ejkYJF4eb7SNbkp7Us=;
	b=bFCdijrc3wbdphgEXi99el15lx9gB7db5Wj3ZJU5QQCcbPAOyu2/NP5UCzGjkRi01xtTIG/olDznrTi8omspFnSprIexJATid2jP8qHYgoN9iP+5ElK+USF7ShGs5z0nxs/E4pH9D45uLIwehs2TBA3NZ/d4PCMPuTZh8e7eG88=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:5c22aff2-2670-4ac5-8318-9c426d15308b,IP:0,UR
	L:25,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:498e21ce-23b9-4c94-add0-e827a7999e28,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 915001acfb0611ef83f2a1c9db70dae0-20250306
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <guangjie.song@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1660964319; Thu, 06 Mar 2025 20:45:09 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 11:45:06 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 11:45:06 +0800
From: Guangjie Song <guangjie.song@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, Guangjie Song <guangjie.song@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 12/13] dt-bindings: power: mediatek: Add new MT8196 power domain
Date: Fri, 7 Mar 2025 11:44:36 +0800
Message-ID: <20250307034454.12243-13-guangjie.song@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307034454.12243-1-guangjie.song@mediatek.com>
References: <20250307034454.12243-1-guangjie.song@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_194514_644743_7183098B 
X-CRM114-Status: GOOD (  15.12  )
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

Add the binding documentation for power domain on MediaTek MT8196.

Signed-off-by: Guangjie Song <guangjie.song@mediatek.com>
---
 .../mediatek,mt8196-power-controller.yaml     | 74 +++++++++++++++++++
 include/dt-bindings/power/mt8196-power.h      | 57 ++++++++++++++
 2 files changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/mediatek,mt8196-power-controller.yaml
 create mode 100644 include/dt-bindings/power/mt8196-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,mt8196-power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,mt8196-power-controller.yaml
new file mode 100644
index 000000000000..6c2867b25967
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/mediatek,mt8196-power-controller.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/mediatek,mt8196-power-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8196 Power Domains Controller
+
+maintainers:
+  - Guangjie Song <guangjie.song@mediatek.com>
+
+description: |
+  Mediatek processors include support for multiple power domains which can be
+  powered up/down by software based on different application scenes to save power.
+
+properties:
+  $nodename:
+    pattern: '^power-controller(@[0-9a-f]+)?$'
+
+  compatible:
+    enum:
+      - mediatek,mt8196-scpsys
+      - mediatek,mt8196-hfrpsys
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    description: Address range of the power controller.
+
+  clocks:
+    description: |
+      A number of phandles to clocks that need to be enabled during domain
+      power-up sequencing.
+
+  clock-names:
+    description: |
+      List of names of clock.
+
+  domain-supply:
+    description: domain regulator supply.
+
+  spm:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the device containing the spm register range.
+
+  mmpc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the device containing the mmpc register range.
+
+  vote-regmap:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the device containing the vote register range.
+
+  mm-vote-regmap:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the device containing the mm-vote register range.
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/mt8196-power.h>
+
+    scpsys: power-controller@1c004000 {
+      compatible = "mediatek,mt8196-scpsys", "syscon";
+      reg = <0 0x1c004000 0 0x1000>;
+      #power-domain-cells = <1>;
+      spm = <&scpsys_bus>;
+      vote-regmap = <&vote>;
+    };
diff --git a/include/dt-bindings/power/mt8196-power.h b/include/dt-bindings/power/mt8196-power.h
new file mode 100644
index 000000000000..b0db89cc435d
--- /dev/null
+++ b/include/dt-bindings/power/mt8196-power.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ * Author: Chong-ming Wei <chong-ming.wei@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT8196_POWER_H
+#define _DT_BINDINGS_POWER_MT8196_POWER_H
+
+/* SPM */
+#define MT8196_POWER_DOMAIN_CONN			0
+#define MT8196_POWER_DOMAIN_SSUSB_P0			1
+#define MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0		2
+#define MT8196_POWER_DOMAIN_SSUSB_P1			3
+#define MT8196_POWER_DOMAIN_SSUSB_P23			4
+#define MT8196_POWER_DOMAIN_SSUSB_PHY_P2		5
+#define MT8196_POWER_DOMAIN_PEXTP_MAC0			6
+#define MT8196_POWER_DOMAIN_PEXTP_MAC1			7
+#define MT8196_POWER_DOMAIN_PEXTP_MAC2			8
+#define MT8196_POWER_DOMAIN_PEXTP_PHY0			9
+#define MT8196_POWER_DOMAIN_PEXTP_PHY1			10
+#define MT8196_POWER_DOMAIN_PEXTP_PHY2			11
+#define MT8196_POWER_DOMAIN_ADSP_AO			12
+#define MT8196_POWER_DOMAIN_ADSP_INFRA			13
+#define MT8196_POWER_DOMAIN_AUDIO			14
+#define MT8196_POWER_DOMAIN_ADSP_TOP_DORMANT		15
+#define MT8196_POWER_DOMAIN_MM_PROC_DORMANT		16
+#define MT8196_POWER_DOMAIN_SSR				17
+#define MT8196_SPM_POWER_DOMAIN_NR			18
+
+/* MMPC */
+#define MT8196_POWER_DOMAIN_MM_INFRA_AO			0
+#define MT8196_POWER_DOMAIN_MM_INFRA0			1
+#define MT8196_POWER_DOMAIN_MM_INFRA1			2
+#define MT8196_POWER_DOMAIN_VDE_VCORE0			3
+#define MT8196_POWER_DOMAIN_VDE0			4
+#define MT8196_POWER_DOMAIN_VDE1			5
+#define MT8196_POWER_DOMAIN_VEN0			6
+#define MT8196_POWER_DOMAIN_VEN1			7
+#define MT8196_POWER_DOMAIN_VEN2			8
+#define MT8196_POWER_DOMAIN_DISP_VCORE			9
+#define MT8196_POWER_DOMAIN_DIS0_DORMANT		10
+#define MT8196_POWER_DOMAIN_DIS1_DORMANT		11
+#define MT8196_POWER_DOMAIN_OVL0_DORMANT		12
+#define MT8196_POWER_DOMAIN_OVL1_DORMANT		13
+#define MT8196_POWER_DOMAIN_DISP_EDPTX_DORMANT		14
+#define MT8196_POWER_DOMAIN_DISP_DPTX_DORMANT		15
+#define MT8196_POWER_DOMAIN_MML0_SHUTDOWN		16
+#define MT8196_POWER_DOMAIN_MML1_SHUTDOWN		17
+#define MT8196_POWER_DOMAIN_CSI_BS_RX			18
+#define MT8196_POWER_DOMAIN_CSI_LS_RX			19
+#define MT8196_POWER_DOMAIN_DSI_PHY0			20
+#define MT8196_POWER_DOMAIN_DSI_PHY1			21
+#define MT8196_POWER_DOMAIN_DSI_PHY2			22
+#define MT8196_MMPC_POWER_DOMAIN_NR			23
+
+#endif /* _DT_BINDINGS_POWER_MT8196_POWER_H */
-- 
2.45.2



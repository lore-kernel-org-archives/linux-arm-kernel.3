Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF43D6E2CA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 06:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BgO5kZ0hbiXdUosl1gElWwRFfjYDoWRPAJtVB+IOdxo=; b=DEYzFexpgw48qGd+ZKcqHSH6/2
	rWU2hlPiupMtYPTRiNemEP84gFJtYV3ZfEd3Y92kTcpRpY7xCBan5I0cX7hOMzpGEaIAEDAj+ERQ4
	G+Xp+VdHS8SjZ3SbwwUycPIlWhBKpCH1mJPW2BjHcQV5k+xRTyyrSiLnkic/yl4FK+y6aLqVvP3yA
	mx5KhS09nLwavEImeFOn/dyrduZN+/MaSsKpq5SQlgrqXuFfZA73bmppSWvaDL9KIsmV7MYX98DAE
	xbBw7Y9qwLYnfXi8Fbptr4yA/IUEjvMCiGO6j48GnQ6HAz03mNDEvRhYAWIPXw/fdU/ynnfLlBD2N
	rwKNIDgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDeIy-0000000EVXh-2QFe;
	Wed, 20 Nov 2024 06:35:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDeHH-0000000EVBv-1Sf5;
	Wed, 20 Nov 2024 06:33:28 +0000
X-UUID: 56ad03b6a70911ef9048ed6ed365623b-20241119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BgO5kZ0hbiXdUosl1gElWwRFfjYDoWRPAJtVB+IOdxo=;
	b=WlyzBSxl+iHgySIy2NlNphsl14YMh3PO62uwgmnTOWIZ5q7Xa2U46mMnaZwN01JtxcWqRIpg+g+lRdNQl5FnWIbAZE0UiTG4DpOJqT255bsGwVYNiPzd+nPd5qlbwan1V3WAVie9alAoaaVdT7S0QBjcv6YOxfCp/Ga23UPK3KE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:82b60938-ac3e-4cdc-ac15-3ffae38d33c3,IP:0,U
	RL:25,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:464815b,CLOUDID:40ea47ce-1d09-4671-8b9c-efcc0e30e122,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:1,EDM:-3,IP
	:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 56ad03b6a70911ef9048ed6ed365623b-20241119
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2005331739; Tue, 19 Nov 2024 23:33:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Nov 2024 14:33:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Nov 2024 14:33:18 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Friday Yang
	<friday.yang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: reset: mediatek: Add mt8188 SMI reset control binding
Date: Wed, 20 Nov 2024 14:32:55 +0800
Message-ID: <20241120063305.8135-2-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241120063305.8135-1-friday.yang@mediatek.com>
References: <20241120063305.8135-1-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_223327_388984_D28228FD 
X-CRM114-Status: GOOD (  17.55  )
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

From: "Friday Yang" <friday.yang@mediatek.com>

To support SMI clamp and reset operation in genpd callback, add
SMI LARB reset controller in the bindings. Add index in
mt8188-resets.h to query the reset signal in the SMI reset
control driver.

Signed-off-by: Friday Yang <friday.yang@mediatek.com>
---
 .../bindings/reset/mediatek,smi-reset.yaml    | 53 +++++++++++++++++++
 include/dt-bindings/reset/mt8188-resets.h     | 11 ++++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/mediatek,smi-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/mediatek,smi-reset.yaml b/Documentation/devicetree/bindings/reset/mediatek,smi-reset.yaml
new file mode 100644
index 000000000000..77a6197a9846
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/mediatek,smi-reset.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2024 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/mediatek,smi-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SMI Reset Controller
+
+maintainers:
+  - Friday Yang <friday.yang@mediatek.com>
+
+description: |
+  This reset controller node is used to perform reset management
+  of SMI larbs on MediaTek platform. It is used to implement various
+  reset functions required when SMI larbs apply clamp operation.
+
+  For list of all valid reset indices see
+    <dt-bindings/reset/mt8188-resets.h> for MT8188.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8188-smi-reset
+
+  "#reset-cells":
+    const: 1
+    description:
+      The cell should be the device ID. SMI reset controller driver could
+      query the reset signal of each SMI larb by device ID.
+
+  mediatek,larb-rst:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle of each subsys clock controller. SMI larbs are located in
+      these subsys. SMI needs to parse the node of each subsys clock
+      controller to get the register address, and then apply the reset
+      operation.
+
+required:
+  - compatible
+  - "#reset-cells"
+  - mediatek,larb-rst
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller {
+        compatible = "mediatek,mt8188-smi-reset";
+        #reset-cells = <1>;
+        mediatek,larb-rst = <&imgsys1_dip_top>;
+    };
diff --git a/include/dt-bindings/reset/mt8188-resets.h b/include/dt-bindings/reset/mt8188-resets.h
index 5a58c54e7d20..387a4beac688 100644
--- a/include/dt-bindings/reset/mt8188-resets.h
+++ b/include/dt-bindings/reset/mt8188-resets.h
@@ -113,4 +113,15 @@
 #define MT8188_VDO1_RST_HDR_GFX_FE1_DL_ASYNC	52
 #define MT8188_VDO1_RST_HDR_VDO_BE_DL_ASYNC	53

+#define MT8188_SMI_RST_LARB10			0
+#define MT8188_SMI_RST_LARB11A			1
+#define MT8188_SMI_RST_LARB11C			2
+#define MT8188_SMI_RST_LARB12			3
+#define MT8188_SMI_RST_LARB11B			4
+#define MT8188_SMI_RST_LARB15			5
+#define MT8188_SMI_RST_LARB16B			6
+#define MT8188_SMI_RST_LARB17B			7
+#define MT8188_SMI_RST_LARB16A			8
+#define MT8188_SMI_RST_LARB17A			9
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8188 */
--
2.46.0



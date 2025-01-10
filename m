Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8757BE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 12:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTkw/bYI3FoWPDuynXYp3ubicrDehWsU7Vu3Mi1fiwg=; b=gJHOyO5Ob4ZMNMUMdKHoNpAmVL
	c63um9aNHveRW7pJA0//uipcDDSqTjxSSe/CmtphB9ydUwp6e5O9vy9ew8U0aK3n5XYNF/l311Txy
	H0yios3TnjSBqI5ebLLA0QV+AE4XU9Q707gfsMcXIjZb0cNIduDRvvc4bXh96lPFJpHWYjG/duA8L
	5/MOXeTGYjHjYvYcmCnoak0Upz4gQue1Xy5ZKYaBClxd0a5mZSzlixxrzPpeWD/4lOR+Jl/c5wPB3
	Inwlj3biw/GaA1nMWTn1A26hw+2wG6UmiufkEmscMcm3ro+Sr1uy2lAJf2PbROROsxuNMUx/k0tZe
	lD5//eFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEMY-0000000FKJt-0o8Q;
	Fri, 10 Jan 2025 12:43:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEHv-0000000FImT-1oFQ;
	Fri, 10 Jan 2025 12:38:57 +0000
X-UUID: d77b9bf6cf4f11ef82ff63e91e7eb18c-20250110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JTkw/bYI3FoWPDuynXYp3ubicrDehWsU7Vu3Mi1fiwg=;
	b=Uc40krZGJA62tbmeNl5oV/XBqqm79BaeIn6Bka8q5I1XHN8+QOx6lyWEokcIk9p4uVqQSkF1EMOT6bVEfjZz7JOsiWlAPz3Dx34Uonr2YI9b7DVkMWZJwjVqrh+bsv7zs6AeJDq17H66WIVam4QxemhnrZM69wVMHN3nTPWUszw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:d8cef6ac-3ef5-4171-97e3-e7743b01f2a9,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:60aa074,CLOUDID:2d3cb20e-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d77b9bf6cf4f11ef82ff63e91e7eb18c-20250110
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 348849134; Fri, 10 Jan 2025 05:38:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 20:38:46 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 20:38:46 +0800
From: paul-pl.chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
	<jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
	<singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
	<sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
	<sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 04/12] dt-bindings: display: mediatek: add BLENDER yaml for MT8196
Date: Fri, 10 Jan 2025 20:34:00 +0800
Message-ID: <20250110123835.2719824-6-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_043855_501030_E6C2CA68 
X-CRM114-Status: GOOD (  11.95  )
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

From: "Paul-pl.Chen" <paul-pl.chen@mediatek.com>

Add mediatek,blender.yaml to support BLENDER for MT8196.

Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
---
The header used in examples: 
#include <dt-bindings/clock/mt8196-clk.h>
is not upstreamed yet. 
It will be sent by related owner soon.
---
 .../display/mediatek/mediatek,blender.yaml    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,blender.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,blender.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,blender.yaml
new file mode 100644
index 000000000000..0bcc1a797f71
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,blender.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,blender.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Overlap Blender
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description:
+  MediaTek display overlap blender, namely OVL_BLENDER or BLENDER,
+  executes the alpha blending function for overlapping layers
+  from different sources. This is the primary function of the
+  overlapping system.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-blender
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Overlap Blender Clock
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8196-clk.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        disp_ovl0_blender0: blender@328d0000 {
+            compatible = "mediatek,mt8196-blender";
+            reg = <0 0x328d0000 0 0x1000>;
+            clocks = <&ovlsys_config_clk CLK_OVL_BLENDER0_DISP>;
+        };
+    };
-- 
2.34.1



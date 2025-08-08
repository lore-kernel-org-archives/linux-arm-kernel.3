Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4D3C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 13:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Moru1e+eo1W2qBlDQbPKQ/q9t+du5PgIZxCnNE2k8w0=; b=nR5Bu1cCYLmvPjRZ1V1m00OM7h
	ZdsPWBnmUOnhqrvLxaFyRh5OveUMopfvCtZgBW5HfpzLOmLFaEuO+p94x+C3Vrgtak0xwIgFqrvKs
	GofoKbrm8EFF7buBWGWbnIaKAbCvNdbZPc3CxbmgjGjqBdnr+ttRI0hfWKRDVw1zIC5KpAnALzUrU
	fNQvTQu5A+vpMAPG3coZ/36yCaFeB3cqm0ERq03wOhzfWu4m19FqolrJVe3iv6V1vbbmxkBA6CTuO
	27n4lr6v+SclnTm7Z8h/Seo75ElJ9e/o3tzOh9aYQPnQhvg4ihtkXhvQ1dH8H3sWbN5CFAyIq2xsJ
	klZ9dmfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMpp-00000002sfe-0VeD;
	Fri, 08 Aug 2025 13:08:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMep-00000002rIO-3Zh0;
	Fri, 08 Aug 2025 12:57:17 +0000
X-UUID: 33dbc482745711f09eb0dd999d3936bf-20250808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Moru1e+eo1W2qBlDQbPKQ/q9t+du5PgIZxCnNE2k8w0=;
	b=aLqWIi5BJetZMhOUZQN55u4VvgtZ4TgjlDB7OsG2OMhaJAXmxJQJvOrFse1cDCQQfrtt2HIlM5hF+yvuxbgHA1HD9wbrRDnoEMnwIhVRaffU4z+7O4ltvgA2/hjTr0ALBJllU8NscaNk42/b/szZRrkm7vfcnOTmsf+3LRiJMYM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:c90ce67c-4087-49ec-b2ac-c08800c730dd,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:f1326cf,CLOUDID:b11d3ca1-1800-4e4f-b665-a3d622db32cf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:11|97|99|83|106|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 33dbc482745711f09eb0dd999d3936bf-20250808
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <jay.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 342244945; Fri, 08 Aug 2025 05:57:12 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 8 Aug 2025 20:57:07 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 8 Aug 2025 20:57:07 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Jay Liu <jay.liu@mediatek.com>
Subject: [PATCH v3 4/6] dt-bindings: display: mediatek: disp-tdshp: Add support for MT8196
Date: Fri, 8 Aug 2025 20:53:59 +0800
Message-ID: <20250808125512.9788-5-jay.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250808125512.9788-1-jay.liu@mediatek.com>
References: <20250808125512.9788-1-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_055715_901701_6E827BBC 
X-CRM114-Status: GOOD (  14.25  )
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

Add disp-tdshp hardware description for MediaTek MT8196 SoC

Signed-off-by: Jay Liu <jay.liu@mediatek.com>
---
 .../display/mediatek/mediatek,disp-tdshp.yaml | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp-tdshp.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp-tdshp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp-tdshp.yaml
new file mode 100644
index 000000000000..94aa33a2a5ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp-tdshp.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,disp-tdshp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek display 2D sharpness processor
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  MediaTek display 2D sharpness processor, namely TDSHP, provides a
+  operation used to adjust sharpness in display system.
+  TDSHP device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+  for details.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8196-disp-tdshp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
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
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      disp-tdshp@321e0000 {
+          compatible = "mediatek,mt8196-disp-tdshp";
+          reg = <0 0x321e0000 0 0x1000>;
+          clocks = <&dispsys_config_clk 107>;
+      };
+    };
-- 
2.46.0



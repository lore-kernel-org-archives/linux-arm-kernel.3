Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267C6F433D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 03:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCLd1lZvH8brKu2Kcl503V3/+5qyEGb5W2m9w1XK3dk=; b=KlqTDxiHqfasZzvIv5hrMQ7F7t
	J9i7cAseDHgLH/0PG5E504wU9sjy4tM0JpgxSrVAOFNorG0YkeFVOLSdeTyo38vFMBEpKobaSvTkY
	bk6kQAjzS+HxIonhfguLgq2dCU753Ag2/54xcD95ECBaU0Voh08rmBOjT+6Hea8ygjo/yr9pMv1mC
	aojy1CH5lQc+6JcIsEqCW7cQZduo+AiIHiyh+rqganBtiZvvYkxT5kmIYC0VYiIMEJXuBLWIjbSUg
	yMMNTkNrYQSEWZrACJIpfU1PoEV5yD1YNYlAKOkqznQJZJhMx4OGQiBcoJVNSeNUY4VCNgQEthaHj
	vo0eAUrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDDAK-00000001uO4-2sAH;
	Thu, 16 Apr 2026 03:13:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDDAA-00000001uHV-2FxW;
	Thu, 16 Apr 2026 03:13:10 +0000
X-UUID: 2de13af2394211f1a6de359d7043e138-20260415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=DCLd1lZvH8brKu2Kcl503V3/+5qyEGb5W2m9w1XK3dk=;
	b=Ug3WBcCRdqEDBGiF072iHxP5pJpA/z60kcfxqcg9md+gjEQuJJh87hJDb3YiFpjVbejSbXqZQsmLyiROPVxiW31BdlAAKaNtR4+oOfbFTbdHj5kAtGOflDq/LjFXKVc+MRTCCqksv1p+gGddCtj7atPuTz+GmJh2PSSEy7B9wpg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:c1637fb6-f782-4d3b-9e30-9ed9f2b6a27a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:70b2ead5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2de13af2394211f1a6de359d7043e138-20260415
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2127125078; Wed, 15 Apr 2026 20:13:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 16 Apr 2026 11:12:59 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 16 Apr 2026 11:12:59 +0800
From: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiaoshun Xu
	<xiaoshun.xu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Sirius Wang <sirius.wang@mediatek.com>, Vince-wl Liu
	<vince-wl.liu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 4/6] dt-bindings: soc: mediatek: devapc: Add bindings for MT8189
Date: Thu, 16 Apr 2026 11:12:07 +0800
Message-ID: <20260416031231.2932493-5-xiaoshun.xu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260416031231.2932493-1-xiaoshun.xu@mediatek.com>
References: <20260416031231.2932493-1-xiaoshun.xu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_201306_579834_E3A1A1B8 
X-CRM114-Status: GOOD (  11.77  )
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

Extend the devapc device tree bindings to support the MediaTek MT8189
SoC. This includes:

- Adding "mediatek,mt8189-devapc" to the list of compatible strings.
- Introducing the "vio-idx-num" property to specify the number of bus
  slaves managed by devapc.

These changes enable proper configuration and integration of devapc on
MT8189 platforms, ensuring accurate device matching and resource
allocation in the device tree.

Signed-off-by: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/devapc.yaml       | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
index 99e2caafeadf..06a096440331 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
@@ -14,13 +14,14 @@ description: |
   analysis and countermeasures.
 
 maintainers:
-  - Neal Liu <neal.liu@mediatek.com>
+  - Xiaoshun Xu <xiaoshun.xu@mediatek.com>
 
 properties:
   compatible:
     enum:
       - mediatek,mt6779-devapc
       - mediatek,mt8186-devapc
+      - mediatek,mt8189-devapc
 
   reg:
     description: The base address of devapc register bank
@@ -30,6 +31,10 @@ properties:
     description: A single interrupt specifier
     maxItems: 1
 
+  vio-idx-num:
+    description: Describe the number of bus slaves controlled by devapc
+    $ref: /schemas/types.yaml#/definitions/uint32
+
   clocks:
     description: Contains module clock source and clock names
     maxItems: 1
@@ -42,8 +47,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - clocks
-  - clock-names
 
 additionalProperties: false
 
@@ -55,6 +58,7 @@ examples:
     devapc: devapc@10207000 {
       compatible = "mediatek,mt6779-devapc";
       reg = <0x10207000 0x1000>;
+      vio-idx-num = <132>;
       interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
       clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
       clock-names = "devapc-infra-clock";
-- 
2.45.2



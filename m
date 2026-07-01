Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10309C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUSywuDRaCDCBdnXG6e3JMQVOGTumUoDh9IX47GqlJQ=; b=DqW16wYRR1omyYmW3tjKe+43gX
	vulHTZ71BYSXmj1vxLLehk6/DrWIAoxyiTPkqsuNdlZs4kNMCuBwzm3OcMUcvd41dwa+QwL/Tqf4f
	0xtwgcszyHdEN0w/uCVo3AdPvwyoSjax4Qu3iwi9pv/PZlCp8Eralsc9lz5/u1yHlNJBohBWRshNV
	2mPJs+b5OtJOPLYe/9CJqDk+X+EEK0MguaZ1AUmsG1KZiEEiCaST9LhPS/P3bhb0YIMKTxrEA765p
	z+haSJ9skQc80one2yP/ztJAbz3rGIvtvKXmRq81KowLrKLAYlXZgb5T5HHIa3c/y1HST6qzXuVBE
	EbWgz2Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepel-00000000wMe-37dP;
	Wed, 01 Jul 2026 07:46:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepei-00000000wLQ-3lwL;
	Wed, 01 Jul 2026 07:46:50 +0000
X-UUID: 018f6242752111f1afed4741b24580c9-20260701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rUSywuDRaCDCBdnXG6e3JMQVOGTumUoDh9IX47GqlJQ=;
	b=kVLDivaqx38rt7+Ao5FD6yL9JD7Kd2NuhADj37c7qkfunLf55huM36TZeMTxmG2Th+C+3Ths1GzF6EyHxXoZszZRNMG57jWLGw1njZbHObMX7ISmJqdZ4uTXR9ftLBgvixueu5Ul7cQBdwUVjT1O/mUgxeFGpz6vM4W6XscmHHQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:4e085de9-36a9-47c4-9c44-df33780150f6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:89682a04-3795-4a90-800e-68e9393a343e,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99|100|102|158,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC
	:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 018f6242752111f1afed4741b24580c9-20260701
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <congcong.yao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 641300892; Wed, 01 Jul 2026 00:46:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 1 Jul 2026 15:46:41 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 1 Jul 2026 15:46:40 +0800
From: Congcong Yao <Congcong.Yao@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jarried.lin@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<justin.yeh@mediatek.com>, Zhengnan Chen <zhengnan.chen@mediatek.com>,
	Congcong Yao <congcong.yao@mediatek.com>
Subject: [PATCH v3 1/2] dt-bindings: memory-controllers: mtk-smi: Add support for mt8189
Date: Wed, 1 Jul 2026 15:44:46 +0800
Message-ID: <20260701074533.175803-2-Congcong.Yao@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701074533.175803-1-Congcong.Yao@mediatek.com>
References: <20260701074533.175803-1-Congcong.Yao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_004648_940979_E8AE6883 
X-CRM114-Status: GOOD (  11.72  )
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

From: Zhengnan Chen <zhengnan.chen@mediatek.com>

Add smi larb, common and sub-commom binding description for mt8189.

About what smi-sub-common is, please check the below diagram,
we add it in mediatek,smi-common.yaml file.

Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>
Signed-off-by: Congcong Yao <congcong.yao@mediatek.com>
---
 .../mediatek,smi-common.yaml                   | 18 ++++++++++++++++++
 .../memory-controllers/mediatek,smi-larb.yaml  |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 0762e0ff66ef..4e1deeff92b1 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -25,6 +25,21 @@ description: |
   SMI generation 1 to transform the smi clock into emi clock domain, but that is
   not needed for SMI generation 2.
 
+  The smi-common connects with smi-larb and IOMMU. The maximum inputs number of
+  a smi-common is 8. In SMI generation 2, the engines number may be over 8.
+  In this case, we use a smi-sub-common to merge some larbs.
+  The block diagram something is like:
+
+                          IOMMU
+                           | |
+                       smi-common
+              ---------------------------
+               |          |           ...
+              larb0   sub-common      ...  <-max number is 8
+                   ----------------
+                    |     |    ...
+                  larb1 larbX  ...  <-max number is 8
+
 properties:
   compatible:
     oneOf:
@@ -40,6 +55,8 @@ properties:
           - mediatek,mt8186-smi-common
           - mediatek,mt8188-smi-common-vdo
           - mediatek,mt8188-smi-common-vpp
+          - mediatek,mt8189-smi-common
+          - mediatek,mt8189-smi-sub-common
           - mediatek,mt8192-smi-common
           - mediatek,mt8195-smi-common-vdo
           - mediatek,mt8195-smi-common-vpp
@@ -108,6 +125,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - mediatek,mt8189-smi-sub-common
               - mediatek,mt8195-smi-sub-common
     then:
       required:
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index 2e7fac4b5094..9a5dafd7c07e 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8183-smi-larb
           - mediatek,mt8186-smi-larb
           - mediatek,mt8188-smi-larb
+          - mediatek,mt8189-smi-larb
           - mediatek,mt8192-smi-larb
           - mediatek,mt8195-smi-larb
 
@@ -85,6 +86,7 @@ allOf:
             - mediatek,mt8183-smi-larb
             - mediatek,mt8186-smi-larb
             - mediatek,mt8188-smi-larb
+            - mediatek,mt8189-smi-larb
             - mediatek,mt8195-smi-larb
 
     then:
@@ -119,6 +121,7 @@ allOf:
               - mediatek,mt6779-smi-larb
               - mediatek,mt8186-smi-larb
               - mediatek,mt8188-smi-larb
+              - mediatek,mt8189-smi-larb
               - mediatek,mt8192-smi-larb
               - mediatek,mt8195-smi-larb
 
-- 
2.43.0



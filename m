Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAEBCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 08:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5nhs8f76uTLi4ENhABCQq8DqpMRjQ9Nqtk3enz1yAM=; b=ypEqXzDDU173cF9d/oJwfZMZ3G
	Yp8Zmsm2Oz8YEs6qNHWgiDKOBynWb3eqSJNFW+W7It7A1XQdHynMV5hDn5DHetSnNi8zZ7k0+3Ci9
	kNyuX3iLdc1tdtJU2wkcz6pYJgPpAlHBm+GpdYCY5V6uF5CnZ2zzQR+bBdtQXly/NtMW/DJDo2pMh
	sbZjV2uUN8NXVxTP7KGlRKx1+8AkIoD6C+L++fx+w3rw1VUteqoBQGDHz7dAwxrwbukUokF8MQ8NT
	ITmWInUHSIskMm6rPLZ2ZrCW2nkehGXAmzmyHg1B0nehT33pgIvcqTU6MS4uRb03M4jOiQLEiBUqN
	1umaq94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWDf-00000002Cnq-2Hko;
	Fri, 19 Sep 2025 08:11:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWDc-00000002Cn5-3S61;
	Fri, 19 Sep 2025 08:11:49 +0000
X-UUID: 496dd7dc953011f09f706fa2197c6ceb-20250919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=z5nhs8f76uTLi4ENhABCQq8DqpMRjQ9Nqtk3enz1yAM=;
	b=K693mzBxNVkusFKflbhHe/FPjwK55cghgxviwMNGK2cmWbR2abnxmURfpXP4w6yrdu96kKSxBSoA5vOQbQN8UGlENtSoqqO0v55aOTRa3hjVQiVRVmkz0X5v9vUtZ4bMUf/IOufiC0xUIw7TnJlsDQxLI3chJO+x8VuUTpKBxlY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:3e7b34ad-2dce-48f2-971a-89c6e82076f5,IP:0,UR
	L:0,TC:0,Content:44,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:44
X-CID-META: VersionHash:1ca6b93,CLOUDID:16e22191-68e1-4022-b848-86f5c49a6751,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	3|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 496dd7dc953011f09f706fa2197c6ceb-20250919
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <zhengnan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 409807247; Fri, 19 Sep 2025 01:11:47 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 19 Sep 2025 16:11:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 19 Sep 2025 16:11:13 +0800
From: Zhengnan Chen <zhengnan.chen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, zhengnan.chen
	<zhengnan.chen@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: memory-controllers: mtk-smi: Add support for mt8189
Date: Fri, 19 Sep 2025 16:09:55 +0800
Message-ID: <20250919081014.14100-2-zhengnan.chen@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250919081014.14100-1-zhengnan.chen@mediatek.com>
References: <20250919081014.14100-1-zhengnan.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_011148_866136_4866CE67 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

From: "zhengnan.chen" <zhengnan.chen@mediatek.com>

Add binding description for mt8189.

Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>
---
 .../bindings/memory-controllers/mediatek,smi-common.yaml       | 2 ++
 .../bindings/memory-controllers/mediatek,smi-larb.yaml         | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 0762e0ff66ef..aac8368b210c 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -40,6 +40,8 @@ properties:
           - mediatek,mt8186-smi-common
           - mediatek,mt8188-smi-common-vdo
           - mediatek,mt8188-smi-common-vpp
+          - mediatek,mt8189-smi-common
+          - mediatek,mt8189-smi-sub-common
           - mediatek,mt8192-smi-common
           - mediatek,mt8195-smi-common-vdo
           - mediatek,mt8195-smi-common-vpp
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
2.46.0


